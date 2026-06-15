-- 部门管理 - 添加部门数据
-- 适用于 MES 系统的部门结构

INSERT INTO sp_sys_department (id, parent_id, name, sort_num, is_deleted, create_time, create_username, update_time, update_username) VALUES
('dept_001', '0', '生产部', 1, '0', NOW(), 'admin', NOW(), 'admin'),
('dept_002', '0', '质量部', 2, '0', NOW(), 'admin', NOW(), 'admin'),
('dept_003', '0', '技术部', 3, '0', NOW(), 'admin', NOW(), 'admin'),
('dept_004', '0', '仓储部', 4, '0', NOW(), 'admin', NOW(), 'admin'),
('dept_005', '0', '设备部', 5, '0', NOW(), 'admin', NOW(), 'admin'),
('dept_006', '0', '计划部', 6, '0', NOW(), 'admin', NOW(), 'admin'),
('dept_007', '0', '采购部', 7, '0', NOW(), 'admin', NOW(), 'admin'),
('dept_008', '0', '销售部', 8, '0', NOW(), 'admin', NOW(), 'admin'),
('dept_009', '0', '人事部', 9, '0', NOW(), 'admin', NOW(), 'admin'),
('dept_010', '0', '财务部', 10, '0', NOW(), 'admin', NOW(), 'admin');
