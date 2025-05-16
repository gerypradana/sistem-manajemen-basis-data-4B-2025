/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - rumahsakit
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`rumahsakit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `rumahsakit`;

/*Table structure for table `dokter` */

DROP TABLE IF EXISTS `dokter`;

CREATE TABLE `dokter` (
  `id_dokter` int(11) NOT NULL AUTO_INCREMENT,
  `nama_dokter` varchar(60) DEFAULT NULL,
  `spesialis` varchar(50) DEFAULT NULL,
  `no_telepon` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id_dokter`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dokter` */

insert  into `dokter`(`id_dokter`,`nama_dokter`,`spesialis`,`no_telepon`) values 
(1,'Dr. Siti Nurhaliza','Anak','081234111222'),
(2,'Dr. Andi Wijaya','Bedah Umum','082233456789'),
(3,'Dr. Rina Kartika','Kulit dan Kelamin','083344556677'),
(4,'Dr. Dedi Mahendra','Saraf','084455667788'),
(5,'Dr. Nia Ramadhani','Gigi','085566778899'),
(6,'Dr. Tommy Gunawan','Mata','086677889900'),
(7,'Dr. Eka Putra','THT','087788990011'),
(8,'Dr. Sarah Zahra','Paru','088899001122'),
(9,'Dr. Rizky Ramadhan','Jantung','089900112233'),
(10,'Dr. Budi Santoso','Penyakit Dalam','082233445566'),
(12,'Dr. gery mahesa','Penyakit kulit','082220987524'),
(13,'Dr. barkonika','paru','082220987524');

/*Table structure for table `pasien` */

DROP TABLE IF EXISTS `pasien`;

CREATE TABLE `pasien` (
  `id_pasien` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pasien` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_telepon` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id_pasien`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pasien` */

insert  into `pasien`(`id_pasien`,`nama_pasien`,`tanggal_lahir`,`jenis_kelamin`,`alamat`,`no_telepon`) values 
(1,'abdullah fiqri','2004-06-10','L','Jl. Soekarno Hatta No. 12, bangkalan','081234999999'),
(2,'Siti Aminah','1990-01-15','P','Jl. Kartini No. 45, Bangkalan','081298765432'),
(3,'Rudi Hartono','1985-03-20','L','Jl. Pemuda No. 7, Bangkalan','082134567891'),
(4,'Dewi Lestari','1992-12-05','P','Jl. Kenanga No. 21, Bangkalan','083123456789'),
(5,'Agus Salim','1975-09-11','L','Jl. Veteran No. 3, Bangkalan','085678123456'),
(6,'Fitriani Azizah','2000-06-30','P','Jl. Mawar No. 10, Bangkalan','081277889900'),
(7,'Hendra Saputra','1988-04-04','L','Jl. Diponegoro No. 9, Bangkalan','082198776655'),
(8,'Maria Ulfah','1995-11-21','P','Jl. Melati No. 6, Bangkalan','089912345678'),
(9,'Bambang Irawan','1978-08-08','L','Jl. Merdeka No. 17, Bangkalan','088812341234'),
(10,'Lilis Suryani','1999-07-07','P','Jl. Cempaka No. 2, Bangkalan','081233344455');

/*Table structure for table `periksa` */

DROP TABLE IF EXISTS `periksa`;

CREATE TABLE `periksa` (
  `id_periksa` int(11) NOT NULL AUTO_INCREMENT,
  `id_pasien` int(11) DEFAULT NULL,
  `id_dokter` int(11) DEFAULT NULL,
  `tanggal_periksa` date DEFAULT NULL,
  `diagnosa` varchar(50) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  PRIMARY KEY (`id_periksa`),
  KEY `id_pasien` (`id_pasien`),
  KEY `id_dokter` (`id_dokter`),
  CONSTRAINT `periksa_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  CONSTRAINT `periksa_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `periksa` */

insert  into `periksa`(`id_periksa`,`id_pasien`,`id_dokter`,`tanggal_periksa`,`diagnosa`,`keterangan`) values 
(1,1,1,'2025-10-07','Flu Berat',NULL),
(2,2,2,'2025-04-08','Asma',NULL),
(3,3,3,'2025-04-09','Cacar Air',NULL),
(4,4,4,'2025-04-10','Migrain',NULL),
(5,5,5,'2025-04-10','Sakit Gigi',NULL),
(6,6,6,'2025-04-11','Infeksi Mata',NULL),
(7,7,7,'2025-04-11','Radang Telinga',NULL),
(8,8,8,'2025-04-12','Batuk Kronis',NULL),
(9,9,9,'2025-04-12','Jantung Lemah',NULL),
(10,10,1,'2025-04-13','Demam Berdarah',NULL);

/*Table structure for table `rawat_inap` */

DROP TABLE IF EXISTS `rawat_inap`;

CREATE TABLE `rawat_inap` (
  `id_rawat_inap` int(11) NOT NULL AUTO_INCREMENT,
  `id_pasien` int(11) DEFAULT NULL,
  `id_ruangan` int(11) DEFAULT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `tanggal_keluar` datetime DEFAULT NULL,
  PRIMARY KEY (`id_rawat_inap`),
  KEY `id_pasien` (`id_pasien`),
  KEY `id_ruangan` (`id_ruangan`),
  CONSTRAINT `rawat_inap_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  CONSTRAINT `rawat_inap_ibfk_2` FOREIGN KEY (`id_ruangan`) REFERENCES `ruangan` (`id_ruangan`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `rawat_inap` */

insert  into `rawat_inap`(`id_rawat_inap`,`id_pasien`,`id_ruangan`,`tanggal_masuk`,`tanggal_keluar`) values 
(1,1,1,'2025-04-06','2025-04-10 00:00:00'),
(2,2,2,'2025-04-08','2025-04-10 00:00:00'),
(3,3,3,'2025-04-09','2025-04-11 00:00:00'),
(4,4,4,'2025-04-10','2025-04-15 00:00:00'),
(5,5,5,'2025-04-11','2025-04-13 00:00:00'),
(6,6,6,'2025-04-11','2025-04-12 00:00:00'),
(7,7,7,'2025-04-12','2025-04-16 00:00:00'),
(8,8,8,'2025-04-12','2025-04-17 00:00:00'),
(9,9,9,'2025-04-13','2025-04-14 00:00:00'),
(10,10,2,'2025-04-14','2025-04-18 00:00:00');

/*Table structure for table `ruangan` */

DROP TABLE IF EXISTS `ruangan`;

CREATE TABLE `ruangan` (
  `id_ruangan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_ruangan` varchar(50) DEFAULT NULL,
  `kelas_ruangan` varchar(20) DEFAULT NULL,
  `kapasitas` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_ruangan`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ruangan` */

insert  into `ruangan`(`id_ruangan`,`nama_ruangan`,`kelas_ruangan`,`kapasitas`) values 
(1,'Ruang Mawar','Ekonomi',5),
(2,'Ruang Melati','VIP',1),
(3,'Ruang Anggrek','Kelas I',2),
(4,'Ruang Kenanga','Kelas II',3),
(5,'Ruang Dahlia','Ekonomi',5),
(6,'Ruang Teratai','Kelas III',4),
(7,'Ruang Cempaka','VIP',1),
(8,'Ruang Lavender','Kelas I',2),
(9,'Ruang Flamboyan','Kelas II',3),
(10,'Ruang Kamboja','Ekonomi',6);

/* Procedure structure for procedure `CountTransaksi` */

/*!50003 DROP PROCEDURE IF EXISTS  `CountTransaksi` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `CountTransaksi`(OUT total INT)
BEGIN
    SELECT COUNT(*) INTO total FROM periksa;
END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteEntriesByIDMaster` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteEntriesByIDMaster` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteEntriesByIDMaster`(
    IN id INT
)
BEGIN
    -- Menghapus data dari tabel dokter berdasarkan id_dokter
    DELETE FROM dokter WHERE id_dokter = id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `GetDataPasienByID` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetDataPasienByID` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDataPasienByID`(
    IN input_id INT,
    OUT out_nama VARCHAR(100),
    OUT out_tgl_lahir DATE,
    OUT out_jk ENUM('L', 'P'),
    OUT out_alamat TEXT,
    OUT out_telepon VARCHAR(12)
)
BEGIN
    SELECT 
        nama_pasien,
        tanggal_lahir,
        jenis_kelamin,
        alamat,
        no_telepon
    INTO
        out_nama,
        out_tgl_lahir,
        out_jk,
        out_alamat,
        out_telepon
    FROM pasien
    WHERE id_pasien = input_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `UpdateDataMaster` */

/*!50003 DROP PROCEDURE IF EXISTS  `UpdateDataMaster` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateDataMaster`(
    IN id INT,
    IN nilai_baru VARCHAR(12),
    OUT status_msg VARCHAR(100)
)
BEGIN
    DECLARE row_count INT;
    
    UPDATE pasien
    SET no_telepon = nilai_baru
    WHERE id_pasien = id;

    SET row_count = ROW_COUNT();

    IF row_count > 0 THEN
        SET status_msg = 'Update berhasil';
    ELSE
        SET status_msg = 'Data tidak ditemukan atau tidak diubah';
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `UpdateFieldTransaksi` */

/*!50003 DROP PROCEDURE IF EXISTS  `UpdateFieldTransaksi` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateFieldTransaksi`(
    IN id INT,
    INOUT field1 DATE,
    INOUT field2 VARCHAR(50)
)
BEGIN
    DECLARE tmp_tanggal DATE;
    DECLARE tmp_diagnosa VARCHAR(50);

    SELECT tanggal_periksa, diagnosa
    INTO tmp_tanggal, tmp_diagnosa
    FROM periksa
    WHERE id_periksa = id;

    IF field1 IS NULL THEN
        SET field1 = tmp_tanggal;
    END IF;

    IF field2 IS NULL OR field2 = '' THEN
        SET field2 = tmp_diagnosa;
    END IF;

    UPDATE periksa
    SET tanggal_periksa = field1,
        diagnosa = field2
    WHERE id_periksa = id;
END */$$
DELIMITER ;

/*Table structure for table `view_jumlah_pasien_per_dokter` */

DROP TABLE IF EXISTS `view_jumlah_pasien_per_dokter`;

/*!50001 DROP VIEW IF EXISTS `view_jumlah_pasien_per_dokter` */;
/*!50001 DROP TABLE IF EXISTS `view_jumlah_pasien_per_dokter` */;

/*!50001 CREATE TABLE  `view_jumlah_pasien_per_dokter`(
 `nama_dokter` varchar(60) ,
 `jumlah_pasien` bigint(21) 
)*/;

/*Table structure for table `view_pasien_periksa` */

DROP TABLE IF EXISTS `view_pasien_periksa`;

/*!50001 DROP VIEW IF EXISTS `view_pasien_periksa` */;
/*!50001 DROP TABLE IF EXISTS `view_pasien_periksa` */;

/*!50001 CREATE TABLE  `view_pasien_periksa`(
 `id_pasien` int(11) ,
 `nama_pasien` varchar(100) ,
 `tanggal_periksa` date ,
 `diagnosa` varchar(50) 
)*/;

/*Table structure for table `view_pasien_periksa_dokter` */

DROP TABLE IF EXISTS `view_pasien_periksa_dokter`;

/*!50001 DROP VIEW IF EXISTS `view_pasien_periksa_dokter` */;
/*!50001 DROP TABLE IF EXISTS `view_pasien_periksa_dokter` */;

/*!50001 CREATE TABLE  `view_pasien_periksa_dokter`(
 `nama_pasien` varchar(100) ,
 `nama_dokter` varchar(60) ,
 `tanggal_periksa` date ,
 `diagnosa` varchar(50) 
)*/;

/*Table structure for table `view_rata_rata_rawat_per_ruangan` */

DROP TABLE IF EXISTS `view_rata_rata_rawat_per_ruangan`;

/*!50001 DROP VIEW IF EXISTS `view_rata_rata_rawat_per_ruangan` */;
/*!50001 DROP TABLE IF EXISTS `view_rata_rata_rawat_per_ruangan` */;

/*!50001 CREATE TABLE  `view_rata_rata_rawat_per_ruangan`(
 `nama_ruangan` varchar(50) ,
 `rata_rata_hari_rawat` decimal(10,4) 
)*/;

/*Table structure for table `view_rawat_inap_lama` */

DROP TABLE IF EXISTS `view_rawat_inap_lama`;

/*!50001 DROP VIEW IF EXISTS `view_rawat_inap_lama` */;
/*!50001 DROP TABLE IF EXISTS `view_rawat_inap_lama` */;

/*!50001 CREATE TABLE  `view_rawat_inap_lama`(
 `nama_pasien` varchar(100) ,
 `nama_ruangan` varchar(50) ,
 `tanggal_masuk` date ,
 `tanggal_keluar` datetime ,
 `lama_rawat` int(7) 
)*/;

/*View structure for view view_jumlah_pasien_per_dokter */

/*!50001 DROP TABLE IF EXISTS `view_jumlah_pasien_per_dokter` */;
/*!50001 DROP VIEW IF EXISTS `view_jumlah_pasien_per_dokter` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_jumlah_pasien_per_dokter` AS select `d`.`nama_dokter` AS `nama_dokter`,count(`pr`.`id_pasien`) AS `jumlah_pasien` from (`dokter` `d` join `periksa` `pr` on(`d`.`id_dokter` = `pr`.`id_dokter`)) group by `d`.`nama_dokter` */;

/*View structure for view view_pasien_periksa */

/*!50001 DROP TABLE IF EXISTS `view_pasien_periksa` */;
/*!50001 DROP VIEW IF EXISTS `view_pasien_periksa` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_pasien_periksa` AS select `p`.`id_pasien` AS `id_pasien`,`p`.`nama_pasien` AS `nama_pasien`,`pr`.`tanggal_periksa` AS `tanggal_periksa`,`pr`.`diagnosa` AS `diagnosa` from (`pasien` `p` join `periksa` `pr` on(`p`.`id_pasien` = `pr`.`id_pasien`)) */;

/*View structure for view view_pasien_periksa_dokter */

/*!50001 DROP TABLE IF EXISTS `view_pasien_periksa_dokter` */;
/*!50001 DROP VIEW IF EXISTS `view_pasien_periksa_dokter` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_pasien_periksa_dokter` AS select `p`.`nama_pasien` AS `nama_pasien`,`d`.`nama_dokter` AS `nama_dokter`,`pr`.`tanggal_periksa` AS `tanggal_periksa`,`pr`.`diagnosa` AS `diagnosa` from ((`periksa` `pr` join `pasien` `p` on(`pr`.`id_pasien` = `p`.`id_pasien`)) join `dokter` `d` on(`pr`.`id_dokter` = `d`.`id_dokter`)) */;

/*View structure for view view_rata_rata_rawat_per_ruangan */

/*!50001 DROP TABLE IF EXISTS `view_rata_rata_rawat_per_ruangan` */;
/*!50001 DROP VIEW IF EXISTS `view_rata_rata_rawat_per_ruangan` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_rata_rata_rawat_per_ruangan` AS select `r`.`nama_ruangan` AS `nama_ruangan`,avg(to_days(`ri`.`tanggal_keluar`) - to_days(`ri`.`tanggal_masuk`)) AS `rata_rata_hari_rawat` from (`rawat_inap` `ri` join `ruangan` `r` on(`ri`.`id_ruangan` = `r`.`id_ruangan`)) group by `r`.`id_ruangan` */;

/*View structure for view view_rawat_inap_lama */

/*!50001 DROP TABLE IF EXISTS `view_rawat_inap_lama` */;
/*!50001 DROP VIEW IF EXISTS `view_rawat_inap_lama` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_rawat_inap_lama` AS select `p`.`nama_pasien` AS `nama_pasien`,`r`.`nama_ruangan` AS `nama_ruangan`,`ri`.`tanggal_masuk` AS `tanggal_masuk`,`ri`.`tanggal_keluar` AS `tanggal_keluar`,to_days(`ri`.`tanggal_keluar`) - to_days(`ri`.`tanggal_masuk`) AS `lama_rawat` from ((`rawat_inap` `ri` join `pasien` `p` on(`ri`.`id_pasien` = `p`.`id_pasien`)) join `ruangan` `r` on(`ri`.`id_ruangan` = `r`.`id_ruangan`)) where to_days(`ri`.`tanggal_keluar`) - to_days(`ri`.`tanggal_masuk`) > 3 */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
