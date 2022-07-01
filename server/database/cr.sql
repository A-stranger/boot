/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : cr

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 17/02/2022 11:30:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帐号',
  `pwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES (1, 'admin', 'admin', '2020-12-17 20:55:11');

-- ----------------------------
-- Table structure for ceshichengji
-- ----------------------------
DROP TABLE IF EXISTS `ceshichengji`;
CREATE TABLE `ceshichengji`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ceshishijuanid` int(10) UNSIGNED NOT NULL COMMENT '测试试卷id',
  `bianhao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `biaoti` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `mingcheng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `faburen` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布人',
  `kaoshibianhao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考试编号',
  `kaoshishizhang` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考试时长',
  `zongdefen` decimal(18, 2) NOT NULL COMMENT '总得分',
  `kaoshiren` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考试人',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ceshichengji_ceshishijuanid_index`(`ceshishijuanid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '测试成绩' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ceshichengji
-- ----------------------------
INSERT INTO `ceshichengji` VALUES (2, 3, '042322446400', '深圳市总经理助理招聘', '在线测试试题', '2021qiye001', '05081555111964', '', 2.00, '201708034201', '2021-05-08 15:55:11');
INSERT INTO `ceshichengji` VALUES (3, 2, '042322363322', '宝龙比亚迪直招普工6-9k包吃住', 'B测试', '2021qiye003', '05081555261506', '', 2.00, '201708034201', '2021-05-08 15:55:26');
INSERT INTO `ceshichengji` VALUES (4, 1, '04232241353', '销售顾问', 'A测试', '2021qiye002', '05081555381610', '', 0.00, '201708034201', '2021-05-08 15:55:38');

-- ----------------------------
-- Table structure for ceshijieguo
-- ----------------------------
DROP TABLE IF EXISTS `ceshijieguo`;
CREATE TABLE `ceshijieguo`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ceshishijuanid` int(10) UNSIGNED NOT NULL COMMENT '测试试卷id',
  `bianhao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `biaoti` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `mingcheng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `faburen` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布人',
  `kaoshibianhao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考试编号',
  `shititimu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试题题目',
  `leixing` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `daan` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '答案',
  `defen` decimal(18, 2) NOT NULL COMMENT '得分',
  `zimu` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字母',
  `kaoshiren` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考试人',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ceshijieguo_ceshishijuanid_index`(`ceshishijuanid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '测试结果' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ceshijieguo
-- ----------------------------
INSERT INTO `ceshijieguo` VALUES (3, 3, '042322446400', '深圳市总经理助理招聘', '在线测试试题', '2021qiye001', '05081555111964', '企业形象包括', '多选题', '企业环境', 2.00, 'A', '201708034201', '2021-05-08 15:55:11');
INSERT INTO `ceshijieguo` VALUES (4, 2, '042322363322', '宝龙比亚迪直招普工6-9k包吃住', 'B测试', '2021qiye003', '05081555261506', '国家标准《极限与配合》规定，孔的基本偏差是指', '单选题', '孔的下偏差', 2.00, 'B', '201708034201', '2021-05-08 15:55:26');
INSERT INTO `ceshijieguo` VALUES (5, 1, '04232241353', '销售顾问', 'A测试', '2021qiye002', '05081555381610', '生产观念强调的是', '单选题', '以质取胜', 0.00, 'C', '201708034201', '2021-05-08 15:55:38');

-- ----------------------------
-- Table structure for ceshishijuan
-- ----------------------------
DROP TABLE IF EXISTS `ceshishijuan`;
CREATE TABLE `ceshishijuan`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `zhaopinxinxiid` int(10) UNSIGNED NOT NULL COMMENT '招聘信息id',
  `bianhao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `biaoti` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `mingcheng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `kaoshishizhang` int(11) NOT NULL COMMENT '考试时长',
  `faburen` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布人',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ceshishijuan_zhaopinxinxiid_index`(`zhaopinxinxiid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '测试试卷' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ceshishijuan
-- ----------------------------
INSERT INTO `ceshishijuan` VALUES (1, 2, '04232241353', '销售顾问', 'A测试', 12000, '2021qiye002', '2021-04-23 23:05:07');
INSERT INTO `ceshishijuan` VALUES (2, 1, '042322363322', '宝龙比亚迪直招普工6-9k包吃住', 'B测试', 1500, '2021qiye003', '2021-04-23 23:05:14');
INSERT INTO `ceshishijuan` VALUES (3, 4, '042322446400', '深圳市总经理助理招聘', '在线测试试题', 1200, '2021qiye001', '2021-04-24 18:13:00');

-- ----------------------------
-- Table structure for ceshishiti
-- ----------------------------
DROP TABLE IF EXISTS `ceshishiti`;
CREATE TABLE `ceshishiti`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ceshishijuanid` int(10) UNSIGNED NOT NULL COMMENT '测试试卷id',
  `bianhao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `biaoti` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `mingcheng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `shititimu` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试题题目',
  `leixing` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `daan` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '答案',
  `faburen` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布人',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ceshishiti_ceshishijuanid_index`(`ceshishijuanid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '测试试题' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ceshishiti
-- ----------------------------
INSERT INTO `ceshishiti` VALUES (3, 1, '04232241353', '销售顾问', 'A测试', '生产观念强调的是', '单选题', '[{\"zimu\":\"A\",\"title\":\"以量取胜\",\"point\":\"3\"},{\"zimu\":\"B\",\"title\":\"以廉取胜\",\"point\":0},{\"zimu\":\"C\",\"title\":\"以质取胜\",\"point\":0},{\"zimu\":\"D\",\"title\":\"以形象取胜\",\"point\":0}]', '2021qiye002', '2021-04-24 17:53:08');
INSERT INTO `ceshishiti` VALUES (4, 2, '042322363322', '宝龙比亚迪直招普工6-9k包吃住', 'B测试', '国家标准《极限与配合》规定，孔的基本偏差是指', '单选题', '[{\"zimu\":\"A\",\"title\":\"孔上的偏差\",\"point\":0},{\"zimu\":\"B\",\"title\":\"孔的下偏差\",\"point\":\"2\"},{\"zimu\":\"C\",\"title\":\"靠近零线的偏差\",\"point\":0},{\"zimu\":\"D\",\"title\":\"公差带的平均偏差\",\"point\":0}]', '2021qiye003', '2021-04-24 18:07:35');
INSERT INTO `ceshishiti` VALUES (5, 3, '042322446400', '深圳市总经理助理招聘', '在线测试试题', '企业形象包括', '多选题', '[{\"zimu\":\"A\",\"title\":\"企业环境\",\"point\":\"2\"},{\"zimu\":\"B\",\"title\":\"企业规章制度\",\"point\":0},{\"zimu\":\"C\",\"title\":\"企业目标\",\"point\":0},{\"zimu\":\"D\",\"title\":\"企业作风\",\"point\":\"2\"}]', '2021qiye001', '2021-04-24 18:16:31');

-- ----------------------------
-- Table structure for diaochawenjuan
-- ----------------------------
DROP TABLE IF EXISTS `diaochawenjuan`;
CREATE TABLE `diaochawenjuan`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bianhao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `mingcheng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `datishichang` int(11) NOT NULL COMMENT '答题时长',
  `leixing` int(10) UNSIGNED NOT NULL COMMENT '类型',
  `faburen` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布人',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `diaochawenjuan_leixing_index`(`leixing`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调查问卷' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of diaochawenjuan
-- ----------------------------
INSERT INTO `diaochawenjuan` VALUES (5, '004', '大学生就业前景问卷调查', 120, 4, '2017001', '2021-05-01 08:25:03');
INSERT INTO `diaochawenjuan` VALUES (6, '001', '大学生就业质量', 120, 1, '2017001', '2021-05-01 08:30:26');
INSERT INTO `diaochawenjuan` VALUES (7, '002', '大学生就业期望调查问卷', 120, 3, '2017001', '2021-05-01 08:33:17');
INSERT INTO `diaochawenjuan` VALUES (9, '050710138966', '大学生就业问题', 1200, 2, 'admin', '2021-05-01 10:13:27');
INSERT INTO `diaochawenjuan` VALUES (10, '050817592411', '系统使用调查问卷', 1200, 1, 'admin', '2021-05-08 18:00:22');

-- ----------------------------
-- Table structure for gaoxiaoguanliyuan
-- ----------------------------
DROP TABLE IF EXISTS `gaoxiaoguanliyuan`;
CREATE TABLE `gaoxiaoguanliyuan`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `zhanghao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `mima` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `gaoxiaomingcheng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '高校名称',
  `fuzeren` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '负责人',
  `lianxidianhua` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `gaoxiaodizhi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '高校地址',
  `gaoxiaotupian` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '高校图片',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '高校管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gaoxiaoguanliyuan
-- ----------------------------
INSERT INTO `gaoxiaoguanliyuan` VALUES (1, '2017001', '123456', '计算机学院', '王老师', '12346791011', '三号组团楼11层', 'upload/20210423/logo.png', '2021-02-01 22:33:47');

-- ----------------------------
-- Table structure for gaoxiaoxinxi
-- ----------------------------
DROP TABLE IF EXISTS `gaoxiaoxinxi`;
CREATE TABLE `gaoxiaoxinxi`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bianhao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `gaoxiaomingcheng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '高校名称',
  `tupian` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `gaoxiaodizhi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '高校地址',
  `gaoxiaofuzeren` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '高校负责人',
  `lianxidianhua` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `gaoxiaoxiangqing` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '高校详情',
  `faburen` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布人',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `issh` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '否' COMMENT '是否审核',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '高校信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gaoxiaoxinxi
-- ----------------------------
INSERT INTO `gaoxiaoxinxi` VALUES (3, '10465', '郑州大学', 'upload/20210423/1.jpg', '河南省郑州市高新区科学大道100号', 'xxx', '13777158543', '<table class=\"wb_window\" width=\"100%\">\n<tbody>\n<tr>\n<td align=\"center\"><span class=\"titlestyle46443\">郑州大学简介</span></td>\n</tr>\n<tr>\n<td align=\"center\">&nbsp;</td>\n</tr>\n<tr>\n<td class=\"contentstyle46443\">\n<div id=\"vsb_content_2_24943_u41\">\n<div id=\"vsb_content_2\">\n<div class=\"v_news_content\">\n<div class=\"container\">\n<div class=\"row\">\n<div class=\"col-sm-12 col-md-9\">\n<div class=\"current-leader-divider\">&nbsp; 郑州大学（简称郑大，英文简称：ZZU）由河南省人民政府兴办，法定住所地为河南省郑州市科学大道100号。学校总占地面积5700余亩，现有四个校区：主校区（郑州市科学大道100号）、南校区（郑州市大学北路75号）、北校区（郑州市文化路97号）和东校区（郑州市大学北路40号）。学校面向全国招生，现有全日制普通本科生5万余人、各类在校研究生（含非全日制）2.2万余人，以及来自85个国家的留学生2500余人。</div>\n<div class=\"school-introduce\">\n<div id=\"vsb_content_1821_u181\">\n<div id=\"vsb_content\">\n<p>&nbsp; 郑州大学是国家&ldquo;211工程&rdquo;重点建设高校、一流大学建设高校和&ldquo;部省合建&rdquo;高校。站在新的历史起点上，学校确立了综合性研究型的办学定位，提出了一流大学建设&ldquo;三步走&rdquo;发展战略，力争到本世纪中叶建成世界一流综合性研究型大学。</p>\n<p>&nbsp; 郑州大学医科教育源于1928年的河南中山大学，1952年河南医学院独立建院，开启了河南医学高等教育的先河；原郑州大学创建于1956年，是新中国创办的第一所综合性大学，1996年被列入国家&ldquo;211工程&rdquo;重点建设高校；郑州工业大学成立于1963年，是原化工部直属的重点院校。2000年7月，原郑州大学、郑州工业大学和河南医科大学三校合并组建新郑州大学。教育家、历史学家、哲学家嵇文甫教授，物理学家霍秉权教授，耐火材料专家钟香崇院士，土木工程专家孙国梁教授，耳鼻咽喉科专家董民声教授，食管细胞学创始人沈琼教授，人体寄生虫学专家苏寿汦教授，南阳作家群代表人物二月河教授等一大批知名专家学者，都曾在此弘文励教。</p>\n<p>&nbsp; 学校设有哲学、经济学、法学、教育学、文学、历史学、理学、工学、农学、医学、管理学、艺术学12大学科门类，各学科门类均衡发展；有临床医学、材料科学与工程、化学3个一流建设学科；有凝聚态物理、材料加工工程、中国古代史、有机化学、化学工艺、病理学与病理生理学6个国家重点（培育）学科；化学、材料科学、临床医学、工程学、药理学与毒理学、生物学与生物化学、分子生物学与遗传学、神经科学与行为学8个学科（领域）ESI排名全球前1％，其中临床医学ESI排名全球前1.43&permil;、化学ESI排名全球前1.39&permil;；ESI学术机构全球排名第607位，位列全国高校第39位。学校有30个一级学科博士学位授权点、3个博士专业学位授权点，59个一级学科硕士学位授权点、32个硕士专业学位授权点，28个博士后科研流动站。现有教职工5800余人，其中两院院士、学部委员17人，海外院士4人；&ldquo;国家杰出青年科学基金&rdquo;获得者7人、&ldquo;长江学者奖励计划&rdquo;入选者11人、国家&ldquo;百千万人才工程&rdquo;人选24人，教授756人，具有博士学位教师2656人，形成了一支以院士和学术大师为引领，以&ldquo;杰青&rdquo;&ldquo;长江&rdquo;等为学术带头人，青年博士为骨干的人才队伍。中国工程院崔俊芝院士担任河南省大数据研究院院长，中国科学院高俊院士担任地球科学与技术学院院长，中国工程院何季麟院士担任材料科学与工程学院、河南省资源与材料工业技术研究院院长，中国工程院王复明院士担任地下工程研究院院长，中国工程院陈芬儿院士担任药学院、药物研究院院长，英国医学科学院院士、中国工程院外籍院士尼克&bull;莱蒙担任郑州大学医学科学院院长，中国社会科学院学部委员刘庆柱担任历史学院、中原历史与文化研究院（考古与文化遗产学院）院长，中国社会科学院学部委员金碚担任商学院院长，南振中先生、张海先生等执教我校。</p>\n<p>&nbsp; 学校校本部现有51个院系，117个本科专业。学校现有国家级教学团队4个，国家级教学名师6人，国家级专业综合改革试点专业6个，国家级特色专业14个，通过国家级认证专业17个，国家级实验教学示范中心5个，国家级虚拟仿真实验教学中心1个，国家级虚拟仿真实验教学项目3项，国家级工程实践教育中心7个，国家级精品课程14门，国家级精品视频公开课4门，国家级精品资源共享课14门，国家级双语教学示范课程2门，国家精品在线开放课程7门，国家级人才培养模式创新实验区2个，国家理科基础科学研究和教学人才培养基地1个、国家大学生文化素质教育基地1个、国家级大学生校外实践教育基地２个，获国家级教学成果奖10项。学校先后被列入国家级卓越工程师、卓越法律人才、卓越医生教育培养高校。学校被评选为&ldquo;2012&mdash;2014年度国家级大学生创新创业训练计划实施工作先进单位&rdquo;，是国家首批深化创新创业教育改革示范学校、全国创新创业典型经验高校。学校滋兰树蕙，桃李芬芳，百万校友成为民族复兴大业的建设者和各行各业的中坚骨干，形成独具特色的&ldquo;郑大品牌&rdquo;。</p>\n<p>&nbsp; 学校围绕国家重大战略实施，制定融入郑洛新国家自主创新示范区实施方案，构建创新驱动发展体系。拥有省部共建食管癌防治国家重点实验室、橡塑模具国家工程研究中心、绿色选冶与加工国家地方联合工程研究中心、互联网医疗国家工程实验室、重大基础设施检测修复技术国家地方联合工程实验室、国家钙镁磷复合肥技术研究推广中心、国家药物安全性评价研究中心、资源材料省部共建协同创新中心、国家领土主权与海洋权益协同创新中心（协同单位）；拥有1个国家药品临床研究基地，1个国家知识产权培训基地。国家超级计算郑州中心获批筹建。拥有12个教育部重点实验室、工程研究中心及人文社科重点研究基地；拥有水利与交通基础设施安全防护等7个省级协同创新中心。组建河南省资源与材料工业技术研究院、郑州大学医学科学院、郑州大学药物研究院、郑州大学现代分析与基因测序中心等校级直属科研机构。五年来，学校先后承担参与国家重点研发计划、国家科技重大专项等项目课题154项，获批国家自然科学基金、国家社会科学基金项目共计1628项。学校在神舟系列宇航员出舱面窗关键防护装置研究、磁约束热核聚变基础理论研究、车用燃料乙醇生产的关键技术及开发应用研究、非开挖工程技术和装备、&ldquo;一步法&rdquo;固相合成半芳香尼龙的高效制备技术、苯选择加氢制环己烯催化剂和催化工艺、难降解有机工业废水治理与毒性减排关键技术及装备、钢纤维混凝土特定结构计算理论和关键技术的研究与应用、生物遗传与表观遗传研究、植物油菜素内酯研究、魏晋南北朝史研究、隋唐史研究等领域取得突破性成果，获国家科技进步奖8项（含科普奖1项）、国家技术发明奖1项、国家自然科学奖2项。</p>\n</div>\n</div>\n<span id=\"vsb_content_1821_u18\"></span></div>\n</div>\n</div>\n</div>\n<div class=\"school-characteristic-culture\">\n<div class=\"school-characteristic-culture-info\">&nbsp;</div>\n</div>\n</div>\n</div>\n</div>\n</td>\n</tr>\n</tbody>\n</table>', '2017001', '2021-04-08 18:46:01', '是');

-- ----------------------------
-- Table structure for gerenjianli
-- ----------------------------
DROP TABLE IF EXISTS `gerenjianli`;
CREATE TABLE `gerenjianli`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `jianlibianhao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简历编号',
  `jianlileixing` int(10) UNSIGNED NOT NULL COMMENT '简历类型',
  `xingming` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `xingbie` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
  `nianling` int(11) NOT NULL COMMENT '年龄',
  `dianziyouxiang` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮箱',
  `lianxidianhua` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `xueli` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学历',
  `biyeyuanxiao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '毕业院校',
  `suoxuezhuanye` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所学专业',
  `gongzuojingli` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工作经历',
  `ziwopingjia` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自我评价',
  `jianliwenjian` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简历文件',
  `tianjiaren` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加人',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `gerenjianli_jianlileixing_index`(`jianlileixing`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '个人简历' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gerenjianli
-- ----------------------------
INSERT INTO `gerenjianli` VALUES (2, '001', 1, '王五', '男', 21, '1346@qq.com', '17803846215', '本科', '郑州大学', '网络工程', '工作时间：2020-01 - 12\n\n公司名称：七分简历管理咨询有限公司 | 所在部门： | 所在岗位：Group Leader/资深工程师', '我对待工作认真负责，善于沟通、协调有较强的组织本事与团队精神；活泼开朗、乐观上进、有爱心并善于施教并行；上进心强、勤于学习能不断提高自身的本事与综合素质。在未来的工作中，我将以充沛的精力，刻苦钻研的精神来努力工作，稳定地提高自我的工作本事，与公司同步发展。\n\n进取主动、独立性强、具有高度的职责感和敬业精神，待人真诚、诚实守信、团结协作意识强，能够吃苦耐劳，勇于挑战新事物，具有必须的开拓创新本事，“踏实做事，诚实做人”是我为人处世的原则。', 'upload/20210506/dab7cd2e-6986-4c5a-a466-80b2b0ae5d67.pdf', '201708034201', '2021-02-01 20:25:02');
INSERT INTO `gerenjianli` VALUES (3, '001', 2, '李三', '男', 22, '132456@qq.com', '17803846215', '本科', '郑州大学', '软件工程', '工作时间：2020-01 - 12\n\n公司名称：七分简历管理咨询有限公司 | 所在部门： | 所在岗位：Group Leader/资深工程师', '　　本人能吃苦耐劳，适应性强，协调性好，对工作认真负责，工作进取、主动、上进，无论要工作还是生活上都严格要求自我，并具有很强的自学本事、动手本事。', 'upload/20210506/c5b07b30-40f6-4da0-a573-5e6827f2bec2.pdf', '201708034202', '2021-02-01 20:29:54');
INSERT INTO `gerenjianli` VALUES (5, '050816381778', 1, '张三', '女', 23, '1346@qq.com', '13013603783', '本科', '郑州大学', '网络工程', '', '', 'upload/20210508/e0f352dd-3cc7-4d99-8400-9d0ea8005f45.pdf', '201708034203', '2021-05-08 16:39:24');

-- ----------------------------
-- Table structure for jianlileixing
-- ----------------------------
DROP TABLE IF EXISTS `jianlileixing`;
CREATE TABLE `jianlileixing`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `leixing` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简历类型' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jianlileixing
-- ----------------------------
INSERT INTO `jianlileixing` VALUES (1, 'A类型', '2021-02-02 02:52:37');
INSERT INTO `jianlileixing` VALUES (2, 'B类型', '2021-04-02 02:52:40');
INSERT INTO `jianlileixing` VALUES (3, 'C类型', '2021-04-02 02:52:43');

-- ----------------------------
-- Table structure for jiaoliu
-- ----------------------------
DROP TABLE IF EXISTS `jiaoliu`;
CREATE TABLE `jiaoliu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `liaotiantongdao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '聊天通道',
  `biaoti` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `shouxinren` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收信人',
  `faxinren` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发信人',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交流' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jiaoliu
-- ----------------------------
INSERT INTO `jiaoliu` VALUES (1, '042403134739', 'xxxxxxxxx', '222', '001', '2021-04-24 03:13:22');
INSERT INTO `jiaoliu` VALUES (3, '050717265176', '请问我的面试通过了吗', '2021qiye001', '201708034201', '2021-05-07 17:27:12');
INSERT INTO `jiaoliu` VALUES (4, '050719191701', '面试通了吗', '2021qiye002', '201708034201', '2021-05-07 19:19:57');

-- ----------------------------
-- Table structure for jieguo
-- ----------------------------
DROP TABLE IF EXISTS `jieguo`;
CREATE TABLE `jieguo`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `diaochawenjuanid` int(10) UNSIGNED NOT NULL COMMENT '调查问卷id',
  `bianhao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `mingcheng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `faburen` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布人',
  `datibianhao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '答题编号',
  `shititimu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试题题目',
  `leixing` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `daan` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '答案',
  `defen` decimal(18, 2) NOT NULL COMMENT '得分',
  `zimu` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '选线',
  `datiren` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '答题人',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jieguo_diaochawenjuanid_index`(`diaochawenjuanid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '结果' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jieguo
-- ----------------------------
INSERT INTO `jieguo` VALUES (5, 7, '002', '大学生就业期望调查问卷', '2017001', '05080853551628', '您对工作最注重的因素是', '单选题', '工资', 0.00, 'A', '201708034201', '2021-04-01 08:53:55');
INSERT INTO `jieguo` VALUES (6, 6, '001', '大学生就业质量', '2017001', '05080854257437', '您的年级', '单选题', '大四', 0.00, 'D', '201708034201', '2021-04-01 08:54:25');
INSERT INTO `jieguo` VALUES (7, 6, '001', '大学生就业质量', '2017001', '05080854257437', '您的性别：', '单选题', '男', 0.00, 'A', '201708034201', '2021-04-01 08:54:25');
INSERT INTO `jieguo` VALUES (8, 6, '001', '大学生就业质量', '2017001', '05080854257437', '以下哪项描述符合你毕业后的去向安排？', '多选题', '就业', 0.00, 'A', '201708034201', '2021-04-01 08:54:25');
INSERT INTO `jieguo` VALUES (9, 6, '001', '大学生就业质量', '2017001', '05080854257437', '你的专业是', '填空题', '网络工程', -1.00, '', '201708034201', '2021-04-01 08:54:25');
INSERT INTO `jieguo` VALUES (10, 5, '004', '大学生就业前景问卷调查', '2017001', '05080918451852', '您是否有详细的职业规划', '单选题', '有规划，目标清晰', 0.00, 'A', '2017001', '2021-04-08 09:18:45');

-- ----------------------------
-- Table structure for leixing
-- ----------------------------
DROP TABLE IF EXISTS `leixing`;
CREATE TABLE `leixing`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `leixing` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '类型' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of leixing
-- ----------------------------
INSERT INTO `leixing` VALUES (1, 'A类型', '2021-04-23 22:32:52');
INSERT INTO `leixing` VALUES (2, 'B类型', '2021-04-23 22:32:55');
INSERT INTO `leixing` VALUES (3, 'C类型', '2021-04-23 22:32:59');
INSERT INTO `leixing` VALUES (4, 'D类型', '2021-04-23 22:33:02');

-- ----------------------------
-- Table structure for liaotianjilu
-- ----------------------------
DROP TABLE IF EXISTS `liaotianjilu`;
CREATE TABLE `liaotianjilu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `jiaoliuid` int(10) UNSIGNED NOT NULL COMMENT '交流id',
  `liaotiantongdao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '聊天通道',
  `neirong` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `faxinren` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发信人',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `liaotianjilu_jiaoliuid_index`(`jiaoliuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '聊天记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of liaotianjilu
-- ----------------------------
INSERT INTO `liaotianjilu` VALUES (1, 1, '042403134739', '{\"type\":\"txt\",\"msg\":\"xxxx\"}', '001', '2021-04-24 03:46:07');
INSERT INTO `liaotianjilu` VALUES (2, 1, '042403134739', '{\"type\":\"txt\",\"msg\":\"xxxxx\"}', '001', '2021-04-24 03:46:46');
INSERT INTO `liaotianjilu` VALUES (3, 1, '042403134739', '{\"type\":\"txt\",\"msg\":\"xxxx\"}', '001', '2021-04-24 03:48:09');
INSERT INTO `liaotianjilu` VALUES (4, 1, '042403134739', '{\"type\":\"txt\",\"msg\":\"XXX\"}', '001', '2021-04-24 03:48:17');
INSERT INTO `liaotianjilu` VALUES (5, 1, '042403134739', '{\"type\":\"txt\",\"msg\":\"asdf\"}', '001', '2021-04-24 03:48:24');
INSERT INTO `liaotianjilu` VALUES (6, 1, '042403134739', '{\"type\":\"txt\",\"msg\":\"asdasdasd\"}', '001', '2021-04-24 03:50:17');
INSERT INTO `liaotianjilu` VALUES (7, 1, '042403134739', '{\"type\":\"txt\",\"msg\":\"asdasdasd\"}', '222', '2021-04-24 03:50:22');
INSERT INTO `liaotianjilu` VALUES (8, 1, '042403134739', '{\"type\":\"txt\",\"msg\":\"asdasd\"}', '001', '2021-04-24 03:52:32');
INSERT INTO `liaotianjilu` VALUES (9, 1, '042403134739', '{\"type\":\"txt\",\"msg\":\"asdasdasd\"}', '222', '2021-04-24 03:52:37');
INSERT INTO `liaotianjilu` VALUES (10, 2, '042415334561', '{\"type\":\"txt\",\"msg\":\"测试测试测试\"}', '003', '2021-04-24 15:34:15');
INSERT INTO `liaotianjilu` VALUES (11, 2, '042415334561', '{\"type\":\"txt\",\"msg\":\"测试测试测试上次\"}', '300', '2021-04-24 15:35:19');
INSERT INTO `liaotianjilu` VALUES (12, 3, '042416081439', '{\"type\":\"txt\",\"msg\":\"测试测试测试\"}', '003', '2021-04-24 17:01:50');
INSERT INTO `liaotianjilu` VALUES (13, 3, '042416081439', '{\"type\":\"txt\",\"msg\":\"测试测试上次\"}', '300', '2021-04-24 17:02:49');
INSERT INTO `liaotianjilu` VALUES (14, 3, '042416081439', '{\"type\":\"txt\",\"msg\":\"测试测试\"}', '300', '2021-04-24 17:02:51');
INSERT INTO `liaotianjilu` VALUES (15, 3, '050717265176', '{\"type\":\"txt\",\"msg\":\"通过了，恭喜\"}', '2021qiye001', '2021-05-07 17:29:34');
INSERT INTO `liaotianjilu` VALUES (16, 3, '050717265176', '{\"type\":\"txt\",\"msg\":\"微信可以具体聊工资吗\"}', '201708034201', '2021-05-07 17:31:13');
INSERT INTO `liaotianjilu` VALUES (17, 3, '050717265176', '{\"type\":\"txt\",\"msg\":\"可以的\"}', '2021qiye001', '2021-05-07 17:31:31');
INSERT INTO `liaotianjilu` VALUES (18, 4, '050719191701', '{\"type\":\"txt\",\"msg\":\"请问我的面试通过了吗\"}', '201708034201', '2021-05-07 19:20:43');
INSERT INTO `liaotianjilu` VALUES (19, 4, '050719191701', '{\"type\":\"txt\",\"msg\":\"恭喜，通过了\"}', '2021qiye002', '2021-05-07 19:21:28');

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `module` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块',
  `operationtype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型',
  `operationcontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作内容',
  `cx` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作用户',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES (109, '个人简历', '更新', '简历编号：001<br>姓名：王五<br>电子邮箱：1346@qq.com<br>联系电话：17803846215<br>学历：本科<br>毕业院校：郑州大学<br>所学专业：网络工程<br>工作经历：工作时间：2020-01 - 12\n\n公司名称：七分简历管理咨询有限公司 | 所在部门： | 所在岗位：Group Leader/资深工程师<br>自我评价：我对待工作认真负责，善于沟通、协调有较强的组织本事与团队精神；活泼开朗、乐观上进、有爱心并善于施教并行；上进心强、勤于学习能不断提高自身的本事与综合素质。在未来的工作中，我将以充沛的精力，刻苦钻研的精神来努力工作，稳定地提高自我的工作本事，与公司同步发展。\n\n进取主动、独立性强、具有高度的职责感和敬业精神，待人真诚、诚实守信、团结协作意识强，能够吃苦耐劳，勇于挑战新事物，具有必须的开拓创新本事，“踏实做事，诚实做人”是我为人处世的原则。', '学生', '201708034201', '2022-02-17 11:23:51');
INSERT INTO `logs` VALUES (110, '个人简历', '更新', '简历编号：001<br>姓名：李三<br>电子邮箱：132456@qq.com<br>联系电话：17803846215<br>学历：本科<br>毕业院校：郑州大学<br>所学专业：软件工程<br>工作经历：工作时间：2020-01 - 12\n\n公司名称：七分简历管理咨询有限公司 | 所在部门： | 所在岗位：Group Leader/资深工程师<br>自我评价：　　本人能吃苦耐劳，适应性强，协调性好，对工作认真负责，工作进取、主动、上进，无论要工作还是生活上都严格要求自我，并具有很强的自学本事、动手本事。', '学生', '201708034202', '2022-02-17 11:25:25');
INSERT INTO `logs` VALUES (111, '个人简历', '更新', '简历编号：050816381778<br>姓名：张三<br>电子邮箱：1346@qq.com<br>联系电话：13013603783<br>学历：本科<br>毕业院校：郑州大学<br>所学专业：网络工程<br>工作经历：<br>自我评价：', '学生', '201708034203', '2022-02-17 11:26:18');

-- ----------------------------
-- Table structure for lunbotu
-- ----------------------------
DROP TABLE IF EXISTS `lunbotu`;
CREATE TABLE `lunbotu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '连接地址',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '轮播图' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lunbotu
-- ----------------------------
INSERT INTO `lunbotu` VALUES (1, '1', 'upload/20210423/55d2983d-bba6-48cf-bf54-5e578480d5b1.png', '#', '2021-04-23 22:17:35');
INSERT INTO `lunbotu` VALUES (2, '2', 'upload/20210423/7044d7ec-3cd4-456a-8574-a8980f85425b.png', '#', '2021-04-23 22:17:56');
INSERT INTO `lunbotu` VALUES (3, '3', 'upload/20210423/0ceeeeab-7625-48eb-a624-57e31c81bab8.png', '#', '2021-04-23 22:18:23');

-- ----------------------------
-- Table structure for mianshijieguo
-- ----------------------------
DROP TABLE IF EXISTS `mianshijieguo`;
CREATE TABLE `mianshijieguo`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mianshitongzhiid` int(10) UNSIGNED NOT NULL COMMENT '面试通知id',
  `qiuzhishenqingid` int(10) UNSIGNED NOT NULL COMMENT '求职申请id',
  `zhaopinxinxiid` int(10) UNSIGNED NOT NULL COMMENT '招聘信息id',
  `bianhao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `biaoti` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `zhiweileixing` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位类型',
  `faburen` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布人',
  `shenqingren` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请人',
  `jieguo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '结果',
  `jieguobeizhu` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '结果备注',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mianshijieguo_mianshitongzhiid_index`(`mianshitongzhiid`) USING BTREE,
  INDEX `mianshijieguo_qiuzhishenqingid_index`(`qiuzhishenqingid`) USING BTREE,
  INDEX `mianshijieguo_zhaopinxinxiid_index`(`zhaopinxinxiid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '面试结果' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mianshijieguo
-- ----------------------------
INSERT INTO `mianshijieguo` VALUES (2, 2, 0, 0, '042322446400', '深圳市总经理助理招聘', '经营管理', '2021qiye001', '201708034201', '通过', '', '2021-05-07 18:46:44');
INSERT INTO `mianshijieguo` VALUES (3, 3, 0, 0, '050718267601', '高薪招聘星探经纪人8k+', '全职', '2021qiye002', '201708034201', '通过', '', '2021-05-07 18:54:23');

-- ----------------------------
-- Table structure for mianshitongzhi
-- ----------------------------
DROP TABLE IF EXISTS `mianshitongzhi`;
CREATE TABLE `mianshitongzhi`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `qiuzhishenqingid` int(10) UNSIGNED NOT NULL COMMENT '求职申请id',
  `zhaopinxinxiid` int(10) UNSIGNED NOT NULL COMMENT '招聘信息id',
  `bianhao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `biaoti` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `zhiweileixing` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位类型',
  `faburen` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布人',
  `shenqingren` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请人',
  `mianshishijian` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '面试时间',
  `mianshididian` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '面试地点',
  `mianshiyaoqiu` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '面试要求',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mianshitongzhi_qiuzhishenqingid_index`(`qiuzhishenqingid`) USING BTREE,
  INDEX `mianshitongzhi_zhaopinxinxiid_index`(`zhaopinxinxiid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '面试通知' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mianshitongzhi
-- ----------------------------
INSERT INTO `mianshitongzhi` VALUES (2, 3, 0, '042322446400', '深圳市总经理助理招聘', '经营管理', '2021qiye001', '201708034201', '2021-05-09 00:10:00', '网上面试', '准备好设备', '2021-05-07 18:45:08');
INSERT INTO `mianshitongzhi` VALUES (3, 4, 0, '050718267601', '高薪招聘星探经纪人8k+', '全职', '2021qiye002', '201708034201', '2021-05-09 00:14:00', '网上面试', '外表整洁', '2021-05-07 18:54:05');

-- ----------------------------
-- Table structure for qiuzhishenqing
-- ----------------------------
DROP TABLE IF EXISTS `qiuzhishenqing`;
CREATE TABLE `qiuzhishenqing`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `zhaopinxinxiid` int(10) UNSIGNED NOT NULL COMMENT '招聘信息id',
  `bianhao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `biaoti` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `zhiweileixing` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位类型',
  `faburen` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布人',
  `gerenjianli` int(10) UNSIGNED NOT NULL COMMENT '个人简历ID',
  `jianlibianhao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简历编号',
  `jianlileixing` int(10) UNSIGNED NOT NULL COMMENT '简历类型',
  `xingming` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `xingbie` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
  `nianling` int(11) NOT NULL COMMENT '年龄',
  `dianziyouxiang` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮箱',
  `lianxidianhua` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `xueli` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学历',
  `biyeyuanxiao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '毕业院校',
  `suoxuezhuanye` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所学专业',
  `gongzuojingli` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工作经历',
  `ziwopingjia` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自我评价',
  `jianliwenjian` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简历文件',
  `tianjiaren` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加人',
  `beizhu` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `zhuangtai` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `shenqingren` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请人',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `qiuzhishenqing_zhaopinxinxiid_index`(`zhaopinxinxiid`) USING BTREE,
  INDEX `qiuzhishenqing_gerenjianli_index`(`gerenjianli`) USING BTREE,
  INDEX `qiuzhishenqing_jianlileixing_index`(`jianlileixing`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '求职申请' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qiuzhishenqing
-- ----------------------------
INSERT INTO `qiuzhishenqing` VALUES (3, 4, '042322446400', '深圳市总经理助理招聘', '经营管理', '2021qiye001', 2, '001', 1, '王五', '男', 21, '1346@qq.com', '17803846215', '本科', '中原工学院', '网络工程', '工作时间：2020-01 - 12\n\n公司名称：七分简历管理咨询有限公司 | 所在部门： | 所在岗位：Group Leader/资深工程师', '我对待工作认真负责，善于沟通、协调有较强的组织本事与团队精神；活泼开朗、乐观上进、有爱心并善于施教并行；上进心强、勤于学习能不断提高自身的本事与综合素质。在未来的工作中，我将以充沛的精力，刻苦钻研的精神来努力工作，稳定地提高自我的工作本事，与公司同步发展。\n\n进取主动、独立性强、具有高度的职责感和敬业精神，待人真诚、诚实守信、团结协作意识强，能够吃苦耐劳，勇于挑战新事物，具有必须的开拓创新本事，“踏实做事，诚实做人”是我为人处世的原则。', 'upload/20210506/dab7cd2e-6986-4c5a-a466-80b2b0ae5d67.pdf', '201708034201', '', '已通知', '201708034201', '2021-05-07 17:25:26');
INSERT INTO `qiuzhishenqing` VALUES (4, 5, '050718267601', '高薪招聘星探经纪人8k+', '全职', '2021qiye002', 2, '001', 1, '王五', '男', 21, '1346@qq.com', '17803846215', '本科', '中原工学院', '网络工程', '工作时间：2020-01 - 12\n\n公司名称：七分简历管理咨询有限公司 | 所在部门： | 所在岗位：Group Leader/资深工程师', '我对待工作认真负责，善于沟通、协调有较强的组织本事与团队精神；活泼开朗、乐观上进、有爱心并善于施教并行；上进心强、勤于学习能不断提高自身的本事与综合素质。在未来的工作中，我将以充沛的精力，刻苦钻研的精神来努力工作，稳定地提高自我的工作本事，与公司同步发展。\n\n进取主动、独立性强、具有高度的职责感和敬业精神，待人真诚、诚实守信、团结协作意识强，能够吃苦耐劳，勇于挑战新事物，具有必须的开拓创新本事，“踏实做事，诚实做人”是我为人处世的原则。', 'upload/20210506/dab7cd2e-6986-4c5a-a466-80b2b0ae5d67.pdf', '201708034201', '', '已通知', '201708034201', '2021-05-07 18:51:21');
INSERT INTO `qiuzhishenqing` VALUES (6, 5, '050718267601', '高薪招聘星探经纪人8k+', '全职', '2021qiye002', 5, '050816381778', 1, '张三', '女', 23, '1346@qq.com', '13013603783', '本科', '中原工学院', '网络工程', '', '', 'upload/20210508/e0f352dd-3cc7-4d99-8400-9d0ea8005f45.pdf', '201708034203', '', '待审核', '201708034203', '2021-05-08 16:40:41');

-- ----------------------------
-- Table structure for shenqingshenhe
-- ----------------------------
DROP TABLE IF EXISTS `shenqingshenhe`;
CREATE TABLE `shenqingshenhe`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `qiuzhishenqingid` int(10) UNSIGNED NOT NULL COMMENT '求职申请id',
  `zhaopinxinxiid` int(10) UNSIGNED NOT NULL COMMENT '招聘信息id',
  `bianhao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `biaoti` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `zhiweileixing` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位类型',
  `faburen` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布人',
  `shenqingren` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请人',
  `shenhezhuangtai` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '审核状态',
  `shenhebeizhu` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '审核备注',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shenqingshenhe_qiuzhishenqingid_index`(`qiuzhishenqingid`) USING BTREE,
  INDEX `shenqingshenhe_zhaopinxinxiid_index`(`zhaopinxinxiid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '申请审核' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shenqingshenhe
-- ----------------------------
INSERT INTO `shenqingshenhe` VALUES (3, 3, 0, '042322446400', '深圳市总经理助理招聘', '经营管理', '2021qiye001', '201708034201', '通过', '', '2021-05-07 18:39:23');
INSERT INTO `shenqingshenhe` VALUES (4, 4, 0, '050718267601', '高薪招聘星探经纪人8k+', '全职', '2021qiye002', '201708034201', '通过', '', '2021-05-07 18:53:12');

-- ----------------------------
-- Table structure for shiti
-- ----------------------------
DROP TABLE IF EXISTS `shiti`;
CREATE TABLE `shiti`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `diaochawenjuanid` int(10) UNSIGNED NOT NULL COMMENT '调查问卷id',
  `bianhao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `mingcheng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `shititimu` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试题题目',
  `leixing` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `daan` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '答案',
  `faburen` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布人',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shiti_diaochawenjuanid_index`(`diaochawenjuanid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '试题' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shiti
-- ----------------------------
INSERT INTO `shiti` VALUES (4, 6, '001', '大学生就业质量', '你的专业是', '填空题', '', '2017001', '2021-05-07 08:46:00');
INSERT INTO `shiti` VALUES (5, 6, '001', '大学生就业质量', '以下哪项描述符合你毕业后的去向安排？', '多选题', '[{\"zimu\":\"A\",\"title\":\"就业\",\"point\":0},{\"zimu\":\"B\",\"title\":\"自主创业专升本\",\"point\":0},{\"zimu\":\"C\",\"title\":\"专升本\",\"point\":0},{\"zimu\":\"D\",\"title\":\"出国\",\"point\":0},{\"zimu\":\"E\",\"title\":\"考研\",\"point\":0}]', '2017001', '2021-05-07 08:53:17');
INSERT INTO `shiti` VALUES (6, 6, '001', '大学生就业质量', '您的年级', '单选题', '[{\"zimu\":\"A\",\"title\":\"大一\",\"point\":0},{\"zimu\":\"B\",\"title\":\"大二\",\"point\":0},{\"zimu\":\"C\",\"title\":\"大三\",\"point\":0},{\"zimu\":\"D\",\"title\":\"大四\",\"point\":0}]', '2017001', '2021-05-07 10:03:33');
INSERT INTO `shiti` VALUES (7, 9, '050710138966', '大学生就业问题', '你以后是否想找专业对口工作？', '单选题', '[{\"zimu\":\"A\",\"title\":\"是\",\"point\":0},{\"zimu\":\"B\",\"title\":\"否\",\"point\":0}]', 'admin', '2021-05-07 10:14:03');
INSERT INTO `shiti` VALUES (8, 6, '001', '大学生就业质量', '您的性别：', '单选题', '[{\"zimu\":\"A\",\"title\":\"男\",\"point\":0},{\"zimu\":\"B\",\"title\":\"女\",\"point\":0}]', '2017001', '2021-05-07 19:30:34');
INSERT INTO `shiti` VALUES (9, 7, '002', '大学生就业期望调查问卷', '您对工作最注重的因素是', '单选题', '[{\"zimu\":\"A\",\"title\":\"工资\",\"point\":0},{\"zimu\":\"B\",\"title\":\"公司环境，规模，知名度\",\"point\":0},{\"zimu\":\"C\",\"title\":\"公司福利\",\"point\":0},{\"zimu\":\"D\",\"title\":\"发展空间\",\"point\":0},{\"zimu\":\"E\",\"title\":\"企业文化\",\"point\":0},{\"zimu\":\"F\",\"title\":\"工作稳定性\",\"point\":0},{\"zimu\":\"G\",\"title\":\"专业对口\",\"point\":0}]', '2017001', '2021-05-08 08:47:58');
INSERT INTO `shiti` VALUES (10, 5, '004', '大学生就业前景问卷调查', '您是否有详细的职业规划', '单选题', '[{\"zimu\":\"A\",\"title\":\"有规划，目标清晰\",\"point\":0},{\"zimu\":\"B\",\"title\":\"有规划，大致了解\",\"point\":0},{\"zimu\":\"C\",\"title\":\"暂时没有\",\"point\":0}]', '2017001', '2021-05-08 09:18:31');

-- ----------------------------
-- Table structure for shoucangjilu
-- ----------------------------
DROP TABLE IF EXISTS `shoucangjilu`;
CREATE TABLE `shoucangjilu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收藏用户',
  `xwid` int(10) UNSIGNED NOT NULL COMMENT '对应模块id',
  `biao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收藏得模块',
  `biaoti` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '显示的标题',
  `url` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收藏URL',
  `ziduan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应模块字段',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shoucangjilu
-- ----------------------------
INSERT INTO `shoucangjilu` VALUES (1, '201708034202', 4, 'zhaopinxinxi', '深圳市总经理助理招聘', 'http://localhost:8080/', 'biaoti', '2021-05-06 17:40:54');
INSERT INTO `shoucangjilu` VALUES (2, '201708034201', 5, 'zhaopinxinxi', '高薪招聘星探经纪人8k+', 'http://localhost:8080/', 'biaoti', '2021-05-08 16:14:34');

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `token` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一值',
  `session` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保存得数据',
  `cx` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录权限',
  `login` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录模块',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录用户',
  `valueid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `token_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '当前时间',
  PRIMARY KEY (`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '前端登录凭证' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES ('22OQ4GXRC3GR0747Q76DA8DAM6IA8AUX', '{\"gaoxiaodizhi\":\"三号组团楼11层\",\"mima\":\"123456\",\"cx\":\"高校管理员\",\"addtime\":\"2021-02-01 22:33:47.0\",\"zhanghao\":\"2017001\",\"gaoxiaotupian\":\"upload/20210423/logo.png\",\"fuzeren\":\"王老师\",\"gaoxiaomingcheng\":\"计算机学院\",\"lianxidianhua\":\"12346791011\",\"id\":1,\"login\":\"高校管理员\",\"username\":\"2017001\"}', '高校管理员', '高校管理员', '2017001', '1', '2022-02-27 10:24:03');
INSERT INTO `token` VALUES ('5163QOYWPKXCULYMT2C87GODEH2WAHGS', '{\"touxiang\":\"upload/20210423/1b919eb4-fefe-4408-b048-0d39e65619d3.png\",\"mima\":\"123456\",\"xingbie\":\"男\",\"xuehao\":\"201708034201\",\"login\":\"学生\",\"xingming\":\"王五\",\"shouji\":\"17803846215\",\"cx\":\"学生\",\"addtime\":\"2021-04-23 22:51:30.0\",\"shifoujiuye\":\"是\",\"id\":1,\"shenfenzheng\":\"450924199907094418\",\"youxiang\":\"1346@qq.com\",\"username\":\"201708034201\"}', '学生', '学生', '201708034201', '1', '2022-02-26 10:32:17');
INSERT INTO `token` VALUES ('5IFRII7HEIDY6FACHSHKM4RQ5Q8Y9M87', '{\"gaoxiaodizhi\":\"三号组团楼11层\",\"mima\":\"123456\",\"cx\":\"高校管理员\",\"addtime\":\"2021-02-01 22:33:47.0\",\"zhanghao\":\"2017001\",\"gaoxiaotupian\":\"upload/20210423/logo.png\",\"fuzeren\":\"王老师\",\"gaoxiaomingcheng\":\"计算机学院\",\"lianxidianhua\":\"12346791011\",\"id\":1,\"login\":\"高校管理员\",\"username\":\"2017001\"}', '高校管理员', '高校管理员', '2017001', '1', '2022-02-26 09:36:41');
INSERT INTO `token` VALUES ('6LKWSXQAIBZ1XP5PD2YGC1QD4OD3Y9LB', '{\"touxiang\":\"upload/20210424/ed77887d-1f74-4146-b998-d326ca947065.png\",\"mima\":\"123456\",\"xingbie\":\"女\",\"xuehao\":\"201708034203\",\"login\":\"学生\",\"xingming\":\"张三\",\"shouji\":\"13015602782\",\"cx\":\"学生\",\"addtime\":\"2021-05-07 11:08:51.0\",\"shifoujiuye\":\"否\",\"id\":6,\"shenfenzheng\":\"450924199907094020\",\"youxiang\":\"1346@qq.com\",\"username\":\"201708034203\"}', '学生', '学生', '201708034203', '6', '2022-02-27 11:25:57');
INSERT INTO `token` VALUES ('CTSQBTURLVTHDFGUKGLBK6QQHKMWTDT4', '{\"gaoxiaodizhi\":\"三号组团楼11层\",\"mima\":\"123456\",\"cx\":\"高校管理员\",\"addtime\":\"2021-02-01 22:33:47.0\",\"zhanghao\":\"2017001\",\"gaoxiaotupian\":\"upload/20210423/logo.png\",\"fuzeren\":\"王老师\",\"gaoxiaomingcheng\":\"计算机学院\",\"lianxidianhua\":\"12346791011\",\"id\":1,\"login\":\"高校管理员\",\"username\":\"2017001\"}', '高校管理员', '高校管理员', '2017001', '1', '2022-02-26 10:28:46');
INSERT INTO `token` VALUES ('ISB21VVSG2SFVN0IP4WCVIZL4MEZVQGA', '{\"addtime\":\"2020-12-17 20:55:11.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2022-02-27 11:28:08');
INSERT INTO `token` VALUES ('KQ20GM53FBFLCTZXT4RBTKLIKUA0ELHH', '{\"touxiang\":\"upload/20210423/15.jpg\",\"mima\":\"123456\",\"xingbie\":\"男\",\"xuehao\":\"201708034202\",\"login\":\"学生\",\"xingming\":\"李六\",\"shouji\":\"13547525542\",\"cx\":\"学生\",\"addtime\":\"2021-05-08 16:48:06.0\",\"shifoujiuye\":\"否\",\"id\":7,\"shenfenzheng\":\"456321530256530\",\"youxiang\":\"1234@qq.com\",\"username\":\"201708034202\"}', '学生', '学生', '201708034202', '7', '2022-02-27 11:25:02');
INSERT INTO `token` VALUES ('L7GGRNR42QDXT360DCY8C3ASNT9X81M4', '{\"addtime\":\"2021-04-23 22:51:30.0\",\"id\":1,\"mima\":\"123456\",\"shenfenzheng\":\"450924199907094418\",\"shifoujiuye\":\"是\",\"shouji\":\"13655255200\",\"touxiang\":\"upload/20210423/1b919eb4-fefe-4408-b048-0d39e65619d3.png\",\"xingbie\":\"男\",\"xingming\":\"王五\",\"xuehao\":\"201708034201\",\"youxiang\":\"1346@qq.com\"}', '学生', '学生', '201708034201', '1', '2022-02-27 11:24:09');
INSERT INTO `token` VALUES ('LVETKSM1QQFXMBUU003ZMTGKS119LGWS', '{\"addtime\":\"2020-12-17 20:55:11.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2022-02-27 09:44:10');
INSERT INTO `token` VALUES ('N349GXW9P5RYLPG0TRD9AYLZMA8HUANG', '{\"addtime\":\"2020-12-17 20:55:11.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2022-02-27 10:23:32');
INSERT INTO `token` VALUES ('TO2WG7LU7G6NKGWCURC6Q6UBHUSWN4FO', '{\"addtime\":\"2021-04-23 22:35:13.0\",\"danweidizhi\":\"深圳市南山区高新科技园北区,深南大道北侧\",\"danweimingcheng\":\"tecent\",\"fuzeren\":\"老马\",\"id\":3,\"issh\":\"是\",\"lianxidianhua\":\"12346791010\",\"mima\":\"123456\",\"zhanghao\":\"2021qiye001\",\"zizhizhengming\":\"upload/20210423/10.png\"}', '用人单位', '用人单位', '2021qiye001', '3', '2022-02-26 15:37:45');
INSERT INTO `token` VALUES ('VD0CUUT6IYS9KHCTE1TLT3XT05OFPU3M', '{\"addtime\":\"2020-12-17 20:55:11.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2022-02-26 10:26:12');
INSERT INTO `token` VALUES ('VN2BZYAHU5M18DAVNXR0SH9GI8UXIGC5', '{\"addtime\":\"2020-12-17 20:55:11.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2022-02-27 11:22:35');
INSERT INTO `token` VALUES ('VOE862TR2341GH416NMNRXNCLAETSVBT', '{\"addtime\":\"2021-02-01 22:33:47.0\",\"fuzeren\":\"王老师\",\"gaoxiaodizhi\":\"三号组团楼11层\",\"gaoxiaomingcheng\":\"计算机学院\",\"gaoxiaotupian\":\"upload/20210423/logo.png\",\"id\":1,\"lianxidianhua\":\"12346791011\",\"mima\":\"123456\",\"zhanghao\":\"2017001\"}', '高校管理员', '高校管理员', '2017001', '1', '2022-02-27 10:01:29');

-- ----------------------------
-- Table structure for wenjuanjieguo
-- ----------------------------
DROP TABLE IF EXISTS `wenjuanjieguo`;
CREATE TABLE `wenjuanjieguo`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `diaochawenjuanid` int(10) UNSIGNED NOT NULL COMMENT '调查问卷id',
  `bianhao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `mingcheng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `faburen` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布人',
  `datibianhao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '答题编号',
  `datishichang` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '答题时长',
  `zongdefen` int(11) NOT NULL COMMENT '总得分',
  `datiren` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '答题人',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `wenjuanjieguo_diaochawenjuanid_index`(`diaochawenjuanid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '问卷结果' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wenjuanjieguo
-- ----------------------------
INSERT INTO `wenjuanjieguo` VALUES (3, 7, '002', '大学生就业期望调查问卷', '2017001', '05080853551628', '11', 0, '201708034201', '2021-05-08 08:53:55');
INSERT INTO `wenjuanjieguo` VALUES (4, 6, '001', '大学生就业质量', '2017001', '05080854257437', '13', 0, '201708034201', '2021-05-08 08:54:25');
INSERT INTO `wenjuanjieguo` VALUES (5, 5, '004', '大学生就业前景问卷调查', '2017001', '05080918451852', '2', 0, '2017001', '2021-05-08 09:18:45');

-- ----------------------------
-- Table structure for xinwenfenlei
-- ----------------------------
DROP TABLE IF EXISTS `xinwenfenlei`;
CREATE TABLE `xinwenfenlei`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fenleimingcheng` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新闻分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xinwenfenlei
-- ----------------------------
INSERT INTO `xinwenfenlei` VALUES (1, '站内新闻', '2021-04-23 21:07:32');
INSERT INTO `xinwenfenlei` VALUES (2, '行业资讯', '2021-04-23 21:16:19');

-- ----------------------------
-- Table structure for xinwenxinxi
-- ----------------------------
DROP TABLE IF EXISTS `xinwenxinxi`;
CREATE TABLE `xinwenxinxi`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `biaoti` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `fenlei` int(10) UNSIGNED NOT NULL COMMENT '分类',
  `tupian` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `tianjiaren` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加人',
  `dianjilv` int(11) NOT NULL COMMENT '点击率',
  `neirong` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xinwenxinxi_fenlei_index`(`fenlei`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新闻信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xinwenxinxi
-- ----------------------------
INSERT INTO `xinwenxinxi` VALUES (1, '关于开展信息工程学院2021年寒假大学生“返家乡”沿黄社会实践活动的通知', 1, 'upload/20210423/8.jpg', 'admin', 1, '<h4 style=\"text-align: center;\">关于开展信息工程学院2021年寒假大学生&ldquo;返家乡&rdquo;沿黄社会实践活动的通知</h4>\n<h5 style=\"text-align: center;\">来源：信息工程学院&nbsp;作者：管理员&nbsp;日期：2021-01-09&nbsp;点击量：2,403</h5>\n<div class=\"article_article\">\n<pre class=\"ceshi\">&nbsp;</pre>\n<p>各年级团总支：</p>\n<p>为深入学习贯彻习近平生态文明思想，贯彻落实习近平总书记在黄河流域生态保护和高质量发展座谈会上的重要讲话精神，贯彻落实省委十届十二次全会暨省委经济工作会议精神，认真落实团十八大关于动员青少年投身生态文明实践的工作部署，引领广大青年学生扎根中国大地了解国情民情，通过社会实践坚定理想信念、站稳人民立场、练就过硬本领、投身强国伟业，进一步增强&ldquo;四个意识&rdquo;、坚定&ldquo;四个自信&rdquo;、做到&ldquo;两个维护&rdquo;，根据疫情防控常态化形势，按照团省委《关于关于开展万名大学生&ldquo;返家乡&rdquo;沿黄社会实践活动的通知》的要求，现决定开展信息工程学院2021年寒假大学生&ldquo;返家乡&rdquo;沿黄社会实践活动。具体事宜通知如下。</p>\n<p><strong>一、活动主题</strong></p>\n<p>美丽中国看黄河 青春引领绿风尚</p>\n<p><strong>二、活动原则</strong></p>\n<p>1.确保安全。以保证健康安全为首要前提，严格遵守当地疫情防控要求，中、高风险地区不得组织开展社会实践活动，低风险地区在条件允许的情况下开展。活动开展前，要充分研究形势，做好安全预案。根据地方疫情防控形势动态调整工作部署，如遇突发情况，应立即暂停相关地区的活动，妥善做好有关安排，杜绝麻痹思想、侥幸心理。</p>\n<p>2.就近就便。活动以&ldquo;返家乡&rdquo;形式为主，尽量减少活动半径。以学生个人实践为主，严禁组织大规模、大范围人员聚集活动，原则上不跨地区进行。</p>\n<p>3.务求实效。要力求实效，反对&ldquo;形式主义&rdquo;&ldquo;摆拍走秀&rdquo;；要深入实际，力戒走马观花、蜻蜓点水甚至观光旅游；要帮忙不添乱、增彩不增负，不给基层增加负担。</p>\n<p><strong>三、活动内容</strong></p>\n<p>在统筹推进新冠肺炎疫情防控和经济社会发展背景下，紧紧围绕学习宣传贯彻习近平总书记在黄河流域生态保护和高质量发展座谈会上的重要讲话精神，结合百万青年沿黄生态产业发展协作行动&ldquo;七个项目&rdquo;（&ldquo;河小青&rdquo;助力黄河流域生态保护项目、&ldquo;河小识&rdquo;助力黄河流域中心城市垃圾分类项目、&ldquo;河小二&rdquo;黄河流域农产品直播展销项目、&ldquo;河小企&rdquo;黄河流域青年企业家建功项目、&ldquo;河小文&rdquo;黄河流域非物质文化遗产青少年研学交流项目、&ldquo;河小社&rdquo;黄河生态环保社会组织孵化项目、&ldquo;河小团&rdquo;黄河滩区基层团组织建设行动），突出环保宣传、文化寻访、产业调研、志愿扶贫等重点，引导青年学生利用寒假时间深入家乡周边沿黄社区、乡村、企业事业单位等开展活动并形成实践成果。</p>\n<p>1.开展环保宣传活动。组建&ldquo;河小青&rdquo;黄河流域生态保护志愿者队伍，聚焦沿黄生态提质，以水质监测、文明劝导、植绿护绿等为重点，开展生态理念宣讲、环保技术服务、巡河护河等形式多样的志愿服务活动。深入社区、村庄等基层一线，积极宣传普及垃圾分类知识，提升广大群众对垃圾分类的认知认同，为国家城市生活垃圾分类推进贡献青春力量。</p>\n<p>2.开展文化寻访活动。以公益性非遗展厅、非遗体验基地、博物馆、景区为依托，组织学生进行研学交流，开展非遗展示交流活动。通过讲好&ldquo;黄河故事&rdquo;，守好文化遗产，延续历史文脉，引导广大学子坚定文化自信，凝聚实现中华民族伟大复兴中国梦的精神力量。</p>\n<p>3.开展产业调研活动。动员校友会青年企业家积极承接学生到企业进行参观调研，围绕企业贯彻新发展理念，发展节水、绿色农业，实施智能、绿色、技术改造，发展产业扶贫，立足民俗风情，创新文旅产品等开展调查分析，形成调研报告，为企业探索富有地域特色的高质量发展新路子出谋划策，为我省构建与黄河生态相适应的产业体系贡献智慧。</p>\n<p>4.开展志愿扶贫活动。结合当地实际，通过线上直播等多种宣传方式推介黄河流域特色农产品，打响黄河流域农产品特色品牌；组织动员沿黄流域家乡学子开展沿黄流域入户走访调查，对脱贫攻坚成果和产业发展现状进行分析总结，为贫困地区做大做强特色优势产业提供调研数据，助力黄河流域脱贫攻坚与乡村振兴有效衔接。</p>\n<p><strong>四、活动流程</strong></p>\n<p><strong>（一）项目实施</strong></p>\n<p>各位学生可自愿报名参加，根据实际情况组建项目团队，以&ldquo;返家乡&rdquo;形式为主，开展寒假社会实践活动。</p>\n<p>请各团队于2021年1月13日前，将《信息工程学院2021年寒假社会实践活动报名表》（见附件）发送至邮箱ieshehuishijianbu@163.com。</p>\n<p><strong>（二）结项安排</strong></p>\n<p>社会实践活动结束后，由实践团队完成项目结项材料，相关书面材料在开学后一周内上交，结项材料包括：</p>\n<p>①社会实践活动报告。可以采用调研报告或者论文的形式呈现，字数不少于2000字。在开学后一周内，由团队负责人上交至院团委。</p>\n<p>②社会实践纪实材料。实践纪实以图片为主，记录整个实践互动的过程，包括但不限于：团队合影、实践场地、活动现场、领导参与、宣传报道等，每张图片附以精炼的文字说明。如有宣传报道，应提交相关支撑材料。附于社会实践活动报告后一起装订。</p>\n<p>&nbsp;</p>\n<p style=\"text-align: right;\">共青团郑州大学信息工程学院委员会</p>\n<p style=\"text-align: right;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2021年1月8日</p>\n<p>&nbsp;</p>\n<img src=\"./upload/1645065172084.png\" alt=\"\" /><a>相关附件：</a>\n<div class=\"clear\">&nbsp;</div>\n<p><a href=\"http://xg.zzu.edu.cn/file/2VcXpWwPB9pUrnnAyZ8ayX.zip\">郑州大学信息工程学院2021年寒假社会实践活动 附件.zip</a></p>\n</div>', '2021-04-23 22:21:58');
INSERT INTO `xinwenxinxi` VALUES (2, '郑州知识产权法庭巡回法庭开庭进校园', 2, 'upload/20210423/6.jpeg', 'admin', 1, '<table class=\"winstyle67215\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"titlestyle67215\" align=\"center\">郑州知识产权法庭巡回法庭开庭进校园</td>\n</tr>\n<tr>\n<td align=\"center\"><span class=\"timestyle67215\">2021-04-13</span>&nbsp;<span class=\"authorstyle67215\">毕明理&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;(浏览：<span id=\"n25517\">344</span>)</td>\n</tr>\n<tr>\n<td align=\"right\">&nbsp;</td>\n</tr>\n<tr>\n<td class=\"contentstyle67215\">\n<div id=\"vsb_newscontent\" class=\"c67215_content\">\n<div id=\"vsb_content_500\">\n<div class=\"v_news_content\">\n<p><img class=\"img_vsb_content\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://www.zut.edu.cn/__local/A/DE/21/E127857B0139A63273C58587991_D9335895_1704C.jpeg\" width=\"600\" /></p>\n<p class=\"vsbcontent_start\">&nbsp; &nbsp; 为进一步普及知识产权相关法律，提高师生知识产权保护意识，4月13日，在世界知识产权日到来之际，郑州知识产权法庭巡回法庭受邀来到我校龙湖校区，对一起计算机软件著作权纠纷案件进行公开审理。</p>\n<p>&nbsp; &nbsp; 本次巡回法庭进校园活动，是我校知识产权周暨第七届法律文化节的重要活动之一，也是我校法律硕士研究生和法学、知识产权专业本科生开展法律实践活动的重要内容。</p>\n<p>&nbsp; &nbsp; 此次审判采取普通程序，在庭审过程中运用质辩合一模式，由钱红军法官任审判长，薛春锋和张永杰两位法官任审判员，周彩丽任书记员。审理案件为长沙米拓信息技术有限公司诉河南工程建设协会侵害计算机软件著作权纠纷一案，在知识产权类案件中具有代表性和典型性。案件涉及到被告方的网站是否侵犯原告方就该网站所享有的署名权、修改权等权利，经过原告与被告答辩、质证、辩论、休庭等程序，最终在法庭宣判前双方均同意调解。庭审结束，钱红军和薛春锋两位法官就学生代表提出的相关诉讼程序及法律实体问题进行了专业解答，并就知识产权审判实务领域的前沿问题进行了讲解。广大师生受益匪浅。</p>\n<p class=\"vsbcontent_end\">&nbsp; &nbsp; 本次&ldquo;知识产权法庭进校园&rdquo;活动为学生们提供良好的实习实践环境，有利于将校外实践教学与专业学习相融合，全面提升学生的专业素质和综合能力。学习之余，让广大学生真切地接触庭审，深入了解庭审程序，更好地理解法律适用过程中面临的种种问题，同时也对司法的繁简分流制度以及司法过程的公正与高效有了切身体会，激发起学习法律知识的热情。法学院/知识产权学院副院长张金艳，党总支副书记任继江及部分研究生导师与我校研究生、本科生共100余人一起参会。</p>\n</div>\n</div>\n</div>\n</td>\n</tr>\n</tbody>\n</table>', '2021-04-23 22:22:18');
INSERT INTO `xinwenxinxi` VALUES (3, '信息工程学院成功举办2020年度“活力杯”共青团工作项目大赛', 1, 'upload/20210423/7.jpg', 'admin', 2, '<h4 style=\"text-align: center;\">信息工程学院成功举办2020年度&ldquo;活力杯&rdquo;共青团工作项目大赛</h4>\n<h5 style=\"text-align: center;\">来源：信息工程学院&nbsp;作者：管理员&nbsp;日期：2020-11-12&nbsp;点击量：2,328</h5>\n<div class=\"article_article\">\n<p class=\"ceshi\">&nbsp;</p>\n<p>为夯实基础工作，提升基本能力，发扬基层首创精神，充分挖掘基层活力，11月10日，郑州大学信息工程学院于学术报告厅成功举办&ldquo;活力杯&rdquo;共青团工作项目大赛。学院团委负责人孙燚，2018级电子信息类辅导员贾淑霞，2020级计算机类辅导员李耕毅出席本次活动并担任评委。参赛选手、团员代表和学生干部代表参加了本次活动。</p>\n<p>18点40分，&ldquo;活力杯&rdquo;共青团工作项目大赛拉开序幕。全体成员起立，奏团歌，随后，主持人宣布信息工程学院2020年度\"活力杯\"共青团工作项目大赛正式开始。20组参赛选手依次上台，通过PPT演示、案例分析、视频等丰富多彩的表现形式进行现场展示，对策划案进行解说，并从容应对评委的提问。比赛现场气氛热烈，参赛选手精神饱满。随后，评委进行现场点评和打分，并对各位选手提出宝贵的指导意见，帮助他们更好地完善策划。最后，主持人宣布信息工程学院2020年度\"活力杯\"共青团工作项目大赛获奖名单，评委老师为获奖选手颁奖并合影留念。</p>\n<p>&nbsp;本次\"活力杯\"共青团工作项目大赛充分调动了同学们的积极性，进一步发扬了基层首创精神。通过参赛选手的精彩表现，我们不仅看到了同学们创新创业能力的提升，更感受到了他们为巩固共青团基层组织建设而做出的不懈努力。相信在未来的工作中，广大团员会继续提升自我，为建设更加璀璨的团基层组织贡献力量。</p>\n</div>', '2021-04-23 22:22:46');
INSERT INTO `xinwenxinxi` VALUES (4, '材料与化工学院召开2021年度就业工作专题推进会', 2, 'upload/20210423/3.png', 'admin', 1, '<table class=\"winstyle67215\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"titlestyle67215\" align=\"center\">材料与化工学院召开2021年度就业工作专题推进会</td>\n</tr>\n<tr>\n<td align=\"center\"><span class=\"timestyle67215\">2021-04-21</span>&nbsp;<span class=\"authorstyle67215\">毕明理&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;(浏览：<span id=\"n25558\">293</span>)</td>\n</tr>\n<tr>\n<td align=\"right\">&nbsp;</td>\n</tr>\n<tr>\n<td class=\"contentstyle67215\">\n<div id=\"vsb_newscontent\" class=\"c67215_content\">\n<div id=\"vsb_content_500\">\n<div class=\"v_news_content\">\n<p class=\"vsbcontent_start\">&nbsp; &nbsp; 为进一步做实2021年就业工作，近日，材料与化工学院召开专题会议，传达学校就业工作会议精神，安排推进2021届毕业生就业工作。学院全体领导班子成员，就业工作领导小组成员，各系、所、中心负责人，全体辅导员，毕业班班主任参加会议。</p>\n<p>&nbsp; &nbsp; 会议通报了学院2021届毕业生就业情况：截止4月中旬，262名毕业生中，参加研究生考试156人，上线122人，确定录取88人，占考研人数的56.41%；已签订就业协议49人，占毕业生总人数18.70%。会议特别就2021届毕业生就业状况统计、就业工作制度执行、发挥导师就业引导作用等工作，进行了明确分工，制定了时间表。</p>\n<p>&nbsp; &nbsp; 会议就做好下一步就业工作要求，一是坚决落实就业工作&ldquo;一把手&rdquo;工程，充分发挥学院就业工作领导小组作用，明确班子成员职责分工，形成就业工作合力。二是发挥辅导员作为落实就业工作的着力点，加强毕业生思想政治工作力度，认真细致做好教育引导，帮助学生树立正确的就业观，引导毕业生合理调整就业期望，同时要多方联络、加强服务，不断拓宽就业信息渠道。三是加强学生学习能力培养，坚持&ldquo;考研就是高质量就业&rdquo;导向，以考研促学风、以考研促就业。</p>\n<p class=\"vsbcontent_end\">&nbsp; &nbsp; 据了解，近五年，材化学院就业率一直保持在95%以上，其中毕业生考研考取率一直在25%以上，位居全校前列且逐年提升。2020届毕业生考取率高达33.46%。学生在大一大二期间就已经树立考研意愿，意向考研率在90%以上，有效形成了考研就是高质量就业的浓厚氛围。（通讯员 张皖豫 邢军阳 洪潇）</p>\n</div>\n</div>\n</div>\n</td>\n</tr>\n</tbody>\n</table>', '2021-04-23 22:23:14');
INSERT INTO `xinwenxinxi` VALUES (5, '关于开展信息工程学院第五届“挑战杯”大学生创业计划大赛的通知', 1, 'upload/20210423/5.jpg', 'admin', 0, '<p style=\"text-align: center;\">&nbsp;</p>\n<h4 style=\"text-align: center;\">关于开展信息工程学院第五届&ldquo;挑战杯&rdquo;大学生创业计划大赛的通知</h4>\n<h5 style=\"text-align: center;\">来源：信息工程学院&nbsp;作者：管理员&nbsp;日期：2021-10-25&nbsp;点击量：788</h5>\n<div class=\"article_article\">\n<p class=\"ceshi\">&nbsp;</p>\n<p>根据学校&ldquo;挑战杯&rdquo;赛事整体工作安排，为培养学生的创新意识、提升创造能力，为&ldquo;挑战杯&rdquo;校赛选拔优秀作品，现将本届&ldquo;挑战杯&rdquo;相关事宜通知如下：</p>\n<p><strong>一、大赛简介</strong></p>\n<p>大学生创业大赛是一种创业竞赛活动，大赛借助风险投资的运作模式，由在校大学生自由组成学科交叉、优势互补的创业团队，围绕一个具有市场前景的技术产品或服务理念，以获得风险投资为目的，完成一份包括企业概述、业务与业务展望、风险因素、投资回报与退出策略、组织管理、财务预测等方面内容的创业计划书，最终通过书面评审和现场答辩的方式评出获奖团队。</p>\n<p><strong>二、竞赛方式</strong></p>\n<p>本届竞赛采取学院初赛和学校决赛两阶<a name=\"_GoBack\"></a>段赛事形式组织开展，学院将根据初赛成绩择优推荐作品参加学校决赛，学校决赛设置书面评审及现场终审两个评审环节。学校聘请相关专家评选出具有较高学术水平、实用价值和创新意义的优秀作品给予奖励，推荐优秀作品参加上级竞赛，同时组织学术交流和科技成果展览、转让等活动。</p>\n<p><strong>三、参赛资格</strong></p>\n<p>在举办2022年6月1日以前正式注册的全日制非成人教育的各类普通高等学校在校专科生、本科生、硕士研究生（不含在职研究生）可参加。硕博连读生、直接攻读博士生若在2022年6月1日前未通过博士资格考试的，可以按硕士研究生学历申报作品；没有实行资格考试制度的，前两年可以按硕士研究生学历申报作品；本硕博连读生，按照四年、二年分别对应本、硕申报。博士研究生仅可作为项目团队成员参赛（不作项目负责人）、且人数不超过团队成员数量的30%。</p>\n<p><strong>四、申报内容</strong></p>\n<p>1.科技创新和未来产业：突出科技创新，在人工智能、网络信息、生命科学、新材料、新能源等领域，结合实践观察设计项目。</p>\n<p>2.乡村振兴和脱贫攻坚：围绕实施乡村振兴战略和打赢脱贫攻坚战。在农林牧渔、电子商务、旅游休闲等领域，结合实践观察设计项目。</p>\n<p>3.城市治理和社会服务：围绕国家治理体系和治理能力现代化建设，在政务服务、消费生活、医疗服务、教育培训、交通物流、金融服务等领域，结合实践观察设计项目。</p>\n<p>4.生态环保和可持续发展：围绕可持续发展战略，在环境治理、可持续资源开发、生态环保、清洁能源应用等领域，结合实践观察设计项目。</p>\n<p>5.文化创意和区域合作：突出共融、共享，紧密围绕&ldquo;一带一路&rdquo;和&ldquo;京津冀&rdquo;、&ldquo;长三角&rdquo;、&ldquo;粤港澳大湾区&rdquo;、&ldquo;咸渝经济圈&rdquo;等经济合作带建设，在工艺与设计、动漫广告、体育竞技和国际文化传播、对外交流培训、对外经贸等领域，结合实践观察设计项目。</p>\n<p><strong>五、实施步骤及具体事项</strong></p>\n<p>1、报名阶段:即日起至十一月上旬（具体截止时间等候通知）</p>\n<p>1、选题论证阶段：11月10日</p>\n<p>2、学院初赛：12月1日（评审细则可参考附件4）</p>\n<p>3、推荐优秀作品参加学校决赛阶段：12月上旬</p>\n<p><strong>六、报名方式</strong></p>\n<p>有意向报名参加竞赛的同学请加入QQ群：702714592，在QQ群中了解更多比赛信息。</p>\n<p>联系人：焦阳</p>\n<p>联系人电话：15838368565</p>\n<p style=\"text-align: right;\">共青团郑州大学信息工程学院委员会</p>\n<p style=\"text-align: right;\">2021年10月25日</p>\n<p>附件1.关于举办郑州大学2022年&ldquo;挑战杯&rdquo;大学生创业计划竞赛的预通知</p>\n<p>附件2.2022年&ldquo;挑战杯&rdquo;郑州大学生创业计划竞赛参赛项目申报表</p>\n<p>附件3.挑战杯全国大学生创业计划竞赛章程</p>\n<p>附件4.郑州大学第四届&ldquo;创青春&rdquo;大学生创业大赛评审细则</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<img src=\"./upload/1645065551237.png\" alt=\"\" /><a>相关附件：</a>\n<div class=\"clear\">&nbsp;</div>\n<p><a href=\"http://xg.zzu.edu.cn/file/1FixYf3eNeuXoFWqoC1EY3.zip\">信息工程学院第五届&ldquo;挑战杯&rdquo;全国大学生创业计划竞赛有关附件.zip</a></p>\n</div>', '2021-04-23 22:24:07');
INSERT INTO `xinwenxinxi` VALUES (6, '信息工程学院在郑州大学2021年学生阳光体育健身月暨公体教学成果展活动中喜获佳绩', 1, 'upload/20210423/3fc39b92-37be-44de-b792-cc7eb86aa23d.png', 'admin', 0, '<h4 style=\"text-align: center;\">信息工程学院在郑州大学2021年学生阳光体育健身月暨公体教学成果展活动中喜获佳绩</h4>\n<h5 style=\"text-align: center;\">来源：信息工程学院&nbsp;作者：管理员&nbsp;日期：2021-04-26&nbsp;点击量：1,832</h5>\n<div class=\"article_article\">\n<p class=\"ceshi\">&nbsp;</p>\n<p>4月24日下午，郑州大学&ldquo;学党史、庆华诞、强体魄、育新人&rdquo;2021年阳光体育健身月暨公体教育成果展在主校区举行。校党委副书记吴宏阳出席活动并讲话，校党委常委、宣传部部长厉励，相关职能部门负责同志、体育学院党政班子，以及全校34个院的1000余名师生参加了活动。</p>\n<p>&nbsp; 信息工程学院高度重视，提前制定健身月方案，组织动员同学们积极踊跃地参与到此次活动中去，掀起了一股运动健身的热潮。通过班级赛、年级赛、院赛的层层选拔，最终27名运动健儿分别从八个比赛项目的激烈竞争中脱颖而出，代表我院参加此次活动。我院的优秀运动健儿们在决赛中赛出了风格，赛出了水平，努力拼搏，挑战自我。最终，经过与其他众多院系优秀选手近四个小时的激烈比拼，信息工程学院代表队以总分 34 分的高分夺得团体总分第二名的优异成绩!我院在此次活动中取得的优异成绩是近年来参与校级综合运动会取得的最佳成绩。</p>\n<p>&nbsp;</p>\n</div>', '2021-04-23 22:24:29');
INSERT INTO `xinwenxinxi` VALUES (7, '郑州方达电子技术有限公司2019年招聘信息', 1, 'upload/20210423/11.jpeg', 'admin', 2, '<table class=\"winstyle67215\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"titlestyle67215\" style=\"text-align: left;\" align=\"center\">\n<h4 style=\"text-align: center;\">郑州方达电子技术有限公司2019年招聘信息</h4>\n<h5 style=\"text-align: center;\">来源：信息工程学院&nbsp;作者：管理员&nbsp;日期：2019-11-18&nbsp;点击量：6,650</h5>\n<div class=\"article_article\">\n<p class=\"ceshi\">&nbsp;</p>\n<p>郑州方达电子技术有限公司（简称&ldquo;方达公司&rdquo;）于2019年8月份启动增资扩股（现处于公示期），新公司是在中国电子科技集团公司第二十七研究所空天事业部的基础上整合组建，隶属中国电子科技集团公司，是独立行使经营权的高新技术国有企业，现位于河南省郑州市郑东新区，现有职工170余人。方达公司（中国电子科技集团公司第二十七研究所空天事业部）长期承担我国航天测控、卫星应用等武器装备的科研、生产和试验任务，成功参与了&ldquo;载人航天&rdquo;、&ldquo;探月工程&rdquo;等重大工程任务的研制。</p>\n<p>依托国家高分辨率对地观测重大专项，方达公司以卫星遥感、卫星通信、卫星导航、GIS系统等技术为核心，面向国防军事领域以及环保、农业、应急等民用领域，承接了高分专项中多项工程的研制，并承担了十余项国家863计划相关项目以及省市中心/行业示范节点的顶层设计、系统集成和软硬件研发工作。</p>\n<p>方达公司作为高分辨率对地观测系统河南省数据与应用中心技术挂靠单位，下设四个研究部、一个省级重点实验室。</p>\n<p>一、人才需求</p>\n<p>学历：硕士、博士</p>\n<p>专业：</p>\n<p>1.计算机类：计算机科学与技术、软件工程、人工智能、计算机系统等相关专业；</p>\n<p>2.电子信息类：电子信息工程、通信与信息系统、通信工程、电路与系统、信号与信息处理、微电子科学与工程、信息工程；</p>\n<p>3.数学类；</p>\n<p>4.遥感科学与技术；</p>\n<p>二、福利待遇</p>\n<p>1、薪酬部分：</p>\n<p>年度薪资：硕士10万起，博士15万起；</p>\n<p>项目奖项、年终奖金等其他奖励；</p>\n<p>2、福利部分</p>\n<p>公务交通费、通信费、高温津贴、精神文明奖、带薪年休假、免费健康体检、完善的五险两金体系、节日生日福利、职工食堂&hellip;&hellip;</p>\n<p>3、住房补贴</p>\n<p>新员工租房补贴：400元/月；</p>\n<p>安家费：博士30万（5年）；</p>\n<p>郑州市相关补贴；</p>\n<p>三、联系方式<a name=\"_GoBack\"></a></p>\n<p>地址：中国河南郑州郑东新区博学路36号</p>\n<p>简历投递邮箱：liuyang_cetc27@163.com</p>\n<p>邮箱标题请用：&ldquo;方达公司：姓名+学历+学校+专业&rdquo;</p>\n<p>联系人：&nbsp;0371-61270760（柳）0371-61270126（郭）</p>\n<p>0371-61270761（王）</p>\n</div>\n</td>\n</tr>\n<tr>\n<td style=\"text-align: left;\" align=\"center\">&nbsp;</td>\n</tr>\n<tr>\n<td style=\"text-align: left;\" align=\"right\">&nbsp;</td>\n</tr>\n<tr>\n<td class=\"contentstyle67215\" style=\"text-align: left;\">&nbsp;</td>\n</tr>\n<tr>\n<td style=\"text-align: left;\">&nbsp;</td>\n</tr>\n<tr>\n<td style=\"text-align: left;\">&nbsp;</td>\n</tr>\n</tbody>\n</table>', '2021-04-23 22:24:55');
INSERT INTO `xinwenxinxi` VALUES (8, '河南工程学院党委书记刘湘玉、校长李利英一行来校调研交流', 1, 'upload/20210423/4.jpg', 'admin', 3, '<table class=\"winstyle67215\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"titlestyle67215\" align=\"center\">河南工程学院党委书记刘湘玉、校长李利英一行来校调研交流</td>\n</tr>\n<tr>\n<td align=\"center\"><span class=\"timestyle67215\">2021-03-31</span>&nbsp;<span class=\"authorstyle67215\">毕明理&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;(浏览：<span id=\"n25466\">2038</span>)</td>\n</tr>\n<tr>\n<td align=\"right\">&nbsp;</td>\n</tr>\n<tr>\n<td class=\"contentstyle67215\">\n<div id=\"vsb_newscontent\" class=\"c67215_content\">\n<div id=\"vsb_content_500\">\n<div class=\"v_news_content\">\n<p class=\"vsbcontent_start\">&nbsp; &nbsp; 3月30日，河南工程学院党委书记刘湘玉、校长李利英一行来我校龙湖校区调研交流。党委书记贾少鑫、校长刘国际热情接待了客人。党委副书记赵水根、副校长唐多毅，河南工程学院党委副书记袁静波、副校长王生交，两校相关职能部门和学院负责同志参加活动。</p>\n<p class=\"vsbcontent_img\"><img class=\"img_vsb_content\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"undefined\" src=\"https://www.zut.edu.cn/__local/0/0E/44/EFFC97441CAF620A3C0DCDDFF3D_AEE89219_1AE2A.jpg\" alt=\"undefined\" width=\"600\" height=\"369\" border=\"0\" hspace=\"0\" vspace=\"0\" /></p>\n<p>&nbsp; &nbsp; 座谈会上，贾少鑫向客人介绍了学校的历史沿革、学科建设、科学研究、社会服务等方面的情况。他指出，两校人员往来频繁，历史渊源深远，学科专业相近，发展背景相似，承担使命相同，希望两校能持续畅通机制，相互借鉴，携手共进，共同推动双方事业高质量发展，为区域经济社会发展做出更多贡献。</p>\n<p>&nbsp; &nbsp; 刘湘玉向我校的热情接待表示感谢，对我校发展取得的成就表示祝贺，介绍了河南工程学院办学情况，期待两校能进一步加强合作交流，实现互利共赢。</p>\n<p class=\"vsbcontent_end\">&nbsp; &nbsp; 期间，刘湘玉、李利英一行在贾少鑫、刘国际陪同下参观了我校大学科技园先进材料研究中心、河南省功能性纺织材料重点实验室、纺织服装产业研究院、龙湖校区数据中心。双方就综合改革、人事分配、科研管理和学科专业建设工作进行了对口深度交流。（通讯员 毕明理 摄影 张倩涵 胡晓琰）</p>\n</div>\n</div>\n</div>\n</td>\n</tr>\n</tbody>\n</table>', '2021-04-23 22:25:15');
INSERT INTO `xinwenxinxi` VALUES (9, '关于开展2021年信息工程学院暑期社会实践活动的具体通知', 1, 'upload/20210423/8040b703-43fe-4fad-b4f6-d48ece8d77aa.png', 'admin', 6, '<p>　</p>\n<h4 style=\"text-align: center;\">关于开展2021年信息工程学院暑期社会实践活动的具体通知</h4>\n<h5 style=\"text-align: center;\">来源：信息工程学院&nbsp;作者：管理员&nbsp;日期：2021-06-10&nbsp;点击量：1,980</h5>\n<div class=\"article_article\">\n<p class=\"ceshi\">&nbsp;</p>\n<p><strong>各年级团总支：</strong></p>\n<p>为深入学习贯彻习近平新时代中国特色社会主义思想，贯彻落实习近平总书记关于青年工作的重要思想，引导和帮助广大青年学生上好与现实结合的&ldquo;大思政课&rdquo;，在社会课堂中受教育、长才干、做贡献，在观察实践中学党史、强信念、跟党走，充分发挥&ldquo;三下乡&rdquo;实践育人功能和服务社会作用，提升内涵，提高质量，建立长效机制，着力打造一批具有广泛社会影响力、示范效应突出的大学生社会实践品牌项目，以实际行动庆祝中国共产党建党100周年，按照学校党委《关于开展郑州大学2021年大学生志愿者暑期文化科技卫生&ldquo;三下乡&rdquo;社会实践活动的通知》要求，现将我院&ldquo;三下乡&rdquo;社会实践活动的具体安排通知如下：</p>\n<p><strong>一、活动主题</strong></p>\n<p>永远跟党走 &nbsp;奋进新时代</p>\n<p><strong>二、参与对象</strong></p>\n<p>我院在籍本科生和研究生。</p>\n<p><strong>三、实践内容</strong></p>\n<p>1.党史学习实践团。主要依托各地红色资源，组织青年学生开展重走红色足迹、追溯红色记忆、访谈红色人物、挖掘红色故事、体悟红色文化等多种形式活动，引导青年学生学史明理、学史增信、学史崇德、学史力行，更好地传承红色基因、担当时代责任。学生党员要积极开展&ldquo;我为群众办实事&rdquo;实践活动，展示新时代青年共产党人的良好风貌。</p>\n<p>2.理论宣讲实践团。紧密围绕学习宣传贯彻习近平新时代中国特色社会主义思想，组织引导青年学生将理论学习与社会实践相结合，同时将学习党的历史与讲述党的故事结合起来，深入一线基层、深入人民群众，面对面开展小规模、互动式、有特色、接地气的宣讲活动。</p>\n<p>3.国情观察实践团。注重以疫情防控重大战略成果、脱贫攻坚历史性成果、全面建成小康社会决定性成就等为现实教材，组织青年学生开展参观考察、国情调研、学习体验等活动，引导青年学生领悟党的领导、领袖领航、制度优势、人民力量的关键作用，形成正确认识，坚定理想信念。</p>\n<p>4.民族团结实践团。贯彻落实第三次中央新疆工作座谈会和中央第七次西藏工作座谈会精神，组织内地新疆籍、西藏籍大学生开展&ldquo;民族团结我践行&rdquo;社会实践活动，组织内地大学生到新疆、西藏等地开展国情考察、地球第三极保护行动等社会实践活动。</p>\n<p>5.乡村振兴&mdash;支农助农帮扶团。重点围绕助力乡村振兴，开展法律咨询援助、农技培训推广、农业科普讲座、金融知识下乡、乡村规划引领等形式的社会实践活动。</p>\n<p>6.乡村振兴&mdash;教育关爱服务团。重点围绕关爱农村留守儿童学业帮扶，开展学业辅导、亲情陪伴、自护教育、素质拓展、敬老孝亲、文化艺术助教等形式的精准关爱实践服务活动。</p>\n<p>7.乡村振兴&mdash;爱心医疗服务团。重点围绕健康中国战略，开展健康普查、巡回医疗、流行性疾病防治、基本医疗卫生知识普及、乡（村）医疗站建设等形式的社会实践活动。</p>\n<p>8.乡村振兴&mdash;美丽乡村实践团。重点围绕美丽乡村建设和打好污染防治攻坚战，开展乡村美化、垃圾分类、环境治理、生态环保等形式的社会实践活动。</p>\n<p>9.乡村振兴&mdash;卢氏县兴贤里社区专项实践团</p>\n<p>着眼于帮助和引导更多青年学生了解认知当前的乡村状况、在未来踊跃参与乡村振兴战略实施，深入到我校干部驻村地卢氏县兴贤里社区，组织开展科技支农、科普宣讲、调研献策、志愿服务等形式的实践活动。</p>\n<p>10.乡村振兴&mdash;&mdash;泌阳县闫洼村专项实践团</p>\n<p>着眼于帮助和引导更多青年学生了解认知当前的乡村状况、在未来踊跃参与乡村振兴战略实施，深入到我校干部驻村地卢泌阳县闫洼村，组织开展科技支农、科普宣讲、调研献策、志愿服务等形式的实践活动。</p>\n<p>各实践团队在参与学院社会实践的同时，可根据条件同步参与到团中央、团省委、省教育厅等部门发布的全国&ldquo;三下乡&rdquo;社会实践活动、万名大学生&ldquo;返家乡&rdquo;沿黄实践活动、豫籍大学生&ldquo;返家乡&rdquo;社会实践&ldquo;春雁行动&rdquo;、&ldquo;出彩中原&rdquo;大学生实践活动等专项社会实践活动中。在开展实践过程中同时要重点围绕我校特色文化、综合布局、人才培养、创新发展等方面，宣传我校的综合实力和招生章程，扩大学校知名度和影响力。</p>\n<p><strong>四、实施安排</strong></p>\n<p>请所有申报社会实践的队员阅读《2021年郑州大学信息工程学院社会实践团队安全责任告知书》（附件1），参加即代表同意接受告知书所有条款。</p>\n<p><strong>1.</strong><strong>项目申报</strong></p>\n<p>请于6月15日下午15：00前将申报项目的相关材料，包括：《2021年信息工程学院暑期社会实践活动项目申报书》（附件2）、《2021年信息工程学院暑期社会实践活动报名表》（附件3），电子版发至邮箱：ieshehuishijianbu@163.com。学院将对申报项目进行初审核指导，完善团队实践活动方案，最终向校团委推荐校级重点专项以及自选项目。</p>\n<p><strong>2.</strong><strong>活动宣传</strong></p>\n<p>各实践团队要设置宣传专员负责实践队伍的宣传工作，充分利用微博、微信、报刊、电视和网络等宣传渠道，扩大实践的社会影响。</p>\n<p>团队和个人应加强媒体宣传，要积极做好对外宣传工作，重视党报党刊、社会报刊、广播电视、网络宣传等众多宣传途径。争取在电视、网络、报纸等媒体上宣传展示报道，此项将作为学院评选社会实践先进个人和团队的重要依据。</p>\n<p><strong>3.</strong><strong>结项安排</strong></p>\n<p>社会实践活动结束后，由实践团队完成项目结项材料，将相关书面材料在开学后一周内上交，结项材料包括：</p>\n<p>社会实践实习报告。每位实践队员需提交1份暑期社会实践实习报告，字数不少于1500字。在开学后一周内，上交给班级团支书，统一汇总至年级团总支，并上交院团委；</p>\n<p>《2021年&ldquo;三下乡&rdquo;暑期社会实践活动项目结项汇总表》（仅一般项目填写，附件4）或《2021年&ldquo;三下乡&rdquo;暑期社会实践活动重点项目结项申报书》（仅重点项目填写，附件5）；</p>\n<p>实践纪实及宣传佐证材料。实践纪实以图片为主，记录整个实践互动的过程，包括但限于：团队合影、实践场地、活动现场、领导参与、宣传报道等等，每张图片附以精炼的文字说明，（图片最少10张，照片拍摄规范，图像清晰，突出活动主题，word排版美观，文字不超过1500字，另外单独提交每张照片的清晰原图，图片以文字介绍重命名）。如有宣传报道，应提交相关支撑材料。附于团队社会实践活动总结后一起装订；</p>\n<p>结项报告。结项报告以调研报告形式为主（内容包含报告题目、主要作者、指导教师、参与单位等内容；正文要包含摘要、关键字、正文、参考文献等内容，总字数在1万字以内，提交word文档）；</p>\n<p>微视频作品。在实践过程中挖掘突出典型和案例，通过拍摄微视频的方式进行展示。微视频作品所拍摄的内容要积极向上，视频名称可自由拟定，风格、题材、时间不限，此项不做强制要求。</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p style=\"text-align: right;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 共青团郑州大学信息工程学院委员会</p>\n<p style=\"text-align: right;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 郑州大学信息工程学院学生会</p>\n<p style=\"text-align: right;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2021年6月10日</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<img src=\"./upload/1645066206246.png\" alt=\"\" /><a>相关附件：</a>\n<div class=\"clear\">&nbsp;</div>\n<p><a href=\"http://xg.zzu.edu.cn/file/1wlzjMnYh5UV1ZRnUEY8Ll.zip\">相关附件.zip</a></p>\n</div>', '2021-04-23 22:28:20');
INSERT INTO `xinwenxinxi` VALUES (10, '我校举行党史学习教育报告会', 1, 'upload/20210423/2.jpg', 'admin', 8, '<table class=\"winstyle67215\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"titlestyle67215\" align=\"center\">我校举行党史学习教育报告会</td>\n</tr>\n<tr>\n<td align=\"center\"><span class=\"timestyle67215\">2021-04-14</span>&nbsp;<span class=\"authorstyle67215\">毕明理&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;(浏览：<span id=\"n25518\">1089</span>)</td>\n</tr>\n<tr>\n<td align=\"right\">&nbsp;</td>\n</tr>\n<tr>\n<td class=\"contentstyle67215\">\n<div id=\"vsb_newscontent\" class=\"c67215_content\">\n<div id=\"vsb_content_500\">\n<div class=\"v_news_content\">\n<p class=\"vsbcontent_img\" style=\"text-align: center;\"><img class=\"img_vsb_content\" src=\"https://www.zut.edu.cn/__local/E/31/2D/EF9254534F33AFC508AE40580C1_EEAD5650_1AFD2.jpg\" width=\"600\" /></p>\n<p style=\"text-align: left;\">&nbsp; &nbsp; 为持续推进党史学习教育深入开展，4月13日，我校举行党史学习教育报告会，邀请河南省政协教科卫体委员会副主任李新中做专题报告。党委书记贾少鑫主持报告会，全体校领导，中层干部参加报告会。</p>\n<p class=\"vsbcontent_img\"><img class=\"img_vsb_content\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://www.zut.edu.cn/__local/D/D4/20/17C1DE130C358F6A7A14D67C10C_4CEFF8AB_CFFC.jpg\" width=\"600\" /></p>\n<p>&nbsp; &nbsp; 报告会上，李新中以&ldquo;中共一大代表人生轨迹与启示&rdquo;为题，围绕学习贯彻习近平总书记关于中国共产党历史的重要论述，结合党史学习教育的目标要求，运用鲜活的党史资料、生动的党史故事、详实的案例数据，围绕&ldquo;红色的起点&rdquo;&ldquo;13位代表人生轨迹&rdquo;&ldquo;13位代表人生分析与启示&rdquo;解读了中共&ldquo;一大&rdquo;的历史背景和伟大历史意义，分析了中共&ldquo;一大&rdquo;代表的沉浮人生。报告再现了我们党艰苦卓绝的奋斗历程，形象地描绘了党波澜壮阔的历史画卷，使在场党员干部深刻感悟中国共产党为什么&ldquo;能&rdquo;、马克思主义为什么&ldquo;行&rdquo;、中国特色社会主义为什么&ldquo;好&rdquo;，同时带给每位党员干部一条重要人生启示：革命理想高于天，崇高的信仰是战胜艰难险阻的根本保证。</p>\n<p>&nbsp; &nbsp; 贾少鑫在主持报告会时谈到，深入开展党史学习教育，就是要从中国共产党百年波澜壮阔的伟大奋斗历史中，不断汲取奋发有为的精神力量，在开创新天地、再造新辉煌中，坚定政治方向、站稳政治立场、把握政治大局、增强政治定力、永葆政治本色。他指出，要将党史学习教育与党性锤炼结合起来，永远保持忠诚于党、为师生服务的情怀；要将党史学习教育与实际工作结合起来，勇于担责担难担险，加快国内一流特色骨干大学建设；要将党史学习教育与&ldquo;我为群众办实事&rdquo;实践活动结合起来，倾听师生诉求，解决师生难题，做好师生工作。</p>\n</div>\n</div>\n</div>\n</td>\n</tr>\n<tr>\n<td>&nbsp;</td>\n</tr>\n</tbody>\n</table>', '2021-04-23 22:28:44');

-- ----------------------------
-- Table structure for xuesheng
-- ----------------------------
DROP TABLE IF EXISTS `xuesheng`;
CREATE TABLE `xuesheng`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `xuehao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `mima` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `xingming` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `xingbie` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
  `shouji` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机',
  `youxiang` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `shenfenzheng` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证',
  `shifoujiuye` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否就业',
  `touxiang` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xuesheng
-- ----------------------------
INSERT INTO `xuesheng` VALUES (1, '201708034201', '123456', '王五', '男', '13655255200', '1346@qq.com', '450924199907094418', '是', 'upload/20210423/1b919eb4-fefe-4408-b048-0d39e65619d3.png', '2021-04-23 22:51:30');
INSERT INTO `xuesheng` VALUES (6, '201708034203', '123456', '张三', '女', '13015602782', '1346@qq.com', '450924199907094020', '否', 'upload/20210424/ed77887d-1f74-4146-b998-d326ca947065.png', '2021-05-07 11:08:51');
INSERT INTO `xuesheng` VALUES (7, '201708034202', '123456', '李六', '男', '13547525542', '1234@qq.com', '456321530256530', '否', 'upload/20210423/15.jpg', '2021-05-08 16:48:06');

-- ----------------------------
-- Table structure for yongrendanwei
-- ----------------------------
DROP TABLE IF EXISTS `yongrendanwei`;
CREATE TABLE `yongrendanwei`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `zhanghao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `mima` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `danweimingcheng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `fuzeren` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '负责人',
  `lianxidianhua` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `danweidizhi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位地址',
  `zizhizhengming` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资质证明',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `issh` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '否' COMMENT '是否审核',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用人单位' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yongrendanwei
-- ----------------------------
INSERT INTO `yongrendanwei` VALUES (1, '2021qiye003', '123456', '京东', '老刘', '12346798101', '北京市亦庄经济开发区', 'upload/20210423/10.png', '2021-04-23 22:34:25', '是');
INSERT INTO `yongrendanwei` VALUES (2, '2021qiye002', '123456', 'alibaba', '老马', '12345678910', '中国杭州市余杭区文一西路969号 (311121)', 'upload/20210423/10.png', '2021-04-23 22:34:48', '是');
INSERT INTO `yongrendanwei` VALUES (3, '2021qiye001', '123456', 'tecent', '老马', '12346791010', '深圳市南山区高新科技园北区,深南大道北侧', 'upload/20210423/10.png', '2021-04-23 22:35:13', '是');

-- ----------------------------
-- Table structure for youqinglianjie
-- ----------------------------
DROP TABLE IF EXISTS `youqinglianjie`;
CREATE TABLE `youqinglianjie`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `wangzhanmingcheng` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站名称',
  `wangzhi` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网址',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '友情链接' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of youqinglianjie
-- ----------------------------
INSERT INTO `youqinglianjie` VALUES (1, '百度', 'http://www.baidu.com', '2021-04-23 20:47:49');
INSERT INTO `youqinglianjie` VALUES (2, '谷歌', 'http://www.google.cn', '2021-04-23 20:47:49');
INSERT INTO `youqinglianjie` VALUES (3, '新浪', 'http://www.sina.com', '2021-04-23 20:47:49');
INSERT INTO `youqinglianjie` VALUES (4, 'QQ', 'http://www.qq.com', '2021-04-23 20:47:49');
INSERT INTO `youqinglianjie` VALUES (5, '网易', 'http://www.163.com', '2021-04-23 20:47:49');
INSERT INTO `youqinglianjie` VALUES (6, '1', '1111111111', '2021-05-02 14:04:11');

-- ----------------------------
-- Table structure for zhaopinxinxi
-- ----------------------------
DROP TABLE IF EXISTS `zhaopinxinxi`;
CREATE TABLE `zhaopinxinxi`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bianhao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `biaoti` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `tupian` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `gongzi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工资',
  `xueli` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学历',
  `jingyan` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '经验',
  `zhaopinrenshu` int(11) NOT NULL COMMENT '招聘人数',
  `zhiweileixing` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位类型',
  `gongsifuli` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司福利',
  `zhiweimiaoshu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位描述',
  `gongzuodidian` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工作地点',
  `gongsimingcheng` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司名称',
  `gongsijieshao` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司介绍',
  `faburen` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布人',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `issh` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '否' COMMENT '是否审核',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '招聘信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of zhaopinxinxi
-- ----------------------------
INSERT INTO `zhaopinxinxi` VALUES (1, '042322363322', '宝龙比亚迪直招普工6-9k包吃住', 'upload/20210423/3cbf9e03-5968-457a-bd5a-8f38de78776f.png', '6000-9000元/月', '不限', '不限', 10, '普工,技工,生产,机械', '五险一金,免费班车,定期体检,包住,带薪年假,医疗保险,交通补贴,餐补,年底双薪,加班补助,通讯补贴,商圈补贴,包吃', '<p>职位描述: 小时工：28元/小时；</p>\n<p>正式工：底薪2200元-2800元；</p>\n<p>综合月薪6000一9000元</p>\n<p>【1】可以选择做正式工；也可以选择做小时工[可自愿转正、转正者有奖金]</p>\n<p>【2】月纯收入的多少完全在于你平时加班小时的多少，部门不限制加班，可达6500元以上</p>\n<p>【3】每月22号准时发工资，不压工资。</p>\n<p>【4】包吃包住：综合工资6000一9000元/月；高于深圳周边其他中型、大型企业。</p>\n<p>【5】主要生产：3c电子配件（华为手机、苹果手机）、汽车电子配件。可以自由选择生产部门：你可以选择进3C电子部，也可以选择进生产汽车电子部门。</p>\n<p>【6】坐着上班、上班轻松、加班稳定、穿普通工服、女孩子较多，主要制造：全国知名电子类产品部件成品等类型产品。</p>\n<p>【7】招聘岗位：操作工、SMT、包装、物控、仓管等岗位</p>\n<p>【8】工作环境：全空调车间；全天候恒温、为员工提供了安全、舒适、干净的工作环境。</p>\n<p>一、招聘要求（1）男女不限：16一45岁，无传染疾病、无大面积纹身、无不良习气。学历不限，不要考试，无需毕业证，无工作经验者也行；生手熟手均可。</p>\n<p>二、福利待遇：（1）工作时间为5天8小时制，22天工作制，超出正班算加班。底薪2200元，目前订单上涨，部门鼓励加班；加班可自愿不强制性员工加班，每月135个小时左右，加班费按劳动法计算+岗位奖+绩效奖+超额奖项、周一至周五1.5倍加班费每小时19.5元，周六周日2倍加班费每小时27.33元，法定假期3倍加班费每小时37元。月综合工资6000一9000元元/月。</p>\n<p>（2）工厂为员工免费提供空调宿舍，8人/间，有空调、24小时提供热水、独立大阳台、独立卫生间、冲凉房。</p>\n<p>（3）办理离职手续简单，只需提前7天申请即可</p>\n<p>【报名方式】</p>\n<p>1、拨打电话：电话咨询人事李小姐</p>\n<p>2、短信报名：姓名+报到日期发送人事李小姐</p>\n<p>3、投递简历：收到简历后我们会第一时间联系你</p>', '深圳宝龙比亚迪', '深圳市华鑫网络技术有限公司', '该公司其他招聘职位：招普工电子厂妹子多包吃住不体检长白班坐班招电子厂普工1小时28元包吃包住能玩手机电子厂普工长白班28一小时不体检包吃包住深圳龙华电子厂普工28一小时包吃住免体检工厂直招普工包吃包住28/小时免体检坐班', '2021qiye003', '2021-04-23 22:40:44', '是');
INSERT INTO `zhaopinxinxi` VALUES (2, '04232241353', '销售顾问', 'upload/20210423/a8de50de-9a52-4ec8-ad54-ba928ed7af9e.png', '7000-14000元/月', '中专', '1-2年', 5, '销售,市场,客服,公关', '带薪年假,医疗保险,年度旅游', '<p>职位描述: 1、负责自主开发客户资料、跟进客户;</p>\n<p>2、负责在线沟通客户、解答客户问题</p>\n<p>3、有意向客户在线签约或者附近地区面签</p>\n<p>4、处理客户售后问题，维护老客户、深挖新需求;</p>\n<p>5、负责渠道合作伙伴对接、资源合作</p>\n<p>要求责任心、上进心;具有团队精神、有经验优先;高中及以上学历</p>\n<p>公司福利:每月团建、带薪年假，年底奖金分红。</p>\n<p>&nbsp;</p>', '深圳 宝安区', '深圳市万词霸屏信息技术有限公司', 'xxxxxxxxxxxxxxxxxxxxxx', '2021qiye002', '2021-04-23 22:42:43', '是');
INSERT INTO `zhaopinxinxi` VALUES (4, '042322446400', '深圳市总经理助理招聘', 'upload/20210423/df2a7be0-246d-4c41-b77c-3c1b427931b3.png', '5000-8000元/月', '本科', '不限', 2, '经营管理', '五险一金,节日福利,通讯补贴,餐补', '<p>高分子材料专业、工商管理、企业管理专业，经验不限，性格开朗，形象气质好，沟通能力强，理解力强，思路敏捷，有勇于开拓的精神和强烈的事业责任心。</p>\n<p>高分子材料专业、工商管理、企业管理专业，经验不限，性格开朗，形象气质好，沟通能力强，理解力强，思路敏捷，有勇于开拓的精神和强烈的事业责任心。</p>', '深圳 龙岗区同乐街道老大坑坑尾村回龙埔科技园5栋', '深圳市贝克合成橡胶技术有限公司', 'xxxxxxxxxxxxxxxxxxxx', '2021qiye001', '2021-04-23 22:45:58', '是');
INSERT INTO `zhaopinxinxi` VALUES (5, '050718267601', '高薪招聘星探经纪人8k+', 'upload/20210423/11.jpeg', '8000-12000元/月', '不限', '不限', 10, '全职', '', '<p>高薪招聘星探经纪人8k+职位描述：岗位职责：1、通过各种线上、线下平台、渠道，挖掘、招募优秀主播、增加主播数量，优化主播质量；2、负责维护主播工作，帮助主播解决日常问题；3、负责与各直播平台沟通协调，策划推进活动项目。任职要求：1、对直播有特定的见解和浓烈的兴趣；2、艺术、传媒院校或从事过网红、主播、艺人经纪人工作经验者优先；3、能有较好的语言沟通能力和学习能力，遇上问题能够随机应变；4、有一定的数据分析和文案功底。</p>', '深圳', '深圳爱播文化传媒有限公司', '该公司其他招聘职位：抖音运营(深圳爱播文化传媒有限公司)高薪招聘星探经纪人8k+(深圳爱播文化传媒有限公司)直播运营(深圳爱播文化传媒有限公司)直播运营（无责无需招募）(深圳爱播文化传媒有限公司)主播(深圳爱播文化传媒有限公司)', '2021qiye002', '2021-05-07 18:29:36', '是');

SET FOREIGN_KEY_CHECKS = 1;
