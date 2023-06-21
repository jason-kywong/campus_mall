/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50742
 Source Host           : localhost:3306
 Source Schema         : new_shop

 Target Server Type    : MySQL
 Target Server Version : 50742
 File Encoding         : 65001

 Date: 21/06/2023 17:05:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version`  (
  `version_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`version_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of alembic_version
-- ----------------------------
INSERT INTO `alembic_version` VALUES ('89367bd96c7f');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '女装男装');
INSERT INTO `category` VALUES ('2', '鞋靴背包');
INSERT INTO `category` VALUES ('3', '运动户外');
INSERT INTO `category` VALUES ('4', '图书报刊');
INSERT INTO `category` VALUES ('5', '手机数码');
INSERT INTO `category` VALUES ('6', '生活用品');
INSERT INTO `category` VALUES ('7', '同济文创');

-- ----------------------------
-- Table structure for category_second
-- ----------------------------
DROP TABLE IF EXISTS `category_second`;
CREATE TABLE `category_second`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `csname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  CONSTRAINT `category_second_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category_second
-- ----------------------------
INSERT INTO `category_second` VALUES ('1', '潮流女装', '1');
INSERT INTO `category_second` VALUES ('11', '男鞋', '2');
INSERT INTO `category_second` VALUES ('12', '女包', '2');
INSERT INTO `category_second` VALUES ('13', '男包', '2');
INSERT INTO `category_second` VALUES ('17', '装备', '3');
INSERT INTO `category_second` VALUES ('18', '运动器材', '3');
INSERT INTO `category_second` VALUES ('19', '健身卡', '3');
INSERT INTO `category_second` VALUES ('20', '教材', '4');
INSERT INTO `category_second` VALUES ('21', '考研资料', '4');
INSERT INTO `category_second` VALUES ('22', '习题集', '4');
INSERT INTO `category_second` VALUES ('23', '中外民著', '4');
INSERT INTO `category_second` VALUES ('24', '手机', '5');
INSERT INTO `category_second` VALUES ('25', '平板', '5');
INSERT INTO `category_second` VALUES ('26', '其他数码', '5');
INSERT INTO `category_second` VALUES ('27', '配件', '5');
INSERT INTO `category_second` VALUES ('28', '日用', '6');
INSERT INTO `category_second` VALUES ('29', '小家电', '6');
INSERT INTO `category_second` VALUES ('30', '小家具', '6');
INSERT INTO `category_second` VALUES ('33', '文房四宝', '7');
INSERT INTO `category_second` VALUES ('34', '同济文化衫', '7');
INSERT INTO `category_second` VALUES ('35', '校庆数码', '7');
INSERT INTO `category_second` VALUES ('36', '书籍邮票', '7');
INSERT INTO `category_second` VALUES ('37', '个人手作', '7');
INSERT INTO `category_second` VALUES ('4', '精选男装', '1');
INSERT INTO `category_second` VALUES ('9', '女鞋', '2');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_read` int(11) NULL DEFAULT NULL,
  `cdate` datetime(0) NULL DEFAULT NULL,
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `comment_id`(`comment_id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('7f22e89a101111ee812adc1ba1d887da', '快来买呀！呜呜呜呜呜呜哇哇哇哇喔！', 0, '2023-06-21 16:56:23', '191806a4d29811e89e82b808cfd4f089', NULL, 'ef02ecd80fe711ee8ac8dc1ba1d887da');
INSERT INTO `comment` VALUES ('8bbad826101211eead4adc1ba1d887da', '孩子很爱吃！', 0, '2023-06-21 17:03:53', 'da3dd9d2100a11ee8b93dc1ba1d887da', '7f22e89a101111ee812adc1ba1d887da', NULL);
INSERT INTO `comment` VALUES ('904aec9a101111ee9cebdc1ba1d887da', '是的！对的！中肯的！', 0, '2023-06-21 16:56:52', '191806a4d29811e89e82b808cfd4f089', '7f22e89a101111ee812adc1ba1d887da', NULL);
INSERT INTO `comment` VALUES ('978424a6101211eeb26bdc1ba1d887da', '孩子吃了十份了！', 0, '2023-06-21 17:04:13', 'da3dd9d2100a11ee8b93dc1ba1d887da', '7f22e89a101111ee812adc1ba1d887da', NULL);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total_money` float NULL DEFAULT NULL,
  `ordertime` datetime(0) NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_last_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `count` int(11) NOT NULL,
  `sub_total` float NOT NULL,
  `pid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `oid`(`oid`) USING BTREE,
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`oid`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_item
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `old_price` float NOT NULL,
  `new_price` float NOT NULL,
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_hot` int(11) NULL DEFAULT NULL,
  `is_sell` int(11) NULL DEFAULT NULL,
  `pdate` datetime(0) NULL DEFAULT NULL,
  `click_count` int(11) NULL DEFAULT NULL,
  `counts` int(11) NOT NULL,
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pDesc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `love_user` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_pass` int(11) NULL DEFAULT NULL,
  `head_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `csid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `csid`(`csid`) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`csid`) REFERENCES `category_second` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('00337a10d29b11e8802cb808cfd4f089', 'Apple iPhone XS Max 64GB 金色', 7999, 7299, 'http://qiniuyun.donghao.club/45ab3dd6c35d981b.jpg@http://qiniuyun.donghao.club/3f3e4aa3c7515658.jpg', 0, 1, '2023-06-21 11:50:21', 15, 1, '191806a4d29811e89e82b808cfd4f089', '品牌： Apple\r\n商品名称：AppleiPhone Xs Max\r\n商品编号：100001860773\r\n商品毛重：495.00g\r\n商品产地：中国\r\n系统：ios系统\r\n', '', 2, 'http://qiniuyun.donghao.club/45ab3dd6c35d981b.jpg', '24');
INSERT INTO `product` VALUES ('0989b8f6d2a111e8a452b808cfd4f089', 'Apple AirPods 蓝牙无线耳机', 1299, 1000, 'http://qiniuyun.donghao.club/dd359563dc751ca5%20%281%29.jpg@http://qiniuyun.donghao.club/70e84d1d269937ed.jpg', 0, 1, '2023-06-21 15:41:26', 166, 1, '191806a4d29811e89e82b808cfd4f089', '超24小时续航，Apple品牌配件，智慧生活，妙不可言！', '191806a4d29811e89e82b808cfd4f089_', 2, 'http://qiniuyun.donghao.club/70e84d1d269937ed.jpg', '24');
INSERT INTO `product` VALUES ('0b6daafa0fe911eea29fdc1ba1d887da', '同济抱枕', 100, 60, 'http://rvpkzi39r.hd-bkt.clouddn.com/0af3cdc20fe911eeacb8dc1ba1d887da.jpg@', 0, 1, '2023-06-21 16:22:02', 0, 1, '34a6cb6e02a311eeaf36dc1ba1d887da', '丝印工艺', NULL, 2, 'http://rvpkzi39r.hd-bkt.clouddn.com/0af3cdc20fe911eeacb8dc1ba1d887da.jpg', '37');
INSERT INTO `product` VALUES ('1a995bfa0fe811eea7e2dc1ba1d887da', '同济书签-天鹅颈', 20, 15, 'http://rvpkzi39r.hd-bkt.clouddn.com/1a55d2c80fe811ee806ddc1ba1d887da.jpg@', 2, 1, '2023-06-21 16:22:18', 0, 1, '34a6cb6e02a311eeaf36dc1ba1d887da', '异形书签，优美天鹅颈，四平面交', NULL, 2, 'http://rvpkzi39r.hd-bkt.clouddn.com/1a55d2c80fe811ee806ddc1ba1d887da.jpg', '33');
INSERT INTO `product` VALUES ('3284b00c592e11eab856acde48001122', '小米10  8GB+256GB 钛银黑', 4299, 3999, 'http://qiniuyun.donghao.club/31e90846592e11eab856acde48001122.jpg@http://qiniuyun.donghao.club/32602b9c592e11eab856acde48001122.jpg@http://qiniuyun.donghao.club/326fafe0592e11eab856acde48001122.jpg@http://qiniuyun.donghao.club/3278f686592e11eab856acde48001122.jpg@', 0, 1, '2020-05-08 23:14:03', 11, 1, '191806a4d29811e89e82b808cfd4f089', '商品名称：小米10商品编号：100011199522商品毛重：0.6kg商品产地：中国大陆游戏性能：发烧级操作系统：Android(安卓)\n上面是配置 我才买的没多久 不喜欢这个颜色 所以出售出', '191806a4d29811e89e82b808cfd4f089_', 2, 'http://qiniuyun.donghao.club/3278f686592e11eab856acde48001122.jpg', '24');
INSERT INTO `product` VALUES ('34d0b7e8d2a111e8ac05b808cfd4f089', 'Apple iPhone 11 Pro 256GB 银色', 9999, 5555, 'http://qiniuyun.donghao.club/2461a6a0c4d4b3db.jpg@http://qiniuyun.donghao.club/343e35fc42a307fd.jpg@http://qiniuyun.donghao.club/15d9c43f11b0ab52.jpg@http://qiniuyun.donghao.club/37080986778851b4.jpg', 0, 1, '2023-06-21 15:41:44', 148, 1, '191806a4d29811e89e82b808cfd4f089', '商品名称：AppleiPhone 11 Pro商品编号：100008348510商品毛重：500.00g商品产地：中国大陆CPU型号：其他运行内存：其它内存机身存储：256GB存储卡：不支持存储卡摄像头数量：后置三摄后摄主摄像素：1200万像素前摄主摄像素：1200万像素主屏幕尺寸（英寸）：5.8英寸分辨率：其它分辨率屏幕比例：其它屏幕比例屏幕前摄组合：其他电池容量（mAh）：以官网信息为准充电器：其他机身颜色：银色操作系统：iOS(Apple)', '4ebfe6b8554311ea8306acde48001122_191806a4d29811e89e82b808cfd4f089_', 2, 'http://qiniuyun.donghao.club/2461a6a0c4d4b3db.jpg', '24');
INSERT INTO `product` VALUES ('522ab7e20fe911ee8398dc1ba1d887da', '校庆充电宝', 222, 100, 'http://rvpkzi39r.hd-bkt.clouddn.com/51e950940fe911eeb8d3dc1ba1d887da.jpg@', 0, 1, '2023-06-21 16:21:47', 0, 1, '34a6cb6e02a311eeaf36dc1ba1d887da', '四平面交', NULL, 2, 'http://rvpkzi39r.hd-bkt.clouddn.com/51e950940fe911eeb8d3dc1ba1d887da.jpg', '35');
INSERT INTO `product` VALUES ('7203af0c0fe911ee8713dc1ba1d887da', '同济邮票-2007', 1000, 999, 'http://rvpkzi39r.hd-bkt.clouddn.com/7193d5620fe911ee96ffdc1ba1d887da.jpg@', 0, 1, '2023-06-21 16:21:42', 0, 1, '34a6cb6e02a311eeaf36dc1ba1d887da', '如图，上海快递包邮', NULL, 2, 'http://rvpkzi39r.hd-bkt.clouddn.com/7193d5620fe911ee96ffdc1ba1d887da.jpg', '36');
INSERT INTO `product` VALUES ('8e3466260fe811ee907edc1ba1d887da', '同济文化衫-白', 100, 88, 'http://rvpkzi39r.hd-bkt.clouddn.com/8e07dc540fe811eea1c3dc1ba1d887da.jpg@http://rvpkzi39r.hd-bkt.clouddn.com/8e1c2bb60fe811ee8486dc1ba1d887da.jpg@', 0, 1, '2023-06-21 16:22:14', 0, 1, '34a6cb6e02a311eeaf36dc1ba1d887da', '正反面如图，全棉，嘉定面交', NULL, 2, 'http://rvpkzi39r.hd-bkt.clouddn.com/8e07dc540fe811eea1c3dc1ba1d887da.jpg', '34');
INSERT INTO `product` VALUES ('9ccbc7628ea211eaaed5acde48001122', '戴森(Dyson) 新一代吹风机 Dyson Supersonic 电吹风', 2999, 1999, 'http://qiniuyun.donghao.club/98c7b7ac8ea211eaaed5acde48001122.jpg@http://qiniuyun.donghao.club/9957344a8ea211eaaed5acde48001122.jpg@http://qiniuyun.donghao.club/99f0bc8c8ea211eaaed5acde48001122.jpg@http://qiniuyun.donghao.club/9ba3e81a8ea211eaaed5acde48001122.jpg@', 0, 1, '2020-05-08 23:14:33', 62, 1, '191806a4d29811e89e82b808cfd4f089', '戴森戴森，这个品牌很喜欢，一直从国外用到国内，吹风机是双十一活动抢到的，无敌了，我是京东十几年的忠实粉丝了，一直对京东送货十分认可，送货速度最快，没有之一，而且是送货上门，这在目前快递里面是很难得的了，包装也很精致，堪称完美，打开包装，看到我喜欢的紫色，很开心，吹风机小巧精致，配置的多头很棒滴，电源线很长很软，手感好，便于收纳，说说效果吧，风力够大，可以调节，音量也可以接受，首发吹干速度很快哟，建议头发长和多的女生试试吧，真的是不错的选择，赞赞', '191806a4d29811e89e82b808cfd4f089_9c96169c8ee511ea8e36acde48001122_4ebfe6b8554311ea8306acde48001122_', 2, 'http://qiniuyun.donghao.club/98c7b7ac8ea211eaaed5acde48001122.jpg', '30');
INSERT INTO `product` VALUES ('b0fe4e328ea011ea9d5eacde48001122', '小米（MI） 滑板车成人米家电动滑板自行车可折叠', 1999, 999, 'http://qiniuyun.donghao.club/ac6c05d08ea011ea9d5eacde48001122.jpg@http://qiniuyun.donghao.club/ad0cabe88ea011ea9d5eacde48001122.jpg@http://qiniuyun.donghao.club/add7b9008ea011ea9d5eacde48001122.jpg@http://qiniuyun.donghao.club/aed6328c8ea011ea9d5eacde48001122.jpg@http://qiniuyun.donghao.club/afbb05068ea011ea9d5eacde48001122.jpg@', 0, 1, '2023-06-21 16:24:10', 59, 2, '191806a4d29811e89e82b808cfd4f089', '主体\n品牌\n小米\n主要材质\n以实物为准\n型号\n电动滑板车\n轮胎尺寸\n前轮尺寸\n8.5英寸\n后轮尺寸\n8.5英寸\n独轮/双轮尺寸\n8.5英寸', '191806a4d29811e89e82b808cfd4f089_4ebfe6b8554311ea8306acde48001122_', 2, 'http://qiniuyun.donghao.club/ac6c05d08ea011ea9d5eacde48001122.jpg', '28');
INSERT INTO `product` VALUES ('cede899a0fe811ee8577dc1ba1d887da', '同济手工钥匙扣', 9999, 50, 'http://rvpkzi39r.hd-bkt.clouddn.com/cebf974c0fe811ee9d17dc1ba1d887da.jpg@', 2, 1, '2023-06-21 16:22:10', 0, 1, '34a6cb6e02a311eeaf36dc1ba1d887da', '个人木工，四平面交', NULL, 2, 'http://rvpkzi39r.hd-bkt.clouddn.com/cebf974c0fe811ee9d17dc1ba1d887da.jpg', '37');
INSERT INTO `product` VALUES ('d7602a22100e11ee8b52dc1ba1d887da', 'test', 1, 1, 'http://rvpkzi39r.hd-bkt.clouddn.com/d6e680c6100e11ee81fadc1ba1d887da.jpg@', 0, 1, '2023-06-21 16:37:22', 0, 1, '191806a4d29811e89e82b808cfd4f089', 'test', NULL, 0, 'http://rvpkzi39r.hd-bkt.clouddn.com/d6e680c6100e11ee81fadc1ba1d887da.jpg', '4');
INSERT INTO `product` VALUES ('ece974ec0fe811eebf7bdc1ba1d887da', '钥匙扣-无盒', 1000, 30, 'http://rvpkzi39r.hd-bkt.clouddn.com/ecbe2f000fe811ee8f87dc1ba1d887da.jpg@', 0, 1, '2023-06-21 16:22:06', 0, 4, '34a6cb6e02a311eeaf36dc1ba1d887da', '个人手工，无礼盒', NULL, 2, 'http://rvpkzi39r.hd-bkt.clouddn.com/ecbe2f000fe811ee8f87dc1ba1d887da.jpg', '37');
INSERT INTO `product` VALUES ('ef02ecd80fe711ee8ac8dc1ba1d887da', '同济金属书签', 10, 8, 'http://rvpkzi39r.hd-bkt.clouddn.com/eeab5a280fe711eebaefdc1ba1d887da.jpg@', 2, 1, '2023-06-21 17:04:26', 3, 2, '34a6cb6e02a311eeaf36dc1ba1d887da', '黄铜书签，长方形，99新，嘉定面交', '191806a4d29811e89e82b808cfd4f089_da3dd9d2100a11ee8b93dc1ba1d887da_', 2, 'http://rvpkzi39r.hd-bkt.clouddn.com/eeab5a280fe711eebaefdc1ba1d887da.jpg', '33');
INSERT INTO `product` VALUES ('f08252166c4411ea9a1cacde48001122', 'Apple iPad Pro 11英寸平板电脑', 7299, 7099, 'http://qiniuyun.donghao.club/efcc24646c4411ea9a1cacde48001122.jpg@http://qiniuyun.donghao.club/f05b745c6c4411ea9a1cacde48001122.jpg@http://qiniuyun.donghao.club/f065c5926c4411ea9a1cacde48001122.jpg@http://qiniuyun.donghao.club/f07000c06c4411ea9a1cacde48001122.jpg@', 0, 1, '2020-05-08 23:13:20', 43, 1, '191806a4d29811e89e82b808cfd4f089', 'Apple iPad Pro 11英寸平板电脑 2020年新款(256G WLAN版/全面屏/A12Z/Face ID/MXDC2CH/A) 深空灰色', '191806a4d29811e89e82b808cfd4f089_', 2, 'http://qiniuyun.donghao.club/efcc24646c4411ea9a1cacde48001122.jpg', '25');
INSERT INTO `product` VALUES ('fa659a2cd29d11e890a5b808cfd4f089', 'AJ AIR JORDAN 男子运动鞋', 2800, 2000, 'http://qiniuyun.donghao.club/b139e4c53a97441d.png@http://qiniuyun.donghao.club/8bf1ca80689d819f.jpg@http://qiniuyun.donghao.club/b02321b5cc7beb47.jpg@http://qiniuyun.donghao.club/d76c243ab5dbc2a4.jpg@http://qiniuyun.donghao.club/94bc38968607806c.jpg', 0, 1, '2023-06-21 11:50:15', 42, 3, '191806a4d29811e89e82b808cfd4f089', '商品名称：AJ AIR JORDAN MARS 270 男子运动鞋 CD7070 CD7070-135 43商品编号：61407045252店铺： TOPSPORTS官方旗舰店商品毛重：1.0kg货号：CD7070功能科技：其它款式：高帮适用场地：通用功能：减震适用人群：男士上市时间：2019年秋季', '191806a4d29811e89e82b808cfd4f089_', 2, 'http://qiniuyun.donghao.club/b139e4c53a97441d.png', '11');

-- ----------------------------
-- Table structure for shop_cart
-- ----------------------------
DROP TABLE IF EXISTS `shop_cart`;
CREATE TABLE `shop_cart`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sdate` datetime(0) NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL,
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subTotal` float NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  CONSTRAINT `shop_cart_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `shop_cart_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop_cart
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_ok` int(11) NULL DEFAULT NULL,
  `img_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `identity` int(11) NULL DEFAULT NULL,
  `scores` int(11) NULL DEFAULT NULL,
  `shop_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('191806a4d29811e89e82b808cfd4f089', '超级管理员', 'pbkdf2:sha256:260000$GJMRPCzpSdmXtfgC$81705ed527dc3ec388f866c27e545b0ba7ee8b8c997442d610d0a8005ea2b0b7', '黄先生', '1@', '1', '宿舍楼', 1, 'http://qiniuyun.donghao.club/0c945380556311ea8addacde48001122.jpg', '2023-06-21 13:38:53', 1, 0, NULL);
INSERT INTO `user` VALUES ('34a6cb6e02a311eeaf36dc1ba1d887da', 'admin1', 'pbkdf2:sha256:260000$GJMRPCzpSdmXtfgC$81705ed527dc3ec388f866c27e545b0ba7ee8b8c997442d610d0a8005ea2b0b7', 'admin', 'admin', '114514', '体育南路2号', 1, 'http://qiniuyun.donghao.club/0c945380556311ea8addacde48001122.jpg', '2023-06-04 14:44:08', 1, 0, NULL);
INSERT INTO `user` VALUES ('da3dd9d2100a11ee8b93dc1ba1d887da', '2150482', 'pbkdf2:sha256:260000$q5GjNMvwqb48qnup$74fb7770f7d990acf29ca146db8dbfbc82417b70bc70c46a0b65ffd1c1355197', '2150482', '2150482', '2150482', '2150482', 1, 'http://rvpkzi39r.hd-bkt.clouddn.com/6ac035de100f11ee8612dc1ba1d887da.jpg', '2023-06-21 16:08:49', 1, 0, NULL);

SET FOREIGN_KEY_CHECKS = 1;
