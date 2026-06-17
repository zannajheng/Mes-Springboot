-- =============================================
-- 产品BOM管理模块字段更新脚本
-- 更新日期: 2024-01-01
-- =============================================

-- 1. sp_bom表新增字段
ALTER TABLE sp_bom ADD COLUMN IF NOT EXISTS `is_valid` VARCHAR(2) DEFAULT '1' COMMENT '有效性（1：有效，0：无效）' AFTER `state`;
ALTER TABLE sp_bom ADD COLUMN IF NOT EXISTS `is_fixed` VARCHAR(2) DEFAULT '0' COMMENT '定版标识（1：已定版，0：未定版）' AFTER `is_valid`;

-- 2. sp_bom_item表新增字段
ALTER TABLE sp_bom_item ADD COLUMN IF NOT EXISTS `node_type` VARCHAR(2) DEFAULT '2' COMMENT '节点类型（1：零部件，2：物料）' AFTER `oper_typer`;
ALTER TABLE sp_bom_item ADD COLUMN IF NOT EXISTS `node_level` INT(11) DEFAULT 3 COMMENT '节点层级（0：产品，1：半成品，2：单元，3：物料）' AFTER `node_type`;
ALTER TABLE sp_bom_item ADD COLUMN IF NOT EXISTS `node_code` VARCHAR(50) DEFAULT NULL COMMENT '节点编号（系统自动生成）' AFTER `node_level`;

-- 3. 更新菜单配置（如果需要手动执行）
-- UPDATE sp_sys_menu SET name='产品BOM管理', icon='fa fa-th-large' WHERE id='152';

-- 4. 初始化现有数据的默认值
UPDATE sp_bom SET is_valid = '1' WHERE is_valid IS NULL OR is_valid = '';
UPDATE sp_bom SET is_fixed = '0' WHERE is_fixed IS NULL OR is_fixed = '';
UPDATE sp_bom_item SET node_type = '2' WHERE node_type IS NULL OR node_type = '';
UPDATE sp_bom_item SET node_level = 3 WHERE node_level IS NULL;
