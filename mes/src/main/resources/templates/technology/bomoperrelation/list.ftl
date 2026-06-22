<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>工艺流程管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <#include "${request.contextPath}/common/common.ftl">
</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <!--查询参数-->
        <form id="js-search-form" class="layui-form" lay-filter="js-q-form-filter">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">选择产品</label>
                    <div class="layui-input-inline">
                        <select id="js-bom-select" name="bomId" lay-filter="js-bom-select" lay-search>
                            <option value="">请选择产品BOM</option>
                            <#list bomList as bom>
                                <option value="${bom.id}">${bom.materielDesc} (${bom.bomCode})</option>
                            </#list>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <a class="layui-btn" id="js-init-btn"><i class="layui-icon">&#xe654;</i>初始化工艺关系</a>
                </div>
            </div>
        </form>

        <!--表格-->
        <table class="layui-hide" id="js-record-table" lay-filter="js-record-table-filter"></table>
    </div>
</div>

<!--表格头操作模板-->
<script type="text/html" id="js-record-table-toolbar-top">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="lock"><i class="layui-icon">&#xe610;</i>锁定产品工艺</button>
        <button class="layui-btn layui-btn-sm layui-btn-warm" lay-event="unlock"><i class="layui-icon">&#xe60e;</i>解锁产品工艺</button>
        <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="deleteAll"><i class="layui-icon">&#xe640;</i>删除全部关系</button>
    </div>
</script>

<!--行操作模板-->
<script type="text/html" id="js-record-table-toolbar-right">
    <a class="layui-btn layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete"><i class="layui-icon layui-icon-delete"></i>删除</a>
</script>

<!--js逻辑-->
<script>
    layui.use(['form', 'table', 'spLayer', 'spTable', 'spLayui'], function () {
        var form = layui.form,
            table = layui.table,
            spLayer = layui.spLayer,
            spLayui = layui.spLayui,
            spTable = layui.spTable;

        var currentBomId = '';
        // 表格及数据初始化（初始不请求数据，选择BOM后再加载）
        var tableIns = spTable.render({
            url: false,
            data: [],
            cols: [[
                {type: 'checkbox'},
                {field: 'nodeName', title: '节点名称', width: 200},
                {field: 'nodeLevel', title: '节点层级', width: 100},
                {field: 'oper', title: '工序编号', width: 150},
                {field: 'operDesc', title: '工序名称', minWidth: 150},
                {field: 'workCenterDesc', title: '加工单元', width: 150},
                {field: 'operTime', title: '工序工时(h)', width: 120},
                {field: 'produceCycle', title: '制造周期(h)', width: 120},
                {field: 'sortNum', title: '排序号', width: 80},
                {field: 'isLocked', title: '状态', width: 100, templet: function (d) {
                    if (d.isLocked === '1') {
                        return '<span class="layui-badge layui-bg-red">已锁定</span>';
                    }
                    return '<span class="layui-badge layui-bg-green">未锁定</span>';
                }},
                {fixed: 'right', field: 'operate', title: '操作', toolbar: '#js-record-table-toolbar-right', unresize: true, width: 150}
            ]],
            done: function (res, curr, count) {
                form.render();
            }
        });
        // 暴露给子iframe，用于编辑保存后刷新表格
        window._bomTableIns = tableIns;
        // 提供可靠的表单刷新方法给子iframe调用
        window._reloadBomTable = function () {
            if (currentBomId) {
                tableIns.reload({
                    url: '${request.contextPath}/technology/bom-oper-relation/list-by-bom?bomId=' + currentBomId,
                    page: {curr: 1}
                });
            } else {
                tableIns.reload({
                    url: false,
                    data: []
                });
            }
        };

        $(function () {
            form.render();
        });

        // BOM选择事件
        form.on('select(js-bom-select)', function (data) {
            currentBomId = data.value;
            if (currentBomId) {
                tableIns.reload({
                    url: '${request.contextPath}/technology/bom-oper-relation/list-by-bom?bomId=' + currentBomId,
                    page: {curr: 1}
                });
            } else {
                tableIns.reload({
                    url: false,
                    data: [],
                    page: {curr: 1}
                });
            }
        });

        // 初始化工艺关系
        $('#js-init-btn').click(function () {
            if (!currentBomId) {
                layer.msg('请先选择产品BOM');
                return;
            }
            layer.confirm('确认要初始化工艺关系吗？将根据BOM子项创建默认关系。', function (index) {
                spUtil.ajax({
                    url: '${request.contextPath}/technology/bom-oper-relation/init?bomId=' + currentBomId,
                    type: 'POST',
                    showLoading: true,
                    success: function (data) {
                        tableIns.reload({
                            url: '${request.contextPath}/technology/bom-oper-relation/list-by-bom?bomId=' + currentBomId
                        });
                        layer.close(index);
                    }
                });
            });
        });

        // 头工具栏事件
        table.on('toolbar(js-record-table-filter)', function (obj) {
            if (obj.event === 'lock') {
                if (!currentBomId) {
                    layer.msg('请先选择产品BOM');
                    return;
                }
                var checkStatus = table.checkStatus('js-record-table');
                if (checkStatus.data.length === 0) {
                    layer.msg('请先勾选要锁定的节点');
                    return;
                }
                var ids = checkStatus.data.map(function (item) {
                    return item.id;
                }).join(',');
                layer.confirm('确认要锁定选中的节点吗？锁定后将无法再对工艺路线进行编辑修改。', function (index) {
                    spUtil.ajax({
                        url: '${request.contextPath}/technology/bom-oper-relation/lock?bomId=' + currentBomId,
                        type: 'POST',
                        data: {ids: ids},
                        showLoading: true,
                        success: function (data) {
                            tableIns.reload({
                                url: '${request.contextPath}/technology/bom-oper-relation/list-by-bom?bomId=' + currentBomId
                            });
                            layer.close(index);
                        }
                    });
                });
            }
            if (obj.event === 'unlock') {
                if (!currentBomId) {
                    layer.msg('请先选择产品BOM');
                    return;
                }
                var checkStatus = table.checkStatus('js-record-table');
                if (checkStatus.data.length === 0) {
                    layer.msg('请先勾选要解锁的节点');
                    return;
                }
                var ids = checkStatus.data.map(function (item) {
                    return item.id;
                }).join(',');
                layer.confirm('确认要解锁选中的节点吗？', function (index) {
                    spUtil.ajax({
                        url: '${request.contextPath}/technology/bom-oper-relation/unlock?bomId=' + currentBomId,
                        type: 'POST',
                        data: {ids: ids},
                        showLoading: true,
                        success: function (data) {
                            tableIns.reload({
                                url: '${request.contextPath}/technology/bom-oper-relation/list-by-bom?bomId=' + currentBomId
                            });
                            layer.close(index);
                        }
                    });
                });
            }
            if (obj.event === 'deleteAll') {
                if (!currentBomId) {
                    layer.msg('请先选择产品BOM');
                    return;
                }
                layer.confirm('确认要删除全部工艺关系吗？', function (index) {
                    spUtil.ajax({
                        url: '${request.contextPath}/technology/bom-oper-relation/delete-by-bom?bomId=' + currentBomId,
                        type: 'POST',
                        showLoading: true,
                        success: function (data) {
                            tableIns.reload({
                                url: false,
                                data: []
                            });
                            layer.close(index);
                        }
                    });
                });
            }
        });

        // 监听行工具事件
        table.on('tool(js-record-table-filter)', function (obj) {
            var data = obj.data;

            if (obj.event === 'edit') {
                spLayer.open({
                    title: '编辑工序配置',
                    area: ['600px', '540px'],
                    btn: [],
                    spWhere: {id: data.id},
                    content: '${request.contextPath}/technology/bom-oper-relation/add-or-update-ui'
                });
            }

            if (obj.event === 'delete') {
                layer.confirm('确认要删除该工艺关系吗？', function (index) {
                    spUtil.ajax({
                        url: '${request.contextPath}/technology/bom-oper-relation/delete',
                        type: 'POST',
                        showLoading: true,
                        data: {id: data.id},
                        success: function (res) {
                            tableIns.reload({
                                url: currentBomId ? '${request.contextPath}/technology/bom-oper-relation/list-by-bom?bomId=' + currentBomId : ''
                            });
                            layer.close(index);
                        }
                    });
                });
            }
        });
    });
</script>
</body>
</html>
