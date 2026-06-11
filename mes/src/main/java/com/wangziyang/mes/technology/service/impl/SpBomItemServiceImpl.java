package com.wangziyang.mes.technology.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.wangziyang.mes.technology.entity.SpBomItem;
import com.wangziyang.mes.technology.mapper.SpBomItemMapper;
import com.wangziyang.mes.technology.service.ISpBomItemService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-28
 */
@Service
public class SpBomItemServiceImpl extends ServiceImpl<SpBomItemMapper, SpBomItem> implements ISpBomItemService {

    @Override
    public List<SpBomItem> listByBomId(String bomId) {
        QueryWrapper<SpBomItem> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("bom_head_id", bomId);
        return list(queryWrapper);
    }
}
