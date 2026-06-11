<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>维护BOM信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <#include "${request.contextPath}/common/common.ftl">
</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <form class="layui-form splayui-form" style="margin: 0 auto;padding-top: 40px;">
            <div style="max-width: 460px;">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="js-bomCode" class="layui-form-label sp-required">BOM编码
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-bomCode" name="bomCode" lay-verify="required"
                                   autocomplete="off"
                                   class="layui-input" value="${result.bomCode}">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="js-materielCode" class="layui-form-label sp-required">物料编码
                    </label>
                    <div style="display: flex;   flex-direction: row;">
                        <button type="button" id="js-test-btn" class="layui-btn" style="height:37px "><i
                                    class="layui-icon layui-icon-search "></i>
                        </button>
                        <input id="js-materiel-code" name="materielCode" readonly="true" lay-verify="required"
                               placeholder="搜索物料" autocomplete="off"
                               value="${result.materielCode}"
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
                    <div class="layui-inline">
                        <label for="js-version-number" class="layui-form-label sp-required">版本号
                        </label>
                        <div style="display: flex;   flex-direction: row;">
                            <input type="text" id="js-versionNumber" readonly="true" name="versionNumber"
                                   lay-verify="required"
                                   autocomplete="off"
                                   class="layui-input"
                                   {value="${result.versionNumber}" | value='1' style=" width: 163PX;" }>
                            <div style="display: flex;   flex-direction: column;">
                                <div style="display: flex">
                                    <button onclick="FN('plus')" type="button" style="height: 19PX"
                                            class="layui-btn  layui-btn-xs"><i
                                                class="layui-icon layui-icon-up"></i>
                                    </button>
                                </div>
                                <div style="display: flex">
                                    <button onclick="FN('minus')" type="button" style="height: 19PX"
                                            class="layui-btn  layui-btn-xs"><i
                                                class="layui-icon layui-icon-down"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="js-is-deleted" class="layui-form-label sp-required">状态
                    </label>
                    <div class="layui-input-block" id="js-is-deleted" style="width: 310px;">
                        <input type="radio" name="deleted" value="0" title="正常"
                               <#if result.deleted == "0" || !(result??)>checked</#if>>
                        <input type="radio" name="deleted" value="1" title="已删除"
                               <#if result.deleted == "1">checked</#if>>
                        <input type="radio" name="deleted" value="2" title="已禁用"
                               <#if result.deleted == "2">checked</#if>>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">备注说明:</label>
                    <div class="layui-input-block">
                        <textarea placeholder="BOM备注" name="remark" value="${result.remark}"
                                  class="layui-textarea"></textarea>
                    </div>
                </div>
            </div>

            <!-- BOM子项管理 -->
            <div class="layui-row">
                <div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
                    <div class="box-between">
                        <div class="box-between-item">
                            <label class="layui-form-label" style="width: 120px;">
                                BOM子项(共 <span id="js-item-count">0</span> 项)
                            </label>
                        </div>
                        <div class="box-between-item">
                            <div style="margin: 4px 20px 0px 0px;">
                                <button id="js-item-add" type="button"
                                        class="layui-btn layui-btn-normal layui-btn-xs">
                                    <i class="layui-icon layui-icon-add-circle"></i> 添加
                                </button>
                                <button id="js-item-del" type="button"
                                        class="layui-btn layui-btn-normal layui-btn-xs">
                                    <i class="layui-icon layui-icon-delete"></i> 删除
                                </button>
                            </div>
                        </div>
                    </div>
                    <div id="js-item-list" style="margin: 15px 0px 30px 0px;"></div>
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

<!-- 子项行模板 -->
<script id="js-item-tpl" type="text/html">
    <div id="js-item-row-{{d.index}}" class="layui-form-item" data-index="{{d.index}}">
        <div class="layui-input-inline" style="width: 30px; margin-left: 10px;">
            <input type="checkbox" name="itemDelFlag" value="{{d.index}}" lay-skin="primary" title="">
        </div>
        <input type="hidden" name="itemId" value="{{d.id}}">
        <div class="layui-input-inline" style="width: 120px;">
            <input type="text" name="itemCode" class="layui-input" placeholder="物料编码" value="{{d.materielItemCode}}">
        </div>
        <div class="layui-input-inline" style="width: 150px;">
            <input type="text" name="itemDesc" class="layui-input" placeholder="物料描述" value="{{d.materielItemDesc}}">
        </div>
        <div class="layui-input-inline" style="width: 60px;">
            <input type="text" name="lineNo" class="layui-input" placeholder="行号" value="{{d.lineNo}}">
        </div>
        <div class="layui-input-inline" style="width: 70px;">
            <input type="number" name="itemNum" class="layui-input" placeholder="数量" value="{{d.itemNum}}">
        </div>
        <div class="layui-input-inline" style="width: 60px;">
            <input type="text" name="itemUnit" class="layui-input" placeholder="单位" value="{{d.itemUnit}}">
        </div>
    </div>
</script>

<script>
    layui.use(['form', 'util', 'layer', 'step', 'spLayer', 'spTable', 'table', 'laytpl'], function () {
        var form = layui.form,
            spLayer = layui.spLayer,
            layer = layui.layer,
            table = layui.table,
            laytpl = layui.laytpl;

        // 子项数据管理
        var itemIndex = 0;
        var itemIdArr = [];

        // 渲染现有子项
        <#if bomItems??>
        <#list bomItems as item>
        itemIdArr.push(itemIndex);
        var html = renderItemRow({
            index: itemIndex,
            id: '${item.id!}',
            materielItemCode: '${item.materielItemCode!}',
            materielItemDesc: '${item.materielItemDesc!}',
            lineNo: '${item.lineNo!}',
            itemNum: '${item.itemNum!}',
            itemUnit: '${item.itemUnit!}'
        });
        $('#js-item-list').append(html);
        itemIndex++;
        </#list>
        </#if>
        updItemCount();
        form.render();

        // 添加子项
        $('#js-item-add').click(function () {
            var html = renderItemRow({
                index: itemIndex,
                id: '',
                materielItemCode: '',
                materielItemDesc: '',
                lineNo: '',
                itemNum: '',
                itemUnit: ''
            });
            $('#js-item-list').append(html);
            itemIdArr.push(itemIndex);
            itemIndex++;
            updItemCount();
            form.render();
        });

        // 删除选中子项
        $('#js-item-del').click(function () {
            $("input:checkbox[name='itemDelFlag']:checked").each(function () {
                var idx = parseInt($(this).val());
                var pos = itemIdArr.indexOf(idx);
                if (pos > -1) {
                    itemIdArr.splice(pos, 1);
                }
                $('#js-item-row-' + idx).remove();
            });
            updItemCount();
        });

        function renderItemRow(data) {
            var html;
            var tpl = document.getElementById('js-item-tpl').innerHTML;
            laytpl(tpl).render(data, function (h) { html = h; });
            return html;
        }

        function updItemCount() {
            $('#js-item-count').html(itemIdArr.length);
        }

        function collectItemData() {
            var items = [];
            $.each(itemIdArr, function (i, idx) {
                var row = $('#js-item-row-' + idx);
                if (row.length > 0) {
                    items.push({
                        id: row.find('input[name="itemId"]').val(),
                        materielItemCode: row.find('input[name="itemCode"]').val(),
                        materielItemDesc: row.find('input[name="itemDesc"]').val(),
                        lineNo: row.find('input[name="lineNo"]').val(),
                        itemNum: row.find('input[name="itemNum"]').val(),
                        itemUnit: row.find('input[name="itemUnit"]').val()
                    });
                }
            });
            return items;
        }

        // 监听提交
        form.on('submit(js-submit-filter)', function (data) {
            var items = collectItemData();
            data.field.spBomItems = items;
            spUtil.submitForm({
                contentType: 'application/json',
                url: "${request.contextPath}/technology/bom/add-or-update",
                data: JSON.stringify(data.field)
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
                        $('#js-materiel-code').val(result.data[0].materiel);
                        $('#js-materiel-name').val(result.data[0].materielDesc);
                    }
                }
            });
        }
    });

    //版本号
    function FN(btnType) {
        var versionNumber = $('#js-versionNumber')
        if (btnType == 'plus') {
            versionNumber.val(parseInt(versionNumber.val()) + 1);
        } else if (btnType == 'minus') {
            versionNumber.val(parseInt(versionNumber.val()) - 1);
            if (parseInt(versionNumber.val()) <= 0) {
                versionNumber.val('1')
                layer.alert('版本号最小为1', {
                    icon: 2
                });
            }
        }
    }

</script>
</body>
</html>
