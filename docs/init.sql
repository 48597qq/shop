/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : 127.0.0.1:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 17/08/2021 17:40:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `provinceid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `cityid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `areaid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '县/区',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `is_default` int(0) NULL DEFAULT NULL COMMENT '是否是默认 1默认 0否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for areas
-- ----------------------------
DROP TABLE IF EXISTS `areas`;
CREATE TABLE `areas`  (
  `areaid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域ID',
  `area` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域名称',
  `cityid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市ID',
  PRIMARY KEY (`areaid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行政区域县区信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '品牌id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌名称',
  `image` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '品牌图片地址',
  `initial` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '品牌的首字母',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 325475 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '品牌表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `parent_id` int(0) NULL DEFAULT NULL COMMENT '上级ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11177 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品类目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for category_brand
-- ----------------------------
DROP TABLE IF EXISTS `category_brand`;
CREATE TABLE `category_brand`  (
  `category_id` int(0) NOT NULL COMMENT '分类ID',
  `brand_id` int(0) NOT NULL COMMENT '品牌ID',
  PRIMARY KEY (`brand_id`, `category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cities
-- ----------------------------
DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities`  (
  `cityid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市ID',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市名称',
  `provinceid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省份ID',
  PRIMARY KEY (`cityid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行政区域地州市信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单id',
  `total_num` int(0) NULL DEFAULT NULL COMMENT '数量合计',
  `moneys` int(0) NULL DEFAULT NULL COMMENT '金额合计',
  `pay_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '支付类型，1、在线支 付、0 货到付款',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '订单创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '订单更新时间',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '付款时间',
  `consign_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '交易完成时间',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户名称',
  `recipients` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '收货人',
  `recipients_mobile` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '收货人手 机',
  `recipients_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '收货人 地址',
  `weixin_transaction_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '交易 流水号',
  `order_status` int(0) NULL DEFAULT NULL COMMENT '订单状态,0:未完成,1: 已完成，2：已退货',
  `pay_status` int(0) NULL DEFAULT NULL COMMENT '支付状态,0:未支付，1： 已支付，2：支付失败',
  `is_delete` int(0) NULL DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE,
  INDEX `status`(`order_status`) USING BTREE,
  INDEX `payment_type`(`pay_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_sku
-- ----------------------------
DROP TABLE IF EXISTS `order_sku`;
CREATE TABLE `order_sku`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'ID',
  `category_one_id` int(0) NULL DEFAULT NULL COMMENT '1级分类',
  `category_two_id` int(0) NULL DEFAULT NULL COMMENT '2级分类',
  `category_three_id` int(0) NULL DEFAULT NULL COMMENT '3级分类',
  `spu_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'SPU_ID',
  `sku_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'SKU_ID',
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单ID',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品名称',
  `price` int(0) NULL DEFAULT NULL COMMENT '单价',
  `num` int(0) NULL DEFAULT NULL COMMENT '数量',
  `money` int(0) NULL DEFAULT NULL COMMENT '总金额',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_id`(`sku_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for provinces
-- ----------------------------
DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces`  (
  `provinceid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省份ID',
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省份名称',
  PRIMARY KEY (`provinceid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '省份信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for seckill_goods
-- ----------------------------
DROP TABLE IF EXISTS `seckill_goods`;
CREATE TABLE `seckill_goods`  (
  `id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sup_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'spu ID',
  `sku_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `images` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `price` int(0) NULL DEFAULT NULL COMMENT '原价格',
  `seckill_price` double(20, 0) NULL DEFAULT NULL COMMENT '秒杀价格',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加日期',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `num` int(0) NULL DEFAULT NULL COMMENT '秒杀商品数',
  `store_count` int(0) NULL DEFAULT NULL COMMENT '剩余库存数',
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for seckill_order
-- ----------------------------
DROP TABLE IF EXISTS `seckill_order`;
CREATE TABLE `seckill_order`  (
  `id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `seckill_goods_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '秒杀商品ID',
  `money` int(0) NULL DEFAULT NULL COMMENT '支付金额',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `status` int(0) NULL DEFAULT NULL COMMENT '状态，0未支付，1已支付',
  `weixin_transaction_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易流水',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sku
-- ----------------------------
DROP TABLE IF EXISTS `sku`;
CREATE TABLE `sku`  (
  `id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SKU名称',
  `price` int(0) NOT NULL DEFAULT 1 COMMENT '价格（分）',
  `num` int(0) NULL DEFAULT 100 COMMENT '库存数量',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `images` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片列表',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `spu_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SPUID',
  `category_id` int(0) NULL DEFAULT NULL COMMENT '类目ID',
  `category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目名称',
  `brand_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `sku_attribute` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格',
  `status` int(0) NULL DEFAULT 1 COMMENT '商品状态 1-正常，2-下架，3-删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`category_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `updated`(`update_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sku_attribute
-- ----------------------------
DROP TABLE IF EXISTS `sku_attribute`;
CREATE TABLE `sku_attribute`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性名称',
  `options` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性选项',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `category_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类ID集合',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for spu
-- ----------------------------
DROP TABLE IF EXISTS `spu`;
CREATE TABLE `spu`  (
  `id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SPU名',
  `intro` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品简介',
  `brand_id` int(0) NULL DEFAULT NULL COMMENT '品牌ID',
  `category_one_id` int(0) NULL DEFAULT NULL COMMENT '一级分类',
  `category_two_id` int(0) NULL DEFAULT NULL COMMENT '二级分类',
  `category_three_id` int(0) NULL DEFAULT NULL COMMENT '三级分类',
  `images` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片列表',
  `after_sales_service` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售后服务',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '介绍',
  `attribute_list` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格列表',
  `is_marketable` int(0) NULL DEFAULT 0 COMMENT '是否上架,0已下架，1已上架',
  `is_delete` int(0) NULL DEFAULT 0 COMMENT '是否删除,0:未删除，1：已删除',
  `status` int(0) NULL DEFAULT 0 COMMENT '审核状态，0：未审核，1：已审核，2：审核不通过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
