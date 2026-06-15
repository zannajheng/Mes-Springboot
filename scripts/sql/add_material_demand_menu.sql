INSERT INTO sp_sys_menu (id, code, name, url, parent_id, grade, sort_num, type, permission, icon, descr, create_time, create_username, update_time, update_username)
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
  'Material demand plan detail',
  NOW(),
  'admin',
  NOW(),
  'admin'
);

INSERT INTO sp_sys_menu (id, code, name, url, parent_id, grade, sort_num, type, permission, icon, descr, create_time, create_username, update_time, update_username)
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
  'Material demand plan by week',
  NOW(),
  'admin',
  NOW(),
  'admin'
);
