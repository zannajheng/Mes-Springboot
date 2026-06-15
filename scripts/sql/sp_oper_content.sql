-- ----------------------------
-- Table structure for sp_oper_content
-- ----------------------------
DROP TABLE IF EXISTS `sp_oper_content`;
CREATE TABLE `sp_oper_content` (
  `id` varchar(64) NOT NULL COMMENT '主键ID',
  `bom_oper_relation_id` varchar(64) DEFAULT NULL COMMENT 'BOM与工序关系ID',
  `bom_id` varchar(64) DEFAULT NULL COMMENT 'BOM头ID',
  `bom_code` varchar(255) DEFAULT NULL COMMENT 'BOM编号',
  `bom_item_id` varchar(64) DEFAULT NULL COMMENT 'BOM子项ID',
  `node_name` varchar(255) DEFAULT NULL COMMENT '节点名称',
  `oper_id` varchar(64) DEFAULT NULL COMMENT '工序ID',
  `oper` varchar(255) DEFAULT NULL COMMENT '工序编号',
  `oper_desc` varchar(255) DEFAULT NULL COMMENT '工序名称',
  `work_center` varchar(255) DEFAULT NULL COMMENT '加工单元',
  `work_center_desc` varchar(255) DEFAULT NULL COMMENT '加工单元名称',
  `oper_time` decimal(10,2) DEFAULT 0 COMMENT '工序工时(h)',
  `produce_cycle` decimal(10,2) DEFAULT 0 COMMENT '制造周期(h)',
  `is_produce_plan` varchar(10) DEFAULT NULL COMMENT '是否生成生产计划',
  `work_center_type` varchar(255) DEFAULT NULL COMMENT '加工单元类型',
  `oper_content` text COMMENT '工序内容（操作说明）',
  `tech_requirement` text COMMENT '技术要求',
  `oper_images` text COMMENT '工序图片（JSON数组）',
  `oper_requirement` text COMMENT '工序要求',
  `is_need_inspect` varchar(10) DEFAULT NULL COMMENT '是否需要检验',
  `inspect_images` text COMMENT '检验图片（JSON数组）',
  `attention` text COMMENT '注意事项',
  `status` varchar(20) DEFAULT NULL COMMENT '状态：draft草稿，completed已完成',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  KEY `idx_bom_id` (`bom_id`),
  KEY `idx_bom_oper_relation_id` (`bom_oper_relation_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = '工艺内容编制表';

-- 添加工艺内容编制菜单
INSERT IGNORE INTO `sp_sys_menu` VALUES ('156', 'operContent', '工艺内容编制', '/technology/oper-content/list-ui', '15', '3', 6, '0', 'user:add', 'fa fa-th-large', '', '2024-01-01 00:00:00', 'admin', '2024-01-01 00:00:00', 'admin');
