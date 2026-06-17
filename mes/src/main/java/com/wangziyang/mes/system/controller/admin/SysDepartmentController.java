package com.wangziyang.mes.system.controller.admin;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.system.entity.SysDepartment;
import com.wangziyang.mes.system.entity.SysDict;
import com.wangziyang.mes.system.request.SysDepartmentPageReq;
import com.wangziyang.mes.system.service.ISysDepartmentService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 * 系统部门前端控制器
 * </p>
 *
 * @author SongPeng
 * @since 2020-03-03
 */
@Controller
@RequestMapping("/admin/sys/department")
public class SysDepartmentController extends BaseController {

    Logger logger = LoggerFactory.getLogger(SysDepartmentController.class);

    @Autowired
    private ISysDepartmentService sysDepartmentService;

    @ApiOperation("系统部门信息列表UI")
    @ApiImplicitParams({@ApiImplicitParam(name = "model", value = "模型", defaultValue = "模型")})
    @GetMapping("/list-ui")
    public String listUI(Model model) {
        return "admin/system/department/list";
    }

    @ApiOperation("系统部门信息分页列表")
    @ApiImplicitParams({@ApiImplicitParam(name = "page", value = "模型", defaultValue = "模型")})
    @PostMapping("/page")
    @ResponseBody
    public Result page(SysDepartmentPageReq req) {
        QueryWrapper<SysDepartment> qw = new QueryWrapper<>();
        if (StringUtils.isNotEmpty(req.getNameLike())) {
            qw.like("name", req.getNameLike());
        }
        qw.orderByDesc("create_time");
        IPage result = sysDepartmentService.page(req, qw);
        return Result.success(result);
    }

    @ApiOperation("系统部门信息列表")
    @GetMapping("/list")
    @ResponseBody
    public Result list() {
        QueryWrapper<SysDepartment> qw = new QueryWrapper<>();
        qw.orderByAsc("sort_num");
        return Result.success(sysDepartmentService.list(qw));
    }

    @GetMapping("/add-or-update-ui")
    public String addOrUpdateUI(Model model, SysDict record) {
        if (StringUtils.isNotEmpty(record.getId())) {
            SysDepartment sysDepartment = sysDepartmentService.getById(record.getId());
            model.addAttribute("result", sysDepartment);
        }
        return "admin/system/department/addOrUpdate";
    }

    @PostMapping("/add-or-update")
    @ResponseBody
    public Result addOrUpdate(SysDepartment record) {
        if (StringUtils.isEmpty(record.getParentId())) {
            record.setParentId("0");
        }
        sysDepartmentService.saveOrUpdate(record);
        return Result.success(record.getId());
    }

    @PostMapping("/delete")
    @ResponseBody
    public Result delete(String id) {
        if (StringUtils.isNotEmpty(id)) {
            sysDepartmentService.removeById(id);
        }
        return Result.success();
    }
}
