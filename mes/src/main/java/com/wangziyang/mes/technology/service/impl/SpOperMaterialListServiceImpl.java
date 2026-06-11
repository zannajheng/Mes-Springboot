package com.wangziyang.mes.technology.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.technology.entity.SpOperMaterialList;
import com.wangziyang.mes.technology.mapper.SpOperMaterialListMapper;
import com.wangziyang.mes.technology.service.ISpOperMaterialListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SpOperMaterialListServiceImpl extends ServiceImpl<SpOperMaterialListMapper, SpOperMaterialList> implements ISpOperMaterialListService {

    @Autowired
    private SpOperMaterialListMapper spOperMaterialListMapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result saveOrUpdateMaterial(SpOperMaterialList material) {
        if (material.getId() == null || material.getId().isEmpty()) {
            material.setId(null);
            save(material);
        } else {
            updateById(material);
        }
        return Result.success(material, "保存成功");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result deleteById(String id) {
        removeById(id);
        return Result.success("删除成功");
    }

    @Override
    public List<SpOperMaterialList> listByOperContentId(String operContentId) {
        return spOperMaterialListMapper.selectByOperContentId(operContentId);
    }

    @Override
    public List<SpOperMaterialList> listByBomOperRelationId(String bomOperRelationId) {
        QueryWrapper<SpOperMaterialList> wrapper = new QueryWrapper<>();
        wrapper.eq("bom_oper_relation_id", bomOperRelationId);
        wrapper.orderByAsc("sort_num");
        return list(wrapper);
    }
}
