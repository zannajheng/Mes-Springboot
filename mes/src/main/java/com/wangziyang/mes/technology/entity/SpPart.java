package com.wangziyang.mes.technology.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.wangziyang.mes.common.BaseEntity;

/**
 * <p>
 * 零部件实体
 * </p>
 *
 * @author WangZiYang
 * @since 2024-05-28
 */
@TableName(value = "sp_part")
public class SpPart extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 零部件编号
     */
    private String partNo;

    /**
     * 零部件名称
     */
    private String partName;

    /**
     * 备注信息
     */
    private String remark;

    /**
     * 状态(00:删除;01:正常;02:禁用)
     */
    @TableField(value = "is_deleted")
    private String deleted;

    public String getPartNo() {
        return partNo;
    }

    public void setPartNo(String partNo) {
        this.partNo = partNo;
    }

    public String getPartName() {
        return partName;
    }

    public void setPartName(String partName) {
        this.partName = partName;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getDeleted() {
        return deleted;
    }

    public void setDeleted(String deleted) {
        this.deleted = deleted;
    }

    @Override
    public String toString() {
        return "SpPart{" +
                "partNo='" + partNo + '\'' +
                ", partName='" + partName + '\'' +
                ", remark='" + remark + '\'' +
                ", deleted='" + deleted + '\'' +
                '}';
    }
}