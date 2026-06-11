package com.wangziyang.mes.technology.request;

import com.wangziyang.mes.common.BasePageReq;

/**
 * 零部件分页请求
 *
 * @author wangziyang
 * @since 20200328
 */

public class SpPartReq extends BasePageReq {
    /**
     * 零部件编号模糊查询
     */
    private String partNoLike;

    /**
     * 零部件名称模糊查询
     */
    private String partNameLike;

    public String getPartNoLike() {
        return partNoLike;
    }

    public void setPartNoLike(String partNoLike) {
        this.partNoLike = partNoLike;
    }

    public String getPartNameLike() {
        return partNameLike;
    }

    public void setPartNameLike(String partNameLike) {
        this.partNameLike = partNameLike;
    }
}
