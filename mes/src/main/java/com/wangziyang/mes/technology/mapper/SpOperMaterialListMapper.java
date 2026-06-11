package com.wangziyang.mes.technology.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wangziyang.mes.technology.entity.SpOperMaterialList;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SpOperMaterialListMapper extends BaseMapper<SpOperMaterialList> {

    List<SpOperMaterialList> selectByOperContentId(String operContentId);

    List<SpOperMaterialList> selectByBomOperRelationId(String bomOperRelationId);
}
