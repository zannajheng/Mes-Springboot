package com.wangziyang.mes.technology.request;

import com.wangziyang.mes.technology.entity.SpOper;
import org.apache.commons.lang3.StringUtils;

public class SpOperFormReq {

    private String id;
    private String oper;
    private String operDesc;
    private String workCenter;
    private String workCenterDesc;
    private String operTime;
    private String produceCycle;
    private String isProducePlan;
    private String remark;

    public SpOper toEntity() {
        SpOper entity = new SpOper();
        entity.setId(this.id);
        entity.setOper(this.oper);
        entity.setOperDesc(this.operDesc);
        entity.setWorkCenter(this.workCenter);
        entity.setWorkCenterDesc(this.workCenterDesc);
        if (StringUtils.isNotBlank(this.operTime)) {
            try {
                entity.setOperTime(Double.parseDouble(this.operTime.trim()));
            } catch (NumberFormatException e) {
                entity.setOperTime(null);
            }
        }
        if (StringUtils.isNotBlank(this.produceCycle)) {
            try {
                entity.setProduceCycle(Double.parseDouble(this.produceCycle.trim()));
            } catch (NumberFormatException e) {
                entity.setProduceCycle(null);
            }
        }
        entity.setIsProducePlan(this.isProducePlan);
        entity.setRemark(this.remark);
        return entity;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public String getOperTime() {
        return operTime;
    }

    public void setOperTime(String operTime) {
        this.operTime = operTime;
    }

    public String getProduceCycle() {
        return produceCycle;
    }

    public void setProduceCycle(String produceCycle) {
        this.produceCycle = produceCycle;
    }

    public String getIsProducePlan() {
        return isProducePlan;
    }

    public void setIsProducePlan(String isProducePlan) {
        this.isProducePlan = isProducePlan;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}