#
MySQL-Front 3.2  (Build 7.31)

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES 'gbk' */;

#
Host: localhost    Database: hrm_db
# ------------------------------------------------------
# Server version 5.5.62

DROP
DATABASE IF EXISTS `hrm_db`;
CREATE
DATABASE `hrm_db` /*!40100 DEFAULT CHARACTER SET gbk */;
USE
`hrm_db`;

#
# Table structure for table dept_inf
#

CREATE TABLE `dept_inf`
(
    `ID`     int(11) NOT NULL AUTO_INCREMENT,
    `NAME`   varchar(50) NOT NULL,
    `REMARK` varchar(300) DEFAULT NULL,
    PRIMARY KEY (`ID`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = gbk;

#
# Dumping data for table dept_inf
#

INSERT INTO `dept_inf`
VALUES (1, '技术部', '技术部');
INSERT INTO `dept_inf`
VALUES (2, '运营部', '运营部');
INSERT INTO `dept_inf`
VALUES (3, '财务部', '财务部');
INSERT INTO `dept_inf`
VALUES (5, '总公办', '总公办');
INSERT INTO `dept_inf`
VALUES (6, '市场部', '市场部');
INSERT INTO `dept_inf`
VALUES (7, '教学部', '教学部');


#
# Table structure for table document_inf
#

CREATE TABLE `document_inf`
(
    `ID`          int(11) NOT NULL AUTO_INCREMENT,
    `TITLE`       varchar(50)  NOT NULL,
    `filename`    varchar(300) NOT NULL,
    `REMARK`      varchar(300)          DEFAULT NULL,
    `CREATE_DATE` timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `USER_ID`     int(11) DEFAULT NULL,
    PRIMARY KEY (`ID`),
    KEY           `FK_DOCUMENT_USER` (`USER_ID`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 13
  DEFAULT CHARSET = gbk;

#
# Dumping data for table document_inf
#

INSERT INTO `document_inf`
VALUES (5, 'test', '图书馆关于假期开馆的通知-校内网.png', '1', '2021-01-12 09:22:54', 1);
INSERT INTO `document_inf`
VALUES (6, '一封信', '28中学假期防疫工作致家长朋友一封信.docx', '测试', '2021-01-12 09:24:17', 1);
INSERT INTO `document_inf`
VALUES (7, 'Java班宣传材料', '网络直播Java编程就业培训2021年.pdf', '2021网络直播Java编程就业培训。', '2021-01-12 09:25:07', 1);
INSERT INTO `document_inf`
VALUES (8, '寒假C与汇编短期培训', '32学时C与汇编短期培训班.txt', '寒假C与汇编短期培训', '2021-01-12 09:26:02', 1);
INSERT INTO `document_inf`
VALUES (9, '寒假C基础班', '网络直播C语言编程培训寒假基础班.pdf', '寒假C基础班', '2021-01-12 09:26:29', 1);
INSERT INTO `document_inf`
VALUES (10, '555', '批量更改当前时间.jar', '555', '2021-01-12 10:01:19', 1);
INSERT INTO `document_inf`
VALUES (11, '111', 'upload.txt', '111', '2021-01-12 13:21:13', 1);
INSERT INTO `document_inf`
VALUES (12, 'newupload', 'upload.txt', '新的文件上传！', '2021-01-12 13:37:05', 1);


#
# Table structure for table employee_inf
#

CREATE TABLE `employee_inf`
(
    `ID`          int(11) NOT NULL AUTO_INCREMENT,
    `DEPT_ID`     int(11) NOT NULL,
    `JOB_ID`      int(11) NOT NULL,
    `NAME`        varchar(20) NOT NULL,
    `CARD_ID`     varchar(18) NOT NULL,
    `ADDRESS`     varchar(50) NOT NULL,
    `POST_CODE`   varchar(50)          DEFAULT NULL,
    `TEL`         varchar(16)          DEFAULT NULL,
    `PHONE`       varchar(11) NOT NULL,
    `QQ_NUM`      varchar(10)          DEFAULT NULL,
    `EMAIL`       varchar(50) NOT NULL,
    `SEX`         int(11) NOT NULL DEFAULT '1',
    `PARTY`       varchar(10)          DEFAULT NULL,
    `BIRTHDAY`    datetime             DEFAULT NULL,
    `RACE`        varchar(100)         DEFAULT NULL,
    `EDUCATION`   varchar(10)          DEFAULT NULL,
    `SPECIALITY`  varchar(20)          DEFAULT NULL,
    `HOBBY`       varchar(100)         DEFAULT NULL,
    `REMARK`      varchar(500)         DEFAULT NULL,
    `CREATE_DATE` timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`ID`),
    KEY           `FK_EMP_DEPT` (`DEPT_ID`),
    KEY           `FK_EMP_JOB` (`JOB_ID`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = gbk;

#
# Dumping data for table employee_inf
#

INSERT INTO `employee_inf`
VALUES (1, 1, 8, '爱丽丝', '4328011988', '广州天河', '510000', '020-77777777', '13902001111', '36750066', '251425887@qq.com',
        2, '党员', '1980-01-01 00:00:00', '满', '本科', '美声', '唱歌', '四大天王', '2016-03-14 11:35:18');
INSERT INTO `employee_inf`
VALUES (2, 2, 1, '杰克', '22623', '43234', '42427424', '42242', '4247242', '42424', '251425887@qq.com', 1, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, '2016-03-14 11:35:18');
INSERT INTO `employee_inf`
VALUES (3, 1, 2, 'bb', '432801197711251038', '广州', '510000', '020-99999999', '13907351532', '36750064',
        '36750064@qq.com', 1, '党员', '1977-11-25 00:00:00', '汉', '本科', '计算机', '爬山', '无', '2016-07-14 09:54:52');
INSERT INTO `employee_inf`
VALUES (4, 1, 8, 'test', '23211', '长春', '32221', '010-1111', '12334', '32221', '2333', 1, '党员', '1995-06-10 00:00:00',
        '汉', '硕士', '英语', '滑冰', '高手啊', '2021-01-11 00:00:00');
INSERT INTO `employee_inf`
VALUES (5, 2, 1, '张三', '1111', '大连', '1111', '1111', '1111', '1111', '1111', 1, '群众', '2001-03-12 00:00:00', '布依', '本科',
        '管理', '文学', '大文豪啊', '2021-01-11 00:00:00');


#
# Table structure for table job_inf
#

CREATE TABLE `job_inf`
(
    `ID`     int(11) NOT NULL AUTO_INCREMENT,
    `NAME`   varchar(50) NOT NULL,
    `REMARK` varchar(300) DEFAULT NULL,
    PRIMARY KEY (`ID`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = gbk;

#
# Dumping data for table job_inf
#

INSERT INTO `job_inf`
VALUES (1, '职员', '职员');
INSERT INTO `job_inf`
VALUES (2, 'Java开发工程师', 'Java开发工程师');
INSERT INTO `job_inf`
VALUES (3, 'Java中级开发工程师', 'Java中级开发工程师');
INSERT INTO `job_inf`
VALUES (4, 'Java高级开发工程师', 'Java高级开发工程师');
INSERT INTO `job_inf`
VALUES (5, '系统管理员', '系统管理员');
INSERT INTO `job_inf`
VALUES (6, '架构师', '架构师');
INSERT INTO `job_inf`
VALUES (7, '主管', '主管');
INSERT INTO `job_inf`
VALUES (8, '经理', '经理');
INSERT INTO `job_inf`
VALUES (9, '总经理', '总经理');


#
# Table structure for table notice_inf
#

CREATE TABLE `notice_inf`
(
    `ID`          int(11) NOT NULL AUTO_INCREMENT,
    `TITLE`       varchar(50) NOT NULL,
    `CONTENT`     text        NOT NULL,
    `CREATE_DATE` timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `USER_ID`     int(11) DEFAULT NULL,
    PRIMARY KEY (`ID`),
    KEY           `FK_NOTICE_USER` (`USER_ID`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = gbk;

#
# Dumping data for table notice_inf
#

INSERT INTO `notice_inf`
VALUES (1, 'helloworld', '你好啊，测试公告！', '2021-01-11 00:00:00', 1);
INSERT INTO `notice_inf`
VALUES (2, '测试公共', '这是测试公告！', '2021-01-11 00:00:00', 8);
INSERT INTO `notice_inf`
VALUES (3, '放寒假了', '正式放寒假了！', '2021-01-01 00:00:00', 9);
INSERT INTO `notice_inf`
VALUES (4, '疫情通告', '寒假别乱出门晃荡！', '2021-01-05 00:00:00', 10);
INSERT INTO `notice_inf`
VALUES (5, '疫情紧急公告', '春节期间不得聚众活动，注意防护！', '2021-01-11 00:00:00', 1);


#
# Table structure for table user_inf
#

CREATE TABLE `user_inf`
(
    `ID`         int(11) NOT NULL AUTO_INCREMENT,
    `loginname`  varchar(20) NOT NULL,
    `PASSWORD`   varchar(16) NOT NULL,
    `STATUS`     int(11) NOT NULL DEFAULT '1',
    `createdate` timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `username`   varchar(20)          DEFAULT NULL,
    PRIMARY KEY (`ID`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = gbk;

#
# Dumping data for table user_inf
#

INSERT INTO `user_inf`
VALUES (1, 'admin', '123456', 2, '2016-03-12 09:34:28', '超级管理员');
INSERT INTO `user_inf`
VALUES (7, 'u1', 'u1', 1, '2021-01-11 21:51:35', 'u2');
INSERT INTO `user_inf`
VALUES (8, 'u2', 'u2', 1, '2021-01-11 21:51:49', 'u2');
INSERT INTO `user_inf`
VALUES (9, 'u3', 'u3', 1, '2021-01-11 21:52:00', 'u3');
INSERT INTO `user_inf`
VALUES (10, 'u5', 'u5', 1, '2021-01-11 21:52:14', 'u5');


#
#  Foreign keys for table document_inf
#

ALTER TABLE `document_inf`
    ADD FOREIGN KEY (`USER_ID`) REFERENCES `user_inf` (`ID`);

#
#  Foreign keys for table employee_inf
#

ALTER TABLE `employee_inf`
    ADD FOREIGN KEY (`DEPT_ID`) REFERENCES `dept_inf` (`ID`),
    ADD FOREIGN KEY (`JOB_ID`) REFERENCES `job_inf` (`ID`);

#
#  Foreign keys for table notice_inf
#

ALTER TABLE `notice_inf`
    ADD FOREIGN KEY (`USER_ID`) REFERENCES `user_inf` (`ID`);
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
