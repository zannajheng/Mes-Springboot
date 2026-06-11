package com.wangziyang.mes.technology.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.wangziyang.mes.common.BaseEntity;

/**
 * <p>
 * BOM与工序关系实体类
 * </p>
 *
 * @author WangZiYang
 * @since 2024-01-01
 */
@TableName(value = "sp_bom_oper_relation")
public class SpBomOperRelation extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * BOM头ID
     */
    private String bomId;

    /**
     * BOM编号
     */
    private String bomCode;

    /**
     * BOM物料描述
     */
    private String materielDesc;

    /**
     * 节点名称（BOM子项名称）
     */
    private String nodeName;

    /**
     * 节点层级
     */
    private Integer nodeLevel;

    /**
     * BOM子项ID
     */
    private String bomItemId;

    /**
     * 工序ID
     */
    private String operId;

    /**
     * 工序编号
     */
    private String oper;

    /**
     * 工序名称
     */
    private String operDesc;

    /**
     * 排序号
     */
    private Integer sortNum;

    /**
     * 是否锁定（0：未锁定，1：已锁定）
     */
    private String isLocked;

    /**
     * 加工单元编码
     */
    private String workCenter;

    /**
     * 加工单元名称
     */
    private String workCenterDesc;

    /**
     * 工序工时(h)
     */
    private Double operTime;

    /**
     * 制造周期(h)
     */
    private Double produceCycle;

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

    public String getMaterielDesc() {
        return materielDesc;
    }

    public void setMaterielDesc(String materielDesc) {
        this.materielDesc = materielDesc;
    }

    public String getNodeName() {
        return nodeName;
    }

    public void setNodeName(String nodeName) {
        this.nodeName = nodeName;
    }

    public Integer getNodeLevel() {
        return nodeLevel;
    }

    public void setNodeLevel(Integer nodeLevel) {
        this.nodeLevel = nodeLevel;
    }

    public String getBomItemId() {
        return bomItemId;
    }

    public void setBomItemId(String bomItemId) {
        this.bomItemId = bomItemId;
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

    public Integer getSortNum() {
        return sortNum;
    }

    public void setSortNum(Integer sortNum) {
        this.sortNum = sortNum;
    }

    public String getIsLocked() {
        return isLocked;
    }

    public void setIsLocked(String isLocked) {
        this.isLocked = isLocked;
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

    @Override
    public String toString() {
        return "SpBomOperRelation{" +
                "bomId='" + bomId + '\'' +
                ", bomCode='" + bomCode + '\'' +
                ", materielDesc='" + materielDesc + '\'' +
                ", nodeName='" + nodeName + '\'' +
                ", nodeLevel=" + nodeLevel +
                ", bomItemId='" + bomItemId + '\'' +
                ", operId='" + operId + '\'' +
                ", oper='" + oper + '\'' +
                ", operDesc='" + operDesc + '\'' +
                ", sortNum=" + sortNum +
                ", isLocked='" + isLocked + '\'' +
                ", workCenter='" + workCenter + '\'' +
                ", workCenterDesc='" + workCenterDesc + '\'' +
                ", operTime=" + operTime +
                ", produceCycle=" + produceCycle +
                '}';
    }
}