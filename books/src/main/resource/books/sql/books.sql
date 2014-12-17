/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50703
Source Host           : localhost:3307
Source Database       : books

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2014-12-02 10:27:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `name1` varchar(200) DEFAULT NULL COMMENT '副名',
  `name2` varchar(200) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL COMMENT '封面图片',
  `img1` varchar(200) DEFAULT NULL COMMENT '封面图片1',
  `img2` varchar(200) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `version` varchar(100) DEFAULT NULL COMMENT '版本',
  `press` varchar(100) DEFAULT NULL COMMENT '出版社',
  `barcode` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for book_type
-- ----------------------------
DROP TABLE IF EXISTS `book_type`;
CREATE TABLE `book_type` (
  `id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL COMMENT '一级标签id',
  `type_id2` int(11) DEFAULT NULL COMMENT '二级标签id',
  `state` tinyint(4) DEFAULT '0' COMMENT '关系状态，默认是正确的0，错误的归类关系置为-1',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for book_user
-- ----------------------------
DROP TABLE IF EXISTS `book_user`;
CREATE TABLE `book_user` (
  `id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL COMMENT '会员状态',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_borrow
-- ----------------------------
DROP TABLE IF EXISTS `user_borrow`;
CREATE TABLE `user_borrow` (
  `id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `from_user_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `state` tinyint(1) DEFAULT '0' COMMENT '借阅状态',
  `days` int(4) DEFAULT '0' COMMENT '借阅天数',
  `description` varchar(100) DEFAULT NULL,
  `meet_address` varchar(200) DEFAULT NULL,
  `post_address` varchar(255) DEFAULT NULL COMMENT '邮寄地址',
  `post_code` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
