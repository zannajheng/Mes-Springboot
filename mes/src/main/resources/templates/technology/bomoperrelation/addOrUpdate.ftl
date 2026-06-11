<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>工序配置</title>
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
    </style>
</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <form class="layui-form splayui-form" style="margin: 0 auto;max-width: 350px;padding-top: 20px;">
            <div class="layui-form-item">
                <label for="js-nodeName" class="layui-form-label">节点名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="js-nodeName" name="nodeName"
                           autocomplete="off" class="layui-input" value="${result.nodeName!}">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="js-oper" class="layui-form-label">工序编号</label>
                <div class="layui-input-inline">
                    <input type="text" id="js-oper" name="oper"
                           autocomplete="off" class="layui-input" value="${result.oper!}">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="js-operDesc" class="layui-form-label sp-required">工序名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="js-operDesc" name="operDesc" lay-verify="required"
                           autocomplete="off" class="layui-input" value="${result.operDesc!}">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="js-workCenterDesc" class="layui-form-label">加工单元</label>
                <div class="layui-input-inline">
                    <input type="text" id="js-workCenterDesc" name="workCenterDesc"
                           autocomplete="off" class="layui-input" value="${result.workCenterDesc!}">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="js-operTime" class="layui-form-label">工序工时(h)</label>
                <div class="layui-input-inline">
                    <input type="text" id="js-operTime" name="operTime"
                           autocomplete="off" class="layui-input" value="${result.operTime!}">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="js-produceCycle" class="layui-form-label">制造周期(h)</label>
                <div class="layui-input-inline">
                    <input type="text" id="js-produceCycle" name="produceCycle"
                           autocomplete="off" class="layui-input" value="${result.produceCycle!}">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="js-sortNum" class="layui-form-label">排序号</label>
                <div class="layui-input-inline">
                    <input type="number" id="js-sortNum" name="sortNum"
                           autocomplete="off" class="layui-input" value="${result.sortNum!}">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 15px;">
                <div class="layui-input-block" style="margin-left: 115px;">
                    <input id="js-id" name="id" type="hidden" value="${result.id}"/>
                    <button id="js-submit" class="layui-btn">确定</button>
                    <button type="button" class="layui-btn layui-btn-primary" onclick="parent.layer.closeAll()">取消</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    // 使用直接click事件替代layui form.submit，避免layui模块加载失败导致表单传统提交的问题
    $(document).ready(function () {
        layui.use(['layer'], function () {
            var layer = layui.layer;
            $('#js-submit').on('click', function (e) {
                e.preventDefault();
                // 手动表单验证
                var operDesc = $('#js-operDesc').val();
                if (!operDesc || operDesc.trim() === '') {
                    layer.msg('工序名称不能为空');
                    return;
                }
                // 收集表单数据
                var field = {
                    id: $('#js-id').val(),
                    nodeName: $('#js-nodeName').val(),
                    oper: $('#js-oper').val(),
                    operDesc: operDesc,
                    workCenterDesc: $('#js-workCenterDesc').val(),
                    operTime: $('#js-operTime').val() || null,
                    produceCycle: $('#js-produceCycle').val() || null,
                    sortNum: $('#js-sortNum').val() || null
                };
                // 发送ajax请求保存数据
                $.ajax({
                    type: 'POST',
                    url: '${request.contextPath}/technology/bom-oper-relation/update',
                    contentType: 'application/json',
                    data: JSON.stringify(field),
                    dataType: 'json',
                    async: true,
                    success: function (result) {
                        if (result.code === 0) {
                            parent.layer.closeAll();
                            // 刷新父页面表格，显示编辑后的数据
                            if (parent._reloadBomTable) {
                                parent._reloadBomTable();
                            } else if (parent._bomTableIns) {
                                parent._bomTableIns.reload({});
                            }
                        } else {
                            layer.alert(result.msg, {icon: 2});
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        var errMsg = '系统错误';
                        if (jqXHR.responseJSON && jqXHR.responseJSON.msg) {
                            errMsg += '：' + jqXHR.responseJSON.msg;
                        } else if (jqXHR.responseText) {
                            errMsg += '：' + jqXHR.responseText;
                        } else {
                            errMsg += '：' + textStatus;
                        }
                        layer.alert(errMsg, {icon: 2});
                    }
                });
            });
        });
    });
</script>
</body>
</html>
