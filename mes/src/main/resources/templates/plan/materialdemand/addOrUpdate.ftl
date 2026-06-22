<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>维护物料需求计划</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <#include "${request.contextPath}/common/common.ftl">
</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <form class="layui-form splayui-form" style="margin: 0 auto;padding-top: 40px;">
            <div style="max-width: 700px;">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="js-orderCode" class="layui-form-label sp-required">所属订单编号</label>
                        <div class="layui-input-inline" style="width: 200px;">
                            <input type="text" id="js-orderCode" name="orderCode" lay-verify="required"
                                   autocomplete="off" class="layui-input" value="${result.orderCode!}">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label for="js-productSerialNo" class="layui-form-label">产品序列号</label>
                        <div class="layui-input-inline" style="width: 200px;">
                            <input type="text" id="js-productSerialNo" name="productSerialNo"
                                   autocomplete="off" class="layui-input" value="${result.productSerialNo!}">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="js-taskSerialNo" class="layui-form-label">任务序列号</label>
                        <div class="layui-input-inline" style="width: 200px;">
                            <input type="text" id="js-taskSerialNo" name="taskSerialNo"
                                   autocomplete="off" class="layui-input" value="${result.taskSerialNo!}">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label for="js-productName" class="layui-form-label">产品物料名称</label>
                        <div class="layui-input-inline" style="width: 200px;">
                            <input type="text" id="js-productName" name="productName"
                                   autocomplete="off" class="layui-input" value="${result.productName!}">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="js-workCenterName" class="layui-form-label">加工单元名称</label>
                        <div class="layui-input-inline" style="width: 200px;">
                            <input type="text" id="js-workCenterName" name="workCenterName"
                                   autocomplete="off" class="layui-input" value="${result.workCenterName!}">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label for="js-workCenterCode" class="layui-form-label">加工单元编码</label>
                        <div class="layui-input-inline" style="width: 200px;">
                            <input type="text" id="js-workCenterCode" name="workCenterCode"
                                   autocomplete="off" class="layui-input" value="${result.workCenterCode!}">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="js-materielCode" class="layui-form-label sp-required">物料编码</label>
                        <div class="layui-input-inline" style="width: 200px;">
                            <input type="text" id="js-materielCode" name="materielCode" lay-verify="required"
                                   autocomplete="off" class="layui-input" value="${result.materielCode!}">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label for="js-materielName" class="layui-form-label">物料名称</label>
                        <div class="layui-input-inline" style="width: 200px;">
                            <input type="text" id="js-materielName" name="materielName"
                                   autocomplete="off" class="layui-input" value="${result.materielName!}">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="js-requireQty" class="layui-form-label sp-required">需求数量</label>
                        <div class="layui-input-inline" style="width: 200px;">
                            <input type="text" id="js-requireQty" name="requireQty" lay-verify="required"
                                   autocomplete="off" class="layui-input" value="${result.requireQty!}">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label for="js-unit" class="layui-form-label">计量单位</label>
                        <div class="layui-input-inline" style="width: 200px;">
                            <input type="text" id="js-unit" name="unit"
                                   autocomplete="off" class="layui-input" value="${result.unit!}">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="js-stockOutQty" class="layui-form-label">出库数量</label>
                        <div class="layui-input-inline" style="width: 200px;">
                            <input type="text" id="js-stockOutQty" name="stockOutQty"
                                   autocomplete="off" class="layui-input" value="${result.stockOutQty!}">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label for="js-netRequireQty" class="layui-form-label">净需求数量</label>
                        <div class="layui-input-inline" style="width: 200px;">
                            <input type="text" id="js-netRequireQty" name="netRequireQty"
                                   autocomplete="off" class="layui-input" value="${result.netRequireQty!}">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="js-deliveryStatus" class="layui-form-label">配送状态</label>
                        <div class="layui-input-inline" style="width: 200px;">
                            <select id="js-deliveryStatus" name="deliveryStatus">
                                <option value="undelivered" <#if result.deliveryStatus == "undelivered" || !(result.deliveryStatus??)>selected</#if>>未下发</option>
                                <option value="delivered" <#if result.deliveryStatus == "delivered">selected</#if>>已下发</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label for="js-stockInStatus" class="layui-form-label">生成入库单状态</label>
                        <div class="layui-input-inline" style="width: 200px;">
                            <select id="js-stockInStatus" name="stockInStatus">
                                <option value="not_generated" <#if result.stockInStatus == "not_generated" || !(result.stockInStatus??)>selected</#if>>未生成</option>
                                <option value="generated" <#if result.stockInStatus == "generated">selected</#if>>已生成</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="js-stockInOrderNo" class="layui-form-label">入库单单号</label>
                        <div class="layui-input-inline" style="width: 420px;">
                            <input type="text" id="js-stockInOrderNo" name="stockInOrderNo"
                                   autocomplete="off" class="layui-input" value="${result.stockInOrderNo!}">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">备注说明:</label>
                    <div class="layui-input-block">
                        <textarea placeholder="备注" name="remark" class="layui-textarea" style="width: 650px;">${result.remark!}</textarea>
                    </div>
                </div>
            </div>

            <div class="layui-form-item layui-hide">
                <div class="layui-input-block">
                    <input id="js-id" name="id" value="${result.id!}"/>
                    <button id="js-submit" class="layui-btn" lay-submit lay-filter="js-submit-filter">确定</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    layui.use(['form', 'layer'], function () {
        var form = layui.form;

        form.on('submit(js-submit-filter)', function (data) {
            spUtil.submitForm({
                contentType: 'application/json',
                url: "${request.contextPath}/plan/material-demand/add-or-update",
                data: JSON.stringify(data.field)
            });
            return false;
        });

        form.render();
    });
</script>
</body>
</html>