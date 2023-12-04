-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2023 at 11:52 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `entercode`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pembeli_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `pembeli_id`, `product_id`, `qty`, `created_at`, `updated_at`) VALUES
(9, 5, 10, 1, '2023-12-04 03:45:30', '2023-12-04 03:45:30');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_12_02_030602_addroleuser', 1),
(6, '2023_12_02_030904_create_products_table', 1),
(7, '2023_12_02_031429_create_carts_table', 2),
(8, '2023_12_02_031619_create_transaksis_table', 3),
(9, '2023_12_02_031715_create_transaksi_details_table', 3),
(10, '2016_06_01_000001_create_oauth_auth_codes_table', 4),
(11, '2016_06_01_000002_create_oauth_access_tokens_table', 4),
(12, '2016_06_01_000003_create_oauth_refresh_tokens_table', 4),
(13, '2016_06_01_000004_create_oauth_clients_table', 4),
(14, '2016_06_01_000005_create_oauth_personal_access_clients_table', 4),
(15, '2023_12_04_012049_addapitoken', 5),
(16, '2023_12_04_062226_addstatus', 6);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('2613caeb256978e34659d6288eae22f01d455fb092717b007c083d2e2ed422b09ff19d34bdddce5d', 5, 3, 'authToken', '[]', 0, '2023-12-04 02:49:56', '2023-12-04 02:49:56', '2024-12-04 09:49:56'),
('3fac01a25cd718cd1a716e889469d125dc06ad6ecf71b8b56c90b11190aceeb7dbb4b82faa512113', 5, 3, 'authToken', '[]', 0, '2023-12-03 19:36:42', '2023-12-03 19:36:42', '2024-12-04 02:36:42'),
('501c9045335f79bcaf44a4f5d368a82e2cceaf0074647d4d11987e1eb7e63afc1da01c75df9c1aaa', 5, 3, 'authToken', '[]', 0, '2023-12-04 01:09:05', '2023-12-04 01:09:05', '2024-12-04 08:09:05'),
('57cbdefee77db1301c24e9097d68ee4cdfc7e04966ef4a85767a2351172af75b85fb1621063164e7', 5, 3, 'authToken', '[]', 0, '2023-12-03 18:47:11', '2023-12-03 18:47:11', '2024-12-04 01:47:11'),
('5a9982a3446baee772ea77f91903a78ef207da8e6c132abaccf5f0cb80667a52132cbca94c1f2061', 5, 3, 'authToken', '[]', 0, '2023-12-04 02:28:43', '2023-12-04 02:28:43', '2024-12-04 09:28:43'),
('5d3e9f4bb9e52d4c26b6e6b801f267fcde50077d797f5b4dd90f37134e43b270ad6da3b48c5ba5ee', 5, 3, 'authToken', '[]', 0, '2023-12-03 18:56:29', '2023-12-03 18:56:29', '2024-12-04 01:56:29'),
('5fad18a4eb4904b36be6e7d6192020235d02916a89db7cff94b3c8fa350e378184a17523a26c41fe', 5, 3, 'authToken', '[]', 0, '2023-12-03 20:58:45', '2023-12-03 20:58:45', '2024-12-04 03:58:45'),
('758c32c9c538960664da5cd2c7530170aa4361994e0d276b16843ad8888dcfddf65c923d39916fdf', 5, 3, 'authToken', '[]', 0, '2023-12-03 18:51:09', '2023-12-03 18:51:09', '2024-12-04 01:51:09'),
('7660a085c50e3008eb1b9a9ee113750000b9da31cfbc829efc54c20141c4a9c1a41cc904c5f81618', 5, 3, 'authToken', '[]', 0, '2023-12-04 02:37:33', '2023-12-04 02:37:33', '2024-12-04 09:37:33'),
('7ae71b5a2884c8c9154460e4d4c4ba3a04298363cd5db7ebd0c10cf3731c1781800d12fbb8363cd0', 5, 3, 'authToken', '[]', 0, '2023-12-03 18:53:38', '2023-12-03 18:53:39', '2024-12-04 01:53:38'),
('985733c9b8b33d3a1cb4e92c6ac88e9c2ab338d490adb7609ae5512926520c5487cbf47ae63df301', 5, 3, 'authToken', '[]', 0, '2023-12-04 02:53:51', '2023-12-04 02:53:51', '2024-12-04 09:53:51'),
('a1769e8c6a8ec5cbf047cea8bfbb03a243731d94e752a8b64800ae348b7304205aa163d9d7440f04', 6, 3, 'authToken', '[]', 0, '2023-12-03 18:42:40', '2023-12-03 18:42:40', '2024-12-04 01:42:40'),
('a5ba696941aa7225aa576ff234e30d8e62fffb9b357b11c9484e309dfba960fa0552456c0a52c733', 5, 3, 'authToken', '[]', 0, '2023-12-04 02:24:10', '2023-12-04 02:24:10', '2024-12-04 09:24:10'),
('a82a1f29f6ee5c7fa20f41b81f4ac1f3d9dc305b43b8bd9b153e23a15560435522f96a9f788268e3', 6, 3, 'authToken', '[]', 0, '2023-12-03 19:43:18', '2023-12-03 19:43:18', '2024-12-04 02:43:18'),
('b42dbad5c6a9e973920e2fa4e69fa87ef57820f50c1fb6810f0e753223cd47fa0881fd39ded8cddb', 6, 3, 'authToken', '[]', 0, '2023-12-03 20:04:46', '2023-12-03 20:04:46', '2024-12-04 03:04:46'),
('bcc7e5273fbc91dfba04e8510cd20bce7db797077aaea8da1b51cf19c1c50b1910243217ed37ed48', 5, 3, 'authToken', '[]', 0, '2023-12-04 01:09:38', '2023-12-04 01:09:38', '2024-12-04 08:09:38'),
('c9e5fad6d230362c2c939ff20c0d2e0c44d95437fb0259f0e6d1ff66b99d0f2f948eeea5905d5657', 5, 3, 'authToken', '[]', 0, '2023-12-03 19:45:02', '2023-12-03 19:45:02', '2024-12-04 02:45:02'),
('ca075703fd17e2aec97083c20b841471bba0739b8cc9db06443f33f7e4e03c56853ebab4681920a1', 6, 3, 'api_token', '[]', 0, '2023-12-03 18:41:59', '2023-12-03 18:41:59', '2024-12-04 01:41:59'),
('d17adcf34a7efc240228e24d4a15a34ec83205932e756a03df0b0749c1953a94a46beb53d1c935cc', 5, 3, 'authToken', '[]', 0, '2023-12-03 18:43:55', '2023-12-03 18:43:55', '2024-12-04 01:43:55'),
('d3c42b87cd711721ffa4352ef7197014b27e2ddf9acb6e61617ac39b993da12935de4bb73bb380ab', 5, 3, 'authToken', '[]', 0, '2023-12-04 02:27:43', '2023-12-04 02:27:43', '2024-12-04 09:27:43'),
('dbb919abd414492294eb8e9f6bb3ff26ff3828c16927b6eeb7e4bfd5d0482935e9e8d840e5d6af90', 5, 3, 'authToken', '[]', 0, '2023-12-03 21:25:36', '2023-12-03 21:25:36', '2024-12-04 04:25:36'),
('e6b3a5b70013a6d2689802b2182d2b53dab7e9dd39b9ca8c4f6d22f6d5bfe343daf8687d0878c5f9', 6, 3, 'authToken', '[]', 0, '2023-12-03 20:07:18', '2023-12-03 20:07:18', '2024-12-04 03:07:18'),
('ebffb6de4d33fd58e878a6e669475ea002bf440da175ff83e2ba30c0dfebc953c0c05e105d63527a', 5, 3, 'authToken', '[]', 0, '2023-12-04 02:30:45', '2023-12-04 02:30:45', '2024-12-04 09:30:45'),
('fe8912e9f603372d0464d06d4402325b5391f50a0e2ce1cdbb3a896a0e9c281bbf1e86a311d31b91', 5, 3, 'authToken', '[]', 0, '2023-12-04 02:39:15', '2023-12-04 02:39:15', '2024-12-04 09:39:15');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'hSGLhaaObzm8jGtpeUEM1oPAiqm8gXmCD3f6AKKz', NULL, 'http://localhost', 1, 0, 0, '2023-12-03 18:32:45', '2023-12-03 18:32:45'),
(2, NULL, 'Laravel Password Grant Client', 'NdxxfdeMGxJSAEOFkx0ibIkxfbz0S21BRDvImaXM', 'users', 'http://localhost', 0, 1, 0, '2023-12-03 18:32:45', '2023-12-03 18:32:45'),
(3, NULL, 'Laravel Personal Access Client', '54NhhRZ2txxvmGc1fAY2V0QBqzjg0HvRcnpsxicn', NULL, 'http://localhost', 1, 0, 0, '2023-12-03 18:41:09', '2023-12-03 18:41:09'),
(4, NULL, 'Laravel Password Grant Client', 'EWV5ZfooMdjBa4mJHkKkhNGO0jzoiS2Ewbe0qJIw', 'users', 'http://localhost', 0, 1, 0, '2023-12-03 18:41:09', '2023-12-03 18:41:09');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-12-03 18:32:45', '2023-12-03 18:32:45'),
(2, 3, '2023-12-03 18:41:09', '2023-12-03 18:41:09');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'App\\Models\\User', 5, 'authToken', 'd52e232ae33136599acd09150a4aaeab9f17b7774d82491c2b4c7b403d2503f8', '[\"*\"]', NULL, NULL, '2023-12-02 19:22:54', '2023-12-02 19:22:54'),
(2, 'App\\Models\\User', 5, 'authToken', 'f2011a6aecab2b6ada3bb40c81413ad0c4336e251d52f49d19273669e54b1067', '[\"*\"]', NULL, NULL, '2023-12-02 19:43:01', '2023-12-02 19:43:01'),
(3, 'App\\Models\\User', 5, 'authToken', 'fe81af3e86242a45c9953c32afe27b18488ec04e3eb404c6b8bfcbadf0399509', '[\"*\"]', NULL, NULL, '2023-12-02 19:44:24', '2023-12-02 19:44:24'),
(4, 'App\\Models\\User', 5, 'authToken', '378f818382e89387299a3ec083f728a51f9093bfcd518854a83c0a142c59727b', '[\"*\"]', NULL, NULL, '2023-12-02 19:44:45', '2023-12-02 19:44:45'),
(5, 'App\\Models\\User', 5, 'authToken', '82b0db94074003d42b84badfa6519faa840e1a2252dcb57e78de3f0b1334a627', '[\"*\"]', '2023-12-02 19:48:18', NULL, '2023-12-02 19:47:48', '2023-12-02 19:48:18'),
(6, 'App\\Models\\User', 6, 'authToken', 'eb3d2d999719b361dea9cc7e408979095ef14f8969ac896433d08a44af0d9f8a', '[\"*\"]', '2023-12-02 19:52:18', NULL, '2023-12-02 19:52:02', '2023-12-02 19:52:18'),
(7, 'App\\Models\\User', 6, 'api_token', 'c84dc7f9ec2098093f2962ced54eed80e52df5525638d2bd8028ee60288f9b7f', '[\"*\"]', NULL, NULL, '2023-12-02 19:54:43', '2023-12-02 19:54:43'),
(8, 'App\\Models\\User', 6, 'api_token', '91b844d178b906dcd967da8f7d1bb31dbc97a25936cb95ab2c6ca994a6f059f6', '[\"*\"]', NULL, NULL, '2023-12-03 18:22:10', '2023-12-03 18:22:10'),
(9, 'App\\Models\\User', 6, 'api_token', '9270ee659d25d899e228efd3f6da7bd768f9e71d0488a001fe1ab2584d825a8c', '[\"*\"]', NULL, NULL, '2023-12-03 18:22:51', '2023-12-03 18:22:51');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `image`, `name`, `price`, `qty`, `created_at`, `updated_at`) VALUES
(1, '5edFcw9euQSaKEHwZ7GgAm5fiE8GGI2SCllezHVu.png', 'handuk', 32000.00, 1, '2023-12-02 16:06:28', '2023-12-02 16:28:36'),
(10, '6ruxpSuTtpO1R5rK0NSDLIYkqrEVj75hEEBEAWKQ.png', 'celana dalam', 10000.00, 1, '2023-12-03 21:00:34', '2023-12-03 21:00:34');

-- --------------------------------------------------------

--
-- Table structure for table `transaksis`
--

CREATE TABLE `transaksis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('pending','dibayar','diproses') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksis`
--

INSERT INTO `transaksis` (`id`, `invoice`, `total`, `user_id`, `created_at`, `updated_at`, `status`) VALUES
(43, 'TRX-2B8SU5WBT6', 138000.00, 5, '2023-12-04 00:13:27', '2023-12-04 00:13:27', 'pending'),
(44, 'TRX-253385KNZM', 62000.00, 5, '2023-12-04 03:39:42', '2023-12-04 03:39:42', 'pending'),
(45, 'TRX-Q61P7E7C1B', 42000.00, 5, '2023-12-04 03:44:26', '2023-12-04 03:44:26', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_details`
--

CREATE TABLE `transaksi_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaksi_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksi_details`
--

INSERT INTO `transaksi_details` (`id`, `transaksi_id`, `product_id`, `qty`, `sub_total`, `created_at`, `updated_at`) VALUES
(85, 43, 1, 4, 128000.00, '2023-12-04 00:13:27', '2023-12-04 00:13:27'),
(86, 43, 10, 1, 10000.00, '2023-12-04 00:13:27', '2023-12-04 00:13:27'),
(87, 44, 10, 3, 30000.00, '2023-12-04 03:39:42', '2023-12-04 03:39:42'),
(88, 44, 1, 1, 32000.00, '2023-12-04 03:39:42', '2023-12-04 03:39:42'),
(89, 45, 1, 1, 32000.00, '2023-12-04 03:44:26', '2023-12-04 03:44:26'),
(90, 45, 10, 1, 10000.00, '2023-12-04 03:44:26', '2023-12-04 03:44:26');

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('penjual','pembeli') NOT NULL,
  `api_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`, `api_token`) VALUES
(5, 'customer', 'customer@gmail.com', NULL, '$2y$12$1X5vdCIdnLg0TGYURXdLAebxzDP0bswnzwMbT.Vu0kIXnGc3y82Ji', NULL, '2023-12-02 19:22:08', '2023-12-02 19:22:08', 'pembeli', NULL),
(6, 'Administrator', 'admin@gmail.com', NULL, '$2y$12$c10hkLrrs3EOMzKI9xCPe.Y/PVJ.Fp19CeEZv15pHBffFNiPZ1b4K', NULL, NULL, NULL, 'penjual', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksis`
--
ALTER TABLE `transaksis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi_details`
--
ALTER TABLE `transaksi_details`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transaksis`
--
ALTER TABLE `transaksis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `transaksi_details`
--
ALTER TABLE `transaksi_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
