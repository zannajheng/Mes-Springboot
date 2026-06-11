package com.wangziyang.mes.technology.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.technology.entity.SpBomOperRelation;
import com.wangziyang.mes.technology.entity.SpOper;
import com.wangziyang.mes.technology.entity.SpOperContent;
import com.wangziyang.mes.technology.mapper.SpBomOperRelationMapper;
import com.wangziyang.mes.technology.mapper.SpOperContentMapper;
import com.wangziyang.mes.technology.mapper.SpOperMapper;
import com.wangziyang.mes.technology.service.ISpOperContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SpOperContentServiceImpl extends ServiceImpl<SpOperContentMapper, SpOperContent> implements ISpOperContentService {

    @Autowired
    private SpOperContentMapper spOperContentMapper;

    @Autowired
    private SpBomOperRelationMapper spBomOperRelationMapper;

    @Autowired
    private SpOperMapper spOperMapper;

    @Override
    public List<SpOperContent> listByBomId(String bomId) {
        return spOperContentMapper.selectByBomId(bomId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result saveOrUpdateContent(SpOperContent content) {
        if (content.getId() == null || content.getId().isEmpty()) {
            content.setId(null);
            save(content);
        } else {
            updateById(content);
        }
        return Result.success(content);
    }

    @Override
    public Result getByBomOperRelationId(String bomOperRelationId) {
        SpOperContent content = spOperContentMapper.selectByRelationId(bomOperRelationId);
        return Result.success(content);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result initFromBomOperRelation(String bomOperRelationId) {
        SpOperContent existing = spOperContentMapper.selectByRelationId(bomOperRelationId);
        if (existing != null) {
            return Result.success(existing);
        }

        SpBomOperRelation relation = spBomOperRelationMapper.selectById(bomOperRelationId);
        if (relation == null) {
            return Result.fail("工艺关系不存在");
        }

        SpOperContent content = new SpOperContent();
        content.setBomOperRelationId(relation.getId());
        content.setBomId(relation.getBomId());
        content.setBomCode(relation.getBomCode());
        content.setBomItemId(relation.getBomItemId());
        content.setNodeName(relation.getNodeName());
        content.setOperId(relation.getOperId());
        content.setOper(relation.getOper());
        content.setOperDesc(relation.getOperDesc());
        content.setWorkCenter(relation.getWorkCenter());
        content.setWorkCenterDesc(relation.getWorkCenterDesc());
        content.setOperTime(relation.getOperTime());
        content.setProduceCycle(relation.getProduceCycle());
        content.setStatus("draft");

        if (relation.getOperId() != null && !relation.getOperId().isEmpty()) {
            SpOper oper = spOperMapper.selectById(relation.getOperId());
            if (oper != null) {
                content.setIsProducePlan(oper.getIsProducePlan());
            }
        }

        save(content);
        return Result.success(content);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result deleteById(String id) {
        removeById(id);
        return Result.success("删除成功");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result complete(String id) {
        SpOperContent content = new SpOperContent();
        content.setId(id);
        content.setStatus("completed");
        boolean updated = updateById(content);
        if (!updated) {
            return Result.fail("数据不存在");
        }
        return Result.success("编制完成");
    }

    @Override
    public List<SpOperContent> listByBomOperRelationId(String bomOperRelationId) {
        return spOperContentMapper.selectByBomOperRelationId(bomOperRelationId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result deleteByRelationId(String bomOperRelationId) {
        // 删除工艺内容
        QueryWrapper<SpOperContent> wrapper = new QueryWrapper<>();
        wrapper.eq("bom_oper_relation_id", bomOperRelationId);
        remove(wrapper);
        // 将工艺关系解锁，使其不再出现在可编制列表中
        SpBomOperRelation relation = spBomOperRelationMapper.selectById(bomOperRelationId);
        if (relation != null) {
            relation.setIsLocked("0");
            spBomOperRelationMapper.updateById(relation);
        }
        return Result.success("删除成功");
    }
}
