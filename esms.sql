/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50155
Source Host           : localhost:3306
Source Database       : esms

Target Server Type    : MYSQL
Target Server Version : 50155
File Encoding         : 65001

Date: 2019-01-15 16:40:14
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `Dno` int(2) NOT NULL AUTO_INCREMENT,
  `Dname` varchar(10) NOT NULL,
  `Dbuss` varchar(255) NOT NULL,
  PRIMARY KEY (`Dno`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '人事部', '公司人事管理，管理公司大小事务。');
INSERT INTO `department` VALUES ('2', '董事会', '董事会，领导整个公司，决策公司事务，指导公司发展。');
INSERT INTO `department` VALUES ('3', '财务部', '管理公司财务报表，结算财务支出，计算员工工资。');

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `Eno` int(12) NOT NULL AUTO_INCREMENT,
  `Dno` int(2) NOT NULL,
  `Rno` int(2) NOT NULL,
  `Ename` varchar(20) NOT NULL,
  `Esex` char(1) NOT NULL,
  `Ebir` date NOT NULL,
  `Eedu` varchar(8) NOT NULL,
  `Etel` varchar(12) NOT NULL,
  `Eaddr` varchar(50) NOT NULL,
  `Estate` varchar(10) NOT NULL,
  `Eintime` date NOT NULL,
  `Eouttime` date DEFAULT NULL,
  `imgsrc` varchar(255) NOT NULL,
  PRIMARY KEY (`Eno`) USING BTREE,
  KEY `fk_Dno` (`Dno`) USING BTREE,
  KEY `fk_Rno` (`Rno`) USING BTREE,
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Dno`) REFERENCES `department` (`Dno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`Rno`) REFERENCES `rank` (`Rno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '2', '3', '铁柱', '女', '1997-10-15', '硕士研究生', '17853312498', '山东省/临沂市/河东区', '在职', '2019-01-01', null, '');
INSERT INTO `employee` VALUES ('2', '1', '2', '铁柱', '女', '1997-10-15', '硕士研究生', '17853312498', '山东省/滨州市/阳信县', '在职', '2019-01-01', null, '');
INSERT INTO `employee` VALUES ('3', '1', '1', '123', '男', '2019-01-10', '小学', '123123', '安徽省/淮南市/潘集区', '在职', '2019-01-03', null, '');
INSERT INTO `employee` VALUES ('4', '1', '3', '123', '女', '2019-01-16', '专科', '123', '河北省/邢台市/隆尧县', '在职', '2019-01-03', null, 'uploadimages/1546851112576.jpg');
INSERT INTO `employee` VALUES ('5', '1', '3', '123', '女', '2019-01-16', '专科', '123', '河北省/邢台市/隆尧县', '在职', '2019-01-03', null, 'uploadimages/1546851112576.jpg');
INSERT INTO `employee` VALUES ('6', '1', '3', '123', '女', '2019-01-17', '高中', '123', '广东省/江门市/恩平市', '在职', '2019-01-10', null, 'uploadimages/1546851238785.jpg');
INSERT INTO `employee` VALUES ('7', '1', '3', '123', '女', '2019-01-17', '高中', '123', '广东省/江门市/恩平市', '在职', '2019-01-10', null, 'uploadimages/1546851238785.jpg');

-- ----------------------------
-- Table structure for `rank`
-- ----------------------------
DROP TABLE IF EXISTS `rank`;
CREATE TABLE `rank` (
  `Rno` int(2) NOT NULL AUTO_INCREMENT,
  `Rname` varchar(10) NOT NULL,
  `Rsal` int(10) NOT NULL,
  PRIMARY KEY (`Rno`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of rank
-- ----------------------------
INSERT INTO `rank` VALUES ('1', '董事长', '50000');
INSERT INTO `rank` VALUES ('2', '总经理', '25000');
INSERT INTO `rank` VALUES ('3', '副总经理', '20000');
INSERT INTO `rank` VALUES ('4', '总监', '10000');
INSERT INTO `rank` VALUES ('5', '主任', '8000');
INSERT INTO `rank` VALUES ('6', '部门经理', '6000');
INSERT INTO `rank` VALUES ('7', '主管', '5000');
INSERT INTO `rank` VALUES ('8', '专员', '4500');

-- ----------------------------
-- Table structure for `reward`
-- ----------------------------
DROP TABLE IF EXISTS `reward`;
CREATE TABLE `reward` (
  `Rewno` int(50) NOT NULL AUTO_INCREMENT,
  `Eno` int(12) NOT NULL,
  `Rew_pun` char(1) NOT NULL,
  `Rewtime` date NOT NULL,
  `Rewcontent` varchar(255) NOT NULL,
  `Rewmoney` double(10,2) NOT NULL,
  PRIMARY KEY (`Rewno`) USING BTREE,
  KEY `Rfk_Eno` (`Eno`) USING BTREE,
  CONSTRAINT `reward_ibfk_1` FOREIGN KEY (`Eno`) REFERENCES `employee` (`Eno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of reward
-- ----------------------------
INSERT INTO `reward` VALUES ('33', '3', '奖', '2019-01-16', '全勤', '2465.00');

-- ----------------------------
-- Table structure for `salary`
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary` (
  `Saltime` char(7) NOT NULL,
  `Eno` int(12) NOT NULL,
  `Salbase` double(10,2) NOT NULL,
  `Salreward` double(10,2) NOT NULL,
  `Salpunish` double(10,2) NOT NULL,
  `Insu_fund` double(10,2) NOT NULL,
  `Salall` double(10,2) NOT NULL,
  `Pertax` double(10,2) NOT NULL,
  `Salactual` double(10,2) NOT NULL,
  PRIMARY KEY (`Saltime`,`Eno`) USING BTREE,
  KEY `Eno` (`Eno`) USING BTREE,
  CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`Eno`) REFERENCES `employee` (`Eno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES ('2019-01', '1', '20000.00', '0.00', '0.00', '1000.00', '19000.00', '95.00', '18905.00');
INSERT INTO `salary` VALUES ('2019-01', '2', '25000.00', '0.00', '0.00', '1250.00', '23750.00', '118.75', '23631.25');
INSERT INTO `salary` VALUES ('2019-01', '3', '50000.00', '2465.00', '0.00', '2623.25', '49841.75', '249.21', '49592.54');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(255) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('f3a3ab99320e4ecaae523044d54392cc', 'admin', '123123', 'yongheng314159@163.com', 'dbb5dfe99e4f417dbf5bc86c12ef7b694ff77ad57f514ade835ec33ecbc053f7');
