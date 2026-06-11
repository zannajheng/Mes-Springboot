<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>工艺内容编制</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <#include "${request.contextPath}/common/common.ftl">
    <style>
        .step-container {
            margin-bottom: 20px;
        }
        .step-container .layui-step-title {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .img-preview {
            width: 100px;
            height: 100px;
            object-fit: cover;
            margin: 5px;
            border: 1px solid #eee;
            border-radius: 4px;
        }
        .img-item {
            display: inline-block;
            position: relative;
            margin: 5px;
        }
        .img-item .layui-badge-rim {
            position: absolute;
            top: -5px;
            right: -5px;
            cursor: pointer;
            background: #FF5722;
            color: #fff;
        }
        .file-item {
            display: inline-block;
            padding: 10px 15px;
            border: 1px solid #eee;
            border-radius: 4px;
            margin: 5px;
            background: #f8f8f8;
            min-width: 120px;
            text-align: center;
        }
        .file-item .file-icon {
            font-size: 32px;
            display: block;
            margin-bottom: 6px;
        }
        .file-item .file-name {
            display: block;
            font-size: 12px;
            word-break: break-all;
            max-width: 150px;
            line-height: 1.4;
        }
        .file-item .file-icon-pdf { color: #e74c3c; }
        .file-item .file-icon-word { color: #2980b9; }
        .file-item .file-icon-excel { color: #27ae60; }
        .file-item .file-icon-ppt { color: #e67e22; }
        .file-item .file-icon-zip { color: #f39c12; }
        .file-item .file-icon-txt { color: #95a5a6; }
        .file-item .file-icon-default { color: #7f8c8d; }
        .file-item .layui-badge-rim {
            cursor: pointer;
            background: #FF5722;
            color: #fff;
            position: absolute;
            top: -8px;
            right: -8px;
        }
        .file-item-wrap {
            display: inline-block;
            position: relative;
            margin: 5px;
        }
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        body {
            overflow: hidden;
        }
        .splayui-container {
            height: 100%;
            display: flex;
            flex-direction: column;
        }
        .splayui-main {
            flex: 1;
            display: flex;
            flex-direction: column;
            min-height: 0;
        }
        .layui-card {
            flex: 1;
            display: flex;
            flex-direction: column;
            min-height: 0;
        }
        .layui-card-body {
            flex: 1;
            display: flex;
            flex-direction: column;
            min-height: 0;
        }
        .layui-tab {
            flex: 1;
            display: flex;
            flex-direction: column;
            min-height: 0;
        }
        .layui-tab-content {
            flex: 1;
            overflow: hidden;
            min-height: 0;
        }
        .layui-tab-content .layui-tab-item {
            height: 100%;
            overflow-y: auto;
        }
        #js-doc-images-container, #js-doc-files-container {
            max-height: 200px;
            overflow-y: auto;
            border: 1px solid #eee;
            padding: 5px;
            border-radius: 4px;
        }
    </style>
</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <div class="layui-card">
            <div class="layui-card-header">
                <h3 class="layui-card-title">工艺内容编制 - ${relation.nodeName}</h3>
            </div>
            <div class="layui-card-body">
                <div class="layui-tab layui-tab-brief" lay-filter="js-step-tab">
                    <ul class="layui-tab-title">
                        <li class="layui-this">工序主信息</li>
                        <li>工序内容</li>
                        <li>工序要求</li>
                        <li>注意事项</li>
                        <li>工装设备</li>
                        <li>技术文档</li>
                        <li>备料清单</li>
                    </ul>
                    <div class="layui-tab-content">
                        <div class="layui-tab-item layui-show">
                            <form class="layui-form" id="js-step1-form">
                                <input type="hidden" name="id" value="${content.id}">
                                <input type="hidden" name="bomOperRelationId" value="${relation.id}">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">工序编号</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="oper" value="${content.oper}" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">工序名称</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="operDesc" value="${content.operDesc}" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">工序工时(h)</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="operTime" value="${content.operTime}" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">制造周期(h)</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="produceCycle" value="${content.produceCycle}" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">加工单元</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="workCenterDesc" value="${content.workCenterDesc}" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">加工单元类型</label>
                                    <div class="layui-input-inline">
                                        <select name="workCenterType" lay-search>
                                            <option value="人员作业单元" <#if content.workCenterType == "人员作业单元">selected</#if>>人员作业单元</option>
                                            <option value="机器作业单元" <#if content.workCenterType == "机器作业单元">selected</#if>>机器作业单元</option>
                                            <option value="混合作业单元" <#if content.workCenterType == "混合作业单元">selected</#if>>混合作业单元</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">是否生成生产计划</label>
                                    <div class="layui-input-inline">
                                        <select name="isProducePlan">
                                            <option value="是" <#if content.isProducePlan == "是">selected</#if>>是</option>
                                            <option value="否" <#if content.isProducePlan == "否">selected</#if>>否</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button class="layui-btn" lay-submit lay-filter="js-step1-submit">保存</button>
                                        <button type="button" class="layui-btn layui-btn-normal" onclick="nextStep(1)">下一步</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="layui-tab-item">
                            <form class="layui-form" id="js-step2-form">
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label">操作说明</label>
                                    <div class="layui-input-block">
                                        <textarea name="operContent" placeholder="请输入工序操作说明" class="layui-textarea" style="height: 150px;">${content.operContent}</textarea>
                                    </div>
                                </div>
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label">技术要求</label>
                                    <div class="layui-input-block">
                                        <textarea name="techRequirement" placeholder="请输入技术要求" class="layui-textarea" style="height: 100px;">${content.techRequirement}</textarea>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">工序图片</label>
                                    <div class="layui-input-block">
                                        <button type="button" class="layui-btn layui-btn-sm" id="js-upload-oper-img">上传图片</button>
                                        <div id="js-oper-images-container" class="layui-upload-list">
                                            <#if content.operImages?? && content.operImages != "">
                                                <#assign operImgs = content.operImages?eval />
                                                <#list operImgs as img>
                                                    <div class="img-item">
                                                        <img src="${img}" class="img-preview">
                                                        <span class="layui-badge-rim" onclick="removeOperImage(this, '${img}')">×</span>
                                                    </div>
                                                </#list>
                                            </#if>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button type="button" class="layui-btn" onclick="saveStep(2)">保存</button>
                                        <button type="button" class="layui-btn" onclick="prevStep(1)">上一步</button>
                                        <button type="button" class="layui-btn layui-btn-normal" onclick="nextStep(2)">下一步</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="layui-tab-item">
                            <form class="layui-form" id="js-step3-form">
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label">工序要求</label>
                                    <div class="layui-input-block">
                                        <textarea name="operRequirement" placeholder="请输入工序要求" class="layui-textarea" style="height: 150px;">${content.operRequirement}</textarea>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">是否需要检验</label>
                                    <div class="layui-input-inline">
                                        <select name="isNeedInspect" id="js-is-need-inspect">
                                            <option value="否" <#if content.isNeedInspect == "否">selected</#if>>否</option>
                                            <option value="是" <#if content.isNeedInspect == "是">selected</#if>>是</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-form-item" id="js-inspect-img-div" style="display: <#if content.isNeedInspect == '是'>block<#else>none</#if>;">
                                    <label class="layui-form-label">检验标准图片</label>
                                    <div class="layui-input-block">
                                        <button type="button" class="layui-btn layui-btn-sm" id="js-upload-inspect-img">上传图片</button>
                                        <div id="js-inspect-images-container" class="layui-upload-list">
                                            <#if content.inspectImages?? && content.inspectImages != "">
                                                <#assign inspectImgs = content.inspectImages?eval />
                                                <#list inspectImgs as img>
                                                    <div class="img-item">
                                                        <img src="${img}" class="img-preview">
                                                        <span class="layui-badge-rim" onclick="removeInspectImage(this, '${img}')">×</span>
                                                    </div>
                                                </#list>
                                            </#if>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button type="button" class="layui-btn" onclick="saveStep(3)">保存</button>
                                        <button type="button" class="layui-btn" onclick="prevStep(2)">上一步</button>
                                        <button type="button" class="layui-btn layui-btn-normal" onclick="nextStep(3)">下一步</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="layui-tab-item">
                            <form class="layui-form" id="js-step4-form">
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label">注意事项</label>
                                    <div class="layui-input-block">
                                        <textarea name="attention" placeholder="请输入注意事项" class="layui-textarea" style="height: 200px;">${content.attention}</textarea>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button type="button" class="layui-btn" onclick="saveStep(4)">保存</button>
                                        <button type="button" class="layui-btn" onclick="prevStep(3)">上一步</button>
                                        <button type="button" class="layui-btn layui-btn-normal" onclick="nextStep(4)">下一步</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="layui-tab-item">
                            <div class="layui-form">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">设备用途</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="js-equipment-usage" placeholder="请输入设备名称/用途查询" class="layui-input">
                                    </div>
                                    <div class="layui-input-inline">
                                        <button type="button" class="layui-btn" onclick="searchEquipment()">查询</button>
                                        <button type="button" class="layui-btn" onclick="openEquipmentDialog()">+ 新增</button>
                                    </div>
                                </div>
                                <table class="layui-table" id="js-equipment-table">
                                    <thead>
                                    <tr>
                                        <th>设备编码</th>
                                        <th>设备名称</th>
                                        <th>设备规格/型号</th>
                                        <th>设备用途</th>
                                        <th>需求数量</th>
                                        <th>备注信息</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="js-equipment-body">
                                    </tbody>
                                </table>
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button type="button" class="layui-btn" onclick="prevStep(4)">上一步</button>
                                        <button type="button" class="layui-btn layui-btn-normal" onclick="nextStep(5)">下一步</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="layui-tab-item">
                            <form class="layui-form" id="js-step6-form">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">技术文档描述</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="docDesc" placeholder="请输入技术文档描述，如：作业指导书-主板单元" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">图片上传</label>
                                    <div class="layui-input-block">
                                        <button type="button" class="layui-btn layui-btn-sm" id="js-upload-doc-img">上传图片</button>
                                        <div id="js-doc-images-container" class="layui-upload-list">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">附件上传</label>
                                    <div class="layui-input-block">
                                        <button type="button" class="layui-btn layui-btn-sm" id="js-upload-doc-file">上传文件</button>
                                        <div id="js-doc-files-container" class="layui-upload-list">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button type="button" class="layui-btn" onclick="saveTechDoc()">保存</button>
                                        <button type="button" class="layui-btn" onclick="prevStep(5)">上一步</button>
                                        <button type="button" class="layui-btn layui-btn-normal" onclick="nextStep(6)">下一步</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="layui-tab-item">
                            <div class="layui-form">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">物料编码/名称</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="js-material-keyword" placeholder="请输入物料编码/名称查询" class="layui-input">
                                    </div>
                                    <div class="layui-input-inline" style="margin-left: 10px;">
                                        <button type="button" class="layui-btn" onclick="searchMaterial()">查询</button>
                                    </div>
                                    <div class="layui-input-inline">
                                        <button type="button" class="layui-btn layui-btn-warm" onclick="exportMaterial()">
                                            <i class="fa fa-download"></i> 导出清单
                                        </button>
                                    </div>
                                </div>
                                <table class="layui-table" id="js-material-table">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>物料编码</th>
                                        <th>物料名称</th>
                                        <th>物料规格</th>
                                        <th>物料类型</th>
                                        <th>数量</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="js-material-body">
                                    </tbody>
                                </table>
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button type="button" class="layui-btn" onclick="prevStep(6)">上一步</button>
                                        <button type="button" class="layui-btn layui-btn-warm" onclick="submitComplete()">完成编制</button>
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

<script>
    // jQuery plugin: serialize form to object
    $.fn.serializeObject = function () {
        var obj = {};
        var a = this.serializeArray();
        $.each(a, function () {
            if (obj[this.name]) {
                if (!obj[this.name].push) {
                    obj[this.name] = [obj[this.name]];
                }
                obj[this.name].push(this.value || '');
            } else {
                obj[this.name] = this.value || '';
            }
        });
        return obj;
    };

    layui.use(['form', 'layer', 'upload', 'element', 'table'], function () {
        var form = layui.form,
            layer = layui.layer,
            upload = layui.upload,
            element = layui.element,
            table = layui.table;

        var contentId = '${content.id}';
        var contentStatus = '${content.status}';
        var bomOperRelationId = '${relation.id}';
        console.log('【页面初始化】contentId:', contentId, 'bomOperRelationId:', bomOperRelationId, 'contentStatus:', contentStatus);

        var operImages = <#if content.operImages?? && content.operImages != "">${content.operImages}<#else>[]</#if>;
        var inspectImages = <#if content.inspectImages?? && content.inspectImages != "">${content.inspectImages}<#else>[]</#if>;
        var docImages = [];
        var docFiles = [];
        var techDocId = '';

        function getFileIconClass(filename) {
            var ext = filename ? filename.substring(filename.lastIndexOf('.') + 1).toLowerCase() : '';
            if (ext === 'pdf') return 'fa-file-pdf-o file-icon-pdf';
            if (ext === 'doc' || ext === 'docx') return 'fa-file-word-o file-icon-word';
            if (ext === 'xls' || ext === 'xlsx') return 'fa-file-excel-o file-icon-excel';
            if (ext === 'ppt' || ext === 'pptx') return 'fa-file-powerpoint-o file-icon-ppt';
            if (ext === 'zip' || ext === 'rar' || ext === '7z') return 'fa-file-archive-o file-icon-zip';
            if (ext === 'txt') return 'fa-file-text-o file-icon-txt';
            return 'fa-file-o file-icon-default';
        }

        function renderFileItem(fileUrl, fileName) {
            var iconClass = getFileIconClass(fileName);
            return '<div class="file-item-wrap">' +
                '<div class="file-item">' +
                '<i class="fa ' + iconClass + ' file-icon"></i>' +
                '<span class="file-name">' + fileName + '</span>' +
                '</div>' +
                '<span class="layui-badge-rim" onclick="removeDocFile(this, \'' + fileUrl + '\')">×</span>' +
                '</div>';
        }

        var equipmentList = [];
        var materialList = [];

        if (contentStatus === 'completed') {
            $('input, textarea, select').prop('disabled', true);
            $('.layui-btn').each(function () {
                if ($(this).text().indexOf('完成编制') > -1) {
                    $(this).hide();
                } else if ($(this).text() !== '上一步' && $(this).text() !== '下一步') {
                    $(this).hide();
                }
            });
            layer.msg('该工艺内容已完成编制，当前为只读查看模式', {time: 2000});
        }

        // 监听标签页切换事件，确保点击标签标题时也能加载对应数据
        element.on('tab(js-step-tab)', function (data) {
            console.log('【标签页切换】索引:', data.index);
            if (data.index === 5) {
                loadTechDoc();
                initTechDocUpload();
            } else if (data.index === 4) {
                loadEquipmentList();
            } else if (data.index === 6) {
                loadMaterialList();
            }
        });

        window.switchTab = function (index) {
            var $tab = $('.layui-tab[lay-filter="js-step-tab"]');
            $tab.find('.layui-tab-title > li').removeClass('layui-this').eq(index).addClass('layui-this');
            $tab.find('.layui-tab-content > .layui-tab-item').removeClass('layui-show').eq(index).addClass('layui-show');
        };

        window.prevStep = function (step) {
            switchTab(step - 1);
        };

        window.nextStep = function (step) {
            switchTab(step);
            if (step === 5) {
                loadEquipmentList();
            } else if (step === 6) {
                loadTechDoc();
                initTechDocUpload();
            } else if (step === 7) {
                loadMaterialList();
            }
        };

        form.on('select(js-is-need-inspect)', function (data) {
            if (data.value === '是') {
                $('#js-inspect-img-div').show();
            } else {
                $('#js-inspect-img-div').hide();
            }
        });

        upload.render({
            elem: '#js-upload-oper-img',
            url: '${request.contextPath}/upload',
            accept: 'images',
            multiple: true,
            done: function (res) {
                if (res.code === 0) {
                    var imgUrl = res.data.src;
                    operImages.push(imgUrl);
                    var html = '<div class="img-item"><img src="' + imgUrl + '" class="img-preview"><span class="layui-badge-rim" onclick="removeOperImage(this, \'' + imgUrl + '\')">×</span></div>';
                    $('#js-oper-images-container').append(html);
                    saveOperImages();
                }
            }
        });

        upload.render({
            elem: '#js-upload-inspect-img',
            url: '${request.contextPath}/upload',
            accept: 'images',
            multiple: true,
            done: function (res) {
                if (res.code === 0) {
                    var imgUrl = res.data.src;
                    inspectImages.push(imgUrl);
                    var html = '<div class="img-item"><img src="' + imgUrl + '" class="img-preview"><span class="layui-badge-rim" onclick="removeInspectImage(this, \'' + imgUrl + '\')">×</span></div>';
                    $('#js-inspect-images-container').append(html);
                    saveInspectImages();
                }
            }
        });

        var techDocUploadInited = false;

        function initTechDocUpload() {
            if (techDocUploadInited) return;
            techDocUploadInited = true;
            upload.render({
                elem: '#js-upload-doc-img',
                url: '${request.contextPath}/upload',
                accept: 'images',
                multiple: true,
                done: function (res) {
                    if (res.code === 0) {
                        var imgUrl = res.data.src;
                        docImages.push(imgUrl);
                        var html = '<div class="img-item"><img src="' + imgUrl + '" class="img-preview"><span class="layui-badge-rim" onclick="removeDocImage(this, \'' + imgUrl + '\')">×</span></div>';
                        $('#js-doc-images-container').append(html);
                    }
                }
            });

            upload.render({
                elem: '#js-upload-doc-file',
                url: '${request.contextPath}/upload',
                accept: 'file',
                multiple: true,
                done: function (res) {
                    if (res.code === 0) {
                        var fileUrl = res.data.src;
                        var fileName = res.data.title || '文件';
                        docFiles.push({url: fileUrl, name: fileName});
                        var html = renderFileItem(fileUrl, fileName);
                        $('#js-doc-files-container').append(html);
                    }
                }
            });
        }

        initTechDocUpload();

        form.on('submit(js-step1-submit)', function (data) {
            saveData(data.field, 1);
            return false;
        });

        function saveData(formData, step, callback) {
            if (contentId) { formData.id = contentId; } else { delete formData.id; }
            // 清理可能为空字符串的数值字段，避免 Jackson 反序列化报错
            if (formData.operTime === '') { delete formData.operTime; }
            if (formData.produceCycle === '') { delete formData.produceCycle; }
            formData.bomOperRelationId = bomOperRelationId;
            formData.bomId = '${relation.bomId}';
            formData.bomCode = '${relation.bomCode}';
            formData.bomItemId = '${relation.bomItemId}';
            formData.nodeName = '${relation.nodeName}';
            formData.operId = '${relation.operId}';
            formData.status = 'draft';
            formData.operImages = JSON.stringify(operImages);
            formData.inspectImages = JSON.stringify(inspectImages);

            spUtil.ajax({
                url: '${request.contextPath}/technology/oper-content/save',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(formData),
                success: function (res) {
                    if (res.code === 200 || res.code === 0) {
                        if (res.data && res.data.id) {
                            contentId = res.data.id;
                        }
                        if (callback) {
                            callback(true, res);
                        } else {
                            layer.msg('保存成功');
                        }
                    } else {
                        if (callback) {
                            callback(false, res);
                        } else {
                            layer.msg(res.message || '保存失败');
                        }
                    }
                }
            });
        }

        window.saveStep = function (step) {
            var formData = {};
            if (step === 1) {
                formData = $('#js-step1-form').serializeObject();
            } else if (step === 2) {
                formData = $('#js-step2-form').serializeObject();
            } else if (step === 3) {
                formData = $('#js-step3-form').serializeObject();
            } else if (step === 4) {
                formData = $('#js-step4-form').serializeObject();
            }
            saveData(formData, step);
        };

        window.saveOperImages = function () {
            if (!contentId) {
                return;
            }
            var formData = {
                id: contentId,
                bomOperRelationId: bomOperRelationId,
                operImages: JSON.stringify(operImages)
            };
            spUtil.ajax({
                url: '${request.contextPath}/technology/oper-content/save',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(formData),
                success: function (res) {
                    if (res.code === 200 || res.code === 0) {
                        if (res.data && res.data.id) {
                            contentId = res.data.id;
                        }
                    }
                }
            });
        };

        window.saveInspectImages = function () {
            if (!contentId) {
                return;
            }
            var formData = {
                id: contentId,
                bomOperRelationId: bomOperRelationId,
                inspectImages: JSON.stringify(inspectImages)
            };
            spUtil.ajax({
                url: '${request.contextPath}/technology/oper-content/save',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(formData),
                success: function (res) {
                    if (res.code === 200 || res.code === 0) {
                        if (res.data && res.data.id) {
                            contentId = res.data.id;
                        }
                    }
                }
            });
        };

        window.removeOperImage = function (elem, imgUrl) {
            $(elem).parent().remove();
            var index = operImages.indexOf(imgUrl);
            if (index > -1) {
                operImages.splice(index, 1);
            }
            saveOperImages();
        };

        window.removeInspectImage = function (elem, imgUrl) {
            $(elem).parent().remove();
            var index = inspectImages.indexOf(imgUrl);
            if (index > -1) {
                inspectImages.splice(index, 1);
            }
            saveInspectImages();
        };

        window.removeDocImage = function (elem, imgUrl) {
            $(elem).parent().remove();
            var index = docImages.indexOf(imgUrl);
            if (index > -1) {
                docImages.splice(index, 1);
            }
        };

        window.removeDocFile = function (elem, fileUrl) {
            $(elem).parent().remove();
            for (var i = 0; i < docFiles.length; i++) {
                if (docFiles[i].url === fileUrl) {
                    docFiles.splice(i, 1);
                    break;
                }
            }
        };

        function loadEquipmentList() {
            var url = contentId ? '${request.contextPath}/technology/oper-content/equipment/list' : '${request.contextPath}/technology/oper-content/equipment/list-by-relation';
            var data = contentId ? {operContentId: contentId} : {bomOperRelationId: bomOperRelationId};

            spUtil.ajax({
                url: url,
                type: 'GET',
                data: data,
                success: function (res) {
                    if (res.code === 200 || res.code === 0) {
                        equipmentList = res.data || [];
                        renderEquipmentTable();
                    }
                }
            });
        }

        function renderEquipmentTable() {
            var html = '';
            for (var i = 0; i < equipmentList.length; i++) {
                var eq = equipmentList[i];
                html += '<tr>' +
                    '<td>' + (eq.equipmentCode || '') + '</td>' +
                    '<td>' + (eq.equipmentName || '') + '</td>' +
                    '<td>' + (eq.equipmentModel || '') + '</td>' +
                    '<td>' + (eq.equipmentUsage || '') + '</td>' +
                    '<td>' + (eq.requireQty || 1) + '</td>' +
                    '<td>' + (eq.equipmentRemark || '') + '</td>' +
                    '<td>' +
                    '<a class="layui-btn layui-btn-xs" onclick="deleteEquipment(\'' + eq.id + '\')">删除</a>' +
                    '</td>' +
                    '</tr>';
            }
            if (!html) {
                html = '<tr><td colspan="7" class="layui-text-center">暂无数据</td></tr>';
            }
            $('#js-equipment-body').html(html);
        }

        window.searchEquipment = function () {
            var keyword = $('#js-equipment-usage').val();
            spUtil.ajax({
                url: '${request.contextPath}/technology/oper-content/equipment/search-library',
                type: 'GET',
                data: { keyword: keyword || '' },
                success: function (res) {
                    if (res.code === 200 || res.code === 0) {
                        var list = res.data || [];
                        var tableHtml = '<table class="layui-table">' +
                            '<thead><tr><th>选择</th><th>设备编码</th><th>设备名称</th><th>设备规格/型号</th><th>设备用途</th><th>需求数量</th></tr></thead>' +
                            '<tbody>';
                        if (list.length === 0) {
                            tableHtml += '<tr><td colspan="6" class="layui-text-center">未找到匹配设备，请点击"新增"手动添加</td></tr>';
                        } else {
                            for (var i = 0; i < list.length; i++) {
                                var eq = list[i];
                                tableHtml += '<tr>' +
                                    '<td><input type="radio" name="eq-select" data-code="' + (eq.equipmentCode || '') + '" data-name="' + (eq.equipmentName || '') + '" data-model="' + (eq.equipmentModel || '') + '" data-usage="' + (eq.equipmentUsage || '') + '"></td>' +
                                    '<td>' + (eq.equipmentCode || '') + '</td>' +
                                    '<td>' + (eq.equipmentName || '') + '</td>' +
                                    '<td>' + (eq.equipmentModel || '') + '</td>' +
                                    '<td>' + (eq.equipmentUsage || '') + '</td>' +
                                    '<td><input type="text" class="layui-input eq-qty" style="width:80px" value="1"></td>' +
                                    '</tr>';
                            }
                        }
                        tableHtml += '</tbody></table>';

                        layer.open({
                            type: 1,
                            title: '选择设备',
                            area: ['800px', '500px'],
                            content: tableHtml,
                            btn: list.length > 0 ? ['确定添加', '取消'] : ['关闭'],
                            yes: function (index) {
                                if (list.length === 0) {
                                    layer.close(index);
                                    return;
                                }
                                var $selected = $('input[name="eq-select"]:checked');
                                if ($selected.length === 0) {
                                    layer.msg('请先选择一个设备');
                                    return;
                                }
                                var code = $selected.data('code');
                                var name = $selected.data('name');
                                var model = $selected.data('model');
                                var usage = $selected.data('usage');
                                var qty = parseFloat($selected.closest('tr').find('.eq-qty').val()) || 1;
                                addEquipment(code, name, model, usage, qty, '');
                                layer.close(index);
                            }
                        });
                    }
                }
            });
        };

        window.openEquipmentDialog = function () {
            layer.open({
                type: 1,
                title: '新增工装设备',
                area: ['500px', '420px'],
                content: '<form class="layui-form" style="padding:20px">' +
                    '<div class="layui-form-item">' +
                    '<label class="layui-form-label"><span style="color:red;font-weight:bold;margin-right:2px;">*</span>设备编码</label>' +
                    '<div class="layui-input-block"><input type="text" class="layui-input eq-code" placeholder="请输入设备编码"></div>' +
                    '</div>' +
                    '<div class="layui-form-item">' +
                    '<label class="layui-form-label"><span style="color:red;font-weight:bold;margin-right:2px;">*</span>设备名称</label>' +
                    '<div class="layui-input-block"><input type="text" class="layui-input eq-name" placeholder="请输入设备名称"></div>' +
                    '</div>' +
                    '<div class="layui-form-item">' +
                    '<label class="layui-form-label">设备规格</label>' +
                    '<div class="layui-input-block"><input type="text" class="layui-input eq-model" placeholder="请输入设备规格/型号"></div>' +
                    '</div>' +
                    '<div class="layui-form-item">' +
                    '<label class="layui-form-label">设备用途</label>' +
                    '<div class="layui-input-block"><input type="text" class="layui-input eq-usage" placeholder="请输入设备用途"></div>' +
                    '</div>' +
                    '<div class="layui-form-item">' +
                    '<label class="layui-form-label">需求数量</label>' +
                    '<div class="layui-input-inline"><input type="text" class="layui-input eq-qty" value="1"></div>' +
                    '</div>' +
                    '<div class="layui-form-item">' +
                    '<label class="layui-form-label">备注信息</label>' +
                    '<div class="layui-input-block"><textarea class="layui-textarea eq-remark" placeholder="请输入备注信息"></textarea></div>' +
                    '</div>' +
                    '</form>',
                btn: ['确定', '取消'],
                yes: function (index) {
                    var code = $('.eq-code').val();
                    var name = $('.eq-name').val();
                    var model = $('.eq-model').val();
                    var usage = $('.eq-usage').val();
                    var qty = parseFloat($('.eq-qty').val()) || 1;
                    var remark = $('.eq-remark').val() || '';
                    if (!code || !name) {
                        layer.msg('设备编码和名称不能为空');
                        return;
                    }
                    addEquipment(code, name, model, usage, qty, remark);
                    layer.close(index);
                }
            });
        };

        function addEquipment(code, name, model, usage, qty, remark) {
            if (!contentId) {
                var allData = collectAllFormData();
                saveData(allData, 0, function (success) {
                    if (success) {
                        doAddEquipment(code, name, model, usage, qty, remark);
                    }
                });
            } else {
                doAddEquipment(code, name, model, usage, qty, remark);
            }
        }

        function doAddEquipment(code, name, model, usage, qty, remark) {
            var equipment = {
                operContentId: contentId,
                bomOperRelationId: bomOperRelationId,
                equipmentCode: code,
                equipmentName: name,
                equipmentModel: model,
                equipmentUsage: usage,
                requireQty: qty,
                equipmentRemark: remark
            };
            spUtil.ajax({
                url: '${request.contextPath}/technology/oper-content/equipment/save',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(equipment),
                success: function (res) {
                    if (res.code === 200 || res.code === 0) {
                        layer.msg('添加成功');
                        loadEquipmentList();
                    } else {
                        layer.msg(res.message || '添加失败');
                    }
                }
            });
        }

        window.deleteEquipment = function (id) {
            layer.confirm('确定要删除该设备吗？', function (index) {
                spUtil.ajax({
                    url: '${request.contextPath}/technology/oper-content/equipment/delete',
                    type: 'POST',
                    data: {id: id},
                    success: function (res) {
                        if (res.code === 200 || res.code === 0) {
                            layer.msg('删除成功');
                            loadEquipmentList();
                        } else {
                            layer.msg(res.message || '删除失败');
                        }
                    }
                });
                layer.close(index);
            });
        };

        function loadTechDoc() {
            var url = contentId ? '${request.contextPath}/technology/oper-content/tech-doc/list' : '${request.contextPath}/technology/oper-content/tech-doc/list-by-relation';
            var data = contentId ? {operContentId: contentId} : {bomOperRelationId: bomOperRelationId};
            console.log('【loadTechDoc】contentId:', contentId, '请求URL:', url, '请求参数:', JSON.stringify(data));

            spUtil.ajax({
                url: url,
                type: 'GET',
                data: data,
                success: function (res) {
                    console.log('【loadTechDoc】响应:', JSON.stringify(res));
                    if (res.code === 200 || res.code === 0) {
                        var list = res.data || [];
                        console.log('【loadTechDoc】数据条数:', list.length);
                        if (list && list.length > 0) {
                            var doc = list[0];
                            techDocId = doc.id || '';
                            $('input[name="docDesc"]').val(doc.docDesc || '');
                            if (doc.docImages) {
                                try {
                                    docImages = JSON.parse(doc.docImages);
                                    renderDocImages();
                                } catch (e) {
                                }
                            }
                            if (doc.docFiles) {
                                try {
                                    docFiles = JSON.parse(doc.docFiles);
                                    renderDocFiles();
                                } catch (e) {
                                }
                            }
                        }
                    }
                }
            });
        }

        function renderDocImages() {
            var html = '';
            for (var i = 0; i < docImages.length; i++) {
                var img = docImages[i];
                html += '<div class="img-item"><img src="' + img + '" class="img-preview"><span class="layui-badge-rim" onclick="removeDocImage(this, \'' + img + '\')">×</span></div>';
            }
            $('#js-doc-images-container').html(html);
        }

        function renderDocFiles() {
            var html = '';
            for (var i = 0; i < docFiles.length; i++) {
                var file = docFiles[i];
                html += renderFileItem(file.url, file.name);
            }
            $('#js-doc-files-container').html(html);
        }

        window.saveTechDoc = function () {
            if (!contentId) {
                var allData = collectAllFormData();
                saveData(allData, 0, function (success) {
                    if (success) {
                        doSaveTechDoc();
                    }
                });
            } else {
                doSaveTechDoc();
            }
        };

        function doSaveTechDoc() {
            var docDesc = $('input[name="docDesc"]').val();
            var techDoc = {
                id: techDocId || null,
                operContentId: contentId,
                bomOperRelationId: bomOperRelationId,
                docDesc: docDesc,
                docImages: JSON.stringify(docImages),
                docFiles: JSON.stringify(docFiles)
            };
            console.log('【保存技术文档】发送数据:', JSON.stringify(techDoc));
            spUtil.ajax({
                url: '${request.contextPath}/technology/oper-content/tech-doc/save',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(techDoc),
                success: function (res) {
                    console.log('【保存技术文档】响应:', JSON.stringify(res));
                    if (res.code === 200 || res.code === 0) {
                        if (res.data && res.data.id) {
                            techDocId = res.data.id;
                        }
                        layer.msg('保存成功', {time: 1000});
                    } else {
                        layer.msg(res.message || '保存失败');
                    }
                }
            });
        }

        function loadMaterialList() {
            var url = contentId ? '${request.contextPath}/technology/oper-content/material/list' : '${request.contextPath}/technology/oper-content/material/list-by-relation';
            var data = contentId ? {operContentId: contentId} : {bomOperRelationId: bomOperRelationId};

            spUtil.ajax({
                url: url,
                type: 'GET',
                data: data,
                success: function (res) {
                    if (res.code === 200 || res.code === 0) {
                        materialList = res.data || [];
                        renderMaterialTable();
                    }
                }
            });
        }

        function renderMaterialTable() {
            var html = '';
            for (var i = 0; i < materialList.length; i++) {
                var mat = materialList[i];
                html += '<tr>' +
                    '<td>' + (i + 1) + '</td>' +
                    '<td>' + (mat.materielCode || '') + '</td>' +
                    '<td>' + (mat.materielName || '') + '</td>' +
                    '<td>' + (mat.materielSpec || '') + '</td>' +
                    '<td>' + (mat.materielType || '') + '</td>' +
                    '<td>' + (mat.requireQty || 1) + '</td>' +
                    '<td>' +
                    '<a class="layui-btn layui-btn-xs" onclick="deleteMaterial(\'' + mat.id + '\')">删除</a>' +
                    '</td>' +
                    '</tr>';
            }
            if (!html) {
                html = '<tr><td colspan="7" class="layui-text-center">暂无数据</td></tr>';
            }
            $('#js-material-body').html(html);
        }

        window.searchMaterial = function () {
            var keyword = $('#js-material-keyword').val();
            spUtil.ajax({
                url: '${request.contextPath}/technology/oper-content/material/search-library',
                type: 'GET',
                data: { keyword: keyword || '' },
                success: function (res) {
                    if (res.code === 200 || res.code === 0) {
                        var list = res.data || [];
                        var tableHtml = '<table class="layui-table">' +
                            '<thead><tr><th>物料编码</th><th>物料名称</th><th>物料规格</th><th>物料类型</th><th>数量</th><th>操作</th></tr></thead>' +
                            '<tbody>';
                        if (list.length === 0) {
                            tableHtml += '<tr><td colspan="6" class="layui-text-center">未找到匹配物料</td></tr>';
                        } else {
                            for (var i = 0; i < list.length; i++) {
                                var m = list[i];
                                tableHtml += '<tr>' +
                                    '<td>' + (m.materielCode || '') + '</td>' +
                                    '<td>' + (m.materielName || '') + '</td>' +
                                    '<td>' + (m.materielSpec || '') + '</td>' +
                                    '<td>' + (m.materielType || '') + '</td>' +
                                    '<td><input type="text" class="layui-input mat-qty" style="width:80px" value="1"></td>' +
                                    '<td><button class="layui-btn layui-btn-xs layui-btn-primary" onclick="addMaterial($(this))">添加</button></td>' +
                                    '</tr>';
                            }
                        }
                        tableHtml += '</tbody></table>';

                        layer.open({
                            type: 1,
                            title: '选择物料',
                            area: ['800px', '500px'],
                            content: tableHtml,
                            btn: list.length > 0 ? [] : ['关闭'],
                            cancel: function () {
                                loadMaterialList();
                            }
                        });
                    }
                }
            });
        };

        window.addMaterial = function ($btn) {
            var $tr = $btn.closest('tr');
            var $tds = $tr.find('td');
            var code = $tds.eq(0).text();
            var name = $tds.eq(1).text();
            var spec = $tds.eq(2).text();
            var type = $tds.eq(3).text();
            var qty = parseFloat($tds.eq(4).find('.mat-qty').val()) || 1;

            if (!contentId) {
                var allData = collectAllFormData();
                saveData(allData, 0, function (success) {
                    if (success) {
                        doAddMaterial(code, name, spec, type, qty);
                    }
                });
            } else {
                doAddMaterial(code, name, spec, type, qty);
            }
        };

        function doAddMaterial(code, name, spec, type, qty) {
            var material = {
                operContentId: contentId,
                bomOperRelationId: bomOperRelationId,
                materielCode: code,
                materielName: name,
                materielSpec: spec,
                materielType: type,
                requireQty: qty,
                sortNum: materialList.length + 1
            };
            spUtil.ajax({
                url: '${request.contextPath}/technology/oper-content/material/save',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(material),
                success: function (res) {
                    if (res.code === 200 || res.code === 0) {
                        layer.msg('添加成功');
                        loadMaterialList();
                    } else {
                        layer.msg(res.message || '添加失败');
                    }
                }
            });
        }

        window.exportMaterial = function () {
            var url = '${request.contextPath}/technology/oper-content/material/export?bomOperRelationId=' + bomOperRelationId;
            window.open(url, '_blank');
        };

        window.deleteMaterial = function (id) {
            layer.confirm('确定要删除该物料吗？', function (index) {
                spUtil.ajax({
                    url: '${request.contextPath}/technology/oper-content/material/delete',
                    type: 'POST',
                    data: {id: id},
                    success: function (res) {
                        if (res.code === 200 || res.code === 0) {
                            layer.msg('删除成功');
                            loadMaterialList();
                        } else {
                            layer.msg(res.message || '删除失败');
                        }
                    }
                });
                layer.close(index);
            });
        };

        function collectAllFormData() {
            var formData = {};
            $.extend(formData, $('#js-step1-form').serializeObject());
            $.extend(formData, $('#js-step2-form').serializeObject());
            $.extend(formData, $('#js-step3-form').serializeObject());
            $.extend(formData, $('#js-step4-form').serializeObject());
            return formData;
        }

        window.submitComplete = function () {
            layer.confirm('确认完成编制吗？完成后状态将标记为已完成。', function (index) {
                layer.close(index);
                var allData = collectAllFormData();
                saveData(allData, 0, function (success) {
                    if (success && contentId) {
                        doComplete(contentId);
                    } else {
                        layer.msg('保存失败，无法完成编制');
                    }
                });
            });
        };

        function doComplete(id) {
            spUtil.ajax({
                url: '${request.contextPath}/technology/oper-content/complete',
                type: 'POST',
                data: {id: id},
                success: function (res) {
                    if (res.code === 200 || res.code === 0) {
                        layer.msg('编制完成');
                        setTimeout(function () {
                            parent.layer.closeAll();
                        }, 1000);
                    } else {
                        layer.msg(res.message || '操作失败');
                    }
                }
            });
        }

        form.render();
    });
</script>
</body>
</html>
