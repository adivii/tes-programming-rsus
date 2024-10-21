-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2024 at 09:58 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hr`
--

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `gaji` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id`, `nama`, `tgl_lahir`, `gaji`) VALUES
(2, 'tes', '2003-07-20', 1000000),
(3, 'tes', '2003-07-20', 1000000),
(4, 'tes', '2003-07-20', 1000000),
(5, 'tes', '2003-07-20', 1000000),
(6, 'tes', '2003-07-20', 1000000);

--
-- Triggers `karyawan`
--
DELIMITER $$
CREATE TRIGGER `add_new_data` AFTER INSERT ON `karyawan` FOR EACH ROW INSERT INTO tlog(tanggal, jam, keterangan) VALUES (CURRENT_DATE(), CURRENT_TIME(), CONCAT("INSERT DATA KARYAWAN ", NEW.nama, " DENGAN TANGGAL LAHIR ", NEW.tgl_lahir, " DAN GAJI ", NEW.gaji))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delete_data` AFTER DELETE ON `karyawan` FOR EACH ROW INSERT INTO tlog(tanggal, jam, keterangan) VALUES (CURRENT_DATE(), CURRENT_TIME(), CONCAT("DELETE DATA KARYAWAN ", OLD.nama, " DENGAN TANGGAL LAHIR ", OLD.tgl_lahir, " DAN GAJI ", OLD.gaji))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_data` AFTER UPDATE ON `karyawan` FOR EACH ROW INSERT INTO tlog(tanggal, jam, keterangan) VALUES (CURRENT_DATE(), CURRENT_TIME(), CONCAT("UPDATE DATA KARYAWAN ", NEW.nama, " DENGAN TANGGAL LAHIR ", NEW.tgl_lahir, " DAN GAJI ", NEW.gaji))
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tlog`
--

CREATE TABLE `tlog` (
  `id` int NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tlog`
--

INSERT INTO `tlog` (`id`, `tanggal`, `jam`, `keterangan`) VALUES
(1, '2024-10-21', '14:46:23', 'INSERT DATA KARYAWAN tes DENGAN TANGGAL LAHIR 2024-10-21 DAN GAJI 1000000'),
(2, '2024-10-21', '14:47:29', 'UPDATE DATA KARYAWAN test DENGAN TANGGAL LAHIR 2024-10-21 DAN GAJI 1000000'),
(3, '2024-10-21', '14:49:54', 'DELETE DATA KARYAWAN test DENGAN TANGGAL LAHIR 2024-10-21 DAN GAJI 1000000'),
(4, '2024-10-21', '14:52:12', 'INSERT DATA KARYAWAN tes DENGAN TANGGAL LAHIR 2003-07-20 DAN GAJI 1000000'),
(5, '2024-10-21', '14:54:38', 'INSERT DATA KARYAWAN tes DENGAN TANGGAL LAHIR 2003-07-20 DAN GAJI 1000000'),
(6, '2024-10-21', '14:55:04', 'INSERT DATA KARYAWAN tes DENGAN TANGGAL LAHIR 2003-07-20 DAN GAJI 1000000'),
(7, '2024-10-21', '14:55:21', 'INSERT DATA KARYAWAN tes DENGAN TANGGAL LAHIR 2003-07-20 DAN GAJI 1000000'),
(8, '2024-10-21', '14:57:37', 'INSERT DATA KARYAWAN tes DENGAN TANGGAL LAHIR 2003-07-20 DAN GAJI 1000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tlog`
--
ALTER TABLE `tlog`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tlog`
--
ALTER TABLE `tlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
