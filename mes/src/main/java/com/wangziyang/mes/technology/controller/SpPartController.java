package com.wangziyang.mes.technology.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.technology.entity.SpPart;
import com.wangziyang.mes.technology.request.SpPartReq;
import com.wangziyang.mes.technology.service.ISpPartService;
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
 * 零部件前端控制器
 * </p>
 *
 * @author WangZiYang
 * @since 2024-05-28
 */
@Controller
@RequestMapping("/technology/part")
public class SpPartController extends BaseController {

    @Autowired
    private ISpPartService iSpPartService;

    @ApiOperation("零部件管理界面UI")
    @GetMapping("/list-ui")
    public String listUI(Model model) {
        return "technology/part/list";
    }

    @ApiOperation("零部件新增/编辑界面")
    @GetMapping("/add-or-update-ui")
    public String addOrUpdateUI(Model model, SpPart record) {
        if (StringUtils.isNotEmpty(record.getId())) {
            SpPart result = iSpPartService.getById(record.getId());
            model.addAttribute("result", result);
        }
        return "technology/part/addOrUpdate";
    }

    @ApiOperation("零部件分页查询")
    @ApiImplicitParams({ @ApiImplicitParam(name = "req", value = "请求参数", defaultValue = "请求参数") })
    @PostMapping("/page")
    @ResponseBody
    public Result page(SpPartReq req) {
        QueryWrapper<SpPart> qw = new QueryWrapper<>();
        qw.eq("is_deleted", "0");
        if (StringUtils.isNotEmpty(req.getPartNoLike())) {
            qw.like("part_no", req.getPartNoLike());
        }
        if (StringUtils.isNotEmpty(req.getPartNameLike())) {
            qw.like("part_name", req.getPartNameLike());
        }
        qw.orderByDesc("create_time");
        IPage<SpPart> result = iSpPartService.page(req, qw);
        return Result.success(result);
    }

    @ApiOperation("零部件新增/更新")
    @PostMapping("/add-or-update")
    @ResponseBody
    public Result addOrUpdate(SpPart record) {
        if (StringUtils.isEmpty(record.getId())) {
            record.setPartNo(iSpPartService.generatePartNo());
            if (StringUtils.isEmpty(record.getDeleted())) {
                record.setDeleted("0");
            }
        }
        iSpPartService.saveOrUpdate(record);
        return Result.success(record.getId());
    }

    @ApiOperation("删除零部件")
    @PostMapping("/delete")
    @ResponseBody
    public Result delete(SpPart req) throws Exception {
        iSpPartService.removeById(req.getId());
        return Result.success();
    }

    @ApiOperation("批量删除零部件")
    @PostMapping("/delete-batch")
    @ResponseBody
    public Result deleteBatch(String ids) throws Exception {
        if (StringUtils.isNotEmpty(ids)) {
            for (String id : ids.split(",")) {
                SpPart part = iSpPartService.getById(id);
                if (part != null) {
                    part.setDeleted("1");
                    iSpPartService.updateById(part);
                }
            }
        }
        return Result.success();
    }
}