package com.wangziyang.mes.basedata.request;

import com.wangziyang.mes.common.BasePageReq;

/**
 * 物料分页对象
 * 
 * @author wangziyang
 * @since 2020/04/01
 */
public class spMaterileReq extends BasePageReq {
    /**
     * 模糊查询物料编号
     */
    private String materielLike;
    /**
     * 模糊查询物料描述
     */
    private String materielDescLike;

    /**
     * 物料类型
     */
    private String matType;

    /**
     * 物料来源
     */
    private String materielSource;

    /**
     * 获取 模糊查询物料编号
     *
     * @return materielLike 模糊查询物料编号
     */
    public String getMaterielLike() {
        return this.materielLike;
    }

    /**
     * 设置 模糊查询物料编号
     *
     * @param materielLike 模糊查询物料编号
     */
    public void setMaterielLike(String materielLike) {
        this.materielLike = materielLike;
    }

    /**
     * 获取 模糊查询物料描述
     *
     * @return materielDescLike 模糊查询物料描述
     */
    public String getMaterielDescLike() {
        return this.materielDescLike;
    }

    /**
     * 设置 模糊查询物料描述
     *
     * @param materielDescLike 模糊查询物料描述
     */
    public void setMaterielDescLike(String materielDescLike) {
        this.materielDescLike = materielDescLike;
    }

    /**
     * 获取 物料类型
     *
     * @return matType 物料类型
     */
    public String getMatType() {
        return this.matType;
    }

    /**
     * 设置 物料类型
     *
     * @param matType 物料类型
     */
    public void setMatType(String matType) {
        this.matType = matType;
    }

    /**
     * 获取 物料来源
     *
     * @return materielSource 物料来源
     */
    public String getMaterielSource() {
        return this.materielSource;
    }

    /**
     * 设置 物料来源
     *
     * @param materielSource 物料来源
     */
    public void setMaterielSource(String materielSource) {
        this.materielSource = materielSource;
    }
}
