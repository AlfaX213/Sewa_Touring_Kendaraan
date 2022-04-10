-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2022 at 06:12 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `abp_rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_kendaraan`
--

CREATE TABLE `tb_kendaraan` (
  `id_kendaraan` int(11) NOT NULL,
  `stnk_kendaraan` varchar(15) NOT NULL,
  `nopolisi_kendaraan` varchar(20) NOT NULL,
  `jenis_kendaraan` varchar(10) NOT NULL,
  `tipe_kendaraan` varchar(30) NOT NULL,
  `merk_kendaraan` varchar(30) NOT NULL,
  `transmisi_kendaraan` varchar(10) NOT NULL,
  `kursi_kendaraan` int(5) NOT NULL,
  `bagasi_kendaraan` int(5) NOT NULL,
  `hargasewa_kendaraan` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembayaran`
--

CREATE TABLE `tb_pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_penyewaan` int(11) NOT NULL,
  `totalharga_penyewaan` int(15) NOT NULL,
  `bayar_penyewaan` int(15) NOT NULL,
  `kembalian_penyewaan` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_penyewa`
--

CREATE TABLE `tb_penyewa` (
  `id_penyewa` int(11) NOT NULL,
  `nik_penyewa` int(20) NOT NULL,
  `sim_penyewa` varchar(15) NOT NULL,
  `nama_penyewa` varchar(30) NOT NULL,
  `nohp_penyewa` varchar(15) NOT NULL,
  `email_penyewa` varchar(30) NOT NULL,
  `password_penyewa` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_penyewaan`
--

CREATE TABLE `tb_penyewaan` (
  `id_penyewaan` int(11) NOT NULL,
  `lokasi_penyewaan` varchar(25) NOT NULL,
  `tanggalmulai_penyewaan` date NOT NULL,
  `waktumulai_penyewaan` date NOT NULL,
  `tanggalselesai_penyewaan` date NOT NULL,
  `waktuselesai_penyewaan` date NOT NULL,
  `id_kendaraan` int(11) NOT NULL,
  `id_penyewa` int(11) NOT NULL,
  `nik_pengemudi` int(20) NOT NULL,
  `sim_pengemudi` varchar(15) NOT NULL,
  `nama_pengemudi` varchar(30) NOT NULL,
  `nohp_pengemudi` varchar(15) NOT NULL,
  `email_pengemudi` varchar(30) NOT NULL,
  `lokasipengambilan_penyewaan` varchar(25) NOT NULL,
  `lokasipengembalian_penyewaan` varchar(25) NOT NULL,
  `totalharga_penyewaan` int(15) NOT NULL,
  `status_penyewaan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_kendaraan`
--
ALTER TABLE `tb_kendaraan`
  ADD PRIMARY KEY (`id_kendaraan`);

--
-- Indexes for table `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_penyewaan` (`id_penyewaan`);

--
-- Indexes for table `tb_penyewa`
--
ALTER TABLE `tb_penyewa`
  ADD PRIMARY KEY (`id_penyewa`);

--
-- Indexes for table `tb_penyewaan`
--
ALTER TABLE `tb_penyewaan`
  ADD PRIMARY KEY (`id_penyewaan`),
  ADD KEY `id_penyewa` (`id_penyewa`),
  ADD KEY `id_kendaraan` (`id_kendaraan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_kendaraan`
--
ALTER TABLE `tb_kendaraan`
  MODIFY `id_kendaraan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_penyewa`
--
ALTER TABLE `tb_penyewa`
  MODIFY `id_penyewa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_penyewaan`
--
ALTER TABLE `tb_penyewaan`
  MODIFY `id_penyewaan` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD CONSTRAINT `tb_pembayaran_ibfk_1` FOREIGN KEY (`id_penyewaan`) REFERENCES `tb_penyewaan` (`id_penyewaan`);

--
-- Constraints for table `tb_penyewaan`
--
ALTER TABLE `tb_penyewaan`
  ADD CONSTRAINT `tb_penyewaan_ibfk_1` FOREIGN KEY (`id_penyewa`) REFERENCES `tb_penyewa` (`id_penyewa`),
  ADD CONSTRAINT `tb_penyewaan_ibfk_2` FOREIGN KEY (`id_kendaraan`) REFERENCES `tb_kendaraan` (`id_kendaraan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
