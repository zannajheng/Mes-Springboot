package com.wangziyang.mes.technology.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.technology.entity.SpOperTechDoc;

import java.util.List;

public interface ISpOperTechDocService extends IService<SpOperTechDoc> {

    Result saveOrUpdateDoc(SpOperTechDoc doc);

    Result deleteById(String id);

    List<SpOperTechDoc> listByOperContentId(String operContentId);

    List<SpOperTechDoc> listByBomOperRelationId(String bomOperRelationId);
}
