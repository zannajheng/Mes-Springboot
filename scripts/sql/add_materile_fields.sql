ALTER TABLE `sp_materile` ADD COLUMN `materiel_source` varchar(255) NULL DEFAULT NULL COMMENT '物料来源（自制/外购）' AFTER `flow_desc`;
ALTER TABLE `sp_materile` ADD COLUMN `material` varchar(255) NULL DEFAULT NULL COMMENT '材质' AFTER `materiel_source`;
ALTER TABLE `sp_materile` ADD COLUMN `demand_lead_time` int(11) NULL DEFAULT 0 COMMENT '物料需求提前期(天)' AFTER `material`;
ALTER TABLE `sp_materile` ADD COLUMN `safety_stock` decimal(10,0) NULL DEFAULT 0 COMMENT '安全库存' AFTER `demand_lead_time`;
ALTER TABLE `sp_materile` ADD COLUMN `remark` varchar(500) NULL DEFAULT NULL COMMENT '备注信息' AFTER `safety_stock`;