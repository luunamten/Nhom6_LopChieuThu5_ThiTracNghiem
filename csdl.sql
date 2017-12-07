CREATE DATABASE  IF NOT EXISTS `thitn` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `thitn`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: thitn
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Table structure for table `cauhoi`
--

DROP TABLE IF EXISTS `cauhoi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cauhoi` (
  `MACH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MAPHAN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CAUTRALOI` longtext COLLATE utf8_unicode_ci NOT NULL,
  `CAUTRALOIKHAC` longtext COLLATE utf8_unicode_ci NOT NULL,
  `MOTA` longtext COLLATE utf8_unicode_ci NOT NULL,
  `THOIDIEMTHEM` datetime NOT NULL,
  PRIMARY KEY (`MACH`),
  KEY `cauhoi_maphan_fk_idx` (`MAPHAN`),
  CONSTRAINT `cauhoi_maphan_fk` FOREIGN KEY (`MAPHAN`) REFERENCES `phan` (`MAPHAN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cauhoi`
--

LOCK TABLES `cauhoi` WRITE;
/*!40000 ALTER TABLE `cauhoi` DISABLE KEYS */;
INSERT INTO `cauhoi` VALUES ('CH01','PH01','don’t work','[won’t work][haven’t worked][aren’t working]','They ________because it is a national holiday.','2016-01-15 08:50:40'),('CH02','PH01','isn’t she ','[hasn’t she][doesn’t she][didn’t she]',' She’s finished the course, ____________?','2016-01-15 08:50:40'),('CH03','PH01','in the act','[in order][on duty][under control]',' “Would you like a beer?” “ Not while I’m ___________”','2016-01-15 08:50:40'),('CH04','PH01','in','[of][with][at]','Some friends of mine are really fashion-conscious, while __________ are quite simple.','2016-01-15 08:50:40'),('CH05','PH01','don’t work','[won’t work][haven’t worked][aren’t working]',' Elizabeth is fond _____ going to dances.','2016-01-15 08:50:40'),('CH06','PH01','into','[out of][besides][out]','That is last year’s telephone directory. It’s___date now','2016-01-15 08:50:40'),('CH07','PH01','to','[from][into][at]','He was put ___ prison.','2016-01-15 08:50:40'),('CH08','PH02','in','[at][over][all are correct]','We rejoice ___ her success.','2016-01-15 08:50:40'),('CH09','PH02','for','[with][against][at]','I saw him___ noon.','2016-01-15 08:50:40'),('CH10','PH02','with','[for][to][by]','She treated me___Cake, ice-cream and tea.','2016-01-15 08:50:40'),('CH11','PH04','x = 2 hoặc x = -2','[x = 1 và x = -1][x = 3 và x = -3][x = 4 và x = -4]','Giả phương trình: x^2 - 4 = 0.','2016-02-02 08:30:00'),('CH12','PH04','x = 2','[x = 1][x = 0.5][x = 10]','Giả phương trình: x^3 - 8 = 0.','2016-02-02 08:30:00'),('CH13','PH05','x = 4','[x = -4][x = 3][x = -3]','Giả phương trình: x - 4 = 0.','2016-02-02 08:30:00'),('CH14','PH05','y = 4x^2','[y = 3x + 2][y = 1/x][y = x^3 + 4]','Đâu là phương trình parabol?','2016-02-02 08:30:00'),('CH15','PH09','10000J','[200J][900J][100J]','Tính công của xe kéo, biết lực kéo của xe lên xem ở sau là 1000N, đi được 10m','2017-11-24 14:16:09'),('CH16','PH01','are','[kill][harm][i]','what ___ you doing ?','2017-11-26 22:49:17'),('CH17','PH02','do','[are][were][have]','How ___ you feel ?','2017-11-28 15:02:23'),('CH18','PH01','off','[kick][fill][propagate]','I lied him to get him ____ hook.','2017-11-28 15:08:01'),('CH21','PH01','cloud','[window][web][king]','Do dark ____ signify rain ?','2017-11-28 15:55:54'),('CH22','PH01','far','[miss][walk][feel]','how ___ is it to the airport ?','2017-11-30 18:55:07'),('CH23','PH01','off','[in][at][on]','He fired ___ so many questions that I couldn\'t keep track of the all.','2017-12-01 01:17:34'),('CH24','PH01','jailed','[jail][jailing][jailen]','He was _______ for throwing the rock to the police','2017-12-02 22:00:22'),('CH25','PH01','off','[in][at][to]','I wander _______ to the local library ?','2017-12-04 00:14:25'),('CH26','PH01','in','[at][on][into]','built-______ function in the C++ library.','2017-12-04 00:16:52'),('CH28','PH01','out','[off][few][little]','we don\'t want our profits to be cancelled ______ by extra expenses.','2017-12-04 00:19:03'),('CH29','PH01','enjoy','[enjoying][enjoyed][had enjoyed]','I still ___ the week despite the weather.','2017-12-04 00:19:44'),('CH30','PH01','around','[surround][in][on]','you go, I\'ll stick ______ here a bit longer.','2017-12-04 00:21:55'),('CH31','PH01','fucking','[me][water][fire]','Raise your ______ hands up !!','2017-12-04 00:23:27'),('CH32','PH01','disbanded, ended','[disband, ended][disbanded, end][disbanding ending]','The army was ________ when the war _______.','2017-12-04 00:25:03'),('CH33','PH01','practical','[practically][practicaly][practication]','He is the __________ owner of this house.','2017-12-04 00:27:11'),('CH34','PH01','coverage','[cover][lane][walk]','The TV ________ of election compain.','2017-12-04 10:24:28'),('CH35','PH03','disbanded','[ended][efw][ewfwe]','The army was _______ when the war ended','2017-12-07 15:28:41'),('CH36','PH03','hell','[me][ewfwe][ewfwe]','what the ______ are you doing ?','2017-12-07 15:28:41'),('CH37','PH03','wrong','[right][ewfwe][ewfwe]','what\'s ______ with the world','2017-12-07 15:28:41');
/*!40000 ALTER TABLE `cauhoi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cauhoi_dethi`
--

DROP TABLE IF EXISTS `cauhoi_dethi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cauhoi_dethi` (
  `MACH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MADT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`MACH`,`MADT`),
  KEY `madt_idx` (`MADT`),
  CONSTRAINT `chdt_mach_fk` FOREIGN KEY (`MACH`) REFERENCES `cauhoi` (`MACH`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chdt_madt_fk` FOREIGN KEY (`MADT`) REFERENCES `dethi` (`MADT`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cauhoi_dethi`
--

LOCK TABLES `cauhoi_dethi` WRITE;
/*!40000 ALTER TABLE `cauhoi_dethi` DISABLE KEYS */;
INSERT INTO `cauhoi_dethi` VALUES ('CH01','DT01'),('CH02','DT01'),('CH03','DT01'),('CH04','DT01'),('CH05','DT02'),('CH06','DT02'),('CH07','DT03'),('CH08','DT04'),('CH09','DT05'),('CH10','DT06'),('CH02','DT10'),('CH03','DT10'),('CH04','DT10'),('CH05','DT10'),('CH10','DT10'),('CH01','DT11'),('CH02','DT11'),('CH03','DT11'),('CH04','DT11'),('CH05','DT11'),('CH06','DT11'),('CH07','DT11'),('CH08','DT11'),('CH09','DT11'),('CH10','DT11'),('CH01','DT12'),('CH02','DT12'),('CH03','DT12'),('CH04','DT12'),('CH05','DT12'),('CH06','DT12'),('CH07','DT12'),('CH08','DT12'),('CH09','DT12'),('CH10','DT12'),('CH01','DT13'),('CH02','DT13'),('CH03','DT13'),('CH04','DT13'),('CH05','DT13'),('CH06','DT13'),('CH07','DT13'),('CH08','DT13'),('CH09','DT13'),('CH10','DT13'),('CH01','DT14'),('CH02','DT14'),('CH03','DT14'),('CH04','DT14'),('CH05','DT14'),('CH06','DT14'),('CH07','DT14'),('CH08','DT14'),('CH09','DT14'),('CH10','DT14'),('CH01','DT15'),('CH02','DT15'),('CH03','DT15'),('CH04','DT15'),('CH05','DT15'),('CH06','DT15'),('CH07','DT15'),('CH08','DT15'),('CH09','DT15'),('CH10','DT15'),('CH01','DT16'),('CH02','DT16'),('CH03','DT16'),('CH04','DT16'),('CH05','DT16'),('CH06','DT16'),('CH07','DT16'),('CH08','DT16'),('CH09','DT16'),('CH10','DT16'),('CH01','DT17'),('CH02','DT17'),('CH03','DT17'),('CH04','DT17'),('CH05','DT17'),('CH06','DT17'),('CH07','DT17'),('CH08','DT17'),('CH09','DT17'),('CH10','DT17'),('CH01','DT18'),('CH02','DT18'),('CH03','DT18'),('CH04','DT18'),('CH05','DT18'),('CH06','DT18'),('CH07','DT18'),('CH08','DT18'),('CH09','DT18'),('CH10','DT18'),('CH01','DT20'),('CH02','DT20'),('CH03','DT20'),('CH04','DT20'),('CH05','DT20'),('CH06','DT20'),('CH07','DT20'),('CH08','DT20'),('CH09','DT20'),('CH10','DT20'),('CH15','DT21'),('CH15','DT22'),('CH18','DT23'),('CH01','DT24'),('CH02','DT24'),('CH03','DT24'),('CH04','DT24'),('CH05','DT24'),('CH06','DT24'),('CH07','DT24'),('CH08','DT24'),('CH09','DT24'),('CH10','DT24'),('CH16','DT24'),('CH17','DT24'),('CH18','DT24'),('CH21','DT24'),('CH22','DT24'),('CH23','DT24'),('CH24','DT24'),('CH01','DT25'),('CH02','DT25'),('CH03','DT25'),('CH04','DT25'),('CH05','DT25'),('CH08','DT25'),('CH10','DT25'),('CH17','DT25'),('CH18','DT25'),('CH21','DT25'),('CH22','DT25'),('CH23','DT25'),('CH24','DT25'),('CH01','DT26'),('CH02','DT26'),('CH03','DT26'),('CH04','DT26'),('CH05','DT26'),('CH06','DT26'),('CH07','DT26'),('CH08','DT26'),('CH09','DT26'),('CH10','DT26'),('CH16','DT26'),('CH17','DT26'),('CH18','DT26'),('CH21','DT26'),('CH22','DT26'),('CH23','DT26'),('CH24','DT26'),('CH26','DT26'),('CH28','DT26'),('CH29','DT26'),('CH30','DT26'),('CH31','DT26'),('CH32','DT26'),('CH33','DT26'),('CH01','DT27'),('CH03','DT27'),('CH05','DT27'),('CH07','DT27'),('CH18','DT27'),('CH21','DT27'),('CH23','DT27'),('CH31','DT27'),('CH32','DT27'),('CH33','DT27'),('CH01','DT28'),('CH02','DT28'),('CH03','DT28'),('CH05','DT28'),('CH18','DT28'),('CH23','DT28'),('CH25','DT28'),('CH29','DT28'),('CH30','DT28'),('CH31','DT28'),('CH01','DT29'),('CH02','DT29'),('CH03','DT29'),('CH04','DT29'),('CH05','DT29'),('CH06','DT29'),('CH07','DT29'),('CH08','DT29'),('CH09','DT29'),('CH10','DT29'),('CH16','DT29'),('CH17','DT29'),('CH18','DT29'),('CH21','DT29'),('CH22','DT29'),('CH23','DT29'),('CH24','DT29'),('CH25','DT29'),('CH26','DT29'),('CH28','DT29'),('CH29','DT29'),('CH30','DT29'),('CH31','DT29'),('CH32','DT29'),('CH33','DT29'),('CH34','DT29'),('CH01','DT30'),('CH02','DT30'),('CH03','DT30'),('CH04','DT30'),('CH05','DT30'),('CH06','DT30'),('CH07','DT30'),('CH08','DT30'),('CH09','DT30'),('CH10','DT30'),('CH16','DT30'),('CH17','DT30'),('CH18','DT30'),('CH21','DT30'),('CH22','DT30'),('CH23','DT30'),('CH24','DT30'),('CH25','DT30'),('CH26','DT30'),('CH28','DT30'),('CH29','DT30'),('CH30','DT30'),('CH31','DT30'),('CH32','DT30'),('CH33','DT30'),('CH34','DT30');
/*!40000 ALTER TABLE `cauhoi_dethi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dethi`
--

DROP TABLE IF EXISTS `dethi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dethi` (
  `MADT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TENDT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NGAYTAO` datetime NOT NULL,
  `BATDAUTHI` datetime NOT NULL,
  `THOIGIAN` int(11) NOT NULL,
  `THOIHAN` datetime NOT NULL,
  `MAGV` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`MADT`),
  KEY `dethi_magv_fk_idx` (`MAGV`),
  CONSTRAINT `dethi_magv_fk` FOREIGN KEY (`MAGV`) REFERENCES `giangvien` (`MAGV`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dethi`
--

LOCK TABLES `dethi` WRITE;
/*!40000 ALTER TABLE `dethi` DISABLE KEYS */;
INSERT INTO `dethi` VALUES ('DT01','Đề thi giữa kì','2014-11-11 06:00:00','2014-11-12 07:00:00',60,'2014-12-12 00:00:00','GV01'),('DT02','Đánh giá năng lực','2014-12-12 06:00:00','2014-12-13 07:00:00',60,'2015-01-01 00:00:00','GV02'),('DT03','Đề thi ngẫu hứng','2015-01-01 06:00:00','2015-01-02 07:00:00',60,'2015-02-02 00:00:00','GV03'),('DT04','Đề thi luyện tập','2015-02-02 06:00:00','2015-02-03 07:00:00',60,'2015-03-03 00:00:00','GV04'),('DT05','Đề thi giữa kì','2015-03-03 06:00:00','2015-03-04 07:00:00',60,'2015-04-04 00:00:00','GV05'),('DT06','Đánh giá kiến thức','2015-04-04 06:00:00','2015-04-05 07:00:00',60,'2015-05-05 00:00:00','GV05'),('DT07','Luyện tập','2016-05-05 06:00:00','2016-05-06 07:00:00',60,'2016-06-06 00:00:00','GV07'),('DT08','Đề thi giữa kì','2016-06-06 06:00:00','2016-06-07 07:00:00',60,'2016-07-07 00:00:00','GV09'),('DT09','Đề thi giữa kì','2017-07-07 06:00:00','2017-07-08 07:00:00',60,'2017-08-08 00:00:00','GV09'),('DT10','Đề thi 20%','2017-08-08 06:00:00','2017-08-09 07:00:00',60,'2017-09-09 00:00:00','GV09'),('DT11','Bài thi số 1','2017-11-24 03:33:30','2017-12-00 03:33:02',10,'2017-12-24 03:33:02','gv09'),('DT12','Bài thi số 10','2017-11-24 09:56:38','2017-11-25 09:56:16',10,'2017-12-24 10:56:15','GV09'),('DT13','Bài thi số 10','2017-11-24 17:01:38','2017-11-25 17:01:07',10,'2017-12-24 17:01:07','gv09'),('DT14','Bài thi thử số 1','2017-11-24 20:03:33','2017-11-25 20:02:43',10,'2017-12-24 20:02:43','gv09'),('DT15','Bài thi thử số 1','2017-11-24 20:03:37','2017-11-25 20:02:43',10,'2017-12-24 20:02:43','gv09'),('DT16','Bài thi thử số 4','2017-11-24 20:03:42','2017-11-25 20:02:43',10,'2017-12-24 20:02:43','gv09'),('DT17','Bài luyện tập','2017-11-24 20:03:54','2017-11-25 20:02:43',40,'2017-12-24 20:02:43','gv09'),('DT18','Bài luyện tập','2017-11-24 20:03:58','2017-11-25 20:02:43',40,'2017-12-24 20:02:43','gv09'),('DT20','Bài luyện tập 3','2017-11-26 09:51:51','2017-12-26 09:51:10',10,'2017-12-26 09:51:10','gv09'),('DT21','Bài thi số 1','2017-11-26 10:28:33','2017-11-27 10:28:11',10,'2017-12-26 10:28:10','gv11'),('DT22','Bài thi số 2','2017-11-26 10:34:01','2017-12-00 10:33:36',10,'2017-12-26 10:33:36','gv11'),('DT23','Bài thi 1 câu','2017-12-03 16:37:36','2017-12-03 01:00:00',10,'2018-01-01 01:00:00','gv09'),('DT24','Bài thi số 10','2017-12-03 16:45:27','2017-12-03 01:00:00',10,'2018-01-01 01:00:00','gv09'),('DT25','Bài thi thử số 15','2017-12-03 21:02:34','2017-12-04 19:00:00',10,'2018-01-01 19:00:00','gv09'),('DT26','Bài thi thử 100','2017-12-04 11:51:32','2017-12-04 13:00:00',40,'2018-01-01 19:00:00','gv09'),('DT27','Bài thi số 6','2017-12-04 11:53:36','2017-12-02 13:00:00',30,'2018-01-01 13:00:00','gv09'),('DT28','Testing Random','2017-12-04 12:00:59','2017-12-02 13:00:00',30,'2018-01-01 14:00:00','gv09'),('DT29','Bài thi số 15','2017-12-05 13:50:12','2017-12-05 15:00:00',30,'2018-01-01 01:00:00','gv09'),('DT30','Bài thi thử số 100','2017-12-05 15:03:11','2017-12-05 01:00:00',40,'2018-01-01 01:00:00','gv09');
/*!40000 ALTER TABLE `dethi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giangvien`
--

DROP TABLE IF EXISTS `giangvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giangvien` (
  `MAGV` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `HOTEN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SDT` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASS` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`MAGV`),
  UNIQUE KEY `EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giangvien`
--

LOCK TABLES `giangvien` WRITE;
/*!40000 ALTER TABLE `giangvien` DISABLE KEYS */;
INSERT INTO `giangvien` VALUES ('GV01','Lý Thị Kim Anh','012556644','rgger@rgr','1'),('GV02','Huỳnh Hữu Chí','025566666','nntr@rgr','2'),('GV03','Hoàng Văn Chung','558666555','rgverger@regrg','3'),('GV04','Nguyễn Xuân Chúc','125585555','bergre@regrg','4'),('GV05','Bùi Lê Duy','101258555','gbewew@tht','5'),('GV06','Trần Minh Tú','021555555','nthee@br','6'),('GV07','Phạm Thanh Trà','012555555','regeg@nnn','7'),('GV08','Đặng Hữu Tiến','255322454','avff@rgre','8'),('GV09','Phạm Ngọc Vân Thảo','2516503055','nam@gmail.com','9'),('GV10','Trần Thị Hoài Thanh','2555566666','brwfv@efvf','10'),('GV11','Nguyễn Hữu Bằng','123456','Huubang@gmail.com','11');
/*!40000 ALTER TABLE `giangvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hocki`
--

DROP TABLE IF EXISTS `hocki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hocki` (
  `MAHK` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MOTA` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TGBATDAU` datetime NOT NULL,
  `TGKETTHUC` datetime NOT NULL,
  PRIMARY KEY (`MAHK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hocki`
--

LOCK TABLES `hocki` WRITE;
/*!40000 ALTER TABLE `hocki` DISABLE KEYS */;
INSERT INTO `hocki` VALUES ('HK01','HK1-2014-2015','2014-08-28 00:00:00','2015-01-21 00:00:00'),('HK02','HK2-2014-2015','2015-02-21 00:00:00','2015-05-20 00:00:00'),('HK03','HK1-2014-2015','2015-06-10 00:00:00','2015-08-10 00:00:00'),('HK04','HK1-2015-2016','2015-08-28 00:00:00','2016-01-21 00:00:00'),('HK05','HK2-2015-2016','2016-02-21 00:00:00','2016-05-20 00:00:00'),('HK06','HK1-2015-2016','2016-06-10 00:00:00','2016-08-10 00:00:00'),('HK07','HK1-2016-2017','2016-08-28 00:00:00','2017-01-21 00:00:00'),('HK08','HK2-2016-2017','2017-02-21 00:00:00','2017-05-20 00:00:00'),('HK09','HK1-2016-2017','2017-06-10 00:00:00','2017-08-10 00:00:00'),('HK10','HK1-2017-2018','2017-08-28 00:00:00','2018-01-21 00:00:00');
/*!40000 ALTER TABLE `hocki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lop`
--

DROP TABLE IF EXISTS `lop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lop` (
  `MALOP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TENLOP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MAHK` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAGV` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAMH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MALOP`),
  KEY `lop_mahk_fk_idx` (`MAHK`),
  KEY `lop_magv_fk_idx` (`MAGV`),
  KEY `lop_mamh_fk_idx` (`MAMH`),
  CONSTRAINT `lop_magv_fk` FOREIGN KEY (`MAGV`) REFERENCES `giangvien` (`MAGV`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lop_mahk_fk` FOREIGN KEY (`MAHK`) REFERENCES `hocki` (`MAHK`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lop_mamh_fk` FOREIGN KEY (`MAMH`) REFERENCES `mon` (`MAMH`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lop`
--

LOCK TABLES `lop` WRITE;
/*!40000 ALTER TABLE `lop` DISABLE KEYS */;
INSERT INTO `lop` VALUES ('LP01','AV1-1','HK01','GV01','MH01'),('LP02','AV1-2','HK01','GV02','MH01'),('LP03','AV1-3','HK02','GV03','MH01'),('LP04','AV2-1','HK03','GV04','MH02'),('LP05','AV2-2','HK04','GV05','MH02'),('LP06','AV2-3','HK04','GV06','MH02'),('LP07','AV3-1','HK05','GV07','MH03'),('LP08','AV3-2','HK05','GV08','MH03'),('LP09','AV3-3','HK05','GV09','MH03'),('LP10','AV3-4','HK06','GV10','MH03'),('LP11','MATH-A101','HK10','GV01','MH01'),('LP12','MATH-A102','HK10','GV01','MH02'),('LP13','MATH-A103','HK10','GV02','MH03'),('LP14','PS-A104','HK10','GV02','MH04'),('LP15','PS-A105','HK10','GV03','MH05'),('LP16','AV-A201','HK10','GV03','MH06'),('LP17','AV-AB01','HK10','GV09','MH06'),('LP18','AV-AC01','HK10','GV09','MH06'),('LP19','Lớp vật lý 1','HK10','GV02','MH04'),('LP20','Vật lý 2','HK10','GV11','MH04'),('LP21','Vật lý 3','HK10','GV11','MH04');
/*!40000 ALTER TABLE `lop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lop_sv`
--

DROP TABLE IF EXISTS `lop_sv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lop_sv` (
  `MALOP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MSSV` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`MALOP`,`MSSV`),
  KEY `mssv_idx` (`MSSV`),
  CONSTRAINT `lopsv_malop_fk` FOREIGN KEY (`MALOP`) REFERENCES `lop` (`MALOP`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lopsv_mssv_fk` FOREIGN KEY (`MSSV`) REFERENCES `sinhvien` (`MSSV`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lop_sv`
--

LOCK TABLES `lop_sv` WRITE;
/*!40000 ALTER TABLE `lop_sv` DISABLE KEYS */;
INSERT INTO `lop_sv` VALUES ('LP01','SV01'),('LP02','SV01'),('LP14','SV01'),('LP17','SV01'),('LP01','SV02'),('LP03','SV02'),('LP17','SV02'),('LP20','SV02'),('LP01','SV03'),('LP05','SV03'),('LP17','SV03'),('LP19','SV03'),('LP01','SV04'),('LP17','SV04'),('LP19','SV04'),('LP02','SV05'),('LP18','SV05'),('LP19','SV05'),('LP03','SV06'),('LP18','SV06'),('LP19','SV06'),('LP14','SV07'),('LP18','SV07'),('LP04','SV08'),('LP18','SV08'),('LP19','SV08'),('LP18','SV09'),('LP19','SV09'),('LP18','SV10'),('LP19','SV10'),('LP20','SV11');
/*!40000 ALTER TABLE `lop_sv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mon`
--

DROP TABLE IF EXISTS `mon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mon` (
  `MAMH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TENMH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`MAMH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mon`
--

LOCK TABLES `mon` WRITE;
/*!40000 ALTER TABLE `mon` DISABLE KEYS */;
INSERT INTO `mon` VALUES ('MH01','Toán cao cấp A1'),('MH02','Toán cao cấp A2'),('MH03','Toán cao cấp A3'),('MH04','Vật lý 1'),('MH05','Vật lý 2'),('MH06','Anh văn 1'),('MH07','Anh văn 2'),('MH08','Anh văn 3'),('MH09','Hóa 1'),('MH10','Hóa 2');
/*!40000 ALTER TABLE `mon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phan`
--

DROP TABLE IF EXISTS `phan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phan` (
  `MAPHAN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TENPHAN` varchar(255) CHARACTER SET utf8 NOT NULL,
  `MAMH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`MAPHAN`),
  KEY `phan_mamh_fk_idx` (`MAMH`),
  CONSTRAINT `phan_mamh_fk` FOREIGN KEY (`MAMH`) REFERENCES `mon` (`MAMH`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phan`
--

LOCK TABLES `phan` WRITE;
/*!40000 ALTER TABLE `phan` DISABLE KEYS */;
INSERT INTO `phan` VALUES ('PH01','Ngữ pháp 1','MH06'),('PH02','Ngữ pháp 2','MH06'),('PH03','Ma trận','MH01'),('PH04','Định thức','MH01'),('PH05','Giới hạn','MH02'),('PH06','Tích phân hai lớp','MH02'),('PH07','Đại số tuyến tính','MH03'),('PH08','Hình học Topo','MH03'),('PH09','Cơ học','MH04'),('PH10','Quang học','MH04'),('PH11','Điện từ','MH04'),('PH12','Dao động','MH05'),('PH13','Nguyên tử','MH05'),('PH14','Nhấn âm 2','MH07'),('PH15','Nhấn âm 3','MH07'),('PH16','Đọc hiểu 1','MH07'),('PH17','Ngữ pháp 2','MH08'),('PH18','Đọc hiểu 2','MH08'),('PH19','Kim loại','MH09'),('PH20','Hóa học đại cương','MH09'),('PH21','Este','MH10'),('PH22','Lipit','MH10');
/*!40000 ALTER TABLE `phan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qtv`
--

DROP TABLE IF EXISTS `qtv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qtv` (
  `magv` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`magv`),
  CONSTRAINT `qtv_ibfk_1` FOREIGN KEY (`magv`) REFERENCES `giangvien` (`MAGV`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qtv`
--

LOCK TABLES `qtv` WRITE;
/*!40000 ALTER TABLE `qtv` DISABLE KEYS */;
INSERT INTO `qtv` VALUES ('GV08'),('GV09');
/*!40000 ALTER TABLE `qtv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sinhvien`
--

DROP TABLE IF EXISTS `sinhvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sinhvien` (
  `MSSV` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `HOTEN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SDT` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASS` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`MSSV`),
  UNIQUE KEY `EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinhvien`
--

LOCK TABLES `sinhvien` WRITE;
/*!40000 ALTER TABLE `sinhvien` DISABLE KEYS */;
INSERT INTO `sinhvien` VALUES ('SV01','Trần Dương Yến Nhi','482278654','ewfwe@gbr','1'),('SV02','Vũ Minh Ngọc','021533360','nmd@ttg','2'),('SV03','Nguyễn Hà My','025464225','efwfwf@ggg','3'),('SV04','Huỳnh Phan Kỳ Lân','06225544','wfwef@nhjr','4'),('SV05','Lê Trần Anh Khoa','02155666','fw@rrrr','5'),('SV06','Nguyễn Xuân Trường','0125463588','bbhhuu@ftgg','6'),('SV07','Nguyễn Đình Trọng','035942666','btee@htf','7'),('SV08','Trương Quốc Trí','015833355','tttt@nhhh','8'),('SV09','Trịnh Quốc Tiến','06555555','yyyyy@ertt','9'),('SV10','Nguyễn Thành Thê','015456666','nhddbb@rrtt','10'),('SV11','Lưu Nhân','012345','luunhan@gmail.com','11');
/*!40000 ALTER TABLE `sinhvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thi`
--

DROP TABLE IF EXISTS `thi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thi` (
  `MSSV` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MADT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DIEMTHI` decimal(18,2) DEFAULT NULL,
  `NGAYTHI` datetime DEFAULT NULL,
  `DAPANCHON` longtext COLLATE utf8_unicode_ci,
  `NOIDUNGBAITHI` longtext COLLATE utf8_unicode_ci,
  `SOCAUDUNG` int(11) DEFAULT NULL,
  `XACNHAN` bit(1) DEFAULT b'0',
  PRIMARY KEY (`MSSV`,`MADT`),
  KEY `madt_idx` (`MADT`),
  CONSTRAINT `thi_madt_fk` FOREIGN KEY (`MADT`) REFERENCES `dethi` (`MADT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `thi_mssv_fk` FOREIGN KEY (`MSSV`) REFERENCES `sinhvien` (`MSSV`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thi`
--

LOCK TABLES `thi` WRITE;
/*!40000 ALTER TABLE `thi` DISABLE KEYS */;
INSERT INTO `thi` VALUES ('SV01','DT01',NULL,NULL,NULL,NULL,NULL,'\0'),('SV01','DT02',NULL,NULL,NULL,NULL,NULL,'\0'),('SV01','DT11',NULL,NULL,NULL,NULL,NULL,'\0'),('SV01','DT12',NULL,NULL,NULL,NULL,NULL,'\0'),('SV01','DT13',2.00,'2017-12-07 15:17:30',NULL,'[5,1,2,0,3,1][3,2,2,3,0,1][1,2,2,1,0,3][8,2,1,2,0,3][2,0,0,1,2,3][7,3,1,2,3,0][6,0,0,1,3,2][0,2,1,2,0,3][9,3,3,1,2,0][4,3,3,1,2,0]',2,''),('SV01','DT14',3.00,'2017-12-07 15:20:39','[3][3][2][1][0][3][3][1][1][1]','[7,3,1,3,2,0][4,1,2,0,3,1][3,1,2,0,3,1][0,0,0,3,2,1][8,1,3,0,1,2][6,2,1,2,0,3][5,1,2,0,1,3][2,3,1,2,3,0][1,3,2,1,3,0][9,0,0,2,1,3]',3,''),('SV01','DT15',2.00,'2017-12-07 15:25:19','[0][3][0][3][0][3][0][0][3][3]','[5,1,1,0,2,3][8,1,3,0,2,1][1,1,3,0,2,1][4,2,1,3,0,2][0,0,0,1,3,2][2,3,1,3,2,0][3,1,2,0,1,3][7,0,0,3,2,1][6,3,2,1,3,0][9,1,2,0,3,1]',2,''),('SV01','DT16',NULL,NULL,NULL,NULL,NULL,'\0'),('SV01','DT17',NULL,NULL,NULL,NULL,NULL,'\0'),('SV01','DT18',NULL,NULL,NULL,NULL,NULL,'\0'),('SV01','DT20',NULL,NULL,NULL,NULL,NULL,'\0'),('SV01','DT23',NULL,NULL,NULL,NULL,NULL,'\0'),('SV01','DT29',3.00,'2017-12-07 15:26:40','[0][0][0][0][0][0][0][0][0][0][0][0][0][0][0][0][0][0][0][0][0][0][0][0][0][0]','[13,2,3,2,0,1][1,3,3,1,2,0][23,1,3,0,2,1][0,1,3,0,2,1][5,0,0,2,1,3][14,0,0,3,2,1][11,3,3,1,2,0][10,2,2,1,0,3][21,1,2,0,3,1][9,3,3,1,2,0][12,2,3,1,0,2][6,3,3,2,1,0][16,1,3,0,1,2][25,0,0,1,3,2][3,1,1,0,3,2][17,2,2,3,0,1][24,2,3,2,0,1][22,0,0,1,3,2][2,0,0,1,2,3][19,1,1,0,3,2][18,0,0,2,1,3][15,1,1,0,3,2][7,0,0,1,2,3][8,1,2,0,1,3][4,0,0,2,1,3][20,1,2,0,1,3]',8,''),('SV02','DT03',NULL,NULL,NULL,NULL,NULL,'\0'),('SV02','DT11',NULL,NULL,NULL,NULL,NULL,'\0'),('SV02','DT12',NULL,NULL,NULL,NULL,NULL,'\0'),('SV02','DT13',NULL,NULL,NULL,NULL,NULL,'\0'),('SV02','DT14',NULL,NULL,NULL,NULL,NULL,'\0'),('SV02','DT15',NULL,NULL,NULL,NULL,NULL,'\0'),('SV02','DT16',NULL,NULL,NULL,NULL,NULL,'\0'),('SV02','DT17',NULL,NULL,NULL,NULL,NULL,'\0'),('SV02','DT18',NULL,NULL,NULL,NULL,NULL,'\0'),('SV02','DT20',NULL,NULL,NULL,NULL,NULL,'\0'),('SV02','DT21',NULL,NULL,NULL,NULL,NULL,'\0'),('SV02','DT22',NULL,NULL,NULL,NULL,NULL,'\0'),('SV02','DT23',NULL,NULL,NULL,NULL,NULL,'\0'),('SV02','DT29',NULL,NULL,NULL,NULL,NULL,'\0'),('SV03','DT03',NULL,NULL,NULL,NULL,NULL,'\0'),('SV03','DT11',NULL,NULL,NULL,NULL,NULL,'\0'),('SV03','DT12',NULL,NULL,NULL,NULL,NULL,'\0'),('SV03','DT13',NULL,NULL,NULL,NULL,NULL,'\0'),('SV03','DT14',NULL,NULL,NULL,NULL,NULL,'\0'),('SV03','DT15',NULL,NULL,NULL,NULL,NULL,'\0'),('SV03','DT16',NULL,NULL,NULL,NULL,NULL,'\0'),('SV03','DT17',NULL,NULL,NULL,NULL,NULL,'\0'),('SV03','DT18',NULL,NULL,NULL,NULL,NULL,'\0'),('SV03','DT20',NULL,NULL,NULL,NULL,NULL,'\0'),('SV03','DT29',NULL,NULL,NULL,NULL,NULL,'\0'),('SV04','DT11',NULL,NULL,NULL,NULL,NULL,'\0'),('SV04','DT12',NULL,NULL,NULL,NULL,NULL,'\0'),('SV04','DT13',NULL,NULL,NULL,NULL,NULL,'\0'),('SV04','DT14',NULL,NULL,NULL,NULL,NULL,'\0'),('SV04','DT15',NULL,NULL,NULL,NULL,NULL,'\0'),('SV04','DT16',NULL,NULL,NULL,NULL,NULL,'\0'),('SV04','DT17',NULL,NULL,NULL,NULL,NULL,'\0'),('SV04','DT18',NULL,NULL,NULL,NULL,NULL,'\0'),('SV04','DT20',NULL,NULL,NULL,NULL,NULL,'\0'),('SV05','DT04',NULL,NULL,NULL,NULL,NULL,'\0'),('SV05','DT05',NULL,NULL,NULL,NULL,NULL,'\0'),('SV05','DT11',NULL,NULL,NULL,NULL,NULL,'\0'),('SV05','DT12',NULL,NULL,NULL,NULL,NULL,'\0'),('SV05','DT13',NULL,NULL,NULL,NULL,NULL,'\0'),('SV05','DT14',NULL,NULL,NULL,NULL,NULL,'\0'),('SV05','DT15',NULL,NULL,NULL,NULL,NULL,'\0'),('SV05','DT16',NULL,NULL,NULL,NULL,NULL,'\0'),('SV05','DT17',NULL,NULL,NULL,NULL,NULL,'\0'),('SV05','DT20',NULL,NULL,NULL,NULL,NULL,'\0'),('SV05','DT23',NULL,NULL,NULL,NULL,NULL,'\0'),('SV06','DT05',NULL,NULL,NULL,NULL,NULL,'\0'),('SV06','DT11',NULL,NULL,NULL,NULL,NULL,'\0'),('SV06','DT12',NULL,NULL,NULL,NULL,NULL,'\0'),('SV06','DT13',NULL,NULL,NULL,NULL,NULL,'\0'),('SV06','DT14',NULL,NULL,NULL,NULL,NULL,'\0'),('SV06','DT15',NULL,NULL,NULL,NULL,NULL,'\0'),('SV06','DT16',NULL,NULL,NULL,NULL,NULL,'\0'),('SV06','DT17',NULL,NULL,NULL,NULL,NULL,'\0'),('SV06','DT20',NULL,NULL,NULL,NULL,NULL,'\0'),('SV06','DT23',NULL,NULL,NULL,NULL,NULL,'\0'),('SV07','DT05',NULL,NULL,NULL,NULL,NULL,'\0'),('SV07','DT11',NULL,NULL,NULL,NULL,NULL,'\0'),('SV07','DT12',NULL,NULL,NULL,NULL,NULL,'\0'),('SV07','DT13',NULL,NULL,NULL,NULL,NULL,'\0'),('SV07','DT14',NULL,NULL,NULL,NULL,NULL,'\0'),('SV07','DT15',NULL,NULL,NULL,NULL,NULL,'\0'),('SV07','DT16',NULL,NULL,NULL,NULL,NULL,'\0'),('SV07','DT17',NULL,NULL,NULL,NULL,NULL,'\0'),('SV07','DT20',NULL,NULL,NULL,NULL,NULL,'\0'),('SV07','DT23',NULL,NULL,NULL,NULL,NULL,'\0'),('SV08','DT06',NULL,NULL,NULL,NULL,NULL,'\0'),('SV08','DT11',NULL,NULL,NULL,NULL,NULL,'\0'),('SV08','DT12',NULL,NULL,NULL,NULL,NULL,'\0'),('SV08','DT13',NULL,NULL,NULL,NULL,NULL,'\0'),('SV08','DT14',NULL,NULL,NULL,NULL,NULL,'\0'),('SV08','DT15',NULL,NULL,NULL,NULL,NULL,'\0'),('SV08','DT16',NULL,NULL,NULL,NULL,NULL,'\0'),('SV08','DT17',NULL,NULL,NULL,NULL,NULL,'\0'),('SV08','DT18',NULL,NULL,NULL,NULL,NULL,'\0'),('SV09','DT11',NULL,NULL,NULL,NULL,NULL,'\0'),('SV09','DT12',NULL,NULL,NULL,NULL,NULL,'\0'),('SV09','DT13',NULL,NULL,NULL,NULL,NULL,'\0'),('SV09','DT14',NULL,NULL,NULL,NULL,NULL,'\0'),('SV09','DT15',NULL,NULL,NULL,NULL,NULL,'\0'),('SV09','DT16',NULL,NULL,NULL,NULL,NULL,'\0'),('SV09','DT17',NULL,NULL,NULL,NULL,NULL,'\0'),('SV09','DT18',NULL,NULL,NULL,NULL,NULL,'\0'),('SV09','DT23',NULL,NULL,NULL,NULL,NULL,'\0'),('SV10','DT11',NULL,NULL,NULL,NULL,NULL,'\0'),('SV10','DT12',NULL,NULL,NULL,NULL,NULL,'\0'),('SV10','DT13',NULL,NULL,NULL,NULL,NULL,'\0'),('SV10','DT14',NULL,NULL,NULL,NULL,NULL,'\0'),('SV10','DT15',NULL,NULL,NULL,NULL,NULL,'\0'),('SV10','DT16',NULL,NULL,NULL,NULL,NULL,'\0'),('SV10','DT17',NULL,NULL,NULL,NULL,NULL,'\0'),('SV10','DT18',NULL,NULL,NULL,NULL,NULL,'\0'),('SV10','DT23',NULL,NULL,NULL,NULL,NULL,'\0'),('SV11','DT21',NULL,NULL,NULL,NULL,NULL,'\0'),('SV11','DT22',NULL,NULL,NULL,NULL,NULL,'\0');
/*!40000 ALTER TABLE `thi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'thitn'
--

--
-- Dumping routines for database 'thitn'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_generateID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generateID`(
maxid varchar(255)
) RETURNS varchar(255) CHARSET utf8
BEGIN
	declare firstpart varchar(255); 
    declare secondpart varchar(255);
    set firstpart = substring(maxid, 1, 2);
    set secondpart = convert(substring(maxid, 3, length(maxid) - 2), UNSIGNED) + 1;
	return concat(firstpart, secondpart);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_getMaxQuestionID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_getMaxQuestionID`() RETURNS varchar(255) CHARSET utf8
BEGIN
	declare maxid varchar(255); 
    set maxid = 'CH0';
	select MACH into maxid from CAUHOI 
		where fn_getSecondPartOfID(MACH) >= all (select fn_getSecondPartOfID(MACH) from CAUHOI);
	return maxid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_getMaxTestID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_getMaxTestID`() RETURNS varchar(255) CHARSET utf8
BEGIN
	declare maxid varchar(255); 
    set maxid = 'DT0';
	select MADT into maxid from dethi 
		where fn_getSecondPartOfID(madt) >= all (select fn_getSecondPartOfID(madt) from dethi);
	return maxid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_getSecondPartOfID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_getSecondPartOfID`(
id varchar(255)
) RETURNS int(11)
BEGIN
	declare secondpart int;
    set secondpart = convert(substring(id, 3, length(id) - 2), unsigned);
	return secondpart;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_isDateInRange` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_isDateInRange`(
checkdate datetime, begin datetime, end datetime
) RETURNS int(11)
BEGIN
	if(checkdate >= begin and checkdate <= end) then
		return 1;
	end if;
	return 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_changeEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_changeEmail`(
in usertype varchar(20),
in username varchar(255),
in newemail varchar(20)
)
BEGIN
	if(usertype = 'gv') then
		update giangvien set email = newemail where magv = username;
    elseif(usertype = 'sv') then
		update sinhvien set email = newemail where mssv = username;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_changePass` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_changePass`(
in usertype varchar(5),
in username varchar(255),
in oldpass varchar(50),
in newpass varchar(50)
)
BEGIN
	if(usertype = 'gv') then
		update giangvien set pass = newpass where magv = username and pass = oldpass;
    elseif(usertype = 'sv') then
		update sinhvien set pass = newpass where mssv = username and pass = oldpass;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_changePhone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_changePhone`(
in usertype varchar(20),
in username varchar(255),
in newphone varchar(20)
)
BEGIN
	if(usertype = 'gv') then
		update giangvien set sdt = newphone where magv = username;
    elseif(usertype = 'sv') then
		update sinhvien set sdt = newphone where mssv = username;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_loadAllSemesters` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_loadAllSemesters`()
BEGIN
	select * from hocki order by tgbatdau desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_loadAllSubjects` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_loadAllSubjects`()
BEGIN
	select * from MON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_loadCurrentSemester` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_loadCurrentSemester`()
BEGIN
	select * from HOCKI where fn_isDateInRange(now(), TGBATDAU, TGKETTHUC) = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_loadTestAndQuestions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_loadTestAndQuestions`(
in testid varchar(255)
)
BEGIN
	select CAUHOI.* from CAUHOI, CAUHOI_DETHI
	where CAUHOI_DETHI.MADT = testid and CAUHOI_DETHI.MACH = CAUHOI.MACH;
	select * from DETHI where DETHI.MADT = testid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login`(
in username varchar(255),
in password varchar(50),
in usertype varchar(255)
)
BEGIN
	if(usertype = 'gv') then
		select hoten, email, sdt from giangvien where magv = username and pass = password;
    elseif(usertype = 'sv') then
			select hoten, email, sdt from sinhvien where mssv = username and pass = password;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_stEndTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_stEndTest`(
in _madt varchar(255),
in _mssv varchar(255),
in _diemthi float,
in _socaudung int,
in _dapanchon longtext
)
BEGIN
	update thi set diemthi = _diemthi, socaudung = _socaudung, dapanchon = _dapanchon,
    xacnhan=1
    where madt = _madt and mssv = _mssv;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_stLoadClasses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_stLoadClasses`(
in semesterid varchar(255),
in studentid varchar(255)
)
BEGIN
	select LOP.* from LOP_SV, LOP 
	where LOP.MALOP = LOP_SV.MALOP and LOP.MAHK = semesterid and LOP_SV.MSSV = studentid
    order by Lop.tenlop; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_stLoadTestDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_stLoadTestDetails`(
in classid varchar(255),
in testid varchar(255),
in studentid varchar(255)
)
BEGIN
select TMP2.*, lop.mamh, tenmh from lop join mon
join
(	select TMP1.*, count(TMP1.madt) as socauhoi from cauhoi_dethi right join 
	(		select dethi.*, ngaythi, xacnhan from dethi join 
		thi on thi.madt = dethi.madt where dethi.madt = testid and mssv = studentid
	) as TMP1 on TMP1.madt = cauhoi_dethi.madt group by TMP1.madt
) as TMP2 on TMP2.magv = lop.magv and lop.mamh = mon.mamh where malop = classid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_stLoadTesting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_stLoadTesting`(
in testid varchar(255),
in studentid varchar(255)
)
BEGIN
	select * from thi where mssv = studentid and madt = testid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_stLoadTests` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_stLoadTests`(
in mahk varchar(255),
in malop varchar(255),
in mssv varchar(255)
)
BEGIN
	declare _start datetime;
	declare _end datetime;
    
	select @_start := TGBATDAU, @_end := TGKETTHUC from HOCKI where MAHK = mahk;
	select TMP1.* from LOP join
	(
		select DETHI.*, DIEMTHI, NGAYTHI from THI, DETHI
		where THI.MSSV = mssv and THI.MADT = DETHI.MADT 
		and fn_isDateInRange(DETHI.BATDAUTHI, @_start, @_end) = 1
	) as TMP1 on TMP1.MAGV = LOP.MAGV and LOP.MALOP = malop order by TMP1.batdauthi, TMP1.ngaytao;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_stSaveStartTesting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_stSaveStartTesting`(
in testid varchar(255),
in studentid varchar(255),
in testdata longtext
)
BEGIN
	update thi set ngaythi = now(), diemthi = 0, noidungbaithi = testdata  where mssv = studentid and madt = testid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tcAddQuestion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tcAddQuestion`(
in content longtext,
in correct longtext,
in wrongs longtext,
in partid varchar(255)
)
BEGIN
	declare id varchar(255);
    set id = fn_generateID(fn_getMaxQuestionID());
    insert into cauhoi values(id, partid, correct, wrongs, content, now());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tcAddQuestionsToTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tcAddQuestionsToTest`(
in questionid varchar(255),
in testid varchar(255)
)
BEGIN
	insert into cauhoi_dethi values(questionid, testid);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tcAddStudentsToTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tcAddStudentsToTest`(
in testid varchar(255),
in studentid varchar(255)
)
BEGIN
    
    if(not exists(select mssv from thi where madt = testid and mssv = studentid)) then
		insert into thi(madt, mssv) values(testid, studentid);
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tcCreateTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tcCreateTest`(
out outid varchar(255),
in name nvarchar(255),
in teacherid varchar(255),
in start datetime,
in end datetime,
in duration int
)
BEGIN
	declare currentdatetime datetime;
	declare testId varchar(255);
    set currentdatetime = now();
    set testId = fn_generateID(fn_getMaxTestID());
    set outid = testid;
    insert into DETHI values(testid, name, currentdatetime, start, duration, end, teacherid);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tcDeleteQuestion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tcDeleteQuestion`(
in id varchar(255)
)
BEGIN
	delete from cauhoi where mach = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tcDeleteStudentsFromTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tcDeleteStudentsFromTest`(
in testid varchar(255),
in studentid varchar(255)
)
BEGIN
	if(exists (select mssv from thi where madt = testid and mssv = studentid)) then
		delete from thi where madt = testid and mssv = studentid;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tcDeleteTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tcDeleteTest`(
in testid varchar(255)
)
BEGIN
	delete from dethi where madt = testid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tcEditTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tcEditTest`(
in id varchar(255),
in _name varchar(255),
in _start datetime,
in _end datetime,
in duration int
)
BEGIN
	update dethi set tendt = _name, batdauthi = _start, thoihan = _end, thoigian = duration
    where madt = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tcLoadAllSubjects` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tcLoadAllSubjects`()
BEGIN
	select MAMH, TENMH from MON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tcLoadClasses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tcLoadClasses`(
in semesterid varchar(255),
in teacherid varchar(255),
in subjectid varchar(255)
)
BEGIN
	select * from lop where mahk = semesterid and magv = teacherid and mamh = subjectid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tcLoadOneTestDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tcLoadOneTestDetails`(
in id varchar(255)
)
BEGIN
	select T1.*, count(thi.madt) as sosinhvien from thi
    right join
    (select dethi.*, count(cauhoi_dethi.madt) as socauhoi from dethi left join cauhoi_dethi
    on dethi.madt = cauhoi_dethi.madt
    where dethi.madt = id
    group by dethi.madt) as T1 on T1.madt = thi.madt group by T1.madt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tcLoadParts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tcLoadParts`(
in mamh varchar(255)
)
BEGIN
	select PHAN.MAPHAN, TENPHAN from MON, PHAN 
		where MON.MAMH = PHAN.MAMH and mamh = MON.MAMH;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tcLoadQuestionsInRange` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tcLoadQuestionsInRange`(
in partid varchar(255),
in searchstring longtext,
in _offset int,
in length int
)
BEGIN
	select * from cauhoi
    where maphan = partid and mota like concat('%',searchstring,'%') 
    limit _offset, length;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tcLoadQuestionsOfPart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tcLoadQuestionsOfPart`(
in partid varchar(255)
)
BEGIN
	select * from cauhoi where maphan = partid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tcLoadStudentsAndTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tcLoadStudentsAndTest`(
in testid varchar(255),
in classid varchar(255)
)
BEGIN
	select TMP.MSSV, TMP.HOTEN, THI.MADT from (
		select SINHVIEN.MSSV, SINHVIEN.HOTEN from SINHVIEN, LOP_SV 
		where SINHVIEN.MSSV = LOP_SV.MSSV and LOP_SV.MALOP = classid
	) as TMP left join THI on THI.MSSV = TMP.MSSV and THI.MADT = testid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tcLoadStudentsOfTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tcLoadStudentsOfTest`(
in classid varchar(255),
in testid varchar(255)
)
BEGIN
	select TMP.MSSV, TMP.HOTEN, THI.NGAYTHI, THI.DIEMTHI from (
		select SINHVIEN.MSSV, SINHVIEN.HOTEN from SINHVIEN, LOP_SV 
		where SINHVIEN.MSSV = LOP_SV.MSSV and LOP_SV.MALOP = classid
	) as TMP join THI on THI.MSSV = TMP.MSSV and THI.MADT = testid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tcloadSubjects` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tcloadSubjects`(
in magv varchar(255),
in mahk varchar(255)
)
BEGIN
	select MON.* from MON, LOP
	where MON.MAMH = LOP.MAMH and LOP.MAHK = mahk and LOP.MAGV = magv
	group by MON.MAMH, TENMH;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tcLoadTests` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tcLoadTests`(
in semesterid varchar(255),
in teacherid varchar(255),
in subjectid varchar(255),
in searchstring longtext
)
BEGIN
	declare search longtext;
    set search = concat('%', searchstring,'%');
	select DT.MADT, DT.TENDT, DT.NGAYTAO, DT.BATDAUTHI, DT.THOIGIAN, DT.THOIHAN, DT.MAGV from CAUHOI_DETHI join
	(
		select * from DETHI, (
				select MAHK,TGBATDAU,TGKETTHUC from HOCKI where MAHK = semesterid
			) as HK
		where fn_isDateInRange(DETHI.NGAYTAO,HK.TGBATDAU,HK.TGKETTHUC) = 1 and MAGV = teacherid
	) as DT on DT.MADT = CAUHOI_DETHI.MADT join
	(
		select MAPHAN, MACH from CAUHOI
	) as CH on CH.MACH = CAUHOI_DETHI.MACH join
	(
		select MAPHAN, MAMH from PHAN where MAMH = subjectid
	) as PH on PH.MAPHAN = CH.MAPHAN 
    where DT.madt like search or DT.tendt like search
	group by DT.MADT, DT.TENDT, DT.NGAYTAO, DT.BATDAUTHI, DT.THOIHAN, DT.THOIGIAN, DT.MAGV
    order by DT.batdauthi, DT.ngaytao;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tcNumOfQuestionPerPart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tcNumOfQuestionPerPart`(
in subjectid varchar(255)
)
BEGIN
	select phan.maphan, phan.tenphan, count(phan.maphan) as socauhoi from phan join cauhoi 
    where mamh = subjectid and phan.maphan = cauhoi.maphan group by phan.maphan, phan.tenphan;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-07 15:33:27
