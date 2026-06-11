<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>维护工序信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <#include "${request.contextPath}/common/common.ftl">
    <style>
        .layui-form-item {
            margin-bottom: 10px;
        }
        .layui-form-label {
            width: 110px;
            padding: 9px 5px;
        }
        .layui-input-inline {
            width: 200px;
        }
        .layui-textarea {
            width: 310px;
            height: 60px;
        }
    </style>
</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <form class="layui-form splayui-form" style="margin: 0 auto;max-width: 350px;padding-top: 20px;">
            <div class="layui-form-item">
                <label for="js-oper" class="layui-form-label">工序编号</label>
                <div class="layui-input-inline">
                    <input type="text" id="js-oper" name="oper" readonly="true"
                           autocomplete="off" class="layui-input" value="${result.oper!"自动生成"}">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="js-operDesc" class="layui-form-label sp-required">工序名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="js-operDesc" name="operDesc" lay-verify="required"
                           autocomplete="off" class="layui-input" value="${result.operDesc}">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="js-workCenter" class="layui-form-label sp-required">加工单元编号</label>
                <div class="layui-input-inline">
                    <input type="text" id="js-workCenter" name="workCenter" lay-verify="required"
                           autocomplete="off" class="layui-input" value="${result.workCenter}">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="js-workCenterDesc" class="layui-form-label sp-required">加工单元名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="js-workCenterDesc" name="workCenterDesc" lay-verify="required"
                           autocomplete="off" class="layui-input" value="${result.workCenterDesc}">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="js-operTime" class="layui-form-label sp-required">工序工时(h)</label>
                <div class="layui-input-inline">
                    <input type="text" id="js-operTime" name="operTime" lay-verify="required|number"
                           autocomplete="off" class="layui-input" value="${result.operTime}">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="js-produceCycle" class="layui-form-label sp-required">制造周期(h)</label>
                <div class="layui-input-inline">
                    <input type="text" id="js-produceCycle" name="produceCycle" lay-verify="required|number"
                           autocomplete="off" class="layui-input" value="${result.produceCycle}">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="js-isProducePlan" class="layui-form-label sp-required">是否生成生产计划</label>
                <div class="layui-input-inline">
                    <select id="js-isProducePlan" name="isProducePlan" lay-verify="required" class="layui-input">
                        <option value="" disabled>请选择</option>
                        <option value="是" <#if result.isProducePlan == "是" || !(result??)>selected</#if>>是</option>
                        <option value="否" <#if result.isProducePlan == "否">selected</#if>>否</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">备注信息:</label>
                <div class="layui-input-block">
                    <textarea placeholder="描述工序的特性" name="remark" class="layui-textarea">${result.remark}</textarea>
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 15px;">
                <div class="layui-input-block" style="margin-left: 115px;">
                    <input id="js-id" name="id" value="${result.id}" style="display: none;"/>
                    <button id="js-submit" class="layui-btn" lay-submit lay-filter="js-submit-filter">确定</button>
                    <button type="button" class="layui-btn layui-btn-primary" onclick="parent.layer.closeAll()">取消</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    layui.use(['form', 'layer', 'spLayer'], function () {
        var form = layui.form,
            spLayer = layui.spLayer,
            layer = layui.layer;
        form.render();
        form.on('submit(js-submit-filter)', function (data) {
            // 数字字段为空时兜底设为0，防止后端NumberFormatException
            if (!data.field.operTime) data.field.operTime = "0";
            if (!data.field.produceCycle) data.field.produceCycle = "0";
            spUtil.submitForm({
                url: "${request.contextPath}/technology/oper/add-or-update",
                data: data.field,
                success: function (result) {
                    if (result.code === 0) {
                        parent.layer.closeAll();
                        parent.location.reload();
                    } else {
                        layer.alert(result.msg, {icon: 2});
                    }
                }
            });
            return false;
        });
    });
</script>
</body>
</html>