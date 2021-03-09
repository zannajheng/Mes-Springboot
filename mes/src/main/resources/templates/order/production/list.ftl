<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>派工界面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <#include "${request.contextPath}/common/common.ftl">
    <link rel="stylesheet" href="${request.contextPath}/lib/gantt/css/style.css" media="all">

    <style type="text/css">
        body {
            font-family: Helvetica, Arial, sans-serif;
            font-size: 13px;
            padding: 0 0 50px 0;
        }

        .contain {
            width: 800px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <!--查询参数-->
        <form id="js-search-form" class="layui-form" lay-filter="js-q-form-filter">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <a class="layui-btn " lay-submit lay-filter="js-add-order"><i
                                class="layui-icon ">&#xe608</i>新建生产订单</a>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">订单编号</label>
                    <div class="layui-input-inline">
                        <input type="materiel" name="materiel" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">订单名称</label>
                    <div class="layui-input-inline">
                        <input type="materielDesc" name="materielDesc" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <a class="layui-btn" lay-submit lay-filter="js-search-filter"><i
                                class="layui-icon layui-icon-search layuiadmin-button-btn"></i></a>
                </div>
            </div>
        </form>

        <!--表格-->
        <#--        <table class="layui-hide" id="js-record-table" lay-filter="js-record-table-filter"></table>-->
        <div id="js-gantt" class="gantt"></div>
    </div>
</div>


<!--js逻辑-->
<script src="${request.contextPath}/lib/gantt/js/jquery.fn.gantt.js" charset="utf-8"></script>

<script>
    layui.use(['form', 'table', 'spLayer', 'spTable'], function () {
        var ganttData = [];
        // 获取数据
        spUtil.ajax({
            url: '${request.contextPath}/order/release/gantt/list',
            async: false,
            type: 'POST',
            // 是否序列化参数
            serializable: false,
            // 参数
            data: {},
            success: function (data) {
                ganttData = data.data;
            },
            error: function () {
            }
        });

        //初始化gantt
        var $gantt = $("#js-gantt").gantt({
            source: ganttData,
            navigate: 'scroll',//buttons  scroll
            scale: "days",// months  weeks days  hours
            maxScale: "months",
            minScale: "days",
            waitText: "请稍后...",
            itemsPerPage: 14,
            tnTitle1: '物料编码',
            tnTitle2: '计划/实际',
            onItemClick: function (data) {
                modifyPlan(data);
            },
            onAddClick: function (dt, rowId) {
                console.log(dt)
                console.log(rowId)
                console.log("onAddClick");
            },
            onRender: function () {
                console.log('onRender');
            }
        });

        var form = layui.form,
            table = layui.table,
            spLayer = layui.spLayer,
            spTable = layui.spTable;


        /**
         * 修改
         * @param
         */
        function modifyPlan(id) {
            var index = spLayer.open({
                title: '添加',
                area: ['90%', '90%'],
                content: '${request.contextPath}/order/release/add-or-update-ui'
            });
        }


        /**
         * 搜索按钮事件
         */
        form.on('submit(js-search-filter)', function (data) {
            // 阻止表单跳转。如果需要表单跳转，去掉这段即可。
            return false;
        });

        /**
         * 新增订单功能
         */
        form.on('submit(js-add-order)', function (data) {
            modifyPlan();
            // 阻止表单跳转。如果需要表单跳转，去掉这段即可。
            return false;
        });
        /*
        * 数据表格中form表单元素是动态插入,所以需要更新渲染下
        * http://www.layui.com/doc/modules/form.html#render
        */
        $(function () {
            form.render();
        });
    });
</script>
</body>
</html>
