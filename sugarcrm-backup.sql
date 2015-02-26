-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sugarcrm
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `account_type` varchar(50) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `annual_revenue` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `rating` varchar(100) DEFAULT NULL,
  `phone_office` varchar(100) DEFAULT NULL,
  `phone_alternate` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `ownership` varchar(100) DEFAULT NULL,
  `employees` varchar(10) DEFAULT NULL,
  `ticker_symbol` varchar(10) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `sic_code` varchar(10) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_accnt_id_del` (`id`,`deleted`),
  KEY `idx_accnt_name_del` (`name`,`deleted`),
  KEY `idx_accnt_assigned_del` (`deleted`,`assigned_user_id`),
  KEY `idx_accnt_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_audit`
--

DROP TABLE IF EXISTS `accounts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_accounts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_audit`
--

LOCK TABLES `accounts_audit` WRITE;
/*!40000 ALTER TABLE `accounts_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_bugs`
--

DROP TABLE IF EXISTS `accounts_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_bugs` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_bug_acc` (`account_id`),
  KEY `idx_acc_bug_bug` (`bug_id`),
  KEY `idx_account_bug` (`account_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_bugs`
--

LOCK TABLES `accounts_bugs` WRITE;
/*!40000 ALTER TABLE `accounts_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_cases`
--

DROP TABLE IF EXISTS `accounts_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_cases` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_case_acc` (`account_id`),
  KEY `idx_acc_acc_case` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_cases`
--

LOCK TABLES `accounts_cases` WRITE;
/*!40000 ALTER TABLE `accounts_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_contacts`
--

DROP TABLE IF EXISTS `accounts_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_contact` (`account_id`,`contact_id`),
  KEY `idx_contid_del_accid` (`contact_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_contacts`
--

LOCK TABLES `accounts_contacts` WRITE;
/*!40000 ALTER TABLE `accounts_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_opportunities`
--

DROP TABLE IF EXISTS `accounts_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_opportunity` (`account_id`,`opportunity_id`),
  KEY `idx_oppid_del_accid` (`opportunity_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_opportunities`
--

LOCK TABLES `accounts_opportunities` WRITE;
/*!40000 ALTER TABLE `accounts_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_actions`
--

DROP TABLE IF EXISTS `acl_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_actions` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `acltype` varchar(100) DEFAULT NULL,
  `aclaccess` int(3) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclaction_id_del` (`id`,`deleted`),
  KEY `idx_category_name` (`category`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_actions`
--

LOCK TABLES `acl_actions` WRITE;
/*!40000 ALTER TABLE `acl_actions` DISABLE KEYS */;
INSERT INTO `acl_actions` VALUES ('13840b87-7a72-fcbf-359e-54ee0ca52b68','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','export','Campaigns','module',90,0),('18f60119-0537-2755-ef00-54ee0cdd974c','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','massupdate','Campaigns','module',90,0),('1a5b1526-d1a4-e530-84c3-54ee0c523c3f','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','access','ProspectLists','module',89,0),('1bcb890a-c4fa-3b94-dc9a-54ee0c5eb296','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','view','ProspectLists','module',90,0),('1c7f2ea6-6a13-359b-5737-54ee0c77b08b','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','list','ProspectLists','module',90,0),('1ce80509-00d8-ad43-1935-54ee0c7be234','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','edit','ProspectLists','module',90,0),('1d505b7c-b283-bfce-7090-54ee0c86dbe0','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','delete','ProspectLists','module',90,0),('1d99dd64-ea9e-4d61-521d-54ee0c817a43','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','import','ProspectLists','module',90,0),('1dd1fbb5-b4fb-beee-fd78-54ee0ca08ccf','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','export','ProspectLists','module',90,0),('1e22cb58-601c-2f6c-ddcc-54ee0c2e555d','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','massupdate','ProspectLists','module',90,0),('1fe55bb8-cc90-e61a-49b1-54ee0cfc9319','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','access','Notes','module',89,0),('2094eea8-ce43-ca95-e4e9-54ee0ca0af0c','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','view','Notes','module',90,0),('210625a4-506b-01c3-988f-54ee0cf9986d','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','list','Notes','module',90,0),('21838beb-4c3f-fcec-1cb1-54ee0caf67da','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','edit','Notes','module',90,0),('21d7adef-d286-c093-ad01-54ee0cc3d196','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','delete','Notes','module',90,0),('2296f178-0217-0c48-3ded-54ee0c820fc5','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','import','Notes','module',90,0),('23da2fba-214b-8d6f-118b-54ee0cbb025f','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','export','Notes','module',90,0),('24308f0a-dcae-3ad4-b949-54ee0c14eda8','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','massupdate','Notes','module',90,0),('2a400744-bfb5-cde2-ebc3-54ee0c8e1fcb','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','view','Campaigns','module',90,0),('3a2f10e6-e650-6752-486f-54ee0c36f1c9','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','access','Calls','module',89,0),('3acbb450-4eae-dcd3-567b-54ee0c29fd35','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','view','Calls','module',90,0),('3b651292-774c-2cb1-4842-54ee0c886426','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','list','Calls','module',90,0),('3b6d33ff-83eb-4bbf-8a2d-54ee0c410805','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','access','Prospects','module',89,0),('3be9f64c-2aa5-ffb9-a396-54ee0c6d34d6','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','edit','Calls','module',90,0),('3c4bdc81-dfca-2cf5-13d3-54ee0c8dce14','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','delete','Calls','module',90,0),('3c7ddcb4-2c4e-b0e0-fba1-54ee0cfd5ac4','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','view','Prospects','module',90,0),('3ca47c53-8ea3-012c-6406-54ee0c4f6f50','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','import','Calls','module',90,0),('3cde9084-bf58-170b-7b7d-54ee0c910820','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','export','Calls','module',90,0),('3cf7e430-ea12-fab1-ee70-54ee0c74ca80','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','list','Prospects','module',90,0),('3d229263-fade-7061-ec27-54ee0cb7c249','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','massupdate','Calls','module',90,0),('3d9fa0bd-c443-6420-a69f-54ee0cd6fc6e','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','edit','Prospects','module',90,0),('3e4b40d9-98f9-7c55-eec1-54ee0c29adc4','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','delete','Prospects','module',90,0),('3ebc39c3-bf71-1c6e-4d45-54ee0c6494e5','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','import','Prospects','module',90,0),('3fd51827-e0cc-9710-1654-54ee0c0a007a','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','export','Prospects','module',90,0),('40758adf-b3c1-f638-f658-54ee0c035d12','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','massupdate','Prospects','module',90,0),('47efeefc-14c5-d9b8-5f10-54ee0cbf905b','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','access','Leads','module',89,0),('48d7ab2b-408f-5a03-117c-54ee0cbf3859','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','view','Leads','module',90,0),('491b816e-e0fa-5e7a-9b64-54ee0ce7f6e2','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','list','Leads','module',90,0),('49779dd3-21ea-c9f0-0077-54ee0ca84f4b','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','edit','Leads','module',90,0),('49a7ced8-0d0c-ba35-0fa1-54ee0c7c02da','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','delete','Leads','module',90,0),('49d9ddec-0cf3-0874-f6bc-54ee0c99cff1','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','import','Leads','module',90,0),('4a0fb4d6-05b8-6e8f-50aa-54ee0cbdcc34','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','export','Leads','module',90,0),('4a821bba-2c17-1f43-8a60-54ee0c9cb425','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','massupdate','Leads','module',90,0),('51c4c2f1-ed22-d4bc-6374-54ee0c1fee57','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','access','EmailMarketing','module',89,0),('525f9802-8457-8c23-28cc-54ee0c285507','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','view','EmailMarketing','module',90,0),('52940fb0-4007-350e-8b32-54ee0cb02a1a','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','list','EmailMarketing','module',90,0),('52c7dbe9-a76a-845c-b7a4-54ee0c7e5c40','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','edit','EmailMarketing','module',90,0),('52cad3ea-d581-8898-518f-54ee0cd3ad2c','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','access','Emails','module',89,0),('532f34d2-6efc-2a92-2f69-54ee0c049b52','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','delete','EmailMarketing','module',90,0),('53cbf4e3-e2a6-ce70-4fe3-54ee0c04e072','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','view','Emails','module',90,0),('53ecc79d-d7f6-6ed3-1967-54ee0c6a7d46','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','import','EmailMarketing','module',90,0),('54641d1b-53dc-878f-f6ab-54ee0c4de379','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','export','EmailMarketing','module',90,0),('549a5773-487b-be2c-9931-54ee0ca174c7','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','list','Emails','module',90,0),('54a0a067-01ae-98e1-5f2b-54ee0cb2156e','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','massupdate','EmailMarketing','module',90,0),('550e4129-21c5-12b4-1fb7-54ee0c43960a','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','edit','Emails','module',90,0),('554b0f5b-0f17-173b-4922-54ee0caf2009','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','delete','Emails','module',90,0),('5591d8f1-06e0-290e-7f67-54ee0cde24cb','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','import','Emails','module',90,0),('55d64514-0b4e-1bd8-37c0-54ee0cec5108','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','export','Emails','module',90,0),('563369d2-4f6f-25af-698e-54ee0cbbbfd5','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','massupdate','Emails','module',90,0),('61600d15-468d-7198-7439-54ee0c559e23','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','list','Campaigns','module',90,0),('6308b4ea-a347-038c-6d15-54ee0cedc503','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','access','EAPM','module',89,0),('6382fb53-6b1f-43a0-d13d-54ee0cd0705a','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','view','EAPM','module',90,0),('6427df36-4e08-ea3d-6377-54ee0c5d0de6','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','list','EAPM','module',90,0),('64d04e71-038a-9ad1-a52f-54ee0c58220f','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','access','Cases','module',89,0),('64e5a638-34de-f773-272a-54ee0cd5ee02','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','edit','EAPM','module',90,0),('6530f58e-959a-905b-691c-54ee0cb47503','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','delete','EAPM','module',90,0),('6576b4e1-91c2-362d-c0ad-54ee0c9ada2e','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','view','Cases','module',90,0),('6585adcd-7fd0-4585-c638-54ee0ccb4350','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','import','EAPM','module',90,0),('65c727a9-b9ca-c41c-50e4-54ee0c235155','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','list','Cases','module',90,0),('65d2231b-375d-89d2-591d-54ee0c1280c3','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','export','EAPM','module',90,0),('65fa9f60-0c02-7e6e-c36c-54ee0ca666e8','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','edit','Cases','module',90,0),('660a4624-dcac-7d0c-92fa-54ee0c0c3ea1','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','massupdate','EAPM','module',90,0),('662e25f6-9772-ea8d-e1b9-54ee0c20cf3f','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','delete','Cases','module',90,0),('666d9828-3954-d518-f05a-54ee0c1a67dc','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','import','Cases','module',90,0),('66b3c198-7ebb-6982-9598-54ee0ce3aa85','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','export','Cases','module',90,0),('66e5fa92-b220-9248-593d-54ee0c0f92b9','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','massupdate','Cases','module',90,0),('6e4f9f3f-0abf-2f78-11c4-54ee0cccc2a6','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','access','Meetings','module',89,0),('6edfd56b-ae88-5c75-d9d1-54ee0cec0789','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','view','Meetings','module',90,0),('6f30b52e-5eab-3976-929e-54ee0c7a4795','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','list','Meetings','module',90,0),('6f928d56-12f0-8561-68e3-54ee0c67fde5','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','edit','Meetings','module',90,0),('6fde7b3c-82ad-364c-b7bd-54ee0c25813a','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','delete','Meetings','module',90,0),('70998875-dc45-f72a-127d-54ee0cf92e82','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','import','Meetings','module',90,0),('7120c02d-f7d1-7014-529b-54ee0cc9845a','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','export','Meetings','module',90,0),('719d4563-d973-13f6-8f31-54ee0cd069bc','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','massupdate','Meetings','module',90,0),('82db19c0-eb0d-f658-426d-54ee0c8226db','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','access','Bugs','module',89,0),('8378cc11-bdef-68ca-a66b-54ee0cfaba80','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','view','Bugs','module',90,0),('83b5fc5a-8e7d-97a7-3c9f-54ee0c81adae','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','list','Bugs','module',90,0),('843b73fc-36e4-27b4-3653-54ee0c71b330','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','edit','Bugs','module',90,0),('84ed9c8c-47a8-bf86-50f2-54ee0c6819d0','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','delete','Bugs','module',90,0),('854942c1-122d-83da-d7be-54ee0c654a2b','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','import','Bugs','module',90,0),('8594b5f6-93c5-31fe-e7e1-54ee0c5723ae','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','export','Bugs','module',90,0),('85d2014b-2a87-ad69-2065-54ee0cd519fc','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','massupdate','Bugs','module',90,0),('88603758-dfda-40f7-cbdc-54ee0c9c674f','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','access','Tasks','module',89,0),('899ee68a-c8e0-e03a-e82b-54ee0c0103ad','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','view','Tasks','module',90,0),('8a110a0d-3982-be4a-22d7-54ee0c45f921','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','list','Tasks','module',90,0),('8a5578a1-f3ad-68e8-b0d6-54ee0cd54bb8','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','edit','Tasks','module',90,0),('8aa7e164-68f2-00d5-b96e-54ee0c460e7f','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','delete','Tasks','module',90,0),('8ae98c7f-c1c8-902f-d160-54ee0c2e89f9','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','import','Tasks','module',90,0),('8b22f989-e92a-d2c2-5013-54ee0cdc0ad6','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','export','Tasks','module',90,0),('8b646b1a-580d-6b31-d504-54ee0caa907e','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','massupdate','Tasks','module',90,0),('8d400fa9-5338-cc2b-4903-54ee0c810112','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','edit','Campaigns','module',90,0),('9aab0f79-433f-c688-7cdd-54ee0c1ba5f2','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','access','EmailTemplates','module',89,0),('a11aa679-5c5a-6193-3be6-54ee0c764e72','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','access','Users','module',89,0),('a22f0e55-91d0-bd7c-a244-54ee0cd22c40','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','view','Users','module',90,0),('a297be8b-b68a-2572-8e7c-54ee0c5e4db6','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','list','Users','module',90,0),('a2f015f1-40fd-43d7-6e77-54ee0c5a221a','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','edit','Users','module',90,0),('a33f8da5-d7d2-f6e3-c694-54ee0cd8d89d','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','delete','Users','module',90,0),('a3749754-3b38-0972-f6a5-54ee0c593db0','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','import','Users','module',90,0),('a3a6914b-494c-6fc7-0b44-54ee0caa031e','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','export','Users','module',90,0),('a3dfa838-0e19-1d27-f285-54ee0c39dfa0','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','massupdate','Users','module',90,0),('a707c7b1-8b1d-52d6-e833-54ee0ce59cb3','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','access','Contacts','module',89,0),('a7d50b34-b445-7bf5-cae8-54ee0cd59885','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','view','Contacts','module',90,0),('a866dc9d-497b-d6b9-ccc9-54ee0cf10725','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','list','Contacts','module',90,0),('a8b601dd-e521-03ee-5558-54ee0c7ec7df','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','edit','Contacts','module',90,0),('a902061e-1219-f42c-abf0-54ee0c72b259','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','view','EmailTemplates','module',90,0),('a9e74f2b-cf50-9b2e-ac09-54ee0c3fe621','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','delete','Contacts','module',90,0),('aa5ddb4e-0501-6296-d0d6-54ee0cb33f35','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','import','Contacts','module',90,0),('aa9e7dc0-2c49-af0d-61a1-54ee0c2495af','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','export','Contacts','module',90,0),('ab2a21a6-9650-cadd-3e59-54ee0c08a10d','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','massupdate','Contacts','module',90,0),('b7000fd3-a8cc-8492-78c2-54ee0cddc606','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','list','EmailTemplates','module',90,0),('b8c00c78-52ab-3411-4492-54ee0c3b1c09','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','delete','Campaigns','module',90,0),('bdaa0937-2655-373b-89de-54ee0c8ce9eb','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','edit','EmailTemplates','module',90,0),('c1e809e9-00c9-c986-6206-54ee0ce73972','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','delete','EmailTemplates','module',90,0),('c2685411-2795-9704-ff77-54ee0c1de8d7','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','access','Project','module',89,0),('c2fa463f-c1e4-004c-5cb0-54ee0c287b6a','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','view','Project','module',90,0),('c363de94-715f-48a2-5340-54ee0cbf8660','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','list','Project','module',90,0),('c3a7dc4d-0ba8-2739-a742-54ee0ca6a3ad','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','edit','Project','module',90,0),('c3dbfb5a-b465-0899-57cd-54ee0c6a6585','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','delete','Project','module',90,0),('c42bc83c-0c24-4d4c-75ad-54ee0c96d003','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','import','Project','module',90,0),('c48de88b-4b15-940b-c3e8-54ee0cf7bc3e','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','export','Project','module',90,0),('c5014b1c-5d30-22d1-8988-54ee0c16eb2a','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','massupdate','Project','module',90,0),('c6830f8c-014d-4720-ce78-54ee0c4ed99c','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','import','EmailTemplates','module',90,0),('c89d8267-e7a3-18ba-cc81-54ee0c29ede1','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','access','Accounts','module',89,0),('c90c1e4a-afe3-f0a6-1468-54ee0c47d609','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','view','Accounts','module',90,0),('c9d6797c-e8f1-91b9-b1f5-54ee0c383aa0','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','list','Accounts','module',90,0),('caecf515-d851-2650-ff00-54ee0cb49ac9','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','edit','Accounts','module',90,0),('cb540bdc-f081-a9a4-311b-54ee0cf1d491','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','delete','Accounts','module',90,0),('cb904dfc-f3b7-e0ee-c1f4-54ee0c28797e','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','import','Accounts','module',90,0),('cbc55393-550a-7af6-d190-54ee0c9851f3','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','export','Accounts','module',90,0),('cc750975-9722-015e-7641-54ee0cbabb72','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','massupdate','Accounts','module',90,0),('cd190b46-3d8b-256a-7487-54ee0c3fdab0','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','export','EmailTemplates','module',90,0),('d10102ae-2dd2-f90c-27a7-54ee0c10aa80','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','massupdate','EmailTemplates','module',90,0),('d761a84c-addd-47e1-1da0-54ee0c99c959','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','access','ProjectTask','module',89,0),('d7edb9e2-632c-dd53-6cac-54ee0c884245','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','view','ProjectTask','module',90,0),('d8296627-342b-1595-1a47-54ee0cd4c2a8','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','list','ProjectTask','module',90,0),('d896a1a8-4596-73c2-b037-54ee0cd1054a','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','edit','ProjectTask','module',90,0),('d8f64ba5-8465-15e3-09bd-54ee0c927dc3','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','delete','ProjectTask','module',90,0),('d934be51-fabf-bf47-6253-54ee0ca86619','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','import','ProjectTask','module',90,0),('d9716391-ed24-1cba-c816-54ee0c7c651d','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','export','ProjectTask','module',90,0),('da854526-d422-3ae3-ca21-54ee0cbc503e','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','massupdate','ProjectTask','module',90,0),('e53b99b5-3f1c-fa59-7119-54ee0c34dc05','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','access','Opportunities','module',89,0),('e5c575d6-fc77-ea3e-26c6-54ee0c62e46b','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','view','Opportunities','module',90,0),('e689fc99-6b2a-1045-26f1-54ee0c4a9a3e','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','list','Opportunities','module',90,0),('e71b280f-1beb-d1cc-96f3-54ee0c4e9004','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','edit','Opportunities','module',90,0),('e7557f9b-5ed4-7626-3c26-54ee0c9cd3e6','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','delete','Opportunities','module',90,0),('e7be3214-21d4-bdbc-4216-54ee0c81ee09','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','import','Opportunities','module',90,0),('e7f2233e-408d-3b26-0072-54ee0ca8a496','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','export','Opportunities','module',90,0),('e8301f1c-5c4c-4c00-3f98-54ee0cabd314','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','massupdate','Opportunities','module',90,0),('e867307d-447b-ced0-add1-54ee0cd99a91','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','access','Documents','module',89,0),('e8fabc5c-eb92-9695-2b20-54ee0c1a1da6','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','view','Documents','module',90,0),('e93dec9f-aa2b-29ca-4607-54ee0c5c7244','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','list','Documents','module',90,0),('e9e02fc1-8cec-af68-098b-54ee0ce1fd13','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','edit','Documents','module',90,0),('ea692a70-d2a0-7388-c0a4-54ee0c536939','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','delete','Documents','module',90,0),('eb69aa47-3ea3-1cc0-2789-54ee0cd53c65','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','import','Documents','module',90,0),('ebd132af-f945-c2b2-ce87-54ee0cf6979b','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','export','Documents','module',90,0),('ec260e05-c6fe-3d30-835d-54ee0cfce709','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','massupdate','Documents','module',90,0),('f3caccf6-0ce1-ab69-ebcb-54ee0c76eab5','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','access','Campaigns','module',89,0),('f740015d-5295-1bad-2f68-54ee0ce7c411','2015-02-25 17:57:13','2015-02-25 17:57:13','1','','import','Campaigns','module',90,0);
/*!40000 ALTER TABLE `acl_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles`
--

DROP TABLE IF EXISTS `acl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles`
--

LOCK TABLES `acl_roles` WRITE;
/*!40000 ALTER TABLE `acl_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles_actions`
--

DROP TABLE IF EXISTS `acl_roles_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_roles_actions` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `action_id` varchar(36) DEFAULT NULL,
  `access_override` int(3) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acl_role_id` (`role_id`),
  KEY `idx_acl_action_id` (`action_id`),
  KEY `idx_aclrole_action` (`role_id`,`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles_actions`
--

LOCK TABLES `acl_roles_actions` WRITE;
/*!40000 ALTER TABLE `acl_roles_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_roles_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles_users`
--

DROP TABLE IF EXISTS `acl_roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id` (`role_id`),
  KEY `idx_acluser_id` (`user_id`),
  KEY `idx_aclrole_user` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles_users`
--

LOCK TABLES `acl_roles_users` WRITE;
/*!40000 ALTER TABLE `acl_roles_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_book`
--

DROP TABLE IF EXISTS `address_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_book` (
  `assigned_user_id` char(36) NOT NULL,
  `bean` varchar(50) DEFAULT NULL,
  `bean_id` char(36) NOT NULL,
  KEY `ab_user_bean_idx` (`assigned_user_id`,`bean`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_book`
--

LOCK TABLES `address_book` WRITE;
/*!40000 ALTER TABLE `address_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugs`
--

DROP TABLE IF EXISTS `bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bugs` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `bug_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `found_in_release` varchar(255) DEFAULT NULL,
  `fixed_in_release` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `product_category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bugsnumk` (`bug_number`),
  KEY `bug_number` (`bug_number`),
  KEY `idx_bug_name` (`name`),
  KEY `idx_bugs_assigned_user` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugs`
--

LOCK TABLES `bugs` WRITE;
/*!40000 ALTER TABLE `bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugs_audit`
--

DROP TABLE IF EXISTS `bugs_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bugs_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_bugs_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugs_audit`
--

LOCK TABLES `bugs_audit` WRITE;
/*!40000 ALTER TABLE `bugs_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugs_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls`
--

DROP TABLE IF EXISTS `calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `duration_hours` int(2) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `direction` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT '-1',
  `email_reminder_time` int(11) DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) DEFAULT NULL,
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT '1',
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_call_name` (`name`),
  KEY `idx_status` (`status`),
  KEY `idx_calls_date_start` (`date_start`),
  KEY `idx_calls_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_calls_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls`
--

LOCK TABLES `calls` WRITE;
/*!40000 ALTER TABLE `calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_contacts`
--

DROP TABLE IF EXISTS `calls_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_contacts` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_call_call` (`call_id`),
  KEY `idx_con_call_con` (`contact_id`),
  KEY `idx_call_contact` (`call_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_contacts`
--

LOCK TABLES `calls_contacts` WRITE;
/*!40000 ALTER TABLE `calls_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_leads`
--

DROP TABLE IF EXISTS `calls_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_leads` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lead_call_call` (`call_id`),
  KEY `idx_lead_call_lead` (`lead_id`),
  KEY `idx_call_lead` (`call_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_leads`
--

LOCK TABLES `calls_leads` WRITE;
/*!40000 ALTER TABLE `calls_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_users`
--

DROP TABLE IF EXISTS `calls_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_users` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_usr_call_call` (`call_id`),
  KEY `idx_usr_call_usr` (`user_id`),
  KEY `idx_call_users` (`call_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_users`
--

LOCK TABLES `calls_users` WRITE;
/*!40000 ALTER TABLE `calls_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_log`
--

DROP TABLE IF EXISTS `campaign_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_log` (
  `id` char(36) NOT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `target_tracker_key` varchar(36) DEFAULT NULL,
  `target_id` varchar(36) DEFAULT NULL,
  `target_type` varchar(100) DEFAULT NULL,
  `activity_type` varchar(100) DEFAULT NULL,
  `activity_date` datetime DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  `archived` tinyint(1) DEFAULT '0',
  `hits` int(11) DEFAULT '0',
  `list_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `more_information` varchar(100) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_camp_tracker` (`target_tracker_key`),
  KEY `idx_camp_campaign_id` (`campaign_id`),
  KEY `idx_camp_more_info` (`more_information`),
  KEY `idx_target_id` (`target_id`),
  KEY `idx_target_id_deleted` (`target_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_log`
--

LOCK TABLES `campaign_log` WRITE;
/*!40000 ALTER TABLE `campaign_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_trkrs`
--

DROP TABLE IF EXISTS `campaign_trkrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_trkrs` (
  `id` char(36) NOT NULL,
  `tracker_name` varchar(30) DEFAULT NULL,
  `tracker_url` varchar(255) DEFAULT 'http://',
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `is_optout` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `campaign_tracker_key_idx` (`tracker_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_trkrs`
--

LOCK TABLES `campaign_trkrs` WRITE;
/*!40000 ALTER TABLE `campaign_trkrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_trkrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_count` int(11) DEFAULT '0',
  `refer_url` varchar(255) DEFAULT 'http://',
  `tracker_text` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `impressions` int(11) DEFAULT '0',
  `currency_id` char(36) DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `expected_cost` double DEFAULT NULL,
  `actual_cost` double DEFAULT NULL,
  `expected_revenue` double DEFAULT NULL,
  `campaign_type` varchar(100) DEFAULT NULL,
  `objective` text,
  `content` text,
  `frequency` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `camp_auto_tracker_key` (`tracker_key`),
  KEY `idx_campaign_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns_audit`
--

DROP TABLE IF EXISTS `campaigns_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_campaigns_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns_audit`
--

LOCK TABLES `campaigns_audit` WRITE;
/*!40000 ALTER TABLE `campaigns_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigns_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` text,
  `work_log` text,
  `account_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `casesnumk` (`case_number`),
  KEY `case_number` (`case_number`),
  KEY `idx_case_name` (`name`),
  KEY `idx_account_id` (`account_id`),
  KEY `idx_cases_stat_del` (`assigned_user_id`,`status`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases_audit`
--

DROP TABLE IF EXISTS `cases_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_cases_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases_audit`
--

LOCK TABLES `cases_audit` WRITE;
/*!40000 ALTER TABLE `cases_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases_bugs`
--

DROP TABLE IF EXISTS `cases_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases_bugs` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cas_bug_cas` (`case_id`),
  KEY `idx_cas_bug_bug` (`bug_id`),
  KEY `idx_case_bug` (`case_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases_bugs`
--

LOCK TABLES `cases_bugs` WRITE;
/*!40000 ALTER TABLE `cases_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `category` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `value` text,
  KEY `idx_config_cat` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES ('notify','fromaddress','do_not_reply@example.com'),('notify','fromname','SugarCRM'),('notify','send_by_default','1'),('notify','on','1'),('notify','send_from_assigning_user','0'),('info','sugar_version','6.5.20'),('MySettings','tab','YToxNjp7aTowO3M6NDoiSG9tZSI7aToxO3M6ODoiQWNjb3VudHMiO2k6MjtzOjg6IkNvbnRhY3RzIjtpOjM7czoxMzoiT3Bwb3J0dW5pdGllcyI7aTo0O3M6NToiTGVhZHMiO2k6NTtzOjg6IkNhbGVuZGFyIjtpOjY7czo5OiJEb2N1bWVudHMiO2k6NztzOjY6IkVtYWlscyI7aTo4O3M6OToiQ2FtcGFpZ25zIjtpOjk7czo1OiJDYWxscyI7aToxMDtzOjg6Ik1lZXRpbmdzIjtpOjExO3M6NToiVGFza3MiO2k6MTI7czo1OiJOb3RlcyI7aToxMztzOjU6IkNhc2VzIjtpOjE0O3M6OToiUHJvc3BlY3RzIjtpOjE1O3M6MTM6IlByb3NwZWN0TGlzdHMiO30='),('portal','on','0'),('tracker','Tracker','1'),('system','skypeout_on','1'),('sugarfeed','enabled','1'),('sugarfeed','module_UserFeed','1'),('sugarfeed','module_Cases','1'),('sugarfeed','module_Contacts','1'),('sugarfeed','module_Leads','1'),('sugarfeed','module_Opportunities','1'),('Update','CheckUpdates','automatic'),('system','name','SugarCRM'),('Update','last_check_date','1424887134'),('system','adminwizard','1');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `lead_source` varchar(255) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cont_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_contacts_del_last` (`deleted`,`last_name`),
  KEY `idx_cont_del_reports` (`deleted`,`reports_to_id`,`last_name`),
  KEY `idx_reports_to_id` (`reports_to_id`),
  KEY `idx_del_id_user` (`deleted`,`id`,`assigned_user_id`),
  KEY `idx_cont_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_audit`
--

DROP TABLE IF EXISTS `contacts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_contacts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_audit`
--

LOCK TABLES `contacts_audit` WRITE;
/*!40000 ALTER TABLE `contacts_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_bugs`
--

DROP TABLE IF EXISTS `contacts_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_bugs` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_bug_con` (`contact_id`),
  KEY `idx_con_bug_bug` (`bug_id`),
  KEY `idx_contact_bug` (`contact_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_bugs`
--

LOCK TABLES `contacts_bugs` WRITE;
/*!40000 ALTER TABLE `contacts_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_cases`
--

DROP TABLE IF EXISTS `contacts_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_cases` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_case_con` (`contact_id`),
  KEY `idx_con_case_case` (`case_id`),
  KEY `idx_contacts_cases` (`contact_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_cases`
--

LOCK TABLES `contacts_cases` WRITE;
/*!40000 ALTER TABLE `contacts_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_users`
--

DROP TABLE IF EXISTS `contacts_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_users` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_users_con` (`contact_id`),
  KEY `idx_con_users_user` (`user_id`),
  KEY `idx_contacts_users` (`contact_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_users`
--

LOCK TABLES `contacts_users` WRITE;
/*!40000 ALTER TABLE `contacts_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_remove_documents`
--

DROP TABLE IF EXISTS `cron_remove_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_remove_documents` (
  `id` varchar(36) NOT NULL,
  `bean_id` varchar(36) DEFAULT NULL,
  `module` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cron_remove_document_bean_id` (`bean_id`),
  KEY `idx_cron_remove_document_stamp` (`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_remove_documents`
--

LOCK TABLES `cron_remove_documents` WRITE;
/*!40000 ALTER TABLE `cron_remove_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `cron_remove_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` char(36) NOT NULL,
  `name` varchar(36) DEFAULT NULL,
  `symbol` varchar(36) DEFAULT NULL,
  `iso4217` varchar(3) DEFAULT NULL,
  `conversion_rate` double DEFAULT '0',
  `status` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_currency_name` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `bean_id` varchar(36) DEFAULT NULL,
  `set_num` int(11) DEFAULT '0',
  `field0` varchar(255) DEFAULT NULL,
  `field1` varchar(255) DEFAULT NULL,
  `field2` varchar(255) DEFAULT NULL,
  `field3` varchar(255) DEFAULT NULL,
  `field4` varchar(255) DEFAULT NULL,
  `field5` varchar(255) DEFAULT NULL,
  `field6` varchar(255) DEFAULT NULL,
  `field7` varchar(255) DEFAULT NULL,
  `field8` varchar(255) DEFAULT NULL,
  `field9` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_beanid_set_num` (`bean_id`,`set_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_revisions`
--

DROP TABLE IF EXISTS `document_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_revisions` (
  `id` varchar(36) NOT NULL,
  `change_log` varchar(255) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT NULL,
  `doc_url` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `file_ext` varchar(100) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `revision` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documentrevision_mimetype` (`file_mime_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_revisions`
--

LOCK TABLES `document_revisions` WRITE;
/*!40000 ALTER TABLE `document_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT 'Sugar',
  `doc_url` varchar(255) DEFAULT NULL,
  `active_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  `subcategory_id` varchar(100) DEFAULT NULL,
  `status_id` varchar(100) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `related_doc_id` char(36) DEFAULT NULL,
  `related_doc_rev_id` char(36) DEFAULT NULL,
  `is_template` tinyint(1) DEFAULT '0',
  `template_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_doc_cat` (`category_id`,`subcategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_accounts`
--

DROP TABLE IF EXISTS `documents_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_accounts_account_id` (`account_id`,`document_id`),
  KEY `documents_accounts_document_id` (`document_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_accounts`
--

LOCK TABLES `documents_accounts` WRITE;
/*!40000 ALTER TABLE `documents_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_bugs`
--

DROP TABLE IF EXISTS `documents_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_bugs` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_bugs_bug_id` (`bug_id`,`document_id`),
  KEY `documents_bugs_document_id` (`document_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_bugs`
--

LOCK TABLES `documents_bugs` WRITE;
/*!40000 ALTER TABLE `documents_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_cases`
--

DROP TABLE IF EXISTS `documents_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_cases` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_cases_case_id` (`case_id`,`document_id`),
  KEY `documents_cases_document_id` (`document_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_cases`
--

LOCK TABLES `documents_cases` WRITE;
/*!40000 ALTER TABLE `documents_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_contacts`
--

DROP TABLE IF EXISTS `documents_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_contacts_contact_id` (`contact_id`,`document_id`),
  KEY `documents_contacts_document_id` (`document_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_contacts`
--

LOCK TABLES `documents_contacts` WRITE;
/*!40000 ALTER TABLE `documents_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_opportunities`
--

DROP TABLE IF EXISTS `documents_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_opportunities` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_docu_opps_oppo_id` (`opportunity_id`,`document_id`),
  KEY `idx_docu_oppo_docu_id` (`document_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_opportunities`
--

LOCK TABLES `documents_opportunities` WRITE;
/*!40000 ALTER TABLE `documents_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eapm`
--

DROP TABLE IF EXISTS `eapm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eapm` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `application` varchar(100) DEFAULT 'webex',
  `api_data` text,
  `consumer_key` varchar(255) DEFAULT NULL,
  `consumer_secret` varchar(255) DEFAULT NULL,
  `oauth_token` varchar(255) DEFAULT NULL,
  `oauth_secret` varchar(255) DEFAULT NULL,
  `validated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_app_active` (`assigned_user_id`,`application`,`validated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eapm`
--

LOCK TABLES `eapm` WRITE;
/*!40000 ALTER TABLE `eapm` DISABLE KEYS */;
/*!40000 ALTER TABLE `eapm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addr_bean_rel`
--

DROP TABLE IF EXISTS `email_addr_bean_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_addr_bean_rel` (
  `id` char(36) NOT NULL,
  `email_address_id` char(36) NOT NULL,
  `bean_id` char(36) NOT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `primary_address` tinyint(1) DEFAULT '0',
  `reply_to_address` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_email_address_id` (`email_address_id`),
  KEY `idx_bean_id` (`bean_id`,`bean_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addr_bean_rel`
--

LOCK TABLES `email_addr_bean_rel` WRITE;
/*!40000 ALTER TABLE `email_addr_bean_rel` DISABLE KEYS */;
INSERT INTO `email_addr_bean_rel` VALUES ('218008d6-7e1a-dbfd-0f0a-54ee0d55c56e','2273055b-7fe5-552f-ef86-54ee0ddc72fb','1','Users',1,0,'2015-02-25 18:01:04','2015-02-25 18:01:04',0);
/*!40000 ALTER TABLE `email_addr_bean_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addresses`
--

DROP TABLE IF EXISTS `email_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_addresses` (
  `id` char(36) NOT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `email_address_caps` varchar(255) DEFAULT NULL,
  `invalid_email` tinyint(1) DEFAULT '0',
  `opt_out` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ea_caps_opt_out_invalid` (`email_address_caps`,`opt_out`,`invalid_email`),
  KEY `idx_ea_opt_out_invalid` (`email_address`,`opt_out`,`invalid_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addresses`
--

LOCK TABLES `email_addresses` WRITE;
/*!40000 ALTER TABLE `email_addresses` DISABLE KEYS */;
INSERT INTO `email_addresses` VALUES ('2273055b-7fe5-552f-ef86-54ee0ddc72fb','admilo@triggerise.org','ADMILO@TRIGGERISE.ORG',0,0,'2015-02-25 18:01:04','2015-02-25 18:01:04',0);
/*!40000 ALTER TABLE `email_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_cache`
--

DROP TABLE IF EXISTS `email_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_cache` (
  `ie_id` char(36) DEFAULT NULL,
  `mbox` varchar(60) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `fromaddr` varchar(100) DEFAULT NULL,
  `toaddr` varchar(255) DEFAULT NULL,
  `senddate` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `mailsize` int(10) unsigned DEFAULT NULL,
  `imap_uid` int(10) unsigned DEFAULT NULL,
  `msgno` int(10) unsigned DEFAULT NULL,
  `recent` tinyint(4) DEFAULT NULL,
  `flagged` tinyint(4) DEFAULT NULL,
  `answered` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `seen` tinyint(4) DEFAULT NULL,
  `draft` tinyint(4) DEFAULT NULL,
  KEY `idx_ie_id` (`ie_id`),
  KEY `idx_mail_date` (`ie_id`,`mbox`,`senddate`),
  KEY `idx_mail_from` (`ie_id`,`mbox`,`fromaddr`),
  KEY `idx_mail_subj` (`subject`),
  KEY `idx_mail_to` (`toaddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_cache`
--

LOCK TABLES `email_cache` WRITE;
/*!40000 ALTER TABLE `email_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_marketing`
--

DROP TABLE IF EXISTS `email_marketing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_marketing` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `from_addr` varchar(100) DEFAULT NULL,
  `reply_to_name` varchar(100) DEFAULT NULL,
  `reply_to_addr` varchar(100) DEFAULT NULL,
  `inbound_email_id` varchar(36) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `template_id` char(36) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `all_prospect_lists` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emmkt_name` (`name`),
  KEY `idx_emmkit_del` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_marketing`
--

LOCK TABLES `email_marketing` WRITE;
/*!40000 ALTER TABLE `email_marketing` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_marketing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_marketing_prospect_lists`
--

DROP TABLE IF EXISTS `email_marketing_prospect_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_marketing_prospect_lists` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `email_marketing_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `email_mp_prospects` (`email_marketing_id`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_marketing_prospect_lists`
--

LOCK TABLES `email_marketing_prospect_lists` WRITE;
/*!40000 ALTER TABLE `email_marketing_prospect_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_marketing_prospect_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `published` varchar(3) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  `body_html` text,
  `deleted` tinyint(1) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `text_only` tinyint(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_template_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES ('36a866d4-3131-07e9-4941-54ee0c8bb247','2015-02-25 17:57:13','2015-02-25 17:57:13','1','1','off','System-generated password email','This template is used when the System Administrator sends a new password to a user.','New account information','\nHere is your account username and temporary password:\nUsername : $contact_user_user_name\nPassword : $contact_user_user_hash\n\n$config_site_url\n\nAfter you log in using the above password, you may be required to reset the password to one of your own choice.','<div><table width=\"550\"><tbody><tr><td><p>Here is your account username and temporary password:</p><p>Username : $contact_user_user_name </p><p>Password : $contact_user_user_hash </p><br /><p>$config_site_url</p><br /><p>After you log in using the above password, you may be required to reset the password to one of your own choice.</p>   </td>         </tr><tr><td></td>         </tr></tbody></table></div>',0,NULL,0,NULL),('38a10061-e8a9-2480-9a51-54ee0c07b2cd','2015-02-25 17:57:13','2015-02-25 17:57:13','1','1','off','Forgot Password email','This template is used to send a user a link to click to reset the user\'s account password.','Reset your account password','\nYou recently requested on $contact_user_pwd_last_changed to be able to reset your account password.\n\nClick on the link below to reset your password:\n\n$contact_user_link_guid','<div><table width=\"550\"><tbody><tr><td><p>You recently requested on $contact_user_pwd_last_changed to be able to reset your account password. </p><p>Click on the link below to reset your password:</p><p> $contact_user_link_guid </p>  </td>         </tr><tr><td></td>         </tr></tbody></table></div>',0,NULL,0,NULL);
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailman`
--

DROP TABLE IF EXISTS `emailman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailman` (
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  `list_id` char(36) DEFAULT NULL,
  `send_date_time` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `in_queue` tinyint(1) DEFAULT '0',
  `in_queue_date` datetime DEFAULT NULL,
  `send_attempts` int(11) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `related_id` char(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_eman_list` (`list_id`,`user_id`,`deleted`),
  KEY `idx_eman_campaign_id` (`campaign_id`),
  KEY `idx_eman_relid_reltype_id` (`related_id`,`related_type`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailman`
--

LOCK TABLES `emailman` WRITE;
/*!40000 ALTER TABLE `emailman` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `flagged` tinyint(1) DEFAULT NULL,
  `reply_to_status` tinyint(1) DEFAULT NULL,
  `intent` varchar(100) DEFAULT 'pick',
  `mailbox_id` char(36) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_name` (`name`),
  KEY `idx_message_id` (`message_id`),
  KEY `idx_email_parent_id` (`parent_id`),
  KEY `idx_email_assigned` (`assigned_user_id`,`type`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_beans`
--

DROP TABLE IF EXISTS `emails_beans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails_beans` (
  `id` char(36) NOT NULL,
  `email_id` char(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `campaign_data` text,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emails_beans_bean_id` (`bean_id`),
  KEY `idx_emails_beans_email_bean` (`email_id`,`bean_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_beans`
--

LOCK TABLES `emails_beans` WRITE;
/*!40000 ALTER TABLE `emails_beans` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails_beans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_email_addr_rel`
--

DROP TABLE IF EXISTS `emails_email_addr_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails_email_addr_rel` (
  `id` char(36) NOT NULL,
  `email_id` char(36) NOT NULL,
  `address_type` varchar(4) DEFAULT NULL,
  `email_address_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eearl_email_id` (`email_id`,`address_type`),
  KEY `idx_eearl_address_id` (`email_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_email_addr_rel`
--

LOCK TABLES `emails_email_addr_rel` WRITE;
/*!40000 ALTER TABLE `emails_email_addr_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails_email_addr_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_text`
--

DROP TABLE IF EXISTS `emails_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails_text` (
  `email_id` char(36) NOT NULL,
  `from_addr` varchar(255) DEFAULT NULL,
  `reply_to_addr` varchar(255) DEFAULT NULL,
  `to_addrs` text,
  `cc_addrs` text,
  `bcc_addrs` text,
  `description` longtext,
  `description_html` longtext,
  `raw_source` longtext,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`email_id`),
  KEY `emails_textfromaddr` (`from_addr`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_text`
--

LOCK TABLES `emails_text` WRITE;
/*!40000 ALTER TABLE `emails_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields_meta_data`
--

DROP TABLE IF EXISTS `fields_meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields_meta_data` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `vname` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `help` varchar(255) DEFAULT NULL,
  `custom_module` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `len` int(11) DEFAULT NULL,
  `required` tinyint(1) DEFAULT '0',
  `default_value` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `audited` tinyint(1) DEFAULT '0',
  `massupdate` tinyint(1) DEFAULT '0',
  `duplicate_merge` smallint(6) DEFAULT '0',
  `reportable` tinyint(1) DEFAULT '1',
  `importable` varchar(255) DEFAULT NULL,
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  `ext3` varchar(255) DEFAULT NULL,
  `ext4` text,
  PRIMARY KEY (`id`),
  KEY `idx_meta_id_del` (`id`,`deleted`),
  KEY `idx_meta_cm_del` (`custom_module`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields_meta_data`
--

LOCK TABLES `fields_meta_data` WRITE;
/*!40000 ALTER TABLE `fields_meta_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `fields_meta_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders`
--

DROP TABLE IF EXISTS `folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders` (
  `id` char(36) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `folder_type` varchar(25) DEFAULT NULL,
  `parent_folder` char(36) DEFAULT NULL,
  `has_child` tinyint(1) DEFAULT '0',
  `is_group` tinyint(1) DEFAULT '0',
  `is_dynamic` tinyint(1) DEFAULT '0',
  `dynamic_query` text,
  `assign_to_id` char(36) DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  `modified_by` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_folder` (`parent_folder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders`
--

LOCK TABLES `folders` WRITE;
/*!40000 ALTER TABLE `folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders_rel`
--

DROP TABLE IF EXISTS `folders_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders_rel` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `polymorphic_module` varchar(25) DEFAULT NULL,
  `polymorphic_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_poly_module_poly_id` (`polymorphic_module`,`polymorphic_id`),
  KEY `idx_fr_id_deleted_poly` (`folder_id`,`deleted`,`polymorphic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders_rel`
--

LOCK TABLES `folders_rel` WRITE;
/*!40000 ALTER TABLE `folders_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `folders_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders_subscriptions`
--

DROP TABLE IF EXISTS `folders_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders_subscriptions` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `assigned_user_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder_id_assigned_user_id` (`folder_id`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders_subscriptions`
--

LOCK TABLES `folders_subscriptions` WRITE;
/*!40000 ALTER TABLE `folders_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `folders_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_maps`
--

DROP TABLE IF EXISTS `import_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_maps` (
  `id` char(36) NOT NULL,
  `name` varchar(254) DEFAULT NULL,
  `source` varchar(36) DEFAULT NULL,
  `enclosure` varchar(1) DEFAULT ' ',
  `delimiter` varchar(1) DEFAULT ',',
  `module` varchar(36) DEFAULT NULL,
  `content` text,
  `default_values` text,
  `has_header` tinyint(1) DEFAULT '1',
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_published` varchar(3) DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `idx_owner_module_name` (`assigned_user_id`,`module`,`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_maps`
--

LOCK TABLES `import_maps` WRITE;
/*!40000 ALTER TABLE `import_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email`
--

DROP TABLE IF EXISTS `inbound_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_email` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Active',
  `server_url` varchar(100) DEFAULT NULL,
  `email_user` varchar(100) DEFAULT NULL,
  `email_password` varchar(100) DEFAULT NULL,
  `port` int(5) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `mailbox` text,
  `delete_seen` tinyint(1) DEFAULT '0',
  `mailbox_type` varchar(10) DEFAULT NULL,
  `template_id` char(36) DEFAULT NULL,
  `stored_options` text,
  `group_id` char(36) DEFAULT NULL,
  `is_personal` tinyint(1) DEFAULT '0',
  `groupfolder_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email`
--

LOCK TABLES `inbound_email` WRITE;
/*!40000 ALTER TABLE `inbound_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email_autoreply`
--

DROP TABLE IF EXISTS `inbound_email_autoreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_email_autoreply` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `autoreplied_to` varchar(100) DEFAULT NULL,
  `ie_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ie_autoreplied_to` (`autoreplied_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email_autoreply`
--

LOCK TABLES `inbound_email_autoreply` WRITE;
/*!40000 ALTER TABLE `inbound_email_autoreply` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email_autoreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email_cache_ts`
--

DROP TABLE IF EXISTS `inbound_email_cache_ts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_email_cache_ts` (
  `id` varchar(255) NOT NULL,
  `ie_timestamp` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email_cache_ts`
--

LOCK TABLES `inbound_email_cache_ts` WRITE;
/*!40000 ALTER TABLE `inbound_email_cache_ts` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email_cache_ts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_queue`
--

DROP TABLE IF EXISTS `job_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_queue` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `scheduler_id` char(36) DEFAULT NULL,
  `execute_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `resolution` varchar(20) DEFAULT NULL,
  `message` text,
  `target` varchar(255) DEFAULT NULL,
  `data` text,
  `requeue` tinyint(1) DEFAULT '0',
  `retry_count` tinyint(4) DEFAULT NULL,
  `failure_count` tinyint(4) DEFAULT NULL,
  `job_delay` int(11) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_status_scheduler` (`status`,`scheduler_id`),
  KEY `idx_status_time` (`status`,`execute_time`,`date_entered`),
  KEY `idx_status_entered` (`status`,`date_entered`),
  KEY `idx_status_modified` (`status`,`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_queue`
--

LOCK TABLES `job_queue` WRITE;
/*!40000 ALTER TABLE `job_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `converted` tinyint(1) DEFAULT '0',
  `refered_by` varchar(100) DEFAULT NULL,
  `lead_source` varchar(100) DEFAULT NULL,
  `lead_source_description` text,
  `status` varchar(100) DEFAULT NULL,
  `status_description` text,
  `reports_to_id` char(36) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_description` text,
  `contact_id` char(36) DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `opportunity_name` varchar(255) DEFAULT NULL,
  `opportunity_amount` varchar(50) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `portal_name` varchar(255) DEFAULT NULL,
  `portal_app` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lead_acct_name_first` (`account_name`,`deleted`),
  KEY `idx_lead_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_lead_del_stat` (`last_name`,`status`,`deleted`,`first_name`),
  KEY `idx_lead_opp_del` (`opportunity_id`,`deleted`),
  KEY `idx_leads_acct_del` (`account_id`,`deleted`),
  KEY `idx_del_user` (`deleted`,`assigned_user_id`),
  KEY `idx_lead_assigned` (`assigned_user_id`),
  KEY `idx_lead_contact` (`contact_id`),
  KEY `idx_reports_to` (`reports_to_id`),
  KEY `idx_lead_phone_work` (`phone_work`),
  KEY `idx_leads_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads_audit`
--

DROP TABLE IF EXISTS `leads_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_leads_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads_audit`
--

LOCK TABLES `leads_audit` WRITE;
/*!40000 ALTER TABLE `leads_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linked_documents`
--

DROP TABLE IF EXISTS `linked_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linked_documents` (
  `id` varchar(36) NOT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `parent_type` varchar(25) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_document` (`parent_type`,`parent_id`,`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linked_documents`
--

LOCK TABLES `linked_documents` WRITE;
/*!40000 ALTER TABLE `linked_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `linked_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `join_url` varchar(200) DEFAULT NULL,
  `host_url` varchar(400) DEFAULT NULL,
  `displayed_url` varchar(400) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `external_id` varchar(50) DEFAULT NULL,
  `duration_hours` int(3) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `type` varchar(255) DEFAULT 'Sugar',
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT '-1',
  `email_reminder_time` int(11) DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT '0',
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT '1',
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mtg_name` (`name`),
  KEY `idx_meet_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_meet_stat_del` (`assigned_user_id`,`status`,`deleted`),
  KEY `idx_meet_date_start` (`date_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_contacts`
--

DROP TABLE IF EXISTS `meetings_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_contacts` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_mtg_mtg` (`meeting_id`),
  KEY `idx_con_mtg_con` (`contact_id`),
  KEY `idx_meeting_contact` (`meeting_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_contacts`
--

LOCK TABLES `meetings_contacts` WRITE;
/*!40000 ALTER TABLE `meetings_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_leads`
--

DROP TABLE IF EXISTS `meetings_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_leads` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lead_meeting_meeting` (`meeting_id`),
  KEY `idx_lead_meeting_lead` (`lead_id`),
  KEY `idx_meeting_lead` (`meeting_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_leads`
--

LOCK TABLES `meetings_leads` WRITE;
/*!40000 ALTER TABLE `meetings_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_users`
--

DROP TABLE IF EXISTS `meetings_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_users` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_usr_mtg_mtg` (`meeting_id`),
  KEY `idx_usr_mtg_usr` (`user_id`),
  KEY `idx_meeting_users` (`meeting_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_users`
--

LOCK TABLES `meetings_users` WRITE;
/*!40000 ALTER TABLE `meetings_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `portal_flag` tinyint(1) DEFAULT NULL,
  `embed_flag` tinyint(1) DEFAULT '0',
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_note_name` (`name`),
  KEY `idx_notes_parent` (`parent_id`,`parent_type`),
  KEY `idx_note_contact` (`contact_id`),
  KEY `idx_notes_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_consumer`
--

DROP TABLE IF EXISTS `oauth_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_consumer` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `c_key` varchar(255) DEFAULT NULL,
  `c_secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ckey` (`c_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_consumer`
--

LOCK TABLES `oauth_consumer` WRITE;
/*!40000 ALTER TABLE `oauth_consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_nonce`
--

DROP TABLE IF EXISTS `oauth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_nonce` (
  `conskey` varchar(32) NOT NULL,
  `nonce` varchar(32) NOT NULL,
  `nonce_ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`conskey`,`nonce`),
  KEY `oauth_nonce_keyts` (`conskey`,`nonce_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_nonce`
--

LOCK TABLES `oauth_nonce` WRITE;
/*!40000 ALTER TABLE `oauth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_tokens`
--

DROP TABLE IF EXISTS `oauth_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_tokens` (
  `id` char(36) NOT NULL,
  `secret` varchar(32) DEFAULT NULL,
  `tstate` varchar(1) DEFAULT NULL,
  `consumer` char(36) NOT NULL,
  `token_ts` bigint(20) DEFAULT NULL,
  `verify` varchar(32) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `callback_url` varchar(255) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`,`deleted`),
  KEY `oauth_state_ts` (`tstate`,`token_ts`),
  KEY `constoken_key` (`consumer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_tokens`
--

LOCK TABLES `oauth_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities`
--

DROP TABLE IF EXISTS `opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `opportunity_type` varchar(255) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `lead_source` varchar(50) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `amount_usdollar` double DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `date_closed` date DEFAULT NULL,
  `next_step` varchar(100) DEFAULT NULL,
  `sales_stage` varchar(255) DEFAULT NULL,
  `probability` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_opp_name` (`name`),
  KEY `idx_opp_assigned` (`assigned_user_id`),
  KEY `idx_opp_id_deleted` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities`
--

LOCK TABLES `opportunities` WRITE;
/*!40000 ALTER TABLE `opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities_audit`
--

DROP TABLE IF EXISTS `opportunities_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_opportunities_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities_audit`
--

LOCK TABLES `opportunities_audit` WRITE;
/*!40000 ALTER TABLE `opportunities_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities_contacts`
--

DROP TABLE IF EXISTS `opportunities_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_opp_con` (`contact_id`),
  KEY `idx_con_opp_opp` (`opportunity_id`),
  KEY `idx_opportunities_contacts` (`opportunity_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities_contacts`
--

LOCK TABLES `opportunities_contacts` WRITE;
/*!40000 ALTER TABLE `opportunities_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbound_email`
--

DROP TABLE IF EXISTS `outbound_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outbound_email` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(15) DEFAULT 'user',
  `user_id` char(36) NOT NULL,
  `mail_sendtype` varchar(8) DEFAULT 'smtp',
  `mail_smtptype` varchar(20) DEFAULT 'other',
  `mail_smtpserver` varchar(100) DEFAULT NULL,
  `mail_smtpport` int(5) DEFAULT '0',
  `mail_smtpuser` varchar(100) DEFAULT NULL,
  `mail_smtppass` varchar(100) DEFAULT NULL,
  `mail_smtpauth_req` tinyint(1) DEFAULT '0',
  `mail_smtpssl` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `oe_user_id_idx` (`id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbound_email`
--

LOCK TABLES `outbound_email` WRITE;
/*!40000 ALTER TABLE `outbound_email` DISABLE KEYS */;
INSERT INTO `outbound_email` VALUES ('704ad160-38d2-d9f2-730f-54ee0d5fb261','system','system','1','SMTP','other','',25,'','',1,0);
/*!40000 ALTER TABLE `outbound_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `estimated_start_date` date DEFAULT NULL,
  `estimated_end_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_task`
--

DROP TABLE IF EXISTS `project_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_task` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `project_id` char(36) NOT NULL,
  `project_task_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `description` text,
  `predecessors` text,
  `date_start` date DEFAULT NULL,
  `time_start` int(11) DEFAULT NULL,
  `time_finish` int(11) DEFAULT NULL,
  `date_finish` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `duration_unit` text,
  `actual_duration` int(11) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  `date_due` date DEFAULT NULL,
  `time_due` time DEFAULT NULL,
  `parent_task_id` int(11) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `milestone_flag` tinyint(1) DEFAULT NULL,
  `order_number` int(11) DEFAULT '1',
  `task_number` int(11) DEFAULT NULL,
  `estimated_effort` int(11) DEFAULT NULL,
  `actual_effort` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `utilization` int(11) DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_task`
--

LOCK TABLES `project_task` WRITE;
/*!40000 ALTER TABLE `project_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_task_audit`
--

DROP TABLE IF EXISTS `project_task_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_task_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_project_task_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_task_audit`
--

LOCK TABLES `project_task_audit` WRITE;
/*!40000 ALTER TABLE `project_task_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_task_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_accounts`
--

DROP TABLE IF EXISTS `projects_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_accounts` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_acct_proj` (`project_id`),
  KEY `idx_proj_acct_acct` (`account_id`),
  KEY `projects_accounts_alt` (`project_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_accounts`
--

LOCK TABLES `projects_accounts` WRITE;
/*!40000 ALTER TABLE `projects_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_bugs`
--

DROP TABLE IF EXISTS `projects_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_bugs` (
  `id` varchar(36) NOT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_bug_proj` (`project_id`),
  KEY `idx_proj_bug_bug` (`bug_id`),
  KEY `projects_bugs_alt` (`project_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_bugs`
--

LOCK TABLES `projects_bugs` WRITE;
/*!40000 ALTER TABLE `projects_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_cases`
--

DROP TABLE IF EXISTS `projects_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_cases` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_case_proj` (`project_id`),
  KEY `idx_proj_case_case` (`case_id`),
  KEY `projects_cases_alt` (`project_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_cases`
--

LOCK TABLES `projects_cases` WRITE;
/*!40000 ALTER TABLE `projects_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_contacts`
--

DROP TABLE IF EXISTS `projects_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_con_proj` (`project_id`),
  KEY `idx_proj_con_con` (`contact_id`),
  KEY `projects_contacts_alt` (`project_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_contacts`
--

LOCK TABLES `projects_contacts` WRITE;
/*!40000 ALTER TABLE `projects_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_opportunities`
--

DROP TABLE IF EXISTS `projects_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_opp_proj` (`project_id`),
  KEY `idx_proj_opp_opp` (`opportunity_id`),
  KEY `projects_opportunities_alt` (`project_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_opportunities`
--

LOCK TABLES `projects_opportunities` WRITE;
/*!40000 ALTER TABLE `projects_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_products`
--

DROP TABLE IF EXISTS `projects_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_products` (
  `id` varchar(36) NOT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_prod_project` (`project_id`),
  KEY `idx_proj_prod_product` (`product_id`),
  KEY `projects_products_alt` (`project_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_products`
--

LOCK TABLES `projects_products` WRITE;
/*!40000 ALTER TABLE `projects_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_list_campaigns`
--

DROP TABLE IF EXISTS `prospect_list_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_list_campaigns` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `campaign_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pro_id` (`prospect_list_id`),
  KEY `idx_cam_id` (`campaign_id`),
  KEY `idx_prospect_list_campaigns` (`prospect_list_id`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_list_campaigns`
--

LOCK TABLES `prospect_list_campaigns` WRITE;
/*!40000 ALTER TABLE `prospect_list_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_list_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_lists`
--

DROP TABLE IF EXISTS `prospect_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_lists` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_type` varchar(100) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `description` text,
  `domain_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_prospect_list_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_lists`
--

LOCK TABLES `prospect_lists` WRITE;
/*!40000 ALTER TABLE `prospect_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_lists_prospects`
--

DROP TABLE IF EXISTS `prospect_lists_prospects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_lists_prospects` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_plp_pro_id` (`prospect_list_id`),
  KEY `idx_plp_rel_id` (`related_id`,`related_type`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_lists_prospects`
--

LOCK TABLES `prospect_lists_prospects` WRITE;
/*!40000 ALTER TABLE `prospect_lists_prospects` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_lists_prospects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospects`
--

DROP TABLE IF EXISTS `prospects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospects` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `birthdate` date DEFAULT NULL,
  `lead_id` char(36) DEFAULT NULL,
  `account_name` varchar(150) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prospect_auto_tracker_key` (`tracker_key`),
  KEY `idx_prospects_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_prospecs_del_last` (`last_name`,`deleted`),
  KEY `idx_prospects_id_del` (`id`,`deleted`),
  KEY `idx_prospects_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospects`
--

LOCK TABLES `prospects` WRITE;
/*!40000 ALTER TABLE `prospects` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationships`
--

DROP TABLE IF EXISTS `relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationships` (
  `id` char(36) NOT NULL,
  `relationship_name` varchar(150) DEFAULT NULL,
  `lhs_module` varchar(100) DEFAULT NULL,
  `lhs_table` varchar(64) DEFAULT NULL,
  `lhs_key` varchar(64) DEFAULT NULL,
  `rhs_module` varchar(100) DEFAULT NULL,
  `rhs_table` varchar(64) DEFAULT NULL,
  `rhs_key` varchar(64) DEFAULT NULL,
  `join_table` varchar(128) DEFAULT NULL,
  `join_key_lhs` varchar(128) DEFAULT NULL,
  `join_key_rhs` varchar(128) DEFAULT NULL,
  `relationship_type` varchar(64) DEFAULT NULL,
  `relationship_role_column` varchar(64) DEFAULT NULL,
  `relationship_role_column_value` varchar(50) DEFAULT NULL,
  `reverse` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rel_name` (`relationship_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationships`
--

LOCK TABLES `relationships` WRITE;
/*!40000 ALTER TABLE `relationships` DISABLE KEYS */;
INSERT INTO `relationships` VALUES ('21259033-795c-8ebe-bc73-54ee0c195f5c','inbound_email_created_by','Users','users','id','InboundEmail','inbound_email','created_by',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('21505fe1-3445-5538-0949-54ee0c9d4e4f','inbound_email_modified_user_id','Users','users','id','InboundEmail','inbound_email','modified_user_id',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('216d4f8f-db7b-7f93-5e4d-54ee0ca00e36','prospectlists_assigned_user','Users','users','id','prospectlists','prospect_lists','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2684fbf0-59c6-bf22-ac93-54ee0c4a695b','notes_assigned_user','Users','users','id','Notes','notes','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('26d5af37-e451-a4fe-31cf-54ee0c5d3663','notes_modified_user','Users','users','id','Notes','notes','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('27472b0d-0731-2748-eaf1-54ee0cd9fe5e','notes_created_by','Users','users','id','Notes','notes','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('30295bef-71fb-1bbd-5b1c-54ee0c174076','saved_search_assigned_user','Users','users','id','SavedSearch','saved_search','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('41752708-07e5-37e7-cee2-54ee0cf8e9e0','calls_modified_user','Users','users','id','Calls','calls','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('41c1d406-b9dc-26e0-dd1e-54ee0c860742','calls_created_by','Users','users','id','Calls','calls','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('41f55805-ca67-1695-7535-54ee0c173f56','calls_assigned_user','Users','users','id','Calls','calls','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4228417b-928c-988b-618c-54ee0c9a50d5','calls_notes','Calls','calls','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Calls',0,0),('45f43c84-671d-da71-09bf-54ee0c42730c','prospects_modified_user','Users','users','id','Prospects','prospects','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('465ccbe3-63a1-2d58-be86-54ee0cae4383','prospects_created_by','Users','users','id','Prospects','prospects','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('46a6977f-ea24-72e9-4548-54ee0ca1da90','prospects_assigned_user','Users','users','id','Prospects','prospects','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('46e01749-6056-9923-57e7-54ee0c73df53','prospects_email_addresses','Prospects','prospects','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Prospects',0,0),('473bc327-2544-7c12-cc6e-54ee0ca9fe37','prospects_email_addresses_primary','Prospects','prospects','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('47efc522-0c9b-e3c7-b09c-54ee0cd20198','prospect_tasks','Prospects','prospects','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('482dd8af-55b8-ad2b-643c-54ee0c871faf','prospect_notes','Prospects','prospects','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('488981f9-3f10-53d0-99d8-54ee0c4c09ed','prospect_meetings','Prospects','prospects','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('48b7cd63-8aee-a8da-8ec2-54ee0c07ea26','prospect_calls','Prospects','prospects','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('48e5d829-1a0b-a1c7-53a4-54ee0c2e3c3f','prospect_emails','Prospects','prospects','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('490f9ab5-0fb3-6598-da46-54ee0c55166f','prospect_campaign_log','Prospects','prospects','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Prospects',0,0),('50d5cb6c-8219-df62-2635-54ee0c79302a','leads_modified_user','Users','users','id','Leads','leads','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('51182fe3-1827-6def-15ba-54ee0cb7e17c','leads_created_by','Users','users','id','Leads','leads','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5140d2c5-5d71-beca-7dff-54ee0cc30200','leads_assigned_user','Users','users','id','Leads','leads','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('51652dd0-92ae-296f-614b-54ee0c86906f','leads_email_addresses','Leads','leads','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Leads',0,0),('5189ec91-f23a-da30-2989-54ee0cb33c48','leads_email_addresses_primary','Leads','leads','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('51aed6ac-0c9a-7573-8bdf-54ee0c988cb7','lead_direct_reports','Leads','leads','id','Leads','leads','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('51d04358-517a-ca4d-bc71-54ee0ced048b','lead_tasks','Leads','leads','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('51de747b-07c2-d875-a614-54ee0c6fbc15','lead_notes','Leads','leads','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('521cd1ab-8702-c83c-bcd4-54ee0ce55402','lead_meetings','Leads','leads','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('52557d71-1b78-fa08-d358-54ee0cb131d2','lead_calls','Leads','leads','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('527e39f6-c18b-dfc2-84e3-54ee0c55a514','lead_emails','Leads','leads','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('52a712d5-b09a-a173-8177-54ee0c93ea8c','lead_campaign_log','Leads','leads','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Leads',0,0),('52e04fa7-1370-76fd-a391-54ee0c57960e','sugarfeed_modified_user','Users','users','id','SugarFeed','sugarfeed','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('531fda86-6e7a-a23e-a88e-54ee0ce4e452','sugarfeed_created_by','Users','users','id','SugarFeed','sugarfeed','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('53450f74-f8cf-f829-d289-54ee0ce8eb45','sugarfeed_assigned_user','Users','users','id','SugarFeed','sugarfeed','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('55fc6160-015b-0a24-0c58-54ee0cb56323','email_template_email_marketings','EmailTemplates','email_templates','id','EmailMarketing','email_marketing','template_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5865dfe0-a51c-6f04-08b4-54ee0cbb0cb1','emails_assigned_user','Users','users','id','Emails','emails','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('58caeb90-f209-52c3-a041-54ee0cdc5fec','emails_modified_user','Users','users','id','Emails','emails','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('59281934-176f-398a-ebaf-54ee0c8c5c3f','emails_created_by','Users','users','id','Emails','emails','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('59643b09-7980-bfcc-a338-54ee0c1a8a6d','emails_notes_rel','Emails','emails','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('597109e2-cd54-e632-bcf5-54ee0ce819c6','revisions_created_by','Users','users','id','DocumentRevisions','document_revisions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('598c5331-7059-da3d-d6c9-54ee0c3dd6c5','emails_contacts_rel','Emails','emails','id','Contacts','contacts','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Contacts',0,0),('59ac9d53-0037-c420-997f-54ee0c3d4be6','emails_accounts_rel','Emails','emails','id','Accounts','accounts','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Accounts',0,0),('59f16e92-613a-fea4-03f2-54ee0c2fefcb','emails_leads_rel','Emails','emails','id','Leads','leads','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Leads',0,0),('5a245889-2fc9-13a1-21bf-54ee0c91e800','emails_meetings_rel','Emails','emails','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5e160881-0569-0ed2-f333-54ee0ce6d98a','campaign_campaigntrakers','Campaigns','campaigns','id','CampaignTrackers','campaign_trkrs','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('69db3c4f-e2eb-ab6c-856a-54ee0c113c75','eapm_modified_user','Users','users','id','EAPM','eapm','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6a1fdc42-0676-1720-3e5a-54ee0c3a96ca','eapm_created_by','Users','users','id','EAPM','eapm','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6a4cd078-bc50-8f0f-b03c-54ee0c01e089','eapm_assigned_user','Users','users','id','EAPM','eapm','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6bfcf6df-548d-85e2-148f-54ee0c0bcd72','cases_modified_user','Users','users','id','Cases','cases','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6c7e6c65-99d7-ed5b-7dea-54ee0c1c7b46','cases_created_by','Users','users','id','Cases','cases','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6d1e9216-c3d7-96b6-6e43-54ee0c771e87','cases_assigned_user','Users','users','id','Cases','cases','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6d95a15e-71ce-dbbf-5c73-54ee0c30747e','case_calls','Cases','cases','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('6dd761f6-1ddb-a649-230c-54ee0cd7def4','case_tasks','Cases','cases','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('6e050b44-4c50-68c6-1d9d-54ee0c75b450','case_notes','Cases','cases','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('6e2cef9e-c251-ccf4-79fa-54ee0cdbf4fd','case_meetings','Cases','cases','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('6e7b4ddf-1533-aca3-d517-54ee0cb603fc','case_emails','Cases','cases','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('6fe70cfb-9a70-9d11-d1e0-54ee0cdd55a7','campaigns_modified_user','Users','users','id','Campaigns','campaigns','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('743806dd-880e-d5ec-649c-54ee0c0421b9','campaigns_created_by','Users','users','id','Campaigns','campaigns','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('753099ce-b5e7-c17d-2ddf-54ee0c0713b3','meetings_modified_user','Users','users','id','Meetings','meetings','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('759d78b4-e595-96ee-9fb3-54ee0c800ffd','meetings_created_by','Users','users','id','Meetings','meetings','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('75d6ff17-0b16-078e-48e9-54ee0c570513','meetings_assigned_user','Users','users','id','Meetings','meetings','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7609f8fc-14e7-849a-3626-54ee0c5d564e','meetings_notes','Meetings','meetings','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Meetings',0,0),('76c5006c-d4eb-b820-9a8c-54ee0c2a2789','campaigns_assigned_user','Users','users','id','Campaigns','campaigns','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7a4d0ffe-4ddb-5e30-311c-54ee0c08a55f','campaign_accounts','Campaigns','campaigns','id','Accounts','accounts','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7ef60922-1ad3-ae51-7c79-54ee0cbec4ac','campaign_contacts','Campaigns','campaigns','id','Contacts','contacts','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7f8ae9f2-e598-5f1b-355b-54ee0cb09666','oauthkeys_modified_user','Users','users','id','OAuthKeys','oauthkeys','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7fe821cb-0ff7-3c9e-2750-54ee0ce087a6','oauthkeys_created_by','Users','users','id','OAuthKeys','oauthkeys','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8061d96a-7f53-5888-4333-54ee0c0d0635','oauthkeys_assigned_user','Users','users','id','OAuthKeys','oauthkeys','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('85a00e32-6c52-ce97-10c7-54ee0c7f4142','campaign_leads','Campaigns','campaigns','id','Leads','leads','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8835086d-d975-13fc-349f-54ee0c04e003','campaign_prospects','Campaigns','campaigns','id','Prospects','prospects','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8977f025-db75-a4cb-32a4-54ee0c69cc01','consumer_tokens','OAuthKeys','oauth_consumer','id','OAuthTokens','oauth_tokens','consumer',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('89b7764c-4d5e-ca38-6f56-54ee0cdaab08','schedulers_created_by_rel','Users','users','id','Schedulers','schedulers','created_by',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('89caf83b-133d-f835-96b4-54ee0c86c5c8','oauthtokens_assigned_user','Users','users','id','OAuthTokens','oauth_tokens','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8a041b6e-e345-acac-af3e-54ee0c0ba02c','schedulers_modified_user_id_rel','Users','users','id','Schedulers','schedulers','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8a4b80aa-8019-ed12-7aea-54ee0cc8b321','schedulers_jobs_rel','Schedulers','schedulers','id','SchedulersJobs','job_queue','scheduler_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8ab40614-3315-9f3b-1776-54ee0cfd2cf9','campaign_opportunities','Campaigns','campaigns','id','Opportunities','opportunities','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8bd6e36f-6ba1-4520-c5ec-54ee0cf83ac8','bugs_modified_user','Users','users','id','Bugs','bugs','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8c521990-8dee-a385-c994-54ee0ca4b7ce','bugs_created_by','Users','users','id','Bugs','bugs','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8d338345-62c6-9ecc-9939-54ee0c61d254','bugs_assigned_user','Users','users','id','Bugs','bugs','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8d73eeb6-d820-2dea-3f8f-54ee0ca8f57e','bug_tasks','Bugs','bugs','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('8dc9edcf-e510-7d96-3546-54ee0c37efc3','bug_meetings','Bugs','bugs','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('8e026d82-dab9-52dc-7dc9-54ee0c9dd859','bug_calls','Bugs','bugs','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('8e2c68e3-b07b-cc7c-eb4c-54ee0cdfd319','bug_emails','Bugs','bugs','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('8e488775-aa1a-8931-0c17-54ee0ca3ba94','accounts_bugs','Accounts','accounts','id','Bugs','bugs','id','accounts_bugs','account_id','bug_id','many-to-many',NULL,NULL,0,0),('8e5219af-dbe5-c1db-3db1-54ee0c986146','bug_notes','Bugs','bugs','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('8e70e716-48c3-d846-09c0-54ee0cbf844e','bugs_release','Releases','releases','id','Bugs','bugs','found_in_release',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8ea61eed-b4c8-f657-4f3f-54ee0cc4ec00','tasks_modified_user','Users','users','id','Tasks','tasks','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8eb3ed09-5b02-2301-338c-54ee0c8515c2','bugs_fixed_in_release','Releases','releases','id','Bugs','bugs','fixed_in_release',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8efb8822-d975-82ee-787a-54ee0cec4f54','tasks_created_by','Users','users','id','Tasks','tasks','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8f27413a-e33e-ad10-47e5-54ee0c0552fc','tasks_assigned_user','Users','users','id','Tasks','tasks','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8f5987be-8c0a-7a0b-0f15-54ee0cde4101','tasks_notes','Tasks','tasks','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8f8202ed-3101-5091-1236-54ee0c882285','campaign_email_marketing','Campaigns','campaigns','id','EmailMarketing','email_marketing','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8f8c727c-97af-7968-e23a-54ee0ccde6d1','schedulersjobs_assigned_user','Users','users','id','SchedulersJobs','schedulersjobs','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('90033411-626f-848e-1f21-54ee0c2158e9','accounts_contacts','Accounts','accounts','id','Contacts','contacts','id','accounts_contacts','account_id','contact_id','many-to-many',NULL,NULL,0,0),('919187ad-4858-5d27-1447-54ee0cd81b14','accounts_opportunities','Accounts','accounts','id','Opportunities','opportunities','id','accounts_opportunities','account_id','opportunity_id','many-to-many',NULL,NULL,0,0),('92440bec-74f6-3447-a392-54ee0c9854c1','campaign_emailman','Campaigns','campaigns','id','EmailMan','emailman','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('92c631d8-6714-b889-d73d-54ee0cd0ce24','acl_roles_actions','ACLRoles','acl_roles','id','ACLActions','acl_actions','id','acl_roles_actions','role_id','action_id','many-to-many',NULL,NULL,0,0),('93ac3e62-cf52-7689-a98e-54ee0cf0857e','acl_roles_users','ACLRoles','acl_roles','id','Users','users','id','acl_roles_users','role_id','user_id','many-to-many',NULL,NULL,0,0),('94930659-112d-cb6a-1f6b-54ee0c0090c9','campaign_campaignlog','Campaigns','campaigns','id','CampaignLog','campaign_log','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('956c1860-cd7b-6719-b149-54ee0c8037d8','calls_contacts','Calls','calls','id','Contacts','contacts','id','calls_contacts','call_id','contact_id','many-to-many',NULL,NULL,0,0),('96af3ce0-e2ef-2f24-bc6e-54ee0ce77e15','calls_leads','Calls','calls','id','Leads','leads','id','calls_leads','call_id','lead_id','many-to-many',NULL,NULL,0,0),('97110685-cae8-41d1-5650-54ee0cda0fd0','campaign_assigned_user','Users','users','id','Campaigns','campaigns','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('97a1347d-5e0f-9c9e-c50d-54ee0cacf112','calls_users','Calls','calls','id','Users','users','id','calls_users','call_id','user_id','many-to-many',NULL,NULL,0,0),('987cc48a-0bd7-9243-1e01-54ee0c9608d9','cases_bugs','Cases','cases','id','Bugs','bugs','id','cases_bugs','case_id','bug_id','many-to-many',NULL,NULL,0,0),('996a043e-37a8-3a25-deb9-54ee0cad21fb','campaign_modified_user','Users','users','id','Campaigns','campaigns','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('99e24717-0de3-eaff-0f4a-54ee0ce95a7a','contacts_bugs','Contacts','contacts','id','Bugs','bugs','id','contacts_bugs','contact_id','bug_id','many-to-many',NULL,NULL,0,0),('9b32f7eb-6737-a344-a4a9-54ee0c8c33c8','contacts_cases','Contacts','contacts','id','Cases','cases','id','contacts_cases','contact_id','case_id','many-to-many',NULL,NULL,0,0),('9c0e1cc1-d670-a7a2-feb2-54ee0ccbf4dd','contacts_users','Contacts','contacts','id','Users','users','id','contacts_users','contact_id','user_id','many-to-many',NULL,NULL,0,0),('9f0b0eb5-4ea3-5e01-42c0-54ee0c982398','documents_accounts','Documents','documents','id','Accounts','accounts','id','documents_accounts','document_id','account_id','many-to-many',NULL,NULL,0,0),('9fe22d28-4052-5b8c-aa7e-54ee0caf088d','documents_bugs','Documents','documents','id','Bugs','bugs','id','documents_bugs','document_id','bug_id','many-to-many',NULL,NULL,0,0),('a0e080b8-672a-162b-d32f-54ee0c58d3d2','documents_cases','Documents','documents','id','Cases','cases','id','documents_cases','document_id','case_id','many-to-many',NULL,NULL,0,0),('a2364285-a622-67b0-c861-54ee0c0420f4','documents_contacts','Documents','documents','id','Contacts','contacts','id','documents_contacts','document_id','contact_id','many-to-many',NULL,NULL,0,0),('a5f2fb87-b3f8-a53f-f0fc-54ee0cb064f2','user_direct_reports','Users','users','id','Users','users','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a6726bc8-f113-c1a2-521e-54ee0c879925','users_email_addresses','Users','users','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Users',0,0),('a6b0fdf2-b916-370a-30f4-54ee0c13f664','users_email_addresses_primary','Users','users','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('a8fadced-8d2e-dfe0-a2ab-54ee0cddb35f','documents_opportunities','Documents','documents','id','Opportunities','opportunities','id','documents_opportunities','document_id','opportunity_id','many-to-many',NULL,NULL,0,0),('ac5fef0c-220c-98e6-1aed-54ee0cf9697c','email_marketing_prospect_lists','EmailMarketing','email_marketing','id','ProspectLists','prospect_lists','id','email_marketing_prospect_lists','email_marketing_id','prospect_list_id','many-to-many',NULL,NULL,0,0),('ae08cbfa-8c8f-8fbf-3e91-54ee0c646eee','emails_bugs_rel','Emails','emails','id','Bugs','bugs','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Bugs',0,0),('ae5c93d4-9923-9199-b58d-54ee0cdf4a20','emails_cases_rel','Emails','emails','id','Cases','cases','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Cases',0,0),('ae9306a8-6bb1-519d-d204-54ee0c947234','emails_opportunities_rel','Emails','emails','id','Opportunities','opportunities','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Opportunities',0,0),('aee9aaee-48e3-41b2-da7e-54ee0c2af508','emails_tasks_rel','Emails','emails','id','Tasks','tasks','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Tasks',0,0),('af0ca8e1-be54-28b0-3998-54ee0cdcec31','emails_users_rel','Emails','emails','id','Users','users','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Users',0,0),('af314f12-3c05-f230-789a-54ee0c4ebb78','emails_project_task_rel','Emails','emails','id','ProjectTask','project_task','id','emails_beans','email_id','bean_id','many-to-many','bean_module','ProjectTask',0,0),('af5a7c97-9896-ff80-23b7-54ee0c9bb3a8','emails_projects_rel','Emails','emails','id','Project','project','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Project',0,0),('af857a27-d96d-f488-686f-54ee0cca158c','emails_prospects_rel','Emails','emails','id','Prospects','prospects','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Prospects',0,0),('b1b33991-9790-6302-c7cb-54ee0c264329','campaignlog_contact','CampaignLog','campaign_log','related_id','Contacts','contacts','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b1d79cc8-d0f6-0d8c-dd4b-54ee0cd78009','contacts_modified_user','Users','users','id','Contacts','contacts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b23d7889-7d25-b661-d963-54ee0c7e113c','contacts_created_by','Users','users','id','Contacts','contacts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b257c2cd-ba76-1c4d-9177-54ee0c8af304','campaignlog_lead','CampaignLog','campaign_log','related_id','Leads','leads','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b2657431-14fc-c6d9-a011-54ee0c4fd85a','contacts_assigned_user','Users','users','id','Contacts','contacts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b289115b-b3a7-f104-fe12-54ee0c89d63e','contacts_email_addresses','Contacts','contacts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Contacts',0,0),('b28bb109-0274-442e-f11f-54ee0ce77124','campaignlog_created_opportunities','CampaignLog','campaign_log','related_id','Opportunities','opportunities','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b2ced5e1-7331-d099-5f32-54ee0cb7d872','contacts_email_addresses_primary','Contacts','contacts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('b2f73aa1-9653-36dd-dc35-54ee0c920078','campaignlog_targeted_users','CampaignLog','campaign_log','target_id','Users','users','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b300cb52-d3cc-6f22-ecc8-54ee0ce55b85','contact_direct_reports','Contacts','contacts','id','Contacts','contacts','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b3286776-249f-fe09-9f6a-54ee0cd8bc70','contact_leads','Contacts','contacts','id','Leads','leads','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b33592c0-aa0a-90b9-d255-54ee0c801105','campaignlog_sent_emails','CampaignLog','campaign_log','related_id','Emails','emails','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b3558975-9cbc-f542-5601-54ee0cc2a26f','contact_notes','Contacts','contacts','id','Notes','notes','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b39209b6-6dd5-9fc9-a7d2-54ee0cbf4d6e','contact_tasks','Contacts','contacts','id','Tasks','tasks','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b3fe8c38-0ac9-7279-7624-54ee0c399f64','contact_tasks_parent','Contacts','contacts','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Contacts',0,0),('b456da82-6bff-75df-8e21-54ee0cbf414b','contact_notes_parent','Contacts','contacts','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Contacts',0,0),('b45a206f-75b0-85cd-add0-54ee0c24db25','leads_documents','Leads','leads','id','Documents','documents','id','linked_documents','parent_id','document_id','many-to-many','parent_type','Leads',0,0),('b48612c2-3109-8cc9-7ade-54ee0c3a9113','contact_campaign_log','Contacts','contacts','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Contacts',0,0),('b579dc23-1ace-ee3c-fa49-54ee0c1a0fdb','meetings_contacts','Meetings','meetings','id','Contacts','contacts','id','meetings_contacts','meeting_id','contact_id','many-to-many',NULL,NULL,0,0),('b6db910f-5f01-fcc2-583e-54ee0cfeb035','meetings_leads','Meetings','meetings','id','Leads','leads','id','meetings_leads','meeting_id','lead_id','many-to-many',NULL,NULL,0,0),('b77a73df-51c3-5665-35b5-54ee0c318dce','meetings_users','Meetings','meetings','id','Users','users','id','meetings_users','meeting_id','user_id','many-to-many',NULL,NULL,0,0),('b90b0517-1a46-1030-9db5-54ee0c21dd1d','opportunities_contacts','Opportunities','opportunities','id','Contacts','contacts','id','opportunities_contacts','opportunity_id','contact_id','many-to-many',NULL,NULL,0,0),('bb0cdc09-7f01-8899-3d2e-54ee0c027429','projects_accounts','Project','project','id','Accounts','accounts','id','projects_accounts','project_id','account_id','many-to-many',NULL,NULL,0,0),('bc71499d-bebe-72b6-3975-54ee0c4af0d3','projects_bugs','Project','project','id','Bugs','bugs','id','projects_bugs','project_id','bug_id','many-to-many',NULL,NULL,0,0),('bd93a396-6b3f-fcd3-9949-54ee0c8fe39c','projects_cases','Project','project','id','Cases','cases','id','projects_cases','project_id','case_id','many-to-many',NULL,NULL,0,0),('bf33ac7c-03af-b87e-a96d-54ee0c2b5803','projects_contacts','Project','project','id','Contacts','contacts','id','projects_contacts','project_id','contact_id','many-to-many',NULL,NULL,0,0),('c04f0584-225f-48ef-4f7a-54ee0c7ed26d','projects_opportunities','Project','project','id','Opportunities','opportunities','id','projects_opportunities','project_id','opportunity_id','many-to-many',NULL,NULL,0,0),('c2eaf4c6-3e66-d5a3-1f68-54ee0ccc5c5d','prospect_list_campaigns','ProspectLists','prospect_lists','id','Campaigns','campaigns','id','prospect_list_campaigns','prospect_list_id','campaign_id','many-to-many',NULL,NULL,0,0),('c3a20d07-b1ab-aeb2-ac0a-54ee0cdbea3d','prospect_list_contacts','ProspectLists','prospect_lists','id','Contacts','contacts','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Contacts',0,0),('c3d9bef8-3450-3da2-ee9e-54ee0cd39ac6','prospect_list_prospects','ProspectLists','prospect_lists','id','Prospects','prospects','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Prospects',0,0),('c417c1e4-5c22-4858-fcca-54ee0c69dbdf','prospect_list_leads','ProspectLists','prospect_lists','id','Leads','leads','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Leads',0,0),('c480d31c-3d7f-6f44-aac5-54ee0cbd643d','prospect_list_users','ProspectLists','prospect_lists','id','Users','users','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Users',0,0),('c4c1871c-ffee-1e83-25c5-54ee0c681f83','prospect_list_accounts','ProspectLists','prospect_lists','id','Accounts','accounts','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Accounts',0,0),('c6dc6730-9d67-5ef7-0c1c-54ee0cdec438','projects_notes','Project','project','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('c71d5790-7061-f18e-22a2-54ee0c4c9307','roles_users','Roles','roles','id','Users','users','id','roles_users','role_id','user_id','many-to-many',NULL,NULL,0,0),('c73e7fe2-4c58-7d19-eb63-54ee0c37150a','projects_tasks','Project','project','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('c7804f26-c054-1174-4ba0-54ee0c9731ad','projects_meetings','Project','project','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('c7afeabc-19a7-3cd1-0b80-54ee0c704aa0','projects_calls','Project','project','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('c7eb2478-babb-092b-b22a-54ee0c371adf','projects_emails','Project','project','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('c851dae1-d6f7-f486-0f61-54ee0c05e2b4','projects_project_tasks','Project','project','id','ProjectTask','project_task','project_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c88c19ec-c3e4-72b3-1047-54ee0ceefdcf','projects_assigned_user','Users','users','id','Project','project','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c8c39b5f-7226-5341-990a-54ee0c2a3b09','projects_modified_user','Users','users','id','Project','project','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c8ed0241-56de-8642-53de-54ee0c02a9cc','projects_created_by','Users','users','id','Project','project','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d1e5dc11-8941-7f3c-e20c-54ee0c613a88','accounts_modified_user','Users','users','id','Accounts','accounts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d291288c-b117-8a79-dd08-54ee0cbe7268','accounts_created_by','Users','users','id','Accounts','accounts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d2bafdb3-5dd8-7f5b-eaab-54ee0c7d7017','accounts_assigned_user','Users','users','id','Accounts','accounts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d32a37c3-0e8b-9eb6-a7f6-54ee0ceadc99','accounts_email_addresses','Accounts','accounts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Accounts',0,0),('d35276be-49d6-50e7-3677-54ee0c570fbb','accounts_email_addresses_primary','Accounts','accounts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('d37704a4-2143-945f-cd68-54ee0c9f9c6a','member_accounts','Accounts','accounts','id','Accounts','accounts','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d3a28c86-2875-f81e-0b3d-54ee0c445170','account_cases','Accounts','accounts','id','Cases','cases','account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d3c2828e-6de1-84a5-c96f-54ee0cacd46a','account_tasks','Accounts','accounts','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('d40110b0-9c01-626e-83a3-54ee0c6ec70b','account_notes','Accounts','accounts','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('d42b2591-3b4b-4cfa-59fa-54ee0c894ec9','account_meetings','Accounts','accounts','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('d4614401-2e55-226d-f12d-54ee0c86860c','account_calls','Accounts','accounts','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('d4871410-51f2-fae3-d145-54ee0c26e9de','account_emails','Accounts','accounts','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('d4ace018-4fc8-7c27-ee55-54ee0c8816f3','account_leads','Accounts','accounts','id','Leads','leads','account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d4c283dd-7d21-0222-8033-54ee0cf06b7b','account_campaign_log','Accounts','accounts','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Accounts',0,0),('dd2f67b0-eac5-5576-8f55-54ee0c5faac1','project_tasks_notes','ProjectTask','project_task','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('ddd6b787-69b6-4229-88d7-54ee0cb1da47','project_tasks_tasks','ProjectTask','project_task','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('dea14ee3-f10b-0888-8102-54ee0c4b2e25','project_tasks_meetings','ProjectTask','project_task','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('def1cef1-4453-5c61-96d3-54ee0c682638','project_tasks_calls','ProjectTask','project_task','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('df1c16f7-090a-4fb4-abf3-54ee0ca2b43e','project_tasks_emails','ProjectTask','project_task','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('df48e206-3b2f-cabe-fc05-54ee0cf71b9d','project_tasks_assigned_user','Users','users','id','ProjectTask','project_task','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('df786580-434a-72da-feb6-54ee0cadb473','project_tasks_modified_user','Users','users','id','ProjectTask','project_task','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('dfa98895-061e-c252-4f17-54ee0c49ee93','project_tasks_created_by','Users','users','id','ProjectTask','project_task','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e79f01b7-ad3f-ad40-a721-54ee0ccbc5a7','emailtemplates_assigned_user','Users','users','id','EmailTemplates','email_templates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('eeca3438-7896-9140-887c-54ee0c2452e7','opportunities_modified_user','Users','users','id','Opportunities','opportunities','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ef2fa5c8-f4e7-823c-d005-54ee0c40a393','opportunities_created_by','Users','users','id','Opportunities','opportunities','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ef7c87e6-fa09-c393-f8bf-54ee0ce7077f','opportunities_assigned_user','Users','users','id','Opportunities','opportunities','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('efac1af9-efd2-3147-7723-54ee0c2f06b8','opportunity_calls','Opportunities','opportunities','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('effec619-e333-df05-a44b-54ee0c8868f5','opportunity_meetings','Opportunities','opportunities','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('f04ad2cd-0cfa-db08-814c-54ee0c732d45','opportunity_tasks','Opportunities','opportunities','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('f058e6c1-b3a2-37ec-cffe-54ee0c82f3dd','documents_modified_user','Users','users','id','Documents','documents','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f0722297-178b-eee9-0348-54ee0cea8d6d','opportunity_notes','Opportunities','opportunities','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('f09a5bae-0221-6fbd-584f-54ee0c5e5867','documents_created_by','Users','users','id','Documents','documents','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f0a94389-bb63-fd22-801c-54ee0c8b7806','opportunity_emails','Opportunities','opportunities','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('f0c62904-5049-21ca-6bca-54ee0cac95e9','opportunity_leads','Opportunities','opportunities','id','Leads','leads','opportunity_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f0f68554-b0ea-3cd3-cd64-54ee0c0d3be4','documents_assigned_user','Users','users','id','Documents','documents','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f0f6cf1d-fceb-f59c-578f-54ee0cab5efe','opportunity_currencies','Opportunities','opportunities','currency_id','Currencies','currencies','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f11498f6-6a1d-f5e0-f073-54ee0c9078ce','opportunities_campaign','Campaigns','campaigns','id','Opportunities','opportunities','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f116a373-0993-25e0-5257-54ee0c349c0b','document_revisions','Documents','documents','id','DocumentRevisions','document_revisions','document_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0);
/*!40000 ALTER TABLE `relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `releases`
--

DROP TABLE IF EXISTS `releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `releases` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_order` int(4) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_releases` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `releases`
--

LOCK TABLES `releases` WRITE;
/*!40000 ALTER TABLE `releases` DISABLE KEYS */;
/*!40000 ALTER TABLE `releases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `modules` text,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_role_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_modules`
--

DROP TABLE IF EXISTS `roles_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_modules` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `module_id` varchar(36) DEFAULT NULL,
  `allow` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_module_id` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_modules`
--

LOCK TABLES `roles_modules` WRITE;
/*!40000 ALTER TABLE `roles_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ru_role_id` (`role_id`),
  KEY `idx_ru_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved_search`
--

DROP TABLE IF EXISTS `saved_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saved_search` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `search_module` varchar(150) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` text,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `idx_desc` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved_search`
--

LOCK TABLES `saved_search` WRITE;
/*!40000 ALTER TABLE `saved_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedulers`
--

DROP TABLE IF EXISTS `schedulers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedulers` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `date_time_start` datetime DEFAULT NULL,
  `date_time_end` datetime DEFAULT NULL,
  `job_interval` varchar(100) DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `catch_up` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_schedule` (`date_time_start`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedulers`
--

LOCK TABLES `schedulers` WRITE;
/*!40000 ALTER TABLE `schedulers` DISABLE KEYS */;
INSERT INTO `schedulers` VALUES ('d56a3608-9042-d349-921f-54ee0c4d70c5',0,'2015-02-25 17:57:13','2015-02-25 17:57:13','1','1','Prune Tracker Tables','function::trimTracker','2005-01-01 10:15:01','2020-12-31 23:59:59','0::2::1::*::*',NULL,NULL,NULL,'Active',1),('d7ccdf77-e5e4-2578-98fa-54ee0c68b81d',0,'2015-02-25 17:57:13','2015-02-25 17:57:13','1','1','Check Inbound Mailboxes','function::pollMonitoredInboxes','2005-01-01 10:00:01','2020-12-31 23:59:59','*::*::*::*::*',NULL,NULL,NULL,'Active',0),('d83b4ba3-7545-516e-40ef-54ee0c9e6302',0,'2015-02-25 17:57:13','2015-02-25 17:57:13','1','1','Run Nightly Process Bounced Campaign Emails','function::pollMonitoredInboxesForBouncedCampaignEmails','2005-01-01 06:45:01','2020-12-31 23:59:59','0::2-6::*::*::*',NULL,NULL,NULL,'Active',1),('d8821e2d-18f4-4f66-1712-54ee0caa84c1',0,'2015-02-25 17:57:13','2015-02-25 17:57:13','1','1','Run Nightly Mass Email Campaigns','function::runMassEmailCampaign','2005-01-01 16:00:01','2020-12-31 23:59:59','0::2-6::*::*::*',NULL,NULL,NULL,'Active',1),('d911dfb6-8531-f596-5b2e-54ee0ce5f770',0,'2015-02-25 17:57:13','2015-02-25 17:57:13','1','1','Prune Database on 1st of Month','function::pruneDatabase','2005-01-01 10:45:01','2020-12-31 23:59:59','0::4::1::*::*',NULL,NULL,NULL,'Inactive',0),('d9602109-bd4e-750c-7d7f-54ee0c2696a7',0,'2015-02-25 17:57:13','2015-02-25 17:57:13','1','1','Run Email Reminder Notifications','function::sendEmailReminders','2008-01-01 12:45:01','2020-12-31 23:59:59','*::*::*::*::*',NULL,NULL,NULL,'Active',0),('da7428e8-f11d-1a1e-13fc-54ee0c2c3a27',0,'2015-02-25 17:57:13','2015-02-25 17:57:13','1','1','Clean Jobs Queue','function::cleanJobQueue','2012-01-01 07:15:01','2030-12-31 23:59:59','0::5::*::*::*',NULL,NULL,NULL,'Active',0),('db0097d2-27a4-6745-5628-54ee0c7260e8',0,'2015-02-25 17:57:13','2015-02-25 17:57:13','1','1','Removal of documents from filesystem','function::removeDocumentsFromFS','2012-01-01 09:00:01','2030-12-31 23:59:59','0::3::1::*::*',NULL,NULL,NULL,'Active',0),('db4cd531-50e8-717f-6372-54ee0cd41b0b',0,'2015-02-25 17:57:13','2015-02-25 17:57:13','1','1','Prune SugarFeed Tables','function::trimSugarFeeds','2005-01-01 06:00:01','2020-12-31 23:59:59','0::2::1::*::*',NULL,NULL,NULL,'Active',1);
/*!40000 ALTER TABLE `schedulers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sugarfeed`
--

DROP TABLE IF EXISTS `sugarfeed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sugarfeed` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `related_module` varchar(100) DEFAULT NULL,
  `related_id` char(36) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `link_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sgrfeed_date` (`date_entered`,`deleted`),
  KEY `idx_sgrfeed_rmod_rid_date` (`related_module`,`related_id`,`date_entered`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sugarfeed`
--

LOCK TABLES `sugarfeed` WRITE;
/*!40000 ALTER TABLE `sugarfeed` DISABLE KEYS */;
/*!40000 ALTER TABLE `sugarfeed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `date_due_flag` tinyint(1) DEFAULT '0',
  `date_due` datetime DEFAULT NULL,
  `date_start_flag` tinyint(1) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tsk_name` (`name`),
  KEY `idx_task_con_del` (`contact_id`,`deleted`),
  KEY `idx_task_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_task_assigned` (`assigned_user_id`),
  KEY `idx_task_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracker`
--

DROP TABLE IF EXISTS `tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monitor_id` char(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `item_id` varchar(36) DEFAULT NULL,
  `item_summary` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `session_id` varchar(36) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tracker_iid` (`item_id`),
  KEY `idx_tracker_userid_vis_id` (`user_id`,`visible`,`id`),
  KEY `idx_tracker_userid_itemid_vis` (`user_id`,`item_id`,`visible`),
  KEY `idx_tracker_monitor_id` (`monitor_id`),
  KEY `idx_tracker_date_modified` (`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracker`
--

LOCK TABLES `tracker` WRITE;
/*!40000 ALTER TABLE `tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upgrade_history`
--

DROP TABLE IF EXISTS `upgrade_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upgrade_history` (
  `id` char(36) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `md5sum` varchar(32) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `version` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `id_name` varchar(255) DEFAULT NULL,
  `manifest` longtext,
  `date_entered` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `upgrade_history_md5_uk` (`md5sum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upgrade_history`
--

LOCK TABLES `upgrade_history` WRITE;
/*!40000 ALTER TABLE `upgrade_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `upgrade_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preferences` (
  `id` char(36) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` longtext,
  PRIMARY KEY (`id`),
  KEY `idx_userprefnamecat` (`assigned_user_id`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES ('277303bd-c3ac-223c-73fe-54ee0d29bbfc','ETag',0,'2015-02-25 18:01:04','2015-02-25 18:01:04','1','YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6MTt9'),('4280ac29-7c27-660d-691d-54ee0dae0251','Home',0,'2015-02-25 18:01:06','2015-02-25 18:01:06','1','YToyOntzOjg6ImRhc2hsZXRzIjthOjg6e3M6MzY6IjViMTE1YjZlLTg1MDItNTY2Yy01ZDNhLTU0ZWUwZGNlYmVlNyI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxMzoiaUZyYW1lRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NDoiSG9tZSI7czoxMToiZm9yY2VDb2x1bW4iO2k6MDtzOjEyOiJmaWxlTG9jYXRpb24iO3M6NTM6Im1vZHVsZXMvSG9tZS9EYXNobGV0cy9pRnJhbWVEYXNobGV0L2lGcmFtZURhc2hsZXQucGhwIjtzOjc6Im9wdGlvbnMiO2E6Mzp7czoxMDoidGl0bGVMYWJlbCI7czozMDoiTEJMX0RBU0hMRVRfRElTQ09WRVJfU1VHQVJfUFJPIjtzOjM6InVybCI7czo0MjoiaHR0cHM6Ly93d3cuc3VnYXJjcm0uY29tL2NybS9wcm9kdWN0L2dvcHJvIjtzOjY6ImhlaWdodCI7aTozMTU7fX1zOjM2OiI1YjEzYjhlZC1kNDI0LWZlMDEtZThiMy01NGVlMGRiMTk2MjMiO2E6NDp7czo5OiJjbGFzc05hbWUiO3M6MTY6IlN1Z2FyRmVlZERhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjk6IlN1Z2FyRmVlZCI7czoxMToiZm9yY2VDb2x1bW4iO2k6MTtzOjEyOiJmaWxlTG9jYXRpb24iO3M6NjQ6Im1vZHVsZXMvU3VnYXJGZWVkL0Rhc2hsZXRzL1N1Z2FyRmVlZERhc2hsZXQvU3VnYXJGZWVkRGFzaGxldC5waHAiO31zOjM2OiI1YjE0ZWI4MC04MDRjLTZhZmUtMDQzNi01NGVlMGQ5NzFlYzUiO2E6NTp7czo5OiJjbGFzc05hbWUiO3M6MTM6ImlGcmFtZURhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjQ6IkhvbWUiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjE7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjUzOiJtb2R1bGVzL0hvbWUvRGFzaGxldHMvaUZyYW1lRGFzaGxldC9pRnJhbWVEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjM6e3M6MTA6InRpdGxlTGFiZWwiO3M6MjI6IkxCTF9EQVNITEVUX1NVR0FSX05FV1MiO3M6MzoidXJsIjtzOjQxOiJodHRwczovL3d3dy5zdWdhcmNybS5jb20vY3JtL3Byb2R1Y3QvbmV3cyI7czo2OiJoZWlnaHQiO2k6MzE1O319czozNjoiOTJjNDQ1MjctMDhkNS1mODRiLWUyNjktNTRlZTBkYWMwZWZmIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUNhbGxzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiQ2FsbHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0NhbGxzL0Rhc2hsZXRzL015Q2FsbHNEYXNobGV0L015Q2FsbHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiOTlhNzg3NGQtMzcwYS1lMWMwLTYwZDUtNTRlZTBkNTk0NGY1IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeU1lZXRpbmdzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiTWVldGluZ3MiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL01lZXRpbmdzL0Rhc2hsZXRzL015TWVldGluZ3NEYXNobGV0L015TWVldGluZ3NEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiOWYzMWYzZDAtNjk4Mi01ZjQ1LTVjNjctNTRlZTBkMTZmMzhhIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjIyOiJNeU9wcG9ydHVuaXRpZXNEYXNobGV0IjtzOjY6Im1vZHVsZSI7czoxMzoiT3Bwb3J0dW5pdGllcyI7czoxMToiZm9yY2VDb2x1bW4iO2k6MDtzOjEyOiJmaWxlTG9jYXRpb24iO3M6ODA6Im1vZHVsZXMvT3Bwb3J0dW5pdGllcy9EYXNobGV0cy9NeU9wcG9ydHVuaXRpZXNEYXNobGV0L015T3Bwb3J0dW5pdGllc0Rhc2hsZXQucGhwIjtzOjc6Im9wdGlvbnMiO2E6MDp7fX1zOjM2OiJhNjNhNmUzYy03ZDZlLWQ4M2ItMWUxMy01NGVlMGQzODY0MmEiO2E6NTp7czo5OiJjbGFzc05hbWUiO3M6MTc6Ik15QWNjb3VudHNEYXNobGV0IjtzOjY6Im1vZHVsZSI7czo4OiJBY2NvdW50cyI7czoxMToiZm9yY2VDb2x1bW4iO2k6MDtzOjEyOiJmaWxlTG9jYXRpb24iO3M6NjU6Im1vZHVsZXMvQWNjb3VudHMvRGFzaGxldHMvTXlBY2NvdW50c0Rhc2hsZXQvTXlBY2NvdW50c0Rhc2hsZXQucGhwIjtzOjc6Im9wdGlvbnMiO2E6MDp7fX1zOjM2OiJhZTJhOWQxNy1kNzZmLWFiMjQtMjc2ZS01NGVlMGQxMDk0NjIiO2E6NTp7czo5OiJjbGFzc05hbWUiO3M6MTQ6Ik15TGVhZHNEYXNobGV0IjtzOjY6Im1vZHVsZSI7czo1OiJMZWFkcyI7czoxMToiZm9yY2VDb2x1bW4iO2k6MDtzOjEyOiJmaWxlTG9jYXRpb24iO3M6NTY6Im1vZHVsZXMvTGVhZHMvRGFzaGxldHMvTXlMZWFkc0Rhc2hsZXQvTXlMZWFkc0Rhc2hsZXQucGhwIjtzOjc6Im9wdGlvbnMiO2E6MDp7fX19czo1OiJwYWdlcyI7YToxOntpOjA7YTozOntzOjc6ImNvbHVtbnMiO2E6Mjp7aTowO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI2MCUiO3M6ODoiZGFzaGxldHMiO2E6Njp7aTowO3M6MzY6IjViMTE1YjZlLTg1MDItNTY2Yy01ZDNhLTU0ZWUwZGNlYmVlNyI7aToxO3M6MzY6IjkyYzQ0NTI3LTA4ZDUtZjg0Yi1lMjY5LTU0ZWUwZGFjMGVmZiI7aToyO3M6MzY6Ijk5YTc4NzRkLTM3MGEtZTFjMC02MGQ1LTU0ZWUwZDU5NDRmNSI7aTozO3M6MzY6IjlmMzFmM2QwLTY5ODItNWY0NS01YzY3LTU0ZWUwZDE2ZjM4YSI7aTo0O3M6MzY6ImE2M2E2ZTNjLTdkNmUtZDgzYi0xZTEzLTU0ZWUwZDM4NjQyYSI7aTo1O3M6MzY6ImFlMmE5ZDE3LWQ3NmYtYWIyNC0yNzZlLTU0ZWUwZDEwOTQ2MiI7fX1pOjE7YToyOntzOjU6IndpZHRoIjtzOjM6IjQwJSI7czo4OiJkYXNobGV0cyI7YToyOntpOjA7czozNjoiNWIxM2I4ZWQtZDQyNC1mZTAxLWU4YjMtNTRlZTBkYjE5NjIzIjtpOjE7czozNjoiNWIxNGViODAtODA0Yy02YWZlLTA0MzYtNTRlZTBkOTcxZWM1Ijt9fX1zOjEwOiJudW1Db2x1bW5zIjtzOjE6IjIiO3M6MTQ6InBhZ2VUaXRsZUxhYmVsIjtzOjIwOiJMQkxfSE9NRV9QQUdFXzFfTkFNRSI7fX19'),('44974d29-c6e7-0376-2332-54ee0decb9f5','Home2_CALL',0,'2015-02-25 18:01:06','2015-02-25 18:01:06','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('450be5f9-a471-58d8-f200-54ee0d13c576','Home2_MEETING',0,'2015-02-25 18:01:06','2015-02-25 18:01:06','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('45820501-0599-4d03-e6c9-54ee0d65cb09','Home2_OPPORTUNITY',0,'2015-02-25 18:01:06','2015-02-25 18:01:06','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('45dca7ed-4f70-c837-bed3-54ee0df00769','Home2_ACCOUNT',0,'2015-02-25 18:01:06','2015-02-25 18:01:06','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('462f6b98-a0ab-c0ca-f2eb-54ee0d7ec515','Home2_LEAD',0,'2015-02-25 18:01:06','2015-02-25 18:01:06','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('46b095d2-7f51-b865-aa43-54ee0d9f01c0','Home2_SUGARFEED',0,'2015-02-25 18:01:06','2015-02-25 18:01:06','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('d3653a97-346a-7516-3d65-54ee0ca2a730','global',0,'2015-02-25 17:57:13','2015-02-25 18:01:04','1','YToyNzp7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MzY6ImQzNGExNzQxLTdhMzYtMmRmNS0xOGMyLTU0ZWUwY2ZlNDkwMSI7czoxMDoidXNlcl90aGVtZSI7czo2OiJTdWdhcjUiO3M6MTM6InJlbWluZGVyX3RpbWUiO2k6MTgwMDtzOjEyOiJtYWlsbWVyZ2Vfb24iO3M6Mjoib24iO3M6ODoidGltZXpvbmUiO3M6MzoiVVRDIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjEzOiJzdWJwYW5lbF90YWJzIjtzOjA6IiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTk6ImVtYWlsX3JlbWluZGVyX3RpbWUiO2k6LTE7czoyOiJ1dCI7czoxOiIxIjtzOjg6ImN1cnJlbmN5IjtzOjM6Ii05OSI7czozNToiZGVmYXVsdF9jdXJyZW5jeV9zaWduaWZpY2FudF9kaWdpdHMiO3M6MToiMiI7czoxMToibnVtX2dycF9zZXAiO3M6MToiLCI7czo3OiJkZWNfc2VwIjtzOjE6Ii4iO3M6NToiZGF0ZWYiO3M6NToiZC9tL1kiO3M6NToidGltZWYiO3M6NToiaDppIEEiO3M6MjY6ImRlZmF1bHRfbG9jYWxlX25hbWVfZm9ybWF0IjtzOjM6ImYgbCI7czoxNDoidXNlX3JlYWxfbmFtZXMiO3M6Mjoib24iO3M6MTc6Im1haWxfc210cGF1dGhfcmVxIjtzOjA6IiI7czoxMjoibWFpbF9zbXRwc3NsIjtpOjA7czoxNzoiZW1haWxfc2hvd19jb3VudHMiO2k6MDtzOjE5OiJ0aGVtZV9jdXJyZW50X2dyb3VwIjtzOjM6IkFsbCI7fQ==');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `user_hash` varchar(255) DEFAULT NULL,
  `system_generated_password` tinyint(1) DEFAULT NULL,
  `pwd_last_changed` datetime DEFAULT NULL,
  `authenticate_id` varchar(100) DEFAULT NULL,
  `sugar_login` tinyint(1) DEFAULT '1',
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `external_auth_only` tinyint(1) DEFAULT '0',
  `receive_notifications` tinyint(1) DEFAULT '1',
  `description` text,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `phone_home` varchar(50) DEFAULT NULL,
  `phone_mobile` varchar(50) DEFAULT NULL,
  `phone_work` varchar(50) DEFAULT NULL,
  `phone_other` varchar(50) DEFAULT NULL,
  `phone_fax` varchar(50) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `address_street` varchar(150) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT NULL,
  `address_postalcode` varchar(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `portal_only` tinyint(1) DEFAULT '0',
  `show_on_employees` tinyint(1) DEFAULT '1',
  `employee_status` varchar(100) DEFAULT NULL,
  `messenger_id` varchar(100) DEFAULT NULL,
  `messenger_type` varchar(100) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `is_group` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_name` (`user_name`,`is_group`,`status`,`last_name`,`first_name`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1','admin','$6$bNxi/M58$SPw9s3vYXFkiLmpd2KJne5ad1gLPOIYCO0pjeCTzNwiurTj0Lv7a6xISTwAWczI5P7OhGW74xZWI.YGxu2oXL1',0,NULL,NULL,1,NULL,'Administrator',1,0,1,NULL,'2015-02-25 17:57:13','2015-02-25 18:01:04','1','','Administrator',NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,'',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_feeds`
--

DROP TABLE IF EXISTS `users_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_feeds` (
  `user_id` varchar(36) DEFAULT NULL,
  `feed_id` varchar(36) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_ud_user_id` (`user_id`,`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_feeds`
--

LOCK TABLES `users_feeds` WRITE;
/*!40000 ALTER TABLE `users_feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_last_import`
--

DROP TABLE IF EXISTS `users_last_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_last_import` (
  `id` char(36) NOT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `import_module` varchar(36) DEFAULT NULL,
  `bean_type` varchar(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_last_import`
--

LOCK TABLES `users_last_import` WRITE;
/*!40000 ALTER TABLE `users_last_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_last_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_password_link`
--

DROP TABLE IF EXISTS `users_password_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_password_link` (
  `id` char(36) NOT NULL,
  `username` varchar(36) DEFAULT NULL,
  `date_generated` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_password_link`
--

LOCK TABLES `users_password_link` WRITE;
/*!40000 ALTER TABLE `users_password_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_password_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_signatures`
--

DROP TABLE IF EXISTS `users_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_signatures` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `signature` text,
  `signature_html` text,
  PRIMARY KEY (`id`),
  KEY `idx_usersig_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_signatures`
--

LOCK TABLES `users_signatures` WRITE;
/*!40000 ALTER TABLE `users_signatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vcals`
--

DROP TABLE IF EXISTS `vcals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcals` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `idx_vcal` (`type`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vcals`
--

LOCK TABLES `vcals` WRITE;
/*!40000 ALTER TABLE `vcals` DISABLE KEYS */;
/*!40000 ALTER TABLE `vcals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_version` varchar(255) DEFAULT NULL,
  `db_version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_version` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES ('23711dc1-ec17-034f-7b3a-54ee0cb0fa70',0,'2015-02-25 17:57:13','2015-02-25 17:57:13','1','1','Chart Data Cache','3.5.1','3.5.1'),('2488462d-1de0-a355-97a4-54ee0ce138c4',0,'2015-02-25 17:57:13','2015-02-25 17:57:13','1','1','htaccess','3.5.1','3.5.1'),('24ca8994-f4fd-d1fc-bf79-54ee0ce1717e',0,'2015-02-25 17:57:13','2015-02-25 17:57:13','1','1','Rebuild Relationships','4.0.0','4.0.0'),('2501b1a0-aaf3-9a37-09c1-54ee0c3ea8c8',0,'2015-02-25 17:57:13','2015-02-25 17:57:13','1','1','Rebuild Extensions','4.0.0','4.0.0');
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-26 14:49:29
