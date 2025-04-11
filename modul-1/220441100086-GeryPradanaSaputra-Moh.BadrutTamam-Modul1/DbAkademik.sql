/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - akademik
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`akademik` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `akademik`;

/*Table structure for table `dosen` */

DROP TABLE IF EXISTS `dosen`;

CREATE TABLE `dosen` (
  `id_dosen` int(11) NOT NULL AUTO_INCREMENT,
  `nama_dosen` varchar(55) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `keahlian` varchar(55) NOT NULL,
  PRIMARY KEY (`id_dosen`),
  UNIQUE KEY `nip` (`nip`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dosen` */

insert  into `dosen`(`id_dosen`,`nama_dosen`,`nip`,`keahlian`) values 
(1,'pk. budy','1234567890','Artificial Intelligence'),
(2,'pk. Hartono','2345678901','Machine Learning'),
(3,'Bu. Citra','3456789012','Elektronika'),
(4,'Bu Novi','4567890123','pemograman objek'),
(5,'pk. Eko','5678901234','PTIK'),
(6,'Bu. dian','6789012345','Android'),
(7,'pk. syarif','7890123456','Pemrograman web'),
(9,'Pk. Indra','9012345678','manajemen proyek'),
(10,'pk. Joko','0123456789','sistem menanajemen basis data');

/*Table structure for table `khs` */

DROP TABLE IF EXISTS `khs`;

CREATE TABLE `khs` (
  `id_nilai` int(11) NOT NULL AUTO_INCREMENT,
  `id_matakuliah` int(11) NOT NULL,
  `nilai` decimal(5,2) NOT NULL,
  `grade` char(2) NOT NULL,
  PRIMARY KEY (`id_nilai`),
  KEY `id_matakuliah` (`id_matakuliah`),
  CONSTRAINT `khs_ibfk_1` FOREIGN KEY (`id_matakuliah`) REFERENCES `matakuliah` (`id_matakuliah`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `khs` */

insert  into `khs`(`id_nilai`,`id_matakuliah`,`nilai`,`grade`) values 
(1,1,95.00,'A+'),
(2,2,78.50,'B'),
(3,3,90.00,'A'),
(4,4,65.00,'C');

/*Table structure for table `krs` */

DROP TABLE IF EXISTS `krs`;

CREATE TABLE `krs` (
  `id_krs` int(11) NOT NULL AUTO_INCREMENT,
  `id_mahasiswa` int(11) NOT NULL,
  `id_matakuliah` int(11) NOT NULL,
  `semester` varchar(10) NOT NULL,
  `tahun_akademik` varchar(10) NOT NULL,
  PRIMARY KEY (`id_krs`),
  KEY `id_mahasiswa` (`id_mahasiswa`),
  KEY `id_matakuliah` (`id_matakuliah`),
  CONSTRAINT `krs_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`),
  CONSTRAINT `krs_ibfk_2` FOREIGN KEY (`id_matakuliah`) REFERENCES `matakuliah` (`id_matakuliah`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `krs` */

insert  into `krs`(`id_krs`,`id_mahasiswa`,`id_matakuliah`,`semester`,`tahun_akademik`) values 
(1,1,1,'Genap','2024/2025'),
(2,2,2,'Ganjil','2024/2025'),
(3,3,3,'Genap','2024/2025'),
(4,4,4,'Genap','2024/2025');

/*Table structure for table `mahasiswa` */

DROP TABLE IF EXISTS `mahasiswa`;

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(55) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `jurusan` varchar(100) NOT NULL,
  PRIMARY KEY (`id_mahasiswa`),
  UNIQUE KEY `nim` (`nim`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `mahasiswa` */

insert  into `mahasiswa`(`id_mahasiswa`,`nama`,`nim`,`jurusan`) values 
(1,'Aldi Putra','202410001','Teknik Informatika'),
(2,'Budi','202410002','Sistem Informasi'),
(3,'Cindy','202410003','Teknik Elektro'),
(4,'Dian','202410004','Teknik Industri'),
(5,'mahsus','202410005','Teknik Mesin'),
(6,'andi','202410006','Manajemen Informatika'),
(7,'yanto','202410007','Ilmu Komputer'),
(8,'nindy','202410008','Hukum'),
(9,'yanty','202410009','Teknik Sipil');

/*Table structure for table `matakuliah` */

DROP TABLE IF EXISTS `matakuliah`;

CREATE TABLE `matakuliah` (
  `id_matakuliah` int(11) NOT NULL AUTO_INCREMENT,
  `nama_matakuliah` varchar(55) NOT NULL,
  `sks` int(2) NOT NULL,
  `id_dosen` int(11) NOT NULL,
  PRIMARY KEY (`id_matakuliah`),
  KEY `id_dosen` (`id_dosen`),
  CONSTRAINT `matakuliah_ibfk_1` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `matakuliah` */

insert  into `matakuliah`(`id_matakuliah`,`nama_matakuliah`,`sks`,`id_dosen`) values 
(1,'algoritma Pemrograman ',3,7),
(2,'Data scince',3,2),
(3,'Digital prenership',4,3),
(4,'pemograman berbasis web',3,4),
(5,'pemograman berbasis objek',3,5),
(6,'Sistem Basis Data',3,6),
(7,'Kecerdasan Buatan',3,1),
(8,'Rekayasa Perangkat Lunak',3,7),
(9,'manegemen proyek it',3,9);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
