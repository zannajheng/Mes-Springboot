package com.wangziyang.mes.technology.controller;

import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.technology.entity.SpBom;
import com.wangziyang.mes.technology.entity.SpBomOperRelation;
import com.wangziyang.mes.technology.entity.SpOperContent;
import com.wangziyang.mes.technology.entity.SpOperEquipment;
import com.wangziyang.mes.technology.entity.SpOperMaterialList;
import com.wangziyang.mes.technology.entity.SpOperTechDoc;
import com.wangziyang.mes.technology.service.ISpBomOperRelationService;
import com.wangziyang.mes.technology.service.ISpBomService;
import com.wangziyang.mes.technology.service.ISpOperContentService;
import com.wangziyang.mes.technology.service.ISpOperEquipmentService;
import com.wangziyang.mes.technology.service.ISpOperMaterialListService;
import com.wangziyang.mes.technology.service.ISpOperTechDocService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.ByteArrayOutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/technology/oper-content")
public class SpOperContentController extends BaseController {

    @Autowired
    private ISpOperContentService iSpOperContentService;

    @Autowired
    private ISpBomService iSpBomService;

    @Autowired
    private ISpBomOperRelationService iSpBomOperRelationService;

    @Autowired
    private ISpOperEquipmentService iSpOperEquipmentService;

    @Autowired
    private ISpOperTechDocService iSpOperTechDocService;

    @Autowired
    private ISpOperMaterialListService iSpOperMaterialListService;

    @GetMapping("/list-ui")
    public String listUi(Model model) {
        List<SpBom> bomList = iSpBomService.list();
        model.addAttribute("bomList", bomList);
        return "technology/opercontent/list";
    }

    @GetMapping("/edit-ui")
    public String editUi(@RequestParam("bomOperRelationId") String bomOperRelationId, Model model) {
        SpBomOperRelation relation = iSpBomOperRelationService.getById(bomOperRelationId);
        if (relation == null) {
            return "redirect:/technology/oper-content/list-ui";
        }
        List<SpOperContent> contents = iSpOperContentService.listByBomOperRelationId(bomOperRelationId);
        SpOperContent content = null;
        if (contents != null && !contents.isEmpty()) {
            for (SpOperContent c : contents) {
                // 跳过历史遗留的残缺数据（id为空或bomId为空）
                if (c.getId() == null || c.getId().isEmpty() || c.getBomId() == null || c.getBomId().isEmpty()) {
                    try {
                        iSpOperContentService.removeById(c.getId());
                    } catch (Exception ignored) {
                    }
                } else {
                    content = c;
                    break;
                }
            }
        }
        if (content == null) {
            content = new SpOperContent();
            content.setBomOperRelationId(relation.getId());
            content.setBomId(relation.getBomId());
            content.setBomCode(relation.getBomCode());
            content.setBomItemId(relation.getBomItemId());
            content.setNodeName(relation.getNodeName());
            content.setOperId(relation.getOperId());
            content.setOper(relation.getOper());
            content.setOperDesc(relation.getOperDesc());
            content.setWorkCenter(relation.getWorkCenter());
            content.setWorkCenterDesc(relation.getWorkCenterDesc());
            content.setOperTime(relation.getOperTime());
            content.setProduceCycle(relation.getProduceCycle());
            content.setIsProducePlan("是");
            content.setIsNeedInspect("否");
            content.setStatus("draft");
        }
        model.addAttribute("relation", relation);
        model.addAttribute("content", content);
        return "technology/opercontent/edit";
    }

    @ApiOperation("分页查询工艺内容")
    @PostMapping("/page")
    @ResponseBody
    public Result page(@RequestParam(value = "bomId", required = false) String bomId,
                       @RequestParam(value = "page", defaultValue = "1") Integer pageNum,
                       @RequestParam(value = "limit", defaultValue = "10") Integer pageSize) {
        Page<SpOperContent> page = new Page<>(pageNum, pageSize);
        QueryWrapper<SpOperContent> wrapper = new QueryWrapper<>();
        if (bomId != null && !bomId.isEmpty()) {
            wrapper.eq("bom_id", bomId);
        }
        wrapper.orderByDesc("create_time");
        IPage<SpOperContent> result = iSpOperContentService.page(page, wrapper);
        return Result.success(result);
    }

    @ApiOperation("根据BOM ID查询已锁定的工艺关系（可编制内容）")
    @GetMapping("/locked-relations")
    @ResponseBody
    public Result getLockedRelations(@RequestParam("bomId") String bomId) {
        QueryWrapper<SpBomOperRelation> wrapper = new QueryWrapper<>();
        wrapper.eq("bom_id", bomId);
        wrapper.eq("is_locked", "1");
        wrapper.orderByAsc("sort_num");
        List<SpBomOperRelation> list = iSpBomOperRelationService.list(wrapper);
        return Result.success(list);
    }

    @ApiOperation("根据BOM ID查询工艺内容列表")
    @GetMapping("/list-by-bom")
    @ResponseBody
    public Result listByBomId(@RequestParam("bomId") String bomId) {
        List<SpOperContent> list = iSpOperContentService.listByBomId(bomId);
        return Result.success(list);
    }

    @ApiOperation("根据工艺关系ID查询工艺内容")
    @GetMapping("/get-by-relation")
    @ResponseBody
    public Result getByBomOperRelationId(@RequestParam("bomOperRelationId") String bomOperRelationId) {
        return iSpOperContentService.getByBomOperRelationId(bomOperRelationId);
    }

    @ApiOperation("初始化工艺内容")
    @PostMapping("/init")
    @ResponseBody
    public Result init(@RequestParam("bomOperRelationId") String bomOperRelationId) {
        return iSpOperContentService.initFromBomOperRelation(bomOperRelationId);
    }

    @ApiOperation("保存工艺内容")
    @PostMapping("/save")
    @ResponseBody
    public Result save(@RequestBody SpOperContent content) {
        return iSpOperContentService.saveOrUpdateContent(content);
    }

    @ApiOperation("删除工艺内容")
    @PostMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam("id") String id) {
        return iSpOperContentService.deleteById(id);
    }

    @ApiOperation("完成编制")
    @PostMapping("/complete")
    @ResponseBody
    public Result complete(@RequestParam("id") String id) {
        return iSpOperContentService.complete(id);
    }

    @ApiOperation("根据工艺关系ID删除工艺内容")
    @PostMapping("/delete-by-relation")
    @ResponseBody
    public Result deleteByRelationId(@RequestParam("bomOperRelationId") String bomOperRelationId) {
        return iSpOperContentService.deleteByRelationId(bomOperRelationId);
    }

    @ApiOperation("根据工艺内容ID查询工装设备列表")
    @GetMapping("/equipment/list")
    @ResponseBody
    public Result listEquipment(@RequestParam("operContentId") String operContentId) {
        List<SpOperEquipment> list = iSpOperEquipmentService.listByOperContentId(operContentId);
        return Result.success(list);
    }

    @ApiOperation("根据工艺关系ID查询工装设备列表")
    @GetMapping("/equipment/list-by-relation")
    @ResponseBody
    public Result listEquipmentByRelation(@RequestParam("bomOperRelationId") String bomOperRelationId) {
        List<SpOperEquipment> list = iSpOperEquipmentService.listByBomOperRelationId(bomOperRelationId);
        return Result.success(list);
    }

    @ApiOperation("保存工装设备")
    @PostMapping("/equipment/save")
    @ResponseBody
    public Result saveEquipment(@RequestBody SpOperEquipment equipment) {
        return iSpOperEquipmentService.saveOrUpdateEquipment(equipment);
    }

    @ApiOperation("删除工装设备")
    @PostMapping("/equipment/delete")
    @ResponseBody
    public Result deleteEquipment(@RequestParam("id") String id) {
        return iSpOperEquipmentService.deleteById(id);
    }

    @ApiOperation("根据工艺内容ID查询技术文档列表")
    @GetMapping("/tech-doc/list")
    @ResponseBody
    public Result listTechDoc(@RequestParam("operContentId") String operContentId) {
        List<SpOperTechDoc> list = iSpOperTechDocService.listByOperContentId(operContentId);
        return Result.success(list);
    }

    @ApiOperation("根据工艺关系ID查询技术文档列表")
    @GetMapping("/tech-doc/list-by-relation")
    @ResponseBody
    public Result listTechDocByRelation(@RequestParam("bomOperRelationId") String bomOperRelationId) {
        List<SpOperTechDoc> list = iSpOperTechDocService.listByBomOperRelationId(bomOperRelationId);
        return Result.success(list);
    }

    @ApiOperation("保存技术文档")
    @PostMapping("/tech-doc/save")
    @ResponseBody
    public Result saveTechDoc(@RequestBody SpOperTechDoc doc) {
        return iSpOperTechDocService.saveOrUpdateDoc(doc);
    }

    @ApiOperation("删除技术文档")
    @PostMapping("/tech-doc/delete")
    @ResponseBody
    public Result deleteTechDoc(@RequestParam("id") String id) {
        return iSpOperTechDocService.deleteById(id);
    }

    @ApiOperation("根据工艺内容ID查询备料清单列表")
    @GetMapping("/material/list")
    @ResponseBody
    public Result listMaterial(@RequestParam("operContentId") String operContentId) {
        List<SpOperMaterialList> list = iSpOperMaterialListService.listByOperContentId(operContentId);
        return Result.success(list);
    }

    @ApiOperation("根据工艺关系ID查询备料清单列表")
    @GetMapping("/material/list-by-relation")
    @ResponseBody
    public Result listMaterialByRelation(@RequestParam("bomOperRelationId") String bomOperRelationId) {
        List<SpOperMaterialList> list = iSpOperMaterialListService.listByBomOperRelationId(bomOperRelationId);
        return Result.success(list);
    }

    @ApiOperation("保存备料清单")
    @PostMapping("/material/save")
    @ResponseBody
    public Result saveMaterial(@RequestBody SpOperMaterialList material) {
        return iSpOperMaterialListService.saveOrUpdateMaterial(material);
    }

    @ApiOperation("删除备料清单")
    @PostMapping("/material/delete")
    @ResponseBody
    public Result deleteMaterial(@RequestParam("id") String id) {
        return iSpOperMaterialListService.deleteById(id);
    }

    @ApiOperation("查询设备库（按设备名称/用途模糊查询）")
    @GetMapping("/equipment/search-library")
    @ResponseBody
    public Result searchEquipmentLibrary(@RequestParam(value = "keyword", required = false) String keyword) {
        QueryWrapper<SpOperEquipment> wrapper = new QueryWrapper<>();
        wrapper.select("DISTINCT equipment_code", "equipment_name", "equipment_model", "equipment_usage");
        if (keyword != null && !keyword.isEmpty()) {
            wrapper.and(w -> w.like("equipment_code", keyword)
                    .or().like("equipment_name", keyword)
                    .or().like("equipment_usage", keyword));
        }
        wrapper.isNotNull("equipment_code").ne("equipment_code", "");
        wrapper.last("LIMIT 50");
        List<SpOperEquipment> list = iSpOperEquipmentService.list(wrapper);
        return Result.success(list);
    }

    @ApiOperation("查询物料库（按物料编码/名称模糊查询）")
    @GetMapping("/material/search-library")
    @ResponseBody
    public Result searchMaterialLibrary(@RequestParam(value = "keyword", required = false) String keyword) {
        QueryWrapper<SpBom> wrapper = new QueryWrapper<>();
        wrapper.select("DISTINCT materiel_code", "materiel_desc");
        if (keyword != null && !keyword.isEmpty()) {
            wrapper.and(w -> w.like("materiel_code", keyword)
                    .or().like("materiel_desc", keyword));
        }
        wrapper.isNotNull("materiel_code").ne("materiel_code", "");
        wrapper.last("LIMIT 50");
        List<SpBom> bomList = iSpBomService.list(wrapper);
        List<Map<String, Object>> materials = new ArrayList<>();
        for (SpBom bom : bomList) {
            Map<String, Object> item = new LinkedHashMap<>();
            item.put("materielCode", bom.getMaterielCode());
            item.put("materielName", bom.getMaterielDesc());
            item.put("materielSpec", "");
            item.put("materielType", "");
            materials.add(item);
        }
        return Result.success(materials);
    }

    @ApiOperation("导出备料清单")
    @GetMapping("/material/export")
    public ResponseEntity<byte[]> exportMaterial(@RequestParam("bomOperRelationId") String bomOperRelationId) throws Exception {
        List<SpOperMaterialList> list = iSpOperMaterialListService.listByBomOperRelationId(bomOperRelationId);

        List<Map<String, Object>> rows = new ArrayList<>();
        int seq = 1;
        for (SpOperMaterialList mat : list) {
            Map<String, Object> row = new LinkedHashMap<>();
            row.put("序号", seq++);
            row.put("物料编码", mat.getMaterielCode());
            row.put("物料名称", mat.getMaterielName());
            row.put("物料规格", mat.getMaterielSpec());
            row.put("物料类型", mat.getMaterielType());
            row.put("需求数量", mat.getRequireQty() != null ? mat.getRequireQty().stripTrailingZeros().toPlainString() : "1");
            rows.add(row);
        }

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ExcelWriter writer = ExcelUtil.getWriter(true);
        try {
            writer.write(rows, true);
            writer.flush(baos);
        } finally {
            writer.close();
        }

        byte[] bytes = baos.toByteArray();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"));
        headers.set(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + URLEncoder.encode("备料清单.xlsx", "UTF-8"));
        return new ResponseEntity<>(bytes, headers, HttpStatus.OK);
    }
}
