/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : obs

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 02/06/2019 10:01:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `book_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `book_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书名',
  `book_author` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `book_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  `book_press` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出版社',
  `book_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '价格',
  `book_type_id` int(100) NOT NULL COMMENT '类别',
  `book_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `book_hot` int(1) NULL DEFAULT 1 COMMENT '热销',
  `on_sale_time` datetime(0) NULL DEFAULT NULL COMMENT '上市时间',
  PRIMARY KEY (`book_id`) USING BTREE,
  INDEX `book_type_outer`(`book_type_id`) USING BTREE,
  CONSTRAINT `book_type_outer` FOREIGN KEY (`book_type_id`) REFERENCES `book_type` (`book_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (25, '简单', '姬晓安 著 六人行图', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019041516503696.jpg', '北大', 10.22, 19, '简单，应对复杂世界的利器&#10;真正的大智慧，是善于把复杂的事情简单化，聪明人都拥有的心智防身术，唯有简单能抵挡猝不及防的恶意，人在江湖，至高的城府就是返璞归真。乔布斯、扎克伯格身体力行的极简成功法则 随书附赠个人发展学会精品课', 1, '2019-04-15 08:50:37');
INSERT INTO `book` VALUES (26, '联结', '（英）詹姆斯·伯克 ', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019041516530112.jpg', '北京联合出版有限公司', 36.99, 8, '联结：通向未来的文明史&#10;全彩精装，BBC同名纪录片创收视纪录！比尔·盖茨鼎力推荐！2019开年新知必读，像侦探小说一样迷人的文明史。改变世界的革新，诞生于日常的联结；谁联结了历史，谁就能把握未来！英国每5人就有1人看过', 1, '2019-04-15 08:53:02');
INSERT INTO `book` VALUES (27, '全球科技通史', '吴军', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019050409380054.jpg', '中信出版社', 53.70, 3, '文津图书奖得主、百万册畅销书作家、硅谷投资人吴军博士2019重磅作品。高文、钱颖一作序推荐。俯瞰一整部人类科技文明史，真正洞察世界变化趋势', 1, '2019-05-04 09:38:01');
INSERT INTO `book` VALUES (28, '汗青堂丛书024：棉花帝国', '斯文·贝克特 ', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019050409440849.jpg', '后浪出版公司', 88.75, 19, '2015年班克罗夫特奖获奖作品。以棉花工业联动六大洲的历史，提出“战争资本主义”概念，颠覆“自由资本主义”的神话。王希、仲伟民、李伯重联袂推荐！', 1, '2019-05-04 10:12:41');
INSERT INTO `book` VALUES (29, '最初之前', '张皓宸', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052509213119.jpg', '天津人民出版社', 44.10, 1, '百万畅销书作家张皓宸迄今为止zui重要的作品，送给不忘初心的你一本笑着开始哭着读完的小说。', 1, '2019-05-25 09:21:31');
INSERT INTO `book` VALUES (30, '汪曾祺散文精选集', '汪曾祺', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052509252371.jpg', '中国友谊出版公司', 34.70, 1, '汪曾祺经典散文ZUI全收录，汪氏三兄妹亲自审定。如丰子恺般通透，人生海海，在平淡的生活中，发现世间的妙趣与美好。生活须有光有影，有晴有雨，有情有心，滋味都含在这里了。', 1, '2019-05-25 09:25:23');
INSERT INTO `book` VALUES (31, '硅谷工程师爸爸的超', '小杨老师 憨爸', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052509263738.jpg', '中国妇女出版社', 43.00, 3, '硅谷工程师憨爸携手美国名校教师小杨老师共同创作，“凯叔讲故事”创始人凯叔等诚意推荐，7大模块思维导图内容，融合学科学习，一支笔、一张纸即可快速提升学习力，系统训练科学思维。', 1, '2019-05-25 09:26:37');
INSERT INTO `book` VALUES (32, '王阳明传：知行合一', '燕山刀客', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052509273862.jpg', '中国友谊出版公司', 45.10, 19, '欲成大事者，不可不读王阳明!一本有料有趣有谱的王阳明传记。融合历史作品的厚重、悬疑小说的张力、戏剧的节奏感，深刻剖析知行合一的神奇威力，生动呈现心学圣人的传奇一生。', 1, '2019-05-25 09:27:38');
INSERT INTO `book` VALUES (33, '说南宋：151年的偏安之痛', '刘鄂公', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052509290595.jpg', '中国大百科全书出版社', 60.50, 19, '本书在台湾出版后曾遭蒋介石严厉禁毁，传世版本极为难得。此次出版依据国民党《中央工作日记》的机密档案中寻获的版本，并由刘鄂公之子整理核定，故尤显珍贵。', 1, '2019-05-25 09:29:05');
INSERT INTO `book` VALUES (34, '六神磊磊读唐诗', '王晓磊', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052509305331.jpg', '北京十月文艺出版社', 33.70, 19, '自媒体写作的高峰六神磊磊力作，一本又有趣又涨姿势的唐诗读本', 1, '2019-05-25 09:30:53');
INSERT INTO `book` VALUES (35, '中国人的生存规矩', '吴晗', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052509340796.gif', '四川人民出版社', 17.60, 19, '当当独家！！窥探历史深处的复杂人性，揭秘中国古人的博弈法则。著名历史学家吴晗深度剖析钱穆、黄仁宇、易中天没有讲透的古代官场隐权力与潜规则！解读古代中国人的生存之道！', 1, '2019-05-25 09:34:07');
INSERT INTO `book` VALUES (36, ' 强迫症的历史', '克劳斯·P. 费舍尔', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052509360663.jpg', '译林出版社', 45.30, 25, '德国历史上的反犹文化源自于哪里？如何演化为对犹太人的灭绝性种族杀戮？继《纳粹德国：一部新的历史》之后，克劳斯·费舍尔的又一部经典之作！', 1, '2019-05-25 09:36:06');
INSERT INTO `book` VALUES (37, '末日三法则', '华特士', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052509421916.jpg', '二十一世纪出版社', 21.40, 6, '是精彩的反乌托邦小说/也是完美的末日幸存手册/拷问科技文明与复杂人性力作/国际阅读协会青少年推选作品', 1, '2019-05-25 09:42:19');
INSERT INTO `book` VALUES (38, '末日巨塔', '劳伦斯·赖特', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052509432888.jpg', '上海译文出版社', 37.90, 6, '译文纪实系列·末日巨塔——基地组织与“9·11”之路\r\n', 1, '2019-05-25 09:43:28');
INSERT INTO `book` VALUES (39, '末日曙光. 上', '非天夜翔', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052509483186.jpg', '敦煌文艺出版社', 37.90, 6, '网络原名《2013》; 晋江知名高人气原创文学之一,畅销书作者非天夜翔成名作 ;新增万字番外', 1, '2019-05-25 09:48:31');
INSERT INTO `book` VALUES (40, '末日逼近（上、下）', '斯蒂芬·金', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052509501876.jpg', '上海译文出版社', 85.30, 6, '完整版《末日逼近》盛大推出斯蒂芬·金的史诗级恐怖巨作，堪比《魔戒》三部曲。', 1, '2019-05-25 09:50:18');
INSERT INTO `book` VALUES (41, '末日愚者', '伊坂幸太郎 ', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052509513834.jpg', '人民文学出版社', 38.70, 6, '比肩村上春树和东野圭吾的日本男作家，伊坂幸太郎代表作。2007年日本书店大奖票选杰作!', 1, '2019-05-25 09:51:38');
INSERT INTO `book` VALUES (42, '生态都市主义', '莫斯塔法维', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052509544157.jpg', '江苏科学技术出版社', 448.50, 1, '配合中央城市工作会议，领会城市规划发展精神。哈佛设计学院院长莫森·莫斯塔法维主编，中国知名景观大师俞孔坚译，城市设计参与者不可错过的理论经典!', 1, '2019-05-25 09:54:41');
INSERT INTO `book` VALUES (43, '图解都市空间构想力', '赵春水', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052509555417.jpg', '江苏科学技术出版社', 77.40, 1, '东京大学都市设计研究室7位教授耗时10年总结出来的关于城市空间规划和设计理念，六个视角详细解读都市空间的构想力，回归城市规划的原点，为现代城市规划师提供借鉴。', 1, '2019-05-25 09:55:54');
INSERT INTO `book` VALUES (44, '空间、地方与性别', '多琳·马西', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052509580369.jpg', '首都师范大学出版社', 53.60, 1, ' 都市问题研究论丛——空间、地方与性别', 1, '2019-05-25 09:58:03');
INSERT INTO `book` VALUES (45, '都市特种兵：隐刺', '神我很乖', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052509592773.jpg', '江苏凤凰文艺出版社', 32.90, 1, '小桥老树、阿菩、何常在联袂推荐！《暗影》之后，又一部肾上腺素飙升大戏！直击特种兵精神世界，全景展示中国特种部队缉毒抓凶的悬疑大作，再征5亿+点击率！', 1, '2019-05-25 09:59:27');
INSERT INTO `book` VALUES (46, '都市诡话', '董协', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052510010379.jpg', '二十一世纪出版社', 35.00, 1, '本书已由腾讯视频改编为网络剧《十夜谈》，火爆热播', 1, '2019-05-25 10:01:03');
INSERT INTO `book` VALUES (47, '中国都市圈极限通勤研究', '华夏幸福产业研究院', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052510031522.jpg', '清华大学出版社', 77.40, 1, '从通勤状况角度,研究都市圈的状态和发展,视角新颖,资料详实,同时提出并强化都市圈的理念', 1, '2019-05-25 10:03:15');
INSERT INTO `book` VALUES (48, '都市木艺人', '马克斯·班布里奇', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052510045441.jpg', '华中科技大学出版社', 38.40, 1, '手作不仅仅是一份工作，它更是一种生活。', 1, '2019-05-25 10:04:54');
INSERT INTO `book` VALUES (49, '诛仙', '萧鼎', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052510073368.jpg', '中国华侨出版公司', 196.80, 2, '席卷华语世界十余年，东方幻想扛鼎之作重装再版！万千粉丝必入经典，同名影视剧蓄势待发！', 1, '2019-05-25 10:07:33');
INSERT INTO `book` VALUES (50, '灵异帖杀人事件', '耶马', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052510085729.jpg', '江苏文艺出版社', 18.70, 9, '大陆首位东野圭吾式悬疑作家耶马贺岁钜献！十大知名悬疑作家联袂推荐！一夜之间爆红网络的恐怖小说。', 1, '2019-05-25 10:08:57');
INSERT INTO `book` VALUES (51, '游戏人间', '贾平凹', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052510101061.jpg', '百花洲文艺出版社', 36.40, 11, '贾平凹2017全新散文，首次收入二十余幅作者亲笔画作,附赠新作《养鼠》手稿+精美书签！懂得以游戏的心态面对世事,不要在生活里逞英雄,如果生活里有高低,比的就是谁的快乐多！', 1, '2019-05-25 10:10:10');
INSERT INTO `book` VALUES (52, '体育简史', '托尼·柯林斯', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052510120356.jpg', '清华大学出版社', 40.70, 12, '以史为鉴，发展全球化体育产业。', 1, '2019-05-25 10:12:03');
INSERT INTO `book` VALUES (53, '阿西莫夫科幻经典', '艾萨克·阿西莫夫', 'ftp://ZDN_FTP:159753@127.0.0.1/images/images/2019052510133115.jpg', '江苏文艺出版社', 105.30, 20, '科幻巨匠阿西莫夫被公认的经典巨作！关于平行宇宙的一切、关于时间旅行的终极奥秘和恢宏构想、“机器人学三大法则”的起源！', 1, '2019-05-25 10:13:31');

-- ----------------------------
-- Table structure for book_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `book_cart_item`;
CREATE TABLE `book_cart_item`  (
  `book_cart_item_id` int(11) NOT NULL COMMENT '购物车Id',
  `customer_id` int(11) NOT NULL COMMENT '用户Id',
  `book_id` int(11) NULL DEFAULT NULL COMMENT '书籍编号',
  `num` int(11) NULL DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`book_cart_item_id`) USING BTREE,
  INDEX `book_id_outer2`(`book_id`) USING BTREE,
  INDEX `customer_id_fk2`(`customer_id`) USING BTREE,
  CONSTRAINT `book_id_outer2` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customer_id_fk2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for book_type
-- ----------------------------
DROP TABLE IF EXISTS `book_type`;
CREATE TABLE `book_type`  (
  `book_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型编号',
  `book_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型名称',
  `book_type_state` int(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型状态',
  PRIMARY KEY (`book_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_type
-- ----------------------------
INSERT INTO `book_type` VALUES (1, '都市', 1);
INSERT INTO `book_type` VALUES (2, '玄幻', 1);
INSERT INTO `book_type` VALUES (3, '科技', 1);
INSERT INTO `book_type` VALUES (6, '末日', 1);
INSERT INTO `book_type` VALUES (7, '仙侠', 0);
INSERT INTO `book_type` VALUES (8, '军事', 1);
INSERT INTO `book_type` VALUES (9, '灵异', 1);
INSERT INTO `book_type` VALUES (11, '游戏', 1);
INSERT INTO `book_type` VALUES (12, '体育', 1);
INSERT INTO `book_type` VALUES (13, '现实', 0);
INSERT INTO `book_type` VALUES (19, '休闲', 1);
INSERT INTO `book_type` VALUES (20, '科幻', 1);
INSERT INTO `book_type` VALUES (25, '历史', 1);
INSERT INTO `book_type` VALUES (26, '你好', 0);

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact`  (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收货人Id',
  `contact_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人昵称',
  `contact_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人地址',
  `contact_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `customer_id` int(10) NOT NULL COMMENT '客户Id',
  PRIMARY KEY (`contact_id`) USING BTREE,
  INDEX `customer_id_fk1`(`customer_id`) USING BTREE,
  CONSTRAINT `customer_id_fk1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES (1, '张三', '南', '18181818188', 1);
INSERT INTO `contact` VALUES (15, '小明', '江苏南京夫子庙', '15849865487', 1);
INSERT INTO `contact` VALUES (16, '春娇', '江苏淮安涟水', '15849865487', 1);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `customer_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `customer_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户地址',
  `customer_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户手机号码',
  `customer_register_date` datetime(0) NOT NULL COMMENT '注册日期',
  PRIMARY KEY (`customer_id`) USING BTREE,
  INDEX `customer_id`(`customer_id`, `customer_name`, `customer_password`, `customer_address`, `customer_phone`, `customer_register_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, '张三12', '202cb962ac59075b964b07152d234b70', '南京晓庄的', '15956988946', '2019-03-29 00:00:00');
INSERT INTO `customer` VALUES (13, '禄语为', '202cb962ac59075b964b07152d234b70', '南京', '15489777989', '2019-04-14 22:39:01');
INSERT INTO `customer` VALUES (16, 'zrh', 'e10adc3949ba59abbe56e057f20f883e', '南京', '15487987987', '2019-04-14 22:48:24');
INSERT INTO `customer` VALUES (18, 'hhh', 'a3aca2964e72000eea4c56cb341002a4', '南京', '11123131313', '2019-04-14 22:50:35');
INSERT INTO `customer` VALUES (20, '芦苇微微', 'e10adc3949ba59abbe56e057f20f883e', '江南银行', '14785698745', '2019-05-25 19:05:22');
INSERT INTO `customer` VALUES (21, '一笑倾城', 'e10adc3949ba59abbe56e057f20f883e', '王者峡谷', '15478971515', '2019-05-25 19:05:56');

-- ----------------------------
-- Table structure for order_book
-- ----------------------------
DROP TABLE IF EXISTS `order_book`;
CREATE TABLE `order_book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单书籍编号',
  `num` int(11) NOT NULL COMMENT '书籍数量',
  `order_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `book_id` int(11) NOT NULL COMMENT '书籍编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_book__ibfk_2`(`book_id`) USING BTREE,
  INDEX `order_book__ibfk_1`(`order_id`) USING BTREE,
  CONSTRAINT `order_book__ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_book__ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_book
-- ----------------------------
INSERT INTO `order_book` VALUES (1, 1, '1', 25);
INSERT INTO `order_book` VALUES (2, 2, '1', 26);
INSERT INTO `order_book` VALUES (3, 3, '2', 26);
INSERT INTO `order_book` VALUES (4, 4, '2', 30);
INSERT INTO `order_book` VALUES (5, 5, '2', 33);
INSERT INTO `order_book` VALUES (6, 1, '201905146136', 26);
INSERT INTO `order_book` VALUES (8, 1, '201905146932', 26);
INSERT INTO `order_book` VALUES (10, 1, '201905146551', 25);
INSERT INTO `order_book` VALUES (11, 1, '201905146272', 28);
INSERT INTO `order_book` VALUES (12, 1, '201905146512', 25);
INSERT INTO `order_book` VALUES (13, 5, '201905146318', 26);
INSERT INTO `order_book` VALUES (14, 1, '201905146252', 25);
INSERT INTO `order_book` VALUES (15, 1, '201905146168', 28);
INSERT INTO `order_book` VALUES (16, 1, '201905146168', 28);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `confirm_date` datetime(0) NOT NULL COMMENT '下单日期',
  `order_state` int(2) NOT NULL COMMENT '订单状态',
  `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价',
  `customer_id` int(255) NOT NULL COMMENT '下单用户ID',
  `contact_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人',
  `contact_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `contact_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人地址',
  `comment_id` int(11) NULL DEFAULT NULL COMMENT '订单评价ID',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `comment_id_outer2`(`comment_id`) USING BTREE,
  INDEX `customer_id_fk3`(`customer_id`) USING BTREE,
  CONSTRAINT `customer_id_fk3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '2019-05-07 10:23:54', 2, 84.20, 1, '张三', '18116891548', '南京晓庄学院方山校区', NULL);
INSERT INTO `orders` VALUES ('2', '2019-05-10 10:26:06', 2, 552.27, 1, '李四', '15367626767', '昆明云南印象北区', NULL);
INSERT INTO `orders` VALUES ('201905146136', '2019-05-26 00:31:07', 1, 73.98, 1, '张三', '18181818188', '南', NULL);
INSERT INTO `orders` VALUES ('201905146168', '2019-05-26 10:44:48', 1, 177.50, 1, '小明', '15849865487', 'rew', NULL);
INSERT INTO `orders` VALUES ('201905146252', '2019-05-26 10:15:12', 1, 10.22, 1, '小明', '15849865487', '江苏南京夫子庙', NULL);
INSERT INTO `orders` VALUES ('201905146272', '2019-05-26 00:51:28', 1, 88.75, 1, '张三', '18181818188', '南', NULL);
INSERT INTO `orders` VALUES ('201905146318', '2019-05-26 07:23:35', 1, 184.95, 1, '张三', '18181818188', '南', NULL);
INSERT INTO `orders` VALUES ('201905146512', '2019-05-26 00:52:41', 1, 10.22, 1, '张三', '18181818188', '南', NULL);
INSERT INTO `orders` VALUES ('201905146551', '2019-05-26 00:50:49', 1, 10.22, 1, '张三', '18181818188', '南', NULL);
INSERT INTO `orders` VALUES ('201905146932', '2019-05-26 00:31:31', 1, 73.98, 1, '张三', '18181818188', '南', NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `sys_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `sys_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员姓名',
  `sys_login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员登录名',
  `sys_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员登陆密码',
  `sys_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员电话',
  `sys_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员邮箱',
  `create_date` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建日期',
  `is_valid` int(1) NOT NULL DEFAULT 1 COMMENT '是否有效',
  PRIMARY KEY (`sys_id`) USING BTREE,
  UNIQUE INDEX `login_name`(`sys_login_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin12', 'admin12', '202cb962ac59075b964b07152d234b70', '13988888888', 'admin12@qq.com', '2019-05-25 08:11:43', 0);
INSERT INTO `sys_user` VALUES (8, 'admin123', 'admin123', '202cb962ac59075b964b07152d234b70', '14111111111', 'admin123@qq.com', '2019-05-25 08:12:03', 0);
INSERT INTO `sys_user` VALUES (9, 'wzm', 'wzm', '202cb962ac59075b964b07152d234b70', '18168037583', 'wzm@qq.com', '2019-05-25 08:12:16', 0);
INSERT INTO `sys_user` VALUES (10, 'wrh', 'wrh', '202cb962ac59075b964b07152d234b70', '14111111144', 'wrh@qq.com', '2019-05-25 08:12:32', 1);
INSERT INTO `sys_user` VALUES (11, 'admin', 'admin', '202cb962ac59075b964b07152d234b70', '18168037333', 'admin@qq.com', '2019-05-25 08:11:20', 1);
INSERT INTO `sys_user` VALUES (12, 'lyw', 'lyw', '202cb962ac59075b964b07152d234b70', '14111111111', '12514git@qq.com', '2019-05-25 08:11:01', 1);

SET FOREIGN_KEY_CHECKS = 1;
