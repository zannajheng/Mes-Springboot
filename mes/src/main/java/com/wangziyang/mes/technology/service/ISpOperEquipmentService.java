package com.wangziyang.mes.technology.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.technology.entity.SpOperEquipment;

import java.util.List;

public interface ISpOperEquipmentService extends IService<SpOperEquipment> {

    Result saveOrUpdateEquipment(SpOperEquipment equipment);

    Result deleteById(String id);

    List<SpOperEquipment> listByOperContentId(String operContentId);

    List<SpOperEquipment> listByBomOperRelationId(String bomOperRelationId);
}
