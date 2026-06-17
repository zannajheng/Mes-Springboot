<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><#if result?? && result.id??>编辑<#else>新增</#if>物料</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <#include "${request.contextPath}/common/common.ftl">
</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <div class="layui-card">
            <div class="layui-card-header">
                <h3 class="layui-card-title"><#if result?? && result.id??>编辑<#else>新增</#if>物料</h3>
            </div>
            <div class="layui-card-body">
                <form class="layui-form splayui-form" lay-filter="formTest">
                    <div class="layui-row">
                        <div class="layui-col-xs12 layui-col-sm12 layui-col-md10">
                            <div class="layui-form-item">
                                <label for="js-materiel" class="layui-form-label sp-required">物料编码</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="js-materiel" name="materiel" lay-verify="required" autocomplete="off"
                                           class="layui-input" value="${result.materiel!}" <#if result?? && result.id??>readonly</#if>>
                                </div>
                                <#if !(result?? && result.id??)>
                                <button type="button" class="layui-btn layui-btn-sm" id="js-generate-code"><i class="layui-icon">&#xe60d;</i>生成编码</button>
                                </#if>
                            </div>
                            <div class="layui-form-item">
                                <label for="js-materielDesc" class="layui-form-label sp-required">物料名称</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="js-materielDesc" name="materielDesc" lay-verify="required"
                                           autocomplete="off" class="layui-input" value="${result.materielDesc!}">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="js-matType" class="layui-form-label sp-required">物料类型</label>
                                <div class="layui-input-inline">
                                    <select id="js-matType" name="matType" lay-filter="matType-filter" lay-verify="required">
                                        <option value="">请选择</option>
                                        <option value="FG" <#if result?? && result.matType == "FG">selected</#if>>产品</option>
                                        <option value="PG" <#if result?? && result.matType == "PG">selected</#if>>半成品</option>
                                        <option value="PART" <#if result?? && result.matType == "PART">selected</#if>>零件</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="js-model" class="layui-form-label">规格/型号</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="js-model" name="model" autocomplete="off"
                                           class="layui-input" value="${result.model!}">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="js-unit" class="layui-form-label">计量单位</label>
                                <div class="layui-input-inline">
                                    <select id="js-unit" name="unit">
                                        <option value="">请选择</option>
                                        <option value="个" <#if result?? && result.unit == "个">selected</#if>>个</option>
                                        <option value="套" <#if result?? && result.unit == "套">selected</#if>>套</option>
                                        <option value="件" <#if result?? && result.unit == "件">selected</#if>>件</option>
                                        <option value="m" <#if result?? && result.unit == "m">selected</#if>>米</option>
                                        <option value="kg" <#if result?? && result.unit == "kg">selected</#if>>千克</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="js-material" class="layui-form-label">材质</label>
                                <div class="layui-input-inline">
                                    <select id="js-material" name="material">
                                        <option value="">请选择</option>
                                        <option value="铝" <#if result?? && result.material == "铝">selected</#if>>铝</option>
                                        <option value="铁" <#if result?? && result.material == "铁">selected</#if>>铁</option>
                                        <option value="铜" <#if result?? && result.material == "铜">selected</#if>>铜</option>
                                        <option value="塑料" <#if result?? && result.material == "塑料">selected</#if>>塑料</option>
                                        <option value="纸质" <#if result?? && result.material == "纸质">selected</#if>>纸质</option>
                                        <option value="其他" <#if result?? && result.material == "其他">selected</#if>>其他</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="js-materielSource" class="layui-form-label sp-required">物料来源</label>
                                <div class="layui-input-inline">
                                    <select id="js-materielSource" name="materielSource" lay-verify="required">
                                        <option value="">请选择</option>
                                        <option value="自制" <#if result?? && result.materielSource == "自制">selected</#if>>自制</option>
                                        <option value="外购" <#if result?? && result.materielSource == "外购">selected</#if>>外购</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="js-demandLeadTime" class="layui-form-label sp-required">物料需求提前期(天)</label>
                                <div class="layui-input-inline">
                                    <input type="number" id="js-demandLeadTime" name="demandLeadTime" lay-verify="required"
                                           autocomplete="off" class="layui-input" value="${result.demandLeadTime!0}" min="1">
                                </div>
                                <span style="color:#ff5722;font-size:12px;">*不可为0，至少为1天</span>
                            </div>
                            <div class="layui-form-item">
                                <label for="js-safetyStock" class="layui-form-label">安全库存</label>
                                <div class="layui-input-inline">
                                    <input type="number" id="js-safetyStock" name="safetyStock" autocomplete="off"
                                           class="layui-input" value="${result.safetyStock!0}" min="0">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="js-size" class="layui-form-label">尺寸</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="js-size" name="size" autocomplete="off"
                                           class="layui-input" value="${result.size!}">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="js-remark" class="layui-form-label">备注信息</label>
                                <div class="layui-input-inline">
                                    <textarea id="js-remark" name="remark" autocomplete="off"
                                              class="layui-textarea" style="width:310px;">${result.remark!}</textarea>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="js-is-deleted" class="layui-form-label sp-required">状态</label>
                                <div class="layui-input-block" id="js-is-deleted" style="width: 310px;">
                                    <input type="radio" name="deleted" value="0" title="正常"
                                           <#if !(result??) || (result?? && result.deleted == "0")>checked</#if>>
                                    <input type="radio" name="deleted" value="2" title="禁用"
                                           <#if result?? && result.deleted == "2">checked</#if>>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item layui-hide">
                        <div class="layui-input-block">
                            <input id="js-id" name="id" value="${result.id!}"/>
                            <button id="js-submit" class="layui-btn" lay-submit lay-filter="js-submit-filter">确定</button>
                            <button type="button" class="layui-btn layui-btn-primary" onclick="parent.layer.closeAll()">取消</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    layui.use(['form', 'util'], function () {
        var form = layui.form,
            util = layui.util;

        $('#js-generate-code').click(function () {
            spUtil.ajax({
                url: '${request.contextPath}/basedata/materile/generate-materiel-code',
                type: 'GET',
                showLoading: true,
                success: function (data) {
                    if (data.code === 200 || data.code === 0) {
                        $('#js-materiel').val(data.data);
                    } else {
                        layer.msg(data.message || '生成失败');
                    }
                }
            });
        });

        form.on('submit(js-submit-filter)', function (data) {
            var demandLeadTime = parseInt(data.field.demandLeadTime);
            if (isNaN(demandLeadTime) || demandLeadTime < 1) {
                layer.msg('物料需求提前期不可为0，至少为1天');
                return false;
            }
            spUtil.submitForm({
                url: "${request.contextPath}/basedata/materile/add-or-update",
                data: data.field
            });
            return false;
        });

        form.render();
    });
</script>
</body>
</html>