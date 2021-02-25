/*
 Navicat Premium Data Transfer

 Source Server         : aliyunmes
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : rm-8vb0sazu4d9g0u290eo.mysql.zhangbei.rds.aliyuncs.com:3306
 Source Schema         : sparchetype

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 21/07/2020 08:56:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sp_bom
-- ----------------------------
DROP TABLE IF EXISTS `sp_bom`;
CREATE TABLE `sp_bom`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `bom_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'bom编号',
  `materiel_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料ID',
  `materiel_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料描述',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `version_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '版本号',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'BOM状态 creat创建 pass审核通过 ',
  `factory` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工厂',
  `is_deleted` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '逻辑删除：1 表示删除，0 表示未删除，2 表示禁用',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'BOM主信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_bom
-- ----------------------------
INSERT INTO `sp_bom` VALUES ('1268447170115383298', 'bbbbb', 't002', 't002', '', '1', NULL, NULL, '0', '2020-06-04 15:39:07', 'admin', '2020-07-16 11:17:20', 'admin');
INSERT INTO `sp_bom` VALUES ('1268811409925582850', '0001', '2019001', '电子元件', '', '1', NULL, NULL, '0', '2020-06-05 15:46:28', 'admin', '2020-07-16 13:30:08', 'admin');
INSERT INTO `sp_bom` VALUES ('1270189758686146562', '测试', '123', '123', '', '1', NULL, NULL, '0', '2020-06-09 11:03:32', 'admin', '2020-07-04 15:32:47', 'admin');
INSERT INTO `sp_bom` VALUES ('1272019534564536322', '打算', '123', '123', '', '1', NULL, NULL, '2', '2020-06-14 12:14:25', 'admin', '2020-07-09 15:10:38', 'admin');
INSERT INTO `sp_bom` VALUES ('1272783744282112002', '阿斯顿发送到', 't002', 't002', '', '1', NULL, NULL, '0', '2020-06-16 14:51:06', 'admin', '2020-06-16 14:51:06', 'admin');
INSERT INTO `sp_bom` VALUES ('1276415594372247554', '77', '123', '123', '', '1', NULL, NULL, '0', '2020-06-26 15:22:47', 'admin', '2020-07-08 15:30:46', 'admin');
INSERT INTO `sp_bom` VALUES ('1276535719725346818', '001', '123', '123', '', '1', NULL, NULL, '0', '2020-06-26 23:20:07', 'admin', '2020-06-26 23:20:07', 'admin');
INSERT INTO `sp_bom` VALUES ('1277125952237973506', 'A0001', 't002', 't002', '', '1', NULL, NULL, '0', '2020-06-28 14:25:30', 'admin', '2020-06-28 14:25:30', 'admin');
INSERT INTO `sp_bom` VALUES ('1277599659653836802', 'Y001', 'Y001', 'Y001', '', '1', NULL, NULL, '0', '2020-06-29 21:47:50', 'admin', '2020-06-29 21:47:50', 'admin');
INSERT INTO `sp_bom` VALUES ('1278528374608998401', 'dc001', 'Y001', 'Y001', '', '1', NULL, NULL, '0', '2020-07-02 11:18:13', 'admin', '2020-07-02 11:18:13', 'admin');
INSERT INTO `sp_bom` VALUES ('1280124062753075202', '11111', '002-2918', '曲轴', '11111', '1', NULL, NULL, '0', '2020-07-06 20:58:55', 'admin', '2020-07-06 20:58:55', 'admin');
INSERT INTO `sp_bom` VALUES ('1281490436289179649', '001', '002-2918', '曲轴', '', '1', NULL, NULL, '0', '2020-07-10 15:28:24', 'admin', '2020-07-10 15:28:24', 'admin');
INSERT INTO `sp_bom` VALUES ('1283634934423203842', '333', '2019001', '电子元件', '', '1', NULL, NULL, '0', '2020-07-16 13:29:52', 'admin', '2020-07-16 13:29:52', 'admin');

-- ----------------------------
-- Table structure for sp_bom_item
-- ----------------------------
DROP TABLE IF EXISTS `sp_bom_item`;
CREATE TABLE `sp_bom_item`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `bom_head_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'bom编号',
  `materiel_item_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物料ID',
  `materiel_item_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物料描述',
  `line_no` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '行号',
  `item_num` decimal(10, 0) NULL DEFAULT 0 COMMENT '用量',
  `item_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子项基本单位',
  `oper_typer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属工序类型',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'BOM子项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sp_factroy
-- ----------------------------
DROP TABLE IF EXISTS `sp_factroy`;
CREATE TABLE `sp_factroy`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `factory` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `factory_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '工厂表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_factroy
-- ----------------------------
INSERT INTO `sp_factroy` VALUES ('1336542027055136', 'center', '中心工厂123', '2020-03-12 15:22:02', 'admin', '2020-03-13 10:15:54', 'admin');
INSERT INTO `sp_factroy` VALUES ('1336542142398496', '123', '你好', '2020-03-12 15:22:37', 'admin', '2020-03-12 15:22:37', 'admin');
INSERT INTO `sp_factroy` VALUES ('1336542951899168', 'ABC', 'ABC', '2020-03-12 15:29:03', 'admin', '2020-03-12 15:29:03', 'admin');
INSERT INTO `sp_factroy` VALUES ('1336850679595040', '测试数据12', '测试数据12', '2020-03-14 08:14:39', 'admin', '2020-03-14 08:14:39', 'admin');
INSERT INTO `sp_factroy` VALUES ('1336856843124768', '测试数据2', '测试数据2', '2020-03-14 09:03:38', 'admin', '2020-03-14 09:03:38', 'admin');
INSERT INTO `sp_factroy` VALUES ('1336858327908384', '你好', '你好123', '2020-03-14 09:15:26', 'admin', '2020-03-14 09:17:30', 'admin');
INSERT INTO `sp_factroy` VALUES ('1336858648772640', '订单', '的', '2020-03-14 09:17:59', 'admin', '2020-03-14 09:17:59', 'admin');
INSERT INTO `sp_factroy` VALUES ('1336873681158176', 'we', 'wewe', '2020-03-14 11:17:27', 'admin', '2020-03-14 11:17:27', 'admin');
INSERT INTO `sp_factroy` VALUES ('1336873716809760', 'ds', 'sdsdds', '2020-03-14 11:17:44', 'admin', '2020-03-14 11:17:44', 'admin');

-- ----------------------------
-- Table structure for sp_flow
-- ----------------------------
DROP TABLE IF EXISTS `sp_flow`;
CREATE TABLE `sp_flow`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `flow` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程',
  `flow_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '线体描述',
  `process` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程绘制 A——>B——>C',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '流程表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_flow
-- ----------------------------
INSERT INTO `sp_flow` VALUES ('1274977236873883649', '666', '666', '装配工序->测试工序->集成测试工序->封胶工序->清洗工序->包装工序', '2020-06-22 16:07:16', 'admin', '2020-07-20 20:49:33', 'admin');
INSERT INTO `sp_flow` VALUES ('1275430361590116354', '002', '111', '装配工序->包装工序', '2020-06-23 22:07:49', 'admin', '2020-06-23 22:07:49', 'admin');
INSERT INTO `sp_flow` VALUES ('1275430501520486401', '111', '222', '测试工序->焊接', '2020-06-23 22:08:23', 'admin', '2020-07-16 09:01:20', 'admin');
INSERT INTO `sp_flow` VALUES ('1277125413169246210', 'asfds', 'sdfsd', '装配工序->测试工序->封胶工序', '2020-06-28 14:23:21', 'admin', '2020-07-20 22:08:39', 'admin');
INSERT INTO `sp_flow` VALUES ('1277176874674663425', 'A01', 'A01', '装配工序->测试工序', '2020-06-28 17:47:50', 'admin', '2020-07-18 20:02:47', 'admin');
INSERT INTO `sp_flow` VALUES ('1277600512544583681', 'A001', 'A001', '装配工序->测试工序->包装工序', '2020-06-29 21:51:14', 'admin', '2020-06-29 21:51:14', 'admin');
INSERT INTO `sp_flow` VALUES ('1278145622063689729', '1212', '1212', '装配工序->包装工序', '2020-07-01 09:57:18', 'admin', '2020-07-01 09:57:18', 'admin');
INSERT INTO `sp_flow` VALUES ('1278528234456330242', 'dc001', '斗车', '装配工序->测试工序->包装工序', '2020-07-02 11:17:40', 'admin', '2020-07-02 11:17:40', 'admin');
INSERT INTO `sp_flow` VALUES ('1279942838902304770', '000005', '0005', '装配工序->包装工序', '2020-07-06 08:58:48', 'admin', '2020-07-06 08:59:11', 'admin');
INSERT INTO `sp_flow` VALUES ('1285142116192968706', '1234', '12222', '装配工序->集成测试工序->封胶工序', '2020-07-20 17:18:52', 'admin', '2020-07-20 17:18:52', 'admin');

-- ----------------------------
-- Table structure for sp_flow_oper_relation
-- ----------------------------
DROP TABLE IF EXISTS `sp_flow_oper_relation`;
CREATE TABLE `sp_flow_oper_relation`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `flow_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程ID',
  `flow` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程代码',
  `per_oper_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '前道工序ID',
  `per_oper` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '前道工序代码',
  `oper_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '当前工序ID',
  `oper` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '当前工序\r\n',
  `next_oper_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '下道工序ID',
  `next_oper` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '下道工序',
  `sort_num` int(11) NOT NULL COMMENT '排序',
  `oper_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工序类型（首道工序firstOper;最后一道工序lastOper）',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `flow_id_index`(`flow_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '流程与工序关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_flow_oper_relation
-- ----------------------------
INSERT INTO `sp_flow_oper_relation` VALUES ('1267713369412186113', '1267713369349271553', '1111', '', '', '1336864489340960', 'ASY-01', '1336864537575456', 'TST-02', 1, NULL, '2020-06-02 15:03:15', 'admin', '2020-06-02 15:03:15', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1267713369412186114', '1267713369349271553', '1111', '1336864489340960', 'ASY-01', '1336864537575456', 'TST-02', '', '', 2, NULL, '2020-06-02 15:03:15', 'admin', '2020-06-02 15:03:15', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1267788592622841858', '1267788592555732994', '01', '', '', '1336864489340960', 'ASY-01', '1336864537575456', 'TST-02', 1, NULL, '2020-06-02 20:02:10', 'admin', '2020-06-02 20:02:10', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1267788592622841859', '1267788592555732994', '01', '1336864489340960', 'ASY-01', '1336864537575456', 'TST-02', '1336864575324192', 'APK-01', 2, NULL, '2020-06-02 20:02:10', 'admin', '2020-06-02 20:02:10', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1267788592622841860', '1267788592555732994', '01', '1336864537575456', 'TST-02', '1336864575324192', 'APK-01', '1336864613072928', 'TST-01', 3, NULL, '2020-06-02 20:02:10', 'admin', '2020-06-02 20:02:10', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1267788592622841861', '1267788592555732994', '01', '1336864575324192', 'APK-01', '1336864613072928', 'TST-01', '', '', 4, NULL, '2020-06-02 20:02:10', 'admin', '2020-06-02 20:02:10', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1267990052920864770', '1265284426327371778', '1', '', '', '1336864489340960', 'ASY-01', '1336864537575456', 'TST-02', 1, NULL, '2020-06-03 09:22:41', 'admin', '2020-06-03 09:22:41', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1267990052920864771', '1265284426327371778', '1', '1336864489340960', 'ASY-01', '1336864537575456', 'TST-02', '1336868507484192', 'JS-01', 2, NULL, '2020-06-03 09:22:41', 'admin', '2020-06-03 09:22:41', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1267990052920864772', '1265284426327371778', '1', '1336864537575456', 'TST-02', '1336868507484192', 'JS-01', '1336864575324192', 'APK-01', 3, NULL, '2020-06-03 09:22:41', 'admin', '2020-06-03 09:22:41', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1267990052920864773', '1265284426327371778', '1', '1336868507484192', 'JS-01', '1336864575324192', 'APK-01', '', '', 4, NULL, '2020-06-03 09:22:41', 'admin', '2020-06-03 09:22:41', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1267990103424479234', '1265589028092358657', '1111', '', '', '1336864489340960', 'ASY-01', '1336864575324192', 'APK-01', 1, NULL, '2020-06-03 09:22:53', 'admin', '2020-06-03 09:22:53', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1267990103424479235', '1265589028092358657', '1111', '1336864489340960', 'ASY-01', '1336864575324192', 'APK-01', '1337248255574048', 'RK-01', 2, NULL, '2020-06-03 09:22:53', 'admin', '2020-06-03 09:22:53', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1267990103424479236', '1265589028092358657', '1111', '1336864575324192', 'APK-01', '1337248255574048', 'RK-01', '1336868360683552', 'HJ-01', 3, NULL, '2020-06-03 09:22:53', 'admin', '2020-06-03 09:22:53', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1267990103424479237', '1265589028092358657', '1111', '1337248255574048', 'RK-01', '1336868360683552', 'HJ-01', '', '', 4, NULL, '2020-06-03 09:22:53', 'admin', '2020-06-03 09:22:53', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1268001010259046402', '1268001010166771713', '22', '', '', '1336864489340960', 'ASY-01', '1336864537575456', 'TST-02', 1, NULL, '2020-06-03 10:06:14', 'admin', '2020-06-03 10:06:14', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1268001010259046403', '1268001010166771713', '22', '1336864489340960', 'ASY-01', '1336864537575456', 'TST-02', '1336864575324192', 'APK-01', 2, NULL, '2020-06-03 10:06:14', 'admin', '2020-06-03 10:06:14', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1268001010259046404', '1268001010166771713', '22', '1336864537575456', 'TST-02', '1336864575324192', 'APK-01', '1336864613072928', 'TST-01', 3, NULL, '2020-06-03 10:06:14', 'admin', '2020-06-03 10:06:14', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1268001010259046405', '1268001010166771713', '22', '1336864575324192', 'APK-01', '1336864613072928', 'TST-01', '1336868360683552', 'HJ-01', 4, NULL, '2020-06-03 10:06:14', 'admin', '2020-06-03 10:06:14', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1268001010259046406', '1268001010166771713', '22', '1336864613072928', 'TST-01', '1336868360683552', 'HJ-01', '1336868452958240', 'FJ-01', 5, NULL, '2020-06-03 10:06:14', 'admin', '2020-06-03 10:06:14', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1268001010259046407', '1268001010166771713', '22', '1336868360683552', 'HJ-01', '1336868452958240', 'FJ-01', '1336868507484192', 'JS-01', 6, NULL, '2020-06-03 10:06:14', 'admin', '2020-06-03 10:06:14', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1268001010259046408', '1268001010166771713', '22', '1336868452958240', 'FJ-01', '1336868507484192', 'JS-01', '1336868562010144', 'QX-01', 7, NULL, '2020-06-03 10:06:14', 'admin', '2020-06-03 10:06:14', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1268001010259046409', '1268001010166771713', '22', '1336868507484192', 'JS-01', '1336868562010144', 'QX-01', '1337248255574048', 'RK-01', 8, NULL, '2020-06-03 10:06:14', 'admin', '2020-06-03 10:06:14', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1268001010259046410', '1268001010166771713', '22', '1336868562010144', 'QX-01', '1337248255574048', 'RK-01', '', '', 9, NULL, '2020-06-03 10:06:14', 'admin', '2020-06-03 10:06:14', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1270229560290684929', '1268552781134016513', '撒大声', '', '', '1336864489340960', 'ASY-01', '1336864575324192', 'APK-01', 1, NULL, '2020-06-09 13:41:42', 'admin', '2020-06-09 13:41:42', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1270229560290684930', '1268552781134016513', '撒大声', '1336864489340960', 'ASY-01', '1336864575324192', 'APK-01', '1336864613072928', 'TST-01', 2, NULL, '2020-06-09 13:41:42', 'admin', '2020-06-09 13:41:42', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1270229560290684931', '1268552781134016513', '撒大声', '1336864575324192', 'APK-01', '1336864613072928', 'TST-01', '', '', 3, NULL, '2020-06-09 13:41:42', 'admin', '2020-06-09 13:41:42', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1270954114197729281', '1270954114151591937', '121', '', '', '1336864489340960', 'ASY-01', '1336864575324192', 'APK-01', 1, NULL, '2020-06-11 13:40:49', 'admin', '2020-06-11 13:40:49', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1270954114197729282', '1270954114151591937', '121', '1336864489340960', 'ASY-01', '1336864575324192', 'APK-01', '', '', 2, NULL, '2020-06-11 13:40:49', 'admin', '2020-06-11 13:40:49', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1270954292094939138', '1270954193277136898', '222222', '', '', '1336864537575456', 'TST-02', '1336868360683552', 'HJ-01', 1, NULL, '2020-06-11 13:41:31', 'admin', '2020-06-11 13:41:31', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1270954292094939139', '1270954193277136898', '222222', '1336864537575456', 'TST-02', '1336868360683552', 'HJ-01', '', '', 2, NULL, '2020-06-11 13:41:31', 'admin', '2020-06-11 13:41:31', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1275430361636253697', '1275430361590116354', '002', '', '', '1336864489340960', 'ASY-01', '1336864575324192', 'APK-01', 1, NULL, '2020-06-23 22:07:49', 'admin', '2020-06-23 22:07:49', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1275430361636253698', '1275430361590116354', '002', '1336864489340960', 'ASY-01', '1336864575324192', 'APK-01', '', '', 2, NULL, '2020-06-23 22:07:49', 'admin', '2020-06-23 22:07:49', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1277600512599109634', '1277600512544583681', 'A001', '', '', '1336864489340960', 'ASY-01', '1336864537575456', 'TST-02', 1, NULL, '2020-06-29 21:51:14', 'admin', '2020-06-29 21:51:14', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1277600512599109635', '1277600512544583681', 'A001', '1336864489340960', 'ASY-01', '1336864537575456', 'TST-02', '1336864575324192', 'APK-01', 2, NULL, '2020-06-29 21:51:14', 'admin', '2020-06-29 21:51:14', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1277600512599109636', '1277600512544583681', 'A001', '1336864537575456', 'TST-02', '1336864575324192', 'APK-01', '', '', 3, NULL, '2020-06-29 21:51:14', 'admin', '2020-06-29 21:51:14', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1278145622248239105', '1278145622063689729', '1212', '', '', '1336864489340960', 'ASY-01', '1336864575324192', 'APK-01', 1, NULL, '2020-07-01 09:57:18', 'admin', '2020-07-01 09:57:18', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1278145622248239106', '1278145622063689729', '1212', '1336864489340960', 'ASY-01', '1336864575324192', 'APK-01', '', '', 2, NULL, '2020-07-01 09:57:18', 'admin', '2020-07-01 09:57:18', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1278528234506661890', '1278528234456330242', 'dc001', '', '', '1336864489340960', 'ASY-01', '1336864537575456', 'TST-02', 1, NULL, '2020-07-02 11:17:40', 'admin', '2020-07-02 11:17:40', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1278528234506661891', '1278528234456330242', 'dc001', '1336864489340960', 'ASY-01', '1336864537575456', 'TST-02', '1336864575324192', 'APK-01', 2, NULL, '2020-07-02 11:17:40', 'admin', '2020-07-02 11:17:40', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1278528234506661892', '1278528234456330242', 'dc001', '1336864537575456', 'TST-02', '1336864575324192', 'APK-01', '', '', 3, NULL, '2020-07-02 11:17:40', 'admin', '2020-07-02 11:17:40', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1279942938785460225', '1279942838902304770', '000005', '', '', '1336864489340960', 'ASY-01', '1336864575324192', 'APK-01', 1, NULL, '2020-07-06 08:59:11', 'admin', '2020-07-06 08:59:11', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1279942938785460226', '1279942838902304770', '000005', '1336864489340960', 'ASY-01', '1336864575324192', 'APK-01', '', '', 2, NULL, '2020-07-06 08:59:11', 'admin', '2020-07-06 08:59:11', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1283567357256773634', '1275430501520486401', '111', '', '', '1336864537575456', 'TST-02', '1336868360683552', 'HJ-01', 1, NULL, '2020-07-16 09:01:20', 'admin', '2020-07-16 09:01:20', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1283567357256773635', '1275430501520486401', '111', '1336864537575456', 'TST-02', '1336868360683552', 'HJ-01', '', '', 2, NULL, '2020-07-16 09:01:20', 'admin', '2020-07-16 09:01:20', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1284458592561508353', '1277176874674663425', 'A01', '', '', '1336864489340960', 'ASY-01', '1336864537575456', 'TST-02', 1, NULL, '2020-07-18 20:02:47', 'admin', '2020-07-18 20:02:47', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1284458592561508354', '1277176874674663425', 'A01', '1336864489340960', 'ASY-01', '1336864537575456', 'TST-02', '', '', 2, NULL, '2020-07-18 20:02:47', 'admin', '2020-07-18 20:02:47', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1285142116356546562', '1285142116192968706', '1234', '', '', '1336864489340960', 'ASY-01', '1336864613072928', 'TST-01', 1, NULL, '2020-07-20 17:18:52', 'admin', '2020-07-20 17:18:52', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1285142116385906690', '1285142116192968706', '1234', '1336864489340960', 'ASY-01', '1336864613072928', 'TST-01', '1336868452958240', 'FJ-01', 2, NULL, '2020-07-20 17:18:52', 'admin', '2020-07-20 17:18:52', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1285142116385906691', '1285142116192968706', '1234', '1336864613072928', 'TST-01', '1336868452958240', 'FJ-01', '', '', 3, NULL, '2020-07-20 17:18:52', 'admin', '2020-07-20 17:18:52', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1285195135865544705', '1274977236873883649', '666', '', '', '1336864489340960', 'ASY-01', '1336864537575456', 'TST-02', 1, NULL, '2020-07-20 20:49:33', 'admin', '2020-07-20 20:49:33', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1285195135865544706', '1274977236873883649', '666', '1336864489340960', 'ASY-01', '1336864537575456', 'TST-02', '1336864613072928', 'TST-01', 2, NULL, '2020-07-20 20:49:33', 'admin', '2020-07-20 20:49:33', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1285195135865544707', '1274977236873883649', '666', '1336864537575456', 'TST-02', '1336864613072928', 'TST-01', '1336868452958240', 'FJ-01', 3, NULL, '2020-07-20 20:49:33', 'admin', '2020-07-20 20:49:33', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1285195135865544708', '1274977236873883649', '666', '1336864613072928', 'TST-01', '1336868452958240', 'FJ-01', '1336868562010144', 'QX-01', 4, NULL, '2020-07-20 20:49:33', 'admin', '2020-07-20 20:49:33', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1285195135865544709', '1274977236873883649', '666', '1336868452958240', 'FJ-01', '1336868562010144', 'QX-01', '1336864575324192', 'APK-01', 5, NULL, '2020-07-20 20:49:33', 'admin', '2020-07-20 20:49:33', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1285195135865544710', '1274977236873883649', '666', '1336868562010144', 'QX-01', '1336864575324192', 'APK-01', '', '', 6, NULL, '2020-07-20 20:49:33', 'admin', '2020-07-20 20:49:33', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1285215041575149569', '1277125413169246210', 'asfds', '', '', '1336864489340960', 'ASY-01', '1336864537575456', 'TST-02', 1, NULL, '2020-07-20 22:08:39', 'admin', '2020-07-20 22:08:39', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1285215041575149570', '1277125413169246210', 'asfds', '1336864489340960', 'ASY-01', '1336864537575456', 'TST-02', '1336868452958240', 'FJ-01', 2, NULL, '2020-07-20 22:08:39', 'admin', '2020-07-20 22:08:39', 'admin');
INSERT INTO `sp_flow_oper_relation` VALUES ('1285215041575149571', '1277125413169246210', 'asfds', '1336864537575456', 'TST-02', '1336868452958240', 'FJ-01', '', '', 3, NULL, '2020-07-20 22:08:39', 'admin', '2020-07-20 22:08:39', 'admin');

-- ----------------------------
-- Table structure for sp_line
-- ----------------------------
DROP TABLE IF EXISTS `sp_line`;
CREATE TABLE `sp_line`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `line` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '线体',
  `line_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '线体描述',
  `process_section` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工序段代号',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '线体表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_line
-- ----------------------------
INSERT INTO `sp_line` VALUES ('1336867983196192', 'WZY-ASY-01', '装配线体01线', '从vv', '2020-03-14 10:32:10', 'admin', '2020-06-14 02:20:09', 'admin');
INSERT INTO `sp_line` VALUES ('1336868041916448', 'WZY-TEST-01', '测试01线体', 'TST', '2020-03-14 10:32:38', 'admin', '2020-03-14 10:32:38', 'admin');
INSERT INTO `sp_line` VALUES ('1336868662673440', 'WZY-DC-01', '电池组装01线', 'ASY', '2020-03-14 10:37:34', 'admin', '2020-06-16 11:47:04', 'admin');

-- ----------------------------
-- Table structure for sp_materile
-- ----------------------------
DROP TABLE IF EXISTS `sp_materile`;
CREATE TABLE `sp_materile`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `materiel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料编码',
  `materiel_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料描述',
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '基本单位',
  `product_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品组',
  `mat_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物料类型',
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '型号',
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '尺寸',
  `flow_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程',
  `flow_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程描述',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  `is_deleted` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '逻辑删除：1 表示删除，0 表示未删除，2 表示禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '基础物料表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_materile
-- ----------------------------
INSERT INTO `sp_materile` VALUES ('1284051625900748801', '000001', '成品测试', '件', '产品1组', 'FG', '大', '8*8', '1279942838902304770', '0005', '2020-07-17 17:05:39', 'admin', '2020-07-21 08:32:19', 'admin', '0');

-- ----------------------------
-- Table structure for sp_oper
-- ----------------------------
DROP TABLE IF EXISTS `sp_oper`;
CREATE TABLE `sp_oper`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `oper` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工序\r\n',
  `oper_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工序描述',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '工序表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_oper
-- ----------------------------
INSERT INTO `sp_oper` VALUES ('1336864489340960', 'ASY-01', '装配工序', '2020-03-14 10:04:24', 'admin', '2020-03-14 10:04:24', 'admin');
INSERT INTO `sp_oper` VALUES ('1336864537575456', 'TST-02', '测试工序', '2020-03-14 10:04:47', 'admin', '2020-03-14 10:04:47', 'admin');
INSERT INTO `sp_oper` VALUES ('1336864575324192', 'APK-01', '包装工序', '2020-03-14 10:05:05', 'admin', '2020-03-14 10:05:05', 'admin');
INSERT INTO `sp_oper` VALUES ('1336864613072928', 'TST-01', '集成测试工序', '2020-03-14 10:05:23', 'admin', '2020-03-14 10:05:23', 'admin');
INSERT INTO `sp_oper` VALUES ('1336868360683552', 'HJ-01', '焊接', '2020-03-14 10:35:10', 'admin', '2020-03-14 10:35:10', 'admin');
INSERT INTO `sp_oper` VALUES ('1336868452958240', 'FJ-01', '封胶工序', '2020-03-14 10:35:54', 'admin', '2020-03-14 10:35:54', 'admin');
INSERT INTO `sp_oper` VALUES ('1336868507484192', 'JS-01', '加酸工序', '2020-03-14 10:36:20', 'admin', '2020-03-14 10:36:20', 'admin');
INSERT INTO `sp_oper` VALUES ('1336868562010144', 'QX-01', '清洗工序', '2020-03-14 10:36:46', 'admin', '2020-03-14 10:36:46', 'admin');
INSERT INTO `sp_oper` VALUES ('1337248255574048', 'RK-01', '入库工序', '2020-03-16 12:54:18', 'admin', '2020-03-16 12:54:18', 'admin');

-- ----------------------------
-- Table structure for sp_order
-- ----------------------------
DROP TABLE IF EXISTS `sp_order`;
CREATE TABLE `sp_order`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `order_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工单编号',
  `order_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工单描述',
  `qty` int(255) NULL DEFAULT NULL COMMENT '工单数量',
  `order_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单类型 P 量产 A验证 F返工 ',
  `flow_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程ID',
  `materiel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料编码',
  `materiel_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料描述',
  `plan_start_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划开始时间',
  `plan_end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '计划结束时间',
  `statue` tinyint(255) NULL DEFAULT NULL COMMENT '1,创建 2 进行中，3订单结束，4订单终结',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sp_sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sp_sys_department`;
CREATE TABLE `sp_sys_department`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sort_num` int(11) NOT NULL,
  `is_deleted` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '逻辑删除：1 表示删除，0 表示未删除，2 表示禁用',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sp_sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sp_sys_dict`;
CREATE TABLE `sp_sys_dict`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名',
  `value` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '数据值',
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类型',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '描述',
  `sort_num` int(11) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '父级id',
  `is_deleted` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '逻辑删除：1 表示删除，0 表示未删除，2 表示禁用',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sp_sys_dict_name`(`type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_sys_dict
-- ----------------------------
INSERT INTO `sp_sys_dict` VALUES ('1337618042191904', '成品', 'FG', 'material_type', '物料类型', 2, '\"\"', '0', '2020-03-18 13:53:06', 'admin', '2020-03-18 13:53:06', 'admin');
INSERT INTO `sp_sys_dict` VALUES ('1337618163826720', '半成品', 'PG', 'material_type', '物料类型', 3, '\"\"', '0', '2020-03-18 13:54:04', 'admin', '2020-03-18 13:54:04', 'admin');
INSERT INTO `sp_sys_dict` VALUES ('1337618837012512', '个', 'PCS', 'ORDER_UNIT', '生产单位', 1, '\"\"', '0', '2020-03-18 13:59:25', 'admin', '2020-03-18 13:59:41', 'admin');
INSERT INTO `sp_sys_dict` VALUES ('1337618939772960', '箱', 'BOX', 'ORDER_UNIT', '生产单位', 2, '\"\"', '0', '2020-03-18 14:00:14', 'admin', '2020-03-18 14:00:14', 'admin');

-- ----------------------------

-- ----------------------------
-- Table structure for sp_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sp_sys_menu`;
CREATE TABLE `sp_sys_menu`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单URL',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '父菜单ID，一级菜单设为0',
  `grade` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '层级：1级、2级、3级......',
  `sort_num` int(11) NOT NULL COMMENT '排序',
  `type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类型：0 目录；1 菜单；2 按钮',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '授权(多个用逗号分隔，如：sys:menu:list,sys:menu:create)',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '菜单图标',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '描述',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_sp_sys_menu_name`(`name`) USING BTREE,
  UNIQUE INDEX `idx_sp_sys_menu_code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_sys_menu
-- ----------------------------
INSERT INTO `sp_sys_menu` VALUES ('1', 'currency', '常规管理', '#', '0', '1', 1, '0', 'user:add', 'fa fa-address-book', '', '2019-10-18 11:18:29', 'SongPeng', '2020-03-13 14:07:09', 'admin');
INSERT INTO `sp_sys_menu` VALUES ('10', 'system', '系统管理', '#', '1', '2', 1, '0', 'user:add', 'fa fa-gears', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');
INSERT INTO `sp_sys_menu` VALUES ('101', 'menu', '菜单管理', '/admin/sys/menu/list-ui', '10', '3', 1, '0', 'user:add', 'fa fa-bars', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');
INSERT INTO `sp_sys_menu` VALUES ('102', 'user', '用户管理', '/admin/sys/user/list-ui', '10', '3', 2, '0', 'user:add', 'fa fa-user', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');
INSERT INTO `sp_sys_menu` VALUES ('103', 'role', '角色管理', '/admin/sys/role/list-ui', '10', '3', 3, '0', 'user:add', 'fa fa-child', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');
INSERT INTO `sp_sys_menu` VALUES ('104', 'department', '部门管理', '/admin/sys/department/list-ui', '10', '3', 4, '0', 'user:add', 'fa fa-sitemap', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');
INSERT INTO `sp_sys_menu` VALUES ('105', 'basedata', '基础数据配置平台', '/basedata/manager/list-ui', '10', '3', 5, '0', 'user:add', 'fa fa-cog', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');
INSERT INTO `sp_sys_menu` VALUES ('106', 'basedatamanager', '基础数据维护', '/basedata/manager/item/list-ui', '10', '3', 6, '0', 'user:add', 'fa fa-database', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');
INSERT INTO `sp_sys_menu` VALUES ('12', 'order', '计划管理', '', '1', '2', 4, '0', 'user:add', 'fa fa-calendar', '', '2019-10-18 11:18:29', 'Wangziyang', '2021-02-21 14:59:56', 'admin');
INSERT INTO `sp_sys_menu` VALUES ('121', 'orderRelease', '工单下达', '/order/release/list-ui', '12', '3', 1, '0', 'user:add', 'fa fa-flag-o', '', '2019-10-18 11:18:29', 'Wangziyang', '2019-10-18 11:18:29', 'Wangziyang');
INSERT INTO `sp_sys_menu` VALUES ('13', 'materiel', '物料管理', '#', '1', '2', 2, '0', 'user:add', 'fa fa-cubes', '', '2019-10-18 11:18:29', 'Wangziyang', '2019-10-18 11:18:29', 'Wangziyang');
INSERT INTO `sp_sys_menu` VALUES ('131', 'matdef', '物料维护', '/basedata/materile/list-ui', '13', '3', 1, '0', 'user:add', 'fa fa-microchip', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');
INSERT INTO `sp_sys_menu` VALUES ('14', 'Digitalplatform\n\n', '数字化平台', '#', '1', '2', 6, '0', 'user:add', 'fa fa-pie-chart', '', '2019-10-18 11:18:29', 'Wangziyang', '2019-10-18 11:18:29', 'Wangziyang');
INSERT INTO `sp_sys_menu` VALUES ('141', 'plandg', '智慧大屏', '/digitization/plan/plan-ui', '14', '3', 1, '0', 'user:add', 'fa fa-desktop', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');
INSERT INTO `sp_sys_menu` VALUES ('15', 'ProcessManage', '工艺管理', '', '1', '2', 3, '0', 'user:add', 'fa fa-wrench', '', '2019-10-18 11:18:29', 'Wangziyang', '2021-02-21 15:01:47', 'admin');
INSERT INTO `sp_sys_menu` VALUES ('151', 'flowProcess', '工艺路线管理', '/basedata/flow/process/list-ui', '15', '3', 1, '0', 'user:add', 'fa fa-retweet', '', '2019-10-18 11:18:29', 'Wangziyang', '2019-10-18 11:18:29', 'Wangziyang');
INSERT INTO `sp_sys_menu` VALUES ('152', 'bom', '工艺BOM管理', '/technology/bom/list-ui', '15', '3', 2, '0', 'user:add', 'fa fa-file-text-o', '', '2019-10-18 11:18:29', 'Wangziyang', '2019-10-18 11:18:29', 'Wangziyang');
INSERT INTO `sp_sys_menu` VALUES ('16', 'wip', '在制品管理', '#', '1', '2', 5, '0', 'user:add', 'fa fa-industry', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');
INSERT INTO `sp_sys_menu` VALUES ('161', 'generalSnProcess', 'SN通用过程采集', '/rrr', '16', '3', 1, '0', 'user:add', 'fa fa-product-hunt', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');
INSERT INTO `sp_sys_menu` VALUES ('17', 'DigitalSimulation', '黑科数字孪生', '#', '1', '2', 7, '0', 'user:add', 'fa fa-ravelry', '', '2019-10-18 11:18:29', 'Wangziyang', '2019-10-18 11:18:29', 'Wangziyang');
INSERT INTO `sp_sys_menu` VALUES ('171', 'DigitalSimulationFrom', '数字仿真3D仓库', '/digital/simulation/list-ui', '17', '3', 1, '0', 'user:add', 'fa fa-codepen', '', '2019-10-18 11:18:29', 'Wangziyang', '2019-10-18 11:18:29', 'Wangziyang');
INSERT INTO `sp_sys_menu` VALUES ('2', 'component', 'OPC操作', '#', '0', '1', 1, '0', 'user:add', 'fa fa-lemon-o', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');
INSERT INTO `sp_sys_menu` VALUES ('3', 'other', '其他管理', '#', '0', '1', 1, '0', 'user:add', 'fa fa-slideshare', '', '2019-10-18 11:18:29', 'SongPeng', '2019-10-18 11:18:29', 'SongPeng');

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Table structure for sp_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sp_sys_role`;
CREATE TABLE `sp_sys_role`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色编码',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '角色描述',
  `is_deleted` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '逻辑删除：1 表示删除，0 表示未删除，2 表示禁用',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_sp_sys_role_name`(`name`) USING BTREE,
  UNIQUE INDEX `idx_sp_sys_role_code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_sys_role
-- ----------------------------
INSERT INTO `sp_sys_role` VALUES ('1185025876737396738', '超级管理员', 'admin', '超级管理员', '0', '2019-10-18 10:52:40', 'SongPeng', '2020-03-13 14:06:43', 'admin');
INSERT INTO `sp_sys_role` VALUES ('1232532514523213826', '体验者123', 'experience', '体验者', '0', '2020-02-26 13:07:05', 'admin', '2020-06-03 15:05:59', 'admin');
INSERT INTO `sp_sys_role` VALUES ('1274963902774620161', '12', '12', '12', '0', '2020-06-22 15:14:17', 'admin', '2020-06-22 15:14:17', 'admin');
INSERT INTO `sp_sys_role` VALUES ('1274963930100510721', '1212', '1212', '1212', '0', '2020-06-22 15:14:23', 'admin', '2020-06-22 15:14:23', 'admin');
INSERT INTO `sp_sys_role` VALUES ('1274963986383876098', '1311', '121', '111', '0', '2020-06-22 15:14:37', 'admin', '2020-06-22 15:14:37', 'admin');
INSERT INTO `sp_sys_role` VALUES ('1274964058609790977', '12121212', '12121', '1212', '0', '2020-06-22 15:14:54', 'admin', '2020-06-22 15:14:54', 'admin');
INSERT INTO `sp_sys_role` VALUES ('1274964096777957377', '1313', '12121212', '121212', '0', '2020-06-22 15:15:03', 'admin', '2020-06-22 15:15:03', 'admin');
INSERT INTO `sp_sys_role` VALUES ('1274964138322538497', '331', '1222', '22', '0', '2020-06-22 15:15:13', 'admin', '2020-06-22 15:15:13', 'admin');
INSERT INTO `sp_sys_role` VALUES ('1274964176301961218', '1211', '1111', '1111', '0', '2020-06-22 15:15:22', 'admin', '2020-06-22 15:15:22', 'admin');
INSERT INTO `sp_sys_role` VALUES ('1274964233344495618', '443', '333', '3', '0', '2020-06-22 15:15:36', 'admin', '2020-06-22 15:15:36', 'admin');
INSERT INTO `sp_sys_role` VALUES ('1280124406522425346', '11', '11', '11', '0', '2020-07-06 21:00:17', 'admin', '2020-07-06 21:00:17', 'admin');
INSERT INTO `sp_sys_role` VALUES ('1281217564303929346', '2315', '4324', '42342', '0', '2020-07-09 21:24:06', 'admin', '2020-07-17 00:34:09', 'admin');
INSERT INTO `sp_sys_role` VALUES ('1336542182244384', '王子杨', '123', '王子杨', '0', '2020-03-12 15:22:56', 'admin', '2020-03-12 15:22:56', 'admin');

-- ----------------------------
-- Table structure for sp_sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sp_sys_role_menu`;
CREATE TABLE `sp_sys_role_menu`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色id',
  `menu_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单id',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色对应的菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_sys_role_menu
-- ----------------------------
INSERT INTO `sp_sys_role_menu` VALUES ('1', '1185025876737396738', '1', '2019-10-28 14:51:44', 'admin', '2019-10-28 14:51:56', 'admin');
INSERT INTO `sp_sys_role_menu` VALUES ('2', '1185025876737396738', '2', '2019-10-28 14:51:44', 'admin', '2019-10-28 14:51:56', 'admin');
INSERT INTO `sp_sys_role_menu` VALUES ('3', '1185025876737396738', '3', '2019-10-28 14:51:44', 'admin', '2019-10-28 14:51:56', 'admin');
INSERT INTO `sp_sys_role_menu` VALUES ('4', '1185025876737396738', '101', '2019-10-28 14:51:44', 'admin', '2019-10-28 14:51:56', 'admin');
INSERT INTO `sp_sys_role_menu` VALUES ('5', '1185025876737396738', '102', '2019-10-28 14:51:44', 'admin', '2019-10-28 14:51:56', 'admin');
INSERT INTO `sp_sys_role_menu` VALUES ('6', '1185025876737396738', '103', '2019-10-28 14:51:44', 'admin', '2019-10-28 14:51:56', 'admin');
INSERT INTO `sp_sys_role_menu` VALUES ('7', '1185025876737396738', '104', '2019-10-28 14:51:44', 'admin', '2019-10-28 14:51:56', 'admin');

-- ----------------------------
-- Table structure for sp_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sp_sys_user`;
CREATE TABLE `sp_sys_user`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `dept_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '部门id',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '邮箱',
  `mobile` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
  `tel` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '固定电话',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '性别(0:女;1:男;2:其他)',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '出生年月日',
  `pic_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '图片id，对应sys_file表中的id',
  `id_card` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '身份证',
  `hobby` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '爱好',
  `province` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '省份',
  `city` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '城市',
  `district` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '区县',
  `street` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '街道',
  `street_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '门牌号',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\"\"' COMMENT '描述',
  `is_deleted` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '逻辑删除：1 表示删除，0 表示未删除，2 表示禁用',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_sp_sys_user_username`(`username`) USING BTREE COMMENT '用户名唯一索引',
  UNIQUE INDEX `idx_sp_sys_user_mobile`(`mobile`) USING BTREE COMMENT '用户手机号唯一索引',
  INDEX `idx_sp_sys_user_email`(`email`) USING BTREE COMMENT '用户邮箱唯一索引',
  INDEX `idx_sp_sys_user_id_card`(`id_card`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_sys_user
-- ----------------------------
INSERT INTO `sp_sys_user` VALUES ('1184009088826392578', '宋鹏', 'iamsongpeng', '9d7281eeaebded0b091340cfa658a7e8', '', '', '13776337795', '', '1', NULL, '', '', '', '', '', '', '', '', '', '0', '2019-10-15 15:32:19', 'SongPeng', '2020-02-28 16:44:59', 'admin');
INSERT INTO `sp_sys_user` VALUES ('1184010472443396098', '猴子', 'monkey', '9d7281eeaebded0b091340cfa658a7e8', '123', '', '137763377', '', '0', NULL, '', '', '', '', '', '', '', '', '', '0', '2019-10-15 15:37:52', 'SongPeng', '2020-02-26 15:03:32', 'admin');
INSERT INTO `sp_sys_user` VALUES ('1184019107907227649', '超级管理员', 'admin', '9d7281eeaebded0b091340cfa658a7e8', '11', '', '13776337796', '44', '0', NULL, '55', '66', '77', '88', '99', '10', '11', '12', '13', '0', '2019-10-15 16:12:08', 'SongPeng', '2020-03-24 11:08:22', 'admin');
INSERT INTO `sp_sys_user` VALUES ('1266201180838801409', 'cassman', 'cassman.yang', '0302726d276d6b011d85404f2beb14a4', '90573703', 'cassman.yang@qq.com', '1111', '86195', '1', '2019-05-21 00:00:00', '#sd', '45+645+65+6511', 'swim', 'sad', 'dsa', 'fasd', 'daf', 'dsaf', 'daf', '0', '2020-05-29 10:54:21', 'admin', '2020-06-02 16:45:25', 'admin');
INSERT INTO `sp_sys_user` VALUES ('1276512902757724162', '小明', 'xm', 'a7c3fcdeca8ce6d49d2680eecd5e7431', '1', '1@qq.com', '19298833438', '323232', '0', '1998-09-12 00:00:00', '1', '1', '12', '1', '1', '1', '1', '1', '1', '0', '2020-06-26 21:49:27', 'admin', '2020-07-07 14:00:52', 'admin');

-- ----------------------------
-- Table structure for sp_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sp_sys_user_role`;
CREATE TABLE `sp_sys_user_role`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户id',
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色id',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户对应的角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_sys_user_role
-- ----------------------------
INSERT INTO `sp_sys_user_role` VALUES ('1242287110472966146', '1184019107907227649', '1185025876737396738', '2020-03-24 11:08:22', 'admin', '2020-03-24 11:08:22', 'admin');
INSERT INTO `sp_sys_user_role` VALUES ('1267739082731270146', '1266201180838801409', '1336542182244384', '2020-06-02 16:45:25', 'admin', '2020-06-02 16:45:25', 'admin');
INSERT INTO `sp_sys_user_role` VALUES ('1280381244774002690', '1276512902757724162', '1232532514523213826', '2020-07-07 14:00:52', 'admin', '2020-07-07 14:00:52', 'admin');

-- ----------------------------
-- Table structure for sp_table_manager
-- ----------------------------
DROP TABLE IF EXISTS `sp_table_manager`;
CREATE TABLE `sp_table_manager`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '表名称',
  `table_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表描述',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  `is_deleted` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '逻辑删除：1 表示删除，0 表示未删除，2 表示禁用',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '\"\"' COMMENT '授权(多个用逗号分隔，如：sys:menu:list,sys:menu:create)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index1`(`table_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '主数据通用管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_table_manager
-- ----------------------------
INSERT INTO `sp_table_manager` VALUES ('1283020801696837633', 'sp_bom', '', '2020-07-14 20:49:31', 'admin', '2020-07-14 20:49:31', 'admin', '0', '\"\"');

-- ----------------------------
-- Table structure for sp_table_manager_item
-- ----------------------------
DROP TABLE IF EXISTS `sp_table_manager_item`;
CREATE TABLE `sp_table_manager_item`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `table_name_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '表名称id',
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字段',
  `field_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字段描述',
  `must_fill` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否必填',
  `sort_num` int(11) NOT NULL COMMENT '排序',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '主数据基础数据明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_table_manager_item
-- ----------------------------
INSERT INTO `sp_table_manager_item` VALUES ('1283020801742974978', '1283020801696837633', 'materiel_desc', '888', 'Y', 1, '2020-07-14 20:49:31', 'admin', '2020-07-14 20:49:31', 'admin');

-- ----------------------------
-- Table structure for sp_work_shop
-- ----------------------------
DROP TABLE IF EXISTS `sp_work_shop`;
CREATE TABLE `sp_work_shop`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `work_shop` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `work_shop_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '工作车间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_work_shop
-- ----------------------------
INSERT INTO `sp_work_shop` VALUES ('1336875254022176', 'DC-车间1', '电池组装车间', '2020-03-14 11:29:57', 'admin', '2020-03-18 10:52:39', 'admin');
INSERT INTO `sp_work_shop` VALUES ('1336875591663648', 'DC-JS01', '加酸车间', '2020-03-14 11:32:38', 'admin', '2020-03-14 11:32:38', 'admin');

SET FOREIGN_KEY_CHECKS = 1;
