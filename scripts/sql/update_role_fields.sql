-- =============================================
-- 角色管理模块字段清理脚本
-- 删除冗余字段: sort_num, is_system_role, user_type, data_scope, business_scope
-- =============================================

-- 1. 删除 sp_sys_role 表中的冗余字段
ALTER TABLE sp_sys_role DROP COLUMN IF EXISTS `sort_num`;
ALTER TABLE sp_sys_role DROP COLUMN IF EXISTS `is_system_role`;
ALTER TABLE sp_sys_role DROP COLUMN IF EXISTS `user_type`;
ALTER TABLE sp_sys_role DROP COLUMN IF EXISTS `data_scope`;
ALTER TABLE sp_sys_role DROP COLUMN IF EXISTS `business_scope`;
