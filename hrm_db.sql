/*
 Navicat Premium Data Transfer

 Source Server         : mySQL数据库
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : hrm_db

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 13/02/2022 19:03:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dept_inf
-- ----------------------------
DROP TABLE IF EXISTS `dept_inf`;
CREATE TABLE `dept_inf`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `REMARK` varchar(300) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept_inf
-- ----------------------------
INSERT INTO `dept_inf` VALUES (1, '技术部', '技术部');
INSERT INTO `dept_inf` VALUES (2, '运营部', '运营部');
INSERT INTO `dept_inf` VALUES (3, '财务部', '财务部');
INSERT INTO `dept_inf` VALUES (5, '总公办', '总公办');
INSERT INTO `dept_inf` VALUES (6, '市场部', '市场部');
INSERT INTO `dept_inf` VALUES (7, '教学部', '教学部');

-- ----------------------------
-- Table structure for document_inf
-- ----------------------------
DROP TABLE IF EXISTS `document_inf`;
CREATE TABLE `document_inf`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `filename` varchar(300) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `REMARK` varchar(300) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_DOCUMENT_USER`(`USER_ID`) USING BTREE,
  CONSTRAINT `document_inf_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user_inf` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of document_inf
-- ----------------------------
INSERT INTO `document_inf` VALUES (5, 'test', '图书馆关于假期开馆的通知-校内网.png', '1', '2021-01-12 09:22:54', 1);
INSERT INTO `document_inf` VALUES (6, '一封信', '28中学假期防疫工作致家长朋友一封信.docx', '测试', '2021-01-12 09:24:17', 1);
INSERT INTO `document_inf` VALUES (7, 'Java班宣传材料', '网络直播Java编程就业培训2021年.pdf', '2021网络直播Java编程就业培训。', '2021-01-12 09:25:07', 1);
INSERT INTO `document_inf` VALUES (8, '寒假C与汇编短期培训', '32学时C与汇编短期培训班.txt', '寒假C与汇编短期培训', '2021-01-12 09:26:02', 1);
INSERT INTO `document_inf` VALUES (9, '寒假C基础班', '网络直播C语言编程培训寒假基础班.pdf', '寒假C基础班', '2021-01-12 09:26:29', 1);
INSERT INTO `document_inf` VALUES (10, '555', '批量更改当前时间.jar', '555', '2021-01-12 10:01:19', 1);
INSERT INTO `document_inf` VALUES (11, '111', 'upload.txt', '111', '2021-01-12 13:21:13', 1);
INSERT INTO `document_inf` VALUES (12, 'newupload', 'upload.txt', '新的文件上传！', '2021-01-12 13:37:05', 1);

-- ----------------------------
-- Table structure for employee_inf
-- ----------------------------
DROP TABLE IF EXISTS `employee_inf`;
CREATE TABLE `employee_inf`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DEPT_ID` int NOT NULL,
  `JOB_ID` int NOT NULL,
  `NAME` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `CARD_ID` varchar(18) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `ADDRESS` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `POST_CODE` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `TEL` varchar(16) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `PHONE` varchar(11) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `QQ_NUM` varchar(10) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `EMAIL` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `SEX` int NOT NULL DEFAULT 1,
  `PARTY` varchar(10) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `BIRTHDAY` datetime NULL DEFAULT NULL,
  `RACE` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `EDUCATION` varchar(10) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `SPECIALITY` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `HOBBY` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `REMARK` varchar(500) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_EMP_DEPT`(`DEPT_ID`) USING BTREE,
  INDEX `FK_EMP_JOB`(`JOB_ID`) USING BTREE,
  CONSTRAINT `employee_inf_ibfk_1` FOREIGN KEY (`DEPT_ID`) REFERENCES `dept_inf` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_inf_ibfk_2` FOREIGN KEY (`JOB_ID`) REFERENCES `job_inf` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee_inf
-- ----------------------------
INSERT INTO `employee_inf` VALUES (1, 1, 8, '爱丽丝', '4328011988', '广州天河', '510000', '020-77777777', '13902001111', '36750066', '251425887@qq.com', 2, '党员', '1980-01-01 00:00:00', '满', '本科', '美声', '唱歌', '四大天王', '2016-03-14 11:35:18');
INSERT INTO `employee_inf` VALUES (2, 2, 1, '杰克', '22623', '43234', '42427424', '42242', '4247242', '42424', '251425887@qq.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-03-14 11:35:18');
INSERT INTO `employee_inf` VALUES (3, 1, 2, 'bb', '432801197711251038', '广州', '510000', '020-99999999', '13907351532', '36750064', '36750064@qq.com', 1, '党员', '1977-11-25 00:00:00', '汉', '本科', '计算机', '爬山', '无', '2016-07-14 09:54:52');
INSERT INTO `employee_inf` VALUES (4, 1, 8, 'test', '23211', '长春', '32221', '010-1111', '12334', '32221', '2333', 1, '党员', '1995-06-10 00:00:00', '汉', '硕士', '英语', '滑冰', '高手啊', '2021-01-11 00:00:00');
INSERT INTO `employee_inf` VALUES (5, 2, 1, '张三', '1111', '大连', '1111', '1111', '1111', '1111', '1111', 1, '群众', '2001-03-12 00:00:00', '布依', '本科', '管理', '文学', '大文豪啊', '2021-01-11 00:00:00');

-- ----------------------------
-- Table structure for fy_inf
-- ----------------------------
DROP TABLE IF EXISTS `fy_inf`;
CREATE TABLE `fy_inf`  (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `编号` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `NAME` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `REMARK` varchar(300) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `类别` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `公布时间` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `类型` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `申报地区或单位` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `保护单位` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `是否审核` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fy_inf
-- ----------------------------
INSERT INTO `fy_inf` VALUES (1, 'Ⅰ-12', '满族说部（孙吴县满语故事）', '呵呵呵', '民间文学', '2021\r\n(第五批)', '扩展项目', '黑龙江省黑河市孙吴县', '孙吴县文化馆', 1);
INSERT INTO `fy_inf` VALUES (8, 'Ⅱ-36', '蒙古族四胡音乐', '呵呵呵', '传统音乐', '2008\r\n(第二批)', '扩展项目', '黑龙江省杜尔伯特蒙古族自治县', '杜尔伯特蒙古族自治县博物馆', 1);
INSERT INTO `fy_inf` VALUES (9, 'Ⅱ-37', '唢呐艺术（杨小班鼓吹乐棚）', '呵呵呵', '传统音乐', '2008\r\n(第二批)', '扩展项目', '黑龙江省肇州县', '肇州县非物质文化遗产保护中心', 1);
INSERT INTO `fy_inf` VALUES (26, '', '唢呐艺术（杨小班鼓吹乐棚）', '', '民间文学', '2014(第四批)', '新增项目', '黑龙江省', NULL, 0);
INSERT INTO `fy_inf` VALUES (27, '', '蒙古族四胡音乐', '', '民间文学', '2008(第二批)', '扩展项目', '黑龙江省', NULL, 0);
INSERT INTO `fy_inf` VALUES (28, '', '唢呐艺术（杨小班鼓吹乐棚）', '', '民间文学', '2014(第四批)', '新增项目', '黑龙江省', NULL, 0);
INSERT INTO `fy_inf` VALUES (29, '', '唢呐艺术（杨小班鼓吹乐棚）', '', '民间文学', '2011(第三批)', '新增项目', '黑龙江省', NULL, 0);
INSERT INTO `fy_inf` VALUES (30, '', 'hhhhhhhhhhhhhhhh', '', '民间文学', '2011(第三批)', '扩展项目', '黑龙江省', NULL, 0);
INSERT INTO `fy_inf` VALUES (31, '', 'aaaaaaaaaaaaaa', '', '民间文学', '2008(第二批)', '扩展项目', '辽宁省', NULL, 0);

-- ----------------------------
-- Table structure for job_inf
-- ----------------------------
DROP TABLE IF EXISTS `job_inf`;
CREATE TABLE `job_inf`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `REMARK` varchar(300) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_inf
-- ----------------------------
INSERT INTO `job_inf` VALUES (1, '职员', '职员');
INSERT INTO `job_inf` VALUES (2, 'Java开发工程师', 'Java开发工程师');
INSERT INTO `job_inf` VALUES (3, 'Java中级开发工程师', 'Java中级开发工程师');
INSERT INTO `job_inf` VALUES (4, 'Java高级开发工程师', 'Java高级开发工程师');
INSERT INTO `job_inf` VALUES (5, '系统管理员', '系统管理员');
INSERT INTO `job_inf` VALUES (6, '架构师', '架构师');
INSERT INTO `job_inf` VALUES (7, '主管', '主管');
INSERT INTO `job_inf` VALUES (8, '经理', '经理');
INSERT INTO `job_inf` VALUES (9, '总经理', '总经理');

-- ----------------------------
-- Table structure for notice_inf
-- ----------------------------
DROP TABLE IF EXISTS `notice_inf`;
CREATE TABLE `notice_inf`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `CONTENT` text CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_NOTICE_USER`(`USER_ID`) USING BTREE,
  CONSTRAINT `notice_inf_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user_inf` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice_inf
-- ----------------------------
INSERT INTO `notice_inf` VALUES (1, 'helloworld', '你好啊，测试公告！', '2021-01-11 00:00:00', 1);
INSERT INTO `notice_inf` VALUES (2, '测试公共', '这是测试公告！', '2021-01-11 00:00:00', 8);
INSERT INTO `notice_inf` VALUES (3, '放寒假了', '正式放寒假了！', '2021-01-01 00:00:00', 9);
INSERT INTO `notice_inf` VALUES (4, '疫情通告', '寒假别乱出门晃荡！', '2021-01-05 00:00:00', 10);
INSERT INTO `notice_inf` VALUES (5, '疫情紧急公告', '春节期间不得聚众活动，注意防护！', '2021-01-11 00:00:00', 1);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `score` float(255, 1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', 0.0);

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `number` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `content` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `a` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `b` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `c` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `d` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pic` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `answer` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES (0000000001, '这是考题1', 'a', 'b', 'c', 'd', 'a1.jpg', 'd');
INSERT INTO `test` VALUES (0000000002, '这是考题2', 'a', 'b', 'c', 'd', 'a2.jpg', 'a');
INSERT INTO `test` VALUES (0000000003, '这是考题3', 'a', 'b', 'c', 'd', 'a3.jpg', 'a');
INSERT INTO `test` VALUES (0000000004, '这是考题4', 'a', 'b', 'c', 'd', 'a4.jpg', 'b');

-- ----------------------------
-- Table structure for user_inf
-- ----------------------------
DROP TABLE IF EXISTS `user_inf`;
CREATE TABLE `user_inf`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `loginname` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `PASSWORD` varchar(16) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `STATUS` int NOT NULL DEFAULT 1,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_inf
-- ----------------------------
INSERT INTO `user_inf` VALUES (1, 'admin', '123456', 2, '2016-03-12 09:34:28', '超级管理员');
INSERT INTO `user_inf` VALUES (7, 'u1', 'u1', 1, '2021-01-11 21:51:35', 'u2');
INSERT INTO `user_inf` VALUES (8, 'u2', 'u2', 1, '2021-01-11 21:51:49', 'u2');
INSERT INTO `user_inf` VALUES (9, 'u3', 'u3', 1, '2021-01-11 21:52:00', 'u3');
INSERT INTO `user_inf` VALUES (10, 'u5', 'u5', 1, '2021-01-11 21:52:14', 'u5');

SET FOREIGN_KEY_CHECKS = 1;
