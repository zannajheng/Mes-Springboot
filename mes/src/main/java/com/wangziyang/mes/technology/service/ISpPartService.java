package com.wangziyang.mes.technology.service;

import com.wangziyang.mes.technology.entity.SpPart;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 零部件服务类
 * </p>
 *
 * @author WangZiYang
 * @since 2024-05-28
 */
public interface ISpPartService extends IService<SpPart> {

    String generatePartNo();

}