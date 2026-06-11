<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>物料需求计划</title>
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
                <h3 class="layui-card-title">物料需求计划</h3>
            </div>
            <div class="layui-card-body">
                <form id="js-search-form" class="layui-form" lay-filter="js-q-form-filter">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">所属订单编号</label>
                            <div class="layui-input-inline">
                                <input type="text" name="orderCodeLike" placeholder="请输入订单编号" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">产品序列号</label>
                            <div class="layui-input-inline">
                                <input type="text" name="productSerialNoLike" placeholder="请输入产品序列号" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">任务序列号</label>
                            <div class="layui-input-inline">
                                <input type="text" name="taskSerialNoLike" placeholder="请输入任务序列号" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">物料编码</label>
                            <div class="layui-input-inline">
                                <input type="text" name="materielCodeLike" placeholder="请输入物料编码" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">物料名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="materielNameLike" placeholder="请输入物料名称" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline" style="margin-left: 10px;">
                            <a class="layui-btn" lay-submit lay-filter="js-search-filter">查询</a>
                        </div>
                        <div class="layui-inline">
                            <a class="layui-btn layui-btn-primary" id="js-reset-btn">重置</a>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">生成入库单状态</label>
                            <div class="layui-input-inline">
                                <select name="stockInStatus">
                                    <option value="">全部</option>
                                    <option value="not_generated">未生成</option>
                                    <option value="generated">已生成</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">配送状态</label>
                            <div class="layui-input-inline">
                                <select name="deliveryStatus">
                                    <option value="">全部</option>
                                    <option value="undelivered">未下发</option>
                                    <option value="delivered">已下发</option>
                                </select>
                            </div>
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
        <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="generateStockIn"><i class="layui-icon">&#xe610;</i>生成入库单</button>
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="export"><i class="layui-icon">&#xe60e;</i>导出</button>
    </div>
</script>

<script type="text/html" id="js-delivery-status-tpl">
    {{# if(d.deliveryStatus == 'delivered'){ }}
    <span class="layui-badge layui-bg-green">已下发</span>
    {{# } else { }}
    <span class="layui-badge layui-bg-orange">未下发</span>
    {{# } }}
</script>

<script type="text/html" id="js-stock-status-tpl">
    {{# if(d.stockInStatus == 'generated'){ }}
    <span class="layui-badge layui-bg-green">已生成</span>
    {{# } else { }}
    <span class="layui-badge layui-bg-gray">未生成</span>
    {{# } }}
</script>

<script>
    layui.use(['form', 'table', 'spLayer', 'spTable', 'spLayui'], function () {
        var form = layui.form,
            table = layui.table,
            spLayer = layui.spLayer,
            spLayui = layui.spLayui,
            spTable = layui.spTable;

        var tableIns = spTable.render({
            url: '${request.contextPath}/plan/material-demand/page',
            page: true,
            where: {},
            toolbar: '#js-record-table-toolbar-top',
            defaultToolbar: ['filter', 'print', 'exports'],
            cols: [[
                {type: 'checkbox'},
                {field: 'orderCode', title: '所属订单编号', width: 180},
                {field: 'productSerialNo', title: '产品序列号', width: 180},
                {field: 'taskSerialNo', title: '任务序列号', width: 180},
                {field: 'productName', title: '产品物料名称', minWidth: 180},
                {field: 'workCenterName', title: '加工单元名称', minWidth: 150},
                {field: 'materielCode', title: '物料编码', width: 150},
                {field: 'materielName', title: '物料名称', minWidth: 180},
                {field: 'requireQty', title: '需求数量', width: 100},
                {field: 'unit', title: '计量单位', width: 80},
                {field: 'deliveryStatus', title: '配送状态', width: 100, templet: '#js-delivery-status-tpl'},
                {field: 'stockOutQty', title: '出库数量', width: 100},
                {field: 'netRequireQty', title: '净需求数量', width: 100},
                {field: 'stockInStatus', title: '生成入库单状态', width: 120, templet: '#js-stock-status-tpl'},
                {field: 'stockInOrderNo', title: '入库单单号', width: 180},
                {field: 'remark', title: '备注', minWidth: 120}
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

        form.on('submit(js-search-filter)', function (data) {
            var where = {};
            if (data.field.orderCodeLike) {
                where.orderCodeLike = data.field.orderCodeLike;
            }
            if (data.field.productSerialNoLike) {
                where.productSerialNoLike = data.field.productSerialNoLike;
            }
            if (data.field.taskSerialNoLike) {
                where.taskSerialNoLike = data.field.taskSerialNoLike;
            }
            if (data.field.materielCodeLike) {
                where.materielCodeLike = data.field.materielCodeLike;
            }
            if (data.field.materielNameLike) {
                where.materielNameLike = data.field.materielNameLike;
            }
            if (data.field.stockInStatus) {
                where.stockInStatus = data.field.stockInStatus;
            }
            if (data.field.deliveryStatus) {
                where.deliveryStatus = data.field.deliveryStatus;
            }
            tableIns.reload({
                where: where,
                page: {curr: 1}
            });
            return false;
        });

        $('#js-reset-btn').click(function () {
            $('form')[0].reset();
            form.render();
            tableIns.reload({
                where: {},
                page: {curr: 1}
            });
        });

        table.on('toolbar(js-record-table-filter)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            var data = checkStatus.data;

            if (obj.event === 'generateStockIn') {
                if (data.length === 0) {
                    layer.msg('请选择要生成入库单的物料');
                    return;
                }
                var ids = [];
                for (var i = 0; i < data.length; i++) {
                    if (data[i].stockInStatus === 'generated') {
                        layer.msg('选中的物料中存在已生成入库单的记录，请重新选择');
                        return;
                    }
                    ids.push(data[i].id);
                }
                layer.confirm('确认要为选中的 ' + ids.length + ' 条物料生成入库单吗？', function (index) {
                    spUtil.ajax({
                        url: '${request.contextPath}/plan/material-demand/generate-stock-in',
                        type: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify({ids: ids}),
                        success: function (res) {
                            if (res.code === 200 || res.code === 0) {
                                layer.msg('入库单生成成功');
                                tableIns.reload({
                                    page: {curr: 1}
                                });
                            } else {
                                layer.msg(res.message || '生成失败');
                            }
                        }
                    });
                    layer.close(index);
                });
            }

            if (obj.event === 'export') {
                var searchForm = $('form#js-search-form');
                var params = {};
                $.each(searchForm.serializeArray(), function () {
                    if (this.value) {
                        params[this.name] = this.value;
                    }
                });
                var queryStr = $.param(params);
                window.open('${request.contextPath}/plan/material-demand/export?' + queryStr, '_blank');
            }
        });

        form.render();
    });
</script>
</body>
</html>
