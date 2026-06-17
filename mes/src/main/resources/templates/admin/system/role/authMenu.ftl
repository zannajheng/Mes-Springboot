<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>授权菜单</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <#include "${request.contextPath}/common/common.ftl">
<style>
    .layui-tree li {
        padding: 8px 0;
        line-height: 1.8;
    }
</style>
</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <input type="hidden" id="js-role-id" value="${roleId}">
        <div class="layui-form-item">
            <div class="layui-input-block" style="margin-left: 0;">
                <div id="js-menu-tree"></div>
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center; margin-top: 20px;">
            <button class="layui-btn layui-btn-lg" id="js-submit"><i class="layui-icon">&#xe61f;</i>保存授权</button>
        </div>
    </div>
</div>
<script>
    layui.use(['form', 'tree', 'util'], function () {
        var form = layui.form,
            tree = layui.tree,
            util = layui.util;

        var roleId = $('#js-role-id').val();
        var menuTree;

        $.ajax({
            url: '${request.contextPath}/admin/sys/menu/tree',
            type: 'GET',
            success: function (res) {
                if (res.code === 0) {
                    $.ajax({
                        url: '${request.contextPath}/admin/sys/role/menu-ids?roleId=' + roleId,
                        type: 'GET',
                        success: function (authRes) {
                            if (authRes.code === 0) {
                                var checkedIds = authRes.data || [];
                                var treeData = convertMenuData(res.data);
                                renderTree(treeData, checkedIds);
                            }
                        }
                    });
                }
            }
        });

        function convertMenuData(nodes) {
            return nodes.map(function(node) {
                var newNode = {
                    id: node.id,
                    title: node.name,
                    pid: node.pid
                };
                if (node.children && node.children.length > 0) {
                    newNode.children = convertMenuData(node.children);
                }
                return newNode;
            });
        }

        function renderTree(data, checkedIds) {
            menuTree = tree.render({
                elem: '#js-menu-tree',
                data: data,
                showCheckbox: true,
                onlyIconControl: false,
                accordion: false,
                oncheck: function (obj) {
                    var checked = obj.checked;
                    var parentNode = obj.data;
                    var children = parentNode.children || [];

                    if (checked) {
                        checkParent(parentNode);
                        checkChildren(parentNode);
                    } else {
                        uncheckChildren(parentNode);
                    }

                    function checkParent(node) {
                        if (node.pid && node.pid !== '0') {
                            var parent = getNodeById(data, node.pid);
                            if (parent) {
                                tree.setChecked('#js-menu-tree', parent.id, true);
                                checkParent(parent);
                            }
                        }
                    }

                    function checkChildren(node) {
                        if (node.children && node.children.length > 0) {
                            node.children.forEach(function (child) {
                                tree.setChecked('#js-menu-tree', child.id, true);
                                checkChildren(child);
                            });
                        }
                    }

                    function uncheckChildren(node) {
                        if (node.children && node.children.length > 0) {
                            node.children.forEach(function (child) {
                                tree.setChecked('#js-menu-tree', child.id, false);
                                uncheckChildren(child);
                            });
                        }
                    }

                    function getNodeById(nodes, id) {
                        for (var i = 0; i < nodes.length; i++) {
                            if (nodes[i].id === id) {
                                return nodes[i];
                            }
                            if (nodes[i].children) {
                                var found = getNodeById(nodes[i].children, id);
                                if (found) return found;
                            }
                        }
                        return null;
                    }
                },
                id: 'menuTreeId'
            });

            checkedIds.forEach(function (id) {
                tree.setChecked('#js-menu-tree', id, true);
            });

            setTimeout(function() {
                $('.layui-tree li i.layui-tree-iconClose').click();
            }, 100);
        }

        $('#js-submit').on('click', function() {
            saveMenuAuth();
            return false;
        });

        function saveMenuAuth() {
            var checkedData = tree.getChecked('menuTreeId');
            var menuIds = [];

            function collectIds(nodes) {
                nodes.forEach(function (node) {
                    menuIds.push(node.id);
                    if (node.children) {
                        collectIds(node.children);
                    }
                });
            }

            collectIds(checkedData);

            spUtil.ajax({
                url: '${request.contextPath}/admin/sys/role/save-menu-auth',
                type: 'POST',
                data: {
                    roleId: roleId,
                    menuIds: menuIds.join(',')
                },
                success: function (data) {
                    window.spChildFrameResult = data;
                    layer.msg('授权成功', {icon: 1});
                    setTimeout(function () {
                        parent.layer.closeAll();
                    }, 1000);
                }
            });
        }
    });
</script>
</body>
</html>