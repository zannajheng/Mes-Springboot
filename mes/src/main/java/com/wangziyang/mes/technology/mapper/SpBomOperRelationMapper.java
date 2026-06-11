package com.wangziyang.mes.technology.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wangziyang.mes.technology.entity.SpBomOperRelation;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 * BOM与工序关系Mapper接口
 * </p>
 *
 * @author WangZiYang
 * @since 2024-01-01
 */
@Mapper
public interface SpBomOperRelationMapper extends BaseMapper<SpBomOperRelation> {

    /**
     * 根据BOM头ID查询关系列表
     *
     * @param bomId BOM头ID
     * @return 关系列表
     */
    List<SpBomOperRelation> selectByBomId(String bomId);

    /**
     * 根据BOM编号查询关系列表
     *
     * @param bomCode BOM编号
     * @return 关系列表
     */
    List<SpBomOperRelation> selectByBomCode(String bomCode);

    /**
     * 根据BOM头ID删除关系
     *
     * @param bomId BOM头ID
     */
    void deleteByBomId(String bomId);

    /**
     * 查询未锁定的关系列表
     *
     * @return 未锁定的关系列表
     */
    List<SpBomOperRelation> selectUnlocked();
}