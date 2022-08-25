-- MySQL dump 10.13  Distrib 8.0.28, for macos12.0 (arm64)
--
-- Host: 127.0.0.1    Database: corepanel
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


drop database IF EXISTS corepanel;
CREATE DATABASE corepanel DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
 
use corepanel;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

--
-- Table structure for table `auth_users`
--

DROP TABLE IF EXISTS `auth_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `uuid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscribe` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transfer` bigint unsigned NOT NULL DEFAULT '0',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_users`
--

LOCK TABLES `auth_users` WRITE;
/*!40000 ALTER TABLE `auth_users` DISABLE KEYS */;
INSERT INTO `auth_users` VALUES (1,'CorePanel','$2a$10$dwpIt3S1PT.Ll6889ufN9.KAXBqq3MUBmSUQOKQI0R9S/1dU8GdLe','CorePanel','','7a874d3b-0795-4cb8-91f0-94fa96693b03','rYJt364HDkkU7E4p',0,'','tlNcBVK9AvfYH7WEnwB1RKvocJu8FfRy4um3DJtwdHuJy0dwFsLOgAc0xUfh','2022-08-21 13:05:30','2022-08-21 05:05:31'),(2,'normal-user','$2a$10$SZFaGIRgAapMW/higj4fje6HbenHBtsQ8.avomcCGMi/5xfPj9nCO','普通用户','','aa770cff-fd92-461a-a9be-a4c8657bbb45','LG3cAAAHrGxd5jhz',0,NULL,NULL,'2022-08-25 05:26:13','2022-08-25 05:26:13');
/*!40000 ALTER TABLE `auth_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corepanel_groups`
--

DROP TABLE IF EXISTS `corepanel_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corepanel_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `user_role` int NOT NULL,
  `node_role` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corepanel_groups`
--

LOCK TABLES `corepanel_groups` WRITE;
/*!40000 ALTER TABLE `corepanel_groups` DISABLE KEYS */;
INSERT INTO `corepanel_groups` VALUES (1,'默认分组','默认分组',1,1);
/*!40000 ALTER TABLE `corepanel_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corepanel_menu`
--

DROP TABLE IF EXISTS `corepanel_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corepanel_menu` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `order` int unsigned NOT NULL DEFAULT '0',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `header` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plugin_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `uuid` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corepanel_menu`
--

LOCK TABLES `corepanel_menu` WRITE;
/*!40000 ALTER TABLE `corepanel_menu` DISABLE KEYS */;
INSERT INTO `corepanel_menu` VALUES (1,0,1,2,'Admin','fa-tasks','',NULL,'',NULL,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(2,1,1,2,'Users','fa-users','/info/auth_users','','',NULL,'2019-09-10 00:00:00','2022-08-23 16:15:34'),(3,1,1,3,'Roles','fa-user','/info/roles',NULL,'',NULL,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(4,1,1,4,'Permission','fa-ban','/info/permission',NULL,'',NULL,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(5,1,1,5,'Menu','fa-bars','/menu',NULL,'',NULL,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(6,1,1,6,'Operation log','fa-history','/info/op',NULL,'',NULL,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(7,0,1,1,'Dashboard','fa-bar-chart','/',NULL,'',NULL,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(8,10,0,2,'用户代理规则','fa-user','/info/transfer_role_user','','',NULL,'2022-08-21 03:45:34','2022-08-23 17:19:06'),(9,10,0,2,'节点代理规则','fa-chain-broken','/info/transfer_role_node','','',NULL,'2022-08-23 08:38:49','2022-08-23 17:19:16'),(10,0,0,2,'规则管理','fa-adjust','','','',NULL,'2022-08-23 09:18:56','2022-08-23 09:18:56'),(11,1,0,2,'分组','fa-bars','/info/corepanel_groups','','',NULL,'2022-08-23 09:36:12','2022-08-23 17:39:20'),(12,1,0,2,'节点','fa-database','/info/nodes','','',NULL,'2022-08-23 12:18:36','2022-08-23 12:18:36');
/*!40000 ALTER TABLE `corepanel_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corepanel_operation_log`
--

DROP TABLE IF EXISTS `corepanel_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corepanel_operation_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corepanel_operation_log`
--


--
-- Table structure for table `corepanel_permissions`
--

DROP TABLE IF EXISTS `corepanel_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corepanel_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corepanel_permissions`
--

LOCK TABLES `corepanel_permissions` WRITE;
/*!40000 ALTER TABLE `corepanel_permissions` DISABLE KEYS */;
INSERT INTO `corepanel_permissions` VALUES (1,'All permission','*','','*','2019-09-10 00:00:00','2019-09-10 00:00:00'),(2,'Dashboard','dashboard','GET,PUT,POST,DELETE','/','2019-09-10 00:00:00','2019-09-10 00:00:00'),(3,'auth_users 查询','auth_users_query','GET','/info/auth_users','2022-08-21 03:18:56','2022-08-21 03:18:56'),(4,'auth_users 编辑页显示','auth_users_show_edit','GET','/info/auth_users/edit','2022-08-21 03:18:56','2022-08-21 03:18:56'),(5,'auth_users 新建记录页显示','auth_users_show_create','GET','/info/auth_users/new','2022-08-21 03:18:56','2022-08-21 03:18:56'),(6,'auth_users 编辑','auth_users_edit','POST','/edit/auth_users','2022-08-21 03:18:56','2022-08-21 03:18:56'),(7,'auth_users 新建','auth_users_create','POST','/new/auth_users','2022-08-21 03:18:56','2022-08-21 03:18:56'),(8,'auth_users 删除','auth_users_delete','POST','/delete/auth_users','2022-08-21 03:18:56','2022-08-21 03:18:56'),(9,'auth_users 导出','auth_users_export','POST','/export/auth_users','2022-08-21 03:18:56','2022-08-21 03:18:56');
/*!40000 ALTER TABLE `corepanel_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corepanel_role_menu`
--

DROP TABLE IF EXISTS `corepanel_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corepanel_role_menu` (
  `role_id` int unsigned NOT NULL,
  `menu_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corepanel_role_menu`
--

LOCK TABLES `corepanel_role_menu` WRITE;
/*!40000 ALTER TABLE `corepanel_role_menu` DISABLE KEYS */;
INSERT INTO `corepanel_role_menu` VALUES (1,1,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(1,7,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(2,7,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(1,10,'2022-08-23 09:18:56','2022-08-23 09:18:56'),(1,8,'2022-08-23 09:19:06','2022-08-23 09:19:06'),(2,8,'2022-08-23 09:19:06','2022-08-23 09:19:06'),(1,11,'2022-08-23 09:39:20','2022-08-23 09:39:20'),(1,12,'2022-08-23 12:18:36','2022-08-23 12:18:36');
/*!40000 ALTER TABLE `corepanel_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corepanel_role_permissions`
--

DROP TABLE IF EXISTS `corepanel_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corepanel_role_permissions` (
  `role_id` int unsigned NOT NULL,
  `permission_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `admin_role_permissions` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corepanel_role_permissions`
--

LOCK TABLES `corepanel_role_permissions` WRITE;
/*!40000 ALTER TABLE `corepanel_role_permissions` DISABLE KEYS */;
INSERT INTO `corepanel_role_permissions` VALUES (1,1,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(1,2,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(2,2,'2019-09-10 00:00:00','2019-09-10 00:00:00');
/*!40000 ALTER TABLE `corepanel_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corepanel_role_users`
--

DROP TABLE IF EXISTS `corepanel_role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corepanel_role_users` (
  `role_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `admin_user_roles` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corepanel_role_users`
--

LOCK TABLES `corepanel_role_users` WRITE;
/*!40000 ALTER TABLE `corepanel_role_users` DISABLE KEYS */;
INSERT INTO `corepanel_role_users` VALUES (1,1,'2022-08-21 02:09:41','2022-08-21 02:09:41'),(2,2,'2022-08-25 05:26:13','2022-08-25 05:26:13');
/*!40000 ALTER TABLE `corepanel_role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corepanel_roles`
--

DROP TABLE IF EXISTS `corepanel_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corepanel_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corepanel_roles`
--

LOCK TABLES `corepanel_roles` WRITE;
/*!40000 ALTER TABLE `corepanel_roles` DISABLE KEYS */;
INSERT INTO `corepanel_roles` VALUES (1,'Administrator','administrator','2019-09-10 00:00:00','2019-09-10 00:00:00'),(2,'Operator','operator','2019-09-10 00:00:00','2019-09-10 00:00:00');
/*!40000 ALTER TABLE `corepanel_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corepanel_session`
--

DROP TABLE IF EXISTS `corepanel_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corepanel_session` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `values` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corepanel_session`
--

LOCK TABLES `corepanel_session` WRITE;
/*!40000 ALTER TABLE `corepanel_session` DISABLE KEYS */;
INSERT INTO `corepanel_session` VALUES (324,'b7436765-374e-4791-ac2b-baddcc498e45','{\"user_id\":1}','2022-08-25 05:07:00','2022-08-25 05:07:00'),(325,'1dea302b-7f97-4dd2-a8b4-4557b02fa59e','__csrf_token__','2022-08-25 05:07:09','2022-08-25 05:07:09'),(326,'f4f5db47-f467-4c34-8306-93981a45265a','__csrf_token__','2022-08-25 05:07:56','2022-08-25 05:07:56'),(327,'c55fdc48-4f95-4716-af64-ba6ab859cc85','__csrf_token__','2022-08-25 05:08:21','2022-08-25 05:08:21'),(328,'af4cc893-49dc-465f-aa26-d478a0f74c3b','__csrf_token__','2022-08-25 05:08:36','2022-08-25 05:08:36');
/*!40000 ALTER TABLE `corepanel_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corepanel_site`
--

DROP TABLE IF EXISTS `corepanel_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corepanel_site` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corepanel_site`
--

LOCK TABLES `corepanel_site` WRITE;
/*!40000 ALTER TABLE `corepanel_site` DISABLE KEYS */;
INSERT INTO `corepanel_site` VALUES (1,'logger_encoder_time','iso8601',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(2,'hide_tool_entrance','true',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(3,'index_url','/',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(4,'hide_config_center_entrance','true',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(5,'hide_plugin_entrance','true',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(6,'app_id','zblVt5rwz36t',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(7,'login_url','/login',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(8,'no_limit_login_ip','false',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(9,'open_admin_api','false',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(10,'hide_visitor_user_center_entrance','false',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(11,'allow_del_operation_log','false',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(12,'access_log_off','false',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(13,'domain','',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(14,'info_log_path','/tmp/server.info',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(15,'logger_encoder_caller','full',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(16,'custom_403_html','',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(17,'go_mod_file_path','/app/go.mod',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(18,'logger_rotate_max_size','10',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(19,'auth_user_table','auth_users',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(20,'animation_duration','0.00',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(21,'custom_404_html','',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(22,'operation_log_off','false',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(23,'theme','adminlte',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(24,'error_log_path','/tmp/server.error',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(25,'sql_log','true',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(26,'logger_encoder_time_key','ts',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(27,'extra','',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(28,'logger_rotate_max_backups','5',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(29,'asset_root_path','./public/',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(30,'hide_app_info_entrance','true',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(31,'url_prefix','admin',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(32,'env','local',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(33,'access_assets_log_off','false',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(34,'logger_encoder_level','capitalColor',NULL,1,'2022-08-20 05:50:44','2022-08-20 05:50:44'),(35,'logger_level','0',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(36,'login_logo','',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(37,'language','zh',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(38,'access_log_path','/tmp/server.access',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(39,'color_scheme','skin-black',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(40,'site_off','false',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(41,'logger_encoder_caller_key','caller',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(42,'logger_encoder_message_key','msg',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(43,'prohibit_config_modification','false',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(44,'title','CorePanel',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(45,'logger_encoder_name_key','logger',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(46,'session_life_time','7200',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(47,'login_title','CorePanel',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(48,'animation_type','',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(49,'exclude_theme_components','null',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(50,'logo','<b>Core</b>Panel',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(51,'debug','true',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(52,'info_log_off','false',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(53,'logger_encoder_stacktrace_key','stacktrace',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(54,'file_upload_engine','{\"name\":\"local\"}',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(55,'custom_500_html','',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(56,'logger_encoder_level_key','level',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(57,'logger_encoder_duration','string',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(58,'footer_info','',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(59,'animation_delay','0.00',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(60,'custom_head_html','',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(61,'custom_foot_html','',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(62,'mini_logo','        <b>C</b>P',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(63,'error_log_off','false',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(64,'logger_rotate_max_age','30',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(65,'logger_rotate_compress','false',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(66,'logger_encoder_encoding','console',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(67,'asset_url','',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45'),(68,'bootstrap_file_path','/app/bootstrap.go',NULL,1,'2022-08-20 05:50:45','2022-08-20 05:50:45');
/*!40000 ALTER TABLE `corepanel_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corepanel_user_permissions`
--

DROP TABLE IF EXISTS `corepanel_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corepanel_user_permissions` (
  `user_id` int unsigned NOT NULL,
  `permission_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `admin_user_permissions` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corepanel_user_permissions`
--

LOCK TABLES `corepanel_user_permissions` WRITE;
/*!40000 ALTER TABLE `corepanel_user_permissions` DISABLE KEYS */;
INSERT INTO `corepanel_user_permissions` VALUES (1,1,'2022-08-21 02:09:41','2022-08-21 02:09:41'),(2,2,'2019-09-10 00:00:00','2019-09-10 00:00:00');
/*!40000 ALTER TABLE `corepanel_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_groups`
--

DROP TABLE IF EXISTS `node_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `node_groups` (
  `id` bigint DEFAULT NULL,
  `node_id` bigint NOT NULL,
  `group_id` bigint NOT NULL,
  PRIMARY KEY (`node_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_groups`
--

LOCK TABLES `node_groups` WRITE;
/*!40000 ALTER TABLE `node_groups` DISABLE KEYS */;
INSERT INTO `node_groups` VALUES (0,1,1);
/*!40000 ALTER TABLE `node_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodes`
--

DROP TABLE IF EXISTS `nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `ip` text COLLATE utf8mb4_general_ci NOT NULL,
  `transfer` bigint NOT NULL DEFAULT '0',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `enable` tinyint DEFAULT '0',
  `last_online` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nodes_name_uindex` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodes`
--

LOCK TABLES `nodes` WRITE;
/*!40000 ALTER TABLE `nodes` DISABLE KEYS */;
INSERT INTO `nodes` VALUES (1,'默认节点','1.1.1.1',0,'默认节点',1,NULL);
/*!40000 ALTER TABLE `nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer_role_node`
--

DROP TABLE IF EXISTS `transfer_role_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer_role_node` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `trn_desc` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_role_node`
--

LOCK TABLES `transfer_role_node` WRITE;
/*!40000 ALTER TABLE `transfer_role_node` DISABLE KEYS */;
INSERT INTO `transfer_role_node` VALUES (1,'block:\r\n  - porn.com\r\n  - www.demo.com','default');
/*!40000 ALTER TABLE `transfer_role_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer_role_user`
--

DROP TABLE IF EXISTS `transfer_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer_role_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `tru_desc` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_role_user`
--

LOCK TABLES `transfer_role_user` WRITE;
/*!40000 ALTER TABLE `transfer_role_user` DISABLE KEYS */;
INSERT INTO `transfer_role_user` VALUES (1,'#---------------------------------------------------#\r\n## 配置文件需要放置在 $HOME/.config/clash/config.yml\r\n##\r\n## 如果您不知道如何操作，请参阅 SS-Rule-Snippet 的 Wiki：\r\n## https://github.com/Hackl0us/SS-Rule-Snippet/wiki/clash(X)\r\n#---------------------------------------------------#\r\n# HTTP 代理端口\r\nport: 7890\r\nsocks-port: 7891\r\nredir-port: 7892\r\nallow-lan: true\r\nmode: rule\r\nlog-level: silent\r\nexternal-controller: \'127.0.0.1:9090\'\r\nsecret: \'\'\r\ndns:\r\n  enable: true\r\n  ipv6: true\r\n  listen: \'0.0.0.0:53\'\r\n  enhanced-mode: fake-ip\r\n  fake-ip-range: 198.18.0.1/16\r\n  nameserver:\r\n    - 119.29.29.29\r\n    - 1.1.1.1\r\n  fallback:\r\n    - 1.0.0.1\r\n    - 8.8.8.8\r\n  fallback-filter:\r\n    geoip: true\r\n    ipcidr:\r\n      - 240.0.0.0/4\r\nproxies: \r\n{{- range $key, $value := .NodeMap }}\r\n  -\r\n    name: {{$key}}\r\n    type: trojan\r\n    server: {{$value}}\r\n    port: 443\r\n    password: {{$.UUID}}\r\n    sni: www.wikigo.com\r\n    udp: false\r\n    skip-cert-verify: true\r\n{{end -}}\r\nproxy-groups:\r\n  -\r\n    name: Proxy\r\n    type: select\r\n    proxies: \r\n{{- range $key, $value := .NodeMap }}\r\n      - {{$key}}\r\n{{- end}}\r\n      - 🚀直接连接    \r\n  -\r\n    name: 🚀直接连接\r\n    type: select\r\n    proxies:\r\n      - DIRECT\r\n\r\nrules:\r\n  - DOMAIN,exchange.mojo.hoogeek.com,Proxy\r\n  - DOMAIN-SUFFIX,gitlab.com,Proxy\r\n  - DOMAIN-SUFFIX,gitlab.io,Proxy\r\n  - DOMAIN-SUFFIX,hoogeek.com,Proxy\r\n  - DOMAIN-SUFFIX,ldap.hoogeek.com,Proxy\r\n  - DOMAIN-SUFFIX,hoofpx.com,Proxy\r\n  - DOMAIN-SUFFIX,azure.com,Proxy\r\n  - DOMAIN-SUFFIX,zoom.us,Proxy\r\n  - DOMAIN-SUFFIX,atlassian.net,Proxy\r\n  # Apple\r\n  - DOMAIN,safebrowsing.urlsec.qq.com,DIRECT # 如果您并不信任此服务提供商或防止其下载消耗过多带宽资源，可以进入 Safari 设置，关闭 Fraudulent Website Warning 功能，并使用 REJECT 策略。\r\n  - DOMAIN,safebrowsing.googleapis.com,DIRECT # 如果您并不信任此服务提供商或防止其下载消耗过多带宽资源，可以进入 Safari 设置，关闭 Fraudulent Website Warning 功能，并使用 REJECT 策略。\r\n  - DOMAIN,developer.apple.com,Proxy\r\n  - DOMAIN-SUFFIX,digicert.com,Proxy\r\n  - DOMAIN,ocsp.apple.com,Proxy\r\n  - DOMAIN,ocsp.comodoca.com,Proxy\r\n  - DOMAIN,ocsp.usertrust.com,Proxy\r\n  - DOMAIN,ocsp.sectigo.com,Proxy\r\n  - DOMAIN,ocsp.verisign.net,Proxy\r\n  - DOMAIN-SUFFIX,apple-dns.net,Proxy\r\n  - DOMAIN,testflight.apple.com,Proxy\r\n  - DOMAIN,sandbox.itunes.apple.com,Proxy\r\n  - DOMAIN,itunes.apple.com,Proxy\r\n  - DOMAIN-SUFFIX,apps.apple.com,Proxy\r\n  - DOMAIN-SUFFIX,blobstore.apple.com,Proxy\r\n  - DOMAIN,cvws.icloud-content.com,Proxy\r\n  - DOMAIN-SUFFIX,mzstatic.com,DIRECT\r\n  - DOMAIN-SUFFIX,itunes.apple.com,DIRECT\r\n  - DOMAIN-SUFFIX,icloud.com,DIRECT\r\n  - DOMAIN-SUFFIX,icloud-content.com,DIRECT\r\n  - DOMAIN-SUFFIX,me.com,DIRECT\r\n  - DOMAIN-SUFFIX,aaplimg.com,DIRECT\r\n  - DOMAIN-SUFFIX,cdn20.com,DIRECT\r\n  - DOMAIN-SUFFIX,cdn-apple.com,DIRECT\r\n  - DOMAIN-SUFFIX,akadns.net,DIRECT\r\n  - DOMAIN-SUFFIX,akamaiedge.net,DIRECT\r\n  - DOMAIN-SUFFIX,edgekey.net,DIRECT\r\n  - DOMAIN-SUFFIX,mwcloudcdn.com,DIRECT\r\n  - DOMAIN-SUFFIX,mwcname.com,DIRECT\r\n  - DOMAIN-SUFFIX,apple.com,DIRECT\r\n  - DOMAIN-SUFFIX,apple-cloudkit.com,DIRECT\r\n  - DOMAIN-SUFFIX,apple-mapkit.com,DIRECT\r\n  # - DOMAIN,e.crashlytics.com,REJECT\r\n\r\n  # 国内网站\r\n  - DOMAIN-SUFFIX,cn,DIRECT\r\n  - DOMAIN-KEYWORD,-cn,DIRECT\r\n\r\n  - DOMAIN-SUFFIX,126.com,DIRECT\r\n  - DOMAIN-SUFFIX,126.net,DIRECT\r\n  - DOMAIN-SUFFIX,127.net,DIRECT\r\n  - DOMAIN-SUFFIX,163.com,DIRECT\r\n  - DOMAIN-SUFFIX,360buyimg.com,DIRECT\r\n  - DOMAIN-SUFFIX,36kr.com,DIRECT\r\n  - DOMAIN-SUFFIX,acfun.tv,DIRECT\r\n  - DOMAIN-SUFFIX,air-matters.com,DIRECT\r\n  - DOMAIN-SUFFIX,aixifan.com,DIRECT\r\n  - DOMAIN-KEYWORD,alicdn,DIRECT\r\n  - DOMAIN-KEYWORD,alipay,DIRECT\r\n  - DOMAIN-KEYWORD,taobao,DIRECT\r\n  - DOMAIN-SUFFIX,amap.com,DIRECT\r\n  - DOMAIN-SUFFIX,autonavi.com,DIRECT\r\n  - DOMAIN-KEYWORD,baidu,DIRECT\r\n  - DOMAIN-SUFFIX,bdimg.com,DIRECT\r\n  - DOMAIN-SUFFIX,bdstatic.com,DIRECT\r\n  - DOMAIN-SUFFIX,bilibili.com,DIRECT\r\n  - DOMAIN-SUFFIX,bilivideo.com,DIRECT\r\n  - DOMAIN-SUFFIX,caiyunapp.com,DIRECT\r\n  - DOMAIN-SUFFIX,clouddn.com,DIRECT\r\n  - DOMAIN-SUFFIX,cnbeta.com,DIRECT\r\n  - DOMAIN-SUFFIX,cnbetacdn.com,DIRECT\r\n  - DOMAIN-SUFFIX,cootekservice.com,DIRECT\r\n  - DOMAIN-SUFFIX,csdn.net,DIRECT\r\n  - DOMAIN-SUFFIX,ctrip.com,DIRECT\r\n  - DOMAIN-SUFFIX,dgtle.com,DIRECT\r\n  - DOMAIN-SUFFIX,dianping.com,DIRECT\r\n  - DOMAIN-SUFFIX,douban.com,DIRECT\r\n  - DOMAIN-SUFFIX,doubanio.com,DIRECT\r\n  - DOMAIN-SUFFIX,duokan.com,DIRECT\r\n  - DOMAIN-SUFFIX,easou.com,DIRECT\r\n  - DOMAIN-SUFFIX,ele.me,DIRECT\r\n  - DOMAIN-SUFFIX,feng.com,DIRECT\r\n  - DOMAIN-SUFFIX,fir.im,DIRECT\r\n  - DOMAIN-SUFFIX,frdic.com,DIRECT\r\n  - DOMAIN-SUFFIX,g-cores.com,DIRECT\r\n  - DOMAIN-SUFFIX,godic.net,DIRECT\r\n  - DOMAIN-SUFFIX,gtimg.com,DIRECT\r\n  - DOMAIN,cdn.hockeyapp.net,DIRECT\r\n  - DOMAIN-SUFFIX,hongxiu.com,DIRECT\r\n  - DOMAIN-SUFFIX,hxcdn.net,DIRECT\r\n  - DOMAIN-SUFFIX,iciba.com,DIRECT\r\n  - DOMAIN-SUFFIX,ifeng.com,DIRECT\r\n  - DOMAIN-SUFFIX,ifengimg.com,DIRECT\r\n  - DOMAIN-SUFFIX,ipip.net,DIRECT\r\n  - DOMAIN-SUFFIX,iqiyi.com,DIRECT\r\n  - DOMAIN-SUFFIX,jd.com,DIRECT\r\n  - DOMAIN-SUFFIX,jianshu.com,DIRECT\r\n  - DOMAIN-SUFFIX,knewone.com,DIRECT\r\n  - DOMAIN-SUFFIX,le.com,DIRECT\r\n  - DOMAIN-SUFFIX,lecloud.com,DIRECT\r\n  - DOMAIN-SUFFIX,lemicp.com,DIRECT\r\n  - DOMAIN-SUFFIX,licdn.com,DIRECT\r\n  - DOMAIN-SUFFIX,linkedin.com,DIRECT\r\n  - DOMAIN-SUFFIX,luoo.net,DIRECT\r\n  - DOMAIN-SUFFIX,meituan.com,DIRECT\r\n  - DOMAIN-SUFFIX,meituan.net,DIRECT\r\n  - DOMAIN-SUFFIX,mi.com,DIRECT\r\n  - DOMAIN-SUFFIX,miaopai.com,DIRECT\r\n  - DOMAIN-SUFFIX,microsoft.com,Proxy\r\n  - DOMAIN-SUFFIX,microsoftonline.com,DIRECT\r\n  - DOMAIN-SUFFIX,miui.com,DIRECT\r\n  - DOMAIN-SUFFIX,miwifi.com,DIRECT\r\n  - DOMAIN-SUFFIX,mob.com,DIRECT\r\n  - DOMAIN-SUFFIX,netease.com,DIRECT\r\n  - DOMAIN-SUFFIX,office.com,Proxy\r\n  - DOMAIN-SUFFIX,office365.com,Proxy\r\n  - DOMAIN-KEYWORD,officecdn,DIRECT\r\n  - DOMAIN-SUFFIX,oschina.net,DIRECT\r\n  - DOMAIN-SUFFIX,ppsimg.com,DIRECT\r\n  - DOMAIN-SUFFIX,pstatp.com,DIRECT\r\n  - DOMAIN-SUFFIX,qcloud.com,DIRECT\r\n  - DOMAIN-SUFFIX,qdaily.com,DIRECT\r\n  - DOMAIN-SUFFIX,qdmm.com,DIRECT\r\n  - DOMAIN-SUFFIX,qhimg.com,DIRECT\r\n  - DOMAIN-SUFFIX,qhres.com,DIRECT\r\n  - DOMAIN-SUFFIX,qidian.com,DIRECT\r\n  - DOMAIN-SUFFIX,qihucdn.com,DIRECT\r\n  - DOMAIN-SUFFIX,qiniu.com,DIRECT\r\n  - DOMAIN-SUFFIX,qiniucdn.com,DIRECT\r\n  - DOMAIN-SUFFIX,qiyipic.com,DIRECT\r\n  - DOMAIN-SUFFIX,qq.com,DIRECT\r\n  - DOMAIN-SUFFIX,qqurl.com,DIRECT\r\n  - DOMAIN-SUFFIX,rarbg.to,DIRECT\r\n  - DOMAIN-SUFFIX,ruguoapp.com,DIRECT\r\n  - DOMAIN-SUFFIX,segmentfault.com,DIRECT\r\n  - DOMAIN-SUFFIX,sinaapp.com,DIRECT\r\n  - DOMAIN-SUFFIX,smzdm.com,DIRECT\r\n  - DOMAIN-SUFFIX,snapdrop.net,DIRECT\r\n  - DOMAIN-SUFFIX,sogou.com,DIRECT\r\n  - DOMAIN-SUFFIX,sogoucdn.com,DIRECT\r\n  - DOMAIN-SUFFIX,sohu.com,DIRECT\r\n  - DOMAIN-SUFFIX,soku.com,DIRECT\r\n  - DOMAIN-SUFFIX,speedtest.net,DIRECT\r\n  - DOMAIN-SUFFIX,sspai.com,DIRECT\r\n  - DOMAIN-SUFFIX,suning.com,DIRECT\r\n  - DOMAIN-SUFFIX,taobao.com,DIRECT\r\n  - DOMAIN-SUFFIX,tencent.com,DIRECT\r\n  - DOMAIN-SUFFIX,tenpay.com,DIRECT\r\n  - DOMAIN-SUFFIX,tianyancha.com,DIRECT\r\n  - DOMAIN-SUFFIX,tmall.com,DIRECT\r\n  - DOMAIN-SUFFIX,tudou.com,DIRECT\r\n  - DOMAIN-SUFFIX,umetrip.com,DIRECT\r\n  - DOMAIN-SUFFIX,upaiyun.com,DIRECT\r\n  - DOMAIN-SUFFIX,upyun.com,DIRECT\r\n  - DOMAIN-SUFFIX,veryzhun.com,DIRECT\r\n  - DOMAIN-SUFFIX,weather.com,DIRECT\r\n  - DOMAIN-SUFFIX,weibo.com,DIRECT\r\n  - DOMAIN-SUFFIX,xiami.com,DIRECT\r\n  - DOMAIN-SUFFIX,xiami.net,DIRECT\r\n  - DOMAIN-SUFFIX,xiaomicp.com,DIRECT\r\n  - DOMAIN-SUFFIX,ximalaya.com,DIRECT\r\n  - DOMAIN-SUFFIX,xmcdn.com,DIRECT\r\n  - DOMAIN-SUFFIX,xunlei.com,DIRECT\r\n  - DOMAIN-SUFFIX,yhd.com,DIRECT\r\n  - DOMAIN-SUFFIX,yihaodianimg.com,DIRECT\r\n  - DOMAIN-SUFFIX,yinxiang.com,DIRECT\r\n  - DOMAIN-SUFFIX,ykimg.com,DIRECT\r\n  - DOMAIN-SUFFIX,youdao.com,DIRECT\r\n  - DOMAIN-SUFFIX,youku.com,DIRECT\r\n  - DOMAIN-SUFFIX,zealer.com,DIRECT\r\n  - DOMAIN-SUFFIX,zhihu.com,DIRECT\r\n  - DOMAIN-SUFFIX,zhimg.com,DIRECT\r\n  - DOMAIN-SUFFIX,zimuzu.tv,DIRECT\r\n  - DOMAIN-SUFFIX,zoho.com,DIRECT\r\n  - DOMAIN,boss.cnwangjie.com,DIRECT\r\n\r\n  # 抗 DNS 污染\r\n  - DOMAIN-KEYWORD,amazon,Proxy\r\n  - DOMAIN-KEYWORD,google,Proxy\r\n  - DOMAIN-KEYWORD,gmail,Proxy\r\n  - DOMAIN-KEYWORD,youtube,Proxy\r\n  - DOMAIN-KEYWORD,facebook,Proxy\r\n  - DOMAIN-SUFFIX,fb.me,Proxy\r\n  - DOMAIN-SUFFIX,fbcdn.net,Proxy\r\n  - DOMAIN-KEYWORD,twitter,Proxy\r\n  - DOMAIN-KEYWORD,instagram,Proxy\r\n  - DOMAIN-KEYWORD,dropbox,Proxy\r\n  - DOMAIN-SUFFIX,twimg.com,Proxy\r\n  - DOMAIN-KEYWORD,blogspot,Proxy\r\n  - DOMAIN-SUFFIX,youtu.be,Proxy\r\n  - DOMAIN-KEYWORD,whatsapp,Proxy\r\n\r\n  # 常见广告域名屏蔽\r\n  - DOMAIN-KEYWORD,admarvel,REJECT\r\n  - DOMAIN-KEYWORD,admaster,REJECT\r\n  - DOMAIN-KEYWORD,adsage,REJECT\r\n  - DOMAIN-KEYWORD,adsmogo,REJECT\r\n  - DOMAIN-KEYWORD,adsrvmedia,REJECT\r\n  - DOMAIN-KEYWORD,adwords,REJECT\r\n  - DOMAIN-KEYWORD,adservice,REJECT\r\n  - DOMAIN-SUFFIX,appsflyer.com,REJECT\r\n  - DOMAIN-KEYWORD,domob,REJECT\r\n  - DOMAIN-SUFFIX,doubleclick.net,REJECT\r\n  - DOMAIN-KEYWORD,duomeng,REJECT\r\n  - DOMAIN-KEYWORD,dwtrack,REJECT\r\n  - DOMAIN-KEYWORD,guanggao,REJECT\r\n  - DOMAIN-KEYWORD,lianmeng,REJECT\r\n  - DOMAIN-SUFFIX,mmstat.com,REJECT\r\n  - DOMAIN-KEYWORD,mopub,REJECT\r\n  - DOMAIN-KEYWORD,omgmta,REJECT\r\n  - DOMAIN-KEYWORD,openx,REJECT\r\n  - DOMAIN-KEYWORD,partnerad,REJECT\r\n  - DOMAIN-KEYWORD,pingfore,REJECT\r\n  - DOMAIN-KEYWORD,supersonicads,REJECT\r\n  - DOMAIN-KEYWORD,uedas,REJECT\r\n  - DOMAIN-KEYWORD,umeng,REJECT\r\n  - DOMAIN-KEYWORD,usage,REJECT\r\n  - DOMAIN-SUFFIX,vungle.com,REJECT\r\n  - DOMAIN-KEYWORD,wlmonitor,REJECT\r\n  - DOMAIN-KEYWORD,zjtoolbar,REJECT\r\n\r\n  # 国外网站\r\n  - DOMAIN-SUFFIX,9to5mac.com,Proxy\r\n  - DOMAIN-SUFFIX,abpchina.org,Proxy\r\n  - DOMAIN-SUFFIX,adblockplus.org,Proxy\r\n  - DOMAIN-SUFFIX,adobe.com,Proxy\r\n  - DOMAIN-SUFFIX,akamaized.net,Proxy\r\n  - DOMAIN-SUFFIX,alfredapp.com,Proxy\r\n  - DOMAIN-SUFFIX,amplitude.com,Proxy\r\n  - DOMAIN-SUFFIX,ampproject.org,Proxy\r\n  - DOMAIN-SUFFIX,android.com,Proxy\r\n  - DOMAIN-SUFFIX,angularjs.org,Proxy\r\n  - DOMAIN-SUFFIX,aolcdn.com,Proxy\r\n  - DOMAIN-SUFFIX,apkpure.com,Proxy\r\n  - DOMAIN-SUFFIX,appledaily.com,Proxy\r\n  - DOMAIN-SUFFIX,appshopper.com,Proxy\r\n  - DOMAIN-SUFFIX,appspot.com,Proxy\r\n  - DOMAIN-SUFFIX,arcgis.com,Proxy\r\n  - DOMAIN-SUFFIX,archive.org,Proxy\r\n  - DOMAIN-SUFFIX,armorgames.com,Proxy\r\n  - DOMAIN-SUFFIX,aspnetcdn.com,Proxy\r\n  - DOMAIN-SUFFIX,att.com,Proxy\r\n  - DOMAIN-SUFFIX,awsstatic.com,Proxy\r\n  - DOMAIN-SUFFIX,azureedge.net,Proxy\r\n  - DOMAIN-SUFFIX,azurewebsites.net,Proxy\r\n  - DOMAIN-SUFFIX,bing.com,Proxy\r\n  - DOMAIN-SUFFIX,bintray.com,Proxy\r\n  - DOMAIN-SUFFIX,bit.com,Proxy\r\n  - DOMAIN-SUFFIX,bit.ly,Proxy\r\n  - DOMAIN-SUFFIX,bitbucket.org,Proxy\r\n  - DOMAIN-SUFFIX,bjango.com,Proxy\r\n  - DOMAIN-SUFFIX,bkrtx.com,Proxy\r\n  - DOMAIN-SUFFIX,blog.com,Proxy\r\n  - DOMAIN-SUFFIX,blogcdn.com,Proxy\r\n  - DOMAIN-SUFFIX,blogger.com,Proxy\r\n  - DOMAIN-SUFFIX,blogsmithmedia.com,Proxy\r\n  - DOMAIN-SUFFIX,blogspot.com,Proxy\r\n  - DOMAIN-SUFFIX,blogspot.hk,Proxy\r\n  - DOMAIN-SUFFIX,bloomberg.com,Proxy\r\n  - DOMAIN-SUFFIX,box.com,Proxy\r\n  - DOMAIN-SUFFIX,box.net,Proxy\r\n  - DOMAIN-SUFFIX,cachefly.net,Proxy\r\n  - DOMAIN-SUFFIX,chromium.org,Proxy\r\n  - DOMAIN-SUFFIX,cl.ly,Proxy\r\n  - DOMAIN-SUFFIX,cloudflare.com,Proxy\r\n  - DOMAIN-SUFFIX,cloudfront.net,Proxy\r\n  - DOMAIN-SUFFIX,cloudmagic.com,Proxy\r\n  - DOMAIN-SUFFIX,cmail19.com,Proxy\r\n  - DOMAIN-SUFFIX,cnet.com,Proxy\r\n  - DOMAIN-SUFFIX,cocoapods.org,Proxy\r\n  - DOMAIN-SUFFIX,comodoca.com,Proxy\r\n  - DOMAIN-SUFFIX,crashlytics.com,Proxy\r\n  - DOMAIN-SUFFIX,culturedcode.com,Proxy\r\n  - DOMAIN-SUFFIX,d.pr,Proxy\r\n  - DOMAIN-SUFFIX,danilo.to,Proxy\r\n  - DOMAIN-SUFFIX,dayone.me,Proxy\r\n  - DOMAIN-SUFFIX,db.tt,Proxy\r\n  - DOMAIN-SUFFIX,deskconnect.com,Proxy\r\n  - DOMAIN-SUFFIX,disq.us,Proxy\r\n  - DOMAIN-SUFFIX,disqus.com,Proxy\r\n  - DOMAIN-SUFFIX,disquscdn.com,Proxy\r\n  - DOMAIN-SUFFIX,dnsimple.com,Proxy\r\n  - DOMAIN-SUFFIX,docker.com,Proxy\r\n  - DOMAIN-SUFFIX,dribbble.com,Proxy\r\n  - DOMAIN-SUFFIX,droplr.com,Proxy\r\n  - DOMAIN-SUFFIX,duckduckgo.com,Proxy\r\n  - DOMAIN-SUFFIX,dueapp.com,Proxy\r\n  - DOMAIN-SUFFIX,dytt8.net,Proxy\r\n  - DOMAIN-SUFFIX,edgecastcdn.net,Proxy\r\n  - DOMAIN-SUFFIX,edgekey.net,Proxy\r\n  - DOMAIN-SUFFIX,edgesuite.net,Proxy\r\n  - DOMAIN-SUFFIX,engadget.com,Proxy\r\n  - DOMAIN-SUFFIX,entrust.net,Proxy\r\n  - DOMAIN-SUFFIX,eurekavpt.com,Proxy\r\n  - DOMAIN-SUFFIX,evernote.com,Proxy\r\n  - DOMAIN-SUFFIX,fabric.io,Proxy\r\n  - DOMAIN-SUFFIX,fast.com,Proxy\r\n  - DOMAIN-SUFFIX,fastly.net,Proxy\r\n  - DOMAIN-SUFFIX,fc2.com,Proxy\r\n  - DOMAIN-SUFFIX,feedburner.com,Proxy\r\n  - DOMAIN-SUFFIX,feedly.com,Proxy\r\n  - DOMAIN-SUFFIX,feedsportal.com,Proxy\r\n  - DOMAIN-SUFFIX,fiftythree.com,Proxy\r\n  - DOMAIN-SUFFIX,firebaseio.com,Proxy\r\n  - DOMAIN-SUFFIX,flexibits.com,Proxy\r\n  - DOMAIN-SUFFIX,flickr.com,Proxy\r\n  - DOMAIN-SUFFIX,flipboard.com,Proxy\r\n  - DOMAIN-SUFFIX,g.co,Proxy\r\n  - DOMAIN-SUFFIX,gabia.net,Proxy\r\n  - DOMAIN-SUFFIX,geni.us,Proxy\r\n  - DOMAIN-SUFFIX,gfx.ms,Proxy\r\n  - DOMAIN-SUFFIX,ggpht.com,Proxy\r\n  - DOMAIN-SUFFIX,ghostnoteapp.com,Proxy\r\n  - DOMAIN-SUFFIX,git.io,Proxy\r\n  - DOMAIN-KEYWORD,github,Proxy\r\n  - DOMAIN-SUFFIX,globalsign.com,Proxy\r\n  - DOMAIN-SUFFIX,gmodules.com,Proxy\r\n  - DOMAIN-SUFFIX,godaddy.com,Proxy\r\n  - DOMAIN-SUFFIX,golang.org,Proxy\r\n  - DOMAIN-SUFFIX,gongm.in,Proxy\r\n  - DOMAIN-SUFFIX,goo.gl,Proxy\r\n  - DOMAIN-SUFFIX,goodreaders.com,Proxy\r\n  - DOMAIN-SUFFIX,goodreads.com,Proxy\r\n  - DOMAIN-SUFFIX,gravatar.com,Proxy\r\n  - DOMAIN-SUFFIX,gstatic.com,Proxy\r\n  - DOMAIN-SUFFIX,gvt0.com,Proxy\r\n  - DOMAIN-SUFFIX,hockeyapp.net,Proxy\r\n  - DOMAIN-SUFFIX,hotmail.com,Proxy\r\n  - DOMAIN-SUFFIX,icons8.com,Proxy\r\n  - DOMAIN-SUFFIX,ifixit.com,Proxy\r\n  - DOMAIN-SUFFIX,ift.tt,Proxy\r\n  - DOMAIN-SUFFIX,ifttt.com,Proxy\r\n  - DOMAIN-SUFFIX,iherb.com,Proxy\r\n  - DOMAIN-SUFFIX,imageshack.us,Proxy\r\n  - DOMAIN-SUFFIX,img.ly,Proxy\r\n  - DOMAIN-SUFFIX,imgur.com,Proxy\r\n  - DOMAIN-SUFFIX,imore.com,Proxy\r\n  - DOMAIN-SUFFIX,instapaper.com,Proxy\r\n  - DOMAIN-SUFFIX,ipn.li,Proxy\r\n  - DOMAIN-SUFFIX,is.gd,Proxy\r\n  - DOMAIN-SUFFIX,issuu.com,Proxy\r\n  - DOMAIN-SUFFIX,itgonglun.com,Proxy\r\n  - DOMAIN-SUFFIX,itun.es,Proxy\r\n  - DOMAIN-SUFFIX,ixquick.com,Proxy\r\n  - DOMAIN-SUFFIX,j.mp,Proxy\r\n  - DOMAIN-SUFFIX,js.revsci.net,Proxy\r\n  - DOMAIN-SUFFIX,jshint.com,Proxy\r\n  - DOMAIN-SUFFIX,jtvnw.net,Proxy\r\n  - DOMAIN-SUFFIX,justgetflux.com,Proxy\r\n  - DOMAIN-SUFFIX,kat.cr,Proxy\r\n  - DOMAIN-SUFFIX,klip.me,Proxy\r\n  - DOMAIN-SUFFIX,libsyn.com,Proxy\r\n  - DOMAIN-SUFFIX,linode.com,Proxy\r\n  - DOMAIN-SUFFIX,lithium.com,Proxy\r\n  - DOMAIN-SUFFIX,littlehj.com,Proxy\r\n  - DOMAIN-SUFFIX,live.com,Proxy\r\n  - DOMAIN-SUFFIX,live.net,Proxy\r\n  - DOMAIN-SUFFIX,livefilestore.com,Proxy\r\n  - DOMAIN-SUFFIX,llnwd.net,Proxy\r\n  - DOMAIN-SUFFIX,macid.co,Proxy\r\n  - DOMAIN-SUFFIX,macromedia.com,Proxy\r\n  - DOMAIN-SUFFIX,macrumors.com,Proxy\r\n  - DOMAIN-SUFFIX,mashable.com,Proxy\r\n  - DOMAIN-SUFFIX,mathjax.org,Proxy\r\n  - DOMAIN-SUFFIX,medium.com,Proxy\r\n  - DOMAIN-SUFFIX,mega.co.nz,Proxy\r\n  - DOMAIN-SUFFIX,mega.nz,Proxy\r\n  - DOMAIN-SUFFIX,megaupload.com,Proxy\r\n  - DOMAIN-SUFFIX,microsofttranslator.com,Proxy\r\n  - DOMAIN-SUFFIX,mindnode.com,Proxy\r\n  - DOMAIN-SUFFIX,mobile01.com,Proxy\r\n  - DOMAIN-SUFFIX,modmyi.com,Proxy\r\n  - DOMAIN-SUFFIX,msedge.net,Proxy\r\n  - DOMAIN-SUFFIX,myfontastic.com,Proxy\r\n  - DOMAIN-SUFFIX,name.com,Proxy\r\n  - DOMAIN-SUFFIX,nextmedia.com,Proxy\r\n  - DOMAIN-SUFFIX,nsstatic.net,Proxy\r\n  - DOMAIN-SUFFIX,nssurge.com,Proxy\r\n  - DOMAIN-SUFFIX,nyt.com,Proxy\r\n  - DOMAIN-SUFFIX,nytimes.com,Proxy\r\n  - DOMAIN-SUFFIX,omnigroup.com,Proxy\r\n  - DOMAIN-SUFFIX,onedrive.com,Proxy\r\n  - DOMAIN-SUFFIX,onenote.com,Proxy\r\n  - DOMAIN-SUFFIX,ooyala.com,Proxy\r\n  - DOMAIN-SUFFIX,openvpn.net,Proxy\r\n  - DOMAIN-SUFFIX,openwrt.org,Proxy\r\n  - DOMAIN-SUFFIX,orkut.com,Proxy\r\n  - DOMAIN-SUFFIX,osxdaily.com,Proxy\r\n  - DOMAIN-SUFFIX,outlook.com,Proxy\r\n  - DOMAIN-SUFFIX,ow.ly,Proxy\r\n  - DOMAIN-SUFFIX,paddleapi.com,Proxy\r\n  - DOMAIN-SUFFIX,parallels.com,Proxy\r\n  - DOMAIN-SUFFIX,parse.com,Proxy\r\n  - DOMAIN-SUFFIX,pdfexpert.com,Proxy\r\n  - DOMAIN-SUFFIX,periscope.tv,Proxy\r\n  - DOMAIN-SUFFIX,pinboard.in,Proxy\r\n  - DOMAIN-SUFFIX,pinterest.com,Proxy\r\n  - DOMAIN-SUFFIX,pixelmator.com,Proxy\r\n  - DOMAIN-SUFFIX,pixiv.net,Proxy\r\n  - DOMAIN-SUFFIX,playpcesor.com,Proxy\r\n  - DOMAIN-SUFFIX,playstation.com,Proxy\r\n  - DOMAIN-SUFFIX,playstation.com.hk,Proxy\r\n  - DOMAIN-SUFFIX,playstation.net,Proxy\r\n  - DOMAIN-SUFFIX,playstationnetwork.com,Proxy\r\n  - DOMAIN-SUFFIX,pushwoosh.com,Proxy\r\n  - DOMAIN-SUFFIX,rime.im,Proxy\r\n  - DOMAIN-SUFFIX,servebom.com,Proxy\r\n  - DOMAIN-SUFFIX,sfx.ms,Proxy\r\n  - DOMAIN-SUFFIX,shadowsocks.org,Proxy\r\n  - DOMAIN-SUFFIX,sharethis.com,Proxy\r\n  - DOMAIN-SUFFIX,shazam.com,Proxy\r\n  - DOMAIN-SUFFIX,skype.com,Proxy\r\n  - DOMAIN-SUFFIX,smartdnsProxy.com,Proxy\r\n  - DOMAIN-SUFFIX,smartmailcloud.com,Proxy\r\n  - DOMAIN-SUFFIX,sndcdn.com,Proxy\r\n  - DOMAIN-SUFFIX,sony.com,Proxy\r\n  - DOMAIN-SUFFIX,soundcloud.com,Proxy\r\n  - DOMAIN-SUFFIX,sourceforge.net,Proxy\r\n  - DOMAIN-SUFFIX,spotify.com,Proxy\r\n  - DOMAIN-SUFFIX,squarespace.com,Proxy\r\n  - DOMAIN-SUFFIX,sstatic.net,Proxy\r\n  - DOMAIN-SUFFIX,st.luluku.pw,Proxy\r\n  - DOMAIN-SUFFIX,stackoverflow.com,Proxy\r\n  - DOMAIN-SUFFIX,startpage.com,Proxy\r\n  - DOMAIN-SUFFIX,staticflickr.com,Proxy\r\n  - DOMAIN-SUFFIX,steamcommunity.com,DIRECT\r\n  - DOMAIN-SUFFIX,symauth.com,Proxy\r\n  - DOMAIN-SUFFIX,symcb.com,Proxy\r\n  - DOMAIN-SUFFIX,symcd.com,Proxy\r\n  - DOMAIN-SUFFIX,tapbots.com,Proxy\r\n  - DOMAIN-SUFFIX,tapbots.net,Proxy\r\n  - DOMAIN-SUFFIX,tdesktop.com,Proxy\r\n  - DOMAIN-SUFFIX,techcrunch.com,Proxy\r\n  - DOMAIN-SUFFIX,techsmith.com,Proxy\r\n  - DOMAIN-SUFFIX,thepiratebay.org,Proxy\r\n  - DOMAIN-SUFFIX,theverge.com,Proxy\r\n  - DOMAIN-SUFFIX,time.com,Proxy\r\n  - DOMAIN-SUFFIX,timeinc.net,Proxy\r\n  - DOMAIN-SUFFIX,tiny.cc,Proxy\r\n  - DOMAIN-SUFFIX,tinypic.com,Proxy\r\n  - DOMAIN-SUFFIX,tmblr.co,Proxy\r\n  - DOMAIN-SUFFIX,todoist.com,Proxy\r\n  - DOMAIN-SUFFIX,trello.com,Proxy\r\n  - DOMAIN-SUFFIX,trustasiassl.com,Proxy\r\n  - DOMAIN-SUFFIX,tumblr.co,Proxy\r\n  - DOMAIN-SUFFIX,tumblr.com,Proxy\r\n  - DOMAIN-SUFFIX,tweetdeck.com,Proxy\r\n  - DOMAIN-SUFFIX,tweetmarker.net,Proxy\r\n  - DOMAIN-SUFFIX,twitch.tv,Proxy\r\n  - DOMAIN-SUFFIX,txmblr.com,Proxy\r\n  - DOMAIN-SUFFIX,typekit.net,Proxy\r\n  - DOMAIN-SUFFIX,ubertags.com,Proxy\r\n  - DOMAIN-SUFFIX,ublock.org,Proxy\r\n  - DOMAIN-SUFFIX,ubnt.com,Proxy\r\n  - DOMAIN-SUFFIX,ulyssesapp.com,Proxy\r\n  - DOMAIN-SUFFIX,urchin.com,Proxy\r\n  - DOMAIN-SUFFIX,usertrust.com,Proxy\r\n  - DOMAIN-SUFFIX,v.gd,Proxy\r\n  - DOMAIN-SUFFIX,v2ex.com,Proxy\r\n  - DOMAIN-SUFFIX,vimeo.com,Proxy\r\n  - DOMAIN-SUFFIX,vimeocdn.com,Proxy\r\n  - DOMAIN-SUFFIX,vine.co,Proxy\r\n  - DOMAIN-SUFFIX,vivaldi.com,Proxy\r\n  - DOMAIN-SUFFIX,vox-cdn.com,Proxy\r\n  - DOMAIN-SUFFIX,vsco.co,Proxy\r\n  - DOMAIN-SUFFIX,vultr.com,Proxy\r\n  - DOMAIN-SUFFIX,w.org,Proxy\r\n  - DOMAIN-SUFFIX,w3schools.com,Proxy\r\n  - DOMAIN-SUFFIX,webtype.com,Proxy\r\n  - DOMAIN-SUFFIX,wikiwand.com,Proxy\r\n  - DOMAIN-SUFFIX,wikileaks.org,Proxy\r\n  - DOMAIN-SUFFIX,wikimedia.org,Proxy\r\n  - DOMAIN-SUFFIX,wikipedia.com,Proxy\r\n  - DOMAIN-SUFFIX,wikipedia.org,Proxy\r\n  - DOMAIN-SUFFIX,windows.com,Proxy\r\n  - DOMAIN-SUFFIX,windows.net,Proxy\r\n  - DOMAIN-SUFFIX,wire.com,Proxy\r\n  - DOMAIN-SUFFIX,wordpress.com,Proxy\r\n  - DOMAIN-SUFFIX,workflowy.com,Proxy\r\n  - DOMAIN-SUFFIX,wp.com,Proxy\r\n  - DOMAIN-SUFFIX,wsj.com,Proxy\r\n  - DOMAIN-SUFFIX,wsj.net,Proxy\r\n  - DOMAIN-SUFFIX,xda-developers.com,Proxy\r\n  - DOMAIN-SUFFIX,xeeno.com,Proxy\r\n  - DOMAIN-SUFFIX,xiti.com,Proxy\r\n  - DOMAIN-SUFFIX,yahoo.com,Proxy\r\n  - DOMAIN-SUFFIX,yimg.com,Proxy\r\n  - DOMAIN-SUFFIX,ying.com,Proxy\r\n  - DOMAIN-SUFFIX,yoyo.org,Proxy\r\n  - DOMAIN-SUFFIX,ytimg.com,Proxy\r\n\r\n  # Telegram\r\n  - DOMAIN-SUFFIX,telegra.ph,Proxy\r\n  - DOMAIN-SUFFIX,telegram.org,Proxy\r\n  - IP-CIDR,91.108.4.0/22,Proxy\r\n  - IP-CIDR,91.108.8.0/21,Proxy\r\n  - IP-CIDR,91.108.16.0/22,Proxy\r\n  - IP-CIDR,91.108.56.0/22,Proxy\r\n  - IP-CIDR,149.154.160.0/20,Proxy\r\n  - IP-CIDR6,2001:67c:4e8::/48,Proxy\r\n  - IP-CIDR6,2001:b28:f23d::/48,Proxy\r\n  - IP-CIDR6,2001:b28:f23f::/48,Proxy\r\n\r\n  # LAN\r\n  - DOMAIN,injections.adguard.org,DIRECT\r\n  - DOMAIN,local.adguard.org,DIRECT\r\n  - DOMAIN-SUFFIX,local,DIRECT\r\n  - IP-CIDR,127.0.0.0/8,DIRECT\r\n  - IP-CIDR,172.16.0.0/12,DIRECT\r\n  - IP-CIDR,192.168.0.0/16,DIRECT\r\n  - IP-CIDR,10.0.0.0/8,DIRECT\r\n  - IP-CIDR,17.0.0.0/8,DIRECT\r\n  - IP-CIDR,100.64.0.0/10,DIRECT\r\n  - IP-CIDR,224.0.0.0/4,DIRECT\r\n  - IP-CIDR6,fe80::/10,DIRECT\r\n\r\n  # 最终规则\r\n  - GEOIP,CN,DIRECT\r\n  - MATCH,Proxy\r\n\r\n','default');
/*!40000 ALTER TABLE `transfer_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,1,1),(2,2,1);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-25 14:40:48
