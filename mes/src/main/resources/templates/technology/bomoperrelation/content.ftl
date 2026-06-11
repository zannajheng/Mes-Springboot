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
                <h3 class="layui-card-title">工艺内容编制 - ${bom.materielDesc}</h3>
            </div>
            <div class="layui-card-body">
                <div class="layui-tab layui-tab-card">
                    <ul class="layui-tab-title">
                        <li class="layui-this">工艺路线概览</li>
                        <li>工序详情</li>
                    </ul>
                    <div class="layui-tab-content">
                        <!--工艺路线概览-->
                        <div class="layui-tab-item layui-show">
                            <table class="layui-table">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>节点名称</th>
                                    <th>工序名称</th>
                                    <th>加工单元</th>
                                    <th>工序工时(h)</th>
                                    <th>制造周期(h)</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list relations as relation>
                                    <tr>
                                        <td>${relation.sortNum!}</td>
                                        <td>${relation.nodeName!}</td>
                                        <td>${relation.operDesc!}</td>
                                        <td>${relation.workCenterDesc!}</td>
                                        <td>${relation.operTime!}</td>
                                        <td>${relation.produceCycle!}</td>
                                        <td>
                                            <a class="layui-btn layui-btn-xs" href="javascript:void(0);" onclick="showDetail('${relation.id}')">工艺内容编制</a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>

                        <!--工序详情-->
                        <div class="layui-tab-item">
                            <form class="layui-form" id="js-content-form" style="margin-top: 20px;">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">选择工序</label>
                                    <div class="layui-input-inline">
                                        <select id="js-oper-select" lay-search>
                                            <option value="">请选择工序</option>
                                            <#list relations as relation>
                                                <option value="${relation.id}">${relation.nodeName!} - ${relation.operDesc!}</option>
                                            </#list>
                                        </select>
                                    </div>
                                </div>

                                <div id="js-content-detail" style="display: none;">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">工艺编号</label>
                                        <div class="layui-input-inline">
                                            <input type="text" name="processCode" class="layui-input" placeholder="请输入工艺编号">
                                        </div>
                                    </div>

                                    <div class="layui-form-item">
                                        <label class="layui-form-label">工艺描述</label>
                                        <div class="layui-input-block">
                                            <textarea name="processDesc" class="layui-textarea" placeholder="请输入工艺描述" style="width: 500px;"></textarea>
                                        </div>
                                    </div>

                                    <div class="layui-form-item">
                                        <label class="layui-form-label">操作说明</label>
                                        <div class="layui-input-block">
                                            <textarea name="operationNote" class="layui-textarea" placeholder="请输入操作说明" style="width: 500px; height: 200px;"></textarea>
                                        </div>
                                    </div>

                                    <div class="layui-form-item">
                                        <label class="layui-form-label">质量要求</label>
                                        <div class="layui-input-block">
                                            <textarea name="qualityReq" class="layui-textarea" placeholder="请输入质量要求" style="width: 500px; height: 150px;"></textarea>
                                        </div>
                                    </div>

                                    <div class="layui-form-item">
                                        <div class="layui-input-block" style="margin-left: 120px;">
                                            <button class="layui-btn" lay-submit lay-filter="js-submit"><i class="layui-icon">&#xe605;</i>保存工艺内容</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    layui.use(['form', 'layer'], function () {
        var form = layui.form,
            layer = layui.layer;

        // 工序选择切换显示详情
        form.on('select(js-oper-select)', function (data) {
            if (data.value) {
                $('#js-content-detail').show();
            } else {
                $('#js-content-detail').hide();
            }
        });

        // 保存工艺内容
        form.on('submit(js-submit)', function (data) {
            layer.msg('工艺内容保存成功', {icon: 1});
            return false;
        });

        form.render();
    });

    // 工艺路线概览-编制入口
    function showDetail(id) {
        layui.use(['layer'], function () {
            var layer = layui.layer;
            $('.layui-tab-title li:eq(1)').trigger('click');
            $('#js-oper-select').val(id);
            $('#js-content-detail').show();
            layui.form.render('select');
        });
    }
</script>
</body>
</html>
