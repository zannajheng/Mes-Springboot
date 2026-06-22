package com.wangziyang.mes.technology.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wangziyang.mes.technology.entity.SpBomOperRelation;
import com.wangziyang.mes.common.Result;

import java.util.List;

/**
 * <p>
 * BOM与工序关系服务接口
 * </p>
 *
 * @author WangZiYang
 * @since 2024-01-01
 */
public interface ISpBomOperRelationService extends IService<SpBomOperRelation> {

    /**
     * 根据BOM头ID查询关系列表
     *
     * @param bomId BOM头ID
     * @return 关系列表
     */
    List<SpBomOperRelation> listByBomId(String bomId);

    /**
     * 根据BOM编号查询关系列表
     *
     * @param bomCode BOM编号
     * @return 关系列表
     */
    List<SpBomOperRelation> listByBomCode(String bomCode);

    /**
     * 保存BOM与工序关系（批量）
     *
     * @param bomOperRelations 关系列表
     * @return 执行结果
     */
    Result saveBatchRelation(List<SpBomOperRelation> bomOperRelations);

    /**
     * 更新BOM与工序关系
     *
     * @param bomOperRelation 关系实体
     * @return 执行结果
     */
    Result updateRelation(SpBomOperRelation bomOperRelation);

    /**
     * 删除BOM与工序关系
     *
     * @param id 主键ID
     * @return 执行结果
     */
    Result deleteRelation(String id);

    /**
     * 根据BOM头ID删除所有关系
     *
     * @param bomId BOM头ID
     * @return 执行结果
     */
    Result deleteByBomId(String bomId);

    /**
     * 锁定产品工艺
     *
     * @param bomId BOM头ID
     * @param ids   勾选的节点ID列表
     * @return 执行结果
     */
    Result lockBomProcess(String bomId, List<String> ids);

    /**
     * 解锁产品工艺
     *
     * @param bomId BOM头ID
     * @param ids   勾选的节点ID列表
     * @return 执行结果
     */
    Result unlockBomProcess(String bomId, List<String> ids);

    /**
     * 检查BOM工艺是否已锁定
     *
     * @param bomId BOM头ID
     * @return 是否已锁定
     */
    boolean isBomLocked(String bomId);
}