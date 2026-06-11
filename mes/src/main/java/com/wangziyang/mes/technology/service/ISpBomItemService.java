package com.wangziyang.mes.technology.service;

import com.wangziyang.mes.technology.entity.SpBomItem;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-28
 */
public interface ISpBomItemService extends IService<SpBomItem> {

    List<SpBomItem> listByBomId(String bomId);
}
