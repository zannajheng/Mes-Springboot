package com.wangziyang.mes.basedata.common.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wangziyang.mes.basedata.common.request.QueryTableNameDataReq;
import com.wangziyang.mes.basedata.common.service.TableNameDataService;
import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * @author wangziyang
 *
 * <p>对基础数据表查询控制器</p>
 * @since 2020/03/11
 */
@Controller
@RequestMapping("basedata/common")
public class TableNameDataController extends BaseController {
    /**
     * 通用基础数据service
     */
    @Autowired
    private TableNameDataService tableNameDataService;

    /**
     * 根据参数查询的表名称，拼接SQL语句分页查询
     *
     * @param req 请求参数
     * @return Result 执行结果
     */
    @ApiOperation("根据参数查询的表名称，拼接SQL语句分页查询")
    @ApiImplicitParams({@ApiImplicitParam(name = "req", value = "tableName,tableNameId", defaultValue = "请求参数")})
    @PostMapping("/page")
    @ResponseBody
    public Result page(QueryTableNameDataReq req) throws Exception {
        if (StringUtils.isEmpty(req.getTableName()) || StringUtils.isEmpty(req.getTableNameId())) {
            throw new Exception("未选中表信息");
        }
        IPage<Map<String, String>> page = tableNameDataService.queryTableNameDataList(req);
        return Result.success(page);
    }
}