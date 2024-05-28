/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb3 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t031`;
CREATE DATABASE IF NOT EXISTS `t031` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t031`;

DROP TABLE IF EXISTS `cepingjieguofenxi`;
CREATE TABLE IF NOT EXISTS `cepingjieguofenxi` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xueshenghao` varchar(200) DEFAULT NULL COMMENT '学生号',
  `xueshengxingming` varchar(200) DEFAULT NULL COMMENT '学生姓名',
  `ceshishijuan` varchar(200) DEFAULT NULL COMMENT '测试试卷',
  `ceshichengji` varchar(200) DEFAULT NULL COMMENT '测试成绩',
  `cepingjieguofenxi` longtext COMMENT '测评结果分析',
  `ceshiriqi` date DEFAULT NULL COMMENT '测试日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1615289320585 DEFAULT CHARSET=utf8mb3 COMMENT='测评结果分析';

DELETE FROM `cepingjieguofenxi`;
INSERT INTO `cepingjieguofenxi` (`id`, `addtime`, `xueshenghao`, `xueshengxingming`, `ceshishijuan`, `ceshichengji`, `cepingjieguofenxi`, `ceshiriqi`) VALUES
	(51, '2021-03-09 03:34:29', '学生号1', '学生姓名1', '测试试卷1', '测试成绩1', '测评结果分析1', '2021-03-09'),
	(52, '2021-03-09 03:34:29', '学生号2', '学生姓名2', '测试试卷2', '测试成绩2', '测评结果分析2', '2021-03-09'),
	(53, '2021-03-09 03:34:29', '学生号3', '学生姓名3', '测试试卷3', '测试成绩3', '测评结果分析3', '2021-03-09'),
	(54, '2021-03-09 03:34:29', '学生号4', '学生姓名4', '测试试卷4', '测试成绩4', '测评结果分析4', '2021-03-09'),
	(55, '2021-03-09 03:34:29', '学生号5', '学生姓名5', '测试试卷5', '测试成绩5', '测评结果分析5', '2021-03-09'),
	(56, '2021-03-09 03:34:29', '学生号6', '学生姓名6', '测试试卷6', '测试成绩6', '测评结果分析6', '2021-03-09'),
	(1615289320584, '2021-03-09 11:28:39', '学生1', '学生姓名1', '心理测试', '75', 'sdgsdsfgsg', '2021-03-09');

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='配置文件';

DELETE FROM `config`;
INSERT INTO `config` (`id`, `name`, `value`) VALUES
	(1, 'picture1', 'http://localhost:8080/springboot7w3d0/upload/picture1.jpg'),
	(2, 'picture2', 'http://localhost:8080/springboot7w3d0/upload/picture2.jpg'),
	(3, 'picture3', 'http://localhost:8080/springboot7w3d0/upload/picture3.jpg'),
	(6, 'homepage', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png');

DROP TABLE IF EXISTS `exampaper`;
CREATE TABLE IF NOT EXISTS `exampaper` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '试卷名称',
  `time` int NOT NULL COMMENT '考试时长(分钟)',
  `status` int NOT NULL DEFAULT '0' COMMENT '试卷状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1615289399179 DEFAULT CHARSET=utf8mb3 COMMENT='试卷表';

DELETE FROM `exampaper`;
INSERT INTO `exampaper` (`id`, `addtime`, `name`, `time`, `status`) VALUES
	(1615289399178, '2021-03-09 11:29:58', '心理测试', 60, 1);

DROP TABLE IF EXISTS `examquestion`;
CREATE TABLE IF NOT EXISTS `examquestion` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint NOT NULL COMMENT '所属试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1615289491242 DEFAULT CHARSET=utf8mb3 COMMENT='试题表';

DELETE FROM `examquestion`;
INSERT INTO `examquestion` (`id`, `addtime`, `paperid`, `papername`, `questionname`, `options`, `score`, `answer`, `analysis`, `type`, `sequence`) VALUES
	(1615289440836, '2021-03-09 11:30:40', 1615289399178, '心理测试', 'sdfsdfsdfsdgg', '[{"text":"A.sd","code":"A"},{"text":"B.sdff","code":"B"},{"text":"C.ssd","code":"C"}]', 3, 'B', 'fgdfgg', 0, 1),
	(1615289491241, '2021-03-09 11:31:30', 1615289399178, '心理测试', 'sdfgjhgdfdgh', '[{"text":"A.cxv","code":"A"},{"text":"B.xb","code":"B"},{"text":"C.xccb","code":"C"}]', 3, 'A', 'sdgsfgdfgdg', 0, 2);

DROP TABLE IF EXISTS `examrecord`;
CREATE TABLE IF NOT EXISTS `examrecord` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionid` bigint NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1704693141397 DEFAULT CHARSET=utf8mb3 COMMENT='考试记录表';

DELETE FROM `examrecord`;
INSERT INTO `examrecord` (`id`, `addtime`, `userid`, `username`, `paperid`, `papername`, `questionid`, `questionname`, `options`, `score`, `answer`, `analysis`, `myscore`, `myanswer`) VALUES
	(1615289547284, '2021-03-09 11:32:26', 11, NULL, 1615289399178, '心理测试', 1615289440836, 'sdfsdfsdfsdgg', '[{"text":"A.sd","code":"A"},{"text":"B.sdff","code":"B"},{"text":"C.ssd","code":"C"}]', 3, 'B', 'fgdfgg', 0, 'A'),
	(1615289562276, '2021-03-09 11:32:41', 11, NULL, 1615289399178, '心理测试', 1615289491241, 'sdfgjhgdfdgh', '[{"text":"A.cxv","code":"A"},{"text":"B.xb","code":"B"},{"text":"C.xccb","code":"C"}]', 3, 'A', 'sdgsfgdfgdg', 3, 'A'),
	(1704693138248, '2024-01-08 05:52:18', 1, NULL, 1615289399178, '心理测试', 1615289440836, 'sdfsdfsdfsdgg', '[{"text":"A.sd","code":"A"},{"text":"B.sdff","code":"B"},{"text":"C.ssd","code":"C"}]', 3, 'B', 'fgdfgg', 0, 'A'),
	(1704693141396, '2024-01-08 05:52:21', 1, NULL, 1615289399178, '心理测试', 1615289491241, 'sdfgjhgdfdgh', '[{"text":"A.cxv","code":"A"},{"text":"B.xb","code":"B"},{"text":"C.xccb","code":"C"}]', 3, 'A', 'sdgsfgdfgdg', 3, 'A');

DROP TABLE IF EXISTS `fudaoyuyue`;
CREATE TABLE IF NOT EXISTS `fudaoyuyue` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xueshenghao` varchar(200) DEFAULT NULL COMMENT '学生号',
  `xueshengxingming` varchar(200) DEFAULT NULL COMMENT '学生姓名',
  `shoujihaoma` varchar(200) DEFAULT NULL COMMENT '手机号码',
  `yuyueshijian` datetime DEFAULT NULL COMMENT '预约时间',
  `jiaoshigonghao` varchar(200) DEFAULT NULL COMMENT '教师工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `sfsh` varchar(200) DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1615289621019 DEFAULT CHARSET=utf8mb3 COMMENT='辅导预约';

DELETE FROM `fudaoyuyue`;
INSERT INTO `fudaoyuyue` (`id`, `addtime`, `xueshenghao`, `xueshengxingming`, `shoujihaoma`, `yuyueshijian`, `jiaoshigonghao`, `jiaoshixingming`, `sfsh`, `shhf`) VALUES
	(31, '2021-03-09 03:34:29', '学生号1', '学生姓名1', '手机号码1', '2021-03-09 11:34:29', '教师工号1', '教师姓名1', '是', ''),
	(32, '2021-03-09 03:34:29', '学生号2', '学生姓名2', '手机号码2', '2021-03-09 11:34:29', '教师工号2', '教师姓名2', '是', ''),
	(33, '2021-03-09 03:34:29', '学生号3', '学生姓名3', '手机号码3', '2021-03-09 11:34:29', '教师工号3', '教师姓名3', '是', ''),
	(34, '2021-03-09 03:34:29', '学生号4', '学生姓名4', '手机号码4', '2021-03-09 11:34:29', '教师工号4', '教师姓名4', '是', ''),
	(35, '2021-03-09 03:34:29', '学生号5', '学生姓名5', '手机号码5', '2021-03-09 11:34:29', '教师工号5', '教师姓名5', '是', ''),
	(36, '2021-03-09 03:34:29', '学生号6', '学生姓名6', '手机号码6', '2021-03-09 11:34:29', '教师工号6', '教师姓名6', '是', ''),
	(1615289621018, '2021-03-09 11:33:40', '学生1', '学生姓名1', '13823888881', '2021-03-11 08:00:00', '教师1', '教师姓名1', '是', NULL);

DROP TABLE IF EXISTS `jiaoshi`;
CREATE TABLE IF NOT EXISTS `jiaoshi` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jiaoshigonghao` varchar(200) NOT NULL COMMENT '教师工号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `jiaoshixingming` varchar(200) NOT NULL COMMENT '教师姓名',
  `touxiang` varchar(200) DEFAULT NULL COMMENT '头像',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `lianxifangshi` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `shenfenzhenghao` varchar(200) DEFAULT NULL COMMENT '身份证号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jiaoshigonghao` (`jiaoshigonghao`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COMMENT='教师';

DELETE FROM `jiaoshi`;
INSERT INTO `jiaoshi` (`id`, `addtime`, `jiaoshigonghao`, `mima`, `jiaoshixingming`, `touxiang`, `xingbie`, `lianxifangshi`, `youxiang`, `shenfenzhenghao`) VALUES
	(21, '2021-03-09 03:34:29', '教师1', '123456', '教师姓名1', 'http://localhost:8080/springboot7w3d0/upload/jiaoshi_touxiang1.jpg', '男', '13823888881', '773890001@qq.com', '440300199101010001'),
	(22, '2021-03-09 03:34:29', '教师2', '123456', '教师姓名2', 'http://localhost:8080/springboot7w3d0/upload/jiaoshi_touxiang2.jpg', '男', '13823888882', '773890002@qq.com', '440300199202020002'),
	(23, '2021-03-09 03:34:29', '教师3', '123456', '教师姓名3', 'http://localhost:8080/springboot7w3d0/upload/jiaoshi_touxiang3.jpg', '男', '13823888883', '773890003@qq.com', '440300199303030003'),
	(24, '2021-03-09 03:34:29', '教师4', '123456', '教师姓名4', 'http://localhost:8080/springboot7w3d0/upload/jiaoshi_touxiang4.jpg', '男', '13823888884', '773890004@qq.com', '440300199404040004'),
	(25, '2021-03-09 03:34:29', '教师5', '123456', '教师姓名5', 'http://localhost:8080/springboot7w3d0/upload/jiaoshi_touxiang5.jpg', '男', '13823888885', '773890005@qq.com', '440300199505050005'),
	(26, '2021-03-09 03:34:29', '教师6', '123456', '教师姓名6', 'http://localhost:8080/springboot7w3d0/upload/jiaoshi_touxiang6.jpg', '男', '13823888886', '773890006@qq.com', '440300199606060006');

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint NOT NULL COMMENT '留言人id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '留言内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1704693211588 DEFAULT CHARSET=utf8mb3 COMMENT='留言板';

DELETE FROM `messages`;
INSERT INTO `messages` (`id`, `addtime`, `userid`, `username`, `content`, `reply`) VALUES
	(111, '2021-03-09 03:34:29', 1, '用户名1', '留言内容1', '回复内容1'),
	(112, '2021-03-09 03:34:29', 2, '用户名2', '留言内容2', '回复内容2'),
	(113, '2021-03-09 03:34:29', 3, '用户名3', '留言内容3', '回复内容3'),
	(114, '2021-03-09 03:34:29', 4, '用户名4', '留言内容4', '回复内容4'),
	(115, '2021-03-09 03:34:29', 5, '用户名5', '留言内容5', '回复内容5'),
	(116, '2021-03-09 03:34:29', 6, '用户名6', '留言内容6', '回复内容6'),
	(1704693211587, '2024-01-08 05:53:30', 11, '学生1', '6666', NULL);

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `introduction` longtext COMMENT '简介',
  `picture` varchar(200) NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb3 COMMENT='公告通知';

DELETE FROM `news`;
INSERT INTO `news` (`id`, `addtime`, `title`, `introduction`, `picture`, `content`) VALUES
	(101, '2021-03-09 03:34:29', '标题1', '简介1', 'http://localhost:8080/springboot7w3d0/upload/news_picture1.jpg', '内容1'),
	(102, '2021-03-09 03:34:29', '标题2', '简介2', 'http://localhost:8080/springboot7w3d0/upload/news_picture2.jpg', '内容2'),
	(103, '2021-03-09 03:34:29', '标题3', '简介3', 'http://localhost:8080/springboot7w3d0/upload/news_picture3.jpg', '内容3'),
	(104, '2021-03-09 03:34:29', '标题4', '简介4', 'http://localhost:8080/springboot7w3d0/upload/news_picture4.jpg', '内容4'),
	(105, '2021-03-09 03:34:29', '标题5', '简介5', 'http://localhost:8080/springboot7w3d0/upload/news_picture5.jpg', '内容5'),
	(106, '2021-03-09 03:34:29', '标题6', '简介6', 'http://localhost:8080/springboot7w3d0/upload/news_picture6.jpg', '内容6');

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(1, 13, '学生3', 'xuesheng', '学生', '2znv9xgowgrnncrd12e4kvrhpkcn8sop', '2021-03-09 03:54:37', '2021-03-09 04:54:38'),
	(2, 11, '学生1', 'xuesheng', '学生', '5yfoiw6suhzc0jtsnrwnboecmu3cbtua', '2021-03-09 11:25:12', '2024-01-08 06:53:04'),
	(3, 21, '教师1', 'jiaoshi', '管理员', 'z2d20fkdyhzuoi3eijk9uh8ctlpc8cmi', '2021-03-09 11:27:32', '2024-01-08 06:52:49'),
	(4, 1, 'abo', 'users', '管理员', 'nbyxomjc7cyuiu7k8n3olm07oc51hrrp', '2021-03-09 11:34:58', '2024-01-08 06:51:13');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='用户表';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(1, 'admin', '123456', '管理员', '2021-03-09 03:34:29');

DROP TABLE IF EXISTS `xinlijiankangxuexi`;
CREATE TABLE IF NOT EXISTS `xinlijiankangxuexi` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `wenzhangbiaoti` varchar(200) NOT NULL COMMENT '文章标题',
  `tupian` varchar(200) DEFAULT NULL COMMENT '图片',
  `wenzhangneirong` longtext COMMENT '文章内容',
  `faburiqi` date DEFAULT NULL COMMENT '发布日期',
  `jiaoshigonghao` varchar(200) DEFAULT NULL COMMENT '教师工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1615289375050 DEFAULT CHARSET=utf8mb3 COMMENT='心理健康学习';

DELETE FROM `xinlijiankangxuexi`;
INSERT INTO `xinlijiankangxuexi` (`id`, `addtime`, `wenzhangbiaoti`, `tupian`, `wenzhangneirong`, `faburiqi`, `jiaoshigonghao`, `jiaoshixingming`) VALUES
	(61, '2021-03-09 03:34:29', '文章标题1', 'http://localhost:8080/springboot7w3d0/upload/xinlijiankangxuexi_tupian1.jpg', '文章内容1', '2021-03-09', '教师工号1', '教师姓名1'),
	(62, '2021-03-09 03:34:29', '文章标题2', 'http://localhost:8080/springboot7w3d0/upload/xinlijiankangxuexi_tupian2.jpg', '文章内容2', '2021-03-09', '教师工号2', '教师姓名2'),
	(63, '2021-03-09 03:34:29', '文章标题3', 'http://localhost:8080/springboot7w3d0/upload/xinlijiankangxuexi_tupian3.jpg', '文章内容3', '2021-03-09', '教师工号3', '教师姓名3'),
	(64, '2021-03-09 03:34:29', '文章标题4', 'http://localhost:8080/springboot7w3d0/upload/xinlijiankangxuexi_tupian4.jpg', '文章内容4', '2021-03-09', '教师工号4', '教师姓名4'),
	(65, '2021-03-09 03:34:29', '文章标题5', 'http://localhost:8080/springboot7w3d0/upload/xinlijiankangxuexi_tupian5.jpg', '文章内容5', '2021-03-09', '教师工号5', '教师姓名5'),
	(66, '2021-03-09 03:34:29', '文章标题6', 'http://localhost:8080/springboot7w3d0/upload/xinlijiankangxuexi_tupian6.jpg', '文章内容6', '2021-03-09', '教师工号6', '教师姓名6'),
	(1615289375049, '2021-03-09 11:29:34', '心理健康学习', 'http://localhost:8080/springboot7w3d0/upload/1615289366298.jpg', '<p>sdgsdfdsdf</p>', '2021-03-09', '教师1', '教师姓名1');

DROP TABLE IF EXISTS `xuesheng`;
CREATE TABLE IF NOT EXISTS `xuesheng` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xueshenghao` varchar(200) NOT NULL COMMENT '学生号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xueshengxingming` varchar(200) NOT NULL COMMENT '学生姓名',
  `touxiang` varchar(200) DEFAULT NULL COMMENT '头像',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shoujihaoma` varchar(200) DEFAULT NULL COMMENT '手机号码',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `shenfenzhenghao` varchar(200) DEFAULT NULL COMMENT '身份证号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xueshenghao` (`xueshenghao`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COMMENT='学生';

DELETE FROM `xuesheng`;
INSERT INTO `xuesheng` (`id`, `addtime`, `xueshenghao`, `mima`, `xueshengxingming`, `touxiang`, `xingbie`, `shoujihaoma`, `youxiang`, `shenfenzhenghao`) VALUES
	(11, '2021-03-09 03:34:29', '学生1', '123456', '学生姓名1', 'http://localhost:8080/springboot7w3d0/upload/xuesheng_touxiang1.jpg', '男', '13823888881', '773890001@qq.com', '440300199101010001'),
	(12, '2021-03-09 03:34:29', '学生2', '123456', '学生姓名2', 'http://localhost:8080/springboot7w3d0/upload/xuesheng_touxiang2.jpg', '男', '13823888882', '773890002@qq.com', '440300199202020002'),
	(13, '2021-03-09 03:34:29', '学生3', '123456', '学生姓名3', 'http://localhost:8080/springboot7w3d0/upload/xuesheng_touxiang3.jpg', '男', '13823888883', '773890003@qq.com', '440300199303030003'),
	(14, '2021-03-09 03:34:29', '学生4', '123456', '学生姓名4', 'http://localhost:8080/springboot7w3d0/upload/xuesheng_touxiang4.jpg', '男', '13823888884', '773890004@qq.com', '440300199404040004'),
	(15, '2021-03-09 03:34:29', '学生5', '123456', '学生姓名5', 'http://localhost:8080/springboot7w3d0/upload/xuesheng_touxiang5.jpg', '男', '13823888885', '773890005@qq.com', '440300199505050005'),
	(16, '2021-03-09 03:34:29', '学生6', '123456', '学生姓名6', 'http://localhost:8080/springboot7w3d0/upload/xuesheng_touxiang6.jpg', '男', '13823888886', '773890006@qq.com', '440300199606060006');

DROP TABLE IF EXISTS `xueshengxinxi`;
CREATE TABLE IF NOT EXISTS `xueshengxinxi` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xueshenghao` varchar(200) DEFAULT NULL COMMENT '学生号',
  `xueshengxingming` varchar(200) DEFAULT NULL COMMENT '学生姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shoujihaoma` varchar(200) DEFAULT NULL COMMENT '手机号码',
  `shenfenzhenghao` varchar(200) DEFAULT NULL COMMENT '身份证号',
  `xinliwentibeizhu` longtext COMMENT '心理问题备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1615289280528 DEFAULT CHARSET=utf8mb3 COMMENT='学生信息';

DELETE FROM `xueshengxinxi`;
INSERT INTO `xueshengxinxi` (`id`, `addtime`, `xueshenghao`, `xueshengxingming`, `xingbie`, `shoujihaoma`, `shenfenzhenghao`, `xinliwentibeizhu`) VALUES
	(41, '2021-03-09 03:34:29', '学生号1', '学生姓名1', '性别1', '手机号码1', '身份证号1', '心理问题备注1'),
	(42, '2021-03-09 03:34:29', '学生号2', '学生姓名2', '性别2', '手机号码2', '身份证号2', '心理问题备注2'),
	(43, '2021-03-09 03:34:29', '学生号3', '学生姓名3', '性别3', '手机号码3', '身份证号3', '心理问题备注3'),
	(44, '2021-03-09 03:34:29', '学生号4', '学生姓名4', '性别4', '手机号码4', '身份证号4', '心理问题备注4'),
	(45, '2021-03-09 03:34:29', '学生号5', '学生姓名5', '性别5', '手机号码5', '身份证号5', '心理问题备注5'),
	(46, '2021-03-09 03:34:29', '学生号6', '学生姓名6', '性别6', '手机号码6', '身份证号6', '心理问题备注6'),
	(1615289280527, '2021-03-09 11:28:00', '学生1', '学生姓名1', '男', '13823888881', '440300199101010001', 'dfggdgdfg');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
