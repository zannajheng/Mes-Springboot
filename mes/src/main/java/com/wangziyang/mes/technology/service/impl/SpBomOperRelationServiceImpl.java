package com.wangziyang.mes.technology.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangziyang.mes.technology.entity.SpBomOperRelation;
import com.wangziyang.mes.technology.mapper.SpBomOperRelationMapper;
import com.wangziyang.mes.technology.service.ISpBomOperRelationService;
import com.wangziyang.mes.common.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 * BOM与工序关系服务实现类
 * </p>
 *
 * @author WangZiYang
 * @since 2024-01-01
 */
@Service
public class SpBomOperRelationServiceImpl extends ServiceImpl<SpBomOperRelationMapper, SpBomOperRelation> implements ISpBomOperRelationService {

    private static final Logger logger = LoggerFactory.getLogger(SpBomOperRelationServiceImpl.class);

    @Autowired
    private SpBomOperRelationMapper spBomOperRelationMapper;

    @Override
    public List<SpBomOperRelation> listByBomId(String bomId) {
        return spBomOperRelationMapper.selectByBomId(bomId);
    }

    @Override
    public List<SpBomOperRelation> listByBomCode(String bomCode) {
        return spBomOperRelationMapper.selectByBomCode(bomCode);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result saveBatchRelation(List<SpBomOperRelation> bomOperRelations) {
        if (bomOperRelations == null || bomOperRelations.isEmpty()) {
            return Result.success();
        }
        saveBatch(bomOperRelations);
        return Result.success();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result updateRelation(SpBomOperRelation bomOperRelation) {
        if (bomOperRelation == null || bomOperRelation.getId() == null) {
            return Result.fail("参数无效");
        }

        QueryWrapper<SpBomOperRelation> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("id", bomOperRelation.getId());
        SpBomOperRelation existing = getOne(queryWrapper);
        
        if (existing == null) {
            return Result.fail("数据不存在");
        }

        if ("1".equals(existing.getIsLocked())) {
            return Result.fail("该工艺已锁定，无法修改");
        }

        boolean updated = updateById(bomOperRelation);
        if (!updated) {
            logger.warn("更新工艺关系失败，未找到匹配的记录，ID: {}", bomOperRelation.getId());
            return Result.fail("更新失败，未找到对应的记录");
        }
        return Result.success();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result deleteRelation(String id) {
        if (id == null || id.isEmpty()) {
            return Result.fail("参数无效");
        }

        QueryWrapper<SpBomOperRelation> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("id", id);
        SpBomOperRelation existing = getOne(queryWrapper);

        if (existing == null) {
            return Result.fail("数据不存在");
        }

        if ("1".equals(existing.getIsLocked())) {
            return Result.fail("该工艺已锁定，无法删除");
        }

        removeById(id);
        return Result.success();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result deleteByBomId(String bomId) {
        if (bomId == null || bomId.isEmpty()) {
            return Result.fail("参数无效");
        }

        List<SpBomOperRelation> relations = listByBomId(bomId);
        for (SpBomOperRelation relation : relations) {
            if ("1".equals(relation.getIsLocked())) {
                return Result.fail("该工艺已锁定，无法删除");
            }
        }

        spBomOperRelationMapper.deleteByBomId(bomId);
        return Result.success();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result lockBomProcess(String bomId, List<String> ids) {
        if (bomId == null || bomId.isEmpty()) {
            return Result.fail("参数无效");
        }

        if (ids == null || ids.isEmpty()) {
            return Result.fail("请先勾选要锁定的节点");
        }

        List<SpBomOperRelation> relations = listByBomId(bomId);
        if (relations.isEmpty()) {
            return Result.fail("未找到相关工艺数据");
        }

        List<SpBomOperRelation> toLock = relations.stream()
                .filter(r -> ids.contains(r.getId()) && "0".equals(r.getIsLocked()))
                .collect(java.util.stream.Collectors.toList());

        if (toLock.isEmpty()) {
            return Result.fail("勾选的节点中不存在未锁定数据，无需锁定");
        }

        for (SpBomOperRelation relation : toLock) {
            relation.setIsLocked("1");
            updateById(relation);
        }

        return Result.success("锁定成功");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result unlockBomProcess(String bomId, List<String> ids) {
        if (bomId == null || bomId.isEmpty()) {
            return Result.fail("参数无效");
        }

        if (ids == null || ids.isEmpty()) {
            return Result.fail("请先勾选要解锁的节点");
        }

        List<SpBomOperRelation> relations = listByBomId(bomId);
        if (relations.isEmpty()) {
            return Result.fail("未找到相关工艺数据");
        }

        List<SpBomOperRelation> toUnlock = relations.stream()
                .filter(r -> ids.contains(r.getId()) && "1".equals(r.getIsLocked()))
                .collect(java.util.stream.Collectors.toList());

        if (toUnlock.isEmpty()) {
            return Result.fail("勾选的节点中不存在已锁定数据，无需解锁");
        }

        for (SpBomOperRelation relation : toUnlock) {
            relation.setIsLocked("0");
            updateById(relation);
        }

        return Result.success("解锁成功");
    }

    @Override
    public boolean isBomLocked(String bomId) {
        if (bomId == null || bomId.isEmpty()) {
            return false;
        }

        QueryWrapper<SpBomOperRelation> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("bom_id", bomId);
        queryWrapper.eq("is_locked", "1");
        return count(queryWrapper) > 0;
    }
}