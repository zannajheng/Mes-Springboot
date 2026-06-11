package com.wangziyang.mes.technology.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.wangziyang.mes.common.BaseEntity;

@TableName(value = "sp_oper_content")
public class SpOperContent extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private String bomOperRelationId;

    private String bomId;

    private String bomCode;

    private String bomItemId;

    private String nodeName;

    private String operId;

    private String oper;

    private String operDesc;

    private String workCenter;

    private String workCenterDesc;

    private Double operTime;

    private Double produceCycle;

    private String isProducePlan;

    private String workCenterType;

    private String operContent;

    private String techRequirement;

    private String operImages;

    private String operRequirement;

    private String isNeedInspect;

    private String inspectImages;

    private String attention;

    private String status;

    public String getBomOperRelationId() {
        return bomOperRelationId;
    }

    public void setBomOperRelationId(String bomOperRelationId) {
        this.bomOperRelationId = bomOperRelationId;
    }

    public String getBomId() {
        return bomId;
    }

    public void setBomId(String bomId) {
        this.bomId = bomId;
    }

    public String getBomCode() {
        return bomCode;
    }

    public void setBomCode(String bomCode) {
        this.bomCode = bomCode;
    }

    public String getBomItemId() {
        return bomItemId;
    }

    public void setBomItemId(String bomItemId) {
        this.bomItemId = bomItemId;
    }

    public String getNodeName() {
        return nodeName;
    }

    public void setNodeName(String nodeName) {
        this.nodeName = nodeName;
    }

    public String getOperId() {
        return operId;
    }

    public void setOperId(String operId) {
        this.operId = operId;
    }

    public String getOper() {
        return oper;
    }

    public void setOper(String oper) {
        this.oper = oper;
    }

    public String getOperDesc() {
        return operDesc;
    }

    public void setOperDesc(String operDesc) {
        this.operDesc = operDesc;
    }

    public String getWorkCenter() {
        return workCenter;
    }

    public void setWorkCenter(String workCenter) {
        this.workCenter = workCenter;
    }

    public String getWorkCenterDesc() {
        return workCenterDesc;
    }

    public void setWorkCenterDesc(String workCenterDesc) {
        this.workCenterDesc = workCenterDesc;
    }

    public Double getOperTime() {
        return operTime;
    }

    public void setOperTime(Double operTime) {
        this.operTime = operTime;
    }

    public Double getProduceCycle() {
        return produceCycle;
    }

    public void setProduceCycle(Double produceCycle) {
        this.produceCycle = produceCycle;
    }

    public String getIsProducePlan() {
        return isProducePlan;
    }

    public void setIsProducePlan(String isProducePlan) {
        this.isProducePlan = isProducePlan;
    }

    public String getWorkCenterType() {
        return workCenterType;
    }

    public void setWorkCenterType(String workCenterType) {
        this.workCenterType = workCenterType;
    }

    public String getOperContent() {
        return operContent;
    }

    public void setOperContent(String operContent) {
        this.operContent = operContent;
    }

    public String getTechRequirement() {
        return techRequirement;
    }

    public void setTechRequirement(String techRequirement) {
        this.techRequirement = techRequirement;
    }

    public String getOperImages() {
        return operImages;
    }

    public void setOperImages(String operImages) {
        this.operImages = operImages;
    }

    public String getOperRequirement() {
        return operRequirement;
    }

    public void setOperRequirement(String operRequirement) {
        this.operRequirement = operRequirement;
    }

    public String getIsNeedInspect() {
        return isNeedInspect;
    }

    public void setIsNeedInspect(String isNeedInspect) {
        this.isNeedInspect = isNeedInspect;
    }

    public String getInspectImages() {
        return inspectImages;
    }

    public void setInspectImages(String inspectImages) {
        this.inspectImages = inspectImages;
    }

    public String getAttention() {
        return attention;
    }

    public void setAttention(String attention) {
        this.attention = attention;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
