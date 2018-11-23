/*
 Navicat Premium Data Transfer

 Source Server         : k11
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : opensns

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 23/11/2018 14:14:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ot_action
-- ----------------------------
DROP TABLE IF EXISTS `ot_action`;
CREATE TABLE `ot_action`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '行为规则',
  `log` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日志规则',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改时间',
  `module` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11024 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统行为表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_action
-- ----------------------------
INSERT INTO `ot_action` VALUES (1, 'reg', '用户注册', '用户注册', '', '', 1, 1, 1426070545, '');
INSERT INTO `ot_action` VALUES (2, 'input_password', '输入密码', '记录输入密码的次数。', '', '', 1, 1, 1426122119, '');
INSERT INTO `ot_action` VALUES (3, 'user_login', '用户登录', '积分+10，每天一次', 'a:1:{i:0;a:5:{s:5:\"table\";s:6:\"member\";s:5:\"field\";s:1:\"1\";s:4:\"rule\";s:2:\"10\";s:5:\"cycle\";s:2:\"24\";s:3:\"max\";s:1:\"1\";}}', '[user|get_nickname]在[time|time_format]登录了账号', 1, 1, 1428397656, '');
INSERT INTO `ot_action` VALUES (4, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988, '');
INSERT INTO `ot_action` VALUES (7, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301, '');
INSERT INTO `ot_action` VALUES (8, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392, '');
INSERT INTO `ot_action` VALUES (11021, 'del_weibo', '删除微博', '删除微博', '', '[user|get_nickname]在[time|time_format]删除了微博：[record|intval]', 1, 1, 1428461334, 'Weibo');
INSERT INTO `ot_action` VALUES (11022, 'set_weibo_top', '置顶微博', '置顶微博', '', '[user|get_nickname]在[time|time_format]置顶了微博：[record|intval]', 1, 1, 1428399164, 'Weibo');
INSERT INTO `ot_action` VALUES (11019, 'add_weibo_comment', '添加微博评论', '添加微博评论', 'a:1:{i:0;a:5:{s:5:\"table\";s:6:\"member\";s:5:\"field\";s:1:\"1\";s:4:\"rule\";s:2:\"+5\";s:5:\"cycle\";s:2:\"24\";s:3:\"max\";s:3:\"100\";}}', '[user|get_nickname]在[time|time_format]添加了微博评论：[record|intval]', 1, 1, 1428399164, 'Weibo');
INSERT INTO `ot_action` VALUES (11023, 'set_weibo_down', '取消置顶微博', '取消置顶微博', '', '[user|get_nickname]在[time|time_format]取消置顶了微博：[record|intval]', 1, 1, 1428462983, 'Weibo');
INSERT INTO `ot_action` VALUES (11020, 'del_weibo_comment', '删除微博评论', '删除微博评论', '', '[user|get_nickname]在[time|time_format]删除了微博评论：[record|intval]', 1, 1, 1428399164, 'Weibo');
INSERT INTO `ot_action` VALUES (11018, 'add_weibo', '发布微博', '新增微博', 'a:1:{i:0;a:5:{s:5:\"table\";s:6:\"member\";s:5:\"field\";s:1:\"1\";s:4:\"rule\";s:3:\"+10\";s:5:\"cycle\";s:2:\"24\";s:3:\"max\";s:3:\"100\";}}', '[user|get_nickname]在[time|time_format]发布了新微博：[record|intval]', 1, 1, 1428397669, 'Weibo');

-- ----------------------------
-- Table structure for ot_action_limit
-- ----------------------------
DROP TABLE IF EXISTS `ot_action_limit`;
CREATE TABLE `ot_action_limit`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `frequency` int(11) NOT NULL,
  `time_number` int(11) NOT NULL,
  `time_unit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `punish` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `if_message` tinyint(4) NOT NULL,
  `message_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `module` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_action_limit
-- ----------------------------
INSERT INTO `ot_action_limit` VALUES (1, 'reg', '注册限制', 1, 1, 'minute', 'warning', 0, '', '[reg]', 1, 0, '');
INSERT INTO `ot_action_limit` VALUES (2, 'input_password', '输密码', 3, 1, 'minute', 'warning', 0, '', '[input_password]', 1, 0, '');
INSERT INTO `ot_action_limit` VALUES (12, 'add_weibo_comment', '添加微博评论', 1, 10, 'second', 'warning', 0, '', '[add_weibo_comment]', 1, 0, 'Weibo');
INSERT INTO `ot_action_limit` VALUES (11, 'add_weibo', '新增微博', 1, 10, 'second', 'warning', 0, '', '[add_weibo]', 1, 0, 'Weibo');

-- ----------------------------
-- Table structure for ot_action_log
-- ----------------------------
DROP TABLE IF EXISTS `ot_action_log`;
CREATE TABLE `ot_action_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '行为id',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '触发行为的数据id',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行行为的时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `action_ip_ix`(`action_ip`) USING BTREE,
  INDEX `action_id_ix`(`action_id`) USING BTREE,
  INDEX `user_id_ix`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 473 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行为日志表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of ot_action_log
-- ----------------------------
INSERT INTO `ot_action_log` VALUES (1, 3, 1, 3063235528, 'member', 1, 'admin在2018-07-09 17:10登录了账号【积分：+10分】', 1, 1531127421);
INSERT INTO `ot_action_log` VALUES (2, 3, 1, 3063235528, 'member', 1, 'admin在2018-07-09 17:55登录了账号', 1, 1531130132);
INSERT INTO `ot_action_log` VALUES (3, 3, 1, 3063235528, 'member', 1, 'admin在2018-07-09 18:01登录了账号', 1, 1531130515);
INSERT INTO `ot_action_log` VALUES (4, 3, 1, 3063235528, 'member', 1, 'admin在2018-07-09 18:12登录了账号', 1, 1531131156);
INSERT INTO `ot_action_log` VALUES (5, 10001, 1, 3063235528, 'weibo', 1, 'admin在2018-07-09 18:14发布了新微博：1【积分：+1分】', 1, 1531131244);
INSERT INTO `ot_action_log` VALUES (6, 10002, 1, 3063235528, 'weibo_comment', 1, 'admin在2018-07-09 18:14添加了微博评论：1【积分：+1分】', 1, 1531131253);
INSERT INTO `ot_action_log` VALUES (7, 10002, 1, 3063235528, 'weibo_comment', 2, 'admin在2018-07-09 18:14添加了微博评论：2【积分：+1分】', 1, 1531131280);
INSERT INTO `ot_action_log` VALUES (8, 2, 1, 2101843627, 'ucenter_member', 1, '操作url：/opensns/index.php?s=/ucenter/member/login.html', 1, 1531131432);
INSERT INTO `ot_action_log` VALUES (9, 3, 1, 2101843627, 'member', 1, 'admin在2018-07-09 18:17登录了账号', 1, 1531131437);
INSERT INTO `ot_action_log` VALUES (10, 10001, 1, 2101843627, 'weibo', 2, 'admin在2018-07-09 18:17发布了新微博：2【积分：+1分】', 1, 1531131472);
INSERT INTO `ot_action_log` VALUES (11, 10001, 1, 3063235528, 'weibo', 3, 'admin在2018-07-09 18:18发布了新微博：3【积分：+1分】', 1, 1531131499);
INSERT INTO `ot_action_log` VALUES (12, 3, 1, 3062519902, 'member', 1, 'admin在2018-07-12 16:17登录了账号【积分：+10分】', 1, 1531383476);
INSERT INTO `ot_action_log` VALUES (13, 3, 1, 2345605002, 'member', 1, 'admin在2018-07-17 16:09登录了账号【积分：+10分】', 1, 1531814973);
INSERT INTO `ot_action_log` VALUES (14, 3, 1, 3062535780, 'member', 1, 'admin在2018-07-18 15:22登录了账号', 1, 1531898556);
INSERT INTO `ot_action_log` VALUES (15, 3, 1, 3063235538, 'member', 1, 'admin在2018-07-24 12:17登录了账号【积分：+10分】', 1, 1532405857);
INSERT INTO `ot_action_log` VALUES (16, 10001, 1, 3063235538, 'weibo', 4, 'admin在2018-07-24 12:30发布了新微博：4【积分：+1分】', 1, 1532406633);
INSERT INTO `ot_action_log` VALUES (17, 10001, 1, 3063235538, 'weibo', 5, 'admin在2018-07-24 12:31发布了新微博：5【积分：+1分】', 1, 1532406683);
INSERT INTO `ot_action_log` VALUES (18, 10002, 1, 3063235538, 'weibo_comment', 3, 'admin在2018-07-24 12:33添加了微博评论：3【积分：+1分】', 1, 1532406781);
INSERT INTO `ot_action_log` VALUES (19, 10002, 1, 3063235538, 'weibo_comment', 4, 'admin在2018-07-24 13:05添加了微博评论：4【积分：+1分】', 1, 1532408702);
INSERT INTO `ot_action_log` VALUES (20, 10002, 1, 3063235538, 'weibo_comment', 5, 'admin在2018-07-24 13:05添加了微博评论：5【积分：+1分】', 1, 1532408723);
INSERT INTO `ot_action_log` VALUES (21, 10002, 1, 3063235538, 'weibo_comment', 6, 'admin在2018-07-24 13:05添加了微博评论：6【积分：+1分】', 1, 1532408734);
INSERT INTO `ot_action_log` VALUES (22, 10001, 1, 3063235538, 'weibo', 6, 'admin在2018-07-24 13:08发布了新微博：6【积分：+1分】', 1, 1532408899);
INSERT INTO `ot_action_log` VALUES (23, 3, 1, 3063235538, 'member', 1, 'admin在2018-07-24 16:44登录了账号', 1, 1532421872);
INSERT INTO `ot_action_log` VALUES (24, 3, 1, 3063235538, 'member', 1, 'admin在2018-07-27 12:12登录了账号【积分：+10分】', 1, 1532664755);
INSERT INTO `ot_action_log` VALUES (25, 2, 1, 3063235538, 'ucenter_member', 1, '操作url：/opensns/index.php?s=/ucenter/member/login.html', 1, 1532664828);
INSERT INTO `ot_action_log` VALUES (26, 3, 1, 3063235538, 'member', 1, 'admin在2018-07-27 12:13登录了账号', 1, 1532664839);
INSERT INTO `ot_action_log` VALUES (27, 3, 1, 3063235538, 'member', 1, 'admin在2018-08-02 18:28登录了账号【积分：+10分】', 1, 1533205728);
INSERT INTO `ot_action_log` VALUES (28, 3, 1, 1987076574, 'member', 1, 'admin在2018-08-23 16:43登录了账号【积分：+10分】', 1, 1535013809);
INSERT INTO `ot_action_log` VALUES (29, 3, 1, 3738278454, 'member', 1, 'admin在2018-08-23 21:01登录了账号', 1, 1535029304);
INSERT INTO `ot_action_log` VALUES (30, 3, 1, 3738278454, 'member', 1, 'admin在2018-08-23 22:17登录了账号', 1, 1535033823);
INSERT INTO `ot_action_log` VALUES (31, 3, 1, 2101843548, 'member', 1, 'admin在2018-08-29 13:57登录了账号【积分：+10分】', 1, 1535522276);
INSERT INTO `ot_action_log` VALUES (32, 2, 1, 2101843548, 'ucenter_member', 1, '操作url：/opensns/admin.php?s=/public/login.html', 1, 1535523505);
INSERT INTO `ot_action_log` VALUES (33, 3, 1, 2101843548, 'member', 1, 'admin在2018-08-29 14:18登录了账号', 1, 1535523518);
INSERT INTO `ot_action_log` VALUES (34, 2, 1, 2101843548, 'ucenter_member', 1, '操作url：/opensns/admin.php?s=/public/login.html', 1, 1535526858);
INSERT INTO `ot_action_log` VALUES (35, 2, 1, 2101843548, 'ucenter_member', 1, '操作url：/opensns/admin.php?s=/public/login.html', 1, 1535526863);
INSERT INTO `ot_action_log` VALUES (36, 3, 1, 2101843548, 'member', 1, 'admin在2018-08-29 15:14登录了账号', 1, 1535526881);
INSERT INTO `ot_action_log` VALUES (37, 3, 1, 2101843548, 'member', 1, 'admin在2018-08-29 15:32登录了账号', 1, 1535527927);
INSERT INTO `ot_action_log` VALUES (38, 3, 1, 2101843548, 'member', 1, 'admin在2018-08-29 15:45登录了账号', 1, 1535528758);
INSERT INTO `ot_action_log` VALUES (39, 10001, 1, 2101843548, 'weibo', 7, 'admin在2018-08-29 15:54发布了新微博：7【积分：+1分】', 1, 1535529275);
INSERT INTO `ot_action_log` VALUES (40, 10002, 1, 2101843548, 'weibo_comment', 7, 'admin在2018-08-29 15:54添加了微博评论：7【积分：+1分】', 1, 1535529296);
INSERT INTO `ot_action_log` VALUES (41, 1, 1, 2101843548, 'ucenter_member', 1, '操作url：/opensns/index.php?s=/ucenter/member/register.html', 1, 1535530253);
INSERT INTO `ot_action_log` VALUES (42, 3, 100, 2101843548, 'member', 100, 'Vonder在2018-08-29 16:10登录了账号【积分：+10分】', 1, 1535530253);
INSERT INTO `ot_action_log` VALUES (43, 10001, 100, 2101843548, 'weibo', 8, 'Vonder在2018-08-29 16:13发布了新微博：8【积分：+1分】', 1, 1535530381);
INSERT INTO `ot_action_log` VALUES (44, 3, 1, 2101843548, 'member', 1, 'admin在2018-08-29 16:14登录了账号', 1, 1535530446);
INSERT INTO `ot_action_log` VALUES (45, 3, 1, 2101843548, 'member', 1, 'admin在2018-08-29 16:17登录了账号', 1, 1535530673);
INSERT INTO `ot_action_log` VALUES (46, 10001, 1, 2101843548, 'weibo', 9, 'admin在2018-08-29 16:34发布了新微博：9【积分：+1分】', 1, 1535531675);
INSERT INTO `ot_action_log` VALUES (47, 3, 1, 2101843548, 'member', 1, 'admin在2018-08-29 17:02登录了账号', 1, 1535533332);
INSERT INTO `ot_action_log` VALUES (48, 3, 1, 2101843548, 'member', 1, 'admin在2018-08-29 17:36登录了账号', 1, 1535535385);
INSERT INTO `ot_action_log` VALUES (49, 10001, 1, 2101843548, 'weibo', 10, 'admin在2018-08-29 17:38发布了新微博：10【积分：+1分】', 1, 1535535486);
INSERT INTO `ot_action_log` VALUES (50, 10001, 1, 2101843548, 'weibo', 11, 'admin在2018-08-29 17:38发布了新微博：11【积分：+1分】', 1, 1535535498);
INSERT INTO `ot_action_log` VALUES (51, 2, 1, 2130706433, 'ucenter_member', 1, '操作url：/admin.php?s=/public/login.html', 1, 1535598733);
INSERT INTO `ot_action_log` VALUES (52, 2, 1, 2130706433, 'ucenter_member', 1, '操作url：/admin.php?s=/public/login.html', 1, 1535598734);
INSERT INTO `ot_action_log` VALUES (53, 2, 1, 2130706433, 'ucenter_member', 1, '操作url：/admin.php?s=/public/login.html', 1, 1535598735);
INSERT INTO `ot_action_log` VALUES (54, 2, 1, 2130706433, 'ucenter_member', 1, '操作url：/index.php?s=/ucenter/member/login.html', 1, 1535599710);
INSERT INTO `ot_action_log` VALUES (55, 2, 1, 2130706433, 'ucenter_member', 1, '操作url：/index.php?s=/ucenter/member/login.html', 1, 1535599712);
INSERT INTO `ot_action_log` VALUES (56, 2, 1, 2130706433, 'ucenter_member', 1, '操作url：/index.php?s=/ucenter/member/login.html', 1, 1535599715);
INSERT INTO `ot_action_log` VALUES (57, 2, 100, 2130706433, 'ucenter_member', 100, '操作url：/admin.php?s=/public/login.html', 1, 1535600318);
INSERT INTO `ot_action_log` VALUES (58, 2, 1, 2130706433, 'ucenter_member', 1, '操作url：/admin.php?s=/public/login.html', 1, 1535600327);
INSERT INTO `ot_action_log` VALUES (59, 2, 1, 2130706433, 'ucenter_member', 1, '操作url：/admin.php?s=/public/login.html', 1, 1535600331);
INSERT INTO `ot_action_log` VALUES (60, 2, 1, 2130706433, 'ucenter_member', 1, '操作url：/admin.php?s=/public/login.html', 1, 1535600335);
INSERT INTO `ot_action_log` VALUES (61, 2, 1, 2130706433, 'ucenter_member', 1, '操作url：/admin.php?s=/public/login.html', 1, 1535600687);
INSERT INTO `ot_action_log` VALUES (62, 2, 1, 2130706433, 'ucenter_member', 1, '操作url：/admin.php?s=/public/login.html', 1, 1535600946);
INSERT INTO `ot_action_log` VALUES (63, 2, 1, 2130706433, 'ucenter_member', 1, '操作url：/admin.php?s=/public/login.html', 1, 1535600950);
INSERT INTO `ot_action_log` VALUES (64, 3, 1, 2130706433, 'member', 1, 'admin在2018-08-30 11:55登录了账号', 1, 1535601314);
INSERT INTO `ot_action_log` VALUES (65, 10001, 1, 2130706433, 'weibo', 12, 'admin在2018-08-30 11:57发布了新微博：12【积分：+1分】', 1, 1535601428);
INSERT INTO `ot_action_log` VALUES (66, 3, 1, 2130706433, 'member', 1, 'admin在2018-08-30 13:02登录了账号', 1, 1535605359);
INSERT INTO `ot_action_log` VALUES (67, 3, 1, 2130706433, 'member', 1, 'admin在2018-08-30 13:43登录了账号', 1, 1535607814);
INSERT INTO `ot_action_log` VALUES (68, 10002, 1, 2130706433, 'weibo_comment', 8, 'admin在2018-08-30 13:43添加了微博评论：8【积分：+1分】', 1, 1535607835);
INSERT INTO `ot_action_log` VALUES (69, 3, 1, 2130706433, 'member', 1, 'admin在2018-08-30 14:22登录了账号', 1, 1535610167);
INSERT INTO `ot_action_log` VALUES (70, 3, 1, 2130706433, 'member', 1, 'admin在2018-08-30 14:40登录了账号', 1, 1535611246);
INSERT INTO `ot_action_log` VALUES (71, 10002, 1, 2130706433, 'weibo_comment', 9, 'admin在2018-08-30 14:41添加了微博评论：9【积分：+1分】', 1, 1535611276);
INSERT INTO `ot_action_log` VALUES (72, 10005, 1, 2130706433, 'weibo', 12, 'admin在2018-08-30 14:41置顶了微博：12', 1, 1535611290);
INSERT INTO `ot_action_log` VALUES (73, 10006, 1, 2130706433, 'weibo', 12, 'admin在2018-08-30 14:43取消置顶了微博：12', 1, 1535611383);
INSERT INTO `ot_action_log` VALUES (74, 10001, 1, 2130706433, 'weibo', 13, 'admin在2018-08-30 14:52发布了新微博：13【积分：+1分】', 1, 1535611965);
INSERT INTO `ot_action_log` VALUES (75, 10001, 1, 2130706433, 'weibo', 14, 'admin在2018-08-30 15:33发布了新微博：14【积分：+1分】', 1, 1535614435);
INSERT INTO `ot_action_log` VALUES (76, 3, 1, 2130706433, 'member', 1, 'admin在2018-08-30 16:16登录了账号', 1, 1535617011);
INSERT INTO `ot_action_log` VALUES (77, 3, 1, 2130706433, 'member', 1, 'admin在2018-08-30 17:37登录了账号', 1, 1535621823);
INSERT INTO `ot_action_log` VALUES (78, 3, 1, 2130706433, 'member', 1, 'admin在2018-08-31 09:59登录了账号', 1, 1535680794);
INSERT INTO `ot_action_log` VALUES (79, 3, 1, 2130706433, 'member', 1, 'admin在2018-08-31 10:11登录了账号', 1, 1535681477);
INSERT INTO `ot_action_log` VALUES (80, 3, 1, 2130706433, 'member', 1, 'admin在2018-08-31 11:17登录了账号', 1, 1535685454);
INSERT INTO `ot_action_log` VALUES (81, 3, 1, 2130706433, 'member', 1, 'admin在2018-08-31 14:02登录了账号', 1, 1535695368);
INSERT INTO `ot_action_log` VALUES (82, 3, 1, 2130706433, 'member', 1, 'admin在2018-08-31 14:05登录了账号', 1, 1535695549);
INSERT INTO `ot_action_log` VALUES (83, 3, 1, 2130706433, 'member', 1, 'admin在2018-08-31 15:12登录了账号', 1, 1535699547);
INSERT INTO `ot_action_log` VALUES (84, 3, 1, 2130706433, 'member', 1, 'admin在2018-08-31 16:12登录了账号', 1, 1535703175);
INSERT INTO `ot_action_log` VALUES (85, 3, 1, 2130706433, 'member', 1, 'admin在2018-08-31 16:25登录了账号', 1, 1535703933);
INSERT INTO `ot_action_log` VALUES (86, 3, 1, 2130706433, 'member', 1, 'admin在2018-08-31 16:53登录了账号', 1, 1535705636);
INSERT INTO `ot_action_log` VALUES (87, 10001, 1, 2130706433, 'weibo', 15, 'admin在2018-08-31 16:59发布了新微博：15【积分：+1分】', 1, 1535705951);
INSERT INTO `ot_action_log` VALUES (88, 10001, 1, 2130706433, 'weibo', 16, 'admin在2018-08-31 16:59发布了新微博：16【积分：+1分】', 1, 1535705978);
INSERT INTO `ot_action_log` VALUES (89, 3, 1, 2130706433, 'member', 1, 'admin在2018-08-31 17:15登录了账号', 1, 1535706919);
INSERT INTO `ot_action_log` VALUES (90, 2, 100, 2130706433, 'ucenter_member', 100, '操作url：/index.php?s=/ucenter/member/login.html', 1, 1535707971);
INSERT INTO `ot_action_log` VALUES (91, 2, 100, 2130706433, 'ucenter_member', 100, '操作url：/index.php?s=/ucenter/member/login.html', 1, 1535707975);
INSERT INTO `ot_action_log` VALUES (92, 2, 100, 2130706433, 'ucenter_member', 100, '操作url：/index.php?s=/ucenter/member/login.html', 1, 1535707979);
INSERT INTO `ot_action_log` VALUES (93, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-08-31 17:34登录了账号【积分：+10分】', 1, 1535708069);
INSERT INTO `ot_action_log` VALUES (94, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-08-31 17:50登录了账号', 1, 1535709045);
INSERT INTO `ot_action_log` VALUES (95, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-08-31 18:06登录了账号', 1, 1535709997);
INSERT INTO `ot_action_log` VALUES (96, 3, 1, 2130706433, 'member', 1, 'admin在2018-08-31 18:09登录了账号', 1, 1535710172);
INSERT INTO `ot_action_log` VALUES (97, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-08-31 18:11登录了账号', 1, 1535710280);
INSERT INTO `ot_action_log` VALUES (98, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-03 10:07登录了账号【积分：+10分】', 1, 1535940443);
INSERT INTO `ot_action_log` VALUES (99, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-03 10:07登录了账号【积分：+10分】', 1, 1535940478);
INSERT INTO `ot_action_log` VALUES (100, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-03 10:44登录了账号', 1, 1535942690);
INSERT INTO `ot_action_log` VALUES (101, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-03 10:52登录了账号', 1, 1535943173);
INSERT INTO `ot_action_log` VALUES (102, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-03 11:00登录了账号', 1, 1535943602);
INSERT INTO `ot_action_log` VALUES (103, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-03 11:28登录了账号', 1, 1535945284);
INSERT INTO `ot_action_log` VALUES (104, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-03 11:28登录了账号', 1, 1535945284);
INSERT INTO `ot_action_log` VALUES (105, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-03 11:51登录了账号', 1, 1535946711);
INSERT INTO `ot_action_log` VALUES (106, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-03 12:23登录了账号', 1, 1535948600);
INSERT INTO `ot_action_log` VALUES (107, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-03 12:45登录了账号', 1, 1535949927);
INSERT INTO `ot_action_log` VALUES (108, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-03 15:12登录了账号', 1, 1535958775);
INSERT INTO `ot_action_log` VALUES (109, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-03 15:57登录了账号', 1, 1535961430);
INSERT INTO `ot_action_log` VALUES (110, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-03 16:26登录了账号', 1, 1535963168);
INSERT INTO `ot_action_log` VALUES (111, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-03 16:26登录了账号', 1, 1535963170);
INSERT INTO `ot_action_log` VALUES (112, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-03 16:27登录了账号', 1, 1535963238);
INSERT INTO `ot_action_log` VALUES (113, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-03 16:47登录了账号', 1, 1535964420);
INSERT INTO `ot_action_log` VALUES (114, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-03 16:47登录了账号', 1, 1535964450);
INSERT INTO `ot_action_log` VALUES (115, 10001, 1, 2130706433, 'weibo', 17, 'admin在2018-09-03 16:50发布了新微博：17【积分：+1分】', 1, 1535964612);
INSERT INTO `ot_action_log` VALUES (116, 10001, 1, 2130706433, 'weibo', 18, 'admin在2018-09-03 16:50发布了新微博：18【积分：+1分】', 1, 1535964630);
INSERT INTO `ot_action_log` VALUES (117, 10001, 1, 2130706433, 'weibo', 19, 'admin在2018-09-03 16:50发布了新微博：19【积分：+1分】', 1, 1535964652);
INSERT INTO `ot_action_log` VALUES (118, 10001, 1, 2130706433, 'weibo', 20, 'admin在2018-09-03 16:51发布了新微博：20【积分：+1分】', 1, 1535964664);
INSERT INTO `ot_action_log` VALUES (119, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-03 17:06登录了账号', 1, 1535965580);
INSERT INTO `ot_action_log` VALUES (120, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-03 17:06登录了账号', 1, 1535965596);
INSERT INTO `ot_action_log` VALUES (121, 10001, 1, 2130706433, 'weibo', 21, 'admin在2018-09-03 17:13发布了新微博：21【积分：+1分】', 1, 1535966001);
INSERT INTO `ot_action_log` VALUES (122, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-03 17:40登录了账号', 1, 1535967618);
INSERT INTO `ot_action_log` VALUES (123, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-03 18:16登录了账号', 1, 1535969767);
INSERT INTO `ot_action_log` VALUES (124, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-04 09:34登录了账号', 1, 1536024869);
INSERT INTO `ot_action_log` VALUES (125, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-04 09:34登录了账号', 1, 1536024890);
INSERT INTO `ot_action_log` VALUES (126, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-04 10:03登录了账号', 1, 1536026638);
INSERT INTO `ot_action_log` VALUES (127, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-04 10:41登录了账号', 1, 1536028889);
INSERT INTO `ot_action_log` VALUES (128, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-04 10:42登录了账号', 1, 1536028957);
INSERT INTO `ot_action_log` VALUES (129, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-04 11:17登录了账号', 1, 1536031067);
INSERT INTO `ot_action_log` VALUES (130, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-04 11:39登录了账号', 1, 1536032356);
INSERT INTO `ot_action_log` VALUES (131, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-04 13:24登录了账号', 1, 1536038698);
INSERT INTO `ot_action_log` VALUES (132, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-04 13:38登录了账号', 1, 1536039497);
INSERT INTO `ot_action_log` VALUES (133, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-04 14:23登录了账号', 1, 1536042212);
INSERT INTO `ot_action_log` VALUES (134, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-04 14:25登录了账号', 1, 1536042329);
INSERT INTO `ot_action_log` VALUES (135, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-04 14:56登录了账号', 1, 1536044199);
INSERT INTO `ot_action_log` VALUES (136, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-04 15:15登录了账号', 1, 1536045320);
INSERT INTO `ot_action_log` VALUES (137, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-04 15:39登录了账号', 1, 1536046777);
INSERT INTO `ot_action_log` VALUES (138, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-04 15:39登录了账号', 1, 1536046783);
INSERT INTO `ot_action_log` VALUES (139, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-04 16:26登录了账号', 1, 1536049563);
INSERT INTO `ot_action_log` VALUES (140, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-04 16:26登录了账号', 1, 1536049569);
INSERT INTO `ot_action_log` VALUES (141, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-04 16:26登录了账号', 1, 1536049582);
INSERT INTO `ot_action_log` VALUES (142, 10001, 100, 2130706433, 'weibo', 26, 'Vonder在2018-09-04 16:26发布了新微博：26【积分：+1分】', 1, 1536049592);
INSERT INTO `ot_action_log` VALUES (143, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-04 16:49登录了账号', 1, 1536050984);
INSERT INTO `ot_action_log` VALUES (144, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-04 17:00登录了账号', 1, 1536051609);
INSERT INTO `ot_action_log` VALUES (145, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-04 17:00登录了账号', 1, 1536051615);
INSERT INTO `ot_action_log` VALUES (146, 1, 1, 2130706433, 'ucenter_member', 1, '操作url：/index.php?s=/ucenter/member/register.html', 1, 1536051978);
INSERT INTO `ot_action_log` VALUES (147, 3, 101, 2130706433, 'member', 101, 'wangdi在2018-09-04 17:06登录了账号【积分：+10分】', 1, 1536051978);
INSERT INTO `ot_action_log` VALUES (148, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-04 17:06登录了账号', 1, 1536052009);
INSERT INTO `ot_action_log` VALUES (149, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-04 17:37登录了账号', 1, 1536053850);
INSERT INTO `ot_action_log` VALUES (150, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-04 17:37登录了账号', 1, 1536053850);
INSERT INTO `ot_action_log` VALUES (151, 3, 101, 2130706433, 'member', 101, 'wangdi在2018-09-04 17:38登录了账号', 1, 1536053911);
INSERT INTO `ot_action_log` VALUES (152, 10001, 101, 2130706433, 'weibo', 27, 'wangdi在2018-09-04 17:38发布了新微博：27【积分：+1分】', 1, 1536053922);
INSERT INTO `ot_action_log` VALUES (153, 3, 101, 2130706433, 'member', 101, 'wangdi在2018-09-04 17:56登录了账号', 1, 1536054990);
INSERT INTO `ot_action_log` VALUES (154, 3, 101, 2130706433, 'member', 101, 'wangdi在2018-09-05 09:51登录了账号', 1, 1536112312);
INSERT INTO `ot_action_log` VALUES (155, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-05 09:52登录了账号', 1, 1536112321);
INSERT INTO `ot_action_log` VALUES (156, 3, 101, 2130706433, 'member', 101, 'wangdi在2018-09-05 11:58登录了账号', 1, 1536119925);
INSERT INTO `ot_action_log` VALUES (157, 3, 101, 2130706433, 'member', 101, 'wangdi在2018-09-05 13:23登录了账号', 1, 1536124990);
INSERT INTO `ot_action_log` VALUES (158, 3, 101, 2130706433, 'member', 101, 'wangdi在2018-09-05 13:23登录了账号', 1, 1536124988);
INSERT INTO `ot_action_log` VALUES (159, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-05 13:23登录了账号', 1, 1536125002);
INSERT INTO `ot_action_log` VALUES (160, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-05 15:13登录了账号', 1, 1536131587);
INSERT INTO `ot_action_log` VALUES (161, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-05 15:13登录了账号', 1, 1536131590);
INSERT INTO `ot_action_log` VALUES (162, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-05 15:36登录了账号', 1, 1536133003);
INSERT INTO `ot_action_log` VALUES (163, 10001, 100, 2130706433, 'weibo', 31, 'Vonder在2018-09-05 15:40发布了新微博：31【积分：+1分】', 1, 1536133227);
INSERT INTO `ot_action_log` VALUES (164, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-05 16:02登录了账号', 1, 1536134567);
INSERT INTO `ot_action_log` VALUES (165, 10001, 100, 2130706433, 'weibo', 32, 'Vonder在2018-09-05 16:03发布了新微博：32【积分：+1分】', 1, 1536134598);
INSERT INTO `ot_action_log` VALUES (166, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-05 16:19登录了账号', 1, 1536135576);
INSERT INTO `ot_action_log` VALUES (167, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-05 16:35登录了账号', 1, 1536136515);
INSERT INTO `ot_action_log` VALUES (168, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-05 17:26登录了账号', 1, 1536139598);
INSERT INTO `ot_action_log` VALUES (169, 10001, 1, 2130706433, 'weibo', 37, 'admin在2018-09-05 18:13发布了新微博：37【积分：+1分】', 1, 1536142414);
INSERT INTO `ot_action_log` VALUES (170, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-06 09:42登录了账号', 1, 1536198174);
INSERT INTO `ot_action_log` VALUES (171, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-06 10:09登录了账号', 1, 1536199742);
INSERT INTO `ot_action_log` VALUES (172, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-06 11:06登录了账号', 1, 1536203170);
INSERT INTO `ot_action_log` VALUES (173, 10001, 1, 2130706433, 'weibo', 39, 'admin在2018-09-06 11:06发布了新微博：39【积分：+1分】', 1, 1536203185);
INSERT INTO `ot_action_log` VALUES (174, 10002, 1, 2130706433, 'weibo_comment', 14, 'admin在2018-09-06 11:06添加了微博评论：14【积分：+1分】', 1, 1536203185);
INSERT INTO `ot_action_log` VALUES (175, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-06 12:03登录了账号', 1, 1536206582);
INSERT INTO `ot_action_log` VALUES (176, 10001, 1, 2130706433, 'weibo', 40, 'admin在2018-09-06 12:03发布了新微博：40【积分：+1分】', 1, 1536206607);
INSERT INTO `ot_action_log` VALUES (177, 10002, 1, 2130706433, 'weibo_comment', 15, 'admin在2018-09-06 12:03添加了微博评论：15【积分：+1分】', 1, 1536206607);
INSERT INTO `ot_action_log` VALUES (178, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-06 12:34登录了账号', 1, 1536208465);
INSERT INTO `ot_action_log` VALUES (179, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-06 12:57登录了账号', 1, 1536209823);
INSERT INTO `ot_action_log` VALUES (180, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-06 12:59登录了账号', 1, 1536209979);
INSERT INTO `ot_action_log` VALUES (181, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-06 12:59登录了账号', 1, 1536209997);
INSERT INTO `ot_action_log` VALUES (182, 10001, 1, 2130706433, 'weibo', 41, 'admin在2018-09-06 13:07发布了新微博：41【积分：+1分】', 1, 1536210442);
INSERT INTO `ot_action_log` VALUES (183, 10001, 1, 2130706433, 'weibo', 42, 'admin在2018-09-06 13:08发布了新微博：42【积分：+1分】', 1, 1536210535);
INSERT INTO `ot_action_log` VALUES (184, 10001, 1, 2130706433, 'weibo', 43, 'admin在2018-09-06 13:09发布了新微博：43【积分：+1分】', 1, 1536210567);
INSERT INTO `ot_action_log` VALUES (185, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-06 13:10登录了账号', 1, 1536210653);
INSERT INTO `ot_action_log` VALUES (186, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-06 13:31登录了账号', 1, 1536211887);
INSERT INTO `ot_action_log` VALUES (187, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-06 14:19登录了账号', 1, 1536214766);
INSERT INTO `ot_action_log` VALUES (188, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-06 16:03登录了账号', 1, 1536221008);
INSERT INTO `ot_action_log` VALUES (189, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-06 16:23登录了账号', 1, 1536222209);
INSERT INTO `ot_action_log` VALUES (190, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-06 16:39登录了账号', 1, 1536223159);
INSERT INTO `ot_action_log` VALUES (191, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-06 17:22登录了账号', 1, 1536225771);
INSERT INTO `ot_action_log` VALUES (192, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-09-06 17:24登录了账号【积分：+10分】', 1, 1536225855);
INSERT INTO `ot_action_log` VALUES (193, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-06 17:25登录了账号', 1, 1536225933);
INSERT INTO `ot_action_log` VALUES (194, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-07 09:44登录了账号', 1, 1536284670);
INSERT INTO `ot_action_log` VALUES (195, 2, 1, 2130706433, 'ucenter_member', 1, '操作url：/admin.php?s=/public/login.html', 1, 1536290127);
INSERT INTO `ot_action_log` VALUES (196, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-07 11:15登录了账号', 1, 1536290130);
INSERT INTO `ot_action_log` VALUES (197, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-07 12:49登录了账号', 1, 1536295754);
INSERT INTO `ot_action_log` VALUES (198, 10001, 1, 2130706433, 'weibo', 45, 'admin在2018-09-07 12:49发布了新微博：45【积分：+1分】', 1, 1536295771);
INSERT INTO `ot_action_log` VALUES (199, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-07 14:38登录了账号', 1, 1536302290);
INSERT INTO `ot_action_log` VALUES (200, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-07 14:38登录了账号', 1, 1536302295);
INSERT INTO `ot_action_log` VALUES (201, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-07 14:56登录了账号', 1, 1536303401);
INSERT INTO `ot_action_log` VALUES (202, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-07 14:56登录了账号', 1, 1536303399);
INSERT INTO `ot_action_log` VALUES (203, 3, 101, 2130706433, 'member', 101, 'wangdi在2018-09-07 14:56登录了账号【积分：+10分】', 1, 1536303410);
INSERT INTO `ot_action_log` VALUES (204, 3, 101, 2130706433, 'member', 101, 'wangdi在2018-09-10 10:03登录了账号【积分：+10分】', 1, 1536544985);
INSERT INTO `ot_action_log` VALUES (205, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-10 10:03登录了账号【积分：+10分】', 1, 1536545013);
INSERT INTO `ot_action_log` VALUES (206, 3, 101, 2130706433, 'member', 101, 'wangdi在2018-09-10 10:19登录了账号', 1, 1536545974);
INSERT INTO `ot_action_log` VALUES (207, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-10 10:19登录了账号', 1, 1536545993);
INSERT INTO `ot_action_log` VALUES (208, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-10 10:30登录了账号', 1, 1536546650);
INSERT INTO `ot_action_log` VALUES (209, 3, 101, 2130706433, 'member', 101, 'wangdi在2018-09-10 15:02登录了账号', 1, 1536562959);
INSERT INTO `ot_action_log` VALUES (210, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-10 15:03登录了账号', 1, 1536562980);
INSERT INTO `ot_action_log` VALUES (211, 3, 101, 2130706433, 'member', 101, 'wangdi在2018-09-10 15:22登录了账号', 1, 1536564172);
INSERT INTO `ot_action_log` VALUES (212, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-10 15:24登录了账号', 1, 1536564249);
INSERT INTO `ot_action_log` VALUES (213, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-10 15:45登录了账号', 1, 1536565528);
INSERT INTO `ot_action_log` VALUES (214, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-10 15:45登录了账号', 1, 1536565543);
INSERT INTO `ot_action_log` VALUES (215, 3, 101, 2130706433, 'member', 101, 'wangdi在2018-09-10 16:03登录了账号', 1, 1536566616);
INSERT INTO `ot_action_log` VALUES (216, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-10 17:11登录了账号', 1, 1536570707);
INSERT INTO `ot_action_log` VALUES (217, 3, 101, 2130706433, 'member', 101, 'wangdi在2018-09-11 09:45登录了账号', 1, 1536630331);
INSERT INTO `ot_action_log` VALUES (218, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-11 09:47登录了账号', 1, 1536630478);
INSERT INTO `ot_action_log` VALUES (219, 10001, 1, 2130706433, 'weibo', 50, 'admin在2018-09-11 09:55发布了新微博：50【积分：+1分】', 1, 1536630925);
INSERT INTO `ot_action_log` VALUES (220, 10001, 1, 2130706433, 'weibo', 51, 'admin在2018-09-11 10:00发布了新微博：51【积分：+1分】', 1, 1536631208);
INSERT INTO `ot_action_log` VALUES (221, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-11 10:19登录了账号', 1, 1536632399);
INSERT INTO `ot_action_log` VALUES (222, 10001, 1, 2130706433, 'weibo', 52, 'admin在2018-09-11 10:23发布了新微博：52【积分：+1分】', 1, 1536632584);
INSERT INTO `ot_action_log` VALUES (223, 10001, 1, 2130706433, 'weibo', 53, 'admin在2018-09-11 10:23发布了新微博：53【积分：+1分】', 1, 1536632599);
INSERT INTO `ot_action_log` VALUES (224, 10001, 1, 2130706433, 'weibo', 54, 'admin在2018-09-11 10:23发布了新微博：54【积分：+1分】', 1, 1536632611);
INSERT INTO `ot_action_log` VALUES (225, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-11 10:46登录了账号', 1, 1536633974);
INSERT INTO `ot_action_log` VALUES (226, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-11 11:28登录了账号', 1, 1536636536);
INSERT INTO `ot_action_log` VALUES (227, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-11 11:29登录了账号', 1, 1536636546);
INSERT INTO `ot_action_log` VALUES (228, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-11 11:29登录了账号', 1, 1536636555);
INSERT INTO `ot_action_log` VALUES (229, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-11 11:40登录了账号', 1, 1536637215);
INSERT INTO `ot_action_log` VALUES (230, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-11 11:41登录了账号', 1, 1536637307);
INSERT INTO `ot_action_log` VALUES (231, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-11 11:42登录了账号', 1, 1536637349);
INSERT INTO `ot_action_log` VALUES (232, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-11 12:16登录了账号', 1, 1536639365);
INSERT INTO `ot_action_log` VALUES (233, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-11 12:17登录了账号', 1, 1536639429);
INSERT INTO `ot_action_log` VALUES (234, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-11 12:17登录了账号', 1, 1536639438);
INSERT INTO `ot_action_log` VALUES (235, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-11 13:06登录了账号', 1, 1536642368);
INSERT INTO `ot_action_log` VALUES (236, 3, 101, 2130706433, 'member', 101, 'wangdi在2018-09-13 14:48登录了账号【积分：+10分】', 1, 1536821338);
INSERT INTO `ot_action_log` VALUES (237, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-13 14:49登录了账号【积分：+10分】', 1, 1536821355);
INSERT INTO `ot_action_log` VALUES (238, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-17 10:00登录了账号【积分：+10分】', 1, 1537149619);
INSERT INTO `ot_action_log` VALUES (239, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-17 11:08登录了账号', 1, 1537153716);
INSERT INTO `ot_action_log` VALUES (240, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-17 11:25登录了账号', 1, 1537154718);
INSERT INTO `ot_action_log` VALUES (241, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-17 11:39登录了账号', 1, 1537155549);
INSERT INTO `ot_action_log` VALUES (242, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-17 12:33登录了账号', 1, 1537158829);
INSERT INTO `ot_action_log` VALUES (243, 10001, 1, 2130706433, 'weibo', 55, 'admin在2018-09-17 13:08发布了新微博：55【积分：+1分】', 1, 1537160913);
INSERT INTO `ot_action_log` VALUES (244, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-17 13:41登录了账号', 1, 1537162876);
INSERT INTO `ot_action_log` VALUES (245, 2, 1, 2130706433, 'ucenter_member', 1, '操作url：/index.php?s=/wiki/api/login.html', 1, 1537163012);
INSERT INTO `ot_action_log` VALUES (246, 2, 1, 2130706433, 'ucenter_member', 1, '操作url：/index.php?s=/wiki/api/login.html', 1, 1537163060);
INSERT INTO `ot_action_log` VALUES (247, 2, 1, 2130706433, 'ucenter_member', 1, '操作url：/index.php?s=/wiki/api/login.html', 1, 1537163264);
INSERT INTO `ot_action_log` VALUES (248, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-17 13:48登录了账号', 1, 1537163303);
INSERT INTO `ot_action_log` VALUES (249, 10001, 1, 2130706433, 'weibo', 57, 'admin在2018-09-17 13:55发布了新微博：57【积分：+1分】', 1, 1537163746);
INSERT INTO `ot_action_log` VALUES (250, 10001, 0, 2130706433, 'weibo', 58, '在2018-09-17 14:12发布了新微博：58', 1, 1537164762);
INSERT INTO `ot_action_log` VALUES (251, 10001, 0, 2130706433, 'weibo', 59, '在2018-09-17 14:13发布了新微博：59', 1, 1537164792);
INSERT INTO `ot_action_log` VALUES (252, 10001, 0, 2130706433, 'weibo', 60, '在2018-09-17 14:13发布了新微博：60', 1, 1537164819);
INSERT INTO `ot_action_log` VALUES (253, 10001, 0, 2130706433, 'weibo', 61, '在2018-09-17 14:14发布了新微博：61', 1, 1537164843);
INSERT INTO `ot_action_log` VALUES (254, 10001, 0, 2130706433, 'weibo', 62, '在2018-09-17 14:14发布了新微博：62', 1, 1537164884);
INSERT INTO `ot_action_log` VALUES (255, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-17 14:24登录了账号', 1, 1537165440);
INSERT INTO `ot_action_log` VALUES (256, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-17 14:43登录了账号', 1, 1537166634);
INSERT INTO `ot_action_log` VALUES (257, 10001, 0, 2130706433, 'weibo', 63, '在2018-09-17 14:57发布了新微博：63', 1, 1537167475);
INSERT INTO `ot_action_log` VALUES (258, 10001, 0, 2130706433, 'weibo', 64, '在2018-09-17 15:00发布了新微博：64', 1, 1537167631);
INSERT INTO `ot_action_log` VALUES (259, 10001, 0, 2130706433, 'weibo', 65, '在2018-09-17 15:01发布了新微博：65', 1, 1537167702);
INSERT INTO `ot_action_log` VALUES (260, 10001, 1, 2130706433, 'weibo', 66, 'admin在2018-09-17 15:07发布了新微博：66【积分：+1分】', 1, 1537168061);
INSERT INTO `ot_action_log` VALUES (261, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-17 17:39登录了账号', 1, 1537177157);
INSERT INTO `ot_action_log` VALUES (262, 10001, 1, 2130706433, 'weibo', 67, 'admin在2018-09-17 17:44发布了新微博：67【积分：+1分】', 1, 1537177479);
INSERT INTO `ot_action_log` VALUES (263, 10001, 0, 2130706433, 'weibo', 68, '在2018-09-17 17:48发布了新微博：68', 1, 1537177722);
INSERT INTO `ot_action_log` VALUES (264, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-18 09:23登录了账号', 1, 1537233828);
INSERT INTO `ot_action_log` VALUES (265, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-18 10:25登录了账号', 1, 1537237513);
INSERT INTO `ot_action_log` VALUES (266, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-18 11:35登录了账号', 1, 1537241747);
INSERT INTO `ot_action_log` VALUES (267, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-18 12:36登录了账号', 1, 1537245418);
INSERT INTO `ot_action_log` VALUES (268, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-18 12:57登录了账号', 1, 1537246670);
INSERT INTO `ot_action_log` VALUES (269, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-18 13:25登录了账号', 1, 1537248327);
INSERT INTO `ot_action_log` VALUES (270, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-18 14:03登录了账号', 1, 1537250636);
INSERT INTO `ot_action_log` VALUES (271, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-19 09:35登录了账号', 1, 1537320903);
INSERT INTO `ot_action_log` VALUES (272, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-19 11:19登录了账号', 1, 1537327143);
INSERT INTO `ot_action_log` VALUES (273, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-19 12:23登录了账号', 1, 1537331039);
INSERT INTO `ot_action_log` VALUES (274, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-19 13:45登录了账号', 1, 1537335944);
INSERT INTO `ot_action_log` VALUES (275, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-19 14:17登录了账号', 1, 1537337857);
INSERT INTO `ot_action_log` VALUES (276, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-19 15:06登录了账号', 1, 1537340801);
INSERT INTO `ot_action_log` VALUES (277, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-19 15:56登录了账号', 1, 1537343766);
INSERT INTO `ot_action_log` VALUES (278, 10001, 1, 2130706433, 'weibo', 69, 'admin在2018-09-19 15:56发布了新微博：69【积分：+1分】', 1, 1537343781);
INSERT INTO `ot_action_log` VALUES (279, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-20 13:46登录了账号', 1, 1537422364);
INSERT INTO `ot_action_log` VALUES (280, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-20 13:58登录了账号', 1, 1537423093);
INSERT INTO `ot_action_log` VALUES (281, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-20 14:27登录了账号', 1, 1537424847);
INSERT INTO `ot_action_log` VALUES (282, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-20 15:23登录了账号', 1, 1537428218);
INSERT INTO `ot_action_log` VALUES (283, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-21 09:35登录了账号', 1, 1537493712);
INSERT INTO `ot_action_log` VALUES (284, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-21 14:22登录了账号', 1, 1537510930);
INSERT INTO `ot_action_log` VALUES (285, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-25 16:05登录了账号【积分：+10分】', 1, 1537862707);
INSERT INTO `ot_action_log` VALUES (286, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-25 16:33登录了账号', 1, 1537864417);
INSERT INTO `ot_action_log` VALUES (287, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-25 16:58登录了账号', 1, 1537865886);
INSERT INTO `ot_action_log` VALUES (288, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-26 09:43登录了账号', 1, 1537926220);
INSERT INTO `ot_action_log` VALUES (289, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-26 11:54登录了账号', 1, 1537934052);
INSERT INTO `ot_action_log` VALUES (290, 10001, 0, 2130706433, 'weibo', 70, '在2018-09-26 12:38发布了新微博：70', 1, 1537936724);
INSERT INTO `ot_action_log` VALUES (291, 10001, 0, 2130706433, 'weibo', 71, '在2018-09-26 12:39发布了新微博：71', 1, 1537936761);
INSERT INTO `ot_action_log` VALUES (292, 10001, 101, 2130706433, 'weibo', 73, 'wangdi在2018-09-26 15:59发布了新微博：73【积分：+1分】', 1, 1537948762);
INSERT INTO `ot_action_log` VALUES (293, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-26 16:35登录了账号', 1, 1537950956);
INSERT INTO `ot_action_log` VALUES (294, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-26 16:48登录了账号', 1, 1537951681);
INSERT INTO `ot_action_log` VALUES (295, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-27 09:49登录了账号', 1, 1538012998);
INSERT INTO `ot_action_log` VALUES (296, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-27 10:17登录了账号', 1, 1538014632);
INSERT INTO `ot_action_log` VALUES (297, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-27 11:25登录了账号', 1, 1538018710);
INSERT INTO `ot_action_log` VALUES (298, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-27 13:09登录了账号', 1, 1538024980);
INSERT INTO `ot_action_log` VALUES (299, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-27 14:10登录了账号', 1, 1538028624);
INSERT INTO `ot_action_log` VALUES (300, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-27 15:55登录了账号', 1, 1538034948);
INSERT INTO `ot_action_log` VALUES (301, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-29 10:21登录了账号【积分：+10分】', 1, 1538187687);
INSERT INTO `ot_action_log` VALUES (302, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-29 11:09登录了账号', 1, 1538190542);
INSERT INTO `ot_action_log` VALUES (303, 10001, 101, 2130706433, 'weibo', 74, 'wangdi在2018-09-29 12:14发布了新微博：74【积分：+1分】', 1, 1538194443);
INSERT INTO `ot_action_log` VALUES (304, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-29 13:21登录了账号', 1, 1538198464);
INSERT INTO `ot_action_log` VALUES (305, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-29 13:33登录了账号', 1, 1538199212);
INSERT INTO `ot_action_log` VALUES (306, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-29 14:12登录了账号', 1, 1538201560);
INSERT INTO `ot_action_log` VALUES (307, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-30 15:51登录了账号【积分：+10分】', 1, 1538293863);
INSERT INTO `ot_action_log` VALUES (308, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-30 16:02登录了账号', 1, 1538294548);
INSERT INTO `ot_action_log` VALUES (309, 3, 1, 2130706433, 'member', 1, 'admin在2018-09-30 16:12登录了账号', 1, 1538295177);
INSERT INTO `ot_action_log` VALUES (310, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-08 09:44登录了账号', 1, 1538963085);
INSERT INTO `ot_action_log` VALUES (311, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-08 09:44登录了账号', 1, 1538963093);
INSERT INTO `ot_action_log` VALUES (312, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-08 10:08登录了账号', 1, 1538964520);
INSERT INTO `ot_action_log` VALUES (313, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-08 10:35登录了账号', 1, 1538966130);
INSERT INTO `ot_action_log` VALUES (314, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-08 10:58登录了账号', 1, 1538967495);
INSERT INTO `ot_action_log` VALUES (315, 8, 1, 2130706433, 'Menu', 10002, '操作url：/admin.php?s=/menu/edit.html', 1, 1538967661);
INSERT INTO `ot_action_log` VALUES (316, 8, 1, 2130706433, 'Menu', 10005, '操作url：/admin.php?s=/menu/edit.html', 1, 1538967725);
INSERT INTO `ot_action_log` VALUES (317, 8, 1, 2130706433, 'Menu', 10009, '操作url：/admin.php?s=/menu/edit.html', 1, 1538967735);
INSERT INTO `ot_action_log` VALUES (318, 8, 1, 2130706433, 'Menu', 10011, '操作url：/admin.php?s=/menu/edit.html', 1, 1538967749);
INSERT INTO `ot_action_log` VALUES (319, 8, 1, 2130706433, 'Menu', 10012, '操作url：/admin.php?s=/menu/edit.html', 1, 1538967757);
INSERT INTO `ot_action_log` VALUES (320, 8, 1, 2130706433, 'Menu', 10013, '操作url：/admin.php?s=/menu/edit.html', 1, 1538967767);
INSERT INTO `ot_action_log` VALUES (321, 8, 1, 2130706433, 'Menu', 10014, '操作url：/admin.php?s=/menu/edit.html', 1, 1538967779);
INSERT INTO `ot_action_log` VALUES (322, 8, 1, 2130706433, 'Menu', 10003, '操作url：/admin.php?s=/menu/edit.html', 1, 1538967790);
INSERT INTO `ot_action_log` VALUES (323, 8, 1, 2130706433, 'Menu', 10007, '操作url：/admin.php?s=/menu/edit.html', 1, 1538967800);
INSERT INTO `ot_action_log` VALUES (324, 8, 1, 2130706433, 'Menu', 10003, '操作url：/admin.php?s=/menu/edit.html', 1, 1538967990);
INSERT INTO `ot_action_log` VALUES (325, 8, 1, 2130706433, 'Menu', 10007, '操作url：/admin.php?s=/menu/edit.html', 1, 1538967998);
INSERT INTO `ot_action_log` VALUES (326, 8, 1, 2130706433, 'Menu', 10042, '操作url：/admin.php?s=/menu/edit.html', 1, 1538969151);
INSERT INTO `ot_action_log` VALUES (327, 8, 1, 2130706433, 'Menu', 10024, '操作url：/admin.php?s=/menu/edit.html', 1, 1538969160);
INSERT INTO `ot_action_log` VALUES (328, 8, 1, 2130706433, 'Menu', 10040, '操作url：/admin.php?s=/menu/edit.html', 1, 1538969195);
INSERT INTO `ot_action_log` VALUES (329, 8, 1, 2130706433, 'Menu', 10056, '操作url：/admin.php?s=/menu/add.html', 1, 1538969363);
INSERT INTO `ot_action_log` VALUES (330, 8, 1, 2130706433, 'Menu', 10057, '操作url：/admin.php?s=/menu/add.html', 1, 1538969617);
INSERT INTO `ot_action_log` VALUES (331, 8, 1, 2130706433, 'Menu', 10057, '操作url：/admin.php?s=/menu/edit.html', 1, 1538969645);
INSERT INTO `ot_action_log` VALUES (332, 8, 1, 2130706433, 'Menu', 10057, '操作url：/admin.php?s=/menu/edit.html', 1, 1538970039);
INSERT INTO `ot_action_log` VALUES (333, 8, 1, 2130706433, 'Menu', 10057, '操作url：/admin.php?s=/menu/edit.html', 1, 1538970049);
INSERT INTO `ot_action_log` VALUES (334, 8, 1, 2130706433, 'Menu', 10058, '操作url：/admin.php?s=/menu/edit.html', 1, 1538970232);
INSERT INTO `ot_action_log` VALUES (335, 8, 1, 2130706433, 'Menu', 10059, '操作url：/admin.php?s=/menu/edit.html', 1, 1538970274);
INSERT INTO `ot_action_log` VALUES (336, 8, 1, 2130706433, 'Menu', 10063, '操作url：/admin.php?s=/menu/edit.html', 1, 1538970298);
INSERT INTO `ot_action_log` VALUES (337, 8, 1, 2130706433, 'Menu', 10066, '操作url：/admin.php?s=/menu/edit.html', 1, 1538970314);
INSERT INTO `ot_action_log` VALUES (338, 8, 1, 2130706433, 'Menu', 10072, '操作url：/admin.php?s=/menu/add.html', 1, 1538970479);
INSERT INTO `ot_action_log` VALUES (339, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-08 13:20登录了账号', 1, 1538976020);
INSERT INTO `ot_action_log` VALUES (340, 3, 100, 2130706433, 'member', 100, 'Vonder在2018-10-08 13:27登录了账号【积分：+10分】', 1, 1538976438);
INSERT INTO `ot_action_log` VALUES (341, 8, 100, 2130706433, 'Menu', 10074, '操作url：/admin.php?s=/menu/edit.html', 1, 1538976987);
INSERT INTO `ot_action_log` VALUES (342, 8, 100, 2130706433, 'Menu', 10078, '操作url：/admin.php?s=/menu/edit.html', 1, 1538977002);
INSERT INTO `ot_action_log` VALUES (343, 8, 100, 2130706433, 'Menu', 10073, '操作url：/admin.php?s=/menu/edit.html', 1, 1538977560);
INSERT INTO `ot_action_log` VALUES (344, 8, 100, 2130706433, 'Menu', 10080, '操作url：/admin.php?s=/menu/edit.html', 1, 1538977729);
INSERT INTO `ot_action_log` VALUES (345, 8, 100, 2130706433, 'Menu', 10087, '操作url：/admin.php?s=/menu/add.html', 1, 1538977788);
INSERT INTO `ot_action_log` VALUES (346, 8, 100, 2130706433, 'Menu', 10087, '操作url：/admin.php?s=/menu/edit.html', 1, 1538977804);
INSERT INTO `ot_action_log` VALUES (347, 8, 100, 2130706433, 'Menu', 10081, '操作url：/admin.php?s=/menu/edit.html', 1, 1538977830);
INSERT INTO `ot_action_log` VALUES (348, 8, 100, 2130706433, 'Menu', 10087, '操作url：/admin.php?s=/menu/edit.html', 1, 1538977918);
INSERT INTO `ot_action_log` VALUES (349, 8, 100, 2130706433, 'Menu', 10088, '操作url：/admin.php?s=/menu/add.html', 1, 1538978012);
INSERT INTO `ot_action_log` VALUES (350, 8, 100, 2130706433, 'Menu', 10091, '操作url：/admin.php?s=/menu/add.html', 1, 1538978427);
INSERT INTO `ot_action_log` VALUES (351, 8, 100, 2130706433, 'Menu', 10088, '操作url：/admin.php?s=/menu/edit.html', 1, 1538978850);
INSERT INTO `ot_action_log` VALUES (352, 3, 100, 2130706433, 'member', 100, '好Vonder标题在2018-10-08 14:35登录了账号', 1, 1538980509);
INSERT INTO `ot_action_log` VALUES (353, 8, 100, 2130706433, 'Menu', 10088, '操作url：/admin.php?s=/menu/edit.html', 1, 1538980691);
INSERT INTO `ot_action_log` VALUES (354, 8, 100, 2130706433, 'Menu', 10088, '操作url：/admin.php?s=/menu/edit.html', 1, 1538980707);
INSERT INTO `ot_action_log` VALUES (355, 8, 100, 2130706433, 'Menu', 10087, '操作url：/admin.php?s=/menu/edit.html', 1, 1538980963);
INSERT INTO `ot_action_log` VALUES (356, 8, 100, 2130706433, 'Menu', 10088, '操作url：/admin.php?s=/menu/edit.html', 1, 1538980973);
INSERT INTO `ot_action_log` VALUES (357, 8, 100, 2130706433, 'Menu', 10087, '操作url：/admin.php?s=/menu/edit.html', 1, 1538981010);
INSERT INTO `ot_action_log` VALUES (358, 8, 100, 2130706433, 'Menu', 10087, '操作url：/admin.php?s=/menu/edit.html', 1, 1538981034);
INSERT INTO `ot_action_log` VALUES (359, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-08 14:44登录了账号', 1, 1538981086);
INSERT INTO `ot_action_log` VALUES (360, 8, 1, 2130706433, 'Menu', 10087, '操作url：/admin.php?s=/menu/edit.html', 1, 1538981134);
INSERT INTO `ot_action_log` VALUES (361, 8, 1, 2130706433, 'Menu', 10088, '操作url：/admin.php?s=/menu/edit.html', 1, 1538981145);
INSERT INTO `ot_action_log` VALUES (362, 8, 1, 2130706433, 'Menu', 10075, '操作url：/admin.php?s=/menu/edit.html', 1, 1538981158);
INSERT INTO `ot_action_log` VALUES (363, 8, 1, 2130706433, 'Menu', 10079, '操作url：/admin.php?s=/menu/edit.html', 1, 1538981168);
INSERT INTO `ot_action_log` VALUES (364, 8, 1, 2130706433, 'Menu', 10091, '操作url：/admin.php?s=/menu/edit.html', 1, 1538981203);
INSERT INTO `ot_action_log` VALUES (365, 8, 1, 2130706433, 'Menu', 10092, '操作url：/admin.php?s=/menu/add.html', 1, 1538981296);
INSERT INTO `ot_action_log` VALUES (366, 8, 1, 2130706433, 'Menu', 10092, '操作url：/admin.php?s=/menu/edit.html', 1, 1538981306);
INSERT INTO `ot_action_log` VALUES (367, 8, 1, 2130706433, 'Menu', 10091, '操作url：/admin.php?s=/menu/edit.html', 1, 1538981366);
INSERT INTO `ot_action_log` VALUES (368, 8, 1, 2130706433, 'Menu', 10088, '操作url：/admin.php?s=/menu/edit.html', 1, 1538981376);
INSERT INTO `ot_action_log` VALUES (369, 8, 1, 2130706433, 'Menu', 10092, '操作url：/admin.php?s=/menu/edit.html', 1, 1538981386);
INSERT INTO `ot_action_log` VALUES (370, 8, 1, 2130706433, 'Menu', 10075, '操作url：/admin.php?s=/menu/edit.html', 1, 1538981396);
INSERT INTO `ot_action_log` VALUES (371, 8, 1, 2130706433, 'Menu', 10079, '操作url：/admin.php?s=/menu/edit.html', 1, 1538981405);
INSERT INTO `ot_action_log` VALUES (372, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-08 15:06登录了账号', 1, 1538982373);
INSERT INTO `ot_action_log` VALUES (373, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-08 16:02登录了账号', 1, 1538985721);
INSERT INTO `ot_action_log` VALUES (374, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-08 16:43登录了账号', 1, 1538988204);
INSERT INTO `ot_action_log` VALUES (375, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-08 17:14登录了账号', 1, 1538990098);
INSERT INTO `ot_action_log` VALUES (376, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-09 10:01登录了账号', 1, 1539050489);
INSERT INTO `ot_action_log` VALUES (377, 3, 100, 2130706433, 'member', 100, '好Vonder标题在2018-10-09 10:34登录了账号', 1, 1539052454);
INSERT INTO `ot_action_log` VALUES (378, 8, 100, 2130706433, 'Menu', 10093, '操作url：/admin.php?s=/menu/add.html', 1, 1539052546);
INSERT INTO `ot_action_log` VALUES (379, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-09 10:38登录了账号', 1, 1539052696);
INSERT INTO `ot_action_log` VALUES (380, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-09 10:59登录了账号', 1, 1539053960);
INSERT INTO `ot_action_log` VALUES (381, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-09 11:15登录了账号', 1, 1539054902);
INSERT INTO `ot_action_log` VALUES (382, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-09 12:04登录了账号', 1, 1539057887);
INSERT INTO `ot_action_log` VALUES (383, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-09 12:30登录了账号', 1, 1539059419);
INSERT INTO `ot_action_log` VALUES (384, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-09 12:56登录了账号', 1, 1539061009);
INSERT INTO `ot_action_log` VALUES (385, 8, 1, 2130706433, 'Menu', 10094, '操作url：/admin.php?s=/menu/add.html', 1, 1539061780);
INSERT INTO `ot_action_log` VALUES (386, 8, 1, 2130706433, 'Menu', 10094, '操作url：/admin.php?s=/menu/edit.html', 1, 1539061883);
INSERT INTO `ot_action_log` VALUES (387, 11018, 0, 2130706433, 'weibo', 90, '在2018-10-09 13:48发布了新微博：90', 1, 1539064084);
INSERT INTO `ot_action_log` VALUES (388, 11018, 100, 2130706433, 'weibo', 91, '好Vonder标题在2018-10-09 13:48发布了新微博：91【积分：+10分】', 1, 1539064120);
INSERT INTO `ot_action_log` VALUES (389, 11018, 100, 2130706433, 'weibo', 92, '好Vonder标题在2018-10-09 13:51发布了新微博：92【积分：+10分】', 1, 1539064271);
INSERT INTO `ot_action_log` VALUES (390, 11018, 100, 2130706433, 'weibo', 93, '好Vonder标题在2018-10-09 13:51发布了新微博：93【积分：+10分】', 1, 1539064310);
INSERT INTO `ot_action_log` VALUES (391, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-09 13:56登录了账号', 1, 1539064568);
INSERT INTO `ot_action_log` VALUES (392, 11018, 100, 2130706433, 'weibo', 95, '好Vonder标题在2018-10-09 14:09发布了新微博：95【积分：+10分】', 1, 1539065358);
INSERT INTO `ot_action_log` VALUES (393, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-09 14:38登录了账号', 1, 1539067094);
INSERT INTO `ot_action_log` VALUES (394, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-09 14:55登录了账号', 1, 1539068130);
INSERT INTO `ot_action_log` VALUES (395, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-09 17:10登录了账号', 1, 1539076247);
INSERT INTO `ot_action_log` VALUES (396, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-10 09:33登录了账号', 1, 1539135221);
INSERT INTO `ot_action_log` VALUES (397, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-26 14:30登录了账号【积分：+10分】', 1, 1540535405);
INSERT INTO `ot_action_log` VALUES (398, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-26 14:49登录了账号', 1, 1540536583);
INSERT INTO `ot_action_log` VALUES (399, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-26 16:02登录了账号', 1, 1540540923);
INSERT INTO `ot_action_log` VALUES (400, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-29 10:10登录了账号【积分：+10分】', 1, 1540779051);
INSERT INTO `ot_action_log` VALUES (401, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-29 10:42登录了账号', 1, 1540780975);
INSERT INTO `ot_action_log` VALUES (402, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-29 11:35登录了账号', 1, 1540784135);
INSERT INTO `ot_action_log` VALUES (403, 8, 1, 2130706433, 'Menu', 10095, '操作url：/admin.php?s=/menu/add.html', 1, 1540784199);
INSERT INTO `ot_action_log` VALUES (404, 8, 1, 2130706433, 'Menu', 10095, '操作url：/admin.php?s=/menu/edit.html', 1, 1540784248);
INSERT INTO `ot_action_log` VALUES (405, 8, 1, 2130706433, 'Menu', 10096, '操作url：/admin.php?s=/menu/add.html', 1, 1540784311);
INSERT INTO `ot_action_log` VALUES (406, 8, 1, 2130706433, 'Menu', 10097, '操作url：/admin.php?s=/menu/add.html', 1, 1540784477);
INSERT INTO `ot_action_log` VALUES (407, 8, 1, 2130706433, 'Menu', 10097, '操作url：/admin.php?s=/menu/edit.html', 1, 1540784486);
INSERT INTO `ot_action_log` VALUES (408, 8, 1, 2130706433, 'Menu', 10098, '操作url：/admin.php?s=/menu/add.html', 1, 1540784540);
INSERT INTO `ot_action_log` VALUES (409, 8, 1, 2130706433, 'Menu', 10099, '操作url：/admin.php?s=/menu/add.html', 1, 1540784815);
INSERT INTO `ot_action_log` VALUES (410, 8, 1, 2130706433, 'Menu', 0, '操作url：/admin.php?s=/menu/del/id/10091.html', 1, 1540785299);
INSERT INTO `ot_action_log` VALUES (411, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-29 12:47登录了账号', 1, 1540788477);
INSERT INTO `ot_action_log` VALUES (412, 8, 1, 2130706433, 'Menu', 10100, '操作url：/admin.php?s=/menu/add.html', 1, 1540788624);
INSERT INTO `ot_action_log` VALUES (413, 8, 1, 2130706433, 'Menu', 10101, '操作url：/admin.php?s=/menu/add.html', 1, 1540788679);
INSERT INTO `ot_action_log` VALUES (414, 8, 1, 2130706433, 'Menu', 10100, '操作url：/admin.php?s=/menu/edit.html', 1, 1540789151);
INSERT INTO `ot_action_log` VALUES (415, 3, 1, 2130706433, 'member', 1, 'admin在2018-10-29 13:23登录了账号', 1, 1540790632);
INSERT INTO `ot_action_log` VALUES (416, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-01 10:44登录了账号【积分：+10分】', 1, 1541040267);
INSERT INTO `ot_action_log` VALUES (417, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-02 11:43登录了账号【积分：+10分】', 1, 1541130189);
INSERT INTO `ot_action_log` VALUES (418, 8, 1, 2130706433, 'Menu', 10102, '操作url：/admin.php?s=/menu/add.html', 1, 1541131251);
INSERT INTO `ot_action_log` VALUES (419, 8, 1, 2130706433, 'Menu', 10102, '操作url：/admin.php?s=/menu/edit.html', 1, 1541131270);
INSERT INTO `ot_action_log` VALUES (420, 8, 1, 2130706433, 'Menu', 10103, '操作url：/admin.php?s=/menu/add.html', 1, 1541131311);
INSERT INTO `ot_action_log` VALUES (421, 8, 1, 2130706433, 'Menu', 10104, '操作url：/admin.php?s=/menu/add.html', 1, 1541131383);
INSERT INTO `ot_action_log` VALUES (422, 8, 1, 2130706433, 'Menu', 10104, '操作url：/admin.php?s=/menu/edit.html', 1, 1541131428);
INSERT INTO `ot_action_log` VALUES (423, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-07 11:24登录了账号【积分：+10分】', 1, 1541561040);
INSERT INTO `ot_action_log` VALUES (424, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-07 11:34登录了账号', 1, 1541561685);
INSERT INTO `ot_action_log` VALUES (425, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-07 12:27登录了账号', 1, 1541564843);
INSERT INTO `ot_action_log` VALUES (426, 8, 1, 2130706433, 'Menu', 10105, '操作url：/admin.php?s=/menu/add.html', 1, 1541565613);
INSERT INTO `ot_action_log` VALUES (427, 8, 1, 2130706433, 'Menu', 0, '操作url：/admin.php?s=/menu/del/id/10018.html', 1, 1541565695);
INSERT INTO `ot_action_log` VALUES (428, 8, 1, 2130706433, 'Menu', 0, '操作url：/admin.php?s=/menu/del/id/10020.html', 1, 1541565701);
INSERT INTO `ot_action_log` VALUES (429, 8, 1, 2130706433, 'Menu', 0, '操作url：/admin.php?s=/menu/del/id/10022.html', 1, 1541565703);
INSERT INTO `ot_action_log` VALUES (430, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-07 13:10登录了账号', 1, 1541567400);
INSERT INTO `ot_action_log` VALUES (431, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-07 13:44登录了账号', 1, 1541569497);
INSERT INTO `ot_action_log` VALUES (432, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-07 14:44登录了账号', 1, 1541573080);
INSERT INTO `ot_action_log` VALUES (433, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-07 15:12登录了账号', 1, 1541574757);
INSERT INTO `ot_action_log` VALUES (434, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-07 16:24登录了账号', 1, 1541579049);
INSERT INTO `ot_action_log` VALUES (435, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-12 09:56登录了账号【积分：+10分】', 1, 1541987764);
INSERT INTO `ot_action_log` VALUES (436, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-12 10:30登录了账号', 1, 1541989812);
INSERT INTO `ot_action_log` VALUES (437, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-12 13:03登录了账号', 1, 1541999027);
INSERT INTO `ot_action_log` VALUES (438, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-12 13:42登录了账号', 1, 1542001348);
INSERT INTO `ot_action_log` VALUES (439, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-12 14:05登录了账号', 1, 1542002739);
INSERT INTO `ot_action_log` VALUES (440, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-12 14:20登录了账号', 1, 1542003614);
INSERT INTO `ot_action_log` VALUES (441, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-12 14:56登录了账号', 1, 1542005783);
INSERT INTO `ot_action_log` VALUES (442, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-12 15:30登录了账号', 1, 1542007821);
INSERT INTO `ot_action_log` VALUES (443, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-12 16:09登录了账号', 1, 1542010141);
INSERT INTO `ot_action_log` VALUES (444, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-12 16:25登录了账号', 1, 1542011141);
INSERT INTO `ot_action_log` VALUES (445, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-12 17:05登录了账号', 1, 1542013535);
INSERT INTO `ot_action_log` VALUES (446, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-12 17:56登录了账号', 1, 1542016583);
INSERT INTO `ot_action_log` VALUES (447, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-13 10:12登录了账号', 1, 1542075174);
INSERT INTO `ot_action_log` VALUES (448, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-13 10:34登录了账号', 1, 1542076455);
INSERT INTO `ot_action_log` VALUES (449, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-14 09:59登录了账号', 1, 1542160762);
INSERT INTO `ot_action_log` VALUES (450, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-15 11:12登录了账号【积分：+10分】', 1, 1542251571);
INSERT INTO `ot_action_log` VALUES (451, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-15 12:07登录了账号', 1, 1542254863);
INSERT INTO `ot_action_log` VALUES (452, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-15 12:25登录了账号', 1, 1542255934);
INSERT INTO `ot_action_log` VALUES (453, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-15 12:58登录了账号', 1, 1542257909);
INSERT INTO `ot_action_log` VALUES (454, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-15 15:32登录了账号', 1, 1542267169);
INSERT INTO `ot_action_log` VALUES (455, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-15 17:11登录了账号', 1, 1542273118);
INSERT INTO `ot_action_log` VALUES (456, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-15 17:40登录了账号', 1, 1542274808);
INSERT INTO `ot_action_log` VALUES (457, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-15 18:07登录了账号', 1, 1542276471);
INSERT INTO `ot_action_log` VALUES (458, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-16 09:51登录了账号', 1, 1542333066);
INSERT INTO `ot_action_log` VALUES (459, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-16 10:18登录了账号', 1, 1542334693);
INSERT INTO `ot_action_log` VALUES (460, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-16 10:35登录了账号', 1, 1542335708);
INSERT INTO `ot_action_log` VALUES (461, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-16 11:42登录了账号', 1, 1542339760);
INSERT INTO `ot_action_log` VALUES (462, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-16 12:01登录了账号', 1, 1542340881);
INSERT INTO `ot_action_log` VALUES (463, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-16 15:18登录了账号', 1, 1542352704);
INSERT INTO `ot_action_log` VALUES (464, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-16 16:28登录了账号', 1, 1542356931);
INSERT INTO `ot_action_log` VALUES (465, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-19 09:39登录了账号【积分：+10分】', 1, 1542591581);
INSERT INTO `ot_action_log` VALUES (466, 11018, 1, 2130706433, 'weibo', 112, 'admin在2018-11-19 13:15发布了新微博：112【积分：+10分】', 1, 1542604520);
INSERT INTO `ot_action_log` VALUES (467, 11018, 1, 2130706433, 'weibo', 113, 'admin在2018-11-19 13:18发布了新微博：113【积分：+10分】', 1, 1542604688);
INSERT INTO `ot_action_log` VALUES (468, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-20 10:17登录了账号【积分：+10分】', 1, 1542680228);
INSERT INTO `ot_action_log` VALUES (469, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-20 11:21登录了账号', 1, 1542684062);
INSERT INTO `ot_action_log` VALUES (470, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-20 15:01登录了账号', 1, 1542697286);
INSERT INTO `ot_action_log` VALUES (471, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-20 16:18登录了账号', 1, 1542701918);
INSERT INTO `ot_action_log` VALUES (472, 3, 1, 2130706433, 'member', 1, 'admin在2018-11-20 17:47登录了账号', 1, 1542707260);

-- ----------------------------
-- Table structure for ot_addons
-- ----------------------------
DROP TABLE IF EXISTS `ot_addons`;
CREATE TABLE `ot_addons`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  `config` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '配置',
  `author` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '作者',
  `version` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '版本号',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '安装时间',
  `has_adminlist` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否有后台列表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '插件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_addons
-- ----------------------------
INSERT INTO `ot_addons` VALUES (7, 'CheckIn', '签到', '签到插件', 1, '{\"random\":\"1\"}', 'xjw129xjt(肖骏涛)', '0.1', 1432791968, 0);
INSERT INTO `ot_addons` VALUES (8, 'Support', '赞', '赞的功能', 1, 'null', '嘉兴想天信息科技有限公司', '0.1', 1432792013, 0);
INSERT INTO `ot_addons` VALUES (9, 'SuperLinks', '合作单位', '合作单位', 1, '{\"random\":\"1\"}', '苏南 newsn.net', '0.1', 1432792019, 1);
INSERT INTO `ot_addons` VALUES (10, 'Report', '举报后台', '可举报不法数据', 1, '{\"meta\":\"\"}', '想天科技xuminwei', '0.1', 1432792026, 1);
INSERT INTO `ot_addons` VALUES (11, 'LocalComment', '本地评论', '本地评论插件，不依赖社会化评论平台', 1, '{\"can_guest_comment\":\"0\"}', 'caipeichao', '0.1', 1432792035, 0);
INSERT INTO `ot_addons` VALUES (12, 'ChinaCity', '中国省市区三级联动', '每个系统都需要的一个中国省市区三级联动插件。想天-駿濤修改，将镇级地区移除', 1, 'null', 'i友街', '2.0', 1432792040, 0);
INSERT INTO `ot_addons` VALUES (13, 'Recommend', '推荐关注', '可选择多种方法推荐用户', 1, '{\"howToRecommend\":\"1\",\"howManyRecommend\":\"1\",\"recommendUser\":\"1\"}', '嘉兴想天信息科技有限公司', '0.1', 1432792055, 1);
INSERT INTO `ot_addons` VALUES (14, 'SyncLogin', '同步登陆', '同步登陆', 1, '{\"type\":null,\"meta\":\"\",\"bind\":\"0\",\"QqKEY\":\"\",\"QqSecret\":\"\",\"SinaKEY\":\"\",\"SinaSecret\":\"\",\"WeixinKEY\":\"\",\"WeixinSecret\":\"\"}', 'xjw129xjt', '0.1', 1432792112, 0);

-- ----------------------------
-- Table structure for ot_adv
-- ----------------------------
DROP TABLE IF EXISTS `ot_adv`;
CREATE TABLE `ot_adv`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '广告名称',
  `pos_id` int(11) NOT NULL COMMENT '广告位置',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
  `click_count` int(11) NOT NULL COMMENT '点击量',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接地址',
  `sort` int(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态（0：禁用，1：正常）',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '开始时间',
  `start_time` int(11) NULL DEFAULT NULL,
  `end_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '结束时间',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '_blank',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10012 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_adv
-- ----------------------------
INSERT INTO `ot_adv` VALUES (10000, '个人资料下方的广告 09月04日 添加', 10002, '{\"pic\":5,\"target\":\"_blank\"}', 0, 'www.baidu.com', 1, 1, 1536032366, 1536032366, 1536637166, '_blank');
INSERT INTO `ot_adv` VALUES (10001, '是个好广告', 10004, '{\"pic\":5,\"target\":\"_blank\"}', 0, '', 1, 1, 1536039505, 1536039505, 1538319300, '_blank');
INSERT INTO `ot_adv` VALUES (10002, 'VIGI', 10002, '{\"pic\":5,\"target\":\"_blank\"}', 0, 'www.baidu.com', 1, 1, 1536214777, 1536214777, 1536819577, '_blank');
INSERT INTO `ot_adv` VALUES (10003, '好吧~', 10004, '{\"pic\":5,\"target\":\"_blank\"}', 0, 'www.baidu.com', 1, 1, 1536215161, 1536215161, 1538322900, '_blank');
INSERT INTO `ot_adv` VALUES (10010, '准许', 10003, '{\"pic\":0,\"target\":\"_blank\"}', 0, '', 2, 1, 1539068939, 1536565677, 1537170477, '_blank');
INSERT INTO `ot_adv` VALUES (10009, '萨达', 10003, '{\"pic\":0,\"target\":\"_blank\"}', 0, '', 1, 1, 1539068939, 1536565677, 1537170477, '_blank');
INSERT INTO `ot_adv` VALUES (10008, 'VIGI', 10003, '{\"pic\":5,\"target\":\"_blank\"}', 0, '', 0, 1, 1539068939, 1536565677, 1537170477, '_blank');
INSERT INTO `ot_adv` VALUES (10011, '巴生港发', 10003, '{\"pic\":0,\"target\":\"_blank\"}', 0, '', 3, 1, 1539068939, 1536565677, 1537170477, '_blank');

-- ----------------------------
-- Table structure for ot_adv_pos
-- ----------------------------
DROP TABLE IF EXISTS `ot_adv_pos`;
CREATE TABLE `ot_adv_pos`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '广告位置名称',
  `path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所在路径 模块/控制器/方法',
  `type` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT '广告位类型 \r\n1.单图\r\n2.多图\r\n3.文字链接\r\n4.代码',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态（0：禁用，1：正常）',
  `data` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '额外的数据',
  `width` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '广告位置宽度',
  `height` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '广告位置高度',
  `margin` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '边缘',
  `padding` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留白',
  `theme` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'all' COMMENT '适用主题，默认为all，通用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10006 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告位置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_adv_pos
-- ----------------------------
INSERT INTO `ot_adv_pos` VALUES (10002, 'weibo', '作品', 'Weibo/Index/search', 2, 1, '{\"style\":1}', '', '', '', '', 'all');
INSERT INTO `ot_adv_pos` VALUES (10003, 'industry', '行业', 'Weibo/Index/search', 2, 1, '{\"style\":1}', '', '', '', '', 'all');
INSERT INTO `ot_adv_pos` VALUES (10004, 'organization', '机构', 'Weibo/Index/index', 2, 1, '{\"style\":1}', '', '', '', '', 'all');
INSERT INTO `ot_adv_pos` VALUES (10005, 'player', '飞手', 'Weibo/Index/index', 2, 1, '{\"style\":1}', '', '', '', '', 'all');

-- ----------------------------
-- Table structure for ot_announce
-- ----------------------------
DROP TABLE IF EXISTS `ot_announce`;
CREATE TABLE `ot_announce`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_force` tinyint(4) NOT NULL COMMENT '是否强制推送',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `link` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `arrive` int(11) NOT NULL DEFAULT 0,
  `manage` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_announce
-- ----------------------------
INSERT INTO `ot_announce` VALUES (1, '我要发公告', 1, '', '<p>我要发公告我要发公告我要发公告我要发公告我要发公告我要发公告我要发公告我要发公告</p>', '', 1, 1532406913, 1533011713, 0, 1, 1);
INSERT INTO `ot_announce` VALUES (2, 'test', 1, '', '<p>test<br/></p><p>test test</p>', 'http://www.baidu.com/', 1, 1535033833, 1535638633, 10, 1, 1);
INSERT INTO `ot_announce` VALUES (3, 'test', 1, '', '<p>测试test</p>', '', 1, 1535967633, 1538322900, 0, 3, 1);
INSERT INTO `ot_announce` VALUES (4, '发布公告', 1, '', '<p>发布公告发布公告发布公告发布公告发布公告发布公告发布公告</p>', '', 1, 1537951685, 1543593300, 1, 1, 1);
INSERT INTO `ot_announce` VALUES (5, '123', 1, '', '<p>123</p>', '123', 1, 1537952668, 1538557468, 0, 1, 1);
INSERT INTO `ot_announce` VALUES (6, '公告', 1, '', '<p>就是跳转而已</p>', 'http://www.baidu.com', 1, 1539062365, 1555761300, 12, 1, 1);
INSERT INTO `ot_announce` VALUES (7, 'test测试', 1, '', '<p>test测试test测试test测试test测试</p>', '', 1, 1542337705, 1546272000, 0, 0, 1);
INSERT INTO `ot_announce` VALUES (8, 'CEHIS ASD', 1, '', '<p>ASDFGHJK</p><p><img src alt=\"5ba1b80e488ca.png\"/></p>', '', 1, 1542339766, 1542944565, 0, 0, 1);

-- ----------------------------
-- Table structure for ot_announce_arrive
-- ----------------------------
DROP TABLE IF EXISTS `ot_announce_arrive`;
CREATE TABLE `ot_announce_arrive`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `announce_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告确认记录' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of ot_announce_arrive
-- ----------------------------
INSERT INTO `ot_announce_arrive` VALUES (1, 1, 1, 1532406954);
INSERT INTO `ot_announce_arrive` VALUES (2, 1, 2, 1535033902);
INSERT INTO `ot_announce_arrive` VALUES (3, 1, 3, 1535967668);
INSERT INTO `ot_announce_arrive` VALUES (4, 100, 3, 1536026121);
INSERT INTO `ot_announce_arrive` VALUES (5, 101, 3, 1536544992);
INSERT INTO `ot_announce_arrive` VALUES (6, 1, 4, 1537952855);
INSERT INTO `ot_announce_arrive` VALUES (7, 1, 5, 1537952911);
INSERT INTO `ot_announce_arrive` VALUES (8, 1, 6, 1539062422);

-- ----------------------------
-- Table structure for ot_attachment
-- ----------------------------
DROP TABLE IF EXISTS `ot_attachment`;
CREATE TABLE `ot_attachment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `title` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '附件类型',
  `source` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '资源ID',
  `record_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联记录ID',
  `download` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '下载次数',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '附件大小',
  `dir` int(12) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级目录ID',
  `sort` int(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_record_status`(`record_id`, `status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ot_attest
-- ----------------------------
DROP TABLE IF EXISTS `ot_attest`;
CREATE TABLE `ot_attest`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `attest_type_id` int(11) NOT NULL COMMENT '认证类型id',
  `child_type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '认证称号',
  `company_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司名',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `id_num` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号码',
  `phone` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系方式',
  `image_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件类型',
  `prove_image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业证明、组织证明材料图片ids',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证正反面照ids',
  `other_image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手持身份证或其他证明材料',
  `info` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '认证补充',
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '认证失败原因',
  `status` tinyint(4) NOT NULL COMMENT '认证状态',
  `create_time` int(11) NOT NULL COMMENT '发起认证时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '认证表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_attest
-- ----------------------------
INSERT INTO `ot_attest` VALUES (1, 1, 1, '优秀二次开发者', '', '王迪', '511602199808111115', '18140191539', '身份证', '', '5', '', '', '不是暗示打算啊撒旦啊', -1, 1536225987, 1536225987);
INSERT INTO `ot_attest` VALUES (2, 1, 1, '优秀二次开发者', '', '王迪', '511602199808111115', '18140191539', '身份证', '', '5', '', '', '身份证审核不通过', -1, 1536226085, 1536226085);

-- ----------------------------
-- Table structure for ot_attest_type
-- ----------------------------
DROP TABLE IF EXISTS `ot_attest_type`;
CREATE TABLE `ot_attest_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '认证类型标识',
  `title` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `logo` int(11) NOT NULL COMMENT '图标',
  `privilege` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '特权标识，1：专属认证图标；2：优先推荐；3：各类特权',
  `conditions` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '条件，avatar：1；phone：1；follow：30；fans：30；friends：2',
  `fields` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段配置',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '认证说明',
  `tips` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '认证小提示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '认证类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_attest_type
-- ----------------------------
INSERT INTO `ot_attest_type` VALUES (1, 'personal', '个人认证', 0, '1,2,3', 'avatar:1|phone:0|follow:0|fans:0|friends:0', 'child_type:1|child_type_option:优秀二次开发者,网红，优秀站长，主播|company_name:0|name:1|id_num:1|phone:1|image_type:1|image_type_option:身份证，驾驶证|prove_image:0|image:1|other_image:2|other_image_tip:请上传手持身份证高清正面照|info:2', 1, '<p><span style=\"color: rgb(255, 0, 0);line-height:30px;\">请详细阅读本说明</span></p><p>1.信息必须真实</p><p>2.证件必须清晰可见</p><p>3.信息必须真实</p><p>4.信息必须真实</p><p>5.信息必须真实</p>', '真实身份，易于被辨识 更加权威，提高可信度');
INSERT INTO `ot_attest_type` VALUES (2, 'organization', '组织机构认证', 0, '1,2,3', 'avatar:1|phone:0|follow:0|fans:0|friends:0', 'child_type:1|child_type_option:盈利机构，公益机构|company_name:1|name:2|id_num:2|phone:1|image_type:1|image_type_option:组织机构代码证|prove_image:1|image:0|other_image:2|other_image_tip:请上传代表人的个人身份证、手持身份证高清正面照和其他证明材料|info:2', 1, '<p style=\"white-space: normal;\"><span style=\"color: rgb(255, 0, 0); line-height: 30px;\">请详细阅读本说明</span></p><p style=\"white-space: normal;\">1.信息必须真实</p><p style=\"white-space: normal;\">2.证件必须清晰可见</p><p style=\"white-space: normal;\">3.信息必须真实</p><p style=\"white-space: normal;\">4.信息必须真实</p><p style=\"white-space: normal;\">5.信息必须真实</p><p><br/></p>', '真实身份，易于被辨识 更加权威，提高可信度');
INSERT INTO `ot_attest_type` VALUES (3, 'company', '企业认证', 0, '1,2,3', 'avatar:1|phone:1|follow:50|fans:30|friends:5', 'child_type:1|child_type_option:大型企业，中型企业，小型企业，微型企业|company_name:1|name:2|id_num:2|phone:1|image_type:1|image_type_option:组织机构代码证|prove_image:1|image:0|other_image:2|other_image_tip:请上传其他证明材料|info:2', 1, '<p style=\"white-space: normal;\"><span style=\"color: rgb(255, 0, 0); line-height: 30px;\">请详细阅读本说明</span></p><p style=\"white-space: normal;\">1.信息必须真实</p><p style=\"white-space: normal;\">2.证件必须清晰可见</p><p style=\"white-space: normal;\">3.信息必须真实</p><p style=\"white-space: normal;\">4.信息必须真实</p><p style=\"white-space: normal;\">5.信息必须真实</p><p><br/></p>', '真实身份，易于被辨识 更加权威，提高可信度');

-- ----------------------------
-- Table structure for ot_auth_extend
-- ----------------------------
DROP TABLE IF EXISTS `ot_auth_extend`;
CREATE TABLE `ot_auth_extend`  (
  `group_id` mediumint(10) UNSIGNED NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) UNSIGNED NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE INDEX `group_extend_type`(`group_id`, `extend_id`, `type`) USING BTREE,
  INDEX `uid`(`group_id`) USING BTREE,
  INDEX `group_id`(`extend_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限组与分类的对应关系表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of ot_auth_extend
-- ----------------------------
INSERT INTO `ot_auth_extend` VALUES (1, 1, 1);
INSERT INTO `ot_auth_extend` VALUES (1, 1, 2);
INSERT INTO `ot_auth_extend` VALUES (1, 2, 1);
INSERT INTO `ot_auth_extend` VALUES (1, 2, 2);
INSERT INTO `ot_auth_extend` VALUES (1, 3, 1);
INSERT INTO `ot_auth_extend` VALUES (1, 3, 2);
INSERT INTO `ot_auth_extend` VALUES (1, 4, 1);
INSERT INTO `ot_auth_extend` VALUES (1, 37, 1);

-- ----------------------------
-- Table structure for ot_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `ot_auth_group`;
CREATE TABLE `ot_auth_group`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '权限组id,自增主键',
  `module` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '权限组中文名称',
  `description` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '权限组状态：为1正常，为0禁用,-1为删除',
  `rules` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限组拥有的规则id，多个规则 , 隔开',
  `end_time` int(11) NOT NULL DEFAULT 2000000000 COMMENT '有效期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_auth_group
-- ----------------------------
INSERT INTO `ot_auth_group` VALUES (1, 'admin', 1, '普通用户', '', 1, ',338,340,341,344,10108,10110,10111,10114,10116,10118,10119,10122', 2000000000);
INSERT INTO `ot_auth_group` VALUES (2, 'admin', 1, 'VIP', '', 1, ',338,340,341,344,10108,10110,10111,10114,10116,10118,10119,10122', 2000000000);
INSERT INTO `ot_auth_group` VALUES (3, 'admin', 1, '管理员', '拥有管理权限', 1, ',10108,10110,10111,10114,10116,10118,10119,10122,423,430,10016,10017,10018,10019,10020,10023,10024,10025,10026,10056,10057,10058,10059,10061,10088,1,3,5,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,61,62,63,64,65,66,67,68,69,70,80,81,82,83,84,86,87,94,95,100,102,103,107,108,109,110,207,212,213,214,224,225,226,228,229,230,231,232,233,234,238,239,241,242,243,245,250,255,256,257,258,259,260,261,262,263,264,278,279,280,313,315,316,317,318,319,320,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,373,374,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,424,425,427,429,431,10000,10001,10002,10003,10004,10005,10006,10007,10008,10009,10010,10011,10012,10013,10014,10021,10022,10027,10028,10029,10030,10031,10032,10033,10034,10035,10036,10037,10038,10039,10040,10041,10042,10043,10044,10045,10046,10047,10048,10049,10050,10051,10052,10053,10054,10055,10060,10062,10063,10064,10065,10066,10067,10068,10069,10070,10071,10072,10073,10074,10075,10076,10077,10078,10079,10080,10081,10082,10083,10084,10085,10086,10087,10124,10125,10126,10127,10128', 2000000000);

-- ----------------------------
-- Table structure for ot_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `ot_auth_group_access`;
CREATE TABLE `ot_auth_group_access`  (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) UNSIGNED NOT NULL COMMENT '权限组id',
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of ot_auth_group_access
-- ----------------------------
INSERT INTO `ot_auth_group_access` VALUES (1, 1);
INSERT INTO `ot_auth_group_access` VALUES (100, 1);
INSERT INTO `ot_auth_group_access` VALUES (100, 3);
INSERT INTO `ot_auth_group_access` VALUES (101, 1);

-- ----------------------------
-- Table structure for ot_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `ot_auth_rule`;
CREATE TABLE `ot_auth_rule`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1-url;2-主菜单',
  `name` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `module`(`module`, `status`, `type`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10129 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_auth_rule
-- ----------------------------
INSERT INTO `ot_auth_rule` VALUES (1, 'admin', 2, 'Admin/Index/index', '首页', 1, '');
INSERT INTO `ot_auth_rule` VALUES (2, 'admin', 2, 'Admin/Article/mydocument', '资讯', -1, '');
INSERT INTO `ot_auth_rule` VALUES (3, 'admin', 2, 'Admin/User/index', '用户与身份', 1, '');
INSERT INTO `ot_auth_rule` VALUES (4, 'admin', 2, 'Admin/Addons/index', '插件', -1, '');
INSERT INTO `ot_auth_rule` VALUES (5, 'admin', 2, 'Admin/Config/group', '系统', 1, '');
INSERT INTO `ot_auth_rule` VALUES (7, 'admin', 1, 'Admin/article/add', '新增', -1, '');
INSERT INTO `ot_auth_rule` VALUES (8, 'admin', 1, 'Admin/article/edit', '编辑', -1, '');
INSERT INTO `ot_auth_rule` VALUES (9, 'admin', 1, 'Admin/article/setStatus', '改变状态', -1, '');
INSERT INTO `ot_auth_rule` VALUES (10, 'admin', 1, 'Admin/article/update', '保存', -1, '');
INSERT INTO `ot_auth_rule` VALUES (11, 'admin', 1, 'Admin/article/autoSave', '保存草稿', -1, '');
INSERT INTO `ot_auth_rule` VALUES (12, 'admin', 1, 'Admin/article/move', '移动', -1, '');
INSERT INTO `ot_auth_rule` VALUES (13, 'admin', 1, 'Admin/article/copy', '复制', -1, '');
INSERT INTO `ot_auth_rule` VALUES (14, 'admin', 1, 'Admin/article/paste', '粘贴', -1, '');
INSERT INTO `ot_auth_rule` VALUES (15, 'admin', 1, 'Admin/article/permit', '还原', -1, '');
INSERT INTO `ot_auth_rule` VALUES (16, 'admin', 1, 'Admin/article/clear', '清空', -1, '');
INSERT INTO `ot_auth_rule` VALUES (17, 'admin', 1, 'Admin/article/index', '文档列表', -1, '');
INSERT INTO `ot_auth_rule` VALUES (18, 'admin', 1, 'Admin/article/recycle', '回收站', -1, '');
INSERT INTO `ot_auth_rule` VALUES (19, 'admin', 1, 'Admin/User/addaction', '新增用户行为', 1, '');
INSERT INTO `ot_auth_rule` VALUES (20, 'admin', 1, 'Admin/User/editaction', '编辑用户行为', 1, '');
INSERT INTO `ot_auth_rule` VALUES (21, 'admin', 1, 'Admin/User/saveAction', '保存用户行为', 1, '');
INSERT INTO `ot_auth_rule` VALUES (22, 'admin', 1, 'Admin/User/setStatus', '变更行为状态', 1, '');
INSERT INTO `ot_auth_rule` VALUES (23, 'admin', 1, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', 1, '');
INSERT INTO `ot_auth_rule` VALUES (24, 'admin', 1, 'Admin/User/changeStatus?method=resumeUser', '启用会员', 1, '');
INSERT INTO `ot_auth_rule` VALUES (25, 'admin', 1, 'Admin/User/changeStatus?method=deleteUser', '删除会员', 1, '');
INSERT INTO `ot_auth_rule` VALUES (26, 'admin', 1, 'Admin/User/index', '用户信息', 1, '');
INSERT INTO `ot_auth_rule` VALUES (27, 'admin', 1, 'Admin/User/action', '积分规则', 1, '');
INSERT INTO `ot_auth_rule` VALUES (28, 'admin', 1, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', 1, '');
INSERT INTO `ot_auth_rule` VALUES (29, 'admin', 1, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', 1, '');
INSERT INTO `ot_auth_rule` VALUES (30, 'admin', 1, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', 1, '');
INSERT INTO `ot_auth_rule` VALUES (31, 'admin', 1, 'Admin/AuthManager/createGroup', '新增', 1, '');
INSERT INTO `ot_auth_rule` VALUES (32, 'admin', 1, 'Admin/AuthManager/editGroup', '编辑', 1, '');
INSERT INTO `ot_auth_rule` VALUES (33, 'admin', 1, 'Admin/AuthManager/writeGroup', '保存权限组', 1, '');
INSERT INTO `ot_auth_rule` VALUES (34, 'admin', 1, 'Admin/AuthManager/group', '授权', 1, '');
INSERT INTO `ot_auth_rule` VALUES (35, 'admin', 1, 'Admin/AuthManager/access', '访问授权', 1, '');
INSERT INTO `ot_auth_rule` VALUES (36, 'admin', 1, 'Admin/AuthManager/user', '成员授权', 1, '');
INSERT INTO `ot_auth_rule` VALUES (37, 'admin', 1, 'Admin/AuthManager/removeFromGroup', '解除授权', 1, '');
INSERT INTO `ot_auth_rule` VALUES (38, 'admin', 1, 'Admin/AuthManager/addToGroup', '保存成员授权', 1, '');
INSERT INTO `ot_auth_rule` VALUES (39, 'admin', 1, 'Admin/AuthManager/category', '分类授权', 1, '');
INSERT INTO `ot_auth_rule` VALUES (40, 'admin', 1, 'Admin/AuthManager/addToCategory', '保存分类授权', 1, '');
INSERT INTO `ot_auth_rule` VALUES (41, 'admin', 1, 'Admin/AuthManager/index', '权限组管理', 1, '');
INSERT INTO `ot_auth_rule` VALUES (42, 'admin', 1, 'Admin/Addons/create', '创建', 1, '');
INSERT INTO `ot_auth_rule` VALUES (43, 'admin', 1, 'Admin/Addons/checkForm', '检测创建', 1, '');
INSERT INTO `ot_auth_rule` VALUES (44, 'admin', 1, 'Admin/Addons/preview', '预览', 1, '');
INSERT INTO `ot_auth_rule` VALUES (45, 'admin', 1, 'Admin/Addons/build', '快速生成插件', 1, '');
INSERT INTO `ot_auth_rule` VALUES (46, 'admin', 1, 'Admin/Addons/config', '设置', 1, '');
INSERT INTO `ot_auth_rule` VALUES (47, 'admin', 1, 'Admin/Addons/disable', '禁用', 1, '');
INSERT INTO `ot_auth_rule` VALUES (48, 'admin', 1, 'Admin/Addons/enable', '启用', 1, '');
INSERT INTO `ot_auth_rule` VALUES (49, 'admin', 1, 'Admin/Addons/install', '安装', 1, '');
INSERT INTO `ot_auth_rule` VALUES (50, 'admin', 1, 'Admin/Addons/uninstall', '卸载', 1, '');
INSERT INTO `ot_auth_rule` VALUES (51, 'admin', 1, 'Admin/Addons/saveconfig', '更新配置', 1, '');
INSERT INTO `ot_auth_rule` VALUES (52, 'admin', 1, 'Admin/Addons/adminList', '插件后台列表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (53, 'admin', 1, 'Admin/Addons/execute', 'URL方式访问插件', 1, '');
INSERT INTO `ot_auth_rule` VALUES (54, 'admin', 1, 'Admin/Addons/index', '插件管理', 1, '');
INSERT INTO `ot_auth_rule` VALUES (55, 'admin', 1, 'Admin/Addons/hooks', '钩子管理', 1, '');
INSERT INTO `ot_auth_rule` VALUES (56, 'admin', 1, 'Admin/model/add', '新增', -1, '');
INSERT INTO `ot_auth_rule` VALUES (57, 'admin', 1, 'Admin/model/edit', '编辑', -1, '');
INSERT INTO `ot_auth_rule` VALUES (58, 'admin', 1, 'Admin/model/setStatus', '改变状态', -1, '');
INSERT INTO `ot_auth_rule` VALUES (59, 'admin', 1, 'Admin/model/update', '保存数据', -1, '');
INSERT INTO `ot_auth_rule` VALUES (60, 'admin', 1, 'Admin/Model/index', '模型管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (61, 'admin', 1, 'Admin/Config/edit', '编辑', 1, '');
INSERT INTO `ot_auth_rule` VALUES (62, 'admin', 1, 'Admin/Config/del', '删除', 1, '');
INSERT INTO `ot_auth_rule` VALUES (63, 'admin', 1, 'Admin/Config/add', '新增', 1, '');
INSERT INTO `ot_auth_rule` VALUES (64, 'admin', 1, 'Admin/Config/save', '保存', 1, '');
INSERT INTO `ot_auth_rule` VALUES (65, 'admin', 1, 'Admin/Config/group', '网站设置', 1, '');
INSERT INTO `ot_auth_rule` VALUES (66, 'admin', 1, 'Admin/Config/index', '配置管理', 1, '');
INSERT INTO `ot_auth_rule` VALUES (67, 'admin', 1, 'Admin/Channel/add', '新增', 1, '');
INSERT INTO `ot_auth_rule` VALUES (68, 'admin', 1, 'Admin/Channel/edit', '编辑', 1, '');
INSERT INTO `ot_auth_rule` VALUES (69, 'admin', 1, 'Admin/Channel/del', '删除', 1, '');
INSERT INTO `ot_auth_rule` VALUES (70, 'admin', 1, 'Admin/Channel/index', '顶部导航', 1, '');
INSERT INTO `ot_auth_rule` VALUES (71, 'admin', 1, 'Admin/Category/edit', '编辑', -1, '');
INSERT INTO `ot_auth_rule` VALUES (72, 'admin', 1, 'Admin/Category/add', '新增', -1, '');
INSERT INTO `ot_auth_rule` VALUES (73, 'admin', 1, 'Admin/Category/remove', '删除', -1, '');
INSERT INTO `ot_auth_rule` VALUES (74, 'admin', 1, 'Admin/Category/index', '分类管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (75, 'admin', 1, 'Admin/file/upload', '上传控件', -1, '');
INSERT INTO `ot_auth_rule` VALUES (76, 'admin', 1, 'Admin/file/uploadPicture', '上传图片', -1, '');
INSERT INTO `ot_auth_rule` VALUES (77, 'admin', 1, 'Admin/file/download', '下载', -1, '');
INSERT INTO `ot_auth_rule` VALUES (94, 'admin', 1, 'Admin/AuthManager/modelauth', '模型授权', 1, '');
INSERT INTO `ot_auth_rule` VALUES (79, 'admin', 1, 'Admin/article/batchOperate', '导入', -1, '');
INSERT INTO `ot_auth_rule` VALUES (80, 'admin', 1, 'Admin/Database/index?type=export', '备份数据库', 1, '');
INSERT INTO `ot_auth_rule` VALUES (81, 'admin', 1, 'Admin/Database/index?type=import', '还原数据库', 1, '');
INSERT INTO `ot_auth_rule` VALUES (82, 'admin', 1, 'Admin/Database/export', '备份', 1, '');
INSERT INTO `ot_auth_rule` VALUES (83, 'admin', 1, 'Admin/Database/optimize', '优化表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (84, 'admin', 1, 'Admin/Database/repair', '修复表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (86, 'admin', 1, 'Admin/Database/import', '恢复', 1, '');
INSERT INTO `ot_auth_rule` VALUES (87, 'admin', 1, 'Admin/Database/del', '删除', 1, '');
INSERT INTO `ot_auth_rule` VALUES (88, 'admin', 1, 'Admin/User/add', '新增用户', -1, '');
INSERT INTO `ot_auth_rule` VALUES (89, 'admin', 1, 'Admin/Attribute/index', '属性管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (90, 'admin', 1, 'Admin/Attribute/add', '新增', -1, '');
INSERT INTO `ot_auth_rule` VALUES (91, 'admin', 1, 'Admin/Attribute/edit', '编辑', -1, '');
INSERT INTO `ot_auth_rule` VALUES (92, 'admin', 1, 'Admin/Attribute/setStatus', '改变状态', -1, '');
INSERT INTO `ot_auth_rule` VALUES (93, 'admin', 1, 'Admin/Attribute/update', '保存数据', -1, '');
INSERT INTO `ot_auth_rule` VALUES (95, 'admin', 1, 'Admin/AuthManager/addToModel', '保存模型授权', 1, '');
INSERT INTO `ot_auth_rule` VALUES (96, 'admin', 1, 'Admin/Category/move', '移动', -1, '');
INSERT INTO `ot_auth_rule` VALUES (97, 'admin', 1, 'Admin/Category/merge', '合并', -1, '');
INSERT INTO `ot_auth_rule` VALUES (98, 'admin', 1, 'Admin/Config/menu', '后台菜单管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (99, 'admin', 1, 'Admin/Article/mydocument', '内容', -1, '');
INSERT INTO `ot_auth_rule` VALUES (100, 'admin', 1, 'Admin/Menu/index', '后台菜单管理', 1, '');
INSERT INTO `ot_auth_rule` VALUES (101, 'admin', 1, 'Admin/other', '其他', -1, '');
INSERT INTO `ot_auth_rule` VALUES (102, 'admin', 1, 'Admin/Menu/add', '新增', 1, '');
INSERT INTO `ot_auth_rule` VALUES (103, 'admin', 1, 'Admin/Menu/edit', '编辑', 1, '');
INSERT INTO `ot_auth_rule` VALUES (104, 'admin', 1, 'Admin/Think/lists?model=article', '文章管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (105, 'admin', 1, 'Admin/Think/lists?model=download', '下载管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (106, 'admin', 1, 'Admin/Think/lists?model=config', '配置管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (107, 'admin', 1, 'Admin/Action/actionlog', '行为日志', 1, '');
INSERT INTO `ot_auth_rule` VALUES (108, 'admin', 1, 'Admin/User/updatePassword', '修改密码', 1, '');
INSERT INTO `ot_auth_rule` VALUES (109, 'admin', 1, 'Admin/User/updateNickname', '修改昵称', 1, '');
INSERT INTO `ot_auth_rule` VALUES (110, 'admin', 1, 'Admin/action/edit', '查看行为日志', 1, '');
INSERT INTO `ot_auth_rule` VALUES (205, 'admin', 1, 'Admin/think/add', '新增数据', -1, '');
INSERT INTO `ot_auth_rule` VALUES (111, 'admin', 2, 'Admin/article/index', '文档列表', -1, '');
INSERT INTO `ot_auth_rule` VALUES (112, 'admin', 2, 'Admin/article/add', '新增', -1, '');
INSERT INTO `ot_auth_rule` VALUES (113, 'admin', 2, 'Admin/article/edit', '编辑', -1, '');
INSERT INTO `ot_auth_rule` VALUES (114, 'admin', 2, 'Admin/article/setStatus', '改变状态', -1, '');
INSERT INTO `ot_auth_rule` VALUES (115, 'admin', 2, 'Admin/article/update', '保存', -1, '');
INSERT INTO `ot_auth_rule` VALUES (116, 'admin', 2, 'Admin/article/autoSave', '保存草稿', -1, '');
INSERT INTO `ot_auth_rule` VALUES (117, 'admin', 2, 'Admin/article/move', '移动', -1, '');
INSERT INTO `ot_auth_rule` VALUES (118, 'admin', 2, 'Admin/article/copy', '复制', -1, '');
INSERT INTO `ot_auth_rule` VALUES (119, 'admin', 2, 'Admin/article/paste', '粘贴', -1, '');
INSERT INTO `ot_auth_rule` VALUES (120, 'admin', 2, 'Admin/article/batchOperate', '导入', -1, '');
INSERT INTO `ot_auth_rule` VALUES (121, 'admin', 2, 'Admin/article/recycle', '回收站', -1, '');
INSERT INTO `ot_auth_rule` VALUES (122, 'admin', 2, 'Admin/article/permit', '还原', -1, '');
INSERT INTO `ot_auth_rule` VALUES (123, 'admin', 2, 'Admin/article/clear', '清空', -1, '');
INSERT INTO `ot_auth_rule` VALUES (124, 'admin', 2, 'Admin/User/add', '新增用户', -1, '');
INSERT INTO `ot_auth_rule` VALUES (125, 'admin', 2, 'Admin/User/action', '用户行为', -1, '');
INSERT INTO `ot_auth_rule` VALUES (126, 'admin', 2, 'Admin/User/addAction', '新增用户行为', -1, '');
INSERT INTO `ot_auth_rule` VALUES (127, 'admin', 2, 'Admin/User/editAction', '编辑用户行为', -1, '');
INSERT INTO `ot_auth_rule` VALUES (128, 'admin', 2, 'Admin/User/saveAction', '保存用户行为', -1, '');
INSERT INTO `ot_auth_rule` VALUES (129, 'admin', 2, 'Admin/User/setStatus', '变更行为状态', -1, '');
INSERT INTO `ot_auth_rule` VALUES (130, 'admin', 2, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', -1, '');
INSERT INTO `ot_auth_rule` VALUES (131, 'admin', 2, 'Admin/User/changeStatus?method=resumeUser', '启用会员', -1, '');
INSERT INTO `ot_auth_rule` VALUES (132, 'admin', 2, 'Admin/User/changeStatus?method=deleteUser', '删除会员', -1, '');
INSERT INTO `ot_auth_rule` VALUES (133, 'admin', 2, 'Admin/AuthManager/index', '权限管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (134, 'admin', 2, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', -1, '');
INSERT INTO `ot_auth_rule` VALUES (135, 'admin', 2, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', -1, '');
INSERT INTO `ot_auth_rule` VALUES (136, 'admin', 2, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', -1, '');
INSERT INTO `ot_auth_rule` VALUES (137, 'admin', 2, 'Admin/AuthManager/createGroup', '新增', -1, '');
INSERT INTO `ot_auth_rule` VALUES (138, 'admin', 2, 'Admin/AuthManager/editGroup', '编辑', -1, '');
INSERT INTO `ot_auth_rule` VALUES (139, 'admin', 2, 'Admin/AuthManager/writeGroup', '保存权限组', -1, '');
INSERT INTO `ot_auth_rule` VALUES (140, 'admin', 2, 'Admin/AuthManager/group', '授权', -1, '');
INSERT INTO `ot_auth_rule` VALUES (141, 'admin', 2, 'Admin/AuthManager/access', '访问授权', -1, '');
INSERT INTO `ot_auth_rule` VALUES (142, 'admin', 2, 'Admin/AuthManager/user', '成员授权', -1, '');
INSERT INTO `ot_auth_rule` VALUES (143, 'admin', 2, 'Admin/AuthManager/removeFromGroup', '解除授权', -1, '');
INSERT INTO `ot_auth_rule` VALUES (144, 'admin', 2, 'Admin/AuthManager/addToGroup', '保存成员授权', -1, '');
INSERT INTO `ot_auth_rule` VALUES (145, 'admin', 2, 'Admin/AuthManager/category', '分类授权', -1, '');
INSERT INTO `ot_auth_rule` VALUES (146, 'admin', 2, 'Admin/AuthManager/addToCategory', '保存分类授权', -1, '');
INSERT INTO `ot_auth_rule` VALUES (147, 'admin', 2, 'Admin/AuthManager/modelauth', '模型授权', -1, '');
INSERT INTO `ot_auth_rule` VALUES (148, 'admin', 2, 'Admin/AuthManager/addToModel', '保存模型授权', -1, '');
INSERT INTO `ot_auth_rule` VALUES (149, 'admin', 2, 'Admin/Addons/create', '创建', -1, '');
INSERT INTO `ot_auth_rule` VALUES (150, 'admin', 2, 'Admin/Addons/checkForm', '检测创建', -1, '');
INSERT INTO `ot_auth_rule` VALUES (151, 'admin', 2, 'Admin/Addons/preview', '预览', -1, '');
INSERT INTO `ot_auth_rule` VALUES (152, 'admin', 2, 'Admin/Addons/build', '快速生成插件', -1, '');
INSERT INTO `ot_auth_rule` VALUES (153, 'admin', 2, 'Admin/Addons/config', '设置', -1, '');
INSERT INTO `ot_auth_rule` VALUES (154, 'admin', 2, 'Admin/Addons/disable', '禁用', -1, '');
INSERT INTO `ot_auth_rule` VALUES (155, 'admin', 2, 'Admin/Addons/enable', '启用', -1, '');
INSERT INTO `ot_auth_rule` VALUES (156, 'admin', 2, 'Admin/Addons/install', '安装', -1, '');
INSERT INTO `ot_auth_rule` VALUES (157, 'admin', 2, 'Admin/Addons/uninstall', '卸载', -1, '');
INSERT INTO `ot_auth_rule` VALUES (158, 'admin', 2, 'Admin/Addons/saveconfig', '更新配置', -1, '');
INSERT INTO `ot_auth_rule` VALUES (159, 'admin', 2, 'Admin/Addons/adminList', '插件后台列表', -1, '');
INSERT INTO `ot_auth_rule` VALUES (160, 'admin', 2, 'Admin/Addons/execute', 'URL方式访问插件', -1, '');
INSERT INTO `ot_auth_rule` VALUES (161, 'admin', 2, 'Admin/Addons/hooks', '钩子管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (162, 'admin', 2, 'Admin/Model/index', '模型管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (163, 'admin', 2, 'Admin/model/add', '新增', -1, '');
INSERT INTO `ot_auth_rule` VALUES (164, 'admin', 2, 'Admin/model/edit', '编辑', -1, '');
INSERT INTO `ot_auth_rule` VALUES (165, 'admin', 2, 'Admin/model/setStatus', '改变状态', -1, '');
INSERT INTO `ot_auth_rule` VALUES (166, 'admin', 2, 'Admin/model/update', '保存数据', -1, '');
INSERT INTO `ot_auth_rule` VALUES (167, 'admin', 2, 'Admin/Attribute/index', '属性管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (168, 'admin', 2, 'Admin/Attribute/add', '新增', -1, '');
INSERT INTO `ot_auth_rule` VALUES (169, 'admin', 2, 'Admin/Attribute/edit', '编辑', -1, '');
INSERT INTO `ot_auth_rule` VALUES (170, 'admin', 2, 'Admin/Attribute/setStatus', '改变状态', -1, '');
INSERT INTO `ot_auth_rule` VALUES (171, 'admin', 2, 'Admin/Attribute/update', '保存数据', -1, '');
INSERT INTO `ot_auth_rule` VALUES (172, 'admin', 2, 'Admin/Config/index', '配置管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (173, 'admin', 2, 'Admin/Config/edit', '编辑', -1, '');
INSERT INTO `ot_auth_rule` VALUES (174, 'admin', 2, 'Admin/Config/del', '删除', -1, '');
INSERT INTO `ot_auth_rule` VALUES (175, 'admin', 2, 'Admin/Config/add', '新增', -1, '');
INSERT INTO `ot_auth_rule` VALUES (176, 'admin', 2, 'Admin/Config/save', '保存', -1, '');
INSERT INTO `ot_auth_rule` VALUES (177, 'admin', 2, 'Admin/Menu/index', '菜单管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (178, 'admin', 2, 'Admin/Channel/index', '导航管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (179, 'admin', 2, 'Admin/Channel/add', '新增', -1, '');
INSERT INTO `ot_auth_rule` VALUES (180, 'admin', 2, 'Admin/Channel/edit', '编辑', -1, '');
INSERT INTO `ot_auth_rule` VALUES (181, 'admin', 2, 'Admin/Channel/del', '删除', -1, '');
INSERT INTO `ot_auth_rule` VALUES (182, 'admin', 2, 'Admin/Category/index', '分类管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (183, 'admin', 2, 'Admin/Category/edit', '编辑', -1, '');
INSERT INTO `ot_auth_rule` VALUES (184, 'admin', 2, 'Admin/Category/add', '新增', -1, '');
INSERT INTO `ot_auth_rule` VALUES (185, 'admin', 2, 'Admin/Category/remove', '删除', -1, '');
INSERT INTO `ot_auth_rule` VALUES (186, 'admin', 2, 'Admin/Category/move', '移动', -1, '');
INSERT INTO `ot_auth_rule` VALUES (187, 'admin', 2, 'Admin/Category/merge', '合并', -1, '');
INSERT INTO `ot_auth_rule` VALUES (188, 'admin', 2, 'Admin/Database/index?type=export', '备份数据库', -1, '');
INSERT INTO `ot_auth_rule` VALUES (189, 'admin', 2, 'Admin/Database/export', '备份', -1, '');
INSERT INTO `ot_auth_rule` VALUES (190, 'admin', 2, 'Admin/Database/optimize', '优化表', -1, '');
INSERT INTO `ot_auth_rule` VALUES (191, 'admin', 2, 'Admin/Database/repair', '修复表', -1, '');
INSERT INTO `ot_auth_rule` VALUES (192, 'admin', 2, 'Admin/Database/index?type=import', '还原数据库', -1, '');
INSERT INTO `ot_auth_rule` VALUES (193, 'admin', 2, 'Admin/Database/import', '恢复', -1, '');
INSERT INTO `ot_auth_rule` VALUES (194, 'admin', 2, 'Admin/Database/del', '删除', -1, '');
INSERT INTO `ot_auth_rule` VALUES (195, 'admin', 2, 'Admin/other', '其他', -1, '');
INSERT INTO `ot_auth_rule` VALUES (196, 'admin', 2, 'Admin/Menu/add', '新增', -1, '');
INSERT INTO `ot_auth_rule` VALUES (197, 'admin', 2, 'Admin/Menu/edit', '编辑', -1, '');
INSERT INTO `ot_auth_rule` VALUES (198, 'admin', 2, 'Admin/Think/lists?model=article', '应用', -1, '');
INSERT INTO `ot_auth_rule` VALUES (199, 'admin', 2, 'Admin/Think/lists?model=download', '下载管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (200, 'admin', 2, 'Admin/Think/lists?model=config', '应用', -1, '');
INSERT INTO `ot_auth_rule` VALUES (201, 'admin', 2, 'Admin/Action/actionlog', '行为日志', -1, '');
INSERT INTO `ot_auth_rule` VALUES (202, 'admin', 2, 'Admin/User/updatePassword', '修改密码', -1, '');
INSERT INTO `ot_auth_rule` VALUES (203, 'admin', 2, 'Admin/User/updateNickname', '修改昵称', -1, '');
INSERT INTO `ot_auth_rule` VALUES (204, 'admin', 2, 'Admin/action/edit', '查看行为日志', -1, '');
INSERT INTO `ot_auth_rule` VALUES (206, 'admin', 1, 'Admin/think/edit', '编辑数据', -1, '');
INSERT INTO `ot_auth_rule` VALUES (207, 'admin', 1, 'Admin/Menu/import', '导入', 1, '');
INSERT INTO `ot_auth_rule` VALUES (208, 'admin', 1, 'Admin/Model/generate', '生成', -1, '');
INSERT INTO `ot_auth_rule` VALUES (209, 'admin', 1, 'Admin/Addons/addHook', '新增钩子', 1, '');
INSERT INTO `ot_auth_rule` VALUES (210, 'admin', 1, 'Admin/Addons/edithook', '编辑钩子', 1, '');
INSERT INTO `ot_auth_rule` VALUES (211, 'admin', 1, 'Admin/Article/sort', '文档排序', -1, '');
INSERT INTO `ot_auth_rule` VALUES (212, 'admin', 1, 'Admin/Config/sort', '排序', 1, '');
INSERT INTO `ot_auth_rule` VALUES (213, 'admin', 1, 'Admin/Menu/sort', '排序', 1, '');
INSERT INTO `ot_auth_rule` VALUES (214, 'admin', 1, 'Admin/Channel/sort', '排序', 1, '');
INSERT INTO `ot_auth_rule` VALUES (215, 'admin', 1, 'Admin/Category/operate/type/move', '移动', -1, '');
INSERT INTO `ot_auth_rule` VALUES (216, 'admin', 1, 'Admin/Category/operate/type/merge', '合并', -1, '');
INSERT INTO `ot_auth_rule` VALUES (217, 'admin', 1, 'Admin/Forum/forum', '板块管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (218, 'admin', 1, 'Admin/Forum/post', '帖子管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (219, 'admin', 1, 'Admin/Forum/editForum', '编辑／发表帖子', -1, '');
INSERT INTO `ot_auth_rule` VALUES (220, 'admin', 1, 'Admin/Forum/editPost', 'edit pots', -1, '');
INSERT INTO `ot_auth_rule` VALUES (221, 'admin', 2, 'Admin//Admin/Forum/index', '讨论区', -1, '');
INSERT INTO `ot_auth_rule` VALUES (222, 'admin', 2, 'Admin//Admin/Weibo/index', '微博', -1, '');
INSERT INTO `ot_auth_rule` VALUES (223, 'admin', 1, 'Admin/Forum/sortForum', '排序', -1, '');
INSERT INTO `ot_auth_rule` VALUES (224, 'admin', 1, 'Admin/SEO/editRule', '新增、编辑', 1, '');
INSERT INTO `ot_auth_rule` VALUES (225, 'admin', 1, 'Admin/SEO/sortRule', '排序', 1, '');
INSERT INTO `ot_auth_rule` VALUES (226, 'admin', 1, 'Admin/SEO/index', 'SEO规则管理', 1, '');
INSERT INTO `ot_auth_rule` VALUES (227, 'admin', 1, 'Admin/Forum/editReply', '新增 编辑', -1, '');
INSERT INTO `ot_auth_rule` VALUES (228, 'admin', 1, 'Admin/Weibo/editComment', '编辑回复', 1, '');
INSERT INTO `ot_auth_rule` VALUES (229, 'admin', 1, 'Admin/Weibo/editWeibo', '编辑微博', 1, '');
INSERT INTO `ot_auth_rule` VALUES (230, 'admin', 1, 'Admin/SEO/ruleTrash', 'SEO规则回收站', 1, '');
INSERT INTO `ot_auth_rule` VALUES (231, 'admin', 1, 'Admin/Rank/userList', '查看用户', 1, '');
INSERT INTO `ot_auth_rule` VALUES (232, 'admin', 1, 'Admin/Rank/userRankList', '用户头衔列表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (233, 'admin', 1, 'Admin/Rank/userAddRank', '关联新头衔', 1, '');
INSERT INTO `ot_auth_rule` VALUES (234, 'admin', 1, 'Admin/Rank/userChangeRank', '编辑头衔关联', 1, '');
INSERT INTO `ot_auth_rule` VALUES (235, 'admin', 1, 'Admin/Issue/add', '编辑专辑', -1, '');
INSERT INTO `ot_auth_rule` VALUES (236, 'admin', 1, 'Admin/Issue/issue', '专辑管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (237, 'admin', 1, 'Admin/Issue/operate', '专辑操作', -1, '');
INSERT INTO `ot_auth_rule` VALUES (238, 'admin', 1, 'Admin/Weibo/weibo', '作品管理', 1, '');
INSERT INTO `ot_auth_rule` VALUES (239, 'admin', 1, 'Admin/Rank/index', '头衔列表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (240, 'admin', 1, 'Admin/Forum/forumTrash', '板块回收站', -1, '');
INSERT INTO `ot_auth_rule` VALUES (241, 'admin', 1, 'Admin/Weibo/weiboTrash', '作品回收站', 1, '');
INSERT INTO `ot_auth_rule` VALUES (242, 'admin', 1, 'Admin/Rank/editRank', '添加头衔', 1, '');
INSERT INTO `ot_auth_rule` VALUES (243, 'admin', 1, 'Admin/Weibo/comment', '回复管理', 1, '');
INSERT INTO `ot_auth_rule` VALUES (244, 'admin', 1, 'Admin/Forum/postTrash', '帖子回收站', -1, '');
INSERT INTO `ot_auth_rule` VALUES (245, 'admin', 1, 'Admin/Weibo/commentTrash', '回复回收站', 1, '');
INSERT INTO `ot_auth_rule` VALUES (246, 'admin', 1, 'Admin/Issue/issueTrash', '专辑回收站', -1, '');
INSERT INTO `ot_auth_rule` VALUES (247, 'admin', 1, 'Admin//Admin/Forum/reply', '回复管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (248, 'admin', 1, 'Admin/Forum/replyTrash', '回复回收站', -1, '');
INSERT INTO `ot_auth_rule` VALUES (249, 'admin', 2, 'Admin/Forum/index', '贴吧', -1, '');
INSERT INTO `ot_auth_rule` VALUES (250, 'admin', 2, 'Admin/Weibo/weibo', '作品', 1, '');
INSERT INTO `ot_auth_rule` VALUES (251, 'admin', 2, 'Admin/SEO/index', 'SEO', -1, '');
INSERT INTO `ot_auth_rule` VALUES (252, 'admin', 2, 'Admin/Rank/index', '头衔', -1, '');
INSERT INTO `ot_auth_rule` VALUES (253, 'admin', 2, 'Admin/Issue/issue', '专辑', -1, '');
INSERT INTO `ot_auth_rule` VALUES (254, 'admin', 1, 'Admin/Issue/contents', '内容管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (255, 'admin', 1, 'Admin/User/profile', '扩展资料', 1, '');
INSERT INTO `ot_auth_rule` VALUES (256, 'admin', 1, 'Admin/User/editProfile', '添加、编辑分组', 1, '');
INSERT INTO `ot_auth_rule` VALUES (257, 'admin', 1, 'Admin/User/sortProfile', '分组排序', 1, '');
INSERT INTO `ot_auth_rule` VALUES (258, 'admin', 1, 'Admin/User/field', '字段列表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (259, 'admin', 1, 'Admin/User/editFieldSetting', '添加、编辑字段', 1, '');
INSERT INTO `ot_auth_rule` VALUES (260, 'admin', 1, 'Admin/User/sortField', '字段排序', 1, '');
INSERT INTO `ot_auth_rule` VALUES (261, 'admin', 1, 'Admin/Update/quick', '全部补丁', 1, '');
INSERT INTO `ot_auth_rule` VALUES (262, 'admin', 1, 'Admin/Update/addpack', '新增补丁', 1, '');
INSERT INTO `ot_auth_rule` VALUES (263, 'admin', 1, 'Admin/User/expandinfo_select', '用户扩展资料列表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (264, 'admin', 1, 'Admin/User/expandinfo_details', '扩展资料详情', 1, '');
INSERT INTO `ot_auth_rule` VALUES (265, 'admin', 1, 'Admin/Shop/shopLog', '商城信息记录', -1, '');
INSERT INTO `ot_auth_rule` VALUES (266, 'admin', 1, 'Admin/Shop/setStatus', '商品分类状态设置', -1, '');
INSERT INTO `ot_auth_rule` VALUES (267, 'admin', 1, 'Admin/Shop/setGoodsStatus', '商品状态设置', -1, '');
INSERT INTO `ot_auth_rule` VALUES (268, 'admin', 1, 'Admin/Shop/operate', '商品分类操作', -1, '');
INSERT INTO `ot_auth_rule` VALUES (269, 'admin', 1, 'Admin/Shop/add', '商品分类添加', -1, '');
INSERT INTO `ot_auth_rule` VALUES (270, 'admin', 1, 'Admin/Shop/goodsEdit', '添加、编辑商品', -1, '');
INSERT INTO `ot_auth_rule` VALUES (271, 'admin', 1, 'Admin/Shop/hotSellConfig', '热销商品阀值配置', -1, '');
INSERT INTO `ot_auth_rule` VALUES (272, 'admin', 1, 'Admin/Shop/setNew', '设置新品', -1, '');
INSERT INTO `ot_auth_rule` VALUES (273, 'admin', 1, 'Admin/EventType/index', '活动分类管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (274, 'admin', 1, 'Admin/Event/event', '内容管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (275, 'admin', 1, 'Admin/EventType/eventTypeTrash', '活动分类回收站', -1, '');
INSERT INTO `ot_auth_rule` VALUES (276, 'admin', 1, 'Admin/Event/verify', '内容审核', -1, '');
INSERT INTO `ot_auth_rule` VALUES (277, 'admin', 1, 'Admin/Event/contentTrash', '内容回收站', -1, '');
INSERT INTO `ot_auth_rule` VALUES (278, 'admin', 1, 'Admin/Rank/rankVerify', '待审核用户头衔', 1, '');
INSERT INTO `ot_auth_rule` VALUES (279, 'admin', 1, 'Admin/Rank/rankVerifyFailure', '被驳回的头衔申请', 1, '');
INSERT INTO `ot_auth_rule` VALUES (280, 'admin', 1, 'Admin/Weibo/config', '作品设置', 1, '');
INSERT INTO `ot_auth_rule` VALUES (281, 'admin', 1, 'Admin/Issue/verify', '内容审核', -1, '');
INSERT INTO `ot_auth_rule` VALUES (282, 'admin', 1, 'Admin/Shop/goodsList', '商品列表', -1, '');
INSERT INTO `ot_auth_rule` VALUES (283, 'admin', 1, 'Admin/Shop/shopCategory', '商品分类配置', -1, '');
INSERT INTO `ot_auth_rule` VALUES (284, 'admin', 1, 'Admin/Shop/categoryTrash', '商品分类回收站', -1, '');
INSERT INTO `ot_auth_rule` VALUES (285, 'admin', 1, 'Admin/Shop/verify', '待发货交易', -1, '');
INSERT INTO `ot_auth_rule` VALUES (286, 'admin', 1, 'Admin/Issue/contentTrash', '内容回收站', -1, '');
INSERT INTO `ot_auth_rule` VALUES (287, 'admin', 1, 'Admin/Shop/goodsBuySuccess', '交易成功记录', -1, '');
INSERT INTO `ot_auth_rule` VALUES (288, 'admin', 1, 'Admin/Shop/goodsTrash', '商品回收站', -1, '');
INSERT INTO `ot_auth_rule` VALUES (289, 'admin', 1, 'Admin/Shop/toxMoneyConfig', '货币配置', -1, '');
INSERT INTO `ot_auth_rule` VALUES (290, 'admin', 2, 'Admin/Shop/shopCategory', '商城', -1, '');
INSERT INTO `ot_auth_rule` VALUES (291, 'admin', 2, 'Admin/EventType/index', '活动', -1, '');
INSERT INTO `ot_auth_rule` VALUES (297, 'Home', 1, 'deleteLocalComment', '删除本地评论', 1, '');
INSERT INTO `ot_auth_rule` VALUES (306, 'Issue', 1, 'addIssueContent', '专辑投稿权限', 1, '');
INSERT INTO `ot_auth_rule` VALUES (307, 'Issue', 1, 'editIssueContent', '编辑专辑内容（管理）', 1, '');
INSERT INTO `ot_auth_rule` VALUES (313, 'admin', 1, 'Admin/module/install', '模块安装', 1, '');
INSERT INTO `ot_auth_rule` VALUES (315, 'admin', 1, 'Admin/module/lists', '模块管理', 1, '');
INSERT INTO `ot_auth_rule` VALUES (316, 'admin', 1, 'Admin/module/uninstall', '卸载模块', 1, '');
INSERT INTO `ot_auth_rule` VALUES (317, 'admin', 1, 'Admin/AuthManager/addNode', '新增权限节点', 1, '');
INSERT INTO `ot_auth_rule` VALUES (318, 'admin', 1, 'Admin/AuthManager/accessUser', '前台权限管理', 1, '');
INSERT INTO `ot_auth_rule` VALUES (319, 'admin', 1, 'Admin/User/changeGroup', '转移权限组', 1, '');
INSERT INTO `ot_auth_rule` VALUES (320, 'admin', 1, 'Admin/AuthManager/deleteNode', '删除权限节点', 1, '');
INSERT INTO `ot_auth_rule` VALUES (321, 'admin', 1, 'Admin/Issue/config', '专辑设置', -1, '');
INSERT INTO `ot_auth_rule` VALUES (322, 'admin', 2, 'Admin/module/lists', '云平台', -1, '');
INSERT INTO `ot_auth_rule` VALUES (346, 'admin', 1, 'Admin/UserConfig/index', '基础配置', 1, '');
INSERT INTO `ot_auth_rule` VALUES (347, 'admin', 1, 'Admin/User/scoreList', '积分类型', 1, '');
INSERT INTO `ot_auth_rule` VALUES (348, 'admin', 1, 'Admin/User/editScoreType', '新增/编辑类型', 1, '');
INSERT INTO `ot_auth_rule` VALUES (349, 'admin', 1, 'Admin/User/recharge', '充值积分', 1, '');
INSERT INTO `ot_auth_rule` VALUES (350, 'admin', 1, 'Admin/Authorize/ssoSetting', '单点登录配置', 1, '');
INSERT INTO `ot_auth_rule` VALUES (351, 'admin', 1, 'Admin/Authorize/ssolist', '应用列表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (352, 'admin', 1, 'Admin/authorize/editssoapp', '新增/编辑应用', 1, '');
INSERT INTO `ot_auth_rule` VALUES (353, 'admin', 1, 'Admin/ActionLimit/limitList', '用户行为', 1, '');
INSERT INTO `ot_auth_rule` VALUES (354, 'admin', 1, 'Admin/ActionLimit/editLimit', '新增/编辑行为限制', 1, '');
INSERT INTO `ot_auth_rule` VALUES (355, 'admin', 1, 'Admin/Role/index', '身份列表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (356, 'admin', 1, 'Admin/Role/editRole', '编辑身份', 1, '');
INSERT INTO `ot_auth_rule` VALUES (357, 'admin', 1, 'Admin/Role/setStatus', '启用、禁用、删除身份', 1, '');
INSERT INTO `ot_auth_rule` VALUES (358, 'admin', 1, 'Admin/Role/sort', '身份排序', 1, '');
INSERT INTO `ot_auth_rule` VALUES (359, 'admin', 1, 'Admin/Role/configScore', '默认积分配置', 1, '');
INSERT INTO `ot_auth_rule` VALUES (360, 'admin', 1, 'Admin/Role/configAuth', '默认权限配置', 1, '');
INSERT INTO `ot_auth_rule` VALUES (361, 'admin', 1, 'Admin/Role/configAvatar', '默认头像配置', 1, '');
INSERT INTO `ot_auth_rule` VALUES (362, 'admin', 1, 'Admin/Role/configRank', '默认头衔配置', 1, '');
INSERT INTO `ot_auth_rule` VALUES (363, 'admin', 1, 'Admin/Role/configField', '默认字段管理', 1, '');
INSERT INTO `ot_auth_rule` VALUES (364, 'admin', 1, 'Admin/Role/group', '身份分组', 1, '');
INSERT INTO `ot_auth_rule` VALUES (365, 'admin', 1, 'Admin/Role/editGroup', '编辑分组', 1, '');
INSERT INTO `ot_auth_rule` VALUES (366, 'admin', 1, 'Admin/Role/deleteGroup', '删除分组', 1, '');
INSERT INTO `ot_auth_rule` VALUES (367, 'admin', 1, 'Admin/Role/config', '身份基本信息配置', 1, '');
INSERT INTO `ot_auth_rule` VALUES (368, 'admin', 1, 'Admin/Role/userList', '用户身份归属列表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (369, 'admin', 1, 'Admin/Role/setUserStatus', '设置用户状态', 1, '');
INSERT INTO `ot_auth_rule` VALUES (370, 'admin', 1, 'Admin/Role/setUserAudit', '审核用户', 1, '');
INSERT INTO `ot_auth_rule` VALUES (371, 'admin', 1, 'Admin/Role/changeRole', '迁移用户', 1, '');
INSERT INTO `ot_auth_rule` VALUES (372, 'admin', 1, 'Admin/Role/uploadPicture', '上传默认头像', 1, '');
INSERT INTO `ot_auth_rule` VALUES (373, 'admin', 1, 'Admin/Invite/index', '邀请码类型', 1, '');
INSERT INTO `ot_auth_rule` VALUES (374, 'admin', 1, 'Admin/Invite/invite', '邀请码管理', 1, '');
INSERT INTO `ot_auth_rule` VALUES (375, 'admin', 1, 'Admin/Invite/config', '基础配置', -1, '');
INSERT INTO `ot_auth_rule` VALUES (376, 'admin', 1, 'Admin/Invite/buyLog', '兑换记录', 1, '');
INSERT INTO `ot_auth_rule` VALUES (377, 'admin', 1, 'Admin/Invite/inviteLog', '用户邀请记录', 1, '');
INSERT INTO `ot_auth_rule` VALUES (378, 'admin', 1, 'Admin/Invite/userInfo', '邀请码列表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (379, 'admin', 1, 'Admin/Invite/edit', '编辑邀请注册类型', 1, '');
INSERT INTO `ot_auth_rule` VALUES (380, 'admin', 1, 'Admin/Invite/setStatus', '删除邀请', 1, '');
INSERT INTO `ot_auth_rule` VALUES (381, 'admin', 1, 'Admin/Invite/delete', '删除邀请码', 1, '');
INSERT INTO `ot_auth_rule` VALUES (382, 'admin', 1, 'Admin/Invite/createCode', '生成邀请码', 1, '');
INSERT INTO `ot_auth_rule` VALUES (383, 'admin', 1, 'Admin/Invite/deleteTrue', '删除无用邀请码', 1, '');
INSERT INTO `ot_auth_rule` VALUES (384, 'admin', 1, 'Admin/Invite/cvs', '导出cvs', 1, '');
INSERT INTO `ot_auth_rule` VALUES (385, 'admin', 1, 'Admin/Invite/editUserInfo', '用户信息编辑', 1, '');
INSERT INTO `ot_auth_rule` VALUES (386, 'admin', 1, 'Admin/Action/remove', '删除日志', 1, '');
INSERT INTO `ot_auth_rule` VALUES (387, 'admin', 1, 'Admin/Action/clear', '清空日志', 1, '');
INSERT INTO `ot_auth_rule` VALUES (388, 'admin', 1, 'Admin/User/setTypeStatus', '设置积分状态', 1, '');
INSERT INTO `ot_auth_rule` VALUES (389, 'admin', 1, 'Admin/User/delType', '删除积分类型', 1, '');
INSERT INTO `ot_auth_rule` VALUES (390, 'admin', 1, 'Admin/User/getNickname', '充值积分-获取用户昵称', 1, '');
INSERT INTO `ot_auth_rule` VALUES (391, 'admin', 1, 'Admin/Menu/del', '删除菜单', 1, '');
INSERT INTO `ot_auth_rule` VALUES (392, 'admin', 1, 'Admin/Menu/toogleDev', '设置开发者模式可见', 1, '');
INSERT INTO `ot_auth_rule` VALUES (393, 'admin', 1, 'Admin/Menu/toogleHide', '设置显示隐藏', 1, '');
INSERT INTO `ot_auth_rule` VALUES (394, 'admin', 1, 'Admin/ActionLimit/setLimitStatus', '行为限制启用、禁用、删除', 1, '');
INSERT INTO `ot_auth_rule` VALUES (395, 'admin', 1, 'Admin/SEO/setRuleStatus', '启用、禁用、删除、回收站还原', 1, '');
INSERT INTO `ot_auth_rule` VALUES (396, 'admin', 1, 'Admin/SEO/doClear', '回收站彻底删除', 1, '');
INSERT INTO `ot_auth_rule` VALUES (397, 'admin', 1, 'Admin/Role/initUnhaveUser', '初始化无角色用户', 1, '');
INSERT INTO `ot_auth_rule` VALUES (398, 'admin', 1, 'Admin/Addons/delHook', '删除钩子', 1, '');
INSERT INTO `ot_auth_rule` VALUES (399, 'admin', 1, 'Admin/Update/usePack', '使用补丁', 1, '');
INSERT INTO `ot_auth_rule` VALUES (400, 'admin', 1, 'Admin/Update/view', '查看补丁', 1, '');
INSERT INTO `ot_auth_rule` VALUES (401, 'admin', 1, 'Admin/Update/delPack', '删除补丁', 1, '');
INSERT INTO `ot_auth_rule` VALUES (402, 'admin', 1, 'Admin/UserTag/userTag', '用户标签列表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (403, 'admin', 1, 'Admin/UserTag/add', '添加分类、标签', 1, '');
INSERT INTO `ot_auth_rule` VALUES (404, 'admin', 1, 'Admin/UserTag/setStatus', '设置分类、标签状态', 1, '');
INSERT INTO `ot_auth_rule` VALUES (405, 'admin', 1, 'Admin/UserTag/tagTrash', '分类、标签回收站', 1, '');
INSERT INTO `ot_auth_rule` VALUES (406, 'admin', 1, 'Admin/UserTag/userTagClear', '测底删除回收站内容', 1, '');
INSERT INTO `ot_auth_rule` VALUES (407, 'admin', 1, 'Admin/role/configusertag', '可拥有标签配置', 1, '');
INSERT INTO `ot_auth_rule` VALUES (408, 'admin', 1, 'Admin/Module/edit', '编辑模块', 1, '');
INSERT INTO `ot_auth_rule` VALUES (409, 'admin', 1, 'Admin/Config/website', '网站信息', 1, '');
INSERT INTO `ot_auth_rule` VALUES (410, 'admin', 1, 'Admin/Theme/setTheme', '使用主题', 1, '');
INSERT INTO `ot_auth_rule` VALUES (411, 'admin', 1, 'Admin/Theme/lookTheme', '查看主题', 1, '');
INSERT INTO `ot_auth_rule` VALUES (412, 'admin', 1, 'Admin/Theme/packageDownload', '主题打包下载', 1, '');
INSERT INTO `ot_auth_rule` VALUES (413, 'admin', 1, 'Admin/Theme/delete', '卸载删除主题', 1, '');
INSERT INTO `ot_auth_rule` VALUES (414, 'admin', 1, 'Admin/Theme/add', '上传安装主题', 1, '');
INSERT INTO `ot_auth_rule` VALUES (415, 'admin', 2, 'Admin/Home/config', '网站主页', 1, '');
INSERT INTO `ot_auth_rule` VALUES (416, 'admin', 1, 'Admin/Home/config', '基本设置', 1, '');
INSERT INTO `ot_auth_rule` VALUES (417, 'admin', 1, 'Admin/Weibo/topic', '分类管理', 1, '');
INSERT INTO `ot_auth_rule` VALUES (418, 'admin', 1, 'Admin/Weibo/setWeiboTop', '置顶微博', 1, '');
INSERT INTO `ot_auth_rule` VALUES (419, 'admin', 1, 'Admin/Weibo/setWeiboStatus', '设置微博状态', 1, '');
INSERT INTO `ot_auth_rule` VALUES (420, 'admin', 1, 'Admin/Weibo/setCommentStatus', '设置微博评论状态', 1, '');
INSERT INTO `ot_auth_rule` VALUES (421, 'admin', 1, 'Admin/Weibo/setTopicTop', '设置置顶话题', 1, '');
INSERT INTO `ot_auth_rule` VALUES (422, 'admin', 1, 'Admin/Weibo/delTopic', '删除话题', 1, '');
INSERT INTO `ot_auth_rule` VALUES (423, 'admin', 1, 'Admin/People/config', '基本设置', -1, '');
INSERT INTO `ot_auth_rule` VALUES (424, 'admin', 1, 'Admin/Cloud/index', '云市场', 1, '');
INSERT INTO `ot_auth_rule` VALUES (425, 'admin', 2, 'Admin/authorize/ssoSetting', '授权', 1, '');
INSERT INTO `ot_auth_rule` VALUES (426, 'admin', 2, 'Admin/Role/index', '角色', -1, '');
INSERT INTO `ot_auth_rule` VALUES (427, 'admin', 1, 'Admin/Theme/tpls', '主题管理', 1, '');
INSERT INTO `ot_auth_rule` VALUES (428, 'admin', 2, 'Admin/ActionLimit/limitList', '安全', -1, '');
INSERT INTO `ot_auth_rule` VALUES (429, 'admin', 2, 'Admin/Cloud/index', '扩展', 1, '');
INSERT INTO `ot_auth_rule` VALUES (430, 'admin', 2, 'Admin/People/config', '会员展示', -1, '');
INSERT INTO `ot_auth_rule` VALUES (431, 'admin', 1, 'Admin/Index/index', '仪表盘', 1, '');
INSERT INTO `ot_auth_rule` VALUES (432, 'Ucenter', 1, 'Ucenter/Attest/apply', '申请认证', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10000, 'admin', 1, 'Admin/Cloud/install', '在线安装', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10001, 'admin', 1, 'Admin/User/initpass', '重置用户密码', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10002, 'admin', 1, 'Admin/Cloud/version', '获取版本信息', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10003, 'admin', 1, 'Admin/Cloud/getFileList', '获取文件列表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10004, 'admin', 1, 'Admin/Cloud/compare', '比较本地文件', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10005, 'admin', 1, 'Admin/Cloud/cover', '覆盖文件', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10006, 'admin', 1, 'Admin/Cloud/updb', '更新数据库', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10007, 'admin', 1, 'Admin/Cloud/finish', '更新完成', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10008, 'admin', 1, 'Admin/Cloud/getVersionList', '获取扩展升级列表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10009, 'admin', 1, 'Admin/Cloud/updateGoods', '自动升级', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10010, 'admin', 1, 'Admin/Cloud/Updating1', '自动升级1-获取文件列表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10011, 'admin', 1, 'Admin/Cloud/Updating2', '自动升级2-比较文件', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10012, 'admin', 1, 'Admin/Cloud/updating3', '自动升级3-升级代码', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10013, 'admin', 1, 'Admin/Cloud/updating4', '自动升级4-导入数据库', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10014, 'admin', 1, 'Admin/Cloud/updating5', '自动升级5-重置版本号', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10015, 'admin', 1, 'Admin/Adv/pos', '广告位', -1, '');
INSERT INTO `ot_auth_rule` VALUES (10016, 'admin', 1, 'Admin/Adv/adv', '广告管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (10017, 'admin', 1, 'Admin/Adv/editAdv', '新增广告', -1, '');
INSERT INTO `ot_auth_rule` VALUES (10018, 'admin', 1, 'Admin/Adv/editPos', '编辑广告位', -1, '');
INSERT INTO `ot_auth_rule` VALUES (10019, 'admin', 1, 'Admin/Adv/setPosStatus', '设置广告位状态', -1, '');
INSERT INTO `ot_auth_rule` VALUES (10020, 'admin', 1, 'Admin/Adv/schedule', '广告排期', -1, '');
INSERT INTO `ot_auth_rule` VALUES (10021, 'admin', 1, 'Admin/Channel/user', '用户导航', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10022, 'admin', 1, 'Admin/Action/scoreLog', '积分日志', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10023, 'admin', 1, 'Admin/Announce/announceList', '公告列表', -1, '');
INSERT INTO `ot_auth_rule` VALUES (10024, 'admin', 1, 'Admin/Announce/add', '发布公告', -1, '');
INSERT INTO `ot_auth_rule` VALUES (10025, 'admin', 1, 'Admin/Announce/setStatus', '设置公告状态', -1, '');
INSERT INTO `ot_auth_rule` VALUES (10026, 'admin', 1, 'Admin/Announce/arrive', '公告送达情况', -1, '');
INSERT INTO `ot_auth_rule` VALUES (10027, 'admin', 1, 'Admin/Message/messageSessionList', '会话列表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10028, 'admin', 1, 'Admin/Message/messageTplList', '会话模板', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10029, 'admin', 1, 'Admin/Message/sessionRefresh', '刷新会话列表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10030, 'admin', 1, 'Admin/Message/tplRefresh', '刷新会话模板列表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10031, 'admin', 1, 'Admin/Schedule/editSchedule', '新增/编辑计划任务', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10032, 'admin', 1, 'admin/schedule/run', '运行/停止计划任务', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10033, 'admin', 1, 'Admin/Schedule/showLog', '查看日志', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10034, 'admin', 1, 'admin/schedule/clearLog', '清空日志', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10035, 'admin', 1, 'Admin/Schedule/reRun', '重启计划任务', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10036, 'admin', 1, 'Admin/Schedule/setScheduleStatus', '设置计划任务状态', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10037, 'admin', 1, 'Admin/Count/setActiveAction', '设置活跃度绑定的行为', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10038, 'admin', 1, 'Admin/Count/downUser', '下线在线用户', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10039, 'admin', 1, 'Admin/Message/config', '会话设置', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10040, 'admin', 1, 'Admin/Channel/customEdit', '频道编辑', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10041, 'admin', 1, 'Admin/Index/addTo', '添加', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10042, 'admin', 1, 'Admin/Index/delTile', '删除', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10043, 'admin', 1, 'Admin/Index/setTile', '修改', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10044, 'admin', 1, 'Admin/SuperLinks/index', '友情链接', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10045, 'admin', 1, 'Admin/Picture/config', '图片水印设置', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10046, 'admin', 1, 'Admin/Picture/uploadWater', '上传水印图片', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10047, 'admin', 1, 'Admin/Picture/pictureList', '图片列表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10048, 'admin', 1, 'Admin/Picture/setStatus', '设置图片状态、删除图片', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10049, 'admin', 1, 'Admin/Sensitive/index', '敏感词列表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10050, 'admin', 1, 'Admin/Sensitive/config', '敏感词设置', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10051, 'admin', 1, 'Admin/Sensitive/addMore', '批量添加', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10052, 'admin', 1, 'Admin/Sensitive/edit', '新增、编辑敏感词', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10053, 'admin', 1, 'Admin/Sensitive/setStatus', '设置敏感词状态', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10054, 'admin', 1, 'Admin/Expression/iexpressionList', '自定义表情列表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10055, 'admin', 1, 'Admin/Role/moduleRole', '允许身份访问', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10056, 'admin', 1, 'Admin/Attest/attestTypes', '认证类型列表', -1, '');
INSERT INTO `ot_auth_rule` VALUES (10057, 'admin', 1, 'Admin/Attest/setCondition', '认证条件设置', -1, '');
INSERT INTO `ot_auth_rule` VALUES (10058, 'admin', 1, 'Admin/Attest/setFields', '认证字段管理', -1, '');
INSERT INTO `ot_auth_rule` VALUES (10059, 'admin', 1, 'Admin/Attest/editType', '编辑认证类型', -1, '');
INSERT INTO `ot_auth_rule` VALUES (10060, 'admin', 1, 'Admin/Attest/attestList', '认证列表', -1, '');
INSERT INTO `ot_auth_rule` VALUES (10061, 'admin', 1, 'Admin/Attest/setAttestStatus', '设置认证状态', -1, '');
INSERT INTO `ot_auth_rule` VALUES (10062, 'admin', 1, 'Admin/User/bindwechat', '微信绑定', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10063, 'admin', 1, 'Admin/Message/listMessageEvent', '消息模板', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10064, 'admin', 1, 'Admin/Cloud/update', '自动升级', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10065, 'admin', 1, 'Admin/Rank/setVerifyStatus', '用户头衔审核', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10066, 'admin', 1, 'Admin/Index/stats', '数据概览', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10067, 'admin', 1, 'Admin/Count/index', '网站统计', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10068, 'admin', 2, 'Admin/Super_links/index', '运营', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10069, 'admin', 1, 'Admin/Expression/index', '表情设置', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10070, 'admin', 1, 'Admin/Count/lost', '流失率统计', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10071, 'admin', 1, 'Admin/Action/smslog', '短信日志', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10072, 'admin', 1, 'Admin/message/sendMessage', '群发消息', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10073, 'admin', 1, 'Admin/Expression/add', '添加表情包', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10074, 'admin', 1, 'Admin/Count/remain', '留存率统计', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10075, 'admin', 1, 'Admin/Expression/package', '表情包列表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10076, 'admin', 1, 'Admin/Count/consumption', '充值用户统计', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10077, 'admin', 1, 'Admin/Expression/expressionList', '表情列表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10078, 'admin', 1, 'Admin/Count/active', '活跃用户统计', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10079, 'admin', 1, 'Admin/EditorTool/config', '编辑器配置', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10080, 'admin', 1, 'Admin/MarkDown/config', 'MarkDown配置', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10081, 'admin', 1, 'Admin/Expression/delPackage', '删除表情包', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10082, 'admin', 1, 'Admin/Count/nowUserList', '在线用户列表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10083, 'admin', 1, 'Admin/Expression/editPackage', '编辑表情包', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10084, 'admin', 1, 'Admin/Expression/delExpression', '删除表情', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10085, 'admin', 1, 'Admin/Expression/upload', '上传表情包', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10086, 'admin', 1, 'Admin/message/userList', '群发消息用户列表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10087, 'admin', 1, 'admin/schedule/scheduleList', '计划任务列表', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10088, 'admin', 1, 'Admin/Adv/pos/module/Weibo', '广告位', -1, '');
INSERT INTO `ot_auth_rule` VALUES (10089, 'Home', 1, 'deleteLocalComment', '删除本地评论', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10090, 'Home', 1, 'deleteLocalComment', '删除本地评论', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10091, 'Home', 1, 'deleteLocalComment', '删除本地评论', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10128, 'admin', 2, 'Admin/Attest/attestList', '认证中心', -1, '');
INSERT INTO `ot_auth_rule` VALUES (10127, 'admin', 1, 'Admin/Weibo/addWeibo', '作品新增', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10126, 'admin', 1, 'Admin/Weibo/player', '飞手管理', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10125, 'admin', 1, 'Admin/Weibo/organization', '机构管理', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10124, 'admin', 1, 'Admin/Weibo/industry', '行业管理', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10122, 'Weibo', 1, 'Weibo/Topic/beAdmin', '抢先成为话题主持人', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10123, 'Weibo', 1, 'Weibo/Topic/editTopic', '管理话题(管理)', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10121, 'Weibo', 1, 'Weibo/Index/setTop', '微博置顶(管理)', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10120, 'Weibo', 1, 'Weibo/Index/doDelComment', '删除评论微博(管理)', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10119, 'Weibo', 1, 'Weibo/Index/doComment', '评论微博', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10118, 'Weibo', 1, 'Weibo/Index/doSend', '发微博', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10117, 'Weibo', 1, 'Weibo/Index/doDelWeibo', '删除微博(管理)', 1, '');
INSERT INTO `ot_auth_rule` VALUES (10116, 'Weibo', 1, 'Weibo/Index/doSendRepost', '转发微博', 1, '');

-- ----------------------------
-- Table structure for ot_avatar
-- ----------------------------
DROP TABLE IF EXISTS `ot_avatar`;
CREATE TABLE `ot_avatar`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `driver` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `is_temp` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_avatar
-- ----------------------------
INSERT INTO `ot_avatar` VALUES (1, 100, '/100/5b8e482c2f760.png', 'local', 1536051254, 1, 0);
INSERT INTO `ot_avatar` VALUES (2, 1, '/1/5b90f200d3090.png', 'local', 1536225796, 1, 0);

-- ----------------------------
-- Table structure for ot_background
-- ----------------------------
DROP TABLE IF EXISTS `ot_background`;
CREATE TABLE `ot_background`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `background_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ot_background
-- ----------------------------
INSERT INTO `ot_background` VALUES (1, 101, '1', 1538209740, 1);

-- ----------------------------
-- Table structure for ot_channel
-- ----------------------------
DROP TABLE IF EXISTS `ot_channel`;
CREATE TABLE `ot_channel`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级频道ID',
  `title` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '频道标题',
  `url` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '频道连接',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '导航排序',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  `target` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '新窗口打开',
  `color` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `band_color` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `band_text` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` int(11) NOT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_channel
-- ----------------------------
INSERT INTO `ot_channel` VALUES (1, 0, '首页', 'Home/Index/index', 0, 0, 0, 1, 0, '#000000', '#000000', '', 'home', 0, '');
INSERT INTO `ot_channel` VALUES (10, 0, '作品', 'Weibo/index/index', 100, 0, 0, 1, 0, '', '', '', 'quote-left', 0, '');
INSERT INTO `ot_channel` VALUES (3, 0, '管理员中心', 'Manager/index/index', 2, 0, 0, 1, 0, '#000000', '#000000', '', 'home', 0, '');
INSERT INTO `ot_channel` VALUES (8, 0, '作品', 'Works/index/index', 100, 0, 0, 1, 0, '', '', '', 'quote-left', 0, '');
INSERT INTO `ot_channel` VALUES (27, 0, '公告', 'Announce/index/index', 100, 0, 0, 1, 0, '', '', '', 'home', 0, '');
INSERT INTO `ot_channel` VALUES (22, 0, '认证中心', 'Attest/index/index', 100, 0, 0, 1, 0, '', '', '', 'home', 0, '');

-- ----------------------------
-- Table structure for ot_checkin
-- ----------------------------
DROP TABLE IF EXISTS `ot_checkin`;
CREATE TABLE `ot_checkin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of ot_checkin
-- ----------------------------
INSERT INTO `ot_checkin` VALUES (1, 1, 1532405927);
INSERT INTO `ot_checkin` VALUES (2, 1, 1535523583);
INSERT INTO `ot_checkin` VALUES (3, 100, 1535530277);
INSERT INTO `ot_checkin` VALUES (4, 1, 1535601487);
INSERT INTO `ot_checkin` VALUES (5, 1, 1535685463);
INSERT INTO `ot_checkin` VALUES (6, 1, 1535945330);
INSERT INTO `ot_checkin` VALUES (7, 1, 1536136541);
INSERT INTO `ot_checkin` VALUES (8, 1, 1536206742);

-- ----------------------------
-- Table structure for ot_config
-- ----------------------------
DROP TABLE IF EXISTS `ot_config`;
CREATE TABLE `ot_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配置类型',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配置分组',
  `extra` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置说明',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置值',
  `sort` smallint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `group`(`group`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10287 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_config
-- ----------------------------
INSERT INTO `ot_config` VALUES (100, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 11);
INSERT INTO `ot_config` VALUES (101, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举\r\n8:多选框', 8);
INSERT INTO `ot_config` VALUES (102, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统\r\n5:邮件', 15);
INSERT INTO `ot_config` VALUES (103, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 17);
INSERT INTO `ot_config` VALUES (104, 'AUTH_CONFIG', 3, 'Auth配置', 4, '', '自定义Auth.class.php类配置', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 20);
INSERT INTO `ot_config` VALUES (105, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1380427745, 1, '10', 24);
INSERT INTO `ot_config` VALUES (107, 'CODEMIRROR_THEME', 4, '预览插件的CodeMirror主题', 4, '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', 1379814385, 1384740813, 1, 'ambiance', 13);
INSERT INTO `ot_config` VALUES (108, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/Backup', 16);
INSERT INTO `ot_config` VALUES (109, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 18);
INSERT INTO `ot_config` VALUES (110, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 22);
INSERT INTO `ot_config` VALUES (111, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 25);
INSERT INTO `ot_config` VALUES (112, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式，部分后台功能必须在开发者模式下才生效，重新设置后清空缓存生效', 1383105995, 1383291877, 1, '0', 26);
INSERT INTO `ot_config` VALUES (113, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1386644741, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 2);
INSERT INTO `ot_config` VALUES (114, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 3);
INSERT INTO `ot_config` VALUES (115, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 27);
INSERT INTO `ot_config` VALUES (116, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '0', 7);
INSERT INTO `ot_config` VALUES (117, 'MAIL_TYPE', 4, '邮件类型', 5, '1:SMTP 模块发送\r\n2:mail() 函数发送', '如果您选择了采用服务器内置的 Mail 服务，您不需要填写下面的内容', 1388332882, 1388931416, 1, '1', 0);
INSERT INTO `ot_config` VALUES (118, 'MAIL_SMTP_HOST', 1, 'SMTP 服务器', 5, '', 'SMTP服务器', 1388332932, 1388332932, 1, '', 0);
INSERT INTO `ot_config` VALUES (119, 'MAIL_SMTP_PORT', 0, 'SMTP服务器端口', 5, '', '默认25', 1388332975, 1388332975, 1, '25', 0);
INSERT INTO `ot_config` VALUES (120, 'MAIL_SMTP_USER', 1, 'SMTP服务器用户名', 5, '', '填写完整用户名', 1388333010, 1388333010, 1, '', 0);
INSERT INTO `ot_config` VALUES (121, 'MAIL_SMTP_PASS', 6, 'SMTP服务器密码', 5, '', '填写您的密码', 1388333057, 1389187088, 1, '', 0);
INSERT INTO `ot_config` VALUES (122, 'MAIL_USER_PASS', 5, '密码找回模板', 0, '', '支持HTML代码', 1388583989, 1388672614, 1, '密码找回111223333555111', 0);
INSERT INTO `ot_config` VALUES (123, 'PIC_FILE_PATH', 1, '图片文件保存根目录', 4, '', '图片文件保存根目录./目录/', 1388673255, 1388673255, 1, './Uploads/', 0);
INSERT INTO `ot_config` VALUES (124, 'COUNT_DAY', 0, '后台首页统计用户增长天数', 0, '', '默认统计最近半个月的用户数增长情况', 1420791945, 1420876261, 1, '7', 0);
INSERT INTO `ot_config` VALUES (125, 'MAIL_USER_REG', 5, '注册邮件模板', 3, '', '支持HTML代码', 1388337307, 1389532335, 1, '<a href=\"http://www.opensns.cn\" target=\"_blank\">点击进入</a><span style=\"color:#E53333;\">当您收到这封邮件，表明您已注册成功，以上为您的用户名和密码。。。。祝您生活愉快····</span>', 55);
INSERT INTO `ot_config` VALUES (126, 'USER_NAME_BAOLIU', 1, '保留用户名和昵称', 3, '', '禁止注册用户名和昵称，包含这些即无法注册,用\" , \"号隔开，用户只能是英文，下划线_，数字等', 1388845937, 1388845937, 1, '管理员,测试,admin,垃圾', 0);
INSERT INTO `ot_config` VALUES (128, 'VERIFY_OPEN', 8, '验证码配置', 4, 'reg:注册显示\r\nlogin:登陆显示\r\nreset:密码重置', '验证码配置', 1388500332, 1405561711, 1, '', 0);
INSERT INTO `ot_config` VALUES (129, 'VERIFY_TYPE', 4, '验证码类型', 4, '1:中文\r\n2:英文\r\n3:数字\r\n4:英文+数字', '验证码类型', 1388500873, 1405561731, 1, '4', 0);
INSERT INTO `ot_config` VALUES (130, 'NO_BODY_TLE', 2, '空白说明', 2, '', '空白说明', 1392216444, 1392981305, 1, '呵呵，暂时没有内容哦！！', 0);
INSERT INTO `ot_config` VALUES (131, 'USER_RESPASS', 5, '密码找回模板', 3, '', '密码找回文本', 1396191234, 1396191234, 1, '<span style=\"color:#009900;\">请点击以下链接找回密码，如无反应，请将链接地址复制到浏览器中打开(下次登录前有效)</span>', 0);
INSERT INTO `ot_config` VALUES (132, 'COUNT_CODE', 2, '统计代码', 1, '', '用于统计网站访问量的第三方代码，推荐CNZZ统计', 1403058890, 1403058890, 1, '', 12);
INSERT INTO `ot_config` VALUES (134, 'URL_MODEL', 4, 'URL模式', 4, '2:REWRITE模式(开启伪静态)\r\n3:兼容模式', '选择Rewrite模式则开启伪静态，在开启伪静态之前需要先<a href=\"http://v2.opensns.cn/index.php?s=/news/index/detail/id/128.html\" target=\"_blank\">设置伪静态</a>或者阅读/Rewrite/readme.txt中的说明，默认建议开启兼容模式', 1421027546, 1421027676, 1, '3', 0);
INSERT INTO `ot_config` VALUES (135, 'DEFUALT_HOME_URL', 1, '登录前首页Url', 1, '', '支持形如weibo/index/index的ThinkPhp路由写法，支持普通的url写法，不填则显示默认聚合首页', 1417509438, 1427340006, 1, '', 1);
INSERT INTO `ot_config` VALUES (136, 'AUTO_UPDATE', 4, '自动更新提示', 1, '0:关闭,1:开启', '关闭后，后台将不显示更新提示', 1433731153, 1433731348, 1, '1', 2);
INSERT INTO `ot_config` VALUES (137, 'WEB_SITE_CLOSE_HINT', 2, '关站提示文字', 1, '', '站点关闭后的提示文字。', 1433731248, 1433731287, 1, '网站正在更新维护，请稍候再试。', 4);
INSERT INTO `ot_config` VALUES (138, 'SESSION_PREFIX', 1, '网站前台session前缀', 1, '', '当多个网站在同一个根域名下请保证每个网站的前缀不同', 1436923664, 1436923664, 1, 'opensns', 20);
INSERT INTO `ot_config` VALUES (139, 'COOKIE_PREFIX', 1, '网站前台cookie前缀', 1, '', '当多个网站在同一个根域名下请保证每个网站的前缀不同', 1436923664, 1436923664, 1, 'opensns_', 21);
INSERT INTO `ot_config` VALUES (140, 'MAIL_SMTP_CE', 1, '邮件发送测试', 5, '', '填写测试邮件地址', 1388334529, 1388584028, 1, '', 11);
INSERT INTO `ot_config` VALUES (141, 'LOST_LONG', 0, '用户流失标准（天）', 0, '', '', 1469414315, 1469414315, 1, '30', 0);
INSERT INTO `ot_config` VALUES (142, 'MAIL_VERIFY_TYPE', 4, 'SMTP验证方式', 5, '1:无\r\n2:ssl\r\n3:tls', 'SMTP验证方式', 1388332882, 1388931416, 1, '1', 0);
INSERT INTO `ot_config` VALUES (10125, '_USERCONFIG_REG_SWITCH', 0, '', 0, '', '', 1536051972, 1536051972, 1, 'mobile', 0);
INSERT INTO `ot_config` VALUES (10010, '_CONFIG_WEB_SITE_NAME', 0, '', 0, '', '', 1535030228, 1535030228, 1, 'OpenSNS v5开源社群系统', 0);
INSERT INTO `ot_config` VALUES (10011, '_CONFIG_ICP', 0, '', 0, '', '', 1535030228, 1535030228, 1, '浙ICP备12042711号-5', 0);
INSERT INTO `ot_config` VALUES (10012, '_CONFIG_LOGO', 0, '', 0, '', '', 1535030228, 1535030228, 1, '', 0);
INSERT INTO `ot_config` VALUES (10014, '_CONFIG_QRCODE', 0, '', 0, '', '', 1535030228, 1535030228, 1, '', 0);
INSERT INTO `ot_config` VALUES (10027, '_CONFIG_ABOUT_US', 0, '', 0, '', '', 1535030228, 1535030228, 1, '<p>&nbsp; 嘉兴想天信息科技有限公司专注于为客户提供专业的社群方案。公司秉持简洁、高效、创新，不断为客户创造奇迹。旗下产品有OpenSNS开源社群系统和OpenCenter开源用户和后台管理系统。</p>', 0);
INSERT INTO `ot_config` VALUES (1006, '_CONFIG_SUBSCRIB_US', 0, '', 0, '', '', 1427339647, 1427339647, 1, '<p>业务QQ：276905621</p><p>联系地址：浙江省桐乡市环城南路1号电子商务中心</p><p>联系电话：0573-88037510</p>', 0);
INSERT INTO `ot_config` VALUES (10025, '_CONFIG_COPY_RIGHT', 0, '', 0, '', '', 1535030228, 1535030228, 1, '<p>Copyright ©2014-2017 <a href=\"http://www.ourstu.com\" target=\"_blank\">嘉兴想天信息科技有限公司</a></p>', 0);
INSERT INTO `ot_config` VALUES (1008, '_HOME_LOGO', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0);
INSERT INTO `ot_config` VALUES (1009, '_HOME_ENTER_URL', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0);
INSERT INTO `ot_config` VALUES (10185, '_HOME_BLOCK', 0, '', 0, '', '', 1536142124, 1536142124, 1, '[{\"data-id\":\"disable\",\"title\":\"\\u7981\\u7528\",\"items\":[]},{\"data-id\":\"enable\",\"title\":\"\\u542f\\u7528\",\"items\":[{\"data-id\":\"slider\",\"title\":\"\\u8f6e\\u64ad\"},{\"data-id\":\"Weibo\",\"title\":\"\\u5fae\\u535a\"},{\"data-id\":\"People\",\"title\":\"\\u4f1a\\u5458\\u5c55\\u793a\"}]}]', 0);
INSERT INTO `ot_config` VALUES (1011, '_HOME_PIC1', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0);
INSERT INTO `ot_config` VALUES (1012, '_HOME_URL1', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0);
INSERT INTO `ot_config` VALUES (1013, '_HOME_TITLE1', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0);
INSERT INTO `ot_config` VALUES (1014, '_HOME_PIC2', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0);
INSERT INTO `ot_config` VALUES (1015, '_HOME_URL2', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0);
INSERT INTO `ot_config` VALUES (1016, '_HOME_TITLE2', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0);
INSERT INTO `ot_config` VALUES (1017, '_HOME_PIC3', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0);
INSERT INTO `ot_config` VALUES (1018, '_HOME_URL3', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0);
INSERT INTO `ot_config` VALUES (1019, '_HOME_TITLE3', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0);
INSERT INTO `ot_config` VALUES (10026, '_CONFIG_COMPANY', 0, '', 0, '', '', 1535030228, 1535030228, 1, '<p><a href=\"http://www.ourstu.com/joinus.html\" target=\"_blank\"><p><em class=\"icon icon-user\"></em>加入我们</p></a></p><p><em class=\"icon icon-phone-sign\"></em>400-0573-080</p><p><em class=\"icon icon-envelope-alt\"></em>co@ourstu.com</p>', 0);
INSERT INTO `ot_config` VALUES (10013, '_CONFIG_QRCODE_BOTTOM', 0, '', 0, '', '', 1535030228, 1535030228, 1, '', 0);
INSERT INTO `ot_config` VALUES (10151, '_USERCONFIG_UCENTER_KANBAN', 0, '', 0, '', '', 1536051972, 1536051972, 1, '[{\"data-id\":\"disable\",\"title\":\"\\u7981\\u7528\",\"items\":[{\"data-id\":\"Weibo\",\"title\":\"\\u5fae\\u535a\"}]},{\"data-id\":\"enable\",\"title\":\"\\u542f\\u7528\",\"items\":[{\"data-id\":\"follow\",\"title\":\"TA\\u7684\\u5173\\u6ce8\\/\\u7c89\\u4e1d\"},{\"data-id\":\"info\",\"title\":\"\\u8d44\\u6599\"},{\"data-id\":\"rank_title\",\"title\":\"\\u5934\\u8854\"},{\"data-id\":\"topic_list\",\"title\":\"\\u5173\\u6ce8\\u7684\\u8bdd\\u9898\"}]}]', 0);
INSERT INTO `ot_config` VALUES (10286, '_CONFIG_FIRST_USER_RUN', 0, '', 0, '', '', 1542869618, 1542869618, 1, '2018-11-22', 0);
INSERT INTO `ot_config` VALUES (10015, '_CONFIG_JUMP_BACKGROUND', 0, '', 0, '', '', 1535030228, 1535030228, 1, '', 0);
INSERT INTO `ot_config` VALUES (10016, '_CONFIG_SUCCESS_WAIT_TIME', 0, '', 0, '', '', 1535030228, 1535030228, 1, '2', 0);
INSERT INTO `ot_config` VALUES (10017, '_CONFIG_ERROR_WAIT_TIME', 0, '', 0, '', '', 1535030228, 1535030228, 1, '5', 0);
INSERT INTO `ot_config` VALUES (10018, '_CONFIG_OPEN_IM', 0, '', 0, '', '', 1535030228, 1535030228, 1, '0', 0);
INSERT INTO `ot_config` VALUES (10019, '_CONFIG_GET_INFORMATION', 0, '', 0, '', '', 1535030228, 1535030228, 1, '0', 0);
INSERT INTO `ot_config` VALUES (10020, '_CONFIG_GET_INFORMATION_INTERNAL', 0, '', 0, '', '', 1535030228, 1535030228, 1, '10', 0);
INSERT INTO `ot_config` VALUES (10021, '_CONFIG_PICTURE_UPLOAD_DRIVER', 0, '', 0, '', '', 1535030228, 1535030228, 1, 'local', 0);
INSERT INTO `ot_config` VALUES (10022, '_CONFIG_DOWNLOAD_UPLOAD_DRIVER', 0, '', 0, '', '', 1535030228, 1535030228, 1, 'local', 0);
INSERT INTO `ot_config` VALUES (10023, '_CONFIG_WEBSOCKET_ADDRESS', 0, '', 0, '', '', 1535030228, 1535030228, 1, '114.215.90.145', 0);
INSERT INTO `ot_config` VALUES (10024, '_CONFIG_WEBSOCKET_PORT', 0, '', 0, '', '', 1535030228, 1535030228, 1, '8000', 0);
INSERT INTO `ot_config` VALUES (10032, '_SENSITIVE_OPEN_SENSITIVE', 0, '', 0, '', '', 1535535437, 1535535437, 1, '1', 0);
INSERT INTO `ot_config` VALUES (10124, '_USERCONFIG_REGISTER_TYPE', 0, '', 0, '', '', 1536051972, 1536051972, 1, 'normal', 0);
INSERT INTO `ot_config` VALUES (10126, '_USERCONFIG_EMAIL_VERIFY_TYPE', 0, '', 0, '', '', 1536051972, 1536051972, 1, '0', 0);
INSERT INTO `ot_config` VALUES (10127, '_USERCONFIG_MOBILE_VERIFY_TYPE', 0, '', 0, '', '', 1536051972, 1536051972, 1, '0', 0);
INSERT INTO `ot_config` VALUES (10128, '_USERCONFIG_NEW_USER_FOLLOW', 0, '', 0, '', '', 1536051972, 1536051972, 1, '', 0);
INSERT INTO `ot_config` VALUES (10129, '_USERCONFIG_NEW_USER_FANS', 0, '', 0, '', '', 1536051972, 1536051972, 1, '', 0);
INSERT INTO `ot_config` VALUES (10130, '_USERCONFIG_NEW_USER_FRIENDS', 0, '', 0, '', '', 1536051972, 1536051972, 1, '', 0);
INSERT INTO `ot_config` VALUES (10131, '_USERCONFIG_REG_STEP', 0, '', 0, '', '', 1536051972, 1536051972, 1, '[{\"data-id\":\"disable\",\"title\":\"\\u7981\\u7528\",\"items\":[{\"data-id\":\"change_avatar\",\"title\":\"\\u4fee\\u6539\\u5934\\u50cf\"},{\"data-id\":\"expand_info\",\"title\":\"\\u586b\\u5199\\u6269\\u5c55\\u8d44\\u6599\"},{\"data-id\":\"set_tag\",\"title\":\"\\u9009\\u62e9\\u4e2a\\u4eba\\u6807\\u7b7e\"}]},{\"data-id\":\"enable\",\"title\":\"\\u542f\\u7528\",\"items\":[]}]', 0);
INSERT INTO `ot_config` VALUES (10132, '_USERCONFIG_REG_CAN_SKIP', 0, '', 0, '', '', 1536051972, 1536051972, 1, '', 0);
INSERT INTO `ot_config` VALUES (10133, '_USERCONFIG_OPEN_QUICK_LOGIN', 0, '', 0, '', '', 1536051972, 1536051972, 1, '0', 0);
INSERT INTO `ot_config` VALUES (10134, '_USERCONFIG_LOGIN_SWITCH', 0, '', 0, '', '', 1536051972, 1536051972, 1, 'username', 0);
INSERT INTO `ot_config` VALUES (10135, '_USERCONFIG_SYNC_LOGIN_EMAIL_SUFFIX', 0, '', 0, '', '', 1536051972, 1536051972, 1, '@ocenter.com', 0);
INSERT INTO `ot_config` VALUES (10136, '_USERCONFIG_SYNC_REGISTER_ROLE', 0, '', 0, '', '', 1536051972, 1536051972, 1, '1', 0);
INSERT INTO `ot_config` VALUES (10137, '_USERCONFIG_SMS_HOOK', 0, '', 0, '', '', 1536051972, 1536051972, 1, 'none', 0);
INSERT INTO `ot_config` VALUES (10138, '_USERCONFIG_SMS_RESEND', 0, '', 0, '', '', 1536051972, 1536051972, 1, '60', 0);
INSERT INTO `ot_config` VALUES (10139, '_USERCONFIG_SMS_UID', 0, '', 0, '', '', 1536051972, 1536051972, 1, '', 0);
INSERT INTO `ot_config` VALUES (10140, '_USERCONFIG_SMS_PWD', 0, '', 0, '', '', 1536051972, 1536051972, 1, '', 0);
INSERT INTO `ot_config` VALUES (10141, '_USERCONFIG_SMS_CONTENT', 0, '', 0, '', '', 1536051972, 1536051972, 1, '您的验证码为{$verify}验证码，账号为{$account}', 0);
INSERT INTO `ot_config` VALUES (10142, '_USERCONFIG_SMS_CONTENT_PSW', 0, '', 0, '', '', 1536051972, 1536051972, 1, '', 0);
INSERT INTO `ot_config` VALUES (10143, '_USERCONFIG_SMS_CONTENT_MOB', 0, '', 0, '', '', 1536051972, 1536051972, 1, '', 0);
INSERT INTO `ot_config` VALUES (10144, '_USERCONFIG_RANK_LIST', 0, '', 0, '', '', 1536051972, 1536051972, 1, 'fans,con_check,total_check,score', 0);
INSERT INTO `ot_config` VALUES (10145, '_USERCONFIG_LEVEL', 0, '', 0, '', '', 1536051972, 1536051972, 1, '0:Lv1 实习\r\n50:Lv2 试用\r\n100:Lv3 转正\r\n200:Lv4 助理\r\n400:Lv5 经理\r\n800:Lv6 董事\r\n1600:Lv7 董事长', 0);
INSERT INTO `ot_config` VALUES (10146, '_USERCONFIG_NICKNAME_MIN_LENGTH', 0, '', 0, '', '', 1536051972, 1536051972, 1, '2', 0);
INSERT INTO `ot_config` VALUES (10147, '_USERCONFIG_NICKNAME_MAX_LENGTH', 0, '', 0, '', '', 1536051972, 1536051972, 1, '32', 0);
INSERT INTO `ot_config` VALUES (10148, '_USERCONFIG_USERNAME_MIN_LENGTH', 0, '', 0, '', '', 1536051972, 1536051972, 1, '2', 0);
INSERT INTO `ot_config` VALUES (10149, '_USERCONFIG_USERNAME_MAX_LENGTH', 0, '', 0, '', '', 1536051972, 1536051972, 1, '32', 0);
INSERT INTO `ot_config` VALUES (10150, '_USERCONFIG_INIT_USER_NUMBER', 0, '', 0, '', '', 1536051972, 1536051972, 1, '200', 0);
INSERT INTO `ot_config` VALUES (10152, '_USERCONFIG_REG_EMAIL_ACTIVATE', 0, '', 0, '', '', 1536051972, 1536051972, 1, '<p>您在{$title}的激活链接为<a href=\"{$url}\" target=\"_blank\">激活</a>，或者请复制链接：{$url}到浏览器打开。</p>', 0);
INSERT INTO `ot_config` VALUES (10153, '_USERCONFIG_REG_EMAIL_VERIFY', 0, '', 0, '', '', 1536051972, 1536051972, 1, '<p>您的验证码为{$verify}验证码，账号为{$account}。</p>', 0);
INSERT INTO `ot_config` VALUES (10220, '_WEIBO_SHOW_TITLE', 0, '', 0, '', '', 1536632705, 1536632705, 1, '1', 0);
INSERT INTO `ot_config` VALUES (10221, '_WEIBO_WEIBO_BR', 0, '', 0, '', '', 1536632705, 1536632705, 1, '0', 0);
INSERT INTO `ot_config` VALUES (10222, '_WEIBO_HIGH_LIGHT_AT', 0, '', 0, '', '', 1536632705, 1536632705, 1, '1', 0);
INSERT INTO `ot_config` VALUES (10223, '_WEIBO_HIGH_LIGHT_TOPIC', 0, '', 0, '', '', 1536632705, 1536632705, 1, '1', 0);
INSERT INTO `ot_config` VALUES (10224, '_WEIBO_WEIBO_INFO', 0, '', 0, '', '', 1536632705, 1536632705, 1, '有什么新鲜事想告诉大家？', 0);
INSERT INTO `ot_config` VALUES (10225, '_WEIBO_WEIBO_NUM', 0, '', 0, '', '', 1536632705, 1536632705, 1, '140', 0);
INSERT INTO `ot_config` VALUES (10226, '_WEIBO_HOT_LEFT', 0, '', 0, '', '', 1536632705, 1536632705, 1, '3', 0);
INSERT INTO `ot_config` VALUES (10227, '_WEIBO_WEIBO_DEFAULT_TAB', 0, '', 0, '', '', 1536632705, 1536632705, 1, '[{\"data-id\":\"enable\",\"title\":\"\\u542f\\u7528\",\"items\":[{\"data-id\":\"all\",\"title\":\"\\u5168\\u7ad9\\u5173\\u6ce8\"},{\"data-id\":\"concerned\",\"title\":\"\\u6211\\u5173\\u6ce8\\u7684\"},{\"data-id\":\"hot\",\"title\":\"\\u70ed\\u95e8\\u52a8\\u6001\"},{\"data-id\":\"fav\",\"title\":\"\\u6211\\u7684\\u559c\\u6b22\"}]},{\"data-id\":\"disable\",\"title\":\"\\u7981\\u7528\",\"items\":[]}]', 0);
INSERT INTO `ot_config` VALUES (10228, '_WEIBO_HOT_WEIBO_COMMENT_NUM', 0, '', 0, '', '', 1536632705, 1536632705, 1, '10', 0);
INSERT INTO `ot_config` VALUES (10229, '_WEIBO_CAN_IMAGE', 0, '', 0, '', '', 1536632705, 1536632705, 1, '1', 0);
INSERT INTO `ot_config` VALUES (10230, '_WEIBO_CAN_TOPIC', 0, '', 0, '', '', 1536632705, 1536632705, 1, '1', 0);
INSERT INTO `ot_config` VALUES (10231, '_WEIBO_COMMENT_ORDER', 0, '', 0, '', '', 1536632705, 1536632705, 1, '0', 0);
INSERT INTO `ot_config` VALUES (10232, '_WEIBO_SHOW_COMMENT', 0, '', 0, '', '', 1536632705, 1536632705, 1, '1', 0);
INSERT INTO `ot_config` VALUES (10233, '_WEIBO_ACTIVE_USER', 0, '', 0, '', '', 1536632705, 1536632705, 1, '1', 0);
INSERT INTO `ot_config` VALUES (10234, '_WEIBO_ACTIVE_USER_ORDER', 0, '', 0, '', '', 1536632705, 1536632705, 1, '1', 0);
INSERT INTO `ot_config` VALUES (10235, '_WEIBO_ACTIVE_USER_COUNT', 0, '', 0, '', '', 1536632705, 1536632705, 1, '6', 0);
INSERT INTO `ot_config` VALUES (10236, '_WEIBO_NEWEST_USER', 0, '', 0, '', '', 1536632705, 1536632705, 1, '1', 0);
INSERT INTO `ot_config` VALUES (10237, '_WEIBO_NEWEST_USER_COUNT', 0, '', 0, '', '', 1536632705, 1536632705, 1, '6', 0);
INSERT INTO `ot_config` VALUES (10238, '_WEIBO_USE_TOPIC', 0, '', 0, '', '', 1536632705, 1536632705, 1, '人物,动物,风景,创意,人文,科技,美食,色彩,自制', 0);
INSERT INTO `ot_config` VALUES (10239, '_WEIBO_WEIBO_SHOW_TITLE1', 0, '', 0, '', '', 1536632705, 1536632705, 1, '最新动态', 0);
INSERT INTO `ot_config` VALUES (10240, '_WEIBO_WEIBO_SHOW_COUNT1', 0, '', 0, '', '', 1536632705, 1536632705, 1, '5', 0);
INSERT INTO `ot_config` VALUES (10241, '_WEIBO_WEIBO_SHOW_ORDER_FIELD1', 0, '', 0, '', '', 1536632705, 1536632705, 1, 'create_time', 0);
INSERT INTO `ot_config` VALUES (10242, '_WEIBO_WEIBO_SHOW_ORDER_TYPE1', 0, '', 0, '', '', 1536632705, 1536632705, 1, 'desc', 0);
INSERT INTO `ot_config` VALUES (10243, '_WEIBO_WEIBO_SHOW_CACHE_TIME1', 0, '', 0, '', '', 1536632705, 1536632705, 1, '600', 0);
INSERT INTO `ot_config` VALUES (10244, '_WEIBO_WEIBO_SHOW_TITLE2', 0, '', 0, '', '', 1536632705, 1536632705, 1, '热门动态', 0);
INSERT INTO `ot_config` VALUES (10245, '_WEIBO_WEIBO_SHOW_COUNT2', 0, '', 0, '', '', 1536632705, 1536632705, 1, '5', 0);
INSERT INTO `ot_config` VALUES (10246, '_WEIBO_WEIBO_SHOW_ORDER_FIELD2', 0, '', 0, '', '', 1536632705, 1536632705, 1, 'comment_count', 0);
INSERT INTO `ot_config` VALUES (10247, '_WEIBO_WEIBO_SHOW_ORDER_TYPE2', 0, '', 0, '', '', 1536632705, 1536632705, 1, 'desc', 0);
INSERT INTO `ot_config` VALUES (10248, '_WEIBO_WEIBO_SHOW_CACHE_TIME2', 0, '', 0, '', '', 1536632705, 1536632705, 1, '600', 0);
INSERT INTO `ot_config` VALUES (10184, '_HOME_HOME_INDEX_TYPE', 0, '', 0, '', '', 1536142124, 1536142124, 1, 'static_home', 0);
INSERT INTO `ot_config` VALUES (10186, '_HOME_SEARCH', 0, '', 0, '', '', 1536142124, 1536142124, 1, '[{\"data-id\":\"disable\",\"title\":\"\\u7981\\u7528\",\"items\":[]},{\"data-id\":\"enable\",\"title\":\"\\u542f\\u7528\",\"items\":[{\"data-id\":\"People\",\"title\":\"\\u4f1a\\u5458\\u5c55\\u793a\"},{\"data-id\":\"Weibo\",\"title\":\"\\u5fae\\u535a\"}]}]', 0);
INSERT INTO `ot_config` VALUES (10275, '_PICTURE_WATER_OPEN', 0, '', 0, '', '', 1541576018, 1541576018, 1, '0', 0);
INSERT INTO `ot_config` VALUES (10276, '_PICTURE_WATER_IMAGE', 0, '', 0, '', '', 1541576018, 1541576018, 1, './Uploads/water/water.png', 0);
INSERT INTO `ot_config` VALUES (10277, '_PICTURE_WATER_SPACE', 0, '', 0, '', '', 1541576018, 1541576018, 1, '9', 0);

-- ----------------------------
-- Table structure for ot_count_active
-- ----------------------------
DROP TABLE IF EXISTS `ot_count_active`;
CREATE TABLE `ot_count_active`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型:\'day\',\'week\',\'month\'',
  `date` int(11) NOT NULL,
  `num` int(11) NOT NULL COMMENT '活跃人数',
  `total` int(11) NOT NULL COMMENT '总人数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `date`(`date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活跃统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_count_active
-- ----------------------------
INSERT INTO `ot_count_active` VALUES (1, 'day', 1530979200, 0, 0);
INSERT INTO `ot_count_active` VALUES (2, 'day', 1531238400, 0, 0);
INSERT INTO `ot_count_active` VALUES (3, 'day', 1531324800, 1, 0);
INSERT INTO `ot_count_active` VALUES (4, 'day', 1531670400, 0, 0);
INSERT INTO `ot_count_active` VALUES (5, 'day', 1531756800, 1, 0);
INSERT INTO `ot_count_active` VALUES (6, 'day', 1532275200, 0, 0);
INSERT INTO `ot_count_active` VALUES (7, 'day', 1532361600, 1, 0);
INSERT INTO `ot_count_active` VALUES (8, 'day', 1532534400, 0, 0);
INSERT INTO `ot_count_active` VALUES (9, 'day', 1533052800, 0, 0);
INSERT INTO `ot_count_active` VALUES (10, 'day', 1534867200, 0, 0);
INSERT INTO `ot_count_active` VALUES (11, 'day', 1534953600, 1, 0);
INSERT INTO `ot_count_active` VALUES (12, 'day', 1535385600, 0, 0);
INSERT INTO `ot_count_active` VALUES (13, 'day', 1535558400, 1, 0);
INSERT INTO `ot_count_active` VALUES (14, 'day', 1535817600, 0, 0);
INSERT INTO `ot_count_active` VALUES (15, 'day', 1535904000, 2, 0);
INSERT INTO `ot_count_active` VALUES (16, 'day', 1535990400, 3, 0);
INSERT INTO `ot_count_active` VALUES (17, 'day', 1536076800, 3, 0);
INSERT INTO `ot_count_active` VALUES (18, 'day', 1536163200, 2, 0);
INSERT INTO `ot_count_active` VALUES (19, 'day', 1536422400, 0, 0);
INSERT INTO `ot_count_active` VALUES (20, 'day', 1536508800, 2, 0);
INSERT INTO `ot_count_active` VALUES (21, 'day', 1536595200, 2, 0);
INSERT INTO `ot_count_active` VALUES (22, 'day', 1536681600, 0, 0);
INSERT INTO `ot_count_active` VALUES (23, 'day', 1537027200, 0, 0);
INSERT INTO `ot_count_active` VALUES (24, 'day', 1537113600, 1, 0);
INSERT INTO `ot_count_active` VALUES (25, 'day', 1537200000, 1, 0);
INSERT INTO `ot_count_active` VALUES (26, 'day', 1537286400, 1, 0);
INSERT INTO `ot_count_active` VALUES (27, 'day', 1537372800, 1, 0);
INSERT INTO `ot_count_active` VALUES (28, 'day', 1537718400, 0, 0);
INSERT INTO `ot_count_active` VALUES (29, 'day', 1537804800, 1, 0);
INSERT INTO `ot_count_active` VALUES (30, 'day', 1537891200, 1, 0);
INSERT INTO `ot_count_active` VALUES (31, 'day', 1537977600, 1, 0);
INSERT INTO `ot_count_active` VALUES (32, 'day', 1538064000, 0, 0);
INSERT INTO `ot_count_active` VALUES (33, 'day', 1538150400, 1, 0);
INSERT INTO `ot_count_active` VALUES (34, 'week', 1537632007, 1, 0);
INSERT INTO `ot_count_active` VALUES (35, 'day', 1538841600, 0, 0);
INSERT INTO `ot_count_active` VALUES (36, 'day', 1538928000, 2, 0);
INSERT INTO `ot_count_active` VALUES (37, 'day', 1539014400, 2, 0);
INSERT INTO `ot_count_active` VALUES (38, 'day', 1540396800, 0, 0);
INSERT INTO `ot_count_active` VALUES (39, 'day', 1540656000, 0, 0);
INSERT INTO `ot_count_active` VALUES (40, 'day', 1540828800, 0, 0);
INSERT INTO `ot_count_active` VALUES (41, 'day', 1540915200, 0, 0);
INSERT INTO `ot_count_active` VALUES (42, 'month', 1538323230, 2, 0);
INSERT INTO `ot_count_active` VALUES (43, 'day', 1541001600, 1, 0);
INSERT INTO `ot_count_active` VALUES (44, 'day', 1541347200, 0, 0);
INSERT INTO `ot_count_active` VALUES (45, 'day', 1541433600, 0, 0);
INSERT INTO `ot_count_active` VALUES (46, 'day', 1541606400, 0, 0);
INSERT INTO `ot_count_active` VALUES (47, 'day', 1541865600, 0, 0);
INSERT INTO `ot_count_active` VALUES (48, 'day', 1541952000, 1, 0);
INSERT INTO `ot_count_active` VALUES (49, 'day', 1542038400, 1, 0);
INSERT INTO `ot_count_active` VALUES (50, 'day', 1542124800, 1, 0);
INSERT INTO `ot_count_active` VALUES (51, 'day', 1542211200, 1, 0);
INSERT INTO `ot_count_active` VALUES (52, 'day', 1542470400, 0, 0);
INSERT INTO `ot_count_active` VALUES (53, 'day', 1542556800, 1, 0);
INSERT INTO `ot_count_active` VALUES (54, 'day', 1542729600, 0, 0);

-- ----------------------------
-- Table structure for ot_count_lost
-- ----------------------------
DROP TABLE IF EXISTS `ot_count_lost`;
CREATE TABLE `ot_count_lost`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_num` int(11) NOT NULL COMMENT '用户总数',
  `new_lost` int(11) NOT NULL COMMENT '新增流失用户数',
  `date` int(11) NOT NULL COMMENT '日期，时间戳形式',
  `lost_num` int(11) NOT NULL COMMENT '流失用户数',
  `rate` decimal(6, 4) NOT NULL COMMENT '比率0~1之间，小数点四位的小数',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `date`(`date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户流失率统计' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of ot_count_lost
-- ----------------------------
INSERT INTO `ot_count_lost` VALUES (1, 1, 0, 1530979200, 0, 0.0000, 1531127411);
INSERT INTO `ot_count_lost` VALUES (2, 1, 0, 1531238400, 0, 0.0000, 1531383466);
INSERT INTO `ot_count_lost` VALUES (3, 1, 0, 1531324800, 0, 0.0000, 1531411988);
INSERT INTO `ot_count_lost` VALUES (4, 1, 0, 1531670400, 0, 0.0000, 1531814023);
INSERT INTO `ot_count_lost` VALUES (5, 1, 0, 1531756800, 0, 0.0000, 1531843207);
INSERT INTO `ot_count_lost` VALUES (6, 1, 0, 1532275200, 0, 0.0000, 1532405843);
INSERT INTO `ot_count_lost` VALUES (7, 1, 0, 1532361600, 0, 0.0000, 1532503684);
INSERT INTO `ot_count_lost` VALUES (8, 1, 0, 1532534400, 0, 0.0000, 1532664755);
INSERT INTO `ot_count_lost` VALUES (9, 1, 0, 1533052800, 0, 0.0000, 1533205723);
INSERT INTO `ot_count_lost` VALUES (10, 1, 0, 1534867200, 0, 0.0000, 1535013749);
INSERT INTO `ot_count_lost` VALUES (11, 1, 0, 1534953600, 0, 0.0000, 1535041610);
INSERT INTO `ot_count_lost` VALUES (12, 1, 0, 1535385600, 0, 0.0000, 1535522219);
INSERT INTO `ot_count_lost` VALUES (13, 2, 0, 1535558400, 0, 0.0000, 1535680795);
INSERT INTO `ot_count_lost` VALUES (14, 2, 0, 1535817600, 0, 0.0000, 1535940445);
INSERT INTO `ot_count_lost` VALUES (15, 2, 0, 1535904000, 0, 0.0000, 1536024871);
INSERT INTO `ot_count_lost` VALUES (16, 3, 0, 1535990400, 0, 0.0000, 1536112313);
INSERT INTO `ot_count_lost` VALUES (17, 3, 0, 1536076800, 0, 0.0000, 1536198176);
INSERT INTO `ot_count_lost` VALUES (18, 3, 0, 1536163200, 0, 0.0000, 1536284054);
INSERT INTO `ot_count_lost` VALUES (19, 3, 0, 1536422400, 0, 0.0000, 1536542756);
INSERT INTO `ot_count_lost` VALUES (20, 3, 0, 1536508800, 0, 0.0000, 1536629541);
INSERT INTO `ot_count_lost` VALUES (21, 3, 0, 1536595200, 0, 0.0000, 1536715637);
INSERT INTO `ot_count_lost` VALUES (22, 3, 0, 1536681600, 0, 0.0000, 1536821340);
INSERT INTO `ot_count_lost` VALUES (23, 3, 0, 1537027200, 0, 0.0000, 1537148330);
INSERT INTO `ot_count_lost` VALUES (24, 3, 0, 1537113600, 0, 0.0000, 1537233828);
INSERT INTO `ot_count_lost` VALUES (25, 3, 0, 1537200000, 0, 0.0000, 1537320905);
INSERT INTO `ot_count_lost` VALUES (26, 3, 0, 1537286400, 0, 0.0000, 1537417358);
INSERT INTO `ot_count_lost` VALUES (27, 3, 0, 1537372800, 0, 0.0000, 1537494068);
INSERT INTO `ot_count_lost` VALUES (28, 3, 0, 1537718400, 0, 0.0000, 1537839827);
INSERT INTO `ot_count_lost` VALUES (29, 3, 0, 1537804800, 0, 0.0000, 1537926216);
INSERT INTO `ot_count_lost` VALUES (30, 3, 0, 1537891200, 0, 0.0000, 1538012493);
INSERT INTO `ot_count_lost` VALUES (31, 3, 0, 1537977600, 0, 0.0000, 1538125410);
INSERT INTO `ot_count_lost` VALUES (32, 3, 0, 1538064000, 0, 0.0000, 1538186604);
INSERT INTO `ot_count_lost` VALUES (33, 3, 0, 1538150400, 0, 0.0000, 1538273209);
INSERT INTO `ot_count_lost` VALUES (34, 3, 0, 1538841600, 1, 0.3333, 1538963072);
INSERT INTO `ot_count_lost` VALUES (35, 3, -1, 1538928000, 0, 0.0000, 1539049503);
INSERT INTO `ot_count_lost` VALUES (36, 3, 0, 1539014400, 0, 0.0000, 1539135036);
INSERT INTO `ot_count_lost` VALUES (37, 3, 0, 1540396800, 1, 0.3333, 1540535036);
INSERT INTO `ot_count_lost` VALUES (38, 3, 0, 1540656000, 1, 0.3333, 1540779015);
INSERT INTO `ot_count_lost` VALUES (39, 3, 0, 1540828800, 1, 0.3333, 1540951861);
INSERT INTO `ot_count_lost` VALUES (40, 3, 0, 1540915200, 1, 0.3333, 1541037230);
INSERT INTO `ot_count_lost` VALUES (41, 3, 0, 1541001600, 1, 0.3333, 1541130180);
INSERT INTO `ot_count_lost` VALUES (42, 3, 0, 1541347200, 1, 0.3333, 1541489182);
INSERT INTO `ot_count_lost` VALUES (43, 3, 0, 1541433600, 1, 0.3333, 1541556340);
INSERT INTO `ot_count_lost` VALUES (44, 3, 0, 1541606400, 2, 0.6667, 1541737427);
INSERT INTO `ot_count_lost` VALUES (45, 3, 0, 1541865600, 2, 0.6667, 1541987756);
INSERT INTO `ot_count_lost` VALUES (46, 3, 0, 1541952000, 2, 0.6667, 1542075170);
INSERT INTO `ot_count_lost` VALUES (47, 3, 0, 1542038400, 2, 0.6667, 1542160759);
INSERT INTO `ot_count_lost` VALUES (48, 3, 0, 1542124800, 2, 0.6667, 1542251564);
INSERT INTO `ot_count_lost` VALUES (49, 3, 0, 1542211200, 2, 0.6667, 1542332871);
INSERT INTO `ot_count_lost` VALUES (50, 3, 0, 1542470400, 2, 0.6667, 1542591531);
INSERT INTO `ot_count_lost` VALUES (51, 3, 0, 1542556800, 2, 0.6667, 1542678839);
INSERT INTO `ot_count_lost` VALUES (52, 3, 0, 1542729600, 2, 0.6667, 1542869618);

-- ----------------------------
-- Table structure for ot_count_remain
-- ----------------------------
DROP TABLE IF EXISTS `ot_count_remain`;
CREATE TABLE `ot_count_remain`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL COMMENT '日期',
  `day1_num` int(11) NOT NULL COMMENT '第一天登录人数',
  `day2_num` int(11) NOT NULL COMMENT '第二天登录人数',
  `day3_num` int(11) NOT NULL,
  `day4_num` int(11) NOT NULL,
  `day5_num` int(11) NOT NULL,
  `day6_num` int(11) NOT NULL,
  `day7_num` int(11) NOT NULL,
  `day8_num` int(11) NOT NULL,
  `reg_num` int(11) NOT NULL COMMENT '当天注册人数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `date`(`date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 124 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '留存率统计表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of ot_count_remain
-- ----------------------------
INSERT INTO `ot_count_remain` VALUES (1, 1530892800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (2, 1530806400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (3, 1530720000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (4, 1530633600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (5, 1530547200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (6, 1530460800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (7, 1530374400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (8, 1530288000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (9, 1531152000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (10, 1531065600, 0, 0, 1, 0, 0, 0, 0, 1, 1);
INSERT INTO `ot_count_remain` VALUES (11, 1530979200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (12, 1531238400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (13, 1531584000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (14, 1531497600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (15, 1531411200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (16, 1531324800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (17, 1531670400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (18, 1532188800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (19, 1532102400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (20, 1532016000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (21, 1531929600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (22, 1531843200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (23, 1531756800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (24, 1532275200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (25, 1532448000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (26, 1532361600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (27, 1532966400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (28, 1532880000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (29, 1532793600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (30, 1532707200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (31, 1532620800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (32, 1532534400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (33, 1534780800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (34, 1534694400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (35, 1534608000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (36, 1534521600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (37, 1534435200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (38, 1534348800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (39, 1534262400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (40, 1534176000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (41, 1534867200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (42, 1535299200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (43, 1535212800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (44, 1535126400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (45, 1535040000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (46, 1534953600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (47, 1535472000, 0, 0, 0, 0, 1, 1, 1, 1, 1);
INSERT INTO `ot_count_remain` VALUES (48, 1535385600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (49, 1535731200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (50, 1535644800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (51, 1535558400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (52, 1535817600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (53, 1535904000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (54, 1535990400, 1, 0, 0, 0, 0, 1, 1, 0, 1);
INSERT INTO `ot_count_remain` VALUES (55, 1536076800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (56, 1536336000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (57, 1536249600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (58, 1536163200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (59, 1536422400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (60, 1536508800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (61, 1536595200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (62, 1536940800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (63, 1536854400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (64, 1536768000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (65, 1536681600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (66, 1537027200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (67, 1537113600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (68, 1537200000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (69, 1537286400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (70, 1537632000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (71, 1537545600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (72, 1537459200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (73, 1537372800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (74, 1537718400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (75, 1537804800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (76, 1537891200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (77, 1537977600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (78, 1538064000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (79, 1538755200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (80, 1538668800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (81, 1538582400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (82, 1538496000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (83, 1538409600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (84, 1538323200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (85, 1538236800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (86, 1538150400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (87, 1538841600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (88, 1538928000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (89, 1540310400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (90, 1540224000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (91, 1540137600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (92, 1540051200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (93, 1539964800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (94, 1539878400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (95, 1539792000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (96, 1539705600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (97, 1540569600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (98, 1540483200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (99, 1540396800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (100, 1540742400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (101, 1540656000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (102, 1540828800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (103, 1540915200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (104, 1541260800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (105, 1541174400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (106, 1541088000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (107, 1541001600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (108, 1541347200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (109, 1541520000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (110, 1541433600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (111, 1541779200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (112, 1541692800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (113, 1541606400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (114, 1541865600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (115, 1541952000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (116, 1542038400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (117, 1542124800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (118, 1542384000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (119, 1542297600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (120, 1542211200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (121, 1542470400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (122, 1542643200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ot_count_remain` VALUES (123, 1542556800, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for ot_district
-- ----------------------------
DROP TABLE IF EXISTS `ot_district`;
CREATE TABLE `ot_district`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `level` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `upid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 910007 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '中国省市区乡镇数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_district
-- ----------------------------
INSERT INTO `ot_district` VALUES (110000, '北京市', 1, 0);
INSERT INTO `ot_district` VALUES (120000, '天津市', 1, 0);
INSERT INTO `ot_district` VALUES (130000, '河北省', 1, 0);
INSERT INTO `ot_district` VALUES (140000, '山西省', 1, 0);
INSERT INTO `ot_district` VALUES (150000, '内蒙古', 1, 0);
INSERT INTO `ot_district` VALUES (210000, '辽宁省', 1, 0);
INSERT INTO `ot_district` VALUES (220000, '吉林省', 1, 0);
INSERT INTO `ot_district` VALUES (230000, '黑龙江', 1, 0);
INSERT INTO `ot_district` VALUES (310000, '上海市', 1, 0);
INSERT INTO `ot_district` VALUES (320000, '江苏省', 1, 0);
INSERT INTO `ot_district` VALUES (330000, '浙江省', 1, 0);
INSERT INTO `ot_district` VALUES (340000, '安徽省', 1, 0);
INSERT INTO `ot_district` VALUES (350000, '福建省', 1, 0);
INSERT INTO `ot_district` VALUES (360000, '江西省', 1, 0);
INSERT INTO `ot_district` VALUES (370000, '山东省', 1, 0);
INSERT INTO `ot_district` VALUES (410000, '河南省', 1, 0);
INSERT INTO `ot_district` VALUES (420000, '湖北省', 1, 0);
INSERT INTO `ot_district` VALUES (430000, '湖南省', 1, 0);
INSERT INTO `ot_district` VALUES (440000, '广东省', 1, 0);
INSERT INTO `ot_district` VALUES (450000, '广西省', 1, 0);
INSERT INTO `ot_district` VALUES (460000, '海南省', 1, 0);
INSERT INTO `ot_district` VALUES (500000, '重庆市', 1, 0);
INSERT INTO `ot_district` VALUES (510000, '四川省', 1, 0);
INSERT INTO `ot_district` VALUES (520000, '贵州省', 1, 0);
INSERT INTO `ot_district` VALUES (530000, '云南省', 1, 0);
INSERT INTO `ot_district` VALUES (540000, '西　藏', 1, 0);
INSERT INTO `ot_district` VALUES (610000, '陕西省', 1, 0);
INSERT INTO `ot_district` VALUES (620000, '甘肃省', 1, 0);
INSERT INTO `ot_district` VALUES (630000, '青海省', 1, 0);
INSERT INTO `ot_district` VALUES (640000, '宁　夏', 1, 0);
INSERT INTO `ot_district` VALUES (650000, '新　疆', 1, 0);
INSERT INTO `ot_district` VALUES (710000, '台湾省', 1, 0);
INSERT INTO `ot_district` VALUES (810000, '香　港', 1, 0);
INSERT INTO `ot_district` VALUES (820000, '澳　门', 1, 0);
INSERT INTO `ot_district` VALUES (110100, '北京市', 2, 110000);
INSERT INTO `ot_district` VALUES (110200, '县', 2, 110000);
INSERT INTO `ot_district` VALUES (120100, '市辖区', 2, 120000);
INSERT INTO `ot_district` VALUES (120200, '县', 2, 120000);
INSERT INTO `ot_district` VALUES (130100, '石家庄市', 2, 130000);
INSERT INTO `ot_district` VALUES (130200, '唐山市', 2, 130000);
INSERT INTO `ot_district` VALUES (130300, '秦皇岛市', 2, 130000);
INSERT INTO `ot_district` VALUES (130400, '邯郸市', 2, 130000);
INSERT INTO `ot_district` VALUES (130500, '邢台市', 2, 130000);
INSERT INTO `ot_district` VALUES (130600, '保定市', 2, 130000);
INSERT INTO `ot_district` VALUES (130700, '张家口市', 2, 130000);
INSERT INTO `ot_district` VALUES (130800, '承德市', 2, 130000);
INSERT INTO `ot_district` VALUES (130900, '沧州市', 2, 130000);
INSERT INTO `ot_district` VALUES (131000, '廊坊市', 2, 130000);
INSERT INTO `ot_district` VALUES (131100, '衡水市', 2, 130000);
INSERT INTO `ot_district` VALUES (140100, '太原市', 2, 140000);
INSERT INTO `ot_district` VALUES (140200, '大同市', 2, 140000);
INSERT INTO `ot_district` VALUES (140300, '阳泉市', 2, 140000);
INSERT INTO `ot_district` VALUES (140400, '长治市', 2, 140000);
INSERT INTO `ot_district` VALUES (140500, '晋城市', 2, 140000);
INSERT INTO `ot_district` VALUES (140600, '朔州市', 2, 140000);
INSERT INTO `ot_district` VALUES (140700, '晋中市', 2, 140000);
INSERT INTO `ot_district` VALUES (140800, '运城市', 2, 140000);
INSERT INTO `ot_district` VALUES (140900, '忻州市', 2, 140000);
INSERT INTO `ot_district` VALUES (141000, '临汾市', 2, 140000);
INSERT INTO `ot_district` VALUES (141100, '吕梁市', 2, 140000);
INSERT INTO `ot_district` VALUES (150100, '呼和浩特市', 2, 150000);
INSERT INTO `ot_district` VALUES (150200, '包头市', 2, 150000);
INSERT INTO `ot_district` VALUES (150300, '乌海市', 2, 150000);
INSERT INTO `ot_district` VALUES (150400, '赤峰市', 2, 150000);
INSERT INTO `ot_district` VALUES (150500, '通辽市', 2, 150000);
INSERT INTO `ot_district` VALUES (150600, '鄂尔多斯市', 2, 150000);
INSERT INTO `ot_district` VALUES (150700, '呼伦贝尔市', 2, 150000);
INSERT INTO `ot_district` VALUES (150800, '巴彦淖尔市', 2, 150000);
INSERT INTO `ot_district` VALUES (150900, '乌兰察布市', 2, 150000);
INSERT INTO `ot_district` VALUES (152200, '兴安盟', 2, 150000);
INSERT INTO `ot_district` VALUES (152500, '锡林郭勒盟', 2, 150000);
INSERT INTO `ot_district` VALUES (152900, '阿拉善盟', 2, 150000);
INSERT INTO `ot_district` VALUES (210100, '沈阳市', 2, 210000);
INSERT INTO `ot_district` VALUES (210200, '大连市', 2, 210000);
INSERT INTO `ot_district` VALUES (210300, '鞍山市', 2, 210000);
INSERT INTO `ot_district` VALUES (210400, '抚顺市', 2, 210000);
INSERT INTO `ot_district` VALUES (210500, '本溪市', 2, 210000);
INSERT INTO `ot_district` VALUES (210600, '丹东市', 2, 210000);
INSERT INTO `ot_district` VALUES (210700, '锦州市', 2, 210000);
INSERT INTO `ot_district` VALUES (210800, '营口市', 2, 210000);
INSERT INTO `ot_district` VALUES (210900, '阜新市', 2, 210000);
INSERT INTO `ot_district` VALUES (211000, '辽阳市', 2, 210000);
INSERT INTO `ot_district` VALUES (211100, '盘锦市', 2, 210000);
INSERT INTO `ot_district` VALUES (211200, '铁岭市', 2, 210000);
INSERT INTO `ot_district` VALUES (211300, '朝阳市', 2, 210000);
INSERT INTO `ot_district` VALUES (211400, '葫芦岛市', 2, 210000);
INSERT INTO `ot_district` VALUES (220100, '长春市', 2, 220000);
INSERT INTO `ot_district` VALUES (220200, '吉林市', 2, 220000);
INSERT INTO `ot_district` VALUES (220300, '四平市', 2, 220000);
INSERT INTO `ot_district` VALUES (220400, '辽源市', 2, 220000);
INSERT INTO `ot_district` VALUES (220500, '通化市', 2, 220000);
INSERT INTO `ot_district` VALUES (220600, '白山市', 2, 220000);
INSERT INTO `ot_district` VALUES (220700, '松原市', 2, 220000);
INSERT INTO `ot_district` VALUES (220800, '白城市', 2, 220000);
INSERT INTO `ot_district` VALUES (222400, '延边朝鲜族自治州', 2, 220000);
INSERT INTO `ot_district` VALUES (230100, '哈尔滨市', 2, 230000);
INSERT INTO `ot_district` VALUES (230200, '齐齐哈尔市', 2, 230000);
INSERT INTO `ot_district` VALUES (230300, '鸡西市', 2, 230000);
INSERT INTO `ot_district` VALUES (230400, '鹤岗市', 2, 230000);
INSERT INTO `ot_district` VALUES (230500, '双鸭山市', 2, 230000);
INSERT INTO `ot_district` VALUES (230600, '大庆市', 2, 230000);
INSERT INTO `ot_district` VALUES (230700, '伊春市', 2, 230000);
INSERT INTO `ot_district` VALUES (230800, '佳木斯市', 2, 230000);
INSERT INTO `ot_district` VALUES (230900, '七台河市', 2, 230000);
INSERT INTO `ot_district` VALUES (231000, '牡丹江市', 2, 230000);
INSERT INTO `ot_district` VALUES (231100, '黑河市', 2, 230000);
INSERT INTO `ot_district` VALUES (231200, '绥化市', 2, 230000);
INSERT INTO `ot_district` VALUES (232700, '大兴安岭地区', 2, 230000);
INSERT INTO `ot_district` VALUES (310100, '市辖区', 2, 310000);
INSERT INTO `ot_district` VALUES (310200, '县', 2, 310000);
INSERT INTO `ot_district` VALUES (320100, '南京市', 2, 320000);
INSERT INTO `ot_district` VALUES (320200, '无锡市', 2, 320000);
INSERT INTO `ot_district` VALUES (320300, '徐州市', 2, 320000);
INSERT INTO `ot_district` VALUES (320400, '常州市', 2, 320000);
INSERT INTO `ot_district` VALUES (320500, '苏州市', 2, 320000);
INSERT INTO `ot_district` VALUES (320600, '南通市', 2, 320000);
INSERT INTO `ot_district` VALUES (320700, '连云港市', 2, 320000);
INSERT INTO `ot_district` VALUES (320800, '淮安市', 2, 320000);
INSERT INTO `ot_district` VALUES (320900, '盐城市', 2, 320000);
INSERT INTO `ot_district` VALUES (321000, '扬州市', 2, 320000);
INSERT INTO `ot_district` VALUES (321100, '镇江市', 2, 320000);
INSERT INTO `ot_district` VALUES (321200, '泰州市', 2, 320000);
INSERT INTO `ot_district` VALUES (321300, '宿迁市', 2, 320000);
INSERT INTO `ot_district` VALUES (330100, '杭州市', 2, 330000);
INSERT INTO `ot_district` VALUES (330200, '宁波市', 2, 330000);
INSERT INTO `ot_district` VALUES (330300, '温州市', 2, 330000);
INSERT INTO `ot_district` VALUES (330400, '嘉兴市', 2, 330000);
INSERT INTO `ot_district` VALUES (330500, '湖州市', 2, 330000);
INSERT INTO `ot_district` VALUES (330600, '绍兴市', 2, 330000);
INSERT INTO `ot_district` VALUES (330700, '金华市', 2, 330000);
INSERT INTO `ot_district` VALUES (330800, '衢州市', 2, 330000);
INSERT INTO `ot_district` VALUES (330900, '舟山市', 2, 330000);
INSERT INTO `ot_district` VALUES (331000, '台州市', 2, 330000);
INSERT INTO `ot_district` VALUES (331100, '丽水市', 2, 330000);
INSERT INTO `ot_district` VALUES (340100, '合肥市', 2, 340000);
INSERT INTO `ot_district` VALUES (340200, '芜湖市', 2, 340000);
INSERT INTO `ot_district` VALUES (340300, '蚌埠市', 2, 340000);
INSERT INTO `ot_district` VALUES (340400, '淮南市', 2, 340000);
INSERT INTO `ot_district` VALUES (340500, '马鞍山市', 2, 340000);
INSERT INTO `ot_district` VALUES (340600, '淮北市', 2, 340000);
INSERT INTO `ot_district` VALUES (340700, '铜陵市', 2, 340000);
INSERT INTO `ot_district` VALUES (340800, '安庆市', 2, 340000);
INSERT INTO `ot_district` VALUES (341000, '黄山市', 2, 340000);
INSERT INTO `ot_district` VALUES (341100, '滁州市', 2, 340000);
INSERT INTO `ot_district` VALUES (341200, '阜阳市', 2, 340000);
INSERT INTO `ot_district` VALUES (341300, '宿州市', 2, 340000);
INSERT INTO `ot_district` VALUES (341500, '六安市', 2, 340000);
INSERT INTO `ot_district` VALUES (341600, '亳州市', 2, 340000);
INSERT INTO `ot_district` VALUES (341700, '池州市', 2, 340000);
INSERT INTO `ot_district` VALUES (341800, '宣城市', 2, 340000);
INSERT INTO `ot_district` VALUES (350100, '福州市', 2, 350000);
INSERT INTO `ot_district` VALUES (350200, '厦门市', 2, 350000);
INSERT INTO `ot_district` VALUES (350300, '莆田市', 2, 350000);
INSERT INTO `ot_district` VALUES (350400, '三明市', 2, 350000);
INSERT INTO `ot_district` VALUES (350500, '泉州市', 2, 350000);
INSERT INTO `ot_district` VALUES (350600, '漳州市', 2, 350000);
INSERT INTO `ot_district` VALUES (350700, '南平市', 2, 350000);
INSERT INTO `ot_district` VALUES (350800, '龙岩市', 2, 350000);
INSERT INTO `ot_district` VALUES (350900, '宁德市', 2, 350000);
INSERT INTO `ot_district` VALUES (360100, '南昌市', 2, 360000);
INSERT INTO `ot_district` VALUES (360200, '景德镇市', 2, 360000);
INSERT INTO `ot_district` VALUES (360300, '萍乡市', 2, 360000);
INSERT INTO `ot_district` VALUES (360400, '九江市', 2, 360000);
INSERT INTO `ot_district` VALUES (360500, '新余市', 2, 360000);
INSERT INTO `ot_district` VALUES (360600, '鹰潭市', 2, 360000);
INSERT INTO `ot_district` VALUES (360700, '赣州市', 2, 360000);
INSERT INTO `ot_district` VALUES (360800, '吉安市', 2, 360000);
INSERT INTO `ot_district` VALUES (360900, '宜春市', 2, 360000);
INSERT INTO `ot_district` VALUES (361000, '抚州市', 2, 360000);
INSERT INTO `ot_district` VALUES (361100, '上饶市', 2, 360000);
INSERT INTO `ot_district` VALUES (370100, '济南市', 2, 370000);
INSERT INTO `ot_district` VALUES (370200, '青岛市', 2, 370000);
INSERT INTO `ot_district` VALUES (370300, '淄博市', 2, 370000);
INSERT INTO `ot_district` VALUES (370400, '枣庄市', 2, 370000);
INSERT INTO `ot_district` VALUES (370500, '东营市', 2, 370000);
INSERT INTO `ot_district` VALUES (370600, '烟台市', 2, 370000);
INSERT INTO `ot_district` VALUES (370700, '潍坊市', 2, 370000);
INSERT INTO `ot_district` VALUES (370800, '济宁市', 2, 370000);
INSERT INTO `ot_district` VALUES (370900, '泰安市', 2, 370000);
INSERT INTO `ot_district` VALUES (371000, '威海市', 2, 370000);
INSERT INTO `ot_district` VALUES (371100, '日照市', 2, 370000);
INSERT INTO `ot_district` VALUES (371200, '莱芜市', 2, 370000);
INSERT INTO `ot_district` VALUES (371300, '临沂市', 2, 370000);
INSERT INTO `ot_district` VALUES (371400, '德州市', 2, 370000);
INSERT INTO `ot_district` VALUES (371500, '聊城市', 2, 370000);
INSERT INTO `ot_district` VALUES (371600, '滨州市', 2, 370000);
INSERT INTO `ot_district` VALUES (371700, '菏泽市', 2, 370000);
INSERT INTO `ot_district` VALUES (410100, '郑州市', 2, 410000);
INSERT INTO `ot_district` VALUES (410200, '开封市', 2, 410000);
INSERT INTO `ot_district` VALUES (410300, '洛阳市', 2, 410000);
INSERT INTO `ot_district` VALUES (410400, '平顶山市', 2, 410000);
INSERT INTO `ot_district` VALUES (410500, '安阳市', 2, 410000);
INSERT INTO `ot_district` VALUES (410600, '鹤壁市', 2, 410000);
INSERT INTO `ot_district` VALUES (410700, '新乡市', 2, 410000);
INSERT INTO `ot_district` VALUES (410800, '焦作市', 2, 410000);
INSERT INTO `ot_district` VALUES (410900, '濮阳市', 2, 410000);
INSERT INTO `ot_district` VALUES (411000, '许昌市', 2, 410000);
INSERT INTO `ot_district` VALUES (411100, '漯河市', 2, 410000);
INSERT INTO `ot_district` VALUES (411200, '三门峡市', 2, 410000);
INSERT INTO `ot_district` VALUES (411300, '南阳市', 2, 410000);
INSERT INTO `ot_district` VALUES (411400, '商丘市', 2, 410000);
INSERT INTO `ot_district` VALUES (411500, '信阳市', 2, 410000);
INSERT INTO `ot_district` VALUES (411600, '周口市', 2, 410000);
INSERT INTO `ot_district` VALUES (411700, '驻马店市', 2, 410000);
INSERT INTO `ot_district` VALUES (420100, '武汉市', 2, 420000);
INSERT INTO `ot_district` VALUES (420200, '黄石市', 2, 420000);
INSERT INTO `ot_district` VALUES (420300, '十堰市', 2, 420000);
INSERT INTO `ot_district` VALUES (420500, '宜昌市', 2, 420000);
INSERT INTO `ot_district` VALUES (420600, '襄樊市', 2, 420000);
INSERT INTO `ot_district` VALUES (420700, '鄂州市', 2, 420000);
INSERT INTO `ot_district` VALUES (420800, '荆门市', 2, 420000);
INSERT INTO `ot_district` VALUES (420900, '孝感市', 2, 420000);
INSERT INTO `ot_district` VALUES (421000, '荆州市', 2, 420000);
INSERT INTO `ot_district` VALUES (421100, '黄冈市', 2, 420000);
INSERT INTO `ot_district` VALUES (421200, '咸宁市', 2, 420000);
INSERT INTO `ot_district` VALUES (421300, '随州市', 2, 420000);
INSERT INTO `ot_district` VALUES (422800, '恩施土家族苗族自治州', 2, 420000);
INSERT INTO `ot_district` VALUES (429000, '省直辖行政单位', 2, 420000);
INSERT INTO `ot_district` VALUES (430100, '长沙市', 2, 430000);
INSERT INTO `ot_district` VALUES (430200, '株洲市', 2, 430000);
INSERT INTO `ot_district` VALUES (430300, '湘潭市', 2, 430000);
INSERT INTO `ot_district` VALUES (430400, '衡阳市', 2, 430000);
INSERT INTO `ot_district` VALUES (430500, '邵阳市', 2, 430000);
INSERT INTO `ot_district` VALUES (430600, '岳阳市', 2, 430000);
INSERT INTO `ot_district` VALUES (430700, '常德市', 2, 430000);
INSERT INTO `ot_district` VALUES (430800, '张家界市', 2, 430000);
INSERT INTO `ot_district` VALUES (430900, '益阳市', 2, 430000);
INSERT INTO `ot_district` VALUES (431000, '郴州市', 2, 430000);
INSERT INTO `ot_district` VALUES (431100, '永州市', 2, 430000);
INSERT INTO `ot_district` VALUES (431200, '怀化市', 2, 430000);
INSERT INTO `ot_district` VALUES (431300, '娄底市', 2, 430000);
INSERT INTO `ot_district` VALUES (433100, '湘西土家族苗族自治州', 2, 430000);
INSERT INTO `ot_district` VALUES (440100, '广州市', 2, 440000);
INSERT INTO `ot_district` VALUES (440200, '韶关市', 2, 440000);
INSERT INTO `ot_district` VALUES (440300, '深圳市', 2, 440000);
INSERT INTO `ot_district` VALUES (440400, '珠海市', 2, 440000);
INSERT INTO `ot_district` VALUES (440500, '汕头市', 2, 440000);
INSERT INTO `ot_district` VALUES (440600, '佛山市', 2, 440000);
INSERT INTO `ot_district` VALUES (440700, '江门市', 2, 440000);
INSERT INTO `ot_district` VALUES (440800, '湛江市', 2, 440000);
INSERT INTO `ot_district` VALUES (440900, '茂名市', 2, 440000);
INSERT INTO `ot_district` VALUES (441200, '肇庆市', 2, 440000);
INSERT INTO `ot_district` VALUES (441300, '惠州市', 2, 440000);
INSERT INTO `ot_district` VALUES (441400, '梅州市', 2, 440000);
INSERT INTO `ot_district` VALUES (441500, '汕尾市', 2, 440000);
INSERT INTO `ot_district` VALUES (441600, '河源市', 2, 440000);
INSERT INTO `ot_district` VALUES (441700, '阳江市', 2, 440000);
INSERT INTO `ot_district` VALUES (441800, '清远市', 2, 440000);
INSERT INTO `ot_district` VALUES (441900, '东莞市', 2, 440000);
INSERT INTO `ot_district` VALUES (442000, '中山市', 2, 440000);
INSERT INTO `ot_district` VALUES (445100, '潮州市', 2, 440000);
INSERT INTO `ot_district` VALUES (445200, '揭阳市', 2, 440000);
INSERT INTO `ot_district` VALUES (445300, '云浮市', 2, 440000);
INSERT INTO `ot_district` VALUES (450100, '南宁市', 2, 450000);
INSERT INTO `ot_district` VALUES (450200, '柳州市', 2, 450000);
INSERT INTO `ot_district` VALUES (450300, '桂林市', 2, 450000);
INSERT INTO `ot_district` VALUES (450400, '梧州市', 2, 450000);
INSERT INTO `ot_district` VALUES (450500, '北海市', 2, 450000);
INSERT INTO `ot_district` VALUES (450600, '防城港市', 2, 450000);
INSERT INTO `ot_district` VALUES (450700, '钦州市', 2, 450000);
INSERT INTO `ot_district` VALUES (450800, '贵港市', 2, 450000);
INSERT INTO `ot_district` VALUES (450900, '玉林市', 2, 450000);
INSERT INTO `ot_district` VALUES (451000, '百色市', 2, 450000);
INSERT INTO `ot_district` VALUES (451100, '贺州市', 2, 450000);
INSERT INTO `ot_district` VALUES (451200, '河池市', 2, 450000);
INSERT INTO `ot_district` VALUES (451300, '来宾市', 2, 450000);
INSERT INTO `ot_district` VALUES (451400, '崇左市', 2, 450000);
INSERT INTO `ot_district` VALUES (460100, '海口市', 2, 460000);
INSERT INTO `ot_district` VALUES (460200, '三亚市', 2, 460000);
INSERT INTO `ot_district` VALUES (469000, '省直辖县级行政单位', 2, 460000);
INSERT INTO `ot_district` VALUES (500100, '市辖区', 2, 500000);
INSERT INTO `ot_district` VALUES (500200, '县', 2, 500000);
INSERT INTO `ot_district` VALUES (500300, '市', 2, 500000);
INSERT INTO `ot_district` VALUES (510100, '成都市', 2, 510000);
INSERT INTO `ot_district` VALUES (510300, '自贡市', 2, 510000);
INSERT INTO `ot_district` VALUES (510400, '攀枝花市', 2, 510000);
INSERT INTO `ot_district` VALUES (510500, '泸州市', 2, 510000);
INSERT INTO `ot_district` VALUES (510600, '德阳市', 2, 510000);
INSERT INTO `ot_district` VALUES (510700, '绵阳市', 2, 510000);
INSERT INTO `ot_district` VALUES (510800, '广元市', 2, 510000);
INSERT INTO `ot_district` VALUES (510900, '遂宁市', 2, 510000);
INSERT INTO `ot_district` VALUES (511000, '内江市', 2, 510000);
INSERT INTO `ot_district` VALUES (511100, '乐山市', 2, 510000);
INSERT INTO `ot_district` VALUES (511300, '南充市', 2, 510000);
INSERT INTO `ot_district` VALUES (511400, '眉山市', 2, 510000);
INSERT INTO `ot_district` VALUES (511500, '宜宾市', 2, 510000);
INSERT INTO `ot_district` VALUES (511600, '广安市', 2, 510000);
INSERT INTO `ot_district` VALUES (511700, '达州市', 2, 510000);
INSERT INTO `ot_district` VALUES (511800, '雅安市', 2, 510000);
INSERT INTO `ot_district` VALUES (511900, '巴中市', 2, 510000);
INSERT INTO `ot_district` VALUES (512000, '资阳市', 2, 510000);
INSERT INTO `ot_district` VALUES (513200, '阿坝藏族羌族自治州', 2, 510000);
INSERT INTO `ot_district` VALUES (513300, '甘孜藏族自治州', 2, 510000);
INSERT INTO `ot_district` VALUES (513400, '凉山彝族自治州', 2, 510000);
INSERT INTO `ot_district` VALUES (520100, '贵阳市', 2, 520000);
INSERT INTO `ot_district` VALUES (520200, '六盘水市', 2, 520000);
INSERT INTO `ot_district` VALUES (520300, '遵义市', 2, 520000);
INSERT INTO `ot_district` VALUES (520400, '安顺市', 2, 520000);
INSERT INTO `ot_district` VALUES (522200, '铜仁地区', 2, 520000);
INSERT INTO `ot_district` VALUES (522300, '黔西南布依族苗族自治州', 2, 520000);
INSERT INTO `ot_district` VALUES (522400, '毕节地区', 2, 520000);
INSERT INTO `ot_district` VALUES (522600, '黔东南苗族侗族自治州', 2, 520000);
INSERT INTO `ot_district` VALUES (522700, '黔南布依族苗族自治州', 2, 520000);
INSERT INTO `ot_district` VALUES (530100, '昆明市', 2, 530000);
INSERT INTO `ot_district` VALUES (530300, '曲靖市', 2, 530000);
INSERT INTO `ot_district` VALUES (530400, '玉溪市', 2, 530000);
INSERT INTO `ot_district` VALUES (530500, '保山市', 2, 530000);
INSERT INTO `ot_district` VALUES (530600, '昭通市', 2, 530000);
INSERT INTO `ot_district` VALUES (530700, '丽江市', 2, 530000);
INSERT INTO `ot_district` VALUES (530800, '思茅市', 2, 530000);
INSERT INTO `ot_district` VALUES (530900, '临沧市', 2, 530000);
INSERT INTO `ot_district` VALUES (532300, '楚雄彝族自治州', 2, 530000);
INSERT INTO `ot_district` VALUES (532500, '红河哈尼族彝族自治州', 2, 530000);
INSERT INTO `ot_district` VALUES (532600, '文山壮族苗族自治州', 2, 530000);
INSERT INTO `ot_district` VALUES (532800, '西双版纳傣族自治州', 2, 530000);
INSERT INTO `ot_district` VALUES (532900, '大理白族自治州', 2, 530000);
INSERT INTO `ot_district` VALUES (533100, '德宏傣族景颇族自治州', 2, 530000);
INSERT INTO `ot_district` VALUES (533300, '怒江傈僳族自治州', 2, 530000);
INSERT INTO `ot_district` VALUES (533400, '迪庆藏族自治州', 2, 530000);
INSERT INTO `ot_district` VALUES (540100, '拉萨市', 2, 540000);
INSERT INTO `ot_district` VALUES (542100, '昌都地区', 2, 540000);
INSERT INTO `ot_district` VALUES (542200, '山南地区', 2, 540000);
INSERT INTO `ot_district` VALUES (542300, '日喀则地区', 2, 540000);
INSERT INTO `ot_district` VALUES (542400, '那曲地区', 2, 540000);
INSERT INTO `ot_district` VALUES (542500, '阿里地区', 2, 540000);
INSERT INTO `ot_district` VALUES (542600, '林芝地区', 2, 540000);
INSERT INTO `ot_district` VALUES (610100, '西安市', 2, 610000);
INSERT INTO `ot_district` VALUES (610200, '铜川市', 2, 610000);
INSERT INTO `ot_district` VALUES (610300, '宝鸡市', 2, 610000);
INSERT INTO `ot_district` VALUES (610400, '咸阳市', 2, 610000);
INSERT INTO `ot_district` VALUES (610500, '渭南市', 2, 610000);
INSERT INTO `ot_district` VALUES (610600, '延安市', 2, 610000);
INSERT INTO `ot_district` VALUES (610700, '汉中市', 2, 610000);
INSERT INTO `ot_district` VALUES (610800, '榆林市', 2, 610000);
INSERT INTO `ot_district` VALUES (610900, '安康市', 2, 610000);
INSERT INTO `ot_district` VALUES (611000, '商洛市', 2, 610000);
INSERT INTO `ot_district` VALUES (620100, '兰州市', 2, 620000);
INSERT INTO `ot_district` VALUES (620200, '嘉峪关市', 2, 620000);
INSERT INTO `ot_district` VALUES (620300, '金昌市', 2, 620000);
INSERT INTO `ot_district` VALUES (620400, '白银市', 2, 620000);
INSERT INTO `ot_district` VALUES (620500, '天水市', 2, 620000);
INSERT INTO `ot_district` VALUES (620600, '武威市', 2, 620000);
INSERT INTO `ot_district` VALUES (620700, '张掖市', 2, 620000);
INSERT INTO `ot_district` VALUES (620800, '平凉市', 2, 620000);
INSERT INTO `ot_district` VALUES (620900, '酒泉市', 2, 620000);
INSERT INTO `ot_district` VALUES (621000, '庆阳市', 2, 620000);
INSERT INTO `ot_district` VALUES (621100, '定西市', 2, 620000);
INSERT INTO `ot_district` VALUES (621200, '陇南市', 2, 620000);
INSERT INTO `ot_district` VALUES (622900, '临夏回族自治州', 2, 620000);
INSERT INTO `ot_district` VALUES (623000, '甘南藏族自治州', 2, 620000);
INSERT INTO `ot_district` VALUES (630100, '西宁市', 2, 630000);
INSERT INTO `ot_district` VALUES (632100, '海东地区', 2, 630000);
INSERT INTO `ot_district` VALUES (632200, '海北藏族自治州', 2, 630000);
INSERT INTO `ot_district` VALUES (632300, '黄南藏族自治州', 2, 630000);
INSERT INTO `ot_district` VALUES (632500, '海南藏族自治州', 2, 630000);
INSERT INTO `ot_district` VALUES (632600, '果洛藏族自治州', 2, 630000);
INSERT INTO `ot_district` VALUES (632700, '玉树藏族自治州', 2, 630000);
INSERT INTO `ot_district` VALUES (632800, '海西蒙古族藏族自治州', 2, 630000);
INSERT INTO `ot_district` VALUES (640100, '银川市', 2, 640000);
INSERT INTO `ot_district` VALUES (640200, '石嘴山市', 2, 640000);
INSERT INTO `ot_district` VALUES (640300, '吴忠市', 2, 640000);
INSERT INTO `ot_district` VALUES (640400, '固原市', 2, 640000);
INSERT INTO `ot_district` VALUES (640500, '中卫市', 2, 640000);
INSERT INTO `ot_district` VALUES (650100, '乌鲁木齐市', 2, 650000);
INSERT INTO `ot_district` VALUES (650200, '克拉玛依市', 2, 650000);
INSERT INTO `ot_district` VALUES (652100, '吐鲁番地区', 2, 650000);
INSERT INTO `ot_district` VALUES (652200, '哈密地区', 2, 650000);
INSERT INTO `ot_district` VALUES (652300, '昌吉回族自治州', 2, 650000);
INSERT INTO `ot_district` VALUES (652700, '博尔塔拉蒙古自治州', 2, 650000);
INSERT INTO `ot_district` VALUES (652800, '巴音郭楞蒙古自治州', 2, 650000);
INSERT INTO `ot_district` VALUES (652900, '阿克苏地区', 2, 650000);
INSERT INTO `ot_district` VALUES (653000, '克孜勒苏柯尔克孜自治州', 2, 650000);
INSERT INTO `ot_district` VALUES (653100, '喀什地区', 2, 650000);
INSERT INTO `ot_district` VALUES (653200, '和田地区', 2, 650000);
INSERT INTO `ot_district` VALUES (654000, '伊犁哈萨克自治州', 2, 650000);
INSERT INTO `ot_district` VALUES (654200, '塔城地区', 2, 650000);
INSERT INTO `ot_district` VALUES (654300, '阿勒泰地区', 2, 650000);
INSERT INTO `ot_district` VALUES (659000, '省直辖行政单位', 2, 650000);
INSERT INTO `ot_district` VALUES (110101, '东城区', 3, 110100);
INSERT INTO `ot_district` VALUES (110102, '西城区', 3, 110100);
INSERT INTO `ot_district` VALUES (110103, '崇文区', 3, 110100);
INSERT INTO `ot_district` VALUES (110104, '宣武区', 3, 110100);
INSERT INTO `ot_district` VALUES (110105, '朝阳区', 3, 110100);
INSERT INTO `ot_district` VALUES (110106, '丰台区', 3, 110100);
INSERT INTO `ot_district` VALUES (110107, '石景山区', 3, 110100);
INSERT INTO `ot_district` VALUES (110108, '海淀区', 3, 110100);
INSERT INTO `ot_district` VALUES (110109, '门头沟区', 3, 110100);
INSERT INTO `ot_district` VALUES (110111, '房山区', 3, 110100);
INSERT INTO `ot_district` VALUES (110112, '通州区', 3, 110100);
INSERT INTO `ot_district` VALUES (110113, '顺义区', 3, 110100);
INSERT INTO `ot_district` VALUES (110114, '昌平区', 3, 110100);
INSERT INTO `ot_district` VALUES (110115, '大兴区', 3, 110100);
INSERT INTO `ot_district` VALUES (110116, '怀柔区', 3, 110100);
INSERT INTO `ot_district` VALUES (110117, '平谷区', 3, 110100);
INSERT INTO `ot_district` VALUES (110228, '密云县', 3, 110200);
INSERT INTO `ot_district` VALUES (110229, '延庆县', 3, 110200);
INSERT INTO `ot_district` VALUES (120101, '和平区', 3, 120100);
INSERT INTO `ot_district` VALUES (120102, '河东区', 3, 120100);
INSERT INTO `ot_district` VALUES (120103, '河西区', 3, 120100);
INSERT INTO `ot_district` VALUES (120104, '南开区', 3, 120100);
INSERT INTO `ot_district` VALUES (120105, '河北区', 3, 120100);
INSERT INTO `ot_district` VALUES (120106, '红桥区', 3, 120100);
INSERT INTO `ot_district` VALUES (120107, '塘沽区', 3, 120100);
INSERT INTO `ot_district` VALUES (120108, '汉沽区', 3, 120100);
INSERT INTO `ot_district` VALUES (120109, '大港区', 3, 120100);
INSERT INTO `ot_district` VALUES (120110, '东丽区', 3, 120100);
INSERT INTO `ot_district` VALUES (120111, '西青区', 3, 120100);
INSERT INTO `ot_district` VALUES (120112, '津南区', 3, 120100);
INSERT INTO `ot_district` VALUES (120113, '北辰区', 3, 120100);
INSERT INTO `ot_district` VALUES (120114, '武清区', 3, 120100);
INSERT INTO `ot_district` VALUES (120115, '宝坻区', 3, 120100);
INSERT INTO `ot_district` VALUES (120221, '宁河县', 3, 120200);
INSERT INTO `ot_district` VALUES (120223, '静海县', 3, 120200);
INSERT INTO `ot_district` VALUES (120225, '蓟　县', 3, 120200);
INSERT INTO `ot_district` VALUES (130101, '市辖区', 3, 130100);
INSERT INTO `ot_district` VALUES (130102, '长安区', 3, 130100);
INSERT INTO `ot_district` VALUES (130103, '桥东区', 3, 130100);
INSERT INTO `ot_district` VALUES (130104, '桥西区', 3, 130100);
INSERT INTO `ot_district` VALUES (130105, '新华区', 3, 130100);
INSERT INTO `ot_district` VALUES (130107, '井陉矿区', 3, 130100);
INSERT INTO `ot_district` VALUES (130108, '裕华区', 3, 130100);
INSERT INTO `ot_district` VALUES (130121, '井陉县', 3, 130100);
INSERT INTO `ot_district` VALUES (130123, '正定县', 3, 130100);
INSERT INTO `ot_district` VALUES (130124, '栾城县', 3, 130100);
INSERT INTO `ot_district` VALUES (130125, '行唐县', 3, 130100);
INSERT INTO `ot_district` VALUES (130126, '灵寿县', 3, 130100);
INSERT INTO `ot_district` VALUES (130127, '高邑县', 3, 130100);
INSERT INTO `ot_district` VALUES (130128, '深泽县', 3, 130100);
INSERT INTO `ot_district` VALUES (130129, '赞皇县', 3, 130100);
INSERT INTO `ot_district` VALUES (130130, '无极县', 3, 130100);
INSERT INTO `ot_district` VALUES (130131, '平山县', 3, 130100);
INSERT INTO `ot_district` VALUES (130132, '元氏县', 3, 130100);
INSERT INTO `ot_district` VALUES (130133, '赵　县', 3, 130100);
INSERT INTO `ot_district` VALUES (130181, '辛集市', 3, 130100);
INSERT INTO `ot_district` VALUES (130182, '藁城市', 3, 130100);
INSERT INTO `ot_district` VALUES (130183, '晋州市', 3, 130100);
INSERT INTO `ot_district` VALUES (130184, '新乐市', 3, 130100);
INSERT INTO `ot_district` VALUES (130185, '鹿泉市', 3, 130100);
INSERT INTO `ot_district` VALUES (130201, '市辖区', 3, 130200);
INSERT INTO `ot_district` VALUES (130202, '路南区', 3, 130200);
INSERT INTO `ot_district` VALUES (130203, '路北区', 3, 130200);
INSERT INTO `ot_district` VALUES (130204, '古冶区', 3, 130200);
INSERT INTO `ot_district` VALUES (130205, '开平区', 3, 130200);
INSERT INTO `ot_district` VALUES (130207, '丰南区', 3, 130200);
INSERT INTO `ot_district` VALUES (130208, '丰润区', 3, 130200);
INSERT INTO `ot_district` VALUES (130223, '滦　县', 3, 130200);
INSERT INTO `ot_district` VALUES (130224, '滦南县', 3, 130200);
INSERT INTO `ot_district` VALUES (130225, '乐亭县', 3, 130200);
INSERT INTO `ot_district` VALUES (130227, '迁西县', 3, 130200);
INSERT INTO `ot_district` VALUES (130229, '玉田县', 3, 130200);
INSERT INTO `ot_district` VALUES (130230, '唐海县', 3, 130200);
INSERT INTO `ot_district` VALUES (130281, '遵化市', 3, 130200);
INSERT INTO `ot_district` VALUES (130283, '迁安市', 3, 130200);
INSERT INTO `ot_district` VALUES (130301, '市辖区', 3, 130300);
INSERT INTO `ot_district` VALUES (130302, '海港区', 3, 130300);
INSERT INTO `ot_district` VALUES (130303, '山海关区', 3, 130300);
INSERT INTO `ot_district` VALUES (130304, '北戴河区', 3, 130300);
INSERT INTO `ot_district` VALUES (130321, '青龙满族自治县', 3, 130300);
INSERT INTO `ot_district` VALUES (130322, '昌黎县', 3, 130300);
INSERT INTO `ot_district` VALUES (130323, '抚宁县', 3, 130300);
INSERT INTO `ot_district` VALUES (130324, '卢龙县', 3, 130300);
INSERT INTO `ot_district` VALUES (130401, '市辖区', 3, 130400);
INSERT INTO `ot_district` VALUES (130402, '邯山区', 3, 130400);
INSERT INTO `ot_district` VALUES (130403, '丛台区', 3, 130400);
INSERT INTO `ot_district` VALUES (130404, '复兴区', 3, 130400);
INSERT INTO `ot_district` VALUES (130406, '峰峰矿区', 3, 130400);
INSERT INTO `ot_district` VALUES (130421, '邯郸县', 3, 130400);
INSERT INTO `ot_district` VALUES (130423, '临漳县', 3, 130400);
INSERT INTO `ot_district` VALUES (130424, '成安县', 3, 130400);
INSERT INTO `ot_district` VALUES (130425, '大名县', 3, 130400);
INSERT INTO `ot_district` VALUES (130426, '涉　县', 3, 130400);
INSERT INTO `ot_district` VALUES (130427, '磁　县', 3, 130400);
INSERT INTO `ot_district` VALUES (130428, '肥乡县', 3, 130400);
INSERT INTO `ot_district` VALUES (130429, '永年县', 3, 130400);
INSERT INTO `ot_district` VALUES (130430, '邱　县', 3, 130400);
INSERT INTO `ot_district` VALUES (130431, '鸡泽县', 3, 130400);
INSERT INTO `ot_district` VALUES (130432, '广平县', 3, 130400);
INSERT INTO `ot_district` VALUES (130433, '馆陶县', 3, 130400);
INSERT INTO `ot_district` VALUES (130434, '魏　县', 3, 130400);
INSERT INTO `ot_district` VALUES (130435, '曲周县', 3, 130400);
INSERT INTO `ot_district` VALUES (130481, '武安市', 3, 130400);
INSERT INTO `ot_district` VALUES (130501, '市辖区', 3, 130500);
INSERT INTO `ot_district` VALUES (130502, '桥东区', 3, 130500);
INSERT INTO `ot_district` VALUES (130503, '桥西区', 3, 130500);
INSERT INTO `ot_district` VALUES (130521, '邢台县', 3, 130500);
INSERT INTO `ot_district` VALUES (130522, '临城县', 3, 130500);
INSERT INTO `ot_district` VALUES (130523, '内丘县', 3, 130500);
INSERT INTO `ot_district` VALUES (130524, '柏乡县', 3, 130500);
INSERT INTO `ot_district` VALUES (130525, '隆尧县', 3, 130500);
INSERT INTO `ot_district` VALUES (130526, '任　县', 3, 130500);
INSERT INTO `ot_district` VALUES (130527, '南和县', 3, 130500);
INSERT INTO `ot_district` VALUES (130528, '宁晋县', 3, 130500);
INSERT INTO `ot_district` VALUES (130529, '巨鹿县', 3, 130500);
INSERT INTO `ot_district` VALUES (130530, '新河县', 3, 130500);
INSERT INTO `ot_district` VALUES (130531, '广宗县', 3, 130500);
INSERT INTO `ot_district` VALUES (130532, '平乡县', 3, 130500);
INSERT INTO `ot_district` VALUES (130533, '威　县', 3, 130500);
INSERT INTO `ot_district` VALUES (130534, '清河县', 3, 130500);
INSERT INTO `ot_district` VALUES (130535, '临西县', 3, 130500);
INSERT INTO `ot_district` VALUES (130581, '南宫市', 3, 130500);
INSERT INTO `ot_district` VALUES (130582, '沙河市', 3, 130500);
INSERT INTO `ot_district` VALUES (130601, '市辖区', 3, 130600);
INSERT INTO `ot_district` VALUES (130602, '新市区', 3, 130600);
INSERT INTO `ot_district` VALUES (130603, '北市区', 3, 130600);
INSERT INTO `ot_district` VALUES (130604, '南市区', 3, 130600);
INSERT INTO `ot_district` VALUES (130621, '满城县', 3, 130600);
INSERT INTO `ot_district` VALUES (130622, '清苑县', 3, 130600);
INSERT INTO `ot_district` VALUES (130623, '涞水县', 3, 130600);
INSERT INTO `ot_district` VALUES (130624, '阜平县', 3, 130600);
INSERT INTO `ot_district` VALUES (130625, '徐水县', 3, 130600);
INSERT INTO `ot_district` VALUES (130626, '定兴县', 3, 130600);
INSERT INTO `ot_district` VALUES (130627, '唐　县', 3, 130600);
INSERT INTO `ot_district` VALUES (130628, '高阳县', 3, 130600);
INSERT INTO `ot_district` VALUES (130629, '容城县', 3, 130600);
INSERT INTO `ot_district` VALUES (130630, '涞源县', 3, 130600);
INSERT INTO `ot_district` VALUES (130631, '望都县', 3, 130600);
INSERT INTO `ot_district` VALUES (130632, '安新县', 3, 130600);
INSERT INTO `ot_district` VALUES (130633, '易　县', 3, 130600);
INSERT INTO `ot_district` VALUES (130634, '曲阳县', 3, 130600);
INSERT INTO `ot_district` VALUES (130635, '蠡　县', 3, 130600);
INSERT INTO `ot_district` VALUES (130636, '顺平县', 3, 130600);
INSERT INTO `ot_district` VALUES (130637, '博野县', 3, 130600);
INSERT INTO `ot_district` VALUES (130638, '雄　县', 3, 130600);
INSERT INTO `ot_district` VALUES (130681, '涿州市', 3, 130600);
INSERT INTO `ot_district` VALUES (130682, '定州市', 3, 130600);
INSERT INTO `ot_district` VALUES (130683, '安国市', 3, 130600);
INSERT INTO `ot_district` VALUES (130684, '高碑店市', 3, 130600);
INSERT INTO `ot_district` VALUES (130701, '市辖区', 3, 130700);
INSERT INTO `ot_district` VALUES (130702, '桥东区', 3, 130700);
INSERT INTO `ot_district` VALUES (130703, '桥西区', 3, 130700);
INSERT INTO `ot_district` VALUES (130705, '宣化区', 3, 130700);
INSERT INTO `ot_district` VALUES (130706, '下花园区', 3, 130700);
INSERT INTO `ot_district` VALUES (130721, '宣化县', 3, 130700);
INSERT INTO `ot_district` VALUES (130722, '张北县', 3, 130700);
INSERT INTO `ot_district` VALUES (130723, '康保县', 3, 130700);
INSERT INTO `ot_district` VALUES (130724, '沽源县', 3, 130700);
INSERT INTO `ot_district` VALUES (130725, '尚义县', 3, 130700);
INSERT INTO `ot_district` VALUES (130726, '蔚　县', 3, 130700);
INSERT INTO `ot_district` VALUES (130727, '阳原县', 3, 130700);
INSERT INTO `ot_district` VALUES (130728, '怀安县', 3, 130700);
INSERT INTO `ot_district` VALUES (130729, '万全县', 3, 130700);
INSERT INTO `ot_district` VALUES (130730, '怀来县', 3, 130700);
INSERT INTO `ot_district` VALUES (130731, '涿鹿县', 3, 130700);
INSERT INTO `ot_district` VALUES (130732, '赤城县', 3, 130700);
INSERT INTO `ot_district` VALUES (130733, '崇礼县', 3, 130700);
INSERT INTO `ot_district` VALUES (130801, '市辖区', 3, 130800);
INSERT INTO `ot_district` VALUES (130802, '双桥区', 3, 130800);
INSERT INTO `ot_district` VALUES (130803, '双滦区', 3, 130800);
INSERT INTO `ot_district` VALUES (130804, '鹰手营子矿区', 3, 130800);
INSERT INTO `ot_district` VALUES (130821, '承德县', 3, 130800);
INSERT INTO `ot_district` VALUES (130822, '兴隆县', 3, 130800);
INSERT INTO `ot_district` VALUES (130823, '平泉县', 3, 130800);
INSERT INTO `ot_district` VALUES (130824, '滦平县', 3, 130800);
INSERT INTO `ot_district` VALUES (130825, '隆化县', 3, 130800);
INSERT INTO `ot_district` VALUES (130826, '丰宁满族自治县', 3, 130800);
INSERT INTO `ot_district` VALUES (130827, '宽城满族自治县', 3, 130800);
INSERT INTO `ot_district` VALUES (130828, '围场满族蒙古族自治县', 3, 130800);
INSERT INTO `ot_district` VALUES (130901, '市辖区', 3, 130900);
INSERT INTO `ot_district` VALUES (130902, '新华区', 3, 130900);
INSERT INTO `ot_district` VALUES (130903, '运河区', 3, 130900);
INSERT INTO `ot_district` VALUES (130921, '沧　县', 3, 130900);
INSERT INTO `ot_district` VALUES (130922, '青　县', 3, 130900);
INSERT INTO `ot_district` VALUES (130923, '东光县', 3, 130900);
INSERT INTO `ot_district` VALUES (130924, '海兴县', 3, 130900);
INSERT INTO `ot_district` VALUES (130925, '盐山县', 3, 130900);
INSERT INTO `ot_district` VALUES (130926, '肃宁县', 3, 130900);
INSERT INTO `ot_district` VALUES (130927, '南皮县', 3, 130900);
INSERT INTO `ot_district` VALUES (130928, '吴桥县', 3, 130900);
INSERT INTO `ot_district` VALUES (130929, '献　县', 3, 130900);
INSERT INTO `ot_district` VALUES (130930, '孟村回族自治县', 3, 130900);
INSERT INTO `ot_district` VALUES (130981, '泊头市', 3, 130900);
INSERT INTO `ot_district` VALUES (130982, '任丘市', 3, 130900);
INSERT INTO `ot_district` VALUES (130983, '黄骅市', 3, 130900);
INSERT INTO `ot_district` VALUES (130984, '河间市', 3, 130900);
INSERT INTO `ot_district` VALUES (131001, '市辖区', 3, 131000);
INSERT INTO `ot_district` VALUES (131002, '安次区', 3, 131000);
INSERT INTO `ot_district` VALUES (131003, '广阳区', 3, 131000);
INSERT INTO `ot_district` VALUES (131022, '固安县', 3, 131000);
INSERT INTO `ot_district` VALUES (131023, '永清县', 3, 131000);
INSERT INTO `ot_district` VALUES (131024, '香河县', 3, 131000);
INSERT INTO `ot_district` VALUES (131025, '大城县', 3, 131000);
INSERT INTO `ot_district` VALUES (131026, '文安县', 3, 131000);
INSERT INTO `ot_district` VALUES (131028, '大厂回族自治县', 3, 131000);
INSERT INTO `ot_district` VALUES (131081, '霸州市', 3, 131000);
INSERT INTO `ot_district` VALUES (131082, '三河市', 3, 131000);
INSERT INTO `ot_district` VALUES (131101, '市辖区', 3, 131100);
INSERT INTO `ot_district` VALUES (131102, '桃城区', 3, 131100);
INSERT INTO `ot_district` VALUES (131121, '枣强县', 3, 131100);
INSERT INTO `ot_district` VALUES (131122, '武邑县', 3, 131100);
INSERT INTO `ot_district` VALUES (131123, '武强县', 3, 131100);
INSERT INTO `ot_district` VALUES (131124, '饶阳县', 3, 131100);
INSERT INTO `ot_district` VALUES (131125, '安平县', 3, 131100);
INSERT INTO `ot_district` VALUES (131126, '故城县', 3, 131100);
INSERT INTO `ot_district` VALUES (131127, '景　县', 3, 131100);
INSERT INTO `ot_district` VALUES (131128, '阜城县', 3, 131100);
INSERT INTO `ot_district` VALUES (131181, '冀州市', 3, 131100);
INSERT INTO `ot_district` VALUES (131182, '深州市', 3, 131100);
INSERT INTO `ot_district` VALUES (140101, '市辖区', 3, 140100);
INSERT INTO `ot_district` VALUES (140105, '小店区', 3, 140100);
INSERT INTO `ot_district` VALUES (140106, '迎泽区', 3, 140100);
INSERT INTO `ot_district` VALUES (140107, '杏花岭区', 3, 140100);
INSERT INTO `ot_district` VALUES (140108, '尖草坪区', 3, 140100);
INSERT INTO `ot_district` VALUES (140109, '万柏林区', 3, 140100);
INSERT INTO `ot_district` VALUES (140110, '晋源区', 3, 140100);
INSERT INTO `ot_district` VALUES (140121, '清徐县', 3, 140100);
INSERT INTO `ot_district` VALUES (140122, '阳曲县', 3, 140100);
INSERT INTO `ot_district` VALUES (140123, '娄烦县', 3, 140100);
INSERT INTO `ot_district` VALUES (140181, '古交市', 3, 140100);
INSERT INTO `ot_district` VALUES (140201, '市辖区', 3, 140200);
INSERT INTO `ot_district` VALUES (140202, '城　区', 3, 140200);
INSERT INTO `ot_district` VALUES (140203, '矿　区', 3, 140200);
INSERT INTO `ot_district` VALUES (140211, '南郊区', 3, 140200);
INSERT INTO `ot_district` VALUES (140212, '新荣区', 3, 140200);
INSERT INTO `ot_district` VALUES (140221, '阳高县', 3, 140200);
INSERT INTO `ot_district` VALUES (140222, '天镇县', 3, 140200);
INSERT INTO `ot_district` VALUES (140223, '广灵县', 3, 140200);
INSERT INTO `ot_district` VALUES (140224, '灵丘县', 3, 140200);
INSERT INTO `ot_district` VALUES (140225, '浑源县', 3, 140200);
INSERT INTO `ot_district` VALUES (140226, '左云县', 3, 140200);
INSERT INTO `ot_district` VALUES (140227, '大同县', 3, 140200);
INSERT INTO `ot_district` VALUES (140301, '市辖区', 3, 140300);
INSERT INTO `ot_district` VALUES (140302, '城　区', 3, 140300);
INSERT INTO `ot_district` VALUES (140303, '矿　区', 3, 140300);
INSERT INTO `ot_district` VALUES (140311, '郊　区', 3, 140300);
INSERT INTO `ot_district` VALUES (140321, '平定县', 3, 140300);
INSERT INTO `ot_district` VALUES (140322, '盂　县', 3, 140300);
INSERT INTO `ot_district` VALUES (140401, '市辖区', 3, 140400);
INSERT INTO `ot_district` VALUES (140402, '城　区', 3, 140400);
INSERT INTO `ot_district` VALUES (140411, '郊　区', 3, 140400);
INSERT INTO `ot_district` VALUES (140421, '长治县', 3, 140400);
INSERT INTO `ot_district` VALUES (140423, '襄垣县', 3, 140400);
INSERT INTO `ot_district` VALUES (140424, '屯留县', 3, 140400);
INSERT INTO `ot_district` VALUES (140425, '平顺县', 3, 140400);
INSERT INTO `ot_district` VALUES (140426, '黎城县', 3, 140400);
INSERT INTO `ot_district` VALUES (140427, '壶关县', 3, 140400);
INSERT INTO `ot_district` VALUES (140428, '长子县', 3, 140400);
INSERT INTO `ot_district` VALUES (140429, '武乡县', 3, 140400);
INSERT INTO `ot_district` VALUES (140430, '沁　县', 3, 140400);
INSERT INTO `ot_district` VALUES (140431, '沁源县', 3, 140400);
INSERT INTO `ot_district` VALUES (140481, '潞城市', 3, 140400);
INSERT INTO `ot_district` VALUES (140501, '市辖区', 3, 140500);
INSERT INTO `ot_district` VALUES (140502, '城　区', 3, 140500);
INSERT INTO `ot_district` VALUES (140521, '沁水县', 3, 140500);
INSERT INTO `ot_district` VALUES (140522, '阳城县', 3, 140500);
INSERT INTO `ot_district` VALUES (140524, '陵川县', 3, 140500);
INSERT INTO `ot_district` VALUES (140525, '泽州县', 3, 140500);
INSERT INTO `ot_district` VALUES (140581, '高平市', 3, 140500);
INSERT INTO `ot_district` VALUES (140601, '市辖区', 3, 140600);
INSERT INTO `ot_district` VALUES (140602, '朔城区', 3, 140600);
INSERT INTO `ot_district` VALUES (140603, '平鲁区', 3, 140600);
INSERT INTO `ot_district` VALUES (140621, '山阴县', 3, 140600);
INSERT INTO `ot_district` VALUES (140622, '应　县', 3, 140600);
INSERT INTO `ot_district` VALUES (140623, '右玉县', 3, 140600);
INSERT INTO `ot_district` VALUES (140624, '怀仁县', 3, 140600);
INSERT INTO `ot_district` VALUES (140701, '市辖区', 3, 140700);
INSERT INTO `ot_district` VALUES (140702, '榆次区', 3, 140700);
INSERT INTO `ot_district` VALUES (140721, '榆社县', 3, 140700);
INSERT INTO `ot_district` VALUES (140722, '左权县', 3, 140700);
INSERT INTO `ot_district` VALUES (140723, '和顺县', 3, 140700);
INSERT INTO `ot_district` VALUES (140724, '昔阳县', 3, 140700);
INSERT INTO `ot_district` VALUES (140725, '寿阳县', 3, 140700);
INSERT INTO `ot_district` VALUES (140726, '太谷县', 3, 140700);
INSERT INTO `ot_district` VALUES (140727, '祁　县', 3, 140700);
INSERT INTO `ot_district` VALUES (140728, '平遥县', 3, 140700);
INSERT INTO `ot_district` VALUES (140729, '灵石县', 3, 140700);
INSERT INTO `ot_district` VALUES (140781, '介休市', 3, 140700);
INSERT INTO `ot_district` VALUES (140801, '市辖区', 3, 140800);
INSERT INTO `ot_district` VALUES (140802, '盐湖区', 3, 140800);
INSERT INTO `ot_district` VALUES (140821, '临猗县', 3, 140800);
INSERT INTO `ot_district` VALUES (140822, '万荣县', 3, 140800);
INSERT INTO `ot_district` VALUES (140823, '闻喜县', 3, 140800);
INSERT INTO `ot_district` VALUES (140824, '稷山县', 3, 140800);
INSERT INTO `ot_district` VALUES (140825, '新绛县', 3, 140800);
INSERT INTO `ot_district` VALUES (140826, '绛　县', 3, 140800);
INSERT INTO `ot_district` VALUES (140827, '垣曲县', 3, 140800);
INSERT INTO `ot_district` VALUES (140828, '夏　县', 3, 140800);
INSERT INTO `ot_district` VALUES (140829, '平陆县', 3, 140800);
INSERT INTO `ot_district` VALUES (140830, '芮城县', 3, 140800);
INSERT INTO `ot_district` VALUES (140881, '永济市', 3, 140800);
INSERT INTO `ot_district` VALUES (140882, '河津市', 3, 140800);
INSERT INTO `ot_district` VALUES (140901, '市辖区', 3, 140900);
INSERT INTO `ot_district` VALUES (140902, '忻府区', 3, 140900);
INSERT INTO `ot_district` VALUES (140921, '定襄县', 3, 140900);
INSERT INTO `ot_district` VALUES (140922, '五台县', 3, 140900);
INSERT INTO `ot_district` VALUES (140923, '代　县', 3, 140900);
INSERT INTO `ot_district` VALUES (140924, '繁峙县', 3, 140900);
INSERT INTO `ot_district` VALUES (140925, '宁武县', 3, 140900);
INSERT INTO `ot_district` VALUES (140926, '静乐县', 3, 140900);
INSERT INTO `ot_district` VALUES (140927, '神池县', 3, 140900);
INSERT INTO `ot_district` VALUES (140928, '五寨县', 3, 140900);
INSERT INTO `ot_district` VALUES (140929, '岢岚县', 3, 140900);
INSERT INTO `ot_district` VALUES (140930, '河曲县', 3, 140900);
INSERT INTO `ot_district` VALUES (140931, '保德县', 3, 140900);
INSERT INTO `ot_district` VALUES (140932, '偏关县', 3, 140900);
INSERT INTO `ot_district` VALUES (140981, '原平市', 3, 140900);
INSERT INTO `ot_district` VALUES (141001, '市辖区', 3, 141000);
INSERT INTO `ot_district` VALUES (141002, '尧都区', 3, 141000);
INSERT INTO `ot_district` VALUES (141021, '曲沃县', 3, 141000);
INSERT INTO `ot_district` VALUES (141022, '翼城县', 3, 141000);
INSERT INTO `ot_district` VALUES (141023, '襄汾县', 3, 141000);
INSERT INTO `ot_district` VALUES (141024, '洪洞县', 3, 141000);
INSERT INTO `ot_district` VALUES (141025, '古　县', 3, 141000);
INSERT INTO `ot_district` VALUES (141026, '安泽县', 3, 141000);
INSERT INTO `ot_district` VALUES (141027, '浮山县', 3, 141000);
INSERT INTO `ot_district` VALUES (141028, '吉　县', 3, 141000);
INSERT INTO `ot_district` VALUES (141029, '乡宁县', 3, 141000);
INSERT INTO `ot_district` VALUES (141030, '大宁县', 3, 141000);
INSERT INTO `ot_district` VALUES (141031, '隰　县', 3, 141000);
INSERT INTO `ot_district` VALUES (141032, '永和县', 3, 141000);
INSERT INTO `ot_district` VALUES (141033, '蒲　县', 3, 141000);
INSERT INTO `ot_district` VALUES (141034, '汾西县', 3, 141000);
INSERT INTO `ot_district` VALUES (141081, '侯马市', 3, 141000);
INSERT INTO `ot_district` VALUES (141082, '霍州市', 3, 141000);
INSERT INTO `ot_district` VALUES (141101, '市辖区', 3, 141100);
INSERT INTO `ot_district` VALUES (141102, '离石区', 3, 141100);
INSERT INTO `ot_district` VALUES (141121, '文水县', 3, 141100);
INSERT INTO `ot_district` VALUES (141122, '交城县', 3, 141100);
INSERT INTO `ot_district` VALUES (141123, '兴　县', 3, 141100);
INSERT INTO `ot_district` VALUES (141124, '临　县', 3, 141100);
INSERT INTO `ot_district` VALUES (141125, '柳林县', 3, 141100);
INSERT INTO `ot_district` VALUES (141126, '石楼县', 3, 141100);
INSERT INTO `ot_district` VALUES (141127, '岚　县', 3, 141100);
INSERT INTO `ot_district` VALUES (141128, '方山县', 3, 141100);
INSERT INTO `ot_district` VALUES (141129, '中阳县', 3, 141100);
INSERT INTO `ot_district` VALUES (141130, '交口县', 3, 141100);
INSERT INTO `ot_district` VALUES (141181, '孝义市', 3, 141100);
INSERT INTO `ot_district` VALUES (141182, '汾阳市', 3, 141100);
INSERT INTO `ot_district` VALUES (150101, '市辖区', 3, 150100);
INSERT INTO `ot_district` VALUES (150102, '新城区', 3, 150100);
INSERT INTO `ot_district` VALUES (150103, '回民区', 3, 150100);
INSERT INTO `ot_district` VALUES (150104, '玉泉区', 3, 150100);
INSERT INTO `ot_district` VALUES (150105, '赛罕区', 3, 150100);
INSERT INTO `ot_district` VALUES (150121, '土默特左旗', 3, 150100);
INSERT INTO `ot_district` VALUES (150122, '托克托县', 3, 150100);
INSERT INTO `ot_district` VALUES (150123, '和林格尔县', 3, 150100);
INSERT INTO `ot_district` VALUES (150124, '清水河县', 3, 150100);
INSERT INTO `ot_district` VALUES (150125, '武川县', 3, 150100);
INSERT INTO `ot_district` VALUES (150201, '市辖区', 3, 150200);
INSERT INTO `ot_district` VALUES (150202, '东河区', 3, 150200);
INSERT INTO `ot_district` VALUES (150203, '昆都仑区', 3, 150200);
INSERT INTO `ot_district` VALUES (150204, '青山区', 3, 150200);
INSERT INTO `ot_district` VALUES (150205, '石拐区', 3, 150200);
INSERT INTO `ot_district` VALUES (150206, '白云矿区', 3, 150200);
INSERT INTO `ot_district` VALUES (150207, '九原区', 3, 150200);
INSERT INTO `ot_district` VALUES (150221, '土默特右旗', 3, 150200);
INSERT INTO `ot_district` VALUES (150222, '固阳县', 3, 150200);
INSERT INTO `ot_district` VALUES (150223, '达尔罕茂明安联合旗', 3, 150200);
INSERT INTO `ot_district` VALUES (150301, '市辖区', 3, 150300);
INSERT INTO `ot_district` VALUES (150302, '海勃湾区', 3, 150300);
INSERT INTO `ot_district` VALUES (150303, '海南区', 3, 150300);
INSERT INTO `ot_district` VALUES (150304, '乌达区', 3, 150300);
INSERT INTO `ot_district` VALUES (150401, '市辖区', 3, 150400);
INSERT INTO `ot_district` VALUES (150402, '红山区', 3, 150400);
INSERT INTO `ot_district` VALUES (150403, '元宝山区', 3, 150400);
INSERT INTO `ot_district` VALUES (150404, '松山区', 3, 150400);
INSERT INTO `ot_district` VALUES (150421, '阿鲁科尔沁旗', 3, 150400);
INSERT INTO `ot_district` VALUES (150422, '巴林左旗', 3, 150400);
INSERT INTO `ot_district` VALUES (150423, '巴林右旗', 3, 150400);
INSERT INTO `ot_district` VALUES (150424, '林西县', 3, 150400);
INSERT INTO `ot_district` VALUES (150425, '克什克腾旗', 3, 150400);
INSERT INTO `ot_district` VALUES (150426, '翁牛特旗', 3, 150400);
INSERT INTO `ot_district` VALUES (150428, '喀喇沁旗', 3, 150400);
INSERT INTO `ot_district` VALUES (150429, '宁城县', 3, 150400);
INSERT INTO `ot_district` VALUES (150430, '敖汉旗', 3, 150400);
INSERT INTO `ot_district` VALUES (150501, '市辖区', 3, 150500);
INSERT INTO `ot_district` VALUES (150502, '科尔沁区', 3, 150500);
INSERT INTO `ot_district` VALUES (150521, '科尔沁左翼中旗', 3, 150500);
INSERT INTO `ot_district` VALUES (150522, '科尔沁左翼后旗', 3, 150500);
INSERT INTO `ot_district` VALUES (150523, '开鲁县', 3, 150500);
INSERT INTO `ot_district` VALUES (150524, '库伦旗', 3, 150500);
INSERT INTO `ot_district` VALUES (150525, '奈曼旗', 3, 150500);
INSERT INTO `ot_district` VALUES (150526, '扎鲁特旗', 3, 150500);
INSERT INTO `ot_district` VALUES (150581, '霍林郭勒市', 3, 150500);
INSERT INTO `ot_district` VALUES (150602, '东胜区', 3, 150600);
INSERT INTO `ot_district` VALUES (150621, '达拉特旗', 3, 150600);
INSERT INTO `ot_district` VALUES (150622, '准格尔旗', 3, 150600);
INSERT INTO `ot_district` VALUES (150623, '鄂托克前旗', 3, 150600);
INSERT INTO `ot_district` VALUES (150624, '鄂托克旗', 3, 150600);
INSERT INTO `ot_district` VALUES (150625, '杭锦旗', 3, 150600);
INSERT INTO `ot_district` VALUES (150626, '乌审旗', 3, 150600);
INSERT INTO `ot_district` VALUES (150627, '伊金霍洛旗', 3, 150600);
INSERT INTO `ot_district` VALUES (150701, '市辖区', 3, 150700);
INSERT INTO `ot_district` VALUES (150702, '海拉尔区', 3, 150700);
INSERT INTO `ot_district` VALUES (150721, '阿荣旗', 3, 150700);
INSERT INTO `ot_district` VALUES (150722, '莫力达瓦达斡尔族自治旗', 3, 150700);
INSERT INTO `ot_district` VALUES (150723, '鄂伦春自治旗', 3, 150700);
INSERT INTO `ot_district` VALUES (150724, '鄂温克族自治旗', 3, 150700);
INSERT INTO `ot_district` VALUES (150725, '陈巴尔虎旗', 3, 150700);
INSERT INTO `ot_district` VALUES (150726, '新巴尔虎左旗', 3, 150700);
INSERT INTO `ot_district` VALUES (150727, '新巴尔虎右旗', 3, 150700);
INSERT INTO `ot_district` VALUES (150781, '满洲里市', 3, 150700);
INSERT INTO `ot_district` VALUES (150782, '牙克石市', 3, 150700);
INSERT INTO `ot_district` VALUES (150783, '扎兰屯市', 3, 150700);
INSERT INTO `ot_district` VALUES (150784, '额尔古纳市', 3, 150700);
INSERT INTO `ot_district` VALUES (150785, '根河市', 3, 150700);
INSERT INTO `ot_district` VALUES (150801, '市辖区', 3, 150800);
INSERT INTO `ot_district` VALUES (150802, '临河区', 3, 150800);
INSERT INTO `ot_district` VALUES (150821, '五原县', 3, 150800);
INSERT INTO `ot_district` VALUES (150822, '磴口县', 3, 150800);
INSERT INTO `ot_district` VALUES (150823, '乌拉特前旗', 3, 150800);
INSERT INTO `ot_district` VALUES (150824, '乌拉特中旗', 3, 150800);
INSERT INTO `ot_district` VALUES (150825, '乌拉特后旗', 3, 150800);
INSERT INTO `ot_district` VALUES (150826, '杭锦后旗', 3, 150800);
INSERT INTO `ot_district` VALUES (150901, '市辖区', 3, 150900);
INSERT INTO `ot_district` VALUES (150902, '集宁区', 3, 150900);
INSERT INTO `ot_district` VALUES (150921, '卓资县', 3, 150900);
INSERT INTO `ot_district` VALUES (150922, '化德县', 3, 150900);
INSERT INTO `ot_district` VALUES (150923, '商都县', 3, 150900);
INSERT INTO `ot_district` VALUES (150924, '兴和县', 3, 150900);
INSERT INTO `ot_district` VALUES (150925, '凉城县', 3, 150900);
INSERT INTO `ot_district` VALUES (150926, '察哈尔右翼前旗', 3, 150900);
INSERT INTO `ot_district` VALUES (150927, '察哈尔右翼中旗', 3, 150900);
INSERT INTO `ot_district` VALUES (150928, '察哈尔右翼后旗', 3, 150900);
INSERT INTO `ot_district` VALUES (150929, '四子王旗', 3, 150900);
INSERT INTO `ot_district` VALUES (150981, '丰镇市', 3, 150900);
INSERT INTO `ot_district` VALUES (152201, '乌兰浩特市', 3, 152200);
INSERT INTO `ot_district` VALUES (152202, '阿尔山市', 3, 152200);
INSERT INTO `ot_district` VALUES (152221, '科尔沁右翼前旗', 3, 152200);
INSERT INTO `ot_district` VALUES (152222, '科尔沁右翼中旗', 3, 152200);
INSERT INTO `ot_district` VALUES (152223, '扎赉特旗', 3, 152200);
INSERT INTO `ot_district` VALUES (152224, '突泉县', 3, 152200);
INSERT INTO `ot_district` VALUES (152501, '二连浩特市', 3, 152500);
INSERT INTO `ot_district` VALUES (152502, '锡林浩特市', 3, 152500);
INSERT INTO `ot_district` VALUES (152522, '阿巴嘎旗', 3, 152500);
INSERT INTO `ot_district` VALUES (152523, '苏尼特左旗', 3, 152500);
INSERT INTO `ot_district` VALUES (152524, '苏尼特右旗', 3, 152500);
INSERT INTO `ot_district` VALUES (152525, '东乌珠穆沁旗', 3, 152500);
INSERT INTO `ot_district` VALUES (152526, '西乌珠穆沁旗', 3, 152500);
INSERT INTO `ot_district` VALUES (152527, '太仆寺旗', 3, 152500);
INSERT INTO `ot_district` VALUES (152528, '镶黄旗', 3, 152500);
INSERT INTO `ot_district` VALUES (152529, '正镶白旗', 3, 152500);
INSERT INTO `ot_district` VALUES (152530, '正蓝旗', 3, 152500);
INSERT INTO `ot_district` VALUES (152531, '多伦县', 3, 152500);
INSERT INTO `ot_district` VALUES (152921, '阿拉善左旗', 3, 152900);
INSERT INTO `ot_district` VALUES (152922, '阿拉善右旗', 3, 152900);
INSERT INTO `ot_district` VALUES (152923, '额济纳旗', 3, 152900);
INSERT INTO `ot_district` VALUES (210101, '市辖区', 3, 210100);
INSERT INTO `ot_district` VALUES (210102, '和平区', 3, 210100);
INSERT INTO `ot_district` VALUES (210103, '沈河区', 3, 210100);
INSERT INTO `ot_district` VALUES (210104, '大东区', 3, 210100);
INSERT INTO `ot_district` VALUES (210105, '皇姑区', 3, 210100);
INSERT INTO `ot_district` VALUES (210106, '铁西区', 3, 210100);
INSERT INTO `ot_district` VALUES (210111, '苏家屯区', 3, 210100);
INSERT INTO `ot_district` VALUES (210112, '东陵区', 3, 210100);
INSERT INTO `ot_district` VALUES (210113, '新城子区', 3, 210100);
INSERT INTO `ot_district` VALUES (210114, '于洪区', 3, 210100);
INSERT INTO `ot_district` VALUES (210122, '辽中县', 3, 210100);
INSERT INTO `ot_district` VALUES (210123, '康平县', 3, 210100);
INSERT INTO `ot_district` VALUES (210124, '法库县', 3, 210100);
INSERT INTO `ot_district` VALUES (210181, '新民市', 3, 210100);
INSERT INTO `ot_district` VALUES (210201, '市辖区', 3, 210200);
INSERT INTO `ot_district` VALUES (210202, '中山区', 3, 210200);
INSERT INTO `ot_district` VALUES (210203, '西岗区', 3, 210200);
INSERT INTO `ot_district` VALUES (210204, '沙河口区', 3, 210200);
INSERT INTO `ot_district` VALUES (210211, '甘井子区', 3, 210200);
INSERT INTO `ot_district` VALUES (210212, '旅顺口区', 3, 210200);
INSERT INTO `ot_district` VALUES (210213, '金州区', 3, 210200);
INSERT INTO `ot_district` VALUES (210224, '长海县', 3, 210200);
INSERT INTO `ot_district` VALUES (210281, '瓦房店市', 3, 210200);
INSERT INTO `ot_district` VALUES (210282, '普兰店市', 3, 210200);
INSERT INTO `ot_district` VALUES (210283, '庄河市', 3, 210200);
INSERT INTO `ot_district` VALUES (210301, '市辖区', 3, 210300);
INSERT INTO `ot_district` VALUES (210302, '铁东区', 3, 210300);
INSERT INTO `ot_district` VALUES (210303, '铁西区', 3, 210300);
INSERT INTO `ot_district` VALUES (210304, '立山区', 3, 210300);
INSERT INTO `ot_district` VALUES (210311, '千山区', 3, 210300);
INSERT INTO `ot_district` VALUES (210321, '台安县', 3, 210300);
INSERT INTO `ot_district` VALUES (210323, '岫岩满族自治县', 3, 210300);
INSERT INTO `ot_district` VALUES (210381, '海城市', 3, 210300);
INSERT INTO `ot_district` VALUES (210401, '市辖区', 3, 210400);
INSERT INTO `ot_district` VALUES (210402, '新抚区', 3, 210400);
INSERT INTO `ot_district` VALUES (210403, '东洲区', 3, 210400);
INSERT INTO `ot_district` VALUES (210404, '望花区', 3, 210400);
INSERT INTO `ot_district` VALUES (210411, '顺城区', 3, 210400);
INSERT INTO `ot_district` VALUES (210421, '抚顺县', 3, 210400);
INSERT INTO `ot_district` VALUES (210422, '新宾满族自治县', 3, 210400);
INSERT INTO `ot_district` VALUES (210423, '清原满族自治县', 3, 210400);
INSERT INTO `ot_district` VALUES (210501, '市辖区', 3, 210500);
INSERT INTO `ot_district` VALUES (210502, '平山区', 3, 210500);
INSERT INTO `ot_district` VALUES (210503, '溪湖区', 3, 210500);
INSERT INTO `ot_district` VALUES (210504, '明山区', 3, 210500);
INSERT INTO `ot_district` VALUES (210505, '南芬区', 3, 210500);
INSERT INTO `ot_district` VALUES (210521, '本溪满族自治县', 3, 210500);
INSERT INTO `ot_district` VALUES (210522, '桓仁满族自治县', 3, 210500);
INSERT INTO `ot_district` VALUES (210601, '市辖区', 3, 210600);
INSERT INTO `ot_district` VALUES (210602, '元宝区', 3, 210600);
INSERT INTO `ot_district` VALUES (210603, '振兴区', 3, 210600);
INSERT INTO `ot_district` VALUES (210604, '振安区', 3, 210600);
INSERT INTO `ot_district` VALUES (210624, '宽甸满族自治县', 3, 210600);
INSERT INTO `ot_district` VALUES (210681, '东港市', 3, 210600);
INSERT INTO `ot_district` VALUES (210682, '凤城市', 3, 210600);
INSERT INTO `ot_district` VALUES (210701, '市辖区', 3, 210700);
INSERT INTO `ot_district` VALUES (210702, '古塔区', 3, 210700);
INSERT INTO `ot_district` VALUES (210703, '凌河区', 3, 210700);
INSERT INTO `ot_district` VALUES (210711, '太和区', 3, 210700);
INSERT INTO `ot_district` VALUES (210726, '黑山县', 3, 210700);
INSERT INTO `ot_district` VALUES (210727, '义　县', 3, 210700);
INSERT INTO `ot_district` VALUES (210781, '凌海市', 3, 210700);
INSERT INTO `ot_district` VALUES (210782, '北宁市', 3, 210700);
INSERT INTO `ot_district` VALUES (210801, '市辖区', 3, 210800);
INSERT INTO `ot_district` VALUES (210802, '站前区', 3, 210800);
INSERT INTO `ot_district` VALUES (210803, '西市区', 3, 210800);
INSERT INTO `ot_district` VALUES (210804, '鲅鱼圈区', 3, 210800);
INSERT INTO `ot_district` VALUES (210811, '老边区', 3, 210800);
INSERT INTO `ot_district` VALUES (210881, '盖州市', 3, 210800);
INSERT INTO `ot_district` VALUES (210882, '大石桥市', 3, 210800);
INSERT INTO `ot_district` VALUES (210901, '市辖区', 3, 210900);
INSERT INTO `ot_district` VALUES (210902, '海州区', 3, 210900);
INSERT INTO `ot_district` VALUES (210903, '新邱区', 3, 210900);
INSERT INTO `ot_district` VALUES (210904, '太平区', 3, 210900);
INSERT INTO `ot_district` VALUES (210905, '清河门区', 3, 210900);
INSERT INTO `ot_district` VALUES (210911, '细河区', 3, 210900);
INSERT INTO `ot_district` VALUES (210921, '阜新蒙古族自治县', 3, 210900);
INSERT INTO `ot_district` VALUES (210922, '彰武县', 3, 210900);
INSERT INTO `ot_district` VALUES (211001, '市辖区', 3, 211000);
INSERT INTO `ot_district` VALUES (211002, '白塔区', 3, 211000);
INSERT INTO `ot_district` VALUES (211003, '文圣区', 3, 211000);
INSERT INTO `ot_district` VALUES (211004, '宏伟区', 3, 211000);
INSERT INTO `ot_district` VALUES (211005, '弓长岭区', 3, 211000);
INSERT INTO `ot_district` VALUES (211011, '太子河区', 3, 211000);
INSERT INTO `ot_district` VALUES (211021, '辽阳县', 3, 211000);
INSERT INTO `ot_district` VALUES (211081, '灯塔市', 3, 211000);
INSERT INTO `ot_district` VALUES (211101, '市辖区', 3, 211100);
INSERT INTO `ot_district` VALUES (211102, '双台子区', 3, 211100);
INSERT INTO `ot_district` VALUES (211103, '兴隆台区', 3, 211100);
INSERT INTO `ot_district` VALUES (211121, '大洼县', 3, 211100);
INSERT INTO `ot_district` VALUES (211122, '盘山县', 3, 211100);
INSERT INTO `ot_district` VALUES (211201, '市辖区', 3, 211200);
INSERT INTO `ot_district` VALUES (211202, '银州区', 3, 211200);
INSERT INTO `ot_district` VALUES (211204, '清河区', 3, 211200);
INSERT INTO `ot_district` VALUES (211221, '铁岭县', 3, 211200);
INSERT INTO `ot_district` VALUES (211223, '西丰县', 3, 211200);
INSERT INTO `ot_district` VALUES (211224, '昌图县', 3, 211200);
INSERT INTO `ot_district` VALUES (211281, '调兵山市', 3, 211200);
INSERT INTO `ot_district` VALUES (211282, '开原市', 3, 211200);
INSERT INTO `ot_district` VALUES (211301, '市辖区', 3, 211300);
INSERT INTO `ot_district` VALUES (211302, '双塔区', 3, 211300);
INSERT INTO `ot_district` VALUES (211303, '龙城区', 3, 211300);
INSERT INTO `ot_district` VALUES (211321, '朝阳县', 3, 211300);
INSERT INTO `ot_district` VALUES (211322, '建平县', 3, 211300);
INSERT INTO `ot_district` VALUES (211324, '喀喇沁左翼蒙古族自治县', 3, 211300);
INSERT INTO `ot_district` VALUES (211381, '北票市', 3, 211300);
INSERT INTO `ot_district` VALUES (211382, '凌源市', 3, 211300);
INSERT INTO `ot_district` VALUES (211401, '市辖区', 3, 211400);
INSERT INTO `ot_district` VALUES (211402, '连山区', 3, 211400);
INSERT INTO `ot_district` VALUES (211403, '龙港区', 3, 211400);
INSERT INTO `ot_district` VALUES (211404, '南票区', 3, 211400);
INSERT INTO `ot_district` VALUES (211421, '绥中县', 3, 211400);
INSERT INTO `ot_district` VALUES (211422, '建昌县', 3, 211400);
INSERT INTO `ot_district` VALUES (211481, '兴城市', 3, 211400);
INSERT INTO `ot_district` VALUES (220101, '市辖区', 3, 220100);
INSERT INTO `ot_district` VALUES (220102, '南关区', 3, 220100);
INSERT INTO `ot_district` VALUES (220103, '宽城区', 3, 220100);
INSERT INTO `ot_district` VALUES (220104, '朝阳区', 3, 220100);
INSERT INTO `ot_district` VALUES (220105, '二道区', 3, 220100);
INSERT INTO `ot_district` VALUES (220106, '绿园区', 3, 220100);
INSERT INTO `ot_district` VALUES (220112, '双阳区', 3, 220100);
INSERT INTO `ot_district` VALUES (220122, '农安县', 3, 220100);
INSERT INTO `ot_district` VALUES (220181, '九台市', 3, 220100);
INSERT INTO `ot_district` VALUES (220182, '榆树市', 3, 220100);
INSERT INTO `ot_district` VALUES (220183, '德惠市', 3, 220100);
INSERT INTO `ot_district` VALUES (220201, '市辖区', 3, 220200);
INSERT INTO `ot_district` VALUES (220202, '昌邑区', 3, 220200);
INSERT INTO `ot_district` VALUES (220203, '龙潭区', 3, 220200);
INSERT INTO `ot_district` VALUES (220204, '船营区', 3, 220200);
INSERT INTO `ot_district` VALUES (220211, '丰满区', 3, 220200);
INSERT INTO `ot_district` VALUES (220221, '永吉县', 3, 220200);
INSERT INTO `ot_district` VALUES (220281, '蛟河市', 3, 220200);
INSERT INTO `ot_district` VALUES (220282, '桦甸市', 3, 220200);
INSERT INTO `ot_district` VALUES (220283, '舒兰市', 3, 220200);
INSERT INTO `ot_district` VALUES (220284, '磐石市', 3, 220200);
INSERT INTO `ot_district` VALUES (220301, '市辖区', 3, 220300);
INSERT INTO `ot_district` VALUES (220302, '铁西区', 3, 220300);
INSERT INTO `ot_district` VALUES (220303, '铁东区', 3, 220300);
INSERT INTO `ot_district` VALUES (220322, '梨树县', 3, 220300);
INSERT INTO `ot_district` VALUES (220323, '伊通满族自治县', 3, 220300);
INSERT INTO `ot_district` VALUES (220381, '公主岭市', 3, 220300);
INSERT INTO `ot_district` VALUES (220382, '双辽市', 3, 220300);
INSERT INTO `ot_district` VALUES (220401, '市辖区', 3, 220400);
INSERT INTO `ot_district` VALUES (220402, '龙山区', 3, 220400);
INSERT INTO `ot_district` VALUES (220403, '西安区', 3, 220400);
INSERT INTO `ot_district` VALUES (220421, '东丰县', 3, 220400);
INSERT INTO `ot_district` VALUES (220422, '东辽县', 3, 220400);
INSERT INTO `ot_district` VALUES (220501, '市辖区', 3, 220500);
INSERT INTO `ot_district` VALUES (220502, '东昌区', 3, 220500);
INSERT INTO `ot_district` VALUES (220503, '二道江区', 3, 220500);
INSERT INTO `ot_district` VALUES (220521, '通化县', 3, 220500);
INSERT INTO `ot_district` VALUES (220523, '辉南县', 3, 220500);
INSERT INTO `ot_district` VALUES (220524, '柳河县', 3, 220500);
INSERT INTO `ot_district` VALUES (220581, '梅河口市', 3, 220500);
INSERT INTO `ot_district` VALUES (220582, '集安市', 3, 220500);
INSERT INTO `ot_district` VALUES (220601, '市辖区', 3, 220600);
INSERT INTO `ot_district` VALUES (220602, '八道江区', 3, 220600);
INSERT INTO `ot_district` VALUES (220621, '抚松县', 3, 220600);
INSERT INTO `ot_district` VALUES (220622, '靖宇县', 3, 220600);
INSERT INTO `ot_district` VALUES (220623, '长白朝鲜族自治县', 3, 220600);
INSERT INTO `ot_district` VALUES (220625, '江源县', 3, 220600);
INSERT INTO `ot_district` VALUES (220681, '临江市', 3, 220600);
INSERT INTO `ot_district` VALUES (220701, '市辖区', 3, 220700);
INSERT INTO `ot_district` VALUES (220702, '宁江区', 3, 220700);
INSERT INTO `ot_district` VALUES (220721, '前郭尔罗斯蒙古族自治县', 3, 220700);
INSERT INTO `ot_district` VALUES (220722, '长岭县', 3, 220700);
INSERT INTO `ot_district` VALUES (220723, '乾安县', 3, 220700);
INSERT INTO `ot_district` VALUES (220724, '扶余县', 3, 220700);
INSERT INTO `ot_district` VALUES (220801, '市辖区', 3, 220800);
INSERT INTO `ot_district` VALUES (220802, '洮北区', 3, 220800);
INSERT INTO `ot_district` VALUES (220821, '镇赉县', 3, 220800);
INSERT INTO `ot_district` VALUES (220822, '通榆县', 3, 220800);
INSERT INTO `ot_district` VALUES (220881, '洮南市', 3, 220800);
INSERT INTO `ot_district` VALUES (220882, '大安市', 3, 220800);
INSERT INTO `ot_district` VALUES (222401, '延吉市', 3, 222400);
INSERT INTO `ot_district` VALUES (222402, '图们市', 3, 222400);
INSERT INTO `ot_district` VALUES (222403, '敦化市', 3, 222400);
INSERT INTO `ot_district` VALUES (222404, '珲春市', 3, 222400);
INSERT INTO `ot_district` VALUES (222405, '龙井市', 3, 222400);
INSERT INTO `ot_district` VALUES (222406, '和龙市', 3, 222400);
INSERT INTO `ot_district` VALUES (222424, '汪清县', 3, 222400);
INSERT INTO `ot_district` VALUES (222426, '安图县', 3, 222400);
INSERT INTO `ot_district` VALUES (230101, '市辖区', 3, 230100);
INSERT INTO `ot_district` VALUES (230102, '道里区', 3, 230100);
INSERT INTO `ot_district` VALUES (230103, '南岗区', 3, 230100);
INSERT INTO `ot_district` VALUES (230104, '道外区', 3, 230100);
INSERT INTO `ot_district` VALUES (230106, '香坊区', 3, 230100);
INSERT INTO `ot_district` VALUES (230107, '动力区', 3, 230100);
INSERT INTO `ot_district` VALUES (230108, '平房区', 3, 230100);
INSERT INTO `ot_district` VALUES (230109, '松北区', 3, 230100);
INSERT INTO `ot_district` VALUES (230111, '呼兰区', 3, 230100);
INSERT INTO `ot_district` VALUES (230123, '依兰县', 3, 230100);
INSERT INTO `ot_district` VALUES (230124, '方正县', 3, 230100);
INSERT INTO `ot_district` VALUES (230125, '宾　县', 3, 230100);
INSERT INTO `ot_district` VALUES (230126, '巴彦县', 3, 230100);
INSERT INTO `ot_district` VALUES (230127, '木兰县', 3, 230100);
INSERT INTO `ot_district` VALUES (230128, '通河县', 3, 230100);
INSERT INTO `ot_district` VALUES (230129, '延寿县', 3, 230100);
INSERT INTO `ot_district` VALUES (230181, '阿城市', 3, 230100);
INSERT INTO `ot_district` VALUES (230182, '双城市', 3, 230100);
INSERT INTO `ot_district` VALUES (230183, '尚志市', 3, 230100);
INSERT INTO `ot_district` VALUES (230184, '五常市', 3, 230100);
INSERT INTO `ot_district` VALUES (230201, '市辖区', 3, 230200);
INSERT INTO `ot_district` VALUES (230202, '龙沙区', 3, 230200);
INSERT INTO `ot_district` VALUES (230203, '建华区', 3, 230200);
INSERT INTO `ot_district` VALUES (230204, '铁锋区', 3, 230200);
INSERT INTO `ot_district` VALUES (230205, '昂昂溪区', 3, 230200);
INSERT INTO `ot_district` VALUES (230206, '富拉尔基区', 3, 230200);
INSERT INTO `ot_district` VALUES (230207, '碾子山区', 3, 230200);
INSERT INTO `ot_district` VALUES (230208, '梅里斯达斡尔族区', 3, 230200);
INSERT INTO `ot_district` VALUES (230221, '龙江县', 3, 230200);
INSERT INTO `ot_district` VALUES (230223, '依安县', 3, 230200);
INSERT INTO `ot_district` VALUES (230224, '泰来县', 3, 230200);
INSERT INTO `ot_district` VALUES (230225, '甘南县', 3, 230200);
INSERT INTO `ot_district` VALUES (230227, '富裕县', 3, 230200);
INSERT INTO `ot_district` VALUES (230229, '克山县', 3, 230200);
INSERT INTO `ot_district` VALUES (230230, '克东县', 3, 230200);
INSERT INTO `ot_district` VALUES (230231, '拜泉县', 3, 230200);
INSERT INTO `ot_district` VALUES (230281, '讷河市', 3, 230200);
INSERT INTO `ot_district` VALUES (230301, '市辖区', 3, 230300);
INSERT INTO `ot_district` VALUES (230302, '鸡冠区', 3, 230300);
INSERT INTO `ot_district` VALUES (230303, '恒山区', 3, 230300);
INSERT INTO `ot_district` VALUES (230304, '滴道区', 3, 230300);
INSERT INTO `ot_district` VALUES (230305, '梨树区', 3, 230300);
INSERT INTO `ot_district` VALUES (230306, '城子河区', 3, 230300);
INSERT INTO `ot_district` VALUES (230307, '麻山区', 3, 230300);
INSERT INTO `ot_district` VALUES (230321, '鸡东县', 3, 230300);
INSERT INTO `ot_district` VALUES (230381, '虎林市', 3, 230300);
INSERT INTO `ot_district` VALUES (230382, '密山市', 3, 230300);
INSERT INTO `ot_district` VALUES (230401, '市辖区', 3, 230400);
INSERT INTO `ot_district` VALUES (230402, '向阳区', 3, 230400);
INSERT INTO `ot_district` VALUES (230403, '工农区', 3, 230400);
INSERT INTO `ot_district` VALUES (230404, '南山区', 3, 230400);
INSERT INTO `ot_district` VALUES (230405, '兴安区', 3, 230400);
INSERT INTO `ot_district` VALUES (230406, '东山区', 3, 230400);
INSERT INTO `ot_district` VALUES (230407, '兴山区', 3, 230400);
INSERT INTO `ot_district` VALUES (230421, '萝北县', 3, 230400);
INSERT INTO `ot_district` VALUES (230422, '绥滨县', 3, 230400);
INSERT INTO `ot_district` VALUES (230501, '市辖区', 3, 230500);
INSERT INTO `ot_district` VALUES (230502, '尖山区', 3, 230500);
INSERT INTO `ot_district` VALUES (230503, '岭东区', 3, 230500);
INSERT INTO `ot_district` VALUES (230505, '四方台区', 3, 230500);
INSERT INTO `ot_district` VALUES (230506, '宝山区', 3, 230500);
INSERT INTO `ot_district` VALUES (230521, '集贤县', 3, 230500);
INSERT INTO `ot_district` VALUES (230522, '友谊县', 3, 230500);
INSERT INTO `ot_district` VALUES (230523, '宝清县', 3, 230500);
INSERT INTO `ot_district` VALUES (230524, '饶河县', 3, 230500);
INSERT INTO `ot_district` VALUES (230601, '市辖区', 3, 230600);
INSERT INTO `ot_district` VALUES (230602, '萨尔图区', 3, 230600);
INSERT INTO `ot_district` VALUES (230603, '龙凤区', 3, 230600);
INSERT INTO `ot_district` VALUES (230604, '让胡路区', 3, 230600);
INSERT INTO `ot_district` VALUES (230605, '红岗区', 3, 230600);
INSERT INTO `ot_district` VALUES (230606, '大同区', 3, 230600);
INSERT INTO `ot_district` VALUES (230621, '肇州县', 3, 230600);
INSERT INTO `ot_district` VALUES (230622, '肇源县', 3, 230600);
INSERT INTO `ot_district` VALUES (230623, '林甸县', 3, 230600);
INSERT INTO `ot_district` VALUES (230624, '杜尔伯特蒙古族自治县', 3, 230600);
INSERT INTO `ot_district` VALUES (230701, '市辖区', 3, 230700);
INSERT INTO `ot_district` VALUES (230702, '伊春区', 3, 230700);
INSERT INTO `ot_district` VALUES (230703, '南岔区', 3, 230700);
INSERT INTO `ot_district` VALUES (230704, '友好区', 3, 230700);
INSERT INTO `ot_district` VALUES (230705, '西林区', 3, 230700);
INSERT INTO `ot_district` VALUES (230706, '翠峦区', 3, 230700);
INSERT INTO `ot_district` VALUES (230707, '新青区', 3, 230700);
INSERT INTO `ot_district` VALUES (230708, '美溪区', 3, 230700);
INSERT INTO `ot_district` VALUES (230709, '金山屯区', 3, 230700);
INSERT INTO `ot_district` VALUES (230710, '五营区', 3, 230700);
INSERT INTO `ot_district` VALUES (230711, '乌马河区', 3, 230700);
INSERT INTO `ot_district` VALUES (230712, '汤旺河区', 3, 230700);
INSERT INTO `ot_district` VALUES (230713, '带岭区', 3, 230700);
INSERT INTO `ot_district` VALUES (230714, '乌伊岭区', 3, 230700);
INSERT INTO `ot_district` VALUES (230715, '红星区', 3, 230700);
INSERT INTO `ot_district` VALUES (230716, '上甘岭区', 3, 230700);
INSERT INTO `ot_district` VALUES (230722, '嘉荫县', 3, 230700);
INSERT INTO `ot_district` VALUES (230781, '铁力市', 3, 230700);
INSERT INTO `ot_district` VALUES (230801, '市辖区', 3, 230800);
INSERT INTO `ot_district` VALUES (230802, '永红区', 3, 230800);
INSERT INTO `ot_district` VALUES (230803, '向阳区', 3, 230800);
INSERT INTO `ot_district` VALUES (230804, '前进区', 3, 230800);
INSERT INTO `ot_district` VALUES (230805, '东风区', 3, 230800);
INSERT INTO `ot_district` VALUES (230811, '郊　区', 3, 230800);
INSERT INTO `ot_district` VALUES (230822, '桦南县', 3, 230800);
INSERT INTO `ot_district` VALUES (230826, '桦川县', 3, 230800);
INSERT INTO `ot_district` VALUES (230828, '汤原县', 3, 230800);
INSERT INTO `ot_district` VALUES (230833, '抚远县', 3, 230800);
INSERT INTO `ot_district` VALUES (230881, '同江市', 3, 230800);
INSERT INTO `ot_district` VALUES (230882, '富锦市', 3, 230800);
INSERT INTO `ot_district` VALUES (230901, '市辖区', 3, 230900);
INSERT INTO `ot_district` VALUES (230902, '新兴区', 3, 230900);
INSERT INTO `ot_district` VALUES (230903, '桃山区', 3, 230900);
INSERT INTO `ot_district` VALUES (230904, '茄子河区', 3, 230900);
INSERT INTO `ot_district` VALUES (230921, '勃利县', 3, 230900);
INSERT INTO `ot_district` VALUES (231001, '市辖区', 3, 231000);
INSERT INTO `ot_district` VALUES (231002, '东安区', 3, 231000);
INSERT INTO `ot_district` VALUES (231003, '阳明区', 3, 231000);
INSERT INTO `ot_district` VALUES (231004, '爱民区', 3, 231000);
INSERT INTO `ot_district` VALUES (231005, '西安区', 3, 231000);
INSERT INTO `ot_district` VALUES (231024, '东宁县', 3, 231000);
INSERT INTO `ot_district` VALUES (231025, '林口县', 3, 231000);
INSERT INTO `ot_district` VALUES (231081, '绥芬河市', 3, 231000);
INSERT INTO `ot_district` VALUES (231083, '海林市', 3, 231000);
INSERT INTO `ot_district` VALUES (231084, '宁安市', 3, 231000);
INSERT INTO `ot_district` VALUES (231085, '穆棱市', 3, 231000);
INSERT INTO `ot_district` VALUES (231101, '市辖区', 3, 231100);
INSERT INTO `ot_district` VALUES (231102, '爱辉区', 3, 231100);
INSERT INTO `ot_district` VALUES (231121, '嫩江县', 3, 231100);
INSERT INTO `ot_district` VALUES (231123, '逊克县', 3, 231100);
INSERT INTO `ot_district` VALUES (231124, '孙吴县', 3, 231100);
INSERT INTO `ot_district` VALUES (231181, '北安市', 3, 231100);
INSERT INTO `ot_district` VALUES (231182, '五大连池市', 3, 231100);
INSERT INTO `ot_district` VALUES (231201, '市辖区', 3, 231200);
INSERT INTO `ot_district` VALUES (231202, '北林区', 3, 231200);
INSERT INTO `ot_district` VALUES (231221, '望奎县', 3, 231200);
INSERT INTO `ot_district` VALUES (231222, '兰西县', 3, 231200);
INSERT INTO `ot_district` VALUES (231223, '青冈县', 3, 231200);
INSERT INTO `ot_district` VALUES (231224, '庆安县', 3, 231200);
INSERT INTO `ot_district` VALUES (231225, '明水县', 3, 231200);
INSERT INTO `ot_district` VALUES (231226, '绥棱县', 3, 231200);
INSERT INTO `ot_district` VALUES (231281, '安达市', 3, 231200);
INSERT INTO `ot_district` VALUES (231282, '肇东市', 3, 231200);
INSERT INTO `ot_district` VALUES (231283, '海伦市', 3, 231200);
INSERT INTO `ot_district` VALUES (232721, '呼玛县', 3, 232700);
INSERT INTO `ot_district` VALUES (232722, '塔河县', 3, 232700);
INSERT INTO `ot_district` VALUES (232723, '漠河县', 3, 232700);
INSERT INTO `ot_district` VALUES (310101, '黄浦区', 3, 310100);
INSERT INTO `ot_district` VALUES (310103, '卢湾区', 3, 310100);
INSERT INTO `ot_district` VALUES (310104, '徐汇区', 3, 310100);
INSERT INTO `ot_district` VALUES (310105, '长宁区', 3, 310100);
INSERT INTO `ot_district` VALUES (310106, '静安区', 3, 310100);
INSERT INTO `ot_district` VALUES (310107, '普陀区', 3, 310100);
INSERT INTO `ot_district` VALUES (310108, '闸北区', 3, 310100);
INSERT INTO `ot_district` VALUES (310109, '虹口区', 3, 310100);
INSERT INTO `ot_district` VALUES (310110, '杨浦区', 3, 310100);
INSERT INTO `ot_district` VALUES (310112, '闵行区', 3, 310100);
INSERT INTO `ot_district` VALUES (310113, '宝山区', 3, 310100);
INSERT INTO `ot_district` VALUES (310114, '嘉定区', 3, 310100);
INSERT INTO `ot_district` VALUES (310115, '浦东新区', 3, 310100);
INSERT INTO `ot_district` VALUES (310116, '金山区', 3, 310100);
INSERT INTO `ot_district` VALUES (310117, '松江区', 3, 310100);
INSERT INTO `ot_district` VALUES (310118, '青浦区', 3, 310100);
INSERT INTO `ot_district` VALUES (310119, '南汇区', 3, 310100);
INSERT INTO `ot_district` VALUES (310120, '奉贤区', 3, 310100);
INSERT INTO `ot_district` VALUES (310230, '崇明县', 3, 310200);
INSERT INTO `ot_district` VALUES (320101, '市辖区', 3, 320100);
INSERT INTO `ot_district` VALUES (320102, '玄武区', 3, 320100);
INSERT INTO `ot_district` VALUES (320103, '白下区', 3, 320100);
INSERT INTO `ot_district` VALUES (320104, '秦淮区', 3, 320100);
INSERT INTO `ot_district` VALUES (320105, '建邺区', 3, 320100);
INSERT INTO `ot_district` VALUES (320106, '鼓楼区', 3, 320100);
INSERT INTO `ot_district` VALUES (320107, '下关区', 3, 320100);
INSERT INTO `ot_district` VALUES (320111, '浦口区', 3, 320100);
INSERT INTO `ot_district` VALUES (320113, '栖霞区', 3, 320100);
INSERT INTO `ot_district` VALUES (320114, '雨花台区', 3, 320100);
INSERT INTO `ot_district` VALUES (320115, '江宁区', 3, 320100);
INSERT INTO `ot_district` VALUES (320116, '六合区', 3, 320100);
INSERT INTO `ot_district` VALUES (320124, '溧水县', 3, 320100);
INSERT INTO `ot_district` VALUES (320125, '高淳县', 3, 320100);
INSERT INTO `ot_district` VALUES (320201, '市辖区', 3, 320200);
INSERT INTO `ot_district` VALUES (320202, '崇安区', 3, 320200);
INSERT INTO `ot_district` VALUES (320203, '南长区', 3, 320200);
INSERT INTO `ot_district` VALUES (320204, '北塘区', 3, 320200);
INSERT INTO `ot_district` VALUES (320205, '锡山区', 3, 320200);
INSERT INTO `ot_district` VALUES (320206, '惠山区', 3, 320200);
INSERT INTO `ot_district` VALUES (320211, '滨湖区', 3, 320200);
INSERT INTO `ot_district` VALUES (320281, '江阴市', 3, 320200);
INSERT INTO `ot_district` VALUES (320282, '宜兴市', 3, 320200);
INSERT INTO `ot_district` VALUES (320301, '市辖区', 3, 320300);
INSERT INTO `ot_district` VALUES (320302, '鼓楼区', 3, 320300);
INSERT INTO `ot_district` VALUES (320303, '云龙区', 3, 320300);
INSERT INTO `ot_district` VALUES (320304, '九里区', 3, 320300);
INSERT INTO `ot_district` VALUES (320305, '贾汪区', 3, 320300);
INSERT INTO `ot_district` VALUES (320311, '泉山区', 3, 320300);
INSERT INTO `ot_district` VALUES (320321, '丰　县', 3, 320300);
INSERT INTO `ot_district` VALUES (320322, '沛　县', 3, 320300);
INSERT INTO `ot_district` VALUES (320323, '铜山县', 3, 320300);
INSERT INTO `ot_district` VALUES (320324, '睢宁县', 3, 320300);
INSERT INTO `ot_district` VALUES (320381, '新沂市', 3, 320300);
INSERT INTO `ot_district` VALUES (320382, '邳州市', 3, 320300);
INSERT INTO `ot_district` VALUES (320401, '市辖区', 3, 320400);
INSERT INTO `ot_district` VALUES (320402, '天宁区', 3, 320400);
INSERT INTO `ot_district` VALUES (320404, '钟楼区', 3, 320400);
INSERT INTO `ot_district` VALUES (320405, '戚墅堰区', 3, 320400);
INSERT INTO `ot_district` VALUES (320411, '新北区', 3, 320400);
INSERT INTO `ot_district` VALUES (320412, '武进区', 3, 320400);
INSERT INTO `ot_district` VALUES (320481, '溧阳市', 3, 320400);
INSERT INTO `ot_district` VALUES (320482, '金坛市', 3, 320400);
INSERT INTO `ot_district` VALUES (320501, '市辖区', 3, 320500);
INSERT INTO `ot_district` VALUES (320502, '沧浪区', 3, 320500);
INSERT INTO `ot_district` VALUES (320503, '平江区', 3, 320500);
INSERT INTO `ot_district` VALUES (320504, '金阊区', 3, 320500);
INSERT INTO `ot_district` VALUES (320505, '虎丘区', 3, 320500);
INSERT INTO `ot_district` VALUES (320506, '吴中区', 3, 320500);
INSERT INTO `ot_district` VALUES (320507, '相城区', 3, 320500);
INSERT INTO `ot_district` VALUES (320581, '常熟市', 3, 320500);
INSERT INTO `ot_district` VALUES (320582, '张家港市', 3, 320500);
INSERT INTO `ot_district` VALUES (320583, '昆山市', 3, 320500);
INSERT INTO `ot_district` VALUES (320584, '吴江市', 3, 320500);
INSERT INTO `ot_district` VALUES (320585, '太仓市', 3, 320500);
INSERT INTO `ot_district` VALUES (320601, '市辖区', 3, 320600);
INSERT INTO `ot_district` VALUES (320602, '崇川区', 3, 320600);
INSERT INTO `ot_district` VALUES (320611, '港闸区', 3, 320600);
INSERT INTO `ot_district` VALUES (320621, '海安县', 3, 320600);
INSERT INTO `ot_district` VALUES (320623, '如东县', 3, 320600);
INSERT INTO `ot_district` VALUES (320681, '启东市', 3, 320600);
INSERT INTO `ot_district` VALUES (320682, '如皋市', 3, 320600);
INSERT INTO `ot_district` VALUES (320683, '通州市', 3, 320600);
INSERT INTO `ot_district` VALUES (320684, '海门市', 3, 320600);
INSERT INTO `ot_district` VALUES (320701, '市辖区', 3, 320700);
INSERT INTO `ot_district` VALUES (320703, '连云区', 3, 320700);
INSERT INTO `ot_district` VALUES (320705, '新浦区', 3, 320700);
INSERT INTO `ot_district` VALUES (320706, '海州区', 3, 320700);
INSERT INTO `ot_district` VALUES (320721, '赣榆县', 3, 320700);
INSERT INTO `ot_district` VALUES (320722, '东海县', 3, 320700);
INSERT INTO `ot_district` VALUES (320723, '灌云县', 3, 320700);
INSERT INTO `ot_district` VALUES (320724, '灌南县', 3, 320700);
INSERT INTO `ot_district` VALUES (320801, '市辖区', 3, 320800);
INSERT INTO `ot_district` VALUES (320802, '清河区', 3, 320800);
INSERT INTO `ot_district` VALUES (320803, '楚州区', 3, 320800);
INSERT INTO `ot_district` VALUES (320804, '淮阴区', 3, 320800);
INSERT INTO `ot_district` VALUES (320811, '清浦区', 3, 320800);
INSERT INTO `ot_district` VALUES (320826, '涟水县', 3, 320800);
INSERT INTO `ot_district` VALUES (320829, '洪泽县', 3, 320800);
INSERT INTO `ot_district` VALUES (320830, '盱眙县', 3, 320800);
INSERT INTO `ot_district` VALUES (320831, '金湖县', 3, 320800);
INSERT INTO `ot_district` VALUES (320901, '市辖区', 3, 320900);
INSERT INTO `ot_district` VALUES (320902, '亭湖区', 3, 320900);
INSERT INTO `ot_district` VALUES (320903, '盐都区', 3, 320900);
INSERT INTO `ot_district` VALUES (320921, '响水县', 3, 320900);
INSERT INTO `ot_district` VALUES (320922, '滨海县', 3, 320900);
INSERT INTO `ot_district` VALUES (320923, '阜宁县', 3, 320900);
INSERT INTO `ot_district` VALUES (320924, '射阳县', 3, 320900);
INSERT INTO `ot_district` VALUES (320925, '建湖县', 3, 320900);
INSERT INTO `ot_district` VALUES (320981, '东台市', 3, 320900);
INSERT INTO `ot_district` VALUES (320982, '大丰市', 3, 320900);
INSERT INTO `ot_district` VALUES (321001, '市辖区', 3, 321000);
INSERT INTO `ot_district` VALUES (321002, '广陵区', 3, 321000);
INSERT INTO `ot_district` VALUES (321003, '邗江区', 3, 321000);
INSERT INTO `ot_district` VALUES (321011, '郊　区', 3, 321000);
INSERT INTO `ot_district` VALUES (321023, '宝应县', 3, 321000);
INSERT INTO `ot_district` VALUES (321081, '仪征市', 3, 321000);
INSERT INTO `ot_district` VALUES (321084, '高邮市', 3, 321000);
INSERT INTO `ot_district` VALUES (321088, '江都市', 3, 321000);
INSERT INTO `ot_district` VALUES (321101, '市辖区', 3, 321100);
INSERT INTO `ot_district` VALUES (321102, '京口区', 3, 321100);
INSERT INTO `ot_district` VALUES (321111, '润州区', 3, 321100);
INSERT INTO `ot_district` VALUES (321112, '丹徒区', 3, 321100);
INSERT INTO `ot_district` VALUES (321181, '丹阳市', 3, 321100);
INSERT INTO `ot_district` VALUES (321182, '扬中市', 3, 321100);
INSERT INTO `ot_district` VALUES (321183, '句容市', 3, 321100);
INSERT INTO `ot_district` VALUES (321201, '市辖区', 3, 321200);
INSERT INTO `ot_district` VALUES (321202, '海陵区', 3, 321200);
INSERT INTO `ot_district` VALUES (321203, '高港区', 3, 321200);
INSERT INTO `ot_district` VALUES (321281, '兴化市', 3, 321200);
INSERT INTO `ot_district` VALUES (321282, '靖江市', 3, 321200);
INSERT INTO `ot_district` VALUES (321283, '泰兴市', 3, 321200);
INSERT INTO `ot_district` VALUES (321284, '姜堰市', 3, 321200);
INSERT INTO `ot_district` VALUES (321301, '市辖区', 3, 321300);
INSERT INTO `ot_district` VALUES (321302, '宿城区', 3, 321300);
INSERT INTO `ot_district` VALUES (321311, '宿豫区', 3, 321300);
INSERT INTO `ot_district` VALUES (321322, '沭阳县', 3, 321300);
INSERT INTO `ot_district` VALUES (321323, '泗阳县', 3, 321300);
INSERT INTO `ot_district` VALUES (321324, '泗洪县', 3, 321300);
INSERT INTO `ot_district` VALUES (330101, '市辖区', 3, 330100);
INSERT INTO `ot_district` VALUES (330102, '上城区', 3, 330100);
INSERT INTO `ot_district` VALUES (330103, '下城区', 3, 330100);
INSERT INTO `ot_district` VALUES (330104, '江干区', 3, 330100);
INSERT INTO `ot_district` VALUES (330105, '拱墅区', 3, 330100);
INSERT INTO `ot_district` VALUES (330106, '西湖区', 3, 330100);
INSERT INTO `ot_district` VALUES (330108, '滨江区', 3, 330100);
INSERT INTO `ot_district` VALUES (330109, '萧山区', 3, 330100);
INSERT INTO `ot_district` VALUES (330110, '余杭区', 3, 330100);
INSERT INTO `ot_district` VALUES (330122, '桐庐县', 3, 330100);
INSERT INTO `ot_district` VALUES (330127, '淳安县', 3, 330100);
INSERT INTO `ot_district` VALUES (330182, '建德市', 3, 330100);
INSERT INTO `ot_district` VALUES (330183, '富阳市', 3, 330100);
INSERT INTO `ot_district` VALUES (330185, '临安市', 3, 330100);
INSERT INTO `ot_district` VALUES (330201, '市辖区', 3, 330200);
INSERT INTO `ot_district` VALUES (330203, '海曙区', 3, 330200);
INSERT INTO `ot_district` VALUES (330204, '江东区', 3, 330200);
INSERT INTO `ot_district` VALUES (330205, '江北区', 3, 330200);
INSERT INTO `ot_district` VALUES (330206, '北仑区', 3, 330200);
INSERT INTO `ot_district` VALUES (330211, '镇海区', 3, 330200);
INSERT INTO `ot_district` VALUES (330212, '鄞州区', 3, 330200);
INSERT INTO `ot_district` VALUES (330225, '象山县', 3, 330200);
INSERT INTO `ot_district` VALUES (330226, '宁海县', 3, 330200);
INSERT INTO `ot_district` VALUES (330281, '余姚市', 3, 330200);
INSERT INTO `ot_district` VALUES (330282, '慈溪市', 3, 330200);
INSERT INTO `ot_district` VALUES (330283, '奉化市', 3, 330200);
INSERT INTO `ot_district` VALUES (330301, '市辖区', 3, 330300);
INSERT INTO `ot_district` VALUES (330302, '鹿城区', 3, 330300);
INSERT INTO `ot_district` VALUES (330303, '龙湾区', 3, 330300);
INSERT INTO `ot_district` VALUES (330304, '瓯海区', 3, 330300);
INSERT INTO `ot_district` VALUES (330322, '洞头县', 3, 330300);
INSERT INTO `ot_district` VALUES (330324, '永嘉县', 3, 330300);
INSERT INTO `ot_district` VALUES (330326, '平阳县', 3, 330300);
INSERT INTO `ot_district` VALUES (330327, '苍南县', 3, 330300);
INSERT INTO `ot_district` VALUES (330328, '文成县', 3, 330300);
INSERT INTO `ot_district` VALUES (330329, '泰顺县', 3, 330300);
INSERT INTO `ot_district` VALUES (330381, '瑞安市', 3, 330300);
INSERT INTO `ot_district` VALUES (330382, '乐清市', 3, 330300);
INSERT INTO `ot_district` VALUES (330401, '市辖区', 3, 330400);
INSERT INTO `ot_district` VALUES (330402, '秀城区', 3, 330400);
INSERT INTO `ot_district` VALUES (330411, '秀洲区', 3, 330400);
INSERT INTO `ot_district` VALUES (330421, '嘉善县', 3, 330400);
INSERT INTO `ot_district` VALUES (330424, '海盐县', 3, 330400);
INSERT INTO `ot_district` VALUES (330481, '海宁市', 3, 330400);
INSERT INTO `ot_district` VALUES (330482, '平湖市', 3, 330400);
INSERT INTO `ot_district` VALUES (330483, '桐乡市', 3, 330400);
INSERT INTO `ot_district` VALUES (330501, '市辖区', 3, 330500);
INSERT INTO `ot_district` VALUES (330502, '吴兴区', 3, 330500);
INSERT INTO `ot_district` VALUES (330503, '南浔区', 3, 330500);
INSERT INTO `ot_district` VALUES (330521, '德清县', 3, 330500);
INSERT INTO `ot_district` VALUES (330522, '长兴县', 3, 330500);
INSERT INTO `ot_district` VALUES (330523, '安吉县', 3, 330500);
INSERT INTO `ot_district` VALUES (330601, '市辖区', 3, 330600);
INSERT INTO `ot_district` VALUES (330602, '越城区', 3, 330600);
INSERT INTO `ot_district` VALUES (330621, '绍兴县', 3, 330600);
INSERT INTO `ot_district` VALUES (330624, '新昌县', 3, 330600);
INSERT INTO `ot_district` VALUES (330681, '诸暨市', 3, 330600);
INSERT INTO `ot_district` VALUES (330682, '上虞市', 3, 330600);
INSERT INTO `ot_district` VALUES (330683, '嵊州市', 3, 330600);
INSERT INTO `ot_district` VALUES (330701, '市辖区', 3, 330700);
INSERT INTO `ot_district` VALUES (330702, '婺城区', 3, 330700);
INSERT INTO `ot_district` VALUES (330703, '金东区', 3, 330700);
INSERT INTO `ot_district` VALUES (330723, '武义县', 3, 330700);
INSERT INTO `ot_district` VALUES (330726, '浦江县', 3, 330700);
INSERT INTO `ot_district` VALUES (330727, '磐安县', 3, 330700);
INSERT INTO `ot_district` VALUES (330781, '兰溪市', 3, 330700);
INSERT INTO `ot_district` VALUES (330782, '义乌市', 3, 330700);
INSERT INTO `ot_district` VALUES (330783, '东阳市', 3, 330700);
INSERT INTO `ot_district` VALUES (330784, '永康市', 3, 330700);
INSERT INTO `ot_district` VALUES (330801, '市辖区', 3, 330800);
INSERT INTO `ot_district` VALUES (330802, '柯城区', 3, 330800);
INSERT INTO `ot_district` VALUES (330803, '衢江区', 3, 330800);
INSERT INTO `ot_district` VALUES (330822, '常山县', 3, 330800);
INSERT INTO `ot_district` VALUES (330824, '开化县', 3, 330800);
INSERT INTO `ot_district` VALUES (330825, '龙游县', 3, 330800);
INSERT INTO `ot_district` VALUES (330881, '江山市', 3, 330800);
INSERT INTO `ot_district` VALUES (330901, '市辖区', 3, 330900);
INSERT INTO `ot_district` VALUES (330902, '定海区', 3, 330900);
INSERT INTO `ot_district` VALUES (330903, '普陀区', 3, 330900);
INSERT INTO `ot_district` VALUES (330921, '岱山县', 3, 330900);
INSERT INTO `ot_district` VALUES (330922, '嵊泗县', 3, 330900);
INSERT INTO `ot_district` VALUES (331001, '市辖区', 3, 331000);
INSERT INTO `ot_district` VALUES (331002, '椒江区', 3, 331000);
INSERT INTO `ot_district` VALUES (331003, '黄岩区', 3, 331000);
INSERT INTO `ot_district` VALUES (331004, '路桥区', 3, 331000);
INSERT INTO `ot_district` VALUES (331021, '玉环县', 3, 331000);
INSERT INTO `ot_district` VALUES (331022, '三门县', 3, 331000);
INSERT INTO `ot_district` VALUES (331023, '天台县', 3, 331000);
INSERT INTO `ot_district` VALUES (331024, '仙居县', 3, 331000);
INSERT INTO `ot_district` VALUES (331081, '温岭市', 3, 331000);
INSERT INTO `ot_district` VALUES (331082, '临海市', 3, 331000);
INSERT INTO `ot_district` VALUES (331101, '市辖区', 3, 331100);
INSERT INTO `ot_district` VALUES (331102, '莲都区', 3, 331100);
INSERT INTO `ot_district` VALUES (331121, '青田县', 3, 331100);
INSERT INTO `ot_district` VALUES (331122, '缙云县', 3, 331100);
INSERT INTO `ot_district` VALUES (331123, '遂昌县', 3, 331100);
INSERT INTO `ot_district` VALUES (331124, '松阳县', 3, 331100);
INSERT INTO `ot_district` VALUES (331125, '云和县', 3, 331100);
INSERT INTO `ot_district` VALUES (331126, '庆元县', 3, 331100);
INSERT INTO `ot_district` VALUES (331127, '景宁畲族自治县', 3, 331100);
INSERT INTO `ot_district` VALUES (331181, '龙泉市', 3, 331100);
INSERT INTO `ot_district` VALUES (340101, '市辖区', 3, 340100);
INSERT INTO `ot_district` VALUES (340102, '瑶海区', 3, 340100);
INSERT INTO `ot_district` VALUES (340103, '庐阳区', 3, 340100);
INSERT INTO `ot_district` VALUES (340104, '蜀山区', 3, 340100);
INSERT INTO `ot_district` VALUES (340111, '包河区', 3, 340100);
INSERT INTO `ot_district` VALUES (340121, '长丰县', 3, 340100);
INSERT INTO `ot_district` VALUES (340122, '肥东县', 3, 340100);
INSERT INTO `ot_district` VALUES (340123, '肥西县', 3, 340100);
INSERT INTO `ot_district` VALUES (340201, '市辖区', 3, 340200);
INSERT INTO `ot_district` VALUES (340202, '镜湖区', 3, 340200);
INSERT INTO `ot_district` VALUES (340203, '马塘区', 3, 340200);
INSERT INTO `ot_district` VALUES (340204, '新芜区', 3, 340200);
INSERT INTO `ot_district` VALUES (340207, '鸠江区', 3, 340200);
INSERT INTO `ot_district` VALUES (340221, '芜湖县', 3, 340200);
INSERT INTO `ot_district` VALUES (340222, '繁昌县', 3, 340200);
INSERT INTO `ot_district` VALUES (340223, '南陵县', 3, 340200);
INSERT INTO `ot_district` VALUES (340301, '市辖区', 3, 340300);
INSERT INTO `ot_district` VALUES (340302, '龙子湖区', 3, 340300);
INSERT INTO `ot_district` VALUES (340303, '蚌山区', 3, 340300);
INSERT INTO `ot_district` VALUES (340304, '禹会区', 3, 340300);
INSERT INTO `ot_district` VALUES (340311, '淮上区', 3, 340300);
INSERT INTO `ot_district` VALUES (340321, '怀远县', 3, 340300);
INSERT INTO `ot_district` VALUES (340322, '五河县', 3, 340300);
INSERT INTO `ot_district` VALUES (340323, '固镇县', 3, 340300);
INSERT INTO `ot_district` VALUES (340401, '市辖区', 3, 340400);
INSERT INTO `ot_district` VALUES (340402, '大通区', 3, 340400);
INSERT INTO `ot_district` VALUES (340403, '田家庵区', 3, 340400);
INSERT INTO `ot_district` VALUES (340404, '谢家集区', 3, 340400);
INSERT INTO `ot_district` VALUES (340405, '八公山区', 3, 340400);
INSERT INTO `ot_district` VALUES (340406, '潘集区', 3, 340400);
INSERT INTO `ot_district` VALUES (340421, '凤台县', 3, 340400);
INSERT INTO `ot_district` VALUES (340501, '市辖区', 3, 340500);
INSERT INTO `ot_district` VALUES (340502, '金家庄区', 3, 340500);
INSERT INTO `ot_district` VALUES (340503, '花山区', 3, 340500);
INSERT INTO `ot_district` VALUES (340504, '雨山区', 3, 340500);
INSERT INTO `ot_district` VALUES (340521, '当涂县', 3, 340500);
INSERT INTO `ot_district` VALUES (340601, '市辖区', 3, 340600);
INSERT INTO `ot_district` VALUES (340602, '杜集区', 3, 340600);
INSERT INTO `ot_district` VALUES (340603, '相山区', 3, 340600);
INSERT INTO `ot_district` VALUES (340604, '烈山区', 3, 340600);
INSERT INTO `ot_district` VALUES (340621, '濉溪县', 3, 340600);
INSERT INTO `ot_district` VALUES (340701, '市辖区', 3, 340700);
INSERT INTO `ot_district` VALUES (340702, '铜官山区', 3, 340700);
INSERT INTO `ot_district` VALUES (340703, '狮子山区', 3, 340700);
INSERT INTO `ot_district` VALUES (340711, '郊　区', 3, 340700);
INSERT INTO `ot_district` VALUES (340721, '铜陵县', 3, 340700);
INSERT INTO `ot_district` VALUES (340801, '市辖区', 3, 340800);
INSERT INTO `ot_district` VALUES (340802, '迎江区', 3, 340800);
INSERT INTO `ot_district` VALUES (340803, '大观区', 3, 340800);
INSERT INTO `ot_district` VALUES (340811, '郊　区', 3, 340800);
INSERT INTO `ot_district` VALUES (340822, '怀宁县', 3, 340800);
INSERT INTO `ot_district` VALUES (340823, '枞阳县', 3, 340800);
INSERT INTO `ot_district` VALUES (340824, '潜山县', 3, 340800);
INSERT INTO `ot_district` VALUES (340825, '太湖县', 3, 340800);
INSERT INTO `ot_district` VALUES (340826, '宿松县', 3, 340800);
INSERT INTO `ot_district` VALUES (340827, '望江县', 3, 340800);
INSERT INTO `ot_district` VALUES (340828, '岳西县', 3, 340800);
INSERT INTO `ot_district` VALUES (340881, '桐城市', 3, 340800);
INSERT INTO `ot_district` VALUES (341001, '市辖区', 3, 341000);
INSERT INTO `ot_district` VALUES (341002, '屯溪区', 3, 341000);
INSERT INTO `ot_district` VALUES (341003, '黄山区', 3, 341000);
INSERT INTO `ot_district` VALUES (341004, '徽州区', 3, 341000);
INSERT INTO `ot_district` VALUES (341021, '歙　县', 3, 341000);
INSERT INTO `ot_district` VALUES (341022, '休宁县', 3, 341000);
INSERT INTO `ot_district` VALUES (341023, '黟　县', 3, 341000);
INSERT INTO `ot_district` VALUES (341024, '祁门县', 3, 341000);
INSERT INTO `ot_district` VALUES (341101, '市辖区', 3, 341100);
INSERT INTO `ot_district` VALUES (341102, '琅琊区', 3, 341100);
INSERT INTO `ot_district` VALUES (341103, '南谯区', 3, 341100);
INSERT INTO `ot_district` VALUES (341122, '来安县', 3, 341100);
INSERT INTO `ot_district` VALUES (341124, '全椒县', 3, 341100);
INSERT INTO `ot_district` VALUES (341125, '定远县', 3, 341100);
INSERT INTO `ot_district` VALUES (341126, '凤阳县', 3, 341100);
INSERT INTO `ot_district` VALUES (341181, '天长市', 3, 341100);
INSERT INTO `ot_district` VALUES (341182, '明光市', 3, 341100);
INSERT INTO `ot_district` VALUES (341201, '市辖区', 3, 341200);
INSERT INTO `ot_district` VALUES (341202, '颍州区', 3, 341200);
INSERT INTO `ot_district` VALUES (341203, '颍东区', 3, 341200);
INSERT INTO `ot_district` VALUES (341204, '颍泉区', 3, 341200);
INSERT INTO `ot_district` VALUES (341221, '临泉县', 3, 341200);
INSERT INTO `ot_district` VALUES (341222, '太和县', 3, 341200);
INSERT INTO `ot_district` VALUES (341225, '阜南县', 3, 341200);
INSERT INTO `ot_district` VALUES (341226, '颍上县', 3, 341200);
INSERT INTO `ot_district` VALUES (341282, '界首市', 3, 341200);
INSERT INTO `ot_district` VALUES (341301, '市辖区', 3, 341300);
INSERT INTO `ot_district` VALUES (341302, '墉桥区', 3, 341300);
INSERT INTO `ot_district` VALUES (341321, '砀山县', 3, 341300);
INSERT INTO `ot_district` VALUES (341322, '萧　县', 3, 341300);
INSERT INTO `ot_district` VALUES (341323, '灵璧县', 3, 341300);
INSERT INTO `ot_district` VALUES (341324, '泗　县', 3, 341300);
INSERT INTO `ot_district` VALUES (341401, '庐江县', 3, 340100);
INSERT INTO `ot_district` VALUES (341402, '巢湖市', 3, 340100);
INSERT INTO `ot_district` VALUES (341422, '无为县', 3, 340200);
INSERT INTO `ot_district` VALUES (341423, '含山县', 3, 340500);
INSERT INTO `ot_district` VALUES (341424, '和　县', 3, 340500);
INSERT INTO `ot_district` VALUES (341501, '市辖区', 3, 341500);
INSERT INTO `ot_district` VALUES (341502, '金安区', 3, 341500);
INSERT INTO `ot_district` VALUES (341503, '裕安区', 3, 341500);
INSERT INTO `ot_district` VALUES (341521, '寿　县', 3, 341500);
INSERT INTO `ot_district` VALUES (341522, '霍邱县', 3, 341500);
INSERT INTO `ot_district` VALUES (341523, '舒城县', 3, 341500);
INSERT INTO `ot_district` VALUES (341524, '金寨县', 3, 341500);
INSERT INTO `ot_district` VALUES (341525, '霍山县', 3, 341500);
INSERT INTO `ot_district` VALUES (341601, '市辖区', 3, 341600);
INSERT INTO `ot_district` VALUES (341602, '谯城区', 3, 341600);
INSERT INTO `ot_district` VALUES (341621, '涡阳县', 3, 341600);
INSERT INTO `ot_district` VALUES (341622, '蒙城县', 3, 341600);
INSERT INTO `ot_district` VALUES (341623, '利辛县', 3, 341600);
INSERT INTO `ot_district` VALUES (341701, '市辖区', 3, 341700);
INSERT INTO `ot_district` VALUES (341702, '贵池区', 3, 341700);
INSERT INTO `ot_district` VALUES (341721, '东至县', 3, 341700);
INSERT INTO `ot_district` VALUES (341722, '石台县', 3, 341700);
INSERT INTO `ot_district` VALUES (341723, '青阳县', 3, 341700);
INSERT INTO `ot_district` VALUES (341801, '市辖区', 3, 341800);
INSERT INTO `ot_district` VALUES (341802, '宣州区', 3, 341800);
INSERT INTO `ot_district` VALUES (341821, '郎溪县', 3, 341800);
INSERT INTO `ot_district` VALUES (341822, '广德县', 3, 341800);
INSERT INTO `ot_district` VALUES (341823, '泾　县', 3, 341800);
INSERT INTO `ot_district` VALUES (341824, '绩溪县', 3, 341800);
INSERT INTO `ot_district` VALUES (341825, '旌德县', 3, 341800);
INSERT INTO `ot_district` VALUES (341881, '宁国市', 3, 341800);
INSERT INTO `ot_district` VALUES (350101, '市辖区', 3, 350100);
INSERT INTO `ot_district` VALUES (350102, '鼓楼区', 3, 350100);
INSERT INTO `ot_district` VALUES (350103, '台江区', 3, 350100);
INSERT INTO `ot_district` VALUES (350104, '仓山区', 3, 350100);
INSERT INTO `ot_district` VALUES (350105, '马尾区', 3, 350100);
INSERT INTO `ot_district` VALUES (350111, '晋安区', 3, 350100);
INSERT INTO `ot_district` VALUES (350121, '闽侯县', 3, 350100);
INSERT INTO `ot_district` VALUES (350122, '连江县', 3, 350100);
INSERT INTO `ot_district` VALUES (350123, '罗源县', 3, 350100);
INSERT INTO `ot_district` VALUES (350124, '闽清县', 3, 350100);
INSERT INTO `ot_district` VALUES (350125, '永泰县', 3, 350100);
INSERT INTO `ot_district` VALUES (350128, '平潭县', 3, 350100);
INSERT INTO `ot_district` VALUES (350181, '福清市', 3, 350100);
INSERT INTO `ot_district` VALUES (350182, '长乐市', 3, 350100);
INSERT INTO `ot_district` VALUES (350201, '市辖区', 3, 350200);
INSERT INTO `ot_district` VALUES (350203, '思明区', 3, 350200);
INSERT INTO `ot_district` VALUES (350205, '海沧区', 3, 350200);
INSERT INTO `ot_district` VALUES (350206, '湖里区', 3, 350200);
INSERT INTO `ot_district` VALUES (350211, '集美区', 3, 350200);
INSERT INTO `ot_district` VALUES (350212, '同安区', 3, 350200);
INSERT INTO `ot_district` VALUES (350213, '翔安区', 3, 350200);
INSERT INTO `ot_district` VALUES (350301, '市辖区', 3, 350300);
INSERT INTO `ot_district` VALUES (350302, '城厢区', 3, 350300);
INSERT INTO `ot_district` VALUES (350303, '涵江区', 3, 350300);
INSERT INTO `ot_district` VALUES (350304, '荔城区', 3, 350300);
INSERT INTO `ot_district` VALUES (350305, '秀屿区', 3, 350300);
INSERT INTO `ot_district` VALUES (350322, '仙游县', 3, 350300);
INSERT INTO `ot_district` VALUES (350401, '市辖区', 3, 350400);
INSERT INTO `ot_district` VALUES (350402, '梅列区', 3, 350400);
INSERT INTO `ot_district` VALUES (350403, '三元区', 3, 350400);
INSERT INTO `ot_district` VALUES (350421, '明溪县', 3, 350400);
INSERT INTO `ot_district` VALUES (350423, '清流县', 3, 350400);
INSERT INTO `ot_district` VALUES (350424, '宁化县', 3, 350400);
INSERT INTO `ot_district` VALUES (350425, '大田县', 3, 350400);
INSERT INTO `ot_district` VALUES (350426, '尤溪县', 3, 350400);
INSERT INTO `ot_district` VALUES (350427, '沙　县', 3, 350400);
INSERT INTO `ot_district` VALUES (350428, '将乐县', 3, 350400);
INSERT INTO `ot_district` VALUES (350429, '泰宁县', 3, 350400);
INSERT INTO `ot_district` VALUES (350430, '建宁县', 3, 350400);
INSERT INTO `ot_district` VALUES (350481, '永安市', 3, 350400);
INSERT INTO `ot_district` VALUES (350501, '市辖区', 3, 350500);
INSERT INTO `ot_district` VALUES (350502, '鲤城区', 3, 350500);
INSERT INTO `ot_district` VALUES (350503, '丰泽区', 3, 350500);
INSERT INTO `ot_district` VALUES (350504, '洛江区', 3, 350500);
INSERT INTO `ot_district` VALUES (350505, '泉港区', 3, 350500);
INSERT INTO `ot_district` VALUES (350521, '惠安县', 3, 350500);
INSERT INTO `ot_district` VALUES (350524, '安溪县', 3, 350500);
INSERT INTO `ot_district` VALUES (350525, '永春县', 3, 350500);
INSERT INTO `ot_district` VALUES (350526, '德化县', 3, 350500);
INSERT INTO `ot_district` VALUES (350527, '金门县', 3, 350500);
INSERT INTO `ot_district` VALUES (350581, '石狮市', 3, 350500);
INSERT INTO `ot_district` VALUES (350582, '晋江市', 3, 350500);
INSERT INTO `ot_district` VALUES (350583, '南安市', 3, 350500);
INSERT INTO `ot_district` VALUES (350601, '市辖区', 3, 350600);
INSERT INTO `ot_district` VALUES (350602, '芗城区', 3, 350600);
INSERT INTO `ot_district` VALUES (350603, '龙文区', 3, 350600);
INSERT INTO `ot_district` VALUES (350622, '云霄县', 3, 350600);
INSERT INTO `ot_district` VALUES (350623, '漳浦县', 3, 350600);
INSERT INTO `ot_district` VALUES (350624, '诏安县', 3, 350600);
INSERT INTO `ot_district` VALUES (350625, '长泰县', 3, 350600);
INSERT INTO `ot_district` VALUES (350626, '东山县', 3, 350600);
INSERT INTO `ot_district` VALUES (350627, '南靖县', 3, 350600);
INSERT INTO `ot_district` VALUES (350628, '平和县', 3, 350600);
INSERT INTO `ot_district` VALUES (350629, '华安县', 3, 350600);
INSERT INTO `ot_district` VALUES (350681, '龙海市', 3, 350600);
INSERT INTO `ot_district` VALUES (350701, '市辖区', 3, 350700);
INSERT INTO `ot_district` VALUES (350702, '延平区', 3, 350700);
INSERT INTO `ot_district` VALUES (350721, '顺昌县', 3, 350700);
INSERT INTO `ot_district` VALUES (350722, '浦城县', 3, 350700);
INSERT INTO `ot_district` VALUES (350723, '光泽县', 3, 350700);
INSERT INTO `ot_district` VALUES (350724, '松溪县', 3, 350700);
INSERT INTO `ot_district` VALUES (350725, '政和县', 3, 350700);
INSERT INTO `ot_district` VALUES (350781, '邵武市', 3, 350700);
INSERT INTO `ot_district` VALUES (350782, '武夷山市', 3, 350700);
INSERT INTO `ot_district` VALUES (350783, '建瓯市', 3, 350700);
INSERT INTO `ot_district` VALUES (350784, '建阳市', 3, 350700);
INSERT INTO `ot_district` VALUES (350801, '市辖区', 3, 350800);
INSERT INTO `ot_district` VALUES (350802, '新罗区', 3, 350800);
INSERT INTO `ot_district` VALUES (350821, '长汀县', 3, 350800);
INSERT INTO `ot_district` VALUES (350822, '永定县', 3, 350800);
INSERT INTO `ot_district` VALUES (350823, '上杭县', 3, 350800);
INSERT INTO `ot_district` VALUES (350824, '武平县', 3, 350800);
INSERT INTO `ot_district` VALUES (350825, '连城县', 3, 350800);
INSERT INTO `ot_district` VALUES (350881, '漳平市', 3, 350800);
INSERT INTO `ot_district` VALUES (350901, '市辖区', 3, 350900);
INSERT INTO `ot_district` VALUES (350902, '蕉城区', 3, 350900);
INSERT INTO `ot_district` VALUES (350921, '霞浦县', 3, 350900);
INSERT INTO `ot_district` VALUES (350922, '古田县', 3, 350900);
INSERT INTO `ot_district` VALUES (350923, '屏南县', 3, 350900);
INSERT INTO `ot_district` VALUES (350924, '寿宁县', 3, 350900);
INSERT INTO `ot_district` VALUES (350925, '周宁县', 3, 350900);
INSERT INTO `ot_district` VALUES (350926, '柘荣县', 3, 350900);
INSERT INTO `ot_district` VALUES (350981, '福安市', 3, 350900);
INSERT INTO `ot_district` VALUES (350982, '福鼎市', 3, 350900);
INSERT INTO `ot_district` VALUES (360101, '市辖区', 3, 360100);
INSERT INTO `ot_district` VALUES (360102, '东湖区', 3, 360100);
INSERT INTO `ot_district` VALUES (360103, '西湖区', 3, 360100);
INSERT INTO `ot_district` VALUES (360104, '青云谱区', 3, 360100);
INSERT INTO `ot_district` VALUES (360105, '湾里区', 3, 360100);
INSERT INTO `ot_district` VALUES (360111, '青山湖区', 3, 360100);
INSERT INTO `ot_district` VALUES (360121, '南昌县', 3, 360100);
INSERT INTO `ot_district` VALUES (360122, '新建县', 3, 360100);
INSERT INTO `ot_district` VALUES (360123, '安义县', 3, 360100);
INSERT INTO `ot_district` VALUES (360124, '进贤县', 3, 360100);
INSERT INTO `ot_district` VALUES (360201, '市辖区', 3, 360200);
INSERT INTO `ot_district` VALUES (360202, '昌江区', 3, 360200);
INSERT INTO `ot_district` VALUES (360203, '珠山区', 3, 360200);
INSERT INTO `ot_district` VALUES (360222, '浮梁县', 3, 360200);
INSERT INTO `ot_district` VALUES (360281, '乐平市', 3, 360200);
INSERT INTO `ot_district` VALUES (360301, '市辖区', 3, 360300);
INSERT INTO `ot_district` VALUES (360302, '安源区', 3, 360300);
INSERT INTO `ot_district` VALUES (360313, '湘东区', 3, 360300);
INSERT INTO `ot_district` VALUES (360321, '莲花县', 3, 360300);
INSERT INTO `ot_district` VALUES (360322, '上栗县', 3, 360300);
INSERT INTO `ot_district` VALUES (360323, '芦溪县', 3, 360300);
INSERT INTO `ot_district` VALUES (360401, '市辖区', 3, 360400);
INSERT INTO `ot_district` VALUES (360402, '庐山区', 3, 360400);
INSERT INTO `ot_district` VALUES (360403, '浔阳区', 3, 360400);
INSERT INTO `ot_district` VALUES (360421, '九江县', 3, 360400);
INSERT INTO `ot_district` VALUES (360423, '武宁县', 3, 360400);
INSERT INTO `ot_district` VALUES (360424, '修水县', 3, 360400);
INSERT INTO `ot_district` VALUES (360425, '永修县', 3, 360400);
INSERT INTO `ot_district` VALUES (360426, '德安县', 3, 360400);
INSERT INTO `ot_district` VALUES (360427, '星子县', 3, 360400);
INSERT INTO `ot_district` VALUES (360428, '都昌县', 3, 360400);
INSERT INTO `ot_district` VALUES (360429, '湖口县', 3, 360400);
INSERT INTO `ot_district` VALUES (360430, '彭泽县', 3, 360400);
INSERT INTO `ot_district` VALUES (360481, '瑞昌市', 3, 360400);
INSERT INTO `ot_district` VALUES (360501, '市辖区', 3, 360500);
INSERT INTO `ot_district` VALUES (360502, '渝水区', 3, 360500);
INSERT INTO `ot_district` VALUES (360521, '分宜县', 3, 360500);
INSERT INTO `ot_district` VALUES (360601, '市辖区', 3, 360600);
INSERT INTO `ot_district` VALUES (360602, '月湖区', 3, 360600);
INSERT INTO `ot_district` VALUES (360622, '余江县', 3, 360600);
INSERT INTO `ot_district` VALUES (360681, '贵溪市', 3, 360600);
INSERT INTO `ot_district` VALUES (360701, '市辖区', 3, 360700);
INSERT INTO `ot_district` VALUES (360702, '章贡区', 3, 360700);
INSERT INTO `ot_district` VALUES (360721, '赣　县', 3, 360700);
INSERT INTO `ot_district` VALUES (360722, '信丰县', 3, 360700);
INSERT INTO `ot_district` VALUES (360723, '大余县', 3, 360700);
INSERT INTO `ot_district` VALUES (360724, '上犹县', 3, 360700);
INSERT INTO `ot_district` VALUES (360725, '崇义县', 3, 360700);
INSERT INTO `ot_district` VALUES (360726, '安远县', 3, 360700);
INSERT INTO `ot_district` VALUES (360727, '龙南县', 3, 360700);
INSERT INTO `ot_district` VALUES (360728, '定南县', 3, 360700);
INSERT INTO `ot_district` VALUES (360729, '全南县', 3, 360700);
INSERT INTO `ot_district` VALUES (360730, '宁都县', 3, 360700);
INSERT INTO `ot_district` VALUES (360731, '于都县', 3, 360700);
INSERT INTO `ot_district` VALUES (360732, '兴国县', 3, 360700);
INSERT INTO `ot_district` VALUES (360733, '会昌县', 3, 360700);
INSERT INTO `ot_district` VALUES (360734, '寻乌县', 3, 360700);
INSERT INTO `ot_district` VALUES (360735, '石城县', 3, 360700);
INSERT INTO `ot_district` VALUES (360781, '瑞金市', 3, 360700);
INSERT INTO `ot_district` VALUES (360782, '南康市', 3, 360700);
INSERT INTO `ot_district` VALUES (360801, '市辖区', 3, 360800);
INSERT INTO `ot_district` VALUES (360802, '吉州区', 3, 360800);
INSERT INTO `ot_district` VALUES (360803, '青原区', 3, 360800);
INSERT INTO `ot_district` VALUES (360821, '吉安县', 3, 360800);
INSERT INTO `ot_district` VALUES (360822, '吉水县', 3, 360800);
INSERT INTO `ot_district` VALUES (360823, '峡江县', 3, 360800);
INSERT INTO `ot_district` VALUES (360824, '新干县', 3, 360800);
INSERT INTO `ot_district` VALUES (360825, '永丰县', 3, 360800);
INSERT INTO `ot_district` VALUES (360826, '泰和县', 3, 360800);
INSERT INTO `ot_district` VALUES (360827, '遂川县', 3, 360800);
INSERT INTO `ot_district` VALUES (360828, '万安县', 3, 360800);
INSERT INTO `ot_district` VALUES (360829, '安福县', 3, 360800);
INSERT INTO `ot_district` VALUES (360830, '永新县', 3, 360800);
INSERT INTO `ot_district` VALUES (360881, '井冈山市', 3, 360800);
INSERT INTO `ot_district` VALUES (360901, '市辖区', 3, 360900);
INSERT INTO `ot_district` VALUES (360902, '袁州区', 3, 360900);
INSERT INTO `ot_district` VALUES (360921, '奉新县', 3, 360900);
INSERT INTO `ot_district` VALUES (360922, '万载县', 3, 360900);
INSERT INTO `ot_district` VALUES (360923, '上高县', 3, 360900);
INSERT INTO `ot_district` VALUES (360924, '宜丰县', 3, 360900);
INSERT INTO `ot_district` VALUES (360925, '靖安县', 3, 360900);
INSERT INTO `ot_district` VALUES (360926, '铜鼓县', 3, 360900);
INSERT INTO `ot_district` VALUES (360981, '丰城市', 3, 360900);
INSERT INTO `ot_district` VALUES (360982, '樟树市', 3, 360900);
INSERT INTO `ot_district` VALUES (360983, '高安市', 3, 360900);
INSERT INTO `ot_district` VALUES (361001, '市辖区', 3, 361000);
INSERT INTO `ot_district` VALUES (361002, '临川区', 3, 361000);
INSERT INTO `ot_district` VALUES (361021, '南城县', 3, 361000);
INSERT INTO `ot_district` VALUES (361022, '黎川县', 3, 361000);
INSERT INTO `ot_district` VALUES (361023, '南丰县', 3, 361000);
INSERT INTO `ot_district` VALUES (361024, '崇仁县', 3, 361000);
INSERT INTO `ot_district` VALUES (361025, '乐安县', 3, 361000);
INSERT INTO `ot_district` VALUES (361026, '宜黄县', 3, 361000);
INSERT INTO `ot_district` VALUES (361027, '金溪县', 3, 361000);
INSERT INTO `ot_district` VALUES (361028, '资溪县', 3, 361000);
INSERT INTO `ot_district` VALUES (361029, '东乡县', 3, 361000);
INSERT INTO `ot_district` VALUES (361030, '广昌县', 3, 361000);
INSERT INTO `ot_district` VALUES (361101, '市辖区', 3, 361100);
INSERT INTO `ot_district` VALUES (361102, '信州区', 3, 361100);
INSERT INTO `ot_district` VALUES (361121, '上饶县', 3, 361100);
INSERT INTO `ot_district` VALUES (361122, '广丰县', 3, 361100);
INSERT INTO `ot_district` VALUES (361123, '玉山县', 3, 361100);
INSERT INTO `ot_district` VALUES (361124, '铅山县', 3, 361100);
INSERT INTO `ot_district` VALUES (361125, '横峰县', 3, 361100);
INSERT INTO `ot_district` VALUES (361126, '弋阳县', 3, 361100);
INSERT INTO `ot_district` VALUES (361127, '余干县', 3, 361100);
INSERT INTO `ot_district` VALUES (361128, '鄱阳县', 3, 361100);
INSERT INTO `ot_district` VALUES (361129, '万年县', 3, 361100);
INSERT INTO `ot_district` VALUES (361130, '婺源县', 3, 361100);
INSERT INTO `ot_district` VALUES (361181, '德兴市', 3, 361100);
INSERT INTO `ot_district` VALUES (370101, '市辖区', 3, 370100);
INSERT INTO `ot_district` VALUES (370102, '历下区', 3, 370100);
INSERT INTO `ot_district` VALUES (370103, '市中区', 3, 370100);
INSERT INTO `ot_district` VALUES (370104, '槐荫区', 3, 370100);
INSERT INTO `ot_district` VALUES (370105, '天桥区', 3, 370100);
INSERT INTO `ot_district` VALUES (370112, '历城区', 3, 370100);
INSERT INTO `ot_district` VALUES (370113, '长清区', 3, 370100);
INSERT INTO `ot_district` VALUES (370124, '平阴县', 3, 370100);
INSERT INTO `ot_district` VALUES (370125, '济阳县', 3, 370100);
INSERT INTO `ot_district` VALUES (370126, '商河县', 3, 370100);
INSERT INTO `ot_district` VALUES (370181, '章丘市', 3, 370100);
INSERT INTO `ot_district` VALUES (370201, '市辖区', 3, 370200);
INSERT INTO `ot_district` VALUES (370202, '市南区', 3, 370200);
INSERT INTO `ot_district` VALUES (370203, '市北区', 3, 370200);
INSERT INTO `ot_district` VALUES (370205, '四方区', 3, 370200);
INSERT INTO `ot_district` VALUES (370211, '黄岛区', 3, 370200);
INSERT INTO `ot_district` VALUES (370212, '崂山区', 3, 370200);
INSERT INTO `ot_district` VALUES (370213, '李沧区', 3, 370200);
INSERT INTO `ot_district` VALUES (370214, '城阳区', 3, 370200);
INSERT INTO `ot_district` VALUES (370281, '胶州市', 3, 370200);
INSERT INTO `ot_district` VALUES (370282, '即墨市', 3, 370200);
INSERT INTO `ot_district` VALUES (370283, '平度市', 3, 370200);
INSERT INTO `ot_district` VALUES (370284, '胶南市', 3, 370200);
INSERT INTO `ot_district` VALUES (370285, '莱西市', 3, 370200);
INSERT INTO `ot_district` VALUES (370301, '市辖区', 3, 370300);
INSERT INTO `ot_district` VALUES (370302, '淄川区', 3, 370300);
INSERT INTO `ot_district` VALUES (370303, '张店区', 3, 370300);
INSERT INTO `ot_district` VALUES (370304, '博山区', 3, 370300);
INSERT INTO `ot_district` VALUES (370305, '临淄区', 3, 370300);
INSERT INTO `ot_district` VALUES (370306, '周村区', 3, 370300);
INSERT INTO `ot_district` VALUES (370321, '桓台县', 3, 370300);
INSERT INTO `ot_district` VALUES (370322, '高青县', 3, 370300);
INSERT INTO `ot_district` VALUES (370323, '沂源县', 3, 370300);
INSERT INTO `ot_district` VALUES (370401, '市辖区', 3, 370400);
INSERT INTO `ot_district` VALUES (370402, '市中区', 3, 370400);
INSERT INTO `ot_district` VALUES (370403, '薛城区', 3, 370400);
INSERT INTO `ot_district` VALUES (370404, '峄城区', 3, 370400);
INSERT INTO `ot_district` VALUES (370405, '台儿庄区', 3, 370400);
INSERT INTO `ot_district` VALUES (370406, '山亭区', 3, 370400);
INSERT INTO `ot_district` VALUES (370481, '滕州市', 3, 370400);
INSERT INTO `ot_district` VALUES (370501, '市辖区', 3, 370500);
INSERT INTO `ot_district` VALUES (370502, '东营区', 3, 370500);
INSERT INTO `ot_district` VALUES (370503, '河口区', 3, 370500);
INSERT INTO `ot_district` VALUES (370521, '垦利县', 3, 370500);
INSERT INTO `ot_district` VALUES (370522, '利津县', 3, 370500);
INSERT INTO `ot_district` VALUES (370523, '广饶县', 3, 370500);
INSERT INTO `ot_district` VALUES (370601, '市辖区', 3, 370600);
INSERT INTO `ot_district` VALUES (370602, '芝罘区', 3, 370600);
INSERT INTO `ot_district` VALUES (370611, '福山区', 3, 370600);
INSERT INTO `ot_district` VALUES (370612, '牟平区', 3, 370600);
INSERT INTO `ot_district` VALUES (370613, '莱山区', 3, 370600);
INSERT INTO `ot_district` VALUES (370634, '长岛县', 3, 370600);
INSERT INTO `ot_district` VALUES (370681, '龙口市', 3, 370600);
INSERT INTO `ot_district` VALUES (370682, '莱阳市', 3, 370600);
INSERT INTO `ot_district` VALUES (370683, '莱州市', 3, 370600);
INSERT INTO `ot_district` VALUES (370684, '蓬莱市', 3, 370600);
INSERT INTO `ot_district` VALUES (370685, '招远市', 3, 370600);
INSERT INTO `ot_district` VALUES (370686, '栖霞市', 3, 370600);
INSERT INTO `ot_district` VALUES (370687, '海阳市', 3, 370600);
INSERT INTO `ot_district` VALUES (370701, '市辖区', 3, 370700);
INSERT INTO `ot_district` VALUES (370702, '潍城区', 3, 370700);
INSERT INTO `ot_district` VALUES (370703, '寒亭区', 3, 370700);
INSERT INTO `ot_district` VALUES (370704, '坊子区', 3, 370700);
INSERT INTO `ot_district` VALUES (370705, '奎文区', 3, 370700);
INSERT INTO `ot_district` VALUES (370724, '临朐县', 3, 370700);
INSERT INTO `ot_district` VALUES (370725, '昌乐县', 3, 370700);
INSERT INTO `ot_district` VALUES (370781, '青州市', 3, 370700);
INSERT INTO `ot_district` VALUES (370782, '诸城市', 3, 370700);
INSERT INTO `ot_district` VALUES (370783, '寿光市', 3, 370700);
INSERT INTO `ot_district` VALUES (370784, '安丘市', 3, 370700);
INSERT INTO `ot_district` VALUES (370785, '高密市', 3, 370700);
INSERT INTO `ot_district` VALUES (370786, '昌邑市', 3, 370700);
INSERT INTO `ot_district` VALUES (370801, '市辖区', 3, 370800);
INSERT INTO `ot_district` VALUES (370802, '市中区', 3, 370800);
INSERT INTO `ot_district` VALUES (370811, '任城区', 3, 370800);
INSERT INTO `ot_district` VALUES (370826, '微山县', 3, 370800);
INSERT INTO `ot_district` VALUES (370827, '鱼台县', 3, 370800);
INSERT INTO `ot_district` VALUES (370828, '金乡县', 3, 370800);
INSERT INTO `ot_district` VALUES (370829, '嘉祥县', 3, 370800);
INSERT INTO `ot_district` VALUES (370830, '汶上县', 3, 370800);
INSERT INTO `ot_district` VALUES (370831, '泗水县', 3, 370800);
INSERT INTO `ot_district` VALUES (370832, '梁山县', 3, 370800);
INSERT INTO `ot_district` VALUES (370881, '曲阜市', 3, 370800);
INSERT INTO `ot_district` VALUES (370882, '兖州市', 3, 370800);
INSERT INTO `ot_district` VALUES (370883, '邹城市', 3, 370800);
INSERT INTO `ot_district` VALUES (370901, '市辖区', 3, 370900);
INSERT INTO `ot_district` VALUES (370902, '泰山区', 3, 370900);
INSERT INTO `ot_district` VALUES (370903, '岱岳区', 3, 370900);
INSERT INTO `ot_district` VALUES (370921, '宁阳县', 3, 370900);
INSERT INTO `ot_district` VALUES (370923, '东平县', 3, 370900);
INSERT INTO `ot_district` VALUES (370982, '新泰市', 3, 370900);
INSERT INTO `ot_district` VALUES (370983, '肥城市', 3, 370900);
INSERT INTO `ot_district` VALUES (371001, '市辖区', 3, 371000);
INSERT INTO `ot_district` VALUES (371002, '环翠区', 3, 371000);
INSERT INTO `ot_district` VALUES (371081, '文登市', 3, 371000);
INSERT INTO `ot_district` VALUES (371082, '荣成市', 3, 371000);
INSERT INTO `ot_district` VALUES (371083, '乳山市', 3, 371000);
INSERT INTO `ot_district` VALUES (371101, '市辖区', 3, 371100);
INSERT INTO `ot_district` VALUES (371102, '东港区', 3, 371100);
INSERT INTO `ot_district` VALUES (371103, '岚山区', 3, 371100);
INSERT INTO `ot_district` VALUES (371121, '五莲县', 3, 371100);
INSERT INTO `ot_district` VALUES (371122, '莒　县', 3, 371100);
INSERT INTO `ot_district` VALUES (371201, '市辖区', 3, 371200);
INSERT INTO `ot_district` VALUES (371202, '莱城区', 3, 371200);
INSERT INTO `ot_district` VALUES (371203, '钢城区', 3, 371200);
INSERT INTO `ot_district` VALUES (371301, '市辖区', 3, 371300);
INSERT INTO `ot_district` VALUES (371302, '兰山区', 3, 371300);
INSERT INTO `ot_district` VALUES (371311, '罗庄区', 3, 371300);
INSERT INTO `ot_district` VALUES (371312, '河东区', 3, 371300);
INSERT INTO `ot_district` VALUES (371321, '沂南县', 3, 371300);
INSERT INTO `ot_district` VALUES (371322, '郯城县', 3, 371300);
INSERT INTO `ot_district` VALUES (371323, '沂水县', 3, 371300);
INSERT INTO `ot_district` VALUES (371324, '苍山县', 3, 371300);
INSERT INTO `ot_district` VALUES (371325, '费　县', 3, 371300);
INSERT INTO `ot_district` VALUES (371326, '平邑县', 3, 371300);
INSERT INTO `ot_district` VALUES (371327, '莒南县', 3, 371300);
INSERT INTO `ot_district` VALUES (371328, '蒙阴县', 3, 371300);
INSERT INTO `ot_district` VALUES (371329, '临沭县', 3, 371300);
INSERT INTO `ot_district` VALUES (371401, '市辖区', 3, 371400);
INSERT INTO `ot_district` VALUES (371402, '德城区', 3, 371400);
INSERT INTO `ot_district` VALUES (371421, '陵　县', 3, 371400);
INSERT INTO `ot_district` VALUES (371422, '宁津县', 3, 371400);
INSERT INTO `ot_district` VALUES (371423, '庆云县', 3, 371400);
INSERT INTO `ot_district` VALUES (371424, '临邑县', 3, 371400);
INSERT INTO `ot_district` VALUES (371425, '齐河县', 3, 371400);
INSERT INTO `ot_district` VALUES (371426, '平原县', 3, 371400);
INSERT INTO `ot_district` VALUES (371427, '夏津县', 3, 371400);
INSERT INTO `ot_district` VALUES (371428, '武城县', 3, 371400);
INSERT INTO `ot_district` VALUES (371481, '乐陵市', 3, 371400);
INSERT INTO `ot_district` VALUES (371482, '禹城市', 3, 371400);
INSERT INTO `ot_district` VALUES (371501, '市辖区', 3, 371500);
INSERT INTO `ot_district` VALUES (371502, '东昌府区', 3, 371500);
INSERT INTO `ot_district` VALUES (371521, '阳谷县', 3, 371500);
INSERT INTO `ot_district` VALUES (371522, '莘　县', 3, 371500);
INSERT INTO `ot_district` VALUES (371523, '茌平县', 3, 371500);
INSERT INTO `ot_district` VALUES (371524, '东阿县', 3, 371500);
INSERT INTO `ot_district` VALUES (371525, '冠　县', 3, 371500);
INSERT INTO `ot_district` VALUES (371526, '高唐县', 3, 371500);
INSERT INTO `ot_district` VALUES (371581, '临清市', 3, 371500);
INSERT INTO `ot_district` VALUES (371601, '市辖区', 3, 371600);
INSERT INTO `ot_district` VALUES (371602, '滨城区', 3, 371600);
INSERT INTO `ot_district` VALUES (371621, '惠民县', 3, 371600);
INSERT INTO `ot_district` VALUES (371622, '阳信县', 3, 371600);
INSERT INTO `ot_district` VALUES (371623, '无棣县', 3, 371600);
INSERT INTO `ot_district` VALUES (371624, '沾化县', 3, 371600);
INSERT INTO `ot_district` VALUES (371625, '博兴县', 3, 371600);
INSERT INTO `ot_district` VALUES (371626, '邹平县', 3, 371600);
INSERT INTO `ot_district` VALUES (371701, '市辖区', 3, 371700);
INSERT INTO `ot_district` VALUES (371702, '牡丹区', 3, 371700);
INSERT INTO `ot_district` VALUES (371721, '曹　县', 3, 371700);
INSERT INTO `ot_district` VALUES (371722, '单　县', 3, 371700);
INSERT INTO `ot_district` VALUES (371723, '成武县', 3, 371700);
INSERT INTO `ot_district` VALUES (371724, '巨野县', 3, 371700);
INSERT INTO `ot_district` VALUES (371725, '郓城县', 3, 371700);
INSERT INTO `ot_district` VALUES (371726, '鄄城县', 3, 371700);
INSERT INTO `ot_district` VALUES (371727, '定陶县', 3, 371700);
INSERT INTO `ot_district` VALUES (371728, '东明县', 3, 371700);
INSERT INTO `ot_district` VALUES (410101, '市辖区', 3, 410100);
INSERT INTO `ot_district` VALUES (410102, '中原区', 3, 410100);
INSERT INTO `ot_district` VALUES (410103, '二七区', 3, 410100);
INSERT INTO `ot_district` VALUES (410104, '管城回族区', 3, 410100);
INSERT INTO `ot_district` VALUES (410105, '金水区', 3, 410100);
INSERT INTO `ot_district` VALUES (410106, '上街区', 3, 410100);
INSERT INTO `ot_district` VALUES (410108, '邙山区', 3, 410100);
INSERT INTO `ot_district` VALUES (410122, '中牟县', 3, 410100);
INSERT INTO `ot_district` VALUES (410181, '巩义市', 3, 410100);
INSERT INTO `ot_district` VALUES (410182, '荥阳市', 3, 410100);
INSERT INTO `ot_district` VALUES (410183, '新密市', 3, 410100);
INSERT INTO `ot_district` VALUES (410184, '新郑市', 3, 410100);
INSERT INTO `ot_district` VALUES (410185, '登封市', 3, 410100);
INSERT INTO `ot_district` VALUES (410201, '市辖区', 3, 410200);
INSERT INTO `ot_district` VALUES (410202, '龙亭区', 3, 410200);
INSERT INTO `ot_district` VALUES (410203, '顺河回族区', 3, 410200);
INSERT INTO `ot_district` VALUES (410204, '鼓楼区', 3, 410200);
INSERT INTO `ot_district` VALUES (410205, '南关区', 3, 410200);
INSERT INTO `ot_district` VALUES (410211, '郊　区', 3, 410200);
INSERT INTO `ot_district` VALUES (410221, '杞　县', 3, 410200);
INSERT INTO `ot_district` VALUES (410222, '通许县', 3, 410200);
INSERT INTO `ot_district` VALUES (410223, '尉氏县', 3, 410200);
INSERT INTO `ot_district` VALUES (410224, '开封县', 3, 410200);
INSERT INTO `ot_district` VALUES (410225, '兰考县', 3, 410200);
INSERT INTO `ot_district` VALUES (410301, '市辖区', 3, 410300);
INSERT INTO `ot_district` VALUES (410302, '老城区', 3, 410300);
INSERT INTO `ot_district` VALUES (410303, '西工区', 3, 410300);
INSERT INTO `ot_district` VALUES (410304, '廛河回族区', 3, 410300);
INSERT INTO `ot_district` VALUES (410305, '涧西区', 3, 410300);
INSERT INTO `ot_district` VALUES (410306, '吉利区', 3, 410300);
INSERT INTO `ot_district` VALUES (410307, '洛龙区', 3, 410300);
INSERT INTO `ot_district` VALUES (410322, '孟津县', 3, 410300);
INSERT INTO `ot_district` VALUES (410323, '新安县', 3, 410300);
INSERT INTO `ot_district` VALUES (410324, '栾川县', 3, 410300);
INSERT INTO `ot_district` VALUES (410325, '嵩　县', 3, 410300);
INSERT INTO `ot_district` VALUES (410326, '汝阳县', 3, 410300);
INSERT INTO `ot_district` VALUES (410327, '宜阳县', 3, 410300);
INSERT INTO `ot_district` VALUES (410328, '洛宁县', 3, 410300);
INSERT INTO `ot_district` VALUES (410329, '伊川县', 3, 410300);
INSERT INTO `ot_district` VALUES (410381, '偃师市', 3, 410300);
INSERT INTO `ot_district` VALUES (410401, '市辖区', 3, 410400);
INSERT INTO `ot_district` VALUES (410402, '新华区', 3, 410400);
INSERT INTO `ot_district` VALUES (410403, '卫东区', 3, 410400);
INSERT INTO `ot_district` VALUES (410404, '石龙区', 3, 410400);
INSERT INTO `ot_district` VALUES (410411, '湛河区', 3, 410400);
INSERT INTO `ot_district` VALUES (410421, '宝丰县', 3, 410400);
INSERT INTO `ot_district` VALUES (410422, '叶　县', 3, 410400);
INSERT INTO `ot_district` VALUES (410423, '鲁山县', 3, 410400);
INSERT INTO `ot_district` VALUES (410425, '郏　县', 3, 410400);
INSERT INTO `ot_district` VALUES (410481, '舞钢市', 3, 410400);
INSERT INTO `ot_district` VALUES (410482, '汝州市', 3, 410400);
INSERT INTO `ot_district` VALUES (410501, '市辖区', 3, 410500);
INSERT INTO `ot_district` VALUES (410502, '文峰区', 3, 410500);
INSERT INTO `ot_district` VALUES (410503, '北关区', 3, 410500);
INSERT INTO `ot_district` VALUES (410505, '殷都区', 3, 410500);
INSERT INTO `ot_district` VALUES (410506, '龙安区', 3, 410500);
INSERT INTO `ot_district` VALUES (410522, '安阳县', 3, 410500);
INSERT INTO `ot_district` VALUES (410523, '汤阴县', 3, 410500);
INSERT INTO `ot_district` VALUES (410526, '滑　县', 3, 410500);
INSERT INTO `ot_district` VALUES (410527, '内黄县', 3, 410500);
INSERT INTO `ot_district` VALUES (410581, '林州市', 3, 410500);
INSERT INTO `ot_district` VALUES (410601, '市辖区', 3, 410600);
INSERT INTO `ot_district` VALUES (410602, '鹤山区', 3, 410600);
INSERT INTO `ot_district` VALUES (410603, '山城区', 3, 410600);
INSERT INTO `ot_district` VALUES (410611, '淇滨区', 3, 410600);
INSERT INTO `ot_district` VALUES (410621, '浚　县', 3, 410600);
INSERT INTO `ot_district` VALUES (410622, '淇　县', 3, 410600);
INSERT INTO `ot_district` VALUES (410701, '市辖区', 3, 410700);
INSERT INTO `ot_district` VALUES (410702, '红旗区', 3, 410700);
INSERT INTO `ot_district` VALUES (410703, '卫滨区', 3, 410700);
INSERT INTO `ot_district` VALUES (410704, '凤泉区', 3, 410700);
INSERT INTO `ot_district` VALUES (410711, '牧野区', 3, 410700);
INSERT INTO `ot_district` VALUES (410721, '新乡县', 3, 410700);
INSERT INTO `ot_district` VALUES (410724, '获嘉县', 3, 410700);
INSERT INTO `ot_district` VALUES (410725, '原阳县', 3, 410700);
INSERT INTO `ot_district` VALUES (410726, '延津县', 3, 410700);
INSERT INTO `ot_district` VALUES (410727, '封丘县', 3, 410700);
INSERT INTO `ot_district` VALUES (410728, '长垣县', 3, 410700);
INSERT INTO `ot_district` VALUES (410781, '卫辉市', 3, 410700);
INSERT INTO `ot_district` VALUES (410782, '辉县市', 3, 410700);
INSERT INTO `ot_district` VALUES (410801, '市辖区', 3, 410800);
INSERT INTO `ot_district` VALUES (410802, '解放区', 3, 410800);
INSERT INTO `ot_district` VALUES (410803, '中站区', 3, 410800);
INSERT INTO `ot_district` VALUES (410804, '马村区', 3, 410800);
INSERT INTO `ot_district` VALUES (410811, '山阳区', 3, 410800);
INSERT INTO `ot_district` VALUES (410821, '修武县', 3, 410800);
INSERT INTO `ot_district` VALUES (410822, '博爱县', 3, 410800);
INSERT INTO `ot_district` VALUES (410823, '武陟县', 3, 410800);
INSERT INTO `ot_district` VALUES (410825, '温　县', 3, 410800);
INSERT INTO `ot_district` VALUES (410881, '济源市', 3, 410800);
INSERT INTO `ot_district` VALUES (410882, '沁阳市', 3, 410800);
INSERT INTO `ot_district` VALUES (410883, '孟州市', 3, 410800);
INSERT INTO `ot_district` VALUES (410901, '市辖区', 3, 410900);
INSERT INTO `ot_district` VALUES (410902, '华龙区', 3, 410900);
INSERT INTO `ot_district` VALUES (410922, '清丰县', 3, 410900);
INSERT INTO `ot_district` VALUES (410923, '南乐县', 3, 410900);
INSERT INTO `ot_district` VALUES (410926, '范　县', 3, 410900);
INSERT INTO `ot_district` VALUES (410927, '台前县', 3, 410900);
INSERT INTO `ot_district` VALUES (410928, '濮阳县', 3, 410900);
INSERT INTO `ot_district` VALUES (411001, '市辖区', 3, 411000);
INSERT INTO `ot_district` VALUES (411002, '魏都区', 3, 411000);
INSERT INTO `ot_district` VALUES (411023, '许昌县', 3, 411000);
INSERT INTO `ot_district` VALUES (411024, '鄢陵县', 3, 411000);
INSERT INTO `ot_district` VALUES (411025, '襄城县', 3, 411000);
INSERT INTO `ot_district` VALUES (411081, '禹州市', 3, 411000);
INSERT INTO `ot_district` VALUES (411082, '长葛市', 3, 411000);
INSERT INTO `ot_district` VALUES (411101, '市辖区', 3, 411100);
INSERT INTO `ot_district` VALUES (411102, '源汇区', 3, 411100);
INSERT INTO `ot_district` VALUES (411103, '郾城区', 3, 411100);
INSERT INTO `ot_district` VALUES (411104, '召陵区', 3, 411100);
INSERT INTO `ot_district` VALUES (411121, '舞阳县', 3, 411100);
INSERT INTO `ot_district` VALUES (411122, '临颍县', 3, 411100);
INSERT INTO `ot_district` VALUES (411201, '市辖区', 3, 411200);
INSERT INTO `ot_district` VALUES (411202, '湖滨区', 3, 411200);
INSERT INTO `ot_district` VALUES (411221, '渑池县', 3, 411200);
INSERT INTO `ot_district` VALUES (411222, '陕　县', 3, 411200);
INSERT INTO `ot_district` VALUES (411224, '卢氏县', 3, 411200);
INSERT INTO `ot_district` VALUES (411281, '义马市', 3, 411200);
INSERT INTO `ot_district` VALUES (411282, '灵宝市', 3, 411200);
INSERT INTO `ot_district` VALUES (411301, '市辖区', 3, 411300);
INSERT INTO `ot_district` VALUES (411302, '宛城区', 3, 411300);
INSERT INTO `ot_district` VALUES (411303, '卧龙区', 3, 411300);
INSERT INTO `ot_district` VALUES (411321, '南召县', 3, 411300);
INSERT INTO `ot_district` VALUES (411322, '方城县', 3, 411300);
INSERT INTO `ot_district` VALUES (411323, '西峡县', 3, 411300);
INSERT INTO `ot_district` VALUES (411324, '镇平县', 3, 411300);
INSERT INTO `ot_district` VALUES (411325, '内乡县', 3, 411300);
INSERT INTO `ot_district` VALUES (411326, '淅川县', 3, 411300);
INSERT INTO `ot_district` VALUES (411327, '社旗县', 3, 411300);
INSERT INTO `ot_district` VALUES (411328, '唐河县', 3, 411300);
INSERT INTO `ot_district` VALUES (411329, '新野县', 3, 411300);
INSERT INTO `ot_district` VALUES (411330, '桐柏县', 3, 411300);
INSERT INTO `ot_district` VALUES (411381, '邓州市', 3, 411300);
INSERT INTO `ot_district` VALUES (411401, '市辖区', 3, 411400);
INSERT INTO `ot_district` VALUES (411402, '梁园区', 3, 411400);
INSERT INTO `ot_district` VALUES (411403, '睢阳区', 3, 411400);
INSERT INTO `ot_district` VALUES (411421, '民权县', 3, 411400);
INSERT INTO `ot_district` VALUES (411422, '睢　县', 3, 411400);
INSERT INTO `ot_district` VALUES (411423, '宁陵县', 3, 411400);
INSERT INTO `ot_district` VALUES (411424, '柘城县', 3, 411400);
INSERT INTO `ot_district` VALUES (411425, '虞城县', 3, 411400);
INSERT INTO `ot_district` VALUES (411426, '夏邑县', 3, 411400);
INSERT INTO `ot_district` VALUES (411481, '永城市', 3, 411400);
INSERT INTO `ot_district` VALUES (411501, '市辖区', 3, 411500);
INSERT INTO `ot_district` VALUES (411502, '师河区', 3, 411500);
INSERT INTO `ot_district` VALUES (411503, '平桥区', 3, 411500);
INSERT INTO `ot_district` VALUES (411521, '罗山县', 3, 411500);
INSERT INTO `ot_district` VALUES (411522, '光山县', 3, 411500);
INSERT INTO `ot_district` VALUES (411523, '新　县', 3, 411500);
INSERT INTO `ot_district` VALUES (411524, '商城县', 3, 411500);
INSERT INTO `ot_district` VALUES (411525, '固始县', 3, 411500);
INSERT INTO `ot_district` VALUES (411526, '潢川县', 3, 411500);
INSERT INTO `ot_district` VALUES (411527, '淮滨县', 3, 411500);
INSERT INTO `ot_district` VALUES (411528, '息　县', 3, 411500);
INSERT INTO `ot_district` VALUES (411601, '市辖区', 3, 411600);
INSERT INTO `ot_district` VALUES (411602, '川汇区', 3, 411600);
INSERT INTO `ot_district` VALUES (411621, '扶沟县', 3, 411600);
INSERT INTO `ot_district` VALUES (411622, '西华县', 3, 411600);
INSERT INTO `ot_district` VALUES (411623, '商水县', 3, 411600);
INSERT INTO `ot_district` VALUES (411624, '沈丘县', 3, 411600);
INSERT INTO `ot_district` VALUES (411625, '郸城县', 3, 411600);
INSERT INTO `ot_district` VALUES (411626, '淮阳县', 3, 411600);
INSERT INTO `ot_district` VALUES (411627, '太康县', 3, 411600);
INSERT INTO `ot_district` VALUES (411628, '鹿邑县', 3, 411600);
INSERT INTO `ot_district` VALUES (411681, '项城市', 3, 411600);
INSERT INTO `ot_district` VALUES (411701, '市辖区', 3, 411700);
INSERT INTO `ot_district` VALUES (411702, '驿城区', 3, 411700);
INSERT INTO `ot_district` VALUES (411721, '西平县', 3, 411700);
INSERT INTO `ot_district` VALUES (411722, '上蔡县', 3, 411700);
INSERT INTO `ot_district` VALUES (411723, '平舆县', 3, 411700);
INSERT INTO `ot_district` VALUES (411724, '正阳县', 3, 411700);
INSERT INTO `ot_district` VALUES (411725, '确山县', 3, 411700);
INSERT INTO `ot_district` VALUES (411726, '泌阳县', 3, 411700);
INSERT INTO `ot_district` VALUES (411727, '汝南县', 3, 411700);
INSERT INTO `ot_district` VALUES (411728, '遂平县', 3, 411700);
INSERT INTO `ot_district` VALUES (411729, '新蔡县', 3, 411700);
INSERT INTO `ot_district` VALUES (420101, '市辖区', 3, 420100);
INSERT INTO `ot_district` VALUES (420102, '江岸区', 3, 420100);
INSERT INTO `ot_district` VALUES (420103, '江汉区', 3, 420100);
INSERT INTO `ot_district` VALUES (420104, '乔口区', 3, 420100);
INSERT INTO `ot_district` VALUES (420105, '汉阳区', 3, 420100);
INSERT INTO `ot_district` VALUES (420106, '武昌区', 3, 420100);
INSERT INTO `ot_district` VALUES (420107, '青山区', 3, 420100);
INSERT INTO `ot_district` VALUES (420111, '洪山区', 3, 420100);
INSERT INTO `ot_district` VALUES (420112, '东西湖区', 3, 420100);
INSERT INTO `ot_district` VALUES (420113, '汉南区', 3, 420100);
INSERT INTO `ot_district` VALUES (420114, '蔡甸区', 3, 420100);
INSERT INTO `ot_district` VALUES (420115, '江夏区', 3, 420100);
INSERT INTO `ot_district` VALUES (420116, '黄陂区', 3, 420100);
INSERT INTO `ot_district` VALUES (420117, '新洲区', 3, 420100);
INSERT INTO `ot_district` VALUES (420201, '市辖区', 3, 420200);
INSERT INTO `ot_district` VALUES (420202, '黄石港区', 3, 420200);
INSERT INTO `ot_district` VALUES (420203, '西塞山区', 3, 420200);
INSERT INTO `ot_district` VALUES (420204, '下陆区', 3, 420200);
INSERT INTO `ot_district` VALUES (420205, '铁山区', 3, 420200);
INSERT INTO `ot_district` VALUES (420222, '阳新县', 3, 420200);
INSERT INTO `ot_district` VALUES (420281, '大冶市', 3, 420200);
INSERT INTO `ot_district` VALUES (420301, '市辖区', 3, 420300);
INSERT INTO `ot_district` VALUES (420302, '茅箭区', 3, 420300);
INSERT INTO `ot_district` VALUES (420303, '张湾区', 3, 420300);
INSERT INTO `ot_district` VALUES (420321, '郧　县', 3, 420300);
INSERT INTO `ot_district` VALUES (420322, '郧西县', 3, 420300);
INSERT INTO `ot_district` VALUES (420323, '竹山县', 3, 420300);
INSERT INTO `ot_district` VALUES (420324, '竹溪县', 3, 420300);
INSERT INTO `ot_district` VALUES (420325, '房　县', 3, 420300);
INSERT INTO `ot_district` VALUES (420381, '丹江口市', 3, 420300);
INSERT INTO `ot_district` VALUES (420501, '市辖区', 3, 420500);
INSERT INTO `ot_district` VALUES (420502, '西陵区', 3, 420500);
INSERT INTO `ot_district` VALUES (420503, '伍家岗区', 3, 420500);
INSERT INTO `ot_district` VALUES (420504, '点军区', 3, 420500);
INSERT INTO `ot_district` VALUES (420505, '猇亭区', 3, 420500);
INSERT INTO `ot_district` VALUES (420506, '夷陵区', 3, 420500);
INSERT INTO `ot_district` VALUES (420525, '远安县', 3, 420500);
INSERT INTO `ot_district` VALUES (420526, '兴山县', 3, 420500);
INSERT INTO `ot_district` VALUES (420527, '秭归县', 3, 420500);
INSERT INTO `ot_district` VALUES (420528, '长阳土家族自治县', 3, 420500);
INSERT INTO `ot_district` VALUES (420529, '五峰土家族自治县', 3, 420500);
INSERT INTO `ot_district` VALUES (420581, '宜都市', 3, 420500);
INSERT INTO `ot_district` VALUES (420582, '当阳市', 3, 420500);
INSERT INTO `ot_district` VALUES (420583, '枝江市', 3, 420500);
INSERT INTO `ot_district` VALUES (420601, '市辖区', 3, 420600);
INSERT INTO `ot_district` VALUES (420602, '襄城区', 3, 420600);
INSERT INTO `ot_district` VALUES (420606, '樊城区', 3, 420600);
INSERT INTO `ot_district` VALUES (420607, '襄阳区', 3, 420600);
INSERT INTO `ot_district` VALUES (420624, '南漳县', 3, 420600);
INSERT INTO `ot_district` VALUES (420625, '谷城县', 3, 420600);
INSERT INTO `ot_district` VALUES (420626, '保康县', 3, 420600);
INSERT INTO `ot_district` VALUES (420682, '老河口市', 3, 420600);
INSERT INTO `ot_district` VALUES (420683, '枣阳市', 3, 420600);
INSERT INTO `ot_district` VALUES (420684, '宜城市', 3, 420600);
INSERT INTO `ot_district` VALUES (420701, '市辖区', 3, 420700);
INSERT INTO `ot_district` VALUES (420702, '梁子湖区', 3, 420700);
INSERT INTO `ot_district` VALUES (420703, '华容区', 3, 420700);
INSERT INTO `ot_district` VALUES (420704, '鄂城区', 3, 420700);
INSERT INTO `ot_district` VALUES (420801, '市辖区', 3, 420800);
INSERT INTO `ot_district` VALUES (420802, '东宝区', 3, 420800);
INSERT INTO `ot_district` VALUES (420804, '掇刀区', 3, 420800);
INSERT INTO `ot_district` VALUES (420821, '京山县', 3, 420800);
INSERT INTO `ot_district` VALUES (420822, '沙洋县', 3, 420800);
INSERT INTO `ot_district` VALUES (420881, '钟祥市', 3, 420800);
INSERT INTO `ot_district` VALUES (420901, '市辖区', 3, 420900);
INSERT INTO `ot_district` VALUES (420902, '孝南区', 3, 420900);
INSERT INTO `ot_district` VALUES (420921, '孝昌县', 3, 420900);
INSERT INTO `ot_district` VALUES (420922, '大悟县', 3, 420900);
INSERT INTO `ot_district` VALUES (420923, '云梦县', 3, 420900);
INSERT INTO `ot_district` VALUES (420981, '应城市', 3, 420900);
INSERT INTO `ot_district` VALUES (420982, '安陆市', 3, 420900);
INSERT INTO `ot_district` VALUES (420984, '汉川市', 3, 420900);
INSERT INTO `ot_district` VALUES (421001, '市辖区', 3, 421000);
INSERT INTO `ot_district` VALUES (421002, '沙市区', 3, 421000);
INSERT INTO `ot_district` VALUES (421003, '荆州区', 3, 421000);
INSERT INTO `ot_district` VALUES (421022, '公安县', 3, 421000);
INSERT INTO `ot_district` VALUES (421023, '监利县', 3, 421000);
INSERT INTO `ot_district` VALUES (421024, '江陵县', 3, 421000);
INSERT INTO `ot_district` VALUES (421081, '石首市', 3, 421000);
INSERT INTO `ot_district` VALUES (421083, '洪湖市', 3, 421000);
INSERT INTO `ot_district` VALUES (421087, '松滋市', 3, 421000);
INSERT INTO `ot_district` VALUES (421101, '市辖区', 3, 421100);
INSERT INTO `ot_district` VALUES (421102, '黄州区', 3, 421100);
INSERT INTO `ot_district` VALUES (421121, '团风县', 3, 421100);
INSERT INTO `ot_district` VALUES (421122, '红安县', 3, 421100);
INSERT INTO `ot_district` VALUES (421123, '罗田县', 3, 421100);
INSERT INTO `ot_district` VALUES (421124, '英山县', 3, 421100);
INSERT INTO `ot_district` VALUES (421125, '浠水县', 3, 421100);
INSERT INTO `ot_district` VALUES (421126, '蕲春县', 3, 421100);
INSERT INTO `ot_district` VALUES (421127, '黄梅县', 3, 421100);
INSERT INTO `ot_district` VALUES (421181, '麻城市', 3, 421100);
INSERT INTO `ot_district` VALUES (421182, '武穴市', 3, 421100);
INSERT INTO `ot_district` VALUES (421201, '市辖区', 3, 421200);
INSERT INTO `ot_district` VALUES (421202, '咸安区', 3, 421200);
INSERT INTO `ot_district` VALUES (421221, '嘉鱼县', 3, 421200);
INSERT INTO `ot_district` VALUES (421222, '通城县', 3, 421200);
INSERT INTO `ot_district` VALUES (421223, '崇阳县', 3, 421200);
INSERT INTO `ot_district` VALUES (421224, '通山县', 3, 421200);
INSERT INTO `ot_district` VALUES (421281, '赤壁市', 3, 421200);
INSERT INTO `ot_district` VALUES (421301, '市辖区', 3, 421300);
INSERT INTO `ot_district` VALUES (421302, '曾都区', 3, 421300);
INSERT INTO `ot_district` VALUES (421381, '广水市', 3, 421300);
INSERT INTO `ot_district` VALUES (422801, '恩施市', 3, 422800);
INSERT INTO `ot_district` VALUES (422802, '利川市', 3, 422800);
INSERT INTO `ot_district` VALUES (422822, '建始县', 3, 422800);
INSERT INTO `ot_district` VALUES (422823, '巴东县', 3, 422800);
INSERT INTO `ot_district` VALUES (422825, '宣恩县', 3, 422800);
INSERT INTO `ot_district` VALUES (422826, '咸丰县', 3, 422800);
INSERT INTO `ot_district` VALUES (422827, '来凤县', 3, 422800);
INSERT INTO `ot_district` VALUES (422828, '鹤峰县', 3, 422800);
INSERT INTO `ot_district` VALUES (429004, '仙桃市', 3, 429000);
INSERT INTO `ot_district` VALUES (429005, '潜江市', 3, 429000);
INSERT INTO `ot_district` VALUES (429006, '天门市', 3, 429000);
INSERT INTO `ot_district` VALUES (429021, '神农架林区', 3, 429000);
INSERT INTO `ot_district` VALUES (430101, '市辖区', 3, 430100);
INSERT INTO `ot_district` VALUES (430102, '芙蓉区', 3, 430100);
INSERT INTO `ot_district` VALUES (430103, '天心区', 3, 430100);
INSERT INTO `ot_district` VALUES (430104, '岳麓区', 3, 430100);
INSERT INTO `ot_district` VALUES (430105, '开福区', 3, 430100);
INSERT INTO `ot_district` VALUES (430111, '雨花区', 3, 430100);
INSERT INTO `ot_district` VALUES (430121, '长沙县', 3, 430100);
INSERT INTO `ot_district` VALUES (430122, '望城县', 3, 430100);
INSERT INTO `ot_district` VALUES (430124, '宁乡县', 3, 430100);
INSERT INTO `ot_district` VALUES (430181, '浏阳市', 3, 430100);
INSERT INTO `ot_district` VALUES (430201, '市辖区', 3, 430200);
INSERT INTO `ot_district` VALUES (430202, '荷塘区', 3, 430200);
INSERT INTO `ot_district` VALUES (430203, '芦淞区', 3, 430200);
INSERT INTO `ot_district` VALUES (430204, '石峰区', 3, 430200);
INSERT INTO `ot_district` VALUES (430211, '天元区', 3, 430200);
INSERT INTO `ot_district` VALUES (430221, '株洲县', 3, 430200);
INSERT INTO `ot_district` VALUES (430223, '攸　县', 3, 430200);
INSERT INTO `ot_district` VALUES (430224, '茶陵县', 3, 430200);
INSERT INTO `ot_district` VALUES (430225, '炎陵县', 3, 430200);
INSERT INTO `ot_district` VALUES (430281, '醴陵市', 3, 430200);
INSERT INTO `ot_district` VALUES (430301, '市辖区', 3, 430300);
INSERT INTO `ot_district` VALUES (430302, '雨湖区', 3, 430300);
INSERT INTO `ot_district` VALUES (430304, '岳塘区', 3, 430300);
INSERT INTO `ot_district` VALUES (430321, '湘潭县', 3, 430300);
INSERT INTO `ot_district` VALUES (430381, '湘乡市', 3, 430300);
INSERT INTO `ot_district` VALUES (430382, '韶山市', 3, 430300);
INSERT INTO `ot_district` VALUES (430401, '市辖区', 3, 430400);
INSERT INTO `ot_district` VALUES (430405, '珠晖区', 3, 430400);
INSERT INTO `ot_district` VALUES (430406, '雁峰区', 3, 430400);
INSERT INTO `ot_district` VALUES (430407, '石鼓区', 3, 430400);
INSERT INTO `ot_district` VALUES (430408, '蒸湘区', 3, 430400);
INSERT INTO `ot_district` VALUES (430412, '南岳区', 3, 430400);
INSERT INTO `ot_district` VALUES (430421, '衡阳县', 3, 430400);
INSERT INTO `ot_district` VALUES (430422, '衡南县', 3, 430400);
INSERT INTO `ot_district` VALUES (430423, '衡山县', 3, 430400);
INSERT INTO `ot_district` VALUES (430424, '衡东县', 3, 430400);
INSERT INTO `ot_district` VALUES (430426, '祁东县', 3, 430400);
INSERT INTO `ot_district` VALUES (430481, '耒阳市', 3, 430400);
INSERT INTO `ot_district` VALUES (430482, '常宁市', 3, 430400);
INSERT INTO `ot_district` VALUES (430501, '市辖区', 3, 430500);
INSERT INTO `ot_district` VALUES (430502, '双清区', 3, 430500);
INSERT INTO `ot_district` VALUES (430503, '大祥区', 3, 430500);
INSERT INTO `ot_district` VALUES (430511, '北塔区', 3, 430500);
INSERT INTO `ot_district` VALUES (430521, '邵东县', 3, 430500);
INSERT INTO `ot_district` VALUES (430522, '新邵县', 3, 430500);
INSERT INTO `ot_district` VALUES (430523, '邵阳县', 3, 430500);
INSERT INTO `ot_district` VALUES (430524, '隆回县', 3, 430500);
INSERT INTO `ot_district` VALUES (430525, '洞口县', 3, 430500);
INSERT INTO `ot_district` VALUES (430527, '绥宁县', 3, 430500);
INSERT INTO `ot_district` VALUES (430528, '新宁县', 3, 430500);
INSERT INTO `ot_district` VALUES (430529, '城步苗族自治县', 3, 430500);
INSERT INTO `ot_district` VALUES (430581, '武冈市', 3, 430500);
INSERT INTO `ot_district` VALUES (430601, '市辖区', 3, 430600);
INSERT INTO `ot_district` VALUES (430602, '岳阳楼区', 3, 430600);
INSERT INTO `ot_district` VALUES (430603, '云溪区', 3, 430600);
INSERT INTO `ot_district` VALUES (430611, '君山区', 3, 430600);
INSERT INTO `ot_district` VALUES (430621, '岳阳县', 3, 430600);
INSERT INTO `ot_district` VALUES (430623, '华容县', 3, 430600);
INSERT INTO `ot_district` VALUES (430624, '湘阴县', 3, 430600);
INSERT INTO `ot_district` VALUES (430626, '平江县', 3, 430600);
INSERT INTO `ot_district` VALUES (430681, '汨罗市', 3, 430600);
INSERT INTO `ot_district` VALUES (430682, '临湘市', 3, 430600);
INSERT INTO `ot_district` VALUES (430701, '市辖区', 3, 430700);
INSERT INTO `ot_district` VALUES (430702, '武陵区', 3, 430700);
INSERT INTO `ot_district` VALUES (430703, '鼎城区', 3, 430700);
INSERT INTO `ot_district` VALUES (430721, '安乡县', 3, 430700);
INSERT INTO `ot_district` VALUES (430722, '汉寿县', 3, 430700);
INSERT INTO `ot_district` VALUES (430723, '澧　县', 3, 430700);
INSERT INTO `ot_district` VALUES (430724, '临澧县', 3, 430700);
INSERT INTO `ot_district` VALUES (430725, '桃源县', 3, 430700);
INSERT INTO `ot_district` VALUES (430726, '石门县', 3, 430700);
INSERT INTO `ot_district` VALUES (430781, '津市市', 3, 430700);
INSERT INTO `ot_district` VALUES (430801, '市辖区', 3, 430800);
INSERT INTO `ot_district` VALUES (430802, '永定区', 3, 430800);
INSERT INTO `ot_district` VALUES (430811, '武陵源区', 3, 430800);
INSERT INTO `ot_district` VALUES (430821, '慈利县', 3, 430800);
INSERT INTO `ot_district` VALUES (430822, '桑植县', 3, 430800);
INSERT INTO `ot_district` VALUES (430901, '市辖区', 3, 430900);
INSERT INTO `ot_district` VALUES (430902, '资阳区', 3, 430900);
INSERT INTO `ot_district` VALUES (430903, '赫山区', 3, 430900);
INSERT INTO `ot_district` VALUES (430921, '南　县', 3, 430900);
INSERT INTO `ot_district` VALUES (430922, '桃江县', 3, 430900);
INSERT INTO `ot_district` VALUES (430923, '安化县', 3, 430900);
INSERT INTO `ot_district` VALUES (430981, '沅江市', 3, 430900);
INSERT INTO `ot_district` VALUES (431001, '市辖区', 3, 431000);
INSERT INTO `ot_district` VALUES (431002, '北湖区', 3, 431000);
INSERT INTO `ot_district` VALUES (431003, '苏仙区', 3, 431000);
INSERT INTO `ot_district` VALUES (431021, '桂阳县', 3, 431000);
INSERT INTO `ot_district` VALUES (431022, '宜章县', 3, 431000);
INSERT INTO `ot_district` VALUES (431023, '永兴县', 3, 431000);
INSERT INTO `ot_district` VALUES (431024, '嘉禾县', 3, 431000);
INSERT INTO `ot_district` VALUES (431025, '临武县', 3, 431000);
INSERT INTO `ot_district` VALUES (431026, '汝城县', 3, 431000);
INSERT INTO `ot_district` VALUES (431027, '桂东县', 3, 431000);
INSERT INTO `ot_district` VALUES (431028, '安仁县', 3, 431000);
INSERT INTO `ot_district` VALUES (431081, '资兴市', 3, 431000);
INSERT INTO `ot_district` VALUES (431101, '市辖区', 3, 431100);
INSERT INTO `ot_district` VALUES (431102, '芝山区', 3, 431100);
INSERT INTO `ot_district` VALUES (431103, '冷水滩区', 3, 431100);
INSERT INTO `ot_district` VALUES (431121, '祁阳县', 3, 431100);
INSERT INTO `ot_district` VALUES (431122, '东安县', 3, 431100);
INSERT INTO `ot_district` VALUES (431123, '双牌县', 3, 431100);
INSERT INTO `ot_district` VALUES (431124, '道　县', 3, 431100);
INSERT INTO `ot_district` VALUES (431125, '江永县', 3, 431100);
INSERT INTO `ot_district` VALUES (431126, '宁远县', 3, 431100);
INSERT INTO `ot_district` VALUES (431127, '蓝山县', 3, 431100);
INSERT INTO `ot_district` VALUES (431128, '新田县', 3, 431100);
INSERT INTO `ot_district` VALUES (431129, '江华瑶族自治县', 3, 431100);
INSERT INTO `ot_district` VALUES (431201, '市辖区', 3, 431200);
INSERT INTO `ot_district` VALUES (431202, '鹤城区', 3, 431200);
INSERT INTO `ot_district` VALUES (431221, '中方县', 3, 431200);
INSERT INTO `ot_district` VALUES (431222, '沅陵县', 3, 431200);
INSERT INTO `ot_district` VALUES (431223, '辰溪县', 3, 431200);
INSERT INTO `ot_district` VALUES (431224, '溆浦县', 3, 431200);
INSERT INTO `ot_district` VALUES (431225, '会同县', 3, 431200);
INSERT INTO `ot_district` VALUES (431226, '麻阳苗族自治县', 3, 431200);
INSERT INTO `ot_district` VALUES (431227, '新晃侗族自治县', 3, 431200);
INSERT INTO `ot_district` VALUES (431228, '芷江侗族自治县', 3, 431200);
INSERT INTO `ot_district` VALUES (431229, '靖州苗族侗族自治县', 3, 431200);
INSERT INTO `ot_district` VALUES (431230, '通道侗族自治县', 3, 431200);
INSERT INTO `ot_district` VALUES (431281, '洪江市', 3, 431200);
INSERT INTO `ot_district` VALUES (431301, '市辖区', 3, 431300);
INSERT INTO `ot_district` VALUES (431302, '娄星区', 3, 431300);
INSERT INTO `ot_district` VALUES (431321, '双峰县', 3, 431300);
INSERT INTO `ot_district` VALUES (431322, '新化县', 3, 431300);
INSERT INTO `ot_district` VALUES (431381, '冷水江市', 3, 431300);
INSERT INTO `ot_district` VALUES (431382, '涟源市', 3, 431300);
INSERT INTO `ot_district` VALUES (433101, '吉首市', 3, 433100);
INSERT INTO `ot_district` VALUES (433122, '泸溪县', 3, 433100);
INSERT INTO `ot_district` VALUES (433123, '凤凰县', 3, 433100);
INSERT INTO `ot_district` VALUES (433124, '花垣县', 3, 433100);
INSERT INTO `ot_district` VALUES (433125, '保靖县', 3, 433100);
INSERT INTO `ot_district` VALUES (433126, '古丈县', 3, 433100);
INSERT INTO `ot_district` VALUES (433127, '永顺县', 3, 433100);
INSERT INTO `ot_district` VALUES (433130, '龙山县', 3, 433100);
INSERT INTO `ot_district` VALUES (440101, '市辖区', 3, 440100);
INSERT INTO `ot_district` VALUES (440102, '东山区', 3, 440100);
INSERT INTO `ot_district` VALUES (440103, '荔湾区', 3, 440100);
INSERT INTO `ot_district` VALUES (440104, '越秀区', 3, 440100);
INSERT INTO `ot_district` VALUES (440105, '海珠区', 3, 440100);
INSERT INTO `ot_district` VALUES (440106, '天河区', 3, 440100);
INSERT INTO `ot_district` VALUES (440107, '芳村区', 3, 440100);
INSERT INTO `ot_district` VALUES (440111, '白云区', 3, 440100);
INSERT INTO `ot_district` VALUES (440112, '黄埔区', 3, 440100);
INSERT INTO `ot_district` VALUES (440113, '番禺区', 3, 440100);
INSERT INTO `ot_district` VALUES (440114, '花都区', 3, 440100);
INSERT INTO `ot_district` VALUES (440183, '增城市', 3, 440100);
INSERT INTO `ot_district` VALUES (440184, '从化市', 3, 440100);
INSERT INTO `ot_district` VALUES (440201, '市辖区', 3, 440200);
INSERT INTO `ot_district` VALUES (440203, '武江区', 3, 440200);
INSERT INTO `ot_district` VALUES (440204, '浈江区', 3, 440200);
INSERT INTO `ot_district` VALUES (440205, '曲江区', 3, 440200);
INSERT INTO `ot_district` VALUES (440222, '始兴县', 3, 440200);
INSERT INTO `ot_district` VALUES (440224, '仁化县', 3, 440200);
INSERT INTO `ot_district` VALUES (440229, '翁源县', 3, 440200);
INSERT INTO `ot_district` VALUES (440232, '乳源瑶族自治县', 3, 440200);
INSERT INTO `ot_district` VALUES (440233, '新丰县', 3, 440200);
INSERT INTO `ot_district` VALUES (440281, '乐昌市', 3, 440200);
INSERT INTO `ot_district` VALUES (440282, '南雄市', 3, 440200);
INSERT INTO `ot_district` VALUES (440301, '市辖区', 3, 440300);
INSERT INTO `ot_district` VALUES (440303, '罗湖区', 3, 440300);
INSERT INTO `ot_district` VALUES (440304, '福田区', 3, 440300);
INSERT INTO `ot_district` VALUES (440305, '南山区', 3, 440300);
INSERT INTO `ot_district` VALUES (440306, '宝安区', 3, 440300);
INSERT INTO `ot_district` VALUES (440307, '龙岗区', 3, 440300);
INSERT INTO `ot_district` VALUES (440308, '盐田区', 3, 440300);
INSERT INTO `ot_district` VALUES (440401, '市辖区', 3, 440400);
INSERT INTO `ot_district` VALUES (440402, '香洲区', 3, 440400);
INSERT INTO `ot_district` VALUES (440403, '斗门区', 3, 440400);
INSERT INTO `ot_district` VALUES (440404, '金湾区', 3, 440400);
INSERT INTO `ot_district` VALUES (440501, '市辖区', 3, 440500);
INSERT INTO `ot_district` VALUES (440507, '龙湖区', 3, 440500);
INSERT INTO `ot_district` VALUES (440511, '金平区', 3, 440500);
INSERT INTO `ot_district` VALUES (440512, '濠江区', 3, 440500);
INSERT INTO `ot_district` VALUES (440513, '潮阳区', 3, 440500);
INSERT INTO `ot_district` VALUES (440514, '潮南区', 3, 440500);
INSERT INTO `ot_district` VALUES (440515, '澄海区', 3, 440500);
INSERT INTO `ot_district` VALUES (440523, '南澳县', 3, 440500);
INSERT INTO `ot_district` VALUES (440601, '市辖区', 3, 440600);
INSERT INTO `ot_district` VALUES (440604, '禅城区', 3, 440600);
INSERT INTO `ot_district` VALUES (440605, '南海区', 3, 440600);
INSERT INTO `ot_district` VALUES (440606, '顺德区', 3, 440600);
INSERT INTO `ot_district` VALUES (440607, '三水区', 3, 440600);
INSERT INTO `ot_district` VALUES (440608, '高明区', 3, 440600);
INSERT INTO `ot_district` VALUES (440701, '市辖区', 3, 440700);
INSERT INTO `ot_district` VALUES (440703, '蓬江区', 3, 440700);
INSERT INTO `ot_district` VALUES (440704, '江海区', 3, 440700);
INSERT INTO `ot_district` VALUES (440705, '新会区', 3, 440700);
INSERT INTO `ot_district` VALUES (440781, '台山市', 3, 440700);
INSERT INTO `ot_district` VALUES (440783, '开平市', 3, 440700);
INSERT INTO `ot_district` VALUES (440784, '鹤山市', 3, 440700);
INSERT INTO `ot_district` VALUES (440785, '恩平市', 3, 440700);
INSERT INTO `ot_district` VALUES (440801, '市辖区', 3, 440800);
INSERT INTO `ot_district` VALUES (440802, '赤坎区', 3, 440800);
INSERT INTO `ot_district` VALUES (440803, '霞山区', 3, 440800);
INSERT INTO `ot_district` VALUES (440804, '坡头区', 3, 440800);
INSERT INTO `ot_district` VALUES (440811, '麻章区', 3, 440800);
INSERT INTO `ot_district` VALUES (440823, '遂溪县', 3, 440800);
INSERT INTO `ot_district` VALUES (440825, '徐闻县', 3, 440800);
INSERT INTO `ot_district` VALUES (440881, '廉江市', 3, 440800);
INSERT INTO `ot_district` VALUES (440882, '雷州市', 3, 440800);
INSERT INTO `ot_district` VALUES (440883, '吴川市', 3, 440800);
INSERT INTO `ot_district` VALUES (440901, '市辖区', 3, 440900);
INSERT INTO `ot_district` VALUES (440902, '茂南区', 3, 440900);
INSERT INTO `ot_district` VALUES (440903, '茂港区', 3, 440900);
INSERT INTO `ot_district` VALUES (440923, '电白县', 3, 440900);
INSERT INTO `ot_district` VALUES (440981, '高州市', 3, 440900);
INSERT INTO `ot_district` VALUES (440982, '化州市', 3, 440900);
INSERT INTO `ot_district` VALUES (440983, '信宜市', 3, 440900);
INSERT INTO `ot_district` VALUES (441201, '市辖区', 3, 441200);
INSERT INTO `ot_district` VALUES (441202, '端州区', 3, 441200);
INSERT INTO `ot_district` VALUES (441203, '鼎湖区', 3, 441200);
INSERT INTO `ot_district` VALUES (441223, '广宁县', 3, 441200);
INSERT INTO `ot_district` VALUES (441224, '怀集县', 3, 441200);
INSERT INTO `ot_district` VALUES (441225, '封开县', 3, 441200);
INSERT INTO `ot_district` VALUES (441226, '德庆县', 3, 441200);
INSERT INTO `ot_district` VALUES (441283, '高要市', 3, 441200);
INSERT INTO `ot_district` VALUES (441284, '四会市', 3, 441200);
INSERT INTO `ot_district` VALUES (441301, '市辖区', 3, 441300);
INSERT INTO `ot_district` VALUES (441302, '惠城区', 3, 441300);
INSERT INTO `ot_district` VALUES (441303, '惠阳区', 3, 441300);
INSERT INTO `ot_district` VALUES (441322, '博罗县', 3, 441300);
INSERT INTO `ot_district` VALUES (441323, '惠东县', 3, 441300);
INSERT INTO `ot_district` VALUES (441324, '龙门县', 3, 441300);
INSERT INTO `ot_district` VALUES (441401, '市辖区', 3, 441400);
INSERT INTO `ot_district` VALUES (441402, '梅江区', 3, 441400);
INSERT INTO `ot_district` VALUES (441421, '梅　县', 3, 441400);
INSERT INTO `ot_district` VALUES (441422, '大埔县', 3, 441400);
INSERT INTO `ot_district` VALUES (441423, '丰顺县', 3, 441400);
INSERT INTO `ot_district` VALUES (441424, '五华县', 3, 441400);
INSERT INTO `ot_district` VALUES (441426, '平远县', 3, 441400);
INSERT INTO `ot_district` VALUES (441427, '蕉岭县', 3, 441400);
INSERT INTO `ot_district` VALUES (441481, '兴宁市', 3, 441400);
INSERT INTO `ot_district` VALUES (441501, '市辖区', 3, 441500);
INSERT INTO `ot_district` VALUES (441502, '城　区', 3, 441500);
INSERT INTO `ot_district` VALUES (441521, '海丰县', 3, 441500);
INSERT INTO `ot_district` VALUES (441523, '陆河县', 3, 441500);
INSERT INTO `ot_district` VALUES (441581, '陆丰市', 3, 441500);
INSERT INTO `ot_district` VALUES (441601, '市辖区', 3, 441600);
INSERT INTO `ot_district` VALUES (441602, '源城区', 3, 441600);
INSERT INTO `ot_district` VALUES (441621, '紫金县', 3, 441600);
INSERT INTO `ot_district` VALUES (441622, '龙川县', 3, 441600);
INSERT INTO `ot_district` VALUES (441623, '连平县', 3, 441600);
INSERT INTO `ot_district` VALUES (441624, '和平县', 3, 441600);
INSERT INTO `ot_district` VALUES (441625, '东源县', 3, 441600);
INSERT INTO `ot_district` VALUES (441701, '市辖区', 3, 441700);
INSERT INTO `ot_district` VALUES (441702, '江城区', 3, 441700);
INSERT INTO `ot_district` VALUES (441721, '阳西县', 3, 441700);
INSERT INTO `ot_district` VALUES (441723, '阳东县', 3, 441700);
INSERT INTO `ot_district` VALUES (441781, '阳春市', 3, 441700);
INSERT INTO `ot_district` VALUES (441801, '市辖区', 3, 441800);
INSERT INTO `ot_district` VALUES (441802, '清城区', 3, 441800);
INSERT INTO `ot_district` VALUES (441821, '佛冈县', 3, 441800);
INSERT INTO `ot_district` VALUES (441823, '阳山县', 3, 441800);
INSERT INTO `ot_district` VALUES (441825, '连山壮族瑶族自治县', 3, 441800);
INSERT INTO `ot_district` VALUES (441826, '连南瑶族自治县', 3, 441800);
INSERT INTO `ot_district` VALUES (441827, '清新县', 3, 441800);
INSERT INTO `ot_district` VALUES (441881, '英德市', 3, 441800);
INSERT INTO `ot_district` VALUES (441882, '连州市', 3, 441800);
INSERT INTO `ot_district` VALUES (445101, '市辖区', 3, 445100);
INSERT INTO `ot_district` VALUES (445102, '湘桥区', 3, 445100);
INSERT INTO `ot_district` VALUES (445121, '潮安县', 3, 445100);
INSERT INTO `ot_district` VALUES (445122, '饶平县', 3, 445100);
INSERT INTO `ot_district` VALUES (445201, '市辖区', 3, 445200);
INSERT INTO `ot_district` VALUES (445202, '榕城区', 3, 445200);
INSERT INTO `ot_district` VALUES (445221, '揭东县', 3, 445200);
INSERT INTO `ot_district` VALUES (445222, '揭西县', 3, 445200);
INSERT INTO `ot_district` VALUES (445224, '惠来县', 3, 445200);
INSERT INTO `ot_district` VALUES (445281, '普宁市', 3, 445200);
INSERT INTO `ot_district` VALUES (445301, '市辖区', 3, 445300);
INSERT INTO `ot_district` VALUES (445302, '云城区', 3, 445300);
INSERT INTO `ot_district` VALUES (445321, '新兴县', 3, 445300);
INSERT INTO `ot_district` VALUES (445322, '郁南县', 3, 445300);
INSERT INTO `ot_district` VALUES (445323, '云安县', 3, 445300);
INSERT INTO `ot_district` VALUES (445381, '罗定市', 3, 445300);
INSERT INTO `ot_district` VALUES (450101, '市辖区', 3, 450100);
INSERT INTO `ot_district` VALUES (450102, '兴宁区', 3, 450100);
INSERT INTO `ot_district` VALUES (450103, '青秀区', 3, 450100);
INSERT INTO `ot_district` VALUES (450105, '江南区', 3, 450100);
INSERT INTO `ot_district` VALUES (450107, '西乡塘区', 3, 450100);
INSERT INTO `ot_district` VALUES (450108, '良庆区', 3, 450100);
INSERT INTO `ot_district` VALUES (450109, '邕宁区', 3, 450100);
INSERT INTO `ot_district` VALUES (450122, '武鸣县', 3, 450100);
INSERT INTO `ot_district` VALUES (450123, '隆安县', 3, 450100);
INSERT INTO `ot_district` VALUES (450124, '马山县', 3, 450100);
INSERT INTO `ot_district` VALUES (450125, '上林县', 3, 450100);
INSERT INTO `ot_district` VALUES (450126, '宾阳县', 3, 450100);
INSERT INTO `ot_district` VALUES (450127, '横　县', 3, 450100);
INSERT INTO `ot_district` VALUES (450201, '市辖区', 3, 450200);
INSERT INTO `ot_district` VALUES (450202, '城中区', 3, 450200);
INSERT INTO `ot_district` VALUES (450203, '鱼峰区', 3, 450200);
INSERT INTO `ot_district` VALUES (450204, '柳南区', 3, 450200);
INSERT INTO `ot_district` VALUES (450205, '柳北区', 3, 450200);
INSERT INTO `ot_district` VALUES (450221, '柳江县', 3, 450200);
INSERT INTO `ot_district` VALUES (450222, '柳城县', 3, 450200);
INSERT INTO `ot_district` VALUES (450223, '鹿寨县', 3, 450200);
INSERT INTO `ot_district` VALUES (450224, '融安县', 3, 450200);
INSERT INTO `ot_district` VALUES (450225, '融水苗族自治县', 3, 450200);
INSERT INTO `ot_district` VALUES (450226, '三江侗族自治县', 3, 450200);
INSERT INTO `ot_district` VALUES (450301, '市辖区', 3, 450300);
INSERT INTO `ot_district` VALUES (450302, '秀峰区', 3, 450300);
INSERT INTO `ot_district` VALUES (450303, '叠彩区', 3, 450300);
INSERT INTO `ot_district` VALUES (450304, '象山区', 3, 450300);
INSERT INTO `ot_district` VALUES (450305, '七星区', 3, 450300);
INSERT INTO `ot_district` VALUES (450311, '雁山区', 3, 450300);
INSERT INTO `ot_district` VALUES (450321, '阳朔县', 3, 450300);
INSERT INTO `ot_district` VALUES (450322, '临桂县', 3, 450300);
INSERT INTO `ot_district` VALUES (450323, '灵川县', 3, 450300);
INSERT INTO `ot_district` VALUES (450324, '全州县', 3, 450300);
INSERT INTO `ot_district` VALUES (450325, '兴安县', 3, 450300);
INSERT INTO `ot_district` VALUES (450326, '永福县', 3, 450300);
INSERT INTO `ot_district` VALUES (450327, '灌阳县', 3, 450300);
INSERT INTO `ot_district` VALUES (450328, '龙胜各族自治县', 3, 450300);
INSERT INTO `ot_district` VALUES (450329, '资源县', 3, 450300);
INSERT INTO `ot_district` VALUES (450330, '平乐县', 3, 450300);
INSERT INTO `ot_district` VALUES (450331, '荔蒲县', 3, 450300);
INSERT INTO `ot_district` VALUES (450332, '恭城瑶族自治县', 3, 450300);
INSERT INTO `ot_district` VALUES (450401, '市辖区', 3, 450400);
INSERT INTO `ot_district` VALUES (450403, '万秀区', 3, 450400);
INSERT INTO `ot_district` VALUES (450404, '蝶山区', 3, 450400);
INSERT INTO `ot_district` VALUES (450405, '长洲区', 3, 450400);
INSERT INTO `ot_district` VALUES (450421, '苍梧县', 3, 450400);
INSERT INTO `ot_district` VALUES (450422, '藤　县', 3, 450400);
INSERT INTO `ot_district` VALUES (450423, '蒙山县', 3, 450400);
INSERT INTO `ot_district` VALUES (450481, '岑溪市', 3, 450400);
INSERT INTO `ot_district` VALUES (450501, '市辖区', 3, 450500);
INSERT INTO `ot_district` VALUES (450502, '海城区', 3, 450500);
INSERT INTO `ot_district` VALUES (450503, '银海区', 3, 450500);
INSERT INTO `ot_district` VALUES (450512, '铁山港区', 3, 450500);
INSERT INTO `ot_district` VALUES (450521, '合浦县', 3, 450500);
INSERT INTO `ot_district` VALUES (450601, '市辖区', 3, 450600);
INSERT INTO `ot_district` VALUES (450602, '港口区', 3, 450600);
INSERT INTO `ot_district` VALUES (450603, '防城区', 3, 450600);
INSERT INTO `ot_district` VALUES (450621, '上思县', 3, 450600);
INSERT INTO `ot_district` VALUES (450681, '东兴市', 3, 450600);
INSERT INTO `ot_district` VALUES (450701, '市辖区', 3, 450700);
INSERT INTO `ot_district` VALUES (450702, '钦南区', 3, 450700);
INSERT INTO `ot_district` VALUES (450703, '钦北区', 3, 450700);
INSERT INTO `ot_district` VALUES (450721, '灵山县', 3, 450700);
INSERT INTO `ot_district` VALUES (450722, '浦北县', 3, 450700);
INSERT INTO `ot_district` VALUES (450801, '市辖区', 3, 450800);
INSERT INTO `ot_district` VALUES (450802, '港北区', 3, 450800);
INSERT INTO `ot_district` VALUES (450803, '港南区', 3, 450800);
INSERT INTO `ot_district` VALUES (450804, '覃塘区', 3, 450800);
INSERT INTO `ot_district` VALUES (450821, '平南县', 3, 450800);
INSERT INTO `ot_district` VALUES (450881, '桂平市', 3, 450800);
INSERT INTO `ot_district` VALUES (450901, '市辖区', 3, 450900);
INSERT INTO `ot_district` VALUES (450902, '玉州区', 3, 450900);
INSERT INTO `ot_district` VALUES (450921, '容　县', 3, 450900);
INSERT INTO `ot_district` VALUES (450922, '陆川县', 3, 450900);
INSERT INTO `ot_district` VALUES (450923, '博白县', 3, 450900);
INSERT INTO `ot_district` VALUES (450924, '兴业县', 3, 450900);
INSERT INTO `ot_district` VALUES (450981, '北流市', 3, 450900);
INSERT INTO `ot_district` VALUES (451001, '市辖区', 3, 451000);
INSERT INTO `ot_district` VALUES (451002, '右江区', 3, 451000);
INSERT INTO `ot_district` VALUES (451021, '田阳县', 3, 451000);
INSERT INTO `ot_district` VALUES (451022, '田东县', 3, 451000);
INSERT INTO `ot_district` VALUES (451023, '平果县', 3, 451000);
INSERT INTO `ot_district` VALUES (451024, '德保县', 3, 451000);
INSERT INTO `ot_district` VALUES (451025, '靖西县', 3, 451000);
INSERT INTO `ot_district` VALUES (451026, '那坡县', 3, 451000);
INSERT INTO `ot_district` VALUES (451027, '凌云县', 3, 451000);
INSERT INTO `ot_district` VALUES (451028, '乐业县', 3, 451000);
INSERT INTO `ot_district` VALUES (451029, '田林县', 3, 451000);
INSERT INTO `ot_district` VALUES (451030, '西林县', 3, 451000);
INSERT INTO `ot_district` VALUES (451031, '隆林各族自治县', 3, 451000);
INSERT INTO `ot_district` VALUES (451101, '市辖区', 3, 451100);
INSERT INTO `ot_district` VALUES (451102, '八步区', 3, 451100);
INSERT INTO `ot_district` VALUES (451121, '昭平县', 3, 451100);
INSERT INTO `ot_district` VALUES (451122, '钟山县', 3, 451100);
INSERT INTO `ot_district` VALUES (451123, '富川瑶族自治县', 3, 451100);
INSERT INTO `ot_district` VALUES (451201, '市辖区', 3, 451200);
INSERT INTO `ot_district` VALUES (451202, '金城江区', 3, 451200);
INSERT INTO `ot_district` VALUES (451221, '南丹县', 3, 451200);
INSERT INTO `ot_district` VALUES (451222, '天峨县', 3, 451200);
INSERT INTO `ot_district` VALUES (451223, '凤山县', 3, 451200);
INSERT INTO `ot_district` VALUES (451224, '东兰县', 3, 451200);
INSERT INTO `ot_district` VALUES (451225, '罗城仫佬族自治县', 3, 451200);
INSERT INTO `ot_district` VALUES (451226, '环江毛南族自治县', 3, 451200);
INSERT INTO `ot_district` VALUES (451227, '巴马瑶族自治县', 3, 451200);
INSERT INTO `ot_district` VALUES (451228, '都安瑶族自治县', 3, 451200);
INSERT INTO `ot_district` VALUES (451229, '大化瑶族自治县', 3, 451200);
INSERT INTO `ot_district` VALUES (451281, '宜州市', 3, 451200);
INSERT INTO `ot_district` VALUES (451301, '市辖区', 3, 451300);
INSERT INTO `ot_district` VALUES (451302, '兴宾区', 3, 451300);
INSERT INTO `ot_district` VALUES (451321, '忻城县', 3, 451300);
INSERT INTO `ot_district` VALUES (451322, '象州县', 3, 451300);
INSERT INTO `ot_district` VALUES (451323, '武宣县', 3, 451300);
INSERT INTO `ot_district` VALUES (451324, '金秀瑶族自治县', 3, 451300);
INSERT INTO `ot_district` VALUES (451381, '合山市', 3, 451300);
INSERT INTO `ot_district` VALUES (451401, '市辖区', 3, 451400);
INSERT INTO `ot_district` VALUES (451402, '江洲区', 3, 451400);
INSERT INTO `ot_district` VALUES (451421, '扶绥县', 3, 451400);
INSERT INTO `ot_district` VALUES (451422, '宁明县', 3, 451400);
INSERT INTO `ot_district` VALUES (451423, '龙州县', 3, 451400);
INSERT INTO `ot_district` VALUES (451424, '大新县', 3, 451400);
INSERT INTO `ot_district` VALUES (451425, '天等县', 3, 451400);
INSERT INTO `ot_district` VALUES (451481, '凭祥市', 3, 451400);
INSERT INTO `ot_district` VALUES (460101, '市辖区', 3, 460100);
INSERT INTO `ot_district` VALUES (460105, '秀英区', 3, 460100);
INSERT INTO `ot_district` VALUES (460106, '龙华区', 3, 460100);
INSERT INTO `ot_district` VALUES (460107, '琼山区', 3, 460100);
INSERT INTO `ot_district` VALUES (460108, '美兰区', 3, 460100);
INSERT INTO `ot_district` VALUES (460201, '市辖区', 3, 460200);
INSERT INTO `ot_district` VALUES (469001, '五指山市', 3, 469000);
INSERT INTO `ot_district` VALUES (469002, '琼海市', 3, 469000);
INSERT INTO `ot_district` VALUES (469003, '儋州市', 3, 469000);
INSERT INTO `ot_district` VALUES (469005, '文昌市', 3, 469000);
INSERT INTO `ot_district` VALUES (469006, '万宁市', 3, 469000);
INSERT INTO `ot_district` VALUES (469007, '东方市', 3, 469000);
INSERT INTO `ot_district` VALUES (469025, '定安县', 3, 469000);
INSERT INTO `ot_district` VALUES (469026, '屯昌县', 3, 469000);
INSERT INTO `ot_district` VALUES (469027, '澄迈县', 3, 469000);
INSERT INTO `ot_district` VALUES (469028, '临高县', 3, 469000);
INSERT INTO `ot_district` VALUES (469030, '白沙黎族自治县', 3, 469000);
INSERT INTO `ot_district` VALUES (469031, '昌江黎族自治县', 3, 469000);
INSERT INTO `ot_district` VALUES (469033, '乐东黎族自治县', 3, 469000);
INSERT INTO `ot_district` VALUES (469034, '陵水黎族自治县', 3, 469000);
INSERT INTO `ot_district` VALUES (469035, '保亭黎族苗族自治县', 3, 469000);
INSERT INTO `ot_district` VALUES (469036, '琼中黎族苗族自治县', 3, 469000);
INSERT INTO `ot_district` VALUES (469037, '西沙群岛', 3, 469000);
INSERT INTO `ot_district` VALUES (469038, '南沙群岛', 3, 469000);
INSERT INTO `ot_district` VALUES (469039, '中沙群岛的岛礁及其海域', 3, 469000);
INSERT INTO `ot_district` VALUES (500101, '万州区', 3, 500100);
INSERT INTO `ot_district` VALUES (500102, '涪陵区', 3, 500100);
INSERT INTO `ot_district` VALUES (500103, '渝中区', 3, 500100);
INSERT INTO `ot_district` VALUES (500104, '大渡口区', 3, 500100);
INSERT INTO `ot_district` VALUES (500105, '江北区', 3, 500100);
INSERT INTO `ot_district` VALUES (500106, '沙坪坝区', 3, 500100);
INSERT INTO `ot_district` VALUES (500107, '九龙坡区', 3, 500100);
INSERT INTO `ot_district` VALUES (500108, '南岸区', 3, 500100);
INSERT INTO `ot_district` VALUES (500109, '北碚区', 3, 500100);
INSERT INTO `ot_district` VALUES (500110, '万盛区', 3, 500100);
INSERT INTO `ot_district` VALUES (500111, '双桥区', 3, 500100);
INSERT INTO `ot_district` VALUES (500112, '渝北区', 3, 500100);
INSERT INTO `ot_district` VALUES (500113, '巴南区', 3, 500100);
INSERT INTO `ot_district` VALUES (500114, '黔江区', 3, 500100);
INSERT INTO `ot_district` VALUES (500115, '长寿区', 3, 500100);
INSERT INTO `ot_district` VALUES (500222, '綦江县', 3, 500200);
INSERT INTO `ot_district` VALUES (500223, '潼南县', 3, 500200);
INSERT INTO `ot_district` VALUES (500224, '铜梁县', 3, 500200);
INSERT INTO `ot_district` VALUES (500225, '大足县', 3, 500200);
INSERT INTO `ot_district` VALUES (500226, '荣昌县', 3, 500200);
INSERT INTO `ot_district` VALUES (500227, '璧山县', 3, 500200);
INSERT INTO `ot_district` VALUES (500228, '梁平县', 3, 500200);
INSERT INTO `ot_district` VALUES (500229, '城口县', 3, 500200);
INSERT INTO `ot_district` VALUES (500230, '丰都县', 3, 500200);
INSERT INTO `ot_district` VALUES (500231, '垫江县', 3, 500200);
INSERT INTO `ot_district` VALUES (500232, '武隆县', 3, 500200);
INSERT INTO `ot_district` VALUES (500233, '忠　县', 3, 500200);
INSERT INTO `ot_district` VALUES (500234, '开　县', 3, 500200);
INSERT INTO `ot_district` VALUES (500235, '云阳县', 3, 500200);
INSERT INTO `ot_district` VALUES (500236, '奉节县', 3, 500200);
INSERT INTO `ot_district` VALUES (500237, '巫山县', 3, 500200);
INSERT INTO `ot_district` VALUES (500238, '巫溪县', 3, 500200);
INSERT INTO `ot_district` VALUES (500240, '石柱土家族自治县', 3, 500200);
INSERT INTO `ot_district` VALUES (500241, '秀山土家族苗族自治县', 3, 500200);
INSERT INTO `ot_district` VALUES (500242, '酉阳土家族苗族自治县', 3, 500200);
INSERT INTO `ot_district` VALUES (500243, '彭水苗族土家族自治县', 3, 500200);
INSERT INTO `ot_district` VALUES (500381, '江津市', 3, 500300);
INSERT INTO `ot_district` VALUES (500382, '合川市', 3, 500300);
INSERT INTO `ot_district` VALUES (500383, '永川市', 3, 500300);
INSERT INTO `ot_district` VALUES (500384, '南川市', 3, 500300);
INSERT INTO `ot_district` VALUES (510101, '市辖区', 3, 510100);
INSERT INTO `ot_district` VALUES (510104, '锦江区', 3, 510100);
INSERT INTO `ot_district` VALUES (510105, '青羊区', 3, 510100);
INSERT INTO `ot_district` VALUES (510106, '金牛区', 3, 510100);
INSERT INTO `ot_district` VALUES (510107, '武侯区', 3, 510100);
INSERT INTO `ot_district` VALUES (510108, '成华区', 3, 510100);
INSERT INTO `ot_district` VALUES (510112, '龙泉驿区', 3, 510100);
INSERT INTO `ot_district` VALUES (510113, '青白江区', 3, 510100);
INSERT INTO `ot_district` VALUES (510114, '新都区', 3, 510100);
INSERT INTO `ot_district` VALUES (510115, '温江区', 3, 510100);
INSERT INTO `ot_district` VALUES (510121, '金堂县', 3, 510100);
INSERT INTO `ot_district` VALUES (510122, '双流县', 3, 510100);
INSERT INTO `ot_district` VALUES (510124, '郫　县', 3, 510100);
INSERT INTO `ot_district` VALUES (510129, '大邑县', 3, 510100);
INSERT INTO `ot_district` VALUES (510131, '蒲江县', 3, 510100);
INSERT INTO `ot_district` VALUES (510132, '新津县', 3, 510100);
INSERT INTO `ot_district` VALUES (510181, '都江堰市', 3, 510100);
INSERT INTO `ot_district` VALUES (510182, '彭州市', 3, 510100);
INSERT INTO `ot_district` VALUES (510183, '邛崃市', 3, 510100);
INSERT INTO `ot_district` VALUES (510184, '崇州市', 3, 510100);
INSERT INTO `ot_district` VALUES (510301, '市辖区', 3, 510300);
INSERT INTO `ot_district` VALUES (510302, '自流井区', 3, 510300);
INSERT INTO `ot_district` VALUES (510303, '贡井区', 3, 510300);
INSERT INTO `ot_district` VALUES (510304, '大安区', 3, 510300);
INSERT INTO `ot_district` VALUES (510311, '沿滩区', 3, 510300);
INSERT INTO `ot_district` VALUES (510321, '荣　县', 3, 510300);
INSERT INTO `ot_district` VALUES (510322, '富顺县', 3, 510300);
INSERT INTO `ot_district` VALUES (510401, '市辖区', 3, 510400);
INSERT INTO `ot_district` VALUES (510402, '东　区', 3, 510400);
INSERT INTO `ot_district` VALUES (510403, '西　区', 3, 510400);
INSERT INTO `ot_district` VALUES (510411, '仁和区', 3, 510400);
INSERT INTO `ot_district` VALUES (510421, '米易县', 3, 510400);
INSERT INTO `ot_district` VALUES (510422, '盐边县', 3, 510400);
INSERT INTO `ot_district` VALUES (510501, '市辖区', 3, 510500);
INSERT INTO `ot_district` VALUES (510502, '江阳区', 3, 510500);
INSERT INTO `ot_district` VALUES (510503, '纳溪区', 3, 510500);
INSERT INTO `ot_district` VALUES (510504, '龙马潭区', 3, 510500);
INSERT INTO `ot_district` VALUES (510521, '泸　县', 3, 510500);
INSERT INTO `ot_district` VALUES (510522, '合江县', 3, 510500);
INSERT INTO `ot_district` VALUES (510524, '叙永县', 3, 510500);
INSERT INTO `ot_district` VALUES (510525, '古蔺县', 3, 510500);
INSERT INTO `ot_district` VALUES (510601, '市辖区', 3, 510600);
INSERT INTO `ot_district` VALUES (510603, '旌阳区', 3, 510600);
INSERT INTO `ot_district` VALUES (510623, '中江县', 3, 510600);
INSERT INTO `ot_district` VALUES (510626, '罗江县', 3, 510600);
INSERT INTO `ot_district` VALUES (510681, '广汉市', 3, 510600);
INSERT INTO `ot_district` VALUES (510682, '什邡市', 3, 510600);
INSERT INTO `ot_district` VALUES (510683, '绵竹市', 3, 510600);
INSERT INTO `ot_district` VALUES (510701, '市辖区', 3, 510700);
INSERT INTO `ot_district` VALUES (510703, '涪城区', 3, 510700);
INSERT INTO `ot_district` VALUES (510704, '游仙区', 3, 510700);
INSERT INTO `ot_district` VALUES (510722, '三台县', 3, 510700);
INSERT INTO `ot_district` VALUES (510723, '盐亭县', 3, 510700);
INSERT INTO `ot_district` VALUES (510724, '安　县', 3, 510700);
INSERT INTO `ot_district` VALUES (510725, '梓潼县', 3, 510700);
INSERT INTO `ot_district` VALUES (510726, '北川羌族自治县', 3, 510700);
INSERT INTO `ot_district` VALUES (510727, '平武县', 3, 510700);
INSERT INTO `ot_district` VALUES (510781, '江油市', 3, 510700);
INSERT INTO `ot_district` VALUES (510801, '市辖区', 3, 510800);
INSERT INTO `ot_district` VALUES (510802, '市中区', 3, 510800);
INSERT INTO `ot_district` VALUES (510811, '元坝区', 3, 510800);
INSERT INTO `ot_district` VALUES (510812, '朝天区', 3, 510800);
INSERT INTO `ot_district` VALUES (510821, '旺苍县', 3, 510800);
INSERT INTO `ot_district` VALUES (510822, '青川县', 3, 510800);
INSERT INTO `ot_district` VALUES (510823, '剑阁县', 3, 510800);
INSERT INTO `ot_district` VALUES (510824, '苍溪县', 3, 510800);
INSERT INTO `ot_district` VALUES (510901, '市辖区', 3, 510900);
INSERT INTO `ot_district` VALUES (510903, '船山区', 3, 510900);
INSERT INTO `ot_district` VALUES (510904, '安居区', 3, 510900);
INSERT INTO `ot_district` VALUES (510921, '蓬溪县', 3, 510900);
INSERT INTO `ot_district` VALUES (510922, '射洪县', 3, 510900);
INSERT INTO `ot_district` VALUES (510923, '大英县', 3, 510900);
INSERT INTO `ot_district` VALUES (511001, '市辖区', 3, 511000);
INSERT INTO `ot_district` VALUES (511002, '市中区', 3, 511000);
INSERT INTO `ot_district` VALUES (511011, '东兴区', 3, 511000);
INSERT INTO `ot_district` VALUES (511024, '威远县', 3, 511000);
INSERT INTO `ot_district` VALUES (511025, '资中县', 3, 511000);
INSERT INTO `ot_district` VALUES (511028, '隆昌县', 3, 511000);
INSERT INTO `ot_district` VALUES (511101, '市辖区', 3, 511100);
INSERT INTO `ot_district` VALUES (511102, '市中区', 3, 511100);
INSERT INTO `ot_district` VALUES (511111, '沙湾区', 3, 511100);
INSERT INTO `ot_district` VALUES (511112, '五通桥区', 3, 511100);
INSERT INTO `ot_district` VALUES (511113, '金口河区', 3, 511100);
INSERT INTO `ot_district` VALUES (511123, '犍为县', 3, 511100);
INSERT INTO `ot_district` VALUES (511124, '井研县', 3, 511100);
INSERT INTO `ot_district` VALUES (511126, '夹江县', 3, 511100);
INSERT INTO `ot_district` VALUES (511129, '沐川县', 3, 511100);
INSERT INTO `ot_district` VALUES (511132, '峨边彝族自治县', 3, 511100);
INSERT INTO `ot_district` VALUES (511133, '马边彝族自治县', 3, 511100);
INSERT INTO `ot_district` VALUES (511181, '峨眉山市', 3, 511100);
INSERT INTO `ot_district` VALUES (511301, '市辖区', 3, 511300);
INSERT INTO `ot_district` VALUES (511302, '顺庆区', 3, 511300);
INSERT INTO `ot_district` VALUES (511303, '高坪区', 3, 511300);
INSERT INTO `ot_district` VALUES (511304, '嘉陵区', 3, 511300);
INSERT INTO `ot_district` VALUES (511321, '南部县', 3, 511300);
INSERT INTO `ot_district` VALUES (511322, '营山县', 3, 511300);
INSERT INTO `ot_district` VALUES (511323, '蓬安县', 3, 511300);
INSERT INTO `ot_district` VALUES (511324, '仪陇县', 3, 511300);
INSERT INTO `ot_district` VALUES (511325, '西充县', 3, 511300);
INSERT INTO `ot_district` VALUES (511381, '阆中市', 3, 511300);
INSERT INTO `ot_district` VALUES (511401, '市辖区', 3, 511400);
INSERT INTO `ot_district` VALUES (511402, '东坡区', 3, 511400);
INSERT INTO `ot_district` VALUES (511421, '仁寿县', 3, 511400);
INSERT INTO `ot_district` VALUES (511422, '彭山县', 3, 511400);
INSERT INTO `ot_district` VALUES (511423, '洪雅县', 3, 511400);
INSERT INTO `ot_district` VALUES (511424, '丹棱县', 3, 511400);
INSERT INTO `ot_district` VALUES (511425, '青神县', 3, 511400);
INSERT INTO `ot_district` VALUES (511501, '市辖区', 3, 511500);
INSERT INTO `ot_district` VALUES (511502, '翠屏区', 3, 511500);
INSERT INTO `ot_district` VALUES (511521, '宜宾县', 3, 511500);
INSERT INTO `ot_district` VALUES (511522, '南溪县', 3, 511500);
INSERT INTO `ot_district` VALUES (511523, '江安县', 3, 511500);
INSERT INTO `ot_district` VALUES (511524, '长宁县', 3, 511500);
INSERT INTO `ot_district` VALUES (511525, '高　县', 3, 511500);
INSERT INTO `ot_district` VALUES (511526, '珙　县', 3, 511500);
INSERT INTO `ot_district` VALUES (511527, '筠连县', 3, 511500);
INSERT INTO `ot_district` VALUES (511528, '兴文县', 3, 511500);
INSERT INTO `ot_district` VALUES (511529, '屏山县', 3, 511500);
INSERT INTO `ot_district` VALUES (511601, '市辖区', 3, 511600);
INSERT INTO `ot_district` VALUES (511602, '广安区', 3, 511600);
INSERT INTO `ot_district` VALUES (511621, '岳池县', 3, 511600);
INSERT INTO `ot_district` VALUES (511622, '武胜县', 3, 511600);
INSERT INTO `ot_district` VALUES (511623, '邻水县', 3, 511600);
INSERT INTO `ot_district` VALUES (511681, '华莹市', 3, 511600);
INSERT INTO `ot_district` VALUES (511701, '市辖区', 3, 511700);
INSERT INTO `ot_district` VALUES (511702, '通川区', 3, 511700);
INSERT INTO `ot_district` VALUES (511721, '达　县', 3, 511700);
INSERT INTO `ot_district` VALUES (511722, '宣汉县', 3, 511700);
INSERT INTO `ot_district` VALUES (511723, '开江县', 3, 511700);
INSERT INTO `ot_district` VALUES (511724, '大竹县', 3, 511700);
INSERT INTO `ot_district` VALUES (511725, '渠　县', 3, 511700);
INSERT INTO `ot_district` VALUES (511781, '万源市', 3, 511700);
INSERT INTO `ot_district` VALUES (511801, '市辖区', 3, 511800);
INSERT INTO `ot_district` VALUES (511802, '雨城区', 3, 511800);
INSERT INTO `ot_district` VALUES (511821, '名山县', 3, 511800);
INSERT INTO `ot_district` VALUES (511822, '荥经县', 3, 511800);
INSERT INTO `ot_district` VALUES (511823, '汉源县', 3, 511800);
INSERT INTO `ot_district` VALUES (511824, '石棉县', 3, 511800);
INSERT INTO `ot_district` VALUES (511825, '天全县', 3, 511800);
INSERT INTO `ot_district` VALUES (511826, '芦山县', 3, 511800);
INSERT INTO `ot_district` VALUES (511827, '宝兴县', 3, 511800);
INSERT INTO `ot_district` VALUES (511901, '市辖区', 3, 511900);
INSERT INTO `ot_district` VALUES (511902, '巴州区', 3, 511900);
INSERT INTO `ot_district` VALUES (511921, '通江县', 3, 511900);
INSERT INTO `ot_district` VALUES (511922, '南江县', 3, 511900);
INSERT INTO `ot_district` VALUES (511923, '平昌县', 3, 511900);
INSERT INTO `ot_district` VALUES (512001, '市辖区', 3, 512000);
INSERT INTO `ot_district` VALUES (512002, '雁江区', 3, 512000);
INSERT INTO `ot_district` VALUES (512021, '安岳县', 3, 512000);
INSERT INTO `ot_district` VALUES (512022, '乐至县', 3, 512000);
INSERT INTO `ot_district` VALUES (512081, '简阳市', 3, 512000);
INSERT INTO `ot_district` VALUES (513221, '汶川县', 3, 513200);
INSERT INTO `ot_district` VALUES (513222, '理　县', 3, 513200);
INSERT INTO `ot_district` VALUES (513223, '茂　县', 3, 513200);
INSERT INTO `ot_district` VALUES (513224, '松潘县', 3, 513200);
INSERT INTO `ot_district` VALUES (513225, '九寨沟县', 3, 513200);
INSERT INTO `ot_district` VALUES (513226, '金川县', 3, 513200);
INSERT INTO `ot_district` VALUES (513227, '小金县', 3, 513200);
INSERT INTO `ot_district` VALUES (513228, '黑水县', 3, 513200);
INSERT INTO `ot_district` VALUES (513229, '马尔康县', 3, 513200);
INSERT INTO `ot_district` VALUES (513230, '壤塘县', 3, 513200);
INSERT INTO `ot_district` VALUES (513231, '阿坝县', 3, 513200);
INSERT INTO `ot_district` VALUES (513232, '若尔盖县', 3, 513200);
INSERT INTO `ot_district` VALUES (513233, '红原县', 3, 513200);
INSERT INTO `ot_district` VALUES (513321, '康定县', 3, 513300);
INSERT INTO `ot_district` VALUES (513322, '泸定县', 3, 513300);
INSERT INTO `ot_district` VALUES (513323, '丹巴县', 3, 513300);
INSERT INTO `ot_district` VALUES (513324, '九龙县', 3, 513300);
INSERT INTO `ot_district` VALUES (513325, '雅江县', 3, 513300);
INSERT INTO `ot_district` VALUES (513326, '道孚县', 3, 513300);
INSERT INTO `ot_district` VALUES (513327, '炉霍县', 3, 513300);
INSERT INTO `ot_district` VALUES (513328, '甘孜县', 3, 513300);
INSERT INTO `ot_district` VALUES (513329, '新龙县', 3, 513300);
INSERT INTO `ot_district` VALUES (513330, '德格县', 3, 513300);
INSERT INTO `ot_district` VALUES (513331, '白玉县', 3, 513300);
INSERT INTO `ot_district` VALUES (513332, '石渠县', 3, 513300);
INSERT INTO `ot_district` VALUES (513333, '色达县', 3, 513300);
INSERT INTO `ot_district` VALUES (513334, '理塘县', 3, 513300);
INSERT INTO `ot_district` VALUES (513335, '巴塘县', 3, 513300);
INSERT INTO `ot_district` VALUES (513336, '乡城县', 3, 513300);
INSERT INTO `ot_district` VALUES (513337, '稻城县', 3, 513300);
INSERT INTO `ot_district` VALUES (513338, '得荣县', 3, 513300);
INSERT INTO `ot_district` VALUES (513401, '西昌市', 3, 513400);
INSERT INTO `ot_district` VALUES (513422, '木里藏族自治县', 3, 513400);
INSERT INTO `ot_district` VALUES (513423, '盐源县', 3, 513400);
INSERT INTO `ot_district` VALUES (513424, '德昌县', 3, 513400);
INSERT INTO `ot_district` VALUES (513425, '会理县', 3, 513400);
INSERT INTO `ot_district` VALUES (513426, '会东县', 3, 513400);
INSERT INTO `ot_district` VALUES (513427, '宁南县', 3, 513400);
INSERT INTO `ot_district` VALUES (513428, '普格县', 3, 513400);
INSERT INTO `ot_district` VALUES (513429, '布拖县', 3, 513400);
INSERT INTO `ot_district` VALUES (513430, '金阳县', 3, 513400);
INSERT INTO `ot_district` VALUES (513431, '昭觉县', 3, 513400);
INSERT INTO `ot_district` VALUES (513432, '喜德县', 3, 513400);
INSERT INTO `ot_district` VALUES (513433, '冕宁县', 3, 513400);
INSERT INTO `ot_district` VALUES (513434, '越西县', 3, 513400);
INSERT INTO `ot_district` VALUES (513435, '甘洛县', 3, 513400);
INSERT INTO `ot_district` VALUES (513436, '美姑县', 3, 513400);
INSERT INTO `ot_district` VALUES (513437, '雷波县', 3, 513400);
INSERT INTO `ot_district` VALUES (520101, '市辖区', 3, 520100);
INSERT INTO `ot_district` VALUES (520102, '南明区', 3, 520100);
INSERT INTO `ot_district` VALUES (520103, '云岩区', 3, 520100);
INSERT INTO `ot_district` VALUES (520111, '花溪区', 3, 520100);
INSERT INTO `ot_district` VALUES (520112, '乌当区', 3, 520100);
INSERT INTO `ot_district` VALUES (520113, '白云区', 3, 520100);
INSERT INTO `ot_district` VALUES (520114, '小河区', 3, 520100);
INSERT INTO `ot_district` VALUES (520121, '开阳县', 3, 520100);
INSERT INTO `ot_district` VALUES (520122, '息烽县', 3, 520100);
INSERT INTO `ot_district` VALUES (520123, '修文县', 3, 520100);
INSERT INTO `ot_district` VALUES (520181, '清镇市', 3, 520100);
INSERT INTO `ot_district` VALUES (520201, '钟山区', 3, 520200);
INSERT INTO `ot_district` VALUES (520203, '六枝特区', 3, 520200);
INSERT INTO `ot_district` VALUES (520221, '水城县', 3, 520200);
INSERT INTO `ot_district` VALUES (520222, '盘　县', 3, 520200);
INSERT INTO `ot_district` VALUES (520301, '市辖区', 3, 520300);
INSERT INTO `ot_district` VALUES (520302, '红花岗区', 3, 520300);
INSERT INTO `ot_district` VALUES (520303, '汇川区', 3, 520300);
INSERT INTO `ot_district` VALUES (520321, '遵义县', 3, 520300);
INSERT INTO `ot_district` VALUES (520322, '桐梓县', 3, 520300);
INSERT INTO `ot_district` VALUES (520323, '绥阳县', 3, 520300);
INSERT INTO `ot_district` VALUES (520324, '正安县', 3, 520300);
INSERT INTO `ot_district` VALUES (520325, '道真仡佬族苗族自治县', 3, 520300);
INSERT INTO `ot_district` VALUES (520326, '务川仡佬族苗族自治县', 3, 520300);
INSERT INTO `ot_district` VALUES (520327, '凤冈县', 3, 520300);
INSERT INTO `ot_district` VALUES (520328, '湄潭县', 3, 520300);
INSERT INTO `ot_district` VALUES (520329, '余庆县', 3, 520300);
INSERT INTO `ot_district` VALUES (520330, '习水县', 3, 520300);
INSERT INTO `ot_district` VALUES (520381, '赤水市', 3, 520300);
INSERT INTO `ot_district` VALUES (520382, '仁怀市', 3, 520300);
INSERT INTO `ot_district` VALUES (520401, '市辖区', 3, 520400);
INSERT INTO `ot_district` VALUES (520402, '西秀区', 3, 520400);
INSERT INTO `ot_district` VALUES (520421, '平坝县', 3, 520400);
INSERT INTO `ot_district` VALUES (520422, '普定县', 3, 520400);
INSERT INTO `ot_district` VALUES (520423, '镇宁布依族苗族自治县', 3, 520400);
INSERT INTO `ot_district` VALUES (520424, '关岭布依族苗族自治县', 3, 520400);
INSERT INTO `ot_district` VALUES (520425, '紫云苗族布依族自治县', 3, 520400);
INSERT INTO `ot_district` VALUES (522201, '铜仁市', 3, 522200);
INSERT INTO `ot_district` VALUES (522222, '江口县', 3, 522200);
INSERT INTO `ot_district` VALUES (522223, '玉屏侗族自治县', 3, 522200);
INSERT INTO `ot_district` VALUES (522224, '石阡县', 3, 522200);
INSERT INTO `ot_district` VALUES (522225, '思南县', 3, 522200);
INSERT INTO `ot_district` VALUES (522226, '印江土家族苗族自治县', 3, 522200);
INSERT INTO `ot_district` VALUES (522227, '德江县', 3, 522200);
INSERT INTO `ot_district` VALUES (522228, '沿河土家族自治县', 3, 522200);
INSERT INTO `ot_district` VALUES (522229, '松桃苗族自治县', 3, 522200);
INSERT INTO `ot_district` VALUES (522230, '万山特区', 3, 522200);
INSERT INTO `ot_district` VALUES (522301, '兴义市', 3, 522300);
INSERT INTO `ot_district` VALUES (522322, '兴仁县', 3, 522300);
INSERT INTO `ot_district` VALUES (522323, '普安县', 3, 522300);
INSERT INTO `ot_district` VALUES (522324, '晴隆县', 3, 522300);
INSERT INTO `ot_district` VALUES (522325, '贞丰县', 3, 522300);
INSERT INTO `ot_district` VALUES (522326, '望谟县', 3, 522300);
INSERT INTO `ot_district` VALUES (522327, '册亨县', 3, 522300);
INSERT INTO `ot_district` VALUES (522328, '安龙县', 3, 522300);
INSERT INTO `ot_district` VALUES (522401, '毕节市', 3, 522400);
INSERT INTO `ot_district` VALUES (522422, '大方县', 3, 522400);
INSERT INTO `ot_district` VALUES (522423, '黔西县', 3, 522400);
INSERT INTO `ot_district` VALUES (522424, '金沙县', 3, 522400);
INSERT INTO `ot_district` VALUES (522425, '织金县', 3, 522400);
INSERT INTO `ot_district` VALUES (522426, '纳雍县', 3, 522400);
INSERT INTO `ot_district` VALUES (522427, '威宁彝族回族苗族自治县', 3, 522400);
INSERT INTO `ot_district` VALUES (522428, '赫章县', 3, 522400);
INSERT INTO `ot_district` VALUES (522601, '凯里市', 3, 522600);
INSERT INTO `ot_district` VALUES (522622, '黄平县', 3, 522600);
INSERT INTO `ot_district` VALUES (522623, '施秉县', 3, 522600);
INSERT INTO `ot_district` VALUES (522624, '三穗县', 3, 522600);
INSERT INTO `ot_district` VALUES (522625, '镇远县', 3, 522600);
INSERT INTO `ot_district` VALUES (522626, '岑巩县', 3, 522600);
INSERT INTO `ot_district` VALUES (522627, '天柱县', 3, 522600);
INSERT INTO `ot_district` VALUES (522628, '锦屏县', 3, 522600);
INSERT INTO `ot_district` VALUES (522629, '剑河县', 3, 522600);
INSERT INTO `ot_district` VALUES (522630, '台江县', 3, 522600);
INSERT INTO `ot_district` VALUES (522631, '黎平县', 3, 522600);
INSERT INTO `ot_district` VALUES (522632, '榕江县', 3, 522600);
INSERT INTO `ot_district` VALUES (522633, '从江县', 3, 522600);
INSERT INTO `ot_district` VALUES (522634, '雷山县', 3, 522600);
INSERT INTO `ot_district` VALUES (522635, '麻江县', 3, 522600);
INSERT INTO `ot_district` VALUES (522636, '丹寨县', 3, 522600);
INSERT INTO `ot_district` VALUES (522701, '都匀市', 3, 522700);
INSERT INTO `ot_district` VALUES (522702, '福泉市', 3, 522700);
INSERT INTO `ot_district` VALUES (522722, '荔波县', 3, 522700);
INSERT INTO `ot_district` VALUES (522723, '贵定县', 3, 522700);
INSERT INTO `ot_district` VALUES (522725, '瓮安县', 3, 522700);
INSERT INTO `ot_district` VALUES (522726, '独山县', 3, 522700);
INSERT INTO `ot_district` VALUES (522727, '平塘县', 3, 522700);
INSERT INTO `ot_district` VALUES (522728, '罗甸县', 3, 522700);
INSERT INTO `ot_district` VALUES (522729, '长顺县', 3, 522700);
INSERT INTO `ot_district` VALUES (522730, '龙里县', 3, 522700);
INSERT INTO `ot_district` VALUES (522731, '惠水县', 3, 522700);
INSERT INTO `ot_district` VALUES (522732, '三都水族自治县', 3, 522700);
INSERT INTO `ot_district` VALUES (530101, '市辖区', 3, 530100);
INSERT INTO `ot_district` VALUES (530102, '五华区', 3, 530100);
INSERT INTO `ot_district` VALUES (530103, '盘龙区', 3, 530100);
INSERT INTO `ot_district` VALUES (530111, '官渡区', 3, 530100);
INSERT INTO `ot_district` VALUES (530112, '西山区', 3, 530100);
INSERT INTO `ot_district` VALUES (530113, '东川区', 3, 530100);
INSERT INTO `ot_district` VALUES (530121, '呈贡县', 3, 530100);
INSERT INTO `ot_district` VALUES (530122, '晋宁县', 3, 530100);
INSERT INTO `ot_district` VALUES (530124, '富民县', 3, 530100);
INSERT INTO `ot_district` VALUES (530125, '宜良县', 3, 530100);
INSERT INTO `ot_district` VALUES (530126, '石林彝族自治县', 3, 530100);
INSERT INTO `ot_district` VALUES (530127, '嵩明县', 3, 530100);
INSERT INTO `ot_district` VALUES (530128, '禄劝彝族苗族自治县', 3, 530100);
INSERT INTO `ot_district` VALUES (530129, '寻甸回族彝族自治县', 3, 530100);
INSERT INTO `ot_district` VALUES (530181, '安宁市', 3, 530100);
INSERT INTO `ot_district` VALUES (530301, '市辖区', 3, 530300);
INSERT INTO `ot_district` VALUES (530302, '麒麟区', 3, 530300);
INSERT INTO `ot_district` VALUES (530321, '马龙县', 3, 530300);
INSERT INTO `ot_district` VALUES (530322, '陆良县', 3, 530300);
INSERT INTO `ot_district` VALUES (530323, '师宗县', 3, 530300);
INSERT INTO `ot_district` VALUES (530324, '罗平县', 3, 530300);
INSERT INTO `ot_district` VALUES (530325, '富源县', 3, 530300);
INSERT INTO `ot_district` VALUES (530326, '会泽县', 3, 530300);
INSERT INTO `ot_district` VALUES (530328, '沾益县', 3, 530300);
INSERT INTO `ot_district` VALUES (530381, '宣威市', 3, 530300);
INSERT INTO `ot_district` VALUES (530401, '市辖区', 3, 530400);
INSERT INTO `ot_district` VALUES (530402, '红塔区', 3, 530400);
INSERT INTO `ot_district` VALUES (530421, '江川县', 3, 530400);
INSERT INTO `ot_district` VALUES (530422, '澄江县', 3, 530400);
INSERT INTO `ot_district` VALUES (530423, '通海县', 3, 530400);
INSERT INTO `ot_district` VALUES (530424, '华宁县', 3, 530400);
INSERT INTO `ot_district` VALUES (530425, '易门县', 3, 530400);
INSERT INTO `ot_district` VALUES (530426, '峨山彝族自治县', 3, 530400);
INSERT INTO `ot_district` VALUES (530427, '新平彝族傣族自治县', 3, 530400);
INSERT INTO `ot_district` VALUES (530428, '元江哈尼族彝族傣族自治县', 3, 530400);
INSERT INTO `ot_district` VALUES (530501, '市辖区', 3, 530500);
INSERT INTO `ot_district` VALUES (530502, '隆阳区', 3, 530500);
INSERT INTO `ot_district` VALUES (530521, '施甸县', 3, 530500);
INSERT INTO `ot_district` VALUES (530522, '腾冲县', 3, 530500);
INSERT INTO `ot_district` VALUES (530523, '龙陵县', 3, 530500);
INSERT INTO `ot_district` VALUES (530524, '昌宁县', 3, 530500);
INSERT INTO `ot_district` VALUES (530601, '市辖区', 3, 530600);
INSERT INTO `ot_district` VALUES (530602, '昭阳区', 3, 530600);
INSERT INTO `ot_district` VALUES (530621, '鲁甸县', 3, 530600);
INSERT INTO `ot_district` VALUES (530622, '巧家县', 3, 530600);
INSERT INTO `ot_district` VALUES (530623, '盐津县', 3, 530600);
INSERT INTO `ot_district` VALUES (530624, '大关县', 3, 530600);
INSERT INTO `ot_district` VALUES (530625, '永善县', 3, 530600);
INSERT INTO `ot_district` VALUES (530626, '绥江县', 3, 530600);
INSERT INTO `ot_district` VALUES (530627, '镇雄县', 3, 530600);
INSERT INTO `ot_district` VALUES (530628, '彝良县', 3, 530600);
INSERT INTO `ot_district` VALUES (530629, '威信县', 3, 530600);
INSERT INTO `ot_district` VALUES (530630, '水富县', 3, 530600);
INSERT INTO `ot_district` VALUES (530701, '市辖区', 3, 530700);
INSERT INTO `ot_district` VALUES (530702, '古城区', 3, 530700);
INSERT INTO `ot_district` VALUES (530721, '玉龙纳西族自治县', 3, 530700);
INSERT INTO `ot_district` VALUES (530722, '永胜县', 3, 530700);
INSERT INTO `ot_district` VALUES (530723, '华坪县', 3, 530700);
INSERT INTO `ot_district` VALUES (530724, '宁蒗彝族自治县', 3, 530700);
INSERT INTO `ot_district` VALUES (530801, '市辖区', 3, 530800);
INSERT INTO `ot_district` VALUES (530802, '翠云区', 3, 530800);
INSERT INTO `ot_district` VALUES (530821, '普洱哈尼族彝族自治县', 3, 530800);
INSERT INTO `ot_district` VALUES (530822, '墨江哈尼族自治县', 3, 530800);
INSERT INTO `ot_district` VALUES (530823, '景东彝族自治县', 3, 530800);
INSERT INTO `ot_district` VALUES (530824, '景谷傣族彝族自治县', 3, 530800);
INSERT INTO `ot_district` VALUES (530825, '镇沅彝族哈尼族拉祜族自治县', 3, 530800);
INSERT INTO `ot_district` VALUES (530826, '江城哈尼族彝族自治县', 3, 530800);
INSERT INTO `ot_district` VALUES (530827, '孟连傣族拉祜族佤族自治县', 3, 530800);
INSERT INTO `ot_district` VALUES (530828, '澜沧拉祜族自治县', 3, 530800);
INSERT INTO `ot_district` VALUES (530829, '西盟佤族自治县', 3, 530800);
INSERT INTO `ot_district` VALUES (530901, '市辖区', 3, 530900);
INSERT INTO `ot_district` VALUES (530902, '临翔区', 3, 530900);
INSERT INTO `ot_district` VALUES (530921, '凤庆县', 3, 530900);
INSERT INTO `ot_district` VALUES (530922, '云　县', 3, 530900);
INSERT INTO `ot_district` VALUES (530923, '永德县', 3, 530900);
INSERT INTO `ot_district` VALUES (530924, '镇康县', 3, 530900);
INSERT INTO `ot_district` VALUES (530925, '双江拉祜族佤族布朗族傣族自治县', 3, 530900);
INSERT INTO `ot_district` VALUES (530926, '耿马傣族佤族自治县', 3, 530900);
INSERT INTO `ot_district` VALUES (530927, '沧源佤族自治县', 3, 530900);
INSERT INTO `ot_district` VALUES (532301, '楚雄市', 3, 532300);
INSERT INTO `ot_district` VALUES (532322, '双柏县', 3, 532300);
INSERT INTO `ot_district` VALUES (532323, '牟定县', 3, 532300);
INSERT INTO `ot_district` VALUES (532324, '南华县', 3, 532300);
INSERT INTO `ot_district` VALUES (532325, '姚安县', 3, 532300);
INSERT INTO `ot_district` VALUES (532326, '大姚县', 3, 532300);
INSERT INTO `ot_district` VALUES (532327, '永仁县', 3, 532300);
INSERT INTO `ot_district` VALUES (532328, '元谋县', 3, 532300);
INSERT INTO `ot_district` VALUES (532329, '武定县', 3, 532300);
INSERT INTO `ot_district` VALUES (532331, '禄丰县', 3, 532300);
INSERT INTO `ot_district` VALUES (532501, '个旧市', 3, 532500);
INSERT INTO `ot_district` VALUES (532502, '开远市', 3, 532500);
INSERT INTO `ot_district` VALUES (532522, '蒙自县', 3, 532500);
INSERT INTO `ot_district` VALUES (532523, '屏边苗族自治县', 3, 532500);
INSERT INTO `ot_district` VALUES (532524, '建水县', 3, 532500);
INSERT INTO `ot_district` VALUES (532525, '石屏县', 3, 532500);
INSERT INTO `ot_district` VALUES (532526, '弥勒县', 3, 532500);
INSERT INTO `ot_district` VALUES (532527, '泸西县', 3, 532500);
INSERT INTO `ot_district` VALUES (532528, '元阳县', 3, 532500);
INSERT INTO `ot_district` VALUES (532529, '红河县', 3, 532500);
INSERT INTO `ot_district` VALUES (532530, '金平苗族瑶族傣族自治县', 3, 532500);
INSERT INTO `ot_district` VALUES (532531, '绿春县', 3, 532500);
INSERT INTO `ot_district` VALUES (532532, '河口瑶族自治县', 3, 532500);
INSERT INTO `ot_district` VALUES (532621, '文山县', 3, 532600);
INSERT INTO `ot_district` VALUES (532622, '砚山县', 3, 532600);
INSERT INTO `ot_district` VALUES (532623, '西畴县', 3, 532600);
INSERT INTO `ot_district` VALUES (532624, '麻栗坡县', 3, 532600);
INSERT INTO `ot_district` VALUES (532625, '马关县', 3, 532600);
INSERT INTO `ot_district` VALUES (532626, '丘北县', 3, 532600);
INSERT INTO `ot_district` VALUES (532627, '广南县', 3, 532600);
INSERT INTO `ot_district` VALUES (532628, '富宁县', 3, 532600);
INSERT INTO `ot_district` VALUES (532801, '景洪市', 3, 532800);
INSERT INTO `ot_district` VALUES (532822, '勐海县', 3, 532800);
INSERT INTO `ot_district` VALUES (532823, '勐腊县', 3, 532800);
INSERT INTO `ot_district` VALUES (532901, '大理市', 3, 532900);
INSERT INTO `ot_district` VALUES (532922, '漾濞彝族自治县', 3, 532900);
INSERT INTO `ot_district` VALUES (532923, '祥云县', 3, 532900);
INSERT INTO `ot_district` VALUES (532924, '宾川县', 3, 532900);
INSERT INTO `ot_district` VALUES (532925, '弥渡县', 3, 532900);
INSERT INTO `ot_district` VALUES (532926, '南涧彝族自治县', 3, 532900);
INSERT INTO `ot_district` VALUES (532927, '巍山彝族回族自治县', 3, 532900);
INSERT INTO `ot_district` VALUES (532928, '永平县', 3, 532900);
INSERT INTO `ot_district` VALUES (532929, '云龙县', 3, 532900);
INSERT INTO `ot_district` VALUES (532930, '洱源县', 3, 532900);
INSERT INTO `ot_district` VALUES (532931, '剑川县', 3, 532900);
INSERT INTO `ot_district` VALUES (532932, '鹤庆县', 3, 532900);
INSERT INTO `ot_district` VALUES (533102, '瑞丽市', 3, 533100);
INSERT INTO `ot_district` VALUES (533103, '潞西市', 3, 533100);
INSERT INTO `ot_district` VALUES (533122, '梁河县', 3, 533100);
INSERT INTO `ot_district` VALUES (533123, '盈江县', 3, 533100);
INSERT INTO `ot_district` VALUES (533124, '陇川县', 3, 533100);
INSERT INTO `ot_district` VALUES (533321, '泸水县', 3, 533300);
INSERT INTO `ot_district` VALUES (533323, '福贡县', 3, 533300);
INSERT INTO `ot_district` VALUES (533324, '贡山独龙族怒族自治县', 3, 533300);
INSERT INTO `ot_district` VALUES (533325, '兰坪白族普米族自治县', 3, 533300);
INSERT INTO `ot_district` VALUES (533421, '香格里拉县', 3, 533400);
INSERT INTO `ot_district` VALUES (533422, '德钦县', 3, 533400);
INSERT INTO `ot_district` VALUES (533423, '维西傈僳族自治县', 3, 533400);
INSERT INTO `ot_district` VALUES (540101, '市辖区', 3, 540100);
INSERT INTO `ot_district` VALUES (540102, '城关区', 3, 540100);
INSERT INTO `ot_district` VALUES (540121, '林周县', 3, 540100);
INSERT INTO `ot_district` VALUES (540122, '当雄县', 3, 540100);
INSERT INTO `ot_district` VALUES (540123, '尼木县', 3, 540100);
INSERT INTO `ot_district` VALUES (540124, '曲水县', 3, 540100);
INSERT INTO `ot_district` VALUES (540125, '堆龙德庆县', 3, 540100);
INSERT INTO `ot_district` VALUES (540126, '达孜县', 3, 540100);
INSERT INTO `ot_district` VALUES (540127, '墨竹工卡县', 3, 540100);
INSERT INTO `ot_district` VALUES (542121, '昌都县', 3, 542100);
INSERT INTO `ot_district` VALUES (542122, '江达县', 3, 542100);
INSERT INTO `ot_district` VALUES (542123, '贡觉县', 3, 542100);
INSERT INTO `ot_district` VALUES (542124, '类乌齐县', 3, 542100);
INSERT INTO `ot_district` VALUES (542125, '丁青县', 3, 542100);
INSERT INTO `ot_district` VALUES (542126, '察雅县', 3, 542100);
INSERT INTO `ot_district` VALUES (542127, '八宿县', 3, 542100);
INSERT INTO `ot_district` VALUES (542128, '左贡县', 3, 542100);
INSERT INTO `ot_district` VALUES (542129, '芒康县', 3, 542100);
INSERT INTO `ot_district` VALUES (542132, '洛隆县', 3, 542100);
INSERT INTO `ot_district` VALUES (542133, '边坝县', 3, 542100);
INSERT INTO `ot_district` VALUES (542221, '乃东县', 3, 542200);
INSERT INTO `ot_district` VALUES (542222, '扎囊县', 3, 542200);
INSERT INTO `ot_district` VALUES (542223, '贡嘎县', 3, 542200);
INSERT INTO `ot_district` VALUES (542224, '桑日县', 3, 542200);
INSERT INTO `ot_district` VALUES (542225, '琼结县', 3, 542200);
INSERT INTO `ot_district` VALUES (542226, '曲松县', 3, 542200);
INSERT INTO `ot_district` VALUES (542227, '措美县', 3, 542200);
INSERT INTO `ot_district` VALUES (542228, '洛扎县', 3, 542200);
INSERT INTO `ot_district` VALUES (542229, '加查县', 3, 542200);
INSERT INTO `ot_district` VALUES (542231, '隆子县', 3, 542200);
INSERT INTO `ot_district` VALUES (542232, '错那县', 3, 542200);
INSERT INTO `ot_district` VALUES (542233, '浪卡子县', 3, 542200);
INSERT INTO `ot_district` VALUES (542301, '日喀则市', 3, 542300);
INSERT INTO `ot_district` VALUES (542322, '南木林县', 3, 542300);
INSERT INTO `ot_district` VALUES (542323, '江孜县', 3, 542300);
INSERT INTO `ot_district` VALUES (542324, '定日县', 3, 542300);
INSERT INTO `ot_district` VALUES (542325, '萨迦县', 3, 542300);
INSERT INTO `ot_district` VALUES (542326, '拉孜县', 3, 542300);
INSERT INTO `ot_district` VALUES (542327, '昂仁县', 3, 542300);
INSERT INTO `ot_district` VALUES (542328, '谢通门县', 3, 542300);
INSERT INTO `ot_district` VALUES (542329, '白朗县', 3, 542300);
INSERT INTO `ot_district` VALUES (542330, '仁布县', 3, 542300);
INSERT INTO `ot_district` VALUES (542331, '康马县', 3, 542300);
INSERT INTO `ot_district` VALUES (542332, '定结县', 3, 542300);
INSERT INTO `ot_district` VALUES (542333, '仲巴县', 3, 542300);
INSERT INTO `ot_district` VALUES (542334, '亚东县', 3, 542300);
INSERT INTO `ot_district` VALUES (542335, '吉隆县', 3, 542300);
INSERT INTO `ot_district` VALUES (542336, '聂拉木县', 3, 542300);
INSERT INTO `ot_district` VALUES (542337, '萨嘎县', 3, 542300);
INSERT INTO `ot_district` VALUES (542338, '岗巴县', 3, 542300);
INSERT INTO `ot_district` VALUES (542421, '那曲县', 3, 542400);
INSERT INTO `ot_district` VALUES (542422, '嘉黎县', 3, 542400);
INSERT INTO `ot_district` VALUES (542423, '比如县', 3, 542400);
INSERT INTO `ot_district` VALUES (542424, '聂荣县', 3, 542400);
INSERT INTO `ot_district` VALUES (542425, '安多县', 3, 542400);
INSERT INTO `ot_district` VALUES (542426, '申扎县', 3, 542400);
INSERT INTO `ot_district` VALUES (542427, '索　县', 3, 542400);
INSERT INTO `ot_district` VALUES (542428, '班戈县', 3, 542400);
INSERT INTO `ot_district` VALUES (542429, '巴青县', 3, 542400);
INSERT INTO `ot_district` VALUES (542430, '尼玛县', 3, 542400);
INSERT INTO `ot_district` VALUES (542521, '普兰县', 3, 542500);
INSERT INTO `ot_district` VALUES (542522, '札达县', 3, 542500);
INSERT INTO `ot_district` VALUES (542523, '噶尔县', 3, 542500);
INSERT INTO `ot_district` VALUES (542524, '日土县', 3, 542500);
INSERT INTO `ot_district` VALUES (542525, '革吉县', 3, 542500);
INSERT INTO `ot_district` VALUES (542526, '改则县', 3, 542500);
INSERT INTO `ot_district` VALUES (542527, '措勤县', 3, 542500);
INSERT INTO `ot_district` VALUES (542621, '林芝县', 3, 542600);
INSERT INTO `ot_district` VALUES (542622, '工布江达县', 3, 542600);
INSERT INTO `ot_district` VALUES (542623, '米林县', 3, 542600);
INSERT INTO `ot_district` VALUES (542624, '墨脱县', 3, 542600);
INSERT INTO `ot_district` VALUES (542625, '波密县', 3, 542600);
INSERT INTO `ot_district` VALUES (542626, '察隅县', 3, 542600);
INSERT INTO `ot_district` VALUES (542627, '朗　县', 3, 542600);
INSERT INTO `ot_district` VALUES (610101, '市辖区', 3, 610100);
INSERT INTO `ot_district` VALUES (610102, '新城区', 3, 610100);
INSERT INTO `ot_district` VALUES (610103, '碑林区', 3, 610100);
INSERT INTO `ot_district` VALUES (610104, '莲湖区', 3, 610100);
INSERT INTO `ot_district` VALUES (610111, '灞桥区', 3, 610100);
INSERT INTO `ot_district` VALUES (610112, '未央区', 3, 610100);
INSERT INTO `ot_district` VALUES (610113, '雁塔区', 3, 610100);
INSERT INTO `ot_district` VALUES (610114, '阎良区', 3, 610100);
INSERT INTO `ot_district` VALUES (610115, '临潼区', 3, 610100);
INSERT INTO `ot_district` VALUES (610116, '长安区', 3, 610100);
INSERT INTO `ot_district` VALUES (610122, '蓝田县', 3, 610100);
INSERT INTO `ot_district` VALUES (610124, '周至县', 3, 610100);
INSERT INTO `ot_district` VALUES (610125, '户　县', 3, 610100);
INSERT INTO `ot_district` VALUES (610126, '高陵县', 3, 610100);
INSERT INTO `ot_district` VALUES (610201, '市辖区', 3, 610200);
INSERT INTO `ot_district` VALUES (610202, '王益区', 3, 610200);
INSERT INTO `ot_district` VALUES (610203, '印台区', 3, 610200);
INSERT INTO `ot_district` VALUES (610204, '耀州区', 3, 610200);
INSERT INTO `ot_district` VALUES (610222, '宜君县', 3, 610200);
INSERT INTO `ot_district` VALUES (610301, '市辖区', 3, 610300);
INSERT INTO `ot_district` VALUES (610302, '渭滨区', 3, 610300);
INSERT INTO `ot_district` VALUES (610303, '金台区', 3, 610300);
INSERT INTO `ot_district` VALUES (610304, '陈仓区', 3, 610300);
INSERT INTO `ot_district` VALUES (610322, '凤翔县', 3, 610300);
INSERT INTO `ot_district` VALUES (610323, '岐山县', 3, 610300);
INSERT INTO `ot_district` VALUES (610324, '扶风县', 3, 610300);
INSERT INTO `ot_district` VALUES (610326, '眉　县', 3, 610300);
INSERT INTO `ot_district` VALUES (610327, '陇　县', 3, 610300);
INSERT INTO `ot_district` VALUES (610328, '千阳县', 3, 610300);
INSERT INTO `ot_district` VALUES (610329, '麟游县', 3, 610300);
INSERT INTO `ot_district` VALUES (610330, '凤　县', 3, 610300);
INSERT INTO `ot_district` VALUES (610331, '太白县', 3, 610300);
INSERT INTO `ot_district` VALUES (610401, '市辖区', 3, 610400);
INSERT INTO `ot_district` VALUES (610402, '秦都区', 3, 610400);
INSERT INTO `ot_district` VALUES (610403, '杨凌区', 3, 610400);
INSERT INTO `ot_district` VALUES (610404, '渭城区', 3, 610400);
INSERT INTO `ot_district` VALUES (610422, '三原县', 3, 610400);
INSERT INTO `ot_district` VALUES (610423, '泾阳县', 3, 610400);
INSERT INTO `ot_district` VALUES (610424, '乾　县', 3, 610400);
INSERT INTO `ot_district` VALUES (610425, '礼泉县', 3, 610400);
INSERT INTO `ot_district` VALUES (610426, '永寿县', 3, 610400);
INSERT INTO `ot_district` VALUES (610427, '彬　县', 3, 610400);
INSERT INTO `ot_district` VALUES (610428, '长武县', 3, 610400);
INSERT INTO `ot_district` VALUES (610429, '旬邑县', 3, 610400);
INSERT INTO `ot_district` VALUES (610430, '淳化县', 3, 610400);
INSERT INTO `ot_district` VALUES (610431, '武功县', 3, 610400);
INSERT INTO `ot_district` VALUES (610481, '兴平市', 3, 610400);
INSERT INTO `ot_district` VALUES (610501, '市辖区', 3, 610500);
INSERT INTO `ot_district` VALUES (610502, '临渭区', 3, 610500);
INSERT INTO `ot_district` VALUES (610521, '华　县', 3, 610500);
INSERT INTO `ot_district` VALUES (610522, '潼关县', 3, 610500);
INSERT INTO `ot_district` VALUES (610523, '大荔县', 3, 610500);
INSERT INTO `ot_district` VALUES (610524, '合阳县', 3, 610500);
INSERT INTO `ot_district` VALUES (610525, '澄城县', 3, 610500);
INSERT INTO `ot_district` VALUES (610526, '蒲城县', 3, 610500);
INSERT INTO `ot_district` VALUES (610527, '白水县', 3, 610500);
INSERT INTO `ot_district` VALUES (610528, '富平县', 3, 610500);
INSERT INTO `ot_district` VALUES (610581, '韩城市', 3, 610500);
INSERT INTO `ot_district` VALUES (610582, '华阴市', 3, 610500);
INSERT INTO `ot_district` VALUES (610601, '市辖区', 3, 610600);
INSERT INTO `ot_district` VALUES (610602, '宝塔区', 3, 610600);
INSERT INTO `ot_district` VALUES (610621, '延长县', 3, 610600);
INSERT INTO `ot_district` VALUES (610622, '延川县', 3, 610600);
INSERT INTO `ot_district` VALUES (610623, '子长县', 3, 610600);
INSERT INTO `ot_district` VALUES (610624, '安塞县', 3, 610600);
INSERT INTO `ot_district` VALUES (610625, '志丹县', 3, 610600);
INSERT INTO `ot_district` VALUES (610626, '吴旗县', 3, 610600);
INSERT INTO `ot_district` VALUES (610627, '甘泉县', 3, 610600);
INSERT INTO `ot_district` VALUES (610628, '富　县', 3, 610600);
INSERT INTO `ot_district` VALUES (610629, '洛川县', 3, 610600);
INSERT INTO `ot_district` VALUES (610630, '宜川县', 3, 610600);
INSERT INTO `ot_district` VALUES (610631, '黄龙县', 3, 610600);
INSERT INTO `ot_district` VALUES (610632, '黄陵县', 3, 610600);
INSERT INTO `ot_district` VALUES (610701, '市辖区', 3, 610700);
INSERT INTO `ot_district` VALUES (610702, '汉台区', 3, 610700);
INSERT INTO `ot_district` VALUES (610721, '南郑县', 3, 610700);
INSERT INTO `ot_district` VALUES (610722, '城固县', 3, 610700);
INSERT INTO `ot_district` VALUES (610723, '洋　县', 3, 610700);
INSERT INTO `ot_district` VALUES (610724, '西乡县', 3, 610700);
INSERT INTO `ot_district` VALUES (610725, '勉　县', 3, 610700);
INSERT INTO `ot_district` VALUES (610726, '宁强县', 3, 610700);
INSERT INTO `ot_district` VALUES (610727, '略阳县', 3, 610700);
INSERT INTO `ot_district` VALUES (610728, '镇巴县', 3, 610700);
INSERT INTO `ot_district` VALUES (610729, '留坝县', 3, 610700);
INSERT INTO `ot_district` VALUES (610730, '佛坪县', 3, 610700);
INSERT INTO `ot_district` VALUES (610801, '市辖区', 3, 610800);
INSERT INTO `ot_district` VALUES (610802, '榆阳区', 3, 610800);
INSERT INTO `ot_district` VALUES (610821, '神木县', 3, 610800);
INSERT INTO `ot_district` VALUES (610822, '府谷县', 3, 610800);
INSERT INTO `ot_district` VALUES (610823, '横山县', 3, 610800);
INSERT INTO `ot_district` VALUES (610824, '靖边县', 3, 610800);
INSERT INTO `ot_district` VALUES (610825, '定边县', 3, 610800);
INSERT INTO `ot_district` VALUES (610826, '绥德县', 3, 610800);
INSERT INTO `ot_district` VALUES (610827, '米脂县', 3, 610800);
INSERT INTO `ot_district` VALUES (610828, '佳　县', 3, 610800);
INSERT INTO `ot_district` VALUES (610829, '吴堡县', 3, 610800);
INSERT INTO `ot_district` VALUES (610830, '清涧县', 3, 610800);
INSERT INTO `ot_district` VALUES (610831, '子洲县', 3, 610800);
INSERT INTO `ot_district` VALUES (610901, '市辖区', 3, 610900);
INSERT INTO `ot_district` VALUES (610902, '汉滨区', 3, 610900);
INSERT INTO `ot_district` VALUES (610921, '汉阴县', 3, 610900);
INSERT INTO `ot_district` VALUES (610922, '石泉县', 3, 610900);
INSERT INTO `ot_district` VALUES (610923, '宁陕县', 3, 610900);
INSERT INTO `ot_district` VALUES (610924, '紫阳县', 3, 610900);
INSERT INTO `ot_district` VALUES (610925, '岚皋县', 3, 610900);
INSERT INTO `ot_district` VALUES (610926, '平利县', 3, 610900);
INSERT INTO `ot_district` VALUES (610927, '镇坪县', 3, 610900);
INSERT INTO `ot_district` VALUES (610928, '旬阳县', 3, 610900);
INSERT INTO `ot_district` VALUES (610929, '白河县', 3, 610900);
INSERT INTO `ot_district` VALUES (611001, '市辖区', 3, 611000);
INSERT INTO `ot_district` VALUES (611002, '商州区', 3, 611000);
INSERT INTO `ot_district` VALUES (611021, '洛南县', 3, 611000);
INSERT INTO `ot_district` VALUES (611022, '丹凤县', 3, 611000);
INSERT INTO `ot_district` VALUES (611023, '商南县', 3, 611000);
INSERT INTO `ot_district` VALUES (611024, '山阳县', 3, 611000);
INSERT INTO `ot_district` VALUES (611025, '镇安县', 3, 611000);
INSERT INTO `ot_district` VALUES (611026, '柞水县', 3, 611000);
INSERT INTO `ot_district` VALUES (620101, '市辖区', 3, 620100);
INSERT INTO `ot_district` VALUES (620102, '城关区', 3, 620100);
INSERT INTO `ot_district` VALUES (620103, '七里河区', 3, 620100);
INSERT INTO `ot_district` VALUES (620104, '西固区', 3, 620100);
INSERT INTO `ot_district` VALUES (620105, '安宁区', 3, 620100);
INSERT INTO `ot_district` VALUES (620111, '红古区', 3, 620100);
INSERT INTO `ot_district` VALUES (620121, '永登县', 3, 620100);
INSERT INTO `ot_district` VALUES (620122, '皋兰县', 3, 620100);
INSERT INTO `ot_district` VALUES (620123, '榆中县', 3, 620100);
INSERT INTO `ot_district` VALUES (620201, '市辖区', 3, 620200);
INSERT INTO `ot_district` VALUES (620301, '市辖区', 3, 620300);
INSERT INTO `ot_district` VALUES (620302, '金川区', 3, 620300);
INSERT INTO `ot_district` VALUES (620321, '永昌县', 3, 620300);
INSERT INTO `ot_district` VALUES (620401, '市辖区', 3, 620400);
INSERT INTO `ot_district` VALUES (620402, '白银区', 3, 620400);
INSERT INTO `ot_district` VALUES (620403, '平川区', 3, 620400);
INSERT INTO `ot_district` VALUES (620421, '靖远县', 3, 620400);
INSERT INTO `ot_district` VALUES (620422, '会宁县', 3, 620400);
INSERT INTO `ot_district` VALUES (620423, '景泰县', 3, 620400);
INSERT INTO `ot_district` VALUES (620501, '市辖区', 3, 620500);
INSERT INTO `ot_district` VALUES (620502, '秦城区', 3, 620500);
INSERT INTO `ot_district` VALUES (620503, '北道区', 3, 620500);
INSERT INTO `ot_district` VALUES (620521, '清水县', 3, 620500);
INSERT INTO `ot_district` VALUES (620522, '秦安县', 3, 620500);
INSERT INTO `ot_district` VALUES (620523, '甘谷县', 3, 620500);
INSERT INTO `ot_district` VALUES (620524, '武山县', 3, 620500);
INSERT INTO `ot_district` VALUES (620525, '张家川回族自治县', 3, 620500);
INSERT INTO `ot_district` VALUES (620601, '市辖区', 3, 620600);
INSERT INTO `ot_district` VALUES (620602, '凉州区', 3, 620600);
INSERT INTO `ot_district` VALUES (620621, '民勤县', 3, 620600);
INSERT INTO `ot_district` VALUES (620622, '古浪县', 3, 620600);
INSERT INTO `ot_district` VALUES (620623, '天祝藏族自治县', 3, 620600);
INSERT INTO `ot_district` VALUES (620701, '市辖区', 3, 620700);
INSERT INTO `ot_district` VALUES (620702, '甘州区', 3, 620700);
INSERT INTO `ot_district` VALUES (620721, '肃南裕固族自治县', 3, 620700);
INSERT INTO `ot_district` VALUES (620722, '民乐县', 3, 620700);
INSERT INTO `ot_district` VALUES (620723, '临泽县', 3, 620700);
INSERT INTO `ot_district` VALUES (620724, '高台县', 3, 620700);
INSERT INTO `ot_district` VALUES (620725, '山丹县', 3, 620700);
INSERT INTO `ot_district` VALUES (620801, '市辖区', 3, 620800);
INSERT INTO `ot_district` VALUES (620802, '崆峒区', 3, 620800);
INSERT INTO `ot_district` VALUES (620821, '泾川县', 3, 620800);
INSERT INTO `ot_district` VALUES (620822, '灵台县', 3, 620800);
INSERT INTO `ot_district` VALUES (620823, '崇信县', 3, 620800);
INSERT INTO `ot_district` VALUES (620824, '华亭县', 3, 620800);
INSERT INTO `ot_district` VALUES (620825, '庄浪县', 3, 620800);
INSERT INTO `ot_district` VALUES (620826, '静宁县', 3, 620800);
INSERT INTO `ot_district` VALUES (620901, '市辖区', 3, 620900);
INSERT INTO `ot_district` VALUES (620902, '肃州区', 3, 620900);
INSERT INTO `ot_district` VALUES (620921, '金塔县', 3, 620900);
INSERT INTO `ot_district` VALUES (620922, '安西县', 3, 620900);
INSERT INTO `ot_district` VALUES (620923, '肃北蒙古族自治县', 3, 620900);
INSERT INTO `ot_district` VALUES (620924, '阿克塞哈萨克族自治县', 3, 620900);
INSERT INTO `ot_district` VALUES (620981, '玉门市', 3, 620900);
INSERT INTO `ot_district` VALUES (620982, '敦煌市', 3, 620900);
INSERT INTO `ot_district` VALUES (621001, '市辖区', 3, 621000);
INSERT INTO `ot_district` VALUES (621002, '西峰区', 3, 621000);
INSERT INTO `ot_district` VALUES (621021, '庆城县', 3, 621000);
INSERT INTO `ot_district` VALUES (621022, '环　县', 3, 621000);
INSERT INTO `ot_district` VALUES (621023, '华池县', 3, 621000);
INSERT INTO `ot_district` VALUES (621024, '合水县', 3, 621000);
INSERT INTO `ot_district` VALUES (621025, '正宁县', 3, 621000);
INSERT INTO `ot_district` VALUES (621026, '宁　县', 3, 621000);
INSERT INTO `ot_district` VALUES (621027, '镇原县', 3, 621000);
INSERT INTO `ot_district` VALUES (621101, '市辖区', 3, 621100);
INSERT INTO `ot_district` VALUES (621102, '安定区', 3, 621100);
INSERT INTO `ot_district` VALUES (621121, '通渭县', 3, 621100);
INSERT INTO `ot_district` VALUES (621122, '陇西县', 3, 621100);
INSERT INTO `ot_district` VALUES (621123, '渭源县', 3, 621100);
INSERT INTO `ot_district` VALUES (621124, '临洮县', 3, 621100);
INSERT INTO `ot_district` VALUES (621125, '漳　县', 3, 621100);
INSERT INTO `ot_district` VALUES (621126, '岷　县', 3, 621100);
INSERT INTO `ot_district` VALUES (621201, '市辖区', 3, 621200);
INSERT INTO `ot_district` VALUES (621202, '武都区', 3, 621200);
INSERT INTO `ot_district` VALUES (621221, '成　县', 3, 621200);
INSERT INTO `ot_district` VALUES (621222, '文　县', 3, 621200);
INSERT INTO `ot_district` VALUES (621223, '宕昌县', 3, 621200);
INSERT INTO `ot_district` VALUES (621224, '康　县', 3, 621200);
INSERT INTO `ot_district` VALUES (621225, '西和县', 3, 621200);
INSERT INTO `ot_district` VALUES (621226, '礼　县', 3, 621200);
INSERT INTO `ot_district` VALUES (621227, '徽　县', 3, 621200);
INSERT INTO `ot_district` VALUES (621228, '两当县', 3, 621200);
INSERT INTO `ot_district` VALUES (622901, '临夏市', 3, 622900);
INSERT INTO `ot_district` VALUES (622921, '临夏县', 3, 622900);
INSERT INTO `ot_district` VALUES (622922, '康乐县', 3, 622900);
INSERT INTO `ot_district` VALUES (622923, '永靖县', 3, 622900);
INSERT INTO `ot_district` VALUES (622924, '广河县', 3, 622900);
INSERT INTO `ot_district` VALUES (622925, '和政县', 3, 622900);
INSERT INTO `ot_district` VALUES (622926, '东乡族自治县', 3, 622900);
INSERT INTO `ot_district` VALUES (622927, '积石山保安族东乡族撒拉族自治县', 3, 622900);
INSERT INTO `ot_district` VALUES (623001, '合作市', 3, 623000);
INSERT INTO `ot_district` VALUES (623021, '临潭县', 3, 623000);
INSERT INTO `ot_district` VALUES (623022, '卓尼县', 3, 623000);
INSERT INTO `ot_district` VALUES (623023, '舟曲县', 3, 623000);
INSERT INTO `ot_district` VALUES (623024, '迭部县', 3, 623000);
INSERT INTO `ot_district` VALUES (623025, '玛曲县', 3, 623000);
INSERT INTO `ot_district` VALUES (623026, '碌曲县', 3, 623000);
INSERT INTO `ot_district` VALUES (623027, '夏河县', 3, 623000);
INSERT INTO `ot_district` VALUES (630101, '市辖区', 3, 630100);
INSERT INTO `ot_district` VALUES (630102, '城东区', 3, 630100);
INSERT INTO `ot_district` VALUES (630103, '城中区', 3, 630100);
INSERT INTO `ot_district` VALUES (630104, '城西区', 3, 630100);
INSERT INTO `ot_district` VALUES (630105, '城北区', 3, 630100);
INSERT INTO `ot_district` VALUES (630121, '大通回族土族自治县', 3, 630100);
INSERT INTO `ot_district` VALUES (630122, '湟中县', 3, 630100);
INSERT INTO `ot_district` VALUES (630123, '湟源县', 3, 630100);
INSERT INTO `ot_district` VALUES (632121, '平安县', 3, 632100);
INSERT INTO `ot_district` VALUES (632122, '民和回族土族自治县', 3, 632100);
INSERT INTO `ot_district` VALUES (632123, '乐都县', 3, 632100);
INSERT INTO `ot_district` VALUES (632126, '互助土族自治县', 3, 632100);
INSERT INTO `ot_district` VALUES (632127, '化隆回族自治县', 3, 632100);
INSERT INTO `ot_district` VALUES (632128, '循化撒拉族自治县', 3, 632100);
INSERT INTO `ot_district` VALUES (632221, '门源回族自治县', 3, 632200);
INSERT INTO `ot_district` VALUES (632222, '祁连县', 3, 632200);
INSERT INTO `ot_district` VALUES (632223, '海晏县', 3, 632200);
INSERT INTO `ot_district` VALUES (632224, '刚察县', 3, 632200);
INSERT INTO `ot_district` VALUES (632321, '同仁县', 3, 632300);
INSERT INTO `ot_district` VALUES (632322, '尖扎县', 3, 632300);
INSERT INTO `ot_district` VALUES (632323, '泽库县', 3, 632300);
INSERT INTO `ot_district` VALUES (632324, '河南蒙古族自治县', 3, 632300);
INSERT INTO `ot_district` VALUES (632521, '共和县', 3, 632500);
INSERT INTO `ot_district` VALUES (632522, '同德县', 3, 632500);
INSERT INTO `ot_district` VALUES (632523, '贵德县', 3, 632500);
INSERT INTO `ot_district` VALUES (632524, '兴海县', 3, 632500);
INSERT INTO `ot_district` VALUES (632525, '贵南县', 3, 632500);
INSERT INTO `ot_district` VALUES (632621, '玛沁县', 3, 632600);
INSERT INTO `ot_district` VALUES (632622, '班玛县', 3, 632600);
INSERT INTO `ot_district` VALUES (632623, '甘德县', 3, 632600);
INSERT INTO `ot_district` VALUES (632624, '达日县', 3, 632600);
INSERT INTO `ot_district` VALUES (632625, '久治县', 3, 632600);
INSERT INTO `ot_district` VALUES (632626, '玛多县', 3, 632600);
INSERT INTO `ot_district` VALUES (632721, '玉树县', 3, 632700);
INSERT INTO `ot_district` VALUES (632722, '杂多县', 3, 632700);
INSERT INTO `ot_district` VALUES (632723, '称多县', 3, 632700);
INSERT INTO `ot_district` VALUES (632724, '治多县', 3, 632700);
INSERT INTO `ot_district` VALUES (632725, '囊谦县', 3, 632700);
INSERT INTO `ot_district` VALUES (632726, '曲麻莱县', 3, 632700);
INSERT INTO `ot_district` VALUES (632801, '格尔木市', 3, 632800);
INSERT INTO `ot_district` VALUES (632802, '德令哈市', 3, 632800);
INSERT INTO `ot_district` VALUES (632821, '乌兰县', 3, 632800);
INSERT INTO `ot_district` VALUES (632822, '都兰县', 3, 632800);
INSERT INTO `ot_district` VALUES (632823, '天峻县', 3, 632800);
INSERT INTO `ot_district` VALUES (640101, '市辖区', 3, 640100);
INSERT INTO `ot_district` VALUES (640104, '兴庆区', 3, 640100);
INSERT INTO `ot_district` VALUES (640105, '西夏区', 3, 640100);
INSERT INTO `ot_district` VALUES (640106, '金凤区', 3, 640100);
INSERT INTO `ot_district` VALUES (640121, '永宁县', 3, 640100);
INSERT INTO `ot_district` VALUES (640122, '贺兰县', 3, 640100);
INSERT INTO `ot_district` VALUES (640181, '灵武市', 3, 640100);
INSERT INTO `ot_district` VALUES (640201, '市辖区', 3, 640200);
INSERT INTO `ot_district` VALUES (640202, '大武口区', 3, 640200);
INSERT INTO `ot_district` VALUES (640205, '惠农区', 3, 640200);
INSERT INTO `ot_district` VALUES (640221, '平罗县', 3, 640200);
INSERT INTO `ot_district` VALUES (640301, '市辖区', 3, 640300);
INSERT INTO `ot_district` VALUES (640302, '利通区', 3, 640300);
INSERT INTO `ot_district` VALUES (640323, '盐池县', 3, 640300);
INSERT INTO `ot_district` VALUES (640324, '同心县', 3, 640300);
INSERT INTO `ot_district` VALUES (640381, '青铜峡市', 3, 640300);
INSERT INTO `ot_district` VALUES (640401, '市辖区', 3, 640400);
INSERT INTO `ot_district` VALUES (640402, '原州区', 3, 640400);
INSERT INTO `ot_district` VALUES (640422, '西吉县', 3, 640400);
INSERT INTO `ot_district` VALUES (640423, '隆德县', 3, 640400);
INSERT INTO `ot_district` VALUES (640424, '泾源县', 3, 640400);
INSERT INTO `ot_district` VALUES (640425, '彭阳县', 3, 640400);
INSERT INTO `ot_district` VALUES (640501, '市辖区', 3, 640500);
INSERT INTO `ot_district` VALUES (640502, '沙坡头区', 3, 640500);
INSERT INTO `ot_district` VALUES (640521, '中宁县', 3, 640500);
INSERT INTO `ot_district` VALUES (640522, '海原县', 3, 640500);
INSERT INTO `ot_district` VALUES (650101, '市辖区', 3, 650100);
INSERT INTO `ot_district` VALUES (650102, '天山区', 3, 650100);
INSERT INTO `ot_district` VALUES (650103, '沙依巴克区', 3, 650100);
INSERT INTO `ot_district` VALUES (650104, '新市区', 3, 650100);
INSERT INTO `ot_district` VALUES (650105, '水磨沟区', 3, 650100);
INSERT INTO `ot_district` VALUES (650106, '头屯河区', 3, 650100);
INSERT INTO `ot_district` VALUES (650107, '达坂城区', 3, 650100);
INSERT INTO `ot_district` VALUES (650108, '东山区', 3, 650100);
INSERT INTO `ot_district` VALUES (650121, '乌鲁木齐县', 3, 650100);
INSERT INTO `ot_district` VALUES (650201, '市辖区', 3, 650200);
INSERT INTO `ot_district` VALUES (650202, '独山子区', 3, 650200);
INSERT INTO `ot_district` VALUES (650203, '克拉玛依区', 3, 650200);
INSERT INTO `ot_district` VALUES (650204, '白碱滩区', 3, 650200);
INSERT INTO `ot_district` VALUES (650205, '乌尔禾区', 3, 650200);
INSERT INTO `ot_district` VALUES (652101, '吐鲁番市', 3, 652100);
INSERT INTO `ot_district` VALUES (652122, '鄯善县', 3, 652100);
INSERT INTO `ot_district` VALUES (652123, '托克逊县', 3, 652100);
INSERT INTO `ot_district` VALUES (652201, '哈密市', 3, 652200);
INSERT INTO `ot_district` VALUES (652222, '巴里坤哈萨克自治县', 3, 652200);
INSERT INTO `ot_district` VALUES (652223, '伊吾县', 3, 652200);
INSERT INTO `ot_district` VALUES (652301, '昌吉市', 3, 652300);
INSERT INTO `ot_district` VALUES (652302, '阜康市', 3, 652300);
INSERT INTO `ot_district` VALUES (652303, '米泉市', 3, 652300);
INSERT INTO `ot_district` VALUES (652323, '呼图壁县', 3, 652300);
INSERT INTO `ot_district` VALUES (652324, '玛纳斯县', 3, 652300);
INSERT INTO `ot_district` VALUES (652325, '奇台县', 3, 652300);
INSERT INTO `ot_district` VALUES (652327, '吉木萨尔县', 3, 652300);
INSERT INTO `ot_district` VALUES (652328, '木垒哈萨克自治县', 3, 652300);
INSERT INTO `ot_district` VALUES (652701, '博乐市', 3, 652700);
INSERT INTO `ot_district` VALUES (652722, '精河县', 3, 652700);
INSERT INTO `ot_district` VALUES (652723, '温泉县', 3, 652700);
INSERT INTO `ot_district` VALUES (652801, '库尔勒市', 3, 652800);
INSERT INTO `ot_district` VALUES (652822, '轮台县', 3, 652800);
INSERT INTO `ot_district` VALUES (652823, '尉犁县', 3, 652800);
INSERT INTO `ot_district` VALUES (652824, '若羌县', 3, 652800);
INSERT INTO `ot_district` VALUES (652825, '且末县', 3, 652800);
INSERT INTO `ot_district` VALUES (652826, '焉耆回族自治县', 3, 652800);
INSERT INTO `ot_district` VALUES (652827, '和静县', 3, 652800);
INSERT INTO `ot_district` VALUES (652828, '和硕县', 3, 652800);
INSERT INTO `ot_district` VALUES (652829, '博湖县', 3, 652800);
INSERT INTO `ot_district` VALUES (652901, '阿克苏市', 3, 652900);
INSERT INTO `ot_district` VALUES (652922, '温宿县', 3, 652900);
INSERT INTO `ot_district` VALUES (652923, '库车县', 3, 652900);
INSERT INTO `ot_district` VALUES (652924, '沙雅县', 3, 652900);
INSERT INTO `ot_district` VALUES (652925, '新和县', 3, 652900);
INSERT INTO `ot_district` VALUES (652926, '拜城县', 3, 652900);
INSERT INTO `ot_district` VALUES (652927, '乌什县', 3, 652900);
INSERT INTO `ot_district` VALUES (652928, '阿瓦提县', 3, 652900);
INSERT INTO `ot_district` VALUES (652929, '柯坪县', 3, 652900);
INSERT INTO `ot_district` VALUES (653001, '阿图什市', 3, 653000);
INSERT INTO `ot_district` VALUES (653022, '阿克陶县', 3, 653000);
INSERT INTO `ot_district` VALUES (653023, '阿合奇县', 3, 653000);
INSERT INTO `ot_district` VALUES (653024, '乌恰县', 3, 653000);
INSERT INTO `ot_district` VALUES (653101, '喀什市', 3, 653100);
INSERT INTO `ot_district` VALUES (653121, '疏附县', 3, 653100);
INSERT INTO `ot_district` VALUES (653122, '疏勒县', 3, 653100);
INSERT INTO `ot_district` VALUES (653123, '英吉沙县', 3, 653100);
INSERT INTO `ot_district` VALUES (653124, '泽普县', 3, 653100);
INSERT INTO `ot_district` VALUES (653125, '莎车县', 3, 653100);
INSERT INTO `ot_district` VALUES (653126, '叶城县', 3, 653100);
INSERT INTO `ot_district` VALUES (653127, '麦盖提县', 3, 653100);
INSERT INTO `ot_district` VALUES (653128, '岳普湖县', 3, 653100);
INSERT INTO `ot_district` VALUES (653129, '伽师县', 3, 653100);
INSERT INTO `ot_district` VALUES (653130, '巴楚县', 3, 653100);
INSERT INTO `ot_district` VALUES (653131, '塔什库尔干塔吉克自治县', 3, 653100);
INSERT INTO `ot_district` VALUES (653201, '和田市', 3, 653200);
INSERT INTO `ot_district` VALUES (653221, '和田县', 3, 653200);
INSERT INTO `ot_district` VALUES (653222, '墨玉县', 3, 653200);
INSERT INTO `ot_district` VALUES (653223, '皮山县', 3, 653200);
INSERT INTO `ot_district` VALUES (653224, '洛浦县', 3, 653200);
INSERT INTO `ot_district` VALUES (653225, '策勒县', 3, 653200);
INSERT INTO `ot_district` VALUES (653226, '于田县', 3, 653200);
INSERT INTO `ot_district` VALUES (653227, '民丰县', 3, 653200);
INSERT INTO `ot_district` VALUES (654002, '伊宁市', 3, 654000);
INSERT INTO `ot_district` VALUES (654003, '奎屯市', 3, 654000);
INSERT INTO `ot_district` VALUES (654021, '伊宁县', 3, 654000);
INSERT INTO `ot_district` VALUES (654022, '察布查尔锡伯自治县', 3, 654000);
INSERT INTO `ot_district` VALUES (654023, '霍城县', 3, 654000);
INSERT INTO `ot_district` VALUES (654024, '巩留县', 3, 654000);
INSERT INTO `ot_district` VALUES (654025, '新源县', 3, 654000);
INSERT INTO `ot_district` VALUES (654026, '昭苏县', 3, 654000);
INSERT INTO `ot_district` VALUES (654027, '特克斯县', 3, 654000);
INSERT INTO `ot_district` VALUES (654028, '尼勒克县', 3, 654000);
INSERT INTO `ot_district` VALUES (654201, '塔城市', 3, 654200);
INSERT INTO `ot_district` VALUES (654202, '乌苏市', 3, 654200);
INSERT INTO `ot_district` VALUES (654221, '额敏县', 3, 654200);
INSERT INTO `ot_district` VALUES (654223, '沙湾县', 3, 654200);
INSERT INTO `ot_district` VALUES (654224, '托里县', 3, 654200);
INSERT INTO `ot_district` VALUES (654225, '裕民县', 3, 654200);
INSERT INTO `ot_district` VALUES (654226, '和布克赛尔蒙古自治县', 3, 654200);
INSERT INTO `ot_district` VALUES (654301, '阿勒泰市', 3, 654300);
INSERT INTO `ot_district` VALUES (654321, '布尔津县', 3, 654300);
INSERT INTO `ot_district` VALUES (654322, '富蕴县', 3, 654300);
INSERT INTO `ot_district` VALUES (654323, '福海县', 3, 654300);
INSERT INTO `ot_district` VALUES (654324, '哈巴河县', 3, 654300);
INSERT INTO `ot_district` VALUES (654325, '青河县', 3, 654300);
INSERT INTO `ot_district` VALUES (654326, '吉木乃县', 3, 654300);
INSERT INTO `ot_district` VALUES (659001, '石河子市', 3, 659000);
INSERT INTO `ot_district` VALUES (659002, '阿拉尔市', 3, 659000);
INSERT INTO `ot_district` VALUES (659003, '图木舒克市', 3, 659000);
INSERT INTO `ot_district` VALUES (659004, '五家渠市', 3, 659000);
INSERT INTO `ot_district` VALUES (810001, '香港', 2, 810000);
INSERT INTO `ot_district` VALUES (810002, '中西区', 3, 810001);
INSERT INTO `ot_district` VALUES (810003, '九龙城区', 3, 810001);
INSERT INTO `ot_district` VALUES (810004, '南区', 3, 810001);
INSERT INTO `ot_district` VALUES (810005, '黄大仙区', 3, 810001);
INSERT INTO `ot_district` VALUES (810006, '油尖旺区', 3, 810001);
INSERT INTO `ot_district` VALUES (810007, '葵青区', 3, 810001);
INSERT INTO `ot_district` VALUES (810008, '西贡区', 3, 810001);
INSERT INTO `ot_district` VALUES (810009, '屯门区', 3, 810001);
INSERT INTO `ot_district` VALUES (810010, '荃湾区', 3, 810001);
INSERT INTO `ot_district` VALUES (810011, '东区', 3, 810001);
INSERT INTO `ot_district` VALUES (810012, '观塘区', 3, 810001);
INSERT INTO `ot_district` VALUES (810013, '深水步区', 3, 810001);
INSERT INTO `ot_district` VALUES (810014, '湾仔区', 3, 810001);
INSERT INTO `ot_district` VALUES (810015, '离岛区', 3, 810001);
INSERT INTO `ot_district` VALUES (810016, '北区', 3, 810001);
INSERT INTO `ot_district` VALUES (810017, '沙田区', 3, 810001);
INSERT INTO `ot_district` VALUES (810018, '大埔区', 3, 810001);
INSERT INTO `ot_district` VALUES (810019, '元朗区', 3, 810001);
INSERT INTO `ot_district` VALUES (820001, '澳门', 2, 820000);
INSERT INTO `ot_district` VALUES (820002, '澳门', 3, 820001);
INSERT INTO `ot_district` VALUES (710001, '台北市', 2, 710000);
INSERT INTO `ot_district` VALUES (710002, '台北县', 3, 710001);
INSERT INTO `ot_district` VALUES (710003, '基隆市', 2, 710000);
INSERT INTO `ot_district` VALUES (910005, '中山市', 3, 442000);
INSERT INTO `ot_district` VALUES (710004, '花莲县', 3, 710003);
INSERT INTO `ot_district` VALUES (910006, '东莞市', 3, 441900);

-- ----------------------------
-- Table structure for ot_expression
-- ----------------------------
DROP TABLE IF EXISTS `ot_expression`;
CREATE TABLE `ot_expression`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `driver` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` int(11) NOT NULL,
  `expression_pkg_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_expression_pkg
-- ----------------------------
DROP TABLE IF EXISTS `ot_expression_pkg`;
CREATE TABLE `ot_expression_pkg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pkg_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pkg_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `driver` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_field
-- ----------------------------
DROP TABLE IF EXISTS `ot_field`;
CREATE TABLE `ot_field`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `field_data` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createTime` int(11) NOT NULL,
  `changeTime` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_field
-- ----------------------------
INSERT INTO `ot_field` VALUES (1, 1, 100, 1, '1037757846', 1541132746, 1541132767);
INSERT INTO `ot_field` VALUES (2, 1, 100, 2, '1541132721', 1541132746, 1541132767);
INSERT INTO `ot_field` VALUES (3, 1, 100, 3, 'php', 1541132746, 1541132767);
INSERT INTO `ot_field` VALUES (4, 1, 100, 5, '程序猿人', 1541132746, 1541132767);

-- ----------------------------
-- Table structure for ot_field_group
-- ----------------------------
DROP TABLE IF EXISTS `ot_field_group`;
CREATE TABLE `ot_field_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `createTime` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `visiable` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_field_group
-- ----------------------------
INSERT INTO `ot_field_group` VALUES (1, '个人资料', 1, 1403847366, 0, 1);
INSERT INTO `ot_field_group` VALUES (2, '开发者资料', 1, 1423537648, 0, 0);

-- ----------------------------
-- Table structure for ot_field_setting
-- ----------------------------
DROP TABLE IF EXISTS `ot_field_setting`;
CREATE TABLE `ot_field_setting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `profile_group_id` int(11) NOT NULL,
  `visiable` tinyint(4) NOT NULL DEFAULT 1,
  `required` tinyint(4) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL,
  `form_type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `form_default_value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `validation` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `createTime` int(11) NOT NULL,
  `child_form_type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `input_tips` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '输入提示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_field_setting
-- ----------------------------
INSERT INTO `ot_field_setting` VALUES (1, 'qq', 1, 1, 1, 0, 'input', '', '', 1, 1409045825, 'string', '');
INSERT INTO `ot_field_setting` VALUES (2, '生日', 1, 1, 1, 0, 'time', '', '', 1, 1423537409, '', '');
INSERT INTO `ot_field_setting` VALUES (3, '擅长语言', 2, 1, 1, 0, 'select', 'Java|C++|Python|php|object c|ruby', '', 1, 1423537693, '', '');
INSERT INTO `ot_field_setting` VALUES (4, '承接项目', 2, 1, 1, 0, 'radio', '是|否', '', 1, 1423537733, '', '');
INSERT INTO `ot_field_setting` VALUES (5, '简介', 2, 1, 1, 0, 'textarea', '', '', 1, 1423537770, '', '简单介绍入行以来的工作经验，项目经验');
INSERT INTO `ot_field_setting` VALUES (6, '其他技能', 2, 1, 1, 0, 'checkbox', 'PhotoShop|Flash', '', 1, 1423537834, '', '');
INSERT INTO `ot_field_setting` VALUES (8, 'phone', 1, 1, 1, 0, 'input', '', '', -1, 1535958903, 'phone', '');

-- ----------------------------
-- Table structure for ot_file
-- ----------------------------
DROP TABLE IF EXISTS `ot_file`;
CREATE TABLE `ot_file`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `md5` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件保存位置',
  `create_time` int(10) UNSIGNED NOT NULL COMMENT '上传时间',
  `driver` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `download_num` int(11) NOT NULL DEFAULT 0 COMMENT '下载数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_md5`(`md5`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_follow
-- ----------------------------
DROP TABLE IF EXISTS `ot_follow`;
CREATE TABLE `ot_follow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `follow_who` int(11) NOT NULL COMMENT '关注谁',
  `who_follow` int(11) NOT NULL COMMENT '谁关注',
  `create_time` int(11) NOT NULL,
  `alias` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `group_id` int(11) NOT NULL COMMENT '分组ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '关注表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_follow
-- ----------------------------
INSERT INTO `ot_follow` VALUES (4, 1, 100, 1538213733, '', 0);
INSERT INTO `ot_follow` VALUES (11, 100, 1, 1542608703, '', 0);

-- ----------------------------
-- Table structure for ot_hooks
-- ----------------------------
DROP TABLE IF EXISTS `ot_hooks`;
CREATE TABLE `ot_hooks`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `addons` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 \'，\'分割',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10000 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_hooks
-- ----------------------------
INSERT INTO `ot_hooks` VALUES (38, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, '');
INSERT INTO `ot_hooks` VALUES (39, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, 'SuperLinks');
INSERT INTO `ot_hooks` VALUES (40, 'adminEditor', '后台内容编辑页编辑器', 1, 1378982734, 'EditorForAdmin');
INSERT INTO `ot_hooks` VALUES (41, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'SiteStat,SyncLogin,DevTeam,SystemInfo,LocalComment');
INSERT INTO `ot_hooks` VALUES (42, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, '');
INSERT INTO `ot_hooks` VALUES (43, 'app_begin', '应用开始', 2, 1384481614, 'Iswaf');
INSERT INTO `ot_hooks` VALUES (44, 'checkIn', '签到', 1, 1395371353, 'CheckIn');
INSERT INTO `ot_hooks` VALUES (46, 'support', '赞', 1, 1398264759, 'Support');
INSERT INTO `ot_hooks` VALUES (47, 'localComment', '本地评论插件', 1, 1399440321, 'LocalComment');
INSERT INTO `ot_hooks` VALUES (48, 'weiboType', '微博类型', 1, 1409121894, '');
INSERT INTO `ot_hooks` VALUES (49, 'repost', '转发钩子', 1, 1403668286, '');
INSERT INTO `ot_hooks` VALUES (50, 'syncLogin', '第三方登陆位置', 1, 1403700579, 'SyncLogin');
INSERT INTO `ot_hooks` VALUES (51, 'syncMeta', '第三方登陆meta接口', 1, 1403700633, 'SyncLogin');
INSERT INTO `ot_hooks` VALUES (52, 'J_China_City', '每个系统都需要的一个中国省市区三级联动插件。', 1, 1403841931, 'ChinaCity');
INSERT INTO `ot_hooks` VALUES (54, 'imageSlider', '图片轮播钩子', 1, 1407144022, '');
INSERT INTO `ot_hooks` VALUES (55, 'friendLink', '友情链接插件', 1, 1407156413, 'SuperLinks');
INSERT INTO `ot_hooks` VALUES (56, 'beforeSendWeibo', '在发微博之前预处理微博', 2, 1408084504, 'InsertFile');
INSERT INTO `ot_hooks` VALUES (57, 'beforeSendRepost', '转发微博前的预处理钩子', 2, 1408085689, '');
INSERT INTO `ot_hooks` VALUES (58, 'parseWeiboContent', '解析微博内容钩子', 2, 1409121261, '');
INSERT INTO `ot_hooks` VALUES (59, 'userConfig', '用户配置页面钩子', 1, 1417137557, 'SyncLogin');
INSERT INTO `ot_hooks` VALUES (60, 'weiboSide', '微博侧边钩子', 1, 1417063425, 'Retopic,Recommend');
INSERT INTO `ot_hooks` VALUES (61, 'personalMenus', '顶部导航栏个人下拉菜单', 1, 1417146501, '');
INSERT INTO `ot_hooks` VALUES (62, 'dealPicture', '上传图片处理', 2, 1417139975, '');
INSERT INTO `ot_hooks` VALUES (63, 'ucenterSideMenu', '用户中心左侧菜单', 1, 1417161205, '');
INSERT INTO `ot_hooks` VALUES (64, 'afterTop', '顶部导航之后的钩子，调用公告等', 1, 1429671392, '');
INSERT INTO `ot_hooks` VALUES (65, 'report', '举报钩子', 1, 1429511732, 'Report');
INSERT INTO `ot_hooks` VALUES (66, 'handleAction', '行为的额外操作', 2, 1433300260, 'CheckIn');
INSERT INTO `ot_hooks` VALUES (67, 'uploadDriver', '附件图片上传引擎', 2, 1435306269, '');
INSERT INTO `ot_hooks` VALUES (68, 'sms', '短信插件钩子', 2, 1437382105, '');
INSERT INTO `ot_hooks` VALUES (69, 'filterHtmlContent', '渲染富文本', 2, 1441951420, '');
INSERT INTO `ot_hooks` VALUES (70, 'parseContent', '解析内容', 2, 1445828128, 'Sensitive');
INSERT INTO `ot_hooks` VALUES (71, 'tool', '返回顶部，右下角工具栏', 1, 1445828128, '');
INSERT INTO `ot_hooks` VALUES (72, 'homeIndex', '网站首页', 2, 1445828128, '');

-- ----------------------------
-- Table structure for ot_iexpression
-- ----------------------------
DROP TABLE IF EXISTS `ot_iexpression`;
CREATE TABLE `ot_iexpression`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `driver` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_iexpression_link
-- ----------------------------
DROP TABLE IF EXISTS `ot_iexpression_link`;
CREATE TABLE `ot_iexpression_link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iexpression_id` int(11) NOT NULL,
  `uid` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ot_invite
-- ----------------------------
DROP TABLE IF EXISTS `ot_invite`;
CREATE TABLE `ot_invite`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY',
  `invite_type` int(11) NOT NULL COMMENT '邀请类型id',
  `code` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邀请码',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `can_num` int(10) NOT NULL COMMENT '可以注册用户（含升级）',
  `already_num` int(10) NOT NULL COMMENT '已经注册用户（含升级）',
  `end_time` int(11) NOT NULL COMMENT '有效期至',
  `status` tinyint(2) NOT NULL COMMENT '0：已用完，1：还可注册，2：用户取消邀请，-1：管理员删除',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邀请码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_invite
-- ----------------------------
INSERT INTO `ot_invite` VALUES (1, 1, 'M9TR2PPaHWY', 1, 100000, 0, 1818494575, 1, 1502961774);
INSERT INTO `ot_invite` VALUES (2, 1, 'dlO7pXWqlTO', 100, 100000, 0, 1851149453, 1, 1535530253);
INSERT INTO `ot_invite` VALUES (3, 1, 'JDkhi1JozEc', 101, 100000, 0, 1851671178, 1, 1536051978);

-- ----------------------------
-- Table structure for ot_invite_buy_log
-- ----------------------------
DROP TABLE IF EXISTS `ot_invite_buy_log`;
CREATE TABLE `ot_invite_buy_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY',
  `invite_type` int(11) NOT NULL COMMENT '邀请类型id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `num` int(10) NOT NULL COMMENT '可邀请名额',
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录信息',
  `create_time` int(11) NOT NULL COMMENT '创建时间（做频率用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户购买邀请名额记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_invite_log
-- ----------------------------
DROP TABLE IF EXISTS `ot_invite_log`;
CREATE TABLE `ot_invite_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `inviter_id` int(11) NOT NULL COMMENT '邀请人id',
  `invite_id` int(11) NOT NULL COMMENT '邀请码id',
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录内容',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邀请注册成功记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_invite_type
-- ----------------------------
DROP TABLE IF EXISTS `ot_invite_type`;
CREATE TABLE `ot_invite_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY',
  `title` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `length` int(10) NOT NULL DEFAULT 11 COMMENT '验证码长度',
  `time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '有效时长，带单位的时间',
  `cycle_num` int(10) NOT NULL COMMENT '周期内可购买个数',
  `cycle_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '周期时长，带单位的时间',
  `roles` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '绑定角色ids',
  `auth_groups` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '允许购买的权限组ids',
  `pay_score` int(10) NOT NULL COMMENT '购买消耗积分',
  `pay_score_type` int(11) NOT NULL COMMENT '购买消耗积分类型',
  `income_score` int(10) NOT NULL COMMENT '每邀请成功一个用户，邀请者增加积分',
  `income_score_type` int(11) NOT NULL COMMENT '邀请成功后增加积分类型id',
  `is_follow` tinyint(2) NOT NULL COMMENT '邀请成功后是否互相关注',
  `status` tinyint(2) NOT NULL,
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邀请注册码类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_invite_type
-- ----------------------------
INSERT INTO `ot_invite_type` VALUES (1, '系统默认邀请码', 11, '10 year', 1, '1 second', '[1]', '[1],[2]', 0, 1, 0, 1, 1, 1, 1466749163, 1471247871);

-- ----------------------------
-- Table structure for ot_invite_user_info
-- ----------------------------
DROP TABLE IF EXISTS `ot_invite_user_info`;
CREATE TABLE `ot_invite_user_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY',
  `invite_type` int(11) NOT NULL COMMENT '邀请类型id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `num` int(11) NOT NULL COMMENT '可邀请名额',
  `already_num` int(11) NOT NULL COMMENT '已邀请名额',
  `success_num` int(11) NOT NULL COMMENT '成功邀请名额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邀请注册用户信息' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ot_local_comment
-- ----------------------------
DROP TABLE IF EXISTS `ot_local_comment`;
CREATE TABLE `ot_local_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `app` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mod` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `row_id` int(11) NOT NULL,
  `parse` int(11) NOT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `ip` bigint(20) NOT NULL,
  `area` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_member
-- ----------------------------
DROP TABLE IF EXISTS `ot_member`;
CREATE TABLE `ot_member`  (
  `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'qq号',
  `login` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT 0 COMMENT '注册IP',
  `reg_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT 0 COMMENT '最后登录IP',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '会员状态',
  `last_login_role` int(11) NOT NULL,
  `show_role` int(11) NOT NULL COMMENT '个人主页显示角色',
  `signature` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pos_province` int(11) NOT NULL,
  `pos_city` int(11) NOT NULL,
  `pos_district` int(11) NOT NULL,
  `pos_community` int(11) NOT NULL,
  `score1` double NULL DEFAULT 0 COMMENT '用户积分',
  `score2` double NULL DEFAULT 0 COMMENT 'score2',
  `score3` double NULL DEFAULT 0 COMMENT 'score3',
  `score4` double NULL DEFAULT 0 COMMENT 'score4',
  `con_check` int(11) NOT NULL DEFAULT 0,
  `total_check` int(11) NOT NULL DEFAULT 0,
  `fans` int(11) NOT NULL DEFAULT 0 COMMENT '粉丝数',
  `session_id` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alive_line` int(11) NOT NULL DEFAULT 0 COMMENT '用户禁用时间至该值',
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_manager` tinyint(2) NOT NULL COMMENT '1:是管理员   2:不是管理员',
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `name`(`nickname`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_member
-- ----------------------------
INSERT INTO `ot_member` VALUES (1, 'admin', 1, '0000-00-00', '', 243, 0, 1531127370, 2130706433, 1542707260, 1, 1, 1, 'ea 是', 0, 0, 0, 0, 98, 0, 0, 0, 0, 7, 2, '0qtnv0acieqmlfdgokpfnrdbk2', 0, '123', '', '', 1);
INSERT INTO `ot_member` VALUES (100, '好Vonder标题', 1, '2018-11-02', '', 36, 2101843548, 1535530253, 2130706433, 1539052454, 1, 1, 1, 'ea 是', 510000, 510100, 510107, 0, 44, 0, 0, 0, 0, 1, 2, '8n9v8mq73ggej8il25fgcf6ku5', 0, '', '', '', 1);
INSERT INTO `ot_member` VALUES (101, '春宸俊兮1', 2, '0000-00-00', '', 15, 2130706433, 1536051978, 2130706433, 1536821338, 1, 1, 1, '这是签名12', 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 3, '07mtaolf0c4tv547dfdi0amqc2', 0, '', '', '18140191539', 0);

-- ----------------------------
-- Table structure for ot_menu
-- ----------------------------
DROP TABLE IF EXISTS `ot_menu`;
CREATE TABLE `ot_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序（同级有效）',
  `url` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隐藏',
  `tip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否仅开发者模式可见',
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导航图标',
  `module` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10106 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_menu
-- ----------------------------
INSERT INTO `ot_menu` VALUES (1, '首页', 0, 1, 'Index/index', 0, '', '', 0, 'home', '');
INSERT INTO `ot_menu` VALUES (2, '用户与身份', 0, 2, 'User/index', 0, '', '', 0, 'user', '');
INSERT INTO `ot_menu` VALUES (3, '用户信息', 2, 2, 'User/index', 0, '', '用户配置', 0, '', '');
INSERT INTO `ot_menu` VALUES (4, '积分规则', 197, 3, 'User/action', 0, '', '行为与积分', 0, '', '');
INSERT INTO `ot_menu` VALUES (5, '新增用户行为', 4, 0, 'User/addaction', 0, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (6, '编辑用户行为', 4, 0, 'User/editaction', 0, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (7, '保存用户行为', 4, 0, 'User/saveAction', 0, '\"用户->用户行为\"保存编辑和新增的用户行为', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (8, '变更行为状态', 4, 0, 'User/setStatus', 0, '\"用户->用户行为\"中的启用,禁用和删除权限', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (9, '禁用会员', 4, 0, 'User/changeStatus?method=forbidUser', 0, '\"用户->用户信息\"中的禁用', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (10, '启用会员', 4, 0, 'User/changeStatus?method=resumeUser', 0, '\"用户->用户信息\"中的启用', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (11, '删除会员', 4, 0, 'User/changeStatus?method=deleteUser', 0, '\"用户->用户信息\"中的删除', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (12, '权限组管理', 2, 5, 'AuthManager/index', 0, '', '用户配置', 0, '', '');
INSERT INTO `ot_menu` VALUES (13, '删除', 12, 0, 'AuthManager/changeStatus?method=deleteGroup', 0, '删除权限组', '', 1, '', '');
INSERT INTO `ot_menu` VALUES (14, '禁用', 12, 0, 'AuthManager/changeStatus?method=forbidGroup', 0, '禁用权限组', '', 1, '', '');
INSERT INTO `ot_menu` VALUES (15, '恢复', 12, 0, 'AuthManager/changeStatus?method=resumeGroup', 0, '恢复已禁用的权限组', '', 1, '', '');
INSERT INTO `ot_menu` VALUES (16, '新增', 12, 0, 'AuthManager/createGroup', 0, '创建新的权限组', '', 1, '', '');
INSERT INTO `ot_menu` VALUES (17, '编辑', 12, 0, 'AuthManager/editGroup', 0, '编辑权限组名称和描述', '', 1, '', '');
INSERT INTO `ot_menu` VALUES (18, '保存权限组', 12, 0, 'AuthManager/writeGroup', 0, '新增和编辑权限组的\"保存\"按钮', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (19, '授权', 12, 0, 'AuthManager/group', 0, '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属权限组', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (20, '访问授权', 12, 0, 'AuthManager/access', 0, '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (21, '成员授权', 12, 0, 'AuthManager/user', 0, '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (22, '解除授权', 12, 0, 'AuthManager/removeFromGroup', 0, '\"成员授权\"列表页内的解除授权操作按钮', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (23, '保存成员授权', 12, 0, 'AuthManager/addToGroup', 0, '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (24, '分类授权', 12, 0, 'AuthManager/category', 0, '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (25, '保存分类授权', 12, 0, 'AuthManager/addToCategory', 0, '\"分类授权\"页面的\"保存\"按钮', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (26, '模型授权', 12, 0, 'AuthManager/modelauth', 0, '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (27, '保存模型授权', 12, 0, 'AuthManager/addToModel', 0, '\"分类授权\"页面的\"保存\"按钮', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (28, '新增权限节点', 12, 0, 'AuthManager/addNode', 1, '', '', 1, '', '');
INSERT INTO `ot_menu` VALUES (29, '前台权限管理', 12, 0, 'AuthManager/accessUser', 1, '', '权限管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (30, '删除权限节点', 12, 0, 'AuthManager/deleteNode', 1, '', '', 1, '', '');
INSERT INTO `ot_menu` VALUES (31, '行为日志', 197, 4, 'Action/actionlog', 0, '', '行为与积分', 0, '', '');
INSERT INTO `ot_menu` VALUES (32, '查看行为日志', 31, 0, 'action/edit', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (33, '修改密码', 2, 3, 'User/updatePassword', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (34, '修改昵称', 2, 4, 'User/updateNickname', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (35, '查看用户', 2, 1, 'Rank/userList', 0, '', '头衔管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (36, '用户头衔列表', 35, 0, 'Rank/userRankList', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (37, '关联新头衔', 35, 0, 'Rank/userAddRank', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (38, '编辑头衔关联', 35, 0, 'Rank/userChangeRank', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (39, '扩展资料', 2, 3, 'User/profile', 0, '', '标签与资料', 0, '', '');
INSERT INTO `ot_menu` VALUES (40, '添加、编辑分组', 39, 0, 'Admin/User/editProfile', 0, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (41, '分组排序', 39, 0, 'Admin/User/sortProfile', 0, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (42, '字段列表', 39, 0, 'Admin/User/field', 0, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (43, '添加、编辑字段', 39, 0, 'Admin/User/editFieldSetting', 0, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (44, '字段排序', 39, 0, 'Admin/User/sortField', 0, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (45, '用户扩展资料列表', 2, 7, 'User/expandinfo_select', 0, '', '标签与资料', 0, '', '');
INSERT INTO `ot_menu` VALUES (46, '扩展资料详情', 45, 0, 'User/expandinfo_details', 0, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (47, '待审核用户头衔', 2, 2, 'Rank/rankVerify', 0, '', '头衔管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (48, '被驳回的头衔申请', 2, 3, 'Rank/rankVerifyFailure', 0, '', '头衔管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (49, '转移权限组', 2, 7, 'User/changeGroup', 1, '批量转移权限组', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (50, '基础配置', 2, 1, 'UserConfig/index', 0, '', '用户配置', 0, '', '');
INSERT INTO `ot_menu` VALUES (51, '积分类型', 197, 1, 'User/scoreList', 0, '', '行为与积分', 0, '', '');
INSERT INTO `ot_menu` VALUES (52, '新增/编辑类型', 197, 2, 'User/editScoreType', 1, '', '行为与积分', 0, '', '');
INSERT INTO `ot_menu` VALUES (53, '充值积分', 197, 5, 'User/recharge', 1, '', '', 0, '用户管理', '');
INSERT INTO `ot_menu` VALUES (54, '头衔列表', 2, 6, 'Rank/index', 0, '', '头衔管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (55, '添加头衔', 54, 2, 'Rank/editRank', 1, '', '头衔管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (57, '插件管理', 105, 4, 'Addons/index', 0, '', '本地', 0, '', '');
INSERT INTO `ot_menu` VALUES (58, '钩子管理', 57, 2, 'Addons/hooks', 0, '', '本地', 0, '', '');
INSERT INTO `ot_menu` VALUES (59, '创建', 57, 0, 'Addons/create', 0, '服务器上创建插件结构向导', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (60, '检测创建', 57, 0, 'Addons/checkForm', 0, '检测插件是否可以创建', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (61, '预览', 57, 0, 'Addons/preview', 0, '预览插件定义类文件', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (62, '快速生成插件', 57, 0, 'Addons/build', 0, '开始生成插件结构', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (64, '设置', 57, 0, 'Addons/config', 0, '设置插件配置', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (65, '禁用', 57, 0, 'Addons/disable', 0, '禁用插件', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (66, '启用', 57, 0, 'Addons/enable', 0, '启用插件', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (67, '安装', 57, 0, 'Addons/install', 0, '安装插件', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (68, '卸载', 57, 0, 'Addons/uninstall', 0, '卸载插件', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (69, '更新配置', 57, 0, 'Addons/saveconfig', 0, '更新插件配置处理', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (70, '插件后台列表', 57, 0, 'Addons/adminList', 0, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (71, 'URL方式访问插件', 57, 0, 'Addons/execute', 0, '控制是否有权限通过url访问插件控制器方法', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (72, '新增钩子', 58, 0, 'Addons/addHook', 0, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (73, '编辑钩子', 58, 0, 'Addons/edithook', 0, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (74, '系统', 0, 7, 'Config/group', 0, '', '', 0, 'windows', '');
INSERT INTO `ot_menu` VALUES (75, '网站设置', 74, 1, 'Config/group', 0, '', '网站设置', 0, '', '');
INSERT INTO `ot_menu` VALUES (76, '配置管理', 74, 7, 'Config/index', 0, '', '网站设置', 0, '', '');
INSERT INTO `ot_menu` VALUES (77, '编辑', 76, 0, 'Config/edit', 0, '新增编辑和保存配置', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (78, '删除', 76, 0, 'Config/del', 0, '删除配置', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (79, '新增', 76, 0, 'Config/add', 0, '新增配置', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (80, '保存', 76, 0, 'Config/save', 0, '保存配置', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (81, '排序', 76, 0, 'Config/sort', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (82, '后台菜单管理', 74, 6, 'Menu/index', 0, '', '导航管理', 1, '', '');
INSERT INTO `ot_menu` VALUES (83, '新增', 82, 0, 'Menu/add', 0, '', '系统设置', 0, '', '');
INSERT INTO `ot_menu` VALUES (84, '编辑', 82, 0, 'Menu/edit', 0, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (85, '导入', 82, 0, 'Menu/import', 0, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (86, '排序', 82, 0, 'Menu/sort', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (87, '顶部导航', 74, 3, 'Channel/index', 0, '', '导航管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (88, '新增', 87, 0, 'Channel/add', 0, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (89, '编辑', 87, 0, 'Channel/edit', 0, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (90, '删除', 87, 0, 'Channel/del', 0, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (91, '排序', 87, 0, 'Channel/sort', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (92, '备份数据库', 74, 8, 'Database/index?type=export', 0, '', '网站数据管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (93, '备份', 92, 0, 'Database/export', 0, '备份数据库', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (94, '优化表', 92, 0, 'Database/optimize', 0, '优化数据表', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (95, '修复表', 92, 0, 'Database/repair', 0, '修复数据表', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (96, '还原数据库', 74, 9, 'Database/index?type=import', 0, '', '网站数据管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (97, '恢复', 96, 0, 'Database/import', 0, '数据库恢复', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (98, '删除', 96, 0, 'Database/del', 0, '删除备份文件', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (99, 'SEO规则管理', 197, 8, 'SEO/index', 0, '', 'SEO管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (100, '新增、编辑', 99, 0, 'SEO/editRule', 0, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (101, '排序', 99, 0, 'SEO/sortRule', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (102, 'SEO规则回收站', 197, 9, 'SEO/ruleTrash', 0, '', 'SEO管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (103, '全部补丁', 74, 16, 'Update/quick', 1, '', '升级补丁', 0, '', '');
INSERT INTO `ot_menu` VALUES (104, '新增补丁', 74, 15, 'Update/addpack', 1, '', '升级补丁', 0, '', '');
INSERT INTO `ot_menu` VALUES (105, '扩展', 0, 11, 'Cloud/index', 0, '', '', 0, 'cloud', '');
INSERT INTO `ot_menu` VALUES (106, '模块安装', 105, 3, 'module/install', 1, '', '本地', 0, '', '');
INSERT INTO `ot_menu` VALUES (107, '模块管理', 105, 5, 'module/lists', 0, '', '本地', 0, '', '');
INSERT INTO `ot_menu` VALUES (108, '卸载模块', 105, 7, 'module/uninstall', 1, '', '本地', 0, '', '');
INSERT INTO `ot_menu` VALUES (109, '授权', 0, 6, 'authorize/ssoSetting', 1, '', '', 0, 'lock', '');
INSERT INTO `ot_menu` VALUES (110, '单点登录配置', 109, 0, 'Authorize/ssoSetting', 0, '', '单点登录', 1, '', '');
INSERT INTO `ot_menu` VALUES (111, '应用列表', 109, 0, 'Authorize/ssolist', 0, '', '单点登录', 1, '', '');
INSERT INTO `ot_menu` VALUES (112, '新增/编辑应用', 109, 0, 'authorize/editssoapp', 1, '', '单点登录', 1, '', '');
INSERT INTO `ot_menu` VALUES (114, '用户行为', 197, 6, 'ActionLimit/limitList', 0, '', '行为与积分', 0, '', '');
INSERT INTO `ot_menu` VALUES (115, '新增/编辑行为限制', 197, 7, 'ActionLimit/editLimit', 1, '', '行为与积分', 0, '', '');
INSERT INTO `ot_menu` VALUES (117, '身份列表', 2, 1, 'Role/index', 0, '', '身份管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (118, '编辑身份', 2, 2, 'Role/editRole', 1, '', '身份管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (119, '启用、禁用、删除身份', 2, 3, 'Role/setStatus', 1, '', '身份管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (120, '身份排序', 2, 4, 'Role/sort', 1, '', '身份管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (121, '默认积分配置', 117, 0, 'Role/configScore', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (122, '默认权限配置', 117, 0, 'Role/configAuth', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (123, '默认头像配置', 117, 0, 'Role/configAvatar', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (124, '默认头衔配置', 117, 0, 'Role/configRank', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (125, '默认字段管理', 117, 0, 'Role/configField', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (126, '身份分组', 2, 5, 'Role/group', 0, '', '身份管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (127, '编辑分组', 126, 0, 'Role/editGroup', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (128, '删除分组', 126, 0, 'Role/deleteGroup', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (129, '身份基本信息配置', 2, 6, 'Role/config', 1, '', '身份管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (130, '用户身份归属列表', 2, 7, 'Role/userList', 0, '', '身份管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (131, '设置用户状态', 130, 0, 'Role/setUserStatus', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (132, '审核用户', 130, 0, 'Role/setUserAudit', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (133, '迁移用户', 130, 0, 'Role/changeRole', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (134, '上传默认头像', 123, 0, 'Role/uploadPicture', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (135, '邀请码类型', 197, 8, 'Invite/index', 0, '', '邀请注册管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (136, '邀请码管理', 197, 9, 'Invite/invite', 0, '', '邀请注册管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (138, '兑换记录', 197, 11, 'Invite/buyLog', 0, '', '邀请注册管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (139, '用户邀请记录', 197, 12, 'Invite/inviteLog', 0, '', '邀请注册管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (140, '邀请码列表', 197, 13, 'Invite/userInfo', 0, '', '邀请注册管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (141, '编辑邀请注册类型', 135, 0, 'Invite/edit', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (142, '删除邀请', 135, 0, 'Invite/setStatus', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (143, '删除邀请码', 136, 0, 'Invite/delete', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (144, '生成邀请码', 136, 0, 'Invite/createCode', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (145, '删除无用邀请码', 136, 0, 'Invite/deleteTrue', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (146, '导出cvs', 136, 0, 'Invite/cvs', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (147, '用户信息编辑', 140, 0, 'Invite/editUserInfo', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (148, '删除日志', 31, 0, 'Action/remove', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (149, '清空日志', 31, 0, 'Action/clear', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (150, '设置积分状态', 51, 0, 'User/setTypeStatus', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (151, '删除积分类型', 51, 0, 'User/delType', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (152, '充值积分-获取用户昵称', 53, 0, 'User/getNickname', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (153, '删除菜单', 82, 0, 'Menu/del', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (154, '设置开发者模式可见', 82, 0, 'Menu/toogleDev', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (155, '设置显示隐藏', 82, 0, 'Menu/toogleHide', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (156, '行为限制启用、禁用、删除', 114, 0, 'ActionLimit/setLimitStatus', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (157, '启用、禁用、删除、回收站还原', 99, 0, 'SEO/setRuleStatus', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (158, '回收站彻底删除', 102, 0, 'SEO/doClear', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (159, '初始化无角色用户', 130, 0, 'Role/initUnhaveUser', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (160, '删除钩子', 58, 0, 'Addons/delHook', 0, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (161, '使用补丁', 103, 0, 'Update/usePack', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (162, '查看补丁', 103, 0, 'Update/view', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (163, '删除补丁', 103, 0, 'Update/delPack', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (164, '用户标签列表', 2, 4, 'UserTag/userTag', 0, '', '标签与资料', 0, '', '');
INSERT INTO `ot_menu` VALUES (165, '添加分类、标签', 164, 0, 'UserTag/add', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (166, '设置分类、标签状态', 164, 0, 'UserTag/setStatus', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (167, '分类、标签回收站', 164, 0, 'UserTag/tagTrash', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (168, '测底删除回收站内容', 164, 0, 'UserTag/userTagClear', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (169, '可拥有标签配置', 2, 14, 'role/configusertag', 1, '', '标签与资料', 0, '', '');
INSERT INTO `ot_menu` VALUES (170, '编辑模块', 107, 0, 'Module/edit', 1, '', '模块管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (171, '网站信息', 74, 2, 'Config/website', 0, '', '网站设置', 0, '', '');
INSERT INTO `ot_menu` VALUES (172, '主题管理', 105, 6, 'Theme/tpls', 0, '', '本地', 0, '', '');
INSERT INTO `ot_menu` VALUES (173, '使用主题', 105, 8, 'Theme/setTheme', 1, '', '本地', 0, '', '');
INSERT INTO `ot_menu` VALUES (174, '查看主题', 105, 9, 'Theme/lookTheme', 1, '', '本地', 0, '', '');
INSERT INTO `ot_menu` VALUES (175, '主题打包下载', 105, 10, 'Theme/packageDownload', 1, '', '本地', 0, '', '');
INSERT INTO `ot_menu` VALUES (176, '卸载删除主题', 105, 11, 'Theme/delete', 1, '', '本地', 0, '', '');
INSERT INTO `ot_menu` VALUES (177, '上传安装主题', 105, 12, 'Theme/add', 1, '', '本地', 0, '', '');
INSERT INTO `ot_menu` VALUES (178, '云市场', 105, 1, 'Cloud/index', 0, '', '云市场', 0, '', '');
INSERT INTO `ot_menu` VALUES (197, '运营', 0, 4, 'Super_links/index', 0, '', '', 0, 'laptop', '');
INSERT INTO `ot_menu` VALUES (198, '群发消息用户列表', 74, 99, 'message/userList', 0, '', '群发消息', 0, '', '');
INSERT INTO `ot_menu` VALUES (199, '群发消息', 197, 5, 'message/sendMessage', 1, '', '群发消息', 0, '', '');
INSERT INTO `ot_menu` VALUES (200, '在线安装', 178, 0, 'Cloud/install', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (201, '重置用户密码', 3, 0, 'User/initpass', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (202, '自动升级', 105, 2, 'Cloud/update', 0, '', '云市场', 0, '', '');
INSERT INTO `ot_menu` VALUES (203, '获取版本信息', 202, 0, 'Cloud/version', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (204, '获取文件列表', 202, 0, 'Cloud/getFileList', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (205, '比较本地文件', 202, 0, 'Cloud/compare', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (206, '覆盖文件', 202, 0, 'Cloud/cover', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (207, '更新数据库', 202, 0, 'Cloud/updb', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (208, '更新完成', 202, 0, 'Cloud/finish', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (209, '表情设置', 197, 4, 'Expression/index', 0, '', '表情管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (210, '添加表情包', 197, 5, 'Expression/add', 1, '', '表情管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (211, '表情包列表', 197, 6, 'Expression/package', 0, '', '表情管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (212, '表情列表', 197, 7, 'Expression/expressionList', 1, '', '表情管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (213, '删除表情包', 197, 8, 'Expression/delPackage', 1, '', '表情管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (214, '编辑表情包', 197, 9, 'Expression/editPackage', 1, '', '表情管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (215, '删除表情', 197, 10, 'Expression/delExpression', 1, '', '表情管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (216, '上传表情包', 197, 11, 'Expression/upload', 1, '', '表情管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (217, '用户头衔审核', 47, 2, 'Rank/setVerifyStatus', 1, '', '头衔管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (218, '获取扩展升级列表', 106, 0, 'Cloud/getVersionList', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (219, '自动升级', 178, 0, 'Cloud/updateGoods', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (220, '自动升级1-获取文件列表', 178, 0, 'Cloud/Updating1', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (221, '自动升级2-比较文件', 178, 0, 'Cloud/Updating2', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (222, '自动升级3-升级代码', 178, 0, 'Cloud/updating3', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (223, '自动升级4-导入数据库', 178, 0, 'Cloud/updating4', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (224, '自动升级5-重置版本号', 178, 0, 'Cloud/updating5', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (231, '用户导航', 74, 0, 'Channel/user', 0, '', '导航管理', 0, '', 'Core');
INSERT INTO `ot_menu` VALUES (232, '积分日志', 197, 0, 'Action/scoreLog', 0, '', '行为与积分', 0, '', '');
INSERT INTO `ot_menu` VALUES (233, '仪表盘', 1, 1, 'Index/index', 0, '', '系统首页', 0, '', '');
INSERT INTO `ot_menu` VALUES (234, '数据概览', 1, 2, 'Index/stats', 0, '', '系统首页', 0, '', '');
INSERT INTO `ot_menu` VALUES (239, '会话列表', 74, 0, 'Message/messageSessionList', 0, '', '消息管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (240, '会话模板', 74, 0, 'Message/messageTplList', 0, '', '消息管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (241, '刷新会话列表', 74, 0, 'Message/sessionRefresh', 1, '', '消息管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (242, '刷新会话模板列表', 74, 0, 'Message/tplRefresh', 1, '', '消息管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (243, '计划任务列表', 74, 99, 'admin/schedule/scheduleList', 0, '', '计划任务', 0, '', '');
INSERT INTO `ot_menu` VALUES (244, '新增/编辑计划任务', 243, 0, 'Schedule/editSchedule', 1, '', '计划任务', 0, '', '');
INSERT INTO `ot_menu` VALUES (245, '运行/停止计划任务', 243, 0, 'admin/schedule/run', 1, '', '计划任务', 0, '', '');
INSERT INTO `ot_menu` VALUES (246, '查看日志', 243, 0, 'Schedule/showLog', 1, '', '计划任务', 0, '', '');
INSERT INTO `ot_menu` VALUES (247, '清空日志', 243, 0, 'admin/schedule/clearLog', 1, '', '计划任务', 0, '', '');
INSERT INTO `ot_menu` VALUES (248, '重启计划任务', 243, 0, 'Schedule/reRun', 1, '', '计划任务', 0, '', '');
INSERT INTO `ot_menu` VALUES (249, '设置计划任务状态', 243, 0, 'Schedule/setScheduleStatus', 1, '', '计划任务', 0, '', '');
INSERT INTO `ot_menu` VALUES (250, '网站统计', 1, 3, 'Count/index', 0, '', '数据统计', 0, '', '');
INSERT INTO `ot_menu` VALUES (251, '流失率统计', 1, 4, 'Count/lost', 0, '', '数据统计', 0, '', '');
INSERT INTO `ot_menu` VALUES (252, '留存率统计', 1, 5, 'Count/remain', 0, '', '数据统计', 0, '', '');
INSERT INTO `ot_menu` VALUES (253, '充值用户统计', 1, 6, 'Count/consumption', 0, '', '数据统计', 0, '', '');
INSERT INTO `ot_menu` VALUES (254, '活跃用户统计', 1, 7, 'Count/active', 0, '', '数据统计', 0, '', '');
INSERT INTO `ot_menu` VALUES (255, '设置活跃度绑定的行为', 1, 0, 'Count/setActiveAction', 1, '', '数据统计', 0, '', '');
INSERT INTO `ot_menu` VALUES (256, '在线用户列表', 1, 8, 'Count/nowUserList', 0, '', '数据统计', 0, '', '');
INSERT INTO `ot_menu` VALUES (257, '下线在线用户', 1, 0, 'Count/downUser', 1, '', '数据统计', 0, '', '');
INSERT INTO `ot_menu` VALUES (258, '会话设置', 74, 0, 'Message/config', 0, '', '消息管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (259, '频道编辑', 87, 0, 'Channel/customEdit', 0, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (260, '添加', 233, 0, 'Index/addTo', 0, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (261, '删除', 233, 0, 'Index/delTile', 0, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (262, '修改', 233, 0, 'Index/setTile', 0, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (263, '友情链接', 197, 0, 'SuperLinks/index', 0, '', '友链与公告', 0, '', '');
INSERT INTO `ot_menu` VALUES (264, '图片水印设置', 197, 0, 'Picture/config', 0, '', '图片管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (265, '上传水印图片', 264, 0, 'Picture/uploadWater', 1, '', '图片管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (266, '图片列表', 197, 0, 'Picture/pictureList', 0, '', '图片管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (267, '设置图片状态、删除图片', 266, 0, 'Picture/setStatus', 1, '', '图片管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (268, '敏感词列表', 197, 0, 'Sensitive/index', 0, '', '敏感词', 0, '', '');
INSERT INTO `ot_menu` VALUES (269, '敏感词设置', 197, 0, 'Sensitive/config', 0, '', '敏感词', 0, '', '');
INSERT INTO `ot_menu` VALUES (270, '批量添加', 197, 0, 'Sensitive/addMore', 0, '', '敏感词', 0, '', '');
INSERT INTO `ot_menu` VALUES (271, '新增、编辑敏感词', 268, 0, 'Sensitive/edit', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (272, '设置敏感词状态', 268, 0, 'Sensitive/setStatus', 1, '', '', 0, '', '');
INSERT INTO `ot_menu` VALUES (273, '自定义表情列表', 197, 0, 'Expression/iexpressionList', 0, '', '表情管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (274, '允许身份访问', 1, 0, 'Role/moduleRole', 0, '', '模块权限', 0, '', '');
INSERT INTO `ot_menu` VALUES (10104, '认证管理', 10102, 1, 'Attest/attestTypes', 0, '', '认证管理', 0, '', 'Attest');
INSERT INTO `ot_menu` VALUES (10105, '权限组管理', 10000, 0, '	AuthManager/index', 0, '', '用户与身份', 0, '', 'Home');
INSERT INTO `ot_menu` VALUES (10103, '认证列表', 10102, 0, 'Attest/attestList', 0, '', '认证管理', 0, '', 'Attest');
INSERT INTO `ot_menu` VALUES (10102, '认证中心', 0, 5, 'Attest/attestList', 1, '', '', 0, '', 'Attest');
INSERT INTO `ot_menu` VALUES (281, '微信绑定', 2, 0, 'User/bindwechat', 0, '', '用户配置', 0, '', '');
INSERT INTO `ot_menu` VALUES (282, '短信日志', 197, 4, 'Action/smslog', 0, '', '行为与积分', 0, '', '');
INSERT INTO `ot_menu` VALUES (283, '编辑器配置', 74, 7, 'EditorTool/config', 0, '', '系统设置', 0, '', '');
INSERT INTO `ot_menu` VALUES (284, 'MarkDown配置', 74, 7, 'MarkDown/config', 0, '', '系统设置', 0, '', '');
INSERT INTO `ot_menu` VALUES (285, '消息模板', 74, 0, 'Message/listMessageEvent', 0, '', '消息管理', 0, '', '');
INSERT INTO `ot_menu` VALUES (10000, '网站主页', 0, 0, 'Home/config', 1, '', '', 0, 'home', 'Home');
INSERT INTO `ot_menu` VALUES (10001, '基本设置', 10000, 0, 'Home/config', 0, '', '设置', 0, '', 'Home');
INSERT INTO `ot_menu` VALUES (10019, '基本设置', 10018, 0, 'Home/config', 0, '', '设置', 0, '', 'Home');
INSERT INTO `ot_menu` VALUES (10021, '基本设置', 10020, 0, 'Home/config', 0, '', '设置', 0, '', 'Home');
INSERT INTO `ot_menu` VALUES (10023, '基本设置', 10022, 0, 'Home/config', 0, '', '设置', 0, '', 'Home');
INSERT INTO `ot_menu` VALUES (10093, '作品新增', 10073, 0, 'Weibo/addWeibo', 1, '', '', 0, '', 'Weibo');
INSERT INTO `ot_menu` VALUES (10092, '飞手管理', 10073, 7, 'Weibo/player', 0, '', '飞手', 0, '', 'Weibo');
INSERT INTO `ot_menu` VALUES (10088, '机构管理', 10073, 5, 'Weibo/organization', 0, '', '机构', 0, '', 'Weibo');
INSERT INTO `ot_menu` VALUES (10087, '行业管理', 10073, 3, 'Weibo/industry', 0, '', '行业', 0, '', 'Weibo');
INSERT INTO `ot_menu` VALUES (10086, '删除话题', 10073, 0, 'Weibo/delTopic', 1, '', '', 0, '', 'Weibo');
INSERT INTO `ot_menu` VALUES (10085, '设置置顶话题', 10073, 0, 'Weibo/setTopicTop', 1, '', '', 0, '', 'Weibo');
INSERT INTO `ot_menu` VALUES (10083, '设置微博状态', 10073, 0, 'Weibo/setWeiboStatus', 1, '', '', 0, '', 'Weibo');
INSERT INTO `ot_menu` VALUES (10084, '设置微博评论状态', 10073, 0, 'Weibo/setCommentStatus', 1, '', '', 0, '', 'Weibo');
INSERT INTO `ot_menu` VALUES (10081, '分类管理', 10073, 0, 'Weibo/topic', 0, '微博的话题', '分类管理', 0, '', 'Weibo');
INSERT INTO `ot_menu` VALUES (10082, '置顶微博', 10073, 0, 'Weibo/setWeiboTop', 1, '', '', 0, '', 'Weibo');
INSERT INTO `ot_menu` VALUES (10080, '作品设置', 10073, 0, 'Weibo/config', 1, '微博的基本配置', '设置', 1, '', 'Weibo');
INSERT INTO `ot_menu` VALUES (10079, '回复回收站', 10073, 10, 'Weibo/commentTrash', 0, '', '回复', 0, '', 'Weibo');
INSERT INTO `ot_menu` VALUES (10078, '作品回收站', 10073, 2, 'Weibo/weiboTrash', 0, '', '作品', 0, '', 'Weibo');
INSERT INTO `ot_menu` VALUES (10077, '编辑回复', 10073, 0, 'Weibo/editComment', 1, '', '', 0, '', 'Weibo');
INSERT INTO `ot_menu` VALUES (10076, '编辑微博', 10073, 0, 'Weibo/editWeibo', 1, '', '', 0, '', 'Weibo');
INSERT INTO `ot_menu` VALUES (10074, '作品管理', 10073, 1, 'Weibo/weibo', 0, '', '作品', 0, '', 'Weibo');
INSERT INTO `ot_menu` VALUES (10075, '回复管理', 10073, 9, 'Weibo/comment', 0, '', '回复', 0, '', 'Weibo');
INSERT INTO `ot_menu` VALUES (10073, '作品', 0, 8, 'Weibo/weibo', 1, '', '', 0, '', 'Weibo');

-- ----------------------------
-- Table structure for ot_message
-- ----------------------------
DROP TABLE IF EXISTS `ot_message`;
CREATE TABLE `ot_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `from_uid` int(11) NOT NULL,
  `to_uid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `is_read` tinyint(4) NOT NULL,
  `last_toast` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息类型',
  `tpl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息模板',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_message
-- ----------------------------
INSERT INTO `ot_message` VALUES (62, 8, 0, 0, 1542687216, 1, 1542687373, 1, 'announce', '');
INSERT INTO `ot_message` VALUES (3, 63, 100, 1, 1535530267, 1, 1535530454, 1, 'Ucenter', '');
INSERT INTO `ot_message` VALUES (4, 64, 100, 1, 1535530268, 1, 1535530454, 1, 'Ucenter', '');
INSERT INTO `ot_message` VALUES (5, 67, 100, 1, 1535530381, 1, 1535530454, 1, 'Weibo', 'Common_comment');
INSERT INTO `ot_message` VALUES (6, 80, 1, 100, 1535605379, 1, 1535708071, 1, 'Ucenter', '');
INSERT INTO `ot_message` VALUES (7, 81, 1, 100, 1535605390, 1, 1535708071, 1, 'Ucenter', '');
INSERT INTO `ot_message` VALUES (8, 96, 1, 100, 1535614436, 1, 1535708071, 1, 'Weibo', 'Common_comment');
INSERT INTO `ot_message` VALUES (9, 135, 101, 100, 1536051992, 1, 1536052012, 1, 'Ucenter', '');
INSERT INTO `ot_message` VALUES (10, 136, 100, 101, 1536052030, 1, 1536053913, 1, 'Ucenter', '');
INSERT INTO `ot_message` VALUES (11, 139, 101, 1, 1536119955, 1, 1536135749, 1, 'Ucenter', '');
INSERT INTO `ot_message` VALUES (12, 164, 1, 101, 1536226818, 1, 1536303412, 1, 'Ucenter', '');
INSERT INTO `ot_message` VALUES (13, 165, 1, 101, 1536226828, 1, 1536303412, 1, 'Ucenter', '');
INSERT INTO `ot_message` VALUES (14, 166, 1, 101, 1536226831, 1, 1536303412, 1, 'Ucenter', '');
INSERT INTO `ot_message` VALUES (15, 167, 1, 100, 1536226848, 0, 0, 1, 'Ucenter', '');
INSERT INTO `ot_message` VALUES (16, 168, 1, 100, 1536226850, 0, 0, 1, 'Ucenter', '');
INSERT INTO `ot_message` VALUES (17, 169, 1, 100, 1536226851, 0, 0, 1, 'Ucenter', '');
INSERT INTO `ot_message` VALUES (18, 170, 1, 100, 1536226855, 0, 0, 1, 'Ucenter', '');
INSERT INTO `ot_message` VALUES (19, 173, 101, 1, 1536303423, 1, 1536546653, 1, 'Ucenter', '');
INSERT INTO `ot_message` VALUES (20, 174, 101, 1, 1536303429, 1, 1536546653, 1, 'Ucenter', '');
INSERT INTO `ot_message` VALUES (21, 227, 1, 101, 1537952929, 0, 0, 1, 'Ucenter', '');
INSERT INTO `ot_message` VALUES (22, 228, 1, 100, 1537952930, 0, 0, 1, 'Ucenter', '');
INSERT INTO `ot_message` VALUES (23, 229, 1, 101, 1537952940, 0, 0, 1, 'Ucenter', '');
INSERT INTO `ot_message` VALUES (24, 230, 1, 100, 1537952941, 0, 0, 1, 'Ucenter', '');
INSERT INTO `ot_message` VALUES (25, 231, 1, 100, 1537952945, 0, 0, 1, 'Ucenter', '');
INSERT INTO `ot_message` VALUES (26, 232, 1, 100, 1537952947, 0, 0, 1, 'Ucenter', '');
INSERT INTO `ot_message` VALUES (27, 233, 1, 101, 1538018730, 0, 0, 1, 'Ucenter', '');
INSERT INTO `ot_message` VALUES (28, 248, 1, 100, 1542357999, 0, 0, 1, 'follow', '');
INSERT INTO `ot_message` VALUES (29, 249, 1, 100, 1542358002, 0, 0, 1, 'follow', '');
INSERT INTO `ot_message` VALUES (30, 250, 1, 100, 1542358005, 0, 0, 1, 'follow', '');
INSERT INTO `ot_message` VALUES (31, 251, 1, 100, 1542358099, 0, 0, 1, 'follow', '');
INSERT INTO `ot_message` VALUES (32, 252, 1, 100, 1542358111, 0, 0, 1, 'follow', '');
INSERT INTO `ot_message` VALUES (33, 253, 1, 100, 1542358112, 0, 0, 1, 'follow', '');
INSERT INTO `ot_message` VALUES (34, 254, 1, 100, 1542358114, 0, 0, 1, 'follow', '');
INSERT INTO `ot_message` VALUES (35, 255, 1, 100, 1542358115, 0, 0, 1, 'follow', '');
INSERT INTO `ot_message` VALUES (36, 256, 1, 100, 1542358668, 0, 0, 1, 'follow', '');
INSERT INTO `ot_message` VALUES (37, 257, 100, 15, 1542358765, 0, 0, 1, 'support', '');
INSERT INTO `ot_message` VALUES (38, 258, 100, 15, 1542358768, 0, 0, 1, 'support', '');
INSERT INTO `ot_message` VALUES (39, 0, 100, 15, 1542358921, 0, 0, 1, 'support', '');
INSERT INTO `ot_message` VALUES (40, 259, 100, 15, 1542359009, 0, 0, 1, 'support', '');
INSERT INTO `ot_message` VALUES (41, 260, 100, 15, 1542359031, 0, 0, 1, 'support', '');
INSERT INTO `ot_message` VALUES (42, 261, 100, 15, 1542359032, 0, 0, 1, 'support', '');
INSERT INTO `ot_message` VALUES (43, 262, 100, 15, 1542359033, 0, 0, 1, 'support', '');
INSERT INTO `ot_message` VALUES (44, 263, 100, 15, 1542359034, 0, 0, 1, 'support', '');
INSERT INTO `ot_message` VALUES (45, 264, 100, 15, 1542359035, 0, 0, 1, 'support', '');
INSERT INTO `ot_message` VALUES (46, 265, 100, 15, 1542359035, 0, 0, 1, 'support', '');
INSERT INTO `ot_message` VALUES (47, 266, 100, 15, 1542359036, 0, 0, 1, 'support', '');
INSERT INTO `ot_message` VALUES (48, 267, 100, 15, 1542359036, 0, 0, 1, 'support', '');
INSERT INTO `ot_message` VALUES (49, 268, 1, 109, 1542360408, 0, 0, 1, 'comment', '');
INSERT INTO `ot_message` VALUES (50, 269, 1, 109, 1542360471, 0, 0, 1, 'comment', '');
INSERT INTO `ot_message` VALUES (51, 270, 1, 109, 1542360536, 0, 0, 1, 'comment', '');
INSERT INTO `ot_message` VALUES (52, 275, 1, 100, 1542608574, 0, 0, 1, 'follow', '');
INSERT INTO `ot_message` VALUES (53, 276, 1, 100, 1542608578, 0, 0, 1, 'follow', '');
INSERT INTO `ot_message` VALUES (54, 277, 1, 100, 1542608673, 0, 0, 1, 'follow', '');
INSERT INTO `ot_message` VALUES (55, 278, 1, 100, 1542608703, 0, 0, 1, 'follow', '');
INSERT INTO `ot_message` VALUES (56, 279, 1, 109, 1542619710, 0, 0, 1, 'support', '');
INSERT INTO `ot_message` VALUES (57, 280, 1, 1, 1542619820, 0, 0, 1, 'support', '');
INSERT INTO `ot_message` VALUES (58, 281, 1, 1, 1542620004, 0, 0, 1, 'support', '');
INSERT INTO `ot_message` VALUES (59, 282, 1, 1, 1542620004, 0, 0, 1, 'support', '');
INSERT INTO `ot_message` VALUES (60, 283, 1, 109, 1542620097, 0, 0, 1, 'comment', '');
INSERT INTO `ot_message` VALUES (61, 284, 1, 1, 1542620198, 0, 0, 1, 'comment', '');

-- ----------------------------
-- Table structure for ot_message_content
-- ----------------------------
DROP TABLE IF EXISTS `ot_message_content`;
CREATE TABLE `ot_message_content`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `args` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 285 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_message_content
-- ----------------------------
INSERT INTO `ot_message_content` VALUES (63, 100, '粉丝数增加', 'Vonder 关注了你。', 'Ucenter/Index/index', '{\"uid\":\"100\"}', 'Ucenter', 1535530267, 1);
INSERT INTO `ot_message_content` VALUES (64, 100, 'Vonder赞了您', '有人赞了您的微博，快去看看吧^……^！', 'weibo/index/weibodetail', '{\"id\":\"7\"}', 'Ucenter', 1535530268, 1);
INSERT INTO `ot_message_content` VALUES (65, 100, 'Vonder赞了您', '有人赞了您的微博，快去看看吧^……^！http://demo.xinjmc.com/opensns/index.php?s=/weibo/index/weibodetail/id/7.html', 'weibo/index/weibodetail', '{\"id\":\"7\"}', 'Common_mobile', 1535530268, 1);
INSERT INTO `ot_message_content` VALUES (66, 100, 'Vonder赞了您', '有人赞了您的微博，快去看看吧^……^！http://demo.xinjmc.com/opensns/index.php?s=/weibo/index/weibodetail/id/7.html', 'weibo/index/weibodetail', '{\"id\":\"7\"}', 'Common_email', 1535530268, 1);
INSERT INTO `ot_message_content` VALUES (67, 100, 'Vonder@了您', '{\"keyword1\":\"\\u53d1\\u5e03\\u52a8\\u6001\\u65f6@\\u4e86\\u4f60\\uff1a\",\"keyword2\":\"\",\"keyword3\":\"<span ucard=\\\"1\\\">@admin<\\/span>\\u53ef\\u4ee5\\u4e48?\"}', 'Weibo/Index/weiboDetail', '{\"id\":8}', 'Weibo', 1535530381, 1);
INSERT INTO `ot_message_content` VALUES (68, 100, 'Vonder@了您', '有人@了您，快去看看吧^……^！http://demo.xinjmc.com/opensns/index.php?s=/weibo/index/weibodetail/id/8.html', 'Weibo/Index/weiboDetail', '{\"id\":8}', 'Common_mobile', 1535530381, 1);
INSERT INTO `ot_message_content` VALUES (69, 100, 'Vonder@了您', '有人@了您，快去看看吧^……^！http://demo.xinjmc.com/opensns/index.php?s=/weibo/index/weibodetail/id/8.html', 'Weibo/Index/weiboDetail', '{\"id\":8}', 'Common_email', 1535530381, 1);
INSERT INTO `ot_message_content` VALUES (135, 101, '粉丝数增加', 'wangdi 关注了你。', 'Ucenter/Index/index', '{\"uid\":\"101\"}', 'Ucenter', 1536051992, 1);
INSERT INTO `ot_message_content` VALUES (136, 100, '粉丝数增加', 'Vonder 关注了你。', 'Ucenter/Index/index', '{\"uid\":\"100\"}', 'Ucenter', 1536052030, 1);
INSERT INTO `ot_message_content` VALUES (137, 101, 'wangdi@了您', '有人@了您，快去看看吧^……^！http://www.demo.com/index.php?s=/weibo/index/weibodetail/id/27.html', 'Weibo/Index/weiboDetail', '{\"id\":27}', 'Common_mobile', 1536053924, 1);
INSERT INTO `ot_message_content` VALUES (138, 101, 'wangdi@了您', '有人@了您，快去看看吧^……^！http://www.demo.com/index.php?s=/weibo/index/weibodetail/id/27.html', 'Weibo/Index/weiboDetail', '{\"id\":27}', 'Common_email', 1536053924, 1);
INSERT INTO `ot_message_content` VALUES (139, 101, '粉丝数增加', 'wangdi 关注了你。', 'Ucenter/Index/index', '{\"uid\":\"101\"}', 'Ucenter', 1536119955, 1);
INSERT INTO `ot_message_content` VALUES (140, 100, 'Vonder@了您', '有人@了您，快去看看吧^……^！http://www.demo.com/index.php?s=/weibo/index/weibodetail/id/31.html', 'Weibo/Index/weiboDetail', '{\"id\":31}', 'Common_mobile', 1536133228, 1);
INSERT INTO `ot_message_content` VALUES (141, 100, 'Vonder@了您', '有人@了您，快去看看吧^……^！http://www.demo.com/index.php?s=/weibo/index/weibodetail/id/31.html', 'Weibo/Index/weiboDetail', '{\"id\":31}', 'Common_email', 1536133228, 1);
INSERT INTO `ot_message_content` VALUES (142, 100, 'Vonder@了您', '有人@了您，快去看看吧^……^！http://www.demo.com/index.php?s=/weibo/index/weibodetail/id/32.html', 'Weibo/Index/weiboDetail', '{\"id\":32}', 'Common_mobile', 1536134600, 1);
INSERT INTO `ot_message_content` VALUES (143, 100, 'Vonder@了您', '有人@了您，快去看看吧^……^！http://www.demo.com/index.php?s=/weibo/index/weibodetail/id/32.html', 'Weibo/Index/weiboDetail', '{\"id\":32}', 'Common_email', 1536134600, 1);
INSERT INTO `ot_message_content` VALUES (164, 1, '粉丝数增加', '系统推荐用户 admin 关注了你。', 'Ucenter/Index/index', '{\"uid\":1}', 'Ucenter', 1536226818, 1);
INSERT INTO `ot_message_content` VALUES (165, 1, '粉丝数减少', 'admin 取消了对你的关注。', 'Ucenter/Index/index', '{\"uid\":\"1\"}', 'Ucenter', 1536226828, 1);
INSERT INTO `ot_message_content` VALUES (166, 1, '粉丝数增加', '系统推荐用户 admin 关注了你。', 'Ucenter/Index/index', '{\"uid\":1}', 'Ucenter', 1536226831, 1);
INSERT INTO `ot_message_content` VALUES (167, 1, '粉丝数减少', 'admin 取消了对你的关注。', 'Ucenter/Index/index', '{\"uid\":\"1\"}', 'Ucenter', 1536226848, 1);
INSERT INTO `ot_message_content` VALUES (168, 1, '粉丝数增加', 'admin 关注了你。', 'Ucenter/Index/index', '{\"uid\":\"1\"}', 'Ucenter', 1536226850, 1);
INSERT INTO `ot_message_content` VALUES (169, 1, '粉丝数减少', 'admin 取消了对你的关注。', 'Ucenter/Index/index', '{\"uid\":\"1\"}', 'Ucenter', 1536226851, 1);
INSERT INTO `ot_message_content` VALUES (170, 1, '粉丝数增加', '系统推荐用户 admin 关注了你。', 'Ucenter/Index/index', '{\"uid\":1}', 'Ucenter', 1536226855, 1);
INSERT INTO `ot_message_content` VALUES (173, 101, '粉丝数减少', 'wangdi 取消了对你的关注。', 'Ucenter/Index/index', '{\"uid\":\"101\"}', 'Ucenter', 1536303423, 1);
INSERT INTO `ot_message_content` VALUES (174, 101, '粉丝数增加', 'wangdi 关注了你。', 'Ucenter/Index/index', '{\"uid\":\"101\"}', 'Ucenter', 1536303429, 1);
INSERT INTO `ot_message_content` VALUES (248, 1, '1关注了100', '', '', '{\"uid\":\"100\"}', 'follow', 1542357999, 1);
INSERT INTO `ot_message_content` VALUES (249, 1, '1取消关注了100', '', '', '{\"uid\":\"100\"}', 'follow', 1542358002, 1);
INSERT INTO `ot_message_content` VALUES (250, 1, '1关注了100', '', '', '{\"uid\":\"100\"}', 'follow', 1542358005, 1);
INSERT INTO `ot_message_content` VALUES (251, 1, '取消关注了', '', '', '{\"uid\":\"100\"}', 'follow', 1542358099, 1);
INSERT INTO `ot_message_content` VALUES (252, 1, '关注了', '', '', '{\"uid\":\"100\"}', 'follow', 1542358111, 1);
INSERT INTO `ot_message_content` VALUES (253, 1, '取消关注了', '', '', '{\"uid\":\"100\"}', 'follow', 1542358112, 1);
INSERT INTO `ot_message_content` VALUES (254, 1, '关注了', '', '', '{\"uid\":\"100\"}', 'follow', 1542358114, 1);
INSERT INTO `ot_message_content` VALUES (255, 1, '取消关注了', '', '', '{\"uid\":\"100\"}', 'follow', 1542358115, 1);
INSERT INTO `ot_message_content` VALUES (256, 1, '关注', '', '', '{\"uid\":\"100\"}', 'follow', 1542358668, 1);
INSERT INTO `ot_message_content` VALUES (257, 100, '喜欢', '', '', '{\"weibo_id\":15}', 'support', 1542358765, 1);
INSERT INTO `ot_message_content` VALUES (258, 100, '取消喜欢', '', '', '{\"weibo_id\":15}', 'support', 1542358768, 1);
INSERT INTO `ot_message_content` VALUES (259, 100, '喜欢', '', '', '{\"weibo_id\":15}', 'support', 1542359009, 1);
INSERT INTO `ot_message_content` VALUES (260, 100, '喜欢', '', '', '{\"weibo_id\":15}', 'support', 1542359031, 1);
INSERT INTO `ot_message_content` VALUES (261, 100, '取消喜欢', '', '', '{\"weibo_id\":15}', 'support', 1542359032, 1);
INSERT INTO `ot_message_content` VALUES (262, 100, '喜欢', '', '', '{\"weibo_id\":15}', 'support', 1542359033, 1);
INSERT INTO `ot_message_content` VALUES (263, 100, '取消喜欢', '', '', '{\"weibo_id\":15}', 'support', 1542359034, 1);
INSERT INTO `ot_message_content` VALUES (264, 100, '喜欢', '', '', '{\"weibo_id\":15}', 'support', 1542359035, 1);
INSERT INTO `ot_message_content` VALUES (265, 100, '取消喜欢', '', '', '{\"weibo_id\":15}', 'support', 1542359035, 1);
INSERT INTO `ot_message_content` VALUES (266, 100, '喜欢', '', '', '{\"weibo_id\":15}', 'support', 1542359036, 1);
INSERT INTO `ot_message_content` VALUES (267, 100, '取消喜欢', '', '', '{\"weibo_id\":15}', 'support', 1542359036, 1);
INSERT INTO `ot_message_content` VALUES (268, 1, '回复', '', '', '{\"weibo_id\":109,\"comment_id\":22}', 'comment', 1542360408, 1);
INSERT INTO `ot_message_content` VALUES (269, 1, '回复', '', '', '{\"weibo_id\":109,\"comment_id\":23}', 'comment', 1542360471, 1);
INSERT INTO `ot_message_content` VALUES (270, 1, '回复', '', '', '{\"weibo_id\":109,\"comment_id\":24}', 'comment', 1542360536, 1);
INSERT INTO `ot_message_content` VALUES (275, 1, '取消关注', '', '', '{\"uid\":\"100\"}', 'follow', 1542608574, 1);
INSERT INTO `ot_message_content` VALUES (276, 1, '关注', '', '', '{\"uid\":\"100\"}', 'follow', 1542608578, 1);
INSERT INTO `ot_message_content` VALUES (277, 1, '取消关注', '', '', '{\"uid\":\"100\"}', 'follow', 1542608673, 1);
INSERT INTO `ot_message_content` VALUES (278, 1, '关注', '', '', '{\"uid\":\"100\"}', 'follow', 1542608703, 1);
INSERT INTO `ot_message_content` VALUES (279, 1, '喜欢', '', '', '{\"weibo_id\":109}', 'support', 1542619710, 1);
INSERT INTO `ot_message_content` VALUES (280, 1, '取消喜欢', '', '', '{\"weibo_id\":109}', 'support', 1542619820, 1);
INSERT INTO `ot_message_content` VALUES (281, 1, '喜欢', '', '', '{\"weibo_id\":109}', 'support', 1542620004, 1);
INSERT INTO `ot_message_content` VALUES (282, 1, '取消喜欢', '', '', '{\"weibo_id\":109}', 'support', 1542620004, 1);
INSERT INTO `ot_message_content` VALUES (283, 1, '回复', '', '', '{\"weibo_id\":109,\"comment_id\":25}', 'comment', 1542620097, 1);
INSERT INTO `ot_message_content` VALUES (284, 1, '回复', '', '', '{\"weibo_id\":109,\"comment_id\":26}', 'comment', 1542620198, 1);

-- ----------------------------
-- Table structure for ot_message_event
-- ----------------------------
DROP TABLE IF EXISTS `ot_message_event`;
CREATE TABLE `ot_message_event`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '事件唯一标识',
  `title` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(2) NOT NULL,
  `zhannei` int(2) NOT NULL COMMENT '站内消息',
  `sms` int(2) NOT NULL COMMENT '短信',
  `email` int(2) NOT NULL COMMENT '电子邮件',
  `weixin` int(2) NOT NULL COMMENT '微信公众号消息',
  `app` int(2) NOT NULL COMMENT 'APP推送',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息事件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_message_event
-- ----------------------------
INSERT INTO `ot_message_event` VALUES (1, 'weibo_zan', '动态被点赞', 1, 1, 1, 1, 0, 0);
INSERT INTO `ot_message_event` VALUES (2, 'weibo_comment', '动态被评论', 1, 1, 1, 1, 0, 0);
INSERT INTO `ot_message_event` VALUES (3, 'weibo_aite', '动态被@', 1, 1, 1, 1, 0, 0);
INSERT INTO `ot_message_event` VALUES (4, 'weibo_repost', '动态被转发', 1, 1, 1, 1, 0, 0);
INSERT INTO `ot_message_event` VALUES (5, 'weibo_share', '动态被分享', 1, 1, 1, 1, 0, 0);

-- ----------------------------
-- Table structure for ot_message_limit
-- ----------------------------
DROP TABLE IF EXISTS `ot_message_limit`;
CREATE TABLE `ot_message_limit`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num` int(2) NOT NULL,
  `date` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `code` int(4) NULL DEFAULT NULL COMMENT '验证码',
  `expire_time` int(11) NULL DEFAULT NULL COMMENT '验证码过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_message_limit
-- ----------------------------
INSERT INTO `ot_message_limit` VALUES (1, '18130191539', 1, 1537501407, 1537545599, NULL, NULL);
INSERT INTO `ot_message_limit` VALUES (2, '13888888888', 1, 1538209662, 1538236799, 1152, 1540538113);
INSERT INTO `ot_message_limit` VALUES (3, '18140191539', 1, 1540538074, 1540569599, 123456, 1540953151);

-- ----------------------------
-- Table structure for ot_message_old
-- ----------------------------
DROP TABLE IF EXISTS `ot_message_old`;
CREATE TABLE `ot_message_old`  (
  `id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `from_uid` int(11) NOT NULL,
  `to_uid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `is_read` tinyint(4) NOT NULL,
  `last_toast` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息类型',
  `tpl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息模板',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_message_template
-- ----------------------------
DROP TABLE IF EXISTS `ot_message_template`;
CREATE TABLE `ot_message_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL COMMENT '事件id',
  `status` int(2) NOT NULL,
  `zhannei` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站内消息模板',
  `sms` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '短信模板',
  `email` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮件模板',
  `weixin` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信公众号消息模板',
  `app` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'APP推送模板',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_message_template
-- ----------------------------
INSERT INTO `ot_message_template` VALUES (1, 1, 1, '<p>有人赞了您的微博，快去看看吧^……^！</p>', '<p>有人赞了您的微博，快去看看吧^……^！</p>', '<p>有人赞了您的微博，快去看看吧^……^！</p>', '', '');
INSERT INTO `ot_message_template` VALUES (2, 2, 1, '<p>您的微博被评论，快去看看吧^……^！</p>', '<p>您的微博被评论，快去看看吧^……^！</p>', '<p>您的微博被评论，快去看看吧^……^！</p>', '', '');
INSERT INTO `ot_message_template` VALUES (3, 3, 1, '<p>有人@了您，快去看看吧^……^！</p>', '<p>有人@了您，快去看看吧^……^！</p>', '<p>有人@了您，快去看看吧^……^！</p>', '', '');

-- ----------------------------
-- Table structure for ot_message_type
-- ----------------------------
DROP TABLE IF EXISTS `ot_message_type`;
CREATE TABLE `ot_message_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息类型',
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户消息类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_message_type
-- ----------------------------
INSERT INTO `ot_message_type` VALUES (1, 1, 'Common_mobile', 1);
INSERT INTO `ot_message_type` VALUES (2, 1, 'Common_email', 1);
INSERT INTO `ot_message_type` VALUES (3, 1, 'Common_announce', 1);
INSERT INTO `ot_message_type` VALUES (4, 1, 'Ucenter', 1);
INSERT INTO `ot_message_type` VALUES (5, 1, 'Weibo', 1);
INSERT INTO `ot_message_type` VALUES (6, 100, 'Ucenter', 1);
INSERT INTO `ot_message_type` VALUES (7, 100, 'Common_mobile', 1);
INSERT INTO `ot_message_type` VALUES (8, 100, 'Common_email', 1);
INSERT INTO `ot_message_type` VALUES (9, 100, 'Weibo', 1);
INSERT INTO `ot_message_type` VALUES (10, 101, 'Ucenter', 1);
INSERT INTO `ot_message_type` VALUES (11, 0, 'Common_mobile', 1);
INSERT INTO `ot_message_type` VALUES (12, 0, 'Common_email', 1);
INSERT INTO `ot_message_type` VALUES (13, 101, 'Common_mobile', 1);
INSERT INTO `ot_message_type` VALUES (14, 101, 'Common_email', 1);

-- ----------------------------
-- Table structure for ot_module
-- ----------------------------
DROP TABLE IF EXISTS `ot_module`;
CREATE TABLE `ot_module`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块名',
  `alias` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '中文名',
  `version` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版本号',
  `is_com` tinyint(4) NOT NULL COMMENT '是否商业版',
  `show_nav` tinyint(4) NOT NULL COMMENT '是否显示在导航栏中',
  `summary` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `developer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开发者',
  `website` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网址',
  `entry` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '前台入口',
  `is_setup` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否已安装',
  `sort` int(11) NOT NULL COMMENT '模块排序',
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `can_uninstall` tinyint(4) NOT NULL,
  `admin_entry` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menu_hide` tinyint(4) NOT NULL DEFAULT 0 COMMENT '后台入口隐藏',
  `auth_role` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '允许访问角色，为空表示非登录也能访问',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `name_2`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模块管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_module
-- ----------------------------
INSERT INTO `ot_module` VALUES (1, 'Home', '网站主页', '2.0.0', 0, 1, '首页模块，主要用于展示网站内容', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'Home/index/index', 1, 0, 'home', 1, 'Admin/Home/config', 0, '');
INSERT INTO `ot_module` VALUES (2, 'Ucenter', '用户中心', '2.0.0', 0, 1, '用户中心模块，系统核心模块', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'Ucenter/index/index', 1, 0, 'user', 0, 'Admin/User/index', 0, '');
INSERT INTO `ot_module` VALUES (3, 'People', '找人', '2.0.0', 0, 1, '会员展示模块，可以用于会员的查找', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'People/index/index', 0, 0, 'group', 1, 'People/config', 0, '');
INSERT INTO `ot_module` VALUES (4, 'Weibo', '作品', '3.0.0', 0, 1, '作品模块，用户可以发布作品', '科技有限公司', 'http://www.hpsc.com', 'Weibo/index/index', 1, 0, 'quote-left', 1, 'Admin/Weibo/weibo', 0, '');
INSERT INTO `ot_module` VALUES (12, 'Core', '系统公共模块', '2.1.0', 0, 0, '系统核心模块，必不可少，负责核心的处理。', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', '', 1, 0, 'globe', 0, '', 0, '');
INSERT INTO `ot_module` VALUES (13, 'Manager', '管理员中心', '2.0.0', 0, 1, '管理员模块，主要用于展示管理员信息', '', '', 'Manager/index/index', 1, 0, 'home', 1, 'Admin/Manager/index', 0, '');
INSERT INTO `ot_module` VALUES (14, 'Works', '作品', '3.0.0', 0, 1, '作品模块，用户可以发布作品', '科技有限公司', 'http://www.hpsc.com', 'Works/index/index', 1, 0, 'quote-left', 1, 'Admin/works/weibo', 0, '1');
INSERT INTO `ot_module` VALUES (15, 'Announce', '公告', '2.0.0', 0, 1, '管理员模块，主要用于展示管理员信息', '', '', 'Announce/index/index', 1, 0, 'home', 1, 'Admin/Announce/announceList', 0, '');
INSERT INTO `ot_module` VALUES (16, 'Adv', '广告位管理', '2.0.0', 0, 1, '管理员模块，主要用于展示管理员信息', '', '', '', 1, 0, 'home', 1, 'adv/pos/module/weibo', 0, '');
INSERT INTO `ot_module` VALUES (17, 'Attest', '认证中心', '2.0.0', 0, 1, '认证模块,用于用户认证', '王迪', '', 'Attest/index/index', 1, 0, 'home', 1, 'Admin/Attest/attestTypes', 0, '');

-- ----------------------------
-- Table structure for ot_picture
-- ----------------------------
DROP TABLE IF EXISTS `ot_picture`;
CREATE TABLE `ot_picture`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `width` int(11) NOT NULL DEFAULT 0,
  `height` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_picture
-- ----------------------------
INSERT INTO `ot_picture` VALUES (1, 'local', '/Uploads/Picture/2018-07-09/5b433560da0fa.jpg', '', '0e16c420200e1fd61d360d8159f50cc6', 'cc5974904d6d78e235a6e3821f313c9b0ee8a89f', 0, 1531131232, 828, 1600);
INSERT INTO `ot_picture` VALUES (3, 'local', '/Uploads/Picture/2018-08-29/5b86574c3cb78.jpg', '', '686b634abd462b0fd8f0a08d13253e28', '52eb9386e124b3388cd9c3042a3cfde216361530', 1, 1535530828, 626, 479);
INSERT INTO `ot_picture` VALUES (4, 'local', '/Uploads/Picture/2018-08-29/5b86576509472.png', '', '552411e2a2f4fb1ad70c20ecd46e5577', '53116a7c28a4fdf5e248338d2108392559cb70c8', 1, 1535530852, 550, 494);
INSERT INTO `ot_picture` VALUES (5, 'local', '/Uploads/Picture/2018-09-04/5b8e4849339c8.png', '', '7b40a713101f68152cc7bab06930465f', '7e4f72055d2108dc9b18814a1139dd9ad8fecfb4', 1, 1536051273, 1152, 648);
INSERT INTO `ot_picture` VALUES (6, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-10-09/5bbc7cb89e661.jpg', 'b2a01af2ccbd812fdc0bf914cf3628a9', 'a099efd581d68054717b579b4b144eba5c1a9472', 1, 1536631201, 533, 300);
INSERT INTO `ot_picture` VALUES (7, 'local', '/Uploads/Picture/2018-09-11/5b9721a199138.jpg', '', 'b2a01af2ccbd812fdc0bf914cf3628a9', 'a099efd581d68054717b579b4b144eba5c1a9472', 1, 1536631201, 533, 300);
INSERT INTO `ot_picture` VALUES (8, 'local', '/Uploads/Picture/2018-09-11/5b9721a1a44e8.jpg', '', 'ee68076f06b1dcacadc7b49a4afb3c71', '1c9a3bbeac60bcc344f5b268e87238d4ac0957bd', 1, 1536631201, 533, 300);
INSERT INTO `ot_picture` VALUES (9, 'local', '/Uploads/Picture/2018-09-17/5b9f264183018.jpg', '', '68b515c4f061d4032f8bf616160b6f2c', '4ef3f7e58150dd3689da1424cf3e7c0f3855370e', 1, 1537156673, 1600, 900);
INSERT INTO `ot_picture` VALUES (10, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-10-09/5bbc7b7f8c551.png', '568aec7133255869167d8314f28e9d6a', '572878b0573860311c241da85304cff862aaf8ad', 1, 1537159015, 516, 517);
INSERT INTO `ot_picture` VALUES (11, 'local', 'http://www.demo.com/Uploads/Picture/2018-09-26/e39b00b659042f95f021c3e77d6d6481.png', '', 'b84ec3dfa242760b5cca1e5dfcbc79af', '', 1, 1537947034, 516, 517);
INSERT INTO `ot_picture` VALUES (12, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/fa9b730ca26880ba09ec1ee2fb558beb.png', 'bd844426bc90a574862707994c0cd893', 'b989e512847aab5df9336623ca393fc2f053b415', 1, 1537947089, 516, 517);
INSERT INTO `ot_picture` VALUES (13, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/04b5d5878ad7926b13deea906c43886a.png', 'eb70d45c1a3d675a9c416e345dda62c5', '7809d1e73140aba8c58193cb1f0110f130b47910', 1, 1537947134, 516, 517);
INSERT INTO `ot_picture` VALUES (14, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/73063134bbc2eb74142714df92d724bb.jpg', '98d2bbf7f220691e3d79808bec7ddbb2', '93fb142256ce0967544c754b66399c0c5a320344', 1, 1537947134, 533, 300);
INSERT INTO `ot_picture` VALUES (15, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/8bc676fffd5f6bb2498f965bc917f9b6.jpg', 'e4be73c5a7c6d67623ae3bb4b34271f4', 'c9618334c29098915111be4b0b9472ca737892a7', 1, 1537947134, 533, 300);
INSERT INTO `ot_picture` VALUES (16, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/91e4161e7e054b7dbfbaf520ad223316.png', '2758bae129eb0b98f0044b00f62b4979', 'f21d3dcb289cb6a43fc73df7a027d4d530668e66', 1, 1537947134, 1152, 648);
INSERT INTO `ot_picture` VALUES (17, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/da30ac2bcaecc09fe1648888aee98365.jpg', 'd1b758e64f3cb5b50c99e0c760c3163a', '40166235c9a3f00c0efafb896a633f3c3d552f11', 1, 1537947134, 3840, 2160);
INSERT INTO `ot_picture` VALUES (18, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/71b664d1490e5e8d02ac48c01814d54a.png', '1a15becdcf2e2cda8292fa7c4e7be70e', '28cf078125ba338d36634a9f03019f6e836caefb', 1, 1537947173, 516, 517);
INSERT INTO `ot_picture` VALUES (19, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/d9d0428f63a1b77fe80a9de3fbc8a6ac.jpg', '54614c7c84909b62b018db11a15d10ae', 'd206fddf3c886655d1b41d0860c2ace7aff67745', 1, 1537947173, 533, 300);
INSERT INTO `ot_picture` VALUES (20, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/9510a4bfb9213db84e60eb6acd5bf8f4.jpg', '6038ebe26c0758fbdd5bdb9aa7f53e41', 'f14548172588716a3b684525f4d43ea3e91e208d', 1, 1537947173, 533, 300);
INSERT INTO `ot_picture` VALUES (21, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/351dddb0b2292596755d8187c2e53cc3.png', 'd9dad867d025fbe67ff92d81e0f77e3d', '5dae23954ffe57fa752e609312d8423c85eacf58', 1, 1537947173, 1152, 648);
INSERT INTO `ot_picture` VALUES (22, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/f970c6a9a6e36c60632241c0f3134594.jpg', '39e8c65b09cc6086f7c48aafb1bcbb24', 'e009ababd7e609bfe10dbbe9ff95d0523dcb1113', 1, 1537947173, 3840, 2160);
INSERT INTO `ot_picture` VALUES (23, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/05c00314445e5acf7bd8e611e749c0dc.png', '6bf8e298baf52399f85a7b15bfefc124', 'a9a7bf6bbc38fe61db79dc60e241370d4cfde213', 1, 1537947272, 516, 517);
INSERT INTO `ot_picture` VALUES (24, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/03a35b80c4582a37ce6e51e53eeb72b8.jpg', '8a02a563bacb2bd810473364ec9c9241', '9ba5ab54c78d788ae7391a6dde01b22e7c2943a4', 1, 1537947272, 533, 300);
INSERT INTO `ot_picture` VALUES (25, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/c51e9c863cd443371fd570f38ab90b26.jpg', 'd26f61fb05c9f12a4f3def24c9a01207', 'c36c485ead0113b2e52e3a96e1a55af8e5748221', 1, 1537947272, 533, 300);
INSERT INTO `ot_picture` VALUES (26, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/f19528dae51e74bada3f69d672c33f9c.png', '849e02335980721ae771627e30f86cdf', 'f41a29a7f5ee4e92a9a7b339adfd134dd09d7221', 1, 1537947272, 1152, 648);
INSERT INTO `ot_picture` VALUES (27, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/e1a1fffcd1d28750e1044552a2d1a655.jpg', 'ea5f18101742e039f5745cb9ddeeb6cc', 'e54b8506ff79ac5bc40a548f19db62b614298b60', 1, 1537947272, 3840, 2160);
INSERT INTO `ot_picture` VALUES (28, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/868858dd7880b6450bdafc244344cb77.png', '7d082507ccf168467d47df6beee7932e', 'c3c40b3d8443541251a5567c9272463d5fb6e06b', 1, 1537950100, 516, 517);
INSERT INTO `ot_picture` VALUES (29, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/8151a243754f04cb1dc5c2f301a46c02.png', 'ab206b2276c2db2046ddb7893273a569', '0f10254d8df16fba4c84c1da234be8e3110fad64', 1, 1537950102, 516, 517);
INSERT INTO `ot_picture` VALUES (30, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/f20bee58b0443d8f4ffbf5f3e7a46fd3.png', '5f758f71be57fc496ee0b8b36ebff175', 'dd7f287567ea2da250de3ba68439e8988e73b741', 1, 1537950160, 516, 517);
INSERT INTO `ot_picture` VALUES (31, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/3afbd412c9bd4a4d50dcba8c3c66a95e.png', '1631db0556b440e5c63775af7eb9f8c5', '9add8d2f319c7982fd9cfc44a35f67fd7de3fa22', 1, 1537950269, 516, 517);
INSERT INTO `ot_picture` VALUES (32, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/a1d9f6341b1ca24e6d719bc50ceae84f.png', 'db8fb504971804e287a0c4a93fb2c407', 'cac299409de8e2f1c0549e0a787e970126b2edd1', 1, 1537950397, 516, 517);
INSERT INTO `ot_picture` VALUES (33, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/b9bc437221aca1a4abc8e9f966d78055.jpg', '52155bbf1ee95b1dd506c7ae323ebb1c', '73da07fe5fc9f8e3b1f1410bb573bbdc284a162f', 1, 1537954288, 3840, 2160);
INSERT INTO `ot_picture` VALUES (34, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/8d76c12bb5f464c2669967a7be837ccb.jpg', '7c320b51b911c2493cca256765ff6ec5', '76bc63e299e904283511b776b34902595c9fcf05', 1, 1537954308, 3840, 2160);
INSERT INTO `ot_picture` VALUES (35, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/00e1bbbf4b10a3b8d871a8e51c9bd525.jpg', 'ba45ecd69e24bca11f3e00e9590d8e92', 'd0faa901f4b986556d75cf41d9fda613c9d7e558', 1, 1537954559, 3840, 2160);
INSERT INTO `ot_picture` VALUES (36, 'local', '', 'http://www.demo.com/Uploads/Picture/2018-09-26/1494aa9c69196286a5321fad95f02303.jpg', '68f759ce05cec1071cc0899f4d79a906', 'c113ed95ec5789e0ca5bbeb38049051b073f0059', 1, 1537955647, 3840, 2160);
INSERT INTO `ot_picture` VALUES (37, 'local', '/Uploads/Picture/2018-10-09/5bbc602a4c9c9.png', '', '4d9a1dc4f3610f8c0ea99ccb2e3170c6', '57789c5d96a7326e6159c7918ce4927081d5f814', 1, 1539072042, 257, 81);
INSERT INTO `ot_picture` VALUES (38, 'local', '/Uploads/Picture/2018-10-09/5bbc6555ef741.jpg', '', 'b2a01af2ccbd812fdc0bf914cf3628a9', 'a099efd581d68054717b579b4b144eba5c1a9472', 1, 1539073365, 533, 300);
INSERT INTO `ot_picture` VALUES (39, 'local', '/Uploads/Picture/2018-10-09/5bbc7120d6cb9.png', '', '75d1d85e4a5e51632374fc5163d53da0', 'ec53a9e2e4969abb50101601559ac8f45098b1bc', 1, 1539076384, 471, 585);
INSERT INTO `ot_picture` VALUES (40, 'local', '/Uploads/Picture/', '', '', '', 1, 1539077313, 0, 0);
INSERT INTO `ot_picture` VALUES (41, 'local', '/Uploads/Picture/2018-10-09/5bbc7af67e2c1.png', '', '568aec7133255869167d8314f28e9d6a', '572878b0573860311c241da85304cff862aaf8ad', 1, 1539078902, 516, 517);
INSERT INTO `ot_picture` VALUES (42, 'local', '/Uploads/Picture/2018-10-09/5bbc7c296d539.jpg', '', 'b2a01af2ccbd812fdc0bf914cf3628a9', 'a099efd581d68054717b579b4b144eba5c1a9472', 1, 1539079209, 533, 300);
INSERT INTO `ot_picture` VALUES (43, 'local', '/Uploads/Picture/2018-10-09/5bbc7cb89e661.jpg', '', 'b2a01af2ccbd812fdc0bf914cf3628a9', 'a099efd581d68054717b579b4b144eba5c1a9472', 1, 1539079352, 533, 300);
INSERT INTO `ot_picture` VALUES (44, 'local', '/Uploads/Picture/2018-11-07/5be26e255bcc0.png', '', '4415444e6955e03e21dad27c5e68ea3d', 'c5417048c508183189a218b11475fcb5e31d2be1', 1, 1541565988, 751, 899);
INSERT INTO `ot_picture` VALUES (45, 'local', '/Uploads/Picture/2018-11-07/5be26e258b290.png', '', 'a8ee517dc79feb88f8fa2f5f33ae6144', '6ec1195d358af46357272ba0a4a133000a67221d', 1, 1541565988, 750, 897);
INSERT INTO `ot_picture` VALUES (46, 'local', '/Uploads/Picture/2018-11-07/5be26e25aba18.jpg', '', '84a829f4d6827221b97cfba899ad402b', '61d6bae0bfc0900cf4cbac24e33f290310b7b560', 1, 1541565989, 533, 300);
INSERT INTO `ot_picture` VALUES (47, 'local', '/Uploads/Picture/2018-11-07/5be26e25b1bc0.jpg', '', '6274a073de7cfc47a79f8ee3fd205481', 'd14df89a53a9172d6c7154711916e3061904d451', 1, 1541565989, 1600, 900);
INSERT INTO `ot_picture` VALUES (48, 'local', '/Uploads/Picture/2018-11-07/5be26e25cd910.jpg', '', '47e485dd649de73093e31ac483bc37de', 'ea7df8d9953ebbd0a7296c7ee4e36dfb4384d50a', 1, 1541565989, 533, 300);
INSERT INTO `ot_picture` VALUES (49, 'local', '/Uploads/Picture/2018-11-07/5be26e264f970.png', '', '1d5fff839fffab6e848f2dc34a889974', '4ecfe92c2c8861b50756c3509483d05664908715', 1, 1541565989, 751, 899);

-- ----------------------------
-- Table structure for ot_rank
-- ----------------------------
DROP TABLE IF EXISTS `ot_rank`;
CREATE TABLE `ot_rank`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '上传者id',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logo` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `types` tinyint(2) NOT NULL DEFAULT 1 COMMENT '前台是否可申请',
  `label_content` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文字头衔内容',
  `label_color` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文字颜色',
  `label_bg` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'label背景色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_rank_user
-- ----------------------------
DROP TABLE IF EXISTS `ot_rank_user`;
CREATE TABLE `ot_rank_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_show` tinyint(4) NOT NULL COMMENT '是否显示在昵称右侧（必须有图片才可）',
  `create_time` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_register
-- ----------------------------
DROP TABLE IF EXISTS `ot_register`;
CREATE TABLE `ot_register`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `from` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '注册终端',
  `type` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '注册方式',
  `status` int(4) NOT NULL COMMENT '注册状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '注册终端和方式统计' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of ot_register
-- ----------------------------
INSERT INTO `ot_register` VALUES (1, 100, 'pc', 'email', 1);
INSERT INTO `ot_register` VALUES (2, 101, 'pc', 'mobile', 1);

-- ----------------------------
-- Table structure for ot_report
-- ----------------------------
DROP TABLE IF EXISTS `ot_report`;
CREATE TABLE `ot_report`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` int(11) NOT NULL,
  `reason` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` int(11) NOT NULL,
  `updata_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `handle_status` tinyint(4) NOT NULL,
  `handle_result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `handle_uid` int(11) NOT NULL,
  `handle_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_role
-- ----------------------------
DROP TABLE IF EXISTS `ot_role`;
CREATE TABLE `ot_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL COMMENT '角色组id',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英文标识',
  `title` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '中文标题',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `user_groups` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '默认权限组ids',
  `invite` tinyint(4) NOT NULL COMMENT '预留字段(类型：是否需要邀请注册等)',
  `audit` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否需要审核',
  `sort` int(10) NOT NULL DEFAULT 0,
  `status` tinyint(2) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_role
-- ----------------------------
INSERT INTO `ot_role` VALUES (1, 0, 'default', '普通用户', '普通用户', '1', 0, 0, 0, 1, 1531127370, 1531127370);

-- ----------------------------
-- Table structure for ot_role_config
-- ----------------------------
DROP TABLE IF EXISTS `ot_role_config`;
CREATE TABLE `ot_role_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标识',
  `category` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '归类标识',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置值',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '该配置的其它值',
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_role_config
-- ----------------------------
INSERT INTO `ot_role_config` VALUES (1, 1, 'user_tag', '', '2,3', '', 1476755028);
INSERT INTO `ot_role_config` VALUES (2, 1, 'expend_field', 'expend_field', '1,2,3,4,5,6,7,8', '', 1535958903);
INSERT INTO `ot_role_config` VALUES (3, 1, 'register_expend_field', 'expend_field', '1,2,3,4,5,6,7', '', 1476755110);

-- ----------------------------
-- Table structure for ot_role_group
-- ----------------------------
DROP TABLE IF EXISTS `ot_role_group`;
CREATE TABLE `ot_role_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色分组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_schedule
-- ----------------------------
DROP TABLE IF EXISTS `ot_schedule`;
CREATE TABLE `ot_schedule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `args` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `type_value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `intro` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lever` int(11) NOT NULL COMMENT '优先级',
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_schedule
-- ----------------------------
INSERT INTO `ot_schedule` VALUES (1, 'Admin/Count->dayCount', '', 3, 'Daily=01:00', 1469167215, 2147483647, '执行了数据统计', 0, 0, 1469167281);

-- ----------------------------
-- Table structure for ot_score_log
-- ----------------------------
DROP TABLE IF EXISTS `ot_score_log`;
CREATE TABLE `ot_score_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `ip` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `action` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` double NOT NULL,
  `finally_value` double NOT NULL,
  `create_time` int(11) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `record_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_score_log
-- ----------------------------
INSERT INTO `ot_score_log` VALUES (1, 1, 3063235528, 1, 'inc', 1, 1, 1531131244, 'admin在2018-07-09 18:14发布了新微博：1【积分：+1分】', 'weibo', 1);
INSERT INTO `ot_score_log` VALUES (2, 1, 3063235528, 1, 'inc', 1, 2, 1531131253, 'admin在2018-07-09 18:14添加了微博评论：1【积分：+1分】', 'weibo_comment', 1);
INSERT INTO `ot_score_log` VALUES (3, 1, 3063235528, 1, 'inc', 1, 3, 1531131280, 'admin在2018-07-09 18:14添加了微博评论：2【积分：+1分】', 'weibo_comment', 2);
INSERT INTO `ot_score_log` VALUES (4, 1, 2101843627, 1, 'inc', 1, 4, 1531131472, 'admin在2018-07-09 18:17发布了新微博：2【积分：+1分】', 'weibo', 2);
INSERT INTO `ot_score_log` VALUES (5, 1, 3063235528, 1, 'inc', 1, 5, 1531131499, 'admin在2018-07-09 18:18发布了新微博：3【积分：+1分】', 'weibo', 3);
INSERT INTO `ot_score_log` VALUES (6, 1, 3062519902, 1, 'inc', 10, 15, 1531383476, 'admin在2018-07-12 16:17登录了账号【积分：+10分】', 'member', 1);
INSERT INTO `ot_score_log` VALUES (7, 1, 3063235538, 1, 'inc', 10, 25, 1532405857, 'admin在2018-07-24 12:17登录了账号【积分：+10分】', 'member', 1);
INSERT INTO `ot_score_log` VALUES (8, 1, 3063235538, 1, 'inc', 1, 26, 1532406633, 'admin在2018-07-24 12:30发布了新微博：4【积分：+1分】', 'weibo', 4);
INSERT INTO `ot_score_log` VALUES (9, 1, 3063235538, 1, 'inc', 1, 27, 1532406683, 'admin在2018-07-24 12:31发布了新微博：5【积分：+1分】', 'weibo', 5);
INSERT INTO `ot_score_log` VALUES (10, 1, 3063235538, 1, 'inc', 1, 28, 1532406781, 'admin在2018-07-24 12:33添加了微博评论：3【积分：+1分】', 'weibo_comment', 3);
INSERT INTO `ot_score_log` VALUES (11, 1, 3063235538, 1, 'inc', 1, 29, 1532408702, 'admin在2018-07-24 13:05添加了微博评论：4【积分：+1分】', 'weibo_comment', 4);
INSERT INTO `ot_score_log` VALUES (12, 1, 3063235538, 1, 'inc', 1, 30, 1532408723, 'admin在2018-07-24 13:05添加了微博评论：5【积分：+1分】', 'weibo_comment', 5);
INSERT INTO `ot_score_log` VALUES (13, 1, 3063235538, 1, 'inc', 1, 31, 1532408734, 'admin在2018-07-24 13:05添加了微博评论：6【积分：+1分】', 'weibo_comment', 6);
INSERT INTO `ot_score_log` VALUES (14, 1, 3063235538, 1, 'inc', 1, 32, 1532408899, 'admin在2018-07-24 13:08发布了新微博：6【积分：+1分】', 'weibo', 6);
INSERT INTO `ot_score_log` VALUES (15, 1, 3063235538, 1, 'inc', 10, 42, 1532664757, 'admin在2018-07-27 12:12登录了账号【积分：+10分】', 'member', 1);
INSERT INTO `ot_score_log` VALUES (16, 1, 3063235538, 1, 'inc', 10, 52, 1533205729, 'admin在2018-08-02 18:28登录了账号【积分：+10分】', 'member', 1);
INSERT INTO `ot_score_log` VALUES (17, 1, 1987076574, 1, 'inc', 10, 62, 1535013809, 'admin在2018-08-23 16:43登录了账号【积分：+10分】', 'member', 1);
INSERT INTO `ot_score_log` VALUES (18, 1, 2101843548, 1, 'inc', 1, 63, 1535529276, 'admin在2018-08-29 15:54发布了新微博：7【积分：+1分】', 'weibo', 7);
INSERT INTO `ot_score_log` VALUES (19, 1, 2101843548, 1, 'inc', 1, 64, 1535529296, 'admin在2018-08-29 15:54添加了微博评论：7【积分：+1分】', 'weibo_comment', 7);
INSERT INTO `ot_score_log` VALUES (20, 100, 2101843548, 1, 'inc', 10, 10, 1535530253, 'Vonder在2018-08-29 16:10登录了账号【积分：+10分】', 'member', 100);
INSERT INTO `ot_score_log` VALUES (21, 100, 2101843548, 1, 'inc', 1, 11, 1535530381, 'Vonder在2018-08-29 16:13发布了新微博：8【积分：+1分】', 'weibo', 8);
INSERT INTO `ot_score_log` VALUES (22, 1, 2101843548, 1, 'inc', 1, 65, 1535531675, 'admin在2018-08-29 16:34发布了新微博：9【积分：+1分】', 'weibo', 9);
INSERT INTO `ot_score_log` VALUES (23, 1, 2101843548, 1, 'inc', 1, 66, 1535535487, 'admin在2018-08-29 17:38发布了新微博：10【积分：+1分】', 'weibo', 10);
INSERT INTO `ot_score_log` VALUES (24, 1, 2101843548, 1, 'inc', 1, 67, 1535535498, 'admin在2018-08-29 17:38发布了新微博：11【积分：+1分】', 'weibo', 11);
INSERT INTO `ot_score_log` VALUES (25, 1, 2130706433, 1, 'inc', 1, 68, 1535601428, 'admin在2018-08-30 11:57发布了新微博：12【积分：+1分】', 'weibo', 12);
INSERT INTO `ot_score_log` VALUES (26, 1, 2130706433, 1, 'inc', 1, 69, 1535607835, 'admin在2018-08-30 13:43添加了微博评论：8【积分：+1分】', 'weibo_comment', 8);
INSERT INTO `ot_score_log` VALUES (27, 1, 2130706433, 1, 'inc', 1, 70, 1535611276, 'admin在2018-08-30 14:41添加了微博评论：9【积分：+1分】', 'weibo_comment', 9);
INSERT INTO `ot_score_log` VALUES (28, 1, 2130706433, 1, 'inc', 1, 71, 1535611966, 'admin在2018-08-30 14:52发布了新微博：13【积分：+1分】', 'weibo', 13);
INSERT INTO `ot_score_log` VALUES (29, 1, 2130706433, 1, 'inc', 1, 72, 1535614435, 'admin在2018-08-30 15:33发布了新微博：14【积分：+1分】', 'weibo', 14);
INSERT INTO `ot_score_log` VALUES (30, 1, 2130706433, 1, 'inc', 1, 73, 1535705952, 'admin在2018-08-31 16:59发布了新微博：15【积分：+1分】', 'weibo', 15);
INSERT INTO `ot_score_log` VALUES (31, 1, 2130706433, 1, 'inc', 1, 74, 1535705978, 'admin在2018-08-31 16:59发布了新微博：16【积分：+1分】', 'weibo', 16);
INSERT INTO `ot_score_log` VALUES (32, 100, 2130706433, 1, 'inc', 10, 21, 1535708069, 'Vonder在2018-08-31 17:34登录了账号【积分：+10分】', 'member', 100);
INSERT INTO `ot_score_log` VALUES (33, 100, 2130706433, 1, 'inc', 10, 31, 1535940447, 'Vonder在2018-09-03 10:07登录了账号【积分：+10分】', 'member', 100);
INSERT INTO `ot_score_log` VALUES (34, 1, 2130706433, 1, 'inc', 1, 75, 1535964612, 'admin在2018-09-03 16:50发布了新微博：17【积分：+1分】', 'weibo', 17);
INSERT INTO `ot_score_log` VALUES (35, 1, 2130706433, 1, 'inc', 1, 76, 1535964630, 'admin在2018-09-03 16:50发布了新微博：18【积分：+1分】', 'weibo', 18);
INSERT INTO `ot_score_log` VALUES (36, 1, 2130706433, 1, 'inc', 1, 77, 1535964652, 'admin在2018-09-03 16:50发布了新微博：19【积分：+1分】', 'weibo', 19);
INSERT INTO `ot_score_log` VALUES (37, 1, 2130706433, 1, 'inc', 1, 78, 1535964664, 'admin在2018-09-03 16:51发布了新微博：20【积分：+1分】', 'weibo', 20);
INSERT INTO `ot_score_log` VALUES (38, 1, 2130706433, 1, 'inc', 1, 79, 1535966002, 'admin在2018-09-03 17:13发布了新微博：21【积分：+1分】', 'weibo', 21);
INSERT INTO `ot_score_log` VALUES (39, 100, 2130706433, 1, 'inc', 1, 32, 1536049593, 'Vonder在2018-09-04 16:26发布了新微博：26【积分：+1分】', 'weibo', 26);
INSERT INTO `ot_score_log` VALUES (40, 101, 2130706433, 1, 'inc', 10, 10, 1536051978, 'wangdi在2018-09-04 17:06登录了账号【积分：+10分】', 'member', 101);
INSERT INTO `ot_score_log` VALUES (41, 101, 2130706433, 1, 'inc', 1, 11, 1536053922, 'wangdi在2018-09-04 17:38发布了新微博：27【积分：+1分】', 'weibo', 27);
INSERT INTO `ot_score_log` VALUES (42, 100, 2130706433, 1, 'inc', 1, 33, 1536133227, 'Vonder在2018-09-05 15:40发布了新微博：31【积分：+1分】', 'weibo', 31);
INSERT INTO `ot_score_log` VALUES (43, 100, 2130706433, 1, 'inc', 1, 34, 1536134598, 'Vonder在2018-09-05 16:03发布了新微博：32【积分：+1分】', 'weibo', 32);
INSERT INTO `ot_score_log` VALUES (44, 1, 2130706433, 1, 'inc', 1, 80, 1536142414, 'admin在2018-09-05 18:13发布了新微博：37【积分：+1分】', 'weibo', 37);
INSERT INTO `ot_score_log` VALUES (45, 1, 2130706433, 1, 'inc', 1, 81, 1536203185, 'admin在2018-09-06 11:06发布了新微博：39【积分：+1分】', 'weibo', 39);
INSERT INTO `ot_score_log` VALUES (46, 1, 2130706433, 1, 'inc', 1, 82, 1536203187, 'admin在2018-09-06 11:06添加了微博评论：14【积分：+1分】', 'weibo_comment', 14);
INSERT INTO `ot_score_log` VALUES (47, 1, 2130706433, 1, 'inc', 1, 83, 1536206607, 'admin在2018-09-06 12:03发布了新微博：40【积分：+1分】', 'weibo', 40);
INSERT INTO `ot_score_log` VALUES (48, 1, 2130706433, 1, 'inc', 1, 84, 1536206609, 'admin在2018-09-06 12:03添加了微博评论：15【积分：+1分】', 'weibo_comment', 15);
INSERT INTO `ot_score_log` VALUES (49, 1, 2130706433, 1, 'inc', 1, 85, 1536210442, 'admin在2018-09-06 13:07发布了新微博：41【积分：+1分】', 'weibo', 41);
INSERT INTO `ot_score_log` VALUES (50, 1, 2130706433, 1, 'inc', 1, 86, 1536210535, 'admin在2018-09-06 13:08发布了新微博：42【积分：+1分】', 'weibo', 42);
INSERT INTO `ot_score_log` VALUES (51, 1, 2130706433, 1, 'inc', 1, 87, 1536210568, 'admin在2018-09-06 13:09发布了新微博：43【积分：+1分】', 'weibo', 43);
INSERT INTO `ot_score_log` VALUES (52, 100, 2130706433, 1, 'inc', 10, 44, 1536225855, 'Vonder在2018-09-06 17:24登录了账号【积分：+10分】', 'member', 100);
INSERT INTO `ot_score_log` VALUES (53, 1, 2130706433, 1, 'inc', 1, 88, 1536295771, 'admin在2018-09-07 12:49发布了新微博：45【积分：+1分】', 'weibo', 45);
INSERT INTO `ot_score_log` VALUES (54, 101, 2130706433, 1, 'inc', 10, 21, 1536303410, 'wangdi在2018-09-07 14:56登录了账号【积分：+10分】', 'member', 101);
INSERT INTO `ot_score_log` VALUES (55, 101, 2130706433, 1, 'inc', 10, 31, 1536544987, 'wangdi在2018-09-10 10:03登录了账号【积分：+10分】', 'member', 101);
INSERT INTO `ot_score_log` VALUES (56, 1, 2130706433, 1, 'inc', 1, 89, 1536630925, 'admin在2018-09-11 09:55发布了新微博：50【积分：+1分】', 'weibo', 50);
INSERT INTO `ot_score_log` VALUES (57, 1, 2130706433, 1, 'inc', 1, 90, 1536631208, 'admin在2018-09-11 10:00发布了新微博：51【积分：+1分】', 'weibo', 51);
INSERT INTO `ot_score_log` VALUES (58, 1, 2130706433, 1, 'inc', 1, 91, 1536632584, 'admin在2018-09-11 10:23发布了新微博：52【积分：+1分】', 'weibo', 52);
INSERT INTO `ot_score_log` VALUES (59, 1, 2130706433, 1, 'inc', 1, 92, 1536632599, 'admin在2018-09-11 10:23发布了新微博：53【积分：+1分】', 'weibo', 53);
INSERT INTO `ot_score_log` VALUES (60, 1, 2130706433, 1, 'inc', 1, 93, 1536632612, 'admin在2018-09-11 10:23发布了新微博：54【积分：+1分】', 'weibo', 54);
INSERT INTO `ot_score_log` VALUES (61, 101, 2130706433, 1, 'inc', 10, 41, 1536821342, 'wangdi在2018-09-13 14:48登录了账号【积分：+10分】', 'member', 101);
INSERT INTO `ot_score_log` VALUES (62, 1, 2130706433, 1, 'inc', 1, 94, 1537160913, 'admin在2018-09-17 13:08发布了新微博：55【积分：+1分】', 'weibo', 55);
INSERT INTO `ot_score_log` VALUES (63, 1, 2130706433, 1, 'inc', 1, 95, 1537163746, 'admin在2018-09-17 13:55发布了新微博：57【积分：+1分】', 'weibo', 57);
INSERT INTO `ot_score_log` VALUES (64, 1, 2130706433, 1, 'inc', 1, 96, 1537168061, 'admin在2018-09-17 15:07发布了新微博：66【积分：+1分】', 'weibo', 66);
INSERT INTO `ot_score_log` VALUES (65, 1, 2130706433, 1, 'inc', 1, 97, 1537177480, 'admin在2018-09-17 17:44发布了新微博：67【积分：+1分】', 'weibo', 67);
INSERT INTO `ot_score_log` VALUES (66, 1, 2130706433, 1, 'inc', 1, 98, 1537343781, 'admin在2018-09-19 15:56发布了新微博：69【积分：+1分】', 'weibo', 69);

-- ----------------------------
-- Table structure for ot_send_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `ot_send_sms_log`;
CREATE TABLE `ot_send_sms_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发送信息',
  `return` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接口返回数据',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '判别发送客户端类型',
  `status` tinyint(3) NOT NULL DEFAULT 1,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_sensitive
-- ----------------------------
DROP TABLE IF EXISTS `ot_sensitive`;
CREATE TABLE `ot_sensitive`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_sensitive
-- ----------------------------
INSERT INTO `ot_sensitive` VALUES (1, '妈的', -1, 1535535472);
INSERT INTO `ot_sensitive` VALUES (2, '干', -1, 1535535472);
INSERT INTO `ot_sensitive` VALUES (3, '草', -1, 1535535472);

-- ----------------------------
-- Table structure for ot_seo_rule
-- ----------------------------
DROP TABLE IF EXISTS `ot_seo_rule`;
CREATE TABLE `ot_seo_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `app` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `controller` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `seo_keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seo_description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seo_title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `summary` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'seo变量介绍',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10000 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_seo_rule
-- ----------------------------
INSERT INTO `ot_seo_rule` VALUES (1000, '整站标题', '', '', '', 1, '', '', '', 7, '-');
INSERT INTO `ot_seo_rule` VALUES (1001, '用户中心', 'Ucenter', 'index', 'index', 1, '{$user_info.username|text}的个人主页', '{$user_info.username|text}的个人主页', '{$user_info.nickname|op_t}的个人主页', 3, '-');
INSERT INTO `ot_seo_rule` VALUES (1002, '网站首页', 'Home', 'Index', 'index', 1, '', '', '', 0, '-');
INSERT INTO `ot_seo_rule` VALUES (1003, '积分商城首页', 'Shop', 'Index', 'index', 1, '', '', '', 0, '-');
INSERT INTO `ot_seo_rule` VALUES (1004, '商品列表', 'Shop', 'Index', 'goods', 1, '', '', '', 0, 'category_name：当前分类名\nchild_category_name：子分类名');
INSERT INTO `ot_seo_rule` VALUES (1005, '商品详情', 'Shop', 'Index', 'goodsdetail', 1, '', '', '', 0, 'content：商品变量集\n   content.goods_name 商品名\n   content.goods_introduct 商品简介\n   content.goods_detail 商品详情');
INSERT INTO `ot_seo_rule` VALUES (1006, '活动主页', 'Event', 'Index', 'index', 1, '', '', '', 0, '-');
INSERT INTO `ot_seo_rule` VALUES (1007, '活动详情', 'Event', 'Index', 'detail', 1, '', '', '', 0, 'content：活动变量集\n   content.title 活动名称\n   content.type.title 活动分类名\n   content.user.nickname 发起人昵称\n   content.address 活动地点\n   content.limitCount 人数限制');
INSERT INTO `ot_seo_rule` VALUES (1008, '活动成员', 'Event', 'Index', 'member', 1, '', '', '', 0, '-');
INSERT INTO `ot_seo_rule` VALUES (1009, '专辑首页', 'Issue', 'Index', 'index', 1, '', '', '', 0, '-');
INSERT INTO `ot_seo_rule` VALUES (1010, '专辑详情', 'Issue', 'Index', 'issuecontentdetail', 1, '', '', '', 0, 'content：专辑内容变量集\n   content.user.nickname 内容发布者昵称\n   content.user.signature 内容发布者签名\n   content.url 内容的Url\n   content.title 内容标题\n   content.create_time|friendlyDate 发布时间\n   content.update_time|friendlyDate 更新时间');
INSERT INTO `ot_seo_rule` VALUES (1011, '论坛主页', 'Forum', 'Index', 'index', 1, '', '', '', 0, '-');
INSERT INTO `ot_seo_rule` VALUES (1012, '某个版块的帖子列表', 'Forum', 'Index', 'forum', 1, '', '', '', 0, 'forum：版块变量集\n   forum.description 版块描述\n   forum.title 版块名称\n   forum.topic_count 主题数\n   forum.total_count 帖子数');
INSERT INTO `ot_seo_rule` VALUES (1013, '帖子详情', 'Forum', 'Index', 'detail', 1, '', '', '', 0, 'post：帖子变量集\n   post.title 帖子标题\n   post.content 帖子详情\n   post.forum.title 帖子所在版块标题\n   ');
INSERT INTO `ot_seo_rule` VALUES (1014, '搜索帖子', 'Forum', 'Index', 'search', 1, '', '', '', 0, 'keywords：搜索的关键词，2.4.0以后版本提供');
INSERT INTO `ot_seo_rule` VALUES (1015, '随便看看', 'Forum', 'Index', 'look', 1, '', '', '', 0, '-');
INSERT INTO `ot_seo_rule` VALUES (1016, '全部版块', 'Forum', 'Index', 'lists', 1, '', '', '', 0, '-');
INSERT INTO `ot_seo_rule` VALUES (1017, '资讯首页/某个分类下的文章列表', 'News', 'Index', 'index', 1, '', '', '', 0, 'now_category.title 当前分类的名称');
INSERT INTO `ot_seo_rule` VALUES (1018, '某篇文章的内容页', 'News', 'Index', 'detail', 1, '', '', '', 0, 'now_category.title 当前分类的名称\ninfo：文章变量集\n   info.title 文章标题\n   info.description 文章摘要\n   info.source 文章来源\n   info.detail.content 文章内容\nauthor.nickname 作者昵称\nauthor.signature 作者签名\n   ');
INSERT INTO `ot_seo_rule` VALUES (1019, '微博首页', 'Weibo', 'Index', 'index', 1, '{$MODULE_ALIAS}', '{$MODULE_ALIAS}首页', '{$MODULE_ALIAS}-{$website_name}', 0, 'title：我关注的、热门微博、全站关注');
INSERT INTO `ot_seo_rule` VALUES (1020, '某条微博的详情页', 'Weibo', 'Index', 'weibodetail', 1, '{$weibo.title|text},{$website_name},{$MODULE_ALIAS}', '{$weibo.content|text}', '{$weibo.content|text}——{$MODULE_ALIAS}', 0, 'weibo:微博变量集\n   weibo.user.nickname 发布者昵称\n   weibo.content 微博内容');
INSERT INTO `ot_seo_rule` VALUES (1021, '微博搜索页面', 'Weibo', 'Index', 'search', 1, '', '', '', 0, 'search_keywords：搜索关键词');
INSERT INTO `ot_seo_rule` VALUES (1022, '热门话题列表', 'Weibo', 'Topic', 'topic', 1, '', '', '', 0, '-');
INSERT INTO `ot_seo_rule` VALUES (1023, '某个话题的话题页', 'Weibo', 'Topic', 'index', 1, '', '', '', 0, 'topic：话题变量集\n   topic.name 话题名称\nhost：话题主持人变量集\n   host.nickname 主持人昵称');
INSERT INTO `ot_seo_rule` VALUES (1024, '自动跳转到我的群组', 'Group', 'Index', 'index', 1, '', '', '', 0, '-');
INSERT INTO `ot_seo_rule` VALUES (1025, '全部群组', 'Group', 'Index', 'groups', 1, '', '', '', 0, '-');
INSERT INTO `ot_seo_rule` VALUES (1026, '我的群组-帖子列表', 'Group', 'Index', 'my', 1, '', '', '', 0, '-');
INSERT INTO `ot_seo_rule` VALUES (1027, '我的群组-全部关注的群组列表', 'Group', 'Index', 'mygroup', 1, '', '', '', 0, '-');
INSERT INTO `ot_seo_rule` VALUES (1028, '某个群组的帖子列表页面', 'Group', 'Index', 'group', 1, '', '', '', 0, 'search_key：如果查找帖子，则是关键词\ngroup：群组变量集\n   group.title 群组标题\n   group.user.nickname 创始人昵称\n   group.member_count 群组人数');
INSERT INTO `ot_seo_rule` VALUES (1029, '某篇帖子的内容页', 'Group', 'Index', 'detail', 1, '', '', '', 0, 'group：群组变量集\n   group.title 群组标题\n   group.user.nickname 创始人昵称\n   group.member_count 群组人数\npost：帖子变量集\n   post.title 帖子标题\n   post.content 帖子内容');
INSERT INTO `ot_seo_rule` VALUES (1030, '创建群组', 'Group', 'Index', 'create', 1, '', '', '', 0, '-');
INSERT INTO `ot_seo_rule` VALUES (1031, '发现', 'Group', 'Index', 'discover', 1, '', '', '', 0, '-');
INSERT INTO `ot_seo_rule` VALUES (1032, '精选', 'Group', 'Index', 'select', 1, '', '', '', 0, '-');
INSERT INTO `ot_seo_rule` VALUES (1033, '找人首页', 'People', 'Index', 'index', 1, '{$MODULE_ALIAS}', '{$MODULE_ALIAS}', '{$MODULE_ALIAS}', 0, '-');
INSERT INTO `ot_seo_rule` VALUES (1034, '微店首页', 'Store', 'Index', 'index', 1, '', '', '', 0, '-');
INSERT INTO `ot_seo_rule` VALUES (1035, '某个分类下的商品列表页', 'Store', 'Index', 'li', 1, '', '', '', 0, 'type：当前分类变量集\n   type.title 分类名称');
INSERT INTO `ot_seo_rule` VALUES (1036, '搜索商品列表页', 'Store', 'Index', 'search', 1, '', '', '', 0, 'searchKey：搜索关键词');
INSERT INTO `ot_seo_rule` VALUES (1037, '单个商品的详情页', 'Store', 'Index', 'info', 1, '', '', '', 0, 'info：商品变量集\n   info.title 商品标题\n   info.des 商品描述\n   info.shop：店铺变量集\n       info.shop.title 店铺名称\n       info.shop.summary 店铺简介\n       info.shop.position 店铺所在地\n       info.shop.user.nickname 店主昵称');
INSERT INTO `ot_seo_rule` VALUES (1038, '店铺街', 'Store', 'Index', 'lists', 1, '', '', '', 0, '-');
INSERT INTO `ot_seo_rule` VALUES (1039, '某个店铺的首页', 'Store', 'Shop', 'detail', 1, '', '', '', 0, 'shop：店铺变量集\n   shop.title 店铺名称\n   shop.summary 店铺简介\n   shop.position 店铺所在地\n   shop.user.nickname 店主昵称');
INSERT INTO `ot_seo_rule` VALUES (1040, '某个店铺下的商品列表页', 'Store', 'Shop', 'goods', 1, '', '', '', 0, 'shop：店铺变量集\n   shop.title 店铺名称\n   shop.summary 店铺简介\n   shop.position 店铺所在地\n   shop.user.nickname 店主昵称');
INSERT INTO `ot_seo_rule` VALUES (1041, '分类信息首页', 'Cat', 'Index', 'index', 1, '', '', '', 0, '-');
INSERT INTO `ot_seo_rule` VALUES (1042, '某个模型下的列表页', 'Cat', 'Index', 'li', 1, '', '', '', 0, 'entity：当前模型变量集\n   entity.alias 模型名');
INSERT INTO `ot_seo_rule` VALUES (1043, '某条信息的详情页', 'Cat', 'Index', 'info', 1, '', '', '', 0, 'entity：当前模型变量集\n   entity.alias 模型名\ninfo：当前信息\n   info.title 信息名称\nuser.nickname 发布者昵称');
INSERT INTO `ot_seo_rule` VALUES (1044, '待回答页面', 'Question', 'Index', 'waitanswer', 1, '', '', '', 0, '-');
INSERT INTO `ot_seo_rule` VALUES (1045, '热门问题', 'Question', 'Index', 'goodquestion', 1, '', '', '', 0, '-');
INSERT INTO `ot_seo_rule` VALUES (1046, '我的回答', 'Question', 'Index', 'myquestion', 1, '', '', '', 0, '-');
INSERT INTO `ot_seo_rule` VALUES (1047, '全部问题', 'Question', 'Index', 'questions', 1, '', '', '', 0, '-');
INSERT INTO `ot_seo_rule` VALUES (1048, '详情', 'Question', 'Index', 'detail', 1, '', '', '', 0, 'question：问题变量集\n   question.title 问题标题\n   question.description 问题描述\n   question.answer_num 回答数\nbest_answer：最佳回答\n   best_answer.content 最佳答案内容');

-- ----------------------------
-- Table structure for ot_session
-- ----------------------------
DROP TABLE IF EXISTS `ot_session`;
CREATE TABLE `ot_session`  (
  `session_id` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_expire` int(11) NOT NULL,
  `session_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  UNIQUE INDEX `session_id`(`session_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_session
-- ----------------------------
INSERT INTO `ot_session` VALUES ('vt21jbdrj52trvrh8c102qp5n5', 1542870219, '');
INSERT INTO `ot_session` VALUES ('et84siaq50aor3gfuof1pek5d1', 1542870220, '');
INSERT INTO `ot_session` VALUES ('6ait2g6a815ia5tj239tav9n14', 1542870218, '');

-- ----------------------------
-- Table structure for ot_sso_app
-- ----------------------------
DROP TABLE IF EXISTS `ot_sso_app`;
CREATE TABLE `ot_sso_app`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `config` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_super_links
-- ----------------------------
DROP TABLE IF EXISTS `ot_super_links`;
CREATE TABLE `ot_super_links`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int(1) NOT NULL DEFAULT 1 COMMENT '类别（1：图片，2：普通）',
  `title` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '站点名称',
  `cover_id` int(10) NOT NULL COMMENT '图片ID',
  `link` char(140) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `level` int(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '优先级',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态（0：禁用，1：正常）',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '友情连接表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_support
-- ----------------------------
DROP TABLE IF EXISTS `ot_support`;
CREATE TABLE `ot_support`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用名',
  `row` int(11) NOT NULL COMMENT '应用标识',
  `uid` int(11) NOT NULL COMMENT '用户',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  `table` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支持的表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_support
-- ----------------------------
INSERT INTO `ot_support` VALUES (2, 'Weibo', 1, 1, 1531131265, 'weibo_comment');
INSERT INTO `ot_support` VALUES (3, 'Weibo', 4, 1, 1532406802, 'weibo');
INSERT INTO `ot_support` VALUES (4, 'Weibo', 3, 1, 1532408693, 'weibo_comment');
INSERT INTO `ot_support` VALUES (6, 'Weibo', 6, 1, 1532409403, 'weibo');
INSERT INTO `ot_support` VALUES (8, 'Weibo', 7, 1, 1535529284, 'weibo');
INSERT INTO `ot_support` VALUES (9, 'Weibo', 7, 1, 1535530067, 'weibo_comment');
INSERT INTO `ot_support` VALUES (10, 'Weibo', 7, 100, 1535530268, 'weibo');
INSERT INTO `ot_support` VALUES (11, 'Weibo', 12, 1, 1535605365, 'weibo');
INSERT INTO `ot_support` VALUES (12, 'Weibo', 8, 1, 1535605390, 'weibo');
INSERT INTO `ot_support` VALUES (13, 'Weibo', 6, 1, 1535605793, 'weibo_comment');
INSERT INTO `ot_support` VALUES (14, 'Weibo', 13, 1, 1535614593, 'weibo');
INSERT INTO `ot_support` VALUES (15, 'Weibo', 17, 1, 1535965955, 'weibo');
INSERT INTO `ot_support` VALUES (16, 'Weibo', 3, 1, 1536046789, 'weibo');
INSERT INTO `ot_support` VALUES (17, 'Weibo', 11, 1, 1536046793, 'weibo');
INSERT INTO `ot_support` VALUES (18, 'Weibo', 9, 1, 1536047254, 'weibo');
INSERT INTO `ot_support` VALUES (20, 'Weibo', 5, 1, 1536047734, 'weibo');
INSERT INTO `ot_support` VALUES (21, 'Weibo', 25, 1, 1536047742, 'weibo');
INSERT INTO `ot_support` VALUES (22, 'Weibo', 24, 1, 1536047743, 'weibo');
INSERT INTO `ot_support` VALUES (23, 'Weibo', 26, 100, 1536050996, 'weibo');
INSERT INTO `ot_support` VALUES (24, 'Weibo', 50, 1, 1536631539, 'weibo');
INSERT INTO `ot_support` VALUES (25, 'Weibo', 51, 1, 1536631542, 'weibo');
INSERT INTO `ot_support` VALUES (26, 'Weibo', 65, 1, 1537168006, 'weibo');
INSERT INTO `ot_support` VALUES (27, 'Weibo', 68, 1, 1537331655, 'weibo');
INSERT INTO `ot_support` VALUES (28, 'Weibo', 73, 1, 1538018730, 'weibo');
INSERT INTO `ot_support` VALUES (37, 'Weibo', 73, 100, 1538021774, 'weibo');

-- ----------------------------
-- Table structure for ot_sync_login
-- ----------------------------
DROP TABLE IF EXISTS `ot_sync_login`;
CREATE TABLE `ot_sync_login`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type_uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `oauth_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `oauth_token_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_sync` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_talk
-- ----------------------------
DROP TABLE IF EXISTS `ot_talk`;
CREATE TABLE `ot_talk`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL,
  `uids` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会话表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_talk_message
-- ----------------------------
DROP TABLE IF EXISTS `ot_talk_message`;
CREATE TABLE `ot_talk_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `talk_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '聊天消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_talk_message_push
-- ----------------------------
DROP TABLE IF EXISTS `ot_talk_message_push`;
CREATE TABLE `ot_talk_message_push`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `source_id` int(11) NOT NULL COMMENT '来源消息id',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `status` tinyint(4) NOT NULL,
  `talk_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '状态，0为未提示，1为未点击，-1为已点击' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ot_talk_push
-- ----------------------------
DROP TABLE IF EXISTS `ot_talk_push`;
CREATE TABLE `ot_talk_push`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '接收推送的用户id',
  `source_id` int(11) NOT NULL COMMENT '来源id',
  `create_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '状态，0为未提示，1为未点击，-1为已点击',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '对话推送表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ot_test
-- ----------------------------
DROP TABLE IF EXISTS `ot_test`;
CREATE TABLE `ot_test`  (
  `test` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_tile
-- ----------------------------
DROP TABLE IF EXISTS `ot_tile`;
CREATE TABLE `ot_tile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL COMMENT '父页面id',
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图标',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` int(11) NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `title_vo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '父页面标题',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路径',
  `url_vo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '父页面路径',
  `tile_bg` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '块颜色(背景)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '常用操作' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_tile
-- ----------------------------
INSERT INTO `ot_tile` VALUES (1, 3, 'direction', 1, 1, '用户管理', '用户', 'User/index', 'User/index', '#1ba1e2');
INSERT INTO `ot_tile` VALUES (2, 269, 'direction', 2, 1, '敏感词设置', '运营', 'Sensitive/config', 'Super_links/index', '#1ba1e2');
INSERT INTO `ot_tile` VALUES (3, 10074, 'direction', 3, 1, '作品管理', '作品', 'Weibo/weibo', 'Weibo/weibo', '#1ba1e2');

-- ----------------------------
-- Table structure for ot_ucenter_admin
-- ----------------------------
DROP TABLE IF EXISTS `ot_ucenter_admin`;
CREATE TABLE `ot_ucenter_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员用户ID',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ot_ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `ot_ucenter_member`;
CREATE TABLE `ot_ucenter_member`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `email` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户手机',
  `reg_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT 0 COMMENT '注册IP',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT 0 COMMENT '最后登录IP',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '用户状态',
  `type` tinyint(4) NOT NULL COMMENT '1为用户名注册，2为邮箱注册，3为手机注册',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of ot_ucenter_member
-- ----------------------------
INSERT INTO `ot_ucenter_member` VALUES (1, 'admin', '761db873f3df4ded524758fca223cf9b', 'admin@admin.com', '', 1531127370, 3063235528, 1542707260, 2130706433, 1531127370, 1, 1);
INSERT INTO `ot_ucenter_member` VALUES (100, 'Vonder', '761db873f3df4ded524758fca223cf9b', '1037757846@ourstu.com', '18140191539', 1535530253, 2101843548, 1539052454, 2130706433, 1535530253, 1, 2);
INSERT INTO `ot_ucenter_member` VALUES (101, 'wangdi', '761db873f3df4ded524758fca223cf9b', '', '18140191539', 1536051978, 2130706433, 1536303410, 2130706433, 1536051978, 1, 3);

-- ----------------------------
-- Table structure for ot_ucenter_score_type
-- ----------------------------
DROP TABLE IF EXISTS `ot_ucenter_score_type`;
CREATE TABLE `ot_ucenter_score_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type_value` int(11) NOT NULL,
  `type_key` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_ucenter_score_type
-- ----------------------------
INSERT INTO `ot_ucenter_score_type` VALUES (1, '积分', 1, '分', 0, 0);
INSERT INTO `ot_ucenter_score_type` VALUES (2, '威望', 1, '点', 0, 0);
INSERT INTO `ot_ucenter_score_type` VALUES (3, '贡献', 1, '元', 0, 0);
INSERT INTO `ot_ucenter_score_type` VALUES (4, '余额', 1, '点', 0, 0);

-- ----------------------------
-- Table structure for ot_ucenter_setting
-- ----------------------------
DROP TABLE IF EXISTS `ot_ucenter_setting`;
CREATE TABLE `ot_ucenter_setting`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配置类型（1-用户配置）',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_ucenter_short
-- ----------------------------
DROP TABLE IF EXISTS `ot_ucenter_short`;
CREATE TABLE `ot_ucenter_short`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `short` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '个性域名',
  `can_change_num` int(11) NOT NULL COMMENT '可修改次数，备用字段，用户商业或任务获得',
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户个性域名' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_ucenter_user_link
-- ----------------------------
DROP TABLE IF EXISTS `ot_ucenter_user_link`;
CREATE TABLE `ot_ucenter_user_link`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uc_uid` int(11) NOT NULL,
  `uc_username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uc_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_url
-- ----------------------------
DROP TABLE IF EXISTS `ot_url`;
CREATE TABLE `ot_url`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT 2 COMMENT '状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_url`(`url`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '链接表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ot_user_config
-- ----------------------------
DROP TABLE IF EXISTS `ot_user_config`;
CREATE TABLE `ot_user_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 0,
  `model` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_user_config
-- ----------------------------
INSERT INTO `ot_user_config` VALUES (1, 100, 'user_cover', 0, '', '5');

-- ----------------------------
-- Table structure for ot_user_nav
-- ----------------------------
DROP TABLE IF EXISTS `ot_user_nav`;
CREATE TABLE `ot_user_nav`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `title` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '频道标题',
  `url` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '频道连接',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '导航排序',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  `target` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '新窗口打开',
  `color` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `band_color` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `band_text` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1000 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_user_nav
-- ----------------------------
INSERT INTO `ot_user_nav` VALUES (1, '个人主页', 'ucenter/Index/index', 0, 0, 0, 1, 0, '', '', '', '');
INSERT INTO `ot_user_nav` VALUES (2, '消息中心', 'ucenter/message/message', 0, 0, 0, 1, 0, '', '', '', '');
INSERT INTO `ot_user_nav` VALUES (3, '我的收藏', 'ucenter/Collection/index', 0, 0, 0, 1, 0, '', '', '', '');
INSERT INTO `ot_user_nav` VALUES (4, '我的头衔', 'ucenter/Index/rank', 0, 0, 0, 1, 0, '', '', '', '');
INSERT INTO `ot_user_nav` VALUES (5, '申请认证', 'ucenter/attest/process/go_index/1', 0, 0, 0, 1, 0, '', '', '', '');

-- ----------------------------
-- Table structure for ot_user_role
-- ----------------------------
DROP TABLE IF EXISTS `ot_user_role`;
CREATE TABLE `ot_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '2：未审核，1:启用，0：禁用，-1：删除',
  `step` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录当前执行步骤',
  `init` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否初始化',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色关联' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_user_role
-- ----------------------------
INSERT INTO `ot_user_role` VALUES (1, 1, 1, 1, 'finish', 1);
INSERT INTO `ot_user_role` VALUES (2, 100, 1, 1, 'finish', 1);
INSERT INTO `ot_user_role` VALUES (3, 101, 1, 1, 'finish', 1);

-- ----------------------------
-- Table structure for ot_user_tag
-- ----------------------------
DROP TABLE IF EXISTS `ot_user_tag`;
CREATE TABLE `ot_user_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `pid` int(11) NOT NULL,
  `sort` tinyint(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_user_tag
-- ----------------------------
INSERT INTO `ot_user_tag` VALUES (1, '默认', 1, 0, 0);
INSERT INTO `ot_user_tag` VALUES (2, '开发者', 1, 1, 0);
INSERT INTO `ot_user_tag` VALUES (3, '站长', 1, 1, 0);

-- ----------------------------
-- Table structure for ot_user_tag_link
-- ----------------------------
DROP TABLE IF EXISTS `ot_user_tag_link`;
CREATE TABLE `ot_user_tag_link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `tags` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签ids',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户标签关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_user_token
-- ----------------------------
DROP TABLE IF EXISTS `ot_user_token`;
CREATE TABLE `ot_user_token`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_user_token
-- ----------------------------
INSERT INTO `ot_user_token` VALUES (1, 1, '5Q9v2G3FZo1V6j0nNdBDMHUYfaupPqLgixRcEWJs', 1531131437);
INSERT INTO `ot_user_token` VALUES (2, 100, 'KsAqWJQdTxVtj593hb7mYPZuky80OBDgMzRlCoI4', 1535708069);
INSERT INTO `ot_user_token` VALUES (3, 101, 'hcVt0dieyLJTuIks7UFP2v86NjomGKQOZDCBzHnl', 1536053911);

-- ----------------------------
-- Table structure for ot_verify
-- ----------------------------
DROP TABLE IF EXISTS `ot_verify`;
CREATE TABLE `ot_verify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `verify` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_verify
-- ----------------------------
INSERT INTO `ot_verify` VALUES (1, 100, '1037757846@qq.com', 'email', '4JJFkfNj8TxE5i6FBadaUMWkK8miYh10', 1535710308);
INSERT INTO `ot_verify` VALUES (3, 0, '18140191539', 'mobile', '235041', 1536051596);

-- ----------------------------
-- Table structure for ot_version
-- ----------------------------
DROP TABLE IF EXISTS `ot_version`;
CREATE TABLE `ot_version`  (
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版本名',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  `update_time` int(11) NOT NULL COMMENT '更新的时间',
  `log` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新日志',
  `url` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接到的远程文章',
  `number` int(11) NOT NULL COMMENT '序列号，一般用日期数字标示',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版本号',
  `is_current` tinyint(4) NOT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  INDEX `id`(`number`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自动更新表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_weibo
-- ----------------------------
DROP TABLE IF EXISTS `ot_weibo`;
CREATE TABLE `ot_weibo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` int(11) NOT NULL,
  `comment_count` int(11) NOT NULL,
  `likes_count` int(11) NOT NULL COMMENT '喜欢',
  `status` int(11) NOT NULL DEFAULT 0,
  `is_top` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repost_count` int(11) NOT NULL,
  `from` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `belong` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐到哪个大分类下,10002/作品,10003/行业,10004/机构,10005/飞手',
  `pos` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'weibo/industry/organization/player,属于哪几个大分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 114 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_weibo
-- ----------------------------
INSERT INTO `ot_weibo` VALUES (1, 1, '', '哇哈哈哈', '7,10,12', 1531131244, 7, 0, 1, '', 'feed', 'a:0:{}', 0, '', '8,6,5', '', '');
INSERT INTO `ot_weibo` VALUES (2, 1, '', '哈哈', '0', 1531131472, 3, 0, 1, '', 'image', 'a:1:{s:10:\"attach_ids\";s:1:\"2\";}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (3, 1, '', '怎么PC不能传图', '0', 1531131499, 3, 0, 1, '', 'image', 'a:1:{s:10:\"attach_ids\";s:1:\"1\";}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (4, 1, '', '[topic:1]', '1,4,19', 1532406633, 10, 0, 1, '', 'feed', 'a:0:{}', 0, '', '10,6', '', '');
INSERT INTO `ot_weibo` VALUES (5, 1, '', '话题是怎么回复的', '0', 1532406683, 3, 0, 1, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (6, 1, '', '可以发布的时候@人吗a？@admin', '0', 1532408899, 3, 0, 1, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (7, 1, '', '好~', '0', 1535529275, 5, 0, 1, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (8, 100, '', '[at:1]/nb可以么?', '0', 1535530381, 0, 0, 1, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (9, 1, '', '公牛怎样?', '0', 1535531675, 3, 0, 1, '', 'image', 'a:1:{s:10:\"attach_ids\";s:1:\"3\";}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (11, 1, '', '干什么?', '0', 1535535498, 3, 0, 1, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (12, 1, '', '来玩', '0', 1535601428, 4, 0, 1, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (13, 1, '', '[at:1]', '0', 1535611965, 3, 0, 1, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (14, 1, '', '[at:100]', '0', 1535614435, 3, 0, 1, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (15, 1, '', '好难', '0', 1535705951, 3, 0, 1, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (16, 1, '', '好好爱护', '0', 1535705978, 3, 0, 1, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (17, 1, '', '[topic:2]恩', '0', 1535964612, 3, 0, 1, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (18, 1, '', '[topic:3]啊', '0', 1535964630, 3, 0, 1, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (19, 1, '', '哦[topic:4]', '0', 1535964652, 3, 0, 1, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (20, 1, '', '呵[topic:5]', '0', 1535964664, 3, 0, 1, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (21, 1, '', '[topic:6],哈哈哈哈', '0', 1535966001, 3, 0, 1, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (22, 1, '', '接口测试发表微博功能', '0', 1536043329, 3, 0, 1, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (23, 1, '', '接口测试发表微博功能', '0', 1536043345, 3, 0, 1, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (24, 1, '', '接口测试发表微博功能', '0', 1536043355, 3, 0, 1, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (25, 1, '', '接口测试发表微博功能', '0', 1536044052, 3, 0, 1, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (26, 100, '', 'VOnder', '0', 1536049592, 0, 0, 1, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (27, 101, '', '奔波', '0', 1536053922, 4, 0, 1, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (28, 1, '', '1', '0', 1536126586, 3, 0, 1, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (29, 101, '', '接口测试发表评论功能', '0', 1536126612, 0, 0, 1, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (31, 100, '', '好', '0', 1536133227, 0, 0, 1, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (32, 100, '', 'VIGI', '0', 1536134598, 0, 0, 1, '', 'image', 'a:1:{s:10:\"attach_ids\";s:1:\"5\";}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (33, 101, '', '接口测试发表微博功能', '0', 1536139012, 0, 0, 2, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (34, 101, '', '接口测试发表微博功能', '0', 1536140094, 0, 0, 0, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (35, 101, '', '接口测试发表微博功能', '0', 1536141398, 0, 0, 2, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (36, 101, '', '哦[topic:7]', '0', 1536142310, 0, 0, 2, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (37, 1, '', '[topic:8]是人文么?', '0', 1536142414, 4, 0, 1, '', 'feed', 'a:0:{}', 5, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (38, 101, '', '#话题#', '0', 1536200476, 0, 0, 2, '', 'feed', 'a:0:{}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (39, 1, '', '是的', '0', 1536203185, 4, 0, 1, '', 'repost', 'a:2:{s:6:\"source\";N;s:8:\"sourceId\";i:37;}', 1, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (40, 1, '', '是什么?[baiyan]//@/nb：是的', '0', 1536206607, 5, 0, 1, '', 'repost', 'a:2:{s:6:\"source\";N;s:8:\"sourceId\";i:37;}', 3, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (41, 1, '', '是这样的', '0', 1536210442, 0, 0, 2, '', 'repost', 'a:2:{s:6:\"source\";N;s:8:\"sourceId\";i:37;}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (42, 1, '', '是这样的吗?', '0', 1536210535, 0, 0, 2, '', 'repost', 'a:2:{s:6:\"source\";N;s:8:\"sourceId\";i:37;}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (43, 1, '', '是这样的好吗?', '0', 1536210567, 0, 0, 2, '', 'repost', 'a:2:{s:6:\"source\";N;s:8:\"sourceId\";i:37;}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (68, 1, '这是标题23', '是这样的好', '2,7,11', 1537177722, 3, 0, 1, '', 'image', 'a:1:{s:10:\"attach_ids\";s:7:\"5,6,7,8\";}', 0, '', '6,8,5', '', '');
INSERT INTO `ot_weibo` VALUES (67, 1, '上大学张出租车[topic:8][topic:4]', 'image', '1', 1537177479, 3, 0, 1, '', 'image', 'a:1:{s:10:\"attach_ids\";s:7:\"5,6,7,8\";}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (66, 1, '123', '阿斯达', '0', 1537168061, 3, 0, 1, '', 'image', 'a:1:{s:10:\"attach_ids\";s:12:\"6\";}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (50, 1, '', '图片上传测试[topic:2]', '0', 1536630925, 3, 0, 1, '', 'image', 'a:1:{s:10:\"attach_ids\";s:1:\"5\";}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (51, 1, '', '[topic:4]很美', '0', 1536631208, 3, 0, 1, '', 'image', 'a:1:{s:10:\"attach_ids\";s:7:\"5,6,7,8\";}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (58, 0, '', '是这样的好吗?', '0', 1537164762, 0, 0, 2, '', 'image', 'a:1:{s:10:\"attach_ids\";s:7:\"5,6,7,8\";}', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (57, 1, '', '是这样的好吗?', '0', 1537163746, 0, 0, 2, '', 'image', 'a:1:{s:10:\"attach_ids\";s:7:\"5,6,7,8\";}', 0, '', '', 'weibo', '');
INSERT INTO `ot_weibo` VALUES (59, 0, '', '是这样的好吗?', '0', 1537164792, 0, 0, 2, '', 'image', 'a:1:{s:10:\"attach_ids\";s:7:\"5,6,7,8\";}', 0, '', '', 'weibo', '');
INSERT INTO `ot_weibo` VALUES (60, 0, '', '是这样的好吗?', '1', 1537164819, 0, 0, 2, '', 'image', 'a:1:{s:10:\"attach_ids\";s:10:\"\";}', 0, '', '', 'weibo', '');
INSERT INTO `ot_weibo` VALUES (61, 0, '', '是这样的好吗?', '1', 1537164843, 0, 0, 2, '', 'image', 'a:1:{s:10:\"attach_ids\";s:10:\"\";}', 0, '', '', 'weibo', '');
INSERT INTO `ot_weibo` VALUES (62, 0, '', '是这样的好吗?', '0', 1537164884, 0, 0, 2, '', 'image', 'a:1:{s:10:\"attach_ids\";s:7:\"5,6,7,8\";}', 0, '', '', 'weibo', '');
INSERT INTO `ot_weibo` VALUES (63, 0, '', '是这样的好吗?123', '0', 1537167475, 0, 0, 2, '', 'image', 'a:1:{s:10:\"attach_ids\";s:7:\"5,6,7,8\";}', 0, '', '', 'weibo', '');
INSERT INTO `ot_weibo` VALUES (65, 1, '这是标题', '是这样的好吗?admin', '2,7,11', 1537167702, 28, 0, 1, '', 'image', 'a:1:{s:10:\"attach_ids\";s:7:\"5,6,7,8\";}', 1, '', '10,8,6', 'weibo', '');
INSERT INTO `ot_weibo` VALUES (69, 1, '发个图', 'admin', '', 1537343781, 0, 0, 2, '', 'image', 'a:1:{s:10:\"attach_ids\";s:7:\"5,6,7,8\";}', 0, '', '6,5,8,10', 'weibo', '');
INSERT INTO `ot_weibo` VALUES (70, 0, '这是标题1423', 'sdasdasfzxcaghxcbxcvx', '', 1537936724, 0, 0, 2, '', 'image', 'a:2:{s:10:\"attach_ids\";s:9:\"1,5,1,2,3\";}', 0, '', '', 'weibo', '');
INSERT INTO `ot_weibo` VALUES (71, 0, '这是标题1423', 'sdasdasfzxcaghxcbxcvx', '', 1537936761, 0, 0, 2, '', 'image', 'a:1:{s:10:\"attach_ids\";s:9:\"1,5,1,2,3\";}', 0, '', '', 'weibo', '');
INSERT INTO `ot_weibo` VALUES (72, 101, '这是标题1423', '是这样的好', '4,1,2,3', 1537948599, 0, 0, 1, '', '', '', 0, '', '1,2,3,4,1', 'weibo', '');
INSERT INTO `ot_weibo` VALUES (73, 101, '这是标题1423', '是这样的好', '4,1,2,3', 1537948762, 0, 1, 1, '', '', '', 0, '', '1,2,3,4,1', 'weibo', '');
INSERT INTO `ot_weibo` VALUES (74, 101, '这是标题1423', 'sdasdasfzxcaghxcbxcvx', '1,2,3', 1538194443, 0, 0, 2, '', '', '', 0, '', '', 'weibo', '');
INSERT INTO `ot_weibo` VALUES (75, 0, '行业测试', '行业测试', '10,18', 1538984071, 0, 0, 1, '', '', '5', 0, '', '', 'weibo', '');
INSERT INTO `ot_weibo` VALUES (76, 0, '自行车', '', '', 1538984975, 0, 0, 0, '', '', '', 0, '', '', 'weibo', '');
INSERT INTO `ot_weibo` VALUES (77, 0, '123', '', '', 1538985929, 0, 0, 0, '', '', '', 0, '', '', 'weibo', '');
INSERT INTO `ot_weibo` VALUES (78, 0, '1124', '', '', 1538985981, 0, 0, 1, '', '', '', 0, '', '', 'industry', '');
INSERT INTO `ot_weibo` VALUES (79, 0, '微博行政村', '', '2,10', 1538986538, 0, 0, 1, '', '', '', 0, '', '', 'weibo', '');
INSERT INTO `ot_weibo` VALUES (80, 0, '123', '123', '', 1538986665, 0, 0, 0, '', '', '', 0, '', '', 'weibo', '');
INSERT INTO `ot_weibo` VALUES (81, 0, '撒旦', '阿斯顿', '1', 1538988800, 0, 0, 1, '', '', '', 0, '', '', 'weibo', '');
INSERT INTO `ot_weibo` VALUES (82, 0, '123', '123', '', 1538990386, 0, 0, 1, '', '', '', 0, '', '', 'organization', '');
INSERT INTO `ot_weibo` VALUES (83, 0, '想中v型注册', 'v字形长v字吃', '1,2', 1538990475, 0, 0, 1, '', '', '', 0, '', '', 'industry', '');
INSERT INTO `ot_weibo` VALUES (84, 0, '祥城镇v', '想中v型在', '', 1538990671, 0, 0, 1, '', '', '', 0, '', '6,5', 'industry', '');
INSERT INTO `ot_weibo` VALUES (85, 0, '飞天', '飞天', '', 1538990815, 0, 0, 1, '', '', '', 0, '', '8', 'player', '');
INSERT INTO `ot_weibo` VALUES (86, 0, 'zuop', 'zuop', '1,10', 1539051915, 0, 0, 1, '', '', '6,10,8,5', 0, '', '6,10,8,5', 'weibo', '');
INSERT INTO `ot_weibo` VALUES (87, 1, 'zuopin', 'zuopin', '1,18', 1539052847, 0, 0, 1, '', '', '10,8,6', 0, '', '', '', '');
INSERT INTO `ot_weibo` VALUES (88, 1, '作品', '作品', '2,12,18', 1539056365, 0, 0, 1, '', '', '8,5', 0, '', '6,5', 'weibo', '');
INSERT INTO `ot_weibo` VALUES (89, 1, '飞手', '飞手', '', 1539056384, 0, 0, 1, '10002', '', '10,6', 0, '', '10,6', 'player', '');
INSERT INTO `ot_weibo` VALUES (90, 0, '这是标题1423', '是这样的好', '1,4,2', 1539064084, 0, 0, 2, '10002', '', '', 0, '', '', 'weibo', '');
INSERT INTO `ot_weibo` VALUES (91, 100, '这是标题1423', '是这样的好', '1,4,2', 1539064120, 0, 0, 2, '10002', '', '', 0, '', '', 'weibo', '');
INSERT INTO `ot_weibo` VALUES (92, 100, '这是标题1423', '是这样的好', '1,4,2', 1539064271, 0, 0, 1, '10002', '', '', 0, '', '6,10', '', '');
INSERT INTO `ot_weibo` VALUES (93, 100, '这是标题1423', '是这样的好', '1,4,2', 1539064310, 0, 0, 1, '10002', '', '', 0, '', '6,10', '10002', '');
INSERT INTO `ot_weibo` VALUES (94, 1, '飞手', '飞手', '', 1539065293, 0, 0, 1, '10002', '', '', 0, '', '8', '10005', '');
INSERT INTO `ot_weibo` VALUES (95, 100, '这是标题1423', '是这样的好', '1,4,2', 1539065358, 0, 0, 1, '10002', '', '', 0, '', '6,10', '10002', '');
INSERT INTO `ot_weibo` VALUES (96, 1, 'ASD', 'ASD', '', 1539069645, 0, 0, 0, '10002', '', '', 0, '', '6', '10003', '');
INSERT INTO `ot_weibo` VALUES (97, 1, '123', '213', '', 1539069655, 0, 0, 0, '10002', '', '', 0, '', '6,10', '10003', '');
INSERT INTO `ot_weibo` VALUES (98, 1, '1234', '', '', 1539070247, 0, 0, 1, '10002', '', '', 0, '', '42', '10003', '');
INSERT INTO `ot_weibo` VALUES (99, 1, '', '', '', 1539070603, 0, 0, 0, '10002', '', '', 0, '', '10', '10002', '');
INSERT INTO `ot_weibo` VALUES (100, 1, '124', '1241', '', 1539071659, 0, 0, 1, '10002', '', '', 0, '', '6,10', '10002', '');
INSERT INTO `ot_weibo` VALUES (101, 1, '中小城镇', '想成长性', '', 1539071711, 0, 0, 1, '10002', '', '', 0, '', '6,10', '10002', '');
INSERT INTO `ot_weibo` VALUES (102, 1, '张徐总徐', '想中v字徐总', '', 1539071992, 0, 0, 1, '10002', '', '', 0, '', '6', '10002', '');
INSERT INTO `ot_weibo` VALUES (103, 1, '自行车', '自行车', '', 1539072049, 0, 0, 1, '10002', '', '', 0, '', '37', '10002', '');
INSERT INTO `ot_weibo` VALUES (104, 1, '', '', '', 1539072735, 0, 0, 0, '10002', '', '', 0, '', '6,10', '10002', '');
INSERT INTO `ot_weibo` VALUES (105, 1, '123', '124', '', 1539072994, 0, 0, 1, '10002', '', '', 0, '', '8', '10002', '10003');
INSERT INTO `ot_weibo` VALUES (106, 1, '4234', '234234', '', 1539073982, 0, 0, 1, '10002', '', '', 0, '', '6', '10003', '');
INSERT INTO `ot_weibo` VALUES (107, 1, '14', '1515', '4,8', 1539074103, 0, 0, 1, '10002', '', '', 0, '', '10', '10002', '');
INSERT INTO `ot_weibo` VALUES (108, 1, '', '', '', 1539074694, 0, 0, 1, '10003', '', '', 0, '', '6', '10002', '10003');
INSERT INTO `ot_weibo` VALUES (109, 1, '4124', '121', '8,9,14', 1539074863, 4, 0, 1, '10002,10005', '', '', 0, '', '8', '10002', '10003,10004,10005');
INSERT INTO `ot_weibo` VALUES (110, 1, '', '', '', 1539078142, 0, 0, 0, '', '', '', 0, '', '6,10', '10003', '');
INSERT INTO `ot_weibo` VALUES (111, 1, '机构微博', '开个玩笑,做个测试,有个想法', '', 1541570250, 0, 0, 1, '', '', '', 0, '', '45,46,47', '10004', '');
INSERT INTO `ot_weibo` VALUES (112, 1, 'cehsi ', 'ceshi', '1,2', 1542604520, 0, 0, 1, '10005,10002', '', '', 0, '', '', '10002', '10005');
INSERT INTO `ot_weibo` VALUES (113, 1, 'cehsi ', 'ceshi', '1,2,14', 1542604688, 0, 0, 2, '10004', '', '', 0, '', '', '10002', '10003,10004');

-- ----------------------------
-- Table structure for ot_weibo_cache
-- ----------------------------
DROP TABLE IF EXISTS `ot_weibo_cache`;
CREATE TABLE `ot_weibo_cache`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weibo_id` int(11) NOT NULL,
  `groups` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cache_html` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `weibo_id`(`weibo_id`) USING BTREE,
  INDEX `groups`(`groups`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微博html缓存表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ot_weibo_comment
-- ----------------------------
DROP TABLE IF EXISTS `ot_weibo_comment`;
CREATE TABLE `ot_weibo_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `weibo_id` int(11) NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `to_comment_id` int(11) NOT NULL,
  `support_down` int(11) NOT NULL DEFAULT 0 COMMENT '点赞数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_weibo_comment
-- ----------------------------
INSERT INTO `ot_weibo_comment` VALUES (1, 1, 1, '俺是大大', 1531131253, 0, 0, 1);
INSERT INTO `ot_weibo_comment` VALUES (2, 1, 1, '回复/nb@admin/nb：爱仕达打算', 1531131280, 1, 0, 0);
INSERT INTO `ot_weibo_comment` VALUES (3, 1, 4, '这里才是回复话题', 1532406781, 1, 0, 2);
INSERT INTO `ot_weibo_comment` VALUES (4, 1, 4, '回复/nb@admin/nb：对的对的', 1532408702, 1, 0, 0);
INSERT INTO `ot_weibo_comment` VALUES (5, 1, 4, '回复/nb@admin/nb：不对不对', 1532408723, 1, 0, 1);
INSERT INTO `ot_weibo_comment` VALUES (6, 1, 4, '回复/nb@admin/nb：对还是不对', 1532408734, 1, 0, 2);
INSERT INTO `ot_weibo_comment` VALUES (7, 1, 7, '好什么?', 1535529296, 1, 0, 2);
INSERT INTO `ot_weibo_comment` VALUES (8, 1, 7, '回复/nb@admin/nb：哦?', 1535607835, 1, 0, 0);
INSERT INTO `ot_weibo_comment` VALUES (9, 1, 12, '你好', 1535611276, 1, 0, 1);
INSERT INTO `ot_weibo_comment` VALUES (10, 1, 4, '接口测试评论功能', 1536040739, 1, 0, 0);
INSERT INTO `ot_weibo_comment` VALUES (11, 1, 4, '接口测试评论功能', 1536040884, 1, 0, 1);
INSERT INTO `ot_weibo_comment` VALUES (12, 1, 4, '接口测试评论功能', 1536041016, 1, 0, 0);
INSERT INTO `ot_weibo_comment` VALUES (13, 1, 27, '接口测试发表评论功能', 1536054982, 1, 0, 0);
INSERT INTO `ot_weibo_comment` VALUES (14, 1, 37, '是的', 1536203185, 1, 0, 0);
INSERT INTO `ot_weibo_comment` VALUES (15, 1, 39, '是什么?[baiyan]//@/nb：是的', 1536206607, 1, 0, 0);
INSERT INTO `ot_weibo_comment` VALUES (16, 101, 27, 'sdasdasfzxcaghxcbxcvx', 1536211880, 1, 0, 0);
INSERT INTO `ot_weibo_comment` VALUES (17, 101, 27, 'sdasdasfzxcaghxcbxcvx', 1536216803, 1, 0, 0);
INSERT INTO `ot_weibo_comment` VALUES (18, 1, 1, '1', 1536292928, 1, 0, 0);
INSERT INTO `ot_weibo_comment` VALUES (19, 1, 40, '是这样的好吗?', 1536300780, 1, 0, 0);
INSERT INTO `ot_weibo_comment` VALUES (20, 1, 40, '是这样的好吗?', 1536300788, 1, 0, 0);
INSERT INTO `ot_weibo_comment` VALUES (21, 101, 27, 'sdasdasfzxcaghxcbxcvx', 1538015328, 1, 0, 0);
INSERT INTO `ot_weibo_comment` VALUES (22, 1, 109, '回复测试回复测试', 1542360408, 1, 0, 0);
INSERT INTO `ot_weibo_comment` VALUES (23, 1, 109, '回复评论测试回复评论测试', 1542360471, 1, 0, 0);
INSERT INTO `ot_weibo_comment` VALUES (24, 1, 109, '回复评论测试回复评论测试', 1542360536, 1, 22, 0);
INSERT INTO `ot_weibo_comment` VALUES (25, 1, 1, 'ceshi', 1542620097, 1, 0, 0);
INSERT INTO `ot_weibo_comment` VALUES (26, 1, 109, 'ceshi', 1542620198, 1, 0, 0);

-- ----------------------------
-- Table structure for ot_weibo_likes
-- ----------------------------
DROP TABLE IF EXISTS `ot_weibo_likes`;
CREATE TABLE `ot_weibo_likes`  (
  `id` int(11) NOT NULL,
  `weibo_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ot_weibo_top
-- ----------------------------
DROP TABLE IF EXISTS `ot_weibo_top`;
CREATE TABLE `ot_weibo_top`  (
  `weibo_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '置顶标题',
  `dead_time` int(11) NOT NULL COMMENT '过期日期',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(2) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`weibo_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '置顶微博表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_weibo_top
-- ----------------------------
INSERT INTO `ot_weibo_top` VALUES (12, '精华', 1535697690, 'title', 1, 1535611290);

-- ----------------------------
-- Table structure for ot_weibo_topic
-- ----------------------------
DROP TABLE IF EXISTS `ot_weibo_topic`;
CREATE TABLE `ot_weibo_topic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '话题名',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/topicavatar.jpg' COMMENT '话题logo',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导语',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '二维码',
  `uadmin` int(11) NOT NULL DEFAULT 0 COMMENT '话题管理   默认无',
  `read_count` int(11) NOT NULL DEFAULT 0 COMMENT '阅读',
  `is_top` tinyint(4) NOT NULL,
  `weibo_num` int(11) NOT NULL DEFAULT 0 COMMENT '微博数',
  `status` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ot_weibo_topic
-- ----------------------------
INSERT INTO `ot_weibo_topic` VALUES (1, '自定义话题', 'https://www.demo.com/hpsc/Uploads/Picture/2018-09-04/5b8e4849339c8.png', '话题导语有什么用？', '0', 1, 21, 1, 1, 1);
INSERT INTO `ot_weibo_topic` VALUES (2, '人物', 'https://www.demo.com/hpsc/Uploads/Picture/2018-09-11/5b9721a198580.jpg', '大人物,小虾米', '', 1, 7, 0, 2, 1);
INSERT INTO `ot_weibo_topic` VALUES (3, '已删除话题', '/topicavatar.jpg', '', '', 0, 0, 1, 1, -1);
INSERT INTO `ot_weibo_topic` VALUES (4, '风景', 'https://www.demo.com/hpsc/Uploads/Picture/2018-09-04/5b8e4849339c8.png', '怡人', '', 0, 0, 0, 3, 1);
INSERT INTO `ot_weibo_topic` VALUES (5, '已删除话题', '/topicavatar.jpg', '', '', 0, 0, 0, 1, -1);
INSERT INTO `ot_weibo_topic` VALUES (6, '搞笑', '/topicavatar.jpg', '', '', 0, 0, 0, 1, 1);
INSERT INTO `ot_weibo_topic` VALUES (7, '话题', '/topicavatar.jpg', '', '', 0, 0, 0, 0, 1);
INSERT INTO `ot_weibo_topic` VALUES (8, '人文', '/topicavatar.jpg', '', '', 0, 2, 0, 2, 1);
INSERT INTO `ot_weibo_topic` VALUES (9, '科技', '/topicavatar.jpg', '', '', 0, 0, 0, 1, 1);
INSERT INTO `ot_weibo_topic` VALUES (10, '美食', '/topicavatar.jpg', '', '', 0, 0, 0, 1, 1);
INSERT INTO `ot_weibo_topic` VALUES (11, '色彩', '/topicavatar.jpg', '', '', 0, 0, 0, 1, 1);
INSERT INTO `ot_weibo_topic` VALUES (12, '测试', 'https://www.demo.com/hpsc/Uploads/Picture/2018-09-04/5b8e4849339c8.png', '124', '', 0, 0, 0, 0, 1);
INSERT INTO `ot_weibo_topic` VALUES (13, '测试', 'https://www.demo.com/hpsc/Uploads/Picture/2018-09-17/5b9f264183018.jpg', '124', '', 0, 0, 0, 0, -1);
INSERT INTO `ot_weibo_topic` VALUES (14, '表情包', '9', '123', '', 0, 0, 0, 0, 1);
INSERT INTO `ot_weibo_topic` VALUES (15, '已删除话题', '9', '123', '', 0, 0, 0, 0, -1);
INSERT INTO `ot_weibo_topic` VALUES (16, '已删除话题', '10', 'test', '', 0, 0, 0, 0, -1);
INSERT INTO `ot_weibo_topic` VALUES (17, '已删除话题', '5', '测试', '', 0, 0, 0, 0, -1);
INSERT INTO `ot_weibo_topic` VALUES (18, '测试话题', '/topicavatar.jpg', '', '', 0, 0, 0, 1, 1);
INSERT INTO `ot_weibo_topic` VALUES (19, '再测试', '/topicavatar.jpg', '', '', 0, 0, 0, 0, 1);
INSERT INTO `ot_weibo_topic` VALUES (20, '动漫', '', '动漫类型', '', 0, 0, 0, 0, 1);

-- ----------------------------
-- Table structure for ot_weibo_topic_follow
-- ----------------------------
DROP TABLE IF EXISTS `ot_weibo_topic_follow`;
CREATE TABLE `ot_weibo_topic_follow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of ot_weibo_topic_follow
-- ----------------------------
INSERT INTO `ot_weibo_topic_follow` VALUES (1, 1, 1, 1, 1532409293);

-- ----------------------------
-- Table structure for ot_weibo_topic_link
-- ----------------------------
DROP TABLE IF EXISTS `ot_weibo_topic_link`;
CREATE TABLE `ot_weibo_topic_link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weibo_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `is_top` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '话题、微博关联表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of ot_weibo_topic_link
-- ----------------------------
INSERT INTO `ot_weibo_topic_link` VALUES (1, 4, 1, 1, 1532406633, 0);
INSERT INTO `ot_weibo_topic_link` VALUES (2, 17, 2, 1, 1535964612, 0);
INSERT INTO `ot_weibo_topic_link` VALUES (3, 18, 3, 1, 1535964630, 0);
INSERT INTO `ot_weibo_topic_link` VALUES (4, 19, 4, 1, 1535964652, 0);
INSERT INTO `ot_weibo_topic_link` VALUES (5, 20, 5, 1, 1535964664, 0);
INSERT INTO `ot_weibo_topic_link` VALUES (6, 21, 6, 1, 1535966002, 0);
INSERT INTO `ot_weibo_topic_link` VALUES (7, 37, 8, 1, 1536142414, 0);
INSERT INTO `ot_weibo_topic_link` VALUES (8, 50, 2, 1, 1536630925, 0);
INSERT INTO `ot_weibo_topic_link` VALUES (9, 51, 4, 1, 1536631208, 0);
INSERT INTO `ot_weibo_topic_link` VALUES (10, 52, 9, 1, 1536632584, 0);
INSERT INTO `ot_weibo_topic_link` VALUES (11, 53, 10, 1, 1536632599, 0);
INSERT INTO `ot_weibo_topic_link` VALUES (12, 54, 11, 1, 1536632611, 0);
INSERT INTO `ot_weibo_topic_link` VALUES (13, 55, 18, 1, 1537160913, 0);
INSERT INTO `ot_weibo_topic_link` VALUES (14, 67, 8, 1, 1537177480, 0);
INSERT INTO `ot_weibo_topic_link` VALUES (15, 67, 4, 1, 1537177480, 0);

SET FOREIGN_KEY_CHECKS = 1;
