package com.wangziyang.mes.plan.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.wangziyang.mes.common.BaseEntity;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@TableName(value = "sp_material_demand_plan")
public class SpMaterialDemandPlan extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private String orderCode;

    private String productSerialNo;

    private String taskSerialNo;

    private String productName;

    private String workCenterName;

    private String workCenterCode;

    private String materielCode;

    private String materielName;

    private BigDecimal requireQty;

    private String unit;

    private LocalDateTime demandDate;

    private String deliveryStatus;

    private BigDecimal stockOutQty;

    private BigDecimal netRequireQty;

    private String stockInStatus;

    private String stockInOrderNo;

    private String remark;

    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    public String getProductSerialNo() {
        return productSerialNo;
    }

    public void setProductSerialNo(String productSerialNo) {
        this.productSerialNo = productSerialNo;
    }

    public String getTaskSerialNo() {
        return taskSerialNo;
    }

    public void setTaskSerialNo(String taskSerialNo) {
        this.taskSerialNo = taskSerialNo;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getWorkCenterName() {
        return workCenterName;
    }

    public void setWorkCenterName(String workCenterName) {
        this.workCenterName = workCenterName;
    }

    public String getWorkCenterCode() {
        return workCenterCode;
    }

    public void setWorkCenterCode(String workCenterCode) {
        this.workCenterCode = workCenterCode;
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

    public BigDecimal getRequireQty() {
        return requireQty;
    }

    public void setRequireQty(BigDecimal requireQty) {
        this.requireQty = requireQty;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public LocalDateTime getDemandDate() {
        return demandDate;
    }

    public void setDemandDate(LocalDateTime demandDate) {
        this.demandDate = demandDate;
    }

    public String getDeliveryStatus() {
        return deliveryStatus;
    }

    public void setDeliveryStatus(String deliveryStatus) {
        this.deliveryStatus = deliveryStatus;
    }

    public BigDecimal getStockOutQty() {
        return stockOutQty;
    }

    public void setStockOutQty(BigDecimal stockOutQty) {
        this.stockOutQty = stockOutQty;
    }

    public BigDecimal getNetRequireQty() {
        return netRequireQty;
    }

    public void setNetRequireQty(BigDecimal netRequireQty) {
        this.netRequireQty = netRequireQty;
    }

    public String getStockInStatus() {
        return stockInStatus;
    }

    public void setStockInStatus(String stockInStatus) {
        this.stockInStatus = stockInStatus;
    }

    public String getStockInOrderNo() {
        return stockInOrderNo;
    }

    public void setStockInOrderNo(String stockInOrderNo) {
        this.stockInOrderNo = stockInOrderNo;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
