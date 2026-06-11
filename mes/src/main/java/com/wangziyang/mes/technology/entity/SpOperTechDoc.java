package com.wangziyang.mes.technology.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.wangziyang.mes.common.BaseEntity;

@TableName(value = "sp_oper_tech_doc")
public class SpOperTechDoc extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private String operContentId;

    private String bomOperRelationId;

    private String docDesc;

    private String docImages;

    private String docFiles;

    public String getOperContentId() {
        return operContentId;
    }

    public void setOperContentId(String operContentId) {
        this.operContentId = operContentId;
    }

    public String getBomOperRelationId() {
        return bomOperRelationId;
    }

    public void setBomOperRelationId(String bomOperRelationId) {
        this.bomOperRelationId = bomOperRelationId;
    }

    public String getDocDesc() {
        return docDesc;
    }

    public void setDocDesc(String docDesc) {
        this.docDesc = docDesc;
    }

    public String getDocImages() {
        return docImages;
    }

    public void setDocImages(String docImages) {
        this.docImages = docImages;
    }

    public String getDocFiles() {
        return docFiles;
    }

    public void setDocFiles(String docFiles) {
        this.docFiles = docFiles;
    }
}
