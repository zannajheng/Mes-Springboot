<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>主数据通用管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <#include "${request.contextPath}/common/common.ftl">
</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <!--查询参数-->
        <form id="js-search-form" class="layui-form" lay-filter="js-q-form-filter">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">表名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="tableName" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <a class="layui-btn" lay-submit lay-filter="js-search-filter"><i
                                class="layui-icon layui-icon-search layuiadmin-button-btn"></i></a>
                </div>
            </div>
        </form>

        <!--表格-->
        <table class="layui-hide" id="js-record-table" lay-filter="js-record-table-filter"></table>
    </div>
</div>



<!--js逻辑-->
<script>
    layui.use(['form', 'table', 'spTable'], function () {
        var form = layui.form,
            table = layui.table,
            spTable = layui.spTable;

        // 表格及数据初始化
        var tableIns = spTable.render({
            url: '${request.contextPath}/basedata/manager/page',
            cols: [
                [{
                    field: 'tableName', title: '表名称', minWidth: 120
                }, {
                    field: 'tableDesc', title: '业务描述', minWidth: 130
                }, {
                    field: 'createUsername', title: '创建用户', minWidth: 130
                }, {
                    field: 'createTime', title: '创建时间', minWidth: 160
                }, {
                    field: 'updateUsername', title: '更改用户', minWidth: 130
                }, {
                    field: 'updateTime', title: '更改时间', minWidth: 160
                }, {
                    field: 'isDeleted', title: '状态', width: 90, templet: function (records) {
                        return spConfig.isDeletedDict[records.isDeleted];
                    }
                }]
            ],
            done: function (res, curr, count) {
            }
        });

        /*
         * 数据表格中form表单元素是动态插入,所以需要更新渲染下
         * http://www.layui.com/doc/modules/form.html#render
         */
        $(function () {
            form.render();
        });

        /**
         * 搜索按钮事件
         */
        form.on('submit(js-search-filter)', function (data) {
            tableIns.reload({
                where: data.field,
                page: {
                    // 重新从第 1 页开始
                    curr: 1
                }
            });

            // 阻止表单跳转。如果需要表单跳转，去掉这段即可。
            return false;
        });

        
    });
</script>
</body>
</html>