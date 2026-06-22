package com.wangziyang.mes.technology.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.technology.entity.SpFlow;
import com.wangziyang.mes.technology.request.SpFlowReq;
import com.wangziyang.mes.technology.service.ISpFlowService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * <p>
 * 流程控制器
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-14
 */
@Controller
@RequestMapping("/basedata/flow")
public class SpFlowController extends BaseController {

    @Autowired
    public ISpFlowService iSpFlowService;

    Logger logger = LoggerFactory.getLogger(SpFlowController.class);

    /**
     * 流程信息分页查询
     *
     * @param req 请求参数
     * @return Result 执行结果
     */
    @ApiOperation("流程信息分页查询")
    @ApiImplicitParams({ @ApiImplicitParam(name = "req", value = "请求参数", defaultValue = "请求参数") })
    @PostMapping("/page")
    @ResponseBody
    public Result page(SpFlowReq req, @RequestParam(required = false) String flowLike) {
        logger.info("流程分页查询，flowLike=" + flowLike + ", req.flowLike=" + req.getFlowLike());
        QueryWrapper<SpFlow> qw = new QueryWrapper<>();
        String keyword = StringUtils.isNotEmpty(flowLike) ? flowLike : req.getFlowLike();
        if (StringUtils.isNotEmpty(keyword)) {
            qw.like("flow", keyword);
        }
        com.baomidou.mybatisplus.extension.plugins.pagination.Page<SpFlow> page = new com.baomidou.mybatisplus.extension.plugins.pagination.Page<>(
                req.getCurrent(), req.getSize());
        IPage result = iSpFlowService.page(page, qw);
        return Result.success(result);
    }

    /**
     * 流程全部信息查询
     *
     * @return Result 执行结果
     */
    @ApiOperation("流程全部信息查询")
    @GetMapping("/list")
    @ResponseBody
    public Result list() {
        QueryWrapper queryWrapper = new QueryWrapper();
        // queryWrapper.eq("is_deleted", "0");
        List<SpFlow> list = iSpFlowService.list(queryWrapper);
        return Result.success(list);
    }

    @ApiOperation("批量删除流程信息")
    @PostMapping("/delete")
    @ResponseBody
    public Result deleteBatch(String ids) {
        if (StringUtils.isNotEmpty(ids)) {
            String[] idArray = ids.split(",");
            for (String id : idArray) {
                iSpFlowService.removeById(id);
            }
        }
        return Result.success();
    }

}
