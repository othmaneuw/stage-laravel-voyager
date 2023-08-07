-- MariaDB dump 10.19  Distrib 10.6.14-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: bitnami_myapp
-- ------------------------------------------------------
-- Server version	10.6.14-MariaDB

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
-- Table structure for table `appartements`
--

DROP TABLE IF EXISTS `appartements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appartements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `demandeur` varchar(255) NOT NULL,
  `appartement` varchar(255) NOT NULL,
  `jour_arrivee` date NOT NULL,
  `jour_depart` date NOT NULL,
  `etat_demande` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appartements`
--

LOCK TABLES `appartements` WRITE;
/*!40000 ALTER TABLE `appartements` DISABLE KEYS */;
/*!40000 ALTER TABLE `appartements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assurances`
--

DROP TABLE IF EXISTS `assurances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assurances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creation` date NOT NULL,
  `demandeur` varchar(255) NOT NULL,
  `beneficiaire` varchar(255) NOT NULL,
  `cabinet_assurance` varchar(255) DEFAULT NULL,
  `etat_demande` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assurances`
--

LOCK TABLES `assurances` WRITE;
/*!40000 ALTER TABLE `assurances` DISABLE KEYS */;
/*!40000 ALTER TABLE `assurances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,1,'Category 1','category-1','2023-07-20 10:18:01','2023-07-20 10:18:01'),(2,NULL,1,'Category 2','category-2','2023-07-20 10:18:01','2023-07-20 10:18:01');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,'{}',1),(2,1,'name','text','Name',1,1,1,1,1,1,'{}',2),(3,1,'email','text','Email',1,1,1,1,1,1,'{}',3),(4,1,'password','password','Password',1,0,0,1,1,0,'{}',4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,'{}',5),(6,1,'created_at','timestamp','Created At',0,1,1,0,0,1,'{}',6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,1,'{}',7),(8,1,'avatar','image','Photo',0,1,1,1,1,1,'{}',8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'settings','hidden','Settings',0,0,0,0,0,0,'{}',12),(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(21,1,'role_id','text','Role',0,1,1,1,1,1,'{}',9),(22,4,'id','number','ID',1,0,0,0,0,0,NULL,1),(23,4,'parent_id','select_dropdown','Parent',0,0,1,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),(24,4,'order','text','Order',1,1,1,1,1,1,'{\"default\":1}',3),(25,4,'name','text','Name',1,1,1,1,1,1,NULL,4),(26,4,'slug','text','Slug',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"name\"}}',5),(27,4,'created_at','timestamp','Created At',0,0,1,0,0,0,NULL,6),(28,4,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(29,5,'id','number','ID',1,0,0,0,0,0,NULL,1),(30,5,'author_id','text','Author',1,0,1,1,0,1,NULL,2),(31,5,'category_id','text','Category',1,0,1,1,1,0,NULL,3),(32,5,'title','text','Title',1,1,1,1,1,1,NULL,4),(33,5,'excerpt','text_area','Excerpt',1,0,1,1,1,1,NULL,5),(34,5,'body','rich_text_box','Body',1,0,1,1,1,1,NULL,6),(35,5,'image','image','Post Image',0,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',7),(36,5,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}',8),(37,5,'meta_description','text_area','Meta Description',1,0,1,1,1,1,NULL,9),(38,5,'meta_keywords','text_area','Meta Keywords',1,0,1,1,1,1,NULL,10),(39,5,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',11),(40,5,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,12),(41,5,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,13),(42,5,'seo_title','text','SEO Title',0,1,1,1,1,1,NULL,14),(43,5,'featured','checkbox','Featured',1,1,1,1,1,1,NULL,15),(44,6,'id','number','ID',1,0,0,0,0,0,NULL,1),(45,6,'author_id','text','Author',1,0,0,0,0,0,NULL,2),(46,6,'title','text','Title',1,1,1,1,1,1,NULL,3),(47,6,'excerpt','text_area','Excerpt',1,0,1,1,1,1,NULL,4),(48,6,'body','rich_text_box','Body',1,0,1,1,1,1,NULL,5),(49,6,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}',6),(50,6,'meta_description','text','Meta Description',1,0,1,1,1,1,NULL,7),(51,6,'meta_keywords','text','Meta Keywords',1,0,1,1,1,1,NULL,8),(52,6,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',9),(53,6,'created_at','timestamp','Created At',1,1,1,0,0,0,NULL,10),(54,6,'updated_at','timestamp','Updated At',1,0,0,0,0,0,NULL,11),(55,6,'image','image','Page Image',0,1,1,1,1,1,NULL,12),(56,1,'email_verified_at','timestamp','Email Verified At',0,1,1,1,1,1,'{}',6),(64,12,'id','text','Id',1,0,0,0,0,0,'{}',1),(65,12,'prestataire','text','Prestataire',1,1,1,1,1,1,'{}',2),(66,12,'demandeur','text','Demandeur',1,1,1,1,1,1,'{}',3),(67,12,'beneficiaire','text','Bénéficiaire',1,1,1,1,1,1,'{}',4),(68,12,'piece_jointe','file','Pièce Jointe',1,1,1,1,1,1,'{}',5),(69,12,'creation','date','Date de création',1,1,1,1,1,1,'{}',6),(70,12,'etat_prise_en_charge','text','Etat Prise En Charge',1,1,1,1,1,1,'{}',7),(71,12,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',8),(72,12,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',9),(73,12,'deleted_at','timestamp','Deleted At',0,1,1,1,1,1,'{}',10),(74,13,'id','text','Id',1,0,0,0,0,0,'{}',1),(75,13,'creation','date','Date',1,1,1,1,1,1,'{}',2),(76,13,'demandeur','text','Demandeur',1,1,1,1,1,1,'{}',3),(77,13,'beneficiaire','text','Bénéficiaire',1,1,1,1,1,1,'{}',4),(78,13,'cabinet_assurance','text','Cabinet d\'assurance',0,1,1,1,1,1,'{}',5),(79,13,'etat_demande','text','Etat Demande',1,1,1,1,1,1,'{}',6),(80,13,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',7),(81,13,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',8),(82,13,'deleted_at','timestamp','Deleted At',0,1,1,1,1,1,'{}',9),(83,15,'id','text','Id',1,0,0,0,0,0,'{}',1),(84,15,'demandeur','text','Demandeur',1,1,1,1,1,1,'{}',2),(85,15,'activite','select_dropdown','Activité',1,1,1,1,1,1,'{}',3),(86,15,'nombre','text','Nombre',1,1,1,1,1,1,'{}',4),(87,15,'etat_demande','text','Etat Demande',1,1,1,1,1,1,'{}',5),(88,15,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',6),(89,15,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',7),(90,15,'deleted_at','timestamp','Deleted At',0,1,1,1,1,1,'{}',8),(91,16,'id','text','Id',1,0,0,0,0,0,'{}',1),(92,16,'demandeur','text','Demandeur',1,1,1,1,1,1,'{}',2),(93,16,'type_logement','select_dropdown','Type Logement',0,1,1,1,1,1,'{}',3),(95,16,'destination','select_dropdown','Destination',0,1,1,1,1,1,'{}',5),(96,16,'jour_checkin','date','Date Check-in',1,1,1,1,1,1,'{}',6),(97,16,'jour_checkout','date','Date Check-out',1,1,1,1,1,1,'{}',7),(98,16,'etat_demande','text','Etat Demande',1,1,1,1,1,1,'{}',8),(99,16,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',9),(100,16,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',10),(101,16,'deleted_at','timestamp','Deleted At',0,1,1,1,1,1,'{}',11),(102,17,'id','text','Id',1,0,0,0,0,0,'{}',1),(103,17,'demandeur','text','Demandeur',1,1,1,1,1,1,'{}',2),(104,17,'appartement','select_dropdown','Appartement',1,1,1,1,1,1,'{}',3),(105,17,'jour_arrivee','date','Date d\'Arrivée',1,1,1,1,1,1,'{}',4),(106,17,'jour_depart','date','Date de Départ',1,1,1,1,1,1,'{}',5),(107,17,'etat_demande','text','Etat Demande',1,1,1,1,1,1,'{}',6),(108,17,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',7),(109,17,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',8),(110,17,'deleted_at','timestamp','Deleted At',0,1,1,1,1,1,'{}',9),(111,20,'id','text','Id',1,0,0,0,0,0,'{}',1),(112,20,'montant','text','Montant',1,1,1,1,1,1,'{}',2),(113,20,'activite','select_dropdown','Activité',1,1,1,1,1,1,'{}',3),(114,20,'facture','file','Facture',1,1,1,1,1,1,'{}',4),(115,20,'demandeur','text','Demandeur',1,1,1,1,1,1,'{}',5),(116,20,'statut','select_dropdown','Statut',1,1,1,1,1,1,'{}',6),(117,20,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',7),(118,20,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',8),(119,20,'deleted_at','timestamp','Deleted At',0,1,1,1,1,1,'{}',9),(120,23,'id','text','Id',1,0,0,0,0,0,'{}',1),(121,23,'montant','text','Montant',1,1,1,1,1,1,'{}',2),(122,23,'periodicite','select_dropdown','Periodicité',1,1,1,1,1,1,'{}',3),(123,23,'precision','text','Précision',1,1,1,1,1,1,'{}',4),(124,23,'facture','file','Facture',1,1,1,1,1,1,'{}',5),(125,23,'demandeur','text','Demandeur',1,1,1,1,1,1,'{}',6),(126,23,'statut','select_dropdown','Statut',1,1,1,1,1,1,'{}',7),(127,23,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',8),(128,23,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',9),(129,23,'deleted_at','timestamp','Deleted At',0,1,1,1,1,1,'{}',10),(130,24,'id','text','Id',1,0,0,0,0,0,'{}',1),(131,24,'reglement','text','Réglément',1,1,1,1,1,1,'{}',2),(132,24,'num_fact','file','Numéro de Facture',1,1,1,1,1,1,'{}',3),(133,24,'dt_facturation','date','Date de Facturation',1,1,1,1,1,1,'{}',4),(134,24,'monatnt','text','Monatnt',1,1,1,1,1,1,'{}',5),(135,24,'piece_jointe','file','Pièce Jointe',1,1,1,1,1,1,'{}',6),(136,24,'etablissement','select_dropdown','Etablissement',1,1,1,1,1,1,'{}',7),(137,24,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',8),(138,24,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',9),(139,24,'deleted_at','timestamp','Deleted At',0,1,1,1,1,1,'{}',10),(140,25,'id','text','Id',1,0,0,0,0,0,'{}',1),(141,25,'activite','select_dropdown','Activité',1,1,1,1,1,1,'{}',2),(142,25,'num_fact','file','Numéro de Facture',1,1,1,1,1,1,'{}',3),(143,25,'deamandeur','text','Deamandeur',1,1,1,1,1,1,'{}',4),(144,25,'dt_facturation','text','Date de Facturation',1,1,1,1,1,1,'{}',5),(145,25,'dt_reglement','date','Date de Réglément',1,1,1,1,1,1,'{}',6),(146,25,'monatnt','text','Monatnt',1,1,1,1,1,1,'{}',7),(147,25,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',8),(148,25,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',9),(149,25,'deleted_at','timestamp','Deleted At',0,1,1,1,1,1,'{}',10),(150,26,'id','text','Id',1,0,0,0,0,0,'{}',1),(151,26,'etablissement','select_dropdown','Etablissement',1,1,1,1,1,1,'{}',2),(152,26,'dt_fact','date','Date de Facturation',1,1,1,1,1,1,'{}',3),(153,26,'reglement','date','Date de Réglement',1,1,1,1,1,1,'{}',4),(154,26,'montant','text','Montant',1,1,1,1,1,1,'{}',5),(155,26,'num_fact','file','Numéro de Facture',1,1,1,1,1,1,'{}',6),(156,26,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',7),(157,26,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',8),(158,26,'deleted_at','timestamp','Deleted At',0,1,1,1,1,1,'{}',9),(159,28,'id','text','Id',1,0,0,0,0,0,'{}',1),(160,28,'ville','text','Ville',1,1,1,1,1,1,'{}',3),(161,28,'adresse','text','Adresse',1,1,1,1,1,1,'{}',4),(162,28,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',5),(163,28,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),(164,28,'deleted_at','timestamp','Deleted At',0,1,1,1,1,1,'{}',7),(165,28,'nom','text','Nom',1,1,1,1,1,1,'{}',2),(166,29,'id','text','Id',1,0,0,0,0,0,'{}',1),(167,29,'nom','text','Nom',1,1,1,1,1,1,'{}',2),(168,29,'adresse','text','Adresse',1,1,1,1,1,1,'{}',3),(169,29,'telephone','text','Telephone',1,1,1,1,1,1,'{}',4),(170,29,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',5),(171,29,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),(172,29,'deleted_at','timestamp','Deleted At',0,1,1,1,1,1,'{}',7),(173,31,'id','text','Id',1,0,0,0,0,0,'{}',1),(174,31,'nom','text','Nom',1,1,1,1,1,1,'{}',2),(175,31,'adresse','text','Adresse',1,1,1,1,1,1,'{}',3),(176,31,'telephone','text','Telephone',1,1,1,1,1,1,'{}',5),(177,31,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',6),(178,31,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',7),(179,31,'deleted_at','timestamp','Deleted At',0,1,1,1,1,1,'{}',8),(180,31,'ville','text','Ville',1,1,1,1,1,1,'{}',4),(181,32,'id','text','Id',1,0,0,0,0,0,'{}',1),(182,32,'nom','text','Nom',1,1,1,1,1,1,'{}',2),(183,32,'specialite','text','Spécialité',1,1,1,1,1,1,'{}',3),(184,32,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',4),(185,32,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',5),(186,32,'deleted_at','timestamp','Deleted At',0,1,1,1,1,1,'{}',6),(187,33,'id','text','Id',1,0,0,0,0,0,'{}',1),(188,33,'nom','text','Nom',1,1,1,1,1,1,'{}',2),(189,33,'adresse','text','Adresse',1,1,1,1,1,1,'{}',3),(190,33,'ville','text','Ville',1,1,1,1,1,1,'{}',4),(191,33,'telephone','text','Telephone',1,1,1,1,1,1,'{}',5),(192,33,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',6),(193,33,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',7),(194,33,'deleted_at','timestamp','Deleted At',0,1,1,1,1,1,'{}',8),(195,34,'id','text','Id',1,0,0,0,0,0,'{}',1),(196,34,'nom','text','Nom',1,1,1,1,1,1,'{}',2),(197,34,'adresse','text','Adresse',1,1,1,1,1,1,'{}',5),(198,34,'telephone','text','Telephone',1,1,1,1,1,1,'{}',6),(199,34,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',7),(200,34,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',8),(201,34,'deleted_at','timestamp','Deleted At',0,1,1,1,1,1,'{}',9),(202,34,'ville','text','Ville',1,1,1,1,1,1,'{}',4),(203,35,'id','text','Id',1,0,0,0,0,0,'{}',1),(204,35,'assurance','select_dropdown','Assurance',1,1,1,1,1,1,'{}',2),(205,35,'souscription_demande','text','Souscription Demandé',1,1,1,1,1,1,'{}',3),(206,35,'reglemnet','text','Réglément',1,1,1,1,1,1,'{}',4),(207,35,'num_facture','text','Numéro de Facture',1,1,1,1,1,1,'{}',5),(208,35,'dt_fact','date','Date de Facturation',1,1,1,1,1,1,'{}',6),(209,35,'montant_a_regle','text','Montant à Réglé',1,1,1,1,1,1,'{}',7),(210,35,'piece_jointe','file','Pièce Jointe',1,1,1,1,1,1,'{}',8),(211,35,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',9),(212,35,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',10),(213,35,'deleted_at','timestamp','Deleted At',0,1,1,1,1,1,'{}',11),(214,36,'id','text','Id',1,0,0,0,0,0,'{}',1),(215,36,'montant','text','Montant',1,1,1,1,1,1,'{}',2),(216,36,'periodicite','select_dropdown','Periodicité',1,1,1,1,1,1,'{}',3),(217,36,'statut','select_dropdown','Statut',1,1,1,1,1,1,'{}',4),(218,36,'facturation','file','Facturation',1,1,1,1,1,1,'{}',5),(219,36,'demandeur','text','Demandeur',1,1,1,1,1,1,'{}',6),(220,36,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',7),(221,36,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',8),(222,36,'deleted_at','timestamp','Deleted At',0,1,1,1,1,1,'{}',9),(223,37,'id','text','Id',1,0,0,0,0,0,'{}',1),(224,37,'montant','text','Montant',1,1,1,1,1,1,'{}',2),(225,37,'periodicite','text','Periodicité',1,1,1,1,1,1,'{}',3),(226,37,'facture','text','Facture',1,1,1,1,1,1,'{}',4),(227,37,'demandeur','text','Demandeur',1,1,1,1,1,1,'{}',5),(228,37,'precision','text','Précision',1,1,1,1,1,1,'{}',6),(229,37,'statut','text','Statut',1,1,1,1,1,1,'{}',7),(230,37,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',8),(231,37,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',9),(232,37,'deleted_at','timestamp','Deleted At',0,1,1,1,1,1,'{}',10),(233,41,'id','text','Id',1,0,0,0,0,0,'{}',1),(234,41,'montant','text','Montant',1,1,1,1,1,1,'{}',2),(235,41,'periodicite','select_dropdown','Periodicité',1,1,1,1,1,1,'{}',3),(236,41,'facture','file','Facture',1,1,1,1,1,1,'{}',4),(237,41,'demandeur','text','Demandeur',1,1,1,1,1,1,'{}',5),(238,41,'precision','text','Précision',1,1,1,1,1,1,'{}',6),(239,41,'statut','select_dropdown','Statut',1,1,1,1,1,1,'{}',7),(240,41,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',8),(241,41,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',9),(242,41,'deleted_at','timestamp','Deleted At',0,1,1,1,1,1,'{}',10),(243,34,'specialite','select_dropdown','Spécialité',1,1,1,1,1,1,'{}',3),(244,42,'id','text','Id',1,0,0,0,0,0,'{}',1),(245,42,'nom','text','Nom',1,1,1,1,1,1,'{}',2),(246,42,'file','file','Fichier',1,1,1,1,1,1,'{}',3),(247,42,'description','text','Description',1,1,1,1,1,1,'{}',4),(248,42,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',5),(249,42,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),(250,42,'deleted_at','timestamp','Deleted At',0,1,1,1,1,1,'{}',7),(251,43,'id','text','Id',1,0,0,0,0,0,'{}',1),(252,43,'creation','date','Date de création',1,1,1,1,1,1,'{}',2),(253,43,'demandeur','text','Demandeur',1,1,1,1,1,1,'{}',3),(254,43,'etat_demande','text','Etat de Demande',1,1,1,1,1,1,'{}',4),(255,43,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',5),(256,43,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),(257,43,'deleted_at','timestamp','Deleted At',0,1,1,1,1,1,'{}',7),(258,44,'id','text','Id',1,0,0,0,0,0,'{}',1),(259,44,'nom','text','Nom',1,1,1,1,1,1,'{}',2),(260,44,'type','select_dropdown','Type',1,1,1,1,1,1,'{}',3),(261,44,'prix','text','Prix',1,1,1,1,1,1,'{}',4),(262,44,'etab','select_dropdown','Etablissement',1,1,1,1,1,1,'{}',5),(263,44,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',6),(264,44,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',7),(265,44,'deleted_at','timestamp','Deleted At',0,1,1,1,1,1,'{}',8);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `display_name_singular` varchar(255) NOT NULL,
  `display_name_plural` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `policy_name` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','Adhérent','Adhérents','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController',NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}','2023-07-20 10:17:57','2023-08-01 08:56:59'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2023-07-20 10:17:57','2023-07-20 10:17:57'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController','',1,0,NULL,'2023-07-20 10:17:57','2023-07-20 10:17:57'),(4,'categories','categories','Category','Categories','voyager-categories','TCG\\Voyager\\Models\\Category',NULL,'','',1,0,NULL,'2023-07-20 10:18:01','2023-07-20 10:18:01'),(5,'posts','posts','Post','Posts','voyager-news','TCG\\Voyager\\Models\\Post','TCG\\Voyager\\Policies\\PostPolicy','','',1,0,NULL,'2023-07-20 10:18:01','2023-07-20 10:18:01'),(6,'pages','pages','Page','Pages','voyager-file-text','TCG\\Voyager\\Models\\Page',NULL,'','',1,0,NULL,'2023-07-20 10:18:01','2023-07-20 10:18:01'),(12,'prises_medicales','prises-medicales','Prise en charge Médicale','Prises en charge Médicales','voyager-activity','App\\PrisesMedicale',NULL,NULL,NULL,1,1,'{\"order_column\":\"creation\",\"order_display_column\":\"creation\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2023-08-02 08:50:08','2023-08-04 09:59:53'),(13,'assurances','assurances','Souscription Assurance Auto','Souscriptions Assurance Auto','voyager-receipt','App\\Assurance',NULL,NULL,NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2023-08-02 09:16:24','2023-08-04 10:33:36'),(14,'rdv_medecin_travail','rdv-medecin-travail','RDV Médecin de Travail','RDV Médecin de Travail','voyager-calendar','App\\RdvMedecinTravail',NULL,NULL,NULL,1,1,'{\"order_column\":\"creation\",\"order_display_column\":\"creation\",\"order_direction\":\"asc\",\"default_search_key\":\"creation\"}','2023-08-02 09:20:52','2023-08-02 09:20:52'),(15,'loisirs','loisirs','Loisir','Loisirs','voyager-ticket','App\\Loisir',NULL,NULL,NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2023-08-02 09:27:19','2023-08-04 19:47:52'),(16,'hotels','hotels','Hotel','Hotels','voyager-company','App\\Hotel',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2023-08-02 09:32:49','2023-08-04 19:53:02'),(17,'appartements','appartements','Appartement','Appartements','voyager-backpack','App\\Appartement',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2023-08-02 09:37:09','2023-08-04 19:57:19'),(18,'rbm_assurance_auto','rbm-assurance-auto','Assurance Auto','Assurance Auto','voyager-receipt','App\\RbmAssuranceAuto',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2023-08-02 13:27:31','2023-08-02 13:27:31'),(19,'rbm_medicaux','rbm-medicaux','Médical','Médicaux','voyager-activity','App\\RbmMedicaux',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2023-08-02 13:29:25','2023-08-02 13:41:38'),(20,'rbm_loisirs','rbm-loisirs','Loisir','Loisirs','voyager-ticket','App\\RbmLoisir',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2023-08-02 13:33:04','2023-08-04 20:44:59'),(23,'rbm_estivages','rbm-estivages','Estivage','Estivages','voyager-paper-plane','App\\RbmEstivage',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2023-08-02 14:23:01','2023-08-02 14:23:01'),(24,'fact_medicales','fact-medicales','Médicale','Médicales','voyager-activity','App\\FactMedicale',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2023-08-02 14:45:14','2023-08-02 14:45:14'),(25,'fact_loisirs','fact-loisirs','Loisir','Loisirs','voyager-ticket','App\\FactLoisir',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2023-08-02 14:48:10','2023-08-02 14:48:10'),(26,'fact_estivages','fact-estivages','Estivage','Estivages','voyager-paper-plane','App\\FactEstivage',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2023-08-02 15:07:14','2023-08-02 15:07:14'),(27,'fact_assurance_auto','fact-assurance-auto','Assurance Auto','Assurance Auto','voyager-dashboard','App\\FactAssuranceAuto',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2023-08-02 17:53:19','2023-08-02 17:53:19'),(28,'ref_appartements','ref-appartements','Appartement','Appartements','voyager-backpack','App\\RefAppartement',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2023-08-02 18:44:12','2023-08-02 18:47:05'),(29,'ref_assuarnces','ref-assuarnces','Assuarnce Auto','Assuarnces Auto','voyager-dashboard','App\\RefAssuarnce',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2023-08-02 18:49:19','2023-08-02 18:49:19'),(30,'ref_etab_medicaux','ref-etab-medicaux','Etablissement Médical','Etablissements Médicaux','voyager-activity','App\\RefEtabMedicaux',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2023-08-02 18:52:30','2023-08-02 18:52:30'),(31,'ref_loisirs','ref-loisirs','Loisir','Loisirs','voyager-ticket','App\\RefLoisir',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2023-08-02 19:04:43','2023-08-02 19:04:43'),(32,'ref_specialites','ref-specialites','Spécialité Médicale','Spécialités Médicales','voyager-leaf','App\\RefSpecialite',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2023-08-02 19:18:26','2023-08-02 19:18:26'),(33,'ref_hotels','ref-hotels','Hotel','Hotels','voyager-company','App\\RefHotel',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2023-08-02 19:29:50','2023-08-02 19:29:50'),(34,'ref_etab_medicauxes','ref-etab-medicauxes','Etablissement Medical','Etablissements Medicaux','voyager-activity','App\\RefEtabMedicaux',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2023-08-03 08:25:32','2023-08-04 21:04:28'),(35,'fact_assurance_autos','fact-assurance-autos','Assurance Auto','Assurances Auto','voyager-dashboard','App\\FactAssuranceAuto',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2023-08-03 08:26:39','2023-08-04 20:08:33'),(36,'rbm_assurance_autos','rbm-assurance-autos','Assurance Auto','Assurances Auto','voyager-dashboard','App\\RbmAssuranceAuto',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2023-08-03 08:29:02','2023-08-04 20:34:16'),(37,'rbm_medicauxes','rbm-medicauxes','Medical','Medicaux','voyager-activity','App\\RbmMedicaux',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2023-08-03 08:37:42','2023-08-03 08:37:42'),(41,'rbm_medicales','rbm-medicales','Rbm Medicale','Rbm Medicales','voyager-activity','App\\RbmMedicale',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2023-08-03 08:48:23','2023-08-04 20:29:04'),(42,'documentations','documentations','Documentation','Documentations','voyager-documentation','App\\Documentation',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2023-08-03 13:50:40','2023-08-03 13:50:40'),(43,'rdv_medecin_travails','rdv-medecin-travails','RDV Médecin Travail','RDV Médecin Travail','voyager-calendar','App\\RdvMedecinTravail',NULL,NULL,NULL,1,1,'{\"order_column\":\"creation\",\"order_display_column\":\"creation\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2023-08-04 09:34:30','2023-08-04 10:34:56'),(44,'ref_activites','ref-activites','Activité','Activités','voyager-fire','App\\RefActivite',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2023-08-04 09:37:13','2023-08-05 09:45:42');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentations`
--

DROP TABLE IF EXISTS `documentations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentations`
--

LOCK TABLES `documentations` WRITE;
/*!40000 ALTER TABLE `documentations` DISABLE KEYS */;
INSERT INTO `documentations` VALUES (2,'menus','[{\"download_link\":\"documentations\\/August2023\\/KWNB92rJzglHZbXpGWfe.png\",\"original_name\":\"image_2023-08-04_105437067.png\"}]','menu voyager','2023-08-04 09:55:15','2023-08-04 09:55:15',NULL);
/*!40000 ALTER TABLE `documentations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_assurance_autos`
--

DROP TABLE IF EXISTS `fact_assurance_autos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fact_assurance_autos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `assurance` varchar(255) NOT NULL,
  `souscription_demande` varchar(255) NOT NULL,
  `reglemnet` date NOT NULL,
  `num_facture` mediumint(9) NOT NULL,
  `dt_fact` date NOT NULL,
  `montant_a_regle` double NOT NULL,
  `piece_jointe` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_assurance_autos`
--

LOCK TABLES `fact_assurance_autos` WRITE;
/*!40000 ALTER TABLE `fact_assurance_autos` DISABLE KEYS */;
/*!40000 ALTER TABLE `fact_assurance_autos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_estivages`
--

DROP TABLE IF EXISTS `fact_estivages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fact_estivages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `etablissement` varchar(255) NOT NULL,
  `dt_fact` date NOT NULL,
  `reglement` date NOT NULL,
  `montant` double NOT NULL,
  `num_fact` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_estivages`
--

LOCK TABLES `fact_estivages` WRITE;
/*!40000 ALTER TABLE `fact_estivages` DISABLE KEYS */;
/*!40000 ALTER TABLE `fact_estivages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_loisirs`
--

DROP TABLE IF EXISTS `fact_loisirs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fact_loisirs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activite` varchar(255) NOT NULL,
  `num_fact` varchar(255) NOT NULL,
  `deamandeur` varchar(255) NOT NULL,
  `dt_facturation` date NOT NULL,
  `dt_reglement` date NOT NULL,
  `monatnt` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_loisirs`
--

LOCK TABLES `fact_loisirs` WRITE;
/*!40000 ALTER TABLE `fact_loisirs` DISABLE KEYS */;
/*!40000 ALTER TABLE `fact_loisirs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_medicales`
--

DROP TABLE IF EXISTS `fact_medicales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fact_medicales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reglement` date NOT NULL,
  `num_fact` mediumint(9) NOT NULL,
  `dt_facturation` date NOT NULL,
  `monatnt` double NOT NULL,
  `piece_jointe` varchar(255) NOT NULL,
  `etablissement` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_medicales`
--

LOCK TABLES `fact_medicales` WRITE;
/*!40000 ALTER TABLE `fact_medicales` DISABLE KEYS */;
/*!40000 ALTER TABLE `fact_medicales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `demandeur` varchar(255) NOT NULL,
  `type_logement` varchar(255) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `jour_checkin` date NOT NULL,
  `jour_checkout` date NOT NULL,
  `etat_demande` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES (1,'test','test','test','2023-08-04','2023-08-11','test','2023-08-04 10:40:03','2023-08-04 10:40:03',NULL);
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loisirs`
--

DROP TABLE IF EXISTS `loisirs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loisirs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `demandeur` varchar(255) NOT NULL,
  `activite` varchar(255) NOT NULL,
  `nombre` smallint(6) NOT NULL,
  `etat_demande` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loisirs`
--

LOCK TABLES `loisirs` WRITE;
/*!40000 ALTER TABLE `loisirs` DISABLE KEYS */;
/*!40000 ALTER TABLE `loisirs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `parameters` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2023-07-20 10:17:58','2023-07-20 10:17:58','voyager.dashboard',NULL),(3,1,'Adhérents','','_self','voyager-person','#000000',NULL,3,'2023-07-20 10:17:58','2023-07-20 10:36:19','voyager.users.index','null'),(4,1,'Roles','','_self','voyager-lock',NULL,NULL,2,'2023-07-20 10:17:58','2023-07-20 10:17:58','voyager.roles.index',NULL),(5,1,'Tools','','_self','voyager-tools',NULL,NULL,9,'2023-07-20 10:17:58','2023-07-21 13:34:37',NULL,NULL),(6,1,'Menu Builder','','_self','voyager-list',NULL,5,1,'2023-07-20 10:17:58','2023-07-20 11:02:31','voyager.menus.index',NULL),(7,1,'Database','','_self','voyager-data',NULL,5,2,'2023-07-20 10:17:58','2023-07-20 11:02:31','voyager.database.index',NULL),(8,1,'Compass','','_self','voyager-compass',NULL,5,3,'2023-07-20 10:17:58','2023-07-20 11:02:31','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,4,'2023-07-20 10:17:58','2023-07-20 11:02:31','voyager.bread.index',NULL),(10,1,'Settings','','_self','voyager-settings',NULL,NULL,10,'2023-07-20 10:17:58','2023-07-21 13:34:37','voyager.settings.index',NULL),(15,1,'Suivi des Demandes','','_self','voyager-file-text','#000000',NULL,5,'2023-07-20 10:52:24','2023-08-03 13:55:08',NULL,''),(21,1,'Hotels','/admin/hotels','_self','voyager-company','#000000',20,1,'2023-07-20 11:06:12','2023-07-20 11:11:06',NULL,''),(22,1,'Appartements','/admin/appartement','_self','voyager-backpack','#000000',20,2,'2023-07-20 11:08:17','2023-07-20 11:11:37',NULL,''),(23,1,'Facturations','','_self','voyager-receipt','#000000',NULL,6,'2023-07-20 11:17:35','2023-08-03 13:54:58',NULL,''),(29,1,'Remboursements','','_self','voyager-dollar','#000000',NULL,7,'2023-07-20 13:20:28','2023-08-03 13:54:58',NULL,''),(34,1,'Référentiel','','_self','voyager-book-download','#000000',NULL,8,'2023-07-20 13:31:19','2023-08-03 13:54:47',NULL,''),(41,2,'Dashboard','','_self','voyager-boat','#000000',NULL,1,'2023-07-20 14:13:00','2023-07-20 14:24:50','voyager.dashboard','null'),(42,2,'Adhérents','','_self','voyager-person','#000000',NULL,2,'2023-07-20 14:15:03','2023-07-20 14:24:50','voyager.users.index','null'),(43,2,'Suivi des Demandes','','_self','voyager-file-text','#000000',NULL,4,'2023-07-20 14:19:11','2023-07-20 14:25:50',NULL,''),(44,2,'Documentations','','_self','voyager-documentation','#000000',NULL,3,'2023-07-20 14:23:54','2023-08-03 14:02:44','voyager.documentations.index','null'),(45,2,'Prises en Charge Médicales','','_self','voyager-activity','#000000',43,1,'2023-07-20 14:26:20','2023-08-03 14:05:23','voyager.prises-medicales.index','null'),(46,2,'Souscriptions Assurance Auto','','_self','voyager-receipt','#000000',43,2,'2023-07-20 14:30:33','2023-08-03 14:06:59','voyager.assurances.index','null'),(47,2,'RDV Médecin de Travail','/admin/rdvmedcintravail','_self','voyager-calendar','#000000',43,3,'2023-07-20 14:32:14','2023-07-20 14:32:59',NULL,''),(48,2,'Loisirs','','_self','voyager-ticket','#000000',43,4,'2023-07-20 14:33:58','2023-08-03 14:08:03','voyager.loisirs.index','null'),(50,2,'Hotels','','_self','voyager-company','#000000',43,5,'2023-07-20 14:37:51','2023-08-03 14:09:29','voyager.hotels.index','null'),(51,2,'Appartements','','_self','voyager-backpack','#000000',43,6,'2023-07-20 14:39:41','2023-08-03 14:10:35','voyager.appartements.index','null'),(52,2,'Fcaturations','','_self','voyager-receipt','#000000',NULL,5,'2023-07-20 14:46:15','2023-07-20 14:51:05',NULL,''),(53,2,'Médicales','','_self','voyager-activity','#000000',52,1,'2023-07-20 14:49:34','2023-08-03 14:11:45','voyager.fact-medicales.index','null'),(54,2,'Assurance Auto','','_self','voyager-dashboard','#000000',52,2,'2023-07-20 14:52:08','2023-08-03 14:13:10','voyager.fact-assurance-autos.index','null'),(55,2,'Estivage','','_self','voyager-paper-plane','#000000',52,3,'2023-07-20 14:53:47','2023-08-03 14:15:20','voyager.fact-estivages.index','null'),(56,2,'Loisirs','','_self','voyager-ticket','#000000',52,4,'2023-07-20 14:55:51','2023-08-03 14:14:09','voyager.fact-loisirs.index','null'),(57,2,'Remboursements','','_self','voyager-dollar','#000000',NULL,6,'2023-07-20 15:00:43','2023-07-20 15:03:40',NULL,''),(58,2,'Médicaux','','_self','voyager-activity','#000000',57,1,'2023-07-20 15:02:35','2023-08-03 14:16:36','voyager.rbm-medicales.index','null'),(59,2,'Assurance Auto','','_self','voyager-dashboard','#000000',57,2,'2023-07-20 15:04:38','2023-08-03 14:18:40','voyager.rbm-assurance-autos.index','null'),(60,2,'Estivage','','_self','voyager-paper-plane','#000000',57,3,'2023-07-20 15:06:53','2023-08-03 14:19:42','voyager.rbm-estivages.index','null'),(61,2,'Loisirs','','_self','voyager-ticket','#000000',57,4,'2023-07-20 15:11:25','2023-08-03 14:20:56','voyager.rbm-loisirs.index','null'),(62,3,'Dashboard','','_self','voyager-boat','#000000',NULL,1,'2023-07-20 15:17:02','2023-07-21 08:13:06','voyager.dashboard','null'),(63,3,'Roles','','_self','voyager-lock','#000000',NULL,2,'2023-07-21 07:55:02','2023-07-21 08:13:06','voyager.roles.index','null'),(64,3,'Adhérents','','_self','voyager-person','#000000',NULL,3,'2023-07-21 07:56:17','2023-07-21 08:13:06','voyager.users.index','null'),(65,3,'Documentations','','_self','voyager-documentation','#000000',NULL,4,'2023-07-21 07:59:42','2023-08-03 14:02:08','voyager.documentations.index','null'),(66,3,'Suivi des Demandes','','_self','voyager-file-text','#000000',NULL,5,'2023-07-21 08:01:35','2023-07-21 08:13:06',NULL,''),(67,3,'Prises en Charge Médicales','','_self','voyager-activity','#000000',66,1,'2023-07-21 08:02:26','2023-08-02 19:35:46','voyager.prises-medicales.index','null'),(68,3,'Souscriptions Assurance Auto','','_self','voyager-receipt','#000000',66,2,'2023-07-21 08:03:10','2023-08-02 19:38:18','voyager.assurances.index','null'),(69,3,'RDV Médecin de Travail','','_self','voyager-calendar','#000000',66,3,'2023-07-21 08:03:49','2023-08-02 19:39:28','voyager.rdv-medecin-travail.index','null'),(70,3,'Loisirs','','_self','voyager-ticket','#000000',66,4,'2023-07-21 08:04:38','2023-08-02 19:41:57','voyager.loisirs.index','null'),(72,3,'Hotels','','_self','voyager-company','#000000',66,5,'2023-07-21 08:07:06','2023-08-02 19:44:41','voyager.hotels.index','null'),(73,3,'Appartements','','_self','voyager-backpack','#000000',66,6,'2023-07-21 08:08:03','2023-08-02 19:49:58','voyager.appartements.index','null'),(74,3,'Facturations','','_self','voyager-receipt','#000000',NULL,6,'2023-07-21 08:08:48','2023-07-21 08:13:32',NULL,''),(75,3,'Médicales','','_self','voyager-activity','#000000',74,1,'2023-07-21 08:09:31','2023-08-02 19:54:52','voyager.fact-medicales.index','null'),(76,3,'Assurance Auto','','_self','voyager-dashboard','#000000',74,2,'2023-07-21 08:10:27','2023-08-03 09:03:55','voyager.fact-assurance-autos.index','null'),(77,3,'Estivage','','_self','voyager-paper-plane','#000000',74,3,'2023-07-21 08:11:35','2023-08-02 20:02:38','voyager.fact-estivages.index','null'),(78,3,'Loisirs','','_self','voyager-ticket','#000000',74,4,'2023-07-21 08:12:50','2023-08-02 20:06:00','voyager.fact-loisirs.index','null'),(79,3,'Remboursements','','_self','voyager-dollar','#000000',NULL,7,'2023-07-21 08:14:04','2023-07-21 08:18:19',NULL,''),(80,3,'Médicaux','','_self','voyager-activity','#000000',79,1,'2023-07-21 08:14:48','2023-08-03 09:05:12','voyager.rbm-medicales.index','null'),(81,3,'Assurance Auto','','_self','voyager-dashboard','#000000',79,2,'2023-07-21 08:16:00','2023-08-03 09:06:14','voyager.rbm-assurance-autos.index','null'),(82,3,'Estivage','','_self','voyager-paper-plane','#000000',79,3,'2023-07-21 08:17:17','2023-08-03 09:07:26','voyager.rbm-estivages.index','null'),(83,3,'Loisirs','','_self','voyager-ticket','#000000',79,4,'2023-07-21 08:17:59','2023-08-03 09:08:40','voyager.rbm-loisirs.index','null'),(84,3,'Référentiel','','_self','voyager-book-download','#000000',NULL,8,'2023-07-21 08:18:52','2023-07-21 08:25:40',NULL,''),(85,3,'Assurances Auto','','_self','voyager-receipt','#000000',84,3,'2023-07-21 08:19:37','2023-08-03 09:20:16','voyager.ref-assuarnces.index','null'),(86,3,'Activités','/admin/ref_activites','_self','voyager-ticket','#000000',84,4,'2023-07-21 08:21:20','2023-08-03 09:10:04',NULL,''),(87,3,'Spécialités Médicales','','_self','voyager-leaf','#000000',84,1,'2023-07-21 08:22:15','2023-08-03 09:10:41','voyager.ref-specialites.index','null'),(88,3,'Etablissement de Loisirs','','_self','voyager-barbeque','#000000',84,5,'2023-07-21 08:23:13','2023-08-03 09:21:32','voyager.ref-loisirs.index','null'),(89,3,'Etablissements Médicaux','','_self','voyager-company','#000000',84,2,'2023-07-21 08:24:36','2023-08-03 09:18:49','voyager.ref-etab-medicauxes.index','null'),(90,3,'Appartements','','_self','voyager-backpack','#000000',84,6,'2023-07-21 08:25:22','2023-08-03 09:22:46','voyager.ref-appartements.index','null'),(97,1,'Prises en charge Médicales','','_self','voyager-activity',NULL,15,1,'2023-08-02 08:50:10','2023-08-02 09:08:12','voyager.prises-medicales.index',NULL),(98,1,'Souscriptions Assurance Auto','','_self','voyager-receipt','#000000',15,2,'2023-08-02 09:16:25','2023-08-02 13:44:00','voyager.assurances.index','null'),(100,1,'Loisirs','','_self','voyager-ticket',NULL,15,4,'2023-08-02 09:27:20','2023-08-04 09:47:52','voyager.loisirs.index',NULL),(101,1,'Hotels','','_self','voyager-company',NULL,15,5,'2023-08-02 09:32:50','2023-08-04 09:47:41','voyager.hotels.index',NULL),(102,1,'Appartements','','_self','voyager-backpack',NULL,15,6,'2023-08-02 09:37:09','2023-08-04 09:47:41','voyager.appartements.index',NULL),(105,1,'Loisirs','','_self','voyager-ticket',NULL,29,4,'2023-08-02 13:33:07','2023-08-04 09:47:41','voyager.rbm-loisirs.index',NULL),(106,1,'Estivages','','_self','voyager-paper-plane',NULL,29,3,'2023-08-02 14:23:04','2023-08-04 09:47:41','voyager.rbm-estivages.index',NULL),(107,1,'Médicales','','_self','voyager-activity',NULL,23,1,'2023-08-02 14:45:17','2023-08-02 15:08:17','voyager.fact-medicales.index',NULL),(108,1,'Loisirs','','_self','voyager-ticket',NULL,23,3,'2023-08-02 14:48:13','2023-08-03 08:34:04','voyager.fact-loisirs.index',NULL),(109,1,'Estivages','','_self','voyager-paper-plane',NULL,23,4,'2023-08-02 15:07:17','2023-08-03 08:34:04','voyager.fact-estivages.index',NULL),(114,1,'Appartements','','_self','voyager-backpack',NULL,34,5,'2023-08-02 18:44:13','2023-08-03 08:50:39','voyager.ref-appartements.index',NULL),(115,1,'Assuarnces Auto','','_self','voyager-dashboard',NULL,34,3,'2023-08-02 18:49:21','2023-08-03 08:50:38','voyager.ref-assuarnces.index',NULL),(117,1,'Loisirs','','_self','voyager-ticket',NULL,34,7,'2023-08-02 19:04:46','2023-08-04 09:46:57','voyager.ref-loisirs.index',NULL),(118,1,'Spécialités Médicales','','_self','voyager-leaf',NULL,34,1,'2023-08-02 19:18:30','2023-08-03 08:50:38','voyager.ref-specialites.index',NULL),(119,1,'Hotels','','_self','voyager-company',NULL,34,4,'2023-08-02 19:29:52','2023-08-03 08:50:38','voyager.ref-hotels.index',NULL),(120,1,'Etablissements Medicaux','','_self','voyager-activity',NULL,34,2,'2023-08-03 08:25:32','2023-08-03 08:50:38','voyager.ref-etab-medicauxes.index',NULL),(121,1,'Assurance Auto','','_self','voyager-dashboard','#000000',23,2,'2023-08-03 08:26:39','2023-08-03 08:34:04','voyager.fact-assurance-autos.index','null'),(122,1,'Assurances Auto','','_self','voyager-dashboard',NULL,29,2,'2023-08-03 08:29:03','2023-08-03 08:50:38','voyager.rbm-assurance-autos.index',NULL),(124,1,'Medicaux','','_self','voyager-activity','#000000',29,1,'2023-08-03 08:48:25','2023-08-03 08:50:49','voyager.rbm-medicales.index','null'),(125,1,'Documentations','','_self','voyager-documentation',NULL,NULL,4,'2023-08-03 13:50:43','2023-08-03 13:55:08','voyager.documentations.index',NULL),(126,1,'RDV Médecin Travail','','_self','voyager-calendar',NULL,15,3,'2023-08-04 09:34:33','2023-08-04 09:47:52','voyager.rdv-medecin-travails.index',NULL),(127,1,'Activités','','_self','voyager-fire','#000000',34,6,'2023-08-04 09:37:16','2023-08-05 09:43:58','voyager.ref-activites.index','null');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Admin','2023-07-20 10:17:58','2023-07-20 10:43:57'),(2,'Adhérent','2023-07-20 14:09:50','2023-07-20 14:09:50'),(3,'Gestionnaire','2023-07-20 15:14:18','2023-07-20 15:14:18');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2016_01_01_000000_add_voyager_user_fields',2),(6,'2016_01_01_000000_create_data_types_table',2),(7,'2016_05_19_173453_create_menu_table',2),(8,'2016_10_21_190000_create_roles_table',2),(9,'2016_10_21_190000_create_settings_table',2),(10,'2016_11_30_135954_create_permission_table',2),(11,'2016_11_30_141208_create_permission_role_table',2),(12,'2016_12_26_201236_data_types__add__server_side',2),(13,'2017_01_13_000000_add_route_to_menu_items_table',2),(14,'2017_01_14_005015_create_translations_table',2),(15,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',2),(16,'2017_03_06_000000_add_controller_to_data_types_table',2),(17,'2017_04_21_000000_add_order_to_data_rows_table',2),(18,'2017_07_05_210000_add_policyname_to_data_types_table',2),(19,'2017_08_05_000000_add_group_to_settings_table',2),(20,'2017_11_26_013050_add_user_role_relationship',2),(21,'2017_11_26_015000_create_user_roles_table',2),(22,'2018_03_11_000000_add_user_settings',2),(23,'2018_03_14_000000_add_details_to_data_types_table',2),(24,'2018_03_16_000000_make_settings_value_nullable',2),(25,'2016_01_01_000000_create_pages_table',3),(26,'2016_01_01_000000_create_posts_table',3),(27,'2016_02_15_204651_create_categories_table',3),(28,'2017_04_11_000000_alter_post_nullable_fields_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `excerpt` text DEFAULT NULL,
  `body` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,0,'Hello World','Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.','<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','pages/page1.jpg','hello-world','Yar Meta Description','Keyword1, Keyword2','ACTIVE','2023-07-20 10:18:02','2023-07-20 10:18:02');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(6,2),(7,1),(7,2),(8,1),(9,1),(10,1),(11,1),(11,2),(12,1),(12,2),(13,1),(14,1),(15,1),(16,1),(16,2),(16,3),(17,1),(17,2),(17,3),(18,1),(18,3),(19,1),(19,3),(20,1),(20,3),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(26,2),(26,3),(27,1),(27,2),(27,3),(28,1),(28,3),(29,1),(29,3),(30,1),(30,3),(31,1),(31,2),(31,3),(32,1),(32,2),(32,3),(33,1),(33,3),(34,1),(34,3),(35,1),(35,3),(36,1),(36,2),(36,3),(37,1),(37,2),(37,3),(38,1),(38,3),(39,1),(39,3),(40,1),(40,3),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(109,1),(110,1),(111,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,1),(124,1),(125,1),(126,1),(127,1),(128,1),(129,1),(130,1),(131,1),(132,1),(133,1),(134,1),(135,1),(136,1),(137,1),(138,1),(139,1),(140,1),(141,1),(142,1),(143,1),(144,1),(145,1),(146,1),(147,1),(148,1),(149,1),(150,1),(151,1),(152,1),(153,1),(154,1),(155,1),(156,1),(157,1),(158,1),(159,1),(160,1),(161,1),(162,1),(163,1),(164,1),(165,1),(166,1),(167,1),(168,1),(169,1),(170,1),(171,1),(172,1),(173,1),(174,1),(175,1),(176,1),(177,1),(178,1),(179,1),(180,1),(181,1),(182,1),(183,1),(184,1),(185,1),(186,1),(187,1),(188,1),(189,1),(190,1),(191,1),(192,1),(193,1),(194,1),(195,1),(196,1),(197,1),(198,1),(199,1),(200,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2023-07-20 10:17:59','2023-07-20 10:17:59'),(2,'browse_bread',NULL,'2023-07-20 10:17:59','2023-07-20 10:17:59'),(3,'browse_database',NULL,'2023-07-20 10:17:59','2023-07-20 10:17:59'),(4,'browse_media',NULL,'2023-07-20 10:17:59','2023-07-20 10:17:59'),(5,'browse_compass',NULL,'2023-07-20 10:17:59','2023-07-20 10:17:59'),(6,'browse_menus','menus','2023-07-20 10:17:59','2023-07-20 10:17:59'),(7,'read_menus','menus','2023-07-20 10:17:59','2023-07-20 10:17:59'),(8,'edit_menus','menus','2023-07-20 10:17:59','2023-07-20 10:17:59'),(9,'add_menus','menus','2023-07-20 10:17:59','2023-07-20 10:17:59'),(10,'delete_menus','menus','2023-07-20 10:17:59','2023-07-20 10:17:59'),(11,'browse_roles','roles','2023-07-20 10:17:59','2023-07-20 10:17:59'),(12,'read_roles','roles','2023-07-20 10:17:59','2023-07-20 10:17:59'),(13,'edit_roles','roles','2023-07-20 10:17:59','2023-07-20 10:17:59'),(14,'add_roles','roles','2023-07-20 10:17:59','2023-07-20 10:17:59'),(15,'delete_roles','roles','2023-07-20 10:17:59','2023-07-20 10:17:59'),(16,'browse_users','users','2023-07-20 10:17:59','2023-07-20 10:17:59'),(17,'read_users','users','2023-07-20 10:17:59','2023-07-20 10:17:59'),(18,'edit_users','users','2023-07-20 10:17:59','2023-07-20 10:17:59'),(19,'add_users','users','2023-07-20 10:17:59','2023-07-20 10:17:59'),(20,'delete_users','users','2023-07-20 10:17:59','2023-07-20 10:17:59'),(21,'browse_settings','settings','2023-07-20 10:17:59','2023-07-20 10:17:59'),(22,'read_settings','settings','2023-07-20 10:17:59','2023-07-20 10:17:59'),(23,'edit_settings','settings','2023-07-20 10:17:59','2023-07-20 10:17:59'),(24,'add_settings','settings','2023-07-20 10:17:59','2023-07-20 10:17:59'),(25,'delete_settings','settings','2023-07-20 10:17:59','2023-07-20 10:17:59'),(26,'browse_categories','categories','2023-07-20 10:18:01','2023-07-20 10:18:01'),(27,'read_categories','categories','2023-07-20 10:18:01','2023-07-20 10:18:01'),(28,'edit_categories','categories','2023-07-20 10:18:01','2023-07-20 10:18:01'),(29,'add_categories','categories','2023-07-20 10:18:01','2023-07-20 10:18:01'),(30,'delete_categories','categories','2023-07-20 10:18:01','2023-07-20 10:18:01'),(31,'browse_posts','posts','2023-07-20 10:18:01','2023-07-20 10:18:01'),(32,'read_posts','posts','2023-07-20 10:18:01','2023-07-20 10:18:01'),(33,'edit_posts','posts','2023-07-20 10:18:01','2023-07-20 10:18:01'),(34,'add_posts','posts','2023-07-20 10:18:01','2023-07-20 10:18:01'),(35,'delete_posts','posts','2023-07-20 10:18:01','2023-07-20 10:18:01'),(36,'browse_pages','pages','2023-07-20 10:18:02','2023-07-20 10:18:02'),(37,'read_pages','pages','2023-07-20 10:18:02','2023-07-20 10:18:02'),(38,'edit_pages','pages','2023-07-20 10:18:02','2023-07-20 10:18:02'),(39,'add_pages','pages','2023-07-20 10:18:02','2023-07-20 10:18:02'),(40,'delete_pages','pages','2023-07-20 10:18:02','2023-07-20 10:18:02'),(61,'browse_prises_medicales','prises_medicales','2023-08-02 08:50:10','2023-08-02 08:50:10'),(62,'read_prises_medicales','prises_medicales','2023-08-02 08:50:10','2023-08-02 08:50:10'),(63,'edit_prises_medicales','prises_medicales','2023-08-02 08:50:10','2023-08-02 08:50:10'),(64,'add_prises_medicales','prises_medicales','2023-08-02 08:50:10','2023-08-02 08:50:10'),(65,'delete_prises_medicales','prises_medicales','2023-08-02 08:50:10','2023-08-02 08:50:10'),(66,'browse_assurances','assurances','2023-08-02 09:16:25','2023-08-02 09:16:25'),(67,'read_assurances','assurances','2023-08-02 09:16:25','2023-08-02 09:16:25'),(68,'edit_assurances','assurances','2023-08-02 09:16:25','2023-08-02 09:16:25'),(69,'add_assurances','assurances','2023-08-02 09:16:25','2023-08-02 09:16:25'),(70,'delete_assurances','assurances','2023-08-02 09:16:25','2023-08-02 09:16:25'),(71,'browse_rdv_medecin_travail','rdv_medecin_travail','2023-08-02 09:20:52','2023-08-02 09:20:52'),(72,'read_rdv_medecin_travail','rdv_medecin_travail','2023-08-02 09:20:52','2023-08-02 09:20:52'),(73,'edit_rdv_medecin_travail','rdv_medecin_travail','2023-08-02 09:20:52','2023-08-02 09:20:52'),(74,'add_rdv_medecin_travail','rdv_medecin_travail','2023-08-02 09:20:52','2023-08-02 09:20:52'),(75,'delete_rdv_medecin_travail','rdv_medecin_travail','2023-08-02 09:20:52','2023-08-02 09:20:52'),(76,'browse_loisirs','loisirs','2023-08-02 09:27:20','2023-08-02 09:27:20'),(77,'read_loisirs','loisirs','2023-08-02 09:27:20','2023-08-02 09:27:20'),(78,'edit_loisirs','loisirs','2023-08-02 09:27:20','2023-08-02 09:27:20'),(79,'add_loisirs','loisirs','2023-08-02 09:27:20','2023-08-02 09:27:20'),(80,'delete_loisirs','loisirs','2023-08-02 09:27:20','2023-08-02 09:27:20'),(81,'browse_hotels','hotels','2023-08-02 09:32:50','2023-08-02 09:32:50'),(82,'read_hotels','hotels','2023-08-02 09:32:50','2023-08-02 09:32:50'),(83,'edit_hotels','hotels','2023-08-02 09:32:50','2023-08-02 09:32:50'),(84,'add_hotels','hotels','2023-08-02 09:32:50','2023-08-02 09:32:50'),(85,'delete_hotels','hotels','2023-08-02 09:32:50','2023-08-02 09:32:50'),(86,'browse_appartements','appartements','2023-08-02 09:37:09','2023-08-02 09:37:09'),(87,'read_appartements','appartements','2023-08-02 09:37:09','2023-08-02 09:37:09'),(88,'edit_appartements','appartements','2023-08-02 09:37:09','2023-08-02 09:37:09'),(89,'add_appartements','appartements','2023-08-02 09:37:09','2023-08-02 09:37:09'),(90,'delete_appartements','appartements','2023-08-02 09:37:09','2023-08-02 09:37:09'),(91,'browse_rbm_assurance_auto','rbm_assurance_auto','2023-08-02 13:27:32','2023-08-02 13:27:32'),(92,'read_rbm_assurance_auto','rbm_assurance_auto','2023-08-02 13:27:32','2023-08-02 13:27:32'),(93,'edit_rbm_assurance_auto','rbm_assurance_auto','2023-08-02 13:27:32','2023-08-02 13:27:32'),(94,'add_rbm_assurance_auto','rbm_assurance_auto','2023-08-02 13:27:32','2023-08-02 13:27:32'),(95,'delete_rbm_assurance_auto','rbm_assurance_auto','2023-08-02 13:27:32','2023-08-02 13:27:32'),(96,'browse_rbm_medicaux','rbm_medicaux','2023-08-02 13:29:26','2023-08-02 13:29:26'),(97,'read_rbm_medicaux','rbm_medicaux','2023-08-02 13:29:26','2023-08-02 13:29:26'),(98,'edit_rbm_medicaux','rbm_medicaux','2023-08-02 13:29:26','2023-08-02 13:29:26'),(99,'add_rbm_medicaux','rbm_medicaux','2023-08-02 13:29:26','2023-08-02 13:29:26'),(100,'delete_rbm_medicaux','rbm_medicaux','2023-08-02 13:29:26','2023-08-02 13:29:26'),(101,'browse_rbm_loisirs','rbm_loisirs','2023-08-02 13:33:06','2023-08-02 13:33:06'),(102,'read_rbm_loisirs','rbm_loisirs','2023-08-02 13:33:06','2023-08-02 13:33:06'),(103,'edit_rbm_loisirs','rbm_loisirs','2023-08-02 13:33:06','2023-08-02 13:33:06'),(104,'add_rbm_loisirs','rbm_loisirs','2023-08-02 13:33:06','2023-08-02 13:33:06'),(105,'delete_rbm_loisirs','rbm_loisirs','2023-08-02 13:33:06','2023-08-02 13:33:06'),(106,'browse_rbm_estivages','rbm_estivages','2023-08-02 14:23:03','2023-08-02 14:23:03'),(107,'read_rbm_estivages','rbm_estivages','2023-08-02 14:23:03','2023-08-02 14:23:03'),(108,'edit_rbm_estivages','rbm_estivages','2023-08-02 14:23:04','2023-08-02 14:23:04'),(109,'add_rbm_estivages','rbm_estivages','2023-08-02 14:23:04','2023-08-02 14:23:04'),(110,'delete_rbm_estivages','rbm_estivages','2023-08-02 14:23:04','2023-08-02 14:23:04'),(111,'browse_fact_medicales','fact_medicales','2023-08-02 14:45:17','2023-08-02 14:45:17'),(112,'read_fact_medicales','fact_medicales','2023-08-02 14:45:17','2023-08-02 14:45:17'),(113,'edit_fact_medicales','fact_medicales','2023-08-02 14:45:17','2023-08-02 14:45:17'),(114,'add_fact_medicales','fact_medicales','2023-08-02 14:45:17','2023-08-02 14:45:17'),(115,'delete_fact_medicales','fact_medicales','2023-08-02 14:45:17','2023-08-02 14:45:17'),(116,'browse_fact_loisirs','fact_loisirs','2023-08-02 14:48:12','2023-08-02 14:48:12'),(117,'read_fact_loisirs','fact_loisirs','2023-08-02 14:48:12','2023-08-02 14:48:12'),(118,'edit_fact_loisirs','fact_loisirs','2023-08-02 14:48:12','2023-08-02 14:48:12'),(119,'add_fact_loisirs','fact_loisirs','2023-08-02 14:48:12','2023-08-02 14:48:12'),(120,'delete_fact_loisirs','fact_loisirs','2023-08-02 14:48:12','2023-08-02 14:48:12'),(121,'browse_fact_estivages','fact_estivages','2023-08-02 15:07:17','2023-08-02 15:07:17'),(122,'read_fact_estivages','fact_estivages','2023-08-02 15:07:17','2023-08-02 15:07:17'),(123,'edit_fact_estivages','fact_estivages','2023-08-02 15:07:17','2023-08-02 15:07:17'),(124,'add_fact_estivages','fact_estivages','2023-08-02 15:07:17','2023-08-02 15:07:17'),(125,'delete_fact_estivages','fact_estivages','2023-08-02 15:07:17','2023-08-02 15:07:17'),(126,'browse_fact_assurance_auto','fact_assurance_auto','2023-08-02 17:53:20','2023-08-02 17:53:20'),(127,'read_fact_assurance_auto','fact_assurance_auto','2023-08-02 17:53:20','2023-08-02 17:53:20'),(128,'edit_fact_assurance_auto','fact_assurance_auto','2023-08-02 17:53:20','2023-08-02 17:53:20'),(129,'add_fact_assurance_auto','fact_assurance_auto','2023-08-02 17:53:20','2023-08-02 17:53:20'),(130,'delete_fact_assurance_auto','fact_assurance_auto','2023-08-02 17:53:20','2023-08-02 17:53:20'),(131,'browse_ref_appartements','ref_appartements','2023-08-02 18:44:13','2023-08-02 18:44:13'),(132,'read_ref_appartements','ref_appartements','2023-08-02 18:44:13','2023-08-02 18:44:13'),(133,'edit_ref_appartements','ref_appartements','2023-08-02 18:44:13','2023-08-02 18:44:13'),(134,'add_ref_appartements','ref_appartements','2023-08-02 18:44:13','2023-08-02 18:44:13'),(135,'delete_ref_appartements','ref_appartements','2023-08-02 18:44:13','2023-08-02 18:44:13'),(136,'browse_ref_assuarnces','ref_assuarnces','2023-08-02 18:49:21','2023-08-02 18:49:21'),(137,'read_ref_assuarnces','ref_assuarnces','2023-08-02 18:49:21','2023-08-02 18:49:21'),(138,'edit_ref_assuarnces','ref_assuarnces','2023-08-02 18:49:21','2023-08-02 18:49:21'),(139,'add_ref_assuarnces','ref_assuarnces','2023-08-02 18:49:21','2023-08-02 18:49:21'),(140,'delete_ref_assuarnces','ref_assuarnces','2023-08-02 18:49:21','2023-08-02 18:49:21'),(141,'browse_ref_etab_medicaux','ref_etab_medicaux','2023-08-02 18:52:32','2023-08-02 18:52:32'),(142,'read_ref_etab_medicaux','ref_etab_medicaux','2023-08-02 18:52:32','2023-08-02 18:52:32'),(143,'edit_ref_etab_medicaux','ref_etab_medicaux','2023-08-02 18:52:32','2023-08-02 18:52:32'),(144,'add_ref_etab_medicaux','ref_etab_medicaux','2023-08-02 18:52:32','2023-08-02 18:52:32'),(145,'delete_ref_etab_medicaux','ref_etab_medicaux','2023-08-02 18:52:32','2023-08-02 18:52:32'),(146,'browse_ref_loisirs','ref_loisirs','2023-08-02 19:04:46','2023-08-02 19:04:46'),(147,'read_ref_loisirs','ref_loisirs','2023-08-02 19:04:46','2023-08-02 19:04:46'),(148,'edit_ref_loisirs','ref_loisirs','2023-08-02 19:04:46','2023-08-02 19:04:46'),(149,'add_ref_loisirs','ref_loisirs','2023-08-02 19:04:46','2023-08-02 19:04:46'),(150,'delete_ref_loisirs','ref_loisirs','2023-08-02 19:04:46','2023-08-02 19:04:46'),(151,'browse_ref_specialites','ref_specialites','2023-08-02 19:18:29','2023-08-02 19:18:29'),(152,'read_ref_specialites','ref_specialites','2023-08-02 19:18:29','2023-08-02 19:18:29'),(153,'edit_ref_specialites','ref_specialites','2023-08-02 19:18:29','2023-08-02 19:18:29'),(154,'add_ref_specialites','ref_specialites','2023-08-02 19:18:29','2023-08-02 19:18:29'),(155,'delete_ref_specialites','ref_specialites','2023-08-02 19:18:29','2023-08-02 19:18:29'),(156,'browse_ref_hotels','ref_hotels','2023-08-02 19:29:52','2023-08-02 19:29:52'),(157,'read_ref_hotels','ref_hotels','2023-08-02 19:29:52','2023-08-02 19:29:52'),(158,'edit_ref_hotels','ref_hotels','2023-08-02 19:29:52','2023-08-02 19:29:52'),(159,'add_ref_hotels','ref_hotels','2023-08-02 19:29:52','2023-08-02 19:29:52'),(160,'delete_ref_hotels','ref_hotels','2023-08-02 19:29:52','2023-08-02 19:29:52'),(161,'browse_ref_etab_medicauxes','ref_etab_medicauxes','2023-08-03 08:25:32','2023-08-03 08:25:32'),(162,'read_ref_etab_medicauxes','ref_etab_medicauxes','2023-08-03 08:25:32','2023-08-03 08:25:32'),(163,'edit_ref_etab_medicauxes','ref_etab_medicauxes','2023-08-03 08:25:32','2023-08-03 08:25:32'),(164,'add_ref_etab_medicauxes','ref_etab_medicauxes','2023-08-03 08:25:32','2023-08-03 08:25:32'),(165,'delete_ref_etab_medicauxes','ref_etab_medicauxes','2023-08-03 08:25:32','2023-08-03 08:25:32'),(166,'browse_fact_assurance_autos','fact_assurance_autos','2023-08-03 08:26:39','2023-08-03 08:26:39'),(167,'read_fact_assurance_autos','fact_assurance_autos','2023-08-03 08:26:39','2023-08-03 08:26:39'),(168,'edit_fact_assurance_autos','fact_assurance_autos','2023-08-03 08:26:39','2023-08-03 08:26:39'),(169,'add_fact_assurance_autos','fact_assurance_autos','2023-08-03 08:26:39','2023-08-03 08:26:39'),(170,'delete_fact_assurance_autos','fact_assurance_autos','2023-08-03 08:26:39','2023-08-03 08:26:39'),(171,'browse_rbm_assurance_autos','rbm_assurance_autos','2023-08-03 08:29:03','2023-08-03 08:29:03'),(172,'read_rbm_assurance_autos','rbm_assurance_autos','2023-08-03 08:29:03','2023-08-03 08:29:03'),(173,'edit_rbm_assurance_autos','rbm_assurance_autos','2023-08-03 08:29:03','2023-08-03 08:29:03'),(174,'add_rbm_assurance_autos','rbm_assurance_autos','2023-08-03 08:29:03','2023-08-03 08:29:03'),(175,'delete_rbm_assurance_autos','rbm_assurance_autos','2023-08-03 08:29:03','2023-08-03 08:29:03'),(176,'browse_rbm_medicauxes','rbm_medicauxes','2023-08-03 08:37:43','2023-08-03 08:37:43'),(177,'read_rbm_medicauxes','rbm_medicauxes','2023-08-03 08:37:43','2023-08-03 08:37:43'),(178,'edit_rbm_medicauxes','rbm_medicauxes','2023-08-03 08:37:43','2023-08-03 08:37:43'),(179,'add_rbm_medicauxes','rbm_medicauxes','2023-08-03 08:37:43','2023-08-03 08:37:43'),(180,'delete_rbm_medicauxes','rbm_medicauxes','2023-08-03 08:37:43','2023-08-03 08:37:43'),(181,'browse_rbm_medicales','rbm_medicales','2023-08-03 08:48:25','2023-08-03 08:48:25'),(182,'read_rbm_medicales','rbm_medicales','2023-08-03 08:48:25','2023-08-03 08:48:25'),(183,'edit_rbm_medicales','rbm_medicales','2023-08-03 08:48:25','2023-08-03 08:48:25'),(184,'add_rbm_medicales','rbm_medicales','2023-08-03 08:48:25','2023-08-03 08:48:25'),(185,'delete_rbm_medicales','rbm_medicales','2023-08-03 08:48:25','2023-08-03 08:48:25'),(186,'browse_documentations','documentations','2023-08-03 13:50:42','2023-08-03 13:50:42'),(187,'read_documentations','documentations','2023-08-03 13:50:42','2023-08-03 13:50:42'),(188,'edit_documentations','documentations','2023-08-03 13:50:42','2023-08-03 13:50:42'),(189,'add_documentations','documentations','2023-08-03 13:50:42','2023-08-03 13:50:42'),(190,'delete_documentations','documentations','2023-08-03 13:50:42','2023-08-03 13:50:42'),(191,'browse_rdv_medecin_travails','rdv_medecin_travails','2023-08-04 09:34:33','2023-08-04 09:34:33'),(192,'read_rdv_medecin_travails','rdv_medecin_travails','2023-08-04 09:34:33','2023-08-04 09:34:33'),(193,'edit_rdv_medecin_travails','rdv_medecin_travails','2023-08-04 09:34:33','2023-08-04 09:34:33'),(194,'add_rdv_medecin_travails','rdv_medecin_travails','2023-08-04 09:34:33','2023-08-04 09:34:33'),(195,'delete_rdv_medecin_travails','rdv_medecin_travails','2023-08-04 09:34:33','2023-08-04 09:34:33'),(196,'browse_ref_activites','ref_activites','2023-08-04 09:37:15','2023-08-04 09:37:15'),(197,'read_ref_activites','ref_activites','2023-08-04 09:37:15','2023-08-04 09:37:15'),(198,'edit_ref_activites','ref_activites','2023-08-04 09:37:15','2023-08-04 09:37:15'),(199,'add_ref_activites','ref_activites','2023-08-04 09:37:15','2023-08-04 09:37:15'),(200,'delete_ref_activites','ref_activites','2023-08-04 09:37:15','2023-08-04 09:37:15');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `excerpt` text DEFAULT NULL,
  `body` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,0,NULL,'Lorem Ipsum Post',NULL,'This is the excerpt for the Lorem Ipsum Post','<p>This is the body of the lorem ipsum post</p>','posts/post1.jpg','lorem-ipsum-post','This is the meta description','keyword1, keyword2, keyword3','PUBLISHED',0,'2023-07-20 10:18:01','2023-07-20 10:18:01'),(2,0,NULL,'My Sample Post',NULL,'This is the excerpt for the sample Post','<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>','posts/post2.jpg','my-sample-post','Meta Description for sample post','keyword1, keyword2, keyword3','PUBLISHED',0,'2023-07-20 10:18:01','2023-07-20 10:18:01'),(3,0,NULL,'Latest Post',NULL,'This is the excerpt for the latest post','<p>This is the body for the latest post</p>','posts/post3.jpg','latest-post','This is the meta description','keyword1, keyword2, keyword3','PUBLISHED',0,'2023-07-20 10:18:01','2023-07-20 10:18:01'),(4,0,NULL,'Yarr Post',NULL,'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.','<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>','posts/post4.jpg','yarr-post','this be a meta descript','keyword1, keyword2, keyword3','PUBLISHED',0,'2023-07-20 10:18:01','2023-07-20 10:18:01');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prises_medicales`
--

DROP TABLE IF EXISTS `prises_medicales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prises_medicales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prestataire` varchar(255) NOT NULL,
  `demandeur` varchar(255) NOT NULL,
  `beneficiaire` varchar(255) NOT NULL,
  `piece_jointe` varchar(255) DEFAULT NULL,
  `creation` datetime NOT NULL,
  `etat_prise_en_charge` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prises_medicales`
--

LOCK TABLES `prises_medicales` WRITE;
/*!40000 ALTER TABLE `prises_medicales` DISABLE KEYS */;
INSERT INTO `prises_medicales` VALUES (1,'test','test','test','[{\"download_link\":\"prises-medicales\\/August2023\\/py4zKQHIGMabG0QPXuXX.txt\",\"original_name\":\"test.txt\"}]','2023-08-04 00:00:00','test','2023-08-04 10:31:30','2023-08-04 10:31:30',NULL);
/*!40000 ALTER TABLE `prises_medicales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbm_assurance_autos`
--

DROP TABLE IF EXISTS `rbm_assurance_autos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbm_assurance_autos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `montant` bigint(20) NOT NULL,
  `periodicite` varchar(255) NOT NULL,
  `statut` varchar(255) NOT NULL,
  `facturation` varchar(255) NOT NULL,
  `demandeur` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbm_assurance_autos`
--

LOCK TABLES `rbm_assurance_autos` WRITE;
/*!40000 ALTER TABLE `rbm_assurance_autos` DISABLE KEYS */;
/*!40000 ALTER TABLE `rbm_assurance_autos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbm_estivages`
--

DROP TABLE IF EXISTS `rbm_estivages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbm_estivages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `montant` bigint(20) NOT NULL,
  `periodicite` varchar(255) NOT NULL,
  `precision` varchar(255) NOT NULL,
  `facture` varchar(255) NOT NULL,
  `demandeur` varchar(255) NOT NULL,
  `statut` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbm_estivages`
--

LOCK TABLES `rbm_estivages` WRITE;
/*!40000 ALTER TABLE `rbm_estivages` DISABLE KEYS */;
/*!40000 ALTER TABLE `rbm_estivages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbm_loisirs`
--

DROP TABLE IF EXISTS `rbm_loisirs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbm_loisirs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `montant` bigint(20) NOT NULL,
  `activite` varchar(255) NOT NULL,
  `facture` varchar(255) NOT NULL,
  `demandeur` varchar(255) NOT NULL,
  `statut` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbm_loisirs`
--

LOCK TABLES `rbm_loisirs` WRITE;
/*!40000 ALTER TABLE `rbm_loisirs` DISABLE KEYS */;
/*!40000 ALTER TABLE `rbm_loisirs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbm_medicales`
--

DROP TABLE IF EXISTS `rbm_medicales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbm_medicales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `montant` double NOT NULL,
  `periodicite` varchar(255) NOT NULL,
  `facture` varchar(255) NOT NULL,
  `demandeur` varchar(255) NOT NULL,
  `precision` varchar(255) NOT NULL,
  `statut` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbm_medicales`
--

LOCK TABLES `rbm_medicales` WRITE;
/*!40000 ALTER TABLE `rbm_medicales` DISABLE KEYS */;
/*!40000 ALTER TABLE `rbm_medicales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rdv_medecin_travails`
--

DROP TABLE IF EXISTS `rdv_medecin_travails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rdv_medecin_travails` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creation` datetime NOT NULL,
  `demandeur` varchar(255) NOT NULL,
  `etat_demande` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rdv_medecin_travails`
--

LOCK TABLES `rdv_medecin_travails` WRITE;
/*!40000 ALTER TABLE `rdv_medecin_travails` DISABLE KEYS */;
/*!40000 ALTER TABLE `rdv_medecin_travails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_activites`
--

DROP TABLE IF EXISTS `ref_activites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_activites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `prix` double NOT NULL,
  `etab` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_activites`
--

LOCK TABLES `ref_activites` WRITE;
/*!40000 ALTER TABLE `ref_activites` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_activites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_appartements`
--

DROP TABLE IF EXISTS `ref_appartements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_appartements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ville` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_appartements`
--

LOCK TABLES `ref_appartements` WRITE;
/*!40000 ALTER TABLE `ref_appartements` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_appartements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_assuarnces`
--

DROP TABLE IF EXISTS `ref_assuarnces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_assuarnces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `telephone` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_assuarnces`
--

LOCK TABLES `ref_assuarnces` WRITE;
/*!40000 ALTER TABLE `ref_assuarnces` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_assuarnces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_etab_medicauxes`
--

DROP TABLE IF EXISTS `ref_etab_medicauxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_etab_medicauxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `telephone` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `ville` varchar(255) NOT NULL,
  `specialite` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_etab_medicauxes`
--

LOCK TABLES `ref_etab_medicauxes` WRITE;
/*!40000 ALTER TABLE `ref_etab_medicauxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_etab_medicauxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_hotels`
--

DROP TABLE IF EXISTS `ref_hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_hotels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `telephone` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_hotels`
--

LOCK TABLES `ref_hotels` WRITE;
/*!40000 ALTER TABLE `ref_hotels` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_loisirs`
--

DROP TABLE IF EXISTS `ref_loisirs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_loisirs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `telephone` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `ville` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_loisirs`
--

LOCK TABLES `ref_loisirs` WRITE;
/*!40000 ALTER TABLE `ref_loisirs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_loisirs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_specialites`
--

DROP TABLE IF EXISTS `ref_specialites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_specialites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `specialite` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_specialites`
--

LOCK TABLES `ref_specialites` WRITE;
/*!40000 ALTER TABLE `ref_specialites` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_specialites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','Administrateur AOS','2023-07-20 10:17:59','2023-07-20 14:00:31'),(2,'Adhérent','Adhérent AOS','2023-07-20 10:17:59','2023-07-20 14:06:03'),(3,'Gestionnaire','Gestionnaire AOS','2023-07-20 14:08:25','2023-07-20 14:08:25');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','Site Title','','text',1,'Site'),(2,'site.description','Site Description','Site Description','','text',2,'Site'),(3,'site.logo','Site Logo','','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID','','','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),(6,'admin.title','Admin Title','Voyager','','text',1,'Admin'),(7,'admin.description','Admin Description','Welcome to Voyager. The Missing Admin for Laravel','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)','','','text',1,'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'data_types','display_name_singular',5,'pt','Post','2023-07-20 10:18:02','2023-07-20 10:18:02'),(2,'data_types','display_name_singular',6,'pt','Página','2023-07-20 10:18:02','2023-07-20 10:18:02'),(3,'data_types','display_name_singular',1,'pt','Utilizador','2023-07-20 10:18:02','2023-07-20 10:18:02'),(4,'data_types','display_name_singular',4,'pt','Categoria','2023-07-20 10:18:02','2023-07-20 10:18:02'),(5,'data_types','display_name_singular',2,'pt','Menu','2023-07-20 10:18:02','2023-07-20 10:18:02'),(6,'data_types','display_name_singular',3,'pt','Função','2023-07-20 10:18:02','2023-07-20 10:18:02'),(7,'data_types','display_name_plural',5,'pt','Posts','2023-07-20 10:18:02','2023-07-20 10:18:02'),(8,'data_types','display_name_plural',6,'pt','Páginas','2023-07-20 10:18:02','2023-07-20 10:18:02'),(9,'data_types','display_name_plural',1,'pt','Utilizadores','2023-07-20 10:18:02','2023-07-20 10:18:02'),(10,'data_types','display_name_plural',4,'pt','Categorias','2023-07-20 10:18:02','2023-07-20 10:18:02'),(11,'data_types','display_name_plural',2,'pt','Menus','2023-07-20 10:18:02','2023-07-20 10:18:02'),(12,'data_types','display_name_plural',3,'pt','Funções','2023-07-20 10:18:02','2023-07-20 10:18:02'),(13,'categories','slug',1,'pt','categoria-1','2023-07-20 10:18:02','2023-07-20 10:18:02'),(14,'categories','name',1,'pt','Categoria 1','2023-07-20 10:18:02','2023-07-20 10:18:02'),(15,'categories','slug',2,'pt','categoria-2','2023-07-20 10:18:02','2023-07-20 10:18:02'),(16,'categories','name',2,'pt','Categoria 2','2023-07-20 10:18:02','2023-07-20 10:18:02'),(17,'pages','title',1,'pt','Olá Mundo','2023-07-20 10:18:02','2023-07-20 10:18:02'),(18,'pages','slug',1,'pt','ola-mundo','2023-07-20 10:18:02','2023-07-20 10:18:02'),(19,'pages','body',1,'pt','<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','2023-07-20 10:18:02','2023-07-20 10:18:02'),(20,'menu_items','title',1,'pt','Painel de Controle','2023-07-20 10:18:02','2023-07-20 10:18:02'),(21,'menu_items','title',2,'pt','Media','2023-07-20 10:18:02','2023-07-20 10:18:02'),(22,'menu_items','title',12,'pt','Publicações','2023-07-20 10:18:02','2023-07-20 10:18:02'),(23,'menu_items','title',3,'pt','Utilizadores','2023-07-20 10:18:02','2023-07-20 10:18:02'),(24,'menu_items','title',11,'pt','Categorias','2023-07-20 10:18:02','2023-07-20 10:18:02'),(25,'menu_items','title',13,'pt','Páginas','2023-07-20 10:18:02','2023-07-20 10:18:02'),(26,'menu_items','title',4,'pt','Funções','2023-07-20 10:18:02','2023-07-20 10:18:02'),(27,'menu_items','title',5,'pt','Ferramentas','2023-07-20 10:18:02','2023-07-20 10:18:02'),(28,'menu_items','title',6,'pt','Menus','2023-07-20 10:18:02','2023-07-20 10:18:02'),(29,'menu_items','title',7,'pt','Base de dados','2023-07-20 10:18:02','2023-07-20 10:18:02'),(30,'menu_items','title',10,'pt','Configurações','2023-07-20 10:18:02','2023-07-20 10:18:02');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (2,2),(3,3);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `poste` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Admin','admin@admin.com','users/default.png',NULL,'$2y$10$AetfAO9mV6szg4r3nws8WeE8pHooCnnFYHZGyQ/aoJ3sLerfjHohe','jVtx292kEX2VLNEgJsix3URd50iXXOS8s1tuX3YvJ7Egy4eNvIB6kMTWpZLW','{\"locale\":\"fr\"}','2023-07-20 10:18:01','2023-07-21 10:23:11',0),(2,2,'Adhérent','adherent@adherentcom','users/default.png',NULL,'$2y$10$e9iOba7HUzfvwD9Y4xA7K.xhfC1x1ZeFvLroatybmp4DnaWWznZPK',NULL,'{\"locale\":\"fr\"}','2023-07-20 14:51:53','2023-07-21 10:22:04',0),(3,3,'Gestionnaire','gestionnaire@gestionnaire.com','users/default.png',NULL,'$2y$10$cetIjKwj2BUoor2jIyDmdeUJyH3etL0cNISCDR2Mja3qQYFu4VSca',NULL,'{\"locale\":\"fr\"}','2023-07-20 14:59:40','2023-07-20 14:59:40',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-07 15:27:30
