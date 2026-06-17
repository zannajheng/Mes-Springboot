<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加角色</title>
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
                <div class="layui-col-xs12">
                    <div class="layui-form-item">
                        <label for="js-name" class="layui-form-label">角色名称
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-name" name="name" readonly autocomplete="off" class="layui-input" value="${result.name}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="js-code" class="layui-form-label">角色编码
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-code" name="code" readonly autocomplete="off" class="layui-input" value="${result.code}">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item layui-hide">
                    <div class="layui-input-block">
                        <input id="js-id" name="id" value="${result.id}"/>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>