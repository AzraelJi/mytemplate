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

 Date: 21/01/2020 17:00:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for etc_gantry_license_plate_recognition_data
-- ----------------------------
DROP TABLE IF EXISTS `etc_gantry_license_plate_recognition_data`;
CREATE TABLE `etc_gantry_license_plate_recognition_data`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gantry_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '门架编号',
  `related_pic_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关联图片流水号 车头/车尾关联图片流水号，以“|”分隔 否',
  `bin_image_size` int(11) NULL DEFAULT NULL COMMENT '二值化图片大小	Integer	单位：B，BMP格式	否',
  `face_feature_code` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '人脸特征码和算法版本号	String	不超过1050个字符。人脸识别特征码和算法版本号，使用“|”分隔	否',
  `reliability` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '车牌可信度	String	%，带两位小数	是',
  `msg_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '通知消息号	String	默认无本字段，表示为主动上传；若有此字段，则填写接收到的重传消息号。',
  `gantry_hex` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ETC门架Hex值	String	当前门架的hex值	是',
  `identify_type` int(11) NULL DEFAULT NULL COMMENT '识别车型	Integer		否',
  `gantry_order_num` int(11) NULL DEFAULT NULL COMMENT '门架顺序号	Integer	方向（1上行，2下行）+序号（2位），例如：上行：101，102，103；下行：201，202，203	是',
  `match_status` int(11) NULL DEFAULT NULL COMMENT '匹配状态	Integer	0-未处理（默认）；1-有配结果；2-无匹配结果	是',
  `valid_status` int(11) NULL DEFAULT NULL COMMENT '去重状态	Integer	0-未处理（默认）；1-有效数据；2-无效(重复)数据	是',
  `license_image_size` int(11) NULL DEFAULT NULL COMMENT '车牌图片大小	Integer	单位：B，JPEG格式	否',
  `vehicle_model` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '车辆品牌型号	String	自定义，由车牌识别设备上送。例如：宝马A4L	否',
  `image_size` decimal(20, 2) NULL DEFAULT NULL COMMENT '图片大小	Integer	单位：B，JPEG格式	是',
  `lane_num` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '物理车道编码	String	由行驶方向内侧向外顺序递增，跨多车道时采用组合编号，如：1、2、3、123等	是',
  `pic_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '车牌识别流水号',
  `shoot_position` int(11) NULL DEFAULT NULL COMMENT '拍摄位置	Integer	1-车头;2-车尾	是',
  `vehicle_color` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '车身颜色	String		否',
  `station_dBTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '门架后台入库时间	String	YYYY-MM-DDTHH:mm:ss	是',
  `vehicle_speed` int(11) NULL DEFAULT NULL COMMENT '车辆速度	Integer	单位：千米/小时	否',
  `station_valid_time` datetime(0) NULL DEFAULT '0000-00-00 00:00:00' COMMENT '门架后台去重时间	String	YYYY-MM-DDTHH:mm:ss	是',
  `verify_code` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '校验码	String	对车牌识别流水的关键字段组合生成的CRC校验码	是',
  `station_match_time` datetime(0) NULL DEFAULT '0000-00-00 00:00:00' COMMENT '门架后台匹配时间	String	YYYY-MM-DDTHH:mm:ss	是',
  `vehicle_plate` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '识别车牌	String	车牌号码+间隔符+车牌颜色，间隔符：“_”',
  `hour_batch_no` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '小时批次号	String	按小时自增，不能回退。例如：2019080716	是',
  `deal_status` int(11) NULL DEFAULT NULL COMMENT '处理状态	Integer	0-未处理（默认）；1-已处理	是',
  `station_deal_time` datetime(0) NULL DEFAULT '0000-00-00 00:00:00' COMMENT '门架后台处理时间	String	YYYY-MM-DDTHH:mm:ss	是',
  `veh_feature_code` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '车脸识别特征码和算法版本号	String	不超过2050个字符。车脸识别特征码和算法版本号，使用“|”分隔	',
  `drive_dir` int(11) NULL DEFAULT NULL COMMENT '行驶方向	Integer	1-上行，2-下行	是',
  `pic_time` datetime(0) NULL DEFAULT '0000-00-00 00:00:00' COMMENT '抓拍时间 	String	YYYY-MM-DDTHH:mm:ss	是',
  `all_related_pic_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '全部关联图片流水号	String	全部的关联图片流水号，以“|”分隔	否',
  `camera_num` int(11) NULL DEFAULT NULL COMMENT '车牌识别编号	Integer	车牌识别编号（101~299），1位拍摄位置（1-车头，2-车尾）+2位相机序号（01-99）	是',
  `trade_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '计费交易编号	String	匹配后的计费交易编号，门架编号+交易批次号+批次内流水号（6位）,有匹配结果时必填	否',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_etc_gantry_license`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ETC门架车牌识别数据表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
