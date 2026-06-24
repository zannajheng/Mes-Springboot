package com.wangziyang.mes.basedata.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wangziyang.mes.basedata.entity.SpTableManager;
import com.wangziyang.mes.basedata.entity.SpTableManagerItem;
import com.wangziyang.mes.basedata.request.SpTableManagerReq;
import com.wangziyang.mes.basedata.service.ISpTableManagerService;
import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 *
 * 主数据表头控制器
 *
 *
 * @author WangZiYang
 * @since 2020-03-06
 */
@Api(tags = "主数据管理")
@Controller
@RequestMapping("/basedata/manager")
public class SpTableManagerController extends BaseController {
    /**
     * 主数据平台管理服务
     */
    @Autowired
    public ISpTableManagerService iSpTableManagerService;

    /**
     * 主数据管理平台界面
     *
     * @param model 模型
     * @return 主数据管理平台界面
     */
    @ApiOperation("主数据管理平台UI")
    @ApiImplicitParams({@ApiImplicitParam(name = "model", value = "模型", defaultValue = "模型")})
    @GetMapping("/list-ui")
    public String listUI(Model model) {
        return "basedata/manager/list";
    }


    /**
     * 主数据表头分页查询
     *
     * @param req 请求参数
     * @return Result 执行结果
     */
    @ApiOperation("主数据表头分页查询")
    @ApiImplicitParams({@ApiImplicitParam(name = "req", value = "请求参数", defaultValue = "请求参数")})
    @PostMapping("/page")
    @ResponseBody
    public Result page(SpTableManagerReq req) {
        QueryWrapper<SpTableManager> qw = new QueryWrapper<>();
        if (StringUtils.isNotEmpty(req.getTableName())) {
            qw.like("table_name", req.getTableName());
        }
        qw.orderByDesc(req.getOrderBy());
        IPage result = iSpTableManagerService.page(req, qw);
        return Result.success(result);
    }

    /**
     * 根据表名称查询该表的全部字段
     *
     * @param req 请求参数
     * @return Result 执行结果
     */
    @ApiOperation("主根据表名称查询该表的全部字段")
    @ApiImplicitParams({@ApiImplicitParam(name = "req", value = "表名称", defaultValue = "请求参数")})
    @PostMapping("/by/tableName")
    @ResponseBody
    public Result queryTableFieldByName(SpTableManager req) throws Exception {
        List<SpTableManagerItem> result = iSpTableManagerService.queryTableFieldByName(req);
        return Result.success(result);
    }
}

