-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 01, 2020 at 06:20 PM
-- Server version: 5.7.20-0ubuntu0.16.04.1
-- PHP Version: 7.3.16-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_campaign`
--

CREATE TABLE `tbl_campaign` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `landing_url` varchar(255) NOT NULL,
  `content_type` tinyint(4) DEFAULT NULL COMMENT '1->adult,2->non adult',
  `budget` int(11) NOT NULL,
  `bid` float NOT NULL,
  `limit_per_day` tinyint(4) DEFAULT NULL,
  `raw_traffic` tinyint(4) DEFAULT '1' COMMENT 'Raw Traffic Per Day',
  `current_balance` float NOT NULL COMMENT 'My Balance',
  `total_budget` float NOT NULL COMMENT 'Total campaign budget',
  `min_impressions` int(11) NOT NULL COMMENT 'Purchasing minimum impressions of',
  `created_by` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0->inactive,1->active,2->deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_campaign_target`
--

CREATE TABLE `tbl_campaign_target` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `countries` varchar(255) NOT NULL,
  `os` varchar(255) NOT NULL,
  `browsers` varchar(255) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_files`
--

CREATE TABLE `tbl_files` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_files`
--

INSERT INTO `tbl_files` (`id`, `name`, `created`, `updated`, `status`) VALUES
(1, 'file.doc', '2020-04-01 02:34:54', '2020-04-01 02:34:54', 1),
(2, 'saafsdfd.doc', '2020-04-01 02:37:12', '2020-04-01 02:37:12', 1),
(3, 'saafsdfd.doc', '2020-04-01 02:37:13', '2020-04-01 02:37:13', 1),
(4, 'saafsdfd.doc', '2020-04-01 02:38:26', '2020-04-01 02:38:26', 1),
(5, 'saafsdfd.doc', '2020-04-01 02:40:22', '2020-04-01 02:40:22', 1),
(6, 'saafsdfd.doc', '2020-04-01 02:40:57', '2020-04-01 02:40:57', 1),
(7, 'saafsdfd.doc', '2020-04-01 02:40:59', '2020-04-01 02:40:59', 1),
(8, 'saafsdfd.doc', '2020-04-01 02:40:59', '2020-04-01 02:40:59', 1),
(9, 'saafsdfd.doc', '2020-04-01 02:41:00', '2020-04-01 02:41:00', 1),
(10, 'saafsdfd.doc', '2020-04-01 02:41:00', '2020-04-01 02:41:00', 1),
(11, 'saafsdfd.doc', '2020-04-01 02:41:00', '2020-04-01 02:41:00', 1),
(12, 'saafsdfd.doc', '2020-04-01 02:41:00', '2020-04-01 02:41:00', 1),
(13, 'saafsdfd.doc', '2020-04-01 02:41:01', '2020-04-01 02:41:01', 1),
(14, 'saafsdfd.doc', '2020-04-01 02:42:27', '2020-04-01 02:42:27', 1),
(15, 'Ronald-Altidor_cyB9ZT6JTs.docx', '2020-04-01 02:42:40', '2020-04-01 02:42:40', 1),
(16, 'Ronald-Altidor_T8AoSciIjd.docx', '2020-04-01 02:43:10', '2020-04-01 02:43:10', 1),
(17, 'Ronald-Altidor_aNLTTxAv57.docx', '2020-04-01 02:49:26', '2020-04-01 02:49:26', 1),
(18, 'Ronald-Altidor_nU3Weu8RHk.docx', '2020-04-01 02:49:34', '2020-04-01 02:49:34', 1),
(19, 'Kenneth_Simmons_draft_3_resume_csYlsQIKX0.docx', '2020-04-01 03:02:11', '2020-04-01 03:02:11', 1),
(20, 'Kenneth_Simmons_draft_3_resume_jg2ZEF0YOY.docx', '2020-04-01 03:02:48', '2020-04-01 03:02:48', 1),
(21, 'Kenneth_Simmons_draft_3_resume_HggZOu8tOL.docx', '2020-04-01 03:03:14', '2020-04-01 03:03:14', 1),
(22, 'Kenneth_Simmons_draft_3_resume_5vmrSl4gtQ.docx', '2020-04-01 03:03:52', '2020-04-01 03:03:52', 1),
(23, 'Noelle_Betatache_Resume_v5_other_version_FEGvvrV7E7.doc', '2020-04-01 15:47:42', '2020-04-01 15:47:42', 1),
(24, 'Alamgir_copy_MsqW9pJjQT.doc', '2020-04-01 15:47:58', '2020-04-01 15:47:58', 1),
(25, 'AndreRodrigues_-_2nd_draft_hx1I5okMGG.docx', '2020-04-01 15:48:56', '2020-04-01 15:48:56', 1),
(26, 'Kenneth_Simmons_draft_3_resume_qNlcYNrH46.docx', '2020-04-01 16:22:45', '2020-04-01 16:22:45', 1),
(27, 'Untitled_document_v8IGafZc2k.docx', '2020-04-01 16:39:01', '2020-04-01 16:39:01', 1),
(28, 'Untitled_document_ZTweVd0tki.docx', '2020-04-01 17:08:19', '2020-04-01 17:08:19', 1),
(29, 'form24_lBO97PpGOi.doc', '2020-04-01 17:14:06', '2020-04-01 17:14:06', 1),
(30, 'Noelle_Betatache_Resume_v5_other_version_5ExSZt1N0l.doc', '2020-04-01 17:14:16', '2020-04-01 17:14:16', 1),
(31, 'Noelle_Betatache_Resume_v5_other_version_VintCTSThP.doc', '2020-04-01 17:14:33', '2020-04-01 17:14:33', 1),
(32, 'Alamgir_copy_vvbi0wuedk.doc', '2020-04-01 17:14:38', '2020-04-01 17:14:38', 1),
(33, 'Noelle_Betatache_Resume_v5_1707_BU9aHq1gwQ.doc', '2020-04-01 17:14:43', '2020-04-01 17:14:43', 1),
(34, 'Untitled_document_kbsrBa2R5z.doc', '2020-04-01 17:15:58', '2020-04-01 17:15:58', 1),
(35, 'Untitled_document_I3DrIw7DyG.doc', '2020-04-01 17:16:35', '2020-04-01 17:16:35', 1),
(36, 'Untitled_document_FR2qqKs7Ff.doc', '2020-04-01 17:17:06', '2020-04-01 17:17:06', 1),
(37, 'Untitled_document_qs2GwI65QD.doc', '2020-04-01 17:18:15', '2020-04-01 17:18:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_usersinfo`
--

CREATE TABLE `tbl_usersinfo` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_usersinfo`
--

INSERT INTO `tbl_usersinfo` (`id`, `name`, `email`, `mobile`, `created`, `updated`, `status`) VALUES
(1, 'khurshe alam', ' khurshed2012@gmail.com', '8882740540', '2020-04-01 17:04:05', '2020-04-01 17:04:05', 1),
(2, 'khurshe alam', ' khurshed2012@gmail.com', '8882740540', '2020-04-01 17:08:20', '2020-04-01 17:08:20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'newuserk4', 'khurshed@gmail.com', '$2y$10$A5e/EB4piHeQFpgHFkl3LOYQ1XCAav4s74VGhhiSJXSgtLgPnlQBe', NULL, '2019-07-18 13:58:52', '2019-07-18 13:58:52'),
(2, 'newuserk4', 'khurshed1@gmail.com', '$2y$10$A5e/EB4piHeQFpgHFkl3LOYQ1XCAav4s74VGhhiSJXSgtLgPnlQBe', NULL, '2019-07-18 13:58:52', '2019-07-18 13:58:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `tbl_campaign`
--
ALTER TABLE `tbl_campaign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_campaign_target`
--
ALTER TABLE `tbl_campaign_target`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_files`
--
ALTER TABLE `tbl_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_usersinfo`
--
ALTER TABLE `tbl_usersinfo`
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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_campaign`
--
ALTER TABLE `tbl_campaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_campaign_target`
--
ALTER TABLE `tbl_campaign_target`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_files`
--
ALTER TABLE `tbl_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `tbl_usersinfo`
--
ALTER TABLE `tbl_usersinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
