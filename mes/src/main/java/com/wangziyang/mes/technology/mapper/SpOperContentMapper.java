package com.wangziyang.mes.technology.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wangziyang.mes.technology.entity.SpOperContent;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SpOperContentMapper extends BaseMapper<SpOperContent> {

    List<SpOperContent> selectByBomId(String bomId);

    List<SpOperContent> selectByBomOperRelationId(String bomOperRelationId);

    SpOperContent selectByRelationId(String bomOperRelationId);
}
