package com.wangziyang.mes.technology.service;

import com.wangziyang.mes.technology.entity.SpOper;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 工序服务类
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-14
 */
public interface ISpOperService extends IService<SpOper> {

    /**
     * 生成工序编号（格式：GX0000001）
     * @return 工序编号
     */
    String generateOperNo();
}
