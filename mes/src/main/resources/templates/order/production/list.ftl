<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>工单下达</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <#include "${request.contextPath}/common/common.ftl">
    <link rel="stylesheet" href="${request.contextPath}/lib/gantt/css/style.css" media="all">
    <style>
        html, body {
            margin: 0;
            padding: 0;
            overflow: auto;
        }
        .gantt-section .layui-card-body {
            overflow-y: auto;
        }
        .table-section .layui-card-body {
            padding: 0;
        }
    </style>
</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <!-- 甘特图卡片 -->
        <div class="gantt-section">
            <div class="layui-card">
                <div class="layui-card-header">
                    <h3 class="layui-card-title">甘特图</h3>
                </div>
                <div class="layui-card-body">
                    <div id="js-gantt" class="gantt"></div>
                </div>
            </div>
        </div>

        <!-- 工单列表卡片 -->
        <div class="table-section">
            <div class="layui-card">
                <div class="layui-card-header">
                    <h3 class="layui-card-title">工单列表</h3>
                </div>
                <div class="layui-card-body">
                    <!--查询参数-->
                    <form id="js-search-form" class="layui-form" lay-filter="js-q-form-filter">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">订单编号</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="orderCodeLike" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">订单名称</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="orderDescriptionLike" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <a class="layui-btn" lay-submit lay-filter="js-search-filter"><i class="layui-icon layui-icon-search layuiadmin-button-btn"></i></a>
                            </div>
                            <div class="layui-inline">
                                <a class="layui-btn layui-btn-primary" id="js-reset-btn">重置</a>
                            </div>
                        </div>
                    </form>

                    <!--表格-->
                    <table class="layui-hide" id="js-record-table" lay-filter="js-record-table-filter"></table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 行操作按钮模板 -->
<script type="text/html" id="js-row-action-tpl">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a>
</script>

<!-- 状态模板 -->
<script type="text/html" id="js-statue-tpl">
    {{# if(d.statue == 1){ }}
    <span class="layui-badge layui-bg-blue">创建</span>
    {{# } else if(d.statue == 2){ }}
    <span class="layui-badge layui-bg-orange">进行中</span>
    {{# } else if(d.statue == 3){ }}
    <span class="layui-badge layui-bg-green">订单结束</span>
    {{# } else if(d.statue == 4){ }}
    <span class="layui-badge">订单终结</span>
    {{# } else { }}
    <span class="layui-badge layui-bg-gray">{{ d.statue || '-' }}</span>
    {{# } }}
</script>

<!-- 工具栏模板 -->
<script type="text/html" id="js-record-table-toolbar-top">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="add"><i class="layui-icon">&#xe608;</i>新建生产订单</button>
    </div>
</script>

<!--js逻辑-->
<script src="${request.contextPath}/lib/gantt/js/jquery.fn.gantt.js" charset="utf-8"></script>

<script>
    layui.use(['form', 'table', 'spLayer', 'spTable'], function () {
        var form = layui.form,
            table = layui.table,
            spLayer = layui.spLayer,
            spTable = layui.spTable;

        // 渲染工单表格
        var tableIns = spTable.render({
            url: '${request.contextPath}/order/release/page',
            page: true,
            where: {},
            toolbar: '#js-record-table-toolbar-top',
            defaultToolbar: ['filter', 'print', 'exports'],
            cols: [[
                {type: 'checkbox'},
                {field: 'orderCode', title: '订单编号', minWidth: 180},
                {field: 'orderDescription', title: '订单名称', minWidth: 180},
                {field: 'qty', title: '数量', width: 80},
                {field: 'materiel', title: '物料编码', minWidth: 150},
                {field: 'materielDesc', title: '物料名称', minWidth: 180},
                {field: 'statue', title: '状态', width: 120, templet: '#js-statue-tpl'},
                {field: 'remark', title: '备注', minWidth: 180},
                {title: '操作', align: 'center', toolbar: '#js-row-action-tpl'}
            ]],
            done: function (res, curr, count) {
                form.render();
            }
        });

        window._tableIns = tableIns;
        window._reloadTable = function () {
            tableIns.reload({
                page: {curr: 1}
            });
        };

        // 搜索按钮事件
        form.on('submit(js-search-filter)', function (data) {
            var where = {};
            if (data.field.orderCodeLike) {
                where.orderCodeLike = data.field.orderCodeLike;
            }
            if (data.field.orderDescriptionLike) {
                where.orderDescriptionLike = data.field.orderDescriptionLike;
            }
            tableIns.reload({
                where: where,
                page: {curr: 1}
            });
            return false;
        });

        // 重置按钮
        $('#js-reset-btn').click(function () {
            $("input[name='orderCodeLike']").val('');
            $("input[name='orderDescriptionLike']").val('');
            tableIns.reload({
                where: {orderCodeLike: '', orderDescriptionLike: ''},
                page: {curr: 1}
            });
        });

        // 打开新增/编辑表单
        function openOrderForm(id) {
            var title = id ? '编辑工单' : '新建生产订单';
            var url = '${request.contextPath}/order/release/add-or-update-ui';
            spLayer.open({
                title: title,
                area: ['90%', '90%'],
                content: url,
                spWhere: id ? {id: id} : undefined,
                spCallback: function (result) {
                    // 表单保存成功后刷新表格
                    tableIns.reload({
                        page: {curr: 1}
                    });
                }
            });
        }

        // 工具栏事件
        table.on('toolbar(js-record-table-filter)', function (obj) {
            if (obj.event === 'add') {
                openOrderForm();
            }
        });

        // 行工具事件
        table.on('tool(js-record-table-filter)', function (obj) {
            var data = obj.data;

            if (obj.event === 'edit') {
                openOrderForm(data.id);
            }

            if (obj.event === 'delete') {
                layer.confirm('确认要删除工单【' + (data.orderCode || data.id) + '】吗？此操作不可恢复。', function (confirmIndex) {
                    spUtil.ajax({
                        url: '${request.contextPath}/order/release/delete',
                        type: 'POST',
                        data: {id: data.id},
                        success: function (res) {
                            layer.msg('删除成功');
                            tableIns.reload({
                                page: {curr: 1}
                            });
                        }
                    });
                    layer.close(confirmIndex);
                });
            }
        });

        // ===== 甘特图 =====
        var ganttData = [];
        spUtil.ajax({
            url: '${request.contextPath}/order/release/gantt/list',
            async: false,
            type: 'POST',
            serializable: false,
            data: {},
            success: function (data) {
                ganttData = data.data;
            },
            error: function () {}
        });

        var $gantt = $("#js-gantt").gantt({
            source: ganttData,
            navigate: 'scroll',
            scale: "weeks",
            maxScale: "months",
            minScale: "days",
            waitText: "请稍后...",
            itemsPerPage: 8,
            tnTitle1: '物料编码',
            tnTitle2: '计划/实际',
            onItemClick: function (data) {
                openOrderForm(data);
            },
            onAddClick: function (dt, rowId) {
                console.log(dt);
                console.log(rowId);
            },
            onRender: function () {
                console.log('onRender');
            }
        });

        // 甘特图搜索
        form.on('submit(js-gantt-search-filter)', function (data) {
            spUtil.ajax({
                url: '${request.contextPath}/order/release/gantt/list',
                async: false,
                type: 'POST',
                serializable: false,
                data: data.field,
                success: function (res) {
                    ganttData = res.data;
                    $gantt.gantt({
                        source: ganttData,
                        navigate: 'scroll',
                        scale: "weeks",
                        maxScale: "months",
                        minScale: "days",
                        waitText: "请稍后...",
                        itemsPerPage: 8,
                        tnTitle1: '物料编码',
                        tnTitle2: '计划/实际',
                        onItemClick: function (data) {
                            openOrderForm(data);
                        }
                    });
                },
                error: function () {}
            });
            return false;
        });

        form.render();
    });
</script>
</body>
</html>
