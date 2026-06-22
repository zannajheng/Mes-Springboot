package com.wangziyang.mes.plan.controller;

import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.plan.entity.SpMaterialDemandPlan;
import com.wangziyang.mes.plan.request.SpMaterialDemandPlanReq;
import com.wangziyang.mes.plan.service.ISpMaterialDemandPlanService;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.ByteArrayOutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/plan/material-demand")
public class SpMaterialDemandPlanController extends BaseController {

    @Autowired
    private ISpMaterialDemandPlanService iSpMaterialDemandPlanService;

    @ApiOperation("物料需求计划（明细）界面UI")
    @GetMapping("/list-ui")
    public String listUI(Model model) {
        return "plan/materialdemand/list";
    }

    @ApiOperation("物料需求计划分页查询")
    @PostMapping("/page")
    @ResponseBody
    public Result page(SpMaterialDemandPlanReq req) {
        QueryWrapper<SpMaterialDemandPlan> qw = new QueryWrapper<>();
        if (StringUtils.isNotEmpty(req.getOrderCodeLike())) {
            qw.like("order_code", req.getOrderCodeLike());
        }
        if (StringUtils.isNotEmpty(req.getProductSerialNoLike())) {
            qw.like("product_serial_no", req.getProductSerialNoLike());
        }
        if (StringUtils.isNotEmpty(req.getTaskSerialNoLike())) {
            qw.like("task_serial_no", req.getTaskSerialNoLike());
        }
        if (StringUtils.isNotEmpty(req.getStockInStatus())) {
            qw.eq("stock_in_status", req.getStockInStatus());
        }
        if (StringUtils.isNotEmpty(req.getDeliveryStatus())) {
            qw.eq("delivery_status", req.getDeliveryStatus());
        }
        if (StringUtils.isNotEmpty(req.getMaterielCodeLike())) {
            qw.like("materiel_code", req.getMaterielCodeLike());
        }
        if (StringUtils.isNotEmpty(req.getMaterielNameLike())) {
            qw.like("materiel_name", req.getMaterielNameLike());
        }
        qw.orderByAsc("order_code", "work_center_code", "materiel_code");
        Page<SpMaterialDemandPlan> page = new Page<>(req.getCurrent(), req.getSize());
        IPage result = iSpMaterialDemandPlanService.page(page, qw);
        return Result.success(result);
    }

    @ApiOperation("生成入库单")
    @PostMapping("/generate-stock-in")
    @ResponseBody
    public Result generateStockIn(@RequestBody Map<String, List<String>> params) {
        List<String> ids = params.get("ids");
        if (ids == null || ids.isEmpty()) {
            return Result.failure("请选择要生成入库单的物料");
        }
        boolean success = iSpMaterialDemandPlanService.generateStockInOrder(ids);
        if (success) {
            return Result.success("入库单生成成功");
        } else {
            return Result.failure("入库单生成失败");
        }
    }

    @ApiOperation("物料需求计划新增/修改")
    @PostMapping("/add-or-update")
    @ResponseBody
    public Result addOrUpdate(@RequestBody SpMaterialDemandPlan record) {
        if (StringUtils.isEmpty(record.getId())) {
            if (record.getDeliveryStatus() == null) {
                record.setDeliveryStatus("undelivered");
            }
            if (record.getStockInStatus() == null) {
                record.setStockInStatus("not_generated");
            }
        }
        iSpMaterialDemandPlanService.saveOrUpdate(record);
        return Result.success(record.getId());
    }

    @ApiOperation("删除物料需求计划")
    @PostMapping("/delete")
    @ResponseBody
    public Result delete(SpMaterialDemandPlan req) {
        iSpMaterialDemandPlanService.removeById(req.getId());
        return Result.success();
    }

    @ApiOperation("批量删除物料需求计划")
    @PostMapping("/delete-batch")
    @ResponseBody
    public Result deleteBatch(String ids) {
        if (StringUtils.isNotEmpty(ids)) {
            for (String id : ids.split(",")) {
                iSpMaterialDemandPlanService.removeById(id);
            }
        }
        return Result.success();
    }

    @ApiOperation("根据ID获取物料需求计划详情")
    @GetMapping("/get")
    @ResponseBody
    public Result get(@RequestParam("id") String id) {
        SpMaterialDemandPlan plan = iSpMaterialDemandPlanService.getById(id);
        return Result.success(plan);
    }

    @ApiOperation("物料需求计划新增/修改界面")
    @GetMapping("/add-or-update-ui")
    public String addOrUpdateUI(@RequestParam(required = false) String id, Model model) {
        if (StringUtils.isNotEmpty(id)) {
            SpMaterialDemandPlan plan = iSpMaterialDemandPlanService.getById(id);
            model.addAttribute("result", plan);
        }
        return "plan/materialdemand/addOrUpdate";
    }

    @ApiOperation("导出物料需求计划")
    @GetMapping("/export")
    public ResponseEntity<byte[]> export(SpMaterialDemandPlanReq req) throws Exception {
        QueryWrapper<SpMaterialDemandPlan> qw = new QueryWrapper<>();
        if (StringUtils.isNotEmpty(req.getOrderCodeLike())) {
            qw.like("order_code", req.getOrderCodeLike());
        }
        if (StringUtils.isNotEmpty(req.getProductSerialNoLike())) {
            qw.like("product_serial_no", req.getProductSerialNoLike());
        }
        if (StringUtils.isNotEmpty(req.getTaskSerialNoLike())) {
            qw.like("task_serial_no", req.getTaskSerialNoLike());
        }
        if (StringUtils.isNotEmpty(req.getStockInStatus())) {
            qw.eq("stock_in_status", req.getStockInStatus());
        }
        if (StringUtils.isNotEmpty(req.getDeliveryStatus())) {
            qw.eq("delivery_status", req.getDeliveryStatus());
        }
        if (StringUtils.isNotEmpty(req.getMaterielCodeLike())) {
            qw.like("materiel_code", req.getMaterielCodeLike());
        }
        if (StringUtils.isNotEmpty(req.getMaterielNameLike())) {
            qw.like("materiel_name", req.getMaterielNameLike());
        }
        qw.orderByAsc("order_code", "work_center_code", "materiel_code");

        List<SpMaterialDemandPlan> list = iSpMaterialDemandPlanService.list(qw);
        List<Map<String, Object>> rows = new ArrayList<>();
        int seq = 1;
        for (SpMaterialDemandPlan plan : list) {
            Map<String, Object> row = new LinkedHashMap<>();
            row.put("序号", seq++);
            row.put("所属订单编号", plan.getOrderCode());
            row.put("产品序列号", plan.getProductSerialNo());
            row.put("任务序列号", plan.getTaskSerialNo());
            row.put("产品物料名称", plan.getProductName());
            row.put("加工单元名称", plan.getWorkCenterName());
            row.put("物料编码", plan.getMaterielCode());
            row.put("物料名称", plan.getMaterielName());
            row.put("需求数量",
                    plan.getRequireQty() != null ? plan.getRequireQty().stripTrailingZeros().toPlainString() : "");
            row.put("计量单位", plan.getUnit());
            row.put("配送状态", "delivered".equals(plan.getDeliveryStatus()) ? "已下发" : "未下发");
            row.put("出库数量",
                    plan.getStockOutQty() != null ? plan.getStockOutQty().stripTrailingZeros().toPlainString() : "");
            row.put("净需求数量",
                    plan.getNetRequireQty() != null ? plan.getNetRequireQty().stripTrailingZeros().toPlainString()
                            : "");
            row.put("生成入库单状态", "generated".equals(plan.getStockInStatus()) ? "已生成" : "未生成");
            row.put("入库单单号", plan.getStockInOrderNo());
            row.put("备注", plan.getRemark());
            rows.add(row);
        }

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ExcelWriter writer = ExcelUtil.getWriter(true);
        try {
            writer.write(rows, true);
            writer.flush(baos);
        } finally {
            writer.close();
        }

        byte[] bytes = baos.toByteArray();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(
                MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"));
        headers.set(HttpHeaders.CONTENT_DISPOSITION,
                "attachment;filename=" + URLEncoder.encode("物料需求计划.xlsx", "UTF-8"));
        return new ResponseEntity<>(bytes, headers, HttpStatus.OK);
    }
}
