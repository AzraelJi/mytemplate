/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.31.206
 Source Server Type    : MySQL
 Source Server Version : 50645
 Source Host           : 192.168.31.206:33391
 Source Schema         : botgodata

 Target Server Type    : MySQL
 Target Server Version : 50645
 File Encoding         : 65001

 Date: 21/01/2020 16:59:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for etc_license_plate_recognition_hour_batch_data
-- ----------------------------
DROP TABLE IF EXISTS `etc_license_plate_recognition_hour_batch_data`;
CREATE TABLE `etc_license_plate_recognition_hour_batch_data`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ETC门架车牌识别小时批次汇总表主键',
  `collect_date` date NULL DEFAULT NULL COMMENT '统计日期 String  YYYYMMDD	是',
  `collect_hour_batch` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统计小时批次	String	车牌识别数据的小时批次值	是',
  `collect_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门架车牌识别汇总编号	String	门架编号+小时批次号	是',
  `computer_order` int(11) NULL DEFAULT NULL,
  `gantry_id` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门架编号	String	参考编码规则，全网唯一编号	是',
  `msg_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通知消息号	String	默认无本字段，表示为主动上传；若有此字段，则填写接收到的重传消息号。\r\n当业务通知接口请求多条时，同一个消息号内容分多次上传	否',
  `vehicle_data_count` int(11) NULL DEFAULT NULL COMMENT '车牌识别流水数	Integer	车牌识别数据的流水数	是',
  `vehicle_pic_count` int(11) NULL DEFAULT NULL COMMENT '车牌识别图片流水数	Integer	车牌识别图片流水数量	是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据插入时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ETC门架车牌识别小时批次汇总表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
