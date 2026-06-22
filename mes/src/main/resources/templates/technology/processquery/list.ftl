<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>产品工艺查询</title>
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
                <h3 class="layui-card-title">产品工艺查询</h3>
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

                <div id="js-result-container" style="display:none;">
                    <div class="layui-card">
                        <div class="layui-card-header">产品工艺结构</div>
                        <div class="layui-card-body">
                            <div class="layui-row">
                                <div class="layui-col-md4">
                                    <div id="js-tree-container" class="tree-container"></div>
                                </div>
                                <div class="layui-col-md8">
                                    <div id="js-detail-container">
                                        <div class="layui-card">
                                            <div class="layui-card-header">
                                                <h3 class="layui-card-title" id="js-node-title">请选择左侧工艺节点查看详情</h3>
                                            </div>
                                            <div class="layui-card-body" id="js-detail-content">
                                                <p class="text-center text-gray">暂无选中节点</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .tree-container {
        border: 1px solid #e6e6e6;
        border-radius: 4px;
        min-height: 400px;
        padding: 10px;
        background: #fff;
    }
    .tree-node {
        padding: 6px 0;
        cursor: pointer;
        position: relative;
    }
    .tree-node:hover {
        background: #f2f2f2;
    }
    .tree-node.active {
        background: #e8f4fc;
        border-left: 3px solid #1890ff;
    }
    .tree-node.root {
        font-weight: bold;
        font-size: 14px;
        color: #333;
        padding-left: 10px;
    }
    .tree-node.child {
        padding-left: 30px;
        font-size: 13px;
        color: #666;
    }
    .tree-node .check-icon {
        float: right;
        color: #52c41a;
        font-size: 16px;
    }
    .tree-node .no-check-icon {
        float: right;
        color: #d9d9d9;
        font-size: 16px;
    }
    .text-gray {
        color: #999;
    }
    .nav-step {
        position: relative;
        margin-bottom: 20px;
    }
    .step-items {
        display: flex;
        justify-content: space-between;
    }
    .step-item {
        flex: 1;
        text-align: center;
        cursor: pointer;
        transition: all 0.3s;
    }
    .step-item:hover .step-icon {
        transform: scale(1.1);
        background: #e6f7ff;
        color: #1890ff;
    }
    .step-item .step-icon {
        width: 50px;
        height: 50px;
        line-height: 50px;
        border-radius: 50%;
        background: #f5f5f5;
        color: #666;
        margin: 0 auto 8px;
        font-size: 22px;
        transition: all 0.3s;
        border: 2px solid transparent;
    }
    .step-item.active .step-icon {
        background: #52c41a;
        color: #fff;
        border-color: #52c41a;
        box-shadow: 0 4px 12px rgba(82, 196, 26, 0.3);
    }
    .step-item .step-name {
        font-size: 12px;
        color: #666;
        font-weight: 500;
    }
    .step-item.active .step-name {
        color: #52c41a;
        font-weight: 600;
    }
    .detail-panel {
        display: none;
        animation: fadeIn 0.3s ease;
    }
    .detail-panel.active {
        display: block;
    }
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }
    .detail-table {
        width: 100%;
        border-collapse: collapse;
        margin: 0;
    }
    .detail-table tr {
        border-bottom: 1px solid #f0f0f0;
    }
    .detail-table tr:last-child {
        border-bottom: none;
    }
    .detail-table td {
        padding: 12px 15px;
        vertical-align: top;
    }
    .detail-table td.label {
        width: 140px;
        background: #fafafa;
        font-weight: 500;
        color: #666;
        text-align: right;
        padding-right: 20px;
    }
    .detail-table td.value {
        color: #333;
        background: #fff;
    }
    .detail-content-box {
        padding: 20px;
        background: #fafafa;
        border-radius: 6px;
        min-height: 120px;
        line-height: 1.8;
        color: #333;
    }
    .empty-tip {
        text-align: center;
        color: #999;
        padding: 40px 0;
    }
    .empty-tip i {
        font-size: 48px;
        margin-bottom: 10px;
        display: block;
        opacity: 0.5;
    }
</style>

<script>
    layui.use(['form', 'layer'], function () {
        var form = layui.form,
            layer = layui.layer;

        var currentBomId = '';
        var treeData = [];
        var currentRelationId = '';

        form.on('submit(js-search-filter)', function (data) {
            currentBomId = data.field.bomId;
            if (!currentBomId) {
                layer.msg('请选择产品');
                return false;
            }
            loadBomTree();
            return false;
        });

        function loadBomTree() {
            spUtil.ajax({
                url: '${request.contextPath}/technology/process-query/bom-tree',
                type: 'GET',
                data: { bomId: currentBomId },
                success: function (res) {
                    if (res.code === 0 || res.code === 200) {
                        treeData = res.data || [];
                        if (treeData.length > 0) {
                            $('#js-result-container').show();
                            renderTree(treeData);
                        } else {
                            $('#js-result-container').hide();
                            layer.msg('该产品暂无工艺数据');
                        }
                    } else {
                        layer.msg(res.message || '查询失败');
                    }
                }
            });
        }

        function renderTree(data) {
            var html = '';
            for (var i = 0; i < data.length; i++) {
                var node = data[i];
                html += renderTreeNode(node);
            }
            $('#js-tree-container').html(html);
        }

        function renderTreeNode(node) {
            var html = '';
            var checkIcon = node.level === 0 ? '' : (node.hasContent ? '<i class="layui-icon check-icon">&#xe605;</i>' : '<i class="layui-icon no-check-icon">&#xe608;</i>');
            
            html += '<div class="tree-node ' + (node.level === 0 ? 'root' : 'child') + '" data-id="' + node.id + '" data-relation-id="' + (node.relationId || '') + '">' +
                '<span>' + node.name + '</span>' +
                '<span class="layui-badge layui-badge-primary" style="margin-left: 8px; font-size: 10px;">' + node.code + '</span>' +
                checkIcon +
                '</div>';

            if (node.children && node.children.length > 0) {
                for (var i = 0; i < node.children.length; i++) {
                    html += renderTreeNode(node.children[i]);
                }
            }
            return html;
        }

        $(document).on('click', '.tree-node', function () {
            $('.tree-node').removeClass('active');
            $(this).addClass('active');
            
            currentRelationId = $(this).data('relation-id');
            if (currentRelationId) {
                loadNodeDetail(currentRelationId);
            } else {
                showEmptyDetail();
            }
        });

        function showEmptyDetail() {
            $('#js-node-title').text('请选择左侧工艺节点查看详情');
            $('#js-detail-content').html('<p class="text-center text-gray">暂无选中节点</p>');
        }

        function loadNodeDetail(relationId) {
            spUtil.ajax({
                url: '${request.contextPath}/technology/process-query/oper-content',
                type: 'GET',
                data: { relationId: relationId },
                success: function (res) {
                    if (res.code === 0 || res.code === 200) {
                        var content = res.data;
                        if (content) {
                            renderDetail(content);
                            loadEquipment(relationId);
                            loadTechDoc(relationId);
                            loadMaterial(relationId);
                            showPanel('panel-1');
                        } else {
                            showEmptyContent();
                        }
                    }
                }
            });
        }

        function showEmptyContent() {
            $('#js-node-title').text('该节点暂无工艺内容');
            $('#js-detail-content').html('<div class="empty-tip"><i class="layui-icon">&#xe612;</i><p>该节点尚未编制工艺内容</p></div>');
        }

        function renderDetail(content) {
            var html = '';
            
            html += '<div class="nav-step">';
            html += '<div class="step-items">';
            
            var steps = [
                {key: 1, name: '工序主信息', icon: '&#xe60a;'},
                {key: 2, name: '工序内容', icon: '&#xe641;'},
                {key: 3, name: '工序要求', icon: '&#xe60b;'},
                {key: 4, name: '注意事项', icon: '&#xe60d;'},
                {key: 5, name: '工装设备', icon: '&#xe643;'},
                {key: 6, name: '主设备', icon: '&#xe643;'},
                {key: 7, name: '技术文档', icon: '&#xe616;'},
                {key: 8, name: '备料清单', icon: '&#xe63d;'}
            ];
            
            for (var i = 0; i < steps.length; i++) {
                var step = steps[i];
                html += '<div class="step-item" data-panel="panel-' + step.key + '" onclick="showPanel(\'panel-' + step.key + '\')">';
                html += '<div class="step-icon"><i class="layui-icon">' + step.icon + '</i></div>';
                html += '<div class="step-name">' + step.name + '</div>';
                html += '</div>';
            }
            
            html += '</div>';
            html += '</div>';

            html += '<div id="panel-1" class="detail-panel active">';
            html += '<table class="detail-table">';
            html += '<tr><td class="label"><strong>工序编号</strong></td><td class="value">' + (content.oper || '-') + '</td></tr>';
            html += '<tr><td class="label"><strong>工序名称</strong></td><td class="value">' + (content.operDesc || '-') + '</td></tr>';
            html += '<tr><td class="label"><strong>工序工时(h)</strong></td><td class="value">' + (content.operTime || '-') + '</td></tr>';
            html += '<tr><td class="label"><strong>制造周期(h)</strong></td><td class="value">' + (content.produceCycle || '-') + '</td></tr>';
            html += '<tr><td class="label"><strong>加工单元</strong></td><td class="value">' + (content.workCenterDesc || '-') + '</td></tr>';
            html += '<tr><td class="label"><strong>加工单元类型</strong></td><td class="value">' + (content.workCenterType || '-') + '</td></tr>';
            html += '<tr><td class="label"><strong>是否生成生产计划</strong></td><td class="value">' + (content.isProducePlan || '-') + '</td></tr>';
            html += '</table>';
            html += '</div>';

            html += '<div id="panel-2" class="detail-panel">';
            html += '<div class="detail-content-box">';
            html += content.operContent || '<span class="text-gray">暂无数据</span>';
            html += '</div>';
            
            if (content.operImages) {
                try {
                    var operImages = JSON.parse(content.operImages);
                    if (operImages && operImages.length > 0) {
                        html += '<div style="margin-top: 20px;">';
                        html += '<h4 style="margin-bottom: 8px; font-size: 14px; color: #666;">工序图片</h4>';
                        html += '<div style="display: flex; flex-wrap: wrap;">';
                        for (var j = 0; j < operImages.length; j++) {
                            var imgUrl = operImages[j];
                            html += '<div style="margin: 5px; border: 1px solid #eee; border-radius: 4px; padding: 5px; position: relative;">';
                            html += '<img src="' + imgUrl + '" onclick="viewImage(\'' + imgUrl + '\')" style="width: 120px; height: 120px; object-fit: cover; cursor: pointer;">';
                            html += '<a href="' + imgUrl + '" download style="position: absolute; bottom: 5px; right: 5px; background: rgba(0,0,0,0.6); color: #fff; padding: 2px 8px; border-radius: 3px; font-size: 12px;">下载</a>';
                            html += '</div>';
                        }
                        html += '</div>';
                        html += '</div>';
                    }
                } catch (e) {}
            }
            html += '</div>';

            html += '<div id="panel-3" class="detail-panel">';
            html += '<div class="detail-content-box">';
            html += content.operRequirement || '<span class="text-gray">暂无数据</span>';
            html += '</div>';
            
            html += '<div style="margin-top: 10px;">';
            html += '<div><strong style="color: #666;">是否需要检验：</strong>' + (content.isNeedInspect || '否') + '</div>';
            html += '</div>';
            
            if (content.inspectImages) {
                try {
                    var inspectImages = JSON.parse(content.inspectImages);
                    if (inspectImages && inspectImages.length > 0) {
                        html += '<div style="margin-top: 20px;">';
                        html += '<h4 style="margin-bottom: 8px; font-size: 14px; color: #666;">检验标准图片</h4>';
                        html += '<div style="display: flex; flex-wrap: wrap;">';
                        for (var j = 0; j < inspectImages.length; j++) {
                            var imgUrl = inspectImages[j];
                            html += '<div style="margin: 5px; border: 1px solid #eee; border-radius: 4px; padding: 5px; position: relative;">';
                            html += '<img src="' + imgUrl + '" onclick="viewImage(\'' + imgUrl + '\')" style="width: 120px; height: 120px; object-fit: cover; cursor: pointer;">';
                            html += '<a href="' + imgUrl + '" download style="position: absolute; bottom: 5px; right: 5px; background: rgba(0,0,0,0.6); color: #fff; padding: 2px 8px; border-radius: 3px; font-size: 12px;">下载</a>';
                            html += '</div>';
                        }
                        html += '</div>';
                        html += '</div>';
                    }
                } catch (e) {}
            }
            html += '</div>';

            html += '<div id="panel-4" class="detail-panel">';
            html += '<div class="detail-content-box">';
            html += content.attention || '<span class="text-gray">暂无数据</span>';
            html += '</div>';
            html += '</div>';

            html += '<div id="panel-5" class="detail-panel">';
            html += '<div id="js-equipment-content"><div class="empty-tip"><i class="layui-icon">&#xe612;</i><p>加载中...</p></div></div>';
            html += '</div>';

            html += '<div id="panel-6" class="detail-panel">';
            html += '<div class="empty-tip"><i class="layui-icon">&#xe612;</i><p>暂无数据</p></div>';
            html += '</div>';

            html += '<div id="panel-7" class="detail-panel">';
            html += '<div id="js-tech-doc-content"><div class="empty-tip"><i class="layui-icon">&#xe612;</i><p>加载中...</p></div></div>';
            html += '</div>';

            html += '<div id="panel-8" class="detail-panel">';
            html += '<div id="js-material-content"><div class="empty-tip"><i class="layui-icon">&#xe612;</i><p>加载中...</p></div></div>';
            html += '</div>';

            $('#js-node-title').text(content.nodeName || '工艺详情');
            $('#js-detail-content').html(html);
        }

        window.showPanel = function(panelId) {
            $('.step-item').removeClass('active');
            $('.step-item[data-panel="' + panelId + '"]').addClass('active');
            
            $('.detail-panel').removeClass('active');
            $('#' + panelId).addClass('active');
        };

        function loadEquipment(relationId) {
            spUtil.ajax({
                url: '${request.contextPath}/technology/process-query/equipment/list',
                type: 'GET',
                data: { relationId: relationId },
                success: function (res) {
                    if (res.code === 0 || res.code === 200) {
                        var list = res.data || [];
                        if (list.length > 0) {
                            var html = '<table class="layui-table"><thead><tr><th>设备编码</th><th>设备名称</th><th>设备型号</th><th>设备用途</th></tr></thead><tbody>';
                            for (var i = 0; i < list.length; i++) {
                                var item = list[i];
                                html += '<tr><td>' + (item.equipmentCode || '-') + '</td>';
                                html += '<td>' + (item.equipmentName || '-') + '</td>';
                                html += '<td>' + (item.equipmentModel || '-') + '</td>';
                                html += '<td>' + (item.equipmentUsage || '-') + '</td></tr>';
                            }
                            html += '</tbody></table>';
                            $('#js-equipment-content').html(html);
                        } else {
                            $('#js-equipment-content').html('<div class="empty-tip"><i class="layui-icon">&#xe612;</i><p>暂无工装设备数据</p></div>');
                        }
                    }
                }
            });
        }

        function loadTechDoc(relationId) {
            spUtil.ajax({
                url: '${request.contextPath}/technology/process-query/tech-doc/list',
                type: 'GET',
                data: { relationId: relationId },
                success: function (res) {
                    if (res.code === 0 || res.code === 200) {
                        var list = res.data || [];
                        if (list.length > 0) {
                            var html = '';
                            for (var i = 0; i < list.length; i++) {
                                var item = list[i];
                                html += '<div class="layui-card" style="margin-bottom: 15px;">';
                                html += '<div class="layui-card-header">';
                                html += '<strong>' + (item.docDesc || '技术文档') + '</strong>';
                                html += '</div>';
                                html += '<div class="layui-card-body">';
                                
                                if (item.docImages) {
                                    try {
                                        var images = JSON.parse(item.docImages);
                                        if (images && images.length > 0) {
                                            html += '<div style="margin-bottom: 15px;">';
                                            html += '<h4 style="margin-bottom: 8px; font-size: 14px; color: #666;">文档图片</h4>';
                                            html += '<div style="display: flex; flex-wrap: wrap;">';
                                            for (var j = 0; j < images.length; j++) {
                                                var imgUrl = images[j];
                                                html += '<div style="margin: 5px; border: 1px solid #eee; border-radius: 4px; padding: 5px; position: relative;">';
                                                html += '<img src="' + imgUrl + '" onclick="viewImage(\'' + imgUrl + '\')" style="width: 120px; height: 120px; object-fit: cover; cursor: pointer;">';
                                                html += '<a href="' + imgUrl + '" download style="position: absolute; bottom: 5px; right: 5px; background: rgba(0,0,0,0.6); color: #fff; padding: 2px 8px; border-radius: 3px; font-size: 12px;">下载</a>';
                                                html += '</div>';
                                            }
                                            html += '</div>';
                                            html += '</div>';
                                        }
                                    } catch (e) {}
                                }
                                
                                if (item.docFiles) {
                                    try {
                                        var files = JSON.parse(item.docFiles);
                                        if (files && files.length > 0) {
                                            html += '<div>';
                                            html += '<h4 style="margin-bottom: 8px; font-size: 14px; color: #666;">附件文件</h4>';
                                            html += '<div style="display: flex; flex-wrap: wrap;">';
                                            for (var j = 0; j < files.length; j++) {
                                                var file = files[j];
                                                var ext = (file.name || '').substring((file.name || '').lastIndexOf('.') + 1).toLowerCase();
                                                var iconClass = 'fa-file-o';
                                                var colorClass = '#7f8c8d';
                                                if (ext === 'pdf') { iconClass = 'fa-file-pdf-o'; colorClass = '#e74c3c'; }
                                                else if (ext === 'doc' || ext === 'docx') { iconClass = 'fa-file-word-o'; colorClass = '#2980b9'; }
                                                else if (ext === 'xls' || ext === 'xlsx') { iconClass = 'fa-file-excel-o'; colorClass = '#27ae60'; }
                                                else if (ext === 'ppt' || ext === 'pptx') { iconClass = 'fa-file-powerpoint-o'; colorClass = '#e67e22'; }
                                                else if (ext === 'zip' || ext === 'rar') { iconClass = 'fa-file-archive-o'; colorClass = '#f39c12'; }
                                                else if (ext === 'txt') { iconClass = 'fa-file-text-o'; colorClass = '#95a5a6'; }
                                                html += '<a href="' + file.url + '" target="_blank" style="display: inline-block; padding: 10px 15px; border: 1px solid #eee; border-radius: 4px; margin: 5px; background: #f8f8f8; min-width: 120px; text-align: center; text-decoration: none;">';
                                                html += '<i class="fa ' + iconClass + '" style="font-size: 32px; display: block; margin-bottom: 6px; color: ' + colorClass + ';"></i>';
                                                html += '<span style="display: block; font-size: 12px; word-break: break-all; max-width: 150px; line-height: 1.4; color: #333;">' + (file.name || '文件') + '</span>';
                                                html += '</a>';
                                            }
                                            html += '</div>';
                                            html += '</div>';
                                        }
                                    } catch (e) {}
                                }
                                
                                if (!item.docImages && !item.docFiles) {
                                    html += '<div class="empty-tip" style="padding: 20px 0;"><i class="layui-icon">&#xe612;</i><p>暂无图片和附件</p></div>';
                                }
                                
                                html += '</div>';
                                html += '</div>';
                            }
                            $('#js-tech-doc-content').html(html);
                        } else {
                            $('#js-tech-doc-content').html('<div class="empty-tip"><i class="layui-icon">&#xe612;</i><p>暂无技术文档数据</p></div>');
                        }
                    }
                }
            });
        }

        function loadMaterial(relationId) {
            spUtil.ajax({
                url: '${request.contextPath}/technology/process-query/material/list',
                type: 'GET',
                data: { relationId: relationId },
                success: function (res) {
                    if (res.code === 0 || res.code === 200) {
                        var list = res.data || [];
                        if (list.length > 0) {
                            var html = '<table class="layui-table"><thead><tr><th>物料编码</th><th>物料名称</th><th>物料规格</th><th>物料类型</th><th>需求数量</th></tr></thead><tbody>';
                            for (var i = 0; i < list.length; i++) {
                                var item = list[i];
                                html += '<tr><td>' + (item.materielCode || '-') + '</td>';
                                html += '<td>' + (item.materielName || '-') + '</td>';
                                html += '<td>' + (item.materielSpec || '-') + '</td>';
                                html += '<td>' + (item.materielType || '-') + '</td>';
                                html += '<td>' + (item.requireQty || '1') + '</td></tr>';
                            }
                            html += '</tbody></table>';
                            $('#js-material-content').html(html);
                        } else {
                            $('#js-material-content').html('<div class="empty-tip"><i class="layui-icon">&#xe612;</i><p>暂无备料清单数据</p></div>');
                        }
                    }
                }
            });
        }

        window.viewImage = function(imgUrl) {
            layer.open({
                type: 1,
                title: '查看大图',
                area: ['80%', '80%'],
                shadeClose: true,
                content: '<div style="text-align: center; padding: 20px; background: #000;">' +
                    '<img src="' + imgUrl + '" style="max-width: 100%; max-height: 100%;" />' +
                    '</div>',
                btn: ['下载图片', '关闭'],
                yes: function(index) {
                    var a = document.createElement('a');
                    a.href = imgUrl;
                    a.download = imgUrl.substring(imgUrl.lastIndexOf('/') + 1);
                    document.body.appendChild(a);
                    a.click();
                    document.body.removeChild(a);
                },
                btn2: function(index) {
                    layer.close(index);
                }
            });
        };

        form.render();
    });
</script>
</body>
</html>