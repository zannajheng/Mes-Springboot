package com.wangziyang.mes.technology.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.technology.entity.SpOperTechDoc;
import com.wangziyang.mes.technology.mapper.SpOperTechDocMapper;
import com.wangziyang.mes.technology.service.ISpOperTechDocService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SpOperTechDocServiceImpl extends ServiceImpl<SpOperTechDocMapper, SpOperTechDoc> implements ISpOperTechDocService {

    @Autowired
    private SpOperTechDocMapper spOperTechDocMapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result saveOrUpdateDoc(SpOperTechDoc doc) {
        if (doc.getId() == null || doc.getId().isEmpty()) {
            doc.setId(null);
            save(doc);
        } else {
            updateById(doc);
        }
        return Result.success(doc, "保存成功");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result deleteById(String id) {
        removeById(id);
        return Result.success("删除成功");
    }

    @Override
    public List<SpOperTechDoc> listByOperContentId(String operContentId) {
        return spOperTechDocMapper.selectByOperContentId(operContentId);
    }

    @Override
    public List<SpOperTechDoc> listByBomOperRelationId(String bomOperRelationId) {
        QueryWrapper<SpOperTechDoc> wrapper = new QueryWrapper<>();
        wrapper.eq("bom_oper_relation_id", bomOperRelationId);
        return list(wrapper);
    }
}
