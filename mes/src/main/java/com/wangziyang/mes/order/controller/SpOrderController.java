package com.wangziyang.mes.order.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.order.entity.SpOrder;
import com.wangziyang.mes.order.request.SpOrderReq;
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
     * @param record 生产订单对象
     * @return 更改界面
     */
    @ApiOperation("生产订单修改界面")
    @GetMapping("/add-or-update-ui")
    public String addOrUpdateUI(Model model, SpOrder record) {
        if (StringUtils.isNotEmpty(record.getId())) {
            SpOrder spOrder = iSpOrderService.getById(record.getId());
            model.addAttribute("result", spOrder);
        } else {
            model.addAttribute("result", new SpOrder());
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
    public Result page(SpOrderReq req) {
        QueryWrapper<SpOrder> queryWrapper = new QueryWrapper<>();
        if (StringUtils.isNotEmpty(req.getOrderCodeLike())) {
            queryWrapper.like("order_code", req.getOrderCodeLike());
        }
        if (StringUtils.isNotEmpty(req.getOrderDescriptionLike())) {
            queryWrapper.like("order_description", req.getOrderDescriptionLike());
        }
        if (StringUtils.isNotEmpty(req.getMaterielLike())) {
            queryWrapper.like("materiel", req.getMaterielLike());
        }
        if (StringUtils.isNotEmpty(req.getMaterielDescLike())) {
            queryWrapper.like("materiel_desc", req.getMaterielDescLike());
        }
        if (req.getStatue() != null) {
            queryWrapper.eq("statue", req.getStatue());
        }
        queryWrapper.orderByDesc("create_time");
        IPage result = iSpOrderService.page(req, queryWrapper);
        return Result.success(result);
    }

    /**
     * 生产订单修改、新增
     *
     * @param record 生产订单实体类
     * @return 执行结果
     */
    @ApiOperation("生产订单修改、新增")
    @PostMapping("/add-or-update")
    @ResponseBody
    public Result addOrUpdate(SpOrder record) {
        if (StringUtils.isEmpty(record.getId())) {
            record.setStatue(1);
        }
        iSpOrderService.saveOrUpdate(record);
        return Result.success(record.getId());
    }


    /**
     * 删除生产订单界
     *
     * @param req 请求参数
     * @return Result 执行结果
     */
    @ApiOperation("删除生产订单")
    @PostMapping("/delete")
    @ResponseBody
    public Result delete(SpOrder req) {
        iSpOrderService.removeById(req.getId());
        return Result.success();
    }

    @ResponseBody
    @RequestMapping(value = "/gantt/list", method = RequestMethod.POST, produces = "application/json")
    public Result getListGantt(SpOrderReq req) {
        QueryWrapper<SpOrder> qw = new QueryWrapper<>();
        if (StringUtils.isNotEmpty(req.getOrderCodeLike())) {
            qw.like("order_code", req.getOrderCodeLike());
        }
        if (StringUtils.isNotEmpty(req.getOrderDescriptionLike())) {
            qw.like("order_description", req.getOrderDescriptionLike());
        }
        if (StringUtils.isNotEmpty(req.getMaterielLike())) {
            qw.like("materiel", req.getMaterielLike());
        }
        if (StringUtils.isNotEmpty(req.getMaterielDescLike())) {
            qw.like("materiel_desc", req.getMaterielDescLike());
        }
        if (req.getStatue() != null) {
            qw.eq("statue", req.getStatue());
        }
        List<SpOrder> orderList = iSpOrderService.list(qw);

        //甘特图总数据
        List<Map<String, Object>> result = new ArrayList<>();
        for (SpOrder order : orderList) {
            Map<String, Object> map = new HashMap<>(8);
            map.put("id", order.getId());
            map.put("name", order.getOrderCode());
            map.put("desc", "物料:" + order.getMateriel() + " 数量:" + order.getQty());
            map.put("cssClass", "redLabel");

            List<Map<String, Object>> values = new ArrayList<>();
            Map<String, Object> value = new HashMap<>(8);
            if (order.getPlanStartTime() != null) {
                value.put("from", "/Date(" + order.getPlanStartTime() + ")/");
            } else {
                value.put("from", "/Date(" + System.currentTimeMillis() + ")/");
            }
            if (order.getPlanEndTime() != null) {
                value.put("to", "/Date(" + order.getPlanEndTime() + ")/");
            } else {
                value.put("to", "/Date(" + (System.currentTimeMillis() + 86400000) + ")/");
            }
            value.put("label", order.getMaterielDesc());
            value.put("desc", "完工进度");
            value.put("customClass", "ganttGreen");
            value.put("dataObj", order.getId());
            values.add(value);

            map.put("values", values);
            result.add(map);
        }
        return Result.success(result);
    }
}
