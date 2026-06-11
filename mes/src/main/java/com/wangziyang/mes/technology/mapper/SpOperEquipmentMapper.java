package com.wangziyang.mes.technology.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wangziyang.mes.technology.entity.SpOperEquipment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SpOperEquipmentMapper extends BaseMapper<SpOperEquipment> {

    List<SpOperEquipment> selectByOperContentId(String operContentId);

    List<SpOperEquipment> selectByBomOperRelationId(String bomOperRelationId);
}
