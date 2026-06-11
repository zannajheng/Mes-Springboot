package com.wangziyang.mes.basedata.request;

import com.wangziyang.mes.common.BasePageReq;

/**
 * 通用主数据分页对象
 * @author wangziyang
 * @since 2020/03/15
 */
public class SpTableManagerReq extends BasePageReq {

    /**
     * 表名称（用于模糊搜索）
     */
    private String tableName;

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }
}
