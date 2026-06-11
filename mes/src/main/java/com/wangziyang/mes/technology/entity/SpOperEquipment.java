package com.wangziyang.mes.technology.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.wangziyang.mes.common.BaseEntity;

import java.math.BigDecimal;

@TableName(value = "sp_oper_equipment")
public class SpOperEquipment extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private String operContentId;

    private String bomOperRelationId;

    private String equipmentCode;

    private String equipmentName;

    private String equipmentModel;

    private String equipmentUsage;

    private String equipmentRemark;

    private BigDecimal requireQty;

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

    public String getEquipmentCode() {
        return equipmentCode;
    }

    public void setEquipmentCode(String equipmentCode) {
        this.equipmentCode = equipmentCode;
    }

    public String getEquipmentName() {
        return equipmentName;
    }

    public void setEquipmentName(String equipmentName) {
        this.equipmentName = equipmentName;
    }

    public String getEquipmentModel() {
        return equipmentModel;
    }

    public void setEquipmentModel(String equipmentModel) {
        this.equipmentModel = equipmentModel;
    }

    public String getEquipmentUsage() {
        return equipmentUsage;
    }

    public void setEquipmentUsage(String equipmentUsage) {
        this.equipmentUsage = equipmentUsage;
    }

    public String getEquipmentRemark() {
        return equipmentRemark;
    }

    public void setEquipmentRemark(String equipmentRemark) {
        this.equipmentRemark = equipmentRemark;
    }

    public BigDecimal getRequireQty() {
        return requireQty;
    }

    public void setRequireQty(BigDecimal requireQty) {
        this.requireQty = requireQty;
    }
}
