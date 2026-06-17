<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>分配用户</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <#include "${request.contextPath}/common/common.ftl">
</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <input type="hidden" id="js-role-id" value="${roleId}">
        <div class="layui-form-item">
            <label class="layui-form-label">搜索用户</label>
            <div class="layui-input-inline" style="width: 300px;">
                <input type="text" id="js-search-user" placeholder="输入用户名搜索" autocomplete="off" class="layui-input">
            </div>
            <button class="layui-btn" id="js-search-btn"><i class="layui-icon layui-icon-search"></i>搜索</button>
        </div>
        <div class="layui-form">
            <table class="layui-table">
                <thead>
                    <tr>
                        <th><input type="checkbox" lay-filter="js-user-check" lay-skin="primary"></th>
                        <th>用户名</th>
                        <th>姓名</th>
                        <th>所属部门</th>
                        <th>状态</th>
                    </tr>
                </thead>
                <tbody id="js-user-list">
                </tbody>
            </table>
        </div>
        <div class="layui-form-item" style="text-align: center; margin-top: 20px;">
            <button class="layui-btn layui-btn-lg" id="js-save-btn"><i class="layui-icon">&#xe61f;</i>保存分配</button>
        </div>
    </div>
</div>
<script>
    layui.use(['form', 'table'], function () {
        var form = layui.form;

        function loadUsers(keyword) {
            spUtil.ajax({
                url: '${request.contextPath}/admin/sys/user/page',
                type: 'POST',
                data: {pageNum: 1, pageSize: 100, nameLike: keyword},
                success: function (res) {
                    if (res.code === '000000') {
                        var users = res.data.records || [];
                        var html = '';
                        users.forEach(function (user) {
                            html += '<tr>';
                            html += '<td><input type="checkbox" name="userId" value="' + user.id + '" lay-skin="primary"></td>';
                            html += '<td>' + (user.username || '') + '</td>';
                            html += '<td>' + (user.name || '') + '</td>';
                            html += '<td>' + (user.deptName || '') + '</td>';
                            html += '<td>' + (user.deleted === '0' ? '正常' : '已禁用') + '</td>';
                            html += '</tr>';
                        });
                        $('#js-user-list').html(html);
                        form.render('checkbox');
                    }
                }
            });
        }

        loadUsers('');

        $('#js-search-btn').click(function () {
            loadUsers($('#js-search-user').val());
        });

        $('#js-search-user').keyup(function (e) {
            if (e.keyCode === 13) {
                loadUsers($(this).val());
            }
        });

        $('#js-save-btn').click(function () {
            var checkedIds = [];
            $('input[name="userId"]:checked').each(function () {
                checkedIds.push($(this).val());
            });
            if (checkedIds.length === 0) {
                layer.msg('请选择要分配的用户', {icon: 5});
                return;
            }
            spUtil.ajax({
                url: '${request.contextPath}/admin/sys/permission/save-user-assign',
                type: 'POST',
                data: {
                    roleId: $('#js-role-id').val(),
                    userIds: checkedIds.join(',')
                },
                success: function () {
                    layer.msg('分配成功', {icon: 1});
                    setTimeout(function () {
                        parent.layer.closeAll();
                    }, 1000);
                }
            });
        });
    });
</script>
</body>
</html>