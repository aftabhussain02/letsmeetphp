-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2018 at 03:26 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.1.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `letsmeet`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('148d47be3eedd91c4b534ba76b0fcc5948680aae21d11251b9cf403c1f7f5b9bd1ddab30a35f7531', 1, 1, 'MyApp', '[]', 0, '2018-06-25 06:48:20', '2018-06-25 06:48:20', '2019-06-25 12:18:20'),
('1b222c4cb7d8b546d52f2ed7494eb6cec7642f4c735cb0b41b7ec7a84fe8ff117cfd859c5cd2bb71', 1, 1, 'MyApp', '[]', 0, '2018-06-26 00:46:39', '2018-06-26 00:46:39', '2019-06-26 06:16:39'),
('2e80943e47d4b458ad157b5368326a71a1c3c93af43f375ae5b556878b008df38d9f06e9bed4d4e8', 1, 1, 'MyApp', '[]', 0, '2018-06-26 00:44:00', '2018-06-26 00:44:00', '2019-06-26 06:14:00'),
('6831113a5667ed8eaff89a3fa249dccb7a0ec23cdd1b46b72f3bf0870869bfa805d245b5721b1024', 1, 1, 'MyApp', '[]', 0, '2018-06-26 00:56:27', '2018-06-26 00:56:27', '2019-06-26 06:26:27'),
('763831fd1a203939bf8506f9ae455ab26202efb6ed486b10e414c5a6ff04e8a6786a17bda3d512ac', 1, 1, 'MyApp', '[]', 0, '2018-06-26 01:03:36', '2018-06-26 01:03:36', '2019-06-26 06:33:36'),
('8f9474ae88d0b3b312c70089c5a374d42abde8e510aa4b6e9109294c48065150b9c2258bc679cd2f', 1, 1, 'MyApp', '[]', 0, '2018-06-26 00:53:28', '2018-06-26 00:53:28', '2019-06-26 06:23:28'),
('a09397364f49fcee4575232db2a709efb6143c6ec6e62b7a14193bd8623420fb56f3e617233406ac', 1, 1, 'MyApp', '[]', 0, '2018-06-26 01:04:52', '2018-06-26 01:04:52', '2019-06-26 06:34:52'),
('aa8abef2065932360cee815d9481b6b88b6aaadd4fe24403fd29fc866b5ef1cd883bfc6891907e43', 1, 1, 'MyApp', '[]', 0, '2018-06-26 00:55:40', '2018-06-26 00:55:40', '2019-06-26 06:25:40'),
('b96074bcaff31671f94e4a9cab15b64c58f3d65aa63458951861445c09b2f908e87d8ba47035b7e1', 1, 1, 'MyApp', '[]', 0, '2018-06-26 00:57:00', '2018-06-26 00:57:00', '2019-06-26 06:27:00'),
('ba7d5217951ee8f612e996fa718d9ff2af63355ce140fb377fb7167a3464dc67e8815c3c4565b410', 1, 1, 'MyApp', '[]', 0, '2018-06-26 01:12:05', '2018-06-26 01:12:05', '2019-06-26 06:42:05'),
('caa925124894cd29a35a2a4c93664daa1e4f2e538371b890d4c35062f0ded626fba955d5674386dc', 1, 1, 'MyApp', '[]', 0, '2018-06-25 06:19:02', '2018-06-25 06:19:02', '2019-06-25 11:49:02'),
('d712a688afddb1ce00dfa827859264600353bc00a1ca2b3ce734f9ae4b6f74aa14294422fbc634e5', 1, 1, 'MyApp', '[]', 0, '2018-06-25 07:30:35', '2018-06-25 07:30:35', '2019-06-25 13:00:35'),
('eb7e35779f60b2faeedb9fa828cc4b5ead92b5d446a3e7346b3db09a86c9099a787c4747a82549b3', 1, 1, 'MyApp', '[]', 0, '2018-06-26 00:46:06', '2018-06-26 00:46:06', '2019-06-26 06:16:06'),
('f8b5b36116d3b0e3601b2e46e447e12e8fa8f48b02c73ebcfe94548af8e9d0ebb00aab1a7ac6e040', 1, 1, 'MyApp', '[]', 0, '2018-06-25 06:28:01', '2018-06-25 06:28:01', '2019-06-25 11:58:01');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'F9iI6CQf0GuZRTggBWe6gD6cMrLBMQQsdtrd7iyQ', 'http://localhost', 1, 0, 0, '2018-06-25 05:54:32', '2018-06-25 05:54:32'),
(2, NULL, 'Laravel Password Grant Client', 'BkP8jeOClxI0MfQ9U9tMbf0kCuEb0CraFzoIRbGA', 'http://localhost', 0, 1, 0, '2018-06-25 05:54:32', '2018-06-25 05:54:32');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-06-25 05:54:32', '2018-06-25 05:54:32');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'aftab', 'test@test.com', '$2y$10$OPbLHzQgjRSV5UoQlFqjLuSD0pj06UCxL693RSby4.W0KPvnkTHpm', NULL, '2018-06-25 06:09:09', '2018-06-25 06:09:09'),
(2, 'aftab hussain', 'test2@test.com', '$2y$10$PUKIknLGoXqjb8jwHAUTvu6TrNTKenNHeEGsET.47vt4T2SkBDpuK', '7VBiHSWWeoBH0tIFnW3TgJATiroXn3t68kFRp2QlVWdMDvY2O5KKecl7aKJY', '2018-06-26 06:42:04', '2018-06-26 06:42:04'),
(3, 'hussain aftab', 'test3@gmail.com', '$2y$10$61GI1L3IUbVhuqH3pwAFZ.BOGKwc9ZvdcZj6PEu2HjQTxR57tsUnW', 'DSDPfc3FVLOiHg9wn5GQTBzlyvJ0wcQF16MQXQtcYx7WifVzHXy9ahVNmOY6', '2018-06-26 06:42:39', '2018-06-26 06:42:39');

--
-- Indexes for dumped tables
--

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
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
