<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>维护零部件信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <#include "${request.contextPath}/common/common.ftl">
</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <form class="layui-form splayui-form" style="margin: 0 auto;max-width: 460px;padding-top: 40px;">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label for="js-partNo" class="layui-form-label">零部件编号</label>
                    <div class="layui-input-inline">
                        <input type="text" id="js-partNo" name="partNo" readonly="true"
                               autocomplete="off"
                               class="layui-input" value="${result.partNo!"自动生成"}">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label for="js-partName" class="layui-form-label sp-required">零部件名称</label>
                    <div class="layui-input-inline">
                        <input type="text" id="js-partName" name="partName" lay-verify="required"
                               autocomplete="off"
                               class="layui-input" value="${result.partName}">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">备注信息:</label>
                <div class="layui-input-block">
                    <textarea placeholder="描述零件的特性" name="remark"
                              class="layui-textarea">${result.remark}</textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="js-is-deleted" class="layui-form-label sp-required">状态</label>
                <div class="layui-input-block" id="js-is-deleted" style="width: 310px;">
                    <input type="radio" name="deleted" value="0" title="正常"
                           <#if result.deleted == "0" || !(result??)>checked</#if>>
                    <input type="radio" name="deleted" value="1" title="已删除"
                           <#if result.deleted == "1">checked</#if>>
                    <input type="radio" name="deleted" value="2" title="已禁用"
                           <#if result.deleted == "2">checked</#if>>
                </div>
            </div>
            <div class="layui-form-item layui-hide">
                <div class="layui-input-block">
                    <input id="js-id" name="id" value="${result.id}"/>
                    <button id="js-submit" class="layui-btn" lay-demotransferactive="getData" lay-submit
                            lay-filter="js-submit-filter">确定
                    </button>
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

        form.on('submit(js-submit-filter)', function (data) {
            spUtil.submitForm({
                url: "${request.contextPath}/technology/part/add-or-update",
                data: data.field
            });
            return false;
        });
    });
</script>
</body>
</html>