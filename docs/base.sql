-- MySQL dump 10.16  Distrib 10.1.41-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	10.1.41-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `l_article`
--

DROP TABLE IF EXISTS `l_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `view` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `thumbnail_base_url` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail_path` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `published_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_article_slug` (`slug`),
  KEY `fk_article_author` (`created_by`),
  KEY `fk_article_updater` (`updated_by`),
  KEY `fk_article_category` (`category_id`),
  CONSTRAINT `fk_article_author` FOREIGN KEY (`created_by`) REFERENCES `l_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_article_category` FOREIGN KEY (`category_id`) REFERENCES `l_article_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_article_updater` FOREIGN KEY (`updated_by`) REFERENCES `l_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_article`
--

LOCK TABLES `l_article` WRITE;
/*!40000 ALTER TABLE `l_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `l_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_article_attachment`
--

DROP TABLE IF EXISTS `l_article_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_article_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_attachment_article` (`article_id`),
  CONSTRAINT `fk_article_attachment_article` FOREIGN KEY (`article_id`) REFERENCES `l_article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_article_attachment`
--

LOCK TABLES `l_article_attachment` WRITE;
/*!40000 ALTER TABLE `l_article_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `l_article_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_article_category`
--

DROP TABLE IF EXISTS `l_article_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `parent_id` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_article_category_slug` (`slug`),
  KEY `fk_article_category_section` (`parent_id`),
  CONSTRAINT `fk_article_category_section` FOREIGN KEY (`parent_id`) REFERENCES `l_article_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_article_category`
--

LOCK TABLES `l_article_category` WRITE;
/*!40000 ALTER TABLE `l_article_category` DISABLE KEYS */;
INSERT INTO `l_article_category` VALUES (1,'news','News',NULL,NULL,1,1572414439,NULL);
/*!40000 ALTER TABLE `l_article_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_file_storage_item`
--

DROP TABLE IF EXISTS `l_file_storage_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_file_storage_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_url` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_file_storage_item`
--

LOCK TABLES `l_file_storage_item` WRITE;
/*!40000 ALTER TABLE `l_file_storage_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `l_file_storage_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_i18n_message`
--

DROP TABLE IF EXISTS `l_i18n_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_i18n_message` (
  `id` int(11) NOT NULL,
  `language` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translation` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`,`language`),
  CONSTRAINT `fk_i18n_message_source_message` FOREIGN KEY (`id`) REFERENCES `l_i18n_source_message` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_i18n_message`
--

LOCK TABLES `l_i18n_message` WRITE;
/*!40000 ALTER TABLE `l_i18n_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `l_i18n_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_i18n_source_message`
--

DROP TABLE IF EXISTS `l_i18n_source_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_i18n_source_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_i18n_source_message`
--

LOCK TABLES `l_i18n_source_message` WRITE;
/*!40000 ALTER TABLE `l_i18n_source_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `l_i18n_source_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_key_storage_item`
--

DROP TABLE IF EXISTS `l_key_storage_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_key_storage_item` (
  `key` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `idx_key_storage_item_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_key_storage_item`
--

LOCK TABLES `l_key_storage_item` WRITE;
/*!40000 ALTER TABLE `l_key_storage_item` DISABLE KEYS */;
INSERT INTO `l_key_storage_item` VALUES ('backend.layout-boxed','0',NULL,NULL,NULL),('backend.layout-collapsed-sidebar','0',NULL,NULL,NULL),('backend.layout-fixed','0',NULL,NULL,NULL),('backend.theme-skin','skin-blue','skin-blue, skin-black, skin-purple, skin-green, skin-red, skin-yellow',NULL,NULL),('frontend.maintenance','disabled','Set it to \"enabled\" to turn on maintenance mode',NULL,NULL);
/*!40000 ALTER TABLE `l_key_storage_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_page`
--

DROP TABLE IF EXISTS `l_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `view` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_page`
--

LOCK TABLES `l_page` WRITE;
/*!40000 ALTER TABLE `l_page` DISABLE KEYS */;
INSERT INTO `l_page` VALUES (1,'about','About','Lorem ipsum dolor sit amet, consectetur adipiscing elit.',NULL,1,1572414439,1572414439);
/*!40000 ALTER TABLE `l_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_rbac_auth_assignment`
--

DROP TABLE IF EXISTS `l_rbac_auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_rbac_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `l_rbac_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `l_rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_rbac_auth_assignment`
--

LOCK TABLES `l_rbac_auth_assignment` WRITE;
/*!40000 ALTER TABLE `l_rbac_auth_assignment` DISABLE KEYS */;
INSERT INTO `l_rbac_auth_assignment` VALUES ('administrator','1',1572414443),('manager','2',1572414443),('user','3',1572414443);
/*!40000 ALTER TABLE `l_rbac_auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_rbac_auth_item`
--

DROP TABLE IF EXISTS `l_rbac_auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_rbac_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `l_rbac_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `l_rbac_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_rbac_auth_item`
--

LOCK TABLES `l_rbac_auth_item` WRITE;
/*!40000 ALTER TABLE `l_rbac_auth_item` DISABLE KEYS */;
INSERT INTO `l_rbac_auth_item` VALUES ('administrator',1,NULL,NULL,NULL,1572414443,1572414443),('editOwnModel',2,NULL,'ownModelRule',NULL,1572414443,1572414443),('loginToBackend',2,NULL,NULL,NULL,1572414443,1572414443),('manager',1,NULL,NULL,NULL,1572414443,1572414443),('user',1,NULL,NULL,NULL,1572414443,1572414443);
/*!40000 ALTER TABLE `l_rbac_auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_rbac_auth_item_child`
--

DROP TABLE IF EXISTS `l_rbac_auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_rbac_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `l_rbac_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `l_rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `l_rbac_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `l_rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_rbac_auth_item_child`
--

LOCK TABLES `l_rbac_auth_item_child` WRITE;
/*!40000 ALTER TABLE `l_rbac_auth_item_child` DISABLE KEYS */;
INSERT INTO `l_rbac_auth_item_child` VALUES ('administrator','loginToBackend'),('administrator','manager'),('administrator','user'),('manager','loginToBackend'),('manager','user'),('user','editOwnModel');
/*!40000 ALTER TABLE `l_rbac_auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_rbac_auth_rule`
--

DROP TABLE IF EXISTS `l_rbac_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_rbac_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_rbac_auth_rule`
--

LOCK TABLES `l_rbac_auth_rule` WRITE;
/*!40000 ALTER TABLE `l_rbac_auth_rule` DISABLE KEYS */;
INSERT INTO `l_rbac_auth_rule` VALUES ('ownModelRule','O:29:\"common\\rbac\\rule\\OwnModelRule\":3:{s:4:\"name\";s:12:\"ownModelRule\";s:9:\"createdAt\";i:1572414443;s:9:\"updatedAt\";i:1572414443;}',1572414443,1572414443);
/*!40000 ALTER TABLE `l_rbac_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_system_db_migration`
--

DROP TABLE IF EXISTS `l_system_db_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_system_db_migration` (
  `version` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_system_db_migration`
--

LOCK TABLES `l_system_db_migration` WRITE;
/*!40000 ALTER TABLE `l_system_db_migration` DISABLE KEYS */;
INSERT INTO `l_system_db_migration` VALUES ('m000000_000000_base',1572414432),('m140703_123000_user',1572414434),('m140703_123055_log',1572414434),('m140703_123104_page',1572414434),('m140703_123803_article',1572414436),('m140703_123813_rbac',1572414436),('m140709_173306_widget_menu',1572414436),('m140709_173333_widget_text',1572414437),('m140712_123329_widget_carousel',1572414437),('m140805_084745_key_storage_item',1572414437),('m141012_101932_i18n_tables',1572414437),('m150318_213934_file_storage_item',1572414438),('m150414_195800_timeline_event',1572414438),('m150725_192740_seed_data',1572414440),('m150929_074021_article_attachment_order',1572414440),('m160203_095604_user_token',1572414440),('m190130_155645_add_article_slug_index',1572414698);
/*!40000 ALTER TABLE `l_system_db_migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_system_log`
--

DROP TABLE IF EXISTS `l_system_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_system_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_time` double DEFAULT NULL,
  `prefix` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_log_level` (`level`),
  KEY `idx_log_category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_system_log`
--

LOCK TABLES `l_system_log` WRITE;
/*!40000 ALTER TABLE `l_system_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `l_system_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_system_rbac_migration`
--

DROP TABLE IF EXISTS `l_system_rbac_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_system_rbac_migration` (
  `version` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_system_rbac_migration`
--

LOCK TABLES `l_system_rbac_migration` WRITE;
/*!40000 ALTER TABLE `l_system_rbac_migration` DISABLE KEYS */;
INSERT INTO `l_system_rbac_migration` VALUES ('m000000_000000_base',1572414440),('m150625_214101_roles',1572414443),('m150625_215624_init_permissions',1572414443),('m151223_074604_edit_own_model',1572414443);
/*!40000 ALTER TABLE `l_system_rbac_migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_timeline_event`
--

DROP TABLE IF EXISTS `l_timeline_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_timeline_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_timeline_event`
--

LOCK TABLES `l_timeline_event` WRITE;
/*!40000 ALTER TABLE `l_timeline_event` DISABLE KEYS */;
INSERT INTO `l_timeline_event` VALUES (1,'frontend','user','signup','{\"public_identity\":\"webmaster\",\"user_id\":1,\"created_at\":1572414438}',1572414438),(2,'frontend','user','signup','{\"public_identity\":\"manager\",\"user_id\":2,\"created_at\":1572414438}',1572414438),(3,'frontend','user','signup','{\"public_identity\":\"user\",\"user_id\":3,\"created_at\":1572414438}',1572414438);
/*!40000 ALTER TABLE `l_timeline_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_user`
--

DROP TABLE IF EXISTS `l_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_key` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oauth_client` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oauth_client_user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '2',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `logged_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_user`
--

LOCK TABLES `l_user` WRITE;
/*!40000 ALTER TABLE `l_user` DISABLE KEYS */;
INSERT INTO `l_user` VALUES (1,'webmaster','e4HTQSwlPSpxEkDraSzZx4eoE0vNrVV4','ZiNL_52Ur9poBGHVpfjZyRvSqHcSQVKxr1XxoTpf','$2y$13$j/lx7JW6h6HP7w4xs5AVqevnk/pX/9v1D6aDTcbsQCPZK5TkS7gt6',NULL,NULL,'webmaster@example.com',2,1572414438,1572414438,NULL),(2,'manager','SLXCTg4QOhQFu_yRzXz8mbCbfIZ5XeCX','BeCBimBgknkzr96nW0niFDCH4V2HmS2px-S-LnpL','$2y$13$y1NJlLM0YgYkowOGcnyT1eam9xeuxHbRSF7EQu9ZeUzJNo0a2.fdm',NULL,NULL,'manager@example.com',2,1572414439,1572414439,NULL),(3,'user','Co9gb9XkWLjQFRs5GBvTi2Tw7LiqiOl0','T4DoF621kwjZR6MRPCSfoYfPmKwNpgtSJeZ72Y1n','$2y$13$JsfDjDawHq0YqDjAPeSlR.1hVouL5I5VRp//mTP2FtBR8NdxVbpKm',NULL,NULL,'user@example.com',2,1572414439,1572414439,NULL);
/*!40000 ALTER TABLE `l_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_user_profile`
--

DROP TABLE IF EXISTS `l_user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_user_profile` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middlename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_base_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `l_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_user_profile`
--

LOCK TABLES `l_user_profile` WRITE;
/*!40000 ALTER TABLE `l_user_profile` DISABLE KEYS */;
INSERT INTO `l_user_profile` VALUES (1,'John',NULL,'Doe',NULL,NULL,'en-US',NULL),(2,NULL,NULL,NULL,NULL,NULL,'en-US',NULL),(3,NULL,NULL,NULL,NULL,NULL,'en-US',NULL);
/*!40000 ALTER TABLE `l_user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_user_token`
--

DROP TABLE IF EXISTS `l_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_user_token`
--

LOCK TABLES `l_user_token` WRITE;
/*!40000 ALTER TABLE `l_user_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `l_user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_widget_carousel`
--

DROP TABLE IF EXISTS `l_widget_carousel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_widget_carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_widget_carousel`
--

LOCK TABLES `l_widget_carousel` WRITE;
/*!40000 ALTER TABLE `l_widget_carousel` DISABLE KEYS */;
INSERT INTO `l_widget_carousel` VALUES (1,'index',1);
/*!40000 ALTER TABLE `l_widget_carousel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_widget_carousel_item`
--

DROP TABLE IF EXISTS `l_widget_carousel_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_widget_carousel_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carousel_id` int(11) NOT NULL,
  `base_url` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_url` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `order` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_item_carousel` (`carousel_id`),
  CONSTRAINT `fk_item_carousel` FOREIGN KEY (`carousel_id`) REFERENCES `l_widget_carousel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_widget_carousel_item`
--

LOCK TABLES `l_widget_carousel_item` WRITE;
/*!40000 ALTER TABLE `l_widget_carousel_item` DISABLE KEYS */;
INSERT INTO `l_widget_carousel_item` VALUES (1,1,'http://yii2-starter-kit.localhost','img/yii2-starter-kit.gif',NULL,'image/gif','/',NULL,1,0,NULL,NULL);
/*!40000 ALTER TABLE `l_widget_carousel_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_widget_menu`
--

DROP TABLE IF EXISTS `l_widget_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_widget_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_widget_menu`
--

LOCK TABLES `l_widget_menu` WRITE;
/*!40000 ALTER TABLE `l_widget_menu` DISABLE KEYS */;
INSERT INTO `l_widget_menu` VALUES (1,'frontend-index','Frontend index menu','[\n    {\n        \"label\": \"Get started with Yii2\",\n        \"url\": \"http://www.yiiframework.com\",\n        \"options\": {\n            \"tag\": \"span\"\n        },\n        \"template\": \"<a href=\\\"{url}\\\" class=\\\"btn btn-lg btn-success\\\">{label}</a>\"\n    },\n    {\n        \"label\": \"Yii2 Starter Kit on GitHub\",\n        \"url\": \"https://github.com/yii2-starter-kit/yii2-starter-kit\",\n        \"options\": {\n            \"tag\": \"span\"\n        },\n        \"template\": \"<a href=\\\"{url}\\\" class=\\\"btn btn-lg btn-primary\\\">{label}</a>\"\n    },\n    {\n        \"label\": \"Find a bug?\",\n        \"url\": \"https://github.com/yii2-starter-kit/yii2-starter-kit/issues\",\n        \"options\": {\n            \"tag\": \"span\"\n        },\n        \"template\": \"<a href=\\\"{url}\\\" class=\\\"btn btn-lg btn-danger\\\">{label}</a>\"\n    }\n]',1);
/*!40000 ALTER TABLE `l_widget_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_widget_text`
--

DROP TABLE IF EXISTS `l_widget_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_widget_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint(6) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_widget_text_key` (`key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_widget_text`
--

LOCK TABLES `l_widget_text` WRITE;
/*!40000 ALTER TABLE `l_widget_text` DISABLE KEYS */;
INSERT INTO `l_widget_text` VALUES (1,'backend_welcome','Welcome to backend','<p>Welcome to Yii2 Starter Kit Dashboard</p>',1,1572414440,1572414440),(2,'ads-example','Google Ads Example Block','<div class=\"lead\">\r\n                <script async src=\"//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js\"></script>\r\n                <ins class=\"adsbygoogle\"\r\n                     style=\"display:block\"\r\n                     data-ad-client=\"ca-pub-9505937224921657\"\r\n                     data-ad-slot=\"2264361777\"\r\n                     data-ad-format=\"auto\"></ins>\r\n                <script>\r\n                (adsbygoogle = window.adsbygoogle || []).push({});\r\n                </script>\r\n            </div>',0,1572414440,1572414440);
/*!40000 ALTER TABLE `l_widget_text` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-30 13:52:43
