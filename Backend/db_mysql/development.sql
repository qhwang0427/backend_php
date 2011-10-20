/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : development

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2011-10-20 23:45:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `activities`
-- ----------------------------
DROP TABLE IF EXISTS `activities`;
CREATE TABLE `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of activities
-- ----------------------------

-- ----------------------------
-- Table structure for `activity_message`
-- ----------------------------
DROP TABLE IF EXISTS `activity_message`;
CREATE TABLE `activity_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of activity_message
-- ----------------------------
INSERT INTO `activity_message` VALUES ('1', 'MESSAGE1', '1');

-- ----------------------------
-- Table structure for `apps`
-- ----------------------------
DROP TABLE IF EXISTS `apps`;
CREATE TABLE `apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of apps
-- ----------------------------

-- ----------------------------
-- Table structure for `binds`
-- ----------------------------
DROP TABLE IF EXISTS `binds`;
CREATE TABLE `binds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `action` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of binds
-- ----------------------------

-- ----------------------------
-- Table structure for `charities`
-- ----------------------------
DROP TABLE IF EXISTS `charities`;
CREATE TABLE `charities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `extended_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `logo_grid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of charities
-- ----------------------------

-- ----------------------------
-- Table structure for `checkins`
-- ----------------------------
DROP TABLE IF EXISTS `checkins`;
CREATE TABLE `checkins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `points` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `app_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of checkins
-- ----------------------------

-- ----------------------------
-- Table structure for `checkin_message`
-- ----------------------------
DROP TABLE IF EXISTS `checkin_message`;
CREATE TABLE `checkin_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of checkin_message
-- ----------------------------

-- ----------------------------
-- Table structure for `donations`
-- ----------------------------
DROP TABLE IF EXISTS `donations`;
CREATE TABLE `donations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `points` int(11) DEFAULT NULL,
  `charity_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sponsor_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of donations
-- ----------------------------

-- ----------------------------
-- Table structure for `donation_message`
-- ----------------------------
DROP TABLE IF EXISTS `donation_message`;
CREATE TABLE `donation_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of donation_message
-- ----------------------------

-- ----------------------------
-- Table structure for `effects`
-- ----------------------------
DROP TABLE IF EXISTS `effects`;
CREATE TABLE `effects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `points` int(11) DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `charity_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of effects
-- ----------------------------

-- ----------------------------
-- Table structure for `examples`
-- ----------------------------
DROP TABLE IF EXISTS `examples`;
CREATE TABLE `examples` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `crypted_password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `password_salt` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `persistence_token` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of examples
-- ----------------------------

-- ----------------------------
-- Table structure for `locations`
-- ----------------------------
DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `radius` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `extended_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `business_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of locations
-- ----------------------------

-- ----------------------------
-- Table structure for `mailinglists`
-- ----------------------------
DROP TABLE IF EXISTS `mailinglists`;
CREATE TABLE `mailinglists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of mailinglists
-- ----------------------------

-- ----------------------------
-- Table structure for `newsevents`
-- ----------------------------
DROP TABLE IF EXISTS `newsevents`;
CREATE TABLE `newsevents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caption` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `extended_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of newsevents
-- ----------------------------

-- ----------------------------
-- Table structure for `schema_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of schema_migrations
-- ----------------------------
INSERT INTO `schema_migrations` VALUES ('20110308161716');
INSERT INTO `schema_migrations` VALUES ('20110308162112');
INSERT INTO `schema_migrations` VALUES ('20110308163324');
INSERT INTO `schema_migrations` VALUES ('20110308171157');
INSERT INTO `schema_migrations` VALUES ('20110315172701');
INSERT INTO `schema_migrations` VALUES ('20110316100958');
INSERT INTO `schema_migrations` VALUES ('20110316101207');
INSERT INTO `schema_migrations` VALUES ('20110316101728');
INSERT INTO `schema_migrations` VALUES ('20110316113635');
INSERT INTO `schema_migrations` VALUES ('20110316113713');
INSERT INTO `schema_migrations` VALUES ('20110316123922');
INSERT INTO `schema_migrations` VALUES ('20110323154058');
INSERT INTO `schema_migrations` VALUES ('20110323154552');
INSERT INTO `schema_migrations` VALUES ('20110323154849');
INSERT INTO `schema_migrations` VALUES ('20110328121413');
INSERT INTO `schema_migrations` VALUES ('20110328143220');
INSERT INTO `schema_migrations` VALUES ('20110328160039');
INSERT INTO `schema_migrations` VALUES ('20110401125601');
INSERT INTO `schema_migrations` VALUES ('20110408122312');
INSERT INTO `schema_migrations` VALUES ('20110408122325');
INSERT INTO `schema_migrations` VALUES ('20110408122336');
INSERT INTO `schema_migrations` VALUES ('20110411093421');
INSERT INTO `schema_migrations` VALUES ('20110427131146');
INSERT INTO `schema_migrations` VALUES ('20110629171022');
INSERT INTO `schema_migrations` VALUES ('20110704125715');
INSERT INTO `schema_migrations` VALUES ('20110704125935');
INSERT INTO `schema_migrations` VALUES ('20110705163209');
INSERT INTO `schema_migrations` VALUES ('20110706141002');
INSERT INTO `schema_migrations` VALUES ('20110706141733');
INSERT INTO `schema_migrations` VALUES ('20110708132124');
INSERT INTO `schema_migrations` VALUES ('20110718112003');
INSERT INTO `schema_migrations` VALUES ('20110720221336');
INSERT INTO `schema_migrations` VALUES ('20110721175654');
INSERT INTO `schema_migrations` VALUES ('20110721180904');
INSERT INTO `schema_migrations` VALUES ('20110723153204');
INSERT INTO `schema_migrations` VALUES ('20110724145156');
INSERT INTO `schema_migrations` VALUES ('20110726213848');

-- ----------------------------
-- Table structure for `serverendaction`
-- ----------------------------
DROP TABLE IF EXISTS `serverendaction`;
CREATE TABLE `serverendaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `caption` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_created` tinyint(4) DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `points` int(11) DEFAULT NULL,
  `is_recommend` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of serverendaction
-- ----------------------------
INSERT INTO `serverendaction` VALUES ('2', '2', '1', 'Congratulation,you get the prize', 'This is a competition, only 1 of 100 people can win it. You are the one', '0', '2011-10-20 21:52:41', '5', '0');

-- ----------------------------
-- Table structure for `sponsors`
-- ----------------------------
DROP TABLE IF EXISTS `sponsors`;
CREATE TABLE `sponsors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `extended_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sponsors
-- ----------------------------

-- ----------------------------
-- Table structure for `testers`
-- ----------------------------
DROP TABLE IF EXISTS `testers`;
CREATE TABLE `testers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `udid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of testers
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nickname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `private` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `refercode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `crypted_password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `password_salt` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `persistence_token` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '1', '2', null, null, null, null, '1', null, null, null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('2', '3', '3', null, null, null, null, '10', null, null, null, '1', null, null, null, null, null);

-- ----------------------------
-- Table structure for `userxxxes`
-- ----------------------------
DROP TABLE IF EXISTS `userxxxes`;
CREATE TABLE `userxxxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nickname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `private` tinyint(1) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `refercode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `crypted_password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `password_salt` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `persistence_token` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of userxxxes
-- ----------------------------

-- ----------------------------
-- Table structure for `vouchers`
-- ----------------------------
DROP TABLE IF EXISTS `vouchers`;
CREATE TABLE `vouchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `extended_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of vouchers
-- ----------------------------
