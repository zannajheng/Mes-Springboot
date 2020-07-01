package com.wangziyang.mes.order.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wangziyang.mes.basedata.entity.SpMaterile;
import com.wangziyang.mes.basedata.entity.SpTableManager;
import com.wangziyang.mes.basedata.request.spMaterileReq;
import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.order.entity.SpOrder;
import com.wangziyang.mes.order.service.ISpOrderService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author WangZiYang
 * @since 2020-07-01
 */
@Controller
@RequestMapping("/order/release")
public class SpOrderController extends BaseController {

    @Autowired
    private ISpOrderService iSpOrderService;

    /**
     * 生产订单管理界面
     *
     * @param model 模型
     * @return 生产订单管理界面
     */
    @ApiOperation("生产订单管理界面界面UI")
    @ApiImplicitParams({@ApiImplicitParam(name = "model", value = "模型", defaultValue = "模型")})
    @GetMapping("/list-ui")
    public String listUI(Model model) {
        return "/order/production/list";
    }

    /**
     * 生产订单修改界面
     *
     * @param model  模型
     * @param record 平台表对象
     * @return 更改界面
     */
    @ApiOperation("生产订单修改界面")
    @GetMapping("/add-or-update-ui")
    public String addOrUpdateUI(Model model, SpTableManager record) {
        if (StringUtils.isNotEmpty(record.getId())) {
            SpOrder spOrder = iSpOrderService.getById(record.getId());
            model.addAttribute("result", spOrder);
        }
        return "/order/production/addOrUpdate";
    }


    /**
     * 生产订单界面分页查询
     *
     * @param req 请求参数
     * @return Result 执行结果
     */
    @ApiOperation("生产订单界界面分页查询")
    @ApiImplicitParams({@ApiImplicitParam(name = "req", value = "请求参数", defaultValue = "请求参数")})
    @PostMapping("/page")
    @ResponseBody
    public Result page(spMaterileReq req) {
        QueryWrapper queryWrapper = new QueryWrapper();
        if (StringUtils.isNotEmpty(req.getMaterielLike())) {
            queryWrapper.like("materiel", req.getMaterielLike());
        }
        if (StringUtils.isNotEmpty(req.getMaterielDescLike())) {
            queryWrapper.like("materiel_desc", req.getMaterielDescLike());
        }
        IPage result = iSpOrderService.page(req, queryWrapper);
        return Result.success(result);
    }

    /**
     * 生产订单界修改、新增
     *
     * @param record 物料实体类
     * @return 执行结果
     */
    @ApiOperation("生产订单界修改、新增")
    @PostMapping("/add-or-update")
    @ResponseBody
    public Result addOrUpdate(SpMaterile record) {
        SpOrder spOrder = iSpOrderService.getById(record.getFlowId());
        iSpOrderService.saveOrUpdate(spOrder);
        return Result.success();
    }


    /**
     * 删除生产订单界
     *
     * @param req 请求参数
     * @return Result 执行结果
     */
    @ApiOperation("删除生产订单界")
    @ApiImplicitParams({@ApiImplicitParam(name = "req", value = "物料实体", defaultValue = "物料实体")})
    @PostMapping("/delete")
    @ResponseBody
    public Result deleteByTableNameId(SpMaterile req) throws Exception {
        iSpOrderService.removeById(req.getId());
        return Result.success();
    }

    @ResponseBody
    @RequestMapping(value = "/gantt/list", method = RequestMethod.POST, produces = "application/json")
    public Result getListGantt(Map<String, Object> params) throws Exception {
        List<Map<String, Object>> result = new ArrayList<>();
        for (int i = 0; i < 20; i++) {
            Map<String, Object> map = new HashMap<>(8);
            map.put("id", "id" + (i + 1));
            if (i % 2 == 0) {
                map.put("name", "物料编码" + (i + 1));
                map.put("desc", "计划：");
            } else {
                map.put("desc", "实际：");
            }
            map.put("cssClass", "redLabel");

            List<Map<String, Object>> values = new ArrayList<>();
            Map<String, Object> value = new HashMap<>(8);
            value.put("from", "/Date(" + System.currentTimeMillis() + ")/");
            value.put("to", "/Date(" + (System.currentTimeMillis() + 1000000000) + ")/");
            value.put("label", "极板");
            value.put("desc", "悬停悬停悬停悬停悬停...");
            value.put("customClass", "ganttGreen");
            if (i == 1) {
                value.put("customClass", "ganttOrange");
            }
            if (i == 2) {
                value.put("customClass", "ganttRed");
            }
            value.put("dataObj", "1");
            values.add(value);
            map.put("values", values);
            result.add(map);
        }
        return Result.success(result);
    }
}
