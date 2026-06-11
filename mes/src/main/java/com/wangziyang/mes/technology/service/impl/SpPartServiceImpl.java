package com.wangziyang.mes.technology.service.impl;

import com.wangziyang.mes.technology.entity.SpPart;
import com.wangziyang.mes.technology.mapper.SpPartMapper;
import com.wangziyang.mes.technology.service.ISpPartService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 零部件服务实现类
 * </p>
 *
 * @author WangZiYang
 * @since 2024-05-28
 */
@Service
public class SpPartServiceImpl extends ServiceImpl<SpPartMapper, SpPart> implements ISpPartService {

    @Override
    public String generatePartNo() {
        QueryWrapper<SpPart> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("part_no");
        queryWrapper.last("LIMIT 1");
        SpPart lastPart = this.getOne(queryWrapper);
        
        String prefix = "BOM";
        int seq = 1;
        
        if (lastPart != null && lastPart.getPartNo() != null) {
            String lastNo = lastPart.getPartNo();
            if (lastNo.startsWith(prefix)) {
                try {
                    String numStr = lastNo.substring(prefix.length());
                    seq = Integer.parseInt(numStr) + 1;
                } catch (NumberFormatException e) {
                    seq = 1;
                }
            }
        }
        
        return String.format("%s%07d", prefix, seq);
    }
}