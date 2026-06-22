<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加用户</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <#include "${request.contextPath}/common/common.ftl">
</head>

<body>
<div class="splayui-container">
    <div class="splayui-main">
        <form class="layui-form splayui-form">
            <div class="layui-row">
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <div class="layui-form-item">
                        <label for="js-name" class="layui-form-label sp-required">姓名
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-name" name="name" lay-verify="required" autocomplete="off" class="layui-input" value="${result.name}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-username" class="layui-form-label sp-required">用户名
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-username" name="username" lay-verify="required" autocomplete="off" class="layui-input" value="${result.username}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-password" class="layui-form-label <#if result??>sp-optional<#else>sp-required</#if>">密码
                        </label>
                        <div class="layui-input-inline">
                            <input type="password" id="js-password" name="password" lay-verify="<#if result??>optional<#else>required</#if>" autocomplete="off" class="layui-input" placeholder="<#if result??>不修改密码请留空</#if>">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-repassword" class="layui-form-label <#if result??>sp-optional<#else>sp-required</#if>">确认密码
                        </label>
                        <div class="layui-input-inline">
                            <input type="password" id="js-repassword" name="repassword" lay-verify="<#if result??>optional<#else>required</#if>" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-dept-id" class="layui-form-label sp-required">部门</label>
                        <div class="layui-input-inline">
                            <select id="js-dept-id" name="deptId" lay-verify="required" lay-filter="js-dept-filter">
                                <option value="">请选择部门</option>
                                <#if departments??>
                                <#list departments as dept>
                                    <option value="${dept.id}" <#if result?? && result.deptId == dept.id>selected</#if>>${dept.name}</option>
                                </#list>
                                </#if>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-email" class="layui-form-label sp-required">邮箱</label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-email" name="email" lay-verify="required|email" autocomplete="off" class="layui-input" value="${result.email}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-mobile" class="layui-form-label sp-required">手机号</label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-mobile" name="mobile" lay-verify="required|number" autocomplete="off" class="layui-input" value="${result.mobile}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-tel" class="layui-form-label">固定电话</label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-tel" name="tel" lay-verify="" autocomplete="off" class="layui-input" value="${result.tel}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-sex" class="layui-form-label sp-required">性别</label>
                        <div class="layui-input-block" id="js-sex">
                            <input type="radio" name="sex" value="0" title="女" <#if result.sex == "0">checked</#if>>
                            <input type="radio" name="sex" value="1" title="男" <#if result.sex == "1">checked</#if>>
                            <input type="radio" name="sex" value="2" title="其他" <#if result.sex == "2">checked</#if>>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-birthday" class="layui-form-label sp-required">出生年月日</label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-birthday" name="birthday" lay-verify="required" autocomplete="off" class="layui-input" value="${result.birthday}">
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <div class="layui-form-item">
                        <label for="js-pic-id" class="layui-form-label">头像</label>
                        <div class="layui-input-inline">
                            <div class="layui-upload">
                                <button type="button" class="layui-btn" id="js-upload-btn">上传图片</button>
                                <div class="layui-upload-list">
                                    <img class="layui-upload-img" id="js-upload-preview" <#if result.picId?? && result.picId != "">src="${request.contextPath}/admin/sys/user/avatar/${result.picId}"</#if>>
                                    <input type="hidden" id="js-pic-id" name="picId" value="${result.picId}">
                                    <p id="js-upload-text"></p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-is-deleted" class="layui-form-label sp-required">状态</label>
                        <div class="layui-input-block" id="js-is-deleted">
                            <input type="radio" name="deleted" value="0" title="正常" <#if result.deleted == "0" || !(result??)>checked</#if>>
                            <input type="radio" name="deleted" value="1" title="已删除" <#if result.deleted == "1">checked</#if>>
                            <input type="radio" name="deleted" value="2" title="已禁用" <#if result.deleted == "2">checked</#if>>
                        </div>
                    </div>
                </div>

                <#if isAdmin>
                <div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
                    <div class="layui-form-item" pane="">
                        <label class="layui-form-label">分配权限</label>
                        <div class="layui-input-block">
                            <#list sysRoles as sysRole>
                                <input type="checkbox" name="sysRoleIds[]" title="${sysRole.name}" value="${sysRole.id}" <#if sysRole.checked >checked</#if>>
                            </#list>
                        </div>
                    </div>
                </div>
                </#if>

                <div class="layui-form-item layui-hide">
                    <div class="layui-input-block">
                        <input id="js-id" name="id" value="${result.id}"/>
                        <button id="js-submit" class="layui-btn" lay-submit lay-filter="js-submit-filter">确定</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<style>
    .layui-upload-img {
        width: 120px;
        height: 120px;
        border-radius: 50%;
        border: 2px solid #e6e6e6;
        object-fit: cover;
    }
</style>
<script>
    layui.use(['form', 'util', 'upload', 'laydate'], function () {
        var form = layui.form,
            util = layui.util,
            upload = layui.upload,
            laydate = layui.laydate;

        laydate.render({
            elem: '#js-birthday',
            format: 'yyyy-MM-dd',
            trigger: 'click'
        });

        upload.render({
            elem: '#js-upload-btn',
            url: '${request.contextPath}/admin/sys/user/upload-avatar',
            accept: 'images',
            size: 2048,
            before: function (obj) {
                obj.preview(function (index, file, result) {
                    $('#js-upload-preview').attr('src', result);
                });
            },
            done: function (res) {
                if (res.code === 0) {
                    $('#js-pic-id').val(res.data);
                    $('#js-upload-text').text('上传成功');
                } else {
                    $('#js-upload-text').text(res.msg);
                }
            },
            error: function () {
                $('#js-upload-text').text('上传失败');
            }
        });

        form.render();

        form.on('submit(js-submit-filter)', function (data) {
            spUtil.submitForm({
                url: "${request.contextPath}/admin/sys/user/add-or-update",
                data: data.field
            });

            return false;
        });
    });
</script>
</body>
</html>