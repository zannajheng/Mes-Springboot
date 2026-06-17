-- =============================================
-- 角色管理模块字段更新脚本
-- 更新日期: 2024-01-01
-- =============================================

-- 1. sp_sys_role表新增字段
ALTER TABLE sp_sys_role ADD COLUMN IF NOT EXISTS `sort_num` INT(11) DEFAULT 0 COMMENT '排序号' AFTER `descr`;
ALTER TABLE sp_sys_role ADD COLUMN IF NOT EXISTS `is_system_role` VARCHAR(2) DEFAULT '0' COMMENT '是否系统角色（1：是，0：否）' AFTER `sort_num`;
ALTER TABLE sp_sys_role ADD COLUMN IF NOT EXISTS `user_type` VARCHAR(50) DEFAULT '员工' COMMENT '用户类型' AFTER `is_system_role`;
ALTER TABLE sp_sys_role ADD COLUMN IF NOT EXISTS `data_scope` VARCHAR(100) DEFAULT '未设置' COMMENT '数据范围' AFTER `user_type`;
ALTER TABLE sp_sys_role ADD COLUMN IF NOT EXISTS `business_scope` VARCHAR(100) DEFAULT '未设置' COMMENT '业务范围' AFTER `data_scope`;

-- 2. 更新SysRoleMapper.xml的resultMap（如果需要）

-- 3. 初始化现有数据的默认值
UPDATE sp_sys_role SET sort_num = 0 WHERE sort_num IS NULL;
UPDATE sp_sys_role SET is_system_role = '0' WHERE is_system_role IS NULL OR is_system_role = '';
UPDATE sp_sys_role SET user_type = '员工' WHERE user_type IS NULL OR user_type = '';
UPDATE sp_sys_role SET data_scope = '未设置' WHERE data_scope IS NULL OR data_scope = '';
UPDATE sp_sys_role SET business_scope = '未设置' WHERE business_scope IS NULL OR business_scope = '';
