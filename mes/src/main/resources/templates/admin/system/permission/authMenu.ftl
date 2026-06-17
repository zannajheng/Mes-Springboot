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
    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
        overflow: hidden;
    }
    .auth-menu-container {
        height: 100%;
        display: flex;
        flex-direction: column;
        padding: 15px;
        box-sizing: border-box;
    }
    .menu-tree-wrapper {
        flex: 1;
        overflow-y: auto;
        overflow-x: hidden;
        border: 1px solid #e6e6e6;
        border-radius: 4px;
        padding: 8px;
        background: #fff;
    }
    .menu-tree-wrapper::-webkit-scrollbar {
        width: 8px;
    }
    .menu-tree-wrapper::-webkit-scrollbar-track {
        background: #f5f5f5;
        border-radius: 4px;
    }
    .menu-tree-wrapper::-webkit-scrollbar-thumb {
        background: #d9d9d9;
        border-radius: 4px;
    }
    .menu-tree-wrapper::-webkit-scrollbar-thumb:hover {
        background: #bfbfbf;
    }
    .menu-tree-wrapper {
        scrollbar-width: thin;
        scrollbar-color: #d9d9d9 #f5f5f5;
    }
    .layui-tree li {
        padding: 5px 0;
        line-height: 1.6;
    }
    .layui-tree .layui-tree-txt {
        padding-left: 4px;
    }
    .layui-tree .layui-tree-icon {
        display: none !important;
    }
</style>
</head>
<body>
<div class="auth-menu-container">
    <input type="hidden" id="js-role-id" value="${roleId}">
    <div class="menu-tree-wrapper">
        <div id="js-menu-tree"></div>
    </div>
</div>
<script>
    layui.use(['form', 'tree', 'util'], function () {
        var form = layui.form,
            tree = layui.tree,
            util = layui.util;

        var roleId = $('#js-role-id').val();
        var originalTreeData = [];

        $.ajax({
            url: '${request.contextPath}/admin/list/index/menu/tree',
            type: 'GET',
            success: function (res) {
                if (res.code === 0) {
                    $.ajax({
                        url: '${request.contextPath}/admin/sys/permission/menu-ids?roleId=' + roleId,
                        type: 'GET',
                        success: function (authRes) {
                            if (authRes.code === 0) {
                                var checkedIds = authRes.data || [];
                                var menuInfo = res.data.menuInfo || {};
                                for (var key in menuInfo) {
                                    if (menuInfo.hasOwnProperty(key)) {
                                        originalTreeData.push(convertMenuTree(menuInfo[key]));
                                    }
                                }
                                renderTree(originalTreeData, checkedIds);
                            }
                        },
                        error: function(xhr, status, error) {
                            console.error('获取已授权菜单失败:', error);
                            renderTree(originalTreeData, []);
                        }
                    });
                }
            },
            error: function(xhr, status, error) {
                console.error('获取菜单树失败:', error);
            }
        });

        function convertMenuTree(node) {
            var title = node.name;
            if (node.icon && node.icon !== '') {
                var iconHtml = '<i class="' + node.icon + '" style="margin-right: 5px;"></i>';
                title = iconHtml + title;
            }
            var newNode = {
                id: node.id,
                title: title,
                pid: node.pid,
                spread: true
            };
            if (node.children && node.children.length > 0) {
                newNode.children = node.children.map(function(child) {
                    return convertMenuTree(child);
                });
            }
            return newNode;
        }

        function renderTree(data, checkedIds) {
            tree.render({
                elem: '#js-menu-tree',
                data: data,
                showCheckbox: true,
                onlyIconControl: false,
                accordion: false,
                oncheck: function (obj) {
                    var checked = obj.checked;
                    var parentNode = obj.data;

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

            setTimeout(function() {
                checkedIds.forEach(function (id) {
                    tree.setChecked('#js-menu-tree', id, true);
                });
            }, 200);
        }

        window.saveMenuAuth = function() {
            var checkedData = tree.getChecked('menuTreeId');
            var menuIds = [];

            function collectIds(nodes) {
                nodes.forEach(function (node) {
                    if (node.id && node.id !== '0') {
                        menuIds.push(node.id);
                    }
                    if (node.children) {
                        collectIds(node.children);
                    }
                });
            }

            collectIds(checkedData);

            $.ajax({
                url: '${request.contextPath}/admin/sys/permission/save-menu-auth',
                type: 'POST',
                data: {
                    roleId: roleId,
                    menuIds: menuIds.join(',')
                },
                success: function (data) {
                    if (data.code === 0) {
                        layer.msg('授权成功', {icon: 1});
                        setTimeout(function () {
                            if (parent.$) {
                                parent.$('body').css('overflow', 'auto');
                            }
                            parent.layer.closeAll();
                            if (parent.location) {
                                parent.location.reload();
                            }
                        }, 1000);
                    } else {
                        layer.msg('授权失败: ' + (data.msg || '未知错误'), {icon: 5});
                    }
                },
                error: function(xhr, status, error) {
                    layer.msg('授权失败: ' + error, {icon: 5});
                }
            });
        };

    });
</script>
</body>
</html>