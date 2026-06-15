INSERT INTO `sp_sys_menu` (`id`, `code`, `name`, `url`, `parent_id`, `grade`, `sort_num`, `type`, `permission`, `icon`, `descr`, `create_time`, `create_username`, `update_time`, `update_username`)
VALUES (
  'tech_auxiliary_info',
  'tech_auxiliary_info',
  '工艺辅助信息',
  '/technology/oper-auxiliary/list-ui',
  '15',
  '2',
  7,
  '1',
  'tech:auxiliary:view',
  'fa fa-th-large',
  '工艺辅助信息管理',
  NOW(),
  'admin',
  NOW(),
  'admin'
);
