-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2024 at 09:09 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ultraschoolmanager`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_year`
--

CREATE TABLE `academic_year` (
  `id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `authers`
--

CREATE TABLE `authers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `authers`
--

INSERT INTO `authers` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'VINCENT OWONDO', '2023-01-22 05:32:28', '2023-01-22 05:32:28'),
(2, 'KLB', '2023-01-22 05:33:26', '2023-01-22 05:33:26'),
(3, 'DR PHYLLIS MWANGI', '2023-01-22 05:34:51', '2023-01-22 05:34:51'),
(4, 'AUSTIN BUKENYA', '2023-01-22 05:35:15', '2023-01-22 05:35:15'),
(5, 'DR.AGNES GATHUMBI', '2023-01-22 05:35:36', '2023-01-22 05:35:36'),
(6, 'MBAKA NJERU', '2023-01-22 05:36:52', '2023-01-22 05:36:52'),
(7, 'DAVID GLOVER', '2023-01-22 05:37:12', '2023-01-22 05:37:12'),
(8, 'NJOROGE', '2023-01-22 05:38:49', '2023-01-22 05:38:49'),
(9, 'J.KADASIA', '2023-01-22 05:39:03', '2023-01-22 05:39:03'),
(10, 'NANCY KARANJA', '2023-01-22 05:39:32', '2023-01-22 05:39:32'),
(11, 'J. ABROSE NASIO', '2023-01-22 05:40:34', '2023-01-22 05:40:34'),
(12, 'JOSEPH INDIRE', '2023-01-22 05:41:00', '2023-01-22 05:41:00'),
(13, 'ATIENO NDEDE-AMADI', '2023-01-22 05:41:37', '2023-01-22 05:41:37'),
(14, 'KEN WALIBORA', '2023-01-22 05:42:15', '2023-01-22 05:42:15'),
(15, 'H.KIMARO', '2023-01-22 05:43:08', '2023-01-22 05:43:08'),
(16, 'SAID A.MOHAMED', '2023-01-22 05:43:24', '2023-01-22 05:43:24'),
(17, 'GICHOHI WAIHIGA', '2023-01-22 05:43:42', '2023-01-22 05:43:42'),
(19, 'ALICE GUNYALI', '2023-01-22 05:44:32', '2023-01-22 05:44:32'),
(20, 'ELIZABETH ODERO', '2023-01-22 05:44:50', '2023-01-22 05:44:50'),
(21, 'KAMAU J.NJOGU', '2023-01-22 05:45:34', '2023-01-22 05:45:34'),
(22, 'R.S.MUSANGI', '2023-01-22 05:45:42', '2023-01-22 05:45:42'),
(23, 'P.NKURUNZIZA', '2023-01-22 05:45:55', '2023-01-22 05:45:55'),
(24, 'AGGREY NYANJOM', '2023-01-22 05:46:03', '2023-01-22 05:46:03'),
(25, 'DANIEL CHERUIYOT', '2023-01-22 05:46:16', '2023-01-22 05:46:16'),
(26, 'DR.LEONARD M.KISOVI', '2023-01-22 05:46:23', '2023-01-22 05:46:23'),
(27, 'FRED OMWOYO', '2023-01-22 05:46:37', '2023-01-22 05:46:37'),
(28, 'WANJIRA KAMAU', '2023-01-22 05:46:43', '2023-01-22 05:46:43'),
(29, 'LINNET KHABONGO', '2023-01-22 05:46:58', '2023-01-22 05:46:58'),
(30, 'PAUL KIBUUKA', '2023-01-22 05:47:04', '2023-01-22 05:47:04'),
(31, 'TIMOTHY MANDILA', '2023-01-22 05:47:15', '2023-01-22 05:47:15'),
(32, 'JACINTA KAPIYO', '2023-01-22 05:47:22', '2023-01-22 05:47:22'),
(33, 'JULIUS MAKONG\'O', '2023-01-22 05:47:40', '2023-01-22 05:47:40'),
(34, 'PRISCILLA KIVUITU', '2023-01-22 05:47:45', '2023-01-22 05:47:45'),
(35, 'DR FLORENCE KISIRIKOI', '2023-01-22 05:47:59', '2023-01-22 05:47:59'),
(36, 'ANGELINA KIOKO', '2023-01-22 05:48:57', '2023-01-22 05:48:57'),
(37, 'EUNICE KIMALIRO', '2023-01-22 05:49:13', '2023-01-22 05:49:13'),
(38, 'SIMON KANG\'ETHE', '2023-01-22 05:49:46', '2023-01-22 05:49:46'),
(39, 'A MCLeish Smith', '2023-01-22 05:50:50', '2023-01-22 05:50:50'),
(40, 'MALKIAT SINGH', '2023-01-22 05:51:00', '2023-01-22 05:51:00'),
(41, 'J K MUSINGI', '2023-01-22 05:51:20', '2023-01-22 05:51:20'),
(42, 'FERDINANDA GACHANG\'I', '2023-01-22 05:51:42', '2023-01-22 05:51:42'),
(43, 'GEORGE NGARUIYA', '2023-01-22 05:53:26', '2023-01-22 05:53:26'),
(44, 'C.KARIUKI', '2023-01-22 05:54:13', '2023-01-22 05:54:13'),
(45, 'G. WAIHIGA', '2023-01-22 05:55:09', '2023-01-22 05:55:09'),
(46, 'SHIPHRAH N. GICHAGA', '2023-01-22 05:55:34', '2023-01-22 05:55:34'),
(47, 'RUTH M.KERRE', '2023-01-22 05:55:35', '2023-01-22 05:55:35'),
(48, 'RICHARD WAKOLI', '2023-01-22 05:56:03', '2023-01-22 05:56:03'),
(49, 'FRANCIS WAITITU', '2023-01-22 05:56:23', '2023-01-22 05:56:23'),
(50, 'RUTH A OYOKO', '2023-01-22 05:56:45', '2023-01-22 05:56:45'),
(51, 'LINA SEQUEIRA', '2023-01-22 05:57:07', '2023-01-22 05:57:07'),
(52, 'JACINTA AKATSA', '2023-01-22 05:57:18', '2023-01-22 05:57:18'),
(53, 'FELIX KIRUTHU', '2023-01-22 05:57:38', '2023-01-22 05:57:38'),
(54, 'JACINTA ANYANGO KAPIYO', '2023-01-22 05:58:18', '2023-01-22 05:58:18'),
(55, 'DR MUENI KIIO', '2023-01-22 05:58:21', '2023-01-22 05:58:21'),
(56, 'ALKIAT SINOH', '2023-01-22 05:58:44', '2023-01-22 05:58:44'),
(57, 'PETER WANYANDE', '2023-01-22 05:58:50', '2023-01-22 05:58:50'),
(58, 'N.M.PATEL', '2023-01-22 05:59:24', '2023-01-22 05:59:24'),
(59, 'PROF HENRY INDANGASI', '2023-01-22 06:00:03', '2023-01-22 06:00:03'),
(60, 'MR.CHARLES GECAGA', '2023-01-22 06:00:12', '2023-01-22 06:00:12'),
(61, 'LILIAN VIKIRU', '2023-01-22 06:00:29', '2023-01-22 06:00:29'),
(62, 'AGNES GATHUMBI', '2023-01-22 06:00:40', '2023-01-22 06:00:40'),
(63, 'BENSON ODUOR', '2023-01-22 06:00:51', '2023-01-22 06:00:51'),
(64, 'GEORGE OWICH', '2023-01-22 06:01:07', '2023-01-22 06:01:07'),
(66, 'K.W. WAMITILA', '2023-01-22 06:01:40', '2023-01-22 06:01:40'),
(67, 'ASWANI BULIBA', '2023-01-22 06:01:56', '2023-01-22 06:01:56'),
(68, 'MAINA GEOFFREY', '2023-01-22 06:02:05', '2023-01-22 06:02:05'),
(69, 'JOSEPH O.INDIRE', '2023-01-22 06:02:38', '2023-01-22 06:02:38'),
(70, 'MICHAEL K. NYAGA', '2023-01-22 06:02:56', '2023-01-22 06:02:56'),
(71, 'JAMES NYAN', '2023-01-22 06:03:04', '2023-01-22 06:03:04'),
(72, 'RUBAREMA RWABUTOGA', '2023-01-22 06:03:19', '2023-01-22 06:03:19'),
(73, 'ROBERT KARUGGAH', '2023-01-22 06:03:35', '2023-01-22 06:03:35'),
(74, 'JULIE G MANJI', '2023-01-22 06:04:51', '2023-01-22 06:04:51'),
(75, 'HENRY INDANGASI', '2023-01-22 06:05:10', '2023-01-22 06:05:10'),
(76, 'ALICE KIAI', '2023-01-22 06:05:27', '2023-01-22 06:05:27'),
(77, 'GLADYS B. OKUMU', '2023-01-22 06:05:48', '2023-01-22 06:05:48'),
(78, 'BONIFACE MUSYOKA MUITHI', '2023-01-22 06:06:15', '2023-01-22 06:06:15'),
(79, 'WINFRED WILLIAMS', '2023-01-22 06:06:26', '2023-01-22 06:06:26'),
(80, 'CYPRIAN NKONDI', '2023-01-22 06:06:39', '2023-01-22 06:06:39'),
(81, 'JAMES NYAM', '2023-01-22 06:07:12', '2023-01-22 06:07:12'),
(82, 'KINYUA MUGO', '2023-01-22 10:14:03', '2023-01-22 10:14:03'),
(83, 'EPHALINA MAINA', '2023-01-22 10:36:45', '2023-01-22 10:36:45'),
(84, 'JULIAN WILD', '2023-01-22 10:45:15', '2023-01-22 10:45:15'),
(85, 'AMOS OBONYO', '2023-01-22 11:09:30', '2023-01-22 11:09:30'),
(86, 'DR RUTH NDUNG\'U', '2023-01-22 11:13:53', '2023-01-22 11:13:53'),
(87, 'LILLIAN VIKURU', '2023-01-22 11:14:14', '2023-01-22 11:14:14'),
(88, 'STEPHEN WAMBUGU', '2023-01-22 11:23:09', '2023-01-22 11:23:09'),
(89, 'STELLA MUGURE RIMBERIA', '2023-01-23 09:04:38', '2023-01-23 09:04:38'),
(90, 'TIMOTHY M. AREGE', '2023-01-25 09:53:23', '2023-01-25 09:53:23'),
(91, 'STEPHEN MBURU AND GEOFFREY CHEMWA', '2023-01-27 08:22:40', '2023-01-27 08:22:40'),
(92, 'ELIZABETH ONDERO,AMOS OBONYO $ RICAHRD WAKOLI', '2023-01-31 03:41:54', '2023-01-31 03:41:54'),
(93, 'ALICE KIAI,BENSON ODUOR & EMILLY OWUOR', '2023-01-31 03:51:43', '2023-01-31 03:51:43'),
(94, 'CYPRIAN OWITI, AGGREY ODUOR &JENNIFER OWANDE', '2023-01-31 03:54:45', '2023-01-31 03:54:45'),
(95, 'FRED OMWOYO & PHYLLIS AKIVANGA', '2023-01-31 03:57:47', '2023-01-31 03:57:47'),
(96, 'ASSUMPTA K. MATEI', '2023-01-31 04:00:29', '2023-01-31 04:00:29'),
(97, 'CHRIS WANJALA', '2023-01-31 04:01:35', '2023-01-31 04:01:35'),
(98, 'VER0NICA N. MUTISO', '2023-01-31 04:04:37', '2023-01-31 04:04:37'),
(99, 'KAZUO ISHIGURO', '2023-01-31 04:05:58', '2023-01-31 04:05:58'),
(100, 'GODWIN SIUNDU', '2023-01-31 04:07:51', '2023-01-31 04:07:51'),
(102, 'EMILIA LIEVA & WAVENEY OLEMBO', '2023-01-31 04:13:09', '2023-01-31 04:13:09'),
(103, 'P.M MUCHIRI', '2023-01-31 04:15:52', '2023-01-31 04:15:52'),
(104, 'JACINTA AKATSA & NORMAN NJOROGE', '2023-01-31 04:18:07', '2023-01-31 04:18:07'),
(105, 'C. KARIUKI & K. BALARAMAN', '2023-01-31 04:19:31', '2023-01-31 04:19:31'),
(106, 'GEORGE OWICH, JOYCE KIMAITA & KATHLEEN WARAMBO', '2023-01-31 04:26:34', '2023-01-31 04:26:34'),
(107, 'FERDINANDA GACHAG\'I', '2023-01-31 04:31:38', '2023-01-31 04:31:38'),
(108, 'TIMOTHY MANDILA & JAKANYAKWAKA DINDA', '2023-01-31 04:32:56', '2023-01-31 04:32:56'),
(109, 'JAMES NYAN & K.M MUGIRIA', '2023-01-31 04:41:19', '2023-01-31 04:41:19'),
(110, 'JAMES NYAM, DORIS NGUGU & OTHERS', '2023-01-31 04:50:05', '2023-01-31 04:50:05'),
(111, 'CYPRIAN OWITI,AGGREY ODUOR & JENNIFER OWANDE', '2023-01-31 05:02:41', '2023-01-31 05:02:41'),
(112, 'RABECCA OLADIPO', '2023-01-31 05:05:01', '2023-01-31 05:05:01'),
(113, 'R.B BUNNETT', '2023-01-31 05:06:37', '2023-01-31 05:06:37'),
(114, 'OKOT', '2023-01-31 05:07:19', '2023-01-31 05:07:19'),
(115, 'JEFF MANDILA', '2023-01-31 05:08:07', '2023-01-31 05:08:07'),
(116, 'AYEBIA CLARKE', '2023-01-31 05:09:20', '2023-01-31 05:09:20'),
(117, 'ROBERT LOUIS STEVENSON', '2023-01-31 05:10:34', '2023-01-31 05:10:34'),
(118, 'PASOMI MUCHA', '2023-01-31 05:22:22', '2023-01-31 05:22:22'),
(119, 'JOHN KIRIAMITI', '2023-01-31 05:22:42', '2023-01-31 05:22:42'),
(120, 'CHINUA ACHEBE', '2023-01-31 05:23:01', '2023-01-31 05:23:01'),
(121, 'HENRIK IBSEN', '2023-01-31 05:23:25', '2023-01-31 05:23:25'),
(122, 'MARJORIE OLUDHE MACGOYE', '2023-01-31 05:23:52', '2023-01-31 05:23:52'),
(123, 'DAVID MULWA', '2023-01-31 05:29:16', '2023-01-31 05:29:16'),
(124, 'THADDEUS M. MBALUKA', '2023-01-31 05:30:39', '2023-01-31 05:30:39'),
(125, 'RL STEVENSON', '2023-01-31 05:31:58', '2023-01-31 05:31:58'),
(126, 'J.L MUSINGI & DR. LEONARD KISOVI', '2023-01-31 06:48:58', '2023-01-31 06:48:58'),
(127, 'GLOBAL LINK', '2023-01-31 06:51:53', '2023-01-31 06:54:58'),
(128, 'NJOKI GITUMBI AND NYAMBURA NJUGUNA', '2023-01-31 06:53:33', '2023-01-31 06:55:09'),
(129, 'PYRAMID', '2023-01-31 06:56:29', '2023-01-31 06:56:29'),
(130, 'ANGELINA KIOKO AND MAGARET JEPKIRUI', '2023-01-31 06:58:13', '2023-01-31 06:58:13'),
(131, 'ANDREW SCOTLAND', '2023-01-31 06:59:22', '2023-01-31 06:59:22'),
(132, 'KATAMA MKANGI', '2023-01-31 07:00:48', '2023-01-31 07:00:48'),
(133, 'PETER WAWERU', '2023-01-31 07:02:49', '2023-01-31 07:02:49'),
(134, 'HOLT, RINEHART AND WINSTON', '2023-01-31 07:04:02', '2023-01-31 07:04:02'),
(135, 'COLLINS SWATRIDGE', '2023-01-31 07:04:40', '2023-01-31 07:04:40'),
(136, 'H.R OLE KULET', '2023-01-31 07:05:14', '2023-01-31 07:05:14'),
(137, 'ROBERT GICHIRA', '2023-01-31 07:05:59', '2023-01-31 07:05:59'),
(138, 'KNEC', '2023-01-31 07:07:25', '2023-01-31 07:07:25'),
(139, 'TOP GRADE PUBLISHERS LTD', '2023-01-31 07:08:25', '2023-01-31 07:08:25'),
(140, 'BETH M KERUBO', '2023-01-31 07:09:10', '2023-01-31 07:09:10'),
(141, 'DR RUTH NDUNGU, LAWRENCE NJOROGE & PURITY KIAMBI', '2023-01-31 07:11:26', '2023-01-31 07:11:26'),
(142, 'MARIAMA', '2023-01-31 07:13:32', '2023-01-31 07:13:32'),
(143, 'RHODIAN MANN', '2023-01-31 07:15:15', '2023-01-31 07:15:15'),
(144, 'BEN MKOTA', '2023-01-31 07:17:46', '2023-01-31 07:17:46'),
(145, 'ATIENO NDEDE', '2023-01-31 07:19:30', '2023-01-31 07:19:30'),
(146, 'KUCCPS', '2023-01-31 07:20:50', '2023-01-31 07:20:50'),
(147, 'AIC KENYA', '2023-01-31 07:21:02', '2023-01-31 07:21:02'),
(148, 'MALATA O.J BENSON(MALIMU)', '2023-01-31 07:28:59', '2023-01-31 07:28:59'),
(149, 'ALKIAT SINO', '2023-01-31 07:50:12', '2023-01-31 07:50:12'),
(150, 'ALAMIN MAZRUI', '2023-01-31 07:54:33', '2023-01-31 07:54:33'),
(151, 'JOHN RUGANDA', '2023-01-31 07:54:51', '2023-01-31 07:54:51'),
(152, 'EDWIN NYUTHO', '2023-01-31 07:55:06', '2023-01-31 07:55:06'),
(153, 'GEORGE NGABUIYA, JOAN KIMARU,PAUL MBURU', '2023-01-31 09:35:08', '2023-01-31 09:35:08'),
(154, 'SK. VASHISTA', '2023-01-31 09:37:45', '2023-01-31 09:37:45'),
(155, 'ALAN FRASER', '2023-01-31 09:43:05', '2023-01-31 09:43:05'),
(156, 'FESTUS BERU', '2023-01-31 09:45:54', '2023-01-31 09:45:54'),
(157, 'WEBSTAR', '2023-01-31 09:48:17', '2023-01-31 09:48:54'),
(158, 'BW .MADDO', '2023-01-31 09:50:40', '2023-01-31 09:50:40'),
(159, 'HELLEN MWOLOLO AND OTHERS', '2023-01-31 09:52:12', '2023-01-31 09:52:12'),
(160, 'WINFRED KASYOKA ,RUGURI KIHARIE AND OTHERS', '2023-01-31 09:52:48', '2023-01-31 09:52:48'),
(161, 'MALOWAMALOWA ,HELLEN MWOLOLO AND OTHERS', '2023-01-31 09:53:20', '2023-01-31 09:53:20'),
(162, 'BONIFCE KASYOKA MUITHI', '2023-01-31 09:55:51', '2023-01-31 09:55:51'),
(163, 'OBARA CLEMENT AND KAGENYI DANIEL', '2023-01-31 10:10:01', '2023-01-31 10:10:01'),
(164, 'OBARA CLEMENT AND KAGENYI DANIEL', '2023-01-31 10:10:01', '2023-01-31 10:10:01'),
(165, 'STEPHEN MBURU', '2023-01-31 10:12:07', '2023-01-31 10:12:07'),
(166, 'RIYAZ BACHANI', '2023-01-31 10:12:54', '2023-01-31 10:12:54'),
(167, 'W.L. RADFORD', '2023-01-31 10:15:14', '2023-01-31 10:15:14'),
(168, 'FRANCIS IMBUGA', '2023-01-31 10:18:30', '2023-01-31 10:18:30'),
(169, 'J.M.WAITHAKA', '2023-02-03 07:53:18', '2023-02-03 07:53:18'),
(170, 'RHODIA MANN', '2023-02-06 04:58:58', '2023-02-06 04:58:58'),
(171, 'IAN MACKENZIE-VINCENT', '2023-02-16 01:29:12', '2023-02-16 01:29:12'),
(172, 'JUDIE ORON', '2023-02-16 03:14:03', '2023-02-16 03:14:03'),
(173, 'MASINDE KUSIMBA', '2023-02-16 03:15:31', '2023-02-16 03:15:31'),
(174, 'KITHAKA WA MBERIA', '2023-02-16 03:18:22', '2023-02-16 03:18:22'),
(175, 'PATRICK MWANIA', '2023-02-17 03:07:31', '2023-02-17 03:07:31'),
(176, 'PAUL B. VITTA', '2023-02-27 03:46:18', '2023-02-27 03:46:18'),
(177, 'PYRAMID CONSULTANTS', '2023-02-28 03:26:41', '2023-02-28 03:26:41'),
(178, 'R L STEVENSON', '2023-03-13 02:59:21', '2023-03-13 02:59:21'),
(179, 'JUSTUS ABUKA AND OTHERS', '2023-03-13 05:24:57', '2023-03-13 05:24:57'),
(180, 'OLIVER MINISHI AND OTHERS', '2023-03-13 05:25:31', '2023-03-13 05:25:31'),
(181, 'HANNAH MUNYAGA & DANIEL NJOROGE', '2023-03-13 05:35:52', '2023-03-13 05:35:52'),
(183, 'NJOKI GATHUMBI & NYAMBURA NJUGUNA', '2023-03-15 03:16:15', '2023-03-15 03:16:15'),
(184, 'NJOKI GATHUMBI & MARK M. CHETAMBE', '2023-03-15 03:20:31', '2023-03-15 03:20:31'),
(185, 'JOSEPH NDIRANGU', '2023-03-15 03:29:46', '2023-03-15 03:29:46'),
(186, 'SIMON MUTALI CHESEBE NA DAVID MBUGUA', '2023-03-15 03:36:12', '2023-03-15 03:36:12'),
(187, 'MOSES OTIENO,JOYCE N. NANDI NA GRACE OGOYE', '2023-03-15 03:39:57', '2023-03-15 03:39:57'),
(188, 'SIMON MUTALI CHESEBE', '2023-03-15 03:43:18', '2023-03-15 03:43:18'),
(189, 'SIMON MUTALI CHESEBE,PROF. EVANS MBUTHIA NA TOMKINS BARASA', '2023-03-15 03:47:14', '2023-03-15 03:47:14'),
(190, 'EDWIN A. OMBASA NA GEORGE N. KARIUKI', '2023-03-15 04:19:29', '2023-03-15 04:19:29'),
(191, 'SIMON NGIGE', '2023-03-15 04:27:27', '2023-03-15 04:27:27'),
(192, 'SHEHE MUTWIRI', '2023-03-16 05:10:28', '2023-03-16 05:10:28'),
(193, 'DAVID COBB', '2023-03-24 06:53:10', '2023-03-24 06:53:10'),
(194, 'JOHN STEINBECK', '2023-03-24 07:14:22', '2023-03-24 07:14:22'),
(195, 'KENYAN SCHOOLS', '2023-03-29 00:40:16', '2023-03-29 00:40:16'),
(196, 'D.W. LUTOMIA NA PHIBBIAN MUTHAMA', '2023-03-29 06:49:05', '2023-03-29 06:49:05'),
(197, 'D.N.McMaster', '2023-04-03 06:46:45', '2023-04-03 06:46:45'),
(198, 'KEN WALIBORA NA SAID A. MOHAMED', '2023-05-23 05:11:38', '2023-05-23 05:11:38'),
(199, 'JOHN LARA', '2023-05-29 07:54:22', '2023-05-29 07:54:22'),
(200, 'ABEL H. ARAMA', '2023-06-05 04:51:42', '2023-06-05 04:51:42'),
(201, 'ALIFA CHOKOCHO NA DUMU KAYANDA', '2023-06-06 07:16:06', '2023-06-06 07:16:06'),
(202, 'ZACHARIAH M. ZANI', '2023-06-09 01:09:15', '2023-06-09 01:09:15'),
(203, 'PAULINE KEA', '2023-06-12 04:17:20', '2023-06-12 04:17:20'),
(204, 'PROF.GEORGE ESHIWANI', '2023-06-13 01:45:05', '2023-06-13 01:45:05'),
(205, 'M.YIGA-MATOVU', '2023-06-13 02:54:00', '2023-06-13 02:54:00'),
(206, 'PAT WAMBUI NGURUKIE', '2023-06-16 05:26:54', '2023-06-16 05:26:54'),
(207, 'J.W.HILL', '2023-07-10 03:00:46', '2023-07-10 03:00:46'),
(208, 'A.ATKINSON', '2023-07-10 03:07:49', '2023-07-10 03:07:49'),
(209, 'GICHUKI W. GEOFFREY', '2023-08-04 01:50:37', '2023-08-04 01:50:37'),
(210, 'MEJA MWANGI', '2023-09-06 23:43:03', '2023-09-06 23:43:03'),
(211, 'ADIPO SIDANG\'', '2023-09-08 01:44:50', '2023-09-08 01:44:50'),
(212, 'CLUSTER EXAMS DPT', '2023-09-18 02:56:54', '2023-09-18 02:56:54'),
(213, 'CLARA MOMANYI', '2023-09-20 07:25:44', '2023-09-20 07:25:44'),
(214, 'JONATHAN KARIARA', '2023-10-02 06:28:48', '2023-10-02 06:28:48'),
(215, 'ABUKA JUSTUS', '2023-10-09 01:40:35', '2023-10-09 01:40:35'),
(216, 'WAMBUA WA KAWIVE', '2023-10-09 06:35:11', '2023-10-09 06:35:11'),
(217, 'GRACE AKINYI', '2024-01-15 00:03:00', '2024-01-15 00:03:00'),
(218, 'LYDIAH MIRIE', '2024-01-15 00:06:10', '2024-01-15 00:06:10'),
(219, 'ROSALIND W. KARIUKI', '2024-01-15 00:07:59', '2024-01-15 00:07:59'),
(220, 'EDWIN OKOTH OGADA', '2024-01-15 00:08:19', '2024-01-15 00:08:19'),
(221, 'SAMMY KIHARA & BETH MBITHI', '2024-01-15 05:05:37', '2024-01-15 05:05:37'),
(222, 'JOSEPHINE N. M. WANGILA', '2024-01-15 05:17:39', '2024-01-15 05:17:39'),
(223, 'ELIJAH M. MULI', '2024-01-16 06:21:53', '2024-01-16 06:21:53'),
(224, 'MUTALI CHESEBE', '2024-02-19 23:57:55', '2024-02-19 23:57:55'),
(225, 'GEORGE ORWELL', '2024-03-15 07:00:25', '2024-03-15 07:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `rack_no` int(11) DEFAULT NULL,
  `pages` int(11) DEFAULT NULL,
  `cost` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `auther_id` bigint(20) UNSIGNED DEFAULT NULL,
  `publisher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Y',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `isbn`, `number`, `rack_no`, `pages`, `cost`, `subject_id`, `auther_id`, `publisher_id`, `status`, `created_at`, `updated_at`) VALUES
(68393, 'SECONDARY ENGLISH BK1', '9789966651464', '1ENG244/2019', NULL, NULL, '0', 3, 3, 1, 'N', NULL, '2024-08-21 03:58:46'),
(68394, 'EXCELLING IN ENGLISH BK1', '9789966446541', '1ENG12/09', NULL, NULL, NULL, 3, 3, NULL, 'N', NULL, '2024-08-21 03:59:58'),
(68395, 'EXCELLING IN ENGLISH BK1', '9789966446541', '1ENG29/16', NULL, NULL, NULL, 3, 3, NULL, 'N', NULL, '2024-08-21 04:01:42'),
(68396, 'EXCELLING IN ENGLISH BK1', '9789966446541', '1ENG37/16', NULL, NULL, NULL, 3, 3, NULL, 'N', NULL, '2024-08-21 04:01:53'),
(68397, 'EXCELLING IN ENGLISH BK1', '9789966446541', '1ENG41/16', NULL, NULL, NULL, 3, 3, NULL, 'N', NULL, '2024-08-21 04:02:23'),
(68398, 'EXCELLING IN ENGLISH BK1', '9789966446541', '1ENG25/16', NULL, NULL, NULL, 3, 3, NULL, 'N', NULL, '2024-08-21 04:02:13'),
(68399, 'EXCELLING IN ENGLISH BK1', '9789966446541', '1ENG12/16', NULL, NULL, NULL, 3, 3, NULL, 'Y', NULL, '2024-08-21 07:03:00'),
(68400, 'EXCELLING IN ENGLISH BK1', '9789966446541', '1ENG32/16', NULL, NULL, NULL, 3, 3, NULL, 'N', NULL, '2024-08-21 07:12:06'),
(68401, 'EXCELLING IN ENGLISH BK1', '9789966446541', '1ENG19/16', NULL, NULL, NULL, 3, 3, NULL, 'Y', NULL, NULL),
(68402, 'EXCELLING IN ENGLISH BK1', '9789966446541', '1ENG357/18', NULL, NULL, NULL, 3, 3, NULL, 'Y', NULL, NULL),
(68403, 'EXCELLING IN ENGLISH BK1', '9789966446541', '1ENG20/016', NULL, NULL, NULL, 3, 3, NULL, 'Y', NULL, NULL),
(68404, 'HEAD START SECONDARY ENGLISH BK1', '9780195742343', '1ENG13/16', NULL, NULL, NULL, 3, 4, NULL, 'Y', NULL, NULL),
(68405, 'HEAD START SECONDARY ENGLISH BK1', '9780195742343', '1ENG29/016', NULL, NULL, NULL, 3, 4, NULL, 'Y', NULL, '2023-10-23 06:30:24'),
(68406, 'HEAD START SECONDARY ENGLISH BK1', '9780195742343', '1ENG15/016', NULL, NULL, NULL, 3, 4, NULL, 'Y', NULL, '2023-06-14 06:51:03'),
(68407, 'HEAD START SECONDARY ENGLISH BK1', '9780195742343', '1ENG08/16', NULL, NULL, NULL, 3, 4, NULL, 'Y', NULL, '2023-07-26 07:00:19'),
(68408, 'HEAD START SECONDARY ENGLISH BK1', '9780195742343', '1ENG21/16', NULL, NULL, NULL, 3, 4, NULL, 'Y', NULL, '2023-09-07 07:49:49'),
(68409, 'HEAD START SECONDARY ENGLISH BK1', '9780195742343', '1ENG06/16', NULL, NULL, NULL, 3, 4, NULL, 'Y', NULL, NULL),
(68410, 'HEAD START SECONDARY ENGLISH BK1', '9780195742343', '1ENG14/18', NULL, NULL, NULL, 3, 4, NULL, 'N', NULL, '2023-06-08 23:31:42'),
(68411, 'HEAD START SECONDARY ENGLISH BK1', '9780195742343', '1ENG19/016', NULL, NULL, NULL, 3, 4, NULL, 'Y', NULL, NULL),
(68412, 'HEAD START SECONDARY ENGLISH BK1', '9780195742343', '1ENG03/16', NULL, NULL, NULL, 3, 4, NULL, 'Y', NULL, NULL),
(68413, 'HEAD START SECONDARY ENGLISH BK1', '9780195742343', '1ENG22/016', NULL, NULL, NULL, 3, 4, NULL, 'Y', NULL, NULL),
(68414, 'HEAD START SECONDARY ENGLISH BK1', '9780195742343', '1ENG26/16', NULL, NULL, NULL, 3, 4, NULL, 'N', NULL, '2023-06-08 23:24:10'),
(68415, 'HEAD START SECONDARY ENGLISH BK1', '9780195742343', '1ENG31/16', NULL, NULL, NULL, 3, 4, NULL, 'N', NULL, '2023-06-07 07:14:12'),
(68416, 'HEAD START SECONDARY ENGLISH BK1', '9780195742343', '1ENG12/016', NULL, NULL, NULL, 3, 4, NULL, 'Y', NULL, NULL),
(68417, 'HEAD START SECONDARY ENGLISH BK1', '9780195742343', '1ENG35/16', NULL, NULL, NULL, 3, 4, NULL, 'Y', NULL, NULL),
(68418, 'HEAD START SECONDARY ENGLISH BK1', '9780195742343', '1ENG16/016', NULL, NULL, NULL, 3, 4, NULL, 'Y', NULL, NULL),
(68419, 'HEAD START SECONDARY ENGLISH BK1', '9780195742343', '1ENG10/16', NULL, NULL, NULL, 3, 4, NULL, 'N', NULL, '2023-06-08 23:42:50'),
(68420, 'HEAD START SECONDARY ENGLISH BK1', '9780195742343', '1ENG25/016', NULL, NULL, NULL, 3, 4, NULL, 'Y', NULL, '2023-10-23 04:12:56'),
(68421, 'HEAD START SECONDARY ENGLISH BK1', '9780195742343', '1ENG11/16', NULL, NULL, NULL, 3, 4, NULL, 'Y', NULL, NULL),
(68422, 'HEAD START SECONDARY ENGLISH BK1', '9780195742343', '1ENG18/16', NULL, NULL, NULL, 3, 4, NULL, 'Y', NULL, '2024-01-09 23:15:00'),
(68423, 'HEAD START SECONDARY ENGLISH BK1', '9780195742343', '1ENG32/016', NULL, NULL, NULL, 3, 4, NULL, 'Y', NULL, '2024-01-22 06:11:59'),
(68424, 'HEAD START SECONDARY ENGLISH BK1', '9780195742343', '1ENG33/16', NULL, NULL, NULL, 3, 4, NULL, 'Y', NULL, NULL),
(68425, 'HEAD START SECONDARY ENGLISH BK1', '9780195742343', '1ENG23/16', NULL, NULL, NULL, 3, 4, NULL, 'Y', NULL, '2023-10-23 03:53:32'),
(68426, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG04/13', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, NULL),
(68427, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG13/05', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, '2024-01-17 05:44:04'),
(68428, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG07/2003', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, '2023-06-22 07:12:18'),
(68429, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG11/05', NULL, NULL, NULL, 3, 5, NULL, 'N', NULL, '2023-06-02 05:41:38'),
(68430, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG08/03', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, '2023-10-06 06:08:33'),
(68431, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG06/13', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, NULL),
(68432, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG09/2003', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, '2023-10-23 03:52:07'),
(68433, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG33/05', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, NULL),
(68434, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG30/13', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, NULL),
(68435, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG22/05', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, '2023-06-22 07:14:40'),
(68436, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG69/2003', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, '2023-08-08 00:30:45'),
(68437, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG01/016', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, '2024-01-19 06:23:53'),
(68438, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG6/18', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, '2023-05-26 05:25:31'),
(68439, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG014/03', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, NULL),
(68440, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG28/13', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, NULL),
(68441, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG03/08', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, NULL),
(68442, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG14/13', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, '2023-10-23 03:38:00'),
(68443, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG54/2003', NULL, NULL, NULL, 3, 5, NULL, 'N', NULL, '2023-06-02 04:56:22'),
(68444, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG02/06', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, NULL),
(68445, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG56/03', NULL, NULL, NULL, 3, 5, NULL, 'N', NULL, '2023-06-02 06:21:33'),
(68446, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG27/03', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, '2023-10-24 00:50:06'),
(68447, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG004/09', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, '2023-10-23 03:48:47'),
(68448, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG24/13', NULL, NULL, NULL, 3, 5, NULL, 'N', NULL, '2023-06-02 00:33:20'),
(68449, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG18/13', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, NULL),
(68450, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG002/06', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, '2023-10-23 03:56:31'),
(68451, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG01/2004', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, NULL),
(68452, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG29/13', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, '2023-10-24 02:24:22'),
(68453, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG16/13', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, '2024-01-18 01:51:03'),
(68454, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG14/17', NULL, NULL, NULL, 3, 5, NULL, 'N', NULL, '2023-06-02 02:53:31'),
(68455, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG27/13', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, '2023-10-23 03:43:32'),
(68456, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG001/10', NULL, NULL, NULL, 3, 5, NULL, 'Y', NULL, '2023-10-23 04:18:24'),
(68457, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG26/13', NULL, NULL, NULL, 3, 5, NULL, 'N', NULL, '2023-06-02 04:52:44'),
(68458, 'NEW INTEGRATED ENGLISH BK1', '9789966222442', '1ENG26/06', NULL, NULL, NULL, 3, 5, NULL, 'N', NULL, '2023-06-02 04:49:38');

-- --------------------------------------------------------

--
-- Table structure for table `book_issues`
--

CREATE TABLE `book_issues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `issue_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `return_date` timestamp NULL DEFAULT NULL,
  `issue_status` varchar(255) DEFAULT NULL,
  `return_days_limit` int(15) DEFAULT NULL,
  `daily_fine` int(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_issues`
--

INSERT INTO `book_issues` (`id`, `student_id`, `book_id`, `issue_date`, `return_date`, `issue_status`, `return_days_limit`, `daily_fine`, `created_at`, `updated_at`) VALUES
(8, 10, 68400, '2024-08-20 21:00:00', '2024-08-27 21:00:00', 'N', 40, 40, '2024-08-21 07:12:06', '2024-08-21 07:12:06');

-- --------------------------------------------------------

--
-- Table structure for table `book_issue_histories`
--

CREATE TABLE `book_issue_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `issue_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `return_date` timestamp NULL DEFAULT NULL,
  `issue_status` varchar(255) DEFAULT NULL,
  `return_day` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_issue_histories`
--

INSERT INTO `book_issue_histories` (`id`, `student_id`, `book_id`, `issue_date`, `return_date`, `issue_status`, `return_day`, `created_at`, `updated_at`) VALUES
(1, 10, 68399, '2024-08-20 21:00:00', '2024-08-27 21:00:00', 'Null', NULL, '2024-08-21 04:41:47', '2024-08-21 04:41:47'),
(2, 10, 68399, '2024-08-20 21:00:00', '2024-08-27 21:00:00', 'Null', NULL, '2024-08-21 06:50:51', '2024-08-21 06:50:51'),
(3, 10, 68399, '2024-08-20 21:00:00', '2024-08-27 21:00:00', 'Null', NULL, '2024-08-21 06:53:14', '2024-08-21 06:53:14'),
(4, 10, 68400, '2024-08-20 21:00:00', '2024-08-27 21:00:00', 'Null', NULL, '2024-08-21 06:54:38', '2024-08-21 06:54:38'),
(5, 10, 68400, '2024-08-20 21:00:00', '2024-08-27 21:00:00', 'Null', NULL, '2024-08-21 06:58:15', '2024-08-21 06:58:15'),
(6, 10, 68399, '2024-08-20 21:00:00', '2024-08-27 21:00:00', 'Null', NULL, '2024-08-21 06:59:10', '2024-08-21 06:59:10'),
(7, 10, 68399, '2024-08-20 21:00:00', '2024-08-27 21:00:00', 'Null', NULL, '2024-08-21 07:00:51', '2024-08-21 07:00:51'),
(8, 10, 68400, '2024-08-20 21:00:00', '2024-08-27 21:00:00', 'Null', NULL, '2024-08-21 07:12:06', '2024-08-21 07:12:06');

-- --------------------------------------------------------

--
-- Table structure for table `book_issue_staffs`
--

CREATE TABLE `book_issue_staffs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `staff_id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `issue_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `return_date` timestamp NULL DEFAULT NULL,
  `issue_status` varchar(255) DEFAULT NULL,
  `return_day` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:15:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:13:\"view students\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:3;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:15:\"manage students\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:16:\"view instructors\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:18:\"manage instructors\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:12:\"view finance\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:4;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:14:\"manage finance\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:4;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:12:\"view library\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:5;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:14:\"manage library\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:5;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:12:\"view parents\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:14:\"manage parents\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:16:\"view own profile\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:6:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:5;i:5;i:6;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:16:\"edit own profile\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:6;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:14:\"manage grading\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:3;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:12:\"view grading\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:3;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:13:\"manage orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:6:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:5:\"admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:3;s:1:\"b\";s:10:\"instructor\";s:1:\"c\";s:3:\"web\";}i:2;a:3:{s:1:\"a\";i:4;s:1:\"b\";s:7:\"finance\";s:1:\"c\";s:3:\"web\";}i:3;a:3:{s:1:\"a\";i:5;s:1:\"b\";s:7:\"library\";s:1:\"c\";s:3:\"web\";}i:4;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:7:\"student\";s:1:\"c\";s:3:\"web\";}i:5;a:3:{s:1:\"a\";i:6;s:1:\"b\";s:8:\"guardian\";s:1:\"c\";s:3:\"web\";}}}', 1727503460);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `level` varchar(50) NOT NULL,
  `stream` varchar(50) NOT NULL,
  `class_teacher` varchar(100) DEFAULT NULL,
  `year` int(11) NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `level_id` int(6) NOT NULL,
  `exam_term_id` int(6) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `name`, `term_id`, `level_id`, `exam_term_id`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 'Opening Exam Term 1 - Class 1', 2, 1, 1, '2024-01-15', '2024-01-17', '2024-09-18 06:43:39', '2024-09-18 06:43:39'),
(2, 'Midterm Exam Term 1 - Class 1', 2, 1, 2, '2024-02-15', '2024-02-17', '2024-09-18 06:43:39', '2024-09-18 06:43:39'),
(3, 'End Term Exam Term 1 - Class 1', 2, 1, 3, '2024-03-15', '2024-03-17', '2024-09-18 06:43:39', '2024-09-18 06:43:39'),
(4, 'Opening Exam Term 1 - Class 2', 2, 2, 1, '2024-01-15', '2024-01-17', '2024-09-18 06:43:39', '2024-09-18 06:43:39'),
(5, 'Midterm Exam Term 1 - Class 2', 2, 2, 2, '2024-02-15', '2024-02-17', '2024-09-18 06:43:39', '2024-09-18 06:43:39'),
(6, 'End Term Exam Term 1 - Class 2', 2, 2, 3, '2024-03-15', '2024-03-17', '2024-09-18 06:43:39', '2024-09-18 06:43:39'),
(7, 'Opening Exam Term 2 - Class 1', 2, 1, 1, '2024-05-10', '2024-05-12', '2024-09-18 06:43:39', '2024-09-18 06:43:39'),
(8, 'Midterm Exam Term 2 - Class 1', 2, 1, 2, '2024-06-10', '2024-06-12', '2024-09-18 06:43:39', '2024-09-18 06:43:39'),
(9, 'End Term Exam Term 2 - Class 1', 2, 1, 3, '2024-07-10', '2024-07-12', '2024-09-18 06:43:39', '2024-09-18 06:43:39'),
(10, 'Opening Exam Term 2 - Class 2', 2, 2, 1, '2024-05-10', '2024-05-12', '2024-09-18 06:43:39', '2024-09-18 06:43:39');

-- --------------------------------------------------------

--
-- Table structure for table `exam_terms`
--

CREATE TABLE `exam_terms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `comments` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam_terms`
--

INSERT INTO `exam_terms` (`id`, `name`, `comments`, `created_at`, `updated_at`) VALUES
(1, 'Opening Exam', 'The first exam of the term', '2024-09-17 07:36:50', '2024-09-17 07:36:50'),
(2, 'Midterm Exam', 'The exam conducted at midterm', '2024-09-17 07:36:50', '2024-09-17 07:36:50'),
(3, 'End Term Exam', 'The final exam of the term', '2024-09-17 07:36:50', '2024-09-17 07:36:50');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_details`
--

CREATE TABLE `fee_details` (
  `id` int(11) NOT NULL,
  `fee_structure_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fee_details`
--

INSERT INTO `fee_details` (`id`, `fee_structure_id`, `description`, `amount`, `created_at`, `updated_at`) VALUES
(8, 2, 'misc', '89.00', '2024-08-14 06:50:44', '2024-08-14 06:50:44'),
(9, 2, 'dytrrt', '78.00', '2024-08-14 06:50:44', '2024-08-14 06:50:44'),
(10, 2, 'TUTT', '6.00', '2024-08-14 06:50:44', '2024-08-14 06:50:44');

-- --------------------------------------------------------

--
-- Table structure for table `fee_payments`
--

CREATE TABLE `fee_payments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_structures`
--

CREATE TABLE `fee_structures` (
  `id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `total_fee` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fee_structures`
--

INSERT INTO `fee_structures` (`id`, `level_id`, `total_fee`, `created_at`, `updated_at`) VALUES
(2, 1, '173.00', '2024-08-14 06:41:22', '2024-08-14 06:50:44');

-- --------------------------------------------------------

--
-- Table structure for table `guardians`
--

CREATE TABLE `guardians` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hostels`
--

CREATE TABLE `hostels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `number_of_rooms` int(11) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hostels`
--

INSERT INTO `hostels` (`id`, `name`, `number_of_rooms`, `photo`, `created_at`, `updated_at`) VALUES
(23, 'Hostel C', 60, 'hostel_c.jpg', '2024-06-25 05:22:05', '2024-06-25 05:22:05'),
(24, 'Hostel D', 55, 'hostel_d.jpg', '2024-06-25 05:22:05', '2024-06-25 05:22:05'),
(25, 'Hostel E', 45, 'hostel_e.jpg', '2024-06-25 05:22:05', '2024-06-25 05:22:05'),
(32, 'test', 7, NULL, '2024-06-25 02:50:49', '2024-06-25 02:50:49'),
(33, 'Kody Gorczany', 336, NULL, '2024-06-25 03:00:22', '2024-06-25 03:00:22'),
(34, 'Kody Gorczany', 336, NULL, '2024-06-25 03:00:29', '2024-06-25 03:00:29'),
(35, 'Kody Gorczany', 336, NULL, '2024-06-25 03:00:30', '2024-06-25 03:00:30'),
(36, 'Kody Gorczany', 336, NULL, '2024-06-25 03:00:33', '2024-06-25 03:00:33'),
(37, 'Kody Gorczany', 336, NULL, '2024-06-25 03:00:35', '2024-06-25 03:00:35'),
(38, 'Kody Gorczany', 336, NULL, '2024-06-25 03:00:37', '2024-06-25 03:00:37'),
(39, 'Kody Gorczany', 336, NULL, '2024-06-25 03:00:39', '2024-06-25 03:00:39'),
(40, 'Kody Gorczany', 336, NULL, '2024-06-25 03:01:00', '2024-06-25 03:01:00'),
(41, 'Kody Gorczany', 336, NULL, '2024-06-25 03:01:01', '2024-06-25 03:01:01'),
(42, 'Kody Gorczany', 336, NULL, '2024-06-25 03:01:07', '2024-06-25 03:01:07'),
(43, 'Francesca Herman', 363, NULL, '2024-06-25 03:02:26', '2024-06-25 03:02:26'),
(44, 'Francesca Herman', 363, NULL, '2024-06-25 03:02:40', '2024-06-25 03:02:40');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` int(11) NOT NULL,
  `level` int(2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `level`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'grade 1', '2024-08-07 02:52:40', '2024-08-07 02:52:40'),
(2, 2, 'Grade 2', '2024-08-07 02:53:18', '2024-08-07 02:53:18');

-- --------------------------------------------------------

--
-- Table structure for table `library_settings`
--

CREATE TABLE `library_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `return_days_limit` varchar(255) NOT NULL,
  `daily_fine` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `library_settings`
--

INSERT INTO `library_settings` (`id`, `return_days_limit`, `daily_fine`, `created_at`, `updated_at`) VALUES
(1, '7', '40', '2023-01-06 23:01:51', '2023-01-23 11:29:21');

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `paper_id` bigint(20) UNSIGNED NOT NULL,
  `marks` int(11) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_04_16_121127_create_personal_access_tokens_table', 1),
(5, '2024_05_23_060902_create_permission_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 5),
(4, 'App\\Models\\User', 6),
(5, 'App\\Models\\User', 7),
(6, 'App\\Models\\User', 8);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `order_date` varchar(255) NOT NULL,
  `order_status` tinyint(4) NOT NULL COMMENT '0 - Pending / 1 - Complete',
  `total_products` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `vat` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `pay` int(11) NOT NULL,
  `due` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitcost` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `papers`
--

CREATE TABLE `papers` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `max_score` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view students', 'web', '2024-05-29 03:50:08', '2024-05-29 03:50:08'),
(2, 'manage students', 'web', '2024-05-29 03:50:08', '2024-05-29 03:50:08'),
(3, 'view instructors', 'web', '2024-05-29 03:50:08', '2024-05-29 03:50:08'),
(4, 'manage instructors', 'web', '2024-05-29 03:50:08', '2024-05-29 03:50:08'),
(5, 'view finance', 'web', '2024-05-29 03:50:08', '2024-05-29 03:50:08'),
(6, 'manage finance', 'web', '2024-05-29 03:50:08', '2024-05-29 03:50:08'),
(7, 'view library', 'web', '2024-05-29 03:50:08', '2024-05-29 03:50:08'),
(8, 'manage library', 'web', '2024-05-29 03:50:08', '2024-05-29 03:50:08'),
(9, 'view parents', 'web', '2024-05-29 03:50:08', '2024-05-29 03:50:08'),
(10, 'manage parents', 'web', '2024-05-29 03:50:08', '2024-05-29 03:50:08'),
(11, 'view own profile', 'web', '2024-05-29 03:50:08', '2024-05-29 03:50:08'),
(12, 'edit own profile', 'web', '2024-05-29 03:50:08', '2024-05-29 03:50:08'),
(13, 'manage grading', 'web', '2024-05-29 03:50:08', '2024-05-29 03:50:08'),
(14, 'view grading', 'web', '2024-05-29 03:50:08', '2024-05-29 03:50:08'),
(15, 'manage orders', 'web', '2024-05-29 03:50:08', '2024-05-29 03:50:08');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'authToken', 'ba99b1c315b5aa9e186517537a405d51e11750209746ca244d5a0070910402d5', '[\"*\"]', NULL, NULL, '2024-05-29 08:29:15', '2024-05-29 08:29:15'),
(2, 'App\\Models\\User', 3, 'authToken', '4e73b5959f048aa8694ec216df078d6cd3b4bccb833def1cb225b7234d77c00d', '[\"*\"]', NULL, NULL, '2024-05-29 08:35:57', '2024-05-29 08:35:57'),
(3, 'App\\Models\\User', 5, 'authToken', '2452796d6cee540e1254feef8a1c3e1f482d067ec968d447242931600350e2ca', '[\"*\"]', NULL, NULL, '2024-05-29 08:36:56', '2024-05-29 08:36:56'),
(4, 'App\\Models\\User', 5, 'authToken', 'b61687380d0a56823b32f72029462ac82fbf8b59750b8bb5112227f1499cbf78', '[\"*\"]', NULL, NULL, '2024-05-29 08:47:56', '2024-05-29 08:47:56'),
(5, 'App\\Models\\User', 3, 'authToken', '512ba89150cd5c2e88766cac7e314cf1e9614ddd9cccf46b07ee770d4d2ad94f', '[\"*\"]', NULL, NULL, '2024-05-29 09:14:18', '2024-05-29 09:14:18'),
(6, 'App\\Models\\User', 3, 'authToken', 'd886614e386e4fa8a58179f72d17d02e0facd760b9cfa2180e96ac568b4c59f9', '[\"*\"]', NULL, NULL, '2024-05-29 09:17:14', '2024-05-29 09:17:14'),
(7, 'App\\Models\\User', 3, 'authToken', '338c0a0fbd1b488da8e690ce4ce618f0d240de38634bba309b6c40e42b96f652', '[\"*\"]', NULL, NULL, '2024-05-29 09:18:02', '2024-05-29 09:18:02'),
(8, 'App\\Models\\User', 3, 'authToken', 'ca267305477af6c8c493c972f3cf6ac7439863c38487887c208ce6744bd405e1', '[\"*\"]', NULL, NULL, '2024-05-29 09:22:09', '2024-05-29 09:22:09'),
(9, 'App\\Models\\User', 3, 'authToken', '764190ac424511b67c72fd5794d1aada42a07f40985b0e55e6ed96fdac1db419', '[\"*\"]', NULL, NULL, '2024-05-29 09:22:39', '2024-05-29 09:22:39'),
(10, 'App\\Models\\User', 3, 'authToken', '8f4587f670662ce7084425bcf6478ed3ee89a1ad669dec0f4af24176c1ba4766', '[\"*\"]', NULL, NULL, '2024-05-29 09:23:13', '2024-05-29 09:23:13'),
(11, 'App\\Models\\User', 3, 'authToken', 'c659e8613b3ec6a5b87ce8fb3d15704deb3ada5fce03375c2e8b55cb46b8cdc3', '[\"*\"]', NULL, NULL, '2024-05-29 09:23:45', '2024-05-29 09:23:45'),
(12, 'App\\Models\\User', 3, 'authToken', 'a6a4cb08ba609d36a30fe84d34cc3cf510d2e35c454471e95e0643d76f50e20c', '[\"*\"]', NULL, NULL, '2024-05-29 09:24:06', '2024-05-29 09:24:06'),
(13, 'App\\Models\\User', 3, 'authToken', '217a001f25c72602a9815221b69c45f1bdfaca93fbbe07293a57e70316306bfc', '[\"*\"]', NULL, NULL, '2024-05-29 09:24:21', '2024-05-29 09:24:21'),
(14, 'App\\Models\\User', 3, 'authToken', 'c6c2a1e63b098cd764248f592094235566193c171274e9818845ed4dc696b4c8', '[\"*\"]', NULL, NULL, '2024-05-29 09:24:40', '2024-05-29 09:24:40'),
(15, 'App\\Models\\User', 3, 'authToken', '3afa7a4fd0bb32f9280c22e96aa13950bb898de277d7393b643bdf5d88046aff', '[\"*\"]', NULL, NULL, '2024-05-29 09:25:49', '2024-05-29 09:25:49'),
(16, 'App\\Models\\User', 3, 'authToken', '93c355c734d1be6abec17c75b0061c178ebf182e528553911acf3c9da765d008', '[\"*\"]', NULL, NULL, '2024-05-29 09:26:41', '2024-05-29 09:26:41'),
(17, 'App\\Models\\User', 3, 'authToken', '8431be3dcd863d9daf7c176aa4f2ca110dad4b8bc4d402886f983dac2a79f6cb', '[\"*\"]', NULL, NULL, '2024-05-29 09:29:21', '2024-05-29 09:29:21'),
(18, 'App\\Models\\User', 3, 'authToken', 'c2e122cd34fdc4a5a70865752f1e3769113e46cbd13ece26927084b3e767b6af', '[\"*\"]', NULL, NULL, '2024-05-29 09:29:31', '2024-05-29 09:29:31'),
(19, 'App\\Models\\User', 3, 'authToken', '68fdaf1a58c97eba36944bbebe75fff2810229e1d79e1597ee4a69b536ace1a4', '[\"*\"]', NULL, NULL, '2024-05-29 09:30:22', '2024-05-29 09:30:22'),
(20, 'App\\Models\\User', 3, 'authToken', '0ca5232914c469c3a904386b46e9583b2dac3fef5c4d27ab73a0e4e1e9ad5d98', '[\"*\"]', NULL, NULL, '2024-05-29 09:30:37', '2024-05-29 09:30:37'),
(21, 'App\\Models\\User', 3, 'authToken', '0c626edce5e53f54d1f661e79c3303fb1732ead45214fb4aab97375ac229d4c6', '[\"*\"]', NULL, NULL, '2024-05-29 09:31:13', '2024-05-29 09:31:13'),
(22, 'App\\Models\\User', 3, 'authToken', 'e8c69b82ba92401d9767e6e360e866e03df87ced4eea193584cc0219e7c85469', '[\"*\"]', NULL, NULL, '2024-05-29 09:31:26', '2024-05-29 09:31:26'),
(23, 'App\\Models\\User', 3, 'authToken', 'd64bac5b96baaa504ce045a8c86317f48464c7e1669fc24bab8494881c083fdc', '[\"*\"]', NULL, NULL, '2024-05-29 09:31:47', '2024-05-29 09:31:47'),
(24, 'App\\Models\\User', 3, 'authToken', 'e6d64a8443dfe8999134d24289f44198018855216c4889e6fc826f8a480738ae', '[\"*\"]', NULL, NULL, '2024-05-29 09:47:24', '2024-05-29 09:47:24'),
(25, 'App\\Models\\User', 3, 'authToken', '7a6bc126c9d3e955de4ef31279ceff0bc7d521a953117015d69220c6b2e49462', '[\"*\"]', NULL, NULL, '2024-05-29 09:48:22', '2024-05-29 09:48:22'),
(26, 'App\\Models\\User', 3, 'authToken', '7e1ac7e83c67394ad7de666207997c9992180dfbf2ed6e17441d158d17d1b6f4', '[\"*\"]', NULL, NULL, '2024-05-29 09:48:36', '2024-05-29 09:48:36'),
(27, 'App\\Models\\User', 3, 'authToken', 'a4022d07c4a655f2608319be9afaf4fd15bcb01bccd15d25b701e6acd004e319', '[\"*\"]', NULL, NULL, '2024-05-29 09:49:14', '2024-05-29 09:49:14'),
(28, 'App\\Models\\User', 3, 'authToken', 'a1df7f2f17425504a6bf1310a30517a0816d4fc66683d92983d97807f7a8bbe5', '[\"*\"]', NULL, NULL, '2024-05-29 09:51:32', '2024-05-29 09:51:32'),
(29, 'App\\Models\\User', 3, 'authToken', '6347c00013fc3742125cabd1f4db4a54bafc5ea982db306b78d27e4d683fc7f4', '[\"*\"]', NULL, NULL, '2024-05-29 09:51:57', '2024-05-29 09:51:57'),
(30, 'App\\Models\\User', 3, 'authToken', '6ecc687573315e3b8f8f8ea295790184c610158dfef74b3c451042858e18c1b8', '[\"*\"]', NULL, NULL, '2024-05-29 09:52:39', '2024-05-29 09:52:39'),
(31, 'App\\Models\\User', 3, 'authToken', 'e4595ac53b61096123910fbbb180653c05b3a9d9e3aa57b9a0539b30e12bdfb7', '[\"*\"]', NULL, NULL, '2024-05-31 02:44:13', '2024-05-31 02:44:13'),
(32, 'App\\Models\\User', 6, 'authToken', 'c28218f45b4a27acdee2d6a2dcd46821114828860b27283e7349b497f7d13eb5', '[\"*\"]', NULL, NULL, '2024-05-31 03:16:04', '2024-05-31 03:16:04'),
(33, 'App\\Models\\User', 3, 'authToken', 'c3c69e06e496cee1a2336932c0ace96345bbd6312696a503092f8f2fbda10f34', '[\"*\"]', NULL, NULL, '2024-05-31 03:33:35', '2024-05-31 03:33:35'),
(34, 'App\\Models\\User', 3, 'authToken', 'e06ad85d9a6c08fd73a487bb8d509685172c34611136c00d0195da8d826b1dbf', '[\"*\"]', NULL, NULL, '2024-05-31 03:33:53', '2024-05-31 03:33:53'),
(35, 'App\\Models\\User', 3, 'authToken', '2bb53fe576f60828f1ebb0391fae371206a363c34e7cb22bc601fd7e50f35dd1', '[\"*\"]', NULL, NULL, '2024-05-31 03:44:01', '2024-05-31 03:44:01'),
(36, 'App\\Models\\User', 3, 'authToken', '5569ade9841e527cb68cb60c21b1eb7f96119b8d7b79b27b750651aaaa7eac21', '[\"*\"]', NULL, NULL, '2024-05-31 03:44:17', '2024-05-31 03:44:17'),
(37, 'App\\Models\\User', 6, 'authToken', 'e7f1ba2a156f7789725d5c84154cd2e372290addc992617cefd4adc9f08e7c32', '[\"*\"]', NULL, NULL, '2024-05-31 03:45:00', '2024-05-31 03:45:00'),
(38, 'App\\Models\\User', 8, 'authToken', 'a805a1638af4bac0bff9bd1cb0f75503fd2cb52de0f04f66e0a608de04f5989e', '[\"*\"]', NULL, NULL, '2024-05-31 03:45:13', '2024-05-31 03:45:13'),
(39, 'App\\Models\\User', 3, 'authToken', '144bbe75d078333adfb14af2116c5768c80915995aaff900dec0d20a5866f9f6', '[\"*\"]', NULL, NULL, '2024-05-31 04:03:26', '2024-05-31 04:03:26'),
(40, 'App\\Models\\User', 3, 'authToken', '29754874116586c38d57e5496e6910be37125fe71804faa5bccee5dbb34695d2', '[\"*\"]', NULL, NULL, '2024-05-31 04:03:41', '2024-05-31 04:03:41'),
(41, 'App\\Models\\User', 6, 'authToken', 'c74849a1efa19c599d5feb2598e28ff08b3a3314499c0edc1563f1802c12dc8f', '[\"*\"]', NULL, NULL, '2024-05-31 11:08:57', '2024-05-31 11:08:57'),
(42, 'App\\Models\\User', 3, 'authToken', '4f55c04601818a5759d00bd5dcfe6b5c76b25435e9463dad2ca07798f55099cf', '[\"*\"]', NULL, NULL, '2024-06-04 09:07:14', '2024-06-04 09:07:14'),
(43, 'App\\Models\\User', 6, 'authToken', 'e42b11feab5c3f9b72d8ab4c224d84d388d1fed16226a83c821cbcb8889109e4', '[\"*\"]', NULL, NULL, '2024-06-04 09:47:48', '2024-06-04 09:47:48'),
(44, 'App\\Models\\User', 3, 'authToken', '75726a2d4f76aff2d8ac613bd9937693fa7b43377f20c5b367160afd8bf861fe', '[\"*\"]', NULL, NULL, '2024-06-04 11:06:33', '2024-06-04 11:06:33'),
(45, 'App\\Models\\User', 6, 'authToken', '4e13f982e8457619cceb9fb0b78ad8f36ac93a8ff3e2b4051874bc84d08d631e', '[\"*\"]', NULL, NULL, '2024-06-04 11:07:49', '2024-06-04 11:07:49'),
(46, 'App\\Models\\User', 3, 'authToken', '31a75fa35b8536b96a7ca86ed278fefb81db0052cf11ddaa26bec66ac0bf8273', '[\"*\"]', NULL, NULL, '2024-06-04 11:15:17', '2024-06-04 11:15:17'),
(47, 'App\\Models\\User', 3, 'authToken', '37b84b65a31729ffc73532312e9aa2fdb222ac0f47d4c7340e65a1ee130a0706', '[\"*\"]', NULL, NULL, '2024-06-04 11:18:07', '2024-06-04 11:18:07'),
(48, 'App\\Models\\User', 3, 'authToken', '933493d74dc99447821235538a7d9484f867a3ce93699618645b64b2c29d74df', '[\"*\"]', NULL, NULL, '2024-06-05 02:55:47', '2024-06-05 02:55:47'),
(49, 'App\\Models\\User', 3, 'authToken', '7973f62495f5f405e04d2d3d5218eb85b5092b718deab8c99bd758eb5eb583a9', '[\"*\"]', NULL, NULL, '2024-06-05 02:56:18', '2024-06-05 02:56:18'),
(50, 'App\\Models\\User', 3, 'authToken', '6da0295b9a0b59238e110972f1d285b508372c25fc786d4d7fb779cb74020cbf', '[\"*\"]', NULL, NULL, '2024-06-05 02:58:33', '2024-06-05 02:58:33'),
(51, 'App\\Models\\User', 6, 'authToken', 'd2e2a0db0c29316253ab238a59d09e2f1acea09f1c03398a5f97ab1914ed44dc', '[\"*\"]', NULL, NULL, '2024-06-05 02:58:55', '2024-06-05 02:58:55'),
(52, 'App\\Models\\User', 8, 'authToken', '4c4e054e6f6b729ad60cfbacf4479b49fa4ac374c4cbdf7158d32eb0fe89955d', '[\"*\"]', NULL, NULL, '2024-06-05 02:59:22', '2024-06-05 02:59:22'),
(53, 'App\\Models\\User', 3, 'authToken', '737d131c33d1048160c7d25fa2d28ab64a4f5be70b9eb66ddb82b204daa8dbd8', '[\"*\"]', NULL, NULL, '2024-06-05 03:00:18', '2024-06-05 03:00:18'),
(54, 'App\\Models\\User', 3, 'authToken', '4adf155b6400dd5424df8e8d3a4e298e9692a94a5a197a33b525843283fece36', '[\"*\"]', NULL, NULL, '2024-06-05 03:22:24', '2024-06-05 03:22:24'),
(55, 'App\\Models\\User', 3, 'authToken', 'e6bafae3273c0b2e49ccd9271771beba7aec2e1d5237ce47e537952179ffe10e', '[\"*\"]', NULL, NULL, '2024-06-05 03:24:58', '2024-06-05 03:24:58'),
(56, 'App\\Models\\User', 3, 'authToken', 'faf0e2c52bf4a01abad76ebb7c0be08863a6a5a78eb6e4df355b73c6f663e3a0', '[\"*\"]', NULL, NULL, '2024-06-05 03:32:38', '2024-06-05 03:32:38'),
(57, 'App\\Models\\User', 6, 'authToken', '9c6b56118486394236282f2310e83e24c8149077e022f853ed459c4fcddad032', '[\"*\"]', NULL, NULL, '2024-06-05 03:57:10', '2024-06-05 03:57:10'),
(58, 'App\\Models\\User', 3, 'authToken', '177ac9966e26552c35d5559cbb5c8142645d2dc79bbdc89e1a1435a246506544', '[\"*\"]', NULL, NULL, '2024-06-05 04:08:13', '2024-06-05 04:08:13'),
(59, 'App\\Models\\User', 3, 'authToken', 'fbbc83acddd05af783e0b3225b852408569c8612409899e6462b8b1666a47152', '[\"*\"]', NULL, NULL, '2024-06-05 04:28:50', '2024-06-05 04:28:50'),
(60, 'App\\Models\\User', 6, 'authToken', '76ad0f579ada43efbd123845ad0f3f43feed32222f9e054993e0127d14c8ac2e', '[\"*\"]', NULL, NULL, '2024-06-05 05:05:21', '2024-06-05 05:05:21'),
(61, 'App\\Models\\User', 8, 'authToken', 'd2eb3aa061b89cf6828b82c84df0cf334e6dc6b366f4f03315d898f479d32290', '[\"*\"]', NULL, NULL, '2024-06-05 05:07:19', '2024-06-05 05:07:19'),
(62, 'App\\Models\\User', 3, 'authToken', 'a77dcafac90e77d6ef5cdbdf5d178c7052e863ac2909fbcc30313adb0dbc81bb', '[\"*\"]', NULL, NULL, '2024-06-05 05:09:14', '2024-06-05 05:09:14'),
(63, 'App\\Models\\User', 6, 'authToken', 'f56c04cc02a4fab6876ee69344476fc6da584a6cfb1136f48cb67ceed595f85f', '[\"*\"]', NULL, NULL, '2024-06-05 05:11:40', '2024-06-05 05:11:40'),
(64, 'App\\Models\\User', 3, 'authToken', '7e7588a5e4171c636d8a634421aceacf783b1bfd537681d0f7b6e16ff01062fb', '[\"*\"]', NULL, NULL, '2024-06-05 05:45:01', '2024-06-05 05:45:01'),
(65, 'App\\Models\\User', 3, 'authToken', '650b4cbdc959db942aabe1c00267fc93f438a904098326f4d29c09627e80808a', '[\"*\"]', NULL, NULL, '2024-06-06 04:05:45', '2024-06-06 04:05:45'),
(66, 'App\\Models\\User', 3, 'authToken', '7f2d39a4e127ab56f522807bad7ea428d6541bd4f59e4de3fe9e388febbe8805', '[\"*\"]', NULL, NULL, '2024-06-06 04:05:57', '2024-06-06 04:05:57'),
(67, 'App\\Models\\User', 3, 'authToken', '43ab90f0e86b0c1e50b7faa6188f10353045e4afc0c513f76ceb6680947a6b67', '[\"*\"]', NULL, NULL, '2024-06-06 05:06:36', '2024-06-06 05:06:36'),
(68, 'App\\Models\\User', 3, 'authToken', '92f03cac29b89cc1f13822914650fcdef0037ddc2b120ca395e38cd32d0ee7e3', '[\"*\"]', NULL, NULL, '2024-06-06 06:59:51', '2024-06-06 06:59:51'),
(69, 'App\\Models\\User', 3, 'authToken', 'f8c47e92d2bc33ea897cd62a3becaf9889656e7ab0b63441e41f3aa0e9a47c7d', '[\"*\"]', NULL, NULL, '2024-06-06 07:32:36', '2024-06-06 07:32:36'),
(70, 'App\\Models\\User', 3, 'authToken', 'b05702f18bf6525e0f4ac72ce8e6f73ba6711637e4cde7216d1bc3b545a106f3', '[\"*\"]', NULL, NULL, '2024-06-07 02:01:26', '2024-06-07 02:01:26'),
(71, 'App\\Models\\User', 3, 'authToken', 'dfaabc9d720b476a07e932140030acdc833220b69aa663ab40a97d666e6545e3', '[\"*\"]', NULL, NULL, '2024-06-10 05:58:02', '2024-06-10 05:58:02'),
(72, 'App\\Models\\User', 3, 'authToken', '82368f9111f8f402526699fc4881221ef074f6296e0a704352c88af4552256ef', '[\"*\"]', NULL, NULL, '2024-06-11 03:45:52', '2024-06-11 03:45:52'),
(73, 'App\\Models\\User', 6, 'authToken', 'f964c298ed9786d1010f85ef7055b3296512fa84625fc195b9903a682942794d', '[\"*\"]', NULL, NULL, '2024-06-11 03:46:46', '2024-06-11 03:46:46'),
(74, 'App\\Models\\User', 3, 'authToken', '84f872c27db60177e26f6387d88b887edab9551c2a5ac8492946749e377f4060', '[\"*\"]', '2024-06-19 10:44:55', NULL, '2024-06-12 09:52:33', '2024-06-19 10:44:55'),
(75, 'App\\Models\\User', 3, 'authToken', '08d5d8c0b663999e327298694384c7d95daa4b8eab0a88a530a9c9f8ecd6e792', '[\"*\"]', NULL, NULL, '2024-06-13 02:09:04', '2024-06-13 02:09:04'),
(76, 'App\\Models\\User', 3, 'authToken', '00171bed70df918cb19e2024ca13adb0f1b1f513f817ed990073e2672ab07b1f', '[\"*\"]', NULL, NULL, '2024-06-14 02:10:07', '2024-06-14 02:10:07'),
(77, 'App\\Models\\User', 3, 'authToken', 'e23e29855178f08e15a551175040718b661e93211fa2102c4aa02d4ebdef38bf', '[\"*\"]', '2024-06-14 05:40:20', NULL, '2024-06-14 04:15:19', '2024-06-14 05:40:20'),
(78, 'App\\Models\\User', 3, 'authToken', 'c9d19d6f04fc9f72fbf9a5e0362bafdd9197be91433197f20296684eaa0c06c7', '[\"*\"]', '2024-06-18 04:59:04', NULL, '2024-06-18 02:16:21', '2024-06-18 04:59:04'),
(79, 'App\\Models\\User', 3, 'authToken', '7567c4ae056ef3abd04f69ce46c1b2dc42cbf27548dddc0a9bb053d9b6d1a609', '[\"*\"]', '2024-06-24 06:13:11', NULL, '2024-06-19 10:46:18', '2024-06-24 06:13:11'),
(80, 'App\\Models\\User', 3, 'authToken', '214a595677f305cb8d9a766394b3c509e8bbf82293224a833a07f361bb50cf7e', '[\"*\"]', '2024-09-03 03:58:09', NULL, '2024-06-25 02:24:58', '2024-09-03 03:58:09'),
(81, 'App\\Models\\User', 3, 'authToken', '1ac582e44e9a4f7352be860071931c50c9f6e8274a8096c28245c8622cfdac26', '[\"*\"]', '2024-08-02 04:59:24', NULL, '2024-07-10 03:51:40', '2024-08-02 04:59:24'),
(82, 'App\\Models\\User', 3, 'authToken', '9237e5ebdf9c491ed98ebedcf13e9638c5835893265dd7c46ac8a310ce4221ac', '[\"*\"]', '2024-08-22 04:09:50', NULL, '2024-08-07 02:26:47', '2024-08-22 04:09:50'),
(83, 'App\\Models\\User', 3, 'authToken', 'cfe8d52c01b8df71514619800a0568df40eed6bb3131a0935efd220532dc793d', '[\"*\"]', '2024-09-04 03:38:11', NULL, '2024-08-27 03:01:13', '2024-09-04 03:38:11'),
(84, 'App\\Models\\User', 3, 'authToken', 'a56aa15a133f221901ab00149a60f554c79318ad05842bef6224d293f8e31f98', '[\"*\"]', '2024-09-06 01:50:44', NULL, '2024-09-06 01:50:34', '2024-09-06 01:50:44'),
(85, 'App\\Models\\User', 6, 'authToken', '236e3b2d813088f67ed3619ba2dd0b1c30075f8b3d1254ab11d0b31e2103ec3f', '[\"*\"]', '2024-09-09 04:59:48', NULL, '2024-09-09 04:55:52', '2024-09-09 04:59:48'),
(86, 'App\\Models\\User', 3, 'authToken', '952ea50afaea79be2d883e8bf2049ee57ebc04b72cde47aeafa1287217258e64', '[\"*\"]', '2024-09-18 11:22:08', NULL, '2024-09-16 05:00:47', '2024-09-18 11:22:08'),
(87, 'App\\Models\\User', 3, 'authToken', '2bc8c312008ef87a9b7359d5ebfd2d477cb34e8727bd0f4cf8843a781f656aeb', '[\"*\"]', '2024-09-17 04:56:20', NULL, '2024-09-17 04:02:49', '2024-09-17 04:56:20'),
(88, 'App\\Models\\User', 3, 'authToken', '60687b9c89fc9a9e8386f09807bd1eb3fa581e259d19b7e64852859b94690fc2', '[\"*\"]', '2024-09-27 02:29:55', NULL, '2024-09-18 04:17:14', '2024-09-27 02:29:55'),
(89, 'App\\Models\\User', 3, 'authToken', 'ec2c80857cf18771d954f26f5f23a7faa4455eeb530e96b6f37a60171131c934', '[\"*\"]', '2024-10-04 03:58:07', NULL, '2024-09-27 02:30:54', '2024-10-04 03:58:07');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `buying_price` int(11) NOT NULL COMMENT 'Buying Price',
  `selling_price` int(11) NOT NULL COMMENT 'Selling Price',
  `quantity_alert` int(11) NOT NULL,
  `tax` int(11) DEFAULT NULL,
  `tax_type` tinyint(4) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `uuid`, `user_id`, `name`, `slug`, `code`, `quantity`, `buying_price`, `selling_price`, `quantity_alert`, `tax`, `tax_type`, `notes`, `product_image`, `category_id`, `unit_id`, `created_at`, `updated_at`) VALUES
(1, '1909015d-e41e-4b4d-bd49-6b20f08f32cb', 1, 'iPhone 14 Pro', 'iphone-14-pro', '1', 10, 90000, 140000, 10, 24, 1, NULL, 'assets/img/products/ip14.png', 3, 3, '2024-08-26 02:35:40', '2024-08-26 02:35:40'),
(2, '52cd52c5-15e3-4485-b35f-e3c8b6c7dfd6', 1, 'ASUS Laptop', 'asus-laptop', '2', 10, 90000, 140000, 10, 24, 1, NULL, 'assets/img/products/ip14.png', 1, 3, '2024-08-26 02:35:40', '2024-08-26 02:35:40'),
(3, 'c9dffd82-8cb2-4c8f-abde-75c86e9ac0dc', 1, 'Logitech Keyboard', 'logitech-keyboard', '3', 10, 90000, 140000, 10, 24, 1, NULL, 'assets/img/products/keyboard.jpg', 2, 3, '2024-08-26 02:35:40', '2024-08-26 02:35:40'),
(4, '055ee28e-5213-4c36-818d-3efb254e6571', 1, 'Logitech Speakers', 'logitech-speakers', '4', 10, 90000, 140000, 10, 24, 1, NULL, 'assets/img/products/speaker.png', 4, 3, '2024-08-26 02:35:40', '2024-08-26 02:35:40'),
(5, '5be88d40-c82c-4a18-9424-7a420483348c', 1, 'AutoCAD v7.0', 'autocad-v7.0', '5', 10, 90000, 140000, 10, 24, 1, NULL, 'assets/img/products/autocard.png', 5, 3, '2024-08-26 02:35:40', '2024-08-26 02:35:40');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `user_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 1, 'Laptops', 'laptops', NULL, NULL),
(2, 1, 'Hardware', 'hardware', NULL, NULL),
(3, 1, 'Smartphones', 'smartphones', NULL, NULL),
(4, 1, 'Speakers', 'speakers', NULL, NULL),
(5, 1, 'Software', 'software', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

CREATE TABLE `publishers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'KLB', '2023-01-23 09:38:33', '2023-01-23 09:38:33'),
(2, 'OXFORD', '2023-01-23 09:38:59', '2023-01-23 09:38:59'),
(3, 'ACCESS PUBLISHERS', '2023-01-25 09:54:09', '2023-01-25 09:54:09'),
(4, 'LONGHORN PUBLISHERS', '2023-01-27 08:23:25', '2023-01-27 08:23:25'),
(5, 'LONGMAN', '2023-01-27 08:23:46', '2023-01-27 08:23:46'),
(6, 'MORAN PUBLISHERS', '2023-01-27 08:24:07', '2023-01-27 08:24:07'),
(7, 'JKF', '2023-02-03 07:52:33', '2023-02-03 07:52:33'),
(8, 'SPOTLIGHT PUBLISHERS LTD', '2023-02-06 03:10:30', '2023-02-06 03:10:30'),
(9, 'EAEP', '2023-02-07 06:58:36', '2023-02-07 06:58:36'),
(10, 'MACMILLAN KENYA', '2023-02-07 08:36:26', '2023-02-07 08:36:26'),
(11, 'One PLANET', '2023-02-16 01:30:01', '2023-02-16 01:30:01'),
(12, 'MARIMBA PUBLICATIONS LTD', '2023-02-16 03:18:57', '2023-02-16 03:18:57'),
(13, 'JB PUBLISHERS', '2023-02-17 03:08:14', '2023-02-17 03:08:14'),
(14, 'PYRAMID CONSULTANTS LTD', '2023-02-28 03:27:19', '2023-02-28 03:27:19'),
(15, 'STEVECREATIONGRAPHICS(SCG)', '2023-03-15 03:41:09', '2023-03-15 03:41:09'),
(16, 'CLIMAX PUBLISHERS', '2023-03-15 04:19:57', '2023-03-15 04:19:57'),
(18, '--', '2023-03-15 04:30:04', '2023-03-15 04:30:04'),
(19, 'FOCUS PUBLISHERS LTD', '2023-03-21 08:44:27', '2023-03-21 08:44:27'),
(20, 'KNEC', '2023-03-22 04:46:18', '2023-03-22 04:46:18'),
(21, 'VIDE MUWA PUBLISHERS LTD', '2023-03-28 00:02:34', '2023-03-28 00:02:34'),
(22, 'MOUNTAIN TOP EDUCATIONAL PUBLISHERS', '2023-03-29 06:46:19', '2023-03-29 06:46:19'),
(23, 'zion publishers', '2023-05-23 05:01:53', '2023-05-23 05:01:53'),
(24, 'KEN WALIBORA NA SAID A. MOHAMED', '2023-05-23 05:10:31', '2023-05-23 05:10:31'),
(25, 'AFRICAN INK', '2023-06-05 04:52:54', '2023-06-05 04:52:54'),
(26, 'HEINEMANN EDUCATIONAL BOOKS', '2023-06-09 01:09:54', '2023-06-09 01:09:54'),
(27, 'STORYMOJA', '2023-06-12 04:16:53', '2023-06-12 04:16:53'),
(28, 'OXFORD UNIVERSITY PRESS', '2023-06-13 02:54:32', '2023-06-13 02:54:32'),
(29, 'QUEENEX PUBLISHERS LTD', '2023-09-07 01:53:36', '2023-09-07 01:53:36'),
(30, 'CLUSTER EXAMS DPT', '2023-09-18 02:57:08', '2023-09-18 02:57:08'),
(31, 'DOUBLE SHASA LTD', '2023-10-09 04:46:14', '2023-10-09 04:46:14'),
(32, 'TOP GRADE PREDICTOR PUBLISHERS LTD', '2024-01-14 23:31:52', '2024-01-14 23:31:52'),
(33, 'StarShine Students Centre', '2024-01-15 00:02:24', '2024-01-15 00:02:24'),
(34, 'TARGETER EDUCATIONAL PUBLISHERS LTD', '2024-01-15 05:06:13', '2024-01-15 05:06:13'),
(35, 'PHOENIX PUBLISHERS', '2024-03-15 07:00:55', '2024-03-15 07:00:55');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(255) NOT NULL,
  `purchase_no` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Pending, 1=Approved',
  `total_amount` int(11) NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_details`
--

CREATE TABLE `purchase_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitcost` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(255) NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT 0,
  `tax_amount` int(11) NOT NULL DEFAULT 0,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `shipping_amount` int(11) NOT NULL DEFAULT 0,
  `total_amount` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0 - Pending / 1 - Complete / 2 - Cancel',
  `note` text DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_details`
--

CREATE TABLE `quotation_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quotation_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(255) NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2024-05-29 03:50:08', '2024-05-29 03:50:08'),
(2, 'student', 'web', '2024-05-29 03:50:09', '2024-05-29 03:50:09'),
(3, 'instructor', 'web', '2024-05-29 03:50:09', '2024-05-29 03:50:09'),
(4, 'finance', 'web', '2024-05-29 03:50:09', '2024-05-29 03:50:09'),
(5, 'library', 'web', '2024-05-29 03:50:09', '2024-05-29 03:50:09'),
(6, 'guardian', 'web', '2024-05-29 03:50:09', '2024-05-29 03:50:09');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(5, 4),
(6, 1),
(6, 4),
(7, 1),
(7, 5),
(8, 1),
(8, 5),
(9, 1),
(10, 1),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(11, 5),
(11, 6),
(12, 1),
(12, 2),
(12, 3),
(12, 6),
(13, 1),
(13, 3),
(14, 1),
(14, 3),
(15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('1IIqvXgITl0ZG53HUeEVn7yUxCnR38v4Y5ANgz8q', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZDZGdXZEYUNqNTdMVUVpMWNkajJOdjlDQjlyeFdsTHplVUN2R2JOSSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727415281),
('6Nej27ocFxYsGxdMdOYwZiG0p8O1rUbPLzkwEiJd', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYmU5OUdZb05NQkVSa05PaGNSNHBwQktmS280VEY4VURXc0FtOGo0MCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1728025059),
('7gzq4i6BvHbHqT6ofYbwH2v5dHGdkEaEqHVQKDIz', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiM3c0YlpTTFlsRmpHUFRzUE1QZUU5bEpuQkpNbnhJWXFOMGlrQmdMTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727417021),
('8Lo2Q0AYMQ8n3y6gDKMyaCs3ezv8JYHDRVW2p0SC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiR2NRZmJSZFo5ZlY0bVJyaldWRHBlanlmanROQlJwNVBMRDV1WW96TiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727417138),
('CxmEmXmHPs2n6VT6tzIIqlcCYhURZSjcT5CNjrsG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoic3Q0RzhlTTFjWGRaNTBaNGlyd0t4dWRZdDQ1YzYxMHF2RkcwWUF6NiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727417774),
('dnkUzsh8QaCAKwkl7lnOttLNxXYUPK6kNZLQQ38m', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSFlrems4Z2NGNjZRWU50bTlmemI4Qm9hMVdVQ2p2VDJYcHpudFEzcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727417238),
('ea08dLk2jLKaPneUVYlp1PGYt1djV9rVDKfiPt69', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidTlad0pHc1hYazZ1bWJuOVJQUzZQSkhRTEl2cTZtZ0lEZjNOU1JWUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727417274),
('foVmc8gAHr4aluvGba2X1rbWShHEy0nWsf1gl8g9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiN0cyWUdURFFkNGtoWmpDNUJrN05kMWVCZ2czYk93MWM4WnFVdjlZdCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727415257),
('gpJsWpFfW9MAni2JEbPHWBk2a6Ot8Vg1xJJa6pXS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQWxHY0pMYUpOclJVbzUyQjUxa3JWWXQ3N01KMHBjcHlXdkF3SmM3UyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727417024),
('I2khC5SzlGL5u3M7D07WWDAVrqaoW5zPTDnBGwm4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUVR4dDBlbXoza0xjeU9oT2FJM2RuUGNqVFdpZmk3NnNCVzBHd3B3TiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727417261),
('igfnsl4XOLOXvbZzrguGYnogpiJWApD6tcnBR9Bm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaG1aU09VNDFlQTNMcUxKaGQ5YWRmQ0VwdmN6dGtSeHJRSXdjN1d5byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9leGFtaW5hdGlvbnMvZXhhbXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1728025091),
('IzFhvjD5REtRkVX3PgSuHefLeHMHF5GnZ6wsukZH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoia2tZUG5PdGlrM1BTUHhmd1JOcDlpbUVBSHBOUlJpdkNyd2ZxYjYzNiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727414993),
('JcrCNHC6Ptp2jsvNoZj7BtwtOkBWEorxM39bN1Oi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiY1JleFFWdldQR3lBSDdpTU95d0RwbFlTRFlaZllMM2RMWXRVY2g1dSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1728024968),
('kFnhvgYwXhohypBYNayAgH1DVS9zNpQQYFQm4cDa', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVTU1ZDFDdjBqMDdLRlBtanh5S3h1OHlJalpqY3FqdVNBZWFlZ2h6ZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727417270),
('kR8QbsYsHC8DQxMr0PAh2jdUGXO6GJ0GhlWiJb0D', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiazdrWG8xV25sQ2x2VXJSU3JjTWdYelFtR3VtNzJsU2ZnVlBUNUl4VCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727417262),
('kyAF2aU0bKxAXSqO7KB6iczpVXlzF5PaNYfgHCnk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiR3JzR3NyZjhjSjF1Z1ZVSDBvMFhFWW1kYm93Q0JtNjdwakc5M0d4RSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727417784),
('mlxS9zGTuCJEmJ0Xw6JwrwG9V5u48rjaD7auCdYE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoib1pZcnZScXdWM05yVWVMR2txcWxmZjY4VnFFcmFxTG1iWHJxUlpPTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727415281),
('nL6vptkzhEGdrgqIkQ6RvsQwsCoYpY0O1QIpg0n6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRElPUzdYeTl1NXhqQk9ONm9GeVRubWNIb0pRaG1LOVBoRzRuTUdvQyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727415257),
('qna1C0GNr16Jhk5RtksuiZsYXiDaLItmU5uaBIMZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiekhuWjBWYTBHV1BZU2FVaGtiSjNVS05aamhYd2ZHMlBOcUVjT0V3UiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727418304),
('QpKLgayBlEcWZyul0cXdRNzBXI9gcy0Pr9s1RhAd', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoieWszRk5wcVowRDUxWklzRzViMkNrVTBvZXQ3VjJLMjFua1lqb0xqMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1728025087),
('rpX4mfoKBu1jhXRcVQUlXXmhcVaBzVJXbtDu6z0W', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiR0xyOHd0bUhBekFTME5iOGYxZThoMURRMlBURWhCcmJKeHg0QjdEciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727417219),
('rqMzbvhMNaFF12vFMgDT9Tg00hUVAnhkVf2IAmlu', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiM0xKbzJJZkQ2RVBWM0luVFdSajBocTV4azR2cUM1ZXd0NG9sWFZvTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727419246),
('Sk9ZtTWpOqNDrXN296gR4et6l9XnN9jTi5X0MqaY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiOGI3bHM1dUYyRXVycURyNkRlNWhYcHZMNjVXeTJwdHVmOERlWVhURiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1728024958),
('SZLFZ6R0XgLLjci6IwWZPbKIvVx3QBF2FthXesaD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoieHJaSFVwZ1FYeXJaT2xzcUZOcXIzMFJRMG1sQ1dTQW9uTVFZT0RMTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1728025092),
('t0jH3nO1YKpyrJoJpnrsz1LqkgqRV9AdSr2Yb3jF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidWRNdXV2SUo3UmdTeDNyQWZYREVZclhPSTRUeW5PZVJVTlhWdG44ViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727417255),
('VsdiVLoOUSLvLrOtLzIMDkyHp9bEpkeWzNG3lxbE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVpuUkNzM2prUmk1ZERjZmlYdnk2TlE1eHBUWTBWdmJoOUcxcGxLViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9maW5hbmNlL2ZlZS1tYW5hZ2VyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727421487),
('wJyuRRVd6vzdHXAKsNRXixWhqYyxdQhbiR6dlTcj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUW5OeVBWSTBGVjJVcDF3aUJYOE1PNHZmM2ZXdEM0Z0UyVkVJYlpydCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727415358),
('XTw8Xp7gfK0iFRQvHgOpMsCl6Q9bYULU5rbL2D75', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRWhBWFNvSmNOc1BTTkN3NkZrOTV2VHB4aEhPc1lzbW51UUthVFVUSSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1728024944),
('Y3fZwQ8RHlR4I3eZsdRWytxctPPYmzM4XQJz4kQy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoieFd2OVFJVUxUM2YxM2hNNHpzcUVWM0RNYUMydjQzamlHM2VPNHc0TiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727417273),
('YGNNM1vWKbDbwajwcnJtOgl8uMNuqFTJKmUY7pBB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZUQ2MjI4clg0bkl3aURGQTZLREtvWVZ6RUUxV3hQSHZIOTc1NjYzTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727417024),
('Yw1UZedSMEzLASqMKjon7EwOC15ow4gR1bidKtFg', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiY3paeGdEaTczdW8yVlU3akF1UnZack5HOWZDQ296bEdKaFp3amJvMiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727417974),
('ZGDy5AKvNMMSUVEG7iyZydzTxPHXTM2b1azWpwPm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNGRvVm1BRTlPMlVUMUVLYW1pbm9oZkZvQ05PVGlYNUUyYUs3REEzZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1728024576);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employeeno` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `employeeno`, `title`, `name`, `phone`, `created_at`, `updated_at`) VALUES
(1, '1', NULL, 'MR.MUTHUSI', '0722691643', '2023-05-28 23:29:12', '2023-05-28 23:29:12'),
(2, '2', NULL, 'MR.NDANI', '0725852459', '2023-05-28 23:31:08', '2023-05-28 23:31:08'),
(3, '3', NULL, 'MR.KIVUU', '0729069292', '2023-05-28 23:32:31', '2023-05-28 23:32:31'),
(4, '4', NULL, 'MR.MUSEMBI', '0729859082', '2023-05-28 23:33:31', '2023-05-28 23:33:31'),
(5, '5', NULL, 'MR.NYAMAI', '0711776645', '2023-05-28 23:35:47', '2023-05-28 23:35:47'),
(6, '06', NULL, 'MR.LANDA', '0741136458', '2023-05-28 23:36:54', '2023-05-28 23:36:54'),
(7, '7', NULL, 'MD.KAIO', '0725215820', '2023-05-28 23:38:00', '2023-05-28 23:38:00'),
(8, '8', NULL, 'MR.NZUKI', '0715652911', '2023-05-28 23:38:43', '2023-05-28 23:38:43'),
(9, '09', NULL, 'MR.MUSINGA', '0729815623', '2023-05-28 23:39:40', '2023-05-28 23:39:40'),
(10, '10', NULL, 'MR.MUTHAMI', '0717975421', '2023-05-28 23:40:56', '2023-05-28 23:40:56'),
(11, '11', NULL, 'MR.MWANZAU', '0757702131', '2023-05-28 23:41:48', '2023-05-28 23:41:48'),
(12, '12', NULL, 'MR.MULI', '0726000286', '2023-05-28 23:42:25', '2023-05-28 23:42:25'),
(13, '13', NULL, 'MR.MUTUA', '0741728661', '2023-05-28 23:43:14', '2023-05-28 23:43:14'),
(14, '14', NULL, 'MR.MUTUKU', '0711120078', '2023-05-28 23:43:50', '2023-05-28 23:43:50'),
(15, '15', NULL, 'MR.SIMON', '0722246568', '2023-05-28 23:45:02', '2023-05-28 23:45:02'),
(16, '16', NULL, 'MR.MWAMBU', '0707303277', '2023-05-28 23:46:06', '2023-05-28 23:46:06'),
(17, '17', NULL, 'MR.KIAMBA', '0729057368', '2023-05-28 23:47:22', '2023-05-28 23:47:22'),
(18, '18', NULL, 'MR.KIMATU', '0721402064', '2023-05-28 23:47:51', '2023-05-28 23:47:51'),
(19, '19', NULL, 'MR.KIEMA', '0725950806', '2023-05-28 23:48:46', '2023-05-28 23:48:46'),
(20, '20', NULL, 'MR.KILONZO', '0748928274', '2023-05-28 23:49:31', '2023-05-28 23:49:31'),
(21, '21', NULL, 'MR.MBUVI', '0706443471', '2023-05-28 23:50:08', '2023-05-28 23:50:08'),
(22, '22', NULL, 'MD.MULANDI', '0708339514', '2023-05-28 23:50:48', '2023-05-28 23:50:48'),
(23, '23', NULL, 'MR.MUEKE', '0716250507', '2023-05-28 23:51:50', '2023-05-28 23:51:50'),
(24, '24', NULL, 'MD.MUTINDA', '0723776738', '2023-05-28 23:52:40', '2023-05-28 23:52:40'),
(25, '25', NULL, 'MR.SAMSON', '0795359604', '2023-05-28 23:53:40', '2023-05-28 23:53:40'),
(26, '26', NULL, 'MR.MUTHENYA', '0712785548', '2023-05-28 23:56:13', '2023-05-28 23:56:13'),
(27, '27', NULL, 'MR.KITHEKA', '0112337254', '2023-05-28 23:57:08', '2023-05-28 23:57:08'),
(28, '28', NULL, 'MR.WAMBUA', '0728818513', '2023-05-28 23:57:55', '2023-05-28 23:57:55'),
(29, '29', NULL, 'MD.MUTILA', '0740537271', '2023-05-28 23:58:36', '2023-05-28 23:58:36'),
(30, '30', NULL, 'MR.KALUMU', '0798707172', '2023-05-28 23:59:25', '2023-05-28 23:59:25'),
(31, '31', NULL, 'MR.TITUS', '0714325823', '2023-05-29 00:00:20', '2023-05-29 00:00:20'),
(32, '32', NULL, 'MR.MALIMBI', '0729936038', '2023-05-29 00:01:10', '2023-05-29 00:01:10'),
(33, '33', NULL, 'MR.MBOYA', '0708041240', '2023-05-29 00:01:58', '2023-05-29 00:01:58'),
(34, '34', NULL, 'MD.MAKAU', '0705965273', '2023-05-29 00:02:46', '2023-05-29 00:02:46'),
(35, '35', NULL, 'MR.MUSEE', '0727760040', '2023-05-29 00:03:20', '2023-05-29 00:03:20'),
(37, '37', NULL, 'MR.UKASU', '0713604080', '2023-05-29 00:05:43', '2023-05-29 00:05:43'),
(38, '36', NULL, 'MD.MWALUKO', '0703742803', '2023-05-29 00:08:08', '2023-05-29 00:08:08'),
(39, '38', NULL, 'MR.WANDERA', '0741733875', '2023-05-29 00:09:24', '2023-05-29 00:09:24'),
(40, '39', NULL, 'MR.MULEI', '0719598603', '2023-05-29 00:10:07', '2023-05-29 00:10:07'),
(41, '40', NULL, 'MR.NDEGE', '0746389176', '2023-05-29 00:10:48', '2023-05-29 00:10:48'),
(42, '41', NULL, 'MD.MUEMA', '0705376605', '2023-05-29 00:11:46', '2023-05-29 00:11:46'),
(43, '42', NULL, 'MD.JOSHUA', '0712399441', '2023-05-29 00:13:04', '2023-05-29 00:13:04'),
(44, '43', NULL, 'MD.CYRUS', '0727380806', '2023-05-29 00:13:52', '2023-05-29 00:13:52'),
(45, '44', NULL, 'MR.MWANGANGI', '0710374348', '2023-05-29 00:14:48', '2023-05-29 00:14:48'),
(46, '45', NULL, 'MR.SILA', '0712577312', '2023-05-29 00:15:19', '2023-05-29 00:15:19');

-- --------------------------------------------------------

--
-- Table structure for table `streams`
--

CREATE TABLE `streams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `streams`
--

INSERT INTO `streams` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'white', 'qwert', '2024-08-07 02:54:53', '2024-08-07 02:54:53');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `second_name` varchar(255) NOT NULL,
  `guardian_email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `dormitory` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `date_of_birth` date NOT NULL,
  `class_id` int(11) NOT NULL,
  `admission` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `first_name`, `second_name`, `guardian_email`, `phone`, `dormitory`, `photo`, `gender`, `date_of_birth`, `class_id`, `admission`, `created_at`, `updated_at`) VALUES
(1, 'Cecile', 'Virginia Powlowski', 'your.email+fakedata22433@gmail.com', '824-553-3006', 'Gage Streich', 'students/Ae1ZRyf97xhiJyT0tADMGXtMSWyG5qYDI1br1MKQ.png', 'Female', '2024-09-05', 3, '363', '2024-06-14 05:19:38', '2024-06-14 05:19:38'),
(9, 'Lavern', 'Erick D\'Amore', 'your.email+fakedata17024@gmail.com', '800-092-3599', 'Amara Padberg', 'students/9lSZFxFVyNOYCT0r1xO4qOvfnUNFQW8F7ylmtj7H.png', 'Female', '2024-06-14', 1, '591', '2024-06-14 09:36:55', '2024-06-14 09:36:55'),
(10, 'Hazle', 'Leonie Ebert', 'your.email+fakedata67452@gmail.com', '102-117-1109', 'Laron Towne', 'students/AQy4MVQU8nrJUOBEktg9TS28xEWUw6OAh0s2tKog.png', 'Male', '2024-09-12', 1, '627', '2024-06-14 10:08:41', '2024-06-14 10:08:41');

-- --------------------------------------------------------

--
-- Table structure for table `student_fees`
--

CREATE TABLE `student_fees` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `total_fee` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `created_at`, `updated_at`) VALUES
(0, 'BIOLOGY', '2023-01-22 08:32:27', '2023-01-22 08:32:27'),
(1, 'MATHEMATICS', '2023-01-22 08:29:12', '2023-01-22 08:29:12'),
(2, 'CRE', '2023-01-22 08:29:48', '2023-01-22 08:29:48'),
(3, 'ENGLISH', '2023-01-22 08:30:03', '2023-01-22 08:30:03'),
(4, 'KISWAHILI', '2023-01-22 08:30:22', '2023-01-22 08:30:22'),
(5, 'HISTORY', '2023-01-22 08:30:41', '2023-01-22 08:30:41'),
(6, 'GEOGRAPHY', '2023-01-22 08:30:59', '2023-01-22 08:30:59'),
(7, 'BUSINESS', '2023-01-22 08:31:19', '2023-01-22 08:31:19'),
(8, 'CHEMISTRY', '2023-01-22 08:31:52', '2023-01-22 08:31:52'),
(9, 'PHYSICS', '2023-01-22 08:32:08', '2023-01-22 08:32:08'),
(10, 'AGRICULTURE', '2023-01-22 11:36:47', '2023-01-22 11:36:47'),
(22, 'TEACHER\'S GUIDE BOOKS', '2023-01-25 02:40:04', '2023-01-27 01:57:39'),
(23, 'FASIHI', '2023-01-25 09:35:57', '2023-01-25 09:35:57'),
(24, 'LITERATURE', '2023-01-25 09:36:14', '2023-01-25 09:36:14'),
(25, 'COMPUTER STUDIES', '2023-01-27 01:58:32', '2023-01-27 01:58:32'),
(26, 'REFERENCE BOOKS', '2023-01-31 07:30:43', '2023-01-31 07:30:43');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `shopname` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `account_holder` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `uuid`, `user_id`, `name`, `email`, `phone`, `address`, `shopname`, `type`, `photo`, `account_holder`, `account_number`, `bank_name`, `created_at`, `updated_at`) VALUES
(1, '6f38da28-7770-442d-8ee0-546c61b0c3c3', 1, 'Cecilia Bruen', 'audie.padberg@example.org', '+1.248.386.2854', '657 Klocko Courts Suite 797\nSouth Arnoldfurt, IN 85561', 'Osinski PLC', 'producer', NULL, 'Ned Beahan', '96225683', 'BNI', '2024-08-26 02:35:40', '2024-08-26 02:35:40'),
(2, '0b796d12-5184-4769-822e-afb88c972bea', 1, 'Ms. Clarabelle Lind', 'ondricka.lenora@example.com', '+1.785.529.5213', '74275 Dahlia View Suite 960\nSouth Malikamouth, MD 96653', 'Bartoletti-Reilly', 'producer', NULL, 'Odell Nader', '19210309', 'Mandiri', '2024-08-26 02:35:40', '2024-08-26 02:35:40'),
(3, '903685d3-72e4-4a0b-82a3-50f85903bcb2', 1, 'Collin Halvorson', 'jayden.murray@example.net', '(406) 917-1130', '49427 Schinner Valley\nSouth Braxtonside, KS 93833', 'Breitenberg Group', 'distributor', NULL, 'Mrs. Katlyn Bauch Jr.', '90172749', 'BRI', '2024-08-26 02:35:40', '2024-08-26 02:35:40'),
(4, 'd0399a0a-42de-4dde-9ee2-3004918115f8', 1, 'Eleonore Hegmann V', 'okuneva.octavia@example.com', '1-657-381-4554', '479 Leif Parkways Apt. 808\nLake Frankie, TN 13162-1108', 'Russel Ltd', 'distributor', NULL, 'Dr. Israel Kiehn', '52900937', 'Mandiri', '2024-08-26 02:35:40', '2024-08-26 02:35:40'),
(5, 'c9a7dcf0-e0b8-4b38-ac2b-e6c1642c1808', 1, 'Antonette Buckridge II', 'veronica94@example.com', '(406) 944-7147', '65942 Mraz Mountain Apt. 565\nNorth Arlie, GA 77427', 'Schowalter-Bahringer', 'wholesaler', NULL, 'Raphaelle Stanton', '13110973', 'BCA', '2024-08-26 02:35:40', '2024-08-26 02:35:40'),
(6, 'b270e7c3-8dbb-406c-bb52-3480af2cf71b', 1, 'Jennings Bahringer', 'swolff@example.org', '+1-385-421-3090', '2147 Danyka Lodge Apt. 701\nWalshmouth, DC 10962-2090', 'Koch Group', 'wholesaler', NULL, 'Savanna Hyatt', '21505761', 'Mandiri', '2024-08-26 02:35:40', '2024-08-26 02:35:40'),
(7, '77ee3462-0286-4285-89a3-6e77f96fae0a', 1, 'Jeromy White', 'ztremblay@example.org', '+1 (646) 789-3330', '3556 Sonny Courts Suite 767\nPort Bernard, WI 59804', 'Langosh Ltd', 'producer', NULL, 'Elvera Little', '55937935', 'Mandiri', '2024-08-26 02:35:40', '2024-08-26 02:35:40'),
(8, '8994d021-4f84-4226-be67-a83b9a13fc9b', 1, 'Ali Botsford MD', 'wisozk.jeffrey@example.com', '+1-351-548-2871', '8504 Halvorson Forest\nMosciskishire, CA 19338', 'Keeling, Hills and Spinka', 'distributor', NULL, 'Aiden Stamm V', '95000059', 'BSI', '2024-08-26 02:35:40', '2024-08-26 02:35:40'),
(9, '3098dd1d-66cb-45e6-abb6-e09551f65a9a', 1, 'Ervin Stamm', 'bogan.bridgette@example.org', '+1-850-342-2449', '57598 Durgan Manor\nGennaroburgh, MA 81101-3527', 'Streich and Sons', 'wholesaler', NULL, 'Chet Kilback', '46638355', 'BRI', '2024-08-26 02:35:40', '2024-08-26 02:35:40'),
(10, 'e88a3e4a-fb47-4281-9eca-8bdcfd66828b', 1, 'Mr. Leonardo Beer DDS', 'carter.kayden@example.net', '586-471-8275', '501 Torphy Views\nLake Alfurt, ID 43964', 'Pfeffer-Mills', 'distributor', NULL, 'Alisha Kris DDS', '87996470', 'Mandiri', '2024-08-26 02:35:40', '2024-08-26 02:35:40'),
(11, '8175af71-f52a-460a-a0b9-c2ecdffd3900', 1, 'Reba Bailey', 'toy.harley@example.com', '+1.915.573.4815', '1880 Langworth Inlet\nWest Adolfo, TN 53543-1217', 'Schultz Inc', 'producer', NULL, 'Tatyana Haley', '86312693', 'BNI', '2024-08-26 02:35:40', '2024-08-26 02:35:40'),
(12, '8b603d27-8b21-4f1d-b83a-5727bdec15c8', 1, 'Ms. Elissa Denesik Jr.', 'kayley05@example.net', '(940) 899-2953', '87383 Luella Cliffs\nNorth Rosaliaville, NM 43188', 'Prohaska-Spencer', 'distributor', NULL, 'Dr. Jerome Kreiger', '19343629', 'BCA', '2024-08-26 02:35:40', '2024-08-26 02:35:40'),
(13, '33f71c76-5f64-42dd-9cb8-fb6aa0819c22', 1, 'Madie Franecki', 'ckunde@example.org', '+1-541-537-2650', '96923 Gibson Meadow Suite 171\nHayesmouth, NV 42712-5062', 'Donnelly-Langosh', 'wholesaler', NULL, 'Damian Corkery', '35974713', 'BNI', '2024-08-26 02:35:40', '2024-08-26 02:35:40'),
(14, 'c4990a12-c920-4805-809b-8262beef2950', 1, 'Assunta Cronin', 'melany60@example.org', '630.247.1611', '18570 Cooper Dale\nKerlukeberg, LA 09389-8713', 'Bartoletti-Sawayn', 'producer', NULL, 'Daphnee Jenkins', '26822071', 'Mandiri', '2024-08-26 02:35:40', '2024-08-26 02:35:40'),
(15, '66d1333d-f54e-457d-974b-346d4337484e', 1, 'Robbie DuBuque', 'eshanahan@example.com', '(678) 867-1193', '388 Vincenzo Loop Suite 536\nCormierberg, SD 66296', 'Gaylord, Hyatt and Sawayn', 'producer', NULL, 'Dr. Tianna Herzog', '86767499', 'BSI', '2024-08-26 02:35:40', '2024-08-26 02:35:40');

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `year` year(4) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`id`, `name`, `year`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(2, 'Term 1', 0000, '2024-01-01', '2024-04-30', NULL, NULL),
(3, 'Term 2', 0000, '2024-05-01', '2024-07-30', NULL, NULL),
(4, 'Term 3', 0000, '2024-08-01', '2024-12-20', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `user_id`, `name`, `slug`, `short_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'Meters', 'meters', 'm', NULL, NULL),
(2, 1, 'Centimeters', 'centimeters', 'cm', NULL, NULL),
(3, 1, 'Piece', 'piece', 'pc', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Admin User', 'admin@gmail.com', NULL, '$2y$12$86moan3di.VIgcLQDyrM7.MWqCre91oFZ8fF4PP1EuNfcj88ts5ii', NULL, '2024-05-29 04:25:50', '2024-05-29 04:25:50'),
(5, 'Instructor User', 'instructor@gmail.com', NULL, '$2y$12$QN0FiC82Wcm.1/pq4BF1Y.GzBVFA9PUKW5q6WSt03LmJA37ep9FC2', NULL, '2024-05-29 04:25:50', '2024-05-29 04:25:50'),
(6, 'Finance User', 'finance@gmail.com', NULL, '$2y$12$KHG0VawsFhHwtRClHGv/je1CLunFjSYeDIodbAhjfxf9a8UVAL.iq', NULL, '2024-05-29 04:25:51', '2024-05-29 04:25:51'),
(7, 'Library User', 'library@gmail.com', NULL, '$2y$12$/1hCLMiznpNU4XOrE2QYyuuBYF9aNC4gWGa8IXzUrnOj1ixYmz28e', NULL, '2024-05-29 04:25:51', '2024-05-29 04:25:51'),
(8, 'Guardian User', 'guardian@gmail.com', NULL, '$2y$12$7kC78Li3hSvCffawtQB3euLyIkJzXZzZEuyKUXP/9EVN.W3R72N4i', NULL, '2024-05-29 04:25:51', '2024-05-29 04:25:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_year`
--
ALTER TABLE `academic_year`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_issues`
--
ALTER TABLE `book_issues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_issue_histories`
--
ALTER TABLE `book_issue_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_term` (`term_id`);

--
-- Indexes for table `exam_terms`
--
ALTER TABLE `exam_terms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fee_details`
--
ALTER TABLE `fee_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_structure_id` (`fee_structure_id`);

--
-- Indexes for table `fee_payments`
--
ALTER TABLE `fee_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `fee_structures`
--
ALTER TABLE `fee_structures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guardians`
--
ALTER TABLE `guardians`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `hostels`
--
ALTER TABLE `hostels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `level` (`level`);

--
-- Indexes for table `library_settings`
--
ALTER TABLE `library_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_exam` (`paper_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `papers`
--
ALTER TABLE `papers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_user_id_foreign` (`user_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_supplier_id_foreign` (`supplier_id`),
  ADD KEY `purchases_user_id_foreign` (`user_id`);

--
-- Indexes for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_details_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchase_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotations_customer_id_foreign` (`customer_id`),
  ADD KEY `quotations_user_id_foreign` (`user_id`);

--
-- Indexes for table `quotation_details`
--
ALTER TABLE `quotation_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_details_quotation_id_foreign` (`quotation_id`),
  ADD KEY `quotation_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `streams`
--
ALTER TABLE `streams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_stream` (`name`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `guardian_email` (`guardian_email`),
  ADD UNIQUE KEY `unique_admission` (`admission`),
  ADD UNIQUE KEY `unique_adm` (`admission`);

--
-- Indexes for table `student_fees`
--
ALTER TABLE `student_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `level_id` (`level_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `suppliers_email_unique` (`email`),
  ADD UNIQUE KEY `suppliers_phone_unique` (`phone`),
  ADD KEY `suppliers_user_id_foreign` (`user_id`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_year`
--
ALTER TABLE `academic_year`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_issues`
--
ALTER TABLE `book_issues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `book_issue_histories`
--
ALTER TABLE `book_issue_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `exam_terms`
--
ALTER TABLE `exam_terms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_details`
--
ALTER TABLE `fee_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fee_payments`
--
ALTER TABLE `fee_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_structures`
--
ALTER TABLE `fee_structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `guardians`
--
ALTER TABLE `guardians`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hostels`
--
ALTER TABLE `hostels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `library_settings`
--
ALTER TABLE `library_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `papers`
--
ALTER TABLE `papers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_details`
--
ALTER TABLE `purchase_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_details`
--
ALTER TABLE `quotation_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `streams`
--
ALTER TABLE `streams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `student_fees`
--
ALTER TABLE `student_fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `fk_term` FOREIGN KEY (`term_id`) REFERENCES `terms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_details`
--
ALTER TABLE `fee_details`
  ADD CONSTRAINT `fee_details_ibfk_1` FOREIGN KEY (`fee_structure_id`) REFERENCES `fee_structures` (`id`);

--
-- Constraints for table `fee_payments`
--
ALTER TABLE `fee_payments`
  ADD CONSTRAINT `fee_payments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `fk_exam` FOREIGN KEY (`paper_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  ADD CONSTRAINT `purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD CONSTRAINT `purchase_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_details_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quotation_details`
--
ALTER TABLE `quotation_details`
  ADD CONSTRAINT `quotation_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `quotation_details_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_fees`
--
ALTER TABLE `student_fees`
  ADD CONSTRAINT `student_fees_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `student_fees_ibfk_2` FOREIGN KEY (`level_id`) REFERENCES `classes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
