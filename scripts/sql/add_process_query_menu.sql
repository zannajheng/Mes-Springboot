INSERT INTO `sp_sys_menu` (`id`, `code`, `name`, `url`, `parent_id`, `grade`, `sort_num`, `type`, `permission`, `icon`, `descr`, `create_time`, `create_username`, `update_time`, `update_username`)
VALUES (
  '157',
  'tech_process_query',
  '产品工艺查询',
  '/technology/process-query/list-ui',
  '15',
  '3',
  8,
  '1',
  'tech:process:query',
  'fa fa-th-large',
  '产品工艺查询管理',
  NOW(),
  'admin',
  NOW(),
  'admin'
);

INSERT INTO `sp_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `create_username`, `update_time`, `update_username`)
VALUES (
  '2000000000000000010',
  '2000000000000000002',
  '157',
  NOW(),
  'admin',
  NOW(),
  'admin'
);