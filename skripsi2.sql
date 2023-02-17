-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2023 at 08:38 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skripsi2`
--

-- --------------------------------------------------------

--
-- Table structure for table `elektro`
--

CREATE TABLE `elektro` (
  `id_elektro` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `jurusan` varchar(128) NOT NULL,
  `ms` varchar(50) NOT NULL,
  `ipk` varchar(50) NOT NULL,
  `toefl` varchar(50) NOT NULL,
  `class` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `elektro`
--

INSERT INTO `elektro` (`id_elektro`, `nama`, `nim`, `jurusan`, `ms`, `ipk`, `toefl`, `class`) VALUES
(1, 'Sarah Fazlia', '1600020113', 'Teknik Kimia', '1605 days', '3.51', '430', 'Tidak Tepat Waktu'),
(2, 'Ayu Citra Dewi', '1600020118', 'Teknik Kimia', '1605 days', '3.64', '446', 'Tidak Tepat Waktu'),
(3, 'Niken Dwi Astuti', '1600020057', 'Teknik Kimia', '1626 days', '3.09', '413', 'Tidak Tepat Waktu'),
(4, 'Mahes Pati Agustiani', '1600020007', 'Teknik Kimia', '1629 days', '3.15', '400', 'Tidak Tepat Waktu'),
(5, 'Muhsin Tahir', '1600020063', 'Teknik Kimia', '1647 days', '3.34', '446', 'Tidak Tepat Waktu'),
(6, 'Nirwan Triyadi', '1600020087', 'Teknik Kimia', '1647 days', '3.08', '430', 'Tidak Tepat Waktu'),
(7, 'Dicki Sanjaya', '1500020056', 'Teknik Kimia', '2025 days', '3', '402', 'Tidak Tepat Waktu'),
(8, 'Wisnu Syaifin Nuha', '1600020067', 'Teknik Kimia', '1661 days', '3.15', '416', 'Tidak Tepat Waktu'),
(9, 'Mas Arief Kusumawijaya', '1600020092', 'Teknik Kimia', '1661 days', '3.19', '450', 'Tidak Tepat Waktu'),
(10, 'Yusuf Eko Nugroho', '1600020081', 'Teknik Kimia', '1668 days', '3.26', '443', 'Tidak Tepat Waktu'),
(11, 'Muhammad Hanafi', '1615020102', 'Teknik Kimia', '1668 days', '3.19', '433', 'Tidak Tepat Waktu'),
(12, 'Sarah Haura Zalfa', '1700020098', 'Teknik Kimia', '1307 days', '3.67', '441', 'Tepat Waktu'),
(13, 'Eva Kusmayanti', '1700020100', 'Teknik Kimia', '1307 days', '3.68', '431', 'Tepat Waktu'),
(14, 'Sarah Haura Zalfa', '1700020098', 'Teknik Kimia', '1321 days', '3.67', '441', 'Tepat Waktu'),
(15, 'Arif Khoirul Safi\'i', '1600020097', 'Teknik Kimia', '1689 days', '3.5', '406', 'Tidak Tepat Waktu'),
(16, 'Fuaidah Hasanah', '1600020108', 'Teknik Kimia', '1689 days', '3.05', '400', 'Tidak Tepat Waktu'),
(17, 'Evi Praviahani', '1600020016', 'Teknik Kimia', '1725 days', '3.43', '479', 'Tidak Tepat Waktu'),
(18, 'Safika Nur Ramadhayanti', '1600020017', 'Teknik Kimia', '1725 days', '3.32', '452', 'Tidak Tepat Waktu'),
(19, 'Rifqi Tamimi', '1700020146', 'Teknik Kimia', '1364 days', '3.74', '431', 'Tepat Waktu'),
(20, 'Wahyu Adrian', '1500020050', 'Teknik Kimia', '2102 days', '3.03', '432', 'Tidak Tepat Waktu'),
(21, 'Olga Rahmayudhi', '1600020058', 'Teknik Kimia', '1738 days', '3.59', '432', 'Tidak Tepat Waktu'),
(22, 'Reihan Neiladiyanah', '1600020079', 'Teknik Kimia', '1738 days', '3.52', '460', 'Tidak Tepat Waktu'),
(23, 'Winda Rohmah Shoffianti', '1700020072', 'Teknik kimia', '1384 days', '3.82', '438', 'Tepat Waktu'),
(24, 'Silvia Anggi Dayanti', '1700020093', 'Teknik kimia', '1384 days', '3.65', '412', 'Tepat Waktu'),
(25, 'Dila Argatiningtyas', '1700020096', 'Teknik kimia', '1384 days', '3.89', '429', 'Tepat Waktu'),
(26, 'Lia Septianingsih', '1700020105', 'Teknik kimia', '1384 days', '3.91', '431', 'Tepat Waktu'),
(27, 'Adhi Chandra Purnama', '1700020150', 'Teknik kimia', '1384 days', '3.88', '438', 'Tepat Waktu'),
(28, 'Feriz Ilham Akbar', '1700020162', 'Teknik kimia', '1384 days', '3.73', '480', 'Tepat Waktu'),
(29, 'Nenti Febi Setiyahadi', '1611020100', 'Teknik Kimia', '1752 days', '2.97', '423', 'Tidak Tepat Waktu'),
(30, 'Saniyah Humairrah', '1700020063', 'Teknik Kimia', '1391 days', '3.71', '438', 'Tepat Waktu'),
(31, 'Arida Ayu Krismawati', '1700020071', 'Teknik Kimia', '1391 days', '3.75', '400', 'Tepat Waktu'),
(32, 'Inggar Siwi Larasati', '1700020094', 'Teknik Kimia', '1391 days', '3.57', '404', 'Tepat Waktu'),
(33, 'Galuh Ajeng Larasati', '1700020095', 'Teknik Kimia', '1391 days', '3.44', '428', 'Tepat Waktu'),
(34, 'R. Kurniawan', '1700020155', 'Teknik Kimia', '1391 days', '3.58', '449', 'Tepat Waktu'),
(35, 'Fera Florensia Babut', '1400020041', 'Teknik Kimia', '2494 days', '2.95', '427', 'Tidak Tepat Waktu'),
(36, 'Reny Ramadanty', '1400020056', 'Teknik Kimia', '2494 days', '2.97', '460', 'Tidak Tepat Waktu'),
(37, 'Muhammad Irza Ghifary', '1500020137', 'Teknik Kimia', '2123 days', '2.8', '453', 'Tidak Tepat Waktu'),
(38, 'Fanani Riza Hutomo', '1502020171', 'Teknik Kimia', '2123 days', '2.78', '467', 'Tidak Tepat Waktu'),
(39, 'Aji Nugroho Diwantoro', '1600020094', 'Teknik Kimia', '1759 days', '3.59', '456', 'Tidak Tepat Waktu'),
(40, 'Achmad Saidi Noor', '1600020105', 'Teknik Kimia', '1759 days', '3.45', '463', 'Tidak Tepat Waktu'),
(41, 'Dewi Rahmadiyah', '1700020059', 'Teknik Kimia', '1398 days', '3.62', '462', 'Tepat Waktu'),
(42, 'Rima Dian Nur Khasanah', '1700020061', 'Teknik Kimia', '1398 days', '3.66', '418', 'Tepat Waktu'),
(43, 'Elisa Puspita Anggraeni', '1700020065', 'Teknik Kimia', '1398 days', '3.78', '462', 'Tepat Waktu'),
(44, 'Fithnatia Khoirunnisa', '1700020076', 'Teknik Kimia', '1398 days', '3.78', '524', 'Tepat Waktu'),
(45, 'Sella Agustin', '1700020087', 'Teknik Kimia', '1398 days', '3.87', '420', 'Tepat Waktu'),
(46, 'Hilma Viola', '1700020104', 'Teknik Kimia', '1398 days', '3.81', '434', 'Tepat Waktu'),
(47, 'Tifanny Rizka Ariandi', '1714020004', 'Teknik Kimia', '1398 days', '3.94', '496', 'Tepat Waktu'),
(48, 'Ustinah', '1715020138', 'Teknik Kimia', '1398 days', '3.93', '439', 'Tepat Waktu'),
(49, 'Dewi Mutiara Sakti', '1700020068', 'Teknik Kimia', '1426 days', '3.59', '418', 'Tepat Waktu'),
(50, 'Nona Septiani', '1700020077', 'Teknik Kimia', '1426 days', '3.54', '404', 'Tepat Waktu'),
(51, 'Sindy Rosita Devi', '1700020089', 'Teknik Kimia', '1426 days', '3.61', '408', 'Tepat Waktu'),
(52, 'Bella Heriyanti', '1700020136', 'Teknik Kimia', '1426 days', '3.83', '427', 'Tepat Waktu'),
(53, 'Zalma Raulina Romadiah', '1700020143', 'Teknik Kimia', '1426 days', '3.65', '446', 'Tepat Waktu'),
(54, 'Muhammad Agus Prasetyo', '1400020007', 'Teknik Kimia', '2534 days', '2.49', '481', 'Tidak Tepat Waktu'),
(55, 'Gilang Cahyadi', '1400020049', 'Teknik Kimia', '2534 days', '2.55', '444', 'Tidak Tepat Waktu'),
(56, 'Enggar Dwi Ardani', '1600020070', 'Teknik Kimia', '1799 days', '3.23', '417', 'Tidak Tepat Waktu'),
(57, 'Puji Ariyanto', '1600020109', 'Teknik Kimia', '1799 days', '3.03', '420', 'Tidak Tepat Waktu'),
(58, 'Rindang Septiani Muflikhah', '1700020010', 'Teknik Kimia', '1438 days', '3.91', '484', 'Tepat Waktu'),
(59, 'Khozaa Inatul Muna', '1700020019', 'Teknik Kimia', '1438 days', '3.88', '484', 'Tepat Waktu'),
(60, 'Ni Putu Agnes Suari', '1700020051', 'Teknik Kimia', '1438 days', '3.61', '411', 'Tepat Waktu'),
(61, 'Isna Nurul Sita Devi', '1700020086', 'Teknik Kimia', '1438 days', '3.75', '458', 'Tepat Waktu'),
(62, 'Windi Septi Anindi', '1700020090', 'Teknik Kimia', '1438 days', '3.7', '403', 'Tepat Waktu'),
(63, 'Imelda Eka Nurshinta', '1700020092', 'Teknik Kimia', '1438 days', '3.58', '464', 'Tepat Waktu'),
(64, 'Ratih Mahardhika', '1700020103', 'Teknik Kimia', '1438 days', '3.57', '431', 'Tepat Waktu'),
(65, 'Anisah Nur Amalia', '1700020112', 'Teknik Kimia', '1438 days', '3.39', '437', 'Tepat Waktu'),
(66, 'Ayu Wulandari', '1700020020', 'Teknik Kimia', '1454 days', '3.43', '478', 'Tepat Waktu'),
(67, 'Mita Gustia', '1700020037', 'Teknik Kimia', '1454 days', '3.58', '456', 'Tepat Waktu'),
(68, 'Aistia Maya Tira', '1700020057', 'Teknik Kimia', '1454 days', '3.54', '505', 'Tepat Waktu'),
(69, 'Den Sulthan Bagas Ardiansyah', '1700020129', 'Teknik Kimia', '1454 days', '3.71', '507', 'Tepat Waktu'),
(70, 'Muhammad Rizky Nendanov', '1700020132', 'Teknik Kimia', '1454 days', '3.55', '440', 'Tepat Waktu'),
(71, 'Agam Yogi Fahlevi', '1700020002', 'Teknik Kimia', '1460 days', '3.54', '502', 'Tepat Waktu'),
(72, 'Firanita Angraini Putri', '1700020024', 'Teknik Kimia', '1460 days', '3.75', '482', 'Tepat Waktu'),
(73, 'Siti Mutmaina', '1700020026', 'Teknik Kimia', '1460 days', '3.64', '436', 'Tepat Waktu'),
(74, 'Dimas Amani Praviant Zuhair', '1700020043', 'Teknik Kimia', '1460 days', '3.62', '522', 'Tepat Waktu'),
(75, 'Endah Dwi Saputri', '1700020062', 'Teknik Kimia', '1460 days', '3.73', '404', 'Tepat Waktu'),
(76, 'Muhammad Setiyawan Ashari', '1700020073', 'Teknik Kimia', '1460 days', '3.56', '412', 'Tepat Waktu'),
(77, 'Sherena Dwi Lathiefa', '1700020081', 'Teknik Kimia', '1460 days', '3.28', '406', 'Tepat Waktu'),
(78, 'Ika Devi Pangesti', '1700020115', 'Teknik Kimia', '1460 days', '3.55', '415', 'Tepat Waktu'),
(79, 'Zusuf Tri Purnomo', '1700020021', 'Teknik kimia', '1475 days', '3.74', '490', 'Tidak Tepat Waktu'),
(80, 'Regina Pebriani Nugraha', '1715020141', 'Teknik kimia', '1475 days', '3.8', '424', 'Tidak Tepat Waktu'),
(81, 'Fahri Putra Ardianto', '1500020164', 'Teknik Kimia', '2215 days', '3.59', '433', 'Tidak Tepat Waktu'),
(82, 'Nurul Hidayati Nur Sayyid', '1600020030', 'Teknik Kimia', '1851 days', '3.05', '426', 'Tidak Tepat Waktu'),
(83, 'Syafruddin', '1600020056', 'Teknik Kimia', '1851 days', '3.4', '450', 'Tidak Tepat Waktu'),
(84, 'Muhammad Ramma Mesandhy', '1600020065', 'Teknik Kimia', '1851 days', '3.21', '415', 'Tidak Tepat Waktu'),
(85, 'Muhammad Hakiim Marzun', '1600020075', 'Teknik Kimia', '1851 days', '3.13', '400', 'Tidak Tepat Waktu'),
(86, 'Anggun Ansafa Wati', '1700020027', 'Teknik Kimia', '1490 days', '3.92', '448', 'Tidak Tepat Waktu'),
(87, 'Ridho Mahendra', '1700020029', 'Teknik Kimia', '1490 days', '3.57', '498', 'Tidak Tepat Waktu'),
(88, 'Astri Nur Wahyuni', '1700020033', 'Teknik Kimia', '1490 days', '3.66', '494', 'Tidak Tepat Waktu'),
(89, 'Findhita Kusuma Putri', '1700020035', 'Teknik Kimia', '1490 days', '3.79', '462', 'Tidak Tepat Waktu'),
(90, 'Winda Maizani', '1700020047', 'Teknik Kimia', '1490 days', '3.71', '540', 'Tidak Tepat Waktu'),
(91, 'Gea Sheila Saskia Shafira', '1700020048', 'Teknik Kimia', '1490 days', '3.7', '555', 'Tidak Tepat Waktu'),
(92, 'Heidy Oktavia Nisa', '1700020050', 'Teknik Kimia', '1490 days', '3.78', '466', 'Tidak Tepat Waktu'),
(93, 'Fitri Solecha Kusumadewi', '1700020052', 'Teknik Kimia', '1490 days', '3.68', '468', 'Tidak Tepat Waktu'),
(94, 'Alida Niza Chamelia', '1700020056', 'Teknik Kimia', '1490 days', '3.82', '453', 'Tidak Tepat Waktu'),
(95, 'Yogi Try Pratama Putra Nasution', '1700020085', 'Teknik Kimia', '1490 days', '3.62', '432', 'Tidak Tepat Waktu'),
(96, 'Ririn Amelia', '1700020106', 'Teknik Kimia', '1490 days', '3.4', '401', 'Tidak Tepat Waktu'),
(97, 'Nurul Khoiriah Felba Utami', '1700020111', 'Teknik Kimia', '1490 days', '3.22', '540', 'Tidak Tepat Waktu'),
(98, 'Meinanda Nabila Kitania', '1700020114', 'Teknik Kimia', '1490 days', '3.52', '439', 'Tidak Tepat Waktu'),
(99, 'Woro Astrid Kharismatika', '1700020119', 'Teknik Kimia', '1490 days', '3.6', '434', 'Tidak Tepat Waktu'),
(100, 'Sella Nurul Aulia ', '1700020120', 'Teknik Kimia', '1490 days', '3.69', '455', 'Tidak Tepat Waktu'),
(101, 'Ratna Inayah', '1700020152', 'Teknik Kimia', '1490 days', '3.62', '511', 'Tidak Tepat Waktu'),
(102, 'Tri Bahari', '1700020156', 'Teknik Kimia', '1490 days', '3.44', '491', 'Tidak Tepat Waktu'),
(103, 'Wahyu Elka Wakzuh', '1600020043', 'Teknik Kimia', '1864 days', '2.97', '474', 'Tidak Tepat Waktu'),
(104, 'Alifia Fadhilah Zuhri', '1700020003', 'Teknik Kimia', '1503 days', '3.26', '493', 'Tidak Tepat Waktu'),
(105, 'Nauval Shoffa Muzakky', '1700020013', 'Teknik Kimia', '1503 days', '3.39', '482', 'Tidak Tepat Waktu'),
(106, 'Ilham Bintang Persada', '1700020030', 'Teknik Kimia', '1503 days', '3.32', '493', 'Tidak Tepat Waktu'),
(107, 'Ina Mandalika', '1700020031', 'Teknik Kimia', '1503 days', '3.37', '432', 'Tidak Tepat Waktu'),
(108, 'Resnia Nurahmawati', '1700020040', 'Teknik Kimia', '1503 days', '3.3', '488', 'Tidak Tepat Waktu'),
(109, 'Arief Marcellino Ferdiansyah', '1700020088', 'Teknik Kimia', '1503 days', '3.47', '498', 'Tidak Tepat Waktu'),
(110, 'Chandra Akbar', '1700020113', 'Teknik Kimia', '1503 days', '3.48', '506', 'Tidak Tepat Waktu'),
(111, 'Elfira Sulistiana', '1700020161', 'Teknik Kimia', '1503 days', '3.68', '425', 'Tidak Tepat Waktu'),
(112, 'Firda Magfiratul Husna', '1600020047', 'Teknik Kimia', '1517 days', '2.73', '352', 'Tidak Tepat Waktu'),
(113, 'Syahrul Ramadhan', '1700020049', 'Teknik Kimia', '1517 days', '3.37', '490', 'Tidak Tepat Waktu'),
(114, 'Muhammad Nur Adi Nugroho', '1700020060', 'Teknik Kimia', '1517 days', '3.42', '447', 'Tidak Tepat Waktu'),
(115, 'Thania Aura Jovariera', '1700020125', 'Teknik Kimia', '1517 days', '3.41', '494', 'Tidak Tepat Waktu'),
(116, 'Nur Aisyah Novitasari', '1700020159', 'Teknik Kimia', '1517 days', '3.73', '439', 'Tidak Tepat Waktu'),
(117, 'Rifka Alfiyani', '1711020140', 'Teknik Kimia', '1517 days', '3.95', '450', 'Tidak Tepat Waktu');

-- --------------------------------------------------------

--
-- Table structure for table `industri`
--

CREATE TABLE `industri` (
  `id_indus` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `jurusan` varchar(128) NOT NULL,
  `ms` varchar(50) NOT NULL,
  `ipk` varchar(50) NOT NULL,
  `toefl` varchar(50) NOT NULL,
  `class` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `industri`
--

INSERT INTO `industri` (`id_indus`, `nama`, `nim`, `jurusan`, `ms`, `ipk`, `toefl`, `class`) VALUES
(1, 'Imam Wirahadi', '1500019050', 'Teknik Industri', '1990 days', '2.73', '460', 'Tidak Tepat Waktu'),
(2, 'Indra Edison', '1500019054', 'Teknik Industri', '1990 days', '3.17', '436', 'Tidak Tepat Waktu'),
(3, 'Ariko Efendi', '1500019140', 'Teknik Industri', '1990 days', '3.03', '416', 'Tidak Tepat Waktu'),
(4, 'Romi Abdurrahman', '1500019142', 'Teknik Industri', '1990 days', '3.03', '420', 'Tidak Tepat Waktu'),
(5, 'Fajar Aji Prasetiyo', '1500019189', 'Teknik Industri', '1990 days', '3.44', '430', 'Tidak Tepat Waktu'),
(6, 'Andika Ardian', '1600019035', 'Teknik Industri', '1626 days', '3.13', '440', 'Tidak Tepat Waktu'),
(7, 'Dhita Budi Ariska', '1600019102', 'Teknik Industri', '1626 days', '3.47', '406', 'Tidak Tepat Waktu'),
(8, 'Erfan Fakhriyanto', '1500019143', 'Teknik Industri', '2004 days', '3.16', '400', 'Tidak Tepat Waktu'),
(9, 'Diah Nurlaila', '1600019070', 'Teknik Industri', '1640 days', '3.42', '418', 'Tidak Tepat Waktu'),
(10, 'Galih Tri Cahyana', '1600019071', 'Teknik Industri', '1640 days', '3.55', '434', 'Tidak Tepat Waktu'),
(11, 'Muhammad Arifin', '1600019130', 'Teknik Industri', '1640 days', '3.15', '420', 'Tidak Tepat Waktu'),
(12, 'Saiful Rizal Cahyadi', '1600019133', 'Teknik Industri', '1640 days', '3.6', '436', 'Tidak Tepat Waktu'),
(13, 'Yusuf Yuliana Saputra', '1500019090', 'Teknik Industri', '2011 days', '2.68', '416', 'Tidak Tepat Waktu'),
(14, 'Anggi Anggraeni', '1600019107', 'Teknik Industri', '1647 days', '3.46', '406', 'Tidak Tepat Waktu'),
(15, 'Nadjib Adjie Sunandar', '1600019125', 'Teknik Industri', '1647 days', '3.58', '400', 'Tidak Tepat Waktu'),
(16, 'Citra Engla Vasella', '1600019018', 'Teknik Industri', '1661 days', '3.59', '420', 'Tidak Tepat Waktu'),
(17, 'Arifin Muhammad Nur', '1600019040', 'Teknik Industri', '1661 days', '3', '426', 'Tidak Tepat Waktu'),
(18, 'Teguh Pangestu SM', '1600019075', 'Teknik Industri', '1661 days', '3.19', '452', 'Tidak Tepat Waktu'),
(19, 'Firman Mustakim', '1600019087', 'Teknik Industri', '1661 days', '3.37', '439', 'Tidak Tepat Waktu'),
(20, 'Imam Budi Setiawan', '1600019091', 'Teknik Industri', '1661 days', '3.61', '438', 'Tidak Tepat Waktu'),
(21, 'Jalil Jamar Huda', '1600019112', 'Teknik Industri', '1661 days', '3.23', '406', 'Tidak Tepat Waktu'),
(22, 'Yuda Hamijaya', '1600019127', 'Teknik Industri', '1661 days', '3.21', '403', 'Tidak Tepat Waktu'),
(23, 'Mohamad Aji Setyo', '1600019129', 'Teknik Industri', '1661 days', '3.03', '509', 'Tidak Tepat Waktu'),
(24, 'Ridho Kurniawan', '1600019083', 'Teknik Industri', '1668 days', '3.77', '420', 'Tidak Tepat Waktu'),
(25, 'Sangaji Agung Wicaksono', '1600019159', 'Teknik Industri', '1668 days', '3.66', '400', 'Tidak Tepat Waktu'),
(26, 'Sri Rahayu', '1600019001', 'Teknik Industri', '1682 days', '3.84', '400', 'Tidak Tepat Waktu'),
(27, 'Kahfi Galih Nugroho', '1600019019', 'Teknik Industri', '1682 days', '3.38', '434', 'Tidak Tepat Waktu'),
(28, 'Leni Zahara', '1600019055', 'Teknik Industri', '1682 days', '3.36', '463', 'Tidak Tepat Waktu'),
(29, 'Nurkhafidin', '1600019104', 'Teknik Industri', '1682 days', '3.46', '400', 'Tidak Tepat Waktu'),
(30, 'Ayu Wandani', '1600019116', 'Teknik Industri', '1682 days', '3.87', '430', 'Tidak Tepat Waktu'),
(31, 'Ravita Nurul Adila', '1600019117', 'Teknik Industri', '1682 days', '3.61', '420', 'Tidak Tepat Waktu'),
(32, 'Fahmi Irsyad Fauzi', '1500019001', 'Teknik Industri', '2053 days', '3.44', '423', 'Tidak Tepat Waktu'),
(33, 'Muhammad Ammar Ubaidillah', '1500019178', 'Teknik Industri', '2053 days', '3.16', '456', 'Tidak Tepat Waktu'),
(34, 'Isnaeni Putri Marcediani', '1600019074', 'Teknik Industri', '1689 days', '3.25', '410', 'Tidak Tepat Waktu'),
(35, 'Agung Nugroho', '1400019054', 'Teknik Industri', '2431 days', '2.67', '444', 'Tidak Tepat Waktu'),
(36, 'Dika Brahmanda Ayu Regita', '1600019108', 'Teknik Industri', '1696 days', '3.41', '440', 'Tidak Tepat Waktu'),
(37, 'Sidratul Muftiha Lasaka', '1600019119', 'Teknik Industri', '1696 days', '3.35', '428', 'Tidak Tepat Waktu'),
(38, 'Rani Setyawati', '1600019029', 'Teknik Industri', '1725 days', '3.77', '456', 'Tidak Tepat Waktu'),
(39, 'Venni Ayu Kartika Sari', '1600019085', 'Teknik Industri', '1725 days', '3.33', '417', 'Tidak Tepat Waktu'),
(40, 'Athalia Salsabila', '1600019110', 'Teknik Industri', '1725 days', '3.7', '430', 'Tidak Tepat Waktu'),
(41, 'Bagus Rioney Arnas', '1600019113', 'Teknik Industri', '1725 days', '3.1', '482', 'Tidak Tepat Waktu'),
(42, 'Isnain Ahmad Noviandri', '1600019063', 'Teknik Industri', '1745 days', '3.53', '406', 'Tidak Tepat Waktu'),
(43, 'M. Milan Madani', '1700019140', 'Teknik Industri', '1384 days', '3.72', '484', 'Tepat Waktu'),
(44, 'Yusuf Surya Irawan', '1600019124', 'Teknik Industri', '1752 days', '3.41', '430', 'Tidak Tepat Waktu'),
(45, 'Arief Setiawan', '1400019010', 'Teknik Industri', '2494 days', '2.51', '432', 'Tidak Tepat Waktu'),
(46, 'Ardi Kurniawan', '1400019034', 'Teknik Industri', '2494 days', '2.58', '440', 'Tidak Tepat Waktu'),
(47, 'Derry Hardiantoro', '1500019007', 'Teknik Industri', '2123 days', '3.32', '538', 'Tidak Tepat Waktu'),
(48, 'Danov Setiyo Nugroho', '1500019159', 'Teknik Industri', '2123 days', '3.47', '473', 'Tidak Tepat Waktu'),
(49, 'Prina Maghfirah Nabila', '1600019148', 'Teknik Industri', '1759 days', '3.63', '426', 'Tidak Tepat Waktu'),
(50, 'Novi Siska Saputra', '1400019042', 'Teknik Industri', '2508 days', '2.72', '436', 'Tidak Tepat Waktu'),
(51, 'Agustian Kobul Pamungkas', '1500019134', 'Teknik Industri', '2137 days', '2.61', '442', 'Tidak Tepat Waktu'),
(52, 'Muhammad Rizal Ichsani', '1600019008', 'Teknik Industri', '1773 days', '3.4', '430', 'Tidak Tepat Waktu'),
(53, 'Qovifah Damayanti', '1700019006', 'Teknik Industri', '1412 days', '3.78', '486', 'Tepat Waktu'),
(54, 'Gilang Febriansyah', '1700019041', 'Teknik Industri', '1412 days', '3.74', '450', 'Tepat Waktu'),
(55, 'Feri Irawan Putra', '1400019007', 'Teknik Industri', '2534 days', '3.17', '450', 'Tidak Tepat Waktu'),
(56, 'Muh. Qadri H. Mansur', '1400019032', 'Teknik Industri', '2534 days', '2.85', '370', 'Tidak Tepat Waktu'),
(57, 'Adetria Kharisma', '1400019047', 'Teknik Industri', '2534 days', '2.61', '444', 'Tidak Tepat Waktu'),
(58, 'Arokhim', '1400019081', 'Teknik Industri', '2534 days', '2.99', '433', 'Tidak Tepat Waktu'),
(59, 'Irfan Septiantoni', '1400019084', 'Teknik Industri', '2534 days', '3.18', '436', 'Tidak Tepat Waktu'),
(60, 'Wiwid Dwi Andrini', '1400019108', 'Teknik Industri', '2534 days', '2.91', '442', 'Tidak Tepat Waktu'),
(61, 'Ade Widiyanto', '1400019144', 'Teknik Industri', '2534 days', '2.74', '423', 'Tidak Tepat Waktu'),
(62, 'Nora Fadhila Elma', '1400019150', 'Teknik Industri', '2534 days', '3.52', '410', 'Tidak Tepat Waktu'),
(63, 'Kurniawan Dwi Indarto', '1401019089', 'Teknik Industri', '2534 days', '3.1', '440', 'Tidak Tepat Waktu'),
(64, 'Fani Andani', '1600019011', 'Teknik Industri', '2534 days', '3.4', '420', 'Tidak Tepat Waktu'),
(65, 'Susi Susilowati', '1600019005', 'Teknik Industri', '1815 days', '3.47', '471', 'Tidak Tepat Waktu'),
(66, 'Ganjar Brian Prakoso', '1600019028', 'Teknik Industri', '1815 days', '3.56', '423', 'Tidak Tepat Waktu'),
(67, 'Ghulam Akbar Jihadi', '1600019122', 'Teknik Industri', '1815 days', '3.33', '400', 'Tidak Tepat Waktu'),
(68, 'Indra Chaerul Anwar', '1500019061', 'Teknik Industri', '2185 days', '3.34', '467', 'Tidak Tepat Waktu'),
(69, 'Akhsanul Maulana', '1600019016', 'Teknik Industri', '1821 days', '3.26', '400', 'Tidak Tepat Waktu'),
(70, 'Marsudi', '1500019216', 'Teknik Industri', '2200 days', '2.75', '497', 'Tidak Tepat Waktu'),
(71, 'Andi Kurniawan', '1500019136', 'Teknik Industri', '2215 days', '3.04', '402', 'Tidak Tepat Waktu'),
(72, 'Tirtha Kirana Putra', '1500019155', 'Teknik Industri', '2215 days', '3.04', '402', 'Tidak Tepat Waktu'),
(73, 'Hermawan Saputra', '1500019192', 'Teknik Industri', '2215 days', '3.04', '507', 'Tidak Tepat Waktu'),
(74, 'Arum Buana', '1700019007', 'Teknik Industri', '1490 days', '3.7', '460', 'Tidak Tepat Waktu'),
(75, 'Wuri Isdianto', '1700019014', 'Teknik Industri', '1490 days', '3.69', '408', 'Tidak Tepat Waktu'),
(76, 'Lalu Alan Kadarisman', '1700019105', 'Teknik Industri', '1490 days', '3.61', '400', 'Tidak Tepat Waktu'),
(77, 'Wahyu Anrian', '1700019116', 'Teknik Industri', '1490 days', '3.81', '481', 'Tidak Tepat Waktu'),
(78, 'Nisa Nurguspadita', '1700019126', 'Teknik Industri', '1490 days', '3.88', '465', 'Tidak Tepat Waktu'),
(79, 'Ratna Dewi Setianingsih', '1700019139', 'Teknik Industri', '1490 days', '3.81', '470', 'Tidak Tepat Waktu'),
(80, 'Mufida Nur Khasanah', '1700019148', 'Teknik Industri', '1490 days', '3.79', '476', 'Tidak Tepat Waktu'),
(81, 'Nur Wachid', '1700019059', 'Teknik Industri', '1503 days', '3.51', '446', 'Tidak Tepat Waktu'),
(82, 'Setya Khusna Rossy Pertiwi', '1700019146', 'Teknik Industri', '1503 days', '3.69', '473', 'Tidak Tepat Waktu'),
(83, 'Rosalina Murhida Cahyani', '1600019065', 'Teknik Industri', '1878 days', '3.2', '413', 'Tidak Tepat Waktu'),
(84, 'Juniati', '1700019127', 'Teknik Industri', '1517 days', '3.63', '469', 'Tidak Tepat Waktu');

-- --------------------------------------------------------

--
-- Table structure for table `informatika`
--

CREATE TABLE `informatika` (
  `id_infor` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `jurusan` varchar(128) NOT NULL,
  `ms` varchar(50) NOT NULL,
  `ipk` varchar(50) NOT NULL,
  `toefl` varchar(50) NOT NULL,
  `class` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `informatika`
--

INSERT INTO `informatika` (`id_infor`, `nama`, `nim`, `jurusan`, `ms`, `ipk`, `toefl`, `class`) VALUES
(1, 'Diah Nur Yunita', '1400018193', 'Teknik Informatika', '2319 days', '2.95', '457', 'Tidak Tepat Waktu'),
(2, 'Muhammad Sutikno', '1500018061', 'Teknik Informatika', '1948 days', '2.9', '423', 'Tidak Tepat Waktu'),
(3, 'Taufik Cahya Prayitna', '1600018106', 'Teknik Informatika', '1584 days', '3.16', '403', 'Tidak Tepat Waktu'),
(4, 'Alfa Moh Alghifari', '1600018188', 'Teknik Informatika', '1584 days', '3.16', '436', 'Tidak Tepat Waktu'),
(5, 'Kurniawan Sukimin Atmodjo', '1500018148', 'Teknik Informatika', '1955 days', '3.07', '413', 'Tidak Tepat Waktu'),
(6, 'Ridar Gustia Priatama', '1600018161', 'Teknik Informatika', '1591 days', '3.57', '423', 'Tidak Tepat Waktu'),
(7, 'Imam Yasir Haidar', '1600018197', 'Teknik Informatika', '1591 days', '3.27', '460', 'Tidak Tepat Waktu'),
(8, 'Lalu Iskandar Muda', '1600018233', 'Teknik Informatika', '1591 days', '3.13', '450', 'Tidak Tepat Waktu'),
(9, 'Edi Siswanto', '1500018018', 'Teknik Informatika', '1969 days', '3.34', '418', 'Tidak Tepat Waktu'),
(10, 'Yogi Anggara', '1500018073', 'Teknik Informatika', '1969 days', '3.13', '410', 'Tidak Tepat Waktu'),
(11, 'Septian Eka Prasetya', '1500018139', 'Teknik Informatika', '1969 days', '2.93', '406', 'Tidak Tepat Waktu'),
(12, 'Luthfi Ryanto', '1500018174', 'Teknik Informatika', '1969 days', '2.82', '413', 'Tidak Tepat Waktu'),
(13, 'Devi Nanda Aryani Sirait', '1500018202', 'Teknik Informatika', '1969 days', '3.14', '406', 'Tidak Tepat Waktu'),
(14, 'Muhammad Bayu Aji Sakirno', '1600018112', 'Teknik Informatika', '1605 days', '3.35', '443', 'Tidak Tepat Waktu'),
(15, 'Khairul Maftuh Hidayat', '1600018190', 'Teknik Informatika', '1605 days', '3.25', '460', 'Tidak Tepat Waktu'),
(16, 'Firmansyah', '1500018144', 'Teknik Informatika', '1983 days', '3.27', '436', 'Tidak Tepat Waktu'),
(17, 'Setiawan Panjirai', '1500018155', 'Teknik Informatika', '1983 days', '2.75', '426', 'Tidak Tepat Waktu'),
(18, 'Hadi Mustopa', '1500018160', 'Teknik Informatika', '1983 days', '2.8', '413', 'Tidak Tepat Waktu'),
(19, 'Ardaris Trisna Putra', '1600018020', 'Teknik Informatika', '1619 days', '3.58', '460', 'Tidak Tepat Waktu'),
(20, 'Ilham Fahrezi', '1600018227', 'Teknik Informatika', '1619 days', '3.13', '430', 'Tidak Tepat Waktu'),
(21, 'Dhian Fendina Hapsari', '1600018024', 'Teknik Informatika', '1626 days', '3.3', '416', 'Tidak Tepat Waktu'),
(22, 'Hedi Nasrudin', '1600018042', 'Teknik Informatika', '1626 days', '3.17', '426', 'Tidak Tepat Waktu'),
(23, 'Riski Resha', '1600018043', 'Teknik Informatika', '1626 days', '3.19', '433', 'Tidak Tepat Waktu'),
(24, 'Hermawan', '1600018075', 'Teknik Informatika', '1626 days', '3.35', '456', 'Tidak Tepat Waktu'),
(25, 'Iant Febrian Polapa', '1600018088', 'Teknik Informatika', '1626 days', '3.14', '430', 'Tidak Tepat Waktu'),
(26, 'Ilham Akbari Winoto', '1600018129', 'Teknik Informatika', '1626 days', '3.58', '459', 'Tidak Tepat Waktu'),
(27, 'Musytasyfa Syauqony Daulay', '1600018210', 'Teknik Informatika', '1626 days', '3.76', '470', 'Tidak Tepat Waktu'),
(28, 'M.Faqihudin', '1400018168', 'Teknik Informatika', '2364 days', '2.44', '466', 'Tidak Tepat Waktu'),
(29, 'Sri Wahyuni', '1400018214', 'Teknik Informatika', '2364 days', '3.68', '430', 'Tidak Tepat Waktu'),
(30, 'Okta Riandika Wibowo', '1500018027', 'Teknik Informatika', '1993 days', '3', '425', 'Tidak Tepat Waktu'),
(31, 'Cicin Hardiyanti P.', '1600018132', 'Teknik Informatika', '1629 days', '3.35', '410', 'Tidak Tepat Waktu'),
(32, 'Muhammad Fauzan', '1600018221', 'Teknik Informatika', '1629 days', '3.28', '443', 'Tidak Tepat Waktu'),
(33, 'Dandi Anto', '1600018180', 'Teknik Informatika', '1640 days', '3.27', '400', 'Tidak Tepat Waktu'),
(34, 'Romakh Fitriani', '1500018268', 'Teknik Informatika', '2011 days', '3.22', '447', 'Tidak Tepat Waktu'),
(35, 'Yana Safitri', '1500018259', 'Teknik Informatika', '2025 days', '3.13', '422', 'Tidak Tepat Waktu'),
(36, 'Irfan Afandi', '1600018085', 'Teknik Informatika', '1661 days', '3.23', '416', 'Tidak Tepat Waktu'),
(37, 'Arfiansyah', '1600018100', 'Teknik Informatika', '1661 days', '3.43', '426', 'Tidak Tepat Waktu'),
(38, 'Havesthi Yazera', '1600018217', 'Teknik Informatika', '1661 days', '3.05', '479', 'Tidak Tepat Waktu'),
(39, 'Bayu Maulana Yogi Kisworo', '1400018133', 'Teknik Informatika', '2403 days', '3.04', '440', 'Tidak Tepat Waktu'),
(40, 'Muhammad Arif Nuur Hafidz', '1500018245', 'Teknik Informatika', '2032 days', '3.04', '413', 'Tidak Tepat Waktu'),
(41, 'Akbar Ramadhan', '1500018298', 'Teknik Informatika', '2032 days', '2.8', '503', 'Tidak Tepat Waktu'),
(42, 'Rizal Dwi Setya', '1600018013', 'Teknik Informatika', '1668 days', '3.15', '402', 'Tidak Tepat Waktu'),
(43, 'Rifqi Hirawan', '1600018153', 'Teknik Informatika', '1668 days', '3.21', '446', 'Tidak Tepat Waktu'),
(44, 'Imam Safei', '1600018155', 'Teknik Informatika', '1668 days', '3.27', '449', 'Tidak Tepat Waktu'),
(45, 'Wahyu Rusdiansyah Hasyim Ananda Hidayat', '1600018170', 'Teknik Informatika', '1668 days', '3.41', '403', 'Tidak Tepat Waktu'),
(46, 'Azkiya Martadewi Nuraeni', '1600018225', 'Teknik Informatika', '1668 days', '3.48', '400', 'Tidak Tepat Waktu'),
(47, 'Syaid Iqbal Hamsan', '1600018235', 'Teknik Informatika', '1668 days', '3.4', '400', 'Tidak Tepat Waktu'),
(48, 'Bayu Maulana Yogi Kisworo', '1400018133', 'Teknik Informatika', '2417 days', '3.04', '446', 'Tidak Tepat Waktu'),
(49, 'Dicky Haryadi', '1400018161', 'Teknik Informatika', '2417 days', '3.44', '436', 'Tidak Tepat Waktu'),
(50, 'Agus Susilo Jatmiko', '1500018075', 'Teknik Informatika', '2046 days', '2.55', '400', 'Tidak Tepat Waktu'),
(51, 'Muhammad Ridho Rohanda', '1600018010', 'Teknik Informatika', '1682 days', '3.53', '460', 'Tidak Tepat Waktu'),
(52, 'Agies Dwi Permana', '1600018023', 'Teknik Informatika', '1682 days', '3.55', '460', 'Tidak Tepat Waktu'),
(53, 'Ahmad Yasin Habibillah', '1600018070', 'Teknik Informatika', '1682 days', '3.52', '433', 'Tidak Tepat Waktu'),
(54, 'Probo Prasetiyo', '1600018178', 'Teknik Informatika', '1682 days', '3.35', '446', 'Tidak Tepat Waktu'),
(55, 'Friska Wardani', '1400018071', 'Teknik Informatika', '2424 days', '3.41', '456', 'Tidak Tepat Waktu'),
(56, 'Nurrahmi', '1400018102', 'Teknik Informatika', '2424 days', '3.12', '456', 'Tidak Tepat Waktu'),
(57, 'Ayu Oktafiani Sukarnadi S.', '1600018048', 'Teknik Informatika', '1689 days', '3.38', '440', 'Tidak Tepat Waktu'),
(58, 'Yogi Faherza', '1600018073', 'Teknik Informatika', '1689 days', '3.28', '494', 'Tidak Tepat Waktu'),
(59, 'Firdaus Subkhi', '1600018035', 'Teknik Informatika', '1696 days', '3.19', '410', 'Tidak Tepat Waktu'),
(60, 'Syahdillah Mutiara R Tomagola', '1600018089', 'Teknik Informatika', '1696 days', '3.21', '453', 'Tidak Tepat Waktu'),
(61, 'Ajeng Fika Rahmahani', '1600018194', 'Teknik Informatika', '1696 days', '3.75', '438', 'Tidak Tepat Waktu'),
(62, 'Rizky Yoga Berliando', '1600018196', 'Teknik Informatika', '1696 days', '3.46', '423', 'Tidak Tepat Waktu'),
(63, 'Ardiansyah', '1600018058', 'Teknik Informatika', '1725 days', '2.9', '420', 'Tidak Tepat Waktu'),
(64, 'Andri Hermawan', '1600018116', 'Teknik Informatika', '1725 days', '3.43', '420', 'Tidak Tepat Waktu'),
(65, 'Rio Anggara', '1600018237', 'Teknik Informatika', '1725 days', '3.31', '410', 'Tidak Tepat Waktu'),
(66, 'Okta Fandrian', '1500018065', 'Teknik Informatika', '2102 days', '3.02', '430', 'Tidak Tepat Waktu'),
(67, 'Bagas Yoga Prasetyo', '1500018256', 'Teknik Informatika', '2102 days', '3.26', '443', 'Tidak Tepat Waktu'),
(68, 'Akmal Zakyzain Haqqi\n\n', '1600018060', 'Teknik Informatika', '1738 days', '3.06', '473', 'Tidak Tepat Waktu'),
(69, 'Lalu Galuh Sumardani', '1400018077', 'Teknik Informatika', '2480 days', '2.43', '400', 'Tidak Tepat Waktu'),
(70, 'Denny Hilmawan Rahmatullah Wolley', '1400018110', 'Teknik Informatika', '2480 days', '3.34', '496', 'Tidak Tepat Waktu'),
(71, 'Muhamad Khoirul Huda', '1600018166', 'Teknik Informatika', '1745 days', '3.17', '405', 'Tidak Tepat Waktu'),
(72, 'Diokta Fajri', '1500018151', 'Teknik Informatika', '2116 days', '3.06', '466', 'Tidak Tepat Waktu'),
(73, 'Ragil Fiyantoro', '1400018186', 'Teknik Informatika', '2494 days', '2.93', '433', 'Tidak Tepat Waktu'),
(74, 'Hanun Fitriani Latuconsina', '1500018211', 'Teknik Informatika', '2123 days', '3.08', '410', 'Tidak Tepat Waktu'),
(75, 'Faadihilah Ahnaf Faiz', '1600018033', 'Teknik Informatika', '1759 days', '3.56', '446', 'Tidak Tepat Waktu'),
(76, 'Wahyu Dwi Prasetyo', '1600018142', 'Teknik Informatika', '1759 days', '3', '440', 'Tidak Tepat Waktu'),
(77, 'Helmi Pratama', '1600018195', 'Teknik Informatika', '1759 days', '3.17', '453', 'Tidak Tepat Waktu'),
(78, 'Risky Andika Kurniawan', '1400018072', 'Teknik Informatika', '2508 days', '3.1', '488', 'Tidak Tepat Waktu'),
(79, 'Hisyam Dwi Wibowo', '1400018080', 'Teknik Informatika', '2508 days', '2.86', '486', 'Tidak Tepat Waktu'),
(80, 'Akbar Wicaksono', '1400018120', 'Teknik Informatika', '2508 days', '3.09', '487', 'Tidak Tepat Waktu'),
(81, 'Anggita Putri Nur Anida', '1400018218', 'Teknik Informatika', '2508 days', '3.34', '416', 'Tidak Tepat Waktu'),
(82, 'Ade Dermawan', '1500018177', 'Teknik Informatika', '2137 days', '3.14', '423', 'Tidak Tepat Waktu'),
(83, 'Lula Fikria Akmal', '1600018051', 'Teknik Informatika', '1773 days', '3.38', '460', 'Tidak Tepat Waktu'),
(84, 'Lisna Puspita Shafira', '1600018122', 'Teknik Informatika', '1773 days', '3.7', '456', 'Tidak Tepat Waktu'),
(85, 'Syafiah Nailul Farah', '1600018137', 'Teknik Informatika', '1773 days', '3.44', '423', 'Tidak Tepat Waktu'),
(86, 'Okhy Kharisma Putri', '1600018138', 'Teknik Informatika', '1773 days', '3.34', '490', 'Tidak Tepat Waktu'),
(87, 'Alief Ageng Pambudi', '1400018184', 'Teknik Informatika', '2522 days', '2.54', '403', 'Tidak Tepat Waktu'),
(88, 'Muhamad Fikri', '1600018044', 'Teknik Informatika', '1787 days', '3.36', '468', 'Tidak Tepat Waktu'),
(89, 'Nofan Fahmie Wibowo', '1600018062', 'Teknik Informatika', '1787 days', '3', '488', 'Tidak Tepat Waktu'),
(90, 'Ariemby Kusuma W', '1400018008', 'Teknik Informatika', '2534 days', '2.87', '413', 'Tidak Tepat Waktu'),
(91, 'M Saiful Hadi', '1400018015', 'Teknik Informatika', '2534 days', '2.78', '463', 'Tidak Tepat Waktu'),
(92, 'Jundy Islami', '1400018019', 'Teknik Informatika', '2534 days', '2.56', '410', 'Tidak Tepat Waktu'),
(93, 'Windy Shela Ramadhani', '1400018025', 'Teknik Informatika', '2534 days', '2.62', '403', 'Tidak Tepat Waktu'),
(94, 'Mohammad Ibrahim', '1400018037', 'Teknik Informatika', '2534 days', '2.38', '456', 'Tidak Tepat Waktu'),
(95, 'Prasti Kusuma Dinata', '1400018052', 'Teknik Informatika', '2534 days', '2.68', '445', 'Tidak Tepat Waktu'),
(96, 'Bayu Khoirul Muntaha', '1400018055', 'Teknik Informatika', '2534 days', '2.95', '400', 'Tidak Tepat Waktu'),
(97, 'Lalu Khalikurrahman', '1400018062', 'Teknik Informatika', '2534 days', '2.38', '424', 'Tidak Tepat Waktu'),
(98, 'Meri Aftriyani', '1400018064', 'Teknik informatika', '2534 days', '3', '409', 'Tidak Tepat Waktu'),
(99, 'Dimas Kurnia Fajar Prasetya', '1400018100', 'Teknik Informatika', '2534 days', '2.49', '407', 'Tidak Tepat Waktu'),
(100, 'Restu Prima Yudha', '1400018119', 'Teknik Informatika', '2534 days', '2.5', '496', 'Tidak Tepat Waktu'),
(101, 'Trianja Haryadi', '1400018125', 'Teknik Informatika', '2534 days', '2.95', '479', 'Tidak Tepat Waktu'),
(102, 'Erico Ryandika Miftahgitas', '1400018153', 'Teknik Informatika', '2534 days', '2.76', '393', 'Tidak Tepat Waktu'),
(103, 'Khaffid Dwi Kurniadi', '1400018204', 'Teknik Informatika', '2534 days', '3.15', '406', 'Tidak Tepat Waktu'),
(104, 'Purwo Fauzan Rusadi', '1400018205', 'Teknik Informatika', '2534 days', '3.14', '406', 'Tidak Tepat Waktu'),
(105, 'Andiy Irwanda', '1400018211', 'Teknik Informatika', '2534 days', '3.18', '456', 'Tidak Tepat Waktu'),
(106, 'Dana Adhika', '1400018232', 'Teknik Informatika', '2534 days', '2.48', '443', 'Tidak Tepat Waktu'),
(107, 'Septian Aji Pamungkas', '1400018248', 'Teknik Informatika', '2534 days', '2.77', '415', 'Tidak Tepat Waktu'),
(108, 'Muhammad Sidik', '1400018249', 'Teknik Informatika', '2534 days', '3.69', '456', 'Tidak Tepat Waktu'),
(109, 'Lalu Arfi Maulana Pangistu', '1700018019', 'Teknik Informatika', '1438 days', '3.56', '490', 'Tepat Waktu'),
(110, 'Daffa Setiawan Suparno', '1700018027', 'Teknik Informatika', '1438 days', '3.47', '485', 'Tepat Waktu'),
(111, 'Muhamad Fadhil Indirwan', '1600018213', 'Teknik Informatika', '1815 days', '3.22', '454', 'Tidak Tepat Waktu'),
(112, 'Ardhiyan Azizi', '1600018220', 'Teknik Informatika', '1815 days', '3.41', '512', 'Tidak Tepat Waktu'),
(113, 'Fajar Aji Saputro', '1600018037', 'Teknik Informatika', '1821 days', '3.07', '403', 'Tidak Tepat Waktu'),
(114, 'Brian Prihartama', '1600018114', 'Teknik Informatika', '1821 days', '3.39', '453', 'Tidak Tepat Waktu'),
(115, 'Ade Faizal Risqi', '1600018218', 'Teknik Informatika', '1460 days', '3.39', '430', 'Tepat Waktu'),
(116, 'Muhammad Iqbal Hadiwibowo', '1700018101', 'Teknik Informatika', '1460 days', '3.46', '473', 'Tepat Waktu'),
(117, 'Nur Fadhilah Alfianty Firman', '1700018122', 'Teknik Informatika', '1460 days', '3.46', '449', 'Tepat Waktu'),
(118, 'Aditya Angga Ramadhan', '1700018131', 'Teknik Informatika', '1460 days', '3.72', '422', 'Tepat Waktu'),
(119, 'Nurzaitun Safitri', '1700018140', 'Teknik Informatika', '1460 days', '3.46', '426', 'Tepat Waktu'),
(120, 'Itmam Diyar Al Salam', '1600018234', 'Teknik Informatika', '1836 days', '3.75', '473', 'Tidak Tepat Waktu'),
(121, 'Azmi Badhi\'uz Zaman', '1700018002', 'Teknik Informatika', '1475 days', '3.59', '423', 'Tidak Tepat Waktu'),
(122, 'Refaldi Ergian', '1700018013', 'Teknik Informatika', '1475 days', '3.65', '489', 'Tidak Tepat Waktu'),
(123, 'Singgih Bayu Wicaksono', '1700018034', 'Teknik Informatika', '1475 days', '3.19', '478', 'Tidak Tepat Waktu'),
(124, 'Yoga Firza Sabbihisma', '1700018253', 'Teknik Informatika', '1475 days', '3.36', '464', 'Tidak Tepat Waktu'),
(125, 'Lazuardi Imani Ashar', '1500018010', 'Teknik informatika', '2215 days', '2.69', '403', 'Tidak Tepat Waktu'),
(126, 'Suwanto ', '1500018046', 'Teknik informatika', '2215 days', '3.4', '472', 'Tidak Tepat Waktu'),
(127, 'Ilham Setiawan', '1600018008', 'Teknik informatika', '1851 days', '3.07', '423', 'Tidak Tepat Waktu'),
(128, 'Wahyu Shofian', '1600018045', 'Teknik informatika', '1851 days', '3.13', '423', 'Tidak Tepat Waktu'),
(129, 'Muhammad Ridho Hidayat', '1600018054', 'Teknik informatika', '1851 days', '3.14', '487', 'Tidak Tepat Waktu'),
(130, 'Yeni Alviani', '1600018124', 'Teknik informatika', '1851 days', '3.35', '403', 'Tidak Tepat Waktu'),
(131, 'Mahendra Prabowo', '1600018208', 'Teknik informatika', '1851 days', '3.16', '430', 'Tidak Tepat Waktu'),
(132, 'Mochammad Yulianto Andi Saputro', '1700018144', 'Teknik informatika', '1490 days', '3.83', '405', 'Tidak Tepat Waktu'),
(133, 'Susanti Aulia Ramadayanti', '1700018179', 'Teknik informatika', '1490 days', '3.53', '423', 'Tidak Tepat Waktu'),
(134, 'Aditya Cahyo Pramono', '1700018184', 'Teknik informatika', '1490 days', '3.67', '484', 'Tidak Tepat Waktu'),
(135, 'Lalu Abd. Halim Yatna', '1500018058', 'Teknik Informatika', '2228 days', '2.84', '488', 'Tidak Tepat Waktu'),
(136, 'Harith Noviansyah', '1600018182', 'Teknik Informatika', '1864 days', '3.16', '400', 'Tidak Tepat Waktu'),
(137, 'Gilang Asis Ramadan', '1700018042', 'Teknik Informatika', '1503 days', '3.45', '427', 'Tidak Tepat Waktu'),
(138, 'Muhammad Musa Fitriyadi', '1700018055', 'Teknik Informatika', '1503 days', '3.27', '453', 'Tidak Tepat Waktu'),
(139, 'Ilham Fauzi Romadhoni', '1700018218', 'Teknik Informatika', '1503 days', '3.31', '431', 'Tidak Tepat Waktu'),
(140, 'Muhamad Fahmi', '1600018159', 'Teknik Informatika', '1517 days', '3.52', '443', 'Tidak Tepat Waktu'),
(141, 'Firda Aprilia Priandini', '1700018063', 'Teknik Informatika', '1517 days', '3.49', '445', 'Tidak Tepat Waktu'),
(142, 'Via Wahyuningtyas', '1700018067', 'Teknik Informatika', '1517 days', '3.73', '488', 'Tidak Tepat Waktu'),
(143, 'Zulfan Khaidir', '1700018070', 'Teknik Informatika', '1517 days', '3.31', '470', 'Tidak Tepat Waktu'),
(144, 'Zulfikar Yunus', '1700018080', 'Teknik Informatika', '1517 days', '3.36', '488', 'Tidak Tepat Waktu'),
(145, 'Rohmatul Linafiin', '1700018196', 'Teknik Informatika', '1517 days', '3.43', '426', 'Tidak Tepat Waktu');

-- --------------------------------------------------------

--
-- Table structure for table `kimia`
--

CREATE TABLE `kimia` (
  `id_kimia` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `jurusan` varchar(128) NOT NULL,
  `ms` varchar(50) NOT NULL,
  `ipk` varchar(50) NOT NULL,
  `toefl` varchar(50) NOT NULL,
  `class` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kimia`
--

INSERT INTO `kimia` (`id_kimia`, `nama`, `nim`, `jurusan`, `ms`, `ipk`, `toefl`, `class`) VALUES
(1, 'Sarah Fazlia', '1600020113', 'Teknik Kimia', '1605 days', '3.51', '430', 'Tidak Tepat Waktu'),
(2, 'Ayu Citra Dewi', '1600020118', 'Teknik Kimia', '1605 days', '3.64', '446', 'Tidak Tepat Waktu'),
(3, 'Niken Dwi Astuti', '1600020057', 'Teknik Kimia', '1626 days', '3.09', '413', 'Tidak Tepat Waktu'),
(4, 'Mahes Pati Agustiani', '1600020007', 'Teknik Kimia', '1629 days', '3.15', '400', 'Tidak Tepat Waktu'),
(5, 'Muhsin Tahir', '1600020063', 'Teknik Kimia', '1647 days', '3.34', '446', 'Tidak Tepat Waktu'),
(6, 'Nirwan Triyadi', '1600020087', 'Teknik Kimia', '1647 days', '3.08', '430', 'Tidak Tepat Waktu'),
(7, 'Dicki Sanjaya', '1500020056', 'Teknik Kimia', '2025 days', '3', '402', 'Tidak Tepat Waktu'),
(8, 'Wisnu Syaifin Nuha', '1600020067', 'Teknik Kimia', '1661 days', '3.15', '416', 'Tidak Tepat Waktu'),
(9, 'Mas Arief Kusumawijaya', '1600020092', 'Teknik Kimia', '1661 days', '3.19', '450', 'Tidak Tepat Waktu'),
(10, 'Yusuf Eko Nugroho', '1600020081', 'Teknik Kimia', '1668 days', '3.26', '443', 'Tidak Tepat Waktu'),
(11, 'Muhammad Hanafi', '1615020102', 'Teknik Kimia', '1668 days', '3.19', '433', 'Tidak Tepat Waktu'),
(12, 'Sarah Haura Zalfa', '1700020098', 'Teknik Kimia', '1307 days', '3.67', '441', 'Tepat Waktu'),
(13, 'Eva Kusmayanti', '1700020100', 'Teknik Kimia', '1307 days', '3.68', '431', 'Tepat Waktu'),
(14, 'Sarah Haura Zalfa', '1700020098', 'Teknik Kimia', '1321 days', '3.67', '441', 'Tepat Waktu'),
(15, 'Arif Khoirul Safi\'i', '1600020097', 'Teknik Kimia', '1689 days', '3.5', '406', 'Tidak Tepat Waktu'),
(16, 'Fuaidah Hasanah', '1600020108', 'Teknik Kimia', '1689 days', '3.05', '400', 'Tidak Tepat Waktu'),
(17, 'Evi Praviahani', '1600020016', 'Teknik Kimia', '1725 days', '3.43', '479', 'Tidak Tepat Waktu'),
(18, 'Safika Nur Ramadhayanti', '1600020017', 'Teknik Kimia', '1725 days', '3.32', '452', 'Tidak Tepat Waktu'),
(19, 'Rifqi Tamimi', '1700020146', 'Teknik Kimia', '1364 days', '3.74', '431', 'Tepat Waktu'),
(20, 'Wahyu Adrian', '1500020050', 'Teknik Kimia', '2102 days', '3.03', '432', 'Tidak Tepat Waktu'),
(21, 'Olga Rahmayudhi', '1600020058', 'Teknik Kimia', '1738 days', '3.59', '432', 'Tidak Tepat Waktu'),
(22, 'Reihan Neiladiyanah', '1600020079', 'Teknik Kimia', '1738 days', '3.52', '460', 'Tidak Tepat Waktu'),
(23, 'Winda Rohmah Shoffianti', '1700020072', 'Teknik kimia', '1384 days', '3.82', '438', 'Tepat Waktu'),
(24, 'Silvia Anggi Dayanti', '1700020093', 'Teknik kimia', '1384 days', '3.65', '412', 'Tepat Waktu'),
(25, 'Dila Argatiningtyas', '1700020096', 'Teknik kimia', '1384 days', '3.89', '429', 'Tepat Waktu'),
(26, 'Lia Septianingsih', '1700020105', 'Teknik kimia', '1384 days', '3.91', '431', 'Tepat Waktu'),
(27, 'Adhi Chandra Purnama', '1700020150', 'Teknik kimia', '1384 days', '3.88', '438', 'Tepat Waktu'),
(28, 'Feriz Ilham Akbar', '1700020162', 'Teknik kimia', '1384 days', '3.73', '480', 'Tepat Waktu'),
(29, 'Nenti Febi Setiyahadi', '1611020100', 'Teknik Kimia', '1752 days', '2.97', '423', 'Tidak Tepat Waktu'),
(30, 'Saniyah Humairrah', '1700020063', 'Teknik Kimia', '1391 days', '3.71', '438', 'Tepat Waktu'),
(31, 'Arida Ayu Krismawati', '1700020071', 'Teknik Kimia', '1391 days', '3.75', '400', 'Tepat Waktu'),
(32, 'Inggar Siwi Larasati', '1700020094', 'Teknik Kimia', '1391 days', '3.57', '404', 'Tepat Waktu'),
(33, 'Galuh Ajeng Larasati', '1700020095', 'Teknik Kimia', '1391 days', '3.44', '428', 'Tepat Waktu'),
(34, 'R. Kurniawan', '1700020155', 'Teknik Kimia', '1391 days', '3.58', '449', 'Tepat Waktu'),
(35, 'Fera Florensia Babut', '1400020041', 'Teknik Kimia', '2494 days', '2.95', '427', 'Tidak Tepat Waktu'),
(36, 'Reny Ramadanty', '1400020056', 'Teknik Kimia', '2494 days', '2.97', '460', 'Tidak Tepat Waktu'),
(37, 'Muhammad Irza Ghifary', '1500020137', 'Teknik Kimia', '2123 days', '2.8', '453', 'Tidak Tepat Waktu'),
(38, 'Fanani Riza Hutomo', '1502020171', 'Teknik Kimia', '2123 days', '2.78', '467', 'Tidak Tepat Waktu'),
(39, 'Aji Nugroho Diwantoro', '1600020094', 'Teknik Kimia', '1759 days', '3.59', '456', 'Tidak Tepat Waktu'),
(40, 'Achmad Saidi Noor', '1600020105', 'Teknik Kimia', '1759 days', '3.45', '463', 'Tidak Tepat Waktu'),
(41, 'Dewi Rahmadiyah', '1700020059', 'Teknik Kimia', '1398 days', '3.62', '462', 'Tepat Waktu'),
(42, 'Rima Dian Nur Khasanah', '1700020061', 'Teknik Kimia', '1398 days', '3.66', '418', 'Tepat Waktu'),
(43, 'Elisa Puspita Anggraeni', '1700020065', 'Teknik Kimia', '1398 days', '3.78', '462', 'Tepat Waktu'),
(44, 'Fithnatia Khoirunnisa', '1700020076', 'Teknik Kimia', '1398 days', '3.78', '524', 'Tepat Waktu'),
(45, 'Sella Agustin', '1700020087', 'Teknik Kimia', '1398 days', '3.87', '420', 'Tepat Waktu'),
(46, 'Hilma Viola', '1700020104', 'Teknik Kimia', '1398 days', '3.81', '434', 'Tepat Waktu'),
(47, 'Tifanny Rizka Ariandi', '1714020004', 'Teknik Kimia', '1398 days', '3.94', '496', 'Tepat Waktu'),
(48, 'Ustinah', '1715020138', 'Teknik Kimia', '1398 days', '3.93', '439', 'Tepat Waktu'),
(49, 'Dewi Mutiara Sakti', '1700020068', 'Teknik Kimia', '1426 days', '3.59', '418', 'Tepat Waktu'),
(50, 'Nona Septiani', '1700020077', 'Teknik Kimia', '1426 days', '3.54', '404', 'Tepat Waktu'),
(51, 'Sindy Rosita Devi', '1700020089', 'Teknik Kimia', '1426 days', '3.61', '408', 'Tepat Waktu'),
(52, 'Bella Heriyanti', '1700020136', 'Teknik Kimia', '1426 days', '3.83', '427', 'Tepat Waktu'),
(53, 'Zalma Raulina Romadiah', '1700020143', 'Teknik Kimia', '1426 days', '3.65', '446', 'Tepat Waktu'),
(54, 'Muhammad Agus Prasetyo', '1400020007', 'Teknik Kimia', '2534 days', '2.49', '481', 'Tidak Tepat Waktu'),
(55, 'Gilang Cahyadi', '1400020049', 'Teknik Kimia', '2534 days', '2.55', '444', 'Tidak Tepat Waktu'),
(56, 'Enggar Dwi Ardani', '1600020070', 'Teknik Kimia', '1799 days', '3.23', '417', 'Tidak Tepat Waktu'),
(57, 'Puji Ariyanto', '1600020109', 'Teknik Kimia', '1799 days', '3.03', '420', 'Tidak Tepat Waktu'),
(58, 'Rindang Septiani Muflikhah', '1700020010', 'Teknik Kimia', '1438 days', '3.91', '484', 'Tepat Waktu'),
(59, 'Khozaa Inatul Muna', '1700020019', 'Teknik Kimia', '1438 days', '3.88', '484', 'Tepat Waktu'),
(60, 'Ni Putu Agnes Suari', '1700020051', 'Teknik Kimia', '1438 days', '3.61', '411', 'Tepat Waktu'),
(61, 'Isna Nurul Sita Devi', '1700020086', 'Teknik Kimia', '1438 days', '3.75', '458', 'Tepat Waktu'),
(62, 'Windi Septi Anindi', '1700020090', 'Teknik Kimia', '1438 days', '3.7', '403', 'Tepat Waktu'),
(63, 'Imelda Eka Nurshinta', '1700020092', 'Teknik Kimia', '1438 days', '3.58', '464', 'Tepat Waktu'),
(64, 'Ratih Mahardhika', '1700020103', 'Teknik Kimia', '1438 days', '3.57', '431', 'Tepat Waktu'),
(65, 'Anisah Nur Amalia', '1700020112', 'Teknik Kimia', '1438 days', '3.39', '437', 'Tepat Waktu'),
(66, 'Ayu Wulandari', '1700020020', 'Teknik Kimia', '1454 days', '3.43', '478', 'Tepat Waktu'),
(67, 'Mita Gustia', '1700020037', 'Teknik Kimia', '1454 days', '3.58', '456', 'Tepat Waktu'),
(68, 'Aistia Maya Tira', '1700020057', 'Teknik Kimia', '1454 days', '3.54', '505', 'Tepat Waktu'),
(69, 'Den Sulthan Bagas Ardiansyah', '1700020129', 'Teknik Kimia', '1454 days', '3.71', '507', 'Tepat Waktu'),
(70, 'Muhammad Rizky Nendanov', '1700020132', 'Teknik Kimia', '1454 days', '3.55', '440', 'Tepat Waktu'),
(71, 'Agam Yogi Fahlevi', '1700020002', 'Teknik Kimia', '1460 days', '3.54', '502', 'Tepat Waktu'),
(72, 'Firanita Angraini Putri', '1700020024', 'Teknik Kimia', '1460 days', '3.75', '482', 'Tepat Waktu'),
(73, 'Siti Mutmaina', '1700020026', 'Teknik Kimia', '1460 days', '3.64', '436', 'Tepat Waktu'),
(74, 'Dimas Amani Praviant Zuhair', '1700020043', 'Teknik Kimia', '1460 days', '3.62', '522', 'Tepat Waktu'),
(75, 'Endah Dwi Saputri', '1700020062', 'Teknik Kimia', '1460 days', '3.73', '404', 'Tepat Waktu'),
(76, 'Muhammad Setiyawan Ashari', '1700020073', 'Teknik Kimia', '1460 days', '3.56', '412', 'Tepat Waktu'),
(77, 'Sherena Dwi Lathiefa', '1700020081', 'Teknik Kimia', '1460 days', '3.28', '406', 'Tepat Waktu'),
(78, 'Ika Devi Pangesti', '1700020115', 'Teknik Kimia', '1460 days', '3.55', '415', 'Tepat Waktu'),
(79, 'Zusuf Tri Purnomo', '1700020021', 'Teknik kimia', '1475 days', '3.74', '490', 'Tidak Tepat Waktu'),
(80, 'Regina Pebriani Nugraha', '1715020141', 'Teknik kimia', '1475 days', '3.8', '424', 'Tidak Tepat Waktu'),
(81, 'Fahri Putra Ardianto', '1500020164', 'Teknik Kimia', '2215 days', '3.59', '433', 'Tidak Tepat Waktu'),
(82, 'Nurul Hidayati Nur Sayyid', '1600020030', 'Teknik Kimia', '1851 days', '3.05', '426', 'Tidak Tepat Waktu'),
(83, 'Syafruddin', '1600020056', 'Teknik Kimia', '1851 days', '3.4', '450', 'Tidak Tepat Waktu'),
(84, 'Muhammad Ramma Mesandhy', '1600020065', 'Teknik Kimia', '1851 days', '3.21', '415', 'Tidak Tepat Waktu'),
(85, 'Muhammad Hakiim Marzun', '1600020075', 'Teknik Kimia', '1851 days', '3.13', '400', 'Tidak Tepat Waktu'),
(86, 'Anggun Ansafa Wati', '1700020027', 'Teknik Kimia', '1490 days', '3.92', '448', 'Tidak Tepat Waktu'),
(87, 'Ridho Mahendra', '1700020029', 'Teknik Kimia', '1490 days', '3.57', '498', 'Tidak Tepat Waktu'),
(88, 'Astri Nur Wahyuni', '1700020033', 'Teknik Kimia', '1490 days', '3.66', '494', 'Tidak Tepat Waktu'),
(89, 'Findhita Kusuma Putri', '1700020035', 'Teknik Kimia', '1490 days', '3.79', '462', 'Tidak Tepat Waktu'),
(90, 'Winda Maizani', '1700020047', 'Teknik Kimia', '1490 days', '3.71', '540', 'Tidak Tepat Waktu'),
(91, 'Gea Sheila Saskia Shafira', '1700020048', 'Teknik Kimia', '1490 days', '3.7', '555', 'Tidak Tepat Waktu'),
(92, 'Heidy Oktavia Nisa', '1700020050', 'Teknik Kimia', '1490 days', '3.78', '466', 'Tidak Tepat Waktu'),
(93, 'Fitri Solecha Kusumadewi', '1700020052', 'Teknik Kimia', '1490 days', '3.68', '468', 'Tidak Tepat Waktu'),
(94, 'Alida Niza Chamelia', '1700020056', 'Teknik Kimia', '1490 days', '3.82', '453', 'Tidak Tepat Waktu'),
(95, 'Yogi Try Pratama Putra Nasution', '1700020085', 'Teknik Kimia', '1490 days', '3.62', '432', 'Tidak Tepat Waktu'),
(96, 'Ririn Amelia', '1700020106', 'Teknik Kimia', '1490 days', '3.4', '401', 'Tidak Tepat Waktu'),
(97, 'Nurul Khoiriah Felba Utami', '1700020111', 'Teknik Kimia', '1490 days', '3.22', '540', 'Tidak Tepat Waktu'),
(98, 'Meinanda Nabila Kitania', '1700020114', 'Teknik Kimia', '1490 days', '3.52', '439', 'Tidak Tepat Waktu'),
(99, 'Woro Astrid Kharismatika', '1700020119', 'Teknik Kimia', '1490 days', '3.6', '434', 'Tidak Tepat Waktu'),
(100, 'Sella Nurul Aulia ', '1700020120', 'Teknik Kimia', '1490 days', '3.69', '455', 'Tidak Tepat Waktu'),
(101, 'Ratna Inayah', '1700020152', 'Teknik Kimia', '1490 days', '3.62', '511', 'Tidak Tepat Waktu'),
(102, 'Tri Bahari', '1700020156', 'Teknik Kimia', '1490 days', '3.44', '491', 'Tidak Tepat Waktu'),
(103, 'Wahyu Elka Wakzuh', '1600020043', 'Teknik Kimia', '1864 days', '2.97', '474', 'Tidak Tepat Waktu'),
(104, 'Alifia Fadhilah Zuhri', '1700020003', 'Teknik Kimia', '1503 days', '3.26', '493', 'Tidak Tepat Waktu'),
(105, 'Nauval Shoffa Muzakky', '1700020013', 'Teknik Kimia', '1503 days', '3.39', '482', 'Tidak Tepat Waktu'),
(106, 'Ilham Bintang Persada', '1700020030', 'Teknik Kimia', '1503 days', '3.32', '493', 'Tidak Tepat Waktu'),
(107, 'Ina Mandalika', '1700020031', 'Teknik Kimia', '1503 days', '3.37', '432', 'Tidak Tepat Waktu'),
(108, 'Resnia Nurahmawati', '1700020040', 'Teknik Kimia', '1503 days', '3.3', '488', 'Tidak Tepat Waktu'),
(109, 'Arief Marcellino Ferdiansyah', '1700020088', 'Teknik Kimia', '1503 days', '3.47', '498', 'Tidak Tepat Waktu'),
(110, 'Chandra Akbar', '1700020113', 'Teknik Kimia', '1503 days', '3.48', '506', 'Tidak Tepat Waktu'),
(111, 'Elfira Sulistiana', '1700020161', 'Teknik Kimia', '1503 days', '3.68', '425', 'Tidak Tepat Waktu'),
(112, 'Firda Magfiratul Husna', '1600020047', 'Teknik Kimia', '1517 days', '2.73', '352', 'Tidak Tepat Waktu'),
(113, 'Syahrul Ramadhan', '1700020049', 'Teknik Kimia', '1517 days', '3.37', '490', 'Tidak Tepat Waktu'),
(114, 'Muhammad Nur Adi Nugroho', '1700020060', 'Teknik Kimia', '1517 days', '3.42', '447', 'Tidak Tepat Waktu'),
(115, 'Thania Aura Jovariera', '1700020125', 'Teknik Kimia', '1517 days', '3.41', '494', 'Tidak Tepat Waktu'),
(116, 'Nur Aisyah Novitasari', '1700020159', 'Teknik Kimia', '1517 days', '3.73', '439', 'Tidak Tepat Waktu'),
(117, 'Rifka Alfiyani', '1711020140', 'Teknik Kimia', '1517 days', '3.95', '450', 'Tidak Tepat Waktu');

-- --------------------------------------------------------

--
-- Table structure for table `pred_elektro`
--

CREATE TABLE `pred_elektro` (
  `id_predelektro` int(11) NOT NULL,
  `ms` varchar(128) NOT NULL,
  `thn` varchar(128) NOT NULL,
  `freq` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pred_elektro`
--

INSERT INTO `pred_elektro` (`id_predelektro`, `ms`, `thn`, `freq`) VALUES
(1, '1460', '2019', '7'),
(2, '1444', '2019', '6'),
(3, '1408', '2019', '4'),
(4, '1382', '2019', '2'),
(5, '1398', '2021', '2'),
(6, '1402', '2019', '2'),
(7, '1437', '2019', '2'),
(8, '1115', '2019', '1'),
(9, '1143', '2018', '1'),
(10, '1178', '2018', '1'),
(11, '1244', '2021', '1'),
(12, '1265', '2019', '1'),
(13, '1377', '2021', '1'),
(14, '1424', '2019', '1'),
(15, '1438', '2021', '1'),
(16, '1460', '2021', '1');

-- --------------------------------------------------------

--
-- Table structure for table `pred_industri`
--

CREATE TABLE `pred_industri` (
  `id_predindus` int(11) NOT NULL,
  `ms` varchar(128) NOT NULL,
  `thn` varchar(128) NOT NULL,
  `freq` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pred_industri`
--

INSERT INTO `pred_industri` (`id_predindus`, `ms`, `thn`, `freq`) VALUES
(1, '1460', '2019', '21'),
(2, '1382', '2019', '6'),
(3, '1451', '2019', '5'),
(4, '1424', '2019', '3'),
(5, '1412', '2021', '2'),
(6, '900', '2020', '1'),
(7, '1264', '2020', '1'),
(8, '1384', '2021', '1'),
(9, '1402', '2020', '1'),
(10, '1444', '2019', '1');

-- --------------------------------------------------------

--
-- Table structure for table `pred_infor`
--

CREATE TABLE `pred_infor` (
  `id_predinfor` int(11) NOT NULL,
  `ms` varchar(128) NOT NULL,
  `thn` varchar(128) NOT NULL,
  `freq` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pred_infor`
--

INSERT INTO `pred_infor` (`id_predinfor`, `ms`, `thn`, `freq`) VALUES
(1, '1460', '2019', '17'),
(2, '1437', '2019', '9'),
(3, '1444', '2019', '8'),
(4, '1460', '2021', '5'),
(5, '1424', '2019', '5'),
(6, '1402', '2019', '4'),
(7, '1458', '2020', '2'),
(8, '1438', '2021', '2'),
(9, '1265', '2019', '2'),
(10, '1382', '2019', '2'),
(11, '1346', '2019', '2'),
(12, '1311', '2019', '1'),
(13, '1388', '2020', '1'),
(14, '1430', '2020', '1'),
(15, '1381', '2019', '1'),
(16, '1358', '2019', '1'),
(17, '1325', '2019', '1'),
(18, '1402', '2020', '1');

-- --------------------------------------------------------

--
-- Table structure for table `pred_kimia`
--

CREATE TABLE `pred_kimia` (
  `id_predkimia` int(11) NOT NULL,
  `ms` varchar(128) NOT NULL,
  `thn` varchar(128) NOT NULL,
  `freq` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pred_kimia`
--

INSERT INTO `pred_kimia` (`id_predkimia`, `ms`, `thn`, `freq`) VALUES
(1, '1382', '2019', '17'),
(2, '1460', '2019', '13'),
(3, '1358', '2019', '10'),
(4, '1444', '2019', '9'),
(5, '1264', '2020', '8'),
(6, '1438', '2021', '8'),
(7, '1398', '2021', '8'),
(8, '1460', '2021', '8'),
(9, '1381', '2019', '8'),
(10, '1353', '2020', '8'),
(11, '1384', '2021', '6'),
(12, '1388', '2020', '5'),
(13, '1426', '2021', '5'),
(14, '1454', '2021', '5'),
(15, '1458', '2020', '5'),
(16, '1391', '2021', '5'),
(17, '1265', '2019', '4'),
(18, '1402', '2020', '4'),
(19, '1430', '2020', '4'),
(20, '1307', '2021', '2'),
(21, '1364', '2021', '1'),
(22, '1424', '2019', '1'),
(23, '1321', '2021', '1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(255) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `posisi` enum('Tata Usaha','Prodi') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `posisi`) VALUES
(5, 'adminTU', 'admintu@gmail.com', '$2b$12$jSHdM5We5hZWVgxmGxHrp.luDGx165JhhHBeOj24OQDaKHaktUReK', 'Tata Usaha'),
(6, 'admin prodi', 'adminprodi@gmail.com', '$2b$12$BnUGrB/FXMTKBf0ir8MAAejRPYi7.//n4pXqUdlozxjlEsvVdolrG', 'Prodi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `elektro`
--
ALTER TABLE `elektro`
  ADD PRIMARY KEY (`id_elektro`);

--
-- Indexes for table `industri`
--
ALTER TABLE `industri`
  ADD PRIMARY KEY (`id_indus`);

--
-- Indexes for table `informatika`
--
ALTER TABLE `informatika`
  ADD PRIMARY KEY (`id_infor`);

--
-- Indexes for table `kimia`
--
ALTER TABLE `kimia`
  ADD PRIMARY KEY (`id_kimia`);

--
-- Indexes for table `pred_elektro`
--
ALTER TABLE `pred_elektro`
  ADD PRIMARY KEY (`id_predelektro`);

--
-- Indexes for table `pred_industri`
--
ALTER TABLE `pred_industri`
  ADD PRIMARY KEY (`id_predindus`);

--
-- Indexes for table `pred_infor`
--
ALTER TABLE `pred_infor`
  ADD PRIMARY KEY (`id_predinfor`);

--
-- Indexes for table `pred_kimia`
--
ALTER TABLE `pred_kimia`
  ADD PRIMARY KEY (`id_predkimia`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `elektro`
--
ALTER TABLE `elektro`
  MODIFY `id_elektro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `industri`
--
ALTER TABLE `industri`
  MODIFY `id_indus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `informatika`
--
ALTER TABLE `informatika`
  MODIFY `id_infor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `kimia`
--
ALTER TABLE `kimia`
  MODIFY `id_kimia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `pred_elektro`
--
ALTER TABLE `pred_elektro`
  MODIFY `id_predelektro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pred_industri`
--
ALTER TABLE `pred_industri`
  MODIFY `id_predindus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pred_infor`
--
ALTER TABLE `pred_infor`
  MODIFY `id_predinfor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pred_kimia`
--
ALTER TABLE `pred_kimia`
  MODIFY `id_predkimia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
