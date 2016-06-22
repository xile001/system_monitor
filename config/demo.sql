/*
Navicat MySQL Data Transfer
Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2016-06-22 09:32:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cpu_use_log
-- ----------------------------
DROP TABLE IF EXISTS `cpu_use_log`;
CREATE TABLE `cpu_use_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip32` varchar(20) NOT NULL COMMENT 'ip 地址',
  `ip64` varchar(30) NOT NULL,
  `minute` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '每分钟',
  `val` varchar(200) NOT NULL COMMENT '值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for disk_use_log
-- ----------------------------
DROP TABLE IF EXISTS `disk_use_log`;
CREATE TABLE `disk_use_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ip32` varchar(20) NOT NULL DEFAULT '0' COMMENT 'ip地址',
  `ip64` varchar(30) NOT NULL,
  `minute` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分钟',
  `filesystem_name` varchar(100) NOT NULL COMMENT '文件系统名称',
  `blocks` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '容量 k',
  `used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已使用 k',
  `available` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '剩余 k',
  `use` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '使用比例%',
  `mounted_on` varchar(50) NOT NULL COMMENT '挂载目录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


-- ----------------------------
-- Table structure for load_average_log
-- ----------------------------
DROP TABLE IF EXISTS `load_average_log`;
CREATE TABLE `load_average_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip32` varchar(20) NOT NULL COMMENT 'ip 地址',
  `ip64` varchar(30) NOT NULL,
  `minute` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '每分钟',
  `val` varchar(200) NOT NULL DEFAULT '0' COMMENT '系统负载',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for memory_use_log
-- ----------------------------
DROP TABLE IF EXISTS `memory_use_log`;
CREATE TABLE `memory_use_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ip32` varchar(20) NOT NULL DEFAULT '0' COMMENT 'ip地址',
  `ip64` varchar(30) NOT NULL,
  `minute` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分钟',
  `val` varchar(200) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for network_conn_log
-- ----------------------------
DROP TABLE IF EXISTS `network_conn_log`;
CREATE TABLE `network_conn_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip32` varchar(20) NOT NULL COMMENT 'ip地址',
  `ip64` varchar(30) NOT NULL COMMENT 'ip地址',
  `minute` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分钟',
  `connection` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '连接数',
  `address` varchar(40) NOT NULL COMMENT '地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for process_use_log
-- ----------------------------
DROP TABLE IF EXISTS `process_use_log`;
CREATE TABLE `process_use_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip32` varchar(20) NOT NULL COMMENT 'ip 地址',
  `ip64` varchar(30) NOT NULL,
  `minute` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '每分钟',
  `val` varchar(200) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for swap_use_log
-- ----------------------------
DROP TABLE IF EXISTS `swap_use_log`;
CREATE TABLE `swap_use_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip32` varchar(20) NOT NULL COMMENT 'ip 地址',
  `ip64` varchar(30) NOT NULL,
  `minute` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '每分钟',
  `val` varchar(200) NOT NULL COMMENT '值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for traffic_use_log
-- ----------------------------
DROP TABLE IF EXISTS `traffic_use_log`;
CREATE TABLE `traffic_use_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ip32` varchar(20) NOT NULL DEFAULT '0' COMMENT 'ip地址',
  `ip64` varchar(30) NOT NULL,
  `minute` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分钟',
  `rx_bytes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '接收总量',
  `rx_packets` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '接收量',
  `rx_err` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '接收错误量',
  `rx_drop` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '接收丢弃量',
  `tx_bytes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送总量',
  `tx_packets` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送量',
  `tx_err` int(10) unsigned NOT NULL COMMENT '发送错误量',
  `tx_drop` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送丢弃量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;