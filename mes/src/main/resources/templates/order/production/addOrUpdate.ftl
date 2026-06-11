<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>派工单编辑</title>
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
                    <label for="js-orderCode" class="layui-form-label sp-required">订单编号
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="js-orderCode" name="orderCode" lay-verify="required"
                               autocomplete="off"
                               class="layui-input" value="${result.orderCode}">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label for="js-orderDescription" class="layui-form-label">订单名称
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="js-orderDescription" name="orderDescription" autocomplete="off"
                               class="layui-input" value="${result.orderDescription!}">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label for="js-qty" class="layui-form-label sp-required">数量
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="js-qty" name="qty" lay-verify="required"
                               autocomplete="off"
                               class="layui-input" value="${result.qty}">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="js-materiel" class="layui-form-label sp-required">物料编码
                </label>
                <div style="display: flex;   flex-direction: row;">
                    <button type="button" id="js-test-btn" class="layui-btn" style="height:37px "><i
                                class="layui-icon layui-icon-search "></i>
                    </button>
                    <input id="js-materiel" name="materiel" readonly="true" lay-verify="required"
                           placeholder="搜索物料" autocomplete="off"
                           value="${result.materiel}"
                           class="layui-input" style="width: 133PX">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label for="js-materielName" class="layui-form-label sp-required">物料名称
                    </label>
                    <div class="layui-input-inline">
                        <input id="js-materiel-name" readonly="true" name="materielDesc" lay-verify="required"
                               autocomplete="off"
                               class="layui-input" value="${result.materielDesc}">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="js-statue" class="layui-form-label sp-required">状态
                </label>
                <div class="layui-input-block" id="js-statue" style="width: 310px;">
                    <input type="radio" name="statue" value="1" title="创建"
                           <#if !(result.id??) || (result.statue!0)?c == "1">checked</#if>>
                    <input type="radio" name="statue" value="2" title="进行中"
                           <#if (result.statue!0)?c == "2">checked</#if>>
                    <input type="radio" name="statue" value="3" title="订单结束"
                           <#if (result.statue!0)?c == "3">checked</#if>>
                    <input type="radio" name="statue" value="4" title="订单终结"
                           <#if (result.statue!0)?c == "4">checked</#if>>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">生产说明:</label>
                <div class="layui-input-block">
                    <textarea placeholder="备注.." name="remark" class="layui-textarea">${result.remark!}</textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block" style="margin-left: 120px;">
                    <input id="js-id" name="id" type="hidden" value="${result.id!}"/>
                    <button id="js-submit" class="layui-btn" lay-demotransferactive="getData" lay-submit
                            lay-filter="js-submit-filter">保存
                    </button>
                    <#if result.id?? && result.id?length gt 0>
                    <button type="button" class="layui-btn layui-btn-danger" id="js-delete-btn">删除</button>
                    </#if>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    layui.use(['form', 'util', 'layer', 'step', 'spLayer', 'spTable', 'table'], function () {
        var form = layui.form,
            spLayer = layui.spLayer,
            layer = layui.layer,
            table = layui.table;
        //监听提交
        form.on('submit(js-submit-filter)', function (data) {
            var loadIndex = layer.load(2);
            $.ajax({
                url: "${request.contextPath}/order/release/add-or-update",
                type: 'POST',
                data: data.field,
                dataType: 'json',
                success: function (res) {
                    layer.close(loadIndex);
                    if (res.code === 0) {
                        layer.msg('保存成功', {time: 1000}, function () {
                            // 关闭当前弹窗
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                            // 刷新父页面表格
                            if (parent._reloadTable) {
                                parent._reloadTable();
                            } else {
                                parent.location.reload();
                            }
                        });
                    } else {
                        layer.alert(res.msg || '保存失败', {icon: 2});
                    }
                },
                error: function () {
                    layer.close(loadIndex);
                    layer.alert('系统错误，请联系管理员', {icon: 2});
                }
            });
            return false;
        });

        /**
         * 监听行工具事件
         */
        table.on('tool(js-record-table-filter)', function (obj) {
            // 编辑
            if (obj.event === 'delete') {
                layer.confirm('确认要删除吗？', function (index) {
                    obj.del();
                    layer.close(index);
                })
            }
        })

        // 删除按钮事件
        $('#js-delete-btn').click(function () {
            var id = $('#js-id').val();
            layer.confirm('确认要删除该订单吗？此操作不可恢复。', function (confirmIndex) {
                spUtil.ajax({
                    url: '${request.contextPath}/order/release/delete',
                    type: 'POST',
                    data: {id: id},
                    success: function (res) {
                        layer.msg('删除成功');
                        // 关闭当前弹窗并刷新父页面
                        var frameIndex = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(frameIndex);
                        if (parent._reloadTable) {
                            parent._reloadTable();
                        } else {
                            parent.location.reload();
                        }
                    }
                });
                layer.close(confirmIndex);
            });
        });

        // 物料主数据搜索弹框
        $('#js-test-btn').click(function () {
            searchMaterile();
        });
        /**
         * 物料搜索功能
         * @param obj
         */
        window.searchMaterile = function (obj) {
            spLayer.open({
                type: 2,
                area: ['680px', '500px'],
                reload: false,
                content: '${request.contextPath}/admin/common/ui/searchPanelMaterile',
                // 如果是搜索弹窗，需要添加回调函数来获取选中数据
                spCallback: function (result) {
                    if (result.code === 0 && result.data.length > 0) {
                        console.log(result);
                        $('#js-materiel').val(result.data[0].materiel);
                        $('#js-materiel-name').val(result.data[0].materielDesc);

                    }
                }
            });
        }
    });


</script>
</body>
</html>
