CREATE TABLE IF NOT EXISTS `sp_material_demand_plan` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `order_code` varchar(64) DEFAULT NULL COMMENT '所属订单编号',
  `product_serial_no` varchar(64) DEFAULT NULL COMMENT '产品序列号',
  `task_serial_no` varchar(64) DEFAULT NULL COMMENT '任务序列号',
  `product_name` varchar(200) DEFAULT NULL COMMENT '产品物料名称',
  `work_center_name` varchar(200) DEFAULT NULL COMMENT '加工单元名称',
  `work_center_code` varchar(64) DEFAULT NULL COMMENT '加工单元编码',
  `materiel_code` varchar(64) DEFAULT NULL COMMENT '物料编码',
  `materiel_name` varchar(200) DEFAULT NULL COMMENT '物料名称',
  `require_qty` decimal(10,2) DEFAULT 1 COMMENT '需求数量',
  `unit` varchar(50) DEFAULT NULL COMMENT '计量单位',
  `demand_date` datetime DEFAULT NULL COMMENT '需求日期',
  `delivery_status` varchar(20) DEFAULT 'undelivered' COMMENT '配送状态: undelivered未下发, delivered已下发',
  `stock_out_qty` decimal(10,2) DEFAULT 0 COMMENT '出库数量',
  `net_require_qty` decimal(10,2) DEFAULT 0 COMMENT '净需求数量',
  `stock_in_status` varchar(20) DEFAULT 'not_generated' COMMENT '生成入库单状态: not_generated未生成, generated已生成',
  `stock_in_order_no` varchar(64) DEFAULT NULL COMMENT '入库单单号',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_username` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_username` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `idx_order_code` (`order_code`),
  KEY `idx_product_serial` (`product_serial_no`),
  KEY `idx_materiel_code` (`materiel_code`),
  KEY `idx_work_center` (`work_center_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='物料需求计划表';

INSERT INTO `sp_sys_menu` (`id`, `code`, `name`, `url`, `parent_id`, `grade`, `sort_num`, `type`, `permission`, `icon`, `descr`, `create_time`, `create_username`, `update_time`, `update_username`)
VALUES (
  'material_demand_plan',
  'material_demand_plan',
  '物料需求计划（明细）',
  '/plan/material-demand/list-ui',
  '12',
  '2',
  1,
  '1',
  'material:demand:view',
  'fa fa-th-large',
  '物料需求计划（明细）管理',
  NOW(),
  'admin',
  NOW(),
  'admin'
);

INSERT INTO `sp_sys_menu` (`id`, `code`, `name`, `url`, `parent_id`, `grade`, `sort_num`, `type`, `permission`, `icon`, `descr`, `create_time`, `create_username`, `update_time`, `update_username`)
VALUES (
  'material_demand_plan_week',
  'material_demand_plan_week',
  '物料需求计划（按周）',
  '/plan/material-demand-week/list-ui',
  '12',
  '2',
  2,
  '1',
  'material:demand:week:view',
  'fa fa-th-large',
  '物料需求计划（按周）管理',
  NOW(),
  'admin',
  NOW(),
  'admin'
);
