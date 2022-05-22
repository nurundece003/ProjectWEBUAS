-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 13, 2020 at 10:21 AM
-- Server version: 10.3.22-MariaDB-log-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `k0702714_tokopekita`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `idcart` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `tglorder` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) NOT NULL DEFAULT 'Cart'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`idcart`, `orderid`, `userid`, `tglorder`, `status`) VALUES
(10, '15wKVT0nej25Y', 2, '2020-03-16 12:10:42', 'Selesai'),
(11, '15Swf8Ye0Fm.M', 2, '2020-03-16 12:17:34', 'Cart'),
(12, '15PzF03ejd8W2', 1, '2020-05-13 02:40:48', 'Confirmed'),
(13,	'16PtIo2CuoePc', 3,	'2022-05-17 08:01:24',	'Payment'),
(14,	'161wmJUFw22yU',	6,	'2022-05-21 13:05:19',	'Confirmed'),
(15,	'164GSD/28EeFI',	17,	'2022-05-22 07:20:19',	'Payment'),	
(16,	'16vpgA0tiRYZw',	21,	'2022-05-22 16:41:27',	'Confirmed');	


-- --------------------------------------------------------

--
-- Table structure for table `detailorder`
--

CREATE TABLE `detailorder` (
  `detailid` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `idproduk` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detailorder`
--

INSERT INTO `detailorder` (`detailid`, `orderid`, `idproduk`, `qty`) VALUES
(13, '15wKVT0nej25Y', 1, 100),
(14, '15PzF03ejd8W2', 2, 1),
(15,	'16PtIo2CuoePc',	1,	2),	
(16,	'161wmJUFw22yU',	1,	1),	
(17,	'161wmJUFw22yU',	7,	1),
(18,	'164GSD/28EeFI',	5,	5),	
(19,	'16vpgA0tiRYZw',	5,	1),	
(20,	'16vpgA0tiRYZw',	7,	1);	


-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int(11) NOT NULL,
  `namakategori` varchar(20) NOT NULL,
  `tgldibuat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`idkategori`, `namakategori`, `tgldibuat`) VALUES
(1, 'Dimsum Goreng', '2019-12-20 07:28:34'),
(2, 'Dimsum Kukus', '2019-12-20 07:34:17'),
(3, 'Meals', '2020-03-16 12:15:40');

-- --------------------------------------------------------

--
-- Table structure for table `konfirmasi`
--

CREATE TABLE `konfirmasi` (
  `idkonfirmasi` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `payment` varchar(10) NOT NULL,
  `namarekening` varchar(25) NOT NULL,
  `tglbayar` date NOT NULL,
  `tglsubmit` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `konfirmasi`
--

INSERT INTO `konfirmasi` (`idkonfirmasi`, `orderid`, `userid`, `payment`, `namarekening`, `tglbayar`, `tglsubmit`) VALUES
(1, '15PzF03ejd8W2', 1, 'Bank BCA', 'Admin', '2020-05-16', '2020-05-13 02:41:51'),
(2,	'161wmJUFw22yU',	6,	'ShopeePay',	'Nurun Decerachmi',	'2022-05-21',	'2022-05-21 13:10:29'),	
(3,	'16vpgA0tiRYZw',	21,	'ShopeePay',	'Team4',	'2022-05-22',	'2022-05-22 16:46:36);	


-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `userid` int(11) NOT NULL,
  `namalengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `notelp` varchar(15) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tgljoin` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(7) NOT NULL DEFAULT 'Member',
  `lastlogin` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`userid`, `namalengkap`, `email`, `password`, `notelp`, `alamat`, `tgljoin`, `role`, `lastlogin`) VALUES
(1, 'Admin', 'admin', '$2y$10$GJVGd4ji3QE8ikTBzNyA0uLQhiGd6MirZeSJV1O6nUpjSVp1eaKzS', '01234567890', 'Indonesia', '2020-03-16 11:31:17', 'Admin', NULL),
(2, 'Guest', 'guest', '$2y$10$xXEMgj5pMT9EE0QAx3QW8uEn155Je.FHH5SuIATxVheOt0Z4rhK6K', '01234567890', 'Indonesia', '2020-03-16 11:30:40', 'Member', NULL),
(3,	'Nurun Decerachmi',	'decerachmi2112@gmail.com',	'$2y$10$HdBV62seWJP9KLUMhCiJlOrN6cuu3epBsbMIYCtmsfZ...',	'0881026010622',	'siwalankerto',	'2022-05-17 07:56:47',	'Member',	NULL),
(10,	'Atun',	'viva.nafiah@gmail.com',	'$2y$10$.MbtiRX.xcEb18WB61VgSe2zVOB2Ssb1iJYXX/J34iP...',	'082233168916',	'POJOK PELITA',	'2022-05-21 13:55:41',	'Member',	NULL),
(11,	'Alvina Jacindy',	'jacinndyy14@gmail.com',	'$2y$10$84TgLsVeb10sx6bbeITvzel9Z4qXL3h2.iC7K7VzcBw...',	'812-3337-3934',	'Jalan Tenggumung Karya Lor nomor 12',	'2022-05-21 13:58:41',	'Member',	NULL),
(18,	'Nomar',	'nomarsamaa@gmail.com',	'$2y$10$PmVo6MZOtYPTCuxhGuwKE.hynQ7D5Te7F9zgES4MOh0...',	'082291936974',	'jl.ketintang',	'2022-05-22 09:37:39',	'Member',	NULL),
(21,	'Team4',	'team4@gmail.com',	'$2y$10$TWS/./C53rLKsLcic6urV.v/HmUzVqJGaU2K/ppNTwY...',	'088223344556',	'Indonesia',	'2022-05-22 16:35:29',	'Member', NULL);


-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `no` int(11) NOT NULL,
  `metode` varchar(25) NOT NULL,
  `norek` varchar(25) NOT NULL,
  `logo` text DEFAULT NULL,
  `an` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`no`, `metode`, `norek`, `logo`, `an`) VALUES
(1, 'Bank BCA', '13131231231', 'images/bca.jpg', 'Tokopekita'),
(2, 'Bank Mandiri', '943248844843', 'images/mandiri.jpg', 'Tokopekita'),
(3, 'DANA', '0882313132123', 'images/dana.png', 'Tokopekita'),
(4,	'ShopeePay',	'0881026587132',	'images/shopee.png',	'Queen Dimsum');
 

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `idproduk` int(11) NOT NULL,
  `idkategori` int(11) NOT NULL,
  `namaproduk` varchar(30) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `rate` int(11) NOT NULL,
  `hargabefore` int(11) NOT NULL,
  `hargaafter` int(11) NOT NULL,
  `tgldibuat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`idproduk`, `idkategori`, `namaproduk`, `gambar`, `deskripsi`, `rate`, `hargabefore`, `hargaafter`, `tgldibuat`) VALUES
(1,	1,	'Money Bag',	'produk/moneybag.jpg',	'Isi 3. Terbuat dari full daging ayam + udang yang ...',	5,	16250,	12000,	'2022-05-17 14:06:00'),	
(2,	1,	'Bola Udang',	'produk/bolaudang.jpg',	'Isi 3. Terbuat dari daging udang + ayam',	4,	16250,	12000,	'2022-05-17 13:54:00'),	
(3,	1,	'Udang Rambutan',	'produk/rambutan.jpg',	'Isi 3. Terbuat dari full daging udang + ayam',	5,	16250,	12000,	'2022-05-17 14:03:00'),
(4,	1,	'Springroll',	'produk/springroll.jpg',	'Isi 3. Terbuat dari full daging ayam',	5,	16250,	12000,	'2022-05-17 14:07:00'),
(5,	2,	'Siomay Ayam',	'produk/sioayam.JPG',	'Isi 3. Terbuat dari full daging ayam',	5,	16250,	12000,	'2022-05-17 14:09:00'),	
(6,	2,	'Siomay Jamur',	'produk/siojamur.jpg',	'Isi 3. Terbuat dari full daging ayam + jamur',	5,	16250,	12000,	'2022-05-17 14:10:00'),	
(7,	2,	'Siomay Keju',	'produk/siokeju.JPG',	'Isi 3. Terbuat dari full daging ayam dan keju yang...',	5,	16250,	12000,	'2022-05-17 14:11:00'),
(8,	2,	'Kocoi',	'produk/kocoi.jpg',	'Isi 3. Terbuat dari full daging ayam dan sedikit s...',	5,	16250,	12000,	'2022-05-17 14:12:00'),
(9,	2,	'Kuotie',	'produk/kuotie.jpg',	'Isi 3. Terbuat dari full daging ayam + udang + sed...',	5,	16250,	12000,	'2022-05-17 14:13:00'),	
(10,	2,	'Pangsit Kepiting',	'produk/pangsitkepiting.jpg',	'Isi 3. Terbuat dari full daging kepiting + ayam + ...',	5,	16250,	12000,	'2022-05-17 14:14:00'),	
(11,	2,	'Pangsit Shanghai',	'produk/shanghai.jpg',	'Isi 3. Terbuat dari full daging ayam + sedikit say...',	5,	16250,	12000,	'2022-05-17 14:19:00'),	
(12,	2,	'Zsechuan',	'produk/zsechuan.jpg',	'Isi 3. Terbuat dari full daging ayam + jamur + sed...',	5,	16250,	12000,	'2022-05-17 14:20:00'),	
(13,	2,	'Kulit Tahu',	'produk/kulittahu.JPG',	'Isi 3. Terbuat dari full daging ayam dan sedikit s...',	5,	16250,	12000,	'2022-05-17 14:21:00'),	
(14,	2,	'Seafood Kulit Tahu',	'produk/seafood.jpg',	'Isi 3. Terbuat dari full daging ayam dan udang yan...',	5,	16250,	12000, '2022-05-17 14:21:00	'),
(15,	2,	'Keichak',	'produk/keichak.JPG', 'Isi 3. Terbuat dari full daging ayam + jamur + sed...',	5, 16250,	12000,	'2022-05-17 14:22:00'),	
(16,	2,	'Sushi Crabstick',	'produk/sushi.jpg',	'Isi 3. Terbuat dari full daging ayam + udang yang ...',	,5	16250,	12000,	'2022-05-17 14:23:00'),	
(17,	3,	'Nasi Ayam Serundeng Sambal Ijo',	'produk/nasiayam.JPG',	'1 porsi berisi Nasi + Ayam Serundeng + Sambal Ijo ...',	5,	22000,	15000,	'2022-05-17 14:25:00'),	
(18,	3,	'Mie Aceh',	'produk/mieaceh.JPG',	'1 porsi Mie Aceh dengan bumbu rempah yang nikmat',	5,	22000,	15000,	'2022-05-17 14:26:00'),
(19,	3,	'Nasi Putih',	'produk/nasi.png',	'1 porsi nasi',	5,	7000,	5000,	'2022-05-17 14:27:00');


--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`idcart`),
  ADD UNIQUE KEY `orderid` (`orderid`),
  ADD KEY `orderid_2` (`orderid`);

--
-- Indexes for table `detailorder`
--
ALTER TABLE `detailorder`
  ADD PRIMARY KEY (`detailid`),
  ADD KEY `orderid` (`orderid`),
  ADD KEY `idproduk` (`idproduk`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indexes for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD PRIMARY KEY (`idkonfirmasi`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idproduk`),
  ADD KEY `idkategori` (`idkategori`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `idcart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `detailorder`
--
ALTER TABLE `detailorder`
  MODIFY `detailid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  MODIFY `idkonfirmasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `idproduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailorder`
--
ALTER TABLE `detailorder`
  ADD CONSTRAINT `idproduk` FOREIGN KEY (`idproduk`) REFERENCES `produk` (`idproduk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderid` FOREIGN KEY (`orderid`) REFERENCES `cart` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `login` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `idkategori` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`idkategori`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
