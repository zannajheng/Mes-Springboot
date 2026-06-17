package com.wangziyang.mes.technology.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.wangziyang.mes.common.BaseEntity;

import java.math.BigDecimal;

/**
 * <p>
 *
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-28
 */
@TableName(value = "sp_bom_item")
public class SpBomItem extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * bom编号
     */
    private String bomHeadId;

    /**
     * 物料ID
     */
    private String materielItemCode;

    /**
     * 物料描述
     */
    private String materielItemDesc;

    /**
     * 行号
     */
    private String lineNo;

    /**
     * 用量
     */
    private BigDecimal itemNum;

    /**
     * 子项基本单位
     */
    private String itemUnit;

    /**
     * 所属工序类型
     */
    private String operTyper;

    /**
     * 节点类型（1：零部件，2：物料）
     */
    private String nodeType;

    /**
     * 节点层级（0：产品，1：半成品，2：单元，3：物料）
     */
    private Integer nodeLevel;

    /**
     * 节点编号（系统自动生成）
     */
    private String nodeCode;

    public String getBomHeadId() {
        return bomHeadId;
    }

    public void setBomHeadId(String bomHeadId) {
        this.bomHeadId = bomHeadId;
    }

    public String getMaterielItemCode() {
        return materielItemCode;
    }

    public void setMaterielItemCode(String materielItemCode) {
        this.materielItemCode = materielItemCode;
    }

    public String getMaterielItemDesc() {
        return materielItemDesc;
    }

    public void setMaterielItemDesc(String materielItemDesc) {
        this.materielItemDesc = materielItemDesc;
    }

    public String getLineNo() {
        return lineNo;
    }

    public void setLineNo(String lineNo) {
        this.lineNo = lineNo;
    }

    public BigDecimal getItemNum() {
        return itemNum;
    }

    public void setItemNum(BigDecimal itemNum) {
        this.itemNum = itemNum;
    }

    public String getItemUnit() {
        return itemUnit;
    }

    public void setItemUnit(String itemUnit) {
        this.itemUnit = itemUnit;
    }

    public String getOperTyper() {
        return operTyper;
    }

    public void setOperTyper(String operTyper) {
        this.operTyper = operTyper;
    }

    public String getNodeType() {
        return nodeType;
    }

    public void setNodeType(String nodeType) {
        this.nodeType = nodeType;
    }

    public Integer getNodeLevel() {
        return nodeLevel;
    }

    public void setNodeLevel(Integer nodeLevel) {
        this.nodeLevel = nodeLevel;
    }

    public String getNodeCode() {
        return nodeCode;
    }

    public void setNodeCode(String nodeCode) {
        this.nodeCode = nodeCode;
    }

    @Override
    public String toString() {
        return "SpBomItem{" +
                "bomHeadId=" + bomHeadId +
                ", materielItemCode=" + materielItemCode +
                ", materielItemDesc=" + materielItemDesc +
                ", lineNo=" + lineNo +
                ", itemNum=" + itemNum +
                ", itemUnit=" + itemUnit +
                ", operTyper=" + operTyper +
                ", nodeType=" + nodeType +
                ", nodeLevel=" + nodeLevel +
                ", nodeCode=" + nodeCode +
                "}";
    }
}
