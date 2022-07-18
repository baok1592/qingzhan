/*
 Navicat Premium Data Transfer

 Source Server         : xampp
 Source Server Type    : MariaDB
 Source Server Version : 100411
 Source Host           : localhost:3306
 Source Schema         : qz

 Target Server Type    : MariaDB
 Target Server Version : 100411
 File Encoding         : 65001

 Date: 11/06/2022 10:05:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for news_admins
-- ----------------------------
DROP TABLE IF EXISTS `news_admins`;
CREATE TABLE `news_admins`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0 COMMENT 'w7_id',
  `username` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `state` int(1) NOT NULL DEFAULT 0 COMMENT '是否禁用',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '描述',
  `login_time` int(11) NULL DEFAULT NULL COMMENT '登录时间',
  `create_time` int(11) NULL DEFAULT NULL,
  `delete_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;


-- ----------------------------
-- Table structure for news_article
-- ----------------------------
DROP TABLE IF EXISTS `news_article`;
CREATE TABLE `news_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `short_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '短标题',
  `desc` varchar(140) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '摘要',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '正文',
  `img_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片ID',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布者用户名 ',
  `category_id` int(11) NOT NULL COMMENT '分类ID',
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '来源',
  `sort` int(11) NOT NULL COMMENT '排序',
  `jump_url` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '外链',
  `read_count` int(11) NOT NULL COMMENT '阅读量',
  `label` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签',
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-显示、1-隐藏',
  `is_top` int(11) NOT NULL COMMENT '是否头条0否1是',
  `is_new` int(11) NOT NULL DEFAULT 0 COMMENT '是否最新',
  `is_hot` int(11) NOT NULL DEFAULT 0 COMMENT '是否热门',
  `is_vip` int(11) NULL DEFAULT 0 COMMENT '是否VIP',
  `date` int(11) NULL DEFAULT NULL COMMENT '文章自定义日期',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '文章发布时间',
  `update_time` int(11) NULL DEFAULT NULL,
  `delete_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 AVG_ROW_LENGTH = 6553 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS文章表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of news_article
-- ----------------------------
INSERT INTO `news_article` VALUES (15, 0, '文章标题', '文章标题', '文章标题-的摘要记录', '<p><strong>发展背景</strong>&nbsp;</p><p>随着APP市场的饱和，大部分用户已经养成了使用习惯，开发新的APP很难在市场生存。此外，APP开发和推广成本高也是不争的事实。易观2018年3月份的报告显示，移动电商APP的下载成本高达120-200&nbsp;元，而且这些后期未必能形成转化。互联网金融、二手车电商APP的新客户成本，更是动辄高达数千元。因此，不少“码农”们决定开始向小程序市场“跳槽”。</p><p><br></p><p><strong>主要优势&nbsp;</strong></p><p>对于开发者而言，小程序开发门槛相对较低，难度不及APP，能够满足简单的基础应用，适合生活服务类线下商铺以及非刚需低频应用的转换。对于用户来说，能够节约使用时间成本和手机内存空间；对于开发者来说也能节约开发和推广成本。 </p><p><br></p><p><strong>主要功能</strong></p><p>小程序能够实现消息通知、线下扫码、公众号关联等七大功能。其中，通过公众号关联，用户可以实现公众号与小程序之间相互跳转。</p>', '42', 'admin', 19, '', 0, '', 0, '', 0, 1, 0, 0, 0, 1654535222, 1654535303, 1654592178, NULL);
INSERT INTO `news_article` VALUES (16, 0, '程序员该怎样学习数学', '程序员学数学', '编程的世界远不止条件和循环语句，程序员的人生应当是创造的舞台，往上走数学就必不可少。', '<p style=\"text-indent: 0px; text-align: start;\">编程的世界远不止条件和循环语句，程序员的人生应当是创造的舞台，往上走数学就必不可少。</p><p style=\"text-indent: 0px; text-align: start;\">我们不是为了数学而学数学，要和具体应用结合在一起，用多少学多少。<br>数学是工具而非问题，理解数学的工具属性就会自然而然地引出了数学学习中的另一个关键点，<br>那就是工具设计的出发点，也就是所谓的数学思想与数学逻辑。<br>比如线性代数与矩阵论是对具体对象的抽象表示与运算，比如概率论和数理统计是对不确定性及其定型定量表示的建模。<br>数学绝不仅仅是算术，把主要精力放在计算上未免因小失大</p><p style=\"text-indent: 0px; text-align: start;\">掌握基本的线性代数、矩阵论、概率论、数理统计知识足以应付日常使用，好高骛远有害无益。<br>学数学和学一门新技术一样，也有这样三个阶段：先用起来、了解原理、了解为什么<br><strong>程序员的数学通常为4大类：</strong>&nbsp;编程语句，数据结构，通用算法，机器学习算法</p>', '41', 'admin', 19, '', 0, '', 0, '', 0, 1, 0, 0, 0, 1654586967, 1654587034, 1654852695, NULL);
INSERT INTO `news_article` VALUES (17, 0, 'JS的数据结构', '数据结构', 'JS的数据结构，数组和链表 在内存的存储', '<blockquote style=\"text-indent: 0px; text-align: start; line-height: 30px;\">JS的数据结构就2种，数组和链表链表可以演变成：树形结构、图形结构数组可以演变成：队列、栈树形结构是前端最重要的数据结构</blockquote><h3 style=\"text-indent: 0px; text-align: start;\">数组和链表&nbsp;在内存的存储</h3><p style=\"text-indent: 0px; text-align: start;\"><strong>数组：</strong>是由相同类型的元素的集合所组成的数据结构，分配一块连续的内存来存储。知道第一个元素的内存地址，加上下标（偏移量）就能找到第2或N个。<br>数组随机访问的速度快，增加和删除则慢（因为删除index2，后面的3-n都要往前挪一位）</p><p style=\"text-indent: 0px; text-align: start;\"><strong>链表：</strong>非连续存储的指向型存储，随机访问的速度慢（需一层层查找），增加和删除则快（不需要挪位）</p><hr/><h3 style=\"text-indent: 0px; text-align: start;\">链表</h3><p style=\"text-indent: 0px; text-align: start;\">树形结构、图形结构</p><p style=\"text-indent: 0px; text-align: center;\"><img src=\"http://www.tp5.com//uploads/imgs/ctx/20220607/629effb6af6ad.png\" alt=\"\" data-href=\"\" style=\"\"></p>', '42', 'admin', 19, '', 0, '', 0, '', 0, 1, 0, 0, 0, 1654587287, 1654587334, 1654587359, NULL);
INSERT INTO `news_article` VALUES (18, 0, 'PHP单例模式与类静态调用区别', 'PHP单例模式', '用类静态方法，是否就不需要单例模式', '<h4 style=\"text-indent: 0px; text-align: start;\">用类静态方法，是否就不需要单例模式了？</h4><p style=\"text-indent: 0px; text-align: start;\">如TP中model模型，常用静态调用，方便又不占用资源，避免多次new有消耗内存<br>把类的构造函数设置为&nbsp;protected&nbsp;外部就不能实例化，只允许静态调用，感觉就不需要单例模式了。</p><p style=\"text-indent: 0px; text-align: start;\">单例模式区别于静态调用有很多优势，如：</p><blockquote style=\"text-indent: 0px; text-align: start; line-height: 30px;\">可以链式调用<br>构造函数可以传参</blockquote><p style=\"text-indent: 0px; text-align: start;\">所以该用单例模式的时候还是需用，不要拿静态调用替代</p><p style=\"text-indent: 0px; text-align: start;\"><img src=\"http://www.tp5.com//uploads/imgs/ctx/20220608/629f772f595a3.jpeg\" alt=\"\" data-href=\"\" style=\"\"></p>', '40', 'admin', 19, '', 0, '', 0, '', 0, 1, 0, 0, 0, 1654587407, 1654587484, 1654852701, NULL);




-- ----------------------------
-- Table structure for news_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `news_auth_group`;
CREATE TABLE `news_auth_group`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '\'\\\'\\\'\'',
  `state` tinyint(1) NOT NULL DEFAULT 1,
  `rules` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `delete_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of news_auth_group
-- ----------------------------
INSERT INTO `news_auth_group` VALUES (1, '超级管理员', 1, '7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,5,27,28,29,6,30,4,31,2,32,3,33,1', NULL);
INSERT INTO `news_auth_group` VALUES (2, '网站编辑', 1, '7,9,10,11,12,13,14,33,8,1,21,22,23,30,25,27', NULL);

-- ----------------------------
-- Table structure for news_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `news_auth_group_access`;
CREATE TABLE `news_auth_group_access`  (
  `aid` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL,
  UNIQUE INDEX `uid_group_id`(`aid`, `group_id`) USING BTREE,
  INDEX `uid`(`aid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of news_auth_group_access
-- ----------------------------
INSERT INTO `news_auth_group_access` VALUES (1, 1);
INSERT INTO `news_auth_group_access` VALUES (2, 1);
INSERT INTO `news_auth_group_access` VALUES (3, 1);
INSERT INTO `news_auth_group_access` VALUES (4, 1);
INSERT INTO `news_auth_group_access` VALUES (5, 2);
INSERT INTO `news_auth_group_access` VALUES (6, 1);
INSERT INTO `news_auth_group_access` VALUES (7, 1);
INSERT INTO `news_auth_group_access` VALUES (8, 2);
INSERT INTO `news_auth_group_access` VALUES (9, 1);
INSERT INTO `news_auth_group_access` VALUES (9, 2);
INSERT INTO `news_auth_group_access` VALUES (10, 1);
INSERT INTO `news_auth_group_access` VALUES (11, 1);
INSERT INTO `news_auth_group_access` VALUES (12, 1);
INSERT INTO `news_auth_group_access` VALUES (13, 73);
INSERT INTO `news_auth_group_access` VALUES (14, 2);
INSERT INTO `news_auth_group_access` VALUES (15, 81);

-- ----------------------------
-- Table structure for news_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `news_auth_rule`;
CREATE TABLE `news_auth_rule`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(1) NOT NULL DEFAULT 0,
  `title` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '中文名',
  `auth_name` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cms中英文名',
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '控制器名',
  `fnames` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '函数名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news_auth_rule
-- ----------------------------
INSERT INTO `news_auth_rule` VALUES (1, 0, '内容', 'ctx', NULL, NULL);
INSERT INTO `news_auth_rule` VALUES (2, 0, 'PC', 'pc', NULL, NULL);
INSERT INTO `news_auth_rule` VALUES (3, 0, '手机', 'mobile', NULL, NULL);
INSERT INTO `news_auth_rule` VALUES (4, 0, '其他', 'other', NULL, NULL);
INSERT INTO `news_auth_rule` VALUES (5, 0, '用户', 'userManage', NULL, NULL);
INSERT INTO `news_auth_rule` VALUES (6, 0, '配置', 'sys', NULL, NULL);
INSERT INTO `news_auth_rule` VALUES (7, 1, '文章', 'ArticleList', 'cms.article', 'getAll,add,up,detail,editState,addWangImg,getCidArticle');
INSERT INTO `news_auth_rule` VALUES (8, 1, '文章删除', 'ArticleDel', 'cms.article', 'del');
INSERT INTO `news_auth_rule` VALUES (9, 1, '图集', 'PicList', 'cms.cards', 'getAll,add,up,detail,editState,getCidCards');
INSERT INTO `news_auth_rule` VALUES (10, 1, '图集删除', 'PicDel', 'cms.cards', 'del');
INSERT INTO `news_auth_rule` VALUES (11, 1, '产品', 'ProList', 'cms.pros', 'getAll,add,up,detail,editState,getCidPros');
INSERT INTO `news_auth_rule` VALUES (12, 1, '产品删除', 'ProDel', 'cms.pros', 'del');
INSERT INTO `news_auth_rule` VALUES (13, 1, '栏目', 'CategoryList', 'cms.category', 'getAll,up,detail,upHomeTmp');
INSERT INTO `news_auth_rule` VALUES (14, 1, '栏目增删', 'CategoryManage', 'cms.category', 'del,add,up_sort,editState');
INSERT INTO `news_auth_rule` VALUES (15, 2, 'PC端装修', 'PcDiy', 'cms.pc', 'tmp_all,add,up,del,detail,upName');
INSERT INTO `news_auth_rule` VALUES (17, 3, '手机端装修', 'mdiy', 'cms.mobile', 'tmp_all,add,up,del,detail,upName');
INSERT INTO `news_auth_rule` VALUES (18, 3, '手机端导航', 'mnav', 'cms.mobile', 'getNavsall,navsUp');
INSERT INTO `news_auth_rule` VALUES (19, 3, '公众号', 'gzh', NULL, NULL);
INSERT INTO `news_auth_rule` VALUES (20, 3, '微信小程序', 'wxxcx', NULL, NULL);
INSERT INTO `news_auth_rule` VALUES (21, 4, '广告', 'AD', 'cms.ad', 'add,up,del');
INSERT INTO `news_auth_rule` VALUES (22, 4, '资源管理', 'resource', 'cms.resource', 'getResourcType,getCategoryType,getImgCategoryData,addImg,upImgbackUrl');
INSERT INTO `news_auth_rule` VALUES (23, 4, '资源分类', 'resourceCate', 'cms.resource', 'categoryAdd');
INSERT INTO `news_auth_rule` VALUES (24, 4, '资源删除', 'resourceDel', 'cms.resource', 'dels');
INSERT INTO `news_auth_rule` VALUES (25, 5, '用户列表', 'userList', 'cms.user', 'userAll');
INSERT INTO `news_auth_rule` VALUES (26, 5, '用户删禁', 'userDel', 'cms.user', 'del,userDisable');
INSERT INTO `news_auth_rule` VALUES (27, 6, '配置', 'setSys', 'cms.system', 'getConfigType,up');
INSERT INTO `news_auth_rule` VALUES (28, 6, '管理员', 'admins', 'cms.admins', 'alls');
INSERT INTO `news_auth_rule` VALUES (29, 6, '管理组', 'groups', 'cms.group', 'alls');
INSERT INTO `news_auth_rule` VALUES (30, 4, '统计', 'statistics', 'cms.common', 'statistics');
INSERT INTO `news_auth_rule` VALUES (31, 2, '友情链接', 'link', 'cms.link', 'getAll,up,del,add,sort');
INSERT INTO `news_auth_rule` VALUES (32, 3, '手机导航', 'mnav', 'cms.mobile', 'getNavsall,navsUp');
INSERT INTO `news_auth_rule` VALUES (33, 1, '问答', 'Ask', 'cms.ask', 'getAll,add,up,detail,editState,del');

-- ----------------------------
-- Table structure for news_auto_revert
-- ----------------------------
DROP TABLE IF EXISTS `news_auto_revert`;
CREATE TABLE `news_auto_revert`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则名称',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键词',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型 纯文字、图文、图片',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复内容，图文和图片存id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of news_auto_revert
-- ----------------------------
INSERT INTO `news_auto_revert` VALUES (1, '发1回复2', '2', 'text', '2');

-- ----------------------------
-- Table structure for news_banner
-- ----------------------------
DROP TABLE IF EXISTS `news_banner`;
CREATE TABLE `news_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Banner名称，通常作为标识',
  `type` tinyint(6) NULL DEFAULT NULL COMMENT 'pc0,手机1',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Banner描述',
  `delete_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'banner管理表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of news_banner
-- ----------------------------
INSERT INTO `news_banner` VALUES (1, 0, '首页幻灯', 0, NULL, NULL, NULL);
INSERT INTO `news_banner` VALUES (2, 0, '列表顶部', 0, NULL, NULL, NULL);
INSERT INTO `news_banner` VALUES (3, 0, '手机首页幻灯', 1, NULL, NULL, NULL);
INSERT INTO `news_banner` VALUES (4, 0, '封面顶部', 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for news_banner_item
-- ----------------------------
DROP TABLE IF EXISTS `news_banner_item`;
CREATE TABLE `news_banner_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `banner_id` int(11) NOT NULL COMMENT '外键，关联banner表',
  `img_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '外键，关联image表',
  `sort` int(11) NOT NULL DEFAULT 0,
  `jump_id` int(11) NOT NULL DEFAULT 0,
  `jump_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '跳转类型',
  `one` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  `delete_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'banner子项表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of news_banner_item
-- ----------------------------
INSERT INTO `news_banner_item` VALUES (24, 0, '首页横幅', 1, '42', 0, 0, '', '广告标题', '广告描述', NULL, NULL);
INSERT INTO `news_banner_item` VALUES (27, 0, '列表横幅', 2, '35', 0, 0, '', '简单易用广告标题', NULL, NULL, NULL);
INSERT INTO `news_banner_item` VALUES (28, 0, '封面横幅', 4, '38', 0, 0, '', '轻松拥有多端网站', 'PC、小程序、app', NULL, NULL);
INSERT INTO `news_banner_item` VALUES (29, 0, '首页', 3, '51', 0, 16, 'lists', NULL, NULL, NULL, NULL);
INSERT INTO `news_banner_item` VALUES (30, 0, '手机横幅2', 0, '42', 0, 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `news_banner_item` VALUES (31, 0, '手机横幅', 3, '52', 0, 19, 'category', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for news_cards
-- ----------------------------
DROP TABLE IF EXISTS `news_cards`;
CREATE TABLE `news_cards`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `desc` varchar(140) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '摘要',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '正文',
  `img_id` int(11) NOT NULL COMMENT '图片ID',
  `img_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_id` int(11) NOT NULL COMMENT '分类ID',
  `aid` int(11) NULL DEFAULT NULL COMMENT '管理员ID',
  `sort` int(11) NOT NULL COMMENT '排序',
  `jump_url` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '外链',
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-显示、1-隐藏',
  `is_top` int(11) NOT NULL COMMENT '是否头条0否1是',
  `is_new` int(11) NOT NULL DEFAULT 0 COMMENT '是否最新',
  `is_hot` int(11) NOT NULL DEFAULT 0 COMMENT '是否热门',
  `is_vip` int(11) NULL DEFAULT 0 COMMENT '是否VIP',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '文章发布时间',
  `update_time` int(11) NULL DEFAULT NULL,
  `delete_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 AVG_ROW_LENGTH = 6553 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS文章表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of news_cards
-- ----------------------------
INSERT INTO `news_cards` VALUES (20, 0, '赵老师', '赵老师的简介', '<p>赵老师的详情描述</p>', 44, '44', 21, 1, 0, '', 0, 1, 0, 0, 0, 1654535444, 1654852653, NULL);
INSERT INTO `news_cards` VALUES (21, 0, '张老师', '张老师的简介', '<p><br></p>', 47, '47,40,39,43,49', 21, 1, 0, '', 0, 1, 0, 0, 0, 1654569157, 1654585723, NULL);
INSERT INTO `news_cards` VALUES (22, 0, '李老师', '伯克利硕士', '<p>123</p>', 45, '45', 21, 1, 0, '', 0, 1, 0, 0, 0, 1654569182, 1654852652, NULL);
INSERT INTO `news_cards` VALUES (23, 0, '王老师', '王老师的简介', '', 48, '48', 21, 1, 0, '', 0, 1, 0, 0, 0, 1654569206, 1654569208, NULL);
INSERT INTO `news_cards` VALUES (24, 0, 'asd', '111', '<p><br></p>', 43, '43', 21, 1, 0, '', 0, 1, 0, 0, 0, 1654570008, 1654570084, 1654570084);
INSERT INTO `news_cards` VALUES (25, 0, '123', '123', '', 43, '43', 21, 1, 0, '', 0, 0, 0, 0, 0, 1654570094, 1654570510, 1654570510);
INSERT INTO `news_cards` VALUES (26, 0, '123', '123', '', 42, '42', 21, 1, 0, '', 0, 0, 0, 0, 0, 1654570445, 1654570507, 1654570507);
INSERT INTO `news_cards` VALUES (27, 0, 'aaaa', '123', '', 42, '42', 21, 1, 0, '', 0, 0, 0, 0, 0, 1654570649, 1654570702, 1654570702);
INSERT INTO `news_cards` VALUES (28, 0, 'we', '123', '<p>123123</p>', 42, '42', 21, 1, 0, '', 0, 0, 0, 0, 0, 1654570831, 1654570842, 1654570842);
INSERT INTO `news_cards` VALUES (29, 0, '企业风光', '企业风光', '<p>企业荣誉一企业荣誉一</p><p>企业荣誉一企业荣誉一企业荣誉一企业荣誉一</p><p>企业荣誉一企业荣誉一企业荣誉一企业荣誉一企业荣誉一企业荣誉一</p>', 50, '50', 23, 1, 0, '', 0, 1, 0, 0, 0, 1654836423, 1654836534, NULL);
INSERT INTO `news_cards` VALUES (30, 0, '企业风格', '企业风格', '<p>企业风格</p>', 53, '53', 23, 1, 0, '', 0, 1, 0, 0, 0, 1654836521, 1654836552, NULL);

-- ----------------------------
-- Table structure for news_category
-- ----------------------------
DROP TABLE IF EXISTS `news_category`;
CREATE TABLE `news_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '栏目标题',
  `short_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '短标题',
  `type` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型：lists,cards,pros,cover...',
  `diy_id` int(11) NOT NULL COMMENT '装修页面ID',
  `mb_diy_id` int(11) NULL DEFAULT NULL COMMENT '手机DIY的ID',
  `ctx_id` int(11) NULL DEFAULT 0 COMMENT '内容列表模板ID',
  `mb_ctx_id` int(11) NULL DEFAULT 0 COMMENT '内容列表-手机模板ID',
  `pid` int(11) NOT NULL DEFAULT 0,
  `level` tinyint(4) NOT NULL DEFAULT 0,
  `sort` int(11) NULL DEFAULT NULL,
  `img_id` int(255) NULL DEFAULT 0 COMMENT '商品分类图片',
  `seotitle` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'seo标题',
  `keyword` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `jump_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '跳转地址',
  `is_hidden` int(1) NOT NULL DEFAULT 0 COMMENT '1 显示 0隐藏',
  `is_top` int(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT '是否手机端首页显示0否1是',
  `delete_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 AVG_ROW_LENGTH = 244 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of news_category
-- ----------------------------
INSERT INTO `news_category` VALUES (16, 0, '企业概况', '', 'cover', 15, 18, 0, 0, 0, 0, 0, 35, '', '', '', '', 0, 0, NULL);
INSERT INTO `news_category` VALUES (17, 0, '企业简介', '', 'cover', 15, 18, 0, 0, 16, 0, 0, 50, '', '', '', '', 0, 1, NULL);
INSERT INTO `news_category` VALUES (18, 0, '企业文化', '', 'cover', 15, 18, 0, 0, 16, 0, 0, 35, '', '', '', '', 0, 0, NULL);
INSERT INTO `news_category` VALUES (19, 0, '新闻中心', '', 'lists', 12, 17, 0, 0, 0, 0, 1, 39, '', '', '', '', 0, 1, NULL);
INSERT INTO `news_category` VALUES (20, 0, '产品中心', '', 'pros', 13, 15, 0, 0, 0, 0, 2, 37, '', '', '', '', 0, 0, NULL);
INSERT INTO `news_category` VALUES (21, 0, '员工风采', '', 'cards', 14, 16, 0, 0, 0, 0, 3, 40, '', '', '', '', 0, 1, NULL);
INSERT INTO `news_category` VALUES (22, 0, '联系我们', '', 'cover', 15, 19, 0, 0, 0, 0, 6, 41, '', '', '', '', 0, 1, NULL);
INSERT INTO `news_category` VALUES (23, 0, '企业风光', '', 'cards', 14, 16, 0, 0, 16, 0, 0, 53, '', '', '', '', 0, 0, NULL);
INSERT INTO `news_category` VALUES (24, 0, 'xxx', '', 'lists', 12, 17, 0, 0, 16, 0, 0, 53, '', '', '', '', 0, 0, 1654841913);

-- ----------------------------
-- Table structure for news_cover
-- ----------------------------
DROP TABLE IF EXISTS `news_cover`;
CREATE TABLE `news_cover`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news_cover
-- ----------------------------
INSERT INTO `news_cover` VALUES (7, 16, '<p>企业概况</p>');
INSERT INTO `news_cover` VALUES (8, 17, '<p>企业是指企业所得税法及其实施条例规定的居民企业和非居民企业。&nbsp;居民企业，是指依法在中国境内成立，或者依照外国（地区）法律成立但实际管理机构在中国境内的企业。非居民企业，是指依照外国（地区）法律成立且实际管理机构不在中国境内，但在中国境内设立机构、场所的，或者在中国境内未设立机构、场所，但有来源于中国境内所得的企业。&nbsp;</p><p><br></p><p><br></p><p style=\"text-align: center;\"><img src=\"http://www.tp5.com//uploads/imgs/ctx/20220609/62a0cb8d153af.jpg\" alt=\"\" data-href=\"\" style=\"\"></p><p style=\"text-align: center;\"><br></p><p><br></p><p>现代经济学理论认为，企业本质上是“一种资源配置的机制”，其能够实现整个社会经济资源的优化配置，降低整个社会的“交易成本”。</p>');
INSERT INTO `news_cover` VALUES (9, 18, '<p style=\"text-indent: 0px; text-align: start;\">编程的世界远不止条件和循环语句，程序员的人生应当是创造的舞台，往上走数学就必不可少。</p><p style=\"text-indent: 0px; text-align: start;\">我们不是为了数学而学数学，要和具体应用结合在一起，用多少学多少。<br>数学是工具而非问题，理解数学的工具属性就会自然而然地引出了数学学习中的另一个关键点，<br>那就是工具设计的出发点，也就是所谓的数学思想与数学逻辑。<br>比如线性代数与矩阵论是对具体对象的抽象表示与运算，比如概率论和数理统计是对不确定性及其定型定量表示的建模。<br>数学绝不仅仅是算术，把主要精力放在计算上未免因小失大</p><p style=\"text-indent: 0px; text-align: start;\">掌握基本的线性代数、矩阵论、概率论、数理统计知识足以应付日常使用，好高骛远有害无益。<br>学数学和学一门新技术一样，也有这样三个阶段：先用起来、了解原理、了解为什么<br><strong>程序员的数学通常为4大类：</strong>&nbsp;编程语句，数据结构，通用算法，机器学习算法</p>');
INSERT INTO `news_cover` VALUES (10, 22, '<h2 style=\"text-indent: 0px; text-align: left;\">联系我们</h2><p style=\"text-indent: 0px; text-align: left;\"><br></p><p style=\"text-indent: 0px; text-align: left;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;建站只是技术的实现，我们更注重的是以业务为主导，通过品牌设计和SEO的技术手段，为客户提供完善的多平台网络营销解决方案，帮助众多企业开辟了网络市场，实现利润增长。</p>');

-- ----------------------------
-- Table structure for news_diy
-- ----------------------------
DROP TABLE IF EXISTS `news_diy`;
CREATE TABLE `news_diy`  (
  `id` int(11) NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news_diy
-- ----------------------------
INSERT INTO `news_diy` VALUES (1, 'pc_home_temp_id', 11);
INSERT INTO `news_diy` VALUES (2, 'mb_home_temp_id', 14);

-- ----------------------------
-- Table structure for news_image
-- ----------------------------
DROP TABLE IF EXISTS `news_image`;
CREATE TABLE `news_image`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片路径',
  `cid` int(11) NOT NULL DEFAULT 0,
  `state` int(11) NULL DEFAULT 1,
  `create_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '图片总表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of news_image
-- ----------------------------
INSERT INTO `news_image` VALUES (35, 0, '1/629e2e200f6a8.jpg', 1, 1, 1654533664);
INSERT INTO `news_image` VALUES (36, 0, '1/629e2f309bd2f.jpg', 1, 1, 1654533936);
INSERT INTO `news_image` VALUES (37, 0, '1/629e2f5ad5d10.jpg', 1, 1, 1654533978);
INSERT INTO `news_image` VALUES (38, 0, '1/629e2f5cbdd03.jpg', 1, 1, 1654533980);
INSERT INTO `news_image` VALUES (39, 0, '1/629e2f66dc161.jpg', 1, 1, 1654533990);
INSERT INTO `news_image` VALUES (40, 0, '1/629e2f6af0256.jpg', 1, 1, 1654533994);
INSERT INTO `news_image` VALUES (41, 0, '1/629e2fba0d3df.jpg', 1, 1, 1654534074);
INSERT INTO `news_image` VALUES (42, 0, '1/629e3116b17c1.jpg', 1, 1, 1654534422);
INSERT INTO `news_image` VALUES (43, 0, '1/629e35113c094.jpg', 1, 1, 1654535441);
INSERT INTO `news_image` VALUES (44, 0, '1/629eb85039cd9.jpg', 1, 1, 1654569040);
INSERT INTO `news_image` VALUES (45, 0, '1/629eb854dd75c.jpg', 1, 1, 1654569044);
INSERT INTO `news_image` VALUES (46, 0, '1/629eb85733201.jpg', 1, 1, 1654569047);
INSERT INTO `news_image` VALUES (47, 0, '1/629eb85955c90.jpg', 1, 1, 1654569049);
INSERT INTO `news_image` VALUES (48, 0, '1/629eb85bd6909.jpg', 1, 1, 1654569051);
INSERT INTO `news_image` VALUES (49, 0, '1/629ef978a1d69.jpeg', 1, 0, 1654585720);
INSERT INTO `news_image` VALUES (50, 0, '1/62a0cb7f27d21.jpg', 1, 1, 1654705023);
INSERT INTO `news_image` VALUES (51, 0, '1/62a2b5d85cd99.jpg', 1, 1, 1654830552);
INSERT INTO `news_image` VALUES (52, 0, '1/62a2b5dadd38e.jpg', 1, 1, 1654830554);
INSERT INTO `news_image` VALUES (53, 0, '1/62a2cd1ba7597.jpg', 1, 1, 1654836507);
INSERT INTO `news_image` VALUES (54, 0, '1/62a322022058e.jpg', 1, 1, 1654858242);
INSERT INTO `news_image` VALUES (55, 0, '1/62a3220e4072e.jpg', 1, 1, 1654858254);

-- ----------------------------
-- Table structure for news_link
-- ----------------------------
DROP TABLE IF EXISTS `news_link`;
CREATE TABLE `news_link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `img_id` int(11) NULL DEFAULT 0 COMMENT '图标',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接名称',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接地址',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of news_link
-- ----------------------------

-- ----------------------------
-- Table structure for news_mb_diy
-- ----------------------------
DROP TABLE IF EXISTS `news_mb_diy`;
CREATE TABLE `news_mb_diy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面名称',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面类型：lists/pros/cover...',
  `json` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  `delete_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news_mb_diy
-- ----------------------------
INSERT INTO `news_mb_diy` VALUES (14, NULL, '手机首页', 'home', '[{\"name\":\"hero\",\"child\":\"a\",\"withid\":3,\"json\":[],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"焦点\"},{\"name\":\"grid\",\"child\":\"a\",\"withid\":0,\"json\":[],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"宫格\"},{\"name\":\"title\",\"child\":\"a\",\"withid\":0,\"json\":[\"产品展示\"],\"radios\":[],\"img\":\"\",\"jumpid\":20,\"title\":\"标题\"},{\"name\":\"pros\",\"child\":\"d\",\"withid\":20,\"json\":[],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"产品\"},{\"name\":\"title\",\"child\":\"a\",\"withid\":0,\"json\":[\"人员展示\"],\"radios\":[],\"img\":\"\",\"jumpid\":21,\"title\":\"标题\"},{\"name\":\"cards\",\"child\":\"a\",\"withid\":21,\"json\":[],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"图集\"},{\"name\":\"title\",\"child\":\"b\",\"withid\":0,\"json\":[\"企业动态\"],\"radios\":[],\"img\":\"\",\"jumpid\":19,\"title\":\"标题\"},{\"name\":\"lists\",\"child\":\"a\",\"withid\":19,\"json\":[],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"列表\"}]', 1654533874, 1654869082, NULL);
INSERT INTO `news_mb_diy` VALUES (15, NULL, '手机产品', 'pros', '[{\"name\":\"pros\",\"child\":\"b\",\"withid\":0,\"json\":[],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"产品\"}]', 1654533883, 1654831276, NULL);
INSERT INTO `news_mb_diy` VALUES (16, NULL, '手机图集', 'cards', '[{\"name\":\"cards\",\"child\":\"a\",\"withid\":0,\"json\":[],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"图集\"}]', 1654533891, 1654840521, NULL);
INSERT INTO `news_mb_diy` VALUES (17, NULL, '手机文章列表', 'lists', '[{\"name\":\"lists\",\"child\":\"a\",\"withid\":0,\"json\":[],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"列表\"}]', 1654533901, 1654831813, NULL);
INSERT INTO `news_mb_diy` VALUES (18, NULL, '通用封面', 'cover', '[{\"name\":\"content\",\"child\":\"a\",\"withid\":0,\"json\":[],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"原文本\"}]', 1654533908, 1654682176, NULL);
INSERT INTO `news_mb_diy` VALUES (19, NULL, '联系我们', 'cover', '[{\"name\":\"us\",\"child\":\"a\",\"withid\":0,\"json\":[],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"联系\"},{\"name\":\"content\",\"child\":\"a\",\"withid\":0,\"json\":[],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"原文本\"}]', 1654684818, 1654702377, NULL);

-- ----------------------------
-- Table structure for news_mb_navs
-- ----------------------------
DROP TABLE IF EXISTS `news_mb_navs`;
CREATE TABLE `news_mb_navs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icon` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jump_type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jump_id` int(11) NULL DEFAULT NULL,
  `state` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news_mb_navs
-- ----------------------------
INSERT INTO `news_mb_navs` VALUES (1, 0, '首页', 'house', 'home', 0, 0);
INSERT INTO `news_mb_navs` VALUES (2, 0, '企业环境', 'menu', 'cards', 23, 0);
INSERT INTO `news_mb_navs` VALUES (3, 0, '最新动态', 'DocumentCopy', 'lists', 19, 0);
INSERT INTO `news_mb_navs` VALUES (4, 0, '关于我们', 'Box', 'cover', 22, 1);

-- ----------------------------
-- Table structure for news_pc_diy
-- ----------------------------
DROP TABLE IF EXISTS `news_pc_diy`;
CREATE TABLE `news_pc_diy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面名称',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面类型：lists/pros/cover...',
  `json` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  `delete_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news_pc_diy
-- ----------------------------
INSERT INTO `news_pc_diy` VALUES (11, NULL, '首页模板', 'home', '[{\"name\":\"nav\",\"child\":\"a\",\"withid\":0,\"json\":[],\"radios\":[\"click\",\"right\"],\"img\":\"\",\"jumpid\":0,\"title\":\"导航\"},{\"name\":\"hero\",\"child\":\"a\",\"withid\":1,\"json\":[],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"焦点\"},{\"name\":\"pros\",\"child\":\"a\",\"withid\":20,\"json\":[],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"产品\"},{\"name\":\"count\",\"child\":\"a\",\"withid\":0,\"json\":[\"248\",\"3569\",\"16\",\"产品种类\",\"日销量\",\"销售渠道\"],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"数据\"},{\"name\":\"cards\",\"child\":\"a\",\"withid\":21,\"json\":[],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"图集\"},{\"name\":\"speech\",\"child\":\"d\",\"withid\":0,\"json\":[\"多平台网站搭建\",\"多种类型组件拖拽搭建，简单易用\",\"基于Thinkphp + vue3 + TS开发的开源建站系统\"],\"radios\":[],\"img\":\"\\/uploads\\/imgs\\/1\\/629e2f66dc161.jpg\",\"jumpid\":0,\"title\":\"感言\"},{\"name\":\"slogan\",\"child\":\"c\",\"withid\":0,\"json\":[\"轻松搞定，简单易用\",\"详情\"],\"radios\":[],\"img\":\"\",\"jumpid\":17,\"title\":\"口号\"},{\"name\":\"lists\",\"child\":\"c\",\"withid\":19,\"json\":[],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"列表\"},{\"name\":\"footer\",\"child\":\"b\",\"withid\":0,\"json\":[],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"页脚\"}]', 1654533691, 1654706746, NULL);
INSERT INTO `news_pc_diy` VALUES (12, NULL, '文章列表模板', 'lists', '[{\"name\":\"hero\",\"child\":\"c\",\"withid\":2,\"json\":[],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"焦点\"},{\"name\":\"lists\",\"child\":\"e\",\"withid\":0,\"json\":[],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"列表\"}]', 1654533704, 1654704840, NULL);
INSERT INTO `news_pc_diy` VALUES (13, NULL, '产品模板', 'pros', '[{\"name\":\"hero\",\"child\":\"c\",\"withid\":2,\"json\":[],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"焦点\"},{\"name\":\"pros\",\"child\":\"b\",\"withid\":0,\"json\":[],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"产品\"}]', 1654533712, 1654589271, NULL);
INSERT INTO `news_pc_diy` VALUES (14, NULL, '图集模板', 'cards', '[{\"name\":\"hero\",\"child\":\"c\",\"withid\":2,\"json\":[],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"焦点\"},{\"name\":\"cards\",\"child\":\"b\",\"withid\":0,\"json\":[],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"图集\"}]', 1654533719, 1654589679, NULL);
INSERT INTO `news_pc_diy` VALUES (15, NULL, '通用封面模板', 'cover', '[{\"name\":\"hero\",\"child\":\"c\",\"withid\":4,\"json\":[],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"焦点\"},{\"name\":\"content\",\"child\":\"a\",\"withid\":0,\"json\":[],\"radios\":[],\"img\":\"\",\"jumpid\":0,\"title\":\"原文本\"}]', 1654533731, 1654588703, NULL);

-- ----------------------------
-- Table structure for news_pros
-- ----------------------------
DROP TABLE IF EXISTS `news_pros`;
CREATE TABLE `news_pros`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `before_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `sku` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格',
  `desc` varchar(140) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '摘要',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '正文',
  `img_id` int(11) NOT NULL COMMENT '图片ID',
  `img_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `aid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布者用户名 ',
  `category_id` int(11) NOT NULL COMMENT '分类ID',
  `sort` int(11) NOT NULL COMMENT '排序',
  `label` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签',
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-显示、1-隐藏',
  `is_hot` int(11) NOT NULL DEFAULT 0 COMMENT '是否热门',
  `is_top` int(11) NOT NULL COMMENT '是否推荐',
  `is_vip` int(11) NULL DEFAULT 0 COMMENT '是否VIP',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '发布时间',
  `update_time` int(11) NULL DEFAULT NULL,
  `delete_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 AVG_ROW_LENGTH = 6553 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS文章表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of news_pros
-- ----------------------------
INSERT INTO `news_pros` VALUES (6, 0, '衣服-T恤', 36.00, 52.00, NULL, '衣服T恤的摘要', '<p><span style=\"color: rgb(96, 98, 102); background-color: rgb(255, 255, 255); font-size: 14px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;\">衣服T恤的详情内容</span></p>', 37, '37', '1', 20, 0, '', 0, 0, 1, 0, 1654535367, 1654830825, NULL);
INSERT INTO `news_pros` VALUES (7, 0, '白色帽子', 59.00, 87.00, NULL, '白色帽子-卡通', '<p><br></p>', 38, '38,42,41,37', '1', 20, 0, '', 0, 0, 1, 0, 1654587566, 1654587775, NULL);
INSERT INTO `news_pros` VALUES (8, 0, '记事本', 5.00, 7.00, NULL, '产品摘要', '<p>记事本规格3种：蓝、红、绿</p>', 36, '36', '1', 20, 0, '', 0, 0, 1, 0, 1654588176, 1654852688, NULL);

-- ----------------------------
-- Table structure for news_resource
-- ----------------------------
DROP TABLE IF EXISTS `news_resource`;
CREATE TABLE `news_resource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'img,video,file',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news_resource
-- ----------------------------

-- ----------------------------
-- Table structure for news_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `news_sys_config`;
CREATE TABLE `news_sys_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置项',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置值json',
  `desc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `type` int(11) NOT NULL COMMENT '1基础配置2网站信息3微信相关',
  `is_use` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否启用 1启用 0不启用',
  `switch` int(11) NOT NULL DEFAULT 0 COMMENT '0输入框1双选2三选3？4上传图',
  `update_time` int(11) NOT NULL,
  `other` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 AVG_ROW_LENGTH = 963 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '第三方配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of news_sys_config
-- ----------------------------
INSERT INTO `news_sys_config` VALUES (1, 0, 'web_url', 'http://qz.ruhuashop.com/', '网址', 1, 1, 0, 1567744893, NULL);
INSERT INTO `news_sys_config` VALUES (5, 0, 'gzh_appid', '', '公众号appid', 3, 1, 0, 1567744893, NULL);
INSERT INTO `news_sys_config` VALUES (6, 0, 'gzh_secret', '', '公众号密钥', 3, 1, 0, 1567744893, NULL);
INSERT INTO `news_sys_config` VALUES (7, 0, 'wx_token_expire', '0', 'token有效期', 1, 1, 0, 1567744893, NULL);
INSERT INTO `news_sys_config` VALUES (8, 0, 'xcx_appid', '', '小程序appid', 3, 1, 0, 0, NULL);
INSERT INTO `news_sys_config` VALUES (9, 0, 'xcx_secret', '', '小程序秘钥', 3, 1, 0, 0, NULL);
INSERT INTO `news_sys_config` VALUES (11, 0, 'site_name', '站点名称', '站点名称', 1, 1, 0, 1567744893, NULL);
INSERT INTO `news_sys_config` VALUES (13, 0, 'home_cpy', '公司名称', '公司名称', 2, 1, 0, 1567744893, NULL);
INSERT INTO `news_sys_config` VALUES (14, 0, 'seo_title', '首页标题', '首页标题', 1, 1, 0, 1567744893, NULL);
INSERT INTO `news_sys_config` VALUES (15, 0, 'cpy_address', '公司地址：贵州省某某市某某街道', '公司地址', 2, 1, 0, 1567744893, NULL);
INSERT INTO `news_sys_config` VALUES (16, 0, 'seo_desc', 'seo desc', '首页描述', 1, 1, 0, 1567744893, NULL);
INSERT INTO `news_sys_config` VALUES (21, 0, 'accessKeyId', '0', 'OSS-KeyId', 4, 1, 0, 0, NULL);
INSERT INTO `news_sys_config` VALUES (22, 0, 'accessKeySecret', '0', 'OSS-KeySecret', 4, 1, 0, 0, NULL);
INSERT INTO `news_sys_config` VALUES (23, 0, 'bucket', '0', 'bucket名称', 4, 1, 0, 0, NULL);
INSERT INTO `news_sys_config` VALUES (24, 0, 'endpoint', '0', 'OSS访问域名', 4, 1, 0, 0, NULL);
INSERT INTO `news_sys_config` VALUES (27, 0, 'watermark_text', '0', '水印文字', 4, 1, 0, 0, NULL);
INSERT INTO `news_sys_config` VALUES (28, 0, 'watermark', '0', '水印开关', 4, 1, 1, 0, NULL);
INSERT INTO `news_sys_config` VALUES (29, 0, 'longitude', '3', '企业经度', 2, 1, 0, 0, NULL);
INSERT INTO `news_sys_config` VALUES (30, 0, 'latitude', '0', '企业纬度', 2, 1, 0, 0, NULL);
INSERT INTO `news_sys_config` VALUES (31, 0, 'beian', 'ICP备案号', '企业备案号', 2, 1, 0, 0, NULL);
INSERT INTO `news_sys_config` VALUES (32, 0, 'email', '邮箱：wyc0859@qq.com', '邮箱', 2, 1, 0, 0, NULL);
INSERT INTO `news_sys_config` VALUES (33, 0, 'tel', 'QQ群：728615087', '联系电话', 2, 1, 0, 1567744893, NULL);
INSERT INTO `news_sys_config` VALUES (37, 0, 'yzm_tmp_id', '', '验证码模板id', 4, 1, 0, 0, NULL);
INSERT INTO `news_sys_config` VALUES (38, 0, 'yzm_sign', '', '短信签名', 4, 1, 0, 0, NULL);
INSERT INTO `news_sys_config` VALUES (39, 0, 'yzm_keyid', '', '阿里云短信keyid', 4, 1, 0, 0, NULL);
INSERT INTO `news_sys_config` VALUES (40, 0, 'yzm_secret', '', '阿里云短信秘钥', 4, 1, 0, 0, NULL);
INSERT INTO `news_sys_config` VALUES (42, 0, 'pay_num', '', '商户id', 3, 1, 0, 1567744893, NULL);
INSERT INTO `news_sys_config` VALUES (43, 0, 'pay_key', '', '商户key', 3, 1, 0, 1567744893, NULL);
INSERT INTO `news_sys_config` VALUES (92, 0, 'servers', '', '客服开关', 1, 1, 1, 1, '0');
INSERT INTO `news_sys_config` VALUES (93, 0, 'login_type', '0', '登录方式', 1, 1, 2, 1, '手机号,微信');
INSERT INTO `news_sys_config` VALUES (94, 0, 'logo', 'uploads/imgs/0/629c4001d652b.png', 'Logo图标', 2, 1, 4, 0, NULL);
INSERT INTO `news_sys_config` VALUES (95, 0, 'seo_keys', 'seo_keys', 'SEO关键字', 1, 1, 0, 0, '');

-- ----------------------------
-- Table structure for news_user
-- ----------------------------
DROP TABLE IF EXISTS `news_user`;
CREATE TABLE `news_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `openid_gzh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `session_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `unionid` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nickname` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `headpic` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_disable` int(1) NOT NULL DEFAULT 1 COMMENT '1禁用0启用',
  `code` int(11) NULL DEFAULT 0 COMMENT '验证码',
  `code_time` int(11) NOT NULL COMMENT '验证码保存时间',
  `vip_status` int(1) NOT NULL DEFAULT 0 COMMENT '是否是会员(0非会员，1会员，2会员已过期)',
  `vip_time` int(11) NOT NULL COMMENT '会员到期时间',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '注册时间',
  `update_time` int(11) NULL DEFAULT NULL,
  `delete_time` int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of news_user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
