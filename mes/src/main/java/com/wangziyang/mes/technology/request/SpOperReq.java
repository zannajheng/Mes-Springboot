package com.wangziyang.mes.technology.request;

import com.wangziyang.mes.common.BasePageReq;

/**
 * 工序分页请求
 *
 * @author wangziyang
 * @since 20200328
 */
public class SpOperReq extends BasePageReq {

    /**
     * 工序编号模糊查询
     */
    private String operLike;

    /**
     * 工序名称模糊查询
     */
    private String operDescLike;

    public String getOperLike() {
        return operLike;
    }

    public void setOperLike(String operLike) {
        this.operLike = operLike;
    }

    public String getOperDescLike() {
        return operDescLike;
    }

    public void setOperDescLike(String operDescLike) {
        this.operDescLike = operDescLike;
    }
}
