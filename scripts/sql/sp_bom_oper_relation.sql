-- ----------------------------
-- Table structure for sp_bom_oper_relation
-- ----------------------------
DROP TABLE IF EXISTS `sp_bom_oper_relation`;
CREATE TABLE `sp_bom_oper_relation` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键ID',
  `bom_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'BOM头ID',
  `bom_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'BOM编号',
  `materiel_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'BOM物料描述',
  `node_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '节点名称（BOM子项名称）',
  `node_level` int(11) NULL DEFAULT 0 COMMENT '节点层级',
  `bom_item_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'BOM子项ID',
  `oper_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工序ID',
  `oper` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工序编号',
  `oper_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工序名称',
  `work_center` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '加工单元编码',
  `work_center_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '加工单元名称',
  `oper_time` decimal(10,2) NULL DEFAULT 0 COMMENT '工序工时(h)',
  `produce_cycle` decimal(10,2) NULL DEFAULT 0 COMMENT '制造周期(h)',
  `sort_num` int(11) NOT NULL DEFAULT 1 COMMENT '排序号',
  `is_locked` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '是否锁定（0：未锁定，1：已锁定）',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_bom_id`(`bom_id`) USING BTREE,
  INDEX `idx_bom_code`(`bom_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'BOM与工序关系表' ROW_FORMAT = Dynamic;

-- 添加工艺流程管理菜单
INSERT INTO `sp_sys_menu` VALUES ('154', 'bomOperRelation', '工艺流程管理', '/technology/bom-oper-relation/list-ui', '15', '3', 4, '0', 'user:add', 'fa fa-th-large', '', '2024-01-01 00:00:00', 'admin', '2024-01-01 00:00:00', 'admin');
