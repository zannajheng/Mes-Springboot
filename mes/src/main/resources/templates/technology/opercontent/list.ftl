<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>工艺内容编制</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <#include "${request.contextPath}/common/common.ftl">
</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <div class="layui-card">
            <div class="layui-card-header">
                <h3 class="layui-card-title">工艺内容编制</h3>
            </div>
            <div class="layui-card-body">
                <form id="js-search-form" class="layui-form" lay-filter="js-q-form-filter">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">选择产品</label>
                            <div class="layui-input-inline">
                                <select id="js-bom-select" name="bomId" lay-verify="required" lay-search>
                                    <option value="">请选择产品BOM</option>
                                    <#list bomList as bom>
                                        <option value="${bom.id}">${bom.materielDesc} (${bom.bomCode})</option>
                                    </#list>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <a class="layui-btn" lay-submit lay-filter="js-search-filter">查询</a>
                        </div>
                    </div>
                </form>

                <div id="js-relation-container" style="display:none;">
                    <div class="layui-card">
                        <div class="layui-card-header">可编制的工艺节点</div>
                        <div class="layui-card-body">
                            <table class="layui-table">
                                <thead>
                                <tr>
                                    <th>节点名称</th>
                                    <th>工序编号</th>
                                    <th>工序名称</th>
                                    <th>加工单元</th>
                                    <th>工时(h)</th>
                                    <th>周期(h)</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id="js-relation-body">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/html" id="js-status-tpl">
    {{# if(d.status == 'completed'){ }}
    <span class="layui-badge layui-bg-green">已完成</span>
    {{# } else if(d.status == 'draft'){ }}
    <span class="layui-badge layui-bg-orange">编辑中</span>
    {{# } else { }}
    <span class="layui-badge layui-bg-gray">未编制</span>
    {{# } }}
</script>

<script>
    layui.use(['form', 'table', 'layer'], function () {
        var form = layui.form,
            table = layui.table,
            layer = layui.layer;

        var currentBomId = '';

        form.on('submit(js-search-filter)', function (data) {
            currentBomId = data.field.bomId;
            if (!currentBomId) {
                layer.msg('请选择产品');
                return false;
            }
            loadRelations();
            return false;
        });

        function loadRelations() {
            spUtil.ajax({
                url: '${request.contextPath}/technology/oper-content/locked-relations',
                type: 'GET',
                data: { bomId: currentBomId },
                success: function (res) {
                    if (res.code === 0 || res.code === 200) {
                        var relations = res.data;
                        if (relations && relations.length > 0) {
                            $('#js-relation-container').show();
                            renderRelationTable(relations);
                        } else {
                            $('#js-relation-container').hide();
                            layer.msg('该产品暂无已锁定的工艺路线，请先在"工艺流程管理"中锁定工艺');
                        }
                    } else {
                        layer.msg(res.message || '查询失败');
                    }
                }
            });
        }

        function renderRelationTable(relations) {
            spUtil.ajax({
                url: '${request.contextPath}/technology/oper-content/list-by-bom',
                type: 'GET',
                data: { bomId: currentBomId },
                success: function (res) {
                    var contents = res.data || [];
                    var html = '';
                    for (var i = 0; i < relations.length; i++) {
                        var rel = relations[i];
                        var content = null;
                        for (var j = 0; j < contents.length; j++) {
                            if (contents[j].bomOperRelationId === rel.id) {
                                content = contents[j];
                                break;
                            }
                        }
                        var status = content ? content.status : '';
                        var statusText = '';
                        var statusClass = '';
                        var btnText = '开始编制';
                        if (status === 'completed') {
                            statusText = '已完成';
                            statusClass = 'layui-bg-green';
                            btnText = '查看编制';
                        } else if (status === 'draft') {
                            statusText = '编辑中';
                            statusClass = 'layui-bg-orange';
                            btnText = '继续编辑';
                        } else {
                            statusText = '未编制';
                            statusClass = 'layui-bg-gray';
                            btnText = '开始编制';
                        }
                        html += '<tr>' +
                            '<td>' + rel.nodeName + '</td>' +
                            '<td>' + (rel.oper || '') + '</td>' +
                            '<td>' + (rel.operDesc || '') + '</td>' +
                            '<td>' + (rel.workCenterDesc || '') + '</td>' +
                            '<td>' + (rel.operTime || '') + '</td>' +
                            '<td>' + (rel.produceCycle || '') + '</td>' +
                            '<td><span class="layui-badge ' + statusClass + '">' + statusText + '</span></td>' +
                            '<td>' +
                            '<a class="layui-btn layui-btn-xs" onclick="startEdit(\'' + rel.id + '\')">' + btnText + '</a>' +
                            '<a class="layui-btn layui-btn-xs layui-btn-danger" onclick="deleteNode(\'' + rel.id + '\')">删除</a>' +
                            '</td>' +
                            '</tr>';
                    }
                    $('#js-relation-body').html(html);
                }
            });
        }

        window.startEdit = function (bomOperRelationId) {
            layer.open({
                type: 2,
                title: '工艺内容编制',
                area: ['90%', '90%'],
                content: '${request.contextPath}/technology/oper-content/edit-ui?bomOperRelationId=' + bomOperRelationId,
                end: function () {
                    loadRelations();
                }
            });
        };

        window.deleteNode = function (bomOperRelationId) {
            layer.confirm('确认删除该工艺节点的编制内容吗？删除后不可恢复。', function (index) {
                spUtil.ajax({
                    url: '${request.contextPath}/technology/oper-content/delete-by-relation',
                    type: 'POST',
                    data: { bomOperRelationId: bomOperRelationId },
                    success: function (res) {
                        if (res.code === 200 || res.code === 0) {
                            layer.msg('删除成功');
                            loadRelations();
                        } else {
                            layer.msg(res.message || '删除失败');
                        }
                    }
                });
                layer.close(index);
            });
        };

        form.render();
    });
</script>
</body>
</html>
