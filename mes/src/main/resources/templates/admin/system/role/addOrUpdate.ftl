<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加用户</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <#include "${request.contextPath}/common/common.ftl">
<style>
    .layui-form-item {
        margin-bottom: 20px;
    }
    .layui-form-label {
        width: 100px;
    }
    .layui-input-inline {
        width: 240px;
    }
    .layui-input-block {
        margin-left: 120px;
    }
    .splayui-main {
        padding: 30px;
    }
</style>
</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <form class="layui-form splayui-form">
            <div class="layui-row">
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <div class="layui-form-item">
                        <label for="js-name" class="layui-form-label sp-required">角色名称
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-name" name="name" lay-verify="required" autocomplete="off" class="layui-input" value="${result.name}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="js-code" class="layui-form-label sp-required">角色编码
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-code" name="code" lay-verify="required" autocomplete="off" class="layui-input" value="${result.code}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="js-sortNum" class="layui-form-label">排序号
                        </label>
                        <div class="layui-input-inline">
                            <input type="number" id="js-sortNum" name="sortNum" autocomplete="off" class="layui-input" value="${result.sortNum!'0'}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">系统角色</label>
                        <div class="layui-input-block">
                            <input type="radio" name="isSystemRole" value="1" title="是" <#if result.isSystemRole == "1">checked</#if>>
                            <input type="radio" name="isSystemRole" value="0" title="否" <#if result.isSystemRole != "1">checked</#if>>
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <div class="layui-form-item">
                        <label for="js-descr" class="layui-form-label">描述
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-descr" name="descr" autocomplete="off" class="layui-input" value="${result.descr}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="js-userType" class="layui-form-label">用户类型
                        </label>
                        <div class="layui-input-inline">
                            <select id="js-userType" name="userType">
                                <option value="">请选择</option>
                                <option value="员工" <#if result.userType == "员工">selected</#if>>员工</option>
                                <option value="管理员" <#if result.userType == "管理员">selected</#if>>管理员</option>
                                <option value="外协" <#if result.userType == "外协">selected</#if>>外协</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="js-dataScope" class="layui-form-label">数据范围
                        </label>
                        <div class="layui-input-inline">
                            <select id="js-dataScope" name="dataScope">
                                <option value="">请选择</option>
                                <option value="全部" <#if result.dataScope == "全部">selected</#if>>全部</option>
                                <option value="本部门" <#if result.dataScope == "本部门">selected</#if>>本部门</option>
                                <option value="本部门及下级" <#if result.dataScope == "本部门及下级">selected</#if>>本部门及下级</option>
                                <option value="本人" <#if result.dataScope == "本人">selected</#if>>本人</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="js-businessScope" class="layui-form-label">业务范围
                        </label>
                        <div class="layui-input-inline">
                            <select id="js-businessScope" name="businessScope">
                                <option value="">请选择</option>
                                <option value="基础数据" <#if result.businessScope == "基础数据">selected</#if>>基础数据</option>
                                <option value="工艺数据" <#if result.businessScope == "工艺数据">selected</#if>>工艺数据</option>
                                <option value="生产数据" <#if result.businessScope == "生产数据">selected</#if>>生产数据</option>
                                <option value="质量数据" <#if result.businessScope == "质量数据">selected</#if>>质量数据</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="js-is-deleted" class="layui-form-label sp-required">状态
                        </label>
                        <div class="layui-input-block" id="js-is-deleted">
                            <input type="radio" name="deleted" value="0" title="正常" <#if result.deleted == "0" || !(result??)>checked</#if>>
                            <input type="radio" name="deleted" value="1" title="已删除" <#if result.deleted == "1">checked</#if>>
                            <input type="radio" name="deleted" value="2" title="已禁用" <#if result.deleted == "2">checked</#if>>
                        </div>
                    </div>
                </div>

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
<script>
    layui.use(['form', 'util'], function () {
        var form = layui.form,
            util = layui.util;

        //监听提交
        form.on('submit(js-submit-filter)', function (data) {
            spUtil.submitForm({
                url: "${request.contextPath}/admin/sys/role/add-or-update",
                data: data.field
            });

            return false;
        });
    });
</script>
</body>
</html>