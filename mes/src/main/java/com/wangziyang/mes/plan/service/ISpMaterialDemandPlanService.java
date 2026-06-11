package com.wangziyang.mes.plan.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wangziyang.mes.plan.entity.SpMaterialDemandPlan;

import java.util.List;

public interface ISpMaterialDemandPlanService extends IService<SpMaterialDemandPlan> {

    List<SpMaterialDemandPlan> listByOrderCode(String orderCode);

    List<SpMaterialDemandPlan> listByProductSerialNo(String productSerialNo);

    String generateStockInOrderNo();

    boolean generateStockInOrder(List<String> ids);
}
