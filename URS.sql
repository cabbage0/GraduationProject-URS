/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.37 : Database - urs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`urs` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `urs`;

/*Table structure for table `administrator` */

DROP TABLE IF EXISTS `administrator`;

CREATE TABLE `administrator` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `username` varchar(64) NOT NULL COMMENT '姓名',
  `password` varchar(20) NOT NULL COMMENT '密码',
  `type` int(1) NOT NULL COMMENT '身份，0-老师；1-管理员',
  `instituteid` varchar(20) NOT NULL COMMENT '所属学院编号',
  `userid` varchar(20) NOT NULL COMMENT '用户名，即登录用的账号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `administrator` */

insert  into `administrator`(`id`,`username`,`password`,`type`,`instituteid`,`userid`) values (1,'首席管理员','123456',1,'1414','admin'),(2,'第二管理员','123456',0,'1414','secondadmin');

/*Table structure for table `arrival` */

DROP TABLE IF EXISTS `arrival`;

CREATE TABLE `arrival` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station` varchar(64) NOT NULL COMMENT '到达站点',
  `arrivaldate` varchar(64) NOT NULL COMMENT '到达日期',
  `arrivaltime` varchar(64) NOT NULL COMMENT '到达时间',
  `peernumber` varchar(64) NOT NULL COMMENT '随行人数',
  `studentid` varchar(64) NOT NULL COMMENT '该学生的信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `arrival` */

insert  into `arrival`(`id`,`station`,`arrivaldate`,`arrivaltime`,`peernumber`,`studentid`) values (1,'太原南站','2018-08-27','14:00-18:00','0-3','1404030202'),(3,'建南汽车站','2018-08-27','10:00-12:00','0-3','1414010103');

/*Table structure for table `classes` */

DROP TABLE IF EXISTS `classes`;

CREATE TABLE `classes` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `classid` varchar(20) NOT NULL COMMENT '班级编号',
  `classtype` int(1) NOT NULL COMMENT '班级类型,0:实验班;1:普通班',
  `majorid` varchar(60) NOT NULL COMMENT '所属专业',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `classes` */

insert  into `classes`(`id`,`classid`,`classtype`,`majorid`) values (1,'14140101',0,'1401'),(2,'14140102',1,'1401'),(4,'14040301',0,'0403'),(5,'14040302',1,'0403'),(25,'18150101',0,'1501'),(26,'18150102',1,'1501');

/*Table structure for table `family` */

DROP TABLE IF EXISTS `family`;

CREATE TABLE `family` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `studentid` varchar(20) NOT NULL COMMENT '该学生的学号',
  `address` varchar(64) NOT NULL COMMENT '家庭住址',
  `phonenumber` varchar(20) NOT NULL COMMENT '家庭联系电话',
  `zip` varchar(10) NOT NULL COMMENT '邮政编码',
  `population` varchar(10) NOT NULL COMMENT '家庭人口数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `family` */

insert  into `family`(`id`,`studentid`,`address`,`phonenumber`,`zip`,`population`) values (1,'1404030202','山西省吕梁市','4023607','033300','5');

/*Table structure for table `familymember` */

DROP TABLE IF EXISTS `familymember`;

CREATE TABLE `familymember` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `studentid` varchar(20) NOT NULL COMMENT '该成员对应学生的学号',
  `membername` varchar(64) NOT NULL COMMENT '家庭成员姓名',
  `memberage` varchar(20) NOT NULL COMMENT '该成员年龄',
  `relationship` varchar(64) NOT NULL COMMENT '该成员与学生的关系，如父母亲等',
  `political` varchar(64) NOT NULL COMMENT '政治面貌，如团员党员等',
  `company` varchar(64) NOT NULL COMMENT '工作单位',
  `duty` varchar(64) NOT NULL COMMENT '担任职务',
  `phonenumber` varchar(20) NOT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `familymember` */

insert  into `familymember`(`id`,`studentid`,`membername`,`memberage`,`relationship`,`political`,`company`,`duty`,`phonenumber`) values (1,'1404030202','王老五','50','父亲','党员','县政府','公务员','13122122456');

/*Table structure for table `institute` */

DROP TABLE IF EXISTS `institute`;

CREATE TABLE `institute` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `instituteid` varchar(20) NOT NULL COMMENT '学院编号',
  `institutename` varchar(64) NOT NULL COMMENT '学院名称',
  `description` varchar(64) NOT NULL COMMENT '学院简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `institute` */

insert  into `institute`(`id`,`instituteid`,`institutename`,`description`) values (1,'14','软件学院','软件工程，全日制本科，设有多个方向'),(2,'04','环境与化工学院','全日制本科，设有环境工程、生物工程以及化工等专业'),(3,'15','艺术学院','全日制本科，设有音乐学、音乐表演等专业');

/*Table structure for table `major` */

DROP TABLE IF EXISTS `major`;

CREATE TABLE `major` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `majorid` varchar(20) NOT NULL COMMENT '专业编号',
  `instituteid` varchar(20) NOT NULL COMMENT '所属学院编号',
  `majorname` varchar(60) NOT NULL COMMENT '专业名称',
  `description` varchar(60) NOT NULL COMMENT '专业简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `major` */

insert  into `major`(`id`,`majorid`,`instituteid`,`majorname`,`description`) values (1,'1401','14','软件工程','当代计算机科学的分支，培养专业软件人才'),(2,'0403','04','生物工程','本专业主要以植物提取为特色，拥有先进分离检测设备、植提中试平台，致力于充分挖掘地方资源，分离纯化天然活性成分，并广泛应用'),(3,'1501','15','音乐表演','坚持“以人为本、开拓进取、精诚团结、快出人才”的办学理念，坚定地朝着“省内领先、国内知名”的目标迈进');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidatenumber` varchar(20) NOT NULL COMMENT '考生号',
  `studentid` varchar(20) DEFAULT '0' COMMENT '学号，由于是分班之后再编制，所以可以为空',
  `studentname` varchar(64) NOT NULL COMMENT '学生姓名',
  `gender` int(1) NOT NULL COMMENT '性别，0-女；1-男',
  `instituteid` varchar(64) DEFAULT NULL COMMENT '所属学院，录取后分配，所以可为空',
  `majorid` varchar(64) DEFAULT NULL COMMENT '专业，录取后分配',
  `classid` varchar(20) DEFAULT '0' COMMENT '所属班级编号，录取后分班',
  `scores` varchar(3) DEFAULT NULL COMMENT '高考成绩',
  `idcard` varchar(20) NOT NULL COMMENT '身份证号',
  `birthday` varchar(20) NOT NULL COMMENT '出生年月',
  `national` varchar(20) NOT NULL COMMENT '民族',
  `political` varchar(20) NOT NULL COMMENT '政治面貌',
  `studenttype` varchar(20) NOT NULL COMMENT '学生类别（本科）',
  `password` varchar(64) NOT NULL COMMENT '学生登录系统所用密码',
  `phonenumber` varchar(20) DEFAULT NULL COMMENT '待完善信息，学生联系电话',
  `isdisability` int(1) DEFAULT NULL COMMENT '待完善信息,是否残疾，0-否；1-是',
  `issingleparent` int(1) DEFAULT NULL COMMENT '待完善信息，是否单亲，0-否；1-是',
  `health` varchar(64) DEFAULT NULL COMMENT '待完善信息，健康状况',
  `ismartyrchild` int(1) DEFAULT NULL COMMENT '待完善信息，是否烈士或优抚对象子女，0-否；1-是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`id`,`candidatenumber`,`studentid`,`studentname`,`gender`,`instituteid`,`majorid`,`classid`,`scores`,`idcard`,`birthday`,`national`,`political`,`studenttype`,`password`,`phonenumber`,`isdisability`,`issingleparent`,`health`,`ismartyrchild`) values (1,'180403211512','1414010201','张一天',1,'14','1401','14140102','476','141125199805041234','1998-05-04','汉','共青团员','本科','041234',NULL,0,NULL,NULL,NULL),(2,'180403211513','1414010202','张二周',0,'14','1401','14140102','488','141517199607256636','1996-07-25','汉','团员','本科','123456',NULL,NULL,NULL,NULL,NULL),(3,'180403211520','1414010108','张三岳',0,'14','1401','14140101','501','112724199512134685','1995-12-13','汉','团员','本科','213468',NULL,NULL,NULL,NULL,NULL),(4,'180403211521','1414010207','李一星',0,'14','1401','14140102','515','141125199811026625','1998-11-02','汉','团员','本科','026625',NULL,NULL,NULL,NULL,NULL),(5,'180504221521','1414010101','李二同',1,'14','1401','14140101','450','141125199405066523','1994-05-06','汉','团员','本科','066523',NULL,NULL,NULL,NULL,NULL),(6,'180503012523','1404030201','李三川',1,'04','0403','14040302','491','142327199608245613','1996-08-24','汉','团员','本科','245613',NULL,NULL,NULL,NULL,NULL),(7,'180403211515','1404030102','李四美',1,'04','0403','14040301','477','142327199608116654','1996-08-11','汉','团员','本科','116654',NULL,NULL,NULL,NULL,NULL),(8,'180403211516','1404030202','王博二',1,'04','0403','14040302','498','141125199507194567','1995-07-19','汉','团员','本科','194567','',1,1,'',1),(9,'180603221516','1404030203','王万一',0,'04','0403','14040302','500','141126199711126523','1997-11-12','汉','团员','本科','126523','',1,1,'',1),(10,'180703012523','1404030103','王默三',0,'04','0403','14040301','501','142327199805041234','1998-05-04','汉','团员','本科','041234',NULL,NULL,NULL,NULL,NULL),(77,'180703012523','1404030103','李蜗牛',1,'14','1401','14040301','466','142327199405041234','1994-05-04','汉','团员','本科','041234',NULL,NULL,NULL,NULL,NULL),(78,'180703012524','1414010104','黄蚁人',1,'14','1401','14140101','477','142327199607256657','1996-07-25','汉','团员','本科','256657',NULL,NULL,NULL,NULL,NULL),(79,'180703012525','1414010203','高之一',1,'14','1401','14140102','488','142327199505056546','1995-05-05','汉','团员','本科','056546',NULL,NULL,NULL,NULL,NULL),(80,'180703012526','0','张二牛',0,'04','0403','14040302','501','142327199607166639','1996-07-16','汉','群众','本科','166639',NULL,NULL,NULL,NULL,NULL),(81,'180703012527','1414010107','李子鸣',1,'14','1401','14140101','496','141125199607081645','1996-07-08','汉','团员','本科','081645',NULL,NULL,NULL,NULL,NULL),(82,'180702012528','1815010202','周斌',1,'15','1501','18150102','387','141125199511216789','1995-11-21','汉','团员','本科','216789',NULL,NULL,NULL,NULL,NULL),(83,'180702012529','1404030105','武松',1,'04','0403','14040301','521','142327199410104521','1994-10-10','汉','团员','本科','104521',NULL,NULL,NULL,NULL,NULL),(84,'180702012530','1414010106','孙艺',0,'14','1401','14140101','490','142327199512126543','1995-12-12','汉','团员','本科','126543',NULL,NULL,NULL,NULL,NULL),(85,'180702012531','1404030104','强薇',0,'04','0403','14040301','501','141125199701125525','1997-01-12','汉','团员','本科','125525',NULL,NULL,NULL,NULL,NULL),(86,'180702012532','1815010102','常子龙',1,'15','1501','18150101','390','140110199403235565','1994-03-23','汉','团员','本科','235565',NULL,NULL,NULL,NULL,NULL),(87,'180702012533','1414010205','赵小瑜',0,'14','1401','14140102','498','140110199606137789','1996-06-13','汉','团员','本科','137789',NULL,NULL,NULL,NULL,NULL),(88,'180702012534','0','党一龙',1,'04','0403','14040302','501','140110199305084689','1993-05-08','汉','团员','本科','084689',NULL,NULL,NULL,NULL,NULL),(89,'180702012535','1815010204','安辛',0,'15','1501','18150102','401','140110199803034456','1998-03-03','汉','团员','本科','034456',NULL,NULL,NULL,NULL,NULL),(90,'180702012536','1404030106','常遇春',1,'04','0403','14040301','522','140110199609126654','1996-09-12','汉','团员','本科','126654',NULL,NULL,NULL,NULL,NULL),(91,'180702012537','1414010102','宋佳',0,'14','1401','14140101','465','140110199508099987','1995-08-09','汉','团员','本科','099987',NULL,NULL,NULL,NULL,NULL),(92,'180702012538','1414010204','吴用',1,'14','1401','14140102','489','140110199705061125','1997-05-06','汉','团员','本科','061125',NULL,NULL,NULL,NULL,NULL),(93,'180702012539','1414010206','李倩影',0,'14','1401','14140102','498','140110199602294498','1996-02-29','汉','团员','本科','294498',NULL,NULL,NULL,NULL,NULL),(94,'180702012540','1414010105','周文武',1,'14','1401','14140101','487','140110199512121122','1995-12-12','汉','团员','本科','121122',NULL,NULL,NULL,NULL,NULL),(95,'180702012541','1815010201','郑智华',1,'15','1501','18150102','377','141125099406235566','0994-06-23','汉','团员','本科','235566',NULL,NULL,NULL,NULL,NULL),(96,'180702012542','1815010101','钱壮壮',1,'15','1501','18150101','388','140110199811015225','1998-11-01','汉','团员','本科','015225',NULL,NULL,NULL,NULL,NULL),(97,'180702012543','0','林超',1,'04','0403','14040302','522','140110199411112556','1994-11-11','汉','团员','本科','112556',NULL,NULL,NULL,NULL,NULL),(98,'180702012544','1404030107','林彪呼',1,'04','0403','14040301','567','140110199304055566','1993-04-05','汉','团员','本科','055566',NULL,NULL,NULL,NULL,NULL),(99,'180702012545','0','乎永廷',1,'04','0403','14040302','534','140110199205051126','1992-05-05','汉','团员','本科','051126',NULL,NULL,NULL,NULL,NULL),(100,'180702012546','0','陈苑苑',0,'04','0403','14040302','543','140110199604216639','1996-04-21','汉','团员','本科','216639',NULL,NULL,NULL,NULL,NULL),(101,'180702012547','1414010103','赵飞非',1,'14','1401','14140101','475','140115199504065566','1995-04-06','汉','团员','本科','065566',NULL,NULL,NULL,NULL,NULL),(102,'180702012548','1815010203','夏雨',1,'15','1501','18150102','390','142327199811237764','1998-11-23','汉','团员','本科','237764',NULL,NULL,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
