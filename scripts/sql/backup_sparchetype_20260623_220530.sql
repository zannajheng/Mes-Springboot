-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: sparchetype
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `sparchetype`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sparchetype` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `sparchetype`;

--
-- Table structure for table `sp_bom`
--

DROP TABLE IF EXISTS `sp_bom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_bom` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `bom_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'bom编号',
  `materiel_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '物料ID',
  `materiel_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '物料描述',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `version_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '版本号',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'BOM状态 creat创建 pass审核通过 ',
  `factory` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '工厂',
  `is_deleted` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '逻辑删除：1 表示删除，0 表示未删除，2 表示禁用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  `is_valid` varchar(2) DEFAULT '1' COMMENT '有效性（1：有效，0：无效）',
  `is_fixed` varchar(2) DEFAULT '0' COMMENT '定版标识（1：已定版，0：未定版）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='BOM主信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_bom`
--

LOCK TABLES `sp_bom` WRITE;
/*!40000 ALTER TABLE `sp_bom` DISABLE KEYS */;
INSERT INTO `sp_bom` VALUES ('1268447170115383298','bbbbb','t002','t002','','1',NULL,NULL,'0','2020-06-04 15:39:07','admin','2026-06-04 15:39:07','admin','1','0'),('1277599659653836802','Y001','Y001','Y001','','1',NULL,NULL,'1','2020-06-29 21:47:50','admin','2026-06-21 20:01:20','admin','1','0'),('1278528374608998401','dc001','Y001','Y001','','1',NULL,NULL,'1','2020-07-02 11:18:13','admin','2026-06-21 20:01:20','admin','1','0'),('1280124062753075202','11111','002-2918','曲轴','11111','1',NULL,NULL,'1','2020-07-06 20:58:55','admin','2026-06-21 20:01:20','admin','1','0'),('1281490436289179649','001','002-2918','曲轴','','1',NULL,NULL,'1','2020-07-10 15:28:24','admin','2026-06-21 20:01:20','admin','1','0'),('1283634934423203842','333','2019001','电子元件','','1',NULL,NULL,'1','2020-07-16 13:29:52','admin','2026-06-21 20:01:20','admin','1','0'),('2059894356758614018','333','000001','成品测试','测试',NULL,NULL,NULL,'1','2026-05-28 15:07:40','admin','2026-06-21 20:01:20','admin','1','0'),('2059894430838411266','2','000001','成品测试','',NULL,NULL,NULL,'1','2026-05-28 15:07:58','admin','2026-06-21 20:01:20','admin','1','0'),('2059895199813718017','888','111','111','123',NULL,NULL,NULL,'1','2026-05-28 15:11:01','admin','2026-06-21 20:01:20','admin','1','0'),('2060021221632610305','1234567890','111','111','','1',NULL,NULL,'1','2026-05-28 23:31:47','admin','2026-06-21 20:01:20','admin','1','0'),('2066492884041699329','33333777','000001','成品测试','','1',NULL,'777777','1','2026-06-15 20:07:52','admin','2026-06-21 20:02:03','admin','1','0'),('2068665812946608129','123','000001','成品测试','','1',NULL,NULL,'0','2026-06-21 20:02:18','admin','2026-06-21 20:45:48','admin','1','0'),('2068932103821398018','7777777','000001','成品测试','','4',NULL,NULL,'0','2026-06-22 13:40:27','admin','2026-06-22 13:40:27','admin','1','0');
/*!40000 ALTER TABLE `sp_bom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_bom_item`
--

DROP TABLE IF EXISTS `sp_bom_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_bom_item` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `bom_head_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'bom编号',
  `materiel_item_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物料ID',
  `materiel_item_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物料描述',
  `line_no` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '行号',
  `item_num` decimal(10,0) DEFAULT '0' COMMENT '用量',
  `item_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '子项基本单位',
  `oper_typer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '所属工序类型',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  `node_type` varchar(2) DEFAULT '2' COMMENT '节点类型（1：零部件，2：物料）',
  `node_level` int DEFAULT '3' COMMENT '节点层级（0：产品，1：半成品，2：单元，3：物料）',
  `node_code` varchar(50) DEFAULT NULL COMMENT '节点编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='BOM子项表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_bom_item`
--

LOCK TABLES `sp_bom_item` WRITE;
/*!40000 ALTER TABLE `sp_bom_item` DISABLE KEYS */;
INSERT INTO `sp_bom_item` VALUES ('2060335759871467522','2060021221632610305','222','','1',0,'',NULL,'2026-05-29 20:21:39','admin','2026-05-29 20:21:39','admin','2',3,NULL),('2060376699311079426','1268447170115383298','1','1','',0,'',NULL,'2026-05-29 23:04:20','admin','2026-05-29 23:04:20','admin','2',3,NULL),('2068665714053308417','2068665653571444737','1','1','1',0,'1',NULL,'2026-06-21 20:01:55','admin','2026-06-21 20:01:55','admin','2',3,NULL),('2068676757437607937','2068665812946608129','222','1','1',1,'1',NULL,'2026-06-21 20:45:48','admin','2026-06-21 20:45:48','admin','2',3,NULL),('2068932103892701186','2068932103821398018','123','123','123',1,'1',NULL,'2026-06-22 13:40:27','admin','2026-06-22 13:40:27','admin','2',3,NULL),('2068932103955615746','2068932103821398018','1234','1234','1234',2,'1',NULL,'2026-06-22 13:40:27','admin','2026-06-22 13:40:27','admin','2',3,NULL);
/*!40000 ALTER TABLE `sp_bom_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_bom_oper_relation`
--

DROP TABLE IF EXISTS `sp_bom_oper_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_bom_oper_relation` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '涓婚敭ID',
  `bom_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'BOM澶碔D',
  `bom_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'BOM缂栧彿',
  `materiel_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'BOM鐗╂枡鎻忚堪',
  `node_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '鑺傜偣鍚嶇О锛圔OM瀛愰」鍚嶇О锛',
  `node_level` int DEFAULT '0' COMMENT '鑺傜偣灞傜骇',
  `bom_item_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'BOM瀛愰」ID',
  `oper_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '宸ュ簭ID',
  `oper` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '宸ュ簭缂栧彿',
  `oper_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '宸ュ簭鍚嶇О',
  `work_center` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '鍔犲伐鍗曞厓缂栫爜',
  `work_center_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '鍔犲伐鍗曞厓鍚嶇О',
  `oper_time` decimal(10,2) DEFAULT '0.00' COMMENT '宸ュ簭宸ユ椂(h)',
  `produce_cycle` decimal(10,2) DEFAULT '0.00' COMMENT '鍒堕?鍛ㄦ湡(h)',
  `sort_num` int NOT NULL DEFAULT '1' COMMENT '鎺掑簭鍙',
  `is_locked` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '鏄?惁閿佸畾锛?锛氭湭閿佸畾锛?锛氬凡閿佸畾锛',
  `create_time` datetime NOT NULL COMMENT '鍒涘缓鏃堕棿',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鍒涘缓浜',
  `update_time` datetime NOT NULL COMMENT '鏈?悗鏇存柊鏃堕棿',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鏈?悗鏇存柊浜',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_bom_id` (`bom_id`) USING BTREE,
  KEY `idx_bom_code` (`bom_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='BOM涓庡伐搴忓叧绯昏〃';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_bom_oper_relation`
--

LOCK TABLES `sp_bom_oper_relation` WRITE;
/*!40000 ALTER TABLE `sp_bom_oper_relation` DISABLE KEYS */;
INSERT INTO `sp_bom_oper_relation` VALUES ('2060366861516533761','2060021221632610305','1234567890','111','测试',0,'2060335759871467522',NULL,'测试','测试',NULL,'测试',0.00,0.00,1,'0','2026-05-29 22:25:14','admin','2026-05-29 22:58:41','admin'),('2060376734111219714','1268447170115383298','bbbbb','t002','1',0,'2060376699311079426',NULL,'333','333',NULL,'333',0.00,0.00,1,'1','2026-05-29 23:04:28','admin','2026-05-30 16:55:53','admin'),('2068676773447266306','2068665812946608129','123','成品测试','1',0,'2068676757437607937',NULL,NULL,NULL,NULL,NULL,0.00,0.00,1,'1','2026-06-21 20:45:52','admin','2026-06-21 20:46:01','admin'),('2068958027514241025','2068932103821398018','7777777','成品测试','123',0,'2068932103892701186',NULL,NULL,NULL,NULL,NULL,0.00,0.00,1,'1','2026-06-22 15:23:28','admin','2026-06-22 15:23:34','admin'),('2068958027514241026','2068932103821398018','7777777','成品测试','1234',0,'2068932103955615746',NULL,NULL,NULL,NULL,NULL,0.00,0.00,2,'1','2026-06-22 15:23:28','admin','2026-06-22 15:23:34','admin');
/*!40000 ALTER TABLE `sp_bom_oper_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_factroy`
--

DROP TABLE IF EXISTS `sp_factroy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_factroy` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `factory` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `factory_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='工厂表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_factroy`
--

LOCK TABLES `sp_factroy` WRITE;
/*!40000 ALTER TABLE `sp_factroy` DISABLE KEYS */;
INSERT INTO `sp_factroy` VALUES ('1336542027055136','center','中心工厂123','2020-03-12 15:22:02','admin','2020-03-13 10:15:54','admin'),('1336542142398496','123','你好','2020-03-12 15:22:37','admin','2020-03-12 15:22:37','admin'),('1336542951899168','ABC','ABC','2020-03-12 15:29:03','admin','2020-03-12 15:29:03','admin'),('1336850679595040','测试数据12','测试数据12','2020-03-14 08:14:39','admin','2020-03-14 08:14:39','admin'),('1336856843124768','测试数据2','测试数据2','2020-03-14 09:03:38','admin','2020-03-14 09:03:38','admin'),('1336858327908384','你好','你好123','2020-03-14 09:15:26','admin','2020-03-14 09:17:30','admin'),('1336858648772640','订单','的','2020-03-14 09:17:59','admin','2020-03-14 09:17:59','admin'),('1336873681158176','we','wewe','2020-03-14 11:17:27','admin','2020-03-14 11:17:27','admin'),('1336873716809760','ds','sdsdds','2020-03-14 11:17:44','admin','2020-03-14 11:17:44','admin');
/*!40000 ALTER TABLE `sp_factroy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_flow`
--

DROP TABLE IF EXISTS `sp_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_flow` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `flow` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程',
  `flow_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '线体描述',
  `process` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '流程绘制 A——>B——>C',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='流程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_flow`
--

LOCK TABLES `sp_flow` WRITE;
/*!40000 ALTER TABLE `sp_flow` DISABLE KEYS */;
INSERT INTO `sp_flow` VALUES ('1274977236873883649','666','666','装配工序->测试工序->集成测试工序->封胶工序->清洗工序->包装工序','2020-06-22 16:07:16','admin','2020-07-20 20:49:33','admin');
/*!40000 ALTER TABLE `sp_flow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_flow_oper_relation`
--

DROP TABLE IF EXISTS `sp_flow_oper_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_flow_oper_relation` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `flow_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程ID',
  `flow` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程代码',
  `per_oper_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '前道工序ID',
  `per_oper` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '前道工序代码',
  `oper_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '当前工序ID',
  `oper` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '当前工序\r\n',
  `next_oper_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '下道工序ID',
  `next_oper` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '下道工序',
  `sort_num` int NOT NULL COMMENT '排序',
  `oper_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '工序类型（首道工序firstOper;最后一道工序lastOper）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `flow_id_index` (`flow_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='流程与工序关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_flow_oper_relation`
--

LOCK TABLES `sp_flow_oper_relation` WRITE;
/*!40000 ALTER TABLE `sp_flow_oper_relation` DISABLE KEYS */;
INSERT INTO `sp_flow_oper_relation` VALUES ('1267713369412186113','1267713369349271553','1111','','','1336864489340960','ASY-01','1336864537575456','TST-02',1,NULL,'2020-06-02 15:03:15','admin','2020-06-02 15:03:15','admin'),('1267713369412186114','1267713369349271553','1111','1336864489340960','ASY-01','1336864537575456','TST-02','','',2,NULL,'2020-06-02 15:03:15','admin','2020-06-02 15:03:15','admin'),('1267788592622841858','1267788592555732994','01','','','1336864489340960','ASY-01','1336864537575456','TST-02',1,NULL,'2020-06-02 20:02:10','admin','2020-06-02 20:02:10','admin'),('1267788592622841859','1267788592555732994','01','1336864489340960','ASY-01','1336864537575456','TST-02','1336864575324192','APK-01',2,NULL,'2020-06-02 20:02:10','admin','2020-06-02 20:02:10','admin'),('1267788592622841860','1267788592555732994','01','1336864537575456','TST-02','1336864575324192','APK-01','1336864613072928','TST-01',3,NULL,'2020-06-02 20:02:10','admin','2020-06-02 20:02:10','admin'),('1267788592622841861','1267788592555732994','01','1336864575324192','APK-01','1336864613072928','TST-01','','',4,NULL,'2020-06-02 20:02:10','admin','2020-06-02 20:02:10','admin'),('1267990052920864770','1265284426327371778','1','','','1336864489340960','ASY-01','1336864537575456','TST-02',1,NULL,'2020-06-03 09:22:41','admin','2020-06-03 09:22:41','admin'),('1267990052920864771','1265284426327371778','1','1336864489340960','ASY-01','1336864537575456','TST-02','1336868507484192','JS-01',2,NULL,'2020-06-03 09:22:41','admin','2020-06-03 09:22:41','admin'),('1267990052920864772','1265284426327371778','1','1336864537575456','TST-02','1336868507484192','JS-01','1336864575324192','APK-01',3,NULL,'2020-06-03 09:22:41','admin','2020-06-03 09:22:41','admin'),('1267990052920864773','1265284426327371778','1','1336868507484192','JS-01','1336864575324192','APK-01','','',4,NULL,'2020-06-03 09:22:41','admin','2020-06-03 09:22:41','admin'),('1267990103424479234','1265589028092358657','1111','','','1336864489340960','ASY-01','1336864575324192','APK-01',1,NULL,'2020-06-03 09:22:53','admin','2020-06-03 09:22:53','admin'),('1267990103424479235','1265589028092358657','1111','1336864489340960','ASY-01','1336864575324192','APK-01','1337248255574048','RK-01',2,NULL,'2020-06-03 09:22:53','admin','2020-06-03 09:22:53','admin'),('1267990103424479236','1265589028092358657','1111','1336864575324192','APK-01','1337248255574048','RK-01','1336868360683552','HJ-01',3,NULL,'2020-06-03 09:22:53','admin','2020-06-03 09:22:53','admin'),('1267990103424479237','1265589028092358657','1111','1337248255574048','RK-01','1336868360683552','HJ-01','','',4,NULL,'2020-06-03 09:22:53','admin','2020-06-03 09:22:53','admin'),('1268001010259046402','1268001010166771713','22','','','1336864489340960','ASY-01','1336864537575456','TST-02',1,NULL,'2020-06-03 10:06:14','admin','2020-06-03 10:06:14','admin'),('1268001010259046403','1268001010166771713','22','1336864489340960','ASY-01','1336864537575456','TST-02','1336864575324192','APK-01',2,NULL,'2020-06-03 10:06:14','admin','2020-06-03 10:06:14','admin'),('1268001010259046404','1268001010166771713','22','1336864537575456','TST-02','1336864575324192','APK-01','1336864613072928','TST-01',3,NULL,'2020-06-03 10:06:14','admin','2020-06-03 10:06:14','admin'),('1268001010259046405','1268001010166771713','22','1336864575324192','APK-01','1336864613072928','TST-01','1336868360683552','HJ-01',4,NULL,'2020-06-03 10:06:14','admin','2020-06-03 10:06:14','admin'),('1268001010259046406','1268001010166771713','22','1336864613072928','TST-01','1336868360683552','HJ-01','1336868452958240','FJ-01',5,NULL,'2020-06-03 10:06:14','admin','2020-06-03 10:06:14','admin'),('1268001010259046407','1268001010166771713','22','1336868360683552','HJ-01','1336868452958240','FJ-01','1336868507484192','JS-01',6,NULL,'2020-06-03 10:06:14','admin','2020-06-03 10:06:14','admin'),('1268001010259046408','1268001010166771713','22','1336868452958240','FJ-01','1336868507484192','JS-01','1336868562010144','QX-01',7,NULL,'2020-06-03 10:06:14','admin','2020-06-03 10:06:14','admin'),('1268001010259046409','1268001010166771713','22','1336868507484192','JS-01','1336868562010144','QX-01','1337248255574048','RK-01',8,NULL,'2020-06-03 10:06:14','admin','2020-06-03 10:06:14','admin'),('1268001010259046410','1268001010166771713','22','1336868562010144','QX-01','1337248255574048','RK-01','','',9,NULL,'2020-06-03 10:06:14','admin','2020-06-03 10:06:14','admin'),('1270229560290684929','1268552781134016513','撒大声','','','1336864489340960','ASY-01','1336864575324192','APK-01',1,NULL,'2020-06-09 13:41:42','admin','2020-06-09 13:41:42','admin'),('1270229560290684930','1268552781134016513','撒大声','1336864489340960','ASY-01','1336864575324192','APK-01','1336864613072928','TST-01',2,NULL,'2020-06-09 13:41:42','admin','2020-06-09 13:41:42','admin'),('1270229560290684931','1268552781134016513','撒大声','1336864575324192','APK-01','1336864613072928','TST-01','','',3,NULL,'2020-06-09 13:41:42','admin','2020-06-09 13:41:42','admin'),('1270954114197729281','1270954114151591937','121','','','1336864489340960','ASY-01','1336864575324192','APK-01',1,NULL,'2020-06-11 13:40:49','admin','2020-06-11 13:40:49','admin'),('1270954114197729282','1270954114151591937','121','1336864489340960','ASY-01','1336864575324192','APK-01','','',2,NULL,'2020-06-11 13:40:49','admin','2020-06-11 13:40:49','admin'),('1270954292094939138','1270954193277136898','222222','','','1336864537575456','TST-02','1336868360683552','HJ-01',1,NULL,'2020-06-11 13:41:31','admin','2020-06-11 13:41:31','admin'),('1270954292094939139','1270954193277136898','222222','1336864537575456','TST-02','1336868360683552','HJ-01','','',2,NULL,'2020-06-11 13:41:31','admin','2020-06-11 13:41:31','admin'),('1275430361636253697','1275430361590116354','002','','','1336864489340960','ASY-01','1336864575324192','APK-01',1,NULL,'2020-06-23 22:07:49','admin','2020-06-23 22:07:49','admin'),('1275430361636253698','1275430361590116354','002','1336864489340960','ASY-01','1336864575324192','APK-01','','',2,NULL,'2020-06-23 22:07:49','admin','2020-06-23 22:07:49','admin'),('1277600512599109634','1277600512544583681','A001','','','1336864489340960','ASY-01','1336864537575456','TST-02',1,NULL,'2020-06-29 21:51:14','admin','2020-06-29 21:51:14','admin'),('1277600512599109635','1277600512544583681','A001','1336864489340960','ASY-01','1336864537575456','TST-02','1336864575324192','APK-01',2,NULL,'2020-06-29 21:51:14','admin','2020-06-29 21:51:14','admin'),('1277600512599109636','1277600512544583681','A001','1336864537575456','TST-02','1336864575324192','APK-01','','',3,NULL,'2020-06-29 21:51:14','admin','2020-06-29 21:51:14','admin'),('1278145622248239105','1278145622063689729','1212','','','1336864489340960','ASY-01','1336864575324192','APK-01',1,NULL,'2020-07-01 09:57:18','admin','2020-07-01 09:57:18','admin'),('1278145622248239106','1278145622063689729','1212','1336864489340960','ASY-01','1336864575324192','APK-01','','',2,NULL,'2020-07-01 09:57:18','admin','2020-07-01 09:57:18','admin'),('1278528234506661890','1278528234456330242','dc001','','','1336864489340960','ASY-01','1336864537575456','TST-02',1,NULL,'2020-07-02 11:17:40','admin','2020-07-02 11:17:40','admin'),('1278528234506661891','1278528234456330242','dc001','1336864489340960','ASY-01','1336864537575456','TST-02','1336864575324192','APK-01',2,NULL,'2020-07-02 11:17:40','admin','2020-07-02 11:17:40','admin'),('1278528234506661892','1278528234456330242','dc001','1336864537575456','TST-02','1336864575324192','APK-01','','',3,NULL,'2020-07-02 11:17:40','admin','2020-07-02 11:17:40','admin'),('1279942938785460225','1279942838902304770','000005','','','1336864489340960','ASY-01','1336864575324192','APK-01',1,NULL,'2020-07-06 08:59:11','admin','2020-07-06 08:59:11','admin'),('1279942938785460226','1279942838902304770','000005','1336864489340960','ASY-01','1336864575324192','APK-01','','',2,NULL,'2020-07-06 08:59:11','admin','2020-07-06 08:59:11','admin'),('1283567357256773634','1275430501520486401','111','','','1336864537575456','TST-02','1336868360683552','HJ-01',1,NULL,'2020-07-16 09:01:20','admin','2020-07-16 09:01:20','admin'),('1283567357256773635','1275430501520486401','111','1336864537575456','TST-02','1336868360683552','HJ-01','','',2,NULL,'2020-07-16 09:01:20','admin','2020-07-16 09:01:20','admin'),('1284458592561508353','1277176874674663425','A01','','','1336864489340960','ASY-01','1336864537575456','TST-02',1,NULL,'2020-07-18 20:02:47','admin','2020-07-18 20:02:47','admin'),('1284458592561508354','1277176874674663425','A01','1336864489340960','ASY-01','1336864537575456','TST-02','','',2,NULL,'2020-07-18 20:02:47','admin','2020-07-18 20:02:47','admin'),('1285195135865544705','1274977236873883649','666','','','1336864489340960','ASY-01','1336864537575456','TST-02',1,NULL,'2020-07-20 20:49:33','admin','2020-07-20 20:49:33','admin'),('1285195135865544706','1274977236873883649','666','1336864489340960','ASY-01','1336864537575456','TST-02','1336864613072928','TST-01',2,NULL,'2020-07-20 20:49:33','admin','2020-07-20 20:49:33','admin'),('1285195135865544707','1274977236873883649','666','1336864537575456','TST-02','1336864613072928','TST-01','1336868452958240','FJ-01',3,NULL,'2020-07-20 20:49:33','admin','2020-07-20 20:49:33','admin'),('1285195135865544708','1274977236873883649','666','1336864613072928','TST-01','1336868452958240','FJ-01','1336868562010144','QX-01',4,NULL,'2020-07-20 20:49:33','admin','2020-07-20 20:49:33','admin'),('1285195135865544709','1274977236873883649','666','1336868452958240','FJ-01','1336868562010144','QX-01','1336864575324192','APK-01',5,NULL,'2020-07-20 20:49:33','admin','2020-07-20 20:49:33','admin'),('1285195135865544710','1274977236873883649','666','1336868562010144','QX-01','1336864575324192','APK-01','','',6,NULL,'2020-07-20 20:49:33','admin','2020-07-20 20:49:33','admin'),('1285215041575149569','1277125413169246210','asfds','','','1336864489340960','ASY-01','1336864537575456','TST-02',1,NULL,'2020-07-20 22:08:39','admin','2020-07-20 22:08:39','admin'),('1285215041575149570','1277125413169246210','asfds','1336864489340960','ASY-01','1336864537575456','TST-02','1336868452958240','FJ-01',2,NULL,'2020-07-20 22:08:39','admin','2020-07-20 22:08:39','admin'),('1285215041575149571','1277125413169246210','asfds','1336864537575456','TST-02','1336868452958240','FJ-01','','',3,NULL,'2020-07-20 22:08:39','admin','2020-07-20 22:08:39','admin'),('2068653044445024258','2068653044302417921','123','','','1336864489340960','ASY-01','1336868507484192','JS-01',1,NULL,'2026-06-21 19:11:34','admin','2026-06-21 19:11:34','admin'),('2068653044512133122','2068653044302417921','123','1336864489340960','ASY-01','1336868507484192','JS-01','1336868562010144','QX-01',2,NULL,'2026-06-21 19:11:34','admin','2026-06-21 19:11:34','admin'),('2068653044512133123','2068653044302417921','123','1336868507484192','JS-01','1336868562010144','QX-01','1337248255574048','RK-01',3,NULL,'2026-06-21 19:11:34','admin','2026-06-21 19:11:34','admin'),('2068653044512133124','2068653044302417921','123','1336868562010144','QX-01','1337248255574048','RK-01','','',4,NULL,'2026-06-21 19:11:34','admin','2026-06-21 19:11:34','admin');
/*!40000 ALTER TABLE `sp_flow_oper_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_line`
--

DROP TABLE IF EXISTS `sp_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_line` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `line` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '线体',
  `line_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '线体描述',
  `process_section` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '工序段代号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='线体表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_line`
--

LOCK TABLES `sp_line` WRITE;
/*!40000 ALTER TABLE `sp_line` DISABLE KEYS */;
INSERT INTO `sp_line` VALUES ('1336867983196192','WZY-ASY-01','装配线体01线','从vv','2020-03-14 10:32:10','admin','2020-06-14 02:20:09','admin'),('1336868041916448','WZY-TEST-01','测试01线体','TST','2020-03-14 10:32:38','admin','2020-03-14 10:32:38','admin'),('1336868662673440','WZY-DC-01','电池组装01线','ASY','2020-03-14 10:37:34','admin','2020-06-16 11:47:04','admin');
/*!40000 ALTER TABLE `sp_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_material_demand_plan`
--

DROP TABLE IF EXISTS `sp_material_demand_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_material_demand_plan` (
  `id` varchar(64) NOT NULL,
  `order_code` varchar(64) DEFAULT NULL,
  `product_serial_no` varchar(64) DEFAULT NULL,
  `task_serial_no` varchar(64) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `work_center_name` varchar(200) DEFAULT NULL,
  `work_center_code` varchar(64) DEFAULT NULL,
  `materiel_code` varchar(64) DEFAULT NULL,
  `materiel_name` varchar(200) DEFAULT NULL,
  `require_qty` decimal(10,2) DEFAULT '1.00',
  `unit` varchar(50) DEFAULT NULL,
  `demand_date` datetime DEFAULT NULL,
  `delivery_status` varchar(20) DEFAULT 'undelivered',
  `stock_out_qty` decimal(10,2) DEFAULT '0.00',
  `net_require_qty` decimal(10,2) DEFAULT '0.00',
  `stock_in_status` varchar(20) DEFAULT 'not_generated',
  `stock_in_order_no` varchar(64) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `is_deleted` varchar(2) DEFAULT '0' COMMENT '删除状态（0：正常，1：已删除）',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_username` varchar(64) DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_username` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_order_code` (`order_code`),
  KEY `idx_product_serial` (`product_serial_no`),
  KEY `idx_materiel_code` (`materiel_code`),
  KEY `idx_work_center` (`work_center_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_material_demand_plan`
--

LOCK TABLES `sp_material_demand_plan` WRITE;
/*!40000 ALTER TABLE `sp_material_demand_plan` DISABLE KEYS */;
INSERT INTO `sp_material_demand_plan` VALUES ('test_006','MO20240815-002','SN20240815-001','FO20240815-001','Desktop PC','PC Assembly Unit','UNIT001','M000009','Power Supply',1.00,'pc','2026-06-01 00:00:00','delivered',0.00,1.00,'generated','RKD202605302253080001','test data','1','2026-05-30 20:54:50','admin','2026-06-22 13:33:19','admin'),('test_010','MO20240815-001','SN20240814-001','FO20240814-001','Laptop','Laptop Assembly Unit','UNIT002','M000010','Screen',1.00,'pc','2026-06-15 00:00:00','delivered',0.00,1.00,'generated','RKD202605302253180002','test data','1','2026-05-30 20:54:50','admin','2026-06-22 13:32:01','admin'),('test_011','MO20240815-001','SN20240814-001','FO20240814-001','Laptop','Laptop Assembly Unit','UNIT002','M000011','Keyboard',1.00,'pc','2026-06-15 00:00:00','delivered',0.00,1.00,'generated','RKD202605302253180002','test data','1','2026-05-30 20:54:50','admin','2026-06-22 13:32:07','admin');
/*!40000 ALTER TABLE `sp_material_demand_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_materile`
--

DROP TABLE IF EXISTS `sp_materile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_materile` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `materiel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '物料编码',
  `materiel_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '物料描述',
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '基本单位',
  `product_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '产品组',
  `mat_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物料类型',
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '型号',
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '尺寸',
  `flow_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '流程',
  `flow_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '流程描述',
  `materiel_source` varchar(255) DEFAULT NULL COMMENT '物料来源（自制/外购）',
  `material` varchar(255) DEFAULT NULL COMMENT '材质',
  `demand_lead_time` int DEFAULT '0' COMMENT '物料需求提前期(天)',
  `safety_stock` decimal(10,0) DEFAULT '0' COMMENT '安全库存',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  `is_deleted` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '逻辑删除：1 表示删除，0 表示未删除，2 表示禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='基础物料表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_materile`
--

LOCK TABLES `sp_materile` WRITE;
/*!40000 ALTER TABLE `sp_materile` DISABLE KEYS */;
INSERT INTO `sp_materile` VALUES ('1284051625900748801','000001','成品测试','件','产品1组','FG','大','8*8','1279942838902304770','0005','自制','铝',1,0,'','2020-07-17 17:05:39','admin','2026-06-22 13:38:05','admin','0');
/*!40000 ALTER TABLE `sp_materile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_oper`
--

DROP TABLE IF EXISTS `sp_oper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_oper` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `oper` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '工序\r\n',
  `oper_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '工序描述',
  `is_deleted` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '逻辑删除：1删除，0未删除，2禁用',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注信息',
  `is_produce_plan` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否生成生产计划(是/否)',
  `produce_cycle` decimal(10,2) DEFAULT NULL COMMENT '制造周期(h)',
  `oper_time` decimal(10,2) DEFAULT NULL COMMENT '工序工时(h)',
  `work_center_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '加工单元名称',
  `work_center` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '加工单元编码',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='工序表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_oper`
--

LOCK TABLES `sp_oper` WRITE;
/*!40000 ALTER TABLE `sp_oper` DISABLE KEYS */;
INSERT INTO `sp_oper` VALUES ('1336864489340960','ASY-01','装配工序','1',NULL,NULL,NULL,NULL,NULL,NULL,'2020-03-14 10:04:24','admin','2026-06-21 20:07:16','admin'),('1336864537575456','TST-02','测试工序','1',NULL,NULL,NULL,NULL,NULL,NULL,'2020-03-14 10:04:47','admin','2026-06-21 20:07:16','admin'),('1336864575324192','APK-01','包装工序','1',NULL,NULL,NULL,NULL,NULL,NULL,'2020-03-14 10:05:05','admin','2026-06-21 20:07:16','admin'),('1336864613072928','TST-01','集成测试工序','1',NULL,NULL,NULL,NULL,NULL,NULL,'2020-03-14 10:05:23','admin','2026-06-21 20:07:16','admin'),('1336868452958240','FJ-01','封胶工序','0',NULL,NULL,NULL,NULL,NULL,NULL,'2020-03-14 10:35:54','admin','2020-03-14 10:35:54','admin'),('1336868507484192','JS-01','加酸工序','0',NULL,NULL,NULL,NULL,NULL,NULL,'2020-03-14 10:36:20','admin','2020-03-14 10:36:20','admin'),('1336868562010144','QX-01','清洗工序','0',NULL,NULL,NULL,NULL,NULL,NULL,'2020-03-14 10:36:46','admin','2020-03-14 10:36:46','admin'),('1337248255574048','RK-01','入库工序','0',NULL,NULL,NULL,NULL,NULL,NULL,'2020-03-16 12:54:18','admin','2020-03-16 12:54:18','admin');
/*!40000 ALTER TABLE `sp_oper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_oper_content`
--

DROP TABLE IF EXISTS `sp_oper_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_oper_content` (
  `id` varchar(64) NOT NULL COMMENT '涓婚敭ID',
  `bom_oper_relation_id` varchar(64) DEFAULT NULL COMMENT 'BOM涓庡伐搴忓叧绯籌D',
  `bom_id` varchar(64) DEFAULT NULL COMMENT 'BOM澶碔D',
  `bom_code` varchar(255) DEFAULT NULL COMMENT 'BOM缂栧彿',
  `bom_item_id` varchar(64) DEFAULT NULL COMMENT 'BOM瀛愰」ID',
  `node_name` varchar(255) DEFAULT NULL COMMENT '鑺傜偣鍚嶇О',
  `oper_id` varchar(64) DEFAULT NULL COMMENT '宸ュ簭ID',
  `oper` varchar(255) DEFAULT NULL COMMENT '宸ュ簭缂栧彿',
  `oper_desc` varchar(255) DEFAULT NULL COMMENT '宸ュ簭鍚嶇О',
  `work_center` varchar(255) DEFAULT NULL COMMENT '鍔犲伐鍗曞厓',
  `work_center_desc` varchar(255) DEFAULT NULL COMMENT '鍔犲伐鍗曞厓鍚嶇О',
  `oper_time` decimal(10,2) DEFAULT '0.00' COMMENT '宸ュ簭宸ユ椂(h)',
  `produce_cycle` decimal(10,2) DEFAULT '0.00' COMMENT '鍒堕?鍛ㄦ湡(h)',
  `is_produce_plan` varchar(10) DEFAULT NULL COMMENT '鏄?惁鐢熸垚鐢熶骇璁″垝',
  `work_center_type` varchar(255) DEFAULT NULL COMMENT '鍔犲伐鍗曞厓绫诲瀷',
  `oper_content` text COMMENT '宸ュ簭鍐呭?锛堟搷浣滆?鏄庯級',
  `tech_requirement` text COMMENT '鎶?湳瑕佹眰',
  `oper_images` text COMMENT '宸ュ簭鍥剧墖锛圝SON鏁扮粍锛',
  `oper_requirement` text COMMENT '宸ュ簭瑕佹眰',
  `is_need_inspect` varchar(10) DEFAULT NULL COMMENT '鏄?惁闇??妫?獙',
  `inspect_images` text COMMENT '妫?獙鍥剧墖锛圝SON鏁扮粍锛',
  `attention` text COMMENT '娉ㄦ剰浜嬮」',
  `status` varchar(20) DEFAULT NULL COMMENT '鐘舵?锛歞raft鑽夌?锛宑ompleted宸插畬鎴',
  `create_time` datetime NOT NULL COMMENT '鍒涘缓鏃堕棿',
  `create_username` varchar(64) NOT NULL COMMENT '鍒涘缓浜',
  `update_time` datetime NOT NULL COMMENT '鏈?悗鏇存柊鏃堕棿',
  `update_username` varchar(64) NOT NULL COMMENT '鏈?悗鏇存柊浜',
  PRIMARY KEY (`id`),
  KEY `idx_bom_id` (`bom_id`),
  KEY `idx_bom_oper_relation_id` (`bom_oper_relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='宸ヨ壓鍐呭?缂栧埗琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_oper_content`
--

LOCK TABLES `sp_oper_content` WRITE;
/*!40000 ALTER TABLE `sp_oper_content` DISABLE KEYS */;
INSERT INTO `sp_oper_content` VALUES ('2060361979493453825','2060350887165706242','2060021221632610305','1234567890','2060335759871467522','7','','7','7',NULL,'7',7.00,7.00,'是','人员作业单元',NULL,NULL,'[]',NULL,NULL,'[]',NULL,'draft','2026-05-29 22:05:50','admin','2026-05-29 22:05:50','admin'),('2060361993192050690','2060350887165706242','2060021221632610305','1234567890','2060335759871467522','7','','7','7',NULL,NULL,0.00,0.00,NULL,NULL,'','','[]',NULL,NULL,'[]',NULL,'draft','2026-05-29 22:05:54','admin','2026-05-29 22:05:54','admin'),('2060362004181127169','2060350887165706242','2060021221632610305','1234567890','2060335759871467522','7','','7','7',NULL,NULL,0.00,0.00,NULL,NULL,NULL,NULL,'[]','','否','[]',NULL,'draft','2026-05-29 22:05:56','admin','2026-05-29 22:05:56','admin'),('2060362009352704001','2060350887165706242','2060021221632610305','1234567890','2060335759871467522','7','','7','7',NULL,NULL,0.00,0.00,NULL,NULL,NULL,NULL,'[]',NULL,NULL,'[]','','draft','2026-05-29 22:05:57','admin','2026-05-29 22:05:57','admin'),('2060362437524033537','2060350887165706242','2060021221632610305','1234567890','2060335759871467522','7','','7','7',NULL,NULL,0.00,0.00,NULL,NULL,'333','','[]',NULL,NULL,'[]',NULL,'draft','2026-05-29 22:07:39','admin','2026-05-29 22:07:39','admin'),('2060362450346020866','2060350887165706242','2060021221632610305','1234567890','2060335759871467522','7','','7','7',NULL,NULL,0.00,0.00,NULL,NULL,NULL,NULL,'[]',NULL,NULL,'[]','','draft','2026-05-29 22:07:43','admin','2026-05-29 22:07:43','admin'),('2060362464547934210','2060350887165706242','2060021221632610305','1234567890','2060335759871467522','7','','7','7',NULL,NULL,0.00,0.00,NULL,NULL,NULL,NULL,'[]',NULL,NULL,'[]','','completed','2026-05-29 22:07:46','admin','2026-05-29 22:08:59','admin'),('2060646429053726722','2060376734111219714','1268447170115383298','bbbbb','2060376699311079426','1','','333','333',NULL,'333',33.00,33.00,'是','人员作业单元',NULL,NULL,'[]',NULL,NULL,'[]','123','draft','2026-05-30 16:56:08','admin','2026-05-30 18:31:11','admin'),('2068676878543941633','2068676773447266306','2068665812946608129','123','2068676757437607937','1','','','',NULL,'',0.00,0.00,'是','人员作业单元','','','[]','','否','[]','','completed','2026-06-21 20:46:17','admin','2026-06-21 20:46:17','admin'),('2068948069603205121','2068947879991304193','2068932103821398018','7777777','2068932103892701186','123','','测试','',NULL,'',0.00,0.00,'是','人员作业单元','123','123','[\"/files/1088ad41a170484d84459a4905e34185.png\"]','123','是','[]','123','completed','2026-06-22 14:43:54','admin','2026-06-22 14:44:38','admin'),('2068948492837838849','2068947879991304194','2068932103821398018','7777777','2068932103955615746','1234','','','',NULL,'',0.00,0.00,'是','人员作业单元','','','[]','','否','[]','','completed','2026-06-22 14:45:35','admin','2026-06-22 14:45:35','admin'),('2068958239003631618','2068958027514241025','2068932103821398018','7777777','2068932103892701186','123','','','',NULL,'',0.00,0.00,'是','人员作业单元','','','[\"/files/2b4d50239a424d54b2652644ed049164.png\"]','','否','[]','','completed','2026-06-22 15:24:18','admin','2026-06-22 15:24:36','admin');
/*!40000 ALTER TABLE `sp_oper_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_oper_equipment`
--

DROP TABLE IF EXISTS `sp_oper_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_oper_equipment` (
  `id` varchar(64) NOT NULL COMMENT '涓婚敭ID',
  `oper_content_id` varchar(64) DEFAULT NULL COMMENT '宸ヨ壓鍐呭?ID',
  `bom_oper_relation_id` varchar(64) DEFAULT NULL COMMENT 'BOM涓庡伐搴忓叧绯籌D',
  `equipment_code` varchar(255) DEFAULT NULL COMMENT '璁惧?缂栫爜',
  `equipment_name` varchar(255) DEFAULT NULL COMMENT '璁惧?鍚嶇О',
  `equipment_model` varchar(255) DEFAULT NULL COMMENT '璁惧?瑙勬牸/鍨嬪彿',
  `equipment_usage` varchar(255) DEFAULT NULL COMMENT '璁惧?鐢ㄩ?',
  `equipment_remark` text COMMENT '澶囨敞淇℃伅',
  `require_qty` decimal(10,2) DEFAULT '1.00' COMMENT '闇?眰鏁伴噺',
  `create_time` datetime NOT NULL COMMENT '鍒涘缓鏃堕棿',
  `create_username` varchar(64) NOT NULL COMMENT '鍒涘缓浜',
  `update_time` datetime NOT NULL COMMENT '鏈?悗鏇存柊鏃堕棿',
  `update_username` varchar(64) NOT NULL COMMENT '鏈?悗鏇存柊浜',
  PRIMARY KEY (`id`),
  KEY `idx_oper_content_id` (`oper_content_id`),
  KEY `idx_bom_oper_relation_id` (`bom_oper_relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='宸ヨ?璁惧?琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_oper_equipment`
--

LOCK TABLES `sp_oper_equipment` WRITE;
/*!40000 ALTER TABLE `sp_oper_equipment` DISABLE KEYS */;
INSERT INTO `sp_oper_equipment` VALUES ('2060645042282606593','','2060376734111219714','1','1','','','',1.00,'2026-05-30 16:50:38','admin','2026-05-30 16:50:38','admin'),('2060652376157376514','2060646429053726722','2060376734111219714','1','1','','','',1.00,'2026-05-30 17:19:46','admin','2026-05-30 17:19:46','admin'),('2060652399012139009','2060646429053726722','2060376734111219714','2','2','','','',1.00,'2026-05-30 17:19:52','admin','2026-05-30 17:19:52','admin'),('2068948069674508290','2068948069603205121','2068947879991304193','123','123','','','',1.00,'2026-06-22 14:43:54','admin','2026-06-22 14:43:54','admin');
/*!40000 ALTER TABLE `sp_oper_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_oper_material_list`
--

DROP TABLE IF EXISTS `sp_oper_material_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_oper_material_list` (
  `id` varchar(64) NOT NULL COMMENT '涓婚敭ID',
  `oper_content_id` varchar(64) DEFAULT NULL COMMENT '宸ヨ壓鍐呭?ID',
  `bom_oper_relation_id` varchar(64) DEFAULT NULL COMMENT 'BOM涓庡伐搴忓叧绯籌D',
  `materiel_code` varchar(255) DEFAULT NULL COMMENT '鐗╂枡缂栫爜',
  `materiel_name` varchar(255) DEFAULT NULL COMMENT '鐗╂枡鍚嶇О',
  `materiel_spec` varchar(255) DEFAULT NULL COMMENT '鐗╂枡瑙勬牸',
  `materiel_type` varchar(255) DEFAULT NULL COMMENT '鐗╂枡绫诲瀷',
  `require_qty` decimal(10,2) DEFAULT '1.00' COMMENT '闇?眰鏁伴噺',
  `sort_num` int DEFAULT '1' COMMENT '鎺掑簭鍙',
  `create_time` datetime NOT NULL COMMENT '鍒涘缓鏃堕棿',
  `create_username` varchar(64) NOT NULL COMMENT '鍒涘缓浜',
  `update_time` datetime NOT NULL COMMENT '鏈?悗鏇存柊鏃堕棿',
  `update_username` varchar(64) NOT NULL COMMENT '鏈?悗鏇存柊浜',
  PRIMARY KEY (`id`),
  KEY `idx_oper_content_id` (`oper_content_id`),
  KEY `idx_bom_oper_relation_id` (`bom_oper_relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='澶囨枡娓呭崟琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_oper_material_list`
--

LOCK TABLES `sp_oper_material_list` WRITE;
/*!40000 ALTER TABLE `sp_oper_material_list` DISABLE KEYS */;
INSERT INTO `sp_oper_material_list` VALUES ('2060645174491262978',NULL,'2060376734111219714','t002','t002','','',1.00,1,'2026-05-30 16:51:09','admin','2026-05-30 16:51:09','admin'),('2060645329227526146',NULL,'2060376734111219714','t002','t002','','',1.00,1,'2026-05-30 16:51:46','admin','2026-05-30 16:51:46','admin'),('2068948218094149633','2068948069603205121','2068947879991304193','111','111','','',1.00,1,'2026-06-22 14:44:29','admin','2026-06-22 14:44:29','admin');
/*!40000 ALTER TABLE `sp_oper_material_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_oper_tech_doc`
--

DROP TABLE IF EXISTS `sp_oper_tech_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_oper_tech_doc` (
  `id` varchar(64) NOT NULL COMMENT '涓婚敭ID',
  `oper_content_id` varchar(64) DEFAULT NULL COMMENT '宸ヨ壓鍐呭?ID',
  `bom_oper_relation_id` varchar(64) DEFAULT NULL COMMENT 'BOM涓庡伐搴忓叧绯籌D',
  `doc_desc` varchar(500) DEFAULT NULL COMMENT '鎶?湳鏂囨。鎻忚堪',
  `doc_images` text COMMENT '鏂囨。鍥剧墖锛圝SON鏁扮粍锛',
  `doc_files` text COMMENT '鏂囨。闄勪欢锛圝SON鏁扮粍锛',
  `create_time` datetime NOT NULL COMMENT '鍒涘缓鏃堕棿',
  `create_username` varchar(64) NOT NULL COMMENT '鍒涘缓浜',
  `update_time` datetime NOT NULL COMMENT '鏈?悗鏇存柊鏃堕棿',
  `update_username` varchar(64) NOT NULL COMMENT '鏈?悗鏇存柊浜',
  PRIMARY KEY (`id`),
  KEY `idx_oper_content_id` (`oper_content_id`),
  KEY `idx_bom_oper_relation_id` (`bom_oper_relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='鎶?湳鏂囨。琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_oper_tech_doc`
--

LOCK TABLES `sp_oper_tech_doc` WRITE;
/*!40000 ALTER TABLE `sp_oper_tech_doc` DISABLE KEYS */;
INSERT INTO `sp_oper_tech_doc` VALUES ('2060632716812800001',NULL,'2060376734111219714','','[\"/files/77aaed82540c4cfdbffbf1598df4073c.png\"]','[{\"url\":\"/files/f951196696b4465c967e7faf80abd991.docx\",\"name\":\"文件\"}]','2026-05-30 16:01:39','admin','2026-05-30 16:01:39','admin'),('2060632817102802945',NULL,'2060376734111219714','124','[\"/files/77aaed82540c4cfdbffbf1598df4073c.png\"]','[{\"url\":\"/files/a14a7846874d4372a33814fa52efc764.drawio\",\"name\":\"文件\"}]','2026-05-30 16:02:03','admin','2026-05-30 16:02:03','admin'),('2060645131751305217',NULL,'2060376734111219714','124','[\"/files/305cdef18c6b41839c856bd01412d11e.png\"]','[{\"url\":\"/files/8160c889e29a4e56a69b8cb40e819580.docx\",\"name\":\"文件\"}]','2026-05-30 16:50:59','admin','2026-05-30 16:50:59','admin'),('2060652665782456321','2060646429053726722','2060376734111219714','','[\"/files/683621e128c446f58b40ff1a36c36821.png\"]','[{\"url\":\"/files/48f9e3ca1bc54dc59ed58c19749ec380.docx\",\"name\":\"工业_实验三.docx\"}]','2026-05-30 17:20:55','admin','2026-05-30 18:31:14','admin'),('2060654813568094209','2060646429053726722','2060376734111219714','','[]','[{\"url\":\"/files/aed193a7917e45aca6458ad969b168f9.docx\",\"name\":\"文件\"},{\"url\":\"/files/6c003788ef124fe89e9917339daa0f17.pdf\",\"name\":\"文件\"}]','2026-05-30 17:29:27','admin','2026-05-30 17:29:27','admin'),('2060655440016756737','2060646429053726722','2060376734111219714','','[]','[{\"url\":\"/files/a25ff6223bea45fc9bc39348a2ca0ce9.docx\",\"name\":\"文件\"},{\"url\":\"/files/f878189480a342698c5865f245f6f885.pdf\",\"name\":\"文件\"}]','2026-05-30 17:31:57','admin','2026-05-30 17:31:57','admin'),('2060656067501432834','2060646429053726722','2060376734111219714','','[]','[{\"url\":\"/files/aabd2338d3a848b5a760bd5a6a0305b8.docx\",\"name\":\"工业_实验三.docx\"},{\"url\":\"/files/8837616ac39145e8b6e9d49e3b2cd661.pdf\",\"name\":\"8.1内训师建设方案v8.pdf\"}]','2026-05-30 17:34:26','admin','2026-05-30 17:34:26','admin'),('2060657470055657474','2060646429053726722','2060376734111219714','','[]','[{\"url\":\"/files/e6f98d0128344147aab7d306aa43a42b.pdf\",\"name\":\"8.1内训师建设方案v8.pdf\"}]','2026-05-30 17:40:01','admin','2026-05-30 17:40:01','admin'),('2060659076679667714','2060646429053726722','2060376734111219714','','[\"/files/65b6a8ffc08d4445b5ff96bb2e9d4cd5.png\"]','[{\"url\":\"/files/beb33fb70b2f481ab0d274b1c5a62331.pdf\",\"name\":\"8.1内训师建设方案v8.pdf\"}]','2026-05-30 17:46:24','admin','2026-05-30 17:46:24','admin'),('2060660478860648449','2060646429053726722','2060376734111219714','','[]','[{\"url\":\"/files/8016e1e0e57949b4acb17986a74c84dc.docx\",\"name\":\"8.1内训师建设方案v8.docx\"}]','2026-05-30 17:51:58','admin','2026-05-30 17:51:58','admin'),('2060661479432826881','2060646429053726722','2060376734111219714','','[]','[{\"url\":\"/files/6743e20dbc2248f0a62a7871b9619345.pdf\",\"name\":\"8.1内训师建设方案v8.pdf\"}]','2026-05-30 17:55:57','admin','2026-05-30 17:55:57','admin'),('2060664803011928065','2060646429053726722','2060376734111219714','','[]','[{\"url\":\"/files/bb63e37aa89d4fee8f5a7894bb6e3b8e.docx\",\"name\":\"8.1内训师建设方案v8.docx\"}]','2026-05-30 18:09:09','admin','2026-05-30 18:09:09','admin'),('2060665460733321217','2060646429053726722','2060376734111219714','','[]','[{\"url\":\"/files/64e4a1a1998344cb898aafd3a53f6fa5.docx\",\"name\":\"工业_实验二.docx\"}]','2026-05-30 18:11:46','admin','2026-05-30 18:11:46','admin'),('2068958312013881345','2068958239003631618','2068958027514241025','','[\"/files/51a850a4369f4619bf1b6afbab78487f.png\"]','[{\"url\":\"/files/bf80c8e63d3047fba334422bcfc4b953.docx\",\"name\":\"工业_实验三.docx\"}]','2026-06-22 15:24:36','admin','2026-06-22 15:24:36','admin');
/*!40000 ALTER TABLE `sp_oper_tech_doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_order`
--

DROP TABLE IF EXISTS `sp_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_order` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `order_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '工单编号',
  `order_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '工单描述',
  `qty` int DEFAULT NULL COMMENT '工单数量',
  `order_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '订单类型 P 量产 A验证 F返工 ',
  `flow_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '流程ID',
  `materiel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '物料编码',
  `materiel_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '物料描述',
  `plan_start_time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '计划开始时间',
  `plan_end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '计划结束时间',
  `statue` tinyint DEFAULT NULL COMMENT '1,创建 2 进行中，3订单结束，4订单终结',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生产说明/备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_order`
--

LOCK TABLES `sp_order` WRITE;
/*!40000 ALTER TABLE `sp_order` DISABLE KEYS */;
INSERT INTO `sp_order` VALUES ('111','000',NULL,1,NULL,NULL,'000001','成品测试',NULL,'0',2,'123','2026-05-31 14:50:01','admin','2026-05-31 15:23:02','admin'),('2059898142461878273','1','',1,NULL,NULL,'111','111',NULL,'0',4,'','2026-05-28 15:22:43','admin','2026-05-31 15:28:00','admin'),('2059898200708177921','1',NULL,1000,NULL,NULL,'000001','成品测试',NULL,'0',1,NULL,'2026-05-28 15:22:57','admin','2026-05-28 15:22:57','admin'),('2060705621936545794','999',NULL,9,NULL,NULL,'000001','成品测试',NULL,'0',1,'00','2026-05-30 20:51:21','admin','2026-05-31 15:23:31','admin'),('2060977610655805441','ces','hhh',4,NULL,NULL,'000001','成品测试',NULL,'0',1,'888','2026-05-31 14:52:08','admin','2026-05-31 15:24:37','admin');
/*!40000 ALTER TABLE `sp_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_part`
--

DROP TABLE IF EXISTS `sp_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_part` (
  `id` varchar(36) NOT NULL COMMENT '主键ID',
  `part_no` varchar(50) NOT NULL COMMENT '零部件编号',
  `part_name` varchar(100) NOT NULL COMMENT '零部件名称',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `is_deleted` varchar(2) DEFAULT '0' COMMENT '状态(0:正常;1:删除;2:禁用)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_username` varchar(50) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_username` varchar(50) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `part_no` (`part_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='零部件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_part`
--

LOCK TABLES `sp_part` WRITE;
/*!40000 ALTER TABLE `sp_part` DISABLE KEYS */;
INSERT INTO `sp_part` VALUES ('2059877518905536514','BOM0000001','主板单元','123修改\n','0','2026-05-28 14:00:46','admin','2026-05-28 14:02:31','admin');
/*!40000 ALTER TABLE `sp_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_sys_department`
--

DROP TABLE IF EXISTS `sp_sys_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_sys_department` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sort_num` int NOT NULL,
  `is_deleted` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '逻辑删除：1 表示删除，0 表示未删除，2 表示禁用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_sys_department`
--

LOCK TABLES `sp_sys_department` WRITE;
/*!40000 ALTER TABLE `sp_sys_department` DISABLE KEYS */;
INSERT INTO `sp_sys_department` VALUES ('dept_001','0','生产部',1,'0','2026-06-14 22:25:38','admin','2026-06-14 22:25:38','admin'),('dept_002','0','质量部',2,'0','2026-06-14 22:25:38','admin','2026-06-14 22:25:38','admin'),('dept_003','0','技术部',3,'0','2026-06-14 22:25:38','admin','2026-06-14 22:25:38','admin'),('dept_004','0','仓储部',4,'0','2026-06-14 22:25:38','admin','2026-06-14 22:25:38','admin'),('dept_005','0','设备部',5,'0','2026-06-14 22:25:38','admin','2026-06-14 22:25:38','admin'),('dept_006','0','计划部',6,'0','2026-06-14 22:25:38','admin','2026-06-14 22:25:38','admin'),('dept_007','0','采购部',7,'0','2026-06-14 22:25:38','admin','2026-06-14 22:25:38','admin'),('dept_008','0','销售部',8,'0','2026-06-14 22:25:38','admin','2026-06-14 22:35:15','admin'),('dept_009','0','人事部',9,'0','2026-06-14 22:25:38','admin','2026-06-14 22:25:38','admin'),('dept_010','0','财务部',10,'0','2026-06-14 22:25:38','admin','2026-06-14 22:25:38','admin');
/*!40000 ALTER TABLE `sp_sys_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_sys_dict`
--

DROP TABLE IF EXISTS `sp_sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_sys_dict` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名',
  `value` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '数据值',
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类型',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '""' COMMENT '描述',
  `sort_num` int NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '""' COMMENT '父级id',
  `is_deleted` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '逻辑删除：1 表示删除，0 表示未删除，2 表示禁用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sp_sys_dict_name` (`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='系统字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_sys_dict`
--

LOCK TABLES `sp_sys_dict` WRITE;
/*!40000 ALTER TABLE `sp_sys_dict` DISABLE KEYS */;
INSERT INTO `sp_sys_dict` VALUES ('1337618042191904','成品','FG','material_type','物料类型',2,'\"\"','0','2020-03-18 13:53:06','admin','2020-03-18 13:53:06','admin'),('1337618163826720','半成品','PG','material_type','物料类型',3,'\"\"','0','2020-03-18 13:54:04','admin','2020-03-18 13:54:04','admin'),('1337618837012512','个','PCS','ORDER_UNIT','生产单位',1,'\"\"','0','2020-03-18 13:59:25','admin','2020-03-18 13:59:41','admin'),('1337618939772960','箱','BOX','ORDER_UNIT','生产单位',2,'\"\"','0','2020-03-18 14:00:14','admin','2020-03-18 14:00:14','admin');
/*!40000 ALTER TABLE `sp_sys_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_sys_menu`
--

DROP TABLE IF EXISTS `sp_sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_sys_menu` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单URL',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '父菜单ID，一级菜单设为0',
  `grade` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '层级：1级、2级、3级......',
  `sort_num` int NOT NULL COMMENT '排序',
  `type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类型：0 目录；1 菜单；2 按钮',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '""' COMMENT '授权(多个用逗号分隔，如：sys:menu:list,sys:menu:create)',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '""' COMMENT '菜单图标',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '""' COMMENT '描述',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_sp_sys_menu_name` (`name`) USING BTREE,
  UNIQUE KEY `idx_sp_sys_menu_code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='系统菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_sys_menu`
--

LOCK TABLES `sp_sys_menu` WRITE;
/*!40000 ALTER TABLE `sp_sys_menu` DISABLE KEYS */;
INSERT INTO `sp_sys_menu` VALUES ('1','currency','常规管理','#','0','1',1,'0','user:add','fa fa-address-book','','2019-10-18 11:18:29','SongPeng','2020-03-13 14:07:09','admin'),('10','system','系统管理','#','1','2',1,'0','user:add','fa fa-gears','','2019-10-18 11:18:29','SongPeng','2019-10-18 11:18:29','SongPeng'),('101','menu','菜单管理','/admin/sys/menu/list-ui','10','3',1,'0','user:add','fa fa-bars','','2019-10-18 11:18:29','SongPeng','2019-10-18 11:18:29','SongPeng'),('102','user','用户管理','/admin/sys/user/list-ui','10','3',2,'0','user:add','fa fa-user','','2019-10-18 11:18:29','SongPeng','2019-10-18 11:18:29','SongPeng'),('103','role','角色管理','/admin/sys/role/list-ui','10','3',3,'0','user:add','fa fa-child','','2019-10-18 11:18:29','SongPeng','2019-10-18 11:18:29','SongPeng'),('104','department','部门管理','/admin/sys/department/list-ui','10','3',5,'0','user:add','fa fa-sitemap','','2019-10-18 11:18:29','SongPeng','2019-10-18 11:18:29','SongPeng'),('105','basedata','基础数据配置平台','/basedata/manager/list-ui','10','3',6,'0','user:add','fa fa-cog','','2019-10-18 11:18:29','SongPeng','2019-10-18 11:18:29','SongPeng'),('106','basedatamanager','基础数据维护','/basedata/manager/item/list-ui','10','3',7,'0','user:add','fa fa-database','','2019-10-18 11:18:29','SongPeng','2019-10-18 11:18:29','SongPeng'),('12','order','计划管理','','1','2',4,'0','user:add','fa fa-calendar','','2019-10-18 11:18:29','Wangziyang','2021-02-21 14:59:56','admin'),('121','orderRelease','工单下达','/order/release/list-ui','12','3',1,'0','user:add','fa fa-flag-o','','2019-10-18 11:18:29','Wangziyang','2019-10-18 11:18:29','Wangziyang'),('13','materiel','物料管理','#','1','2',2,'0','user:add','fa fa-cubes','','2019-10-18 11:18:29','Wangziyang','2019-10-18 11:18:29','Wangziyang'),('131','matdef','物料维护','/basedata/materile/list-ui','13','3',1,'0','user:add','fa fa-microchip','','2019-10-18 11:18:29','SongPeng','2019-10-18 11:18:29','SongPeng'),('14','Digitalplatform\n\n','数字化平台','#','1','2',6,'0','user:add','fa fa-pie-chart','','2019-10-18 11:18:29','Wangziyang','2019-10-18 11:18:29','Wangziyang'),('141','plandg','智慧大屏','/digitization/plan/plan-ui','14','3',1,'0','user:add','fa fa-desktop','','2019-10-18 11:18:29','SongPeng','2019-10-18 11:18:29','SongPeng'),('15','ProcessManage','工艺管理','','1','2',3,'0','user:add','fa fa-wrench','','2019-10-18 11:18:29','Wangziyang','2021-02-21 15:01:47','admin'),('151','flowProcess','工艺路线管理','/basedata/flow/process/list-ui','15','3',1,'0','user:add','fa fa-retweet','','2019-10-18 11:18:29','Wangziyang','2019-10-18 11:18:29','Wangziyang'),('152','bom','产品BOM管理','/technology/bom/list-ui','15','3',2,'0','user:add','fa fa-th-large','','2019-10-18 11:18:29','Wangziyang','2019-10-18 11:18:29','Wangziyang'),('153','part','零部件定义','/technology/part/list-ui','15','3',3,'0','user:add','fa fa-th-large','','2020-03-28 10:00:00','admin','2020-03-28 10:00:00','admin'),('154','oper','工序信息定义','/technology/oper/list-ui','15','3',4,'0','user:add','fa fa-th-large','','2026-05-28 15:31:34','admin','2026-05-28 15:31:34','admin'),('155','flowProcessRelation','工艺流程管理','/technology/bom-oper-relation/list-ui','15','3',5,'0','user:add','fa fa-th-large','','2024-01-01 00:00:00','admin','2024-01-01 00:00:00','admin'),('156','operContent','工艺内容编制','/technology/oper-content/list-ui','15','3',6,'0','user:add','fa fa-th-large','','2024-01-01 00:00:00','admin','2024-01-01 00:00:00','admin'),('157','techProcessQuery','产品工艺查询','/technology/process-query/list-ui','15','3',7,'1','tech:process:query','fa fa-th-large','产品工艺查询管理','2026-06-15 13:55:59','admin','2026-06-15 13:55:59','admin'),('16','wip','在制品管理','#','1','2',5,'0','user:add','fa fa-industry','','2019-10-18 11:18:29','SongPeng','2019-10-18 11:18:29','SongPeng'),('160','permissionRole','权限管理','/admin/sys/permission/list-ui','10','3',4,'0','permission:role:view','fa fa-th-large','权限管理模块','0000-00-00 00:00:00','','0000-00-00 00:00:00',''),('161','generalSnProcess','SN通用过程采集','/rrr','16','3',1,'0','user:add','fa fa-product-hunt','','2019-10-18 11:18:29','SongPeng','2019-10-18 11:18:29','SongPeng'),('17','DigitalSimulation','黑科数字孪生','#','1','2',7,'0','user:add','fa fa-ravelry','','2019-10-18 11:18:29','Wangziyang','2019-10-18 11:18:29','Wangziyang'),('171','DigitalSimulationFrom','数字仿真3D仓库','/digital/simulation/list-ui','17','3',1,'0','user:add','fa fa-codepen','','2019-10-18 11:18:29','Wangziyang','2019-10-18 11:18:29','Wangziyang'),('2','component','OPC操作','#','0','1',1,'0','user:add','fa fa-lemon-o','','2019-10-18 11:18:29','SongPeng','2019-10-18 11:18:29','SongPeng'),('3','other','其他管理','#','0','1',1,'0','user:add','fa fa-slideshare','','2019-10-18 11:18:29','SongPeng','2019-10-18 11:18:29','SongPeng'),('material_demand_plan','material_demand_plan','物料需求计划','/plan/material-demand/list-ui','12','2',1,'1','material:demand:view','fa fa-th-large','Material demand plan detail','2026-05-30 20:32:31','admin','2026-05-30 20:32:31','admin');
/*!40000 ALTER TABLE `sp_sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_sys_role`
--

DROP TABLE IF EXISTS `sp_sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_sys_role` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色编码',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '""' COMMENT '角色描述',
  `is_deleted` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '逻辑删除：1 表示删除，0 表示未删除，2 表示禁用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '最后更新人',
  `sort_num` int DEFAULT '0' COMMENT '排序号',
  `user_type` varchar(50) DEFAULT '员工' COMMENT '用户类型',
  `is_system_role` varchar(2) DEFAULT '0' COMMENT '是否系统角色',
  `data_scope` varchar(100) DEFAULT '未设置' COMMENT '数据范围',
  `business_scope` varchar(100) DEFAULT '未设置' COMMENT '业务范围',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_sp_sys_role_name` (`name`) USING BTREE,
  UNIQUE KEY `idx_sp_sys_role_code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_sys_role`
--

LOCK TABLES `sp_sys_role` WRITE;
/*!40000 ALTER TABLE `sp_sys_role` DISABLE KEYS */;
INSERT INTO `sp_sys_role` VALUES ('1185025876737396738','超级管理员','admin','超级管理员','0','2019-10-18 10:52:40','SongPeng','2026-06-16 11:25:14','admin',0,'管理员','1','未设置','未设置'),('2000000000000000001','数据员','baseDataRole','基础数据中心全部功能菜单','0','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin',1,'员工','1','未设置','未设置'),('2000000000000000002','工艺员','technologyRole','产品数据中心全部功能菜单','0','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin',2,'员工','1','未设置','未设置'),('2000000000000000003','生产计划员','productionPlannerRole','生产计划中心全部功能菜单','0','2026-06-04 00:00:00','admin','2026-06-17 11:26:47','admin',3,'员工','1','未设置','未设置'),('2000000000000000004','生产主管','productionManagerRole','生产计划中心、设备管理中心、生产执行中心','0','2026-06-04 00:00:00','admin','2026-06-16 11:25:54','admin',4,'管理员','1','未设置','未设置'),('2000000000000000005','生产作业员','productionOperatorRole','生产执行中心全部功能菜单','0','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin',5,'员工','1','未设置','未设置'),('2000000000000000006','库房管理员','warehouseManagerRole','库房管理中心全部功能菜单','0','2026-06-04 00:00:00','admin','2026-06-17 14:56:34','admin',6,'管理员','1','未设置','未设置'),('2000000000000000007','质量管理员','qualityManagerRole','质量管理中心全部功能菜单','0','2026-06-04 00:00:00','admin','2026-06-16 11:25:37','admin',7,'管理员','1','未设置','未设置');
/*!40000 ALTER TABLE `sp_sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_sys_role_menu`
--

DROP TABLE IF EXISTS `sp_sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_sys_role_menu` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色id',
  `menu_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='角色对应的菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_sys_role_menu`
--

LOCK TABLES `sp_sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sp_sys_role_menu` DISABLE KEYS */;
INSERT INTO `sp_sys_role_menu` VALUES ('2067561460626468866','1185025876737396738','2','2026-06-18 18:54:00','admin','2026-06-18 18:54:00','admin'),('2067561460693577729','1185025876737396738','3','2026-06-18 18:54:00','admin','2026-06-18 18:54:00','admin'),('2067561460693577730','1185025876737396738','101','2026-06-18 18:54:00','admin','2026-06-18 18:54:00','admin'),('2067561460693577731','1185025876737396738','102','2026-06-18 18:54:00','admin','2026-06-18 18:54:00','admin'),('2067561460693577732','1185025876737396738','103','2026-06-18 18:54:00','admin','2026-06-18 18:54:00','admin'),('2067561460693577733','1185025876737396738','104','2026-06-18 18:54:00','admin','2026-06-18 18:54:00','admin'),('2067561460693577734','1185025876737396738','105','2026-06-18 18:54:00','admin','2026-06-18 18:54:00','admin'),('2067561460756492290','1185025876737396738','106','2026-06-18 18:54:00','admin','2026-06-18 18:54:00','admin'),('2067561460756492291','1185025876737396738','121','2026-06-18 18:54:00','admin','2026-06-18 18:54:00','admin'),('2067561460756492292','1185025876737396738','131','2026-06-18 18:54:00','admin','2026-06-18 18:54:00','admin'),('2067561460756492293','1185025876737396738','141','2026-06-18 18:54:00','admin','2026-06-18 18:54:00','admin'),('2067561460756492294','1185025876737396738','151','2026-06-18 18:54:00','admin','2026-06-18 18:54:00','admin'),('2067561460756492295','1185025876737396738','152','2026-06-18 18:54:00','admin','2026-06-18 18:54:00','admin'),('2067561460827795458','1185025876737396738','153','2026-06-18 18:54:00','admin','2026-06-18 18:54:00','admin'),('2067561460827795459','1185025876737396738','154','2026-06-18 18:54:00','admin','2026-06-18 18:54:00','admin'),('2067561460827795460','1185025876737396738','155','2026-06-18 18:54:00','admin','2026-06-18 18:54:00','admin'),('2067561460827795461','1185025876737396738','156','2026-06-18 18:54:00','admin','2026-06-18 18:54:00','admin'),('2067561460827795462','1185025876737396738','157','2026-06-18 18:54:00','admin','2026-06-18 18:54:00','admin'),('2067561460890710017','1185025876737396738','160','2026-06-18 18:54:00','admin','2026-06-18 18:54:00','admin'),('2067561460890710018','1185025876737396738','161','2026-06-18 18:54:00','admin','2026-06-18 18:54:00','admin'),('2067561460890710019','1185025876737396738','171','2026-06-18 18:54:00','admin','2026-06-18 18:54:00','admin'),('2067561460890710020','1185025876737396738','material_demand_plan','2026-06-18 18:54:00','admin','2026-06-18 18:54:00','admin'),('2068929699860254722','2000000000000000002','2','2026-06-22 13:30:54','admin','2026-06-22 13:30:54','admin'),('2068929699860254723','2000000000000000002','3','2026-06-22 13:30:54','admin','2026-06-22 13:30:54','admin'),('2068929699923169282','2000000000000000002','151','2026-06-22 13:30:54','admin','2026-06-22 13:30:54','admin'),('2068929699923169283','2000000000000000002','152','2026-06-22 13:30:54','admin','2026-06-22 13:30:54','admin'),('2068929699923169284','2000000000000000002','153','2026-06-22 13:30:54','admin','2026-06-22 13:30:54','admin'),('2068929699923169285','2000000000000000002','154','2026-06-22 13:30:54','admin','2026-06-22 13:30:54','admin'),('2068929699990278146','2000000000000000002','155','2026-06-22 13:30:54','admin','2026-06-22 13:30:54','admin'),('2068929699990278147','2000000000000000002','156','2026-06-22 13:30:54','admin','2026-06-22 13:30:54','admin'),('2068929699990278148','2000000000000000002','157','2026-06-22 13:30:54','admin','2026-06-22 13:30:54','admin');
/*!40000 ALTER TABLE `sp_sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_sys_user`
--

DROP TABLE IF EXISTS `sp_sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_sys_user` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `dept_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '""' COMMENT '部门id',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '""' COMMENT '邮箱',
  `mobile` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
  `tel` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '""' COMMENT '固定电话',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '性别(0:女;1:男;2:其他)',
  `birthday` datetime DEFAULT NULL COMMENT '出生年月日',
  `pic_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '""' COMMENT '图片id，对应sys_file表中的id',
  `id_card` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '""' COMMENT '身份证',
  `hobby` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '""' COMMENT '爱好',
  `province` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '""' COMMENT '省份',
  `city` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '""' COMMENT '城市',
  `district` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '""' COMMENT '区县',
  `street` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '""' COMMENT '街道',
  `street_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '""' COMMENT '门牌号',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '""' COMMENT '描述',
  `is_deleted` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '逻辑删除：1 表示删除，0 表示未删除，2 表示禁用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_sp_sys_user_username` (`username`) USING BTREE COMMENT '用户名唯一索引',
  KEY `idx_sp_sys_user_email` (`email`) USING BTREE COMMENT '用户邮箱唯一索引',
  KEY `idx_sp_sys_user_id_card` (`id_card`) USING BTREE,
  KEY `idx_sp_sys_user_mobile` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_sys_user`
--

LOCK TABLES `sp_sys_user` WRITE;
/*!40000 ALTER TABLE `sp_sys_user` DISABLE KEYS */;
INSERT INTO `sp_sys_user` VALUES ('1184019107907227649','超级管理员','admin','9d7281eeaebded0b091340cfa658a7e8','dept_001','','13776337796','44','0','2026-06-17 00:00:00','6134b050b5ea4f11a46f4f060b1d8f69.png','66','77','88','99','10','11','12','13','0','2019-10-15 16:12:08','SongPeng','2026-06-17 15:42:19','admin'),('2067052037789298689','郑子宜','zanna','b22dd9bc1a5970c9f8e42f08969678ec','dept_003','123@qq.com','123','123','0','2026-06-17 00:00:00','efa68b11ee924970ba734d7d4b0d2876.png','\"\"','\"\"','\"\"','\"\"','\"\"','\"\"','\"\"','\"\"','0','2026-06-17 09:09:44','admin','2026-06-20 22:41:16','admin'),('2068929495429877761','zanna','777','5b4aa054516041a0f05f08432c69e314','dept_002','zannajheng@gmail.com','13','13','1','2026-06-22 00:00:00','993cf217bad94c4b81d18daf7402db6d.png','\"\"','\"\"','\"\"','\"\"','\"\"','\"\"','\"\"','\"\"','0','2026-06-22 13:30:05','system','2026-06-22 15:56:21','admin');
/*!40000 ALTER TABLE `sp_sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_sys_user_role`
--

DROP TABLE IF EXISTS `sp_sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_sys_user_role` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户id',
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户对应的角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_sys_user_role`
--

LOCK TABLES `sp_sys_user_role` WRITE;
/*!40000 ALTER TABLE `sp_sys_user_role` DISABLE KEYS */;
INSERT INTO `sp_sys_user_role` VALUES ('2067147786162040833','1184019107907227649','1185025876737396738','2026-06-17 15:30:13','admin','2026-06-17 15:30:13','admin'),('2067147786183012353','1184019107907227649','2000000000000000001','2026-06-17 15:30:13','admin','2026-06-17 15:30:13','admin'),('2067147786183012354','1184019107907227649','2000000000000000002','2026-06-17 15:30:13','admin','2026-06-17 15:30:13','admin'),('2067147786183012355','1184019107907227649','2000000000000000003','2026-06-17 15:30:13','admin','2026-06-17 15:30:13','admin'),('2067147786245926914','1184019107907227649','2000000000000000004','2026-06-17 15:30:13','admin','2026-06-17 15:30:13','admin'),('2067147786245926915','1184019107907227649','2000000000000000005','2026-06-17 15:30:13','admin','2026-06-17 15:30:13','admin'),('2067147786245926916','1184019107907227649','2000000000000000006','2026-06-17 15:30:13','admin','2026-06-17 15:30:13','admin'),('2067147786245926917','1184019107907227649','2000000000000000007','2026-06-17 15:30:13','admin','2026-06-17 15:30:13','admin'),('2068343428733554689','2067052037789298689','2000000000000000002','2026-06-20 22:41:16','admin','2026-06-20 22:41:16','admin'),('2068966304402747394','2068929495429877761','2000000000000000002','2026-06-22 15:56:21','admin','2026-06-22 15:56:21','admin');
/*!40000 ALTER TABLE `sp_sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_table_manager`
--

DROP TABLE IF EXISTS `sp_table_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_table_manager` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '表名称',
  `table_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '表描述',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  `is_deleted` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '逻辑删除：1 表示删除，0 表示未删除，2 表示禁用',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '""' COMMENT '授权(多个用逗号分隔，如：sys:menu:list,sys:menu:create)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index1` (`table_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='主数据通用管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_table_manager`
--

LOCK TABLES `sp_table_manager` WRITE;
/*!40000 ALTER TABLE `sp_table_manager` DISABLE KEYS */;
INSERT INTO `sp_table_manager` VALUES ('1283020801696837633','sp_bom','BOM清单','2020-07-14 20:49:31','admin','2020-07-14 20:49:31','admin','0','\"\"'),('1283020801696837634','sp_factroy','工厂','2026-06-04 00:00:00','admin','2026-06-22 19:28:37','admin','0','\"\"'),('1283020801696837635','sp_work_shop','工作车间','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin','0','\"\"'),('1283020801696837636','sp_line','线体','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin','0','\"\"'),('1283020801696837637','sp_oper','工序定义','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin','0','\"\"'),('1283020801696837638','sp_bom_item','BOM物料项','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin','0','\"\"'),('1283020801696837639','sp_bom_oper_relation','BOM工序关系','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin','0','\"\"'),('1283020801696837640','sp_flow','流程定义','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin','0','\"\"'),('1283020801696837641','sp_flow_oper_relation','流程工序关系','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin','0','\"\"'),('1283020801696837642','sp_material_demand_plan','物料需求计划','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin','0','\"\"'),('1283020801696837643','sp_materile','物料主数据','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin','0','\"\"'),('1283020801696837644','sp_oper_content','工序内容','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin','0','\"\"'),('1283020801696837645','sp_oper_equipment','工序设备','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin','0','\"\"'),('1283020801696837646','sp_oper_material_list','工序物料清单','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin','0','\"\"'),('1283020801696837647','sp_oper_tech_doc','工序技术文档','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin','0','\"\"'),('1283020801696837648','sp_order','生产订单','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin','0','\"\"'),('1283020801696837649','sp_part','零件/部件','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin','0','\"\"'),('1283020801696837650','sp_sys_department','系统-部门管理','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin','0','\"\"'),('1283020801696837651','sp_sys_dict','系统-数据字典','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin','0','\"\"'),('1283020801696837652','sp_sys_menu','系统-菜单管理','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin','0','\"\"'),('1283020801696837653','sp_sys_role','系统-角色管理','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin','0','\"\"'),('1283020801696837654','sp_sys_role_menu','系统-角色菜单关联','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin','0','\"\"'),('1283020801696837655','sp_sys_user','系统-用户管理','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin','0','\"\"'),('1283020801696837656','sp_sys_user_role','系统-用户角色关联','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin','0','\"\"'),('1283020801696837657','sp_table_manager','系统-基础数据表配置','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin','0','\"\"'),('1283020801696837658','sp_table_manager_item','系统-基础数据字段配置','2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin','0','\"\"');
/*!40000 ALTER TABLE `sp_table_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_table_manager_item`
--

DROP TABLE IF EXISTS `sp_table_manager_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_table_manager_item` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `table_name_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '表名称id',
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '字段',
  `field_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '字段描述',
  `must_fill` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否必填',
  `sort_num` int NOT NULL COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='主数据基础数据明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_table_manager_item`
--

LOCK TABLES `sp_table_manager_item` WRITE;
/*!40000 ALTER TABLE `sp_table_manager_item` DISABLE KEYS */;
INSERT INTO `sp_table_manager_item` VALUES ('1283020801742974978','1283020801696837633','materiel_desc','888','Y',1,'2020-07-14 20:49:31','admin','2020-07-14 20:49:31','admin'),('1283020801742974981','1283020801696837635','work_shop','车间','N',1,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742974982','1283020801696837635','work_shop_desc','车间描述','N',2,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742974983','1283020801696837636','line','线体','Y',1,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742974984','1283020801696837636','line_desc','线体描述','N',2,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742974985','1283020801696837636','process_section','工序段代号','N',3,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742974986','1283020801696837637','oper','工序','Y',1,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742974987','1283020801696837637','oper_desc','工序描述','N',2,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742974988','1283020801696837638','bom_head_id','BOM头ID','N',1,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742974989','1283020801696837638','materiel_item_code','物料项编码','Y',2,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742974990','1283020801696837638','materiel_item_desc','物料项描述','N',3,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742974991','1283020801696837638','line_no','行号','N',4,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742974992','1283020801696837638','item_num','数量','N',5,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742974993','1283020801696837638','item_unit','单位','N',6,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742974994','1283020801696837638','oper_typer','工序类型','N',7,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742974995','1283020801696837639','bom_id','BOM ID','N',1,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742974996','1283020801696837639','bom_code','BOM编码','N',2,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742974997','1283020801696837639','materiel_desc','物料描述','N',3,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742974998','1283020801696837639','node_name','节点名称','N',4,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742974999','1283020801696837639','node_level','节点层级','N',5,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975000','1283020801696837639','bom_item_id','BOM物料项ID','N',6,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975001','1283020801696837639','oper_id','工序ID','N',7,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975002','1283020801696837639','oper','工序','Y',8,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975003','1283020801696837639','oper_desc','工序描述','N',9,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975004','1283020801696837639','work_center','工作中心','N',10,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975005','1283020801696837639','work_center_desc','工作中心描述','N',11,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975006','1283020801696837639','oper_time','工时','N',12,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975007','1283020801696837639','produce_cycle','生产周期','N',13,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975008','1283020801696837639','sort_num','排序号','N',14,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975009','1283020801696837639','is_locked','是否锁定','N',15,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975010','1283020801696837640','flow','流程编码','Y',1,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975011','1283020801696837640','flow_desc','流程描述','Y',2,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975012','1283020801696837640','process','所属制程','N',3,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975013','1283020801696837641','flow_id','流程ID','N',1,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975014','1283020801696837641','flow','流程编码','Y',2,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975015','1283020801696837641','per_oper_id','前工序ID','N',3,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975016','1283020801696837641','per_oper','前工序','N',4,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975017','1283020801696837641','oper_id','工序ID','N',5,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975018','1283020801696837641','oper','工序','Y',6,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975019','1283020801696837641','next_oper_id','后工序ID','N',7,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975020','1283020801696837641','next_oper','后工序','N',8,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975021','1283020801696837641','sort_num','排序号','N',9,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975022','1283020801696837641','oper_type','工序类型','N',10,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975023','1283020801696837642','order_code','订单编码','N',1,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975024','1283020801696837642','product_serial_no','产品序列号','N',2,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975025','1283020801696837642','task_serial_no','任务序列号','N',3,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975026','1283020801696837642','product_name','产品名称','N',4,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975027','1283020801696837642','work_center_name','工作中心名称','N',5,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975028','1283020801696837642','work_center_code','工作中心编码','N',6,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975029','1283020801696837642','materiel_code','物料编码','N',7,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975030','1283020801696837642','materiel_name','物料名称','N',8,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975031','1283020801696837642','require_qty','需求数量','N',9,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975032','1283020801696837642','unit','单位','N',10,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975033','1283020801696837642','demand_date','需求日期','N',11,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975034','1283020801696837642','delivery_status','交货状态','N',12,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975035','1283020801696837642','stock_out_qty','出库数量','N',13,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975036','1283020801696837642','net_require_qty','净需求数量','N',14,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975037','1283020801696837642','stock_in_status','入库状态','N',15,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975038','1283020801696837642','stock_in_order_no','入库单号','N',16,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975039','1283020801696837642','remark','备注','N',17,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975040','1283020801696837643','materiel','物料编码','Y',1,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975041','1283020801696837643','materiel_desc','物料描述','N',2,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975042','1283020801696837643','unit','单位','N',3,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975043','1283020801696837643','product_group','产品组','N',4,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975044','1283020801696837643','mat_type','物料类型','Y',5,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975045','1283020801696837643','model','型号','N',6,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975046','1283020801696837643','size','尺寸','N',7,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975047','1283020801696837643','flow_id','流程ID','N',8,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975048','1283020801696837643','flow_desc','流程描述','N',9,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975049','1283020801696837644','bom_oper_relation_id','BOM工序关系ID','N',1,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975050','1283020801696837644','bom_id','BOM ID','N',2,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975051','1283020801696837644','bom_code','BOM编码','N',3,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975052','1283020801696837644','bom_item_id','BOM物料项ID','N',4,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975053','1283020801696837644','node_name','节点名称','N',5,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975054','1283020801696837644','oper_id','工序ID','N',6,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975055','1283020801696837644','oper','工序','Y',7,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975056','1283020801696837644','oper_desc','工序描述','N',8,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975057','1283020801696837644','work_center','工作中心','N',9,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975058','1283020801696837644','work_center_desc','工作中心描述','N',10,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975059','1283020801696837644','oper_time','工时','N',11,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975060','1283020801696837644','produce_cycle','生产周期','N',12,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975061','1283020801696837644','is_produce_plan','是否生产计划','N',13,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975062','1283020801696837644','work_center_type','工作中心类型','N',14,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975063','1283020801696837644','oper_content','工序内容','N',15,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975064','1283020801696837644','tech_requirement','技术要求','N',16,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975065','1283020801696837644','oper_images','工序图片','N',17,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975066','1283020801696837644','oper_requirement','工序要求','N',18,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975067','1283020801696837644','is_need_inspect','是否需要检验','N',19,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975068','1283020801696837644','inspect_images','检验图片','N',20,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975069','1283020801696837644','attention','注意事项','N',21,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975070','1283020801696837644','status','状态','N',22,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975071','1283020801696837645','oper_content_id','工序内容ID','N',1,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975072','1283020801696837645','bom_oper_relation_id','BOM工序关系ID','N',2,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975073','1283020801696837645','equipment_code','设备编码','N',3,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975074','1283020801696837645','equipment_name','设备名称','Y',4,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975075','1283020801696837645','equipment_model','设备型号','N',5,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975076','1283020801696837645','equipment_usage','设备用途','N',6,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975077','1283020801696837645','equipment_remark','设备备注','N',7,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975078','1283020801696837645','require_qty','需求数量','N',8,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975079','1283020801696837646','oper_content_id','工序内容ID','N',1,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975080','1283020801696837646','bom_oper_relation_id','BOM工序关系ID','N',2,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975081','1283020801696837646','materiel_code','物料编码','N',3,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975082','1283020801696837646','materiel_name','物料名称','Y',4,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975083','1283020801696837646','materiel_spec','物料规格','N',5,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975084','1283020801696837646','materiel_type','物料类型','N',6,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975085','1283020801696837646','require_qty','需求数量','N',7,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975086','1283020801696837646','sort_num','排序号','N',8,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975087','1283020801696837647','oper_content_id','工序内容ID','N',1,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975088','1283020801696837647','bom_oper_relation_id','BOM工序关系ID','N',2,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975089','1283020801696837647','doc_desc','文档描述','Y',3,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975090','1283020801696837647','doc_images','文档图片','N',4,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975091','1283020801696837647','doc_files','文档附件','N',5,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975092','1283020801696837648','order_code','订单编码','Y',1,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975093','1283020801696837648','order_description','订单描述','N',2,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975094','1283020801696837648','qty','数量','N',3,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975095','1283020801696837648','order_type','订单类型','N',4,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975096','1283020801696837648','flow_id','流程ID','N',5,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975097','1283020801696837648','materiel','物料编码','N',6,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975098','1283020801696837648','materiel_desc','物料描述','N',7,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975099','1283020801696837648','plan_start_time','计划开始时间','N',8,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975100','1283020801696837648','plan_end_time','计划结束时间','N',9,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975101','1283020801696837648','statue','状态','N',10,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975102','1283020801696837648','remark','备注','N',11,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975103','1283020801696837649','part_no','零件编号','Y',1,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975104','1283020801696837649','part_name','零件名称','Y',2,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975105','1283020801696837649','remark','备注','N',3,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975106','1283020801696837650','parent_id','父部门ID','N',1,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975107','1283020801696837650','name','部门名称','Y',2,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975108','1283020801696837650','sort_num','排序号','N',3,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975109','1283020801696837651','name','字典名称','Y',1,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975110','1283020801696837651','value','字典值','Y',2,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975111','1283020801696837651','type','字典类型','Y',3,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975112','1283020801696837651','descr','描述','N',4,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975113','1283020801696837651','sort_num','排序号','N',5,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975114','1283020801696837651','parent_id','父字典ID','N',6,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975115','1283020801696837652','code','菜单编码','Y',1,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975116','1283020801696837652','name','菜单名称','Y',2,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975117','1283020801696837652','url','菜单URL','N',3,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975118','1283020801696837652','parent_id','父菜单ID','N',4,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975119','1283020801696837652','grade','菜单层级','N',5,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975120','1283020801696837652','sort_num','排序号','N',6,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975121','1283020801696837652','type','菜单类型','N',7,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975122','1283020801696837652','permission','权限标识','N',8,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975123','1283020801696837652','icon','图标','N',9,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975124','1283020801696837652','descr','描述','N',10,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975125','1283020801696837653','name','角色名称','Y',1,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975126','1283020801696837653','code','角色编码','Y',2,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975127','1283020801696837653','descr','描述','N',3,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975128','1283020801696837654','role_id','角色ID','Y',1,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975129','1283020801696837654','menu_id','菜单ID','Y',2,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975130','1283020801696837655','name','姓名','Y',1,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975131','1283020801696837655','username','用户名','Y',2,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975132','1283020801696837655','password','密码','N',3,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975133','1283020801696837655','dept_id','部门ID','N',4,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975134','1283020801696837655','email','邮箱','N',5,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975135','1283020801696837655','mobile','手机号','Y',6,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975136','1283020801696837655','tel','固定电话','N',7,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975137','1283020801696837655','sex','性别','N',8,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975138','1283020801696837655','birthday','出生日期','N',9,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975139','1283020801696837655','pic_id','图片ID','N',10,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975140','1283020801696837655','id_card','身份证','N',11,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975141','1283020801696837655','hobby','爱好','N',12,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975142','1283020801696837655','province','省份','N',13,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975143','1283020801696837655','city','城市','N',14,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975144','1283020801696837655','district','区县','N',15,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975145','1283020801696837655','street','街道','N',16,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975146','1283020801696837655','street_number','门牌号','N',17,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975147','1283020801696837655','descr','描述','N',18,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975148','1283020801696837656','user_id','用户ID','Y',1,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975149','1283020801696837656','role_id','角色ID','Y',2,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975150','1283020801696837657','table_name','表名称','Y',1,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975151','1283020801696837657','table_desc','表描述','N',2,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975152','1283020801696837657','permission','权限标识','N',3,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975153','1283020801696837658','table_name_id','所属表ID','Y',1,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975154','1283020801696837658','field','字段名','Y',2,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975155','1283020801696837658','field_desc','字段描述','N',3,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975156','1283020801696837658','must_fill','是否必填','N',4,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('1283020801742975157','1283020801696837658','sort_num','排序号','N',5,'2026-06-04 00:00:00','admin','2026-06-04 00:00:00','admin'),('2069019722555183105','1283020801696837634',NULL,'工厂','N',1,'2026-06-22 19:28:37','admin','2026-06-22 19:28:37','admin'),('2069019722555183106','1283020801696837634',NULL,'工厂描述','N',2,'2026-06-22 19:28:37','admin','2026-06-22 19:28:37','admin');
/*!40000 ALTER TABLE `sp_table_manager_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_work_shop`
--

DROP TABLE IF EXISTS `sp_work_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_work_shop` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `work_shop` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `work_shop_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='工作车间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_work_shop`
--

LOCK TABLES `sp_work_shop` WRITE;
/*!40000 ALTER TABLE `sp_work_shop` DISABLE KEYS */;
INSERT INTO `sp_work_shop` VALUES ('1336875254022176','DC-车间1','电池组装车间','2020-03-14 11:29:57','admin','2020-03-18 10:52:39','admin'),('1336875591663648','DC-JS01','加酸车间','2020-03-14 11:32:38','admin','2020-03-14 11:32:38','admin');
/*!40000 ALTER TABLE `sp_work_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sparchetype'
--

--
-- Dumping routines for database 'sparchetype'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-23 22:05:31
