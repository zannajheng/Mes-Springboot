package com.wangziyang.mes.plan.request;

import com.wangziyang.mes.common.BasePageReq;

public class SpMaterialDemandPlanReq extends BasePageReq {

    private String orderCodeLike;

    private String productSerialNoLike;

    private String taskSerialNoLike;

    private String stockInStatus;

    private String deliveryStatus;

    private String materielCodeLike;

    private String materielNameLike;

    public String getOrderCodeLike() {
        return orderCodeLike;
    }

    public void setOrderCodeLike(String orderCodeLike) {
        this.orderCodeLike = orderCodeLike;
    }

    public String getProductSerialNoLike() {
        return productSerialNoLike;
    }

    public void setProductSerialNoLike(String productSerialNoLike) {
        this.productSerialNoLike = productSerialNoLike;
    }

    public String getTaskSerialNoLike() {
        return taskSerialNoLike;
    }

    public void setTaskSerialNoLike(String taskSerialNoLike) {
        this.taskSerialNoLike = taskSerialNoLike;
    }

    public String getStockInStatus() {
        return stockInStatus;
    }

    public void setStockInStatus(String stockInStatus) {
        this.stockInStatus = stockInStatus;
    }

    public String getDeliveryStatus() {
        return deliveryStatus;
    }

    public void setDeliveryStatus(String deliveryStatus) {
        this.deliveryStatus = deliveryStatus;
    }

    public String getMaterielCodeLike() {
        return materielCodeLike;
    }

    public void setMaterielCodeLike(String materielCodeLike) {
        this.materielCodeLike = materielCodeLike;
    }

    public String getMaterielNameLike() {
        return materielNameLike;
    }

    public void setMaterielNameLike(String materielNameLike) {
        this.materielNameLike = materielNameLike;
    }
}
