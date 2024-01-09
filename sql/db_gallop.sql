/*
 Navicat Premium Data Transfer

 Source Server         : Girt
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : db_gallop

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 09/01/2024 14:38:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity_info
-- ----------------------------
DROP TABLE IF EXISTS `activity_info`;
CREATE TABLE `activity_info`  (
  `activity_id` int NOT NULL AUTO_INCREMENT COMMENT '活动编号',
  `activity_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动标题',
  `activity_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动内容',
  `activity_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动封面',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`activity_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity_info
-- ----------------------------
INSERT INTO `activity_info` VALUES (1, '测试活动', '测试活动内容', '/profile/upload/2023/09/30/大鱼海棠_20230930111118A001.png', '0', '', '2023-09-11 21:53:46', '', '2023-09-30 11:11:19', NULL);
INSERT INTO `activity_info` VALUES (2, '测试活动2', '测试活动2内容', '/profile/upload/2023/09/30/11101819094758_20230930113055A002.jpg', '0', '', '2023-09-30 11:30:58', '', NULL, NULL);
INSERT INTO `activity_info` VALUES (3, '测试活动3', '测试活动3内容', '/profile/upload/2023/09/30/04e532cf-af7e-4264-b228-105d23d921cc_20230930113113A003.jpg', '0', '', '2023-09-30 11:31:16', '', NULL, NULL);

-- ----------------------------
-- Table structure for brand_info
-- ----------------------------
DROP TABLE IF EXISTS `brand_info`;
CREATE TABLE `brand_info`  (
  `brand_id` int NOT NULL AUTO_INCREMENT COMMENT '品牌唯一id',
  `brand_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '品牌名称',
  `brand_des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '品牌简介',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '品牌状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`brand_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brand_info
-- ----------------------------
INSERT INTO `brand_info` VALUES (1, '奔驰', '奔驰汽车品牌', '0', '', '2023-09-11 20:23:53', 'admin', '2023-09-11 20:34:25', '奔驰汽车品牌');
INSERT INTO `brand_info` VALUES (2, '宝马', '宝马汽车品牌', '0', '', '2023-09-11 20:50:23', '', NULL, '宝马汽车品牌');
INSERT INTO `brand_info` VALUES (3, '大众', '大众汽车品牌', '0', '', '2023-09-11 20:50:31', '', NULL, '大众汽车品牌');
INSERT INTO `brand_info` VALUES (4, '奥迪', '奥迪品牌信息', '0', '', '2023-09-11 22:37:13', '', NULL, '奥迪品牌信息');
INSERT INTO `brand_info` VALUES (5, '本田', '本田品牌信息', '0', '', '2023-09-11 22:37:30', '', NULL, '本田品牌信息');
INSERT INTO `brand_info` VALUES (6, '别克', '别克品牌信息', '0', '', '2023-09-11 22:37:39', '', NULL, '别克品牌信息');
INSERT INTO `brand_info` VALUES (7, '比亚迪', '比亚迪品牌信息', '0', '', '2023-09-11 22:37:48', '', NULL, '比亚迪品牌信息');
INSERT INTO `brand_info` VALUES (8, '长安', '长安品牌信息', '0', '', '2023-09-11 22:38:10', '', NULL, '长安品牌信息');
INSERT INTO `brand_info` VALUES (9, '丰田', '丰田品牌信息', '0', '', '2023-09-11 22:38:46', '', NULL, '丰田品牌信息');
INSERT INTO `brand_info` VALUES (10, '福特', '福特品牌信息', '0', '', '2023-09-11 22:38:56', '', NULL, '福特品牌信息');
INSERT INTO `brand_info` VALUES (11, '红旗', '红旗品牌信息', '0', '', '2023-09-11 22:39:24', '', NULL, '红旗品牌信息');
INSERT INTO `brand_info` VALUES (12, '凯迪拉克', NULL, '0', '', '2024-01-05 15:47:44', '', NULL, NULL);

-- ----------------------------
-- Table structure for car_info
-- ----------------------------
DROP TABLE IF EXISTS `car_info`;
CREATE TABLE `car_info`  (
  `car_id` int NOT NULL AUTO_INCREMENT COMMENT '车辆信息编号',
  `brand_id` int NOT NULL COMMENT '车辆品牌编号',
  `car_type_id` int NOT NULL COMMENT '车辆车型编号',
  `dept_id` int NOT NULL COMMENT '车辆所属门店编号',
  `car_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车辆名称',
  `car_des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '车辆简介',
  `car_imgs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '车辆图片',
  `rent` double NOT NULL COMMENT '车辆租金',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车辆状态（0正常 1停用 2维修 3租出）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`car_id`) USING BTREE,
  INDEX `brand_id`(`brand_id`) USING BTREE,
  INDEX `car_type_id`(`car_type_id`) USING BTREE,
  CONSTRAINT `brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brand_info` (`brand_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `car_type_id` FOREIGN KEY (`car_type_id`) REFERENCES `car_type` (`car_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of car_info
-- ----------------------------
INSERT INTO `car_info` VALUES (1, 10, 4, 201, 'Mustang', 'Mustang超级跑车', '/profile/upload/2023/09/12/Mustang-1_20230912140838A001.jpg', 5200, '3', '', '2023-09-12 11:08:42', '', '2024-01-09 13:26:23', NULL);
INSERT INTO `car_info` VALUES (2, 4, 2, 202, '奥迪A6L', '奥迪A6L', '/profile/upload/2023/09/12/audi-A6L-1_20230912162657A001.jpg,/profile/upload/2024/01/05/Mustang-1_20240105110358A001.jpg', 1500, '0', '', '2023-09-12 16:27:18', '', '2024-01-05 21:04:41', NULL);
INSERT INTO `car_info` VALUES (3, 1, 2, 201, '奔驰EQS 2022款 EQS 450+ 先锋版', NULL, '/profile/upload/2023/10/12/6314cf91a63d462a9da11785b1d5fc30~1200x0_20231012101714A001.png', 1988, '0', '', '2023-10-12 10:17:44', '', '2023-10-12 10:30:53', NULL);
INSERT INTO `car_info` VALUES (4, 1, 2, 202, '奔驰E级PHEV 2022款 二次改款 E 350 e L 轿车', NULL, '/profile/upload/2023/10/12/933fc68ecbda48daa07211a574a36681~820x0_20231012101821A002.png', 2100, '0', '', '2023-10-12 10:18:39', '', '2023-10-12 10:30:42', NULL);
INSERT INTO `car_info` VALUES (5, 1, 1, 201, '奔驰GLE 2022款 GLE 350 4MATIC 时尚型', NULL, '/profile/upload/2023/10/12/9c05ef2fea8a4266a80d3f7fc748ce2a~820x0_20231012101938A003.png', 1900, '0', '', '2023-10-12 10:19:43', '', '2024-01-05 15:55:28', NULL);
INSERT INTO `car_info` VALUES (6, 4, 1, 202, '奥迪Q7 2014款 35 TFSI 运动型', NULL, '/profile/upload/2023/10/12/3e5aae0c2370474197d3f79d9d9ee4b6~1850x0_20231012102018A004.png', 2000, '0', '', '2023-10-12 10:20:37', '', '2023-10-12 10:30:00', NULL);
INSERT INTO `car_info` VALUES (7, 3, 1, 201, '探岳X 2020款 330TSI 两驱尊贵智联版', NULL, '/profile/upload/2023/10/12/05e21e810c57495c8e589356a6e6afa8~820x0_20231012104718A001.png', 500, '0', '', '2023-10-12 10:47:33', '', NULL, NULL);
INSERT INTO `car_info` VALUES (8, 3, 2, 201, '高尔夫 2021款 380TSI DSG GTI', NULL, '/profile/upload/2023/10/12/b1235f037a93481295bc646d3d6f930c~1850x0_20231012104802A002.png', 300, '0', '', '2023-10-12 10:48:18', '', NULL, NULL);
INSERT INTO `car_info` VALUES (9, 3, 2, 202, '大众CC 2020款 330TSI 魅颜版 国VI', NULL, '/profile/upload/2023/10/12/a1d4dd6524674a91ad2df29bd91ade78~820x0_20231012104855A003.png', 266, '0', '', '2023-10-12 10:49:00', '', NULL, NULL);
INSERT INTO `car_info` VALUES (10, 5, 1, 201, '冠道 2020款 370 TURBO 9AT 至尊版 AWD', NULL, '/profile/upload/2023/10/12/1797fa24094445eebe933ae0e7c08b85~820x0_20231012105013A004.png', 678, '0', '', '2023-10-12 10:50:18', '', NULL, NULL);
INSERT INTO `car_info` VALUES (11, 4, 2, 201, '奥迪 2024款 Coupe 40 TFSI 时尚动感型', '2024款 Coupe 40 TFSI 时尚动感型', '/profile/upload/2024/01/05/c5164493ffd1ddb1c2f7152159e0c303~512x0_20240105154551A001.jpg', 1500, '0', '', '2024-01-05 15:45:57', '', NULL, NULL);
INSERT INTO `car_info` VALUES (12, 12, 2, 202, '凯迪拉克 CT5 2024款 28T 尊贵型', '2024款 28T 尊贵型', '/profile/upload/2024/01/05/04d1f41ebba4ea8eaf934d96a483d2a1~512x0_20240105154841A002.jpg', 500, '0', '', '2024-01-05 15:48:47', '', NULL, NULL);

-- ----------------------------
-- Table structure for car_type
-- ----------------------------
DROP TABLE IF EXISTS `car_type`;
CREATE TABLE `car_type`  (
  `car_type_id` int NOT NULL AUTO_INCREMENT COMMENT '车型编号',
  `car_type_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车型名称',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车型状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`car_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of car_type
-- ----------------------------
INSERT INTO `car_type` VALUES (1, 'SUV', '0', '', '2023-09-11 20:59:13', 'admin', NULL, 'SUV车型');
INSERT INTO `car_type` VALUES (2, '轿车', '0', '', '2023-09-11 21:06:32', '', NULL, '轿车车型');
INSERT INTO `car_type` VALUES (3, '轿跑', '0', '', '2023-09-11 21:06:41', '', NULL, '轿跑车型');
INSERT INTO `car_type` VALUES (4, '超跑', '0', '', '2023-09-11 21:06:49', '', NULL, '超跑车型');
INSERT INTO `car_type` VALUES (5, '经济型', '0', '', '2023-09-11 21:07:03', '', NULL, '经济型车型');
INSERT INTO `car_type` VALUES (6, '商务型', '0', '', '2023-09-11 21:07:16', '', NULL, '商务型车型');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'brand_info', '品牌信息', NULL, NULL, 'BrandInfo', 'crud', 'com.ruoyi.project.system', 'system', 'brand', '品牌信息', 'gallop', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-09-11 19:42:15', '', '2023-09-11 19:55:24', NULL);
INSERT INTO `gen_table` VALUES (3, 'car_type', '车型信息', '', '', 'CarTypeInfo', 'crud', 'com.ruoyi.project.system', 'system', 'carType', '车型信息', 'gallop', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-09-11 20:54:59', '', '2023-09-11 22:23:16', NULL);
INSERT INTO `gen_table` VALUES (4, 'activity_info', '活动信息', NULL, NULL, 'ActivityInfo', 'crud', 'com.ruoyi.project.system', 'system', 'activity', '活动信息', 'gallop', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-09-11 21:49:02', '', '2023-09-11 21:50:50', NULL);
INSERT INTO `gen_table` VALUES (6, 'car_info', '车辆信息', '', '', 'CarInfo', 'crud', 'com.ruoyi.project.system', 'system', 'carInfo', '车辆信息', 'gallop', '0', '/', '{\"parentMenuId\":2019}', 'admin', '2023-09-11 22:17:40', '', '2023-09-11 22:20:03', '车辆信息');
INSERT INTO `gen_table` VALUES (7, 'order_info', '订单信息', NULL, NULL, 'OrderInfo', 'crud', 'com.ruoyi.project.system', 'system', 'order', '订单信息', 'gallop', '0', '/', '{\"parentMenuId\":\"2019\"}', 'admin', '2023-09-12 13:21:22', '', '2023-09-12 16:44:56', NULL);
INSERT INTO `gen_table` VALUES (8, 'sys_user_audit', '用户审核认证', NULL, NULL, 'SysUserAudit', 'crud', 'com.ruoyi.project.system', 'system', 'audit', '用户认证审核', 'gallop', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-09-14 14:51:16', '', '2023-09-14 14:53:20', NULL);
INSERT INTO `gen_table` VALUES (9, 'repair_info', '维修信息', NULL, NULL, 'RepairInfo', 'crud', 'com.ruoyi.project.system', 'system', 'repair', '维修信息', 'gallop', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-09-17 15:08:22', '', '2023-09-17 18:59:28', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'brand_id', '品牌编号', 'int', 'Long', 'brandId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-09-11 19:42:15', '', '2023-09-11 19:55:24');
INSERT INTO `gen_table_column` VALUES (2, 1, 'brand_name', '品牌名称', 'varchar(50)', 'String', 'brandName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-09-11 19:42:15', '', '2023-09-11 19:55:24');
INSERT INTO `gen_table_column` VALUES (3, 1, 'brand_des', '品牌简介', 'varchar(255)', 'String', 'brandDes', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-09-11 19:42:15', '', '2023-09-11 19:55:24');
INSERT INTO `gen_table_column` VALUES (4, 1, 'status', '品牌状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2023-09-11 19:42:15', '', '2023-09-11 19:55:24');
INSERT INTO `gen_table_column` VALUES (5, 1, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2023-09-11 19:42:15', '', '2023-09-11 19:55:24');
INSERT INTO `gen_table_column` VALUES (6, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2023-09-11 19:42:15', '', '2023-09-11 19:55:24');
INSERT INTO `gen_table_column` VALUES (7, 1, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2023-09-11 19:42:15', '', '2023-09-11 19:55:24');
INSERT INTO `gen_table_column` VALUES (8, 1, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2023-09-11 19:42:15', '', '2023-09-11 19:55:24');
INSERT INTO `gen_table_column` VALUES (9, 1, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 9, 'admin', '2023-09-11 19:42:15', '', '2023-09-11 19:55:24');
INSERT INTO `gen_table_column` VALUES (12, 3, 'car_type_id', '车型编号', 'int', 'Long', 'carTypeId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-09-11 20:54:59', '', '2023-09-11 22:23:16');
INSERT INTO `gen_table_column` VALUES (13, 3, 'car_type_name', '车型名称', 'varchar(50)', 'String', 'carTypeName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-09-11 20:54:59', '', '2023-09-11 22:23:16');
INSERT INTO `gen_table_column` VALUES (14, 3, 'status', '车型状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', 3, 'admin', '2023-09-11 20:54:59', '', '2023-09-11 22:23:16');
INSERT INTO `gen_table_column` VALUES (15, 3, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2023-09-11 20:54:59', '', '2023-09-11 22:23:16');
INSERT INTO `gen_table_column` VALUES (16, 3, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2023-09-11 20:54:59', '', '2023-09-11 22:23:16');
INSERT INTO `gen_table_column` VALUES (17, 3, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2023-09-11 20:54:59', '', '2023-09-11 22:23:16');
INSERT INTO `gen_table_column` VALUES (18, 3, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2023-09-11 20:54:59', '', '2023-09-11 22:23:16');
INSERT INTO `gen_table_column` VALUES (19, 3, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 8, 'admin', '2023-09-11 20:54:59', '', '2023-09-11 22:23:16');
INSERT INTO `gen_table_column` VALUES (20, 4, 'activity_id', '活动编号', 'int', 'Long', 'activityId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-09-11 21:49:02', '', '2023-09-11 21:50:50');
INSERT INTO `gen_table_column` VALUES (21, 4, 'activity_title', '活动标题', 'varchar(50)', 'String', 'activityTitle', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-09-11 21:49:02', '', '2023-09-11 21:50:50');
INSERT INTO `gen_table_column` VALUES (22, 4, 'activity_content', '活动内容', 'text', 'String', 'activityContent', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'textarea', '', 3, 'admin', '2023-09-11 21:49:02', '', '2023-09-11 21:50:50');
INSERT INTO `gen_table_column` VALUES (23, 4, 'activity_cover', '活动封面', 'varchar(255)', 'String', 'activityCover', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'imageUpload', '', 4, 'admin', '2023-09-11 21:49:02', '', '2023-09-11 21:50:50');
INSERT INTO `gen_table_column` VALUES (24, 4, 'status', '活动状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'radio', 'sys_normal_disable', 5, 'admin', '2023-09-11 21:49:02', '', '2023-09-11 21:50:50');
INSERT INTO `gen_table_column` VALUES (25, 4, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2023-09-11 21:49:02', '', '2023-09-11 21:50:50');
INSERT INTO `gen_table_column` VALUES (26, 4, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2023-09-11 21:49:02', '', '2023-09-11 21:50:50');
INSERT INTO `gen_table_column` VALUES (27, 4, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2023-09-11 21:49:02', '', '2023-09-11 21:50:50');
INSERT INTO `gen_table_column` VALUES (28, 4, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2023-09-11 21:49:02', '', '2023-09-11 21:50:50');
INSERT INTO `gen_table_column` VALUES (29, 4, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '0', NULL, 'EQ', 'textarea', '', 10, 'admin', '2023-09-11 21:49:02', '', '2023-09-11 21:50:50');
INSERT INTO `gen_table_column` VALUES (37, 6, 'car_id', '车辆信息编号', 'int', 'Long', 'carId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-09-11 22:17:40', '', '2023-09-11 22:20:03');
INSERT INTO `gen_table_column` VALUES (38, 6, 'brand_id', '车辆品牌编号', 'int', 'Long', 'brandId', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'select', '', 2, 'admin', '2023-09-11 22:17:40', '', '2023-09-11 22:20:03');
INSERT INTO `gen_table_column` VALUES (39, 6, 'car_type_id', '车辆车型编号', 'int', 'Long', 'carTypeId', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'select', '', 3, 'admin', '2023-09-11 22:17:40', '', '2023-09-11 22:20:03');
INSERT INTO `gen_table_column` VALUES (40, 6, 'car_name', '车辆名称', 'varchar(50)', 'String', 'carName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2023-09-11 22:17:40', '', '2023-09-11 22:20:03');
INSERT INTO `gen_table_column` VALUES (41, 6, 'car_des', '车辆简介', 'varchar(255)', 'String', 'carDes', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2023-09-11 22:17:40', '', '2023-09-11 22:20:03');
INSERT INTO `gen_table_column` VALUES (42, 6, 'car_imgs', '车辆图片', 'text', 'String', 'carImgs', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'imageUpload', '', 6, 'admin', '2023-09-11 22:17:40', '', '2023-09-11 22:20:03');
INSERT INTO `gen_table_column` VALUES (43, 6, 'status', '车辆状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'radio', 'sys_car_status', 7, 'admin', '2023-09-11 22:17:40', '', '2023-09-11 22:20:03');
INSERT INTO `gen_table_column` VALUES (44, 6, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2023-09-11 22:17:40', '', '2023-09-11 22:20:03');
INSERT INTO `gen_table_column` VALUES (45, 6, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'datetime', '', 9, 'admin', '2023-09-11 22:17:40', '', '2023-09-11 22:20:03');
INSERT INTO `gen_table_column` VALUES (46, 6, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2023-09-11 22:17:40', '', '2023-09-11 22:20:03');
INSERT INTO `gen_table_column` VALUES (47, 6, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2023-09-11 22:17:40', '', '2023-09-11 22:20:03');
INSERT INTO `gen_table_column` VALUES (48, 6, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '0', NULL, 'EQ', 'textarea', '', 12, 'admin', '2023-09-11 22:17:40', '', '2023-09-11 22:20:03');
INSERT INTO `gen_table_column` VALUES (49, 7, 'order_id', '订单编号', 'int', 'Long', 'orderId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-09-12 13:21:22', '', '2023-09-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (50, 7, 'car_id', '车辆编号', 'int', 'Long', 'carId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-09-12 13:21:22', '', '2023-09-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (51, 7, 'brand_id', '品牌编号', 'int', 'Long', 'brandId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-09-12 13:21:22', '', '2023-09-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (52, 7, 'cart_type_id', '车型编号', 'int', 'Long', 'cartTypeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-09-12 13:21:22', '', '2023-09-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (53, 7, 'rental_day', '出租天数', 'int', 'Long', 'rentalDay', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2023-09-12 13:21:22', '', '2023-09-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (54, 7, 'price_day', '每日价格', 'double', 'Long', 'priceDay', '0', '0', '1', '1', '1', '1', '0', 'BETWEEN', 'input', '', 8, 'admin', '2023-09-12 13:21:22', '', '2023-09-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (55, 7, 'price_total', '租金总价', 'double', 'Long', 'priceTotal', '0', '0', '1', '1', '1', '1', '0', 'BETWEEN', 'input', '', 9, 'admin', '2023-09-12 13:21:22', '', '2023-09-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (56, 7, 'pay_status', '订单支付状态 （0待支付 1已支付 2取消支付）', 'char(1)', 'String', 'payStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_order_pay_status', 10, 'admin', '2023-09-12 13:21:22', '', '2023-09-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (57, 7, 'status', '订单状态（0取消 1出租驳回 2还车驳回 3出租审核中 4还车审核中 5出租中 6完成）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_order_status', 11, 'admin', '2023-09-12 13:21:22', '', '2023-09-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (58, 7, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2023-09-12 13:21:22', '', '2023-09-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (59, 7, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2023-09-12 13:21:22', '', '2023-09-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (60, 7, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2023-09-12 13:21:22', '', '2023-09-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (61, 7, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2023-09-12 13:21:22', '', '2023-09-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (62, 7, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '0', NULL, 'EQ', 'textarea', '', 16, 'admin', '2023-09-12 13:21:22', '', '2023-09-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (63, 7, 'dept_id', '门店编号', 'int', 'Long', 'deptId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, '', '2023-09-12 16:44:20', '', '2023-09-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (64, 7, 'end_time', '订单截止日期', 'datetime', 'Date', 'endTime', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'datetime', '', 7, '', '2023-09-12 16:44:20', '', '2023-09-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (65, 8, 'user_audit_id', '用户审核表编号', 'int', 'Long', 'userAuditId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-09-14 14:51:16', '', '2023-09-14 14:53:20');
INSERT INTO `gen_table_column` VALUES (66, 8, 'user_id', '用户编号', 'int', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 2, 'admin', '2023-09-14 14:51:16', '', '2023-09-14 14:53:20');
INSERT INTO `gen_table_column` VALUES (67, 8, 'user_id_card', '用户身份证号', 'varchar(255)', 'String', 'userIdCard', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2023-09-14 14:51:16', '', '2023-09-14 14:53:20');
INSERT INTO `gen_table_column` VALUES (68, 8, 'user_audit_name', '用户审核名字', 'varchar(255)', 'String', 'userAuditName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2023-09-14 14:51:16', '', '2023-09-14 14:53:20');
INSERT INTO `gen_table_column` VALUES (69, 8, 'id_card_imgs', '用户身份证照片信息', 'varchar(255)', 'String', 'idCardImgs', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'imageUpload', '', 5, 'admin', '2023-09-14 14:51:16', '', '2023-09-14 14:53:20');
INSERT INTO `gen_table_column` VALUES (70, 8, 'reject_reason', '驳回理由', 'varchar(255)', 'String', 'rejectReason', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2023-09-14 14:51:16', '', '2023-09-14 14:53:20');
INSERT INTO `gen_table_column` VALUES (71, 8, 'status', '订单状态（0未审核 1审核中 2驳回审核 3审核通过）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_user_audit_status', 7, 'admin', '2023-09-14 14:51:16', '', '2023-09-14 14:53:20');
INSERT INTO `gen_table_column` VALUES (72, 8, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2023-09-14 14:51:16', '', '2023-09-14 14:53:20');
INSERT INTO `gen_table_column` VALUES (73, 8, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2023-09-14 14:51:16', '', '2023-09-14 14:53:20');
INSERT INTO `gen_table_column` VALUES (74, 8, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2023-09-14 14:51:16', '', '2023-09-14 14:53:20');
INSERT INTO `gen_table_column` VALUES (75, 8, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2023-09-14 14:51:16', '', '2023-09-14 14:53:20');
INSERT INTO `gen_table_column` VALUES (76, 8, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '0', NULL, 'EQ', 'textarea', '', 12, 'admin', '2023-09-14 14:51:16', '', '2023-09-14 14:53:20');
INSERT INTO `gen_table_column` VALUES (77, 9, 'repair_id', '维修记录编号', 'int', 'Long', 'repairId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-09-17 15:08:22', '', '2023-09-17 18:59:28');
INSERT INTO `gen_table_column` VALUES (78, 9, 'car_id', '车辆编号', 'int', 'Long', 'carId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-09-17 15:08:22', '', '2023-09-17 18:59:28');
INSERT INTO `gen_table_column` VALUES (79, 9, 'repair_content', '维修内容', 'varchar(255)', 'String', 'repairContent', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'textarea', '', 3, 'admin', '2023-09-17 15:08:22', '', '2023-09-17 18:59:28');
INSERT INTO `gen_table_column` VALUES (80, 9, 'status', '维修状态（0取消 1维修中 2完成）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'repair_status', 4, 'admin', '2023-09-17 15:08:22', '', '2023-09-17 18:59:28');
INSERT INTO `gen_table_column` VALUES (81, 9, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2023-09-17 15:08:22', '', '2023-09-17 18:59:28');
INSERT INTO `gen_table_column` VALUES (82, 9, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2023-09-17 15:08:22', '', '2023-09-17 18:59:28');
INSERT INTO `gen_table_column` VALUES (83, 9, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2023-09-17 15:08:22', '', '2023-09-17 18:59:28');
INSERT INTO `gen_table_column` VALUES (84, 9, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2023-09-17 15:08:22', '', '2023-09-17 18:59:28');
INSERT INTO `gen_table_column` VALUES (85, 9, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '0', NULL, 'EQ', 'textarea', '', 9, 'admin', '2023-09-17 15:08:22', '', '2023-09-17 18:59:28');

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info`  (
  `order_id` int NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `user_id` int NOT NULL COMMENT '用户编号',
  `car_id` int NOT NULL COMMENT '车辆编号',
  `brand_id` int NOT NULL COMMENT '品牌编号',
  `car_type_id` int NOT NULL COMMENT '车型编号',
  `dept_id` int NOT NULL COMMENT '门店编号',
  `rental_day` int NOT NULL COMMENT '出租天数',
  `end_time` datetime NOT NULL COMMENT '订单截止日期',
  `price_day` double NOT NULL COMMENT '每日价格',
  `price_total` double NOT NULL COMMENT '租金总价',
  `pay_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单支付状态 （0待支付 1已支付 2取消支付）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单状态（0取消 1出租驳回 2还车驳回 3出租审核中 4还车审核中 5出租中 6完成）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_info
-- ----------------------------
INSERT INTO `order_info` VALUES (8, 108, 1, 10, 4, 201, 1, '2024-01-10 00:00:00', 5200, 5200, '0', '3', 'customer', '2024-01-09 13:26:23', 'customer', '2024-01-09 13:26:23', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for repair_info
-- ----------------------------
DROP TABLE IF EXISTS `repair_info`;
CREATE TABLE `repair_info`  (
  `repair_id` int NOT NULL AUTO_INCREMENT COMMENT '维修记录编号',
  `car_id` int NOT NULL COMMENT '车辆编号',
  `repair_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '维修内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '维修状态（0取消 1维修中 2完成）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`repair_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of repair_info
-- ----------------------------
INSERT INTO `repair_info` VALUES (2, 1, '维修大灯', '2', '', '2023-09-17 19:43:45', '', '2023-09-17 19:45:41', NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-09-11 11:57:45', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-09-11 11:57:45', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-09-11 11:57:45', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-09-11 11:57:45', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-09-11 11:57:45', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-09-11 11:57:45', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 203 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '驰行租车', 0, '驰行老板', '15888888888', 'gallop@qq.com', '0', '0', 'admin', '2023-09-11 11:57:45', 'admin', '2023-09-11 13:21:05');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-09-11 11:57:45', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-09-11 11:57:45', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-09-11 11:57:45', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-09-11 11:57:45', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-09-11 11:57:45', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-09-11 11:57:45', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-09-11 11:57:45', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-09-11 11:57:45', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-09-11 11:57:45', '', NULL);
INSERT INTO `sys_dept` VALUES (200, 100, '0,100', '深圳总店', 0, NULL, NULL, NULL, '0', '0', 'admin', '2023-09-11 13:25:54', '', NULL);
INSERT INTO `sys_dept` VALUES (201, 200, '0,100,200', '南山区门店', 0, '南山区门店店主', '15888888888', 'nanshan@gallop.com', '0', '0', 'admin', '2023-09-11 13:26:33', '', NULL);
INSERT INTO `sys_dept` VALUES (202, 200, '0,100,200', '福田区门店', 1, '福田区门店店长', '13377778888', 'futian@gallop.com', '0', '0', 'admin', '2023-09-11 21:35:56', 'admin', '2023-09-11 21:38:17');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '正常', '0', 'sys_car_status', NULL, 'primary', 'N', '0', 'admin', '2023-09-11 21:40:53', 'admin', '2023-09-11 21:44:20', '车辆正常启用状态（可租出）');
INSERT INTO `sys_dict_data` VALUES (101, 1, '停用', '1', 'sys_car_status', NULL, 'danger', 'N', '0', 'admin', '2023-09-11 21:41:37', '', NULL, '车辆停用状态');
INSERT INTO `sys_dict_data` VALUES (102, 2, '维修中', '2', 'sys_car_status', NULL, 'info', 'N', '0', 'admin', '2023-09-11 21:41:55', 'admin', '2023-09-17 19:44:10', '车辆维修状态');
INSERT INTO `sys_dict_data` VALUES (103, 3, '已租出', '3', 'sys_car_status', NULL, 'warning', 'N', '0', 'admin', '2023-09-11 21:43:59', '', NULL, '车辆已租出状态');
INSERT INTO `sys_dict_data` VALUES (104, 0, '取消订单', '0', 'sys_order_status', NULL, 'warning', 'N', '0', 'admin', '2023-09-12 12:01:01', '', NULL, '取消订单状态');
INSERT INTO `sys_dict_data` VALUES (105, 1, '出租驳回', '1', 'sys_order_status', NULL, 'danger', 'N', '0', 'admin', '2023-09-12 12:01:31', '', NULL, '出租驳回状态');
INSERT INTO `sys_dict_data` VALUES (106, 2, '还车驳回', '2', 'sys_order_status', NULL, 'danger', 'N', '0', 'admin', '2023-09-12 12:02:01', '', NULL, '还车驳回状态');
INSERT INTO `sys_dict_data` VALUES (107, 3, '出租审核中', '3', 'sys_order_status', NULL, 'success', 'N', '0', 'admin', '2023-09-12 13:06:59', '', NULL, '出租审核中状态');
INSERT INTO `sys_dict_data` VALUES (108, 4, '还车审核中', '4', 'sys_order_status', NULL, 'success', 'N', '0', 'admin', '2023-09-12 13:07:21', '', NULL, '还车审核中状态');
INSERT INTO `sys_dict_data` VALUES (109, 5, '出租中', '5', 'sys_order_status', NULL, 'info', 'N', '0', 'admin', '2023-09-12 13:07:49', '', NULL, '出租中状态');
INSERT INTO `sys_dict_data` VALUES (110, 6, '完成', '6', 'sys_order_status', NULL, 'primary', 'N', '0', 'admin', '2023-09-12 13:08:18', '', NULL, '完成状态');
INSERT INTO `sys_dict_data` VALUES (111, 0, '待支付', '0', 'sys_order_pay_status', NULL, 'warning', 'N', '0', 'admin', '2023-09-12 13:09:58', 'admin', '2023-09-12 13:12:45', '待支付状态');
INSERT INTO `sys_dict_data` VALUES (112, 1, '已支付', '1', 'sys_order_pay_status', NULL, 'primary', 'N', '0', 'admin', '2023-09-12 13:10:10', '', NULL, '已支付状态');
INSERT INTO `sys_dict_data` VALUES (113, 2, '取消支付', '2', 'sys_order_pay_status', NULL, 'danger', 'N', '0', 'admin', '2023-09-12 13:10:27', '', NULL, '取消支付状态');
INSERT INTO `sys_dict_data` VALUES (114, 0, '未审核', '0', 'sys_user_audit_status', NULL, 'warning', 'N', '0', 'admin', '2023-09-14 14:45:25', '', NULL, '未审核状态');
INSERT INTO `sys_dict_data` VALUES (115, 1, '审核中', '1', 'sys_user_audit_status', NULL, 'success', 'N', '0', 'admin', '2023-09-14 14:45:50', '', NULL, '审核中状态');
INSERT INTO `sys_dict_data` VALUES (116, 2, '驳回审核', '2', 'sys_user_audit_status', NULL, 'danger', 'N', '0', 'admin', '2023-09-14 14:46:14', '', NULL, '驳回审核状态');
INSERT INTO `sys_dict_data` VALUES (117, 3, '审核通过', '3', 'sys_user_audit_status', NULL, 'primary', 'N', '0', 'admin', '2023-09-14 14:46:31', '', NULL, '审核通过状态');
INSERT INTO `sys_dict_data` VALUES (118, 0, '取消', '0', 'repair_status', NULL, 'warning', 'N', '0', 'admin', '2023-09-17 15:07:48', '', NULL, '取消状态');
INSERT INTO `sys_dict_data` VALUES (119, 1, '维修中', '1', 'repair_status', NULL, 'success', 'N', '0', 'admin', '2023-09-17 15:08:02', '', NULL, '维修中状态');
INSERT INTO `sys_dict_data` VALUES (120, 2, '完成', '2', 'repair_status', NULL, 'primary', 'N', '0', 'admin', '2023-09-17 15:08:15', '', NULL, '完成状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '车辆状态', 'sys_car_status', '0', 'admin', '2023-09-11 21:39:23', 'admin', '2023-09-12 12:00:32', '车辆状态列表');
INSERT INTO `sys_dict_type` VALUES (101, '订单状态', 'sys_order_status', '0', 'admin', '2023-09-12 12:00:23', '', NULL, '订单状态列表');
INSERT INTO `sys_dict_type` VALUES (102, '订单支付状态', 'sys_order_pay_status', '0', 'admin', '2023-09-12 13:09:17', 'admin', '2023-09-12 13:09:31', '订单支付状态列表');
INSERT INTO `sys_dict_type` VALUES (103, '用户身份审核状态', 'sys_user_audit_status', '0', 'admin', '2023-09-14 14:40:13', '', NULL, '用户身份审核状态列表');
INSERT INTO `sys_dict_type` VALUES (104, '维修状态', 'repair_status', '0', 'admin', '2023-09-17 15:07:27', '', NULL, '维修状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-09-11 11:57:45', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 276 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-11 11:58:59');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-11 13:06:09');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-11 13:32:54');
INSERT INTO `sys_logininfor` VALUES (103, 'nanshan', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-11 13:32:59');
INSERT INTO `sys_logininfor` VALUES (104, 'nanshan', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-11 13:33:07');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-11 13:33:27');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-11 13:36:48');
INSERT INTO `sys_logininfor` VALUES (107, 'system', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-11 13:36:55');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-09-11 19:26:18');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-11 19:26:18');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-11 19:26:23');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-11 20:05:36');
INSERT INTO `sys_logininfor` VALUES (112, 'system', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-11 20:06:20');
INSERT INTO `sys_logininfor` VALUES (113, 'system', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-11 20:06:30');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-11 20:06:36');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-11 20:06:55');
INSERT INTO `sys_logininfor` VALUES (116, 'system', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-11 20:07:01');
INSERT INTO `sys_logininfor` VALUES (117, 'system', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-11 20:18:09');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-11 20:19:39');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-11 21:23:05');
INSERT INTO `sys_logininfor` VALUES (120, 'system', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-11 21:23:13');
INSERT INTO `sys_logininfor` VALUES (121, 'system', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-11 21:33:56');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-11 21:33:58');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-11 21:36:03');
INSERT INTO `sys_logininfor` VALUES (124, 'nanshan', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-11 21:36:10');
INSERT INTO `sys_logininfor` VALUES (125, 'nanshan', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-11 21:36:50');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-11 21:36:53');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 11:04:36');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 13:06:35');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-12 14:16:39');
INSERT INTO `sys_logininfor` VALUES (130, 'futian', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 14:16:47');
INSERT INTO `sys_logininfor` VALUES (131, 'futian', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-12 14:16:54');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 14:16:56');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-12 14:17:20');
INSERT INTO `sys_logininfor` VALUES (134, 'nanshan', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 14:17:26');
INSERT INTO `sys_logininfor` VALUES (135, 'nanshan', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-12 14:27:53');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 14:27:55');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 14:58:44');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-12 14:59:17');
INSERT INTO `sys_logininfor` VALUES (139, 'nanshan', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 14:59:23');
INSERT INTO `sys_logininfor` VALUES (140, 'nanshan', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-12 15:01:32');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 15:01:34');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-12 15:03:37');
INSERT INTO `sys_logininfor` VALUES (143, 'nanshan', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 15:03:43');
INSERT INTO `sys_logininfor` VALUES (144, 'nanshan', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-12 15:03:57');
INSERT INTO `sys_logininfor` VALUES (145, 'futian', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 15:04:04');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 16:25:43');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-12 16:26:41');
INSERT INTO `sys_logininfor` VALUES (148, 'futian', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 16:26:48');
INSERT INTO `sys_logininfor` VALUES (149, 'futian', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-12 16:27:23');
INSERT INTO `sys_logininfor` VALUES (150, 'nanshan', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 16:27:29');
INSERT INTO `sys_logininfor` VALUES (151, 'nanshan', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-12 16:27:39');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 16:27:41');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-12 16:29:35');
INSERT INTO `sys_logininfor` VALUES (154, 'nanshan', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 16:29:40');
INSERT INTO `sys_logininfor` VALUES (155, 'nanshan', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-12 16:34:19');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 16:34:21');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-12 16:35:22');
INSERT INTO `sys_logininfor` VALUES (158, 'nanshan', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 16:35:28');
INSERT INTO `sys_logininfor` VALUES (159, 'nanshan', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-12 16:35:35');
INSERT INTO `sys_logininfor` VALUES (160, 'system', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 16:35:42');
INSERT INTO `sys_logininfor` VALUES (161, 'system', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-12 16:35:48');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 16:35:49');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-12 16:36:22');
INSERT INTO `sys_logininfor` VALUES (164, 'system', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 16:36:29');
INSERT INTO `sys_logininfor` VALUES (165, 'system', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-12 16:36:50');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 16:36:53');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-09-13 15:19:24');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-13 15:19:24');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-13 15:19:27');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-13 15:19:34');
INSERT INTO `sys_logininfor` VALUES (171, 'system', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-13 15:19:41');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-14 10:01:26');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-14 11:01:52');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-14 13:26:33');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-14 13:43:43');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-14 13:43:54');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-09-14 13:43:54');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-14 13:43:57');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-14 13:44:19');
INSERT INTO `sys_logininfor` VALUES (180, 'nanshan', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-14 13:44:25');
INSERT INTO `sys_logininfor` VALUES (181, 'nanshan', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-14 13:44:40');
INSERT INTO `sys_logininfor` VALUES (182, 'futian', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-14 13:44:51');
INSERT INTO `sys_logininfor` VALUES (183, 'futian', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-14 13:44:58');
INSERT INTO `sys_logininfor` VALUES (184, 'system', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-14 13:45:04');
INSERT INTO `sys_logininfor` VALUES (185, 'system', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-14 13:45:13');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-14 13:45:19');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-14 14:39:37');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-09-14 14:39:37');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-14 14:39:39');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-15 08:52:38');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-09-15 19:38:36');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-15 19:38:36');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-09-15 19:38:38');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-15 19:38:38');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-15 19:38:46');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-17 15:00:33');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-17 18:58:44');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-17 19:44:36');
INSERT INTO `sys_logininfor` VALUES (199, 'futian', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-17 19:44:42');
INSERT INTO `sys_logininfor` VALUES (200, 'futian', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-17 19:44:47');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-17 19:44:52');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-17 19:45:08');
INSERT INTO `sys_logininfor` VALUES (203, 'futian', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-17 19:45:16');
INSERT INTO `sys_logininfor` VALUES (204, 'futian', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-17 19:45:23');
INSERT INTO `sys_logininfor` VALUES (205, 'nanshan', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-17 19:45:29');
INSERT INTO `sys_logininfor` VALUES (206, 'nanshan', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-17 19:49:34');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-17 19:49:40');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-09-19 20:01:43');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-19 20:01:43');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-19 20:02:24');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-24 19:20:38');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-09-24 19:20:38');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-24 19:21:47');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-09-24 19:21:47');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 19:21:50');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-24 19:23:26');
INSERT INTO `sys_logininfor` VALUES (217, 'system', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-09-24 19:23:31');
INSERT INTO `sys_logininfor` VALUES (218, 'system', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-24 19:23:31');
INSERT INTO `sys_logininfor` VALUES (219, 'system', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 19:23:32');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-26 14:01:54');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-09-30 11:10:19');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-30 11:10:19');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-30 11:10:22');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-12 08:52:52');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-10-12 10:15:32');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-10-12 10:15:32');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-12 10:15:35');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 19:16:57');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-10-22 18:39:40');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-10-22 18:39:40');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-10-22 18:39:42');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-10-22 18:39:42');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-22 18:39:43');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-03 10:10:32');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-01-03 10:10:32');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-03 10:10:37');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-04 08:49:43');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-04 09:31:34');
INSERT INTO `sys_logininfor` VALUES (239, 'customer', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-04 11:00:53');
INSERT INTO `sys_logininfor` VALUES (240, 'customer', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-01-04 11:01:41');
INSERT INTO `sys_logininfor` VALUES (241, 'customer', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2024-01-04 11:01:46');
INSERT INTO `sys_logininfor` VALUES (242, 'customer', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-04 11:01:46');
INSERT INTO `sys_logininfor` VALUES (243, 'customer', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-01-04 11:02:15');
INSERT INTO `sys_logininfor` VALUES (244, 'customer', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-04 11:02:39');
INSERT INTO `sys_logininfor` VALUES (245, 'customer', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-04 11:05:17');
INSERT INTO `sys_logininfor` VALUES (246, 'customer', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-04 11:05:59');
INSERT INTO `sys_logininfor` VALUES (247, 'customer', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-04 11:07:22');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-05 11:03:10');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-05 15:42:19');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-05 16:12:48');
INSERT INTO `sys_logininfor` VALUES (251, 'nanshan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-05 16:12:57');
INSERT INTO `sys_logininfor` VALUES (252, 'nanshan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-05 16:14:52');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-01-05 16:14:57');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-05 16:14:57');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-05 16:15:02');
INSERT INTO `sys_logininfor` VALUES (256, 'customer', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-05 16:20:47');
INSERT INTO `sys_logininfor` VALUES (257, 'customer', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-05 20:46:20');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-05 21:04:10');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-05 21:39:06');
INSERT INTO `sys_logininfor` VALUES (260, 'customer', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-08 11:42:43');
INSERT INTO `sys_logininfor` VALUES (261, 'customer', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-08 14:05:28');
INSERT INTO `sys_logininfor` VALUES (262, 'customer', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-08 15:20:09');
INSERT INTO `sys_logininfor` VALUES (263, 'customer', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-08 15:26:44');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-08 16:24:54');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-01-08 16:24:54');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-08 16:24:57');
INSERT INTO `sys_logininfor` VALUES (267, 'customer', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-08 17:24:46');
INSERT INTO `sys_logininfor` VALUES (268, NULL, '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '* 必须填写', '2024-01-09 09:21:33');
INSERT INTO `sys_logininfor` VALUES (269, NULL, '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '* 必须填写', '2024-01-09 09:21:39');
INSERT INTO `sys_logininfor` VALUES (270, NULL, '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '* 必须填写', '2024-01-09 09:22:22');
INSERT INTO `sys_logininfor` VALUES (271, NULL, '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '* 必须填写', '2024-01-09 09:22:34');
INSERT INTO `sys_logininfor` VALUES (272, 'customer', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-09 09:23:40');
INSERT INTO `sys_logininfor` VALUES (273, 'test', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-09 11:08:55');
INSERT INTO `sys_logininfor` VALUES (274, 'customer', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-09 13:24:30');
INSERT INTO `sys_logininfor` VALUES (275, 'customer', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-09 13:26:10');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2050 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-09-11 11:57:45', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-09-11 11:57:45', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-09-11 11:57:45', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 2000, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-09-11 11:57:45', 'admin', '2023-09-11 21:15:39', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-09-11 11:57:45', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-09-11 11:57:45', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '门店管理', 2000, 1, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-09-11 11:57:45', 'admin', '2023-09-14 15:16:37', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-09-11 11:57:45', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-09-11 11:57:45', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-09-11 11:57:45', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-09-11 11:57:45', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-09-11 11:57:45', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-09-11 11:57:45', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-09-11 11:57:45', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-09-11 11:57:45', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-09-11 11:57:45', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-09-11 11:57:45', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-09-11 11:57:45', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-09-11 11:57:45', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-09-11 11:57:45', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-09-11 11:57:45', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-09-11 11:57:45', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-09-11 11:57:45', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '基础资料', 0, 0, 'basedata', NULL, NULL, 1, 0, 'M', '0', '0', '', 'documentation', 'admin', '2023-09-11 19:45:36', 'admin', '2023-09-11 21:14:55', '');
INSERT INTO `sys_menu` VALUES (2007, '品牌信息', 2000, 1, 'brand', 'system/brand/index', NULL, 1, 0, 'C', '0', '0', 'system:brand:list', 'star', 'admin', '2023-09-11 19:55:44', 'admin', '2023-09-11 21:08:42', '品牌信息菜单');
INSERT INTO `sys_menu` VALUES (2008, '品牌信息查询', 2007, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:brand:query', '#', 'admin', '2023-09-11 19:55:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '品牌信息新增', 2007, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:brand:add', '#', 'admin', '2023-09-11 19:55:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '品牌信息修改', 2007, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:brand:edit', '#', 'admin', '2023-09-11 19:55:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '品牌信息删除', 2007, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:brand:remove', '#', 'admin', '2023-09-11 19:55:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '品牌信息导出', 2007, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:brand:export', '#', 'admin', '2023-09-11 19:55:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '车型信息', 2000, 1, 'carType', 'system/carType/index', NULL, 1, 0, 'C', '0', '0', 'system:carType:list', 'list', 'admin', '2023-09-11 20:56:31', 'admin', '2023-09-11 21:09:20', '车型信息菜单');
INSERT INTO `sys_menu` VALUES (2014, '车型信息查询', 2013, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:carType:query', '#', 'admin', '2023-09-11 20:56:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '车型信息新增', 2013, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:carType:add', '#', 'admin', '2023-09-11 20:56:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '车型信息修改', 2013, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:carType:edit', '#', 'admin', '2023-09-11 20:56:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '车型信息删除', 2013, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:carType:remove', '#', 'admin', '2023-09-11 20:56:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '车型信息导出', 2013, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:carType:export', '#', 'admin', '2023-09-11 20:56:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '租车信息管理', 0, 0, 'rentalManager', NULL, NULL, 1, 0, 'M', '0', '0', '', 'shopping', 'admin', '2023-09-11 21:14:27', 'admin', '2023-09-11 21:14:49', '');
INSERT INTO `sys_menu` VALUES (2020, '活动信息', 2000, 1, 'activity', 'system/activity/index', NULL, 1, 0, 'C', '0', '0', 'system:activity:list', 'star', 'admin', '2023-09-11 21:52:09', 'admin', '2023-09-11 21:59:21', '活动信息菜单');
INSERT INTO `sys_menu` VALUES (2021, '活动信息查询', 2020, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:activity:query', '#', 'admin', '2023-09-11 21:52:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '活动信息新增', 2020, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:activity:add', '#', 'admin', '2023-09-11 21:52:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '活动信息修改', 2020, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:activity:edit', '#', 'admin', '2023-09-11 21:52:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '活动信息删除', 2020, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:activity:remove', '#', 'admin', '2023-09-11 21:52:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '活动信息导出', 2020, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:activity:export', '#', 'admin', '2023-09-11 21:52:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '车辆信息', 2019, 1, 'carInfo', 'system/carInfo/index', NULL, 1, 0, 'C', '0', '0', 'system:carInfo:list', 'star', 'admin', '2023-09-11 22:24:23', 'admin', '2023-09-12 16:41:30', '车辆信息菜单');
INSERT INTO `sys_menu` VALUES (2027, '车辆信息查询', 2026, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:carInfo:query', '#', 'admin', '2023-09-11 22:24:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '车辆信息新增', 2026, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:carInfo:add', '#', 'admin', '2023-09-11 22:24:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '车辆信息修改', 2026, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:carInfo:edit', '#', 'admin', '2023-09-11 22:24:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '车辆信息删除', 2026, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:carInfo:remove', '#', 'admin', '2023-09-11 22:24:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '车辆信息导出', 2026, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:carInfo:export', '#', 'admin', '2023-09-11 22:24:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '订单信息', 2019, 1, 'order', 'system/order/index', NULL, 1, 0, 'C', '0', '0', 'system:order:list', 'money', 'admin', '2023-09-12 16:46:21', 'admin', '2023-09-12 16:48:01', '订单信息菜单');
INSERT INTO `sys_menu` VALUES (2033, '订单信息查询', 2032, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:query', '#', 'admin', '2023-09-12 16:46:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '订单信息新增', 2032, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:add', '#', 'admin', '2023-09-12 16:46:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '订单信息修改', 2032, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:edit', '#', 'admin', '2023-09-12 16:46:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '订单信息删除', 2032, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:remove', '#', 'admin', '2023-09-12 16:46:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '订单信息导出', 2032, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:export', '#', 'admin', '2023-09-12 16:46:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '用户认证审核', 2000, 1, 'audit', 'system/audit/index', NULL, 1, 0, 'C', '0', '0', 'system:audit:list', 'documentation', 'admin', '2023-09-14 14:59:27', 'admin', '2023-09-14 15:16:20', '用户认证审核菜单');
INSERT INTO `sys_menu` VALUES (2039, '用户认证审核查询', 2038, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:audit:query', '#', 'admin', '2023-09-14 14:59:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '用户认证审核新增', 2038, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:audit:add', '#', 'admin', '2023-09-14 14:59:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '用户认证审核修改', 2038, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:audit:edit', '#', 'admin', '2023-09-14 14:59:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '用户认证审核删除', 2038, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:audit:remove', '#', 'admin', '2023-09-14 14:59:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '用户认证审核导出', 2038, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:audit:export', '#', 'admin', '2023-09-14 14:59:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '维修信息', 2000, 1, 'repair', 'system/repair/index', NULL, 1, 0, 'C', '0', '0', 'system:repair:list', 'row', 'admin', '2023-09-17 18:59:58', 'admin', '2023-09-17 19:05:49', '维修信息菜单');
INSERT INTO `sys_menu` VALUES (2045, '维修信息查询', 2044, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repair:query', '#', 'admin', '2023-09-17 18:59:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '维修信息新增', 2044, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repair:add', '#', 'admin', '2023-09-17 18:59:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '维修信息修改', 2044, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repair:edit', '#', 'admin', '2023-09-17 18:59:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '维修信息删除', 2044, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repair:remove', '#', 'admin', '2023-09-17 18:59:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '维修信息导出', 2044, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repair:export', '#', 'admin', '2023-09-17 18:59:58', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-09-11 11:57:45', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-09-11 11:57:45', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 390 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-09-11 13:18:58', 23);
INSERT INTO `sys_oper_log` VALUES (101, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 11:57:45\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"门店管理员\",\"roleId\":2,\"roleKey\":\"store\",\"roleName\":\"门店管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:20:14', 96);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:20:20', 76);
INSERT INTO `sys_oper_log` VALUES (103, '部门管理', 2, 'com.ruoyi.project.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"驰行租车\",\"email\":\"gallop@qq.com\",\"leader\":\"驰行老板\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:21:05', 14);
INSERT INTO `sys_oper_log` VALUES (104, '部门管理', 3, 'com.ruoyi.project.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/101', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2023-09-11 13:21:11', 2);
INSERT INTO `sys_oper_log` VALUES (105, '部门管理', 3, 'com.ruoyi.project.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:21:15', 14);
INSERT INTO `sys_oper_log` VALUES (106, '部门管理', 3, 'com.ruoyi.project.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/106', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:21:17', 17);
INSERT INTO `sys_oper_log` VALUES (107, '部门管理', 3, 'com.ruoyi.project.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-09-11 13:21:19', 8);
INSERT INTO `sys_oper_log` VALUES (108, '部门管理', 3, 'com.ruoyi.project.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-09-11 13:21:21', 6);
INSERT INTO `sys_oper_log` VALUES (109, '部门管理', 3, 'com.ruoyi.project.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-09-11 13:21:26', 20);
INSERT INTO `sys_oper_log` VALUES (110, '部门管理', 3, 'com.ruoyi.project.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:21:28', 10);
INSERT INTO `sys_oper_log` VALUES (111, '部门管理', 3, 'com.ruoyi.project.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-09-11 13:21:30', 6);
INSERT INTO `sys_oper_log` VALUES (112, '角色管理', 1, 'com.ruoyi.project.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114],\"params\":{},\"remark\":\"系统管理员\",\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"系统管理员\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:23:21', 35);
INSERT INTO `sys_oper_log` VALUES (113, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 11:57:45\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"门店管理员\",\"roleId\":2,\"roleKey\":\"store\",\"roleName\":\"门店管理员\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:23:30', 20);
INSERT INTO `sys_oper_log` VALUES (114, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 13:23:21\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114],\"params\":{},\"remark\":\"系统管理员\",\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"系统管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:23:35', 40);
INSERT INTO `sys_oper_log` VALUES (115, '部门管理', 3, 'com.ruoyi.project.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2023-09-11 13:23:47', 3);
INSERT INTO `sys_oper_log` VALUES (116, '部门管理', 3, 'com.ruoyi.project.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/109', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:23:51', 7);
INSERT INTO `sys_oper_log` VALUES (117, '部门管理', 3, 'com.ruoyi.project.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/108', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:23:52', 8);
INSERT INTO `sys_oper_log` VALUES (118, '部门管理', 3, 'com.ruoyi.project.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:23:55', 8);
INSERT INTO `sys_oper_log` VALUES (119, '用户管理', 3, 'com.ruoyi.project.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:25:01', 13);
INSERT INTO `sys_oper_log` VALUES (120, '部门管理', 3, 'com.ruoyi.project.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/101', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2023-09-11 13:25:10', 3);
INSERT INTO `sys_oper_log` VALUES (121, '部门管理', 3, 'com.ruoyi.project.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:25:12', 11);
INSERT INTO `sys_oper_log` VALUES (122, '部门管理', 3, 'com.ruoyi.project.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:25:13', 13);
INSERT INTO `sys_oper_log` VALUES (123, '部门管理', 3, 'com.ruoyi.project.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/101', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:25:15', 9);
INSERT INTO `sys_oper_log` VALUES (124, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"深圳总店\",\"orderNum\":0,\"params\":{},\"parentId\":100,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:25:54', 11);
INSERT INTO `sys_oper_log` VALUES (125, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,200\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"南山区门店\",\"email\":\"nanshan@gallop.com\",\"leader\":\"南山区门店店主\",\"orderNum\":0,\"params\":{},\"parentId\":200,\"phone\":\"15888888888\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:26:33', 9);
INSERT INTO `sys_oper_log` VALUES (126, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 11:57:45\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"门店管理员\",\"roleId\":2,\"roleKey\":\"store\",\"roleName\":\"门店管理员\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:27:00', 8);
INSERT INTO `sys_oper_log` VALUES (127, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptId\":201,\"email\":\"nanshan@gallop.com\",\"nickName\":\"南山区店主\",\"params\":{},\"phonenumber\":\"15888888888\",\"postIds\":[],\"remark\":\"南山区店主\",\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userName\":\"nanshan\"}', '{\"msg\":\"新增用户\'nanshan\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2023-09-11 13:28:01', 5);
INSERT INTO `sys_oper_log` VALUES (128, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":201,\"email\":\"nanshan@gallop.com\",\"nickName\":\"南山区店主\",\"params\":{},\"phonenumber\":\"15788888888\",\"postIds\":[],\"remark\":\"南山区店主\",\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"nanshan\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:28:10', 80);
INSERT INTO `sys_oper_log` VALUES (129, '岗位管理', 3, 'com.ruoyi.project.system.controller.SysPostController.remove()', 'DELETE', 1, 'admin', NULL, '/system/post/1,2,3,4', '127.0.0.1', '内网IP', '{}', NULL, 1, '董事长已分配,不能删除', '2023-09-11 13:28:42', 11);
INSERT INTO `sys_oper_log` VALUES (130, '岗位管理', 3, 'com.ruoyi.project.system.controller.SysPostController.remove()', 'DELETE', 1, 'admin', NULL, '/system/post/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:29:41', 12);
INSERT INTO `sys_oper_log` VALUES (131, '岗位管理', 3, 'com.ruoyi.project.system.controller.SysPostController.remove()', 'DELETE', 1, 'admin', NULL, '/system/post/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:29:44', 13);
INSERT INTO `sys_oper_log` VALUES (132, '岗位管理', 3, 'com.ruoyi.project.system.controller.SysPostController.remove()', 'DELETE', 1, 'admin', NULL, '/system/post/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:29:46', 7);
INSERT INTO `sys_oper_log` VALUES (133, '岗位管理', 1, 'com.ruoyi.project.system.controller.SysPostController.add()', 'POST', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"cto\",\"postId\":5,\"postName\":\"系统管理员\",\"postSort\":1,\"remark\":\"系统管理员\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:30:27', 66);
INSERT INTO `sys_oper_log` VALUES (134, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 13:23:21\",\"dataScope\":\"3\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"系统管理员\",\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"系统管理员\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:30:59', 9);
INSERT INTO `sys_oper_log` VALUES (135, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 13:23:21\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"系统管理员\",\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"系统管理员\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:31:05', 9);
INSERT INTO `sys_oper_log` VALUES (136, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 11:57:45\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"门店管理员\",\"roleId\":2,\"roleKey\":\"store\",\"roleName\":\"门店管理员\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:31:15', 9);
INSERT INTO `sys_oper_log` VALUES (137, '岗位管理', 1, 'com.ruoyi.project.system.controller.SysPostController.add()', 'POST', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"store-boss\",\"postId\":6,\"postName\":\"门店店长\",\"postSort\":3,\"remark\":\"门店店长\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:32:01', 9);
INSERT INTO `sys_oper_log` VALUES (138, '岗位管理', 2, 'com.ruoyi.project.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-09-11 13:30:27\",\"flag\":false,\"params\":{},\"postCode\":\"cto\",\"postId\":5,\"postName\":\"系统管理员\",\"postSort\":2,\"remark\":\"系统管理员\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:32:05', 8);
INSERT INTO `sys_oper_log` VALUES (139, '用户管理', 2, 'com.ruoyi.project.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 13:28:10\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,200\",\"children\":[],\"deptId\":201,\"deptName\":\"南山区门店\",\"leader\":\"南山区门店店主\",\"orderNum\":0,\"params\":{},\"parentId\":200,\"status\":\"0\"},\"deptId\":201,\"email\":\"nanshan@gallop.com\",\"loginIp\":\"\",\"nickName\":\"南山区店主\",\"params\":{},\"phonenumber\":\"15788888888\",\"postIds\":[6],\"remark\":\"南山区店主\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"store\",\"roleName\":\"门店管理员\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"nanshan\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:32:19', 24);
INSERT INTO `sys_oper_log` VALUES (140, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 11:57:45\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"门店管理员\",\"roleId\":2,\"roleKey\":\"store\",\"roleName\":\"门店管理员\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:32:38', 9);
INSERT INTO `sys_oper_log` VALUES (141, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 13:23:21\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,109,1046,1047,1048],\"params\":{},\"remark\":\"系统管理员\",\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"系统管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:35:49', 13);
INSERT INTO `sys_oper_log` VALUES (142, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 13:23:21\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"系统管理员\",\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"系统管理员\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:35:59', 7);
INSERT INTO `sys_oper_log` VALUES (143, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 13:23:21\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,109,1046,1047,1048],\"params\":{},\"remark\":\"系统管理员\",\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"系统管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:36:02', 13);
INSERT INTO `sys_oper_log` VALUES (144, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"system@gallop.com\",\"nickName\":\"系统管理员\",\"params\":{},\"phonenumber\":\"16677778888\",\"postIds\":[5],\"remark\":\"系统管理员\",\"roleIds\":[100],\"sex\":\"2\",\"status\":\"0\",\"userId\":101,\"userName\":\"system\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 13:36:43', 93);
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"brand_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 19:42:15', 82);
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"基础资料\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"basedata\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 19:45:36', 16);
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"info\",\"className\":\"BrandInfo\",\"columns\":[{\"capJavaField\":\"BrandId\",\"columnComment\":\"品牌唯一id\",\"columnId\":1,\"columnName\":\"brand_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 19:42:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"brandId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BrandName\",\"columnComment\":\"品牌名称\",\"columnId\":2,\"columnName\":\"brand_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 19:42:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"brandName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BrandDes\",\"columnComment\":\"品牌简介\",\"columnId\":3,\"columnName\":\"brand_des\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 19:42:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"brandDes\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"品牌状态（0正常 1停用）\",\"columnId\":4,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 19:42:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"status\",\"javaType\":\"String\",\"li', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 19:45:46', 48);
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"info\",\"className\":\"BrandInfo\",\"columns\":[{\"capJavaField\":\"BrandId\",\"columnComment\":\"品牌唯一id\",\"columnId\":1,\"columnName\":\"brand_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 19:42:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"brandId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-09-11 19:45:46\",\"usableColumn\":false},{\"capJavaField\":\"BrandName\",\"columnComment\":\"品牌名称\",\"columnId\":2,\"columnName\":\"brand_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 19:42:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"brandName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-09-11 19:45:46\",\"usableColumn\":false},{\"capJavaField\":\"BrandDes\",\"columnComment\":\"品牌简介\",\"columnId\":3,\"columnName\":\"brand_des\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 19:42:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"brandDes\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-09-11 19:45:46\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"品牌状态（0正常 1停用）\",\"columnId\":4,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 19:42:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncreme', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 19:45:52', 22);
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"brand_info\"}', NULL, 0, NULL, '2023-09-11 19:46:26', 71);
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/brand/index\",\"createTime\":\"2023-09-11 19:46:54\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"品牌信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"brand\",\"perms\":\"system:brand:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 19:49:35', 49);
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-09-11 19:46:54\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"品牌信息查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"system:brand:query\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 19:50:55', 11);
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-09-11 19:46:54\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"品牌信息新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"system:brand:add\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 19:51:00', 13);
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-09-11 19:46:54\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"品牌信息修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"system:brand:edit\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 19:51:03', 13);
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-09-11 19:46:54\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"品牌信息删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"system:brand:remove\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 19:51:06', 10);
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-09-11 19:46:54\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"品牌信息导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"system:brand:export\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 19:51:09', 11);
INSERT INTO `sys_oper_log` VALUES (156, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2001', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2023-09-11 19:52:53', 5);
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2006', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 19:52:57', 15);
INSERT INTO `sys_oper_log` VALUES (158, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2005', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 19:52:58', 12);
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2004', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 19:53:00', 11);
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2003', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 19:53:02', 12);
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2002', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 19:53:03', 15);
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2001', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 19:53:05', 13);
INSERT INTO `sys_oper_log` VALUES (163, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"brand\",\"className\":\"BrandInfo\",\"columns\":[{\"capJavaField\":\"BrandId\",\"columnComment\":\"品牌编号\",\"columnId\":1,\"columnName\":\"brand_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 19:42:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"brandId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-09-11 19:45:52\",\"usableColumn\":false},{\"capJavaField\":\"BrandName\",\"columnComment\":\"品牌名称\",\"columnId\":2,\"columnName\":\"brand_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 19:42:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"brandName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-09-11 19:45:52\",\"usableColumn\":false},{\"capJavaField\":\"BrandDes\",\"columnComment\":\"品牌简介\",\"columnId\":3,\"columnName\":\"brand_des\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 19:42:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"brandDes\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-09-11 19:45:52\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"品牌状态（0正常 1停用）\",\"columnId\":4,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 19:42:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncremen', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 19:55:24', 79);
INSERT INTO `sys_oper_log` VALUES (164, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"brand_info\"}', NULL, 0, NULL, '2023-09-11 19:55:26', 155);
INSERT INTO `sys_oper_log` VALUES (165, '品牌信息', 5, 'com.ruoyi.project.system.controller.BrandInfoController.export()', 'POST', 1, 'admin', NULL, '/system/brand/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-09-11 19:56:38', 711);
INSERT INTO `sys_oper_log` VALUES (166, '品牌信息', 5, 'com.ruoyi.project.system.controller.BrandInfoController.export()', 'POST', 1, 'admin', NULL, '/system/brand/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-09-11 19:59:03', 51);
INSERT INTO `sys_oper_log` VALUES (167, '品牌信息', 5, 'com.ruoyi.project.system.controller.BrandInfoController.export()', 'POST', 1, 'admin', NULL, '/system/brand/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-09-11 20:04:47', 586);
INSERT INTO `sys_oper_log` VALUES (168, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":true,\"createTime\":\"2023-09-11 11:57:45\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2000,2007,2008,2009,2010,2011,2012,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"超级管理员\",\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}', NULL, 1, '不允许操作超级管理员角色', '2023-09-11 20:05:28', 2);
INSERT INTO `sys_oper_log` VALUES (169, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 13:23:21\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,2000,2007,2008,2009,2010,2011,2012,109,1046,1047,1048],\"params\":{},\"remark\":\"系统管理员\",\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"系统管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 20:06:52', 31);
INSERT INTO `sys_oper_log` VALUES (170, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"brand_info\"}', NULL, 0, NULL, '2023-09-11 20:20:09', 155);
INSERT INTO `sys_oper_log` VALUES (171, '品牌信息', 1, 'com.ruoyi.project.system.controller.BrandInfoController.add()', 'POST', 1, 'admin', NULL, '/system/brand', '127.0.0.1', '内网IP', '{\"brandDes\":\"奔驰汽车品牌\",\"brandId\":1,\"brandName\":\"奔驰\",\"createTime\":\"2023-09-11 20:23:53\",\"params\":{},\"remark\":\"奔驰汽车品牌\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 20:23:53', 12);
INSERT INTO `sys_oper_log` VALUES (172, '品牌信息', 2, 'com.ruoyi.project.system.controller.BrandInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/brand', '127.0.0.1', '内网IP', '{\"brandDes\":\"奔驰汽车品牌\",\"brandId\":1,\"brandName\":\"奔驰\",\"createBy\":\"\",\"createTime\":\"2023-09-11 20:23:53\",\"params\":{},\"remark\":\"奔驰汽车品牌\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-09-11 20:34:25\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 20:34:25', 6);
INSERT INTO `sys_oper_log` VALUES (173, '用户管理', 2, 'com.ruoyi.project.system.controller.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 20:45:28', 5);
INSERT INTO `sys_oper_log` VALUES (174, '用户管理', 2, 'com.ruoyi.project.system.controller.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 20:45:41', 4);
INSERT INTO `sys_oper_log` VALUES (175, '用户管理', 2, 'com.ruoyi.project.system.controller.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 20:48:25', 27469);
INSERT INTO `sys_oper_log` VALUES (176, '品牌信息', 2, 'com.ruoyi.project.system.controller.BrandInfoController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/brand/changeStatus', '127.0.0.1', '内网IP', '{\"brandId\":1,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 20:50:02', 23);
INSERT INTO `sys_oper_log` VALUES (177, '品牌信息', 2, 'com.ruoyi.project.system.controller.BrandInfoController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/brand/changeStatus', '127.0.0.1', '内网IP', '{\"brandId\":1,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 20:50:05', 5);
INSERT INTO `sys_oper_log` VALUES (178, '品牌信息', 1, 'com.ruoyi.project.system.controller.BrandInfoController.add()', 'POST', 1, 'admin', NULL, '/system/brand', '127.0.0.1', '内网IP', '{\"brandDes\":\"宝马汽车品牌\",\"brandId\":2,\"brandName\":\"宝马\",\"createTime\":\"2023-09-11 20:50:22\",\"params\":{},\"remark\":\"宝马汽车品牌\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 20:50:22', 14);
INSERT INTO `sys_oper_log` VALUES (179, '品牌信息', 1, 'com.ruoyi.project.system.controller.BrandInfoController.add()', 'POST', 1, 'admin', NULL, '/system/brand', '127.0.0.1', '内网IP', '{\"brandDes\":\"大众汽车品牌\",\"brandId\":3,\"brandName\":\"大众\",\"createTime\":\"2023-09-11 20:50:30\",\"params\":{},\"remark\":\"大众汽车品牌\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 20:50:30', 6);
INSERT INTO `sys_oper_log` VALUES (180, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"car_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 20:51:05', 46);
INSERT INTO `sys_oper_log` VALUES (181, '代码生成', 3, 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 20:51:23', 17);
INSERT INTO `sys_oper_log` VALUES (182, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"car_type\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 20:55:00', 41);
INSERT INTO `sys_oper_log` VALUES (183, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"carType\",\"className\":\"CarTypeInfo\",\"columns\":[{\"capJavaField\":\"CarTypeId\",\"columnComment\":\"车型编号\",\"columnId\":12,\"columnName\":\"car_type_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 20:54:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"carTypeId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CarTypeName\",\"columnComment\":\"车型名称\",\"columnId\":13,\"columnName\":\"car_type_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 20:54:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"carTypeName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"车型状态（0正常 1停用）\",\"columnId\":14,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 20:54:59\",\"dictType\":\"sys_normal_disable\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"status\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":15,\"columnName\":\"create_by\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 20:54:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"javaField\":\"createBy\",\"javaTyp', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 20:56:04', 40);
INSERT INTO `sys_oper_log` VALUES (184, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"car_type\"}', NULL, 0, NULL, '2023-09-11 20:56:07', 288);
INSERT INTO `sys_oper_log` VALUES (185, '车型信息', 1, 'com.ruoyi.project.system.controller.CarTypeInfoController.add()', 'POST', 1, 'admin', NULL, '/system/carType', '127.0.0.1', '内网IP', '{\"carTypeName\":\"SUV\",\"createTime\":\"2023-09-11 20:58:35\",\"params\":{},\"remark\":\"SUV车型\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'car_type_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\Work\\Other\\004 4500 document + project\\RuoYi-Vue-fast\\target\\classes\\mybatis\\system\\CarTypeInfoMapper.xml]\r\n### The error may involve com.ruoyi.project.system.mapper.CarTypeInfoMapper.insertCarTypeInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into car_type          ( car_type_name,             status,                          create_time,                                       remark )           values ( ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'car_type_id\' doesn\'t have a default value\n; Field \'car_type_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'car_type_id\' doesn\'t have a default value', '2023-09-11 20:58:35', 121);
INSERT INTO `sys_oper_log` VALUES (186, '车型信息', 1, 'com.ruoyi.project.system.controller.CarTypeInfoController.add()', 'POST', 1, 'admin', NULL, '/system/carType', '127.0.0.1', '内网IP', '{\"carTypeName\":\"SUV\",\"createTime\":\"2023-09-11 20:59:13\",\"params\":{},\"remark\":\"SUV车型\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 20:59:13', 5);
INSERT INTO `sys_oper_log` VALUES (187, '车型信息', 2, 'com.ruoyi.project.system.controller.CarTypeInfoController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/carType/changeStatus', '127.0.0.1', '内网IP', '{\"carTypeId\":1,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:04:30', 13);
INSERT INTO `sys_oper_log` VALUES (188, '车型信息', 2, 'com.ruoyi.project.system.controller.CarTypeInfoController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/carType/changeStatus', '127.0.0.1', '内网IP', '{\"carTypeId\":1,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:04:32', 5);
INSERT INTO `sys_oper_log` VALUES (189, '车型信息', 1, 'com.ruoyi.project.system.controller.CarTypeInfoController.add()', 'POST', 1, 'admin', NULL, '/system/carType', '127.0.0.1', '内网IP', '{\"carTypeName\":\"轿车\",\"createTime\":\"2023-09-11 21:06:31\",\"params\":{},\"remark\":\"轿车车型\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:06:31', 19);
INSERT INTO `sys_oper_log` VALUES (190, '车型信息', 1, 'com.ruoyi.project.system.controller.CarTypeInfoController.add()', 'POST', 1, 'admin', NULL, '/system/carType', '127.0.0.1', '内网IP', '{\"carTypeName\":\"轿跑\",\"createTime\":\"2023-09-11 21:06:40\",\"params\":{},\"remark\":\"轿跑车型\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:06:40', 8);
INSERT INTO `sys_oper_log` VALUES (191, '车型信息', 1, 'com.ruoyi.project.system.controller.CarTypeInfoController.add()', 'POST', 1, 'admin', NULL, '/system/carType', '127.0.0.1', '内网IP', '{\"carTypeName\":\"超跑\",\"createTime\":\"2023-09-11 21:06:49\",\"params\":{},\"remark\":\"超跑车型\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:06:49', 6);
INSERT INTO `sys_oper_log` VALUES (192, '车型信息', 1, 'com.ruoyi.project.system.controller.CarTypeInfoController.add()', 'POST', 1, 'admin', NULL, '/system/carType', '127.0.0.1', '内网IP', '{\"carTypeName\":\"经济型\",\"createTime\":\"2023-09-11 21:07:03\",\"params\":{},\"remark\":\"经济型车型\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:07:03', 5);
INSERT INTO `sys_oper_log` VALUES (193, '车型信息', 1, 'com.ruoyi.project.system.controller.CarTypeInfoController.add()', 'POST', 1, 'admin', NULL, '/system/carType', '127.0.0.1', '内网IP', '{\"carTypeName\":\"商务型\",\"createTime\":\"2023-09-11 21:07:16\",\"params\":{},\"remark\":\"商务型车型\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:07:16', 5);
INSERT INTO `sys_oper_log` VALUES (194, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2023-09-11 11:57:45\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"门店管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:07:59', 10);
INSERT INTO `sys_oper_log` VALUES (195, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/brand/index\",\"createTime\":\"2023-09-11 19:55:44\",\"icon\":\"star\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"品牌信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"brand\",\"perms\":\"system:brand:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:08:42', 11);
INSERT INTO `sys_oper_log` VALUES (196, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/carType/index\",\"createTime\":\"2023-09-11 20:56:31\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"车型信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"carType\",\"perms\":\"system:carType:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:09:20', 5);
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"租车信息管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"rentalManager\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:14:27', 13);
INSERT INTO `sys_oper_log` VALUES (198, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-09-11 21:14:27\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"租车信息管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"rentalManager\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:14:49', 11);
INSERT INTO `sys_oper_log` VALUES (199, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-09-11 19:45:36\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"基础资料\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"basedata\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:14:55', 6);
INSERT INTO `sys_oper_log` VALUES (200, '用户管理', 2, 'com.ruoyi.project.system.controller.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:15:08', 5);
INSERT INTO `sys_oper_log` VALUES (201, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2023-09-11 11:57:45\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:15:39', 7);
INSERT INTO `sys_oper_log` VALUES (202, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 13:23:21\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"系统管理员\",\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"系统管理员\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:21:58', 18);
INSERT INTO `sys_oper_log` VALUES (203, '用户管理', 2, 'com.ruoyi.project.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 13:36:43\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"驰行租车\",\"leader\":\"驰行老板\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"system@gallop.com\",\"loginDate\":\"2023-09-11 20:07:02\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"系统管理员\",\"params\":{},\"phonenumber\":\"16677778888\",\"postIds\":[5],\"remark\":\"系统管理员\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"系统管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"system\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:22:22', 17);
INSERT INTO `sys_oper_log` VALUES (204, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 13:23:21\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2,2000,100,1000,1001,1002,1003,1004,1005,1006,2013,2014,2015,2016,2017,2018,2007,2008,2009,2010,2011,2012,103,1016,1017,1018,1019,2019,1,109,1046,1047,1048],\"params\":{},\"remark\":\"系统管理员\",\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"系统管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:23:02', 38);
INSERT INTO `sys_oper_log` VALUES (205, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 11:57:45\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,103,1016,1018,2019],\"params\":{},\"remark\":\"门店管理员\",\"roleId\":2,\"roleKey\":\"store\",\"roleName\":\"门店管理员\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:34:34', 36);
INSERT INTO `sys_oper_log` VALUES (206, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 11:57:45\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"门店管理员\",\"roleId\":2,\"roleKey\":\"store\",\"roleName\":\"门店管理员\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:34:42', 38);
INSERT INTO `sys_oper_log` VALUES (207, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,200\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"福田区门店\",\"email\":\"futian@gallop.com\",\"leader\":\"福田区门店店长\",\"orderNum\":2,\"params\":{},\"parentId\":200,\"phone\":\"13377778888\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:35:56', 13);
INSERT INTO `sys_oper_log` VALUES (208, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":202,\"email\":\"futian@gallop.com\",\"nickName\":\"福田区门店店长\",\"params\":{},\"phonenumber\":\"13377778888\",\"postIds\":[6],\"remark\":\"福田区门店店长\",\"roleIds\":[2],\"sex\":\"1\",\"status\":\"0\",\"userId\":102,\"userName\":\"futian\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:37:57', 88);
INSERT INTO `sys_oper_log` VALUES (209, '部门管理', 2, 'com.ruoyi.project.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,200\",\"children\":[],\"deptId\":202,\"deptName\":\"福田区门店\",\"email\":\"futian@gallop.com\",\"leader\":\"福田区门店店长\",\"orderNum\":1,\"params\":{},\"parentId\":200,\"parentName\":\"深圳总店\",\"phone\":\"13377778888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:38:17', 19);
INSERT INTO `sys_oper_log` VALUES (210, '字典类型', 1, 'com.ruoyi.project.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"车辆状态\",\"dictType\":\"sys_car_status\",\"params\":{},\"remark\":\"车辆状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:39:23', 13);
INSERT INTO `sys_oper_log` VALUES (211, '字典类型', 9, 'com.ruoyi.project.system.controller.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', NULL, '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:39:26', 20);
INSERT INTO `sys_oper_log` VALUES (212, '字典数据', 1, 'com.ruoyi.project.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"正常\",\"dictSort\":0,\"dictType\":\"sys_car_status\",\"dictValue\":\"0\",\"listClass\":\"primary\",\"params\":{},\"remark\":\"车辆正常启用状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:40:53', 8);
INSERT INTO `sys_oper_log` VALUES (213, '字典数据', 1, 'com.ruoyi.project.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"停用\",\"dictSort\":1,\"dictType\":\"sys_car_status\",\"dictValue\":\"1\",\"listClass\":\"danger\",\"params\":{},\"remark\":\"车辆停用状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:41:37', 15);
INSERT INTO `sys_oper_log` VALUES (214, '字典数据', 1, 'com.ruoyi.project.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"维修\",\"dictSort\":2,\"dictType\":\"sys_car_status\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"remark\":\"车辆维修状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:41:55', 8);
INSERT INTO `sys_oper_log` VALUES (215, '字典数据', 2, 'com.ruoyi.project.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-09-11 21:41:55\",\"default\":false,\"dictCode\":102,\"dictLabel\":\"维修\",\"dictSort\":2,\"dictType\":\"sys_car_status\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"remark\":\"车辆维修状态\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:42:37', 10);
INSERT INTO `sys_oper_log` VALUES (216, '字典数据', 1, 'com.ruoyi.project.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已租出\",\"dictSort\":3,\"dictType\":\"sys_car_status\",\"dictValue\":\"3\",\"listClass\":\"warning\",\"params\":{},\"remark\":\"车辆已租出状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:43:59', 10);
INSERT INTO `sys_oper_log` VALUES (217, '字典数据', 2, 'com.ruoyi.project.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-09-11 21:40:53\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"正常\",\"dictSort\":0,\"dictType\":\"sys_car_status\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"remark\":\"车辆正常启用状态（可租出）\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:44:20', 9);
INSERT INTO `sys_oper_log` VALUES (218, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"activity_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:49:02', 59);
INSERT INTO `sys_oper_log` VALUES (219, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"activity\",\"className\":\"ActivityInfo\",\"columns\":[{\"capJavaField\":\"ActivityId\",\"columnComment\":\"活动编号\",\"columnId\":20,\"columnName\":\"activity_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 21:49:02\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"activityId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ActivityTitle\",\"columnComment\":\"活动标题\",\"columnId\":21,\"columnName\":\"activity_title\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 21:49:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"activityTitle\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ActivityContent\",\"columnComment\":\"活动内容\",\"columnId\":22,\"columnName\":\"activity_content\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 21:49:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"activityContent\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ActivityCover\",\"columnComment\":\"活动封面\",\"columnId\":23,\"columnName\":\"activity_cover\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 21:49:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:50:50', 35);
INSERT INTO `sys_oper_log` VALUES (220, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"activity_info\"}', NULL, 0, NULL, '2023-09-11 21:51:38', 145);
INSERT INTO `sys_oper_log` VALUES (221, '活动信息', 1, 'com.ruoyi.project.system.controller.ActivityInfoController.add()', 'POST', 1, 'admin', NULL, '/system/activity', '127.0.0.1', '内网IP', '{\"activityContent\":\"测试活动内容\",\"activityCover\":\"/profile/upload/2023/09/11/租车_20230911215339A001.png\",\"activityId\":1,\"activityTitle\":\"测试活动\",\"createTime\":\"2023-09-11 21:53:45\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:53:45', 69);
INSERT INTO `sys_oper_log` VALUES (222, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/activity/index\",\"createTime\":\"2023-09-11 21:52:09\",\"icon\":\"star\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2020,\"menuName\":\"活动信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"activity\",\"perms\":\"system:activity:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 21:59:21', 28);
INSERT INTO `sys_oper_log` VALUES (223, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"car_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 22:16:15', 65);
INSERT INTO `sys_oper_log` VALUES (224, '代码生成', 3, 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 22:17:14', 31);
INSERT INTO `sys_oper_log` VALUES (225, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"car_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 22:17:40', 36);
INSERT INTO `sys_oper_log` VALUES (226, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"carInfo\",\"className\":\"CarInfo\",\"columns\":[{\"capJavaField\":\"CarId\",\"columnComment\":\"车辆信息编号\",\"columnId\":37,\"columnName\":\"car_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 22:17:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"carId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BrandId\",\"columnComment\":\"车辆品牌编号\",\"columnId\":38,\"columnName\":\"brand_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 22:17:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"brandId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CarTypeId\",\"columnComment\":\"车辆车型编号\",\"columnId\":39,\"columnName\":\"car_type_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 22:17:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"carTypeId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CarName\",\"columnComment\":\"车辆名称\",\"columnId\":40,\"columnName\":\"car_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 22:17:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"carName\",\"javaType', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 22:20:03', 34);
INSERT INTO `sys_oper_log` VALUES (227, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"carType\",\"className\":\"CarTypeInfo\",\"columns\":[{\"capJavaField\":\"CarTypeId\",\"columnComment\":\"车型编号\",\"columnId\":12,\"columnName\":\"car_type_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 20:54:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"carTypeId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-09-11 20:56:04\",\"usableColumn\":false},{\"capJavaField\":\"CarTypeName\",\"columnComment\":\"车型名称\",\"columnId\":13,\"columnName\":\"car_type_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 20:54:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"carTypeName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-09-11 20:56:04\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"车型状态（0正常 1停用）\",\"columnId\":14,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 20:54:59\",\"dictType\":\"sys_normal_disable\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"status\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-09-11 20:56:04\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":15,\"columnName\":\"create_by\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 20:54:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 22:20:25', 22);
INSERT INTO `sys_oper_log` VALUES (228, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"carType\",\"className\":\"CarTypeInfo\",\"columns\":[{\"capJavaField\":\"CarTypeId\",\"columnComment\":\"车型编号\",\"columnId\":12,\"columnName\":\"car_type_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 20:54:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"carTypeId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-09-11 22:20:25\",\"usableColumn\":false},{\"capJavaField\":\"CarTypeName\",\"columnComment\":\"车型名称\",\"columnId\":13,\"columnName\":\"car_type_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 20:54:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"carTypeName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-09-11 22:20:25\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"车型状态（0正常 1停用）\",\"columnId\":14,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 20:54:59\",\"dictType\":\"sys_normal_disable\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"status\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-09-11 22:20:25\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":15,\"columnName\":\"create_by\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-11 20:54:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 22:23:16', 29);
INSERT INTO `sys_oper_log` VALUES (229, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"car_info\"}', NULL, 0, NULL, '2023-09-11 22:23:25', 86);
INSERT INTO `sys_oper_log` VALUES (230, '品牌信息', 1, 'com.ruoyi.project.system.controller.BrandInfoController.add()', 'POST', 1, 'admin', NULL, '/system/brand', '127.0.0.1', '内网IP', '{\"brandDes\":\"奥迪品牌信息\",\"brandId\":4,\"brandName\":\"奥迪\",\"createTime\":\"2023-09-11 22:37:13\",\"params\":{},\"remark\":\"奥迪品牌信息\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 22:37:13', 73);
INSERT INTO `sys_oper_log` VALUES (231, '品牌信息', 1, 'com.ruoyi.project.system.controller.BrandInfoController.add()', 'POST', 1, 'admin', NULL, '/system/brand', '127.0.0.1', '内网IP', '{\"brandDes\":\"本田品牌信息\",\"brandId\":5,\"brandName\":\"本田\",\"createTime\":\"2023-09-11 22:37:29\",\"params\":{},\"remark\":\"本田品牌信息\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 22:37:29', 6);
INSERT INTO `sys_oper_log` VALUES (232, '品牌信息', 1, 'com.ruoyi.project.system.controller.BrandInfoController.add()', 'POST', 1, 'admin', NULL, '/system/brand', '127.0.0.1', '内网IP', '{\"brandDes\":\"别克品牌信息\",\"brandId\":6,\"brandName\":\"别克\",\"createTime\":\"2023-09-11 22:37:38\",\"params\":{},\"remark\":\"别克品牌信息\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 22:37:38', 6);
INSERT INTO `sys_oper_log` VALUES (233, '品牌信息', 1, 'com.ruoyi.project.system.controller.BrandInfoController.add()', 'POST', 1, 'admin', NULL, '/system/brand', '127.0.0.1', '内网IP', '{\"brandDes\":\"比亚迪品牌信息\",\"brandId\":7,\"brandName\":\"比亚迪\",\"createTime\":\"2023-09-11 22:37:47\",\"params\":{},\"remark\":\"比亚迪品牌信息\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 22:37:47', 5);
INSERT INTO `sys_oper_log` VALUES (234, '品牌信息', 1, 'com.ruoyi.project.system.controller.BrandInfoController.add()', 'POST', 1, 'admin', NULL, '/system/brand', '127.0.0.1', '内网IP', '{\"brandDes\":\"长安品牌信息\",\"brandId\":8,\"brandName\":\"长安\",\"createTime\":\"2023-09-11 22:38:09\",\"params\":{},\"remark\":\"长安品牌信息\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 22:38:09', 5);
INSERT INTO `sys_oper_log` VALUES (235, '品牌信息', 1, 'com.ruoyi.project.system.controller.BrandInfoController.add()', 'POST', 1, 'admin', NULL, '/system/brand', '127.0.0.1', '内网IP', '{\"brandDes\":\"丰田品牌信息\",\"brandId\":9,\"brandName\":\"丰田\",\"createTime\":\"2023-09-11 22:38:45\",\"params\":{},\"remark\":\"丰田品牌信息\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 22:38:45', 4);
INSERT INTO `sys_oper_log` VALUES (236, '品牌信息', 1, 'com.ruoyi.project.system.controller.BrandInfoController.add()', 'POST', 1, 'admin', NULL, '/system/brand', '127.0.0.1', '内网IP', '{\"brandDes\":\"福特品牌信息\",\"brandId\":10,\"brandName\":\"福特\",\"createTime\":\"2023-09-11 22:38:56\",\"params\":{},\"remark\":\"福特品牌信息\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 22:38:56', 5);
INSERT INTO `sys_oper_log` VALUES (237, '品牌信息', 1, 'com.ruoyi.project.system.controller.BrandInfoController.add()', 'POST', 1, 'admin', NULL, '/system/brand', '127.0.0.1', '内网IP', '{\"brandDes\":\"红旗品牌信息\",\"brandId\":11,\"brandName\":\"红旗\",\"createTime\":\"2023-09-11 22:39:23\",\"params\":{},\"remark\":\"红旗品牌信息\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-11 22:39:23', 7);
INSERT INTO `sys_oper_log` VALUES (238, '车辆信息', 1, 'com.ruoyi.project.system.controller.CarInfoController.add()', 'POST', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brandId\":10,\"carName\":\"Mustang\",\"carTypeId\":4,\"createTime\":\"2023-09-12 11:07:55\",\"params\":{},\"rent\":5200.0,\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'status,\n            \n            create_time ) \n         values ( 10,\n          \' at line 8\r\n### The error may exist in file [E:\\Work\\Other\\004 4500 document + project\\RuoYi-Vue-fast\\target\\classes\\mybatis\\system\\CarInfoMapper.xml]\r\n### The error may involve com.ruoyi.project.system.mapper.CarInfoMapper.insertCarInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into car_info          ( brand_id,             car_type_id,             car_name,                                       rent             status,                          create_time )           values ( ?,             ?,             ?,                                       ?             ?,                          ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'status,\n            \n            create_time ) \n         values ( 10,\n          \' at line 8\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'status,\n            \n            create_time ) \n         values ( 10,\n          \' at line 8', '2023-09-12 11:07:55', 44);
INSERT INTO `sys_oper_log` VALUES (239, '车辆信息', 1, 'com.ruoyi.project.system.controller.CarInfoController.add()', 'POST', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brandId\":10,\"carId\":1,\"carName\":\"Mustang\",\"carTypeId\":4,\"createTime\":\"2023-09-12 11:08:42\",\"params\":{},\"rent\":5200.0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 11:08:42', 74);
INSERT INTO `sys_oper_log` VALUES (240, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brandId\":10,\"carId\":1,\"carName\":\"Mustang\",\"carTypeId\":4,\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"params\":{},\"rent\":5200.66,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-09-12 11:09:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 11:09:00', 8);
INSERT INTO `sys_oper_log` VALUES (241, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brandId\":10,\"carId\":1,\"carName\":\"Mustang\",\"carTypeId\":4,\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"params\":{},\"rent\":5200.0,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-09-12 11:09:05\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 11:09:05', 5);
INSERT INTO `sys_oper_log` VALUES (242, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brandId\":10,\"carId\":1,\"carImgs\":\"/profile/upload/2023/09/12/Mustang-1_20230912113228A001.jpg,/profile/upload/2023/09/12/Mustang-1_20230912113236A002.jpg\",\"carName\":\"Mustang\",\"carTypeId\":4,\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"params\":{},\"rent\":5200.0,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-09-12 11:32:37\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 11:32:37', 25);
INSERT INTO `sys_oper_log` VALUES (243, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brandId\":10,\"carId\":1,\"carImgs\":\"/profile/upload/2023/09/12/Mustang-1_20230912113228A001.jpg\",\"carName\":\"Mustang\",\"carTypeId\":4,\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"params\":{},\"rent\":5200.0,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-09-12 11:32:50\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 11:32:50', 9);
INSERT INTO `sys_oper_log` VALUES (244, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brandId\":10,\"carDes\":\"Mustang超级跑车\",\"carId\":1,\"carImgs\":\"/profile/upload/2023/09/12/Mustang-1_20230912113228A001.jpg\",\"carName\":\"Mustang\",\"carTypeId\":4,\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"params\":{},\"rent\":5200.0,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-09-12 11:33:41\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 11:33:41', 11);
INSERT INTO `sys_oper_log` VALUES (245, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brandId\":10,\"carDes\":\"Mustang超级跑车\",\"carId\":1,\"carImgs\":\"/profile/upload/2023/09/12/Mustang-1_20230912113228A001.jpg\",\"carName\":\"Mustang\",\"carTypeId\":4,\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"params\":{},\"rent\":5200.0,\"status\":\"3\",\"updateBy\":\"\",\"updateTime\":\"2023-09-12 11:39:32\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 11:39:32', 10);
INSERT INTO `sys_oper_log` VALUES (246, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brandId\":10,\"carDes\":\"Mustang超级跑车\",\"carId\":1,\"carImgs\":\"/profile/upload/2023/09/12/Mustang-1_20230912113228A001.jpg\",\"carName\":\"Mustang\",\"carTypeId\":4,\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"params\":{},\"rent\":5200.0,\"status\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2023-09-12 11:39:36\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 11:39:36', 10);
INSERT INTO `sys_oper_log` VALUES (247, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brandId\":10,\"carDes\":\"Mustang超级跑车\",\"carId\":1,\"carImgs\":\"/profile/upload/2023/09/12/Mustang-1_20230912113228A001.jpg\",\"carName\":\"Mustang\",\"carTypeId\":4,\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"params\":{},\"rent\":5200.0,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-09-12 11:39:40\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 11:39:40', 13);
INSERT INTO `sys_oper_log` VALUES (248, '字典类型', 1, 'com.ruoyi.project.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"订单状态\",\"dictType\":\"sys_order_status\",\"params\":{},\"remark\":\"订单状态列表\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 12:00:23', 30);
INSERT INTO `sys_oper_log` VALUES (249, '字典类型', 2, 'com.ruoyi.project.system.controller.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-09-11 21:39:23\",\"dictId\":100,\"dictName\":\"车辆状态\",\"dictType\":\"sys_car_status\",\"params\":{},\"remark\":\"车辆状态列表\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 12:00:32', 60);
INSERT INTO `sys_oper_log` VALUES (250, '字典数据', 1, 'com.ruoyi.project.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"取消订单\",\"dictSort\":0,\"dictType\":\"sys_order_status\",\"dictValue\":\"0\",\"listClass\":\"warning\",\"params\":{},\"remark\":\"取消订单状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 12:01:01', 26);
INSERT INTO `sys_oper_log` VALUES (251, '字典数据', 1, 'com.ruoyi.project.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"出租驳回\",\"dictSort\":1,\"dictType\":\"sys_order_status\",\"dictValue\":\"1\",\"listClass\":\"danger\",\"params\":{},\"remark\":\"出租驳回状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 12:01:31', 13);
INSERT INTO `sys_oper_log` VALUES (252, '字典数据', 1, 'com.ruoyi.project.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"还车驳回\",\"dictSort\":2,\"dictType\":\"sys_order_status\",\"dictValue\":\"2\",\"listClass\":\"danger\",\"params\":{},\"remark\":\"还车驳回状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 12:02:02', 17);
INSERT INTO `sys_oper_log` VALUES (253, '字典数据', 1, 'com.ruoyi.project.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"出租审核中\",\"dictSort\":3,\"dictType\":\"sys_order_status\",\"dictValue\":\"3\",\"listClass\":\"success\",\"params\":{},\"remark\":\"出租审核中状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 13:06:59', 13);
INSERT INTO `sys_oper_log` VALUES (254, '字典数据', 1, 'com.ruoyi.project.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"还车审核中\",\"dictSort\":4,\"dictType\":\"sys_order_status\",\"dictValue\":\"4\",\"listClass\":\"success\",\"params\":{},\"remark\":\"还车审核中状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 13:07:21', 15);
INSERT INTO `sys_oper_log` VALUES (255, '字典数据', 1, 'com.ruoyi.project.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"出租中\",\"dictSort\":5,\"dictType\":\"sys_order_status\",\"dictValue\":\"5\",\"listClass\":\"info\",\"params\":{},\"remark\":\"出租中状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 13:07:49', 14);
INSERT INTO `sys_oper_log` VALUES (256, '字典数据', 1, 'com.ruoyi.project.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"完成\",\"dictSort\":6,\"dictType\":\"sys_order_status\",\"dictValue\":\"6\",\"listClass\":\"primary\",\"params\":{},\"remark\":\"完成状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 13:08:18', 12);
INSERT INTO `sys_oper_log` VALUES (257, '字典类型', 1, 'com.ruoyi.project.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"订单支付状态\",\"dictType\":\"order_pay_status\",\"params\":{},\"remark\":\"订单支付状态列表\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 13:09:17', 17);
INSERT INTO `sys_oper_log` VALUES (258, '字典类型', 2, 'com.ruoyi.project.system.controller.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-09-12 13:09:17\",\"dictId\":102,\"dictName\":\"订单支付状态\",\"dictType\":\"sys_order_pay_status\",\"params\":{},\"remark\":\"订单支付状态列表\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 13:09:31', 22);
INSERT INTO `sys_oper_log` VALUES (259, '字典数据', 1, 'com.ruoyi.project.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未支付\",\"dictSort\":0,\"dictType\":\"sys_order_pay_status\",\"dictValue\":\"0\",\"listClass\":\"warning\",\"params\":{},\"remark\":\"未支付状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 13:09:58', 14);
INSERT INTO `sys_oper_log` VALUES (260, '字典数据', 1, 'com.ruoyi.project.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已支付\",\"dictSort\":1,\"dictType\":\"sys_order_pay_status\",\"dictValue\":\"1\",\"listClass\":\"primary\",\"params\":{},\"remark\":\"已支付状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 13:10:10', 16);
INSERT INTO `sys_oper_log` VALUES (261, '字典数据', 1, 'com.ruoyi.project.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"取消支付\",\"dictSort\":2,\"dictType\":\"sys_order_pay_status\",\"dictValue\":\"2\",\"listClass\":\"danger\",\"params\":{},\"remark\":\"取消支付状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 13:10:27', 20);
INSERT INTO `sys_oper_log` VALUES (262, '字典数据', 2, 'com.ruoyi.project.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-09-12 13:09:58\",\"default\":false,\"dictCode\":111,\"dictLabel\":\"待支付\",\"dictSort\":0,\"dictType\":\"sys_order_pay_status\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"remark\":\"未支付状态\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 13:12:39', 15);
INSERT INTO `sys_oper_log` VALUES (263, '字典数据', 2, 'com.ruoyi.project.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-09-12 13:09:58\",\"default\":false,\"dictCode\":111,\"dictLabel\":\"待支付\",\"dictSort\":0,\"dictType\":\"sys_order_pay_status\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"remark\":\"待支付状态\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 13:12:45', 13);
INSERT INTO `sys_oper_log` VALUES (264, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"order_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 13:21:22', 137);
INSERT INTO `sys_oper_log` VALUES (265, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"order\",\"className\":\"OrderInfo\",\"columns\":[{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单编号\",\"columnId\":49,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-09-12 13:21:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CarId\",\"columnComment\":\"车辆编号\",\"columnId\":50,\"columnName\":\"car_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-09-12 13:21:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"carId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BrandId\",\"columnComment\":\"品牌编号\",\"columnId\":51,\"columnName\":\"brand_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-09-12 13:21:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"brandId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CartTypeId\",\"columnComment\":\"车型编号\",\"columnId\":52,\"columnName\":\"cart_type_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-09-12 13:21:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"cartTypeId\",\"javaType\":\"Long\",\"lis', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 13:24:54', 144);
INSERT INTO `sys_oper_log` VALUES (266, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brandId\":10,\"carDes\":\"Mustang超级跑车\",\"carId\":1,\"carImgs\":\"/profile/upload/2023/09/12/Mustang-1_20230912113228A001.jpg\",\"carName\":\"Mustang\",\"carTypeId\":4,\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"deptId\":201,\"params\":{},\"rent\":5200.0,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-09-12 13:45:18\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 13:45:18', 29);
INSERT INTO `sys_oper_log` VALUES (267, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brandId\":10,\"carDes\":\"Mustang超级跑车\",\"carId\":1,\"carImgs\":\"/profile/upload/2023/09/12/Mustang-1_20230912140838A001.jpg\",\"carName\":\"Mustang\",\"carTypeId\":4,\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"deptId\":201,\"params\":{},\"rent\":5200.0,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-09-12 14:08:40\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 14:08:40', 57);
INSERT INTO `sys_oper_log` VALUES (268, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 11:57:45\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,103,1016,1018,2019,2026,2027,2028,2029,2030,2031],\"params\":{},\"remark\":\"门店管理员\",\"roleId\":2,\"roleKey\":\"store\",\"roleName\":\"门店管理员\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 14:17:13', 41);
INSERT INTO `sys_oper_log` VALUES (269, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 11:57:45\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2007,2013,2020,103,2008,2012,2014,2018,2021,1016,1018,2019,2026,2027,2028,2029,2030,2031],\"params\":{},\"remark\":\"门店管理员\",\"roleId\":2,\"roleKey\":\"store\",\"roleName\":\"门店管理员\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 14:28:33', 17);
INSERT INTO `sys_oper_log` VALUES (270, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 11:57:45\",\"dataScope\":\"3\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"门店管理员\",\"roleId\":2,\"roleKey\":\"store\",\"roleName\":\"门店管理员\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 16:26:38', 55);
INSERT INTO `sys_oper_log` VALUES (271, '车辆信息', 1, 'com.ruoyi.project.system.controller.CarInfoController.add()', 'POST', 1, 'futian', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brandId\":4,\"carDes\":\"奥迪A6L\",\"carId\":2,\"carImgs\":\"/profile/upload/2023/09/12/audi-A6L-1_20230912162657A001.jpg\",\"carName\":\"奥迪A6L\",\"carTypeId\":2,\"createTime\":\"2023-09-12 16:27:17\",\"deptId\":202,\"params\":{},\"rent\":1500.0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 16:27:17', 69);
INSERT INTO `sys_oper_log` VALUES (272, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 13:23:21\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2,100,1000,1001,1002,1003,1004,1005,1006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,103,1016,1017,1018,1019,2019,2026,2027,2028,2029,2030,2031,1,109,1046,1047,1048],\"params\":{},\"remark\":\"系统管理员\",\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"系统管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 16:36:06', 71);
INSERT INTO `sys_oper_log` VALUES (273, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 13:23:21\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2,100,1000,1001,1002,1003,1004,1005,1006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,103,1016,1017,1018,1019,2019,2026,2027,2028,2029,2030,2031,109,1046,1047,1048],\"params\":{},\"remark\":\"系统管理员\",\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"系统管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 16:37:06', 53);
INSERT INTO `sys_oper_log` VALUES (274, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/carInfo/index\",\"createTime\":\"2023-09-11 22:24:23\",\"icon\":\"star\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2026,\"menuName\":\"车辆信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2019,\"path\":\"carInfo\",\"perms\":\"system:carInfo:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 16:41:30', 31);
INSERT INTO `sys_oper_log` VALUES (275, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/order_info', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 16:44:20', 160);
INSERT INTO `sys_oper_log` VALUES (276, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"order\",\"className\":\"OrderInfo\",\"columns\":[{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单编号\",\"columnId\":49,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-09-12 13:21:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2023-09-12 16:44:20\",\"usableColumn\":false},{\"capJavaField\":\"CarId\",\"columnComment\":\"车辆编号\",\"columnId\":50,\"columnName\":\"car_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-09-12 13:21:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"carId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2023-09-12 16:44:20\",\"usableColumn\":false},{\"capJavaField\":\"BrandId\",\"columnComment\":\"品牌编号\",\"columnId\":51,\"columnName\":\"brand_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-09-12 13:21:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"brandId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2023-09-12 16:44:20\",\"usableColumn\":false},{\"capJavaField\":\"CartTypeId\",\"columnComment\":\"车型编号\",\"columnId\":52,\"columnName\":\"cart_type_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-09-12 13:21:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 16:44:56', 138);
INSERT INTO `sys_oper_log` VALUES (277, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"order_info\"}', NULL, 0, NULL, '2023-09-12 16:45:48', 645);
INSERT INTO `sys_oper_log` VALUES (278, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/order/index\",\"createTime\":\"2023-09-12 16:46:21\",\"icon\":\"money\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2032,\"menuName\":\"订单信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2019,\"path\":\"order\",\"perms\":\"system:order:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-12 16:48:02', 17);
INSERT INTO `sys_oper_log` VALUES (279, '订单信息', 1, 'com.ruoyi.project.system.controller.OrderInfoController.add()', 'POST', 1, 'admin', NULL, '/system/order', '127.0.0.1', '内网IP', '{\"brandId\":10,\"carId\":1,\"createTime\":\"2023-09-14 11:52:03\",\"deptId\":201,\"endTime\":\"2023-09-15\",\"params\":{},\"payStatus\":\"0\",\"priceDay\":5200,\"priceTotal\":5200,\"rentalDay\":1,\"status\":\"3\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'cart_type_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\Work\\Other\\004 4500 document + project\\Gallop\\target\\classes\\mybatis\\system\\OrderInfoMapper.xml]\r\n### The error may involve com.ruoyi.project.system.mapper.OrderInfoMapper.insertOrderInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into order_info          ( car_id,             brand_id,                          dept_id,             rental_day,             end_time,             price_day,             price_total,             pay_status,             status,                          create_time )           values ( ?,             ?,                          ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'cart_type_id\' doesn\'t have a default value\n; Field \'cart_type_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'cart_type_id\' doesn\'t have a default value', '2023-09-14 11:52:03', 103);
INSERT INTO `sys_oper_log` VALUES (280, '订单信息', 1, 'com.ruoyi.project.system.controller.OrderInfoController.add()', 'POST', 1, 'admin', NULL, '/system/order', '127.0.0.1', '内网IP', '{\"brandId\":10,\"carId\":1,\"carTypeId\":4,\"createTime\":\"2023-09-14 11:54:14\",\"deptId\":201,\"endTime\":\"2023-09-15\",\"orderId\":1,\"params\":{},\"payStatus\":\"0\",\"priceDay\":5200,\"priceTotal\":5200,\"rentalDay\":1,\"status\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 11:54:14', 85);
INSERT INTO `sys_oper_log` VALUES (281, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 13:23:21\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2,100,1000,1001,1002,1003,1004,1005,1006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,103,1016,1017,1018,1019,2019,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,109,1046,1047,1048],\"params\":{},\"remark\":\"系统管理员\",\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"系统管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 13:44:08', 82);
INSERT INTO `sys_oper_log` VALUES (282, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 11:57:45\",\"dataScope\":\"3\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2007,2013,2020,103,2008,2012,2014,2018,2021,1016,1018,2019,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037],\"params\":{},\"remark\":\"门店管理员\",\"roleId\":2,\"roleKey\":\"store\",\"roleName\":\"门店管理员\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 13:44:15', 21);
INSERT INTO `sys_oper_log` VALUES (283, '车型信息', 3, 'com.ruoyi.project.system.controller.CarTypeInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/system/carType/1,2,3,4,5,6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"删除失败，车型轿车下存在车辆\",\"code\":500}', 0, NULL, '2023-09-14 13:58:04', 35);
INSERT INTO `sys_oper_log` VALUES (284, '车型信息', 3, 'com.ruoyi.project.system.controller.CarTypeInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/system/carType/1,2,3,4,5,6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"删除失败，车型名称为轿车的数据下存在车辆\",\"code\":500}', 0, NULL, '2023-09-14 13:58:47', 58);
INSERT INTO `sys_oper_log` VALUES (285, '车型信息', 3, 'com.ruoyi.project.system.controller.CarTypeInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/system/carType/1,3,4,5,6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"删除失败，车型名称为超跑的数据下存在车辆\",\"code\":500}', 0, NULL, '2023-09-14 13:58:53', 23);
INSERT INTO `sys_oper_log` VALUES (286, '车型信息', 3, 'com.ruoyi.project.system.controller.CarTypeInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/system/carType/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"删除失败，车型名称为轿车的数据下存在车辆\",\"code\":500}', 0, NULL, '2023-09-14 13:59:00', 20);
INSERT INTO `sys_oper_log` VALUES (287, '车型信息', 3, 'com.ruoyi.project.system.controller.CarTypeInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/system/carType/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"删除失败，车型名称为超跑的数据下存在车辆\",\"code\":500}', 0, NULL, '2023-09-14 13:59:03', 11);
INSERT INTO `sys_oper_log` VALUES (288, '字典类型', 1, 'com.ruoyi.project.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"用户身份审核状态\",\"dictType\":\"sys_user_audit_status\",\"params\":{},\"remark\":\"用户身份审核状态列表\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 14:40:13', 23);
INSERT INTO `sys_oper_log` VALUES (289, '字典数据', 1, 'com.ruoyi.project.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未审核\",\"dictSort\":0,\"dictType\":\"sys_user_audit_status\",\"dictValue\":\"0\",\"listClass\":\"warning\",\"params\":{},\"remark\":\"未审核状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 14:45:25', 20);
INSERT INTO `sys_oper_log` VALUES (290, '字典数据', 1, 'com.ruoyi.project.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"审核中\",\"dictSort\":1,\"dictType\":\"sys_user_audit_status\",\"dictValue\":\"1\",\"listClass\":\"success\",\"params\":{},\"remark\":\"审核中状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 14:45:50', 15);
INSERT INTO `sys_oper_log` VALUES (291, '字典数据', 1, 'com.ruoyi.project.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"驳回审核\",\"dictSort\":2,\"dictType\":\"sys_user_audit_status\",\"dictValue\":\"2\",\"listClass\":\"danger\",\"params\":{},\"remark\":\"驳回审核状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 14:46:14', 15);
INSERT INTO `sys_oper_log` VALUES (292, '字典数据', 1, 'com.ruoyi.project.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"审核通过\",\"dictSort\":3,\"dictType\":\"sys_user_audit_status\",\"dictValue\":\"3\",\"listClass\":\"primary\",\"params\":{},\"remark\":\"审核通过状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 14:46:31', 17);
INSERT INTO `sys_oper_log` VALUES (293, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_user_audit\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 14:51:16', 143);
INSERT INTO `sys_oper_log` VALUES (294, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"audit\",\"className\":\"SysUserAudit\",\"columns\":[{\"capJavaField\":\"UserAuditId\",\"columnComment\":\"用户审核表编号\",\"columnId\":65,\"columnName\":\"user_audit_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-09-14 14:51:16\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"userAuditId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户编号\",\"columnId\":66,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-09-14 14:51:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserIdCard\",\"columnComment\":\"用户身份证号\",\"columnId\":67,\"columnName\":\"user_id_card\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-14 14:51:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"userIdCard\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserAuditName\",\"columnComment\":\"用户审核名字\",\"columnId\":68,\"columnName\":\"user_audit_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-14 14:51:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"user', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 14:53:20', 89);
INSERT INTO `sys_oper_log` VALUES (295, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_user_audit\"}', NULL, 0, NULL, '2023-09-14 14:59:03', 271);
INSERT INTO `sys_oper_log` VALUES (296, '用户认证审核', 1, 'com.ruoyi.project.system.controller.SysUserAuditController.add()', 'POST', 1, 'admin', NULL, '/system/audit', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-09-14 15:10:23\",\"params\":{},\"status\":\"3\",\"userId\":100}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_audit_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\Work\\Other\\004 4500 document + project\\Gallop\\target\\classes\\mybatis\\system\\SysUserAuditMapper.xml]\r\n### The error may involve com.ruoyi.project.system.mapper.SysUserAuditMapper.insertSysUserAudit-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user_audit          ( user_id,                                                                 status,                          create_time )           values ( ?,                                                                 ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'user_audit_id\' doesn\'t have a default value\n; Field \'user_audit_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_audit_id\' doesn\'t have a default value', '2023-09-14 15:10:23', 330);
INSERT INTO `sys_oper_log` VALUES (297, '用户认证审核', 1, 'com.ruoyi.project.system.controller.SysUserAuditController.add()', 'POST', 1, 'admin', NULL, '/system/audit', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-09-14 15:10:54\",\"params\":{},\"status\":\"3\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 15:10:54', 7);
INSERT INTO `sys_oper_log` VALUES (298, '角色管理', 1, 'com.ruoyi.project.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"remark\":\"租车用户角色\",\"roleId\":101,\"roleKey\":\"customer\",\"roleName\":\"租车用户\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 15:15:36', 40);
INSERT INTO `sys_oper_log` VALUES (299, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 13:23:21\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2,2000,100,1000,1001,1002,1003,1004,1005,1006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2020,2021,2022,2023,2024,2025,2038,2039,2040,2041,2042,2043,103,1016,1017,1018,1019,2019,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,109,1046,1047,1048],\"params\":{},\"remark\":\"系统管理员\",\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"系统管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 15:15:47', 52);
INSERT INTO `sys_oper_log` VALUES (300, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/audit/index\",\"createTime\":\"2023-09-14 14:59:27\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2038,\"menuName\":\"用户认证审核\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"audit\",\"perms\":\"system:audit:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 15:16:20', 34);
INSERT INTO `sys_oper_log` VALUES (301, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2023-09-11 11:57:45\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"门店管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 15:16:37', 9);
INSERT INTO `sys_oper_log` VALUES (302, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"test\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":103,\"userName\":\"test\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 15:18:00', 175);
INSERT INTO `sys_oper_log` VALUES (303, '用户管理', 2, 'com.ruoyi.project.system.controller.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 15:18:06', 26);
INSERT INTO `sys_oper_log` VALUES (304, '用户管理', 2, 'com.ruoyi.project.system.controller.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 15:18:08', 5);
INSERT INTO `sys_oper_log` VALUES (305, '用户管理', 2, 'com.ruoyi.project.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-09-14 15:18:00\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"test\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[101],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":103,\"userName\":\"test\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 15:18:12', 19);
INSERT INTO `sys_oper_log` VALUES (306, '用户管理', 3, 'com.ruoyi.project.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 15:18:16', 15);
INSERT INTO `sys_oper_log` VALUES (307, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"test\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":104,\"userName\":\"test\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 15:18:54', 161);
INSERT INTO `sys_oper_log` VALUES (308, '用户认证审核', 3, 'com.ruoyi.project.system.controller.SysUserAuditController.remove()', 'DELETE', 1, 'admin', NULL, '/system/audit/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 15:19:21', 5);
INSERT INTO `sys_oper_log` VALUES (309, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"test2\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":105,\"userName\":\"test2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 15:21:56', 48959);
INSERT INTO `sys_oper_log` VALUES (310, '用户管理', 3, 'com.ruoyi.project.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/104,105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 15:22:23', 59);
INSERT INTO `sys_oper_log` VALUES (311, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"test\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":106,\"userName\":\"test\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 15:23:32', 27834);
INSERT INTO `sys_oper_log` VALUES (312, '用户管理', 3, 'com.ruoyi.project.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/106', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 15:42:26', 64);
INSERT INTO `sys_oper_log` VALUES (313, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"测试顾客账户\",\"params\":{},\"postIds\":[],\"roleIds\":[101],\"status\":\"0\",\"userId\":107,\"userName\":\"customer\"}', NULL, 1, 'Cannot invoke \"java.lang.Long.equals(Object)\" because the return value of \"com.ruoyi.project.system.domain.SysUser.getRoleId()\" is null', '2023-09-14 15:43:10', 77);
INSERT INTO `sys_oper_log` VALUES (314, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"测试用户\",\"params\":{},\"postIds\":[],\"roleIds\":[101],\"status\":\"0\",\"userId\":108,\"userName\":\"customer\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-14 15:56:41', 595);
INSERT INTO `sys_oper_log` VALUES (315, '用户认证审核', 2, 'com.ruoyi.project.system.controller.SysUserAuditController.edit()', 'PUT', 1, 'admin', NULL, '/system/audit', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"params\":{},\"status\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 19:39:42\",\"user\":{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"测试用户\",\"params\":{},\"status\":\"0\",\"updateBy\":\"\",\"userId\":108,\"userName\":\"customer\"},\"userAuditId\":2,\"userId\":108}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 19:39:42', 18);
INSERT INTO `sys_oper_log` VALUES (316, '用户认证审核', 2, 'com.ruoyi.project.system.controller.SysUserAuditController.edit()', 'PUT', 1, 'admin', NULL, '/system/audit', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"idCardImgs\":\"/profile/upload/2023/09/15/12_20230915195545A002.jpg\",\"params\":{},\"status\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 19:55:46\",\"user\":{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"测试用户\",\"params\":{},\"status\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 19:39:43\",\"userId\":108,\"userName\":\"customer\"},\"userAuditId\":2,\"userId\":108}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 19:55:46', 6);
INSERT INTO `sys_oper_log` VALUES (317, '用户认证审核', 2, 'com.ruoyi.project.system.controller.SysUserAuditController.edit()', 'PUT', 1, 'admin', NULL, '/system/audit', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"idCardImgs\":\"/profile/upload/2023/09/15/12_20230915195545A002.jpg,/profile/upload/2023/09/15/12_20230915195554A003.jpg\",\"params\":{},\"status\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 19:55:55\",\"user\":{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"测试用户\",\"params\":{},\"status\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 19:55:47\",\"userId\":108,\"userName\":\"customer\"},\"userAuditId\":2,\"userId\":108}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 19:55:55', 5);
INSERT INTO `sys_oper_log` VALUES (318, '用户认证审核', 2, 'com.ruoyi.project.system.controller.SysUserAuditController.edit()', 'PUT', 1, 'admin', NULL, '/system/audit', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"idCardImgs\":\"/profile/upload/2023/09/15/12_20230915195545A002.jpg,/profile/upload/2023/09/15/bg2_20230915195612A004.jpg\",\"params\":{},\"status\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 19:56:14\",\"user\":{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"测试用户\",\"params\":{},\"status\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 19:55:56\",\"userId\":108,\"userName\":\"customer\"},\"userAuditId\":2,\"userId\":108}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 19:56:14', 6);
INSERT INTO `sys_oper_log` VALUES (319, '用户认证审核', 2, 'com.ruoyi.project.system.controller.SysUserAuditController.edit()', 'PUT', 1, 'admin', NULL, '/system/audit', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"idCardImgs\":\"/profile/upload/2023/09/15/12_20230915195545A002.jpg,/profile/upload/2023/09/15/bg2_20230915195612A004.jpg\",\"params\":{},\"status\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:12:22\",\"user\":{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"测试用户\",\"params\":{},\"status\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 19:56:14\",\"userId\":108,\"userName\":\"customer\"},\"userAuditId\":2,\"userAuditName\":\"测试顾客贾\",\"userId\":108,\"userIdCard\":\"6666677777888889999\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 20:12:22', 8);
INSERT INTO `sys_oper_log` VALUES (320, '用户认证审核', 2, 'com.ruoyi.project.system.controller.SysUserAuditController.edit()', 'PUT', 1, 'admin', NULL, '/system/audit', '127.0.0.1', '内网IP', '{\"idCardImgs\":\"/profile/upload/2023/09/15/12_20230915195545A002.jpg,/profile/upload/2023/09/15/bg2_20230915195612A004.jpg\",\"params\":{},\"status\":\"2\",\"updateTime\":\"2023-09-15 20:24:32\",\"userAuditId\":2,\"userAuditName\":\"测试顾客贾\",\"userId\":108,\"userIdCard\":\"6666677777888889999\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 20:24:32', 4);
INSERT INTO `sys_oper_log` VALUES (321, '用户认证审核', 2, 'com.ruoyi.project.system.controller.SysUserAuditController.edit()', 'PUT', 1, 'admin', NULL, '/system/audit', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"idCardImgs\":\"/profile/upload/2023/09/15/12_20230915195545A002.jpg,/profile/upload/2023/09/15/bg2_20230915195612A004.jpg\",\"params\":{},\"status\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:24:52\",\"user\":{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"测试用户\",\"params\":{},\"status\":\"2\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:24:33\",\"userId\":108,\"userName\":\"customer\"},\"userAuditId\":2,\"userAuditName\":\"测试顾客贾\",\"userId\":108,\"userIdCard\":\"6666677777888889999\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 20:24:52', 5);
INSERT INTO `sys_oper_log` VALUES (322, '用户认证审核', 2, 'com.ruoyi.project.system.controller.SysUserAuditController.edit()', 'PUT', 1, 'admin', NULL, '/system/audit', '127.0.0.1', '内网IP', '{\"idCardImgs\":\"/profile/upload/2023/09/15/12_20230915195545A002.jpg,/profile/upload/2023/09/15/bg2_20230915195612A004.jpg\",\"params\":{},\"status\":\"3\",\"updateTime\":\"2023-09-15 20:24:54\",\"userAuditId\":2,\"userAuditName\":\"测试顾客贾\",\"userId\":108,\"userIdCard\":\"6666677777888889999\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 20:24:54', 12);
INSERT INTO `sys_oper_log` VALUES (323, '用户认证审核', 2, 'com.ruoyi.project.system.controller.SysUserAuditController.edit()', 'PUT', 1, 'admin', NULL, '/system/audit', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"idCardImgs\":\"/profile/upload/2023/09/15/12_20230915195545A002.jpg,/profile/upload/2023/09/15/bg2_20230915195612A004.jpg\",\"params\":{},\"status\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:24:59\",\"user\":{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"测试用户\",\"params\":{},\"status\":\"3\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:24:55\",\"userId\":108,\"userName\":\"customer\"},\"userAuditId\":2,\"userAuditName\":\"测试顾客贾\",\"userId\":108,\"userIdCard\":\"6666677777888889999\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 20:24:59', 8);
INSERT INTO `sys_oper_log` VALUES (324, '用户认证审核', 2, 'com.ruoyi.project.system.controller.SysUserAuditController.edit()', 'PUT', 1, 'admin', NULL, '/system/audit', '127.0.0.1', '内网IP', '{\"idCardImgs\":\"/profile/upload/2023/09/15/12_20230915195545A002.jpg,/profile/upload/2023/09/15/bg2_20230915195612A004.jpg\",\"params\":{},\"status\":\"3\",\"updateTime\":\"2023-09-15 20:26:21\",\"userAuditId\":2,\"userAuditName\":\"测试顾客贾\",\"userId\":108,\"userIdCard\":\"6666677777888889999\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 20:26:21', 6);
INSERT INTO `sys_oper_log` VALUES (325, '用户认证审核', 2, 'com.ruoyi.project.system.controller.SysUserAuditController.edit()', 'PUT', 1, 'admin', NULL, '/system/audit', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"idCardImgs\":\"/profile/upload/2023/09/15/12_20230915195545A002.jpg,/profile/upload/2023/09/15/bg2_20230915195612A004.jpg\",\"params\":{},\"status\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:26:27\",\"user\":{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"测试用户\",\"params\":{},\"status\":\"3\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:26:21\",\"userId\":108,\"userName\":\"customer\"},\"userAuditId\":2,\"userAuditName\":\"测试顾客贾\",\"userId\":108,\"userIdCard\":\"6666677777888889999\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 20:26:27', 5);
INSERT INTO `sys_oper_log` VALUES (326, '用户认证审核', 2, 'com.ruoyi.project.system.controller.SysUserAuditController.edit()', 'PUT', 1, 'admin', NULL, '/system/audit', '127.0.0.1', '内网IP', '{\"idCardImgs\":\"/profile/upload/2023/09/15/12_20230915195545A002.jpg,/profile/upload/2023/09/15/bg2_20230915195612A004.jpg\",\"params\":{},\"rejectReason\":\"信息不符\",\"status\":\"2\",\"updateTime\":\"2023-09-15 20:26:35\",\"userAuditId\":2,\"userAuditName\":\"测试顾客贾\",\"userId\":108,\"userIdCard\":\"6666677777888889999\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 20:26:35', 4);
INSERT INTO `sys_oper_log` VALUES (327, '用户认证审核', 2, 'com.ruoyi.project.system.controller.SysUserAuditController.edit()', 'PUT', 1, 'admin', NULL, '/system/audit', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"idCardImgs\":\"/profile/upload/2023/09/15/12_20230915195545A002.jpg,/profile/upload/2023/09/15/bg2_20230915195612A004.jpg\",\"params\":{},\"rejectReason\":\"信息不符\",\"status\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:26:41\",\"user\":{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"测试用户\",\"params\":{},\"status\":\"2\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:26:35\",\"userId\":108,\"userName\":\"customer\"},\"userAuditId\":2,\"userAuditName\":\"测试顾客贾\",\"userId\":108,\"userIdCard\":\"6666677777888889999\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 20:26:41', 10);
INSERT INTO `sys_oper_log` VALUES (328, '用户认证审核', 2, 'com.ruoyi.project.system.controller.SysUserAuditController.edit()', 'PUT', 1, 'admin', NULL, '/system/audit', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"idCardImgs\":\"/profile/upload/2023/09/15/12_20230915195545A002.jpg,/profile/upload/2023/09/15/bg2_20230915195612A004.jpg\",\"params\":{},\"rejectReason\":\"\",\"status\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:26:47\",\"user\":{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"测试用户\",\"params\":{},\"status\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:26:42\",\"userId\":108,\"userName\":\"customer\"},\"userAuditId\":2,\"userAuditName\":\"测试顾客贾\",\"userId\":108,\"userIdCard\":\"6666677777888889999\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 20:26:47', 13);
INSERT INTO `sys_oper_log` VALUES (329, '用户认证审核', 2, 'com.ruoyi.project.system.controller.SysUserAuditController.edit()', 'PUT', 1, 'admin', NULL, '/system/audit', '127.0.0.1', '内网IP', '{\"idCardImgs\":\"/profile/upload/2023/09/15/12_20230915195545A002.jpg,/profile/upload/2023/09/15/bg2_20230915195612A004.jpg\",\"params\":{},\"rejectReason\":\"\",\"status\":\"3\",\"updateTime\":\"2023-09-15 20:26:51\",\"userAuditId\":2,\"userAuditName\":\"测试顾客贾\",\"userId\":108,\"userIdCard\":\"6666677777888889999\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 20:26:51', 5);
INSERT INTO `sys_oper_log` VALUES (330, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 13:23:21\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2,2000,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2020,2021,2022,2023,2024,2025,2038,2039,2040,2041,2042,2043,2019,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,109,1046,1047,1048],\"params\":{},\"remark\":\"系统管理员\",\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"系统管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 20:28:02', 37);
INSERT INTO `sys_oper_log` VALUES (331, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 11:57:45\",\"dataScope\":\"3\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,103,2007,2013,2020,1016,1018,2008,2012,2014,2018,2021,2019,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037],\"params\":{},\"remark\":\"门店管理员\",\"roleId\":2,\"roleKey\":\"store\",\"roleName\":\"门店管理员\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 20:28:26', 24);
INSERT INTO `sys_oper_log` VALUES (332, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brand\":{\"brandId\":10,\"brandName\":\"福特\",\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"params\":{},\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-09-12 14:08:40\"},\"brandId\":10,\"carDes\":\"Mustang超级跑车\",\"carId\":1,\"carImgs\":\"/profile/upload/2023/09/12/Mustang-1_20230912140838A001.jpg\",\"carName\":\"Mustang\",\"carType\":{\"carTypeId\":4,\"carTypeName\":\"超跑\",\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"params\":{},\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-09-12 14:08:40\"},\"carTypeId\":4,\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"dept\":{\"children\":[],\"deptId\":201,\"deptName\":\"南山区门店\",\"params\":{}},\"deptId\":201,\"params\":{},\"rent\":5200.0,\"status\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:30:33\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 20:30:33', 25);
INSERT INTO `sys_oper_log` VALUES (333, '订单信息', 3, 'com.ruoyi.project.system.controller.OrderInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/system/order/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 20:35:26', 18);
INSERT INTO `sys_oper_log` VALUES (334, '订单信息', 1, 'com.ruoyi.project.system.controller.OrderInfoController.add()', 'POST', 1, 'admin', NULL, '/system/order', '127.0.0.1', '内网IP', '{\"brandId\":4,\"carId\":2,\"carTypeId\":2,\"createTime\":\"2023-09-15 20:38:06\",\"deptId\":202,\"endTime\":\"2023-09-16\",\"orderId\":2,\"params\":{},\"payStatus\":\"0\",\"priceDay\":1500,\"priceTotal\":1500,\"rentalDay\":1,\"status\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 20:38:06', 68);
INSERT INTO `sys_oper_log` VALUES (335, '订单信息', 3, 'com.ruoyi.project.system.controller.OrderInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/system/order/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 20:38:43', 24);
INSERT INTO `sys_oper_log` VALUES (336, '订单信息', 1, 'com.ruoyi.project.system.controller.OrderInfoController.add()', 'POST', 1, 'admin', NULL, '/system/order', '127.0.0.1', '内网IP', '{\"brandId\":4,\"carId\":2,\"carTypeId\":2,\"createTime\":\"2023-09-15 20:38:49\",\"deptId\":202,\"endTime\":\"2023-09-16\",\"orderId\":3,\"params\":{},\"payStatus\":\"0\",\"priceDay\":1500,\"priceTotal\":1500,\"rentalDay\":1,\"status\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 20:38:49', 26);
INSERT INTO `sys_oper_log` VALUES (337, '订单信息', 3, 'com.ruoyi.project.system.controller.OrderInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/system/order/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 20:39:51', 16);
INSERT INTO `sys_oper_log` VALUES (338, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brand\":{\"brandId\":4,\"brandName\":\"奥迪\",\"createBy\":\"\",\"createTime\":\"2023-09-12 16:27:18\",\"params\":{},\"status\":\"3\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:38:49\"},\"brandId\":4,\"carDes\":\"奥迪A6L\",\"carId\":2,\"carImgs\":\"/profile/upload/2023/09/12/audi-A6L-1_20230912162657A001.jpg\",\"carName\":\"奥迪A6L\",\"carType\":{\"carTypeId\":2,\"carTypeName\":\"轿车\",\"createBy\":\"\",\"createTime\":\"2023-09-12 16:27:18\",\"params\":{},\"status\":\"3\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:38:49\"},\"carTypeId\":2,\"createBy\":\"\",\"createTime\":\"2023-09-12 16:27:18\",\"dept\":{\"children\":[],\"deptId\":202,\"deptName\":\"福田区门店\",\"params\":{}},\"deptId\":202,\"params\":{},\"rent\":1500.0,\"status\":\"3\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:40:03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 20:40:03', 22);
INSERT INTO `sys_oper_log` VALUES (339, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brand\":{\"brandId\":4,\"brandName\":\"奥迪\",\"createBy\":\"\",\"createTime\":\"2023-09-12 16:27:18\",\"params\":{},\"status\":\"3\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:40:03\"},\"brandId\":4,\"carDes\":\"奥迪A6L\",\"carId\":2,\"carImgs\":\"/profile/upload/2023/09/12/audi-A6L-1_20230912162657A001.jpg\",\"carName\":\"奥迪A6L\",\"carType\":{\"carTypeId\":2,\"carTypeName\":\"轿车\",\"createBy\":\"\",\"createTime\":\"2023-09-12 16:27:18\",\"params\":{},\"status\":\"3\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:40:03\"},\"carTypeId\":2,\"createBy\":\"\",\"createTime\":\"2023-09-12 16:27:18\",\"dept\":{\"children\":[],\"deptId\":202,\"deptName\":\"福田区门店\",\"params\":{}},\"deptId\":202,\"params\":{},\"rent\":1500.0,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:40:11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 20:40:11', 9);
INSERT INTO `sys_oper_log` VALUES (340, '订单信息', 1, 'com.ruoyi.project.system.controller.OrderInfoController.add()', 'POST', 1, 'admin', NULL, '/system/order', '127.0.0.1', '内网IP', '{\"brandId\":4,\"carId\":2,\"carTypeId\":2,\"createTime\":\"2023-09-15 20:40:19\",\"deptId\":202,\"endTime\":\"2023-09-16\",\"orderId\":4,\"params\":{},\"payStatus\":\"0\",\"priceDay\":1500,\"priceTotal\":1500,\"rentalDay\":1,\"status\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 20:40:19', 16);
INSERT INTO `sys_oper_log` VALUES (341, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brand\":{\"brandId\":10,\"brandName\":\"福特\",\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"params\":{},\"status\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:30:34\"},\"brandId\":10,\"carDes\":\"Mustang超级跑车\",\"carId\":1,\"carImgs\":\"/profile/upload/2023/09/12/Mustang-1_20230912140838A001.jpg\",\"carName\":\"Mustang\",\"carType\":{\"carTypeId\":4,\"carTypeName\":\"超跑\",\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"params\":{},\"status\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:30:34\"},\"carTypeId\":4,\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"dept\":{\"children\":[],\"deptId\":201,\"deptName\":\"南山区门店\",\"params\":{}},\"deptId\":201,\"params\":{},\"rent\":5200.0,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:41:18\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-15 20:41:18', 7);
INSERT INTO `sys_oper_log` VALUES (342, '字典类型', 1, 'com.ruoyi.project.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"维修状态\",\"dictType\":\"repair_status\",\"params\":{},\"remark\":\"维修状态列表\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-17 15:07:28', 11);
INSERT INTO `sys_oper_log` VALUES (343, '字典数据', 1, 'com.ruoyi.project.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"取消\",\"dictSort\":0,\"dictType\":\"repair_status\",\"dictValue\":\"0\",\"listClass\":\"warning\",\"params\":{},\"remark\":\"取消状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-17 15:07:48', 9);
INSERT INTO `sys_oper_log` VALUES (344, '字典数据', 1, 'com.ruoyi.project.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"维修中\",\"dictSort\":1,\"dictType\":\"repair_status\",\"dictValue\":\"1\",\"listClass\":\"success\",\"params\":{},\"remark\":\"维修中状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-17 15:08:02', 6);
INSERT INTO `sys_oper_log` VALUES (345, '字典数据', 1, 'com.ruoyi.project.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"完成\",\"dictSort\":2,\"dictType\":\"repair_status\",\"dictValue\":\"2\",\"listClass\":\"primary\",\"params\":{},\"remark\":\"完成状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-17 15:08:15', 9);
INSERT INTO `sys_oper_log` VALUES (346, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"repair_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-17 15:08:22', 57);
INSERT INTO `sys_oper_log` VALUES (347, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"repair\",\"className\":\"RepairInfo\",\"columns\":[{\"capJavaField\":\"RepairId\",\"columnComment\":\"维修记录编号\",\"columnId\":77,\"columnName\":\"repair_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-09-17 15:08:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"repairId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CarId\",\"columnComment\":\"车辆编号\",\"columnId\":78,\"columnName\":\"car_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-09-17 15:08:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"carId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RepairContent\",\"columnComment\":\"维修内容\",\"columnId\":79,\"columnName\":\"repair_content\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-17 15:08:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"repairContent\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"维修状态（0取消 1维修中 2完成）\",\"columnId\":80,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-09-17 15:08:22\",\"dictType\":\"repair_status\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isR', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-17 18:59:28', 24);
INSERT INTO `sys_oper_log` VALUES (348, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"repair_info\"}', NULL, 0, NULL, '2023-09-17 18:59:31', 209);
INSERT INTO `sys_oper_log` VALUES (349, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/repair/index\",\"createTime\":\"2023-09-17 18:59:58\",\"icon\":\"row\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2044,\"menuName\":\"维修信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"repair\",\"perms\":\"system:repair:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-17 19:05:49', 54);
INSERT INTO `sys_oper_log` VALUES (350, '维修信息', 1, 'com.ruoyi.project.system.controller.RepairInfoController.add()', 'POST', 1, 'admin', NULL, '/system/repair', '127.0.0.1', '内网IP', '{\"carId\":1,\"createTime\":\"2023-09-17 19:08:02\",\"params\":{},\"repairContent\":\"维修后视镜\",\"repairId\":1,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-17 19:08:02', 106);
INSERT INTO `sys_oper_log` VALUES (351, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brand\":{\"brandId\":10,\"brandName\":\"福特\",\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"params\":{},\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:41:19\"},\"brandId\":10,\"carDes\":\"Mustang超级跑车\",\"carId\":1,\"carImgs\":\"/profile/upload/2023/09/12/Mustang-1_20230912140838A001.jpg\",\"carName\":\"Mustang\",\"carType\":{\"carTypeId\":4,\"carTypeName\":\"超跑\",\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"params\":{},\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:41:19\"},\"carTypeId\":4,\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"dept\":{\"children\":[],\"deptId\":201,\"deptName\":\"南山区门店\",\"params\":{}},\"deptId\":201,\"params\":{},\"rent\":5200.0,\"status\":\"2\",\"updateBy\":\"\",\"updateTime\":\"2023-09-17 19:28:43\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-17 19:28:43', 26);
INSERT INTO `sys_oper_log` VALUES (352, '维修信息', 3, 'com.ruoyi.project.system.controller.RepairInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/system/repair/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-17 19:43:02', 20);
INSERT INTO `sys_oper_log` VALUES (353, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brand\":{\"brandId\":10,\"brandName\":\"福特\",\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"params\":{},\"status\":\"2\",\"updateBy\":\"\",\"updateTime\":\"2023-09-17 19:28:43\"},\"brandId\":10,\"carDes\":\"Mustang超级跑车\",\"carId\":1,\"carImgs\":\"/profile/upload/2023/09/12/Mustang-1_20230912140838A001.jpg\",\"carName\":\"Mustang\",\"carType\":{\"carTypeId\":4,\"carTypeName\":\"超跑\",\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"params\":{},\"status\":\"2\",\"updateBy\":\"\",\"updateTime\":\"2023-09-17 19:28:43\"},\"carTypeId\":4,\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"dept\":{\"children\":[],\"deptId\":201,\"deptName\":\"南山区门店\",\"params\":{}},\"deptId\":201,\"params\":{},\"rent\":5200.0,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-09-17 19:43:25\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-17 19:43:25', 39);
INSERT INTO `sys_oper_log` VALUES (354, '维修信息', 1, 'com.ruoyi.project.system.controller.RepairInfoController.add()', 'POST', 1, 'admin', NULL, '/system/repair', '127.0.0.1', '内网IP', '{\"carId\":1,\"createTime\":\"2023-09-17 19:43:44\",\"params\":{},\"repairContent\":\"维修大灯\",\"repairId\":2,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-17 19:43:44', 29);
INSERT INTO `sys_oper_log` VALUES (355, '字典数据', 2, 'com.ruoyi.project.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-09-11 21:41:55\",\"default\":false,\"dictCode\":102,\"dictLabel\":\"维修中\",\"dictSort\":2,\"dictType\":\"sys_car_status\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"remark\":\"车辆维修状态\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-17 19:44:10', 13);
INSERT INTO `sys_oper_log` VALUES (356, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-11 11:57:45\",\"dataScope\":\"3\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,103,2007,2013,2020,1016,1018,2008,2012,2014,2018,2021,2044,2045,2046,2047,2048,2049,2019,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037],\"params\":{},\"remark\":\"门店管理员\",\"roleId\":2,\"roleKey\":\"store\",\"roleName\":\"门店管理员\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-17 19:45:04', 33);
INSERT INTO `sys_oper_log` VALUES (357, '维修信息', 2, 'com.ruoyi.project.system.controller.RepairInfoController.edit()', 'PUT', 1, 'nanshan', NULL, '/system/repair', '127.0.0.1', '内网IP', '{\"carId\":1,\"carInfo\":{\"brand\":{\"brandName\":\"福特\",\"createBy\":\"\",\"createTime\":\"2023-09-17 19:43:45\",\"params\":{},\"status\":\"1\",\"updateBy\":\"\"},\"carId\":1,\"carName\":\"Mustang\",\"carType\":{\"carTypeName\":\"超跑\",\"createBy\":\"\",\"createTime\":\"2023-09-17 19:43:45\",\"params\":{},\"status\":\"1\",\"updateBy\":\"\"},\"createBy\":\"\",\"createTime\":\"2023-09-17 19:43:45\",\"dept\":{\"children\":[],\"deptName\":\"南山区门店\",\"params\":{}},\"params\":{},\"rent\":0.0,\"status\":\"1\",\"updateBy\":\"\"},\"createBy\":\"\",\"createTime\":\"2023-09-17 19:43:45\",\"params\":{},\"repairContent\":\"维修大灯\",\"repairId\":2,\"status\":\"2\",\"updateBy\":\"\",\"updateTime\":\"2023-09-17 19:45:41\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-17 19:45:41', 12);
INSERT INTO `sys_oper_log` VALUES (358, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brand\":{\"brandId\":4,\"brandName\":\"奥迪\",\"createBy\":\"\",\"createTime\":\"2023-09-12 16:27:18\",\"params\":{},\"status\":\"3\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:40:19\"},\"brandId\":4,\"carDes\":\"奥迪A6L\",\"carId\":2,\"carImgs\":\"/profile/upload/2023/09/12/audi-A6L-1_20230912162657A001.jpg\",\"carName\":\"奥迪A6L\",\"carType\":{\"carTypeId\":2,\"carTypeName\":\"轿车\",\"createBy\":\"\",\"createTime\":\"2023-09-12 16:27:18\",\"params\":{},\"status\":\"3\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:40:19\"},\"carTypeId\":2,\"createBy\":\"\",\"createTime\":\"2023-09-12 16:27:18\",\"dept\":{\"children\":[],\"deptId\":202,\"deptName\":\"福田区门店\",\"params\":{}},\"deptId\":202,\"params\":{},\"rent\":1500.0,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-09-17 19:50:10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-17 19:50:10', 7);
INSERT INTO `sys_oper_log` VALUES (359, '订单信息', 3, 'com.ruoyi.project.system.controller.OrderInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/system/order/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-17 19:50:14', 7);
INSERT INTO `sys_oper_log` VALUES (360, '订单信息', 1, 'com.ruoyi.project.system.controller.OrderInfoController.add()', 'POST', 1, 'system', NULL, '/system/order', '127.0.0.1', '内网IP', '{\"brandId\":10,\"carId\":1,\"carTypeId\":4,\"createTime\":\"2023-09-24 20:18:27\",\"deptId\":201,\"endTime\":\"2023-09-27\",\"orderId\":5,\"params\":{},\"payStatus\":\"0\",\"priceDay\":5200,\"priceTotal\":15600,\"rentalDay\":3,\"status\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-24 20:18:27', 87);
INSERT INTO `sys_oper_log` VALUES (361, '活动信息', 2, 'com.ruoyi.project.system.controller.ActivityInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/activity', '127.0.0.1', '内网IP', '{\"activityContent\":\"测试活动内容\",\"activityCover\":\"/profile/upload/2023/09/30/大鱼海棠_20230930111118A001.png\",\"activityId\":1,\"activityTitle\":\"测试活动\",\"createBy\":\"\",\"createTime\":\"2023-09-11 21:53:46\",\"params\":{},\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-09-30 11:11:19\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-30 11:11:19', 13);
INSERT INTO `sys_oper_log` VALUES (362, '活动信息', 1, 'com.ruoyi.project.system.controller.ActivityInfoController.add()', 'POST', 1, 'admin', NULL, '/system/activity', '127.0.0.1', '内网IP', '{\"activityContent\":\"测试活动2内容\",\"activityCover\":\"/profile/upload/2023/09/30/11101819094758_20230930113055A002.jpg\",\"activityId\":2,\"activityTitle\":\"测试活动2\",\"createTime\":\"2023-09-30 11:30:57\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-30 11:30:57', 10);
INSERT INTO `sys_oper_log` VALUES (363, '活动信息', 1, 'com.ruoyi.project.system.controller.ActivityInfoController.add()', 'POST', 1, 'admin', NULL, '/system/activity', '127.0.0.1', '内网IP', '{\"activityContent\":\"测试活动3内容\",\"activityCover\":\"/profile/upload/2023/09/30/04e532cf-af7e-4264-b228-105d23d921cc_20230930113113A003.jpg\",\"activityId\":3,\"activityTitle\":\"测试活动3\",\"createTime\":\"2023-09-30 11:31:15\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-30 11:31:15', 5);
INSERT INTO `sys_oper_log` VALUES (364, '车辆信息', 1, 'com.ruoyi.project.system.controller.CarInfoController.add()', 'POST', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brandId\":1,\"carId\":3,\"carImgs\":\"/profile/upload/2023/10/12/6314cf91a63d462a9da11785b1d5fc30~1200x0_20231012101714A001.png\",\"carName\":\"奔驰EQS 2022\",\"carTypeId\":2,\"createTime\":\"2023-10-12 10:17:43\",\"deptId\":201,\"params\":{},\"rent\":1988.0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-12 10:17:43', 58);
INSERT INTO `sys_oper_log` VALUES (365, '车辆信息', 1, 'com.ruoyi.project.system.controller.CarInfoController.add()', 'POST', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brandId\":1,\"carId\":4,\"carImgs\":\"/profile/upload/2023/10/12/933fc68ecbda48daa07211a574a36681~820x0_20231012101821A002.png\",\"carName\":\"奔驰E级PHEV\",\"carTypeId\":2,\"createTime\":\"2023-10-12 10:18:38\",\"deptId\":202,\"params\":{},\"rent\":2100.0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-12 10:18:38', 23);
INSERT INTO `sys_oper_log` VALUES (366, '车辆信息', 1, 'com.ruoyi.project.system.controller.CarInfoController.add()', 'POST', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brandId\":1,\"carId\":5,\"carImgs\":\"/profile/upload/2023/10/12/9c05ef2fea8a4266a80d3f7fc748ce2a~820x0_20231012101938A003.png\",\"carName\":\"奔驰GLE 350\",\"carTypeId\":2,\"createTime\":\"2023-10-12 10:19:42\",\"deptId\":201,\"params\":{},\"rent\":1900.0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-12 10:19:42', 10);
INSERT INTO `sys_oper_log` VALUES (367, '车辆信息', 1, 'com.ruoyi.project.system.controller.CarInfoController.add()', 'POST', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brandId\":4,\"carId\":6,\"carImgs\":\"/profile/upload/2023/10/12/3e5aae0c2370474197d3f79d9d9ee4b6~1850x0_20231012102018A004.png\",\"carName\":\"奥迪Q7 2014\",\"carTypeId\":1,\"createTime\":\"2023-10-12 10:20:37\",\"deptId\":202,\"params\":{},\"rent\":2000.0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-12 10:20:37', 10);
INSERT INTO `sys_oper_log` VALUES (368, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brand\":{\"brandId\":4,\"brandName\":\"奥迪\",\"createBy\":\"\",\"createTime\":\"2023-10-12 10:20:37\",\"params\":{},\"status\":\"0\",\"updateBy\":\"\"},\"brandId\":4,\"carId\":6,\"carImgs\":\"/profile/upload/2023/10/12/3e5aae0c2370474197d3f79d9d9ee4b6~1850x0_20231012102018A004.png\",\"carName\":\"奥迪Q7 2014款 35 TFSI 运动型\",\"carType\":{\"carTypeId\":1,\"carTypeName\":\"SUV\",\"createBy\":\"\",\"createTime\":\"2023-10-12 10:20:37\",\"params\":{},\"status\":\"0\",\"updateBy\":\"\"},\"carTypeId\":1,\"createBy\":\"\",\"createTime\":\"2023-10-12 10:20:37\",\"dept\":{\"children\":[],\"deptId\":202,\"deptName\":\"福田区门店\",\"params\":{}},\"deptId\":202,\"params\":{},\"rent\":2000.0,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-10-12 10:30:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-12 10:30:00', 16);
INSERT INTO `sys_oper_log` VALUES (369, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brand\":{\"brandId\":1,\"brandName\":\"奔驰\",\"createBy\":\"\",\"createTime\":\"2023-10-12 10:19:43\",\"params\":{},\"status\":\"0\",\"updateBy\":\"\"},\"brandId\":1,\"carId\":5,\"carImgs\":\"/profile/upload/2023/10/12/9c05ef2fea8a4266a80d3f7fc748ce2a~820x0_20231012101938A003.png\",\"carName\":\"奔驰GLE 2022款 GLE 350 4MATIC 时尚型\",\"carType\":{\"carTypeId\":2,\"carTypeName\":\"轿车\",\"createBy\":\"\",\"createTime\":\"2023-10-12 10:19:43\",\"params\":{},\"status\":\"0\",\"updateBy\":\"\"},\"carTypeId\":2,\"createBy\":\"\",\"createTime\":\"2023-10-12 10:19:43\",\"dept\":{\"children\":[],\"deptId\":201,\"deptName\":\"南山区门店\",\"params\":{}},\"deptId\":201,\"params\":{},\"rent\":1900.0,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-10-12 10:30:25\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-12 10:30:26', 7);
INSERT INTO `sys_oper_log` VALUES (370, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brand\":{\"brandId\":1,\"brandName\":\"奔驰\",\"createBy\":\"\",\"createTime\":\"2023-10-12 10:18:39\",\"params\":{},\"status\":\"0\",\"updateBy\":\"\"},\"brandId\":1,\"carId\":4,\"carImgs\":\"/profile/upload/2023/10/12/933fc68ecbda48daa07211a574a36681~820x0_20231012101821A002.png\",\"carName\":\"奔驰E级PHEV 2022款 二次改款 E 350 e L 轿车\",\"carType\":{\"carTypeId\":2,\"carTypeName\":\"轿车\",\"createBy\":\"\",\"createTime\":\"2023-10-12 10:18:39\",\"params\":{},\"status\":\"0\",\"updateBy\":\"\"},\"carTypeId\":2,\"createBy\":\"\",\"createTime\":\"2023-10-12 10:18:39\",\"dept\":{\"children\":[],\"deptId\":202,\"deptName\":\"福田区门店\",\"params\":{}},\"deptId\":202,\"params\":{},\"rent\":2100.0,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-10-12 10:30:41\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-12 10:30:41', 10);
INSERT INTO `sys_oper_log` VALUES (371, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brand\":{\"brandId\":1,\"brandName\":\"奔驰\",\"createBy\":\"\",\"createTime\":\"2023-10-12 10:17:44\",\"params\":{},\"status\":\"0\",\"updateBy\":\"\"},\"brandId\":1,\"carId\":3,\"carImgs\":\"/profile/upload/2023/10/12/6314cf91a63d462a9da11785b1d5fc30~1200x0_20231012101714A001.png\",\"carName\":\"奔驰EQS 2022款 EQS 450+ 先锋版\",\"carType\":{\"carTypeId\":2,\"carTypeName\":\"轿车\",\"createBy\":\"\",\"createTime\":\"2023-10-12 10:17:44\",\"params\":{},\"status\":\"0\",\"updateBy\":\"\"},\"carTypeId\":2,\"createBy\":\"\",\"createTime\":\"2023-10-12 10:17:44\",\"dept\":{\"children\":[],\"deptId\":201,\"deptName\":\"南山区门店\",\"params\":{}},\"deptId\":201,\"params\":{},\"rent\":1988.0,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-10-12 10:30:52\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-12 10:30:52', 13);
INSERT INTO `sys_oper_log` VALUES (372, '车辆信息', 1, 'com.ruoyi.project.system.controller.CarInfoController.add()', 'POST', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brandId\":3,\"carId\":7,\"carImgs\":\"/profile/upload/2023/10/12/05e21e810c57495c8e589356a6e6afa8~820x0_20231012104718A001.png\",\"carName\":\"探岳X 2020款 330TSI 两驱尊贵智联版\",\"carTypeId\":1,\"createTime\":\"2023-10-12 10:47:32\",\"deptId\":201,\"params\":{},\"rent\":500.0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-12 10:47:33', 279);
INSERT INTO `sys_oper_log` VALUES (373, '车辆信息', 1, 'com.ruoyi.project.system.controller.CarInfoController.add()', 'POST', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brandId\":3,\"carId\":8,\"carImgs\":\"/profile/upload/2023/10/12/b1235f037a93481295bc646d3d6f930c~1850x0_20231012104802A002.png\",\"carName\":\"高尔夫 2021款 380TSI DSG GTI\",\"carTypeId\":2,\"createTime\":\"2023-10-12 10:48:17\",\"deptId\":201,\"params\":{},\"rent\":300.0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-12 10:48:17', 18);
INSERT INTO `sys_oper_log` VALUES (374, '车辆信息', 1, 'com.ruoyi.project.system.controller.CarInfoController.add()', 'POST', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brandId\":3,\"carId\":9,\"carImgs\":\"/profile/upload/2023/10/12/a1d4dd6524674a91ad2df29bd91ade78~820x0_20231012104855A003.png\",\"carName\":\"大众CC 2020款 330TSI 魅颜版 国VI\",\"carTypeId\":2,\"createTime\":\"2023-10-12 10:48:59\",\"deptId\":202,\"params\":{},\"rent\":266.0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-12 10:48:59', 9);
INSERT INTO `sys_oper_log` VALUES (375, '车辆信息', 1, 'com.ruoyi.project.system.controller.CarInfoController.add()', 'POST', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brandId\":5,\"carId\":10,\"carImgs\":\"/profile/upload/2023/10/12/1797fa24094445eebe933ae0e7c08b85~820x0_20231012105013A004.png\",\"carName\":\"冠道 2020款 370 TURBO 9AT 至尊版 AWD\",\"carTypeId\":1,\"createTime\":\"2023-10-12 10:50:18\",\"deptId\":201,\"params\":{},\"rent\":678.0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-12 10:50:18', 10);
INSERT INTO `sys_oper_log` VALUES (376, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brand\":{\"brandId\":4,\"brandName\":\"奥迪\",\"createBy\":\"\",\"createTime\":\"2023-09-12 16:27:18\",\"params\":{},\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-09-17 19:50:11\"},\"brandId\":4,\"carDes\":\"奥迪A6L\",\"carId\":2,\"carImgs\":\"/profile/upload/2023/09/12/audi-A6L-1_20230912162657A001.jpg,/profile/upload/2024/01/03/audi-A6L-1_20240103101306A001.jpg\",\"carName\":\"奥迪A6L\",\"carType\":{\"carTypeId\":2,\"carTypeName\":\"轿车\",\"createBy\":\"\",\"createTime\":\"2023-09-12 16:27:18\",\"params\":{},\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-09-17 19:50:11\"},\"carTypeId\":2,\"createBy\":\"\",\"createTime\":\"2023-09-12 16:27:18\",\"dept\":{\"children\":[],\"deptId\":202,\"deptName\":\"福田区门店\",\"params\":{}},\"deptId\":202,\"params\":{},\"rent\":1500.0,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-01-03 10:13:09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-03 10:13:09', 54);
INSERT INTO `sys_oper_log` VALUES (377, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brand\":{\"brandId\":10,\"brandName\":\"福特\",\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"params\":{},\"status\":\"3\",\"updateBy\":\"\",\"updateTime\":\"2023-09-24 20:18:27\"},\"brandId\":10,\"carDes\":\"Mustang超级跑车\",\"carId\":1,\"carImgs\":\"/profile/upload/2023/09/12/Mustang-1_20230912140838A001.jpg\",\"carName\":\"Mustang\",\"carType\":{\"carTypeId\":4,\"carTypeName\":\"超跑\",\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"params\":{},\"status\":\"3\",\"updateBy\":\"\",\"updateTime\":\"2023-09-24 20:18:27\"},\"carTypeId\":4,\"createBy\":\"\",\"createTime\":\"2023-09-12 11:08:42\",\"dept\":{\"children\":[],\"deptId\":201,\"deptName\":\"南山区门店\",\"params\":{}},\"deptId\":201,\"params\":{},\"rent\":5200.0,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-01-04 08:50:11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-04 08:50:11', 45);
INSERT INTO `sys_oper_log` VALUES (378, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brand\":{\"brandId\":4,\"brandName\":\"奥迪\",\"createBy\":\"\",\"createTime\":\"2023-09-12 16:27:18\",\"params\":{},\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-01-03 10:13:09\"},\"brandId\":4,\"carDes\":\"奥迪A6L\",\"carId\":2,\"carImgs\":\"/profile/upload/2023/09/12/audi-A6L-1_20230912162657A001.jpg,/profile/upload/2024/01/05/Mustang-1_20240105110358A001.jpg\",\"carName\":\"奥迪A6L\",\"carType\":{\"carTypeId\":2,\"carTypeName\":\"轿车\",\"createBy\":\"\",\"createTime\":\"2023-09-12 16:27:18\",\"params\":{},\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-01-03 10:13:09\"},\"carTypeId\":2,\"createBy\":\"\",\"createTime\":\"2023-09-12 16:27:18\",\"dept\":{\"children\":[],\"deptId\":202,\"deptName\":\"福田区门店\",\"params\":{}},\"deptId\":202,\"params\":{},\"rent\":1500.0,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-01-05 11:03:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-05 11:03:59', 59);
INSERT INTO `sys_oper_log` VALUES (379, '车辆信息', 1, 'com.ruoyi.project.system.controller.CarInfoController.add()', 'POST', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brandId\":4,\"carDes\":\"2024款 Coupe 40 TFSI 时尚动感型\",\"carId\":11,\"carImgs\":\"/profile/upload/2024/01/05/c5164493ffd1ddb1c2f7152159e0c303~512x0_20240105154551A001.jpg\",\"carName\":\"奥迪 2024款 Coupe 40 TFSI 时尚动感型\",\"carTypeId\":2,\"createTime\":\"2024-01-05 15:45:56\",\"deptId\":201,\"params\":{},\"rent\":1500.0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-05 15:45:57', 57);
INSERT INTO `sys_oper_log` VALUES (380, '品牌信息', 1, 'com.ruoyi.project.system.controller.BrandInfoController.add()', 'POST', 1, 'admin', NULL, '/system/brand', '127.0.0.1', '内网IP', '{\"brandId\":12,\"brandName\":\"凯迪拉克\",\"createTime\":\"2024-01-05 15:47:43\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-05 15:47:43', 12);
INSERT INTO `sys_oper_log` VALUES (381, '车辆信息', 1, 'com.ruoyi.project.system.controller.CarInfoController.add()', 'POST', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brandId\":12,\"carDes\":\"2024款 28T 尊贵型\",\"carId\":12,\"carImgs\":\"/profile/upload/2024/01/05/04d1f41ebba4ea8eaf934d96a483d2a1~512x0_20240105154841A002.jpg\",\"carName\":\"凯迪拉克 CT5 2024款 28T 尊贵型\",\"carTypeId\":2,\"createTime\":\"2024-01-05 15:48:46\",\"deptId\":202,\"params\":{},\"rent\":500.0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-05 15:48:46', 5);
INSERT INTO `sys_oper_log` VALUES (382, '车辆信息', 2, 'com.ruoyi.project.system.controller.CarInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/carInfo', '127.0.0.1', '内网IP', '{\"brand\":{\"brandId\":1,\"brandName\":\"奔驰\",\"createBy\":\"\",\"createTime\":\"2023-10-12 10:19:43\",\"params\":{},\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-10-12 10:30:26\"},\"brandId\":1,\"carId\":5,\"carImgs\":\"/profile/upload/2023/10/12/9c05ef2fea8a4266a80d3f7fc748ce2a~820x0_20231012101938A003.png\",\"carName\":\"奔驰GLE 2022款 GLE 350 4MATIC 时尚型\",\"carType\":{\"carTypeId\":2,\"carTypeName\":\"轿车\",\"createBy\":\"\",\"createTime\":\"2023-10-12 10:19:43\",\"params\":{},\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-10-12 10:30:26\"},\"carTypeId\":1,\"createBy\":\"\",\"createTime\":\"2023-10-12 10:19:43\",\"dept\":{\"children\":[],\"deptId\":201,\"deptName\":\"南山区门店\",\"params\":{}},\"deptId\":201,\"params\":{},\"rent\":1900.0,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-01-05 15:55:27\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-05 15:55:27', 13);
INSERT INTO `sys_oper_log` VALUES (383, '订单信息', 3, 'com.ruoyi.project.system.controller.OrderInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/system/order/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-05 16:15:11', 29);
INSERT INTO `sys_oper_log` VALUES (384, '订单信息', 1, 'com.ruoyi.project.system.controller.OrderInfoController.add()', 'POST', 1, 'admin', NULL, '/system/order', '127.0.0.1', '内网IP', '{\"brandId\":4,\"carId\":2,\"carTypeId\":2,\"createTime\":\"2024-01-05 21:04:41\",\"deptId\":202,\"endTime\":\"2024-01-06\",\"params\":{},\"payStatus\":\"0\",\"priceDay\":1500,\"priceTotal\":1500,\"rentalDay\":1,\"status\":\"3\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\Work\\Other\\004 4500 document + project\\Gallop\\target\\classes\\mybatis\\system\\OrderInfoMapper.xml]\r\n### The error may involve com.ruoyi.project.system.mapper.OrderInfoMapper.insertOrderInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into order_info          ( car_id,                          brand_id,             car_type_id,             dept_id,             rental_day,             end_time,             price_day,             price_total,             pay_status,             status,                          create_time )           values ( ?,                          ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2024-01-05 21:04:41', 140);
INSERT INTO `sys_oper_log` VALUES (385, '订单信息', 2, 'com.ruoyi.project.system.controller.OrderInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/order', '127.0.0.1', '内网IP', '{\"brand\":{\"brandId\":10,\"brandName\":\"福特\",\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:38:26\",\"params\":{},\"status\":\"3\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-05 21:38:27\"},\"brandId\":10,\"carId\":1,\"carInfo\":{\"brandId\":10,\"carId\":1,\"carImgs\":\"/profile/upload/2023/09/12/Mustang-1_20230912140838A001.jpg\",\"carName\":\"Mustang\",\"carTypeId\":4,\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:38:26\",\"deptId\":201,\"params\":{},\"rent\":0.0,\"status\":\"3\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-05 21:38:27\"},\"carType\":{\"carTypeId\":4,\"carTypeName\":\"超跑\",\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:38:26\",\"params\":{},\"status\":\"3\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-05 21:38:27\"},\"carTypeId\":4,\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:38:26\",\"dept\":{\"children\":[],\"deptId\":201,\"deptName\":\"南山区门店\",\"params\":{}},\"deptId\":201,\"endTime\":\"2024-01-06\",\"orderId\":6,\"params\":{},\"payStatus\":\"0\",\"priceDay\":5200,\"priceTotal\":5200,\"rentalDay\":1,\"status\":\"5\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-05 21:39:24\",\"user\":{\"admin\":false,\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:38:26\",\"deptId\":201,\"nickName\":\"测试用户\",\"params\":{},\"status\":\"3\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-05 21:38:27\"}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-05 21:39:24', 34);
INSERT INTO `sys_oper_log` VALUES (386, '订单信息', 2, 'com.ruoyi.project.system.controller.OrderInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/order', '127.0.0.1', '内网IP', '{\"brand\":{\"brandId\":10,\"brandName\":\"福特\",\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:38:26\",\"params\":{},\"status\":\"5\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-05 21:39:24\"},\"brandId\":10,\"carId\":1,\"carInfo\":{\"brandId\":10,\"carId\":1,\"carImgs\":\"/profile/upload/2023/09/12/Mustang-1_20230912140838A001.jpg\",\"carName\":\"Mustang\",\"carTypeId\":4,\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:38:26\",\"deptId\":201,\"params\":{},\"rent\":0.0,\"status\":\"5\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-05 21:39:24\"},\"carType\":{\"carTypeId\":4,\"carTypeName\":\"超跑\",\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:38:26\",\"params\":{},\"status\":\"5\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-05 21:39:24\"},\"carTypeId\":4,\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:38:26\",\"dept\":{\"children\":[],\"deptId\":201,\"deptName\":\"南山区门店\",\"params\":{}},\"deptId\":201,\"endTime\":\"2024-01-06\",\"orderId\":6,\"params\":{},\"payStatus\":\"0\",\"priceDay\":5200,\"priceTotal\":5200,\"rentalDay\":1,\"status\":\"3\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-05 21:39:39\",\"user\":{\"admin\":false,\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:38:26\",\"deptId\":201,\"nickName\":\"测试用户\",\"params\":{},\"status\":\"5\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-05 21:39:24\"}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-05 21:39:39', 11);
INSERT INTO `sys_oper_log` VALUES (387, '用户认证审核', 2, 'com.ruoyi.project.system.controller.SysUserAuditController.edit()', 'PUT', 1, 'admin', NULL, '/system/audit', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"idCardImgs\":\"/profile/upload/2023/09/15/12_20230915195545A002.jpg,/profile/upload/2023/09/15/bg2_20230915195612A004.jpg\",\"params\":{},\"rejectReason\":\"\",\"status\":\"3\",\"updateBy\":\"\",\"updateTime\":\"2024-01-05 21:43:08\",\"user\":{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"测试用户\",\"params\":{},\"status\":\"3\",\"updateBy\":\"\",\"updateTime\":\"2023-09-15 20:26:52\",\"userId\":108,\"userName\":\"customer\"},\"userAuditId\":2,\"userAuditName\":\"测试顾客\",\"userId\":108,\"userIdCard\":\"6666677777888889999\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-05 21:43:08', 16);
INSERT INTO `sys_oper_log` VALUES (388, '订单信息', 2, 'com.ruoyi.project.system.controller.OrderInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/order', '127.0.0.1', '内网IP', '{\"brand\":{\"brandId\":10,\"brandName\":\"福特\",\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:42:32\",\"params\":{},\"status\":\"3\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-05 21:42:32\"},\"brandId\":10,\"carId\":1,\"carInfo\":{\"brandId\":10,\"carDes\":\"Mustang超级跑车\",\"carId\":1,\"carImgs\":\"/profile/upload/2023/09/12/Mustang-1_20230912140838A001.jpg\",\"carName\":\"Mustang\",\"carTypeId\":4,\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:42:32\",\"deptId\":201,\"params\":{},\"rent\":0.0,\"status\":\"3\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-05 21:42:32\"},\"carType\":{\"carTypeId\":4,\"carTypeName\":\"超跑\",\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:42:32\",\"params\":{},\"status\":\"3\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-05 21:42:32\"},\"carTypeId\":4,\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:42:32\",\"dept\":{\"children\":[],\"deptId\":201,\"deptName\":\"南山区门店\",\"params\":{},\"phone\":\"15888888888\"},\"deptId\":201,\"endTime\":\"2024-01-06\",\"orderId\":7,\"params\":{},\"payStatus\":\"0\",\"priceDay\":5200,\"priceTotal\":5200,\"rentalDay\":1,\"status\":\"5\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-08 16:25:09\",\"user\":{\"admin\":false,\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:42:32\",\"deptId\":201,\"nickName\":\"测试用户\",\"params\":{},\"status\":\"3\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-05 21:42:32\"}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-08 16:25:09', 52);
INSERT INTO `sys_oper_log` VALUES (389, '订单信息', 2, 'com.ruoyi.project.system.controller.OrderInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/order', '127.0.0.1', '内网IP', '{\"brand\":{\"brandId\":10,\"brandName\":\"福特\",\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:42:32\",\"params\":{},\"status\":\"5\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-08 16:25:10\"},\"brandId\":10,\"carId\":1,\"carInfo\":{\"brandId\":10,\"carDes\":\"Mustang超级跑车\",\"carId\":1,\"carImgs\":\"/profile/upload/2023/09/12/Mustang-1_20230912140838A001.jpg\",\"carName\":\"Mustang\",\"carTypeId\":4,\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:42:32\",\"deptId\":201,\"params\":{},\"rent\":0.0,\"status\":\"5\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-08 16:25:10\"},\"carType\":{\"carTypeId\":4,\"carTypeName\":\"超跑\",\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:42:32\",\"params\":{},\"status\":\"5\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-08 16:25:10\"},\"carTypeId\":4,\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:42:32\",\"dept\":{\"children\":[],\"deptId\":201,\"deptName\":\"南山区门店\",\"params\":{},\"phone\":\"15888888888\"},\"deptId\":201,\"endTime\":\"2024-01-06\",\"orderId\":7,\"params\":{},\"payStatus\":\"0\",\"priceDay\":5200,\"priceTotal\":5200,\"rentalDay\":1,\"status\":\"4\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-08 16:25:27\",\"user\":{\"admin\":false,\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:42:32\",\"deptId\":201,\"nickName\":\"测试用户\",\"params\":{},\"status\":\"5\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-08 16:25:10\"}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-08 16:25:27', 8);
INSERT INTO `sys_oper_log` VALUES (390, '订单信息', 2, 'com.ruoyi.project.system.controller.OrderInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/order', '127.0.0.1', '内网IP', '{\"brand\":{\"brandId\":10,\"brandName\":\"福特\",\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:42:32\",\"params\":{},\"status\":\"4\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-08 16:25:27\"},\"brandId\":10,\"carId\":1,\"carInfo\":{\"brandId\":10,\"carDes\":\"Mustang超级跑车\",\"carId\":1,\"carImgs\":\"/profile/upload/2023/09/12/Mustang-1_20230912140838A001.jpg\",\"carName\":\"Mustang\",\"carTypeId\":4,\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:42:32\",\"deptId\":201,\"params\":{},\"rent\":0.0,\"status\":\"4\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-08 16:25:27\"},\"carType\":{\"carTypeId\":4,\"carTypeName\":\"超跑\",\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:42:32\",\"params\":{},\"status\":\"4\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-08 16:25:27\"},\"carTypeId\":4,\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:42:32\",\"dept\":{\"children\":[],\"deptId\":201,\"deptName\":\"南山区门店\",\"params\":{},\"phone\":\"15888888888\"},\"deptId\":201,\"endTime\":\"2024-01-06\",\"orderId\":7,\"params\":{},\"payStatus\":\"0\",\"priceDay\":5200,\"priceTotal\":5200,\"rentalDay\":1,\"status\":\"3\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-08 16:25:45\",\"user\":{\"admin\":false,\"createBy\":\"customer\",\"createTime\":\"2024-01-05 21:42:32\",\"deptId\":201,\"nickName\":\"测试用户\",\"params\":{},\"status\":\"4\",\"updateBy\":\"customer\",\"updateTime\":\"2024-01-08 16:25:27\"}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-08 16:25:45', 10);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-09-11 11:57:45', '', NULL, '');
INSERT INTO `sys_post` VALUES (5, 'cto', '系统管理员', 2, '0', 'admin', '2023-09-11 13:30:27', 'admin', '2023-09-11 13:32:05', '系统管理员');
INSERT INTO `sys_post` VALUES (6, 'store-boss', '门店店长', 3, '0', 'admin', '2023-09-11 13:32:01', '', NULL, '门店店长');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-09-11 11:57:45', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '门店管理员', 'store', 3, '3', 1, 1, '0', '0', 'admin', '2023-09-11 11:57:45', 'admin', '2023-09-17 19:45:04', '门店管理员');
INSERT INTO `sys_role` VALUES (100, '系统管理员', 'system', 2, '4', 1, 1, '0', '0', 'admin', '2023-09-11 13:23:21', 'admin', '2023-09-15 20:28:02', '系统管理员');
INSERT INTO `sys_role` VALUES (101, '租车用户', 'customer', 3, '1', 1, 1, '0', '0', 'admin', '2023-09-14 15:15:36', '', NULL, '租车用户角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2012);
INSERT INTO `sys_role_menu` VALUES (2, 2013);
INSERT INTO `sys_role_menu` VALUES (2, 2014);
INSERT INTO `sys_role_menu` VALUES (2, 2018);
INSERT INTO `sys_role_menu` VALUES (2, 2019);
INSERT INTO `sys_role_menu` VALUES (2, 2020);
INSERT INTO `sys_role_menu` VALUES (2, 2021);
INSERT INTO `sys_role_menu` VALUES (2, 2026);
INSERT INTO `sys_role_menu` VALUES (2, 2027);
INSERT INTO `sys_role_menu` VALUES (2, 2028);
INSERT INTO `sys_role_menu` VALUES (2, 2029);
INSERT INTO `sys_role_menu` VALUES (2, 2030);
INSERT INTO `sys_role_menu` VALUES (2, 2031);
INSERT INTO `sys_role_menu` VALUES (2, 2032);
INSERT INTO `sys_role_menu` VALUES (2, 2033);
INSERT INTO `sys_role_menu` VALUES (2, 2034);
INSERT INTO `sys_role_menu` VALUES (2, 2035);
INSERT INTO `sys_role_menu` VALUES (2, 2036);
INSERT INTO `sys_role_menu` VALUES (2, 2037);
INSERT INTO `sys_role_menu` VALUES (2, 2044);
INSERT INTO `sys_role_menu` VALUES (2, 2045);
INSERT INTO `sys_role_menu` VALUES (2, 2046);
INSERT INTO `sys_role_menu` VALUES (2, 2047);
INSERT INTO `sys_role_menu` VALUES (2, 2048);
INSERT INTO `sys_role_menu` VALUES (2, 2049);
INSERT INTO `sys_role_menu` VALUES (100, 2);
INSERT INTO `sys_role_menu` VALUES (100, 100);
INSERT INTO `sys_role_menu` VALUES (100, 103);
INSERT INTO `sys_role_menu` VALUES (100, 109);
INSERT INTO `sys_role_menu` VALUES (100, 1000);
INSERT INTO `sys_role_menu` VALUES (100, 1001);
INSERT INTO `sys_role_menu` VALUES (100, 1002);
INSERT INTO `sys_role_menu` VALUES (100, 1003);
INSERT INTO `sys_role_menu` VALUES (100, 1004);
INSERT INTO `sys_role_menu` VALUES (100, 1005);
INSERT INTO `sys_role_menu` VALUES (100, 1006);
INSERT INTO `sys_role_menu` VALUES (100, 1016);
INSERT INTO `sys_role_menu` VALUES (100, 1017);
INSERT INTO `sys_role_menu` VALUES (100, 1018);
INSERT INTO `sys_role_menu` VALUES (100, 1019);
INSERT INTO `sys_role_menu` VALUES (100, 1046);
INSERT INTO `sys_role_menu` VALUES (100, 1047);
INSERT INTO `sys_role_menu` VALUES (100, 1048);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2010);
INSERT INTO `sys_role_menu` VALUES (100, 2011);
INSERT INTO `sys_role_menu` VALUES (100, 2012);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2017);
INSERT INTO `sys_role_menu` VALUES (100, 2018);
INSERT INTO `sys_role_menu` VALUES (100, 2019);
INSERT INTO `sys_role_menu` VALUES (100, 2020);
INSERT INTO `sys_role_menu` VALUES (100, 2021);
INSERT INTO `sys_role_menu` VALUES (100, 2022);
INSERT INTO `sys_role_menu` VALUES (100, 2023);
INSERT INTO `sys_role_menu` VALUES (100, 2024);
INSERT INTO `sys_role_menu` VALUES (100, 2025);
INSERT INTO `sys_role_menu` VALUES (100, 2026);
INSERT INTO `sys_role_menu` VALUES (100, 2027);
INSERT INTO `sys_role_menu` VALUES (100, 2028);
INSERT INTO `sys_role_menu` VALUES (100, 2029);
INSERT INTO `sys_role_menu` VALUES (100, 2030);
INSERT INTO `sys_role_menu` VALUES (100, 2031);
INSERT INTO `sys_role_menu` VALUES (100, 2032);
INSERT INTO `sys_role_menu` VALUES (100, 2033);
INSERT INTO `sys_role_menu` VALUES (100, 2034);
INSERT INTO `sys_role_menu` VALUES (100, 2035);
INSERT INTO `sys_role_menu` VALUES (100, 2036);
INSERT INTO `sys_role_menu` VALUES (100, 2037);
INSERT INTO `sys_role_menu` VALUES (100, 2038);
INSERT INTO `sys_role_menu` VALUES (100, 2039);
INSERT INTO `sys_role_menu` VALUES (100, 2040);
INSERT INTO `sys_role_menu` VALUES (100, 2041);
INSERT INTO `sys_role_menu` VALUES (100, 2042);
INSERT INTO `sys_role_menu` VALUES (100, 2043);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 100, 'admin', '驰行董事长', '00', 'chixing@gallop.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-01-08 16:24:57', 'admin', '2023-09-11 11:57:45', '', '2024-01-08 16:24:57', '管理员');
INSERT INTO `sys_user` VALUES (100, 201, 'nanshan', '南山区店主', '00', 'nanshan@gallop.com', '15788888888', '0', '', '$2a$10$2bGJdD.s4LnopnaBbEbRsucIOwGC0fPCoRRVEPx9MxpRoGqobsnaO', '0', '0', '127.0.0.1', '2024-01-05 16:12:57', 'admin', '2023-09-11 13:28:10', 'admin', '2024-01-05 16:12:57', '南山区店主');
INSERT INTO `sys_user` VALUES (101, 100, 'system', '系统管理员', '00', 'system@gallop.com', '16677778888', '2', '', '$2a$10$H3XEV064c.Q/JAoB26XgXOXX79iql..ujdDgKJVOf/jP1JGkOCA4.', '0', '0', '127.0.0.1', '2023-09-24 19:23:33', 'admin', '2023-09-11 13:36:43', 'admin', '2023-09-24 19:23:32', '系统管理员');
INSERT INTO `sys_user` VALUES (102, 202, 'futian', '福田区门店店长', '00', 'futian@gallop.com', '13377778888', '1', '', '$2a$10$39pB8/T/RxHrzSIFZdUXYOHS9jDxksaFLDRSZruRbgByKZamqjEUy', '0', '0', '127.0.0.1', '2023-09-17 19:45:16', 'admin', '2023-09-11 21:37:57', '', '2023-09-17 19:45:16', '福田区门店店长');
INSERT INTO `sys_user` VALUES (108, NULL, 'customer', '客户', '00', '', '13355566667', '0', '', '$2a$10$z5KJPGxcOnfUtUEXaX1AveBeEzZU6XxqiaucQEBngXNS711mQcgqq', '0', '0', '127.0.0.1', '2024-01-09 13:26:11', 'admin', '2023-09-14 15:56:41', '', '2024-01-09 13:26:10', NULL);
INSERT INTO `sys_user` VALUES (110, NULL, 'test', '客户', '00', '', '13355566662', '0', '', '$2a$10$Ciz2hAtAVvjjducDInxyw.IlM45i29vYyMXxVbJe1HeaCugHiNQse', '0', '0', '127.0.0.1', '2024-01-09 11:08:56', 'test', '2024-01-09 11:08:46', '', '2024-01-09 11:11:05', NULL);

-- ----------------------------
-- Table structure for sys_user_audit
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_audit`;
CREATE TABLE `sys_user_audit`  (
  `user_audit_id` int NOT NULL AUTO_INCREMENT COMMENT '用户审核表编号',
  `user_id` int NOT NULL COMMENT '用户编号',
  `user_id_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户身份证号',
  `user_audit_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户审核名字',
  `id_card_imgs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户身份证照片信息',
  `reject_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '驳回理由',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户审核状态（0未审核 1审核中 2驳回审核 3审核通过）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_audit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_audit
-- ----------------------------
INSERT INTO `sys_user_audit` VALUES (2, 108, '6666677777888889999', '测试顾客', '/profile/upload/2023/09/15/12_20230915195545A002.jpg,/profile/upload/2023/09/15/bg2_20230915195612A004.jpg', '', '3', 'admin', NULL, '', '2024-01-05 21:43:08', NULL);
INSERT INTO `sys_user_audit` VALUES (3, 110, NULL, NULL, NULL, NULL, '0', 'test', NULL, '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (100, 6);
INSERT INTO `sys_user_post` VALUES (101, 5);
INSERT INTO `sys_user_post` VALUES (102, 6);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (100, 2);
INSERT INTO `sys_user_role` VALUES (101, 100);
INSERT INTO `sys_user_role` VALUES (102, 2);
INSERT INTO `sys_user_role` VALUES (108, 101);
INSERT INTO `sys_user_role` VALUES (110, 101);

SET FOREIGN_KEY_CHECKS = 1;
