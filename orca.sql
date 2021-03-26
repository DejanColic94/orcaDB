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
  `autorID` int NOT NULL AUTO_INCREMENT,
  `imeAutora` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`autorID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `autor` */

insert  into `autor`(`autorID`,`imeAutora`) values 
(1,'Oto Vajninger'),
(2,'Nikolo Makijaveli'),
(3,'Majkl Gelb'),
(4,'Sun Cu'),
(5,'Mijamoto Musasi'),
(6,'Markus Aurelius'),
(7,'F.M.Dostojevski'),
(8,'Dzordan Piterson'),
(9,'Vuk Draskovic'),
(10,'P.P.Njegos'),
(11,'Juval Noa Harari'),
(12,'Dzosua Wickin'),
(13,'Kobi Brajant'),
(14,'Tim Grover'),
(15,'Dzef Kolvin'),
(16,'Kal Njuport'),
(17,'Robert Grin');

/*Table structure for table `clan` */

DROP TABLE IF EXISTS `clan`;

CREATE TABLE `clan` (
  `clanID` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prezime` varchar(255) DEFAULT NULL,
  `telefon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`clanID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `clan` */

insert  into `clan`(`clanID`,`ime`,`prezime`,`telefon`,`email`) values 
(1,'Pera','Peric','063295789','pera@gmail.com'),
(2,'Zika','Zikic','064555666','zika@yahoo.com');

/*Table structure for table `izdanje` */

DROP TABLE IF EXISTS `izdanje`;

CREATE TABLE `izdanje` (
  `knigaID` int NOT NULL,
  `brojIzdanja` int NOT NULL,
  `izdavacID` int NOT NULL,
  PRIMARY KEY (`knigaID`,`brojIzdanja`,`izdavacID`),
  KEY `izdavacID` (`izdavacID`),
  CONSTRAINT `izdanje_ibfk_1` FOREIGN KEY (`izdavacID`) REFERENCES `izdavac` (`izdavacID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `izdanje` */

insert  into `izdanje`(`knigaID`,`brojIzdanja`,`izdavacID`) values 
(1,1,1),
(14,1,1),
(27,1,1),
(2,1,2),
(15,1,2),
(28,1,2),
(3,1,3),
(16,1,3),
(29,1,3),
(4,1,4),
(17,1,4),
(30,1,4),
(5,1,5),
(18,1,5),
(31,1,5),
(6,1,6),
(19,1,6),
(32,1,6),
(7,1,7),
(20,1,7),
(33,1,7),
(8,1,8),
(21,1,8),
(34,1,8),
(9,1,9),
(22,1,9),
(35,1,9),
(10,1,10),
(23,1,10),
(36,1,10),
(11,1,11),
(24,1,11),
(12,1,12),
(25,1,12),
(13,1,13),
(26,1,13);

/*Table structure for table `izdavac` */

DROP TABLE IF EXISTS `izdavac`;

CREATE TABLE `izdavac` (
  `izdavacID` int NOT NULL AUTO_INCREMENT,
  `nazivIzdavaca` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`izdavacID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `izdavac` */

insert  into `izdavac`(`izdavacID`,`nazivIzdavaca`) values 
(1,'Akademija'),
(2,'Carobna knjiga'),
(3,'Dereta'),
(4,'Ethos'),
(5,'Finesa'),
(6,'Kokoro'),
(7,'Krug'),
(8,'Laguna'),
(9,'Matica srpska'),
(10,'Minerva'),
(11,'Nauka'),
(12,'Polaris'),
(13,'Politika');

/*Table structure for table `knjiga` */

DROP TABLE IF EXISTS `knjiga`;

CREATE TABLE `knjiga` (
  `knjigaID` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`knjigaID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `knjiga` */

insert  into `knjiga`(`knjigaID`,`naziv`) values 
(1,'Pol i karakter'),
(2,'Vladalac'),
(3,'O umecu ratovanja'),
(4,'Razmisljajte kao Leonardo da Vinci'),
(5,'Umece ratovanja'),
(6,'Knjiga pet prstenova'),
(7,'Misli'),
(8,'Bedni ljudi'),
(9,'Dvojnik'),
(10,'Gospodin Proharcin'),
(11,'Roman u devet pisama'),
(12,'Slabo srce'),
(13,'Polzunkov'),
(14,'Gazdarica'),
(15,'Posten lopov'),
(16,'Bele noci'),
(17,'Jelka i svadba'),
(18,'Ljubomorni muz'),
(19,'Netocka Nezvanova'),
(20,'Mali junak'),
(21,'Ujakov san'),
(22,'Selo Stepancikovo'),
(23,'Zapisi iz mrtvog doma'),
(24,'12 pravila za zivot'),
(25,'Noz'),
(26,'Gorski Vijenac'),
(27,'Luca Mikrokozma'),
(28,'Sapijens'),
(29,'Homo Deus'),
(30,'21 lekcija za 21. vek'),
(31,'The art of learning'),
(32,'The mamba mentality'),
(33,'Relentless'),
(34,'Talenat je precenjen'),
(35,'Deep Work'),
(36,'Mastery');

/*Table structure for table `pise` */

DROP TABLE IF EXISTS `pise`;

CREATE TABLE `pise` (
  `autorID` int NOT NULL,
  `knjigaID` int NOT NULL,
  PRIMARY KEY (`autorID`,`knjigaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pise` */

insert  into `pise`(`autorID`,`knjigaID`) values 
(1,1),
(2,2),
(2,3),
(3,4),
(4,5),
(5,6),
(6,7),
(7,8),
(7,9),
(7,10),
(7,11),
(7,12),
(7,13),
(7,14),
(7,15),
(7,16),
(7,17),
(7,18),
(7,19),
(7,20),
(7,21),
(7,22),
(7,23),
(8,24),
(9,25),
(10,26),
(10,27),
(11,28),
(11,29),
(11,30),
(12,31),
(13,32),
(14,33),
(15,34),
(16,35),
(17,36);

/*Table structure for table `primerak` */

DROP TABLE IF EXISTS `primerak`;

CREATE TABLE `primerak` (
  `primerakID` int NOT NULL AUTO_INCREMENT,
  `knjigaID` int NOT NULL,
  `brojIzdanja` int NOT NULL,
  PRIMARY KEY (`primerakID`),
  KEY `knjigaID` (`knjigaID`,`brojIzdanja`),
  CONSTRAINT `primerak_ibfk_1` FOREIGN KEY (`knjigaID`, `brojIzdanja`) REFERENCES `izdanje` (`knigaID`, `brojIzdanja`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `primerak` */

insert  into `primerak`(`primerakID`,`knjigaID`,`brojIzdanja`) values 
(1,1,1),
(2,2,1),
(3,3,1),
(4,4,1),
(5,5,1),
(6,6,1),
(37,6,1),
(38,6,1),
(7,7,1),
(8,8,1),
(9,9,1),
(10,10,1),
(11,11,1),
(12,12,1),
(13,13,1),
(14,14,1),
(15,15,1),
(16,16,1),
(39,16,1),
(17,17,1),
(18,18,1),
(19,19,1),
(20,20,1),
(21,21,1),
(22,22,1),
(23,23,1),
(24,24,1),
(25,25,1),
(26,26,1),
(27,27,1),
(28,28,1),
(29,29,1),
(30,30,1),
(31,31,1),
(32,32,1),
(33,33,1),
(34,34,1),
(35,35,1),
(36,36,1);

/*Table structure for table `pripada` */

DROP TABLE IF EXISTS `pripada`;

CREATE TABLE `pripada` (
  `zanrID` int NOT NULL,
  `knjigaID` int NOT NULL,
  PRIMARY KEY (`zanrID`,`knjigaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pripada` */

insert  into `pripada`(`zanrID`,`knjigaID`) values 
(2,32),
(3,4),
(4,25),
(7,1),
(7,2),
(7,3),
(7,5),
(7,6),
(7,7),
(9,28),
(10,8),
(10,9),
(10,10),
(10,11),
(10,12),
(10,13),
(10,14),
(10,15),
(10,16),
(10,17),
(10,18),
(10,19),
(10,20),
(10,21),
(10,22),
(10,23),
(15,29),
(15,30),
(16,26),
(16,27),
(17,24),
(17,31),
(17,33),
(17,34),
(17,35),
(17,36);

/*Table structure for table `radnik` */

DROP TABLE IF EXISTS `radnik`;

CREATE TABLE `radnik` (
  `radnikID` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prezime` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`radnikID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `radnik` */

insert  into `radnik`(`radnikID`,`ime`,`prezime`,`username`,`password`) values 
(1,'Dejan ','Colic','admin','admin'),
(2,'test','test','test','test');

/*Table structure for table `zaduzenje` */

DROP TABLE IF EXISTS `zaduzenje`;

CREATE TABLE `zaduzenje` (
  `zaduzenjeID` int NOT NULL AUTO_INCREMENT,
  `datumZaduzenja` date DEFAULT NULL,
  `datumRazduzenja` date DEFAULT NULL,
  `clanID` int DEFAULT NULL,
  `primerakID` int DEFAULT NULL,
  `radnikZaduzioID` int DEFAULT NULL,
  `radnikRazduzioID` int DEFAULT NULL,
  PRIMARY KEY (`zaduzenjeID`),
  KEY `clanID` (`clanID`),
  KEY `primerakID` (`primerakID`),
  KEY `radnikZaduzioID` (`radnikZaduzioID`),
  KEY `radnikRazduzioID` (`radnikRazduzioID`),
  CONSTRAINT `zaduzenje_ibfk_1` FOREIGN KEY (`clanID`) REFERENCES `clan` (`clanID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `zaduzenje_ibfk_2` FOREIGN KEY (`primerakID`) REFERENCES `primerak` (`primerakID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `zaduzenje_ibfk_3` FOREIGN KEY (`radnikZaduzioID`) REFERENCES `radnik` (`radnikID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `zaduzenje_ibfk_4` FOREIGN KEY (`radnikRazduzioID`) REFERENCES `radnik` (`radnikID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zaduzenje` */

insert  into `zaduzenje`(`zaduzenjeID`,`datumZaduzenja`,`datumRazduzenja`,`clanID`,`primerakID`,`radnikZaduzioID`,`radnikRazduzioID`) values 
(1,'2021-03-26',NULL,1,6,1,NULL),
(2,'2021-03-12','2021-03-19',2,1,1,2);

/*Table structure for table `zanr` */

DROP TABLE IF EXISTS `zanr`;

CREATE TABLE `zanr` (
  `zanrID` int NOT NULL AUTO_INCREMENT,
  `nazivZanra` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`zanrID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zanr` */

insert  into `zanr`(`zanrID`,`nazivZanra`) values 
(1,'Akcioni'),
(2,'Autobiografija'),
(3,'Biografija'),
(4,'Drama'),
(5,'Enciklopedija'),
(6,'Epska fantastika'),
(7,'Filozofija'),
(8,'Horor'),
(9,'Istorija'),
(10,'Klasik'),
(11,'Komedija'),
(12,'Kriminalistički'),
(13,'Ljubavni'),
(14,'Muzika'),
(15,'Naučna fantastika'),
(16,'Poezija'),
(17,'Psihologija'),
(18,'Trileri'),
(19,'Umetnost');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
