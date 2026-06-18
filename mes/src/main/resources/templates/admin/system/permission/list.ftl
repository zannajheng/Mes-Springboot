<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>权限管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <#include "${request.contextPath}/common/common.ftl">
</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <form id="js-search-form" class="layui-form" lay-filter="js-q-form-filter">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">角色名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="nameLike" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">角色编码</label>
                    <div class="layui-input-inline">
                        <input type="text" name="codeLike" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <a class="layui-btn" lay-submit lay-filter="js-search-filter"><i
                                class="layui-icon layui-icon-search layuiadmin-button-btn"></i></a>
                </div>
            </div>
        </form>

        <table class="layui-hide" id="js-record-table" lay-filter="js-record-table-filter"></table>
    </div>
</div>

<#if isAdmin>
<script type="text/html" id="js-record-table-toolbar-right">
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="authMenu"><i class="layui-icon">&#xe672;</i>授权菜单</a>
</script>
</#if>

<script>
    layui.use(['form', 'table', 'spLayer', 'spTable'], function () {
        var form = layui.form,
            table = layui.table,
            spLayer = layui.spLayer,
            spTable = layui.spTable;

        var tableIns = spTable.render({
            url: '${request.contextPath}/admin/sys/permission/page',
            cols: [
                [{
                    field: 'name', title: '角色名称', width: 150
                }, {
                    field: 'code', title: '角色编码', width: 180
                }, {
                    field: 'descr', title: '描述', minWidth: 200
                }, {
                    field: 'menuAuthCount', title: '是否授权', width: 100, templet: function (d) {
                        return (d.menuAuthCount && d.menuAuthCount > 0) ? '是' : '否';
                    }
                },
                <#if isAdmin>
                {
                    fixed: 'right',
                    field: 'operate',
                    title: '操作',
                    toolbar: '#js-record-table-toolbar-right',
                    unresize: true,
                    width: 130
                }
                </#if>
                ]
            ],
            done: function (res, curr, count) {
                // admin 不可给自己授权，从表格中移除
                $('#js-record-table').next('.layui-table-box')
                    .find('.layui-table-body tr').each(function () {
                        var $codeCell = $(this).children('td').eq(1);
                        if ($codeCell.length && $.trim($codeCell.text()) === 'admin') {
                            $(this).remove();
                        }
                    });
            }
        });

        // 暴露表格刷新函数，供 iframe 授权成功后调用
        window.reloadTable = function () {
            var where = {};
            var formData = form.val('js-q-form-filter');
            if (formData) {
                where = formData;
            }
            tableIns.reload({
                where: where
            });
        };

        $(function () {
            form.render();
        });

        form.on('submit(js-search-filter)', function (data) {
            tableIns.reload({
                where: data.field,
                page: {
                    curr: 1
                }
            });
            return false;
        });

        table.on('tool(js-record-table-filter)', function (obj) {
            var data = obj.data;

            if (obj.event === 'authMenu') {
                $('body').css('overflow', 'hidden');
                var authLayerIndex = spLayer.open({
                    title: '授权菜单 - ' + data.name,
                    area: ['550px', '610px'],
                    spWhere: {roleId: data.id, _t: new Date().getTime()},
                    content: '${request.contextPath}/admin/sys/permission/auth-menu-ui',
                    btn: ['确定', '取消'],
                    yes: function(index, layero) {
                        var iframeWin = layero.find('iframe')[0].contentWindow;
                        // 将当前 layer 索引传入 iframe，用于精确关闭
                        iframeWin.parentLayerIndex = authLayerIndex || index;
                        if (iframeWin && iframeWin.$ && iframeWin.$('#js-submit').length) {
                            iframeWin.$('#js-submit').click();
                        } else if (iframeWin && iframeWin.saveMenuAuth) {
                            iframeWin.saveMenuAuth();
                        } else {
                            parent.layer.close(index);
                            $('body').css('overflow', 'auto');
                        }
                    },
                    cancel: function(index, layero) {
                        $('body').css('overflow', 'auto');
                    },
                    end: function() {
                        $('body').css('overflow', 'auto');
                    }
                });
            }
        });
    });
</script>
</body>
</html>