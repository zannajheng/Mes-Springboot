<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑工艺规划</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <#include "${request.contextPath}/common/common.ftl">
    <style>
        .mt20 {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <div class="layui-card">
            <div class="layui-card-header">
                <h3 class="layui-card-title">编辑工艺规划 - ${bom.materielDesc}</h3>
                <span class="layui-badge ${isLocked ? 'layui-bg-red' : 'layui-bg-green'}">${isLocked ? '已锁定' : '未锁定'}</span>
            </div>
            <div class="layui-card-body">
                <div class="layui-row layui-col-space15">
                    <!--产品BOM结构-->
                    <div class="layui-col-md5">
                        <div class="layui-card">
                            <div class="layui-card-header">产品BOM结构</div>
                            <div class="layui-card-body" style="max-height: 400px; overflow-y: auto;">
                                <table class="layui-table">
                                    <thead>
                                    <tr>
                                        <th>节点名称</th>
                                        <th>节点层级</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#list bomItems as item>
                                        <tr>
                                            <td>${item.materielItemDesc}</td>
                                            <td>${item.lineNo!0}</td>
                                        </tr>
                                    </#list>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!--工序定义管理-->
                    <div class="layui-col-md7">
                        <div class="layui-card">
                            <div class="layui-card-header">工序定义管理</div>
                            <div class="layui-card-body" style="max-height: 400px; overflow-y: auto;">
                                <table class="layui-table">
                                    <thead>
                                    <tr>
                                        <th>工序编号</th>
                                        <th>工序名称</th>
                                        <th>加工单元</th>
                                        <th>工时(h)</th>
                                        <th>周期(h)</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#list operList as oper>
                                        <tr>
                                            <td>${oper.oper}</td>
                                            <td>${oper.operDesc}</td>
                                            <td>${oper.workCenterDesc}</td>
                                            <td>${oper.operTime}</td>
                                            <td>${oper.produceCycle}</td>
                                        </tr>
                                    </#list>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!--工艺规划配置-->
                <div class="layui-card mt20">
                    <div class="layui-card-header">工艺规划配置</div>
                    <div class="layui-card-body">
                        <form class="layui-form" id="js-config-form">
                            <input type="hidden" name="bomId" value="${bom.id}">
                            <div style="overflow-x: auto;">
                                <table class="layui-table">
                                    <thead>
                                    <tr>
                                        <th style="min-width: 120px;">节点名称</th>
                                        <th style="min-width: 100px;">工序编号</th>
                                        <th style="min-width: 100px;">工序名称</th>
                                        <th style="min-width: 100px;">加工单元</th>
                                        <th style="min-width: 80px;">工时(h)</th>
                                        <th style="min-width: 80px;">周期(h)</th>
                                        <th style="min-width: 80px;">排序号</th>
                                        <th style="width: 60px;">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="js-config-body">
                                    <#list relations as relation>
                                        <tr>
                                            <td>${relation.nodeName}</td>
                                            <td>
                                                <select name="operIds" data-id="${relation.id}" lay-search>
                                                    <option value="">请选择工序</option>
                                                    <#list operList as oper>
                                                        <option value="${oper.id}" ${oper.id == relation.operId ? 'selected' : ''}>${oper.oper}</option>
                                                    </#list>
                                                </select>
                                            </td>
                                            <td><input type="text" name="operDescs" value="${relation.operDesc!}" class="layui-input" readonly></td>
                                            <td><input type="text" name="workCenters" value="${relation.workCenterDesc!}" class="layui-input" readonly></td>
                                            <td><input type="text" name="operTimes" value="${relation.operTime!}" class="layui-input" readonly></td>
                                            <td><input type="text" name="produceCycles" value="${relation.produceCycle!}" class="layui-input" readonly></td>
                                            <td><input type="number" name="sortNums" value="${relation.sortNum!}" class="layui-input"></td>
                                            <td>
                                                <button type="button" class="layui-btn layui-btn-xs layui-btn-danger js-remove-row"><i class="layui-icon">&#xe640;</i></button>
                                            </td>
                                        </tr>
                                    </#list>
                                    </tbody>
                                </table>
                            </div>
                            <div class="layui-form-item" style="margin-top: 15px;">
                                <div class="layui-input-block">
                                    <button type="button" class="layui-btn layui-btn-normal" id="js-add-row"><i class="layui-icon">&#xe61f;</i>添加行</button>
                                    <button class="layui-btn" lay-submit lay-filter="js-submit"><i class="layui-icon">&#xe605;</i>保存配置</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    layui.use(['form', 'layer', 'spUtil'], function () {
        var form = layui.form,
            layer = layui.layer,
            spUtil = layui.spUtil;

        var operList = [
            <#list operList as oper>
            {id: '${oper.id}', oper: '${oper.oper}', operDesc: '${oper.operDesc}', workCenterDesc: '${oper.workCenterDesc}', operTime: '${oper.operTime}', produceCycle: '${oper.produceCycle}'}<#if oper_has_next>,</#if>
            </#list>
        ];

        var bomItems = [
            <#list bomItems as item>
            {id: '${item.id}', materielItemDesc: '${item.materielItemDesc}'}<#if item_has_next>,</#if>
            </#list>
        ];

        // 工序选择联动
        form.on('select', function (data) {
            var selectElem = $(data.elem);
            var operId = data.value;
            var row = selectElem.closest('tr');

            if (operId) {
                var oper = operList.find(function (o) {
                    return o.id === operId;
                });
                if (oper) {
                    row.find('input[name="operDescs"]').val(oper.operDesc);
                    row.find('input[name="workCenters"]').val(oper.workCenterDesc);
                    row.find('input[name="operTimes"]').val(oper.operTime);
                    row.find('input[name="produceCycles"]').val(oper.produceCycle);
                }
            } else {
                row.find('input[name="operDescs"]').val('');
                row.find('input[name="workCenters"]').val('');
                row.find('input[name="operTimes"]').val('');
                row.find('input[name="produceCycles"]').val('');
            }
        });

        // 添加行
        $('#js-add-row').click(function () {
            var newRow = '<tr>' +
                '<td><select name="nodeNames" lay-search>' +
                '<option value="">请选择节点</option>' +
                bomItems.map(function (item) {
                    return '<option value="' + item.id + '">' + item.materielItemDesc + '</option>';
                }).join('') +
                '</select></td>' +
                '<td><select name="operIds" lay-search>' +
                '<option value="">请选择工序</option>' +
                operList.map(function (oper) {
                    return '<option value="' + oper.id + '">' + oper.oper + '</option>';
                }).join('') +
                '</select></td>' +
                '<td><input type="text" name="operDescs" class="layui-input" readonly></td>' +
                '<td><input type="text" name="workCenters" class="layui-input" readonly></td>' +
                '<td><input type="text" name="operTimes" class="layui-input" readonly></td>' +
                '<td><input type="text" name="produceCycles" class="layui-input" readonly></td>' +
                '<td><input type="number" name="sortNums" value="' + ($('#js-config-body tr').length + 1) + '" class="layui-input"></td>' +
                '<td><button type="button" class="layui-btn layui-btn-xs layui-btn-danger js-remove-row"><i class="layui-icon">&#xe640;</i></button></td>' +
                '</tr>';
            $('#js-config-body').append(newRow);
            form.render();
        });

        // 删除行
        $(document).on('click', '.js-remove-row', function () {
            $(this).closest('tr').remove();
        });

        // 保存配置
        form.on('submit(js-submit)', function (data) {
            var relations = [];
            $('#js-config-body tr').each(function () {
                var row = $(this);
                var relation = {
                    id: row.find('select[name="operIds"]').data('id') || null,
                    bomId: $('input[name="bomId"]').val(),
                    bomItemId: row.find('select[name="nodeNames"]').val(),
                    nodeName: row.find('select[name="nodeNames"] option:selected').text(),
                    operId: row.find('select[name="operIds"]').val(),
                    oper: row.find('select[name="operIds"] option:selected').text(),
                    operDesc: row.find('input[name="operDescs"]').val(),
                    workCenterDesc: row.find('input[name="workCenters"]').val(),
                    operTime: parseFloat(row.find('input[name="operTimes"]').val()) || 0,
                    produceCycle: parseFloat(row.find('input[name="produceCycles"]').val()) || 0,
                    sortNum: parseInt(row.find('input[name="sortNums"]').val()) || 0,
                    isLocked: '0'
                };
                relations.push(relation);
            });

            spUtil.ajax({
                url: '${request.contextPath}/technology/bom-oper-relation/save-batch',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(relations),
                showLoading: true,
                success: function (res) {
                    layer.msg('保存成功');
                    setTimeout(function () {
                        parent.layer.closeAll();
                    }, 1000);
                }
            });
            return false;
        });

        form.render();
    });
</script>
</body>
</html>
