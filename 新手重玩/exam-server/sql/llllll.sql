-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.20 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  8.2.0.4675
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 chongxin 的数据库结构
DROP DATABASE IF EXISTS `chongxin`;
CREATE DATABASE IF NOT EXISTS `chongxin` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `chongxin`;


-- 导出  表 chongxin.api_authority 结构
DROP TABLE IF EXISTS `api_authority`;
CREATE TABLE IF NOT EXISTS `api_authority` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `identity_id` int(10) DEFAULT NULL,
  `api_authority_text` varchar(200) NOT NULL,
  `api_authority_url` varchar(200) NOT NULL,
  `api_authority_method` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='api接口权限';

-- 正在导出表  chongxin.api_authority 的数据：~6 rows (大约)
DELETE FROM `api_authority`;
/*!40000 ALTER TABLE `api_authority` DISABLE KEYS */;
INSERT INTO `api_authority` (`id`, `identity_id`, `api_authority_text`, `api_authority_url`, `api_authority_method`) VALUES
	(1, 0, '获取所有的考试类型', '/exam/examType', 'GET'),
	(2, 2, '获取所有课程', '/exam/subject', 'GET'),
	(3, 1, '删除指定的试题类型', '/exam/delQuestionsType', 'POST'),
	(4, 1, '添加试题类型', '/exma/insertQuestionsType', 'GET'),
	(5, 1, '获取所有的试题类型', '/exam/getQuestionsType', 'GET'),
	(6, 2, 'aaa', '/exam/addExam', 'POST');
/*!40000 ALTER TABLE `api_authority` ENABLE KEYS */;


-- 导出  表 chongxin.classtype 结构
DROP TABLE IF EXISTS `classtype`;
CREATE TABLE IF NOT EXISTS `classtype` (
  `classId` varchar(255) NOT NULL DEFAULT '',
  `classType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`classId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='课程类型';

-- 正在导出表  chongxin.classtype 的数据：10 rows
DELETE FROM `classtype`;
/*!40000 ALTER TABLE `classtype` DISABLE KEYS */;
INSERT INTO `classtype` (`classId`, `classType`) VALUES
	('C1', 'javaScript上'),
	('C2', 'javaScript下'),
	('C3', '模块化开发'),
	('C4', '移动端开发'),
	('C5', 'node基础'),
	('C6', '组件化开发(vue)'),
	('C7', '渐进式开发(react)'),
	('C8', '项目实战'),
	('C9', 'javaScript高级'),
	('C10', 'node高级');
/*!40000 ALTER TABLE `classtype` ENABLE KEYS */;


-- 导出  表 chongxin.exam 结构
DROP TABLE IF EXISTS `exam`;
CREATE TABLE IF NOT EXISTS `exam` (
  `exam_id` varchar(245) NOT NULL,
  `exam_name` varchar(255) DEFAULT NULL,
  `time_id` varchar(255) DEFAULT NULL,
  `class_id` varchar(255) DEFAULT NULL,
  `question_num` varchar(255) DEFAULT NULL,
  `start_exam` varchar(255) DEFAULT NULL,
  `end_exam` varchar(255) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL COMMENT '出题人',
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  chongxin.exam 的数据：~6 rows (大约)
DELETE FROM `exam`;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` (`exam_id`, `exam_name`, `time_id`, `class_id`, `question_num`, `start_exam`, `end_exam`, `question`, `uid`) VALUES
	('1567818734347', '第三份试卷', 'T3', 'C7', '3', '1567991523245', '1569805928967', '["2","3"]', '1'),
	('1567843153112', '第四份试卷', 'T4', 'C7', '3', '1567411138463', '1568707144102', '["1","8"]', '1'),
	('1567992751434', '测试试卷', 'T3', 'C5', '3', '1569202342519', '1569807146717', '["1","2","3"]', '1'),
	('1567993955664', '小学生期末考试试卷', 'T3', 'C7', '3', '1569203547033', '1569808350732', '["2","5","8","12"]', '1'),
	('1567994669962', '第三份试卷', 'T2', 'C5', '3', '1567303460631', '1567994667962', '["2","12","14"]', '1'),
	('1568075558030', '测试功能试卷', 'T4', 'C7', '4', '1569198748769', '1569803553775', '["3","12","14"]', '1');
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;


-- 导出  表 chongxin.grade 结构
DROP TABLE IF EXISTS `grade`;
CREATE TABLE IF NOT EXISTS `grade` (
  `grade_id` varchar(255) NOT NULL DEFAULT '',
  `grade_name` varchar(255) DEFAULT NULL,
  `room_id` varchar(255) DEFAULT NULL,
  `classId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`grade_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  chongxin.grade 的数据：10 rows
DELETE FROM `grade`;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` (`grade_id`, `grade_name`, `room_id`, `classId`) VALUES
	('g2', '1610C', 'r9', 'C6'),
	('g1', '1611A', 'r6', 'C4'),
	('g5', '1611B', 'r3', 'C6'),
	('g6', '1611C', 'r8', 'C6'),
	('g7', '1609B', 'r5', 'C2'),
	('g8', '1609A', 'r14', 'C2'),
	('g10', '1701C', 'r1', 'C5'),
	('g11', '1612A', 'r13', 'C2'),
	('g12', '1612B', 'r4', 'C2'),
	('g3', '1611B', 'r12', 'C10');
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;


-- 导出  表 chongxin.identity 结构
DROP TABLE IF EXISTS `identity`;
CREATE TABLE IF NOT EXISTS `identity` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `identity` varchar(200) NOT NULL,
  `type_id` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='身份id数据库';

-- 正在导出表  chongxin.identity 的数据：~4 rows (大约)
DELETE FROM `identity`;
/*!40000 ALTER TABLE `identity` DISABLE KEYS */;
INSERT INTO `identity` (`id`, `identity`, `type_id`) VALUES
	(1, '管理员', '0'),
	(2, '出题者', '1'),
	(3, '学生', '2'),
	(12, '超管', '4');
/*!40000 ALTER TABLE `identity` ENABLE KEYS */;


-- 导出  表 chongxin.identity_view_authority 结构
DROP TABLE IF EXISTS `identity_view_authority`;
CREATE TABLE IF NOT EXISTS `identity_view_authority` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视图权限';

-- 正在导出表  chongxin.identity_view_authority 的数据：~0 rows (大约)
DELETE FROM `identity_view_authority`;
/*!40000 ALTER TABLE `identity_view_authority` DISABLE KEYS */;
/*!40000 ALTER TABLE `identity_view_authority` ENABLE KEYS */;


-- 导出  表 chongxin.publish 结构
DROP TABLE IF EXISTS `publish`;
CREATE TABLE IF NOT EXISTS `publish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` varchar(255) DEFAULT NULL,
  `grade_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- 正在导出表  chongxin.publish 的数据：~2 rows (大约)
DELETE FROM `publish`;
/*!40000 ALTER TABLE `publish` DISABLE KEYS */;
INSERT INTO `publish` (`id`, `exam_id`, `grade_name`) VALUES
	(4, '1567818734347', NULL),
	(5, '1567843153112', NULL);
/*!40000 ALTER TABLE `publish` ENABLE KEYS */;


-- 导出  表 chongxin.room 结构
DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `room_id` varchar(255) NOT NULL DEFAULT '',
  `room_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  chongxin.room 的数据：8 rows
DELETE FROM `room`;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` (`room_id`, `room_text`) VALUES
	('r7', '34313'),
	('r8', '34311'),
	('r9', '34310'),
	('r10', '34308'),
	('r11', '34304'),
	('r12', '34303'),
	('r13', '34407'),
	('r14', '34301');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;


-- 导出  表 chongxin.saveanswer 结构
DROP TABLE IF EXISTS `saveanswer`;
CREATE TABLE IF NOT EXISTS `saveanswer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- 正在导出表  chongxin.saveanswer 的数据：~9 rows (大约)
DELETE FROM `saveanswer`;
/*!40000 ALTER TABLE `saveanswer` DISABLE KEYS */;
INSERT INTO `saveanswer` (`id`, `answer`) VALUES
	(1, '{"val0":"阿萨德","val1":"阿达"}'),
	(2, '{"val0":"啊啊啊","val1":"啊啊啊啊啊啊啊啊啊"}'),
	(3, '{"val0":"萨达","val1":"阿斯顿撒多撒"}'),
	(4, '{"val0":"阿萨德","val1":"奥术大师多"}'),
	(5, '{"val0":"啊","val1":"啊啊"}'),
	(6, '{"val0":"4","val1":"5"}'),
	(7, '{"val0":"反馈卡","val1":"发你"}'),
	(8, '{"val0":"反馈卡","val1":"发你"}'),
	(9, '{"val0":"反馈卡","val1":"发你"}');
/*!40000 ALTER TABLE `saveanswer` ENABLE KEYS */;


-- 导出  表 chongxin.savestudentexam 结构
DROP TABLE IF EXISTS `savestudentexam`;
CREATE TABLE IF NOT EXISTS `savestudentexam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  chongxin.savestudentexam 的数据：~0 rows (大约)
DELETE FROM `savestudentexam`;
/*!40000 ALTER TABLE `savestudentexam` DISABLE KEYS */;
/*!40000 ALTER TABLE `savestudentexam` ENABLE KEYS */;


-- 导出  表 chongxin.student 结构
DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `student_id` varchar(255) NOT NULL DEFAULT '',
  `student_name` varchar(255) DEFAULT NULL,
  `student_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  chongxin.student 的数据：38 rows
DELETE FROM `student`;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`student_id`, `student_name`, `student_pwd`, `grade_id`) VALUES
	('17356100084', '王璐', 'Wangklpl2010@', 'g5'),
	('163231000691', '牛慧涛', 'Nht0725!', 'g6'),
	('162711000970', '范丹丹', 'Fdd1006!', 'g7'),
	('163231000592', '郭敏敏', 'Gmm0620*', 'g8'),
	('163231000706', '袁世清', 'Ysq1997!', 'g10'),
	('162711000940', '侯梦杰', '@Jane1128', 'g12'),
	('18382100162', '马兰', '!Ml00162', 'g5'),
	('163231000122', '罗夏扬', 'Lxy20@', 'g6'),
	('152031000541', '张诗', '1609Azs!', 'g7'),
	('152221000137', '雷梦柯', 'baweiExam@163.com', 'g8'),
	('162711000971', '刘焕杰', 'Liu.0606@', 'g10'),
	('162711000557', '周骥宇', 'Zhou123.@', 'g12'),
	('151591000413', '窦永铎', '@DYDlove19990520', 'g5'),
	('18382100208', '郜英杰', 'Gyj863591815*', 'g6'),
	('151991000354', '郑伟浩', 'Zheng5831200*', 'g7'),
	('163231000281', '杨一帆', 'Yyf1998@', 'g8'),
	('18382100251', '雷佳', 'Lj521521@', 'g10'),
	('152121000450', '张搏康', 'Zbk580230@', 'g12'),
	('163231000741', '闫国程', '@1610Aygc', 'g1'),
	('18382100271', '赵倩', 'Zq@120319', 'g2'),
	('17382100322', '墨潘', '050888Mm@', 'g3'),
	('162221000234', '董梦全', '@Dmq123', 'g5'),
	('162231000822', ' 梁俊成', '*Ljv1341670218', 'g5'),
	('17382100218', '樊艳蓉', 'Fyr*521', 'g3'),
	('163231001257', '杨梦伟', '@Ymw0324', 'g8'),
	('18382100168', '杜孟芳', 'Dmf1993*', 'g9'),
	('163231000105', '葛荷清', 'Ghq123@@', 'g10'),
	('18381100254', '张克', 'Zk1992/*-+', 'g6'),
	('18382100268', '张硕', '96144DNz1*', 'g8'),
	('163231001026', '张少泽', 'Zsz0312@', 'g12'),
	('1632310000208', '杨超男', 'Ycn#521', 'g13'),
	('18382100069', '姚震宇', 'Yao930425?', 'g6'),
	('163231000432', '翟怡梦', 'Zym205650@', 'g7'),
	('17376100480', '郑豪', 'Ah@123', 'g8'),
	('17382100202', '李志勇', '@1610Alzy', 'g9'),
	('18382100057', '王坤', '@Wk521521', 'g10'),
	('162711000732', '陈倩', '@Cq0506', 'g12'),
	('162711000729', '魏澳回', '@WEIaohui0726', 'g2');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;


-- 导出  表 chongxin.test 结构
DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '0',
  `content` varchar(255) DEFAULT '0',
  `answer` varchar(255) DEFAULT '0',
  `classId` varchar(255) DEFAULT '0',
  `timeId` varchar(255) DEFAULT '0',
  `titleId` varchar(255) DEFAULT '0',
  `uid` varchar(255) DEFAULT '0',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='试题表';

-- 正在导出表  chongxin.test 的数据：~14 rows (大约)
DELETE FROM `test`;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` (`tid`, `title`, `content`, `answer`, `classId`, `timeId`, `titleId`, `uid`) VALUES
	(1, '幼儿园题', '这是一个非常简单的题', '不会', 'C4', 'T4', 'title3', '1'),
	(2, '小学题', '这题有点意思', '答案略', 'C3', 'T2', 'title2', '2'),
	(3, '中学题', '这题有点东西啊', '你猜', 'C2', 'T3', 'title4', '3'),
	(4, '黄冈题', '牛逼', '答案空', 'C1', 'T1', 'title1', '1'),
	(5, '高中题', '1+1=？', '3', 'C4', 'T1', 'title1', ''),
	(8, '新题一个', '出个题吧', '没有答案', 'C1', 'T3', 'title1', '1'),
	(12, '清华题', '好难啊', '答案略', 'C2', 'T3', 'title2', '3'),
	(14, '付费服务', '<p>而发生GV发不发达</p>', '<p>更好今年换个你换个</p>', 'C2', 'T3', 'title1', '1'),
	(15, '阿斯顿撒', '<p>sad撒多撒大声地</p>', '<p>萨达萨达萨达撒多撒多</p>', 'C1', 'T1', 'title1', '1'),
	(16, '111', '<p>1222</p>', '<p>21231</p>', 'C1', 'T1', 'title1', '1'),
	(17, 'himan', '<p>真难啊</p>', '<p>大圣打多</p>', 'C2', 'T2', 'title1', '3'),
	(18, '你猜你猜你猜', '<p>123456</p>', '<p>黑曼</p>', 'C2', 'T1', 'title1', '3'),
	(19, '测试题', '<p>测试功能</p>', '<p>没有答案喽</p>', 'C6', 'T3', 'title3', '1'),
	(20, '你猜你猜你猜', '', '', 'C1', 'T1', 'title1', '12');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;


-- 导出  表 chongxin.testtitletype 结构
DROP TABLE IF EXISTS `testtitletype`;
CREATE TABLE IF NOT EXISTS `testtitletype` (
  `titleId` varchar(50) NOT NULL,
  `titleType` varchar(50) NOT NULL,
  PRIMARY KEY (`titleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  chongxin.testtitletype 的数据：~5 rows (大约)
DELETE FROM `testtitletype`;
/*!40000 ALTER TABLE `testtitletype` DISABLE KEYS */;
INSERT INTO `testtitletype` (`titleId`, `titleType`) VALUES
	('title1', '解答题'),
	('title2', '代码阅读题'),
	('title3', '代码补全'),
	('title4', '修改bug'),
	('title5', '手写代码');
/*!40000 ALTER TABLE `testtitletype` ENABLE KEYS */;


-- 导出  表 chongxin.timetest 结构
DROP TABLE IF EXISTS `timetest`;
CREATE TABLE IF NOT EXISTS `timetest` (
  `timeId` varchar(255) NOT NULL,
  `timeType` varchar(255) NOT NULL,
  PRIMARY KEY (`timeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  chongxin.timetest 的数据：~4 rows (大约)
DELETE FROM `timetest`;
/*!40000 ALTER TABLE `timetest` DISABLE KEYS */;
INSERT INTO `timetest` (`timeId`, `timeType`) VALUES
	('T1', '周考一'),
	('T2', '周考二'),
	('T3', '周考三'),
	('T4', '月考');
/*!40000 ALTER TABLE `timetest` ENABLE KEYS */;


-- 导出  表 chongxin.user 结构
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` int(11) NOT NULL,
  `token` varchar(200) DEFAULT NULL,
  `portrait` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='用户登录信息表';

-- 正在导出表  chongxin.user 的数据：~9 rows (大约)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`uid`, `username`, `password`, `type`, `token`, `portrait`) VALUES
	(2, '高锋', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjEyMzMyMSI.QnW8FYUNRL5_qWxL5Kjh7JMz0s3txJWLBHjshzZbVJM', 0, NULL, NULL),
	(3, '于福意', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjEyMzMyMSI.QnW8FYUNRL5_qWxL5Kjh7JMz0s3txJWLBHjshzZbVJM', 1, NULL, NULL),
	(4, '李生智', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjEyMzMyMSI.QnW8FYUNRL5_qWxL5Kjh7JMz0s3txJWLBHjshzZbVJM', 2, NULL, NULL),
	(5, '沈梦晗', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjEyMzMyMSI.QnW8FYUNRL5_qWxL5Kjh7JMz0s3txJWLBHjshzZbVJM', 0, NULL, NULL),
	(8, 'heinan', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjEyMzMyMSI.QnW8FYUNRL5_qWxL5Kjh7JMz0s3txJWLBHjshzZbVJM', 0, NULL, NULL),
	(9, 'xuesheng', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjEyMzMyMSI.QnW8FYUNRL5_qWxL5Kjh7JMz0s3txJWLBHjshzZbVJM', 2, NULL, NULL),
	(10, 'chutizhe', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjEyMzMyMSI.QnW8FYUNRL5_qWxL5Kjh7JMz0s3txJWLBHjshzZbVJM', 1, NULL, NULL),
	(11, '测试员', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjEyMzMyMSI.QnW8FYUNRL5_qWxL5Kjh7JMz0s3txJWLBHjshzZbVJM', 0, NULL, NULL),
	(12, '陈强', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjEyMzMyMSI.QnW8FYUNRL5_qWxL5Kjh7JMz0s3txJWLBHjshzZbVJM', 0, NULL, '/public/1568076955616_4.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- 导出  表 chongxin.view_authority 结构
DROP TABLE IF EXISTS `view_authority`;
CREATE TABLE IF NOT EXISTS `view_authority` (
  `view_authority_id` varchar(50) NOT NULL,
  `view_authority` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视图权限接口';

-- 正在导出表  chongxin.view_authority 的数据：~3 rows (大约)
DELETE FROM `view_authority`;
/*!40000 ALTER TABLE `view_authority` DISABLE KEYS */;
INSERT INTO `view_authority` (`view_authority_id`, `view_authority`) VALUES
	('0', '登录,主页,试题管理,用户管理,考试管理,班级管理,阅卷管理'),
	('1', '登录,主页,试题管理,考试管理,阅卷管理'),
	('2', '登录,主页,学生主页,');
/*!40000 ALTER TABLE `view_authority` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
