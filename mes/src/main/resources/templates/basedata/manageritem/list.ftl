<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>基础数据维护界面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <#include "${request.contextPath}/common/common.ftl">
</head>
<body>
<div class="splayui-container">
    <div class="layui-row">
        <div class="layui-col-md3 layui-bg-gray">
            <table id="js-table-name" lay-filter="js-table-name-filter"></table>
        </div>
        <div class="layui-col-md9">
            <div class="splayui-main">
                <!--查询参数-->
                <form id="js-search-form" class="layui-form" lay-filter="js-q-form-filter">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">关键词</label>
                            <div class="layui-input-inline">
                                <input type="text" name="keyword" autocomplete="off" placeholder=""
                                       class="layui-input">
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
    </div>

</div>



<!--js逻辑-->
<script>
    layui.use(['form', 'table', 'spTable'], function () {
        var form = layui.form,
            table = layui.table,
            spTable = layui.spTable;
        colsArr = [];
        ruleDetailRows = {};
        var tableName;
        var tableNameId;
        var tableIns;
        // 左侧表格及数据初始化
        var tableNamec = spTable.render({
            toolbar: '',
            elem: '#js-table-name',//指定原始表格元素选择器（推荐id选择器）
            height: 'full-24',
            url: '${request.contextPath}/basedata/manager/page',
            cols: [
                [{
                    field: 'tableName', title: '表名称'
                }, {
                    field: 'tableDesc', title: '业务描述'
                }]
            ],
            done: function (res, curr, count) {
                rightInit(tableName, tableNameId)
            }
        });

        //左侧表格监听行单击事件 初始化右侧表明细
        table.on('row(js-table-name-filter)', function (obj) {
            tableName = obj.data.tableName;
            tableNameId = obj.data.id;
            //初始化数据
            colsArr = [];
            //动态拼接需要表格明细需要显示的列头
            buildcol(tableNameId);
            // 右侧表格数据明细初始化
            rightInit(tableNameId, tableName)

        });

        /**
         * 初始化右侧表格
         * */
        function rightInit(tableNameId, tableName) {
            tableIns = spTable.render({
                url: '${request.contextPath}/basedata/common/page',
                cols: [colsArr],
                where: {tableNameId: tableNameId, tableName: tableName},
                done: function (res, curr, count) {
                }
            });

        }

        //动态拼接需要表格需要显示的列头
        function buildcol(id) {
            // 1. ajax 获取表头数据
            spUtil.ajax({
                url: '${request.contextPath}/basedata/manager/item/by/tableNameId',
                async: false,
                type: 'POST',
                // 是否显示 loading
                showLoading: true,
                // 是否序列化参数
                serializable: false,
                // 参数
                data: {
                    tableNameId: id
                },
                success: function (data) {
                    ruleDetailRows = data.data;
                }
            });
            // 2. 构造layui表头结构
            $.each(ruleDetailRows, function (index, item) {
                colsArr.push({
                    field: item.field, title: item.fieldDesc
                })
            });
        }

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
            var where = data.field;
            where.tableNameId = tableNameId;
            where.tableName = tableName;
            tableIns.reload({
                where: where,
                page: {
                    // 重新从第 1 页开始
                    curr: 1
                }
            });

            // 阻止表单跳转。如果需要表单跳转，去掉这段即可。
            return false;
        });

        
    })
    ;
</script>
</body>
</html>