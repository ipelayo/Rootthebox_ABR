/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.28-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: rootthebox
-- ------------------------------------------------------
-- Server version	10.5.28-MariaDB-0+deb11u1

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
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('1ee5b63e716f');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `box`
--

DROP TABLE IF EXISTS `box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  `corporation_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `_name` varchar(32) NOT NULL,
  `_operating_system` varchar(16) DEFAULT NULL,
  `_description` varchar(4096) DEFAULT NULL,
  `_capture_message` varchar(4096) DEFAULT NULL,
  `_difficulty` varchar(16) DEFAULT NULL,
  `game_level_id` int(11) NOT NULL,
  `_avatar` varchar(64) DEFAULT NULL,
  `_value` int(11) DEFAULT NULL,
  `_locked` tinyint(1) NOT NULL,
  `_order` int(11) DEFAULT NULL,
  `garbage` varchar(32) NOT NULL,
  `flag_submission_type` enum('CLASSIC','SINGLE_SUBMISSION_BOX') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `_name` (`_name`),
  UNIQUE KEY `garbage` (`garbage`),
  KEY `corporation_id` (`corporation_id`),
  KEY `category_id` (`category_id`),
  KEY `game_level_id` (`game_level_id`),
  KEY `ix_box__order` (`_order`),
  CONSTRAINT `box_ibfk_1` FOREIGN KEY (`corporation_id`) REFERENCES `corporation` (`id`),
  CONSTRAINT `box_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `box_ibfk_3` FOREIGN KEY (`game_level_id`) REFERENCES `game_level` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `box`
--

LOCK TABLES `box` WRITE;
/*!40000 ALTER TABLE `box` DISABLE KEYS */;
INSERT INTO `box` VALUES (3,'2025-03-07 19:19:46','705ecccd-2fd0-4e8a-b351-041eb2ece390',1,3,'Reptes_Steganographya','?','Un seguit de reptes d\'esteganografia, cadascun té el seu que...','','Intermig',1,'box/security_key.jpg',530,0,3,'95685b3f2e8b5c0260e10527d8799476','CLASSIC'),(4,'2025-03-08 10:19:31','7a5dda1d-24b0-49f9-9757-28c8d19454a9',1,4,'Reptes_Crypto','?','Reptes de criptografia, hashes i altres.\r\nUna bona eina de treball pot ser Cryptochef (o trobaràs a \"Herramientas y actualizaciones\"','','Easy',1,'box/security_key.jpg',275,0,4,'722324d67bd9a611b064baffec56cf8c','CLASSIC'),(5,'2025-03-08 10:58:01','41c083d8-cff6-4928-a55b-3f3399534c7b',1,5,'Reptes_Hashes','?','En aquest repte cal identificar i desencriptar els hashes corresponents a cada bandera.\r\nEs facilita un diccionari de possibles contrasenyes.\r\nPerò tin cura perquè tot no serà tan trivial. Potser necessitis una mica de coneixements de bash script i ser imaginatiu.\r\nEl format de cada bandera a enviar ha de ser: **FLAG{contrasenya}**  l\'ordre d\'enviament no importa\r\nRecorda posar-li una mica de \"sal\" a la vida! ;-D\r\n\r\nACHTUNG: Més de 2 intents fallits anularan la puntuació del FLAG.','','Medium',1,'box/malware.jpg',650,0,5,'33b16c96e2f67ad3936b6338130f9c99','CLASSIC'),(6,'2025-03-08 12:45:07','b981be67-498d-4ce0-8039-6e418aaa7b35',2,1,'Reptes_Forensics(Wireshark)','?','','','',1,'box/hacker.jpg',500,0,6,'403b81b6ef2d80e767dfc78d63262633','CLASSIC');
/*!40000 ALTER TABLE `box` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  `_category` varchar(64) NOT NULL,
  `_description` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `_category` (`_category`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'2025-03-07 13:20:20','8de6edb7-7637-44ac-a8e1-636bda10382b','Hacking Ètic',''),(3,'2025-03-07 18:34:02','17b5183c-be0a-4e05-8456-296ef2f54fc4','Steganographya',''),(4,'2025-03-07 18:34:18','7301dd17-8e1d-4679-9bae-7f47339eb530','Crypto',''),(5,'2025-03-08 10:51:26','83cd01d7-8ace-4193-b0f6-cdda6f6e6245','Hashing','');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corporation`
--

DROP TABLE IF EXISTS `corporation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `corporation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  `_name` varchar(32) NOT NULL,
  `_description` varchar(512) DEFAULT NULL,
  `_locked` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `_name` (`_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corporation`
--

LOCK TABLES `corporation` WRITE;
/*!40000 ALTER TABLE `corporation` DISABLE KEYS */;
INSERT INTO `corporation` VALUES (1,'2025-03-07 13:19:53','6aa4fb03-91cd-42d4-8088-2feca839f28f','M16 UF2 Cyberseguretat(Red Team)','Mòdul cyberseguretat ASIX.\r\nUF2 Hacking ètic',0),(2,'2025-03-08 12:41:05','bf13e2de-f093-4f5b-ad71-5e935ae47e88','M16 Cyberseguretat(UF1Forensics)','M16 Cyberseguretat ASIX. UF1 Anàlisi forense',0);
/*!40000 ALTER TABLE `corporation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_token`
--

DROP TABLE IF EXISTS `email_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `value` varchar(64) NOT NULL,
  `valid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `email_token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_token`
--

LOCK TABLES `email_token` WRITE;
/*!40000 ALTER TABLE `email_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_upload`
--

DROP TABLE IF EXISTS `file_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  `team_id` int(11) NOT NULL,
  `byte_size` int(11) NOT NULL,
  `_description` varchar(1024) NOT NULL,
  `_file_name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `file_upload_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_upload`
--

LOCK TABLES `file_upload` WRITE;
/*!40000 ALTER TABLE `file_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flag`
--

DROP TABLE IF EXISTS `flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `flag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  `box_id` int(11) NOT NULL,
  `lock_id` int(11) DEFAULT NULL,
  `_name` varchar(64) DEFAULT NULL,
  `_token` varchar(256) NOT NULL,
  `_plain_answer` varchar(256) DEFAULT NULL,
  `_description` varchar(4096) NOT NULL,
  `_capture_message` varchar(4096) DEFAULT NULL,
  `_case_sensitive` int(11) DEFAULT NULL,
  `_value` int(11) NOT NULL,
  `_original_value` int(11) DEFAULT NULL,
  `_order` int(11) DEFAULT NULL,
  `_type` varchar(16) DEFAULT NULL,
  `_locked` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `box_id` (`box_id`),
  KEY `lock_id` (`lock_id`),
  KEY `ix_flag__order` (`_order`),
  CONSTRAINT `flag_ibfk_1` FOREIGN KEY (`box_id`) REFERENCES `box` (`id`),
  CONSTRAINT `flag_ibfk_2` FOREIGN KEY (`lock_id`) REFERENCES `flag` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flag`
--

LOCK TABLES `flag` WRITE;
/*!40000 ALTER TABLE `flag` DISABLE KEYS */;
INSERT INTO `flag` VALUES (3,'2025-03-07 19:21:44','c72bdc5a-33cf-475c-a2f5-d64c80459a1c',3,NULL,'Flag_0','Flag=123123123',NULL,'Potser alguna altra troballa et servirà per més endavant, no l\'oblidis.\r\nFitxer: 0_os.jpg','',1,20,NULL,1,'static',0),(4,'2025-03-07 19:25:36','f42caeaa-105a-4cf3-a451-f18b7f44d2dc',3,3,'Flag_1','nc -n -v ipKali portKali -e cmd.exe',NULL,'Troba la comanda oculta i copia-la tal qual.\r\nFitxer: 1_mycar','',1,50,NULL,2,'static',0),(5,'2025-03-07 19:29:58','9ed923dc-a9dc-451c-bd1b-6f58e4548ef5',3,4,'Flag_2','Flag=2222222222',NULL,'Troba la flag oculta.\r\nResposta: Flag=XXXXXXXXXXXX\r\nFitxer: 2_Escorpi.jpg','',0,20,NULL,3,'static',0),(6,'2025-03-07 19:33:18','a9b88c4c-0e14-44d7-ae1b-29e59b31e132',3,5,'Flag_3','Flag=332233223322',NULL,'Un més de cerca, cerca .... \r\nFormat: Flag=xxxxxxxxx\r\nFitxer:3_gatito.jpg','',0,50,NULL,4,'static',0),(7,'2025-03-07 19:36:38','ea28db0c-de9c-4412-aec2-dd551563acc2',3,6,'Flag_4','Flag=4455667711',NULL,'Seguim pel mateix camí, però ara canviem una mica de mètode...\r\nFormat flag: Flag=xxxxxxx\r\nFitxer: 4_LogoINScole.JPG','',0,20,NULL,5,'static',0),(8,'2025-03-07 19:39:05','127b396b-df1e-405f-91b4-26422dac7653',3,7,'Flag_5','Flag=00111567890',NULL,'Un més d\'amagats!!!!\r\nFitxer: 5_cara.jpg','',0,70,NULL,6,'static',0),(9,'2025-03-07 19:43:11','56cfab5b-2669-4c6e-81d4-002200f5c777',3,8,'Flag_6','los goonies',NULL,'Es complica la cosa.\r\nEns han passat aquest vídeo i sabem que hi ha quelcom amagat. El problema és que sols sabem trobar coses en imatges...\r\n\r\nEn cas que arribis enlloc recorda que \"Show must go on and We are the champions my friend\".\r\nPer acabar Lotney et donarà la pista de desencriptació i la resposta.\r\nFitxer: 6_bacoreta_estego.mp4','',0,100,NULL,7,'static',0),(10,'2025-03-08 10:20:48','33f1917e-0d75-4520-a183-43fe09847abb',4,NULL,'Flag_0','ABR{OK}',NULL,'Como analista del **SOC** (Security Operations Center) tendrás que usar tus conocimientos\r\npara resolver los siguientes retos técnicos.\r\nLas respuestas deben respetar el siguiente formato: ABR{valor}\r\nUna vez entendido el formato, introduce el valor OK y pasa a la siguiente pregunta.','',0,25,NULL,1,'static',0),(11,'2025-03-08 10:23:38','dd7c242d-87a3-4c82-a183-6e1cf4f86686',4,10,'Flag_1','ABR{SG9sYSBNdW5kbw==}',NULL,'¿Cómo se expresaría en base64 el texto: Hola Mundo?','',0,25,NULL,2,'static',0),(12,'2025-03-08 10:28:00','e80f8ee8-e8b2-460d-a6ec-d7e591959f95',4,11,'Flag_2 (HawkEye)','ABR{Chrome}',NULL,'Se han disparado varias alertas en el IDS de la organización relativas a tráfico\r\nmalicioso asociado a robo de información.\r\n¿Serías capaz, a partir del siguiente flujo TCP proporcionado por los\r\nadministradores de red, de indicar el **nombre del navegador donde estaban\r\nguardadas las credenciales bancarias robadas**?\r\nFormat: ABR{XXXXXXX}, una sola paraula.\r\nFitxer: tcp_stream_email_sospechoso.txt\r\nACHTUNG: Màxim intents permesos 2!!!','',0,25,NULL,3,'static',0),(13,'2025-03-08 10:39:50','628b93df-6ec3-4cf3-9560-9eff22682494',4,12,'Flag_3','ABR{Yescrypt}',NULL,'Identifica el tipo de hash al que se corresponde la siguiente cadena:\r\n$y$j9T$r17dHLnCl7eQAwpZGCoBB1$x03IcdQE.VJCWP7qhkfgmeU8Mu7cmWL4beQ59MTWQN8','',0,50,NULL,4,'static',0),(14,'2025-03-08 10:41:09','0c1cc957-a684-445a-b064-3ecf9db86f41',4,13,'Flag_4','ABR{dumper-7}',NULL,'De los usuarios no deshabilitados, ¿cuál es el usuario con la contraseña más larga?¿Y cuál\r\nes su tamaño?\r\nRespetando el formato de la flag indica: usuario-tamaño (p.e. ABR{pepe-9})\r\nFitxers: system.bak, sam.bak\r\nACHTUNG: Màxim intents permesos 1.!!!','',0,50,NULL,5,'static',0),(15,'2025-03-08 10:44:01','a23f57c6-ecd8-4626-9875-bd95a9d228c4',4,14,'Flag_5','ABR{SHA512}',NULL,'A partir de la siguiente línea, indica el tipo de cifrado usado:\r\nroot:$6$jzcdBmCLz0zF2.b/$6sok07AjDc3TN3oeI/NqrdZ6NSQly3ADW6lvs3z5q.5GDqsCypL8WtL7ARhzDcdYgu\r\nkakXWeNbiIP7GyigCse/:19762:0:99999:7:::\r\nACHTUNG: Màxim intents permesos 2!!!','',0,50,NULL,6,'static',0),(16,'2025-03-08 10:45:00','991f4277-d757-442d-b4e3-555835a2c4d4',4,15,'Flag_6','ABR{shadow123}',NULL,'¿Cuál es la contraseña de root?\r\nroot:$6$jzcdBmCLz0zF2.b/$6sok07AjDc3TN3oeI/NqrdZ6NSQly3ADW6lvs3z5q.5GDqsCypL8WtL7ARhzDcdYgu\r\nkakXWeNbiIP7GyigCse/:19762:0:99999:7:::','',1,50,NULL,7,'static',0),(17,'2025-03-08 11:22:34','a2523c91-d80c-4e39-8d6e-126bb77baf1e',5,NULL,'Hash_9','FLAG{gerardeljosetellama}',NULL,'2pUXJFlqEfsj6','',1,50,NULL,9,'static',0),(18,'2025-03-08 11:27:39','05541e79-4740-44e3-a39e-4ae67216489d',5,NULL,'Hash_2','FLAG{silvianoviene}',NULL,'$2b$05$gPKVVKL8PYcXLmMeuqlZM.pEG62oKzQ20O8TjsvjDb85QaNPGjPIW','',1,50,NULL,2,'static',0),(19,'2025-03-08 11:29:18','20be5f78-d5a5-4086-8c64-de40a16e62b0',5,NULL,'Hash_3','FLAG{maximonuestrafrozenparticular}',NULL,'$2b$05$zMWReUwz7Lo0tvIPDL3OROP.UxWjn2E6n7UXZsHaVRgUqd.Kkci3S','',0,50,NULL,3,'static',0),(20,'2025-03-08 11:31:28','3083eb63-66cd-4ec0-89c8-5bcdd11919e7',5,NULL,'Hash_4','FLAG{losultimosdelcatskills}',NULL,'$5$tvBNF6dLe.FrQHCR$aY0e25BKL2NuzIASsPUy5vI6QqyXBR7u67qPwU0CGN8','',1,50,NULL,4,'static',0),(21,'2025-03-08 11:35:02','62eb53e5-42bd-4503-928f-6275a3beca00',5,NULL,'Hash_5','FLAG{enricysusmonsters}',NULL,'$3$$e7a117396b8440a3ad1a42a73feeba0e','',1,50,NULL,5,'static',0),(22,'2025-03-08 11:41:10','216dcdea-a01f-4dc2-8c85-9bb5b7ac2014',5,NULL,'Hash_6','FLAG{alumne}',NULL,'$y$j9T$hdW73HV2.QW13.Sp4v7ec0$TYDFf/NJY.aPubutjnfA6.QgSBueLFcDOpq8BteKbYD','',1,50,NULL,6,'static',0),(23,'2025-03-08 11:42:34','fa1fc533-c993-44a7-9b03-a51cc9329151',5,NULL,'Hash_1','FLAG{ikeresunsenyor}',NULL,'$y$j9T$TdyX8eyNa.zNCViCSIdoe1$uwsl7rP5bCG1k6.fks4XHLmjtivb5WJObJho7XXDef1','',1,50,NULL,1,'static',0),(24,'2025-03-08 11:44:44','2e8bb868-40ff-4efa-a70b-c3e3534d0b7a',5,NULL,'Hash_7','FLAG{despiertaxavi}',NULL,'$1$QNaKIOeb$pR7C6FrV9EI8WKfpUI8St1','',1,50,NULL,7,'static',0),(25,'2025-03-08 11:46:12','06a99078-2af3-4143-8c9d-f14b546f196e',5,NULL,'Hash_8','FLAG{joselitoelmanyo}',NULL,'$5$O30rSdIYAHiuSu1w$mJmw77DU5oCowrUrvndd8yg8rDZ/6Rf/Z0qxUR0noF/','',1,50,NULL,8,'static',0),(26,'2025-03-08 11:48:09','fe49b379-db1d-4998-bae2-31548ad47f43',5,NULL,'Hash_10','FLAG{gerardeljosetellama}',NULL,'nKTmfUlhU5p.w','',1,50,NULL,10,'static',0),(27,'2025-03-08 11:54:49','501d20eb-6bce-420c-8432-a4ed05d90135',5,NULL,'Hash_11','FLAG{Vaisamorir}',NULL,'ba0beaa9d0363469b1c4f1eacab69188','',1,50,NULL,11,'static',0),(28,'2025-03-08 11:55:43','f83cff5a-8946-4133-bbf5-c40d7d298558',5,NULL,'Hash_12','FLAG{Vaisamorir}',NULL,'440022e4422bc683a2ac4ad7518d1df2','',1,50,NULL,12,'static',0),(29,'2025-03-08 11:57:19','f9578a7f-0402-4ef4-9d2f-ce08b4b48acd',5,NULL,'Hash_13','FLAG{Vaisamorir}',NULL,'$1$W6EJFbpt$DQQsrsfKuHlnc5deBg8aZ0','',1,50,NULL,13,'static',0),(30,'2025-03-08 12:01:12','eba2607f-4b90-43bf-8bb3-06fc9eaac228',5,NULL,'Hash_14','FLAG{saludaHector}',NULL,'28aff7d3f08565be4888676682c6862b0ec6cbf5433dce73d57bdf024fa99a98','',1,50,NULL,14,'static',0),(31,'2025-03-08 12:46:11','47987c3e-c8fe-4721-b8c3-6773fbd67b77',6,NULL,'Flag_0 Intro','OK',NULL,'◦ Reto#10: análisis forense en red\r\nUno de los administrativos de nuestra organización lleva temas económicos con empresas internacionales y ha recibido un email\r\nrelativo a una factura que tiene un enlace para descargarla. En la captura stealer.pcap está el tráfico de la organización\r\ngenerado después de abrir el email.\r\nComo analista del SOC (Security Operations Center) haz una investigación del tráfico de red para determinar si hubo un\r\nincidente relativo a los emails recibidos por el administrativo. Usa tus conocimientos de Wireshark y responde a las siguientes\r\ncuestiones.\r\nLas respuestas se indican tal cual sin poner ABR{valor}. Una vez entendido el formato, introduce el valor OK y pasa a la\r\nsiguiente pregunta.','',0,25,NULL,1,'static',0),(32,'2025-03-10 12:04:08','7bfa8953-05e7-4840-bd35-698c85a62055',3,NULL,'Flag_7','FLAG{B4s3_64_C0d3}',NULL,'Troba la bandera oculta.\r\nFitxer: 7_Fotosintesi.wav','',1,200,NULL,8,'static',0),(33,'2025-03-13 10:35:29','f5be957b-8946-4f08-a302-b90a59c546ee',4,16,'Flag_7','ABR{M1ch43l!$&}',NULL,'Quina és la contrasenya de Michael?\r\nHem obtingut dades d\'un usuari del sistema: Fitxer: Michael.info\r\nFitxer: hashes_repte_flag7.txt\r\nFlag: ABR{contrasenya}','',1,100,NULL,8,'static',0),(34,'2025-03-13 11:06:08','4cfb7bf1-6e76-4c0d-9c4c-859af4efe823',4,33,'Flag_8 (Rastreator)','ABR{9ad26e5d35.txt}',NULL,'Indica el nombre del fichero situado dentro de la carpeta ABR (ABR.zip) que se corresponde con alguno de los hashes\r\nmd5 de la lista lista_hashes.txt\r\nNOTA: indicar nombre pero no ruta','',1,100,NULL,9,'static',0),(35,'2025-03-13 11:12:26','fc03d9dc-97d8-4778-be3a-52ff6e6e9ee4',4,34,'Flag_9 (Rastreator2)','ABR{afb63c0550.txt}',NULL,'Indica el nombre de la imagen situada dentro de la carpeta ABR\r\nNOTAS:\r\n➔ indicar nombre pero no ruta\r\n➔ centrarse en imágenes png, jpg y gif','',1,100,NULL,10,'static',0),(36,'2025-03-13 11:25:16','cfd07e39-a6f3-4bea-b5a2-149f01c858fd',6,31,'Flag_1 (paquets)','4003',NULL,'¿Cuántos paquetes tiene la captura?.','',1,10,NULL,2,'static',0),(37,'2025-03-13 11:26:53','9ff68d0d-60e9-4b7a-9f65-a38e801fb6f8',6,36,'Flag_2(hora UTC)','2019-04-10 20:37:07',NULL,'¿A qué hora se capturó el primer paquete?.\r\nNOTA: tiempo UTC y formato de respuesta: aaaa-mm-dd hh:mm:ss','',1,10,NULL,3,'static',0),(38,'2025-03-13 11:27:52','dca44804-7a2c-4311-87b3-3e6c2dd3b7c9',6,37,'Flag_3(durada)','01:03:41',NULL,'¿Duración de la captura?.\r\nNOTA: formato de respuesta: hh:mm:ss','',1,10,NULL,4,'static',0),(39,'2025-03-13 11:29:20','94e66c57-7677-4a41-9a1d-afb5496c9981',6,38,'Flag_4(equip)','00:08:02:1c:47:ae',NULL,'¿Cuál es el equipo más activo a nivel de enlace?\r\nFormat: xx:xx:xx:xx:xx:xx','',0,10,NULL,5,'static',0),(40,'2025-03-13 11:31:31','9efbbaba-42c3-4e1a-97c4-cce49ac17a15',6,39,'Flag_5(fabricant)','Hewlett Packard',NULL,'¿Fabricante de la NIC del equipo más activo a nivel de enlace?\r\nFormat: XXXXXXX XXXXXXX','',0,10,NULL,6,'static',0),(41,'2025-03-13 11:33:01','e52977b1-bdeb-4a42-a159-fba31d47494d',6,40,'Flag_6(seu)','Palo Alto',NULL,'¿Ciudad dónde está la sede de la compañía que fabricó la NIC del equipo más activo a nivel de enlace?\r\nFormat: XXXX XXXX','',0,10,NULL,7,'static',0),(42,'2025-03-13 11:34:51','f9ee74d8-cfea-4595-afa9-aa9611057368',6,41,'Flag_7(intranet)','3',NULL,'La organización trabaja con direccionamiento privado y máscara de red /24, ¿cuántos equipos de la\r\norganización intervienen en la captura?\r\nMés d\'un intent anula la puntuació!!!','',1,10,NULL,8,'static',0),(43,'2025-03-13 11:36:07','069559c3-99c2-470c-b034-d776e3910961',6,42,'Flag_8(hostname)','BEIJING-5CD1-PC',NULL,'¿Cuál es el nombre del equipo más activo a nivel de red?','',0,15,NULL,9,'static',0),(44,'2025-03-13 11:39:17','f4a4b1e0-8885-47c0-86ca-7c9cf796857f',6,43,'Flag_9(dns)','10.4.10.4',NULL,'¿Cuál es la IP del servidor DNS de la organización?','',1,15,NULL,10,'static',0),(45,'2025-03-13 11:41:13','afeffb24-478b-4832-ab3f-2ac00a374017',6,44,'Flag_10(domini)','proforma-invoices.com',NULL,'¿Por qué dominio pregunta la víctima en el paquete 204?.','',0,15,NULL,11,'static',0),(46,'2025-03-13 11:42:22','feacee6d-1a11-477b-8cc7-2fd2adb48852',6,45,'Flag_11(IP-domini)','217.182.138.150',NULL,'¿Cuál es la IP del dominio de la pregunta anterior?','',1,15,NULL,12,'static',0),(47,'2025-03-13 11:44:15','caa5704d-2068-4ef7-8de4-fa656b79368a',6,46,'Flag_12(O.S.)','Windows 7',NULL,'¿Qué sistema operativo corre el equipo víctima (10.4.10.132)?','',0,15,NULL,13,'static',0),(48,'2025-03-13 11:45:40','ae6dc136-5306-4679-bd36-c010363a8f9b',6,47,'Flag_13(malware)','tkraw_Protected99.exe',NULL,'¿Cuál es el nombre del archivo malicioso descargado por el contable?','',0,15,NULL,14,'static',0),(49,'2025-03-13 11:46:40','98a84769-1a69-4c11-b9de-ca92893bc1e5',6,48,'Flag_14(Virus Total)','TrojanSpy.Win32.HAWKEYE.AF',NULL,'Extrae el archivo malicioso, súbelo a Virustotal e indica el nombre del malware según TrendMicro','',0,20,NULL,15,'static',0),(50,'2025-03-13 11:47:38','2cccd4d4-3022-4047-a8b9-a1cd4f72d27e',6,49,'Flag_15(hash)','71826ba081e303866ce2a2534491a2f7',NULL,'¿Cuál es el hash md5 del fichero descargado?','',1,20,NULL,16,'static',0),(51,'2025-03-13 11:49:24','5ddaf070-5dda-4c97-a63e-79354f759b2e',6,50,'Flag_16(IP pública)','173.66.146.112',NULL,'¿Cuál es la IP pública del equipo víctima?','',1,20,NULL,17,'static',0),(52,'2025-03-13 11:52:08','80490def-4871-47e0-a69d-2c93942e2e35',6,51,'Flag_17(email)','Exim 4.91',NULL,'Analizando la primera extracción de información ¿Qué software (nombre y versión) corre el servidor de correo\r\nelectrónico al que se le envía la información robada?','',0,30,NULL,18,'static',0),(53,'2025-03-13 11:53:41','36548c5f-4644-46ff-981d-932f23c877b5',6,52,'Flag_18(password)','Sales@23',NULL,'¿Cuál es la contraseña usada por el malware para enviar el email?','',1,30,NULL,19,'static',0),(54,'2025-03-13 11:54:50','bcc5c869-db63-4996-ba3e-f6c4b7d6192a',6,53,'Flag_19(stealer)','HawkEye Keylogger - Reborn v9',NULL,'¿Qué variante del malware exfiltra la información?','',0,30,NULL,20,'static',0),(55,'2025-03-13 11:55:49','552717c4-400c-463f-a199-182f3d468c7e',6,54,'Flag_20(callback)','10',NULL,'¿Cada cuántos minutos se exfiltra la información recopilada?','',1,30,NULL,21,'static',0);
/*!40000 ALTER TABLE `flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flag_attachment`
--

DROP TABLE IF EXISTS `flag_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `flag_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  `flag_id` int(11) NOT NULL,
  `_file_name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `flag_id` (`flag_id`),
  CONSTRAINT `flag_attachment_ibfk_1` FOREIGN KEY (`flag_id`) REFERENCES `flag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flag_attachment`
--

LOCK TABLES `flag_attachment` WRITE;
/*!40000 ALTER TABLE `flag_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `flag_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flag_choice`
--

DROP TABLE IF EXISTS `flag_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `flag_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  `flag_id` int(11) NOT NULL,
  `_choice` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `flag_id` (`flag_id`),
  CONSTRAINT `flag_choice_ibfk_1` FOREIGN KEY (`flag_id`) REFERENCES `flag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flag_choice`
--

LOCK TABLES `flag_choice` WRITE;
/*!40000 ALTER TABLE `flag_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `flag_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_history`
--

DROP TABLE IF EXISTS `game_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `_type` varchar(20) NOT NULL,
  `_value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `game_history_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_history`
--

LOCK TABLES `game_history` WRITE;
/*!40000 ALTER TABLE `game_history` DISABLE KEYS */;
INSERT INTO `game_history` VALUES (1,'2025-03-07 19:00:17',1,'start',0),(2,'2025-03-07 19:00:17',1,'start',0),(3,'2025-03-07 19:46:09',1,'flag',20),(4,'2025-03-07 19:46:09',1,'flag_count',1),(5,'2025-03-07 19:47:09',1,'purchase_hint',10),(6,'2025-03-07 19:47:26',1,'flag',60),(7,'2025-03-07 19:47:26',1,'flag_count',2),(8,'2025-03-07 19:47:56',1,'flag',80),(9,'2025-03-07 19:47:56',1,'flag_count',3),(10,'2025-03-07 19:48:23',1,'flag',130),(11,'2025-03-07 19:48:23',1,'flag_count',4),(12,'2025-03-07 19:49:11',1,'flag',150),(13,'2025-03-07 19:49:11',1,'flag_count',5),(14,'2025-03-07 19:49:33',1,'flag',220),(15,'2025-03-07 19:49:33',1,'flag_count',6),(16,'2025-03-07 19:49:50',1,'flag',320),(17,'2025-03-07 19:49:50',1,'flag_count',7),(18,'2025-03-07 19:49:50',1,'box',680),(19,'2025-03-08 12:20:17',1,'flag',730),(20,'2025-03-08 12:20:17',1,'flag_count',8);
/*!40000 ALTER TABLE `game_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_level`
--

DROP TABLE IF EXISTS `game_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  `next_level_id` int(11) DEFAULT NULL,
  `_number` int(11) NOT NULL,
  `_buyout` int(11) NOT NULL,
  `_type` varchar(16) NOT NULL,
  `_reward` int(11) NOT NULL,
  `_name` varchar(32) DEFAULT NULL,
  `_description` varchar(512) DEFAULT NULL,
  `_locked` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `_number` (`_number`),
  KEY `next_level_id` (`next_level_id`),
  CONSTRAINT `game_level_ibfk_1` FOREIGN KEY (`next_level_id`) REFERENCES `game_level` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_level`
--

LOCK TABLES `game_level` WRITE;
/*!40000 ALTER TABLE `game_level` DISABLE KEYS */;
INSERT INTO `game_level` VALUES (1,'2025-03-07 12:59:20','c176888b-f1a8-4e28-a0a8-80f3ec3a2a51',NULL,0,0,'none',0,NULL,NULL,0);
/*!40000 ALTER TABLE `game_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hint`
--

DROP TABLE IF EXISTS `hint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `hint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  `box_id` int(11) NOT NULL,
  `flag_id` int(11) DEFAULT NULL,
  `_price` int(11) NOT NULL,
  `_description` varchar(4096) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `box_id` (`box_id`),
  KEY `flag_id` (`flag_id`),
  CONSTRAINT `hint_ibfk_1` FOREIGN KEY (`box_id`) REFERENCES `box` (`id`),
  CONSTRAINT `hint_ibfk_2` FOREIGN KEY (`flag_id`) REFERENCES `flag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hint`
--

LOCK TABLES `hint` WRITE;
/*!40000 ALTER TABLE `hint` DISABLE KEYS */;
INSERT INTO `hint` VALUES (2,'2025-03-07 19:22:21','470f8668-ffe0-46c2-b32a-67949c2e0f9c',3,3,10,'Les metadades dels fitxers poden arribar a ser crucials.'),(3,'2025-03-07 19:26:14','1622f78c-71e7-4c91-bbfe-54cd63ff07b6',3,4,10,'És important saber on acaba un jpg (FF D9)'),(4,'2025-03-07 19:26:41','876607d1-a341-45b9-af5e-07c315b3d64e',3,4,10,'dd és una eina molt útil d\'extracció'),(5,'2025-03-07 19:27:48','6ff5792b-1313-44da-be26-b9b6e5d290b1',3,4,10,'Ghex és un bon editor hexadecimal per saber on acaba una cosa i comença l\'altra'),(6,'2025-03-07 19:30:38','1c9d3973-d340-4151-95af-68d69e4da39f',3,5,10,'Res que no hagis fet al repte anterior'),(7,'2025-03-07 19:33:59','87f89c8e-2d7f-4d2e-994e-c45cbda2d279',3,6,10,'Les metadades segueixen sent importants!'),(8,'2025-03-07 19:34:19','3addcf04-d774-458d-95e1-c6101057abb3',3,6,20,'De vegades una imatge n\'amaga una altra més petita'),(9,'2025-03-07 19:37:23','3d59c639-c5a3-4527-8191-7493fe709de1',3,7,10,'Hi ha altres maneres i eines d\'amagar missatges a una imatge/fitxer'),(10,'2025-03-07 19:39:41','41301f24-2334-4ca2-9c08-256f72f3da8c',3,8,10,'Recorda troballes de reptes anteriors'),(11,'2025-03-07 19:40:11','82cb9494-d320-4ffc-aaff-23032e162100',3,8,30,'**0x**        25 50 44 46 2D\r\nAhí lo dejo... ;-)'),(12,'2025-03-07 19:43:36','3d9f01da-6875-460e-8e67-7d5884b46d13',3,9,20,'Aquest video té una caràtula/imatge'),(13,'2025-03-07 19:44:00','b431102e-28b5-4c52-97a3-dd71343b142c',3,9,20,'ffmpeg és una eina molt útil en aquest cas'),(14,'2025-03-07 19:44:22','6df022fe-9fea-41c9-8f84-d373d5fd75c4',3,9,20,'Grup musical (no m\'agraden les majúscules)'),(15,'2025-03-08 10:24:08','bdfa92f3-2a4b-4cda-a6cb-1e8133af2bfd',4,11,10,'Usa el comando base64 o CyberChef o base64encode.org (-10 pts)'),(16,'2025-03-08 10:38:36','400878d1-b19b-460d-852d-49705e65992f',4,12,10,'Revisa el cuerpo del mensaje SMTP y que tipo de codificación se usa (-10 puntos)'),(17,'2025-03-08 10:42:11','76e39ff2-dd7f-405f-8418-90d246e11b73',4,14,10,'Obtén un volcado de hashes a partir de system.bak y sam.bak (-10 puntos)'),(18,'2025-03-08 10:42:33','4c2bf8bb-0a7e-49e8-aac7-db3e5e343843',4,14,20,'Usa john o hashcat o un servicio online para crackear los hashes (-20 puntos)'),(19,'2025-03-08 10:45:26','29387cba-f16b-42ee-a845-dcba4034a6a7',4,16,10,'Para solucionar este reto hay que ser un poco \"bruto\"'),(20,'2025-03-08 10:45:45','e5ecef6e-f7c3-4af8-a637-cccc29fbfdae',4,16,20,'Para ser un buen \"offensive\" conviene saber bailar el \"rock\"'),(21,'2025-03-08 12:02:34','a0c374ed-e2b5-42c4-8fa3-2a5552bbca84',5,NULL,25,'Identificar el hash seria el 1r pas.\r\nhttps://www.dragonjar.org/identificando-el-tipo-de-hash.xhtml'),(23,'2025-03-08 12:09:17','dd5d8fb5-ec9c-459b-90af-59aed90e56dd',5,NULL,25,'Una mica de teoria de hashes no anirà malament.\r\nhttps://nordpass.com/es/blog/password-salt/'),(24,'2025-03-08 12:10:22','01246f2c-3988-44aa-9b17-a1f65a465c94',5,NULL,50,'Una bona eina per generar hashes i un petit script et poden ser de gran ajuda.\r\nhttps://h4ckseed.wordpress.com/2022/01/12/contrasenas-hash-en-gnu-linux/'),(25,'2025-03-10 12:16:10','9e62d1c9-3979-4252-869e-f90cad9ee69a',3,32,0,'Aquesta pista es gratuïta.\r\nMira als materials, a Reptes_Hashes hi ha un diccionari que potser necessitis en algun moment.'),(26,'2025-03-10 12:17:32','47373087-b6d7-45dd-aaca-3169c8c73baa',3,32,30,'Deepsound és una app a tenir en compte.\r\nhttps://www.zonasystem.com/2016/01/deepsound-ocultar-informacion-dentro-de.html'),(27,'2025-03-10 12:19:48','5652909e-8269-464f-af06-19c7cd38f534',3,32,50,'En els noms d\'arxius i les \"clue\" tens la manera de resoldre.\r\nCyberchef!!!'),(28,'2025-03-13 10:39:33','d2beaf78-27e3-4b7f-aff4-e1f7ca7ce71b',4,33,40,'cupp -i és una bona eina per a diccionaris personalitzats'),(29,'2025-03-13 11:18:16','4e6c6a0b-9484-4818-958c-e65b5207e6e0',4,35,10,'find és una comanda molt potent.\r\nhttps://www.ionos.es/digitalguide/servidores/configuracion/comando-linux-find/');
/*!40000 ALTER TABLE `hint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_address`
--

DROP TABLE IF EXISTS `ip_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  `box_id` int(11) NOT NULL,
  `_address` varchar(80) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `box_id` (`box_id`),
  CONSTRAINT `ip_address_ibfk_1` FOREIGN KEY (`box_id`) REFERENCES `box` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_address`
--

LOCK TABLES `ip_address` WRITE;
/*!40000 ALTER TABLE `ip_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_item`
--

DROP TABLE IF EXISTS `market_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `market_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(64) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(256) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_item`
--

LOCK TABLES `market_item` WRITE;
/*!40000 ALTER TABLE `market_item` DISABLE KEYS */;
INSERT INTO `market_item` VALUES (1,'2025-03-07 12:59:20','aa2730b4-620c-4394-90d6-84ba5eea463b','Source Code Market',500,'source_code_market.png','Allows your team access to the Source Code Black Market where you can purchase leaked source code for certain target boxes.'),(2,'2025-03-07 12:59:20','3ae5e582-f31b-4249-91bc-ca286aa2a940','Password Security',1000,'password_security.png','Allows your team to upgrade their password hashes to more secure algorithms such as SHA1, and SHA256.'),(3,'2025-03-07 12:59:20','c8518c59-de1a-47d3-ae44-6eb9c77277fe','Federal Reserve',1750,'federal_reserve.png','Gain access to the internal New York Federal Reserve banking system, allowing you to transfer funds to/from accounts.'),(4,'2025-03-07 12:59:20','ffdfacc6-13de-4670-bf38-9183ebeb0578','SWAT',3000,'swat.png','Gain access to the internal police computer system, allowing you to insert fraudlent arrest warrents for other players.');
/*!40000 ALTER TABLE `market_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(256) NOT NULL,
  `message` varchar(256) NOT NULL,
  `viewed` tinyint(1) DEFAULT NULL,
  `icon_url` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'2025-03-07 19:02:26',2,'New Team Member','Isma0 has joined the isma0 team',0,'/static/images/info.png'),(2,'2025-03-07 19:46:09',2,'Flag Capture','Isma0 (isma0) has completed \"Flag_0\" in Reptes_Steganographya',0,'/static/images/success.png'),(3,'2025-03-07 19:47:09',2,'Hint Taken','Isma0 has taken a hint for Reptes_Steganographya',0,'/static/images/info.png'),(4,'2025-03-07 19:47:26',2,'Flag Capture','Isma0 (isma0) has completed \"Flag_1\" in Reptes_Steganographya',0,'/static/images/success.png'),(5,'2025-03-07 19:47:56',2,'Flag Capture','Isma0 (isma0) has completed \"Flag_2\" in Reptes_Steganographya',0,'/static/images/success.png'),(6,'2025-03-07 19:48:23',2,'Flag Capture','Isma0 (isma0) has completed \"Flag_3\" in Reptes_Steganographya',0,'/static/images/success.png'),(7,'2025-03-07 19:49:11',2,'Flag Capture','Isma0 (isma0) has completed \"Flag_4\" in Reptes_Steganographya',0,'/static/images/success.png'),(8,'2025-03-07 19:49:33',2,'Flag Capture','Isma0 (isma0) has completed \"Flag_5\" in Reptes_Steganographya',0,'/static/images/success.png'),(9,'2025-03-07 19:49:50',2,'Flag Capture','Isma0 (isma0) has completed \"Flag_6\" in Reptes_Steganographya',0,'/static/images/success.png'),(10,'2025-03-08 12:20:17',2,'Flag Capture','Isma0 (isma0) has completed \"Hash_11\" in Reptes_Hashes',0,'/static/images/success.png');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_token`
--

DROP TABLE IF EXISTS `password_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `value` varchar(64) NOT NULL,
  `used` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `password_token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_token`
--

LOCK TABLES `password_token` WRITE;
/*!40000 ALTER TABLE `password_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paste_bin`
--

DROP TABLE IF EXISTS `paste_bin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `paste_bin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  `team_id` int(11) NOT NULL,
  `_name` varchar(32) NOT NULL,
  `_contents` varchar(4096) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `paste_bin_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paste_bin`
--

LOCK TABLES `paste_bin` WRITE;
/*!40000 ALTER TABLE `paste_bin` DISABLE KEYS */;
/*!40000 ALTER TABLE `paste_bin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penalty`
--

DROP TABLE IF EXISTS `penalty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `penalty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `flag_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `_token` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  KEY `flag_id` (`flag_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `penalty_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE CASCADE,
  CONSTRAINT `penalty_ibfk_2` FOREIGN KEY (`flag_id`) REFERENCES `flag` (`id`) ON DELETE CASCADE,
  CONSTRAINT `penalty_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penalty`
--

LOCK TABLES `penalty` WRITE;
/*!40000 ALTER TABLE `penalty` DISABLE KEYS */;
INSERT INTO `penalty` VALUES (1,'2025-03-07 19:48:43',1,7,2,'Token:  Flag=4455667711'),(2,'2025-03-08 12:24:31',1,26,2,'FLAH{hola}');
/*!40000 ALTER TABLE `penalty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'2025-03-07 12:59:20',1,'admin');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_token`
--

DROP TABLE IF EXISTS `registration_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `value` varchar(6) NOT NULL,
  `used` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_token`
--

LOCK TABLES `registration_token` WRITE;
/*!40000 ALTER TABLE `registration_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_code`
--

DROP TABLE IF EXISTS `source_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `source_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  `box_id` int(11) NOT NULL,
  `_price` int(11) NOT NULL,
  `_description` varchar(4096) NOT NULL,
  `checksum` varchar(40) DEFAULT NULL,
  `_file_name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `box_id` (`box_id`),
  CONSTRAINT `source_code_ibfk_1` FOREIGN KEY (`box_id`) REFERENCES `box` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_code`
--

LOCK TABLES `source_code` WRITE;
/*!40000 ALTER TABLE `source_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `source_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `swat`
--

DROP TABLE IF EXISTS `swat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `swat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  `user_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `paid` int(11) NOT NULL,
  `accepted` tinyint(1) DEFAULT NULL,
  `completed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `user_id` (`user_id`),
  KEY `target_id` (`target_id`),
  CONSTRAINT `swat_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `swat_ibfk_2` FOREIGN KEY (`target_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `swat`
--

LOCK TABLES `swat` WRITE;
/*!40000 ALTER TABLE `swat` DISABLE KEYS */;
/*!40000 ALTER TABLE `swat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  `_name` varchar(24) NOT NULL,
  `_motto` varchar(32) DEFAULT NULL,
  `_avatar` varchar(64) DEFAULT NULL,
  `_notes` varchar(512) DEFAULT NULL,
  `code` varchar(16) DEFAULT NULL,
  `money` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `_name` (`_name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'2025-03-07 19:00:17','00f237f9-0093-4e97-b93c-429562ba5baa','isma0','PapaOso','upload/76036546406891415104.svg',NULL,'c13c81d7957a4c1a',730);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_to_box`
--

DROP TABLE IF EXISTS `team_to_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_to_box` (
  `team_id` int(11) NOT NULL,
  `box_id` int(11) NOT NULL,
  KEY `team_id` (`team_id`),
  KEY `box_id` (`box_id`),
  CONSTRAINT `team_to_box_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE CASCADE,
  CONSTRAINT `team_to_box_ibfk_2` FOREIGN KEY (`box_id`) REFERENCES `box` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_to_box`
--

LOCK TABLES `team_to_box` WRITE;
/*!40000 ALTER TABLE `team_to_box` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_to_box` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_to_flag`
--

DROP TABLE IF EXISTS `team_to_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_to_flag` (
  `team_id` int(11) NOT NULL,
  `flag_id` int(11) NOT NULL,
  KEY `team_id` (`team_id`),
  KEY `flag_id` (`flag_id`),
  CONSTRAINT `team_to_flag_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE CASCADE,
  CONSTRAINT `team_to_flag_ibfk_2` FOREIGN KEY (`flag_id`) REFERENCES `flag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_to_flag`
--

LOCK TABLES `team_to_flag` WRITE;
/*!40000 ALTER TABLE `team_to_flag` DISABLE KEYS */;
INSERT INTO `team_to_flag` VALUES (1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,27);
/*!40000 ALTER TABLE `team_to_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_to_game_level`
--

DROP TABLE IF EXISTS `team_to_game_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_to_game_level` (
  `team_id` int(11) NOT NULL,
  `game_level_id` int(11) NOT NULL,
  KEY `team_id` (`team_id`),
  KEY `game_level_id` (`game_level_id`),
  CONSTRAINT `team_to_game_level_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE CASCADE,
  CONSTRAINT `team_to_game_level_ibfk_2` FOREIGN KEY (`game_level_id`) REFERENCES `game_level` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_to_game_level`
--

LOCK TABLES `team_to_game_level` WRITE;
/*!40000 ALTER TABLE `team_to_game_level` DISABLE KEYS */;
INSERT INTO `team_to_game_level` VALUES (1,1);
/*!40000 ALTER TABLE `team_to_game_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_to_hint`
--

DROP TABLE IF EXISTS `team_to_hint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_to_hint` (
  `team_id` int(11) NOT NULL,
  `hint_id` int(11) NOT NULL,
  KEY `team_id` (`team_id`),
  KEY `hint_id` (`hint_id`),
  CONSTRAINT `team_to_hint_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE CASCADE,
  CONSTRAINT `team_to_hint_ibfk_2` FOREIGN KEY (`hint_id`) REFERENCES `hint` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_to_hint`
--

LOCK TABLES `team_to_hint` WRITE;
/*!40000 ALTER TABLE `team_to_hint` DISABLE KEYS */;
INSERT INTO `team_to_hint` VALUES (1,3);
/*!40000 ALTER TABLE `team_to_hint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_to_item`
--

DROP TABLE IF EXISTS `team_to_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_to_item` (
  `team_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  KEY `team_id` (`team_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `team_to_item_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE CASCADE,
  CONSTRAINT `team_to_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `market_item` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_to_item`
--

LOCK TABLES `team_to_item` WRITE;
/*!40000 ALTER TABLE `team_to_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_to_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_to_source_code`
--

DROP TABLE IF EXISTS `team_to_source_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_to_source_code` (
  `team_id` int(11) NOT NULL,
  `source_code_id` int(11) NOT NULL,
  KEY `team_id` (`team_id`),
  KEY `source_code_id` (`source_code_id`),
  CONSTRAINT `team_to_source_code_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE CASCADE,
  CONSTRAINT `team_to_source_code_ibfk_2` FOREIGN KEY (`source_code_id`) REFERENCES `source_code` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_to_source_code`
--

LOCK TABLES `team_to_source_code` WRITE;
/*!40000 ALTER TABLE `team_to_source_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_to_source_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme`
--

DROP TABLE IF EXISTS `theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  `_name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `_name` (`_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme`
--

LOCK TABLES `theme` WRITE;
/*!40000 ALTER TABLE `theme` DISABLE KEYS */;
INSERT INTO `theme` VALUES (1,'2025-03-07 12:59:20','cba9f49d-c07a-483a-a009-7bf12adc44ad','Bootstrap'),(2,'2025-03-07 12:59:20','359a28ff-8ca0-421b-bfbc-9f9c674134cc','Amelia'),(3,'2025-03-07 12:59:20','ed0dc650-3625-44fa-810d-f793a4b24ed4','Cyborg'),(4,'2025-03-07 12:59:20','d45d29e7-341c-43ea-9bb6-659849558d22','Readable'),(5,'2025-03-07 12:59:20','23d6b8f5-b3c5-4980-8fc2-8088fe4c41c3','Slate'),(6,'2025-03-07 12:59:20','33720dd5-2d5a-42c8-8594-1c1797c15ec3','Spruce'),(7,'2025-03-07 12:59:20','f65dd95a-da29-4ff0-ac8c-9808ff433077','United'),(8,'2025-03-07 12:59:20','a371b69a-526f-4b45-93bd-0bbbb8802628','Cerulean'),(9,'2025-03-07 12:59:20','2fec1c9c-2976-46c9-90dc-b6d432d67206','Journal'),(10,'2025-03-07 12:59:20','0977575e-a515-4706-8c62-38991bde71f2','Simplex'),(11,'2025-03-07 12:59:20','c78345b2-c201-4feb-aa23-557102df86da','Spacelab'),(12,'2025-03-07 12:59:20','212e6048-b95c-4f37-929a-2768994000f0','Superhero'),(13,'2025-03-07 12:59:20','446264ba-5c25-4860-8c3d-21c1113f1d02','Geocities'),(14,'2025-03-07 12:59:20','900f74a0-273e-4beb-bf57-3c057ddcec38','386');
/*!40000 ALTER TABLE `theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_file`
--

DROP TABLE IF EXISTS `theme_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `theme_id` int(11) NOT NULL,
  `_file_name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `theme_id` (`theme_id`),
  CONSTRAINT `theme_file_ibfk_1` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_file`
--

LOCK TABLES `theme_file` WRITE;
/*!40000 ALTER TABLE `theme_file` DISABLE KEYS */;
INSERT INTO `theme_file` VALUES (1,'2025-03-07 12:59:20',1,'bootstrap.min.css'),(2,'2025-03-07 12:59:20',2,'amelia.min.css'),(3,'2025-03-07 12:59:20',3,'cyborg.min.css'),(4,'2025-03-07 12:59:20',4,'readable.min.css'),(5,'2025-03-07 12:59:20',5,'slate.min.css'),(6,'2025-03-07 12:59:20',6,'spruce.min.css'),(7,'2025-03-07 12:59:20',7,'united.min.css'),(8,'2025-03-07 12:59:20',8,'cerulean.min.css'),(9,'2025-03-07 12:59:20',9,'journal.min.css'),(10,'2025-03-07 12:59:20',10,'simplex.min.css'),(11,'2025-03-07 12:59:20',11,'spacelab.min.css'),(12,'2025-03-07 12:59:20',12,'superhero.min.css'),(13,'2025-03-07 12:59:20',13,'geocities.min.css'),(14,'2025-03-07 12:59:20',14,'386.css'),(15,'2025-03-07 12:59:20',14,'386.js'),(16,'2025-03-07 12:59:20',14,'386.responsive.css');
/*!40000 ALTER TABLE `theme_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  `team_id` int(11) DEFAULT NULL,
  `_avatar` varchar(64) DEFAULT NULL,
  `_locked` tinyint(1) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `logins` int(11) DEFAULT NULL,
  `_handle` varchar(16) NOT NULL,
  `_name` varchar(64) DEFAULT NULL,
  `_email` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `bank_password` varchar(128) DEFAULT NULL,
  `_notes` varchar(512) DEFAULT NULL,
  `_expire` datetime DEFAULT NULL,
  `money` int(11) NOT NULL,
  `theme_id` int(11) NOT NULL,
  `algorithm` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `_handle` (`_handle`),
  KEY `team_id` (`team_id`),
  KEY `theme_id` (`theme_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'2025-03-07 12:59:20','aa509a47-374f-4a96-b9ea-79a173a3ebac',NULL,NULL,0,'2025-03-17 11:43:01',9,'admin',NULL,NULL,'$p5k2$2bad$dZRe4THm$4VX/2TNjGvG0AllQ1ZWNXv.SuhBWPK9.',NULL,NULL,NULL,0,12,'md5'),(2,'2025-03-07 19:02:26','95bc4435-a331-4084-a08c-c66ed97195b2',1,'upload/229241451141458027247.svg',0,'2025-03-10 12:30:04',3,'Isma0','Isma0','llobarrosalpa@gmail.com','$p5k2$2bad$WE.XV0Dx$ofkYFYc2IA5MKtCILZdAJpnnZRuxa338','ac6b49cfe730c14c6eaf4ab4a4878e7a',NULL,NULL,380,3,'md5');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_to_flag`
--

DROP TABLE IF EXISTS `user_to_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_to_flag` (
  `user_id` int(11) NOT NULL,
  `flag_id` int(11) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `flag_id` (`flag_id`),
  CONSTRAINT `user_to_flag_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_to_flag_ibfk_2` FOREIGN KEY (`flag_id`) REFERENCES `flag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_to_flag`
--

LOCK TABLES `user_to_flag` WRITE;
/*!40000 ALTER TABLE `user_to_flag` DISABLE KEYS */;
INSERT INTO `user_to_flag` VALUES (2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,27);
/*!40000 ALTER TABLE `user_to_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wall_of_sheep`
--

DROP TABLE IF EXISTS `wall_of_sheep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wall_of_sheep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `preimage` varchar(32) NOT NULL,
  `value` int(11) NOT NULL,
  `victim_id` int(11) NOT NULL,
  `cracker_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `victim_id` (`victim_id`),
  KEY `cracker_id` (`cracker_id`),
  CONSTRAINT `wall_of_sheep_ibfk_1` FOREIGN KEY (`victim_id`) REFERENCES `user` (`id`),
  CONSTRAINT `wall_of_sheep_ibfk_2` FOREIGN KEY (`cracker_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wall_of_sheep`
--

LOCK TABLES `wall_of_sheep` WRITE;
/*!40000 ALTER TABLE `wall_of_sheep` DISABLE KEYS */;
/*!40000 ALTER TABLE `wall_of_sheep` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-17 12:02:53
