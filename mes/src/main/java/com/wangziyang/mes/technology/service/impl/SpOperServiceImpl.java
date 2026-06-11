package com.wangziyang.mes.technology.service.impl;

import com.wangziyang.mes.technology.entity.SpOper;
import com.wangziyang.mes.technology.mapper.SpOperMapper;
import com.wangziyang.mes.technology.service.ISpOperService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 工序服务实现类
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-14
 */
@Service
public class SpOperServiceImpl extends ServiceImpl<SpOperMapper, SpOper> implements ISpOperService {

    @Override
    public String generateOperNo() {
        QueryWrapper<SpOper> qw = new QueryWrapper<>();
        qw.select("oper");
        qw.orderByDesc("oper");
        qw.last("LIMIT 1");
        SpOper lastOper = this.getOne(qw);
        
        String lastNo = lastOper != null ? lastOper.getOper() : "GX0000000";
        String numStr = StringUtils.substringAfter(lastNo, "GX");
        int num = 1;
        if (StringUtils.isNumeric(numStr)) {
            num = Integer.parseInt(numStr) + 1;
        }
        return "GX" + String.format("%07d", num);
    }
}
