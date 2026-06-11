package com.wangziyang.mes.technology.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.technology.entity.SpBomItem;
import com.wangziyang.mes.technology.service.ISpBomItemService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * BOM子项前端控制器
 * </p>
 *
 * @author WangZiYang
 * @since 2024-01-01
 */
@Api(tags = "BOM子项管理")
@Controller
@RequestMapping("/technology/bom-item")
public class SpBomItemController extends BaseController {

    @Autowired
    private ISpBomItemService iSpBomItemService;

    /**
     * 根据BOM头ID查询子项列表
     */
    @ApiOperation("根据BOM头ID查询子项列表")
    @ApiImplicitParams({@ApiImplicitParam(name = "bomId", value = "BOM头ID", required = true)})
    @GetMapping("/list-by-bom")
    @ResponseBody
    public Result listByBomId(@RequestParam("bomId") String bomId) {
        List<SpBomItem> list = iSpBomItemService.listByBomId(bomId);
        return Result.success(list);
    }

    /**
     * 删除BOM子项
     */
    @ApiOperation("删除BOM子项")
    @ApiImplicitParams({@ApiImplicitParam(name = "id", value = "主键ID", required = true)})
    @PostMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam("id") String id) {
        iSpBomItemService.removeById(id);
        return Result.success();
    }

    /**
     * 根据BOM头ID删除所有子项
     */
    @ApiOperation("根据BOM头ID删除所有子项")
    @ApiImplicitParams({@ApiImplicitParam(name = "bomId", value = "BOM头ID", required = true)})
    @PostMapping("/delete-by-bom")
    @ResponseBody
    public Result deleteByBomId(@RequestParam("bomId") String bomId) {
        iSpBomItemService.remove(new QueryWrapper<SpBomItem>().eq("bom_head_id", bomId));
        return Result.success();
    }
}
