package com.wangziyang.mes.basedata.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wangziyang.mes.basedata.entity.SpMaterile;
import com.wangziyang.mes.basedata.request.spMaterileReq;
import com.wangziyang.mes.basedata.service.ISpMaterileService;
import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.technology.entity.SpFlow;
import com.wangziyang.mes.technology.service.ISpFlowService;
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

import java.util.Objects;
import java.util.List;

/**
 * <p>
 * 物料控制器
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-19
 */
@Controller
@RequestMapping("/basedata/materile")
public class SpMaterileController extends BaseController {

    /**
     * 物料服务
     *
     * @date 2020-07-07
     */
    @Autowired
    private ISpMaterileService iSpMaterileService;
    /**
     * 流程服务
     */
    @Autowired
    private ISpFlowService iSpFlowService;

    /**
     * 物料管理界面
     *
     * @param model 模型
     * @return 物料管理界面
     */
    @ApiOperation("物料管理界面UI")
    @ApiImplicitParams({ @ApiImplicitParam(name = "model", value = "模型", defaultValue = "模型") })
    @GetMapping("/list-ui")
    public String listUI(Model model) {
        return "basedata/materile/list";
    }

    /**
     * 物料管理修改界面
     *
     * @param model  模型
     * @param record 平台表对象
     * @return 更改界面
     */
    @ApiOperation("物料管理修改界面")
    @GetMapping("/add-or-update-ui")
    public String addOrUpdateUI(Model model, SpMaterile record) {
        if (StringUtils.isNotEmpty(record.getId())) {
            SpMaterile spMaterile = iSpMaterileService.getById(record.getId());
            model.addAttribute("result", spMaterile);
        }
        return "basedata/materile/addOrUpdate";
    }

    /**
     * 物料管理界面分页查询
     *
     * @param req 请求参数
     * @return Result 执行结果
     */
    @ApiOperation("物料管理界面分页查询")
    @ApiImplicitParams({ @ApiImplicitParam(name = "req", value = "请求参数", defaultValue = "请求参数") })
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
        if (StringUtils.isNotEmpty(req.getMatType())) {
            queryWrapper.eq("mat_type", req.getMatType());
        }
        if (StringUtils.isNotEmpty(req.getMaterielSource())) {
            queryWrapper.eq("materiel_source", req.getMaterielSource());
        }
        IPage result = iSpMaterileService.page(req, queryWrapper);
        return Result.success(result);
    }

    /**
     * 物料管理修改、新增
     *
     * @param record 物料实体类
     * @return 执行结果
     */
    @ApiOperation("生成物料编码")
    @GetMapping("/generate-materiel-code")
    @ResponseBody
    public Result generateMaterielCode() {
        QueryWrapper<SpMaterile> queryWrapper = new QueryWrapper<>();
        queryWrapper.select("materiel");
        queryWrapper.orderByDesc("materiel");
        queryWrapper.last("LIMIT 1");
        List<SpMaterile> list = iSpMaterileService.list(queryWrapper);
        String newCode = "M000001";
        if (list != null && !list.isEmpty()) {
            String lastCode = list.get(0).getMateriel();
            if (lastCode != null && lastCode.startsWith("M")) {
                try {
                    int num = Integer.parseInt(lastCode.substring(1));
                    newCode = "M" + String.format("%06d", num + 1);
                } catch (NumberFormatException e) {
                    newCode = "M000001";
                }
            }
        }
        return Result.success(newCode);
    }

    @ApiOperation("物料管理修改、新增")
    @PostMapping("/add-or-update")
    @ResponseBody
    public Result addOrUpdate(SpMaterile record) {
        if (StrUtil.isNotBlank(record.getFlowId())) {
            SpFlow spflow = iSpFlowService.getById(record.getFlowId());
            if (Objects.nonNull(spflow)) {
                record.setFlowDesc(spflow.getFlowDesc());
            }
        }
        if (StrUtil.isBlank(record.getMateriel())) {
            return Result.fail("物料编码不能为空");
        }
        if (record.getDemandLeadTime() != null && record.getDemandLeadTime() < 1) {
            return Result.fail("物料需求提前期不可为0，至少为1天");
        }
        iSpMaterileService.saveOrUpdate(record);
        return Result.success();
    }

    /**
     * 删除物料信息
     *
     * @param req 请求参数
     * @return Result 执行结果
     */
    @ApiOperation("删除物料信息")
    @ApiImplicitParams({ @ApiImplicitParam(name = "req", value = "物料实体", defaultValue = "物料实体") })
    @PostMapping("/delete")
    @ResponseBody
    public Result deleteByTableNameId(SpMaterile req) throws Exception {
        iSpMaterileService.removeById(req.getId());
        return Result.success();
    }

    @ApiOperation("批量删除物料信息")
    @PostMapping("/delete-batch")
    @ResponseBody
    public Result deleteBatch(String ids) throws Exception {
        if (StrUtil.isNotBlank(ids)) {
            java.util.List<String> idList = java.util.Arrays.asList(ids.split(","));
            for (String id : idList) {
                iSpMaterileService.removeById(id);
            }
        }
        return Result.success();
    }
}
