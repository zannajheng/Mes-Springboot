package com.wangziyang.mes.technology.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.technology.entity.*;
import com.wangziyang.mes.technology.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/technology/process-query")
public class SpProcessQueryController extends BaseController {

    @Autowired
    private ISpBomService iSpBomService;

    @Autowired
    private ISpBomItemService iSpBomItemService;

    @Autowired
    private ISpBomOperRelationService iSpBomOperRelationService;

    @Autowired
    private ISpOperContentService iSpOperContentService;

    @Autowired
    private ISpOperEquipmentService iSpOperEquipmentService;

    @Autowired
    private ISpOperTechDocService iSpOperTechDocService;

    @Autowired
    private ISpOperMaterialListService iSpOperMaterialListService;

    @GetMapping("/list-ui")
    public String listUi(Model model) {
        QueryWrapper<SpBom> qw = new QueryWrapper<>();
        qw.eq("is_deleted", "0");
        List<SpBom> bomList = iSpBomService.list(qw);
        model.addAttribute("bomList", bomList);
        return "technology/processquery/list";
    }

    @GetMapping("/detail-ui")
    public String detailUi(@RequestParam("bomId") String bomId, Model model) {
        SpBom bom = iSpBomService.getById(bomId);
        model.addAttribute("bom", bom);
        return "technology/processquery/detail";
    }

    @GetMapping("/bom-tree")
    @ResponseBody
    public Result getBomTree(@RequestParam("bomId") String bomId) {
        List<SpBomItem> bomItems = iSpBomItemService.listByBomId(bomId);
        List<SpBomOperRelation> relations = iSpBomOperRelationService.listByBomId(bomId);
        List<SpOperContent> contents = iSpOperContentService.listByBomId(bomId);

        List<TreeNode> treeNodes = new ArrayList<>();

        SpBom bom = iSpBomService.getById(bomId);
        TreeNode root = new TreeNode();
        root.setId(bomId);
        root.setName(bom.getMaterielDesc());
        root.setCode(bom.getBomCode());
        root.setLevel(0);
        root.setChildren(new ArrayList<>());
        treeNodes.add(root);

        for (SpBomItem item : bomItems) {
            TreeNode node = new TreeNode();
            node.setId(item.getId());
            node.setName(item.getMaterielItemDesc());
            node.setCode(item.getMaterielItemCode());
            node.setLevel(1);
            node.setBomItemId(item.getId());

            boolean hasRelation = false;
            boolean hasContent = false;
            String operDesc = "";
            String oper = "";

            for (SpBomOperRelation relation : relations) {
                if (relation.getBomItemId() != null && relation.getBomItemId().equals(item.getId())) {
                    hasRelation = true;
                    operDesc = relation.getOperDesc();
                    oper = relation.getOper();
                    node.setRelationId(relation.getId());
                    node.setOper(oper);
                    node.setOperDesc(operDesc);

                    for (SpOperContent content : contents) {
                        if (content.getBomOperRelationId() != null
                                && content.getBomOperRelationId().equals(relation.getId())) {
                            hasContent = true;
                            node.setContentStatus(content.getStatus());
                            break;
                        }
                    }
                    break;
                }
            }

            node.setHasRelation(hasRelation);
            node.setHasContent(hasContent);
            root.getChildren().add(node);
        }

        return Result.success(treeNodes);
    }

    @GetMapping("/oper-content")
    @ResponseBody
    public Result getOperContent(@RequestParam("relationId") String relationId) {
        SpOperContent content = null;
        List<SpOperContent> contents = iSpOperContentService.listByBomOperRelationId(relationId);
        if (contents != null && !contents.isEmpty()) {
            content = contents.get(0);
        }
        return Result.success(content);
    }

    @GetMapping("/equipment/list")
    @ResponseBody
    public Result listEquipment(@RequestParam("relationId") String relationId) {
        List<SpOperEquipment> list = iSpOperEquipmentService.listByBomOperRelationId(relationId);
        return Result.success(list);
    }

    @GetMapping("/tech-doc/list")
    @ResponseBody
    public Result listTechDoc(@RequestParam("relationId") String relationId) {
        List<SpOperTechDoc> list = iSpOperTechDocService.listByBomOperRelationId(relationId);
        return Result.success(list);
    }

    @GetMapping("/material/list")
    @ResponseBody
    public Result listMaterial(@RequestParam("relationId") String relationId) {
        List<SpOperMaterialList> list = iSpOperMaterialListService.listByBomOperRelationId(relationId);
        return Result.success(list);
    }

    public static class TreeNode {
        private String id;
        private String name;
        private String code;
        private Integer level;
        private String bomItemId;
        private String relationId;
        private String oper;
        private String operDesc;
        private boolean hasRelation;
        private boolean hasContent;
        private String contentStatus;
        private List<TreeNode> children;

        public String getId() {
            return id;
        }

        public void setId(String id) {
            this.id = id;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getCode() {
            return code;
        }

        public void setCode(String code) {
            this.code = code;
        }

        public Integer getLevel() {
            return level;
        }

        public void setLevel(Integer level) {
            this.level = level;
        }

        public String getBomItemId() {
            return bomItemId;
        }

        public void setBomItemId(String bomItemId) {
            this.bomItemId = bomItemId;
        }

        public String getRelationId() {
            return relationId;
        }

        public void setRelationId(String relationId) {
            this.relationId = relationId;
        }

        public String getOper() {
            return oper;
        }

        public void setOper(String oper) {
            this.oper = oper;
        }

        public String getOperDesc() {
            return operDesc;
        }

        public void setOperDesc(String operDesc) {
            this.operDesc = operDesc;
        }

        public boolean isHasRelation() {
            return hasRelation;
        }

        public void setHasRelation(boolean hasRelation) {
            this.hasRelation = hasRelation;
        }

        public boolean isHasContent() {
            return hasContent;
        }

        public void setHasContent(boolean hasContent) {
            this.hasContent = hasContent;
        }

        public String getContentStatus() {
            return contentStatus;
        }

        public void setContentStatus(String contentStatus) {
            this.contentStatus = contentStatus;
        }

        public List<TreeNode> getChildren() {
            return children;
        }

        public void setChildren(List<TreeNode> children) {
            this.children = children;
        }
    }
}