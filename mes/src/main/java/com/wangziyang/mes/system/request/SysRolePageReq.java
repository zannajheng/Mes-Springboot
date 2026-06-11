package com.wangziyang.mes.system.request;

import com.wangziyang.mes.common.BasePageReq;

/**
 * <p>
 * 系统用户分页查询参数
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-15
 */
public class SysRolePageReq extends BasePageReq {

    /**
     * 角色名称模糊查询
     */
    private String nameLike;

    /**
     * 角色编码模糊查询
     */
    private String codeLike;

    public String getNameLike() {
        return nameLike;
    }

    public void setNameLike(String nameLike) {
        this.nameLike = nameLike;
    }

    public String getCodeLike() {
        return codeLike;
    }

    public void setCodeLike(String codeLike) {
        this.codeLike = codeLike;
    }
}
