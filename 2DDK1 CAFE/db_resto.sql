-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2023 at 06:51 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_resto`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_daftarmenu`
--

CREATE TABLE `tb_daftarmenu` (
  `id` int(11) NOT NULL,
  `foto` varchar(200) NOT NULL DEFAULT '0',
  `nama_menu` varchar(200) DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  `kategori` int(10) DEFAULT NULL,
  `harga` varchar(100) NOT NULL DEFAULT '0',
  `stok` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_daftarmenu`
--

INSERT INTO `tb_daftarmenu` (`id`, `foto`, `nama_menu`, `keterangan`, `kategori`, `harga`, `stok`) VALUES
(2, '2.png', 'Beef Burger', 'Burger dengan daging sapi terbaik', 1, '23000', '12'),
(3, '6.png', 'Nasi Goreng Seafood', 'Nasi Goreng Seafood Khas Cina', 1, '15000', '20'),
(4, '4.png', 'Kopi Sanger', 'Es Kopi Sedap', 2, '14000', '30'),
(5, '8.png', 'Nasi Campur Bu Didok', 'Nasi Campur dengan berbagai macam Lauk', 1, '12000', '40'),
(6, '5.png', 'Es Timun Serut ', 'ENAKK', 2, '13000', '30'),
(7, '12.png', 'Mango Juice', 'Jus Mangga yang berasal dari Angkasa', 2, '9000', '40');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori_menu`
--

CREATE TABLE `tb_kategori_menu` (
  `id_kat_menu` int(11) NOT NULL,
  `jenis_menu` int(1) DEFAULT NULL,
  `kategori_menu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_kategori_menu`
--

INSERT INTO `tb_kategori_menu` (`id_kat_menu`, `jenis_menu`, `kategori_menu`) VALUES
(1, 1, 'burger'),
(2, 2, 'es teler'),
(4, 1, 'Sate'),
(5, 1, 'JAJAN'),
(6, 0, 'snack');

-- --------------------------------------------------------

--
-- Table structure for table `tb_list_order`
--

CREATE TABLE `tb_list_order` (
  `id_list_order` int(11) NOT NULL,
  `menu` int(11) DEFAULT NULL,
  `kode_order` bigint(20) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_list_order`
--

INSERT INTO `tb_list_order` (`id_list_order`, `menu`, `kode_order`, `jumlah`) VALUES
(1, 6, 2307021457513, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tb_order`
--

CREATE TABLE `tb_order` (
  `id_order` bigint(20) NOT NULL,
  `pelanggan` varchar(200) DEFAULT NULL,
  `meja` int(11) DEFAULT NULL,
  `pelayan` int(10) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `waktu_order` timestamp NOT NULL DEFAULT current_timestamp(),
  `catatan` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_order`
--

INSERT INTO `tb_order` (`id_order`, `pelanggan`, `meja`, `pelayan`, `status`, `waktu_order`, `catatan`) VALUES
(2307021457513, 'Mayada', 2, 1, '0', '2023-07-02 07:58:06', 'aaa'),
(2307021509276, 'Merta', 6, 1, NULL, '2023-07-02 08:09:32', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL DEFAULT '0',
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `level` int(1) DEFAULT NULL,
  `nohp` varchar(15) NOT NULL DEFAULT '0',
  `alamat` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `level`, `nohp`, `alamat`) VALUES
(1, 'didok', 'admin@admin.com', '5f4dcc3b5aa765d61d8327deb882cf99', 1, '081234', ''),
(2, 'agus', 'agus@agus.com', '5f4dcc3b5aa765d61d8327deb882cf99', 2, '0845678', NULL),
(3, 'merta', 'merta@merta.com', '5f4dcc3b5aa765d61d8327deb882cf99', 3, '0834567', NULL),
(4, 'putra', 'putra@putra.com', '5f4dcc3b5aa765d61d8327deb882cf99', 4, '0823456', NULL),
(8, 'Mayada', 'mayada@mayada.com', '5f4dcc3b5aa765d61d8327deb882cf99', 2, '088888', ''),
(9, 'Yoga', 'yoga@yoga.com', '5f4dcc3b5aa765d61d8327deb882cf99', 2, '121232', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_daftarmenu`
--
ALTER TABLE `tb_daftarmenu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tb_daftarmenu_tb_kategori_menu` (`kategori`);

--
-- Indexes for table `tb_kategori_menu`
--
ALTER TABLE `tb_kategori_menu`
  ADD PRIMARY KEY (`id_kat_menu`);

--
-- Indexes for table `tb_list_order`
--
ALTER TABLE `tb_list_order`
  ADD PRIMARY KEY (`id_list_order`),
  ADD KEY `menu` (`menu`),
  ADD KEY `order` (`kode_order`);

--
-- Indexes for table `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `pelayan` (`pelayan`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_daftarmenu`
--
ALTER TABLE `tb_daftarmenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_kategori_menu`
--
ALTER TABLE `tb_kategori_menu`
  MODIFY `id_kat_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_list_order`
--
ALTER TABLE `tb_list_order`
  MODIFY `id_list_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_daftarmenu`
--
ALTER TABLE `tb_daftarmenu`
  ADD CONSTRAINT `FK_tb_daftarmenu_tb_kategori_menu` FOREIGN KEY (`kategori`) REFERENCES `tb_kategori_menu` (`id_kat_menu`) ON UPDATE CASCADE;

--
-- Constraints for table `tb_list_order`
--
ALTER TABLE `tb_list_order`
  ADD CONSTRAINT `FK_tb_list_order_tb_daftarmenu` FOREIGN KEY (`menu`) REFERENCES `tb_daftarmenu` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tb_list_order_tb_order` FOREIGN KEY (`kode_order`) REFERENCES `tb_order` (`id_order`) ON UPDATE CASCADE;

--
-- Constraints for table `tb_order`
--
ALTER TABLE `tb_order`
  ADD CONSTRAINT `FK_tb_order_tb_user` FOREIGN KEY (`pelayan`) REFERENCES `tb_user` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
