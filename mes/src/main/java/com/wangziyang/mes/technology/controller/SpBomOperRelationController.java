package com.wangziyang.mes.technology.controller;

import com.wangziyang.mes.technology.entity.SpBom;
import com.wangziyang.mes.technology.entity.SpBomItem;
import com.wangziyang.mes.technology.entity.SpBomOperRelation;
import com.wangziyang.mes.technology.entity.SpOper;
import com.wangziyang.mes.technology.service.ISpBomItemService;
import com.wangziyang.mes.technology.service.ISpBomOperRelationService;
import com.wangziyang.mes.technology.service.ISpBomService;
import com.wangziyang.mes.technology.service.ISpOperService;
import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
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
 * BOM与工序关系控制器
 * </p>
 *
 * @author WangZiYang
 * @since 2024-01-01
 */
@Controller
@RequestMapping("/technology/bom-oper-relation")
public class SpBomOperRelationController extends BaseController {

    @Autowired
    private ISpBomOperRelationService iSpBomOperRelationService;

    @Autowired
    private ISpBomService iSpBomService;

    @Autowired
    private ISpBomItemService iSpBomItemService;

    @Autowired
    private ISpOperService iSpOperService;

    /**
     * 工艺流程管理页面
     */
    @GetMapping("/list-ui")
    public String listUi(Model model) {
        List<SpBom> bomList = iSpBomService.list();
        model.addAttribute("bomList", bomList);
        return "technology/bomoperrelation/list";
    }

    /**
     * 编辑工艺规划页面
     */
    @GetMapping("/edit-ui")
    public String editUi(@RequestParam("bomId") String bomId, Model model) {
        SpBom bom = iSpBomService.getById(bomId);
        List<SpBomItem> bomItems = iSpBomItemService.listByBomId(bomId);
        List<SpOper> operList = iSpOperService.list();
        List<SpBomOperRelation> relations = iSpBomOperRelationService.listByBomId(bomId);
        
        model.addAttribute("bom", bom);
        model.addAttribute("bomItems", bomItems);
        model.addAttribute("operList", operList);
        model.addAttribute("relations", relations);
        
        boolean isLocked = iSpBomOperRelationService.isBomLocked(bomId);
        model.addAttribute("isLocked", isLocked);
        
        return "technology/bomoperrelation/edit";
    }

    /**
     * 工艺内容编制页面
     */
    @GetMapping("/content-ui")
    public String contentUi(@RequestParam("bomId") String bomId, Model model) {
        SpBom bom = iSpBomService.getById(bomId);
        List<SpBomOperRelation> relations = iSpBomOperRelationService.listByBomId(bomId);
        
        model.addAttribute("bom", bom);
        model.addAttribute("relations", relations);
        
        return "technology/bomoperrelation/content";
    }

    /**
     * 查询BOM列表（用于下拉选择）
     */
    @ApiOperation("查询BOM列表")
    @GetMapping("/bom-list")
    @ResponseBody
    public Result getBomList() {
        List<SpBom> list = iSpBomService.list();
        return Result.success(list);
    }

    /**
     * 根据BOM头ID查询关系列表
     */
    @ApiOperation("根据BOM头ID查询关系列表")
    @ApiImplicitParams({@ApiImplicitParam(name = "bomId", value = "BOM头ID", required = true)})
    @PostMapping("/list-by-bom")
    @ResponseBody
    public Result listByBomId(@RequestParam("bomId") String bomId) {
        List<SpBomOperRelation> list = iSpBomOperRelationService.listByBomId(bomId);
        Map<String, Object> result = new HashMap<>();
        result.put("records", list);
        result.put("total", list.size());
        return Result.success(result);
    }

    /**
     * 根据BOM编号查询关系列表
     */
    @ApiOperation("根据BOM编号查询关系列表")
    @ApiImplicitParams({@ApiImplicitParam(name = "bomCode", value = "BOM编号", required = true)})
    @GetMapping("/list-by-bom-code")
    @ResponseBody
    public Result listByBomCode(@RequestParam("bomCode") String bomCode) {
        List<SpBomOperRelation> list = iSpBomOperRelationService.listByBomCode(bomCode);
        return Result.success(list);
    }

    /**
     * 保存BOM与工序关系（批量）
     */
    @ApiOperation("保存BOM与工序关系")
    @ApiImplicitParams({@ApiImplicitParam(name = "relations", value = "关系列表", required = true)})
    @PostMapping("/save-batch")
    @ResponseBody
    public Result saveBatch(@RequestBody List<SpBomOperRelation> relations) {
        return iSpBomOperRelationService.saveBatchRelation(relations);
    }

    /**
     * 更新BOM与工序关系
     */
    @ApiOperation("更新BOM与工序关系")
    @ApiImplicitParams({@ApiImplicitParam(name = "relation", value = "关系实体", required = true)})
    @PostMapping("/update")
    @ResponseBody
    public Result update(@RequestBody SpBomOperRelation relation) {
        return iSpBomOperRelationService.updateRelation(relation);
    }

    /**
     * 删除BOM与工序关系
     */
    @ApiOperation("删除BOM与工序关系")
    @ApiImplicitParams({@ApiImplicitParam(name = "id", value = "主键ID", required = true)})
    @PostMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam("id") String id) {
        return iSpBomOperRelationService.deleteRelation(id);
    }

    /**
     * 根据BOM头ID删除所有关系
     */
    @ApiOperation("根据BOM头ID删除所有关系")
    @ApiImplicitParams({@ApiImplicitParam(name = "bomId", value = "BOM头ID", required = true)})
    @PostMapping("/delete-by-bom")
    @ResponseBody
    public Result deleteByBomId(@RequestParam("bomId") String bomId) {
        return iSpBomOperRelationService.deleteByBomId(bomId);
    }

    /**
     * 锁定产品工艺
     */
    @ApiOperation("锁定产品工艺")
    @ApiImplicitParams({@ApiImplicitParam(name = "bomId", value = "BOM头ID", required = true)})
    @PostMapping("/lock")
    @ResponseBody
    public Result lockBomProcess(@RequestParam("bomId") String bomId) {
        return iSpBomOperRelationService.lockBomProcess(bomId);
    }

    /**
     * 解锁产品工艺
     */
    @ApiOperation("解锁产品工艺")
    @ApiImplicitParams({@ApiImplicitParam(name = "bomId", value = "BOM头ID", required = true)})
    @PostMapping("/unlock")
    @ResponseBody
    public Result unlockBomProcess(@RequestParam("bomId") String bomId) {
        return iSpBomOperRelationService.unlockBomProcess(bomId);
    }

    /**
     * 检查BOM工艺是否已锁定
     */
    @ApiOperation("检查BOM工艺是否已锁定")
    @ApiImplicitParams({@ApiImplicitParam(name = "bomId", value = "BOM头ID", required = true)})
    @GetMapping("/is-locked")
    @ResponseBody
    public Result isBomLocked(@RequestParam("bomId") String bomId) {
        boolean locked = iSpBomOperRelationService.isBomLocked(bomId);
        return Result.success(locked);
    }

    /**
     * 添加工序配置页面
     */
    @GetMapping("/add-or-update-ui")
    public String addOrUpdateUi(@RequestParam(required = false) String id, Model model) {
        if (id != null) {
            model.addAttribute("result", iSpBomOperRelationService.getById(id));
        }
        return "technology/bomoperrelation/addOrUpdate";
    }

    /**
     * 初始化BOM工艺关系（根据BOM子项创建默认关系）
     */
    @ApiOperation("初始化BOM工艺关系")
    @ApiImplicitParams({@ApiImplicitParam(name = "bomId", value = "BOM头ID", required = true)})
    @PostMapping("/init")
    @ResponseBody
    public Result initRelation(@RequestParam("bomId") String bomId) {
        SpBom bom = iSpBomService.getById(bomId);
        if (bom == null) {
            return Result.fail("BOM不存在");
        }

        List<SpBomItem> bomItems = iSpBomItemService.listByBomId(bomId);
        if (bomItems.isEmpty()) {
            return Result.fail("BOM无子项数据");
        }

        List<SpBomOperRelation> existingRelations = iSpBomOperRelationService.listByBomId(bomId);
        if (!existingRelations.isEmpty()) {
            return Result.fail("该BOM已存在工艺关系，如需重新初始化请先删除原有关系");
        }

        List<SpBomOperRelation> relations = new ArrayList<>();
        int sortNum = 1;
        for (SpBomItem item : bomItems) {
            SpBomOperRelation relation = new SpBomOperRelation();
            relation.setBomId(bomId);
            relation.setBomCode(bom.getBomCode());
            relation.setMaterielDesc(bom.getMaterielDesc());
            relation.setNodeName(item.getMaterielItemDesc());
            relation.setNodeLevel(0);
            relation.setBomItemId(item.getId());
            relation.setSortNum(sortNum++);
            relation.setIsLocked("0");
            relations.add(relation);
        }

        return iSpBomOperRelationService.saveBatchRelation(relations);
    }
}