package com.wangziyang.mes.technology.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.technology.entity.SpOperMaterialList;

import java.util.List;

public interface ISpOperMaterialListService extends IService<SpOperMaterialList> {

    Result saveOrUpdateMaterial(SpOperMaterialList material);

    Result deleteById(String id);

    List<SpOperMaterialList> listByOperContentId(String operContentId);

    List<SpOperMaterialList> listByBomOperRelationId(String bomOperRelationId);
}
