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
public class SysDictPageReq extends BasePageReq {

    /**
     * 标签名模糊查询
     */
    private String nameLike;

    /**
     * 类别模糊查询
     */
    private String typeLike;

    public String getNameLike() {
        return nameLike;
    }

    public void setNameLike(String nameLike) {
        this.nameLike = nameLike;
    }

    public String getTypeLike() {
        return typeLike;
    }

    public void setTypeLike(String typeLike) {
        this.typeLike = typeLike;
    }
}
