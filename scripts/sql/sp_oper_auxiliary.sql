-- ----------------------------
-- Table structure for sp_oper_equipment (工装设备表)
-- ----------------------------
DROP TABLE IF EXISTS `sp_oper_equipment`;
CREATE TABLE `sp_oper_equipment` (
  `id` varchar(64) NOT NULL COMMENT '主键ID',
  `oper_content_id` varchar(64) DEFAULT NULL COMMENT '工艺内容ID',
  `bom_oper_relation_id` varchar(64) DEFAULT NULL COMMENT 'BOM与工序关系ID',
  `equipment_code` varchar(255) DEFAULT NULL COMMENT '设备编码',
  `equipment_name` varchar(255) DEFAULT NULL COMMENT '设备名称',
  `equipment_model` varchar(255) DEFAULT NULL COMMENT '设备规格/型号',
  `equipment_usage` varchar(255) DEFAULT NULL COMMENT '设备用途',
  `equipment_remark` text COMMENT '备注信息',
  `require_qty` decimal(10,2) DEFAULT 1 COMMENT '需求数量',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  KEY `idx_oper_content_id` (`oper_content_id`),
  KEY `idx_bom_oper_relation_id` (`bom_oper_relation_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = '工装设备表';

-- ----------------------------
-- Table structure for sp_oper_tech_doc (技术文档表)
-- ----------------------------
DROP TABLE IF EXISTS `sp_oper_tech_doc`;
CREATE TABLE `sp_oper_tech_doc` (
  `id` varchar(64) NOT NULL COMMENT '主键ID',
  `oper_content_id` varchar(64) DEFAULT NULL COMMENT '工艺内容ID',
  `bom_oper_relation_id` varchar(64) DEFAULT NULL COMMENT 'BOM与工序关系ID',
  `doc_desc` varchar(500) DEFAULT NULL COMMENT '技术文档描述',
  `doc_images` text COMMENT '文档图片（JSON数组）',
  `doc_files` text COMMENT '文档附件（JSON数组）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  KEY `idx_oper_content_id` (`oper_content_id`),
  KEY `idx_bom_oper_relation_id` (`bom_oper_relation_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = '技术文档表';

-- ----------------------------
-- Table structure for sp_oper_material_list (备料清单表)
-- ----------------------------
DROP TABLE IF EXISTS `sp_oper_material_list`;
CREATE TABLE `sp_oper_material_list` (
  `id` varchar(64) NOT NULL COMMENT '主键ID',
  `oper_content_id` varchar(64) DEFAULT NULL COMMENT '工艺内容ID',
  `bom_oper_relation_id` varchar(64) DEFAULT NULL COMMENT 'BOM与工序关系ID',
  `materiel_code` varchar(255) DEFAULT NULL COMMENT '物料编码',
  `materiel_name` varchar(255) DEFAULT NULL COMMENT '物料名称',
  `materiel_spec` varchar(255) DEFAULT NULL COMMENT '物料规格',
  `materiel_type` varchar(255) DEFAULT NULL COMMENT '物料类型',
  `require_qty` decimal(10,2) DEFAULT 1 COMMENT '需求数量',
  `sort_num` int(11) DEFAULT 1 COMMENT '排序号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  KEY `idx_oper_content_id` (`oper_content_id`),
  KEY `idx_bom_oper_relation_id` (`bom_oper_relation_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = '备料清单表';
