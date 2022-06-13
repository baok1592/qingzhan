SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `rh_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(40) DEFAULT NULL COMMENT '用户名',
  `password` varchar(60) DEFAULT NULL,
  `group_id` tinyint(4) NOT NULL DEFAULT '1' COMMENT '管理组ID',
  `ip` varchar(30) DEFAULT NULL,
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `ucid` int(1) DEFAULT '3' COMMENT 'ucid',
  `login_time` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表' ROW_FORMAT=COMPACT;

CREATE TABLE `rh_article` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文章编号',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0活动公告，1独立文章，3公告',
  `title` varchar(50) DEFAULT NULL COMMENT '文章标题',
  `summary` varchar(140) DEFAULT '' COMMENT '文章摘要',
  `content` text COMMENT '文章正文',
  `image` varchar(255) DEFAULT '' COMMENT '文章标题图片',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示 1 显示 0 不显示',
  `author` varchar(50) DEFAULT NULL COMMENT '发布者用户名 ',
  `create_time` int(11) DEFAULT '0' COMMENT '文章发布时间',
  `ucid` int(1) DEFAULT NULL COMMENT 'ucid',
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=6553 DEFAULT CHARSET=utf8 COMMENT='CMS文章表' ROW_FORMAT=COMPACT;

CREATE TABLE `rh_banner` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT 'Banner名称，通常作为标识',
  `description` varchar(255) DEFAULT NULL COMMENT 'Banner描述',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `ucid` int(1) DEFAULT NULL COMMENT 'ucid',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '1首页广告位2点餐广告位'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='banner管理表' ROW_FORMAT=DYNAMIC;

INSERT INTO `rh_banner` (`id`, `name`, `description`, `delete_time`, `update_time`, `ucid`, `type`) VALUES
(1, '首页广告位', '首页轮播图', 0, 0, 3, 1),
(2, '点餐页广告', '点餐页广告', 0, 0, 3, 2);

CREATE TABLE `rh_banner_item` (
  `id` int(11) NOT NULL,
  `img_id` int(11) DEFAULT NULL COMMENT '外键，关联image表',
  `key_word` varchar(100) DEFAULT NULL COMMENT '执行关键字，根据不同的type含义不同',
  `type` varchar(255) NOT NULL DEFAULT '0' COMMENT '跳转类型',
  `jump_id` int(11) DEFAULT '0',
  `delete_time` int(11) DEFAULT NULL,
  `banner_id` int(11) DEFAULT NULL COMMENT '外键，关联banner表',
  `is_visible` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示  1 显示 0 不显示',
  `sort` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `ucid` int(1) DEFAULT NULL COMMENT 'ucid',
  `create_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='banner子项表' ROW_FORMAT=DYNAMIC;

CREATE TABLE `rh_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) DEFAULT NULL COMMENT '名称',
  `short_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品分类简称 ',
  `pid` int(11) NOT NULL DEFAULT '0',
  `level` tinyint(4) NOT NULL DEFAULT '0',
  `is_visible` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示  1 显示 0 不显示',
  `sort` int(11) DEFAULT NULL,
  `category_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '商品分类图片',
  `ucid` int(1) DEFAULT NULL COMMENT 'ucid'
) ENGINE=InnoDB AVG_ROW_LENGTH=244 DEFAULT CHARSET=utf8 COMMENT='商品分类表' ROW_FORMAT=DYNAMIC;

CREATE TABLE `rh_coupon` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '3' COMMENT '类型1:店铺优惠券',
  `name` varchar(50) DEFAULT NULL COMMENT '优惠券名称',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态1:使用1次，2使用无数次',
  `is_show` int(11) NOT NULL DEFAULT '0' COMMENT 'vip特权券是否能领取,0不可领取,1能领取,2撤回申请中',
  `stock` int(11) DEFAULT NULL COMMENT '库存null为无限张',
  `stock_type` int(11) NOT NULL DEFAULT '0' COMMENT '库存类型(0有限张数1无限张)',
  `full` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '满多少，0为无门槛',
  `reduce` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '减多少',
  `start_time` int(11) DEFAULT NULL COMMENT '开始时间',
  `end_time` int(11) DEFAULT NULL COMMENT '结束时间',
  `day` int(11) DEFAULT NULL COMMENT '使用时间',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  `ucid` int(1) DEFAULT NULL COMMENT 'ucid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券表' ROW_FORMAT=DYNAMIC;

CREATE TABLE `rh_favorites` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '记录ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `fav_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品ID',
  `img_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品收藏时价格',
  `create_time` int(11) DEFAULT '0' COMMENT '收藏时间',
  `ucid` int(1) DEFAULT NULL COMMENT 'ucid'
) ENGINE=InnoDB AVG_ROW_LENGTH=8192 DEFAULT CHARSET=utf8 COMMENT='收藏表' ROW_FORMAT=DYNAMIC;

CREATE TABLE `rh_feie` (
    `id` int(11) NOT NULL,
    `feie_user` varchar(40) NOT NULL DEFAULT '' COMMENT '飞鹅打印机账号',
    `feie_ukey` varchar(40) NOT NULL DEFAULT '' COMMENT '飞鹅打印机ukey',
    `feie_sn` varchar(40) NOT NULL DEFAULT '' COMMENT '飞鹅打印机Sn',
    `feie_name` varchar(40) NOT NULL DEFAULT '' COMMENT '打印名称',
    `feie_key` varchar(40) NOT NULL DEFAULT '' COMMENT '飞鹅打印机key',
    `is_printer` int(2) NOT NULL COMMENT '打印机类型(0小票机1标签机）',
    `feie_formwork_id` int(11) NOT NULL DEFAULT '0' COMMENT '飞鹅打印机模板',
    `times` int(11) NOT NULL DEFAULT '1' COMMENT '打印次数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='飞鹅打印机配置信息';

CREATE TABLE `rh_feie_formwork` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(40) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '模板名称',
    `title` text CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '标题',
    `json` varchar(255) DEFAULT NULL COMMENT '模板',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='飞鹅打印机模板';

CREATE TABLE `rh_fx_goods` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `price` float NOT NULL DEFAULT '0' COMMENT '价格',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分销商品表';

CREATE TABLE `rh_fx_record` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '分销提成',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分销记录表';

CREATE TABLE `rh_goods` (
  `goods_id` int(10) UNSIGNED NOT NULL COMMENT '商品id(SKU)',
  `bannerimgs` text COMMENT '广告图片',
  `goods_name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品名称',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品分类id',
  `market_price` decimal(10,2) DEFAULT NULL COMMENT '市场价',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '价格',
  `vip_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'vip价格',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '销售数量',
  `collects` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `star` tinyint(3) UNSIGNED NOT NULL DEFAULT '5' COMMENT '好评星级',
  `evaluates` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '评价数',
  `img_id` text DEFAULT NULL COMMENT '商品主图',
  `video_id` int(11) NOT NULL DEFAULT '0' COMMENT '视频Id',
  `keywords` varchar(255) DEFAULT '' COMMENT '商品关键词',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '商品简介，促销语',
  `content` text NOT NULL COMMENT '商品详情',
  `detailimgs` text COMMENT '图片详情',
  `is_hot` int(1) NOT NULL DEFAULT '0' COMMENT '是否热销商品',
  `is_recommend` int(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_new` int(1) NOT NULL DEFAULT '0' COMMENT '是否新品',
  `state` tinyint(3) NOT NULL DEFAULT '1' COMMENT '商品状态 0下架，1正常，10违规（禁售）',
  `create_time` int(11) DEFAULT '0' COMMENT '商品添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '商品编辑时间',
  `delete_time` int(11) DEFAULT NULL,
  `ucid` int(1) DEFAULT NULL COMMENT 'ucid',
  `fx_money` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB AVG_ROW_LENGTH=16554 DEFAULT CHARSET=utf8 COMMENT='商品表' ROW_FORMAT=COMPACT;

CREATE TABLE `rh_goods_sku` (
  `sku_id` int(11) NOT NULL COMMENT '表序号',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `ucid` int(11) NOT NULL DEFAULT '0' COMMENT 'ucid',
  `json` text NOT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=481 DEFAULT CHARSET=utf8 COMMENT='商品skui规格价格库存信息表' ROW_FORMAT=COMPACT;

CREATE TABLE `rh_group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rule` text DEFAULT NULL COMMENT '规则数组',
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `ucid` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `rh_group` (`id`, `name`, `rule`, `update_time`, `create_time`, `ucid`) VALUES
(1, '超级管理员', '[1,2,3,4,5,6,7,8,9,10,11,12,13]', 0, 0, 3);

CREATE TABLE `rh_group_rule` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ucid` int(1) DEFAULT NULL,
  `route` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `rh_group_rule` (`id`, `name`, `title`, `ucid`, `route`) VALUES
(1, 'shop', '商品管理', 3, '/mcms/project/add_product,/mcms/project/edit_product,/mcms/project/del_product,/mcms/project/set_good,/mcms/project/set_sort,/mcms/project/set_good,/product/admin/add_product,/product/admin/edit_product,/product/admin/del_product,/product/admin/set_sort,/product/admin/set_good'),
(2, 'category', '商品分类', 3, '/mcms/category/add_category,/mcms/category/edit_category,/mcms/category/del_category,/mcms/category/set_sort,/category/admin/add_category,/category/admin/edit_category,/category/admin/del_category,/category/admin/set_sort'),
(3, 'zhgl', '桌号管理', 3, '/mcms/zhgl/add_zz,/mcms/zhgl/del_zz,/mcms/zhgl/edit_zz,/mcms/zhgl/set_state,/mcms/zhgl/add_goods,/mcms/zhgl/set_state,/mcms/id_clear_zh,/index/admin/add_zz,/index/admin/del_zz,/index/admin/edit_zz,/index/admin/set_state,/index/admin/add_goods,/index/admin/set_state\n'),
(4, 'order', '订单管理', 3, '/mcms/get_table,/mcms/get_order,/mcms/get_order_one,/mcms/order_stats,/mcms/edit_courier,/mcms/edit_remark,/mcms/edit_price,/mcms/edit_pay,/mcms/get_index_data,/mcms/upload/img,/order/admin/code_order,/order/admin/get_order_log,/order/admin/del_order,/order/admin/edit_courier,/order/admin/edit_remark,/order/admin/edit_price,/order/admin/edit_pay'),
(5, 'tui', '退款管理', 3, '/mcms/tui/tui_money,/mcms/tui/tui_bohui,/order/admin/tui_money,/order/admin/tui_bohui'),
(6, 'user', '用户管理', 3, '/mcms/user/del_user,/mcms/user/edit_user,/user/admin/del_user,/user/admin/edit_user'),
(7, 'user_level', '用户等级', 3, '/mcms/level/add_level,/mcms/level/del_level,/mcms/level/edit_level,/level/admin/add_level,/level/admin/del_level,/level/admin/edit_level\n'),
(8, 'coupon', '优惠卷', 3, '/mcms/coupon/add_coupon,/mcms/coupon/del_coupon,/coupon/admin/add_coupon,/coupon/admin/del_coupon\n'),
(9, 'reduction', '满减', 3, '/mcms/reduction/add_reduction,/mcms/reduction/edit_reduction,mcms/reduction/del_reduction,/reduction/admin/add_reduction,/reduction/admin/edit_reduction\n'),
(10, 'banner', '广告', 3, '/mcms/banner/banner_all_item,/mcms/banner/add_banner,/mcms/banner/edit_banner,/mcms/banner/del_banner,/mcms/banner/set_sort,/banner/admin/add_banner,/banner/admin/edit_banner,/banner/admin/del_banner,/banner/admin/set_sort\n'),
(11, 'address', '地址管理', 3, '/mcms/address/add_region,/mcms/address/edit_region,/mcms/address/del_region,/cms/admin/add_region,/cms/admin/edit_region,/cms/admin/del_region\n'),
(12, 'search', '热搜管理', 3, '/mcms/search/add_record,/mcms/search/del_record,/search/admin/add_record,/search/admin/del_record\n\n'),
(13, 'set', '设置', 3, '/cms/edit_config,/cms/admin/get_all_admin,/cms/admin/del_admin,/cms/admin/add_admin,/cms/get_config');

CREATE TABLE `rh_image` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 来自本地，2 来自公网',
  `use_name` varchar(80) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT '图片分类',
  `is_visible` int(11) NOT NULL DEFAULT '1' COMMENT '是否能显示1能0不能',
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `ucid` int(1) DEFAULT NULL COMMENT 'ucid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='图片总表' ROW_FORMAT=COMPACT;

CREATE TABLE `rh_image_category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `is_visible` int(11) DEFAULT NULL,
  `ucid` int(1) DEFAULT NULL COMMENT 'ucid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `rh_item` (
  `id` int(11) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `describe` varchar(255) DEFAULT NULL,
  `is_hidden` int(11) NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `ucid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='样式表';

INSERT INTO `rh_item` (`id`, `key`, `value`, `content`, `describe`, `is_hidden`, `ucid`) VALUES
(1, 'home_ps_icon', '/uploads/images/ts.png', '配送', '', 0, 0),
(2, 'home_jc_icon', '/uploads/images/wm.png', '店内就餐', '', 0, 0),
(3, 'tj_icon', '/uploads/images/tj.png', '推荐', '', 0, 0),
(4, 'xp_icon', '/uploads/images/xp.jpg', '新品', '', 0, 0),
(5, 'rx_icon', '/uploads/images/rx.jpg', '热销图标', '', 0, 0),
(6, 'mj_icon', '/uploads/images/hd.jpg', '满减图标', '', 0, 0);

CREATE TABLE `rh_money_log` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  `content` varchar(800) DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `wx_refund` varchar(50) DEFAULT NULL COMMENT '微信退款id',
  `create_time` int(11) DEFAULT NULL,
  `ucid` int(1) DEFAULT NULL COMMENT 'ucid',
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单日志表' ROW_FORMAT=DYNAMIC;

CREATE TABLE `rh_nav` (
  `id` int(11) NOT NULL,
  `nav_name` varchar(50) DEFAULT NULL COMMENT '名称',
  `img_id` varchar(255) DEFAULT NULL COMMENT '图片ID',
  `url` varchar(255) DEFAULT NULL COMMENT '转跳路径',
  `url_name` varchar(20) DEFAULT NULL COMMENT '转跳名字',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '转跳分类ID',
  `is_visible` int(11) DEFAULT NULL COMMENT '	是否显示 1 显示 0 不显示	',
  `sort` int(11) DEFAULT NULL,
  `other` varchar(255) DEFAULT NULL COMMENT '其他',
  `ucid` int(1) DEFAULT NULL COMMENT 'ucid',
  `create_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='导航栏' ROW_FORMAT=DYNAMIC;

CREATE TABLE `rh_order` (
  `order_id` int(11) NOT NULL,
  `order_num` varchar(40) DEFAULT NULL COMMENT '订单编号',
  `user_id` int(11) DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '0未完成 1已完成 2已评价 -1退款中 -2已退款-3关闭订单',
  `shipment_state` int(11) NOT NULL DEFAULT '0' COMMENT '运输（验证）状态  0待配送 1已配送 2已收货',
  `payment_state` int(11) NOT NULL DEFAULT '0' COMMENT '支付状态 0 1',
  `rate_id` int(11) DEFAULT '0',
  `coupon_id` int(11) DEFAULT '0' COMMENT '优惠券ID',
  `order_from` varchar(4) DEFAULT NULL COMMENT '来源小程序或wap',
  `payment_type` varchar(60) DEFAULT NULL COMMENT '支付来源',
  `goods_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品总价',
  `reduction_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '满减价格',
  `coupon_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠券价格',
  `edit_money` decimal(10,2) DEFAULT '0.00',
  `order_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总价',
  `user_ip` varchar(40) DEFAULT NULL,
  `goods_picture` varchar(400) DEFAULT NULL,
  `message` varchar(300) DEFAULT NULL COMMENT '备注',
  `receiver_name` varchar(60) DEFAULT NULL COMMENT '收货人',
  `receiver_mobile` varchar(60) DEFAULT NULL COMMENT '收货人手机',
  `receiver_city` varchar(60) DEFAULT NULL,
  `receiver_address` varchar(200) DEFAULT NULL,
  `courier_num` varchar(60) DEFAULT NULL,
  `courier` varchar(255) DEFAULT NULL,
  `remark_one` varchar(255) DEFAULT NULL,
  `remark_two` varchar(255) DEFAULT NULL,
  `drive_type` varchar(255) DEFAULT NULL COMMENT '配送方式',
  `prepay_id` varchar(255) DEFAULT NULL,
  `pay_time` int(11) DEFAULT NULL COMMENT '支付时间',
  `points` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `other` text COMMENT '其他要求',
  `mobile` varchar(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `count` int(11) NOT NULL DEFAULT '0',
  `pay_cate` varchar(255) NOT NULL DEFAULT '3' COMMENT '支付方式1微信支付2余额支付3暂不支付',
  `ucid` int(1) DEFAULT NULL,
  `table_num` int(11) DEFAULT NULL COMMENT '几号桌',
  `yzcode` varchar(255) DEFAULT NULL,
  `invite_code` varchar(10) DEFAULT NULL,
  `fx_money` float NOT NULL DEFAULT '0',
  `vmoney` decimal(10,2) DEFAULT 0.00 COMMENT '会员折扣价格',
  `ph_create_order` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0其他方式下单1手机下单'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表' ROW_FORMAT=DYNAMIC;

CREATE TABLE `rh_order_goods` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_name` varchar(300) DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL,
  `sku_name` varchar(300) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cost_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `number` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '订单状态0未完成 1已完成 2已评价 -1退款中 -2已退款-3关闭订单	',
  `pic` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `remark` varchar(400) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `ucid` int(1) DEFAULT NULL,
  `notes` varchar(40) DEFAULT NULL COMMENT '注释'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单商品详情表' ROW_FORMAT=COMPACT;

CREATE TABLE `rh_order_log` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  `content` varchar(800) DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `wx_refund` varchar(50) DEFAULT NULL COMMENT '微信退款id',
  `create_time` int(11) DEFAULT NULL,
  `ucid` int(1) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单日志表' ROW_FORMAT=DYNAMIC;

CREATE TABLE `rh_play_award` (
  `id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL COMMENT '类型ID',
  `name` varchar(50) DEFAULT NULL,
  `lv` int(11) NOT NULL DEFAULT '0' COMMENT '概率',
  `award` varchar(50) DEFAULT NULL COMMENT '奖励内容',
  `award_type` int(11) NOT NULL DEFAULT '0' COMMENT '奖品类型(0为积分1为商品)',
  `stock` int(11) NOT NULL DEFAULT '0',
  `img_id` int(11) NOT NULL DEFAULT '0',
  `ucid` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='玩法奖励表' ROW_FORMAT=COMPACT;

CREATE TABLE `rh_points_record` (
  `id` int(11) NOT NULL,
  `uid` int(10) UNSIGNED DEFAULT NULL,
  `credittype` varchar(10) NOT NULL DEFAULT '',
  `num` decimal(10,2) NOT NULL DEFAULT '0.00',
  `operator` int(10) UNSIGNED DEFAULT '0',
  `module` varchar(30) DEFAULT NULL,
  `clerk_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `clerk_type` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `remark` varchar(200) NOT NULL DEFAULT '',
  `real_uniacid` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) DEFAULT NULL,
  `ucid` int(1) DEFAULT NULL,
  `points` int(11) NOT NULL DEFAULT 0 COMMENT '积分',
  `order_num` varchar(40) DEFAULT '' COMMENT '订单编号',
  `close_order` int(2) DEFAULT 0 COMMENT '是否关闭订单（0没有关闭1关闭）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分记录表' ROW_FORMAT=COMPACT;

CREATE TABLE `rh_rate` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `rate` int(11) NOT NULL DEFAULT '5',
  `content` varchar(800) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `imgs` text DEFAULT NULL COMMENT '图片集',
  `headpic` varchar(255) DEFAULT NULL COMMENT '头像',
  `nickname` varchar(20) NOT NULL DEFAULT '0',
  `reply_content` varchar(255) DEFAULT NULL COMMENT '回复内容',
  `reply_time` int(11) NOT NULL DEFAULT '0' COMMENT '回复时间',
  `aid` int(11) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `create_time` int(11) DEFAULT NULL,
  `video` varchar(300) DEFAULT NULL COMMENT '视频地址',
  `update_time` int(11) DEFAULT NULL,
  `ucid` int(1) DEFAULT NULL COMMENT 'ucid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评价表' ROW_FORMAT=COMPACT;

CREATE TABLE `rh_reduction` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `statu` int(11) NOT NULL DEFAULT '1' COMMENT '是否开启 1开启，2关闭',
  `full` float(11,2) DEFAULT NULL COMMENT '满多少',
  `reduce` float(11,2) DEFAULT NULL COMMENT '减多少',
  `start_time` int(11) DEFAULT NULL COMMENT '开始时间',
  `end_time` int(11) DEFAULT NULL COMMENT '结束时间',
  `create_time` int(11) DEFAULT NULL COMMENT '创建 时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  `ucid` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `rh_reduction_goods` (
  `id` int(11) NOT NULL,
  `reduction_id` int(11) DEFAULT NULL COMMENT '满减活动id',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `ucid` int(1) DEFAULT NULL COMMENT 'ucid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `rh_region` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `pid` int(11) DEFAULT NULL COMMENT '父id',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `merger_name` varchar(255) DEFAULT NULL COMMENT '全称',
  `level` tinyint(4) UNSIGNED NOT NULL DEFAULT '1' COMMENT '层级 1 2 3 ',
  `ucid` int(1) DEFAULT NULL COMMENT 'ucid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地区总表' ROW_FORMAT=DYNAMIC;

CREATE TABLE `rh_search` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '热词',
  `num` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='热搜表';

CREATE TABLE `rh_sys_backup` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `size` varchar(20) DEFAULT NULL COMMENT '大小',
  `url` varchar(255) DEFAULT NULL COMMENT '路径',
  `create_time` int(11) DEFAULT NULL,
  `ucid` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `rh_sys_config` (
  `id` int(11) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text,
  `desc` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1基础2微信3支付宝4短信5物流6商家信息',
  `switch` int(11) NOT NULL DEFAULT '0' COMMENT '0填写框1开关2单选3多选4禁填',
  `other` varchar(255) DEFAULT NULL,
  `ucid` int(1) DEFAULT NULL COMMENT 'ucid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置表' ROW_FORMAT=COMPACT;

INSERT INTO `rh_sys_config` (`id`, `key`, `value`, `desc`, `type`, `switch`, `other`, `ucid`) VALUES
(1, 'api_url', '', '支付回调网址', 2, 0, '', 3),
(3, 'gzh_appid', '', '公众号appid', 2, 0, '', 3),
(4, 'gzh_secret', '', '公众号秘钥', 2, 0, '', 3),
(5, 'wx_app_id', '', '小程序appid', 2, 0, '', 3),
(6, 'wx_app_secret', '', '小程序秘钥', 2, 0, '', 3),
(7, 'pay_num', '', '商户id', 2, 0, '', 3),
(8, 'pay_key', '', '商户key', 2, 0, '', 3),
(9, 'wx_token_expire', '7200', 'token有效期', 1, 0, '', 3),
(21, 'exchang_points', '1', '购物获得积分', 1, 1, '', 3),
(22, 'use_points', '0', '积分购物', 1, 1, '', 3),
(23, 'points_to_money', '100', 'X积分 ： 1金额', 1, 0, '金额：积分=1:100', 3),
(24, 'money_to_points', '1', '1金额 ： X积分', 1, 0, '金额：积分=1:1', 3),
(37, 'merge_mode', '1', '登录方式', 1, 2, '1微信登录2桌号登录', 3),
(45, 'drive_type', '0', '配送方式', 7, 2, '0配送1店内就餐2配送+店内', 3),
(57, 'feie_user', '', '飞鹅打印机账号', 3, 0, '', 3),
(58, 'feie_ukey', '', '飞鹅打印机ukey', 3, 0, '', 3),
(59, 'feie_sn', '', '飞鹅打印机Sn', 3, 0, '', 3),
(60, 'feie_name', '', '打印名称', 3, 0, '', 3),
(61, 'feie_key', '', '飞鹅打印机key', 3, 0, '', 3),
(62, 'is_printer', '1', '是否开启云打印', 3, 2, '', 0),
(64, 'merchant_name', '外卖', '商家的店名', 6, 0, '', 3),
(65, 'merchan_address', '北京市朝阳区某某某街道', '商家店铺地址', 6, 0, '', 3),
(67, 'merchant_brief', '附近服务最好，配送最快', '店铺简介', 6, 0, '', 3),
(68, 'merchant_phonto', '', '商家电话', 6, 0, '', 3),
(69, 'ps_timme', '8:00-20:00', '配送时间', 6, 0, '', 3),
(70, 'shipping_dees', '2', '配送费', 1, 0, '', 0),
(71, 'yzm_sign', '', '阿里云短信签名', 4, 0, '', 0),
(72, 'yzm_keyid', '', '阿里云短信KeyId', 4, 0, '', 0),
(73, 'yzm_secret', '', '阿里云短信秘钥', 4, 0, '', 0),
(74, 'yzm_tmp_id', '', '验证码模板ID', 4, 0, '', 0),
(520, 'theme_color', '#33a7ff', '主题颜色', 7, 0, '', 0),
(521, 'member', '0', '会员等级', 1, 1, '', 0),
(522, 'same_zh', '0', '开启同桌点餐', 1, 1, '', 0),
(523, 'dc_way', '0', '点餐方式', 1, 2, '0普通点餐1餐桌点餐2普通点餐和餐桌点餐', 0),
(524, 'pay_type', '1', '付款方式', 1, 2, '1先付款2先使用', 0),
(525, 'merchant_position', '', '商家坐标', 6, 0, '', 0),
(526, 'is_bell', '1', '服务铃', 1, 1, '', 0),
(527, 'store_title', '店内点餐', '店内标题', 1, 0, '', 0),
(528, 'is_cut', '0', '切换餐桌', 1, 2, '', '0允许1不允许'),
(529, 'ali_app_id', '', '支付宝appid', 2, 0, '', ''),
(530, 'rsaPrivateKey', '', '支付宝私钥', 2, 0, '', '');

CREATE TABLE `rh_tui` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `tui_num` varchar(30) NOT NULL DEFAULT '0' COMMENT '退款单号',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `order_num` varchar(40) DEFAULT NULL COMMENT '订单号',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价钱',
  `message` varchar(255) DEFAULT NULL COMMENT '信息',
  `because` varchar(255) DEFAULT NULL COMMENT '原因',
  `ip` varchar(100) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0退款中1已退款2驳回中',
  `aid` int(11) NOT NULL DEFAULT '0',
  `wx_id` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `ucid` int(11) NOT NULL DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='退货管理表' ROW_FORMAT=COMPACT;

CREATE TABLE `rh_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `unionid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `openid_gzh` varchar(70) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '公众号openid',
  `openid_zfb` varchar(70) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '支付宝openid',
  `openid_app` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `openid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小程序openid',
  `money` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `sign_time` bigint(20) DEFAULT NULL COMMENT '上次签到时间',
  `sign_day` bigint(20) DEFAULT NULL COMMENT '连续签到天数',
  `level_id` bigint(20) DEFAULT '1' COMMENT '用户等级',
  `headpic` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户真实姓名',
  `ucid` int(1) DEFAULT NULL COMMENT 'ucid',
  `delete_time` bigint(20) DEFAULT NULL,
  `create_time` int(20) DEFAULT NULL,
  `update_time` int(20) DEFAULT NULL,
  `invite_code` int(11) DEFAULT NULL COMMENT '邀请码',
  `invite_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邀请链接',
  `points_id` int(11) NOT NULL DEFAULT '0',
  `web_auth` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

CREATE TABLE `rh_user_address` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL COMMENT '收获人姓名',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(400) DEFAULT NULL,
  `detail` varchar(400) DEFAULT NULL COMMENT '详细地址',
  `user_id` int(11) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `ucid` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户地址表' ROW_FORMAT=COMPACT;

CREATE TABLE `rh_user_coupon` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `coupon_id` int(11) DEFAULT NULL COMMENT '优惠券ID',
  `full` decimal(10,2) DEFAULT NULL COMMENT '满多少',
  `reduce` decimal(10,2) DEFAULT NULL COMMENT '减多少',
  `end_time` int(11) DEFAULT NULL COMMENT '有效时间',
  `status` int(11) DEFAULT '0' COMMENT '使用状态(0未使用1已使用2已完成3已过期',
  `create_time` int(11) DEFAULT NULL COMMENT '领取时间',
  `ucid` int(1) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户优惠券表' ROW_FORMAT=COMPACT;

CREATE TABLE `rh_user_level` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `name_l` varchar(255) DEFAULT NULL COMMENT '名称',
  `discount` float(6,2) DEFAULT NULL COMMENT '折扣',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '软删除',
  `ucid` int(1) DEFAULT NULL COMMENT 'ucid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `rh_video` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 来自本地，2 来自公网',
  `use_name` varchar(80) DEFAULT NULL,
  `is_visible` int(11) NOT NULL DEFAULT '1' COMMENT '是否能显示1能0不能',
  `description` varchar(50) DEFAULT NULL COMMENT '描述字段',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `ucid` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='视频表' ROW_FORMAT=COMPACT;

CREATE TABLE `rh_zhgl` (
  `id` int(11) NOT NULL,
  `zh_num` varchar(20) DEFAULT NULL COMMENT '桌号',
  `bz` varchar(255) DEFAULT NULL COMMENT '备注',
  `ucid` int(11) NOT NULL DEFAULT '3',
  `h5_img` varchar(255) DEFAULT NULL,
  `xcx_img` varchar(255) DEFAULT NULL,
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '餐桌人数',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '结账金额',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '时间',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '0空闲1待结账2已完成',
  `bind_order` int(11) NOT NULL DEFAULT '0' COMMENT '绑定订单id',
  `service` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


ALTER TABLE `rh_admin`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_article`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_banner`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_banner_item`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_category`
  ADD PRIMARY KEY (`category_id`) USING BTREE;

ALTER TABLE `rh_coupon`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_favorites`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_feie`
    ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_feie_formwork`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `rh_fx_goods`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `rh_fx_record`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `rh_goods`
  ADD PRIMARY KEY (`goods_id`) USING BTREE,
  ADD KEY `UK_ns_goods_category_id` (`category_id`) USING BTREE;

ALTER TABLE `rh_goods_sku`
  ADD PRIMARY KEY (`sku_id`) USING BTREE,
  ADD UNIQUE KEY `goods_id` (`goods_id`) USING BTREE;

ALTER TABLE `rh_group`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_group_rule`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_image`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_image_category`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_item`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `rh_money_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_nav`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_order`
  ADD PRIMARY KEY (`order_id`) USING BTREE;

ALTER TABLE `rh_order_goods`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_order_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_play_award`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_points_record`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `uid` (`uid`) USING BTREE;

ALTER TABLE `rh_rate`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_reduction`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_reduction_goods`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_region`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `name,level` (`name`) USING BTREE;

ALTER TABLE `rh_search`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `rh_sys_backup`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_sys_config`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_tui`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_user`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_user_address`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_user_coupon`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_user_level`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_video`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `rh_zhgl`
  ADD PRIMARY KEY (`id`) USING BTREE;


ALTER TABLE `rh_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_article`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章编号';

ALTER TABLE `rh_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `rh_banner_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_favorites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '记录ID';

ALTER TABLE `rh_feie`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_feie_formwork`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_fx_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_fx_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_goods`
  MODIFY `goods_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品id(SKU)';

ALTER TABLE `rh_goods_sku`
  MODIFY `sku_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表序号';

ALTER TABLE `rh_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `rh_group_rule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

ALTER TABLE `rh_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_image_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `rh_money_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_nav`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_order_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_order_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_play_award`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_points_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_rate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_reduction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_reduction_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';

ALTER TABLE `rh_search`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_sys_backup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_sys_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=528;

ALTER TABLE `rh_tui`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_user_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_user_coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_user_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';

ALTER TABLE `rh_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `rh_zhgl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
