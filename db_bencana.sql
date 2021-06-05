-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: db_bencana
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alternatif`
--

DROP TABLE IF EXISTS `alternatif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alternatif` (
  `idalternatif` int NOT NULL AUTO_INCREMENT,
  `nmalternatif` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idalternatif`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alternatif`
--

LOCK TABLES `alternatif` WRITE;
/*!40000 ALTER TABLE `alternatif` DISABLE KEYS */;
INSERT INTO `alternatif` VALUES (1,'Rusak Ringan'),(2,'Rusak Sedang'),(3,'Rusak Berat');
/*!40000 ALTER TABLE `alternatif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bobot`
--

DROP TABLE IF EXISTS `bobot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bobot` (
  `idbobot` int NOT NULL AUTO_INCREMENT,
  `idkriteria` int DEFAULT NULL,
  `idskala` int DEFAULT NULL,
  PRIMARY KEY (`idbobot`),
  KEY `FK_bobot_kriteria` (`idkriteria`),
  KEY `FK_bobot_skala` (`idskala`),
  CONSTRAINT `FK_bobot_kriteria` FOREIGN KEY (`idkriteria`) REFERENCES `kriteria` (`idkriteria`),
  CONSTRAINT `FK_bobot_skala` FOREIGN KEY (`idskala`) REFERENCES `skala` (`idskala`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bobot`
--

LOCK TABLES `bobot` WRITE;
/*!40000 ALTER TABLE `bobot` DISABLE KEYS */;
INSERT INTO `bobot` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,1),(6,5,2);
/*!40000 ALTER TABLE `bobot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jenisbencana`
--

DROP TABLE IF EXISTS `jenisbencana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jenisbencana` (
  `idbencana` int NOT NULL AUTO_INCREMENT,
  `nmbencana` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idbencana`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenisbencana`
--

LOCK TABLES `jenisbencana` WRITE;
/*!40000 ALTER TABLE `jenisbencana` DISABLE KEYS */;
INSERT INTO `jenisbencana` VALUES (1,'Flood'),(2,'Earthquake'),(3,'Cyclone'),(4,'Wildfire');
/*!40000 ALTER TABLE `jenisbencana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kasus`
--

DROP TABLE IF EXISTS `kasus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kasus` (
  `idkasus` int NOT NULL AUTO_INCREMENT,
  `nomorWa` varchar(50) NOT NULL,
  `idbencana` int DEFAULT NULL,
  `id_sub` int DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `provinsi` varchar(50) NOT NULL,
  `kota` varchar(50) NOT NULL,
  `tanggal` varchar(50) DEFAULT NULL,
  `datenow` varchar(50) DEFAULT NULL,
  `long` varchar(50) DEFAULT NULL,
  `lat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idkasus`),
  KEY `FK_kasus_jenisbencana` (`idbencana`),
  KEY `FK_kasus_sub_sektor` (`id_sub`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kasus`
--

LOCK TABLES `kasus` WRITE;
/*!40000 ALTER TABLE `kasus` DISABLE KEYS */;
INSERT INTO `kasus` VALUES (8,'085648375667',1,1,'Test 1','Lamongan','Jawa Timur','','2020-11-12','14-11-2020','112.43493516587206','-7.123376835866874'),(9,'085648375667',1,1,'Test 2','Brenggolo','Jawa Timur','','2020-12-16','02-12-2020','112.11617909960934','-7.143797909654938');
/*!40000 ALTER TABLE `kasus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kriteria`
--

DROP TABLE IF EXISTS `kriteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kriteria` (
  `idkriteria` int NOT NULL AUTO_INCREMENT,
  `nmkriteria` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idkriteria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kriteria`
--

LOCK TABLES `kriteria` WRITE;
/*!40000 ALTER TABLE `kriteria` DISABLE KEYS */;
INSERT INTO `kriteria` VALUES (1,'Keadaan Bangunan'),(2,'Keadaan Struktur Bangunan'),(3,'Kondisi Fisik Bangunan Rusak Sebesar'),(4,'Fungsi Bangunan'),(5,'Keadaan Penunjang Lainnya');
/*!40000 ALTER TABLE `kriteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `multimoora1`
--

DROP TABLE IF EXISTS `multimoora1`;
/*!50001 DROP VIEW IF EXISTS `multimoora1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `multimoora1` AS SELECT 
 1 AS `idnilai`,
 1 AS `idkasus`,
 1 AS `idkriteria`,
 1 AS `idalternatif`,
 1 AS `idbobot`,
 1 AS `idskala`,
 1 AS `nmskala`,
 1 AS `value`,
 1 AS `pra`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `multimoora2`
--

DROP TABLE IF EXISTS `multimoora2`;
/*!50001 DROP VIEW IF EXISTS `multimoora2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `multimoora2` AS SELECT 
 1 AS `idnilai`,
 1 AS `idkasus`,
 1 AS `idkriteria`,
 1 AS `idalternatif`,
 1 AS `idbobot`,
 1 AS `idskala`,
 1 AS `nmskala`,
 1 AS `value`,
 1 AS `pra`,
 1 AS `normalisasi`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `multimoora3`
--

DROP TABLE IF EXISTS `multimoora3`;
/*!50001 DROP VIEW IF EXISTS `multimoora3`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `multimoora3` AS SELECT 
 1 AS `idnilai`,
 1 AS `idkasus`,
 1 AS `idkriteria`,
 1 AS `idalternatif`,
 1 AS `idbobot`,
 1 AS `idskala`,
 1 AS `nmskala`,
 1 AS `value`,
 1 AS `pra`,
 1 AS `normalisasi`,
 1 AS `skalabobot`,
 1 AS `valuebobot`,
 1 AS `normalisasibobot`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `multimoora4`
--

DROP TABLE IF EXISTS `multimoora4`;
/*!50001 DROP VIEW IF EXISTS `multimoora4`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `multimoora4` AS SELECT 
 1 AS `idkasus`,
 1 AS `idalternatif`,
 1 AS `hasil`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `penilaian`
--

DROP TABLE IF EXISTS `penilaian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penilaian` (
  `idnilai` int NOT NULL AUTO_INCREMENT,
  `idkasus` int DEFAULT NULL,
  `idkriteria` int DEFAULT NULL,
  `idalternatif` int DEFAULT NULL,
  `idbobot` int DEFAULT NULL,
  `idskala` int DEFAULT NULL,
  PRIMARY KEY (`idnilai`),
  KEY `FK_penilaian_kasus` (`idkasus`),
  KEY `FK_penilaian_kriteria` (`idkriteria`),
  KEY `FK_penilaian_alternatif` (`idalternatif`),
  KEY `FK_penilaian_bobot` (`idbobot`),
  KEY `FK_penilaian_skala` (`idskala`),
  CONSTRAINT `FK_penilaian_alternatif` FOREIGN KEY (`idalternatif`) REFERENCES `alternatif` (`idalternatif`),
  CONSTRAINT `FK_penilaian_bobot` FOREIGN KEY (`idbobot`) REFERENCES `bobot` (`idbobot`),
  CONSTRAINT `FK_penilaian_kasus` FOREIGN KEY (`idkasus`) REFERENCES `kasus` (`idkasus`),
  CONSTRAINT `FK_penilaian_kriteria` FOREIGN KEY (`idkriteria`) REFERENCES `kriteria` (`idkriteria`),
  CONSTRAINT `FK_penilaian_skala` FOREIGN KEY (`idskala`) REFERENCES `skala` (`idskala`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penilaian`
--

LOCK TABLES `penilaian` WRITE;
/*!40000 ALTER TABLE `penilaian` DISABLE KEYS */;
INSERT INTO `penilaian` VALUES (25,8,1,1,1,3),(26,8,1,2,1,3),(27,8,1,3,1,2),(28,8,2,1,2,3),(29,8,2,2,2,3),(30,8,2,3,2,3),(31,8,3,1,3,3),(32,8,3,2,3,2),(33,8,3,3,3,3),(34,8,4,1,4,3),(35,8,4,2,4,2),(36,8,4,3,4,3),(37,8,5,1,6,3),(38,8,5,2,6,1),(39,8,5,3,6,2),(40,9,1,1,1,2),(41,9,1,2,1,1),(42,9,1,3,1,3),(43,9,2,1,2,3),(44,9,2,2,2,1),(45,9,2,3,2,1),(46,9,3,1,3,2),(47,9,3,2,3,3),(48,9,3,3,3,1),(49,9,4,1,4,2),(50,9,4,2,4,2),(51,9,4,3,4,3),(52,9,5,1,6,1),(53,9,5,2,6,3),(54,9,5,3,6,2);
/*!40000 ALTER TABLE `penilaian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sektor`
--

DROP TABLE IF EXISTS `sektor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sektor` (
  `id_sektor` int NOT NULL AUTO_INCREMENT,
  `nm_sektor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_sektor`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sektor`
--

LOCK TABLES `sektor` WRITE;
/*!40000 ALTER TABLE `sektor` DISABLE KEYS */;
INSERT INTO `sektor` VALUES (1,'Infrastruktur'),(2,'Ekonomi'),(3,'Pemukiman');
/*!40000 ALTER TABLE `sektor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skala`
--

DROP TABLE IF EXISTS `skala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skala` (
  `idskala` int NOT NULL AUTO_INCREMENT,
  `nmskala` varchar(50) DEFAULT NULL,
  `value` int DEFAULT NULL,
  PRIMARY KEY (`idskala`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skala`
--

LOCK TABLES `skala` WRITE;
/*!40000 ALTER TABLE `skala` DISABLE KEYS */;
INSERT INTO `skala` VALUES (1,'Ringan',1),(2,'Sedang',2),(3,'Berat',3);
/*!40000 ALTER TABLE `skala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_sektor`
--

DROP TABLE IF EXISTS `sub_sektor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_sektor` (
  `id_sub` int NOT NULL AUTO_INCREMENT,
  `id_sektor` int DEFAULT NULL,
  `nm_sub` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_sub`) USING BTREE,
  KEY `FK_sub_sektor_sektor` (`id_sektor`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_sektor`
--

LOCK TABLES `sub_sektor` WRITE;
/*!40000 ALTER TABLE `sub_sektor` DISABLE KEYS */;
INSERT INTO `sub_sektor` VALUES (1,1,'Jembatan'),(2,2,'Toko'),(3,1,'Jalan Raya'),(4,3,'Perumahan'),(5,2,'Pasar'),(6,2,'Sawah'),(7,1,'Lingkungan Pemukiman'),(8,2,'Pendidikan'),(9,2,'Kesehatan'),(10,2,'Lembaga Sosial'),(11,3,'Pertanian'),(12,3,'Pariwisata'),(13,3,'Industri');
/*!40000 ALTER TABLE `sub_sektor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `multimoora1`
--

/*!50001 DROP VIEW IF EXISTS `multimoora1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `multimoora1` AS select `penilaian`.`idnilai` AS `idnilai`,`penilaian`.`idkasus` AS `idkasus`,`penilaian`.`idkriteria` AS `idkriteria`,`penilaian`.`idalternatif` AS `idalternatif`,`penilaian`.`idbobot` AS `idbobot`,`penilaian`.`idskala` AS `idskala`,`skala`.`nmskala` AS `nmskala`,`skala`.`value` AS `value`,sqrt(sum(pow(`skala`.`value`,2))) AS `pra` from (`penilaian` join `skala`) where (`penilaian`.`idskala` = `skala`.`idskala`) group by `penilaian`.`idkriteria`,`penilaian`.`idkasus` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `multimoora2`
--

/*!50001 DROP VIEW IF EXISTS `multimoora2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `multimoora2` AS select `penilaian`.`idnilai` AS `idnilai`,`penilaian`.`idkasus` AS `idkasus`,`penilaian`.`idkriteria` AS `idkriteria`,`penilaian`.`idalternatif` AS `idalternatif`,`penilaian`.`idbobot` AS `idbobot`,`penilaian`.`idskala` AS `idskala`,`skala`.`nmskala` AS `nmskala`,`skala`.`value` AS `value`,`multimoora1`.`pra` AS `pra`,(`skala`.`value` / `multimoora1`.`pra`) AS `normalisasi` from ((`penilaian` join `skala`) join `multimoora1`) where ((`penilaian`.`idskala` = `skala`.`idskala`) and (`multimoora1`.`idkriteria` = `penilaian`.`idkriteria`) and (`multimoora1`.`idkasus` = `penilaian`.`idkasus`)) group by `penilaian`.`idnilai` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `multimoora3`
--

/*!50001 DROP VIEW IF EXISTS `multimoora3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `multimoora3` AS select `multimoora2`.`idnilai` AS `idnilai`,`multimoora2`.`idkasus` AS `idkasus`,`multimoora2`.`idkriteria` AS `idkriteria`,`multimoora2`.`idalternatif` AS `idalternatif`,`multimoora2`.`idbobot` AS `idbobot`,`multimoora2`.`idskala` AS `idskala`,`multimoora2`.`nmskala` AS `nmskala`,`multimoora2`.`value` AS `value`,`multimoora2`.`pra` AS `pra`,`multimoora2`.`normalisasi` AS `normalisasi`,`skala`.`nmskala` AS `skalabobot`,`skala`.`value` AS `valuebobot`,(`multimoora2`.`normalisasi` * `skala`.`value`) AS `normalisasibobot` from ((`multimoora2` join `bobot`) join `skala`) where ((`multimoora2`.`idbobot` = `bobot`.`idbobot`) and (`bobot`.`idskala` = `skala`.`idskala`)) group by `multimoora2`.`idnilai` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `multimoora4`
--

/*!50001 DROP VIEW IF EXISTS `multimoora4`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `multimoora4` AS select `multimoora3`.`idkasus` AS `idkasus`,`multimoora3`.`idalternatif` AS `idalternatif`,sum(`multimoora3`.`normalisasibobot`) AS `hasil` from `multimoora3` group by `multimoora3`.`idkasus`,`multimoora3`.`idalternatif` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-04  9:13:32
