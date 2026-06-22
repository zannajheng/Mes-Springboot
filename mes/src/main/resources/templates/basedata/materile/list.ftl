<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>物料维护</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <#include "${request.contextPath}/common/common.ftl">
</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <div class="layui-card">
            <div class="layui-card-header">
                <h3 class="layui-card-title">物料维护</h3>
            </div>
            <div class="layui-card-body">
                <form id="js-search-form" class="layui-form" lay-filter="js-q-form-filter">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">物料编码</label>
                            <div class="layui-input-inline">
                                <input type="text" name="materielLike" placeholder="请输入物料编码" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">物料名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="materielDescLike" placeholder="请输入物料名称" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">物料类型</label>
                            <div class="layui-input-inline">
                                <select name="matType" lay-filter="matType-filter">
                                    <option value="">全部</option>
                                    <option value="FG">产品</option>
                                    <option value="PG">半成品</option>
                                    <option value="PART">零件</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">物料来源</label>
                            <div class="layui-input-inline">
                                <select name="materielSource" lay-filter="materielSource-filter">
                                    <option value="">全部</option>
                                    <option value="自制">自制</option>
                                    <option value="外购">外购</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">状态</label>
                            <div class="layui-input-inline">
                                <select name="deleted" lay-filter="deleted-filter">
                                    <option value="">全部</option>
                                    <option value="0">正常</option>
                                    <option value="2">禁用</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <button class="layui-btn" lay-submit lay-filter="js-search-filter"><i class="layui-icon layui-icon-search"></i>查询</button>
                            <button type="button" class="layui-btn layui-btn-primary" id="js-reset-btn"><i class="layui-icon layui-icon-refresh"></i>重置</button>
                        </div>
                    </div>
                </form>

                <table class="layui-hide" id="js-record-table" lay-filter="js-record-table-filter"></table>
            </div>
        </div>
    </div>
</div>

<script type="text/html" id="js-record-table-toolbar-top">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="deleteBatch"><i class="layui-icon">&#xe640;</i>批量删除</button>
        <button class="layui-btn layui-btn-sm" lay-event="add"><i class="layui-icon">&#xe61f;</i>新增</button>
    </div>
</script>

<script type="text/html" id="js-record-table-toolbar-right">
    <a class="layui-btn layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete"><i class="layui-icon layui-icon-delete"></i>删除</a>
</script>

<script type="text/html" id="matTypeTpl">
    {{# if(d.matType == 'FG') { }}
    <span class="layui-badge layui-bg-blue">产品</span>
    {{# } else if(d.matType == 'PG') { }}
    <span class="layui-badge layui-bg-orange">半成品</span>
    {{# } else if(d.matType == 'PART') { }}
    <span class="layui-badge layui-bg-green">零件</span>
    {{# } else { }}
    {{ d.matType }}
    {{# } }}
</script>

<script type="text/html" id="materielSourceTpl">
    {{# if(d.materielSource == '自制') { }}
    <span class="layui-badge layui-bg-green">自制</span>
    {{# } else if(d.materielSource == '外购') { }}
    <span class="layui-badge layui-bg-blue">外购</span>
    {{# } else { }}
    {{ d.materielSource || '-' }}
    {{# } }}
</script>

<script type="text/html" id="statusTpl">
    {{# if(d.deleted == '0') { }}
    <span class="layui-badge layui-bg-green">正常</span>
    {{# } else if(d.deleted == '2') { }}
    <span class="layui-badge layui-bg-red">禁用</span>
    {{# } else { }}
    {{ d.deleted }}
    {{# } }}
</script>

<script>
    layui.use(['form', 'table', 'spLayer', 'spTable'], function () {
        var form = layui.form,
            table = layui.table,
            spLayer = layui.spLayer,
            spTable = layui.spTable;

        var tableIns = spTable.render({
            url: '${request.contextPath}/basedata/materile/page',
            cols: [
                [{
                    type: 'checkbox', width: 50
                }, {
                    field: 'materiel', title: '编码', width: 90
                }, {
                    field: 'materielDesc', title: '名称', width: 100
                }, {
                    field: 'matType', title: '类型', width: 70, templet: '#matTypeTpl'
                }, {
                    field: 'unit', title: '单位', width: 70
                }, {
                    field: 'model', title: '规格', width: 90
                }, {
                    field: 'material', title: '材质', width: 70
                }, {
                    field: 'demandLeadTime', title: '提前期', width: 80
                }, {
                    field: 'safetyStock', title: '安全库存', width: 80
                }, {
                    field: 'materielSource', title: '来源', width: 70, templet: '#materielSourceTpl'
                }, {
                    field: 'deleted', title: '状态', width: 70, templet: '#statusTpl'
                }, {
                    field: 'updateTime', title: '更新时间', width: 130
                }, {
                    field: 'remark', title: '备注', width: 80
                }, {
                    fixed: 'right',
                    field: 'operate',
                    title: '操作',
                    toolbar: '#js-record-table-toolbar-right',
                    unresize: true,
                    width: 200
                }]
            ],
            done: function (res, curr, count) {
            }
        });

        $(function () {
            form.render();
        });

        form.on('submit(js-search-filter)', function (data) {
            tableIns.reload({
                where: data.field,
                page: {
                    curr: 1
                }
            });
            return false;
        });

        $('#js-reset-btn').click(function () {
            $('#js-search-form')[0].reset();
            form.render();
            tableIns.reload({
                where: {},
                page: {
                    curr: 1
                }
            });
        });

        table.on('toolbar(js-record-table-filter)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);

            if (obj.event === 'deleteBatch') {
                var checkStatus = table.checkStatus('js-record-table'),
                    data = checkStatus.data;
                if (data.length > 0) {
                    layer.confirm('确认要删除吗？', function (index) {
                        var ids = [];
                        for (var i = 0; i < data.length; i++) {
                            ids.push(data[i].id);
                        }
                        spUtil.ajax({
                            url: '${request.contextPath}/basedata/materile/delete-batch',
                            type: 'POST',
                            data: {ids: ids.join(',')},
                            success: function () {
                                layer.close(index);
                                layer.msg('删除成功', {icon: 1});
                                table.reload('js-record-table');
                            }
                        });
                    });
                } else {
                    layer.msg("请先选择需要删除的数据！");
                }
            }

            if (obj.event === 'add') {
                var index = spLayer.open({
                    title: '新增物料',
                    area: ['90%', '90%'],
                    content: '${request.contextPath}/basedata/materile/add-or-update-ui'
                });
            }
        });

        table.on('tool(js-record-table-filter)', function (obj) {
            var data = obj.data;

            if (obj.event === 'edit') {
                spLayer.open({
                    title: '编辑物料',
                    area: ['90%', '90%'],
                    spWhere: {id: data.id},
                    content: '${request.contextPath}/basedata/materile/add-or-update-ui'
                });
            }

            if (obj.event === 'delete') {
                layer.confirm('确认要删除吗？', function (index) {
                    spUtil.ajax({
                        url: '${request.contextPath}/basedata/materile/delete',
                        async: false,
                        type: 'POST',
                        showLoading: true,
                        serializable: false,
                        data: {
                            id: data.id
                        },
                        success: function (data) {
                            tableIns.reload();
                            layer.close(index);
                        },
                        error: function () {
                        }
                    });
                });
            }
        });
    });
</script>
</body>
</html>