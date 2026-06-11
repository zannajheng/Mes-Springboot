package com.wangziyang.mes.plan.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangziyang.mes.plan.entity.SpMaterialDemandPlan;
import com.wangziyang.mes.plan.mapper.SpMaterialDemandPlanMapper;
import com.wangziyang.mes.plan.service.ISpMaterialDemandPlanService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

@Service
public class SpMaterialDemandPlanServiceImpl extends ServiceImpl<SpMaterialDemandPlanMapper, SpMaterialDemandPlan> implements ISpMaterialDemandPlanService {

    private static final AtomicInteger sequence = new AtomicInteger(0);

    @Override
    public List<SpMaterialDemandPlan> listByOrderCode(String orderCode) {
        QueryWrapper<SpMaterialDemandPlan> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("order_code", orderCode);
        queryWrapper.orderByAsc("work_center_code", "materiel_code");
        return list(queryWrapper);
    }

    @Override
    public List<SpMaterialDemandPlan> listByProductSerialNo(String productSerialNo) {
        QueryWrapper<SpMaterialDemandPlan> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("product_serial_no", productSerialNo);
        return list(queryWrapper);
    }

    @Override
    public String generateStockInOrderNo() {
        LocalDateTime now = LocalDateTime.now();
        String dateStr = now.format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
        int seq = sequence.incrementAndGet();
        if (seq > 9999) {
            sequence.set(1);
            seq = 1;
        }
        return "RKD" + dateStr + String.format("%04d", seq);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean generateStockInOrder(List<String> ids) {
        if (ids == null || ids.isEmpty()) {
            return false;
        }

        String stockInOrderNo = generateStockInOrderNo();

        for (String id : ids) {
            SpMaterialDemandPlan plan = getById(id);
            if (plan != null) {
                plan.setStockInStatus("generated");
                plan.setStockInOrderNo(stockInOrderNo);
                plan.setDeliveryStatus("delivered");
                updateById(plan);
            }
        }

        return true;
    }
}
