package com.wangziyang.mes.technology.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.wangziyang.mes.common.BaseEntity;

import java.math.BigDecimal;

@TableName(value = "sp_oper_material_list")
public class SpOperMaterialList extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private String operContentId;

    private String bomOperRelationId;

    private String materielCode;

    private String materielName;

    private String materielSpec;

    private String materielType;

    private BigDecimal requireQty;

    private Integer sortNum;

    public String getOperContentId() {
        return operContentId;
    }

    public void setOperContentId(String operContentId) {
        this.operContentId = operContentId;
    }

    public String getBomOperRelationId() {
        return bomOperRelationId;
    }

    public void setBomOperRelationId(String bomOperRelationId) {
        this.bomOperRelationId = bomOperRelationId;
    }

    public String getMaterielCode() {
        return materielCode;
    }

    public void setMaterielCode(String materielCode) {
        this.materielCode = materielCode;
    }

    public String getMaterielName() {
        return materielName;
    }

    public void setMaterielName(String materielName) {
        this.materielName = materielName;
    }

    public String getMaterielSpec() {
        return materielSpec;
    }

    public void setMaterielSpec(String materielSpec) {
        this.materielSpec = materielSpec;
    }

    public String getMaterielType() {
        return materielType;
    }

    public void setMaterielType(String materielType) {
        this.materielType = materielType;
    }

    public BigDecimal getRequireQty() {
        return requireQty;
    }

    public void setRequireQty(BigDecimal requireQty) {
        this.requireQty = requireQty;
    }

    public Integer getSortNum() {
        return sortNum;
    }

    public void setSortNum(Integer sortNum) {
        this.sortNum = sortNum;
    }
}
