-- =============================================
-- 预置角色数据脚本
-- 更新日期: 2024-01-01
-- =============================================

-- 1. 预置角色数据（如果不存在则插入）
INSERT INTO sp_sys_role (id, name, code, descr, sort_num, is_system_role, user_type, data_scope, business_scope, deleted, create_time, update_time)
SELECT 'baseDataRole', '数据员', 'baseDataRole', '负责基础数据维护', 1, '1', '员工', '未设置', '未设置', '0', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM sp_sys_role WHERE code = 'baseDataRole');

INSERT INTO sp_sys_role (id, name, code, descr, sort_num, is_system_role, user_type, data_scope, business_scope, deleted, create_time, update_time)
SELECT 'technologyRole', '工艺员', 'technologyRole', '负责产品工艺维护', 2, '1', '员工', '未设置', '未设置', '0', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM sp_sys_role WHERE code = 'technologyRole');

INSERT INTO sp_sys_role (id, name, code, descr, sort_num, is_system_role, user_type, data_scope, business_scope, deleted, create_time, update_time)
SELECT 'productionPlanRole', '生产计划员', 'productionPlanRole', '负责生产计划制定', 3, '1', '员工', '未设置', '未设置', '0', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM sp_sys_role WHERE code = 'productionPlanRole');

INSERT INTO sp_sys_role (id, name, code, descr, sort_num, is_system_role, user_type, data_scope, business_scope, deleted, create_time, update_time)
SELECT 'productionManagerRole', '生产主管', 'productionManagerRole', '负责生产执行管理', 4, '1', '员工', '未设置', '未设置', '0', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM sp_sys_role WHERE code = 'productionManagerRole');

INSERT INTO sp_sys_role (id, name, code, descr, sort_num, is_system_role, user_type, data_scope, business_scope, deleted, create_time, update_time)
SELECT 'qualityInspectorRole', '质检员', 'qualityInspectorRole', '负责产品质量检验', 5, '1', '员工', '未设置', '未设置', '0', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM sp_sys_role WHERE code = 'qualityInspectorRole');

INSERT INTO sp_sys_role (id, name, code, descr, sort_num, is_system_role, user_type, data_scope, business_scope, deleted, create_time, update_time)
SELECT 'warehouseKeeperRole', '库管员', 'warehouseKeeperRole', '负责仓库管理', 6, '1', '员工', '未设置', '未设置', '0', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM sp_sys_role WHERE code = 'warehouseKeeperRole');

-- 2. 更新现有角色的系统角色标识（管理员角色）
UPDATE sp_sys_role SET is_system_role = '1', user_type = '管理员', sort_num = 0 WHERE code = 'admin' OR name = '超级管理员';
