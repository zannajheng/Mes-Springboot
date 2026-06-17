<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>数据权限</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <#include "${request.contextPath}/common/common.ftl">
</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <form class="layui-form splayui-form">
            <input type="hidden" name="id" value="${role.id}">
            <div class="layui-form-item">
                <label class="layui-form-label">角色名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="name" value="${role.name}" disabled class="layui-input layui-disabled">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label sp-required">数据范围</label>
                <div class="layui-input-block">
                    <input type="radio" name="dataScope" value="未设置" title="未设置" <#if role.dataScope == "未设置">checked</#if>>
                    <input type="radio" name="dataScope" value="全部数据" title="全部数据" <#if role.dataScope == "全部数据">checked</#if>>
                    <input type="radio" name="dataScope" value="本部门数据" title="本部门数据" <#if role.dataScope == "本部门数据">checked</#if>>
                    <input type="radio" name="dataScope" value="仅本人数据" title="仅本人数据" <#if role.dataScope == "仅本人数据">checked</#if>>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">业务范围</label>
                <div class="layui-input-block">
                    <input type="radio" name="businessScope" value="未设置" title="未设置" <#if role.businessScope == "未设置">checked</#if>>
                    <input type="radio" name="businessScope" value="全部业务" title="全部业务" <#if role.businessScope == "全部业务">checked</#if>>
                    <input type="radio" name="businessScope" value="指定业务" title="指定业务" <#if role.businessScope == "指定业务">checked</#if>>
                </div>
            </div>
            <div class="layui-form-item" style="text-align: center; margin-top: 30px;">
                <button class="layui-btn layui-btn-lg" lay-submit lay-filter="js-submit-filter"><i class="layui-icon">&#xe61f;</i>保存</button>
            </div>
        </form>
    </div>
</div>
<script>
    layui.use(['form'], function () {
        var form = layui.form;
        form.render();

        form.on('submit(js-submit-filter)', function (data) {
            spUtil.submitForm({
                url: "${request.contextPath}/admin/sys/permission/save-data-auth",
                data: data.field
            });
            return false;
        });
    });
</script>
</body>
</html>