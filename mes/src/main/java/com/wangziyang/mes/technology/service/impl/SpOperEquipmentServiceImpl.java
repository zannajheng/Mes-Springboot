package com.wangziyang.mes.technology.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.technology.entity.SpOperEquipment;
import com.wangziyang.mes.technology.mapper.SpOperEquipmentMapper;
import com.wangziyang.mes.technology.service.ISpOperEquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SpOperEquipmentServiceImpl extends ServiceImpl<SpOperEquipmentMapper, SpOperEquipment> implements ISpOperEquipmentService {

    @Autowired
    private SpOperEquipmentMapper spOperEquipmentMapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result saveOrUpdateEquipment(SpOperEquipment equipment) {
        if (equipment.getId() == null || equipment.getId().isEmpty()) {
            equipment.setId(null);
            save(equipment);
        } else {
            updateById(equipment);
        }
        return Result.success(equipment, "保存成功");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result deleteById(String id) {
        removeById(id);
        return Result.success("删除成功");
    }

    @Override
    public List<SpOperEquipment> listByOperContentId(String operContentId) {
        return spOperEquipmentMapper.selectByOperContentId(operContentId);
    }

    @Override
    public List<SpOperEquipment> listByBomOperRelationId(String bomOperRelationId) {
        QueryWrapper<SpOperEquipment> wrapper = new QueryWrapper<>();
        wrapper.eq("bom_oper_relation_id", bomOperRelationId);
        return list(wrapper);
    }
}
