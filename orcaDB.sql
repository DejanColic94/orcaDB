/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.22 : Database - orca
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`orca` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `orca`;

/*Table structure for table `autor` */

DROP TABLE IF EXISTS `autor`;

CREATE TABLE `autor` (
  `autorID` int NOT NULL,
  `imeAutora` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`autorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `autor` */

/*Table structure for table `clan` */

DROP TABLE IF EXISTS `clan`;

CREATE TABLE `clan` (
  `clanID` int NOT NULL,
  `imePrezime` varchar(255) DEFAULT NULL,
  `telefon` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `primerakID` int NOT NULL,
  PRIMARY KEY (`clanID`),
  KEY `primerakID` (`primerakID`),
  CONSTRAINT `clan_ibfk_1` FOREIGN KEY (`primerakID`) REFERENCES `primerak` (`primerakID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `clan` */

/*Table structure for table `izdanje` */

DROP TABLE IF EXISTS `izdanje`;

CREATE TABLE `izdanje` (
  `knigaID` int NOT NULL,
  `brojIzdanja` int NOT NULL,
  `izdavacID` int NOT NULL,
  PRIMARY KEY (`knigaID`,`brojIzdanja`),
  KEY `izdanje_ibfk_1` (`izdavacID`),
  CONSTRAINT `izdanje_ibfk_1` FOREIGN KEY (`izdavacID`) REFERENCES `izdavac` (`izdavacID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `izdanje` */

/*Table structure for table `izdavac` */

DROP TABLE IF EXISTS `izdavac`;

CREATE TABLE `izdavac` (
  `izdavacID` int NOT NULL,
  `nazivIzdavaca` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`izdavacID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `izdavac` */

/*Table structure for table `knjiga` */

DROP TABLE IF EXISTS `knjiga`;

CREATE TABLE `knjiga` (
  `knjigaID` int NOT NULL,
  `naziv` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`knjigaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `knjiga` */

/*Table structure for table `pise` */

DROP TABLE IF EXISTS `pise`;

CREATE TABLE `pise` (
  `autorID` int NOT NULL,
  `knjigaID` int NOT NULL,
  `godina` int DEFAULT NULL,
  PRIMARY KEY (`autorID`,`knjigaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pise` */

/*Table structure for table `primerak` */

DROP TABLE IF EXISTS `primerak`;

CREATE TABLE `primerak` (
  `primerakID` int NOT NULL,
  `knjigaID` int NOT NULL,
  `brojIzdanja` int NOT NULL,
  PRIMARY KEY (`primerakID`),
  KEY `primerak_ibfk_1` (`knjigaID`,`brojIzdanja`),
  CONSTRAINT `primerak_ibfk_1` FOREIGN KEY (`knjigaID`, `brojIzdanja`) REFERENCES `izdanje` (`knigaID`, `brojIzdanja`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `primerak` */

/*Table structure for table `pripada` */

DROP TABLE IF EXISTS `pripada`;

CREATE TABLE `pripada` (
  `zanrID` int NOT NULL,
  `knjigaID` int NOT NULL,
  PRIMARY KEY (`zanrID`,`knjigaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pripada` */

/*Table structure for table `radnik` */

DROP TABLE IF EXISTS `radnik`;

CREATE TABLE `radnik` (
  `radnikID` int NOT NULL,
  `imePrezime` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`radnikID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `radnik` */

/*Table structure for table `zaduzenje` */

DROP TABLE IF EXISTS `zaduzenje`;

CREATE TABLE `zaduzenje` (
  `zaduzenjeID` int NOT NULL,
  `datumZaduzenja` date DEFAULT NULL,
  `datumRazduzenja` date DEFAULT NULL,
  `clanID` int NOT NULL,
  `primerakID` int NOT NULL,
  `radnikZaduzioID` int NOT NULL,
  `radnikRazduzioID` int NOT NULL,
  PRIMARY KEY (`zaduzenjeID`),
  KEY `zaduzenje_ibfk_1` (`clanID`),
  KEY `zaduzenje_ibfk_2` (`primerakID`),
  KEY `zaduzenje_ibfk_3` (`radnikZaduzioID`),
  KEY `zaduzenje_ibfk_4` (`radnikRazduzioID`),
  CONSTRAINT `zaduzenje_ibfk_1` FOREIGN KEY (`clanID`) REFERENCES `clan` (`clanID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `zaduzenje_ibfk_2` FOREIGN KEY (`primerakID`) REFERENCES `primerak` (`primerakID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `zaduzenje_ibfk_3` FOREIGN KEY (`radnikZaduzioID`) REFERENCES `radnik` (`radnikID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `zaduzenje_ibfk_4` FOREIGN KEY (`radnikRazduzioID`) REFERENCES `radnik` (`radnikID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zaduzenje` */

/*Table structure for table `zanr` */

DROP TABLE IF EXISTS `zanr`;

CREATE TABLE `zanr` (
  `zanrID` int NOT NULL,
  `nazivZanra` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`zanrID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zanr` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
