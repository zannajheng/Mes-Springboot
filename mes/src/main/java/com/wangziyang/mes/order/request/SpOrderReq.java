package com.wangziyang.mes.order.request;

import com.wangziyang.mes.common.BasePageReq;

/**
 * 生产订单分页查询请求对象
 *
 * @author WangZiYang
 */
public class SpOrderReq extends BasePageReq {

    /**
     * 模糊查询订单编号
     */
    private String orderCodeLike;

    /**
     * 模糊查询订单描述/名称
     */
    private String orderDescriptionLike;

    /**
     * 模糊查询物料编码
     */
    private String materielLike;

    /**
     * 模糊查询物料描述
     */
    private String materielDescLike;

    /**
     * 订单状态
     */
    private Integer statue;

    public String getOrderCodeLike() {
        return orderCodeLike;
    }

    public void setOrderCodeLike(String orderCodeLike) {
        this.orderCodeLike = orderCodeLike;
    }

    public String getOrderDescriptionLike() {
        return orderDescriptionLike;
    }

    public void setOrderDescriptionLike(String orderDescriptionLike) {
        this.orderDescriptionLike = orderDescriptionLike;
    }

    public String getMaterielLike() {
        return materielLike;
    }

    public void setMaterielLike(String materielLike) {
        this.materielLike = materielLike;
    }

    public String getMaterielDescLike() {
        return materielDescLike;
    }

    public void setMaterielDescLike(String materielDescLike) {
        this.materielDescLike = materielDescLike;
    }

    public Integer getStatue() {
        return statue;
    }

    public void setStatue(Integer statue) {
        this.statue = statue;
    }
}
