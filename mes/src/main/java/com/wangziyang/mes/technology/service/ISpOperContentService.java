package com.wangziyang.mes.technology.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.technology.entity.SpOperContent;

import java.util.List;

public interface ISpOperContentService extends IService<SpOperContent> {

    List<SpOperContent> listByBomId(String bomId);

    Result saveOrUpdateContent(SpOperContent content);

    Result getByBomOperRelationId(String bomOperRelationId);

    Result initFromBomOperRelation(String bomOperRelationId);

    Result deleteById(String id);

    Result complete(String id);

    List<SpOperContent> listByBomOperRelationId(String bomOperRelationId);

    Result deleteByRelationId(String bomOperRelationId);
}
