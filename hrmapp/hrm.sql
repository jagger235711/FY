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
VALUES (1, '������', '������');
INSERT INTO `dept_inf`
VALUES (2, '��Ӫ��', '��Ӫ��');
INSERT INTO `dept_inf`
VALUES (3, '����', '����');
INSERT INTO `dept_inf`
VALUES (5, '�ܹ���', '�ܹ���');
INSERT INTO `dept_inf`
VALUES (6, '�г���', '�г���');
INSERT INTO `dept_inf`
VALUES (7, '��ѧ��', '��ѧ��');


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
VALUES (5, 'test', 'ͼ��ݹ��ڼ��ڿ��ݵ�֪ͨ-У����.png', '1', '2021-01-12 09:22:54', 1);
INSERT INTO `document_inf`
VALUES (6, 'һ����', '28��ѧ���ڷ��߹����¼ҳ�����һ����.docx', '����', '2021-01-12 09:24:17', 1);
INSERT INTO `document_inf`
VALUES (7, 'Java����������', '����ֱ��Java��̾�ҵ��ѵ2021��.pdf', '2021����ֱ��Java��̾�ҵ��ѵ��', '2021-01-12 09:25:07', 1);
INSERT INTO `document_inf`
VALUES (8, '����C���������ѵ', '32ѧʱC���������ѵ��.txt', '����C���������ѵ', '2021-01-12 09:26:02', 1);
INSERT INTO `document_inf`
VALUES (9, '����C������', '����ֱ��C���Ա����ѵ���ٻ�����.pdf', '����C������', '2021-01-12 09:26:29', 1);
INSERT INTO `document_inf`
VALUES (10, '555', '�������ĵ�ǰʱ��.jar', '555', '2021-01-12 10:01:19', 1);
INSERT INTO `document_inf`
VALUES (11, '111', 'upload.txt', '111', '2021-01-12 13:21:13', 1);
INSERT INTO `document_inf`
VALUES (12, 'newupload', 'upload.txt', '�µ��ļ��ϴ���', '2021-01-12 13:37:05', 1);


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
VALUES (1, 1, 8, '����˿', '4328011988', '�������', '510000', '020-77777777', '13902001111', '36750066', '251425887@qq.com',
        2, '��Ա', '1980-01-01 00:00:00', '��', '����', '����', '����', '�Ĵ�����', '2016-03-14 11:35:18');
INSERT INTO `employee_inf`
VALUES (2, 2, 1, '�ܿ�', '22623', '43234', '42427424', '42242', '4247242', '42424', '251425887@qq.com', 1, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, '2016-03-14 11:35:18');
INSERT INTO `employee_inf`
VALUES (3, 1, 2, 'bb', '432801197711251038', '����', '510000', '020-99999999', '13907351532', '36750064',
        '36750064@qq.com', 1, '��Ա', '1977-11-25 00:00:00', '��', '����', '�����', '��ɽ', '��', '2016-07-14 09:54:52');
INSERT INTO `employee_inf`
VALUES (4, 1, 8, 'test', '23211', '����', '32221', '010-1111', '12334', '32221', '2333', 1, '��Ա', '1995-06-10 00:00:00',
        '��', '˶ʿ', 'Ӣ��', '����', '���ְ�', '2021-01-11 00:00:00');
INSERT INTO `employee_inf`
VALUES (5, 2, 1, '����', '1111', '����', '1111', '1111', '1111', '1111', '1111', 1, 'Ⱥ��', '2001-03-12 00:00:00', '����', '����',
        '����', '��ѧ', '���ĺ���', '2021-01-11 00:00:00');


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
VALUES (1, 'ְԱ', 'ְԱ');
INSERT INTO `job_inf`
VALUES (2, 'Java��������ʦ', 'Java��������ʦ');
INSERT INTO `job_inf`
VALUES (3, 'Java�м���������ʦ', 'Java�м���������ʦ');
INSERT INTO `job_inf`
VALUES (4, 'Java�߼���������ʦ', 'Java�߼���������ʦ');
INSERT INTO `job_inf`
VALUES (5, 'ϵͳ����Ա', 'ϵͳ����Ա');
INSERT INTO `job_inf`
VALUES (6, '�ܹ�ʦ', '�ܹ�ʦ');
INSERT INTO `job_inf`
VALUES (7, '����', '����');
INSERT INTO `job_inf`
VALUES (8, '����', '����');
INSERT INTO `job_inf`
VALUES (9, '�ܾ���', '�ܾ���');


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
VALUES (1, 'helloworld', '��ð������Թ��棡', '2021-01-11 00:00:00', 1);
INSERT INTO `notice_inf`
VALUES (2, '���Թ���', '���ǲ��Թ��棡', '2021-01-11 00:00:00', 8);
INSERT INTO `notice_inf`
VALUES (3, '�ź�����', '��ʽ�ź����ˣ�', '2021-01-01 00:00:00', 9);
INSERT INTO `notice_inf`
VALUES (4, '����ͨ��', '���ٱ��ҳ��Żε���', '2021-01-05 00:00:00', 10);
INSERT INTO `notice_inf`
VALUES (5, '�����������', '�����ڼ䲻�þ��ڻ��ע�������', '2021-01-11 00:00:00', 1);


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
VALUES (1, 'admin', '123456', 2, '2016-03-12 09:34:28', '��������Ա');
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
