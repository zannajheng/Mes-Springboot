package com.wangziyang.mes.technology.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.technology.entity.SpOper;
import com.wangziyang.mes.technology.request.SpOperFormReq;
import com.wangziyang.mes.technology.request.SpOperReq;
import com.wangziyang.mes.technology.service.ISpOperService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 * 工序前端控制器
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-14
 */
@Controller
@RequestMapping("/technology/oper")
public class SpOperController extends BaseController {

    @Autowired
    private ISpOperService iSpOperService;

    @ApiOperation("工序管理界面UI")
    @GetMapping("/list-ui")
    public String listUI(Model model) {
        return "technology/oper/list";
    }

    @ApiOperation("工序新增/编辑界面")
    @GetMapping("/add-or-update-ui")
    public String addOrUpdateUI(Model model, SpOper record) {
        if (StringUtils.isNotEmpty(record.getId())) {
            SpOper result = iSpOperService.getById(record.getId());
            model.addAttribute("result", result);
        }
        return "technology/oper/addOrUpdate";
    }

    @ApiOperation("工序分页查询")
    @ApiImplicitParams({ @ApiImplicitParam(name = "req", value = "请求参数", defaultValue = "请求参数") })
    @PostMapping("/page")
    @ResponseBody
    public Result page(SpOperReq req) {
        QueryWrapper<SpOper> qw = new QueryWrapper<>();
        qw.eq("is_deleted", "0");
        if (StringUtils.isNotEmpty(req.getOperLike())) {
            qw.like("oper", req.getOperLike());
        }
        if (StringUtils.isNotEmpty(req.getOperDescLike())) {
            qw.like("oper_desc", req.getOperDescLike());
        }
        qw.orderByDesc("create_time");
        IPage<SpOper> result = iSpOperService.page(req, qw);
        return Result.success(result);
    }

    @ApiOperation("工序新增/更新")
    @PostMapping("/add-or-update")
    @ResponseBody
    public Result addOrUpdate(SpOperFormReq req) {
        SpOper record = req.toEntity();
        if (StringUtils.isEmpty(record.getId())) {
            record.setOper(iSpOperService.generateOperNo());
            if (StringUtils.isEmpty(record.getIsDeleted())) {
                record.setIsDeleted("0");
            }
        }
        iSpOperService.saveOrUpdate(record);
        return Result.success(record.getId());
    }

    @ApiOperation("删除工序")
    @PostMapping("/delete")
    @ResponseBody
    public Result delete(SpOper req) throws Exception {
        iSpOperService.removeById(req.getId());
        return Result.success();
    }

    @ApiOperation("批量删除工序")
    @PostMapping("/delete-batch")
    @ResponseBody
    public Result deleteBatch(String ids) throws Exception {
        if (StringUtils.isNotEmpty(ids)) {
            for (String id : ids.split(",")) {
                SpOper oper = iSpOperService.getById(id);
                if (oper != null) {
                    oper.setIsDeleted("1");
                    iSpOperService.updateById(oper);
                }
            }
        }
        return Result.success();
    }
}