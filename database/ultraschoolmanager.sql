-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2024 at 03:29 PM
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
('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:15:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:13:\"view students\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:3;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:15:\"manage students\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:16:\"view instructors\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:18:\"manage instructors\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:12:\"view finance\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:4;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:14:\"manage finance\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:4;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:12:\"view library\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:5;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:14:\"manage library\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:5;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:12:\"view parents\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:14:\"manage parents\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:16:\"view own profile\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:6:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:5;i:5;i:6;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:16:\"edit own profile\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:6;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:14:\"manage grading\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:3;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:12:\"view grading\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:3;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:13:\"manage orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:6:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:5:\"admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:3;s:1:\"b\";s:10:\"instructor\";s:1:\"c\";s:3:\"web\";}i:2;a:3:{s:1:\"a\";i:4;s:1:\"b\";s:7:\"finance\";s:1:\"c\";s:3:\"web\";}i:3;a:3:{s:1:\"a\";i:5;s:1:\"b\";s:7:\"library\";s:1:\"c\";s:3:\"web\";}i:4;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:7:\"student\";s:1:\"c\";s:3:\"web\";}i:5;a:3:{s:1:\"a\";i:6;s:1:\"b\";s:8:\"guardian\";s:1:\"c\";s:3:\"web\";}}}', 1717052885);

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
(30, 'App\\Models\\User', 3, 'authToken', '6ecc687573315e3b8f8f8ea295790184c610158dfef74b3c451042858e18c1b8', '[\"*\"]', NULL, NULL, '2024-05-29 09:52:39', '2024-05-29 09:52:39');

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
('2iEo3nDVDUwNbeagw9ug2DNHf8ZnrAWZZgrzqfiD', NULL, '127.0.0.1', 'PostmanRuntime/7.39.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1B5QlE2QUdEVWR5MFBudDY3c0VHUkozd2JFeTgzaG4yTFFoRnk5RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1716977933),
('6Gc5OTNk7GKem6Aure5jBJPQyLXMjaETUJcjMQhV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaVAxbHNscnhrVHFZY3hVVkhKY0NPU1FlZng2b2VPNjBtRjM5THo1ZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1716970961),
('HqRIZ7sK8SpzFmY96LtfW8LMfCHUS4EAEacJG7w6', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3JtbG8zUFd1eGo5MlhMdUpYc3hLT0xpYndOYktYNmZzSk96MGlwVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fX0=', 1716988906),
('t6qukNG08t52VoEk60OHNt9DHne63QLGOGUCvmFl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmhoNUFGUXdUdWdjQm16YjFpMmNkQ2VFQUs3N3RpSzhma2twZjE0OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1716988907),
('vgRRruWuUKhULp30pVMLIY8YVWQWpWC9O4DbiGdt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMlR1NUlVd0QwWlp6T1dzd1V6b0VGcDlxYlFQUlhTanA5Uk9LOHNuZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1716987760);

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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

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
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
