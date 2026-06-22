package com.wangziyang.mes.technology.controller;


import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.technology.dto.SpBomDto;
import com.wangziyang.mes.technology.entity.SpBom;
import com.wangziyang.mes.technology.entity.SpBomItem;
import com.wangziyang.mes.technology.request.SpBomReq;
import com.wangziyang.mes.technology.service.ISpBomItemService;
import com.wangziyang.mes.technology.service.ISpBomService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * BOM前端控制器
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-28
 */
@Controller
@RequestMapping("/technology/bom")
public class SpBomController extends BaseController {
    /**
     * bom服务
     */
    @Autowired
    private ISpBomService iSpBomService;

    @Autowired
    private ISpBomItemService iSpBomItemService;

    /**
     * 工艺BOM管理界面
     *
     * @param model 模型
     * @return 工艺BOM管理界面
     */
    @ApiOperation("工艺BOM管理界面UI")
    @ApiImplicitParams({@ApiImplicitParam(name = "model", value = "模型", defaultValue = "模型")})
    @GetMapping("/list-ui")
    public String listUI(Model model) {

        return "technology/bom/list";
    }


    /**
     * 工艺BOM管理修改界面
     *
     * @param model 模型
     * @param spBom bom实体
     * @return 更改界面
     */
    @ApiOperation("工艺BOM管理修改界面")
    @GetMapping("/add-or-update-ui")
    public String addOrUpdateUI(Model model, SpBom spBom) throws Exception {
        if (StringUtils.isNotEmpty(spBom.getId())) {
            SpBom result = iSpBomService.getById(spBom.getId());
            model.addAttribute("result", result);
            List<SpBomItem> bomItems = iSpBomItemService.listByBomId(spBom.getId());
            model.addAttribute("bomItems", bomItems);
        }

        return "technology/bom/addOrUpdate";
    }


    /**
     * 工艺BOM分页查询
     *
     * @param req 请求参数
     * @return Result 执行结果
     */
    @ApiOperation("工艺BOM分页分页查询")
    @ApiImplicitParams({@ApiImplicitParam(name = "req", value = "请求参数", defaultValue = "请求参数")})
    @PostMapping("/page")
    @ResponseBody
    public Result page(SpBomReq req) {
        QueryWrapper qw = new QueryWrapper();
        qw.eq("is_deleted", "0");
        if (StringUtils.isNotEmpty(req.getMaterielCodeLike())) {
            qw.like("materiel_code", req.getMaterielCodeLike());
        }
        IPage result = iSpBomService.page(req,qw);
        return Result.success(result);
    }

    /**
     * 工艺BOM修改、新增
     *
     * @param spBom 物料实体类
     * @return 执行结果
     */
    @ApiOperation("工艺BOM修改、新增")
    @PostMapping("/add-or-update")
    @ResponseBody
    public Result addOrUpdate(@RequestBody SpBomDto record) {
        SpBom spBom = new SpBom();
        BeanUtils.copyProperties(record, spBom);
        iSpBomService.saveOrUpdate(spBom);

        List<SpBomItem> items = record.getSpBomItems();
        if (CollectionUtil.isNotEmpty(items)) {
            if (StringUtils.isNotEmpty(record.getId())) {
                iSpBomItemService.remove(new QueryWrapper<SpBomItem>().eq("bom_head_id", record.getId()));
                for (SpBomItem item : items) {
                    item.setId(null);
                    item.setBomHeadId(record.getId());
                }
            } else {
                for (SpBomItem item : items) {
                    item.setBomHeadId(spBom.getId());
                }
            }
            iSpBomItemService.saveOrUpdateBatch(items);
        }
        return Result.success(spBom.getId());
    }


    /**
     * 删除工艺BOM
     *
     * @param spBom 请求参数
     * @return Result 执行结果
     */
    @ApiOperation("删除工艺BOM")
    @ApiImplicitParams({@ApiImplicitParam(name = "req", value = "工艺BOM", defaultValue = "工艺BOM")})
    @PostMapping("/delete")
    @ResponseBody
    public Result deleteByTableNameId(SpBom spBom) throws Exception {
        iSpBomService.removeById(spBom.getId());
        return Result.success();
    }

    @ApiOperation("批量删除工艺BOM")
    @PostMapping("/delete-batch")
    @ResponseBody
    public Result deleteBatch(String ids) throws Exception {
        if (StringUtils.isNotEmpty(ids)) {
            for (String id : ids.split(",")) {
                SpBom spBom = iSpBomService.getById(id);
                if (spBom != null) {
                    spBom.setDeleted("1");
                    iSpBomService.updateById(spBom);
                }
            }
        }
        return Result.success();
    }

}
