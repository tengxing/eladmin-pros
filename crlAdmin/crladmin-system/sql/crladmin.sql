/*
Navicat MySQL Data Transfer

Source Server         : littleterry
Source Server Version : 50722
Source Host           : littleterry.cn:3306
Source Database       : crladmin

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-05-02 19:15:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `pid` bigint(20) NOT NULL COMMENT '上级部门',
  `create_time` datetime DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', 'crladmin', '0', '2019-03-25 09:14:05', '');
INSERT INTO `dept` VALUES ('2', '研发部', '7', '2019-03-25 09:15:32', '');
INSERT INTO `dept` VALUES ('5', '运维部', '7', '2019-03-25 09:20:44', '');
INSERT INTO `dept` VALUES ('6', '测试部', '8', '2019-03-25 09:52:18', '');
INSERT INTO `dept` VALUES ('7', '华南分部', '1', '2019-03-25 11:04:50', '');
INSERT INTO `dept` VALUES ('8', '华北分部', '1', '2019-03-25 11:04:53', '');
INSERT INTO `dept` VALUES ('9', '财务部', '7', '2019-03-25 11:05:34', '');
INSERT INTO `dept` VALUES ('10', '行政部', '8', '2019-03-25 11:05:58', '');
INSERT INTO `dept` VALUES ('11', '人事部', '8', '2019-03-25 11:07:58', '');
INSERT INTO `dept` VALUES ('12', '市场部', '7', '2019-03-25 11:10:24', '\0');

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '字典名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES ('1', 'user_status', '用户状态');
INSERT INTO `dict` VALUES ('4', 'dept_status', '部门状态');
INSERT INTO `dict` VALUES ('5', 'job_status', '岗位状态');

-- ----------------------------
-- Table structure for dict_detail
-- ----------------------------
DROP TABLE IF EXISTS `dict_detail`;
CREATE TABLE `dict_detail` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL COMMENT '字典标签',
  `value` varchar(255) NOT NULL COMMENT '字典值',
  `sort` varchar(255) DEFAULT NULL COMMENT '排序',
  `dict_id` bigint(11) DEFAULT NULL COMMENT '字典id',
  PRIMARY KEY (`id`),
  KEY `FK5tpkputc6d9nboxojdbgnpmyb` (`dict_id`),
  CONSTRAINT `FK5tpkputc6d9nboxojdbgnpmyb` FOREIGN KEY (`dict_id`) REFERENCES `dict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict_detail
-- ----------------------------
INSERT INTO `dict_detail` VALUES ('1', '激活', 'true', '1', '1');
INSERT INTO `dict_detail` VALUES ('2', '锁定', 'false', '2', '1');
INSERT INTO `dict_detail` VALUES ('11', '正常', 'true', '1', '4');
INSERT INTO `dict_detail` VALUES ('12', '停用', 'false', '2', '4');
INSERT INTO `dict_detail` VALUES ('13', '正常', 'true', '1', '5');
INSERT INTO `dict_detail` VALUES ('14', '停用', 'false', '2', '5');

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `sort` bigint(20) NOT NULL,
  `dept_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmvhj0rogastlctflsxf1d6k3i` (`dept_id`),
  CONSTRAINT `FKmvhj0rogastlctflsxf1d6k3i` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('2', '董事长秘书', '', '2019-03-29 14:01:30', '2', '1');
INSERT INTO `job` VALUES ('8', '人事专员', '', '2019-03-29 14:52:28', '3', '11');
INSERT INTO `job` VALUES ('10', '产品经理', '\0', '2019-03-29 14:55:51', '4', '2');
INSERT INTO `job` VALUES ('11', '全栈开发', '', '2019-03-31 13:39:30', '6', '2');
INSERT INTO `job` VALUES ('12', '软件测试', '', '2019-03-31 13:39:43', '5', '2');
INSERT INTO `job` VALUES ('19', '董事长', '', '2019-03-31 14:58:15', '1', '1');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `exception_detail` text,
  `log_type` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `params` text,
  `request_ip` varchar(255) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5138 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('4954', '2019-04-23 17:46:32', '查询Redis缓存', null, 'INFO', 'cn.littleterry.modules.monitor.rest.RedisController.getRedis()', '{ key: * pageable: Page request [number: 0, size 10, sort: UNSORTED] }', '123.147.246.156', '199', 'admin');
INSERT INTO `log` VALUES ('4955', '2019-04-23 17:46:53', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '123.147.246.156', '186', 'admin');
INSERT INTO `log` VALUES ('4956', '2019-04-23 17:46:53', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=user_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '123.147.246.156', '224', 'admin');
INSERT INTO `log` VALUES ('4957', '2019-04-23 17:46:53', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.246.156', '460', 'admin');
INSERT INTO `log` VALUES ('4958', '2019-04-23 17:46:57', '查询角色', null, 'INFO', 'cn.littleterry.modules.system.rest.RoleController.getRoles()', '{ name: null pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.246.156', '170', 'admin');
INSERT INTO `log` VALUES ('4959', '2019-04-23 17:47:00', '查询权限', null, 'INFO', 'cn.littleterry.modules.system.rest.PermissionController.getPermissions()', '{ name: null }', '123.147.246.156', '59', 'admin');
INSERT INTO `log` VALUES ('4960', '2019-04-24 17:33:43', '用户登录', null, 'INFO', 'cn.littleterry.modules.security.rest.AuthenticationController.login()', '{ authorizationUser: {username=admin, password= ******} }', '123.147.246.156', '951', 'admin');
INSERT INTO `log` VALUES ('4961', '2019-04-24 17:34:01', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=user_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '123.147.246.156', '39', 'admin');
INSERT INTO `log` VALUES ('4962', '2019-04-24 17:34:01', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '123.147.246.156', '50', 'admin');
INSERT INTO `log` VALUES ('4963', '2019-04-24 17:34:01', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.246.156', '106', 'admin');
INSERT INTO `log` VALUES ('4964', '2019-04-24 17:34:20', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=dept_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '123.147.246.156', '38', 'admin');
INSERT INTO `log` VALUES ('4965', '2019-04-24 17:34:20', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '123.147.246.156', '27', 'admin');
INSERT INTO `log` VALUES ('4966', '2019-04-24 17:34:36', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=true, pid=null, children=null, createTime=null) }', '123.147.246.156', '58', 'admin');
INSERT INTO `log` VALUES ('4967', '2019-04-24 17:34:41', '查询菜单', null, 'INFO', 'cn.littleterry.modules.system.rest.MenuController.getMenus()', '{ name: null }', '123.147.246.156', '98', 'admin');
INSERT INTO `log` VALUES ('4968', '2019-04-24 17:34:51', '查询权限', null, 'INFO', 'cn.littleterry.modules.system.rest.PermissionController.getPermissions()', '{ name: null }', '123.147.246.156', '22', 'admin');
INSERT INTO `log` VALUES ('4969', '2019-04-24 17:34:55', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=user_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '123.147.246.156', '5', 'admin');
INSERT INTO `log` VALUES ('4970', '2019-04-24 17:34:55', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '123.147.246.156', '3', 'admin');
INSERT INTO `log` VALUES ('4971', '2019-04-24 17:34:55', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.246.156', '9', 'admin');
INSERT INTO `log` VALUES ('4972', '2019-04-24 17:35:12', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=2) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.246.156', '354', 'admin');
INSERT INTO `log` VALUES ('4973', '2019-04-24 17:35:14', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=5) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.246.156', '45', 'admin');
INSERT INTO `log` VALUES ('4974', '2019-04-24 17:35:16', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=9) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.246.156', '46', 'admin');
INSERT INTO `log` VALUES ('4975', '2019-04-24 17:51:49', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=6) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.246.156', '43', 'admin');
INSERT INTO `log` VALUES ('4976', '2019-04-24 17:51:51', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=11) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.246.156', '78', 'admin');
INSERT INTO `log` VALUES ('4977', '2019-04-24 17:51:54', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=true, pid=null, children=null, createTime=null) }', '123.147.246.156', '9', 'admin');
INSERT INTO `log` VALUES ('4978', '2019-04-24 17:51:57', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=true, pid=null, children=null, createTime=null) }', '123.147.246.156', '19', 'admin');
INSERT INTO `log` VALUES ('4979', '2019-04-24 17:51:57', '查询岗位', null, 'INFO', 'cn.littleterry.modules.system.rest.JobController.getJobs()', '{ name: null deptId: 11 enabled: null pageable: Page request [number: 0, size 2000, sort: UNSORTED] }', '123.147.246.156', '93', 'admin');
INSERT INTO `log` VALUES ('4980', '2019-04-24 17:52:02', '查询角色', null, 'INFO', 'cn.littleterry.modules.system.rest.RoleController.getRoles()', '{ name: null pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.246.156', '107', 'admin');
INSERT INTO `log` VALUES ('4981', '2019-04-24 17:55:50', '查询权限', null, 'INFO', 'cn.littleterry.modules.system.rest.PermissionController.getPermissions()', '{ name: null }', '123.147.246.156', '45', 'admin');
INSERT INTO `log` VALUES ('4982', '2019-04-24 17:56:12', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=job_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '123.147.246.156', '30', 'admin');
INSERT INTO `log` VALUES ('4983', '2019-04-24 17:56:12', '查询岗位', null, 'INFO', 'cn.littleterry.modules.system.rest.JobController.getJobs()', '{ name: null deptId: null enabled: null pageable: Page request [number: 0, size 10, sort: sort: ASC] }', '123.147.246.156', '44', 'admin');
INSERT INTO `log` VALUES ('4984', '2019-04-24 17:56:24', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=dept_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '123.147.246.156', '10', 'admin');
INSERT INTO `log` VALUES ('4985', '2019-04-24 17:56:24', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '123.147.246.156', '40', 'admin');
INSERT INTO `log` VALUES ('4986', '2019-04-24 17:56:35', '查询岗位', null, 'INFO', 'cn.littleterry.modules.system.rest.JobController.getJobs()', '{ name: null deptId: null enabled: null pageable: Page request [number: 0, size 10, sort: sort: ASC] }', '123.147.246.156', '1', 'admin');
INSERT INTO `log` VALUES ('4987', '2019-04-24 17:56:35', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=job_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '123.147.246.156', '7', 'admin');
INSERT INTO `log` VALUES ('4988', '2019-04-24 17:56:53', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '123.147.246.156', '1', 'admin');
INSERT INTO `log` VALUES ('4989', '2019-04-24 17:56:53', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=user_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '123.147.246.156', '35', 'admin');
INSERT INTO `log` VALUES ('4990', '2019-04-24 17:56:53', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.246.156', '139', 'admin');
INSERT INTO `log` VALUES ('4991', '2019-04-24 17:57:10', '查询字典', null, 'INFO', 'cn.littleterry.modules.system.rest.DictController.getDicts()', '{ resources: DictDTO(id=null, name=null, remark=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.246.156', '55', 'admin');
INSERT INTO `log` VALUES ('4992', '2019-04-24 17:57:14', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=job_status) pageable: Page request [number: 0, size 10, sort: sort: ASC] }', '123.147.246.156', '20', 'admin');
INSERT INTO `log` VALUES ('4993', '2019-04-24 17:57:24', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=dept_status) pageable: Page request [number: 0, size 10, sort: sort: ASC] }', '123.147.246.156', '19', 'admin');
INSERT INTO `log` VALUES ('4994', '2019-04-24 17:57:31', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=user_status) pageable: Page request [number: 0, size 10, sort: sort: ASC] }', '123.147.246.156', '30', 'admin');
INSERT INTO `log` VALUES ('4995', '2019-04-24 18:32:44', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=user_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '123.147.246.156', '12', 'admin');
INSERT INTO `log` VALUES ('4996', '2019-04-24 18:32:44', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.246.156', '13', 'admin');
INSERT INTO `log` VALUES ('4997', '2019-04-24 18:32:44', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '123.147.246.156', '14', 'admin');
INSERT INTO `log` VALUES ('4998', '2019-04-24 18:33:04', '查询岗位', null, 'INFO', 'cn.littleterry.modules.system.rest.JobController.getJobs()', '{ name: null deptId: 11 enabled: null pageable: Page request [number: 0, size 2000, sort: UNSORTED] }', '123.147.246.156', '12', 'admin');
INSERT INTO `log` VALUES ('4999', '2019-04-24 18:33:04', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=true, pid=null, children=null, createTime=null) }', '123.147.246.156', '22', 'admin');
INSERT INTO `log` VALUES ('5000', '2019-04-24 18:33:24', '查询菜单', null, 'INFO', 'cn.littleterry.modules.system.rest.MenuController.getMenus()', '{ name: null }', '123.147.246.156', '4', 'admin');
INSERT INTO `log` VALUES ('5001', '2019-04-24 18:34:34', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '123.147.246.156', '7', 'admin');
INSERT INTO `log` VALUES ('5002', '2019-04-24 18:34:34', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=dept_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '123.147.246.156', '10', 'admin');
INSERT INTO `log` VALUES ('5003', '2019-04-24 18:34:36', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=true, pid=null, children=null, createTime=null) }', '123.147.246.156', '12', 'admin');
INSERT INTO `log` VALUES ('5004', '2019-04-24 18:34:40', '修改部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.update()', '{ resources: Dept(id=2, name=研发部, enabled=true, pid=7, createTime=2019-03-25 09:15:32.0, roles=null) }', '123.147.246.156', '180', 'admin');
INSERT INTO `log` VALUES ('5005', '2019-04-24 18:34:41', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '123.147.246.156', '19', 'admin');
INSERT INTO `log` VALUES ('5006', '2019-04-24 18:34:55', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=true, pid=null, children=null, createTime=null) }', '123.147.246.156', '23', 'admin');
INSERT INTO `log` VALUES ('5007', '2019-04-24 18:35:00', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=true, pid=null, children=null, createTime=null) }', '123.147.246.156', '15', 'admin');
INSERT INTO `log` VALUES ('5008', '2019-04-24 18:35:03', '修改部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.update()', '{ resources: Dept(id=7, name=华南分部, enabled=true, pid=1, createTime=2019-03-25 11:04:50.0, roles=null) }', '123.147.246.156', '9', 'admin');
INSERT INTO `log` VALUES ('5009', '2019-04-24 18:35:03', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '123.147.246.156', '22', 'admin');
INSERT INTO `log` VALUES ('5010', '2019-04-28 18:51:10', '用户登录', null, 'INFO', 'cn.littleterry.modules.security.rest.AuthenticationController.login()', '{ authorizationUser: {username=admin, password= ******} }', '123.147.250.47', '307', 'admin');
INSERT INTO `log` VALUES ('5011', '2019-04-28 18:51:25', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=user_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '123.147.250.47', '22', 'admin');
INSERT INTO `log` VALUES ('5012', '2019-04-28 18:51:25', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '123.147.250.47', '27', 'admin');
INSERT INTO `log` VALUES ('5013', '2019-04-28 18:51:25', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.250.47', '115', 'admin');
INSERT INTO `log` VALUES ('5014', '2019-04-28 18:51:37', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=user_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '123.147.250.47', '1', 'admin');
INSERT INTO `log` VALUES ('5015', '2019-04-28 18:51:37', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '123.147.250.47', '10', 'admin');
INSERT INTO `log` VALUES ('5016', '2019-04-28 18:51:37', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.250.47', '14', 'admin');
INSERT INTO `log` VALUES ('5017', '2019-04-28 18:54:41', '查询岗位', null, 'INFO', 'cn.littleterry.modules.system.rest.JobController.getJobs()', '{ name: null deptId: 11 enabled: null pageable: Page request [number: 0, size 2000, sort: UNSORTED] }', '123.147.250.47', '43', 'admin');
INSERT INTO `log` VALUES ('5018', '2019-04-28 18:54:41', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=true, pid=null, children=null, createTime=null) }', '123.147.250.47', '42', 'admin');
INSERT INTO `log` VALUES ('5019', '2019-04-28 18:55:10', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=true, pid=null, children=null, createTime=null) }', '123.147.250.47', '10', 'admin');
INSERT INTO `log` VALUES ('5020', '2019-04-28 18:55:10', '查询岗位', null, 'INFO', 'cn.littleterry.modules.system.rest.JobController.getJobs()', '{ name: null deptId: 11 enabled: null pageable: Page request [number: 0, size 2000, sort: UNSORTED] }', '123.147.250.47', '4', 'admin');
INSERT INTO `log` VALUES ('5021', '2019-04-28 18:55:51', '修改用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.update()', '{ resources: User{id=5, username=\'hr\', avatar=\'null\', email=\'hr@crladmin.net\', enabled=true, password=\'null\', createTime=null, lastPasswordResetTime=null} }', '123.147.250.47', '225', 'admin');
INSERT INTO `log` VALUES ('5022', '2019-04-28 18:55:51', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.250.47', '84', 'admin');
INSERT INTO `log` VALUES ('5023', '2019-04-29 13:44:47', '用户登录', null, 'INFO', 'cn.littleterry.modules.security.rest.AuthenticationController.login()', '{ authorizationUser: {username=admin, password= ******} }', '123.147.250.47', '23', 'admin');
INSERT INTO `log` VALUES ('5024', '2019-04-29 13:45:11', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.250.47', '17', 'admin');
INSERT INTO `log` VALUES ('5025', '2019-04-29 13:45:11', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=user_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '123.147.250.47', '20', 'admin');
INSERT INTO `log` VALUES ('5026', '2019-04-29 13:45:11', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '123.147.250.47', '22', 'admin');
INSERT INTO `log` VALUES ('5027', '2019-04-29 13:45:13', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=true, pid=null, children=null, createTime=null) }', '123.147.250.47', '21', 'admin');
INSERT INTO `log` VALUES ('5028', '2019-04-29 13:45:41', '查询岗位', null, 'INFO', 'cn.littleterry.modules.system.rest.JobController.getJobs()', '{ name: null deptId: 1 enabled: null pageable: Page request [number: 0, size 2000, sort: UNSORTED] }', '123.147.250.47', '38', 'admin');
INSERT INTO `log` VALUES ('5029', '2019-04-29 13:45:58', '新增用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.create()', '{ resources: User{id=6, username=\'terry\', avatar=\'https://aurora-1255840532.cos.ap-chengdu.myqcloud.com/8918a306ea314404835a9196585c4b75.jpeg\', email=\'te@11.com\', enabled=true, password=\'e10adc3949ba59abbe56e057f20f883e\', createTime=2019-04-29 13:45:57.598, lastPasswordResetTime=null} }', '123.147.250.47', '44', 'admin');
INSERT INTO `log` VALUES ('5030', '2019-04-29 13:45:58', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.250.47', '78', 'admin');
INSERT INTO `log` VALUES ('5031', '2019-04-29 13:46:10', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=true, pid=null, children=null, createTime=null) }', '123.147.250.47', '10', 'admin');
INSERT INTO `log` VALUES ('5032', '2019-04-29 13:46:10', '查询岗位', null, 'INFO', 'cn.littleterry.modules.system.rest.JobController.getJobs()', '{ name: null deptId: 11 enabled: null pageable: Page request [number: 0, size 2000, sort: UNSORTED] }', '123.147.250.47', '10', 'admin');
INSERT INTO `log` VALUES ('5033', '2019-04-29 13:46:24', '修改用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.update()', '{ resources: User{id=5, username=\'hr\', avatar=\'null\', email=\'hr@d.com\', enabled=true, password=\'null\', createTime=null, lastPasswordResetTime=null} }', '123.147.250.47', '53', 'admin');
INSERT INTO `log` VALUES ('5034', '2019-04-29 13:46:25', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.250.47', '79', 'admin');
INSERT INTO `log` VALUES ('5035', '2019-04-29 13:46:30', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=true, pid=null, children=null, createTime=null) }', '123.147.250.47', '6', 'admin');
INSERT INTO `log` VALUES ('5036', '2019-04-29 13:46:30', '查询岗位', null, 'INFO', 'cn.littleterry.modules.system.rest.JobController.getJobs()', '{ name: null deptId: 2 enabled: null pageable: Page request [number: 0, size 2000, sort: UNSORTED] }', '123.147.250.47', '37', 'admin');
INSERT INTO `log` VALUES ('5037', '2019-04-29 13:46:34', '修改用户', 'cn.littleterry.exception.BadRequestException: could not execute statement; SQL [n/a]; constraint [UK_kpubos9gc2cvtkb0thktkbkes]; nested exception is org.hibernate.exception.ConstraintViolationException: could not execute statement\n	at cn.littleterry.aspect.DataScopeAspect.logAround(DataScopeAspect.java:51)\n	at sun.reflect.GeneratedMethodAccessor248.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:62)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.security.access.intercept.aopalliance.MethodSecurityInterceptor.invoke(MethodSecurityInterceptor.java:69)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\n	at cn.littleterry.modules.system.rest.UserController$$EnhancerBySpringCGLIB$$98864a46.update(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:215)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:142)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:800)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1038)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:998)\n	at org.springframework.web.servlet.FrameworkServlet.doPut(FrameworkServlet.java:912)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:663)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:875)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:101)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.boot.actuate.web.trace.servlet.HttpTraceFilter.doFilterInternal(HttpTraceFilter.java:90)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:320)\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at cn.littleterry.modules.security.security.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:67)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:116)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:66)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.boot.actuate.metrics.web.servlet.WebMvcMetricsFilter.filterAndRecordMetrics(WebMvcMetricsFilter.java:154)\n	at org.springframework.boot.actuate.metrics.web.servlet.WebMvcMetricsFilter.filterAndRecordMetrics(WebMvcMetricsFilter.java:122)\n	at org.springframework.boot.actuate.metrics.web.servlet.WebMvcMetricsFilter.doFilterInternal(WebMvcMetricsFilter.java:107)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:199)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:770)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1415)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:748)\n', 'ERROR', 'cn.littleterry.modules.system.rest.UserController.update()', '{ resources: User{id=3, username=\'test\', avatar=\'null\', email=\'te@11.com\', enabled=true, password=\'null\', createTime=null, lastPasswordResetTime=null} }', '123.147.250.47', '292', 'admin');
INSERT INTO `log` VALUES ('5038', '2019-04-29 13:46:41', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=true, pid=null, children=null, createTime=null) }', '123.147.250.47', '8', 'admin');
INSERT INTO `log` VALUES ('5039', '2019-04-29 13:46:41', '查询岗位', null, 'INFO', 'cn.littleterry.modules.system.rest.JobController.getJobs()', '{ name: null deptId: 2 enabled: null pageable: Page request [number: 0, size 2000, sort: UNSORTED] }', '123.147.250.47', '7', 'admin');
INSERT INTO `log` VALUES ('5040', '2019-04-29 13:46:47', '修改用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.update()', '{ resources: User{id=1, username=\'admin\', avatar=\'null\', email=\'te@11ss.com\', enabled=true, password=\'null\', createTime=null, lastPasswordResetTime=null} }', '123.147.250.47', '68', 'admin');
INSERT INTO `log` VALUES ('5041', '2019-04-29 13:46:48', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.250.47', '85', 'admin');
INSERT INTO `log` VALUES ('5042', '2019-04-29 13:46:49', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=true, pid=null, children=null, createTime=null) }', '123.147.250.47', '2', 'admin');
INSERT INTO `log` VALUES ('5043', '2019-04-29 13:46:49', '查询岗位', null, 'INFO', 'cn.littleterry.modules.system.rest.JobController.getJobs()', '{ name: null deptId: 2 enabled: null pageable: Page request [number: 0, size 2000, sort: UNSORTED] }', '123.147.250.47', '5', 'admin');
INSERT INTO `log` VALUES ('5044', '2019-04-29 13:46:55', '修改用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.update()', '{ resources: User{id=3, username=\'test\', avatar=\'null\', email=\'te@11sfs.com\', enabled=true, password=\'null\', createTime=null, lastPasswordResetTime=null} }', '123.147.250.47', '51', 'admin');
INSERT INTO `log` VALUES ('5045', '2019-04-29 13:46:55', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.250.47', '98', 'admin');
INSERT INTO `log` VALUES ('5046', '2019-04-29 13:47:07', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=2) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.250.47', '81', 'admin');
INSERT INTO `log` VALUES ('5047', '2019-04-29 13:47:08', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.250.47', '8', 'admin');
INSERT INTO `log` VALUES ('5048', '2019-04-29 13:47:11', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=8) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.250.47', '117', 'admin');
INSERT INTO `log` VALUES ('5049', '2019-04-29 15:12:03', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.250.47', '10', 'admin');
INSERT INTO `log` VALUES ('5050', '2019-04-29 15:12:11', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=2) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.250.47', '11', 'admin');
INSERT INTO `log` VALUES ('5051', '2019-04-29 15:19:58', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=true, pid=null, children=null, createTime=null) }', '123.147.250.47', '8', 'admin');
INSERT INTO `log` VALUES ('5052', '2019-04-29 15:19:58', '查询岗位', null, 'INFO', 'cn.littleterry.modules.system.rest.JobController.getJobs()', '{ name: null deptId: 2 enabled: null pageable: Page request [number: 0, size 2000, sort: UNSORTED] }', '123.147.250.47', '8', 'admin');
INSERT INTO `log` VALUES ('5053', '2019-04-29 15:32:34', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=8) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '123.147.250.47', '165', 'admin');
INSERT INTO `log` VALUES ('5054', '2019-05-01 16:00:59', '用户登录', null, 'INFO', 'cn.littleterry.modules.security.rest.AuthenticationController.login()', '{ authorizationUser: {username=admin, password= ******} }', '183.228.202.106', '2039', 'admin');
INSERT INTO `log` VALUES ('5055', '2019-05-01 16:01:53', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '183.228.202.106', '273', 'admin');
INSERT INTO `log` VALUES ('5056', '2019-05-01 16:01:53', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=user_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '183.228.202.106', '334', 'admin');
INSERT INTO `log` VALUES ('5057', '2019-05-01 16:01:53', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '183.228.202.106', '551', 'admin');
INSERT INTO `log` VALUES ('5058', '2019-05-01 16:01:55', '查询角色', null, 'INFO', 'cn.littleterry.modules.system.rest.RoleController.getRoles()', '{ name: null pageable: Page request [number: 0, size 10, sort: id: DESC] }', '183.228.202.106', '312', 'admin');
INSERT INTO `log` VALUES ('5059', '2019-05-01 16:02:58', '查询权限', null, 'INFO', 'cn.littleterry.modules.system.rest.PermissionController.getPermissions()', '{ name: null }', '183.228.202.106', '96', 'admin');
INSERT INTO `log` VALUES ('5060', '2019-05-01 16:03:36', '查询字典', null, 'INFO', 'cn.littleterry.modules.system.rest.DictController.getDicts()', '{ resources: DictDTO(id=null, name=null, remark=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '183.228.202.106', '84', 'admin');
INSERT INTO `log` VALUES ('5061', '2019-05-01 16:03:41', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=job_status) pageable: Page request [number: 0, size 10, sort: sort: ASC] }', '183.228.202.106', '31', 'admin');
INSERT INTO `log` VALUES ('5062', '2019-05-01 16:03:44', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=dept_status) pageable: Page request [number: 0, size 10, sort: sort: ASC] }', '183.228.202.106', '32', 'admin');
INSERT INTO `log` VALUES ('5063', '2019-05-01 16:03:46', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=user_status) pageable: Page request [number: 0, size 10, sort: sort: ASC] }', '183.228.202.106', '45', 'admin');
INSERT INTO `log` VALUES ('5064', '2019-05-01 16:04:08', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=job_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '183.228.202.106', '35', 'admin');
INSERT INTO `log` VALUES ('5065', '2019-05-01 16:04:09', '查询岗位', null, 'INFO', 'cn.littleterry.modules.system.rest.JobController.getJobs()', '{ name: null deptId: null enabled: null pageable: Page request [number: 0, size 10, sort: sort: ASC] }', '183.228.202.106', '117', 'admin');
INSERT INTO `log` VALUES ('5066', '2019-05-01 16:32:54', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=dept_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '183.228.202.106', '70', 'admin');
INSERT INTO `log` VALUES ('5067', '2019-05-01 16:32:54', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '183.228.202.106', '73', 'admin');
INSERT INTO `log` VALUES ('5068', '2019-05-01 16:32:56', '查询菜单', null, 'INFO', 'cn.littleterry.modules.system.rest.MenuController.getMenus()', '{ name: null }', '183.228.202.106', '70', 'admin');
INSERT INTO `log` VALUES ('5069', '2019-05-01 16:33:01', '查询权限', null, 'INFO', 'cn.littleterry.modules.system.rest.PermissionController.getPermissions()', '{ name: null }', '183.228.202.106', '19', 'admin');
INSERT INTO `log` VALUES ('5070', '2019-05-01 16:33:07', '查询角色', null, 'INFO', 'cn.littleterry.modules.system.rest.RoleController.getRoles()', '{ name: null pageable: Page request [number: 0, size 10, sort: id: DESC] }', '183.228.202.106', '26', 'admin');
INSERT INTO `log` VALUES ('5071', '2019-05-01 17:26:34', '查询Redis缓存', null, 'INFO', 'cn.littleterry.modules.monitor.rest.RedisController.getRedis()', '{ key: * pageable: Page request [number: 0, size 10, sort: UNSORTED] }', '183.228.202.106', '108', 'admin');
INSERT INTO `log` VALUES ('5072', '2019-05-01 18:32:20', '用户登录', null, 'INFO', 'cn.littleterry.modules.security.rest.AuthenticationController.login()', '{ authorizationUser: {username=admin, password= ******} }', '127.0.0.1', '5427', 'admin');
INSERT INTO `log` VALUES ('5073', '2019-05-01 18:32:31', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=user_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '127.0.0.1', '582', 'admin');
INSERT INTO `log` VALUES ('5074', '2019-05-01 18:32:31', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '127.0.0.1', '750', 'admin');
INSERT INTO `log` VALUES ('5075', '2019-05-01 18:32:32', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', '1713', 'admin');
INSERT INTO `log` VALUES ('5076', '2019-05-01 18:32:38', '查询角色', null, 'INFO', 'cn.littleterry.modules.system.rest.RoleController.getRoles()', '{ name: null pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', '907', 'admin');
INSERT INTO `log` VALUES ('5077', '2019-05-01 18:32:40', '查询权限', null, 'INFO', 'cn.littleterry.modules.system.rest.PermissionController.getPermissions()', '{ name: null }', '127.0.0.1', '620', 'admin');
INSERT INTO `log` VALUES ('5078', '2019-05-01 18:34:12', '查询菜单', null, 'INFO', 'cn.littleterry.modules.system.rest.MenuController.getMenus()', '{ name: null }', '127.0.0.1', '564', 'admin');
INSERT INTO `log` VALUES ('5079', '2019-05-01 18:34:43', '删除菜单', null, 'INFO', 'cn.littleterry.modules.system.rest.MenuController.delete()', '{ id: 10 }', '127.0.0.1', '15160', 'admin');
INSERT INTO `log` VALUES ('5080', '2019-05-01 18:34:44', '查询菜单', null, 'INFO', 'cn.littleterry.modules.system.rest.MenuController.getMenus()', '{ name: null }', '127.0.0.1', '454', 'admin');
INSERT INTO `log` VALUES ('5081', '2019-05-01 18:35:03', '删除菜单', null, 'INFO', 'cn.littleterry.modules.system.rest.MenuController.delete()', '{ id: 6 }', '127.0.0.1', '11234', 'admin');
INSERT INTO `log` VALUES ('5082', '2019-05-01 18:35:04', '查询菜单', null, 'INFO', 'cn.littleterry.modules.system.rest.MenuController.getMenus()', '{ name: null }', '127.0.0.1', '451', 'admin');
INSERT INTO `log` VALUES ('5083', '2019-05-01 18:35:25', '删除菜单', null, 'INFO', 'cn.littleterry.modules.system.rest.MenuController.delete()', '{ id: 36 }', '127.0.0.1', '15139', 'admin');
INSERT INTO `log` VALUES ('5084', '2019-05-01 18:35:26', '查询菜单', null, 'INFO', 'cn.littleterry.modules.system.rest.MenuController.getMenus()', '{ name: null }', '127.0.0.1', '433', 'admin');
INSERT INTO `log` VALUES ('5085', '2019-05-01 18:35:39', '删除菜单', null, 'INFO', 'cn.littleterry.modules.system.rest.MenuController.delete()', '{ id: 21 }', '127.0.0.1', '7284', 'admin');
INSERT INTO `log` VALUES ('5086', '2019-05-01 18:35:40', '查询菜单', null, 'INFO', 'cn.littleterry.modules.system.rest.MenuController.getMenus()', '{ name: null }', '127.0.0.1', '427', 'admin');
INSERT INTO `log` VALUES ('5087', '2019-05-01 18:36:00', '修改菜单', null, 'INFO', 'cn.littleterry.modules.system.rest.MenuController.update()', '{ resources: cn.littleterry.modules.system.domain.Menu@17026747 }', '127.0.0.1', '765', 'admin');
INSERT INTO `log` VALUES ('5088', '2019-05-01 18:36:01', '查询菜单', null, 'INFO', 'cn.littleterry.modules.system.rest.MenuController.getMenus()', '{ name: null }', '127.0.0.1', '453', 'admin');
INSERT INTO `log` VALUES ('5089', '2019-05-01 18:38:13', '用户登录', null, 'INFO', 'cn.littleterry.modules.security.rest.AuthenticationController.login()', '{ authorizationUser: {username=admin, password= ******} }', '127.0.0.1', '121', 'admin');
INSERT INTO `log` VALUES ('5090', '2019-05-01 18:38:27', '查询字典', null, 'INFO', 'cn.littleterry.modules.system.rest.DictController.getDicts()', '{ resources: DictDTO(id=null, name=null, remark=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', '611', 'admin');
INSERT INTO `log` VALUES ('5091', '2019-05-01 18:38:29', '查询岗位', null, 'INFO', 'cn.littleterry.modules.system.rest.JobController.getJobs()', '{ name: null deptId: null enabled: null pageable: Page request [number: 0, size 10, sort: sort: ASC] }', '127.0.0.1', '486', 'admin');
INSERT INTO `log` VALUES ('5092', '2019-05-01 18:38:29', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=job_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '127.0.0.1', '562', 'admin');
INSERT INTO `log` VALUES ('5093', '2019-05-01 18:38:42', '删除岗位', 'cn.littleterry.exception.BadRequestException: could not execute statement; SQL [n/a]; constraint [null]; nested exception is org.hibernate.exception.ConstraintViolationException: could not execute statement\r\n	at cn.littleterry.aspect.DataScopeAspect.logAround(DataScopeAspect.java:51)\r\n	at sun.reflect.GeneratedMethodAccessor234.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:62)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.security.access.intercept.aopalliance.MethodSecurityInterceptor.invoke(MethodSecurityInterceptor.java:69)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at cn.littleterry.modules.system.rest.JobController$$EnhancerBySpringCGLIB$$101ab961.delete(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:189)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:800)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1038)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doDelete(FrameworkServlet.java:930)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:666)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:101)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.boot.actuate.web.trace.servlet.HttpTraceFilter.doFilterInternal(HttpTraceFilter.java:90)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:320)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at cn.littleterry.modules.security.security.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:67)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:116)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:74)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\r\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.boot.actuate.metrics.web.servlet.WebMvcMetricsFilter.filterAndRecordMetrics(WebMvcMetricsFilter.java:117)\r\n	at org.springframework.boot.actuate.metrics.web.servlet.WebMvcMetricsFilter.doFilterInternal(WebMvcMetricsFilter.java:106)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:200)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:834)\r\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1415)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n', 'ERROR', 'cn.littleterry.modules.system.rest.JobController.delete()', '{ id: 19 }', '127.0.0.1', '469', 'admin');
INSERT INTO `log` VALUES ('5094', '2019-05-01 18:38:45', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=true, pid=null, children=null, createTime=null) }', '127.0.0.1', '893', 'admin');
INSERT INTO `log` VALUES ('5095', '2019-05-01 18:38:55', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '127.0.0.1', '203', 'admin');
INSERT INTO `log` VALUES ('5096', '2019-05-01 18:38:56', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=dept_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '127.0.0.1', '586', 'admin');
INSERT INTO `log` VALUES ('5097', '2019-05-01 18:39:01', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=true, pid=null, children=null, createTime=null) }', '127.0.0.1', '248', 'admin');
INSERT INTO `log` VALUES ('5098', '2019-05-01 18:40:25', '查询岗位', null, 'INFO', 'cn.littleterry.modules.system.rest.JobController.getJobs()', '{ name: null deptId: null enabled: null pageable: Page request [number: 0, size 10, sort: sort: ASC] }', '127.0.0.1', '182', 'admin');
INSERT INTO `log` VALUES ('5099', '2019-05-01 18:40:26', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=job_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '127.0.0.1', '63', 'admin');
INSERT INTO `log` VALUES ('5100', '2019-05-01 18:40:27', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=user_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '127.0.0.1', '51', 'admin');
INSERT INTO `log` VALUES ('5101', '2019-05-01 18:40:28', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '127.0.0.1', '235', 'admin');
INSERT INTO `log` VALUES ('5102', '2019-05-01 18:40:28', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', '292', 'admin');
INSERT INTO `log` VALUES ('5103', '2019-05-01 18:40:41', '用户登录', null, 'INFO', 'cn.littleterry.modules.security.rest.AuthenticationController.login()', '{ authorizationUser: {username=admin, password= ******} }', '127.0.0.1', '115', 'admin');
INSERT INTO `log` VALUES ('5104', '2019-05-01 18:40:42', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=user_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '127.0.0.1', '18', 'admin');
INSERT INTO `log` VALUES ('5105', '2019-05-01 18:40:42', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '127.0.0.1', '302', 'admin');
INSERT INTO `log` VALUES ('5106', '2019-05-01 18:41:02', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', '320', 'admin');
INSERT INTO `log` VALUES ('5107', '2019-05-01 18:41:11', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=dept_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '127.0.0.1', '56', 'admin');
INSERT INTO `log` VALUES ('5108', '2019-05-01 18:41:11', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '127.0.0.1', '233', 'admin');
INSERT INTO `log` VALUES ('5109', '2019-05-01 18:41:15', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=true, pid=null, children=null, createTime=null) }', '127.0.0.1', '236', 'admin');
INSERT INTO `log` VALUES ('5110', '2019-05-01 18:43:49', '查询岗位', null, 'INFO', 'cn.littleterry.modules.system.rest.JobController.getJobs()', '{ name: null deptId: null enabled: null pageable: Page request [number: 0, size 10, sort: sort: ASC] }', '127.0.0.1', '192', 'admin');
INSERT INTO `log` VALUES ('5111', '2019-05-01 18:43:49', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=job_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '127.0.0.1', '61', 'admin');
INSERT INTO `log` VALUES ('5112', '2019-05-01 18:43:58', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=true, pid=null, children=null, createTime=null) }', '127.0.0.1', '242', 'admin');
INSERT INTO `log` VALUES ('5113', '2019-05-01 18:44:15', '查询字典', null, 'INFO', 'cn.littleterry.modules.system.rest.DictController.getDicts()', '{ resources: DictDTO(id=null, name=null, remark=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', '57', 'admin');
INSERT INTO `log` VALUES ('5114', '2019-05-01 18:46:09', '用户登录', null, 'INFO', 'cn.littleterry.modules.security.rest.AuthenticationController.login()', '{ authorizationUser: {username=admin, password= ******} }', '127.0.0.1', '118', 'admin');
INSERT INTO `log` VALUES ('5115', '2019-05-01 18:46:11', '查询字典', null, 'INFO', 'cn.littleterry.modules.system.rest.DictController.getDicts()', '{ resources: DictDTO(id=null, name=null, remark=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', '56', 'admin');
INSERT INTO `log` VALUES ('5116', '2019-05-01 18:46:20', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=dept_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '127.0.0.1', '45', 'admin');
INSERT INTO `log` VALUES ('5117', '2019-05-01 18:46:20', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '127.0.0.1', '234', 'admin');
INSERT INTO `log` VALUES ('5118', '2019-05-01 19:00:40', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=user_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '127.0.0.1', '56', 'admin');
INSERT INTO `log` VALUES ('5119', '2019-05-01 19:00:41', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '127.0.0.1', '239', 'admin');
INSERT INTO `log` VALUES ('5120', '2019-05-01 19:00:41', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', '281', 'admin');
INSERT INTO `log` VALUES ('5121', '2019-05-01 19:01:58', '查询角色', null, 'INFO', 'cn.littleterry.modules.system.rest.RoleController.getRoles()', '{ name: null pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', '938', 'admin');
INSERT INTO `log` VALUES ('5122', '2019-05-02 19:05:50', '用户登录', null, 'INFO', 'cn.littleterry.modules.security.rest.AuthenticationController.login()', '{ authorizationUser: {username=admin, password= ******} }', '127.0.0.1', '4690', 'admin');
INSERT INTO `log` VALUES ('5123', '2019-05-02 19:05:54', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=user_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '127.0.0.1', '500', 'admin');
INSERT INTO `log` VALUES ('5124', '2019-05-02 19:05:54', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '127.0.0.1', '1180', 'admin');
INSERT INTO `log` VALUES ('5125', '2019-05-02 19:05:56', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', '2631', 'admin');
INSERT INTO `log` VALUES ('5126', '2019-05-02 19:06:05', '查询角色', null, 'INFO', 'cn.littleterry.modules.system.rest.RoleController.getRoles()', '{ name: null pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', '2492', 'admin');
INSERT INTO `log` VALUES ('5127', '2019-05-02 19:11:30', '查询角色', null, 'INFO', 'cn.littleterry.modules.system.rest.RoleController.getRoles()', '{ name: null pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', '55', 'admin');
INSERT INTO `log` VALUES ('5128', '2019-05-02 19:11:38', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=user_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '127.0.0.1', '52', 'admin');
INSERT INTO `log` VALUES ('5129', '2019-05-02 19:11:38', '查询用户', null, 'INFO', 'cn.littleterry.modules.system.rest.UserController.getUsers()', '{ userDTO: UserDTO(id=null, username=null, avatar=null, email=null, phone=null, enabled=null, password=null, createTime=null, lastPasswordResetTime=null, roles=null, job=null, dept=null, deptId=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', '172', 'admin');
INSERT INTO `log` VALUES ('5130', '2019-05-02 19:11:40', '查询权限', null, 'INFO', 'cn.littleterry.modules.system.rest.PermissionController.getPermissions()', '{ name: null }', '127.0.0.1', '531', 'admin');
INSERT INTO `log` VALUES ('5131', '2019-05-02 19:11:41', '查询菜单', null, 'INFO', 'cn.littleterry.modules.system.rest.MenuController.getMenus()', '{ name: null }', '127.0.0.1', '414', 'admin');
INSERT INTO `log` VALUES ('5132', '2019-05-02 19:11:42', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '127.0.0.1', '222', 'admin');
INSERT INTO `log` VALUES ('5133', '2019-05-02 19:11:42', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=dept_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '127.0.0.1', '448', 'admin');
INSERT INTO `log` VALUES ('5134', '2019-05-02 19:11:43', '查询字典详情', null, 'INFO', 'cn.littleterry.modules.system.rest.DictDetailController.getDictDetails()', '{ resources: DictDetailDTO(id=null, label=null, value=null, sort=null, dictName=job_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '127.0.0.1', '444', 'admin');
INSERT INTO `log` VALUES ('5135', '2019-05-02 19:11:43', '查询岗位', null, 'INFO', 'cn.littleterry.modules.system.rest.JobController.getJobs()', '{ name: null deptId: null enabled: null pageable: Page request [number: 0, size 10, sort: sort: ASC] }', '127.0.0.1', '702', 'admin');
INSERT INTO `log` VALUES ('5136', '2019-05-02 19:11:44', '查询字典', null, 'INFO', 'cn.littleterry.modules.system.rest.DictController.getDicts()', '{ resources: DictDTO(id=null, name=null, remark=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', '436', 'admin');
INSERT INTO `log` VALUES ('5137', '2019-05-02 19:11:57', '查询部门', null, 'INFO', 'cn.littleterry.modules.system.rest.DeptController.getDepts()', '{ resources: DeptDTO(id=null, name=null, enabled=null, pid=null, children=null, createTime=null) }', '127.0.0.1', '178', 'admin');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `i_frame` bit(1) DEFAULT NULL COMMENT '是否外链',
  `name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `component` varchar(255) DEFAULT NULL COMMENT '组件',
  `pid` bigint(20) NOT NULL COMMENT '上级菜单ID',
  `sort` bigint(20) NOT NULL COMMENT '排序',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `path` varchar(255) DEFAULT NULL COMMENT '链接地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '2018-12-18 15:11:29', '\0', '系统管理', null, '0', '1', 'system', 'system');
INSERT INTO `menu` VALUES ('2', '2018-12-18 15:14:44', '\0', '用户管理', 'system/user/index', '1', '2', 'peoples', 'user');
INSERT INTO `menu` VALUES ('3', '2018-12-18 15:16:07', '\0', '角色管理', 'system/role/index', '1', '3', 'role', 'role');
INSERT INTO `menu` VALUES ('4', '2018-12-18 15:16:45', '\0', '权限管理', 'system/permission/index', '1', '4', 'permission', 'permission');
INSERT INTO `menu` VALUES ('5', '2018-12-18 15:17:28', '\0', '菜单管理', 'system/menu/index', '1', '5', 'menu', 'menu');
INSERT INTO `menu` VALUES ('17', '2018-12-28 15:09:49', '', '项目地址', '', '0', '0', 'github', 'https://github.com/tengxing/crlAdmin');
INSERT INTO `menu` VALUES ('35', '2019-03-25 09:46:00', '\0', '部门管理', 'system/dept/index', '1', '6', 'dept', 'dept');
INSERT INTO `menu` VALUES ('37', '2019-03-29 13:51:18', '\0', '岗位管理', 'system/job/index', '1', '7', 'Steve-Jobs', 'job');
INSERT INTO `menu` VALUES ('39', '2019-04-10 11:49:04', '\0', '字典管理', 'system/dict/index', '1', '8', 'dictionary', 'dict');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `alias` varchar(255) DEFAULT NULL COMMENT '别名',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `pid` int(11) NOT NULL COMMENT '上级权限',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '超级管理员', '2018-12-03 12:27:48', 'ADMIN', '0');
INSERT INTO `permission` VALUES ('2', '用户管理', '2018-12-03 12:28:19', 'USER_ALL', '0');
INSERT INTO `permission` VALUES ('3', '用户查询', '2018-12-03 12:31:35', 'USER_SELECT', '2');
INSERT INTO `permission` VALUES ('4', '用户创建', '2018-12-03 12:31:35', 'USER_CREATE', '2');
INSERT INTO `permission` VALUES ('5', '用户编辑', '2018-12-03 12:31:35', 'USER_EDIT', '2');
INSERT INTO `permission` VALUES ('6', '用户删除', '2018-12-03 12:31:35', 'USER_DELETE', '2');
INSERT INTO `permission` VALUES ('7', '角色管理', '2018-12-03 12:28:19', 'ROLES_ALL', '0');
INSERT INTO `permission` VALUES ('8', '角色查询', '2018-12-03 12:31:35', 'ROLES_SELECT', '7');
INSERT INTO `permission` VALUES ('10', '角色创建', '2018-12-09 20:10:16', 'ROLES_CREATE', '7');
INSERT INTO `permission` VALUES ('11', '角色编辑', '2018-12-09 20:10:42', 'ROLES_EDIT', '7');
INSERT INTO `permission` VALUES ('12', '角色删除', '2018-12-09 20:11:07', 'ROLES_DELETE', '7');
INSERT INTO `permission` VALUES ('13', '权限管理', '2018-12-09 20:11:37', 'PERMISSION_ALL', '0');
INSERT INTO `permission` VALUES ('14', '权限查询', '2018-12-09 20:11:55', 'PERMISSION_SELECT', '13');
INSERT INTO `permission` VALUES ('15', '权限创建', '2018-12-09 20:14:10', 'PERMISSION_CREATE', '13');
INSERT INTO `permission` VALUES ('16', '权限编辑', '2018-12-09 20:15:44', 'PERMISSION_EDIT', '13');
INSERT INTO `permission` VALUES ('17', '权限删除', '2018-12-09 20:15:59', 'PERMISSION_DELETE', '13');
INSERT INTO `permission` VALUES ('18', '缓存管理', '2018-12-17 13:53:25', 'REDIS_ALL', '0');
INSERT INTO `permission` VALUES ('19', '新增缓存', '2018-12-17 13:53:44', 'REDIS_CREATE', '18');
INSERT INTO `permission` VALUES ('20', '缓存查询', '2018-12-17 13:54:07', 'REDIS_SELECT', '18');
INSERT INTO `permission` VALUES ('21', '缓存编辑', '2018-12-17 13:54:26', 'REDIS_EDIT', '18');
INSERT INTO `permission` VALUES ('22', '缓存删除', '2018-12-17 13:55:04', 'REDIS_DELETE', '18');
INSERT INTO `permission` VALUES ('23', '图床管理', '2018-12-27 20:31:49', 'PICTURE_ALL', '0');
INSERT INTO `permission` VALUES ('24', '查询图片', '2018-12-27 20:32:04', 'PICTURE_SELECT', '23');
INSERT INTO `permission` VALUES ('25', '上传图片', '2018-12-27 20:32:24', 'PICTURE_UPLOAD', '23');
INSERT INTO `permission` VALUES ('26', '删除图片', '2018-12-27 20:32:45', 'PICTURE_DELETE', '23');
INSERT INTO `permission` VALUES ('29', '菜单管理', '2018-12-28 17:34:31', 'MENU_ALL', '0');
INSERT INTO `permission` VALUES ('30', '菜单查询', '2018-12-28 17:34:41', 'MENU_SELECT', '29');
INSERT INTO `permission` VALUES ('31', '菜单创建', '2018-12-28 17:34:52', 'MENU_CREATE', '29');
INSERT INTO `permission` VALUES ('32', '菜单编辑', '2018-12-28 17:35:20', 'MENU_EDIT', '29');
INSERT INTO `permission` VALUES ('33', '菜单删除', '2018-12-28 17:35:29', 'MENU_DELETE', '29');
INSERT INTO `permission` VALUES ('35', '定时任务管理', '2019-01-08 14:59:57', 'JOB_ALL', '0');
INSERT INTO `permission` VALUES ('36', '任务查询', '2019-01-08 15:00:09', 'JOB_SELECT', '35');
INSERT INTO `permission` VALUES ('37', '任务创建', '2019-01-08 15:00:20', 'JOB_CREATE', '35');
INSERT INTO `permission` VALUES ('38', '任务编辑', '2019-01-08 15:00:33', 'JOB_EDIT', '35');
INSERT INTO `permission` VALUES ('39', '任务删除', '2019-01-08 15:01:13', 'JOB_DELETE', '35');
INSERT INTO `permission` VALUES ('40', '部门管理', '2019-03-29 17:06:55', 'DEPT_ALL', '0');
INSERT INTO `permission` VALUES ('41', '部门查询', '2019-03-29 17:07:09', 'DEPT_SELECT', '40');
INSERT INTO `permission` VALUES ('42', '部门创建', '2019-03-29 17:07:29', 'DEPT_CREATE', '40');
INSERT INTO `permission` VALUES ('43', '部门编辑', '2019-03-29 17:07:52', 'DEPT_EDIT', '40');
INSERT INTO `permission` VALUES ('44', '部门删除', '2019-03-29 17:08:14', 'DEPT_DELETE', '40');
INSERT INTO `permission` VALUES ('45', '岗位管理', '2019-03-29 17:08:52', 'USERJOB_ALL', '0');
INSERT INTO `permission` VALUES ('46', '岗位查询', '2019-03-29 17:10:27', 'USERJOB_SELECT', '45');
INSERT INTO `permission` VALUES ('47', '岗位创建', '2019-03-29 17:10:55', 'USERJOB_CREATE', '45');
INSERT INTO `permission` VALUES ('48', '岗位编辑', '2019-03-29 17:11:08', 'USERJOB_EDIT', '45');
INSERT INTO `permission` VALUES ('49', '岗位删除', '2019-03-29 17:11:19', 'USERJOB_DELETE', '45');
INSERT INTO `permission` VALUES ('50', '字典管理', '2019-04-10 16:24:51', 'DICT_ALL', '0');
INSERT INTO `permission` VALUES ('51', '字典查询', '2019-04-10 16:25:16', 'DICT_SELECT', '50');
INSERT INTO `permission` VALUES ('52', '字典创建', '2019-04-10 16:25:29', 'DICT_CREATE', '50');
INSERT INTO `permission` VALUES ('53', '字典编辑', '2019-04-10 16:27:19', 'DICT_EDIT', '50');
INSERT INTO `permission` VALUES ('54', '字典删除', '2019-04-10 16:27:30', 'DICT_DELETE', '50');

-- ----------------------------
-- Table structure for quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `quartz_job`;
CREATE TABLE `quartz_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bean_name` varchar(255) DEFAULT NULL COMMENT 'Spring Bean名称',
  `cron_expression` varchar(255) DEFAULT NULL COMMENT 'cron 表达式',
  `is_pause` bit(1) DEFAULT NULL COMMENT '状态：1暂停、0启用',
  `job_name` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `method_name` varchar(255) DEFAULT NULL COMMENT '方法名称',
  `params` varchar(255) DEFAULT NULL COMMENT '参数',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `update_time` datetime DEFAULT NULL COMMENT '创建或更新日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quartz_job
-- ----------------------------
INSERT INTO `quartz_job` VALUES ('1', 'visitsTask', '0 0 0 * * ?', '\0', '更新访客记录', 'run', null, '每日0点创建新的访客记录', '2019-01-08 14:53:31');
INSERT INTO `quartz_job` VALUES ('2', 'testTask', '0/5 * * * * ?', '', '测试1', 'run1', 'test', '带参测试，多参使用json', '2019-01-13 14:20:50');
INSERT INTO `quartz_job` VALUES ('3', 'testTask', '0/5 * * * * ?', '', '测试', 'run', '', '不带参测试', '2019-04-09 16:16:44');

-- ----------------------------
-- Table structure for quartz_log
-- ----------------------------
DROP TABLE IF EXISTS `quartz_log`;
CREATE TABLE `quartz_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `baen_name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `cron_expression` varchar(255) DEFAULT NULL,
  `exception_detail` text,
  `is_success` bit(1) DEFAULT NULL,
  `job_name` varchar(255) DEFAULT NULL,
  `method_name` varchar(255) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quartz_log
-- ----------------------------
INSERT INTO `quartz_log` VALUES ('1', 'visitsTask', '2019-04-24 00:00:00', '0 0 0 * * ?', null, '', 'æ›´æ–°è®¿å®¢è®°å½•', 'run', null, '125');
INSERT INTO `quartz_log` VALUES ('2', 'visitsTask', '2019-04-25 00:00:00', '0 0 0 * * ?', null, '', 'æ›´æ–°è®¿å®¢è®°å½•', 'run', null, '200');
INSERT INTO `quartz_log` VALUES ('3', 'visitsTask', '2019-04-26 00:00:00', '0 0 0 * * ?', null, '', 'æ›´æ–°è®¿å®¢è®°å½•', 'run', null, '317');
INSERT INTO `quartz_log` VALUES ('4', 'visitsTask', '2019-04-27 00:00:01', '0 0 0 * * ?', null, '', 'æ›´æ–°è®¿å®¢è®°å½•', 'run', null, '602');
INSERT INTO `quartz_log` VALUES ('5', 'visitsTask', '2019-04-28 00:00:01', '0 0 0 * * ?', null, '', 'æ›´æ–°è®¿å®¢è®°å½•', 'run', null, '504');
INSERT INTO `quartz_log` VALUES ('6', 'visitsTask', '2019-04-29 00:00:00', '0 0 0 * * ?', null, '', 'æ›´æ–°è®¿å®¢è®°å½•', 'run', null, '405');
INSERT INTO `quartz_log` VALUES ('7', 'visitsTask', '2019-04-30 00:00:00', '0 0 0 * * ?', null, '', 'æ›´æ–°è®¿å®¢è®°å½•', 'run', null, '440');
INSERT INTO `quartz_log` VALUES ('8', 'visitsTask', '2019-05-02 00:13:26', '0 0 0 * * ?', null, '', '更新访客记录', 'run', null, '459111');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `data_scope` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '2018-11-23 11:04:37', '管理员', '系统所有权', '全部');
INSERT INTO `role` VALUES ('2', '2018-11-23 13:09:06', '普通用户', '用于测试菜单与权限', '自定义');

-- ----------------------------
-- Table structure for roles_depts
-- ----------------------------
DROP TABLE IF EXISTS `roles_depts`;
CREATE TABLE `roles_depts` (
  `role_id` bigint(20) NOT NULL,
  `dept_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`dept_id`),
  KEY `FK7qg6itn5ajdoa9h9o78v9ksur` (`dept_id`),
  CONSTRAINT `FK7qg6itn5ajdoa9h9o78v9ksur` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`),
  CONSTRAINT `FKrg1ci4cxxfbja0sb0pddju7k` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles_depts
-- ----------------------------
INSERT INTO `roles_depts` VALUES ('2', '7');

-- ----------------------------
-- Table structure for roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `roles_menus`;
CREATE TABLE `roles_menus` (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`menu_id`,`role_id`) USING BTREE,
  KEY `FKcngg2qadojhi3a651a5adkvbq` (`role_id`) USING BTREE,
  CONSTRAINT `FKcngg2qadojhi3a651a5adkvbq` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FKq1knxf8ykt26we8k331naabjx` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles_menus
-- ----------------------------
INSERT INTO `roles_menus` VALUES ('1', '1');
INSERT INTO `roles_menus` VALUES ('2', '1');
INSERT INTO `roles_menus` VALUES ('3', '1');
INSERT INTO `roles_menus` VALUES ('4', '1');
INSERT INTO `roles_menus` VALUES ('5', '1');
INSERT INTO `roles_menus` VALUES ('17', '1');
INSERT INTO `roles_menus` VALUES ('24', '1');
INSERT INTO `roles_menus` VALUES ('27', '1');
INSERT INTO `roles_menus` VALUES ('35', '1');
INSERT INTO `roles_menus` VALUES ('37', '1');
INSERT INTO `roles_menus` VALUES ('39', '1');
INSERT INTO `roles_menus` VALUES ('1', '2');
INSERT INTO `roles_menus` VALUES ('2', '2');
INSERT INTO `roles_menus` VALUES ('3', '2');
INSERT INTO `roles_menus` VALUES ('4', '2');
INSERT INTO `roles_menus` VALUES ('5', '2');
INSERT INTO `roles_menus` VALUES ('17', '2');
INSERT INTO `roles_menus` VALUES ('24', '2');
INSERT INTO `roles_menus` VALUES ('27', '2');
INSERT INTO `roles_menus` VALUES ('35', '2');
INSERT INTO `roles_menus` VALUES ('37', '2');

-- ----------------------------
-- Table structure for roles_permissions
-- ----------------------------
DROP TABLE IF EXISTS `roles_permissions`;
CREATE TABLE `roles_permissions` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `permission_id` bigint(20) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`,`permission_id`) USING BTREE,
  KEY `FKboeuhl31go7wer3bpy6so7exi` (`permission_id`) USING BTREE,
  CONSTRAINT `FK4hrolwj4ned5i7qe8kyiaak6m` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FKboeuhl31go7wer3bpy6so7exi` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles_permissions
-- ----------------------------
INSERT INTO `roles_permissions` VALUES ('1', '1');
INSERT INTO `roles_permissions` VALUES ('2', '3');
INSERT INTO `roles_permissions` VALUES ('2', '4');
INSERT INTO `roles_permissions` VALUES ('2', '8');
INSERT INTO `roles_permissions` VALUES ('2', '14');
INSERT INTO `roles_permissions` VALUES ('2', '23');
INSERT INTO `roles_permissions` VALUES ('2', '24');
INSERT INTO `roles_permissions` VALUES ('2', '25');
INSERT INTO `roles_permissions` VALUES ('2', '26');
INSERT INTO `roles_permissions` VALUES ('2', '30');
INSERT INTO `roles_permissions` VALUES ('2', '41');
INSERT INTO `roles_permissions` VALUES ('2', '46');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `role_code` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_51bvuyvihefoh4kp5syh2jpi4` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `enabled` bigint(20) DEFAULT NULL COMMENT '状态：1启用、0禁用',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `last_password_reset_time` datetime DEFAULT NULL COMMENT '最后修改密码的日期',
  `dept_id` bigint(20) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_kpubos9gc2cvtkb0thktkbkes` (`email`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `FK5rwmryny6jthaaxkogownknqp` (`dept_id`),
  KEY `FKfftoc2abhot8f2wu6cl9a5iky` (`job_id`),
  CONSTRAINT `FK5rwmryny6jthaaxkogownknqp` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`),
  CONSTRAINT `FKfftoc2abhot8f2wu6cl9a5iky` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'https://i.loli.net/2019/04/04/5ca5b971e1548.jpeg', '2018-08-23 09:11:56', 'te@11ss.com', '1', 'e10adc3949ba59abbe56e057f20f883e', 'admin', '2019-04-04 16:00:46', '2', '18888888888', '11');
INSERT INTO `user` VALUES ('3', 'https://aurora-1255840532.cos.ap-chengdu.myqcloud.com/8918a306ea314404835a9196585c4b75.jpeg', '2018-12-27 20:05:26', 'te@11sfs.com', '1', 'e10adc3949ba59abbe56e057f20f883e', 'test', '2019-04-01 09:15:24', '2', '17777777777', '12');
INSERT INTO `user` VALUES ('5', 'https://aurora-1255840532.cos.ap-chengdu.myqcloud.com/8918a306ea314404835a9196585c4b75.jpeg', '2019-04-02 10:07:12', 'hr@d.com', '1', 'e10adc3949ba59abbe56e057f20f883e', 'hr', null, '11', '15555555555', '8');
INSERT INTO `user` VALUES ('6', 'https://aurora-1255840532.cos.ap-chengdu.myqcloud.com/8918a306ea314404835a9196585c4b75.jpeg', '2019-04-29 13:45:58', 'te@11.com', '1', 'e10adc3949ba59abbe56e057f20f883e', 'terry', null, '1', '18888888888', '19');

-- ----------------------------
-- Table structure for users_roles
-- ----------------------------
DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE `users_roles` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE,
  KEY `FKq4eq273l04bpu4efj0jd0jb98` (`role_id`) USING BTREE,
  CONSTRAINT `users_roles_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `users_roles_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_roles
-- ----------------------------
INSERT INTO `users_roles` VALUES ('1', '1');
INSERT INTO `users_roles` VALUES ('6', '1');
INSERT INTO `users_roles` VALUES ('3', '2');
INSERT INTO `users_roles` VALUES ('5', '2');

-- ----------------------------
-- Table structure for visits
-- ----------------------------
DROP TABLE IF EXISTS `visits`;
CREATE TABLE `visits` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `ip_counts` bigint(20) DEFAULT NULL,
  `pv_counts` bigint(20) DEFAULT NULL,
  `week_day` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_11aksgq87euk9bcyeesfs4vtp` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of visits
-- ----------------------------
INSERT INTO `visits` VALUES ('20', '2019-04-24 00:00:00', '2019-04-24', '1', '2', 'Wed');
INSERT INTO `visits` VALUES ('21', '2019-04-25 00:00:00', '2019-04-25', '1', '1', 'Thu');
INSERT INTO `visits` VALUES ('22', '2019-04-26 00:00:00', '2019-04-26', '1', '1', 'Fri');
INSERT INTO `visits` VALUES ('23', '2019-04-27 00:00:01', '2019-04-27', '1', '1', 'Sat');
INSERT INTO `visits` VALUES ('24', '2019-04-28 00:00:00', '2019-04-28', '1', '2', 'Sun');
INSERT INTO `visits` VALUES ('25', '2019-04-29 00:00:00', '2019-04-29', '1', '2', 'Mon');
INSERT INTO `visits` VALUES ('26', '2019-04-30 00:00:00', '2019-04-30', '1', '1', 'Tue');
INSERT INTO `visits` VALUES ('27', '2019-05-01 15:48:39', '2019-05-01', '2', '6', 'Wed');
INSERT INTO `visits` VALUES ('28', '2019-05-02 00:11:26', '2019-05-02', '1', '2', 'Thu');
