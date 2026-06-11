package com.wangziyang.mes.system.request;

import com.wangziyang.mes.common.BasePageReq;

/**
 * <p>
 * 系统部门分页查询参数
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-15
 */
public class SysDepartmentPageReq extends BasePageReq {

    /**
     * 部门名称模糊查询
     */
    private String nameLike;

    public String getNameLike() {
        return nameLike;
    }

    public void setNameLike(String nameLike) {
        this.nameLike = nameLike;
    }
}
