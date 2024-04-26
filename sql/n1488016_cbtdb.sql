-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 27, 2024 at 09:14 PM
-- Server version: 10.6.16-MariaDB-cll-lve
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `n1488016_cbtdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id_dosen` int(11) NOT NULL,
  `nip` char(12) NOT NULL,
  `nama_dosen` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `matkul_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id_dosen`, `nip`, `nama_dosen`, `email`, `matkul_id`) VALUES
(25, '196512311999', 'I Ketut Sadia', 'sadia_bonet@yahoo.com', 1),
(26, '197407112008', 'I Ketut Sulendra', 'suelendra@yahoo.co.id', 1),
(27, '196112311987', 'I Komang Putu', 'abidarma40@yahoo.co.id', 1),
(28, '1001', 'I Komang Surya Astika', 'bowyeajus@gmail.com', 1),
(29, '1002', 'I Made Adiarsa', 'madeadiarsa66@gmail.com', 1),
(30, '196708081990', 'I Nyoman Teresna', 'nyomateresna99@gmail.com', 1),
(31, '1003', 'I Putu Ade Cardina', 'putuadecardina@gmail.com', 1),
(32, '1004', 'I Wayan Adi Susanta', 'adisusanta12345@gmail.com', 1),
(33, '197001101997', 'I Wayan Merta', 'wayanmerta10@yahoo.com', 1),
(34, '1005', 'I Wayan Suteja', 'suteja_wayan@yahoo.com', 1),
(35, '1006', 'I Wayan Suwendra Adi Putra', 'Wynsuwendra30@gmail.com', 1),
(36, '1007', 'Ni Kadek Sri Wulandari', 'shintadex@yahoo.com', 1),
(37, '199205072022', 'Ni Kadek Sujiantari', 'sujiantari4@gmail.com', 1),
(38, '1008', 'Ni Ketut Sri Rahaningsih', 'popogoli12@gmail.com', 1),
(39, '1009', 'Ni Luh Putu Sariasih', 'luhputusariasih20@gmail.com', 1),
(40, '196512102005', 'Ni Nengah Mastini', 'nengah_mastini@yahoo.co.id', 1),
(41, '1010', 'Ni Nengah Sugiartami', 'sugiartaminengah@gmail.com', 1),
(42, '196802072007', 'Ni Nyoman Sukarmini', 'nyoman.sukarmini@yahoo.com', 1),
(43, '1011', 'Ni Putu Astiti', 'niputuastiti66@gmail.com', 1),
(44, '1012', 'Ni Wayan Widiasih', 'yan_wid2000@yahoo.com', 1),
(45, '1013', 'Nyoman Tri Purnami Jayanthi', 'ktri9406@gmail.com', 1),
(46, '1014', 'Putu Ayu Santi Suwandiari', 'ayu.canty@gmail.com', 1),
(47, '196910012008', 'I Gede Suardana', 'gedesuardana69@yahoo.com', 1),
(48, '1015', 'I Kadek Arya Semara Dwipa', 'aryasemara0@gmail.com', 1);

--
-- Triggers `dosen`
--
DELIMITER $$
CREATE TRIGGER `edit_user_dosen` BEFORE UPDATE ON `dosen` FOR EACH ROW UPDATE `users` SET `email` = NEW.email, `username` = NEW.nip WHERE `users`.`username` = OLD.nip
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hapus_user_dosen` BEFORE DELETE ON `dosen` FOR EACH ROW DELETE FROM `users` WHERE `users`.`username` = OLD.nip
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'dosen', 'Pembuat Soal dan ujian'),
(3, 'mahasiswa', 'Peserta Ujian');

-- --------------------------------------------------------

--
-- Table structure for table `h_ujian`
--

CREATE TABLE `h_ujian` (
  `id` int(11) NOT NULL,
  `ujian_id` int(11) NOT NULL,
  `mahasiswa_id` int(11) NOT NULL,
  `list_soal` longtext NOT NULL,
  `list_jawaban` longtext NOT NULL,
  `jml_benar` int(11) NOT NULL,
  `nilai` decimal(10,2) NOT NULL,
  `nilai_bobot` decimal(10,2) NOT NULL,
  `tgl_mulai` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `status` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `nama_jurusan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`) VALUES
(1, 'X EA'),
(2, 'X EB'),
(3, 'XI MIPA'),
(4, 'XI IIS'),
(5, 'XII MIPA'),
(6, 'XII IIS');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan_matkul`
--

CREATE TABLE `jurusan_matkul` (
  `id` int(11) NOT NULL,
  `matkul_id` int(11) NOT NULL,
  `jurusan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(30) NOT NULL,
  `jurusan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `jurusan_id`) VALUES
(2, 'Kelas X EA', 1),
(3, 'KELAS X EB', 2),
(5, 'KELAS XI MIPA', 3),
(6, 'KELAS XI IIS', 4),
(8, 'KELAS XII MIPA', 5),
(9, 'KELAS XII IIS', 6);

-- --------------------------------------------------------

--
-- Table structure for table `kelas_dosen`
--

CREATE TABLE `kelas_dosen` (
  `id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `dosen_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(5, '140.213.126.129', 'Dharmakirtisengkidu', 1685081494),
(6, '140.213.126.129', 'Sma@dharmakirtisengkidu', 1685081528);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nim` char(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `kelas_id` int(11) NOT NULL COMMENT 'kelas&jurusan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mahasiswa`, `nama`, `nim`, `email`, `jenis_kelamin`, `kelas_id`) VALUES
(1, 'I Gede Pebri Suartawan', '75825630', 'gedepebri@gmail.com', 'L', 2),
(2, 'I GUSTI LANANG WIGUNA JELANTIK PUTRA WIJAYA', '61789054', 'lanangwiguna@gmail.com', 'L', 2),
(3, 'I KADEK ANGGA JULI MERTA YASA', '76631293', 'anggajuli@gmail.com', 'L', 2),
(4, 'I Kadek Aryana', '76554996', 'kadekaryana@gmail.com', 'L', 2),
(5, 'I Kadek Krisna', '65044554', 'kadekkrisna@gmail.com', 'L', 2),
(6, 'I Kadek Raditya', '65149221', 'kadekraditya@gmail.com', 'L', 2),
(7, 'I Komang Adnyana Putra', '74304167', 'komangadnyana@gmail.com', 'L', 2),
(8, 'I Komang Agus Adi Putra', '46251809', 'agusadi1@gmail.com', 'L', 2),
(9, 'I KOMANG DANU WARDANA', '78856490', 'komangdanu@gmail.com', 'L', 2),
(10, 'I MADE YOGIK SAPUTRA', '78861833', 'madeyogik@gmail.com', 'L', 2),
(11, 'I Nengah Wirawan', '74596895', 'nengahwirawan@gmail.com', 'L', 2),
(12, 'I PUTU DEDI WIRASMANA', '67309704', 'putudedi@gmail.com', 'L', 2),
(13, 'I Wayan Agus Febriantara', '71828945', 'wayanagus@gmail.com', 'L', 2),
(14, 'I Wayan Eka Widiarta', '75592500', 'wayaneka@gmail.com', 'L', 2),
(15, 'I Wayan Kariasa', '63372325', 'wayankariasa@gmail.com', 'L', 2),
(16, 'Luh Endra Maharani', '46251805', 'endramaharani@gmail.com', 'P', 2),
(17, 'Ni Kade Desi Amelia', '74416957', 'kadedesi@gmail.com', 'P', 2),
(18, 'Ni kadek Sudiantari', '78584729', 'kadeksudiantari@gmail.com', 'P', 2),
(19, 'Ni Kadek Yuliantari', '76725800', 'kadekyuliantari@gmail.com', 'P', 2),
(20, 'Ni Ketut Ayu Setiari', '53380615', 'ketutayu@gmail.com', 'P', 2),
(21, 'Ni Ketut Muliyani', '66520346', 'ketutmuliyani@gmail.com', 'P', 2),
(22, 'Ni Komang Ayu Septiani', '67838344', 'komangayu@gmail.com', 'P', 2),
(23, 'NI KOMANG DEWI DIANAWATI', '61218221', 'komangdewi@gmail.com', 'P', 2),
(24, 'Ni Putu Lia Suryati', '72056029', 'putulia@gmail.com', 'P', 2),
(25, 'I Kadek Dwi Artawan', '54189350', 'kadekdwi@gmail.com', 'L', 3),
(26, 'I KADEK OKTA WIGUNA', '78844762', 'kadekokta@gmail.com', 'L', 3),
(27, 'I Ketut Adi Septiawan', '64261792', 'ketutadi@gmail.com', 'L', 3),
(28, 'I Ketut Merta Yasa', '72456349', 'ketutmerta1@gmail.com', 'L', 3),
(29, 'I KOMANG ARYA SUMERTA', '74901064', 'komangarya@gmail.com', 'L', 3),
(30, 'I KOMANG CANDRA DIPA', '66872269', 'komangcandra@gmail.com', 'L', 3),
(31, 'I Made Agus Juliawan', '74672651', 'madeagus1@gmail.com', 'L', 3),
(32, 'I Made Dwi Permana', '62533775', 'madedwi@gmail.com', 'L', 3),
(33, 'I Made Kartika', '78214732', 'madekartika@gmail.com', 'L', 3),
(34, 'I MADE SUARDIKA', '62057247', 'madesuardika@gmail.com', 'L', 3),
(35, 'I NYOMAN KRISNA EDI PUTRA', '68571374', 'krisnaedi@gmail.com', 'L', 3),
(36, 'I PUTU BOBBY SATRIA ARIMBAWA', '74656676', 'bobbysatria@gmail.com', 'L', 3),
(37, 'I Putu Euro Wahenantara', '75849347', 'putueuro@gmail.com', 'L', 3),
(38, 'I WAYAN AGUS JUNIARTA', '76000305', 'wayanagus1@gmail.com', 'L', 3),
(39, 'I Wayan Widiantara', '71344994', 'wayanwidiantara@gmail.com', 'L', 3),
(40, 'Kade Suantari', '76640603', 'kadesuantari@gmail.com', 'P', 3),
(41, 'Ni Kade Aprilia Rustini', '76231390', 'kadeaprilia@gmail.com', 'P', 3),
(42, 'Ni Kadek Melinda Mahendrayani', '68166927', 'kadekmelinda@gmail.com', 'P', 3),
(43, 'Ni Kadek Wini Chaori Putri', '69281622', 'winichaori@gmail.com', 'P', 3),
(44, 'Ni Made Apriliani Suarningsih', '75400257', 'madeapriliani@gmail.com', 'P', 3),
(45, 'NI MADE AYU ASTITI', '78072257', 'madeayu@gmail.com', 'P', 3),
(46, 'Ni Made Nonik Yanti', '63931289', 'madenonik@gmail.com', 'P', 3),
(47, 'NI NENGAH MITA PURNAMI', '75632662', 'nengahmita@gmail.com', 'P', 3),
(48, 'NI NENGAH SRI MELANI', '69497086', 'nengahsri@gmail.com', 'P', 3),
(49, 'Ni Putu Vira Windari Putri', '56103864', 'virawindari@gmail.com', 'P', 3),
(50, 'I GEDE AGUS CAHYA SETIAWAN', '67371914', 'aguscahya@gmail.com', 'L', 6),
(51, 'I Gede Valentino Pratama', '67260846', 'gedevalentino@gmail.com', 'L', 6),
(52, 'I Gede Yudi Suryawan', '66762513', 'gedeyudi@gmail.com', 'L', 6),
(53, 'I Gusti Ayu Kadek Sintya Dewi', '69066857', 'ayukadek@gmail.com', 'P', 6),
(54, 'I Kade Januarta', '63197483', 'kadejanuarta@gmail.com', 'L', 6),
(55, 'I Kade Suardana', '68030201', 'kadesuardana@gmail.com', 'L', 6),
(56, 'I Kadek Ari Subawa', '52849071', 'kadekari1@gmail.com', 'L', 6),
(57, 'I Ketut Angga Kusuma Jaya', '58459619', 'anggakusuma@gmail.com', 'L', 6),
(58, 'I Komang Budiartana', '62652006', 'komangbudiartana@gmail.com', 'L', 6),
(59, 'I Komang Suparta', '61259400', 'komangsuparta@gmail.com', 'L', 6),
(60, 'I Komang Tri Darma Permana', '60058258', 'tridarma@gmail.com', 'L', 6),
(61, 'I MADE HENDRAYASA', '51436177', 'madehendrayasa@gmail.com', 'L', 6),
(62, 'I Nengah Budi Adnyana', '60058257', 'nengahbudi@gmail.com', 'L', 6),
(63, 'I Nyoman Aditya Palguna', '54058825', 'nyomanaditya@gmail.com', 'L', 6),
(64, 'I Nyoman Agus Priyatna', '68049765', 'nyomanagus@gmail.com', 'L', 6),
(65, 'I Putu Juni Wirawan', '63007573', 'putujuni@gmail.com', 'L', 6),
(66, 'I Putu Merta', '44835950', 'putumerta@gmail.com', 'L', 6),
(67, 'I Putu Tegar Putra Mahardika', '68230334', 'tegarputra@gmail.com', 'L', 6),
(68, 'I Wayan Dangin Adnyana', '56827998', 'wayandangin@gmail.com', 'L', 6),
(69, 'I Wayan Yasa Kumara', '61502101', 'wayanyasa@gmail.com', 'L', 6),
(70, 'Ni Kade Sumiati', '68556184', 'kadesumiati@gmail.com', 'P', 6),
(71, 'Ni Komang Lia Sukarini', '61196740', 'komanglia@gmail.com', 'P', 6),
(72, 'Ni Komang Sri Wahyuni', '52354599', 'komangsri@gmail.com', 'P', 6),
(73, 'NI MADE EGA MEYSTA NINGSIH', '56226550', 'egameysta@gmail.com', 'P', 6),
(74, 'Ni Made Yuliantari', '55305898', 'madeyuliantari@gmail.com', 'P', 6),
(75, 'I GUSTI LANANG ALIT GARGA WIJAYA', '69828392', 'lanangalit@gmail.com', 'L', 5),
(76, 'I Kade Ari Indrayana', '69068167', 'kadeari@gmail.com', 'L', 5),
(77, 'I KADEK RAI ARTAWAN', '67442625', 'kadekrai@gmail.com', 'L', 5),
(78, 'I Kadek Sumantara', '69735083', 'kadeksumantara@gmail.com', 'L', 5),
(79, 'I Kadek Yuda Adi Pranata', '51213440', 'yudaadi@gmail.com', 'L', 5),
(80, 'I Komang Agus Sumartawan', '38497122', 'komangagus@gmail.com', 'L', 5),
(81, 'I Komang Darmayasa', '33320074', 'komangdarmayasa@gmail.com', 'L', 5),
(82, 'I KOMANG RUDI ANTARA', '59865538', 'komangrudi@gmail.com', 'L', 5),
(83, 'I Putu Manik Suanjaya Putra', '64796499', 'maniksuanjaya@gmail.com', 'L', 5),
(84, 'Ni Kadek Diantari', '52720618', 'kadekdiantari@gmail.com', 'P', 5),
(85, 'Ni Kadek Rediasih', '63657628', 'kadekrediasih@gmail.com', 'P', 5),
(86, 'Ni Kadek Tari', '61437108', 'kadektari@gmail.com', 'P', 5),
(87, 'NI KOMANG NISA PRABAWATI UTAMI', '52115716', 'nisaprabawati@gmail.com', 'P', 5),
(88, 'NI KOMANG PURWANINGSIH', '69630825', 'komangpurwaningsih@gmail.com', 'P', 5),
(89, 'Ni Komang Suartini', '66794078', 'komangsuartini@gmail.com', 'P', 5),
(90, 'Ni Luh Nik Sumahyuni', '54844092', 'luhnik@gmail.com', 'P', 5),
(91, 'Ni Putu Sri Udayani', '59294922', 'putusri@gmail.com', 'P', 5),
(92, 'Ni Putu Widhi Asih Yuliawati', '68982689', 'widhiasih@gmail.com', 'P', 5),
(93, 'Ni Wayan Sherlyani', '58852458', 'wayansherlyani@gmail.com', 'P', 5),
(94, 'Ni Wayan Sugiantari', '62657070', 'wayansugiantari@gmail.com', 'P', 5),
(95, 'I GEDE AGUS PUTRA ADNYANA', '40576435', 'agusputra@gmail.com', 'L', 9),
(96, 'I GEDE EDI YUDIARTAWAN', '45235255', 'gedeedi@gmail.com', 'L', 9),
(97, 'I GEDE WAHYU WIDYAMERTA', '58841281', 'gedewahyu@gmail.com', 'L', 9),
(98, 'I Kade Miarsana', '52793993', 'kademiarsana@gmail.com', 'L', 9),
(99, 'I KADEK MERTA ADI', '40703230', 'kadekmerta@gmail.com', 'L', 9),
(100, 'I Kadek Wahyu Wira Adiguna', '45138619', 'wahyuwira@gmail.com', 'L', 9),
(101, 'I Ketut Budisastra Wijaya', '48518590', 'ketutbudisastra@gmail.com', 'L', 9),
(102, 'I Ketut Wahyu Wiarta ', '44835957', 'ketutwahyu@gmail.com', 'L', 9),
(103, 'I Ketut Widiantara', '50878084', 'ketutwidiantara@gmail.com', 'L', 9),
(104, 'I Komang Agus Juniarta', '41216785', 'komangagusjuniarta@gmail.com', 'L', 9),
(105, 'I Putu Adi Wiguna', '39705111', 'putuadi@gmail.com', 'L', 9),
(106, 'I Putu Aditya Pratama', '50837639', 'putuaditya@gmail.com', 'L', 9),
(107, 'I Putu Ari Pranata', '60058256', 'putuari@gmail.com', 'L', 9),
(108, 'I PUTU ARYA ANOM WARDHANA', '51436180', 'aryaanom@gmail.com', 'L', 9),
(109, 'I Putu Darma Putra', '25092017', 'putudarma@gmail.com', 'L', 9),
(110, 'I PUTU EDI MULIARTA', '51293077', 'putuedi@gmail.com', 'L', 9),
(111, 'I Putu Egantara', '35194419', 'putuegantara@gmail.com', 'L', 9),
(112, 'I Putu Sudiantara', '20822338', 'putusudiantara@gmail.com', 'L', 9),
(113, 'I Putu Sudirka', '27892919', 'putusudirka@gmail.com', 'L', 9),
(114, 'I Putu Yogi Swara', '46251803', 'putuyogi@gmail.com', 'L', 9),
(115, 'I Putu Yudi Setiawan', '51054466', 'putuyudi@gmail.com', 'L', 9),
(116, 'I WAYAN ESA DITYA KUNDALA', '45235261', 'esaditya@gmail.com', 'L', 9),
(117, 'I Wayan Okta Murdayawan', '44810742', 'wayanokta@gmail.com', 'L', 9),
(118, 'I Wayan Roberta', '51213444', 'wayanroberta@gmail.com', 'L', 9),
(119, 'I Wayan Sumerta', '50837638', 'wayansumerta@gmail.com', 'L', 9),
(120, 'I Wayan Widiartana', '35194420', 'wayanwidiartana@gmail.com', 'L', 9),
(121, 'Ni Kadek Katya Amanda', '46251806', 'kadekatya@gmail.com', 'P', 9),
(122, 'Ni Kade Sumartini', '52793995', 'kadesumartini@gmail.com', 'P', 9),
(123, 'NI KOMANG AYU PARTINA', '45135110', 'komangayupartina@gmail.com', 'P', 9),
(124, 'Ni Komang Putri Juliantini', '35696350', 'komangputri@gmail.com', 'P', 9),
(125, 'Ni Komang Widiani', '51058966', 'komangwidiani@gmail.com', 'P', 9),
(126, 'Ni Luh Padmi Wulandari', '34972632', 'luhpadmi@gmail.com', 'P', 9),
(127, 'NI LUH PUTU NOVI WIDIYANTINI', '45135120', 'putunovi@gmail.com', 'P', 9),
(128, 'Ni Luh Widi Setyaningsih', '50936083', 'luhwidi@gmail.com', 'P', 9),
(129, 'Ni Wayan Desiani', '35395877', 'wayandesiani@gmail.com', 'P', 9),
(130, 'I GEDE ARI YOGA', '51436183', 'gedeari@gmail.com', 'L', 8),
(131, 'I Gede Wisnu Putra Ariwinaya', '52793984', 'wisnuputra@gmail.com', 'L', 8),
(132, 'I KADEK ERIK SUDIANTIKA', '51436174', 'kadekerik@gmail.com', 'L', 8),
(133, 'I Kadek Suda Budi Pawerti', '3046091161', 'sudabudi@gmail.com', 'L', 8),
(134, 'I Ketut Agus Ardita', '47283392', 'ketutagus@gmail.com', 'L', 8),
(135, 'I Ketut Agus Arya Winata', '51296612', 'agusarya@gmail.com', 'L', 8),
(136, 'I Ketut Merta Yasa', '55721042', 'ketutmerta@gmail.com', 'L', 8),
(137, 'I Komang Agus Sudiarsana', '35237311', 'komangagus1@gmail.com', 'L', 8),
(138, 'I Komang Merta', '65075946', 'komangmerta@gmail.com', 'L', 8),
(139, 'I Made Agus Wiraguna', '45097181', 'madeagus@gmail.com', 'L', 8),
(140, 'I Nengah Dediana', '46251812', 'nengahdediana@gmail.com', 'L', 8),
(141, 'I NENGAH WAHYU AGUS NUGRAHA', '55470890', 'wahyuagus@gmail.com', 'L', 8),
(142, 'I Nyoman Pasek Sastrawan', '44595223', 'nyomanpasek@gmail.com', 'L', 8),
(143, 'I Putu Agus Adi Saputra', '50837646', 'agusadi@gmail.com', 'L', 8),
(144, 'I PUTU AGUS DARMA YOGA', '51436187', 'agusdarma@gmail.com', 'L', 8),
(145, 'I Wayan Wahyudi Gunantara', '35237314', 'wayanwahyudi@gmail.com', 'L', 8),
(146, 'Ni Kadek Apriani', '44892792', 'kadekapriani@gmail.com', 'P', 8),
(147, 'Ni Kadek Ari Oktaviani', '44168248', 'kadekari@gmail.com', 'P', 8),
(148, 'NI KADEK OMING ANDANI PRADNYAWATI', '45235258', 'omingandani@gmail.com', 'P', 8),
(149, 'Ni Kadek Padmayanti', '40995800', 'kadekpadmayanti@gmail.com', 'P', 8),
(150, 'NI KADEK RATIH SUGIANTARI', '51436190', 'kadekratih@gmail.com', 'P', 8),
(151, 'Ni Ketut Parwati', '52793992', 'ketutparwati@gmail.com', 'P', 8),
(152, 'NI KETUT RADA LELYA PUTRI', '51436192', 'radalelya@gmail.com', 'P', 8),
(153, 'Ni Komang Marta Amelia Putri', '51217536', 'martaamelia@gmail.com', 'P', 8),
(154, 'Ni Komang Sudiani', '45135038', 'komangsudiani@gmail.com', 'P', 8),
(155, 'NI LUH AYU MAHIMA CANIS', '51436172', 'ayumahima@gmail.com', 'P', 8),
(156, 'Ni Luh Putu Ayu Carry Fitriyani', '45691227', 'putuayu@gmail.com', 'P', 8),
(157, 'NI MADE WIWIN WINDAYANTI', '45235262', 'madewiwin@gmail.com', 'P', 8),
(158, 'NI PUTU DESI ARI UTAMI', '45135124', 'desiari@gmail.com', 'P', 8),
(159, 'NI PUTU MELLY KURNIAWATI', '56582428', 'putumelly@gmail.com', 'P', 8),
(160, 'Ni Putu Sriasih', '45138606', 'putusriasih@gmail.com', 'P', 8);

-- --------------------------------------------------------

--
-- Table structure for table `matkul`
--

CREATE TABLE `matkul` (
  `id_matkul` int(11) NOT NULL,
  `nama_matkul` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `matkul`
--

INSERT INTO `matkul` (`id_matkul`, `nama_matkul`) VALUES
(1, 'Bahasa Indonesia'),
(2, 'Bahasa Inggris'),
(3, 'Matematika'),
(4, 'Ekonomi'),
(5, 'Geografi'),
(6, 'Biologi'),
(7, 'Penjas'),
(8, 'Agama'),
(9, 'Fisika'),
(10, 'Kimia'),
(11, 'BAHASA BALI'),
(12, 'PENDIDIKAN PANCASILA'),
(13, 'BAHASA INGGRIS PARIWISATA'),
(14, 'PRAKARYA'),
(15, 'PENJAS'),
(16, 'PROJEK'),
(17, 'SEJARAH INDONESIA'),
(18, 'BAHASA JEPANG'),
(19, 'SEJARAH PEMINATAN'),
(20, 'SENI BUDAYA'),
(21, 'FISIKA PEMINATAN'),
(22, 'SOSIOLOGI'),
(23, 'MATEMATIKA UMUM'),
(24, 'MATEMATIKA PEMINATAN'),
(25, 'GEOGRAFI'),
(26, 'INFORMATIKA'),
(27, 'AGAMA DAN BUDI PEKERTI');

-- --------------------------------------------------------

--
-- Table structure for table `m_ujian`
--

CREATE TABLE `m_ujian` (
  `id_ujian` int(11) NOT NULL,
  `dosen_id` int(11) NOT NULL,
  `matkul_id` int(11) NOT NULL,
  `nama_ujian` varchar(200) NOT NULL,
  `jumlah_soal` int(11) NOT NULL,
  `waktu` int(11) NOT NULL,
  `jenis` enum('acak','urut') NOT NULL,
  `tgl_mulai` datetime NOT NULL,
  `terlambat` datetime NOT NULL,
  `token` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_soal`
--

CREATE TABLE `tb_soal` (
  `id_soal` int(11) NOT NULL,
  `dosen_id` int(11) NOT NULL,
  `matkul_id` int(11) NOT NULL,
  `bobot` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `tipe_file` varchar(50) NOT NULL,
  `soal` longtext NOT NULL,
  `opsi_a` longtext NOT NULL,
  `opsi_b` longtext NOT NULL,
  `opsi_c` longtext NOT NULL,
  `opsi_d` longtext NOT NULL,
  `opsi_e` longtext NOT NULL,
  `file_a` varchar(255) NOT NULL,
  `file_b` varchar(255) NOT NULL,
  `file_c` varchar(255) NOT NULL,
  `file_d` varchar(255) NOT NULL,
  `file_e` varchar(255) NOT NULL,
  `jawaban` varchar(5) NOT NULL,
  `created_on` int(11) NOT NULL,
  `updated_on` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'Admin', '$2y$12$tGY.AtcyXrh7WmccdbT1rOuKEcTsKH6sIUmDr0ore1yN4LnKTTtuu', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1680098342, 1, 'Admin', 'SMAS Dharmakirti', 'ADMIN', '0'),
(11, '202.80.214.158', '20822338', '$2y$10$qkcNEl/fA7U4UJ2/XlcUve2ag95R2vu.6uGor0rOHxMjbMO7BOZkm', 'putusudiantara@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019060, NULL, 1, 'I', 'Sudiantara', NULL, NULL),
(12, '202.80.214.158', '25092017', '$2y$10$4BHdJOoY36SXS/4t1cE/C.CeSBdIbnlFfkmzPo0cUOcDo8DQY3WX.', 'putudarma@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019062, NULL, 1, 'I', 'Putra', NULL, NULL),
(13, '202.80.214.158', '27892919', '$2y$10$5l2iMLNR5Jiu/K10c2vtbOsrmKPWtL7xtq7DvC/w3MOgWmfCNbo5a', 'putusudirka@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019064, NULL, 1, 'I', 'Sudirka', NULL, NULL),
(14, '202.80.214.158', '3046091161', '$2y$10$mcHszkPGqpBhvttTDo1JguacK2lt8oiGnVsJB01fcb/loym3BWsHy', 'sudabudi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019066, NULL, 1, 'I', 'Pawerti', NULL, NULL),
(15, '202.80.214.158', '33320074', '$2y$10$K5FTM5pIKLA/sSRBGhmYrutjku7rb6JZl5vTy9M2lU8.BRGA7lnYG', 'komangdarmayasa@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019068, NULL, 1, 'I', 'Darmayasa', NULL, NULL),
(16, '202.80.214.158', '34972632', '$2y$10$ZRzdndYPHZWsMvq3qyi6C.oa6MVIYiQQcK2DuLJ7k0J1208zsr4Cm', 'luhpadmi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019069, NULL, 1, 'Ni', 'Wulandari', NULL, NULL),
(17, '202.80.214.158', '35194419', '$2y$10$gOkRUS5q22ibdaeZKHBEdOakGb7IBF28SmPwlcOZg7bKoJaURYwvu', 'putuegantara@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019071, NULL, 1, 'I', 'Egantara', NULL, NULL),
(18, '202.80.214.158', '35194420', '$2y$10$M22Z5gFPKdFR9Jx8lnFHbuoUqKVbaWtB.sdj4rab77UZpCjqGrK9q', 'wayanwidiartana@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019073, NULL, 1, 'I', 'Widiartana', NULL, NULL),
(19, '202.80.214.158', '35237311', '$2y$10$/5rr.47w5b/fgDWP.IyahOsh5/vP4KNWo7cGT66El5WnmOinMjdLC', 'komangagus1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019075, NULL, 1, 'I', 'Sudiarsana', NULL, NULL),
(20, '202.80.214.158', '35237314', '$2y$10$bDlYHETXwAwydIBw5ozXteGHMsNiZSpduLhd2YR.gByo7NBo28a.G', 'wayanwahyudi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019077, NULL, 1, 'I', 'Gunantara', NULL, NULL),
(21, '202.80.214.158', '35395877', '$2y$10$h/jUciH4b7C5nGB/FRD4c.G/.a4x00.8e4.qnhDRjz5nJYgYxYEwe', 'wayandesiani@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019081, NULL, 1, 'Ni', 'Desiani', NULL, NULL),
(22, '202.80.214.158', '35696350', '$2y$10$Zkxa9Yn2yhrk3PBhnIzxMOdhA9kZ9tG6jLrkGeQ0pKZq8GmybPeKG', 'komangputri@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019083, NULL, 1, 'Ni', 'Juliantini', NULL, NULL),
(23, '202.80.214.158', '38497122', '$2y$10$BoIaKxedrEUGz1qsLLdakO4yvJbtM2YXpf7gBTEcuywh1zk2COaoa', 'komangagus@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019085, NULL, 1, 'I', 'Sumartawan', NULL, NULL),
(24, '202.80.214.158', '39705111', '$2y$10$09m0sD64A2.UTeFNtt0np.e8SkwtPlyuu0UvU3C/LWfnP.BIpbm7G', 'putuadi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019087, NULL, 1, 'I', 'Wiguna', NULL, NULL),
(25, '202.80.214.158', '40576435', '$2y$10$So8w/LrZ0iPcAjnGeyH.9uEqrm8mjdWsxa08X8xLLph7flUNF.BuG', 'agusputra@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019089, NULL, 1, 'I', 'ADNYANA', NULL, NULL),
(26, '202.80.214.158', '40703230', '$2y$10$ASy6L6Pwy/pet356d5aFkOW82VFne5rEAGFJjVq31L/x52mxXa9ze', 'kadekmerta@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019091, NULL, 1, 'I', 'ADI', NULL, NULL),
(27, '202.80.214.158', '40995800', '$2y$10$9y5EZDkAbLUodXPB736uV.CbJzaaOAPT/6IQFUyBZ1ifl2HPA3xFS', 'kadekpadmayanti@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019093, NULL, 1, 'Ni', 'Padmayanti', NULL, NULL),
(28, '202.80.214.158', '41216785', '$2y$10$17MLyKKYkI1mYAENBoX5lOicY838pWbteQRb/PDm.NHHeYG0J81ZK', 'komangagusjuniarta@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019094, NULL, 1, 'I', 'Juniarta', NULL, NULL),
(29, '202.80.214.158', '44168248', '$2y$10$C9Jb7MgBmShMnoGioVuk5eUlfYP2iPpb3bbi7VR.2i6ER.GzAGAQC', 'kadekari@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019096, NULL, 1, 'Ni', 'Oktaviani', NULL, NULL),
(30, '202.80.214.158', '44595223', '$2y$10$GAFoslVk2CTrI2VbBqaP6.0e9MMAsoSUoZKHh6oIj22AFhaJtGV72', 'nyomanpasek@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019098, NULL, 1, 'I', 'Sastrawan', NULL, NULL),
(31, '202.80.214.158', '44810742', '$2y$10$.waprlA0AXAAWD/9LenD2.Pn5O.jgGfpwBZE2Qf7zWm9CGg5VepSW', 'wayanokta@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019101, NULL, 1, 'I', 'Murdayawan', NULL, NULL),
(32, '202.80.214.158', '44835950', '$2y$10$vsfJoOuUdWBddVf8G/M5l.WtKajl5.jQEPurHvivExp2s5.cGDD2a', 'putumerta@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019104, NULL, 1, 'I', 'Merta', NULL, NULL),
(33, '202.80.214.158', '44835957', '$2y$10$2m6BFsqPoVG8j6bWOC7lK.W/DNaeA7CEv458Oy4B/E4gaA7agk9.C', 'ketutwahyu@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019107, NULL, 1, 'I', '', NULL, NULL),
(34, '202.80.214.158', '44892792', '$2y$10$r0TlB1b2o.vchlyrnl4puOPS2EHxFHt6nIj/y47aLyXymcSq2imc6', 'kadekapriani@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019109, NULL, 1, 'Ni', 'Apriani', NULL, NULL),
(35, '202.80.214.158', '45097181', '$2y$10$LHyMN7MfvI02G0vHWHvZf.wMyJFL4DqiMZ8PTLV6YSZnoyu2HD6Gi', 'madeagus@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019111, NULL, 1, 'I', 'Wiraguna', NULL, NULL),
(36, '202.80.214.158', '45135038', '$2y$10$y.WdyAKnS.UaY3MUSzcDjOc1V5HMDJ4zeTJhoaTalWyImrEAFRDx6', 'komangsudiani@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019114, NULL, 1, 'Ni', 'Sudiani', NULL, NULL),
(37, '202.80.214.158', '45135110', '$2y$10$jSKyn2KFwejf6RJRve7zpOQ5FiOe70XSnTgDWr5hfjxVPoh8nFec2', 'komangayupartina@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019116, NULL, 1, 'NI', 'PARTINA', NULL, NULL),
(38, '202.80.214.158', '45135120', '$2y$10$UTp9NWhu/PT9w4IY5nch6O56Dj9NcJ4wouB97fRFw2GWL7Pn0PvaK', 'putunovi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019117, NULL, 1, 'NI', 'WIDIYANTINI', NULL, NULL),
(39, '202.80.214.158', '45135124', '$2y$10$ZYNOfPzCAs44hgZGnrZw0e69YZrhf5DlmdmrSyJgBa4E7N2sL9zRu', 'desiari@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019119, NULL, 1, 'NI', 'UTAMI', NULL, NULL),
(40, '202.80.214.158', '45138606', '$2y$10$iTDEu5cyBmgEQZpHl37K3.Zla8/PMBfyymMvZOsBmXaTotET5SkH2', 'putusriasih@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019121, NULL, 1, 'Ni', 'Sriasih', NULL, NULL),
(41, '202.80.214.158', '45138619', '$2y$10$xayFAmxxbryjOes4.WcAfOne5eViVnO16.2reLo.hStLqKBehVB5C', 'wahyuwira@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019125, NULL, 1, 'I', 'Adiguna', NULL, NULL),
(42, '202.80.214.158', '45235255', '$2y$10$K66GxizN23mLM2IHjyv./u9o6Nj3vUpzgh7y0aTjACwFLffGPxMoq', 'gedeedi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019127, NULL, 1, 'I', 'YUDIARTAWAN', NULL, NULL),
(43, '202.80.214.158', '45235258', '$2y$10$XlFDQ7Hsc7rve5K1Tud8Ke19Q8XfCr5rm0wA8JbTOV10ZBT3kpQSC', 'omingandani@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019129, NULL, 1, 'NI', 'PRADNYAWATI', NULL, NULL),
(44, '202.80.214.158', '45235261', '$2y$10$ZFrPVqK1hUi2LmTd46M7B.j7QKGKzoTuJ0yAwr0Rwx48nHK04Dt4K', 'esaditya@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019131, NULL, 1, 'I', 'KUNDALA', NULL, NULL),
(45, '202.80.214.158', '45235262', '$2y$10$i02n/SIP7KXn4Lp.rAtvXeOiF92r842HZ5xuQdu4.MgoiFfjwQsam', 'madewiwin@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019132, NULL, 1, 'NI', 'WINDAYANTI', NULL, NULL),
(46, '202.80.214.158', '45691227', '$2y$10$aN6OYgOrJaMaOvA8j.6VTOCuS4ujOPlLrTRxpXOiCV/Uv9fIDf/wW', 'putuayu@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019134, NULL, 1, 'Ni', 'Fitriyani', NULL, NULL),
(47, '202.80.214.158', '46251803', '$2y$10$rbeWJPtU2U7.7pjHDLGCLuhQQqf5mTIS6UfDoK0B0ALA.eR2UNBBC', 'putuyogi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019136, NULL, 1, 'I', 'Swara', NULL, NULL),
(48, '202.80.214.158', '46251805', '$2y$10$S3OTzMPVEeEO.vUtVDWlsOjjszdAyUfMRYfTeq4NDvRwVf2FZA0NK', 'endramaharani@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019138, NULL, 1, 'Luh', 'Maharani', NULL, NULL),
(49, '202.80.214.158', '46251806', '$2y$10$0FzZuffDkOf8D9l5nf9HoephE2LD3.zsJAXkPy9g2Aq/NV3xgyswC', 'kadekatya@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019140, NULL, 1, 'Ni', 'Amanda', NULL, NULL),
(50, '202.80.214.158', '46251809', '$2y$10$PRHQy963n/p73nU/u//mjeVmtD3BnqcWaY7pp.vNTLNHOrY/G0Y0q', 'agusadi1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019142, NULL, 1, 'I', 'Putra', NULL, NULL),
(51, '202.80.214.158', '46251812', '$2y$10$DEHnrLZznJqaPMotC3PIQ.VR2BruExsXoeEWQOyAnxx.VNqX7kuM2', 'nengahdediana@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019145, NULL, 1, 'I', 'Dediana', NULL, NULL),
(52, '202.80.214.158', '47283392', '$2y$10$g3nCUyFvHPh1cqT9Fzcc..1C5oHAtFSKY1byMwN7DUQJOaINNQ6IK', 'ketutagus@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019148, NULL, 1, 'I', 'Ardita', NULL, NULL),
(53, '202.80.214.158', '48518590', '$2y$10$OKTqZFkwUD5/xvyEtJPNWOv/KhNNzmv4Qig4mYSdK/OyA2JNfeZFa', 'ketutbudisastra@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019150, NULL, 1, 'I', 'Wijaya', NULL, NULL),
(54, '202.80.214.158', '50837638', '$2y$10$TgmHNV0LIwjPwVhV2AOz3OWtG26flqBU0bPHUR6IQ2Kg4TmfmmrxS', 'wayansumerta@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019152, NULL, 1, 'I', 'Sumerta', NULL, NULL),
(55, '202.80.214.158', '50837639', '$2y$10$bshKjCcgz9ayVTGjdygsT.O0jEN9aBed4/cWj9ouJh9EUmnbcB1PS', 'putuaditya@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019153, NULL, 1, 'I', 'Pratama', NULL, NULL),
(56, '202.80.214.158', '50837646', '$2y$10$GOv5loC/slIIyeFTquHA5uhKhYjrJknLHhtHzaMzPsGXiUe/jDFU.', 'agusadi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019155, NULL, 1, 'I', 'Saputra', NULL, NULL),
(57, '202.80.214.158', '50878084', '$2y$10$rLs1XdtzTkia1rAgi8gOjuLsHHXVPJHuIbZqGPYDMs4ulVYZXb4WC', 'ketutwidiantara@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019157, NULL, 1, 'I', 'Widiantara', NULL, NULL),
(58, '202.80.214.158', '50936083', '$2y$10$qnytXopHq2.IUS23QXAlku0WZHVIJipqijrCcPyJC7./pbG6EIUqK', 'luhwidi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019159, NULL, 1, 'Ni', 'Setyaningsih', NULL, NULL),
(59, '202.80.214.158', '51054466', '$2y$10$UuHXBEmbDbUQcib5HOwgzes6DyVrr4HrX6HPZYRhOUCVQuH2kIzIy', 'putuyudi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019161, NULL, 1, 'I', 'Setiawan', NULL, NULL),
(60, '202.80.214.158', '51058966', '$2y$10$ze.dpNc4Hu1c.fz//cyVs.G97GeUdkREJxI/KzgWNzDLXZkHpQdHa', 'komangwidiani@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019162, NULL, 1, 'Ni', 'Widiani', NULL, NULL),
(61, '202.80.214.158', '51213440', '$2y$10$nzRGrCJfg1Std/HrtSH0l.FnSYyn9O368Bv2maTr7vEhP0Nebuqz6', 'yudaadi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019166, NULL, 1, 'I', 'Pranata', NULL, NULL),
(62, '202.80.214.158', '51213444', '$2y$10$vUXKSV.wbw5wMbxhO478TeN8zBQUQa1TkmRpyRr7f.4L6bEiIX3h2', 'wayanroberta@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019168, NULL, 1, 'I', 'Roberta', NULL, NULL),
(63, '202.80.214.158', '51217536', '$2y$10$iARYsH7GxLcs8cQHFHvh4O6ORzerMRYUQrVYouSG0.VFrgUeIsIDO', 'martaamelia@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019169, NULL, 1, 'Ni', 'Putri', NULL, NULL),
(64, '202.80.214.158', '1001', '$2y$10$bD2KOpSn2DwYTeiAU2sh/.HMO4P.Yv04YBozQx1iiy9RBA4aQ4iyS', 'bowyeajus@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019191, NULL, 1, 'I', 'Astika', NULL, NULL),
(65, '202.80.214.158', '1002', '$2y$10$C/Jai5ByrCRzvKdUIGJorO.V5oDkhdglI/6JHxPNGADUfZrQwsgOK', 'madeadiarsa66@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019195, NULL, 1, 'I', 'Adiarsa', NULL, NULL),
(66, '202.80.214.158', '1003', '$2y$10$4.kEy5Be5bonM5s4EzKde.e2F.WpFwpn7iXJLDGsCFFQVuGzdIuwq', 'putuadecardina@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019197, NULL, 1, 'I', 'Cardina', NULL, NULL),
(67, '202.80.214.158', '1004', '$2y$10$D0z0.gqHrS2z4xRwoeLXk.yInfxGYD03Mr3x7zQb6rYBahecg3Hoy', 'adisusanta12345@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019199, NULL, 1, 'I', 'Susanta', NULL, NULL),
(68, '202.80.214.158', '1005', '$2y$10$AAos0zTrfRwpSPTFRh9r3uFibhO8K4nzkF1p.KCf9SqL0S8ZlwyNK', 'suteja_wayan@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019200, NULL, 1, 'I', 'Suteja', NULL, NULL),
(69, '202.80.214.158', '1006', '$2y$10$a3WbufzH5nn2J9jxcyd25./TzA7cLurAwzStd/uH.uR3q0XxTi5W2', 'Wynsuwendra30@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019202, NULL, 1, 'I', 'Putra', NULL, NULL),
(70, '202.80.214.158', '1007', '$2y$10$ptxFCOzPrfL7WQI8gTTj8u.fOu/RxkQOBxDR.9sFhncC9eStweqgS', 'shintadex@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019204, NULL, 1, 'Ni', 'Wulandari', NULL, NULL),
(71, '202.80.214.158', '1008', '$2y$10$DP.2BRMqAV0RCZHh4df.0u/OsVklRgihYebQD7Hq/2ZgGN.A/Btym', 'popogoli12@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019206, NULL, 1, 'Ni', 'Rahaningsih', NULL, NULL),
(72, '202.80.214.158', '1009', '$2y$10$GOOeJM13acC90Pr8FmaQ7urTiQy9CAcXvW3w.Vl/jGP0XJMoOZ27C', 'luhputusariasih20@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019208, NULL, 1, 'Ni', 'Sariasih', NULL, NULL),
(73, '202.80.214.158', '1010', '$2y$10$ube1c3zrU3C5i9BNtuOiGurQlfYGxMn18nG93z39FMoXmzpCOunmG', 'sugiartaminengah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019210, NULL, 1, 'Ni', 'Sugiartami', NULL, NULL),
(74, '202.80.214.158', '1011', '$2y$10$hNuKgwN2TfEdSLX6R19oNOms.4JLA8XsmLnK5e.y6bkurMdYq4a5q', 'niputuastiti66@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019214, NULL, 1, 'Ni', 'Astiti', NULL, NULL),
(75, '202.80.214.158', '1012', '$2y$10$rxSIhodYAO32fLcqOL29A.fAXKUuVd6HercS2NfpR5NieS4SWTFlG', 'yan_wid2000@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019216, NULL, 1, 'Ni', 'Widiasih', NULL, NULL),
(76, '202.80.214.158', '1013', '$2y$10$o2PGE6UvrRY6oIwiIwcZJuN1rM2xo8uuPi17bfyWB30B.4Fa8qU9u', 'ktri9406@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019218, NULL, 1, 'Nyoman', 'Jayanthi', NULL, NULL),
(77, '202.80.214.158', '1014', '$2y$10$kEJrjMiZPpyX65NxE0AGh.e1/1BunX.rNPm14crLgX2qwRe1RjW2C', 'ayu.canty@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019220, NULL, 1, 'Putu', 'Suwandiari', NULL, NULL),
(78, '202.80.214.158', '1015', '$2y$10$AQojuQCjtoI/DpurNbeoEupSCy9H.Ntujbk6XjkPX4QlU28vOahqW', 'aryasemara0@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019222, NULL, 1, 'I', 'Dwipa', NULL, NULL),
(79, '202.80.214.158', '196112311987', '$2y$10$7Fw2SpYPfxZudGJ9F.9DyesNEK8XGkotWJ2C.SUdT/igTymrI.Bv.', 'abidarma40@yahoo.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019223, NULL, 1, 'I', 'Putu', NULL, NULL),
(80, '202.80.214.158', '196512102005', '$2y$10$vzL40VV6PkD0eyftdvRHPef.NL1340X4jSRboyRG2DJ4HGHjLL9aa', 'nengah_mastini@yahoo.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019225, NULL, 1, 'Ni', 'Mastini', NULL, NULL),
(81, '202.80.214.158', '196512311999', '$2y$10$z2OVuoK1M0IvHpwy1s8/lezBTylFgRcUrs5mpXhjmFlRZGZSrtXdu', 'sadia_bonet@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019227, 1680019981, 1, 'I', 'Sadia', NULL, NULL),
(82, '202.80.214.158', '196708081990', '$2y$10$HbH05s8Qc8cQV684FhN6Oeg29WMd2IKkLSFhivPsjhI6z0/8vPrhy', 'nyomateresna99@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019229, NULL, 1, 'I', 'Teresna', NULL, NULL),
(83, '202.80.214.158', '196802072007', '$2y$10$MwDF93FghAo3EKmqbECtdekDQFXYFaGDN.DAJKyc.MuIHQLsIOjXS', 'nyoman.sukarmini@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019230, NULL, 1, 'Ni', 'Sukarmini', NULL, NULL),
(84, '202.80.214.158', '196910012008', '$2y$10$rd2JlM8Qdm5BEJQ8btPh/.n/Nz0HLWqAaRLu.F2frcPxysl0c9i3a', 'gedesuardana69@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019238, NULL, 1, 'I', 'Suardana', NULL, NULL),
(85, '202.80.214.158', '197001101997', '$2y$10$SvoTTKApiBnxZbwSiL8HeuiFevUuxLLmYrLCoHkqaESyX74XWkMy.', 'wayanmerta10@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019240, NULL, 1, 'I', 'Merta', NULL, NULL),
(86, '202.80.214.158', '197407112008', '$2y$10$BwE0g3AAECyWTuHbmnI6fO.Jr9lkWJm/H9q6rIh6llkUWyqqR.fKm', 'suelendra@yahoo.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019242, NULL, 1, 'I', 'Sulendra', NULL, NULL),
(87, '202.80.214.158', '199205072022', '$2y$10$f7N7o.gZrT8E/27vBewdQuD.MWZ39MQ.klbcRCQOWTeuiU7HnUEby', 'sujiantari4@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019244, NULL, 1, 'Ni', 'Sujiantari', NULL, NULL),
(88, '202.80.214.158', '51293077', '$2y$10$TldZOciA8y2mPuC7i23kk.OdRNRYVQUy.R893LQph3dn9FIupvrFy', 'putuedi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019260, NULL, 1, 'I', 'MULIARTA', NULL, NULL),
(89, '202.80.214.158', '51296612', '$2y$10$w7T0kSzUIMX6zzkGWvHaZ.dJF2Q5bpnnnh.XNWSpXYUjiFVSDuLWi', 'agusarya@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019262, NULL, 1, 'I', 'Winata', NULL, NULL),
(90, '202.80.214.158', '51436172', '$2y$10$zkoeKUSC4YnpUs33N4kNMOZjRkgHm8dH1Ldq.y90unhv0FSXWphnu', 'ayumahima@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019264, NULL, 1, 'NI', 'CANIS', NULL, NULL),
(91, '202.80.214.158', '51436174', '$2y$10$irMPqypn2//oJxYYIlTa3.fhNJPbinmFsZoaaMjCAfxdRI4X32Ko6', 'kadekerik@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019265, NULL, 1, 'I', 'SUDIANTIKA', NULL, NULL),
(92, '202.80.214.158', '51436177', '$2y$10$VGO.xM48P6D03S9CoUltge4PA68eMHH2dU7q6Clxz2DOr1CfhCp/C', 'madehendrayasa@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019267, NULL, 1, 'I', 'HENDRAYASA', NULL, NULL),
(93, '202.80.214.158', '51436180', '$2y$10$FGExAcP7t7EHXT8dC/AID.U9w/mXDy7fVkkS7Gz5/Oz56CO2DoEJq', 'aryaanom@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019269, NULL, 1, 'I', 'WARDHANA', NULL, NULL),
(94, '202.80.214.158', '51436183', '$2y$10$qoPxDp70tLk5.nfwmkJfJeQXIT7rIb/vwbSY1L9NgHQDOw1eBVuFG', 'gedeari@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019271, NULL, 1, 'I', 'YOGA', NULL, NULL),
(95, '202.80.214.158', '51436187', '$2y$10$h/bkWJ92yOtxZJlCxWhyZ.ej/RGDZY/jVsusxnVrNnM5.ugom0cVi', 'agusdarma@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019274, NULL, 1, 'I', 'YOGA', NULL, NULL),
(96, '202.80.214.158', '51436190', '$2y$10$Xb/coPZtHdn4xPm/ousLwOb/621kmaJwn2ghde0NrfocK1c/osjl.', 'kadekratih@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019276, NULL, 1, 'NI', 'SUGIANTARI', NULL, NULL),
(97, '202.80.214.158', '51436192', '$2y$10$ANfkaIzYRwDiSuIwBtqGzO/LGCv4YG5XOv6iNbT0kaXudZIgeoKgS', 'radalelya@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019279, NULL, 1, 'NI', 'PUTRI', NULL, NULL),
(98, '202.80.214.158', '52115716', '$2y$10$C59ayF8P9R1/NfBp1fPj/uq0gmc2G7DJUTH69oYAOUKQ00y1OAOt6', 'nisaprabawati@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019281, NULL, 1, 'NI', 'UTAMI', NULL, NULL),
(99, '202.80.214.158', '52354599', '$2y$10$YDKiVbOjHq93hh.lSUNpRu39RzgBojHQUybg46m6rf.W5mk4PwmAu', 'komangsri@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019283, NULL, 1, 'Ni', 'Wahyuni', NULL, NULL),
(100, '202.80.214.158', '52720618', '$2y$10$b//O2N2Lgj/ZY1LvYDFulO4PNn6T9hJs7UCOqX4PFVf/swnRXltzC', 'kadekdiantari@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019285, NULL, 1, 'Ni', 'Diantari', NULL, NULL),
(101, '202.80.214.158', '52793984', '$2y$10$4scl3k6WPP5/SPzvwwo9WeasKm4kXXmq/yWszYnB6CiG9SLJpmnxi', 'wisnuputra@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019287, NULL, 1, 'I', 'Ariwinaya', NULL, NULL),
(102, '202.80.214.158', '52793992', '$2y$10$TKY79yqgZtEAnZsw3c8vr.RcALA8BGlKOU4BJr/SJZjQ3cLGQEC5m', 'ketutparwati@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019289, NULL, 1, 'Ni', 'Parwati', NULL, NULL),
(103, '202.80.214.158', '52793993', '$2y$10$GAp0Qmri7Y7SESlj/Ew0Oe6je4MPCLarTOt8ej5aB2n.c0FK6/UGm', 'kademiarsana@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019290, NULL, 1, 'I', 'Miarsana', NULL, NULL),
(104, '202.80.214.158', '52793995', '$2y$10$g.PmS4eWq1SsxEwtd.naCOGqr2VO7AlL8cowukBDWLkdyMJQ7Mo.y', 'kadesumartini@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019292, NULL, 1, 'Ni', 'Sumartini', NULL, NULL),
(105, '202.80.214.158', '52849071', '$2y$10$LOqVmxZbPZEQl/.mK5bqs.XJRT0XvtXnsIeQ1H5Eu/2bcztCs.402', 'kadekari1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019295, NULL, 1, 'I', 'Subawa', NULL, NULL),
(106, '202.80.214.158', '53380615', '$2y$10$.DfJC1ywO05qJOvu3skC6OlQ3gj7CWgNeMaVEgWfjh.2hRp2kizzK', 'ketutayu@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019297, NULL, 1, 'Ni', 'Setiari', NULL, NULL),
(107, '202.80.214.158', '54058825', '$2y$10$eTjXQT2PkICoM7BIcVjtTOVcUwixoKrcavOdv2UzIsZ3bvND/ko4C', 'nyomanaditya@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019299, NULL, 1, 'I', 'Palguna', NULL, NULL),
(108, '202.80.214.158', '54189350', '$2y$10$JawEAyxyTR79LP4asUGzhOqqFYmNObI7dSfK5I47MKUyWa4PP/lOm', 'kadekdwi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019333, NULL, 1, 'I', 'Artawan', NULL, NULL),
(109, '202.80.214.158', '54844092', '$2y$10$SuLRKT/zn7D2k1GHuAoi2Ob8Q4z61KG3BSc323SGYki5aBIgFHSZq', 'luhnik@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019335, NULL, 1, 'Ni', 'Sumahyuni', NULL, NULL),
(110, '202.80.214.158', '55305898', '$2y$10$rl752Ng6C49eJ44dyD.oSOvzDfBxTMQ0mUMtA9pCutmD4ur0Rf3Va', 'madeyuliantari@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019337, NULL, 1, 'Ni', 'Yuliantari', NULL, NULL),
(111, '202.80.214.158', '55470890', '$2y$10$si31iMh6u/zd2QNLwJBEa.ipeNWqRWwgum7xxW9YiQPG/CGDTg6QW', 'wahyuagus@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019338, NULL, 1, 'I', 'NUGRAHA', NULL, NULL),
(112, '202.80.214.158', '55721042', '$2y$10$LYbPQvGTfttTsVCnHHeSHuxoGJoOt/DD.y26mKpEwgTntWRBL6qJ.', 'ketutmerta@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019340, NULL, 1, 'I', 'Yasa', NULL, NULL),
(113, '202.80.214.158', '56103864', '$2y$10$f0P.mPV7zrLnKMyn1CBZhuOe25XD1Ciyv3JCusOaBzJTB0v2OO6XW', 'virawindari@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019342, NULL, 1, 'Ni', 'Putri', NULL, NULL),
(114, '202.80.214.158', '56226550', '$2y$10$M6.oFsO0n37CPRlNUDrmN.hCtHOcgalqa5DWsmo7dUN5aKU3F1YCi', 'egameysta@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019344, NULL, 1, 'NI', 'NINGSIH', NULL, NULL),
(115, '202.80.214.158', '56582428', '$2y$10$nxEsJQzxTeAJLsyI0ch6JOGGdL7ri6EZnevEnFd6gL.VIcHWcGGFq', 'putumelly@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019347, NULL, 1, 'NI', 'KURNIAWATI', NULL, NULL),
(116, '202.80.214.158', '56827998', '$2y$10$8Gb7PR/A48fNBmBL0UYjY.uzR260BS77F4DiaLgbUaYUXWh7KiotG', 'wayandangin@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019349, NULL, 1, 'I', 'Adnyana', NULL, NULL),
(117, '202.80.214.158', '58459619', '$2y$10$E8U/u2LTwPwWYRbi49X95OLqCWii/54ges1w0IrZqLytJiUwhSNlW', 'anggakusuma@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019351, NULL, 1, 'I', 'Jaya', NULL, NULL),
(118, '202.80.214.158', '58841281', '$2y$10$pfKyTdvpTXJ8lbuEy41kBuBl0bMPTOocXJTlPaSTQATsXHTcZ7q8G', 'gedewahyu@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019353, NULL, 1, 'I', 'WIDYAMERTA', NULL, NULL),
(119, '202.80.214.158', '58852458', '$2y$10$oEMhj.nZMSxi4KINh.SXbewQmI7ULaroE9IG1l7HEDS8iAcaQN3r6', 'wayansherlyani@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019355, NULL, 1, 'Ni', 'Sherlyani', NULL, NULL),
(120, '202.80.214.158', '59294922', '$2y$10$dBlcLOjWrOc1xTvyUR3NP.J9N92fqzsaoly3uXERrQseXUrRzhrpy', 'putusri@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019356, NULL, 1, 'Ni', 'Udayani', NULL, NULL),
(121, '202.80.214.158', '59865538', '$2y$10$ZHiov4PDlTjZyyWpuSJulePJrQP85DSLzdwdRv1iSRsfJRGh2rUA6', 'komangrudi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019358, NULL, 1, 'I', 'ANTARA', NULL, NULL),
(122, '202.80.214.158', '60058256', '$2y$10$EwsLF251pB60avLxVMv2aOF/sn92KCJPQ1g8RRihFIm3gYgGxPYYW', 'putuari@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019360, NULL, 1, 'I', 'Pranata', NULL, NULL),
(123, '202.80.214.158', '60058257', '$2y$10$3hGHSqma3rghCRZx8wxVJeiKfSAu2F5PKBROWNvfnLHDvW5ncZDgS', 'nengahbudi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019361, NULL, 1, 'I', 'Adnyana', NULL, NULL),
(124, '202.80.214.158', '60058258', '$2y$10$psScigsl1AdmSL0tkswyT.0wRE5TT14g.SSZQgvY0cQ7FC8EBgb0S', 'tridarma@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019363, NULL, 1, 'I', 'Permana', NULL, NULL),
(125, '202.80.214.158', '61196740', '$2y$10$Y7Ti5QkPB9/34bnClv..gu3u7R/9UHgrypMCrwakkCmjUWZNlAZLW', 'komanglia@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019366, NULL, 1, 'Ni', 'Sukarini', NULL, NULL),
(126, '202.80.214.158', '61218221', '$2y$10$5y3BVKRemZkIyVwKWpQeAOL2V.fdGs.EBM2SJ8mICfRETcOFADwM.', 'komangdewi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019371, NULL, 1, 'NI', 'DIANAWATI', NULL, NULL),
(127, '202.80.214.158', '61259400', '$2y$10$Evmh/fRrYj8LCqmTvrM5fem.RJjligDBO0jd.Vo6f09.WoqJTicVa', 'komangsuparta@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019376, NULL, 1, 'I', 'Suparta', NULL, NULL),
(128, '202.80.214.158', '61437108', '$2y$10$xbvnCc/Lz1A9esvkLtbGzOOpsqD1xAOv4T3tKCbZ36a95OXhGUQIa', 'kadektari@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019378, NULL, 1, 'Ni', 'Tari', NULL, NULL),
(129, '202.80.214.158', '61502101', '$2y$10$HV/kmD.BurwXwTiP472a1eNlSZ9qyLJoqrARf.S1ax.CE9DABsQV2', 'wayanyasa@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019380, NULL, 1, 'I', 'Kumara', NULL, NULL),
(130, '202.80.214.158', '61789054', '$2y$10$iUSg.E1O/N4qnKBCEM9YqeC9yu7HLPdrpHjs7N4.gurw3SuyZlbdW', 'lanangwiguna@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019382, NULL, 1, 'I', 'WIJAYA', NULL, NULL),
(131, '202.80.214.158', '62057247', '$2y$10$W/Qv9GqWdw5CZk0qRbv0Y.iEifwMWRoPko4/Wsas78ZepmrwAYR76', 'madesuardika@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019384, NULL, 1, 'I', 'SUARDIKA', NULL, NULL),
(132, '202.80.214.158', '62533775', '$2y$10$EnAPwd0XEjecYEPH41im8u62xHBNzZiEifTzuZjrD/4GzkHk7xmrO', 'madedwi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019386, NULL, 1, 'I', 'Permana', NULL, NULL),
(133, '202.80.214.158', '62652006', '$2y$10$j..yPnkwxH6WgrKyvPll1uGJFZj2VdA8e6..yMpimPY3z1qfypg1m', 'komangbudiartana@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019388, NULL, 1, 'I', 'Budiartana', NULL, NULL),
(134, '202.80.214.158', '62657070', '$2y$10$HlvJMk2tqA9wDLkXAxHWCOumU9h..PVg0MAiRlQl4GVBBjEToc0.K', 'wayansugiantari@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019389, NULL, 1, 'Ni', 'Sugiantari', NULL, NULL),
(135, '202.80.214.158', '63007573', '$2y$10$pCuWx.8olgNCvDJlQuTMjewaRw.HA3ad/pOywwTxbfPGfRXpiJnCu', 'putujuni@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019692, NULL, 1, 'I', 'Wirawan', NULL, NULL),
(136, '202.80.214.158', '63197483', '$2y$10$v8El60kehMd87I/PUTZaR.vAc4kyJBXOZ5ij8WxJWWhkNP73SLuNG', 'kadejanuarta@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019694, NULL, 1, 'I', 'Januarta', NULL, NULL),
(137, '202.80.214.158', '63372325', '$2y$10$NzsdO.fNLHkO93.aji7QFersMrxqSxqnSpEcxBASe2ergUms8Ix2i', 'wayankariasa@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019696, NULL, 1, 'I', 'Kariasa', NULL, NULL),
(138, '202.80.214.158', '63657628', '$2y$10$vx4TOk0ODesDNV9m9qoBSOTc6F7n6m4T5iWBGKunDB1qpNdM7TYqO', 'kadekrediasih@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019698, NULL, 1, 'Ni', 'Rediasih', NULL, NULL),
(139, '202.80.214.158', '63931289', '$2y$10$gwSG9utZQOSwNJ7Et6BX0ejQ4mGqiSwwKPOAlp.xPxTtnVsDK0qgO', 'madenonik@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019700, NULL, 1, 'Ni', 'Yanti', NULL, NULL),
(140, '202.80.214.158', '64261792', '$2y$10$IJlDsDTHlG/Tdw2oDM1Fy.FZFyO/ts2muN0lvIG8..uRRHWEDrNoy', 'ketutadi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019702, NULL, 1, 'I', 'Septiawan', NULL, NULL),
(141, '202.80.214.158', '64796499', '$2y$10$s6N13kMHphMcNHzdZbC/7uqNFeyth8uSVZR.ZuS/ZaG1Nkd/oZWd2', 'maniksuanjaya@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019704, NULL, 1, 'I', 'Putra', NULL, NULL),
(142, '202.80.214.158', '65044554', '$2y$10$B.JssZqmW8nkAE70o9JjNekEz0FgyaLd5VhpzirOGnUrHUgP9DCVi', 'kadekkrisna@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019706, NULL, 1, 'I', 'Krisna', NULL, NULL),
(143, '202.80.214.158', '65075946', '$2y$10$VIFQISEXSru.YGwPOYFGnenDQja5/WZ4ihGBbkik01G3qWlWvIXeG', 'komangmerta@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019707, NULL, 1, 'I', 'Merta', NULL, NULL),
(144, '202.80.214.158', '65149221', '$2y$10$qotoQnXjnpaBAfh1tNgfi.hnjmGFGYhwjiuTQMcroZad1zxKnlY/e', 'kadekraditya@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019709, NULL, 1, 'I', 'Raditya', NULL, NULL),
(145, '202.80.214.158', '66520346', '$2y$10$oSjwDv9pxPQf4/BQkgKaaOkKvuqOgaFmJ.KZthW.L/KlLypoQJGv.', 'ketutmuliyani@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019724, NULL, 1, 'Ni', 'Muliyani', NULL, NULL),
(146, '202.80.214.158', '66762513', '$2y$10$qBKDv1.tiquyLu4/byMsOedUuhfbZYwHQLY3Z1FFKb5KkFO2x5jCS', 'gedeyudi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019727, NULL, 1, 'I', 'Suryawan', NULL, NULL),
(147, '202.80.214.158', '66794078', '$2y$10$.lqUIcErOWmn1w/9d.EEEOpQTI/zh3l5soaT8oqzds8ZDzl8STY9m', 'komangsuartini@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019729, NULL, 1, 'Ni', 'Suartini', NULL, NULL),
(148, '202.80.214.158', '66872269', '$2y$10$BmEgxaAQ3swMRhSgImvMxuAug2oKzKn161ecblC0Uj1vw7a10xV8q', 'komangcandra@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019731, NULL, 1, 'I', 'DIPA', NULL, NULL),
(149, '202.80.214.158', '67260846', '$2y$10$kTpnK/Nk3RqB5mC7R48o1ejsKY1SChbRRJAhJ9QnuMOh5UilIf4Pm', 'gedevalentino@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019733, NULL, 1, 'I', 'Pratama', NULL, NULL),
(150, '202.80.214.158', '67309704', '$2y$10$cVs983DLshDQH.ihOB5omuXp2cbOQyBFtAZikPJ70xl/DPknY8oce', 'putudedi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019735, NULL, 1, 'I', 'WIRASMANA', NULL, NULL),
(151, '202.80.214.158', '67371914', '$2y$10$E4jnd/KxYWfEfGRaHD7FYO3Be7TDZ8P3Uv9KFwr9HT/0Ei8RxgnD2', 'aguscahya@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019737, NULL, 1, 'I', 'SETIAWAN', NULL, NULL),
(152, '202.80.214.158', '67442625', '$2y$10$vxJFrAIgrcT6qnY/TzxIe.hEczdWWG2NLUUxZOrt0HfS0vRIjt42S', 'kadekrai@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019739, NULL, 1, 'I', 'ARTAWAN', NULL, NULL),
(153, '202.80.214.158', '67838344', '$2y$10$ctvuZqq.glwNkwFvjLmhsu1i3jbUxLjqYLbo4BsKNYQTwBNoTwiKa', 'komangayu@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019741, NULL, 1, 'Ni', 'Septiani', NULL, NULL),
(154, '202.80.214.158', '68030201', '$2y$10$WHqM1biEd79NJCrX6YdrbOW1bE5kjwXbnT5G/WWuqXdf6N1shchlO', 'kadesuardana@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019743, NULL, 1, 'I', 'Suardana', NULL, NULL),
(155, '202.80.214.158', '68049765', '$2y$10$7tzFtRCwsIoVcNL1PYe21OIdYiYNss/kzlYq1P7WzEGlk.1/Vu5j.', 'nyomanagus@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019746, NULL, 1, 'I', 'Priyatna', NULL, NULL),
(156, '202.80.214.158', '68166927', '$2y$10$cX6KzJr0N11AfiBKY7tyKuS1QjRqnMzEEl3TNgRGSuJzh.qk8OsjW', 'kadekmelinda@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019749, NULL, 1, 'Ni', 'Mahendrayani', NULL, NULL),
(157, '202.80.214.158', '68230334', '$2y$10$BQFzVk3oJuub5PJ6D6qNje5fek21PmdlHs7NG6PEXuYwYVSITCdje', 'tegarputra@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019751, NULL, 1, 'I', 'Mahardika', NULL, NULL),
(158, '202.80.214.158', '68556184', '$2y$10$FfR8/s71oNiwshcJQXGrMOBCr8e16.pqtaz90V5IyqMC/6m7hP0SG', 'kadesumiati@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019752, NULL, 1, 'Ni', 'Sumiati', NULL, NULL),
(159, '202.80.214.158', '68571374', '$2y$10$G4SNxjI/4Ic99uQ3i4CP2u/BwbGqghj5jQblc9/r7S8StVfh8H08G', 'krisnaedi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019754, NULL, 1, 'I', 'PUTRA', NULL, NULL),
(160, '202.80.214.158', '68982689', '$2y$10$jbfZlqjfHofT4G184g5vyObnNTzhhclwI.vXxFVbQ2Os43GVyTB6a', 'widhiasih@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019756, NULL, 1, 'Ni', 'Yuliawati', NULL, NULL),
(161, '202.80.214.158', '69066857', '$2y$10$Bhnxl8yuRIV.0GpjwfTjdOdXwEBDkxbsCn7dcYrC/AdJZmYLaa3X2', 'ayukadek@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019758, NULL, 1, 'I', 'Dewi', NULL, NULL),
(162, '202.80.214.158', '69068167', '$2y$10$hjVnBbVGAuvFYV.BQfmbBejNRKKZc8OJapfRcYr4gH355PhzT7T2O', 'kadeari@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019761, NULL, 1, 'I', 'Indrayana', NULL, NULL),
(163, '202.80.214.158', '69281622', '$2y$10$5oEvqzFbowMts8BaEcxqwO0T.J8xEaRBs1ZWWxujKLInfoxXZM/HO', 'winichaori@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019762, NULL, 1, 'Ni', 'Putri', NULL, NULL),
(164, '202.80.214.158', '69497086', '$2y$10$gRik5nJ9Vd71hVGOmXCnvO/d/05N68nZ32UlsWBVPza2mzIqVFhNK', 'nengahsri@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019764, NULL, 1, 'NI', 'MELANI', NULL, NULL),
(165, '202.80.214.158', '69630825', '$2y$10$qEALb4o/2v0Jwx0ruZmDluQBXlVYnIorpu.XEatVfc.o/zm3xZwjW', 'komangpurwaningsih@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019768, NULL, 1, 'NI', 'PURWANINGSIH', NULL, NULL),
(166, '202.80.214.158', '69735083', '$2y$10$KqFfl.Dk6HdSQC6ijg5zq.6RgyKq1NeznY2.x7/WCazPJA/cgIjiK', 'kadeksumantara@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019770, NULL, 1, 'I', 'Sumantara', NULL, NULL),
(167, '202.80.214.158', '69828392', '$2y$10$D9fmLj9ByRnbAWC.4gUs1urdU2zax7aqxNVEtNzOYCNBbttC1Drn.', 'lanangalit@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019772, NULL, 1, 'I', 'WIJAYA', NULL, NULL),
(168, '202.80.214.158', '71344994', '$2y$10$t2kwevANsA/BAk1R.aBH0uQyYpipzkx9yeRyhD0t6ycoVsZH4Ik1C', 'wayanwidiantara@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019774, NULL, 1, 'I', 'Widiantara', NULL, NULL),
(169, '202.80.214.158', '71828945', '$2y$10$KgW89qzW7V.0tzw70s2oHepOvN9b5Cj5LyYHSg2EIk.n7zSnbT/qC', 'wayanagus@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019776, NULL, 1, 'I', 'Febriantara', NULL, NULL),
(170, '202.80.214.158', '72056029', '$2y$10$l7mvd0ufWEnFwFc6y8jpmuvw02bsDQkY5kdwIqQBEP7zXrWHovju2', 'putulia@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019778, NULL, 1, 'Ni', 'Suryati', NULL, NULL),
(171, '202.80.214.158', '72456349', '$2y$10$N/S.t085/nECL3gTAO8vNOA7Sfn2OKsEew3PaWlZp2LyybTvWU1Pm', 'ketutmerta1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019780, NULL, 1, 'I', 'Yasa', NULL, NULL),
(172, '202.80.214.158', '74304167', '$2y$10$eOZQHFpo9.5pw4f95/ZE7uM/9znuin2ES83Vjh4NtFqCpIHByML/C', 'komangadnyana@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019782, NULL, 1, 'I', 'Putra', NULL, NULL),
(173, '202.80.214.158', '74416957', '$2y$10$CG1CpTuT23TgUwUR54H/0ecHtQCaZKKJgRDoCzdt5TBHxXrV0YqH6', 'kadedesi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019784, NULL, 1, 'Ni', 'Amelia', NULL, NULL),
(174, '202.80.214.158', '74596895', '$2y$10$M1IdG3EJUzjQDFnPduqyLukH/PeeivhglSyMQIYDKu4Gwe0no.2ri', 'nengahwirawan@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019786, NULL, 1, 'I', 'Wirawan', NULL, NULL),
(175, '202.80.214.158', '74656676', '$2y$10$UU7QX949xcd15Eg3W8hqxeW02LyMfhjX5WczAkpnFt6KmAeXhEQN6', 'bobbysatria@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019789, NULL, 1, 'I', 'ARIMBAWA', NULL, NULL),
(176, '202.80.214.158', '74672651', '$2y$10$TKSDui4NZhnRZns.DxOoFeEYpiDRupzQInbUlcnRczCxGswNTthky', 'madeagus1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019791, NULL, 1, 'I', 'Juliawan', NULL, NULL),
(177, '202.80.214.158', '74901064', '$2y$10$mX2odXu2Dv.d/.SssgWtvOjs8I0GmJ.EY/NlGMFCTUOAxsXJ8ShK.', 'komangarya@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019793, NULL, 1, 'I', 'SUMERTA', NULL, NULL),
(178, '202.80.214.158', '75400257', '$2y$10$eOHzftY8GPGMy3vx0EON1Onkcu3T/SlylHelLTxY/ry3fx3raF322', 'madeapriliani@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019795, NULL, 1, 'Ni', 'Suarningsih', NULL, NULL),
(179, '202.80.214.158', '75592500', '$2y$10$RhWVNnK0VgGKdofeyFCuZOylTRic1nzm4fEcY4yJgcZnyjaBPHwVO', 'wayaneka@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019797, NULL, 1, 'I', 'Widiarta', NULL, NULL),
(180, '202.80.214.158', '75632662', '$2y$10$r8ip./HNgmWB1v3Z/.rXdOB/tnu.MEIgyLjM/VJbsWpUwf7sygl7O', 'nengahmita@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019798, NULL, 1, 'NI', 'PURNAMI', NULL, NULL),
(181, '202.80.214.158', '75825630', '$2y$10$arnCc5B0doMumz4PI1Pb1ei6s71eirpgqZwka2vaHJpOt6/ehROhS', 'gedepebri@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019800, NULL, 1, 'I', 'Suartawan', NULL, NULL),
(182, '202.80.214.158', '75849347', '$2y$10$tY0v6RRZLAmkZJBzlmzTne8uMnI0uo8eNsSfFStzaw6iavLYS9aLq', 'putueuro@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019802, NULL, 1, 'I', 'Wahenantara', NULL, NULL),
(183, '202.80.214.158', '76000305', '$2y$10$WJa.ZS1OkvTPB5s5WmZmbOFTDFSwPt6jw1fkUDF4d6n6L.O43v7dq', 'wayanagus1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019804, NULL, 1, 'I', 'JUNIARTA', NULL, NULL),
(184, '202.80.214.158', '76231390', '$2y$10$m.lXp8r5Fb95cZlj0xn0Nes3xddan.w4GItkQFDko2bGBb2lOAmJ6', 'kadeaprilia@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019806, NULL, 1, 'Ni', 'Rustini', NULL, NULL),
(185, '202.80.214.158', '76554996', '$2y$10$xlmvLz0/PJnfeqFrTH28h.pDpY5Vx2wtqeTGE0nKS3Di2uPpxMcPW', 'kadekaryana@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019809, NULL, 1, 'I', 'Aryana', NULL, NULL),
(186, '202.80.214.158', '76631293', '$2y$10$g6YGvNTSE51Ji9BAf0qPuObPYaS7862kn7m.oMuEhaxJh1W0Dhq.S', 'anggajuli@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019811, NULL, 1, 'I', 'YASA', NULL, NULL),
(187, '202.80.214.158', '76640603', '$2y$10$2c4.e9VshpTlc1bJCa2oPu4TcBqiVqa0JMKGiGZufYcT53sVqHtgu', 'kadesuantari@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019822, NULL, 1, 'Kade', 'Suantari', NULL, NULL),
(188, '202.80.214.158', '76725800', '$2y$10$DcLYWliFuw0D8/pV0Mz6IOjeW2w7eIIhqOHvCBbji9BSsyq3UgP6G', 'kadekyuliantari@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019824, NULL, 1, 'Ni', 'Yuliantari', NULL, NULL),
(189, '202.80.214.158', '78072257', '$2y$10$W9ircKNh4RU.bSTdgOmu.udgxYuDBtbImMj2ffarfS/ekIglFqYM6', 'madeayu@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019826, NULL, 1, 'NI', 'ASTITI', NULL, NULL),
(190, '202.80.214.158', '78214732', '$2y$10$10hWxQvLBdGN925/g80Q.O8Qt9dgDWXHzwIcICf3KcTxV1wKFnCWW', 'madekartika@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019828, NULL, 1, 'I', 'Kartika', NULL, NULL),
(191, '202.80.214.158', '78584729', '$2y$10$QPT9Z82112BeRi4UIgvRTOA/dGs.SDW6oTZ5BGE.3O4V8NlwtJsDO', 'kadeksudiantari@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019830, NULL, 1, 'Ni', 'Sudiantari', NULL, NULL),
(192, '202.80.214.158', '78844762', '$2y$10$TqBDkwJY6fXe1QsnEa0kMeAnNunDE8CudUuxgp8DBm0IBGCtwB5fu', 'kadekokta@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019832, NULL, 1, 'I', 'WIGUNA', NULL, NULL),
(193, '202.80.214.158', '78856490', '$2y$10$Ut1VRJSdzgpLkIg8AsEPkuJjedcETppkZAzSIoCsIen0qyOud.Lfa', 'komangdanu@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019834, NULL, 1, 'I', 'WARDANA', NULL, NULL),
(194, '202.80.214.158', '78861833', '$2y$10$yKYqdKdC2fi8rbDEmvJfHeOhDdq3OlYWue5k.LtYw/u4vArwdSyxe', 'madeyogik@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1680019836, 1680019878, 1, 'I', 'SAPUTRA', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(3, 1, 1),
(13, 11, 3),
(14, 12, 3),
(15, 13, 3),
(16, 14, 3),
(17, 15, 3),
(18, 16, 3),
(19, 17, 3),
(20, 18, 3),
(21, 19, 3),
(22, 20, 3),
(23, 21, 3),
(24, 22, 3),
(25, 23, 3),
(26, 24, 3),
(27, 25, 3),
(28, 26, 3),
(29, 27, 3),
(30, 28, 3),
(31, 29, 3),
(32, 30, 3),
(33, 31, 3),
(34, 32, 3),
(35, 33, 3),
(36, 34, 3),
(37, 35, 3),
(38, 36, 3),
(39, 37, 3),
(40, 38, 3),
(41, 39, 3),
(42, 40, 3),
(43, 41, 3),
(44, 42, 3),
(45, 43, 3),
(46, 44, 3),
(47, 45, 3),
(48, 46, 3),
(49, 47, 3),
(50, 48, 3),
(51, 49, 3),
(52, 50, 3),
(53, 51, 3),
(54, 52, 3),
(55, 53, 3),
(56, 54, 3),
(57, 55, 3),
(58, 56, 3),
(59, 57, 3),
(60, 58, 3),
(61, 59, 3),
(62, 60, 3),
(63, 61, 3),
(64, 62, 3),
(65, 63, 3),
(66, 64, 2),
(67, 65, 2),
(68, 66, 2),
(69, 67, 2),
(70, 68, 2),
(71, 69, 2),
(72, 70, 2),
(73, 71, 2),
(74, 72, 2),
(75, 73, 2),
(76, 74, 2),
(77, 75, 2),
(78, 76, 2),
(79, 77, 2),
(80, 78, 2),
(81, 79, 2),
(82, 80, 2),
(83, 81, 2),
(84, 82, 2),
(85, 83, 2),
(86, 84, 2),
(87, 85, 2),
(88, 86, 2),
(89, 87, 2),
(90, 88, 3),
(91, 89, 3),
(92, 90, 3),
(93, 91, 3),
(94, 92, 3),
(95, 93, 3),
(96, 94, 3),
(97, 95, 3),
(98, 96, 3),
(99, 97, 3),
(100, 98, 3),
(101, 99, 3),
(102, 100, 3),
(103, 101, 3),
(104, 102, 3),
(105, 103, 3),
(106, 104, 3),
(107, 105, 3),
(108, 106, 3),
(109, 107, 3),
(110, 108, 3),
(111, 109, 3),
(112, 110, 3),
(113, 111, 3),
(114, 112, 3),
(115, 113, 3),
(116, 114, 3),
(117, 115, 3),
(118, 116, 3),
(119, 117, 3),
(120, 118, 3),
(121, 119, 3),
(122, 120, 3),
(123, 121, 3),
(124, 122, 3),
(125, 123, 3),
(126, 124, 3),
(127, 125, 3),
(128, 126, 3),
(129, 127, 3),
(130, 128, 3),
(131, 129, 3),
(132, 130, 3),
(133, 131, 3),
(134, 132, 3),
(135, 133, 3),
(136, 134, 3),
(137, 135, 3),
(138, 136, 3),
(139, 137, 3),
(140, 138, 3),
(141, 139, 3),
(142, 140, 3),
(143, 141, 3),
(144, 142, 3),
(145, 143, 3),
(146, 144, 3),
(147, 145, 3),
(148, 146, 3),
(149, 147, 3),
(150, 148, 3),
(151, 149, 3),
(152, 150, 3),
(153, 151, 3),
(154, 152, 3),
(155, 153, 3),
(156, 154, 3),
(157, 155, 3),
(158, 156, 3),
(159, 157, 3),
(160, 158, 3),
(161, 159, 3),
(162, 160, 3),
(163, 161, 3),
(164, 162, 3),
(165, 163, 3),
(166, 164, 3),
(167, 165, 3),
(168, 166, 3),
(169, 167, 3),
(170, 168, 3),
(171, 169, 3),
(172, 170, 3),
(173, 171, 3),
(174, 172, 3),
(175, 173, 3),
(176, 174, 3),
(177, 175, 3),
(178, 176, 3),
(179, 177, 3),
(180, 178, 3),
(181, 179, 3),
(182, 180, 3),
(183, 181, 3),
(184, 182, 3),
(185, 183, 3),
(186, 184, 3),
(187, 185, 3),
(188, 186, 3),
(189, 187, 3),
(190, 188, 3),
(191, 189, 3),
(192, 190, 3),
(193, 191, 3),
(194, 192, 3),
(195, 193, 3),
(196, 194, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id_dosen`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `nip` (`nip`),
  ADD KEY `matkul_id` (`matkul_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `h_ujian`
--
ALTER TABLE `h_ujian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ujian_id` (`ujian_id`),
  ADD KEY `mahasiswa_id` (`mahasiswa_id`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `jurusan_matkul`
--
ALTER TABLE `jurusan_matkul`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jurusan_id` (`jurusan_id`),
  ADD KEY `matkul_id` (`matkul_id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `jurusan_id` (`jurusan_id`);

--
-- Indexes for table `kelas_dosen`
--
ALTER TABLE `kelas_dosen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas_id` (`kelas_id`),
  ADD KEY `dosen_id` (`dosen_id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`),
  ADD UNIQUE KEY `nim` (`nim`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `kelas_id` (`kelas_id`);

--
-- Indexes for table `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`id_matkul`);

--
-- Indexes for table `m_ujian`
--
ALTER TABLE `m_ujian`
  ADD PRIMARY KEY (`id_ujian`),
  ADD KEY `matkul_id` (`matkul_id`),
  ADD KEY `dosen_id` (`dosen_id`);

--
-- Indexes for table `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD PRIMARY KEY (`id_soal`),
  ADD KEY `matkul_id` (`matkul_id`),
  ADD KEY `dosen_id` (`dosen_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`),
  ADD UNIQUE KEY `uc_email` (`email`) USING BTREE;

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id_dosen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `h_ujian`
--
ALTER TABLE `h_ujian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jurusan_matkul`
--
ALTER TABLE `jurusan_matkul`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kelas_dosen`
--
ALTER TABLE `kelas_dosen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mahasiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `matkul`
--
ALTER TABLE `matkul`
  MODIFY `id_matkul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `m_ujian`
--
ALTER TABLE `m_ujian`
  MODIFY `id_ujian` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_soal`
--
ALTER TABLE `tb_soal`
  MODIFY `id_soal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`matkul_id`) REFERENCES `matkul` (`id_matkul`);

--
-- Constraints for table `h_ujian`
--
ALTER TABLE `h_ujian`
  ADD CONSTRAINT `h_ujian_ibfk_1` FOREIGN KEY (`ujian_id`) REFERENCES `m_ujian` (`id_ujian`),
  ADD CONSTRAINT `h_ujian_ibfk_2` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id_mahasiswa`);

--
-- Constraints for table `jurusan_matkul`
--
ALTER TABLE `jurusan_matkul`
  ADD CONSTRAINT `jurusan_matkul_ibfk_1` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusan` (`id_jurusan`),
  ADD CONSTRAINT `jurusan_matkul_ibfk_2` FOREIGN KEY (`matkul_id`) REFERENCES `matkul` (`id_matkul`);

--
-- Constraints for table `kelas_dosen`
--
ALTER TABLE `kelas_dosen`
  ADD CONSTRAINT `kelas_dosen_ibfk_1` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id_dosen`),
  ADD CONSTRAINT `kelas_dosen_ibfk_2` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id_kelas`);

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id_kelas`);

--
-- Constraints for table `m_ujian`
--
ALTER TABLE `m_ujian`
  ADD CONSTRAINT `m_ujian_ibfk_1` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id_dosen`),
  ADD CONSTRAINT `m_ujian_ibfk_2` FOREIGN KEY (`matkul_id`) REFERENCES `matkul` (`id_matkul`);

--
-- Constraints for table `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD CONSTRAINT `tb_soal_ibfk_1` FOREIGN KEY (`matkul_id`) REFERENCES `matkul` (`id_matkul`),
  ADD CONSTRAINT `tb_soal_ibfk_2` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id_dosen`);

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
