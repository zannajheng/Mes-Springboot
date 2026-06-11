package com.wangziyang.mes.technology.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.wangziyang.mes.common.BaseEntity;

/**
 * <p>
 *工序实体类
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-14
 */
@TableName(value = "sp_oper")
public class SpOper extends BaseEntity {

    private static final long serialVersionUID = 1L;
    /**
     * 工序编号
     */
    private String oper;
    /**
     * 工序名称
     */
    private String operDesc;
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
    /**
     * 是否生成生产计划(是/否)
     */
    private String isProducePlan;
    /**
     * 逻辑删除：1 表示删除，0 表示未删除，2 表示禁用
     */
    private String isDeleted;
    /**
     * 备注信息
     */
    private String remark;


    @Override
    public String toString() {
        return "SpOper{" +
                "oper=" + oper +
                ", operDesc=" + operDesc +
                ", workCenter=" + workCenter +
                ", workCenterDesc=" + workCenterDesc +
                ", operTime=" + operTime +
                ", produceCycle=" + produceCycle +
                ", isProducePlan=" + isProducePlan +
                ", remark=" + remark +
                "}";
    }

    public String getOper() {
        return this.oper;
    }

    public void setOper(String oper) {
        this.oper = oper;
    }

    public String getOperDesc() {
        return this.operDesc;
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

    public String getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(String isDeleted) {
        this.isDeleted = isDeleted;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
