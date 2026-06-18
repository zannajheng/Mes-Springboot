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
    .layui-tree li .layui-tree-iconClick {
        display: none !important;
    }
</style>
</head>
<body>
<div class="auth-menu-container">
    <input type="hidden" id="js-role-id" value="${roleId}">
    <input type="hidden" id="js-role-code" value="${roleCode!}">
    <button id="js-submit" class="layui-hide" onclick="saveMenuAuth(); return false;">保存</button>
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
        var roleCode = $('#js-role-code').val();
        var isRoleAdmin = roleCode === 'admin';
        var protectedMenuNames = ['权限管理'];
        var originalTreeData = [];
        var menuTree = null;
        var initializing = false;

        // Step 1: 加载菜单树（使用管理端完整树 API，与登录用户 sidebar 解耦）
        $.ajax({
            url: '${request.contextPath}/admin/sys/menu/tree',
            type: 'GET',
            success: function (res) {
                if (res.code === 0 && res.data && res.data.length > 0) {
                    originalTreeData = convertMenuData(res.data);

                    // 非 admin 角色授权时，屏蔽"权限管理"菜单及其子菜单
                    if (!isRoleAdmin) {
                        originalTreeData = filterProtectedMenus(originalTreeData);
                    }

                    // Step 2: 加载已授权 ID
                    loadCheckedIds();
                } else {
                    layer.msg('获取菜单树失败，数据为空', {icon: 5});
                }
            },
            error: function () {
                layer.msg('获取菜单树失败，请检查网络', {icon: 5});
            }
        });

        function loadCheckedIds() {
            $.ajax({
                url: '${request.contextPath}/admin/sys/permission/menu-ids',
                type: 'GET',
                data: {
                    roleId: roleId,
                    _t: new Date().getTime()
                },
                success: function (authRes) {
                    var checkedIds = [];
                    if (authRes.code === 0 && authRes.data) {
                        checkedIds = authRes.data;
                    } else {
                        layer.msg('获取已授权菜单列表失败，树将显示未勾选状态', {icon: 0});
                    }
                    renderTree(originalTreeData, checkedIds);
                },
                error: function () {
                    layer.msg('获取已授权菜单失败，树已加载但未勾选', {icon: 0});
                    renderTree(originalTreeData, []);
                }
            });
        }

        function convertMenuData(nodes) {
            return nodes.map(function (node) {
                var title = node.name;
                if (node.icon && node.icon !== '') {
                    title = '<i class="' + node.icon + '" style="margin-right: 5px;"></i>' + title;
                }
                var newNode = {
                    id: node.id,
                    title: title,
                    name: node.name,
                    pid: node.pid,
                    spread: true
                };
                if (node.children && node.children.length > 0) {
                    newNode.children = convertMenuData(node.children);
                }
                return newNode;
            });
        }

        function filterProtectedMenus(nodes) {
            var result = [];
            nodes.forEach(function (node) {
                if (protectedMenuNames.indexOf(node.name) !== -1) {
                    return;
                }
                var newNode = {
                    id: node.id,
                    title: node.title,
                    name: node.name,
                    pid: node.pid,
                    spread: node.spread
                };
                if (node.children && node.children.length > 0) {
                    newNode.children = filterProtectedMenus(node.children);
                }
                result.push(newNode);
            });
            return result;
        }

        function collectMenuIds(nodes, idMap) {
            nodes.forEach(function (node) {
                idMap[node.id] = true;
                if (node.children && node.children.length > 0) {
                    collectMenuIds(node.children, idMap);
                }
            });
        }

        function applyCheckedState(nodes, checkedIdMap) {
            nodes.forEach(function (node) {
                node.checked = !!checkedIdMap[node.id];
                if (node.children && node.children.length > 0) {
                    applyCheckedState(node.children, checkedIdMap);
                }
            });
        }

        function propagateParentChecked(nodes) {
            var changed = false;
            nodes.forEach(function (node) {
                if (node.children && node.children.length > 0) {
                    propagateParentChecked(node.children);
                    var allChecked = node.children.every(function (child) {
                        return child.checked === true;
                    });
                    if (allChecked && !node.checked) {
                        node.checked = true;
                        changed = true;
                    }
                }
            });
            return changed;
        }

        function renderTree(data, checkedIds) {
            // 构建 checkedIdMap 并应用到树数据
            var checkedIdMap = {};
            checkedIds.forEach(function (id) {
                checkedIdMap[id] = true;
            });
            applyCheckedState(data, checkedIdMap);
            propagateParentChecked(data);

            menuTree = tree.render({
                elem: '#js-menu-tree',
                data: data,
                showCheckbox: true,
                onlyIconControl: false,
                accordion: false,
                oncheck: function (obj) {
                    // 初始化阶段跳过级联，避免 tree.setChecked 触发连锁反应
                    if (initializing) return;

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
                                try {
                                    tree.setChecked('menuTreeId', parent.id, true);
                                } catch (e) {
                                    menuTree.setChecked(parent.id, true);
                                }
                                checkParent(parent);
                            }
                        }
                    }

                    function checkChildren(node) {
                        if (node.children && node.children.length > 0) {
                            node.children.forEach(function (child) {
                                try {
                                    tree.setChecked('menuTreeId', child.id, true);
                                } catch (e) {
                                    menuTree.setChecked(child.id, true);
                                }
                                checkChildren(child);
                            });
                        }
                    }

                    function uncheckChildren(node) {
                        if (node.children && node.children.length > 0) {
                            node.children.forEach(function (child) {
                                try {
                                    tree.setChecked('menuTreeId', child.id, false);
                                } catch (e) {
                                    menuTree.setChecked(child.id, false);
                                }
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
        }

        window.saveMenuAuth = function () {
            try {
                // 直接从 DOM 读取已勾选的叶子节点 checkbox，并用对象去重
                // 只保存叶子菜单 ID，父菜单由 sidebar 根据子菜单自动补齐，
                // 这样可以避免父节点 ID 在回显时把所有子节点都勾上。
                var menuIdSet = {};
                $('#js-menu-tree').find('input[same="layuiTreeCheck"]').each(function () {
                    if (this.checked) {
                        var $set = $(this).closest('.layui-tree-set');
                        var id = $set.data('id');
                        var isLeaf = $set.children('.layui-tree-pack').length === 0;
                        if (id && id !== '0' && isLeaf) {
                            menuIdSet[id] = true;
                        }
                    }
                });
                var menuIds = Object.keys(menuIdSet);

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
                                // 关闭当前弹窗（用父页传入的 layerIndex，避免误关其他弹层）
                                if (parent && typeof parentLayerIndex !== 'undefined') {
                                    try { parent.layer.close(parentLayerIndex); } catch (e) { parent.layer.closeAll(); }
                                } else if (parent && parent.layer) {
                                    parent.layer.closeAll();
                                }
                                // 刷新父页表格（比 location.reload() 更轻量）
                                if (parent && parent.reloadTable) {
                                    parent.reloadTable();
                                } else if (parent && parent.location) {
                                    parent.location.reload();
                                }
                            }, 1000);
                        } else {
                            layer.msg('授权失败: ' + (data.msg || '未知错误'), {icon: 5});
                        }
                    },
                    error: function (xhr, status, error) {
                        layer.msg('授权失败: ' + error, {icon: 5});
                    }
                });
            } catch (e) {
                console.error('saveMenuAuth 执行异常:', e);
                layer.msg('保存异常: ' + e.message, {icon: 5});
            }
        };
    });
</script>
</body>
</html>
