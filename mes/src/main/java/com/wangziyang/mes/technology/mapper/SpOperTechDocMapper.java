package com.wangziyang.mes.technology.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wangziyang.mes.technology.entity.SpOperTechDoc;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SpOperTechDocMapper extends BaseMapper<SpOperTechDoc> {

    List<SpOperTechDoc> selectByOperContentId(String operContentId);

    List<SpOperTechDoc> selectByBomOperRelationId(String bomOperRelationId);
}
