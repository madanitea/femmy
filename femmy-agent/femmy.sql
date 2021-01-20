-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Jan 2021 pada 22.49
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `femmy`
--
CREATE DATABASE IF NOT EXISTS `femmy` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `femmy`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `banned_ips`
--

CREATE TABLE `banned_ips` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('banned','unbanned') COLLATE utf8mb4_unicode_ci NOT NULL,
  `abuse` enum('reported','unreported') COLLATE utf8mb4_unicode_ci NOT NULL,
  `jail_id` int(10) UNSIGNED DEFAULT NULL,
  `info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ;

--
-- Dumping data untuk tabel `banned_ips`
--

INSERT INTO `banned_ips` (`id`, `ip`, `status`, `abuse`, `jail_id`, `info`, `created_at`, `updated_at`) VALUES
(53, '178.43.12.1', 'unbanned', 'unreported', 15, '{\"country\":\"Poland\",\"regionName\":\"Lower Silesia\",\"city\":\"Wroc\\u0142aw\",\"lat\":51.0955,\"lon\":17.0259,\"timezone\":\"Europe\\/Warsaw\",\"isp\":\"Orange Polska Spolka Akcyjna\",\"org\":\"Orange Polska S.A.\",\"as\":\"AS5617 Orange Polska Spolka Akcyjna\"}', '2020-12-07 08:56:38', '2020-12-07 09:10:23'),
(54, '189.45.32.1', 'unbanned', 'unreported', 15, '{\"country\":\"Brazil\",\"regionName\":\"Rio Grande do Sul\",\"city\":\"Porto Alegre\",\"lat\":-30.0346,\"lon\":-51.2177,\"timezone\":\"America\\/Sao_Paulo\",\"isp\":\"Vogel Solu\\u00e7\\u00f5es em Telecom e Inform\\u00e1tica S\\/A\",\"org\":\"Vogel Solu\\u00e7\\u00f5es em Telecom e Inform\\u00e1tica S\\/A\",\"as\":\"AS25933 Vogel Solu\\u00e7\\u00f5es em Telecom e Inform\\u00e1tica S\\/A\"}', '2020-12-07 09:22:10', '2020-12-07 17:21:37'),
(55, '189.45.32.1', 'unbanned', 'unreported', 15, '{\"country\":\"Brazil\",\"regionName\":\"Rio Grande do Sul\",\"city\":\"Porto Alegre\",\"lat\":-30.0346,\"lon\":-51.2177,\"timezone\":\"America\\/Sao_Paulo\",\"isp\":\"Vogel Solu\\u00e7\\u00f5es em Telecom e Inform\\u00e1tica S\\/A\",\"org\":\"Vogel Solu\\u00e7\\u00f5es em Telecom e Inform\\u00e1tica S\\/A\",\"as\":\"AS25933 Vogel Solu\\u00e7\\u00f5es em Telecom e Inform\\u00e1tica S\\/A\"}', '2020-12-07 09:22:38', '2020-12-07 17:21:29'),
(56, '178.43.12.3', 'unbanned', 'unreported', 15, '{\"country\":\"Poland\",\"regionName\":\"Lower Silesia\",\"city\":\"Wroc\\u0142aw\",\"lat\":51.0955,\"lon\":17.0259,\"timezone\":\"Europe\\/Warsaw\",\"isp\":\"Orange Polska Spolka Akcyjna\",\"org\":\"Orange Polska S.A.\",\"as\":\"AS5617 Orange Polska Spolka Akcyjna\"}', '2020-12-07 09:33:46', '2020-12-07 17:21:13'),
(57, '178.43.12.3', 'unbanned', 'unreported', 15, '{\"country\":\"Poland\",\"regionName\":\"Lower Silesia\",\"city\":\"Wroc\\u0142aw\",\"lat\":51.0955,\"lon\":17.0259,\"timezone\":\"Europe\\/Warsaw\",\"isp\":\"Orange Polska Spolka Akcyjna\",\"org\":\"Orange Polska S.A.\",\"as\":\"AS5617 Orange Polska Spolka Akcyjna\"}', '2020-12-07 09:34:35', '2020-12-07 17:21:00'),
(58, '187.23.43.2', 'unbanned', 'unreported', 15, '{\"country\":\"Brazil\",\"regionName\":\"Sao Paulo\",\"city\":\"Sao Jose do Rio Preto\",\"lat\":-20.7691,\"lon\":-49.3567,\"timezone\":\"America\\/Sao_Paulo\",\"isp\":\"Claro S.A.\",\"org\":\"Claro S.A\",\"as\":\"AS28573 CLARO S.A.\"}', '2020-12-07 17:23:27', '2020-12-08 07:11:23'),
(59, '192.168.43.15', 'unbanned', 'unreported', 15, '[]', '2020-12-07 17:43:13', '2020-12-07 17:52:08'),
(60, '192.168.43.15', 'unbanned', 'unreported', 15, '[]', '2020-12-07 17:43:59', '2020-12-07 17:51:50'),
(61, '192.168.43.15', 'unbanned', 'unreported', 15, '[]', '2020-12-07 17:45:45', '2020-12-07 17:51:42'),
(62, '192.168.43.15', 'unbanned', 'unreported', 15, '[]', '2020-12-07 17:45:54', '2020-12-07 17:47:01'),
(63, '192.168.43.15', 'unbanned', 'unreported', 15, '[]', '2020-12-07 17:52:51', '2020-12-07 17:54:50'),
(64, '192.168.43.15', 'unbanned', 'unreported', 15, '[]', '2020-12-08 07:18:08', '2020-12-08 07:18:19'),
(65, '192.168.43.15', 'unbanned', 'unreported', 15, '[]', '2020-12-08 10:50:57', '2020-12-08 10:52:40'),
(66, '178.43.12.3', 'unbanned', 'unreported', 15, '{\"country\":\"Poland\",\"regionName\":\"Lower Silesia\",\"city\":\"Wroc\\u0142aw\",\"lat\":51.0955,\"lon\":17.0259,\"timezone\":\"Europe\\/Warsaw\",\"isp\":\"Orange Polska Spolka Akcyjna\",\"org\":\"Orange Polska S.A.\",\"as\":\"AS5617 Orange Polska Spolka Akcyjna\"}', '2020-12-08 15:39:14', '2020-12-12 02:53:09'),
(67, '156.54.34.2', 'unbanned', 'unreported', 15, '{\"country\":\"Italy\",\"regionName\":\"Lombardy\",\"city\":\"Milan\",\"lat\":45.4653,\"lon\":9.18517,\"timezone\":\"Europe\\/Rome\",\"isp\":\"Netsiel S.p.a. network\",\"org\":\"Telecom Italia S.p.A\",\"as\":\"\"}', '2020-12-08 15:43:30', '2020-12-12 02:46:08'),
(68, '192.168.43.15', 'unbanned', 'unreported', 15, '[]', '2020-12-08 15:52:33', '2020-12-08 15:59:08'),
(69, '167.43.123.54', 'unbanned', 'unreported', 15, '{\"country\":\"Canada\",\"regionName\":\"Ontario\",\"city\":\"Ottawa\",\"lat\":45.4198,\"lon\":-75.7035,\"timezone\":\"America\\/Toronto\",\"isp\":\"Shared Services Canada\",\"org\":\"Shared Services Canada\",\"as\":\"\"}', '2020-12-08 15:56:01', '2020-12-12 02:43:36'),
(70, '192.168.43.15', 'unbanned', 'unreported', 15, '[]', '2020-12-08 16:10:45', '2020-12-08 16:12:44'),
(71, '192.168.43.15', 'unbanned', 'unreported', 15, '[]', '2020-12-11 12:40:56', '2020-12-11 12:42:43'),
(72, '192.168.43.15', 'unbanned', 'unreported', 15, '[]', '2020-12-11 12:47:04', '2020-12-11 12:47:51'),
(73, '192.168.43.15', 'unbanned', 'unreported', 16, '[]', '2020-12-12 01:11:58', '2020-12-12 02:00:20'),
(74, '192.168.43.15', 'unbanned', 'unreported', 16, '[]', '2020-12-12 01:12:38', '2020-12-12 01:13:40'),
(75, '192.168.43.15', 'unbanned', 'unreported', 16, '[]', '2020-12-12 02:04:01', '2020-12-12 02:45:34'),
(76, '192.168.43.15', 'unbanned', 'unreported', 16, '[]', '2020-12-12 03:01:29', '2020-12-12 07:28:53'),
(77, '192.168.23.21', 'unbanned', 'unreported', 15, '[]', '2020-12-12 03:19:18', '2020-12-12 09:00:57'),
(78, '192.168.23.21', 'unbanned', 'unreported', 15, '[]', '2020-12-12 03:23:05', '2020-12-12 09:00:50'),
(79, '192.168.23.21', 'unbanned', 'unreported', 15, '[]', '2020-12-12 03:23:26', '2020-12-12 09:00:38'),
(80, '192.168.23.21', 'unbanned', 'unreported', 15, '[]', '2020-12-12 03:24:27', '2020-12-12 09:00:44'),
(81, '192.168.23.21', 'unbanned', 'unreported', 15, '[]', '2020-12-12 03:25:32', '2020-12-12 09:00:33'),
(82, '192.168.23.21', 'unbanned', 'unreported', 15, '[]', '2020-12-12 03:26:32', '2020-12-12 09:00:27'),
(83, '192.168.23.21', 'unbanned', 'unreported', 15, '[]', '2020-12-12 03:26:45', '2020-12-12 09:00:16'),
(84, '192.168.23.21', 'unbanned', 'unreported', 15, '[]', '2020-12-12 03:28:52', '2020-12-12 09:00:11'),
(85, '192.168.23.21', 'unbanned', 'unreported', 15, '[]', '2020-12-12 03:29:10', '2020-12-12 09:00:05'),
(86, '192.168.23.214', 'unbanned', 'unreported', 15, '[]', '2020-12-12 08:46:35', '2020-12-12 09:00:00'),
(87, '192.168.43.15', 'unbanned', 'unreported', 15, '[]', '2020-12-12 09:01:58', '2020-12-12 09:03:47'),
(88, '192.168.43.15', 'unbanned', 'unreported', 16, '[]', '2020-12-12 09:04:46', '2020-12-12 09:05:46'),
(89, '192.168.43.15', 'unbanned', 'unreported', 16, '[]', '2020-12-12 09:10:53', '2020-12-12 09:11:43'),
(90, '192.168.43.15', 'unbanned', 'unreported', 16, '[]', '2020-12-12 09:12:48', '2020-12-12 09:13:50'),
(91, '192.168.43.15', 'unbanned', 'unreported', 16, '[]', '2020-12-12 09:15:00', '2020-12-12 09:16:02'),
(92, '192.168.23.214', 'unbanned', 'unreported', 16, '[]', '2020-12-12 09:17:56', '2020-12-12 11:16:47'),
(93, '192.168.23.214', 'unbanned', 'unreported', 16, '[]', '2020-12-12 09:18:30', '2020-12-12 09:18:54'),
(94, '192.168.23.214', 'unbanned', 'unreported', 16, '[]', '2020-12-12 09:20:33', '2020-12-12 11:16:23'),
(95, '192.168.23.214', 'unbanned', 'unreported', 16, '[]', '2020-12-12 09:20:51', '2020-12-12 11:16:18'),
(96, '192.168.43.15', 'unbanned', 'unreported', 16, '[]', '2020-12-12 09:22:37', '2020-12-12 09:23:39'),
(97, '192.168.43.15', 'unbanned', 'unreported', 15, '[]', '2020-12-12 09:24:11', '2020-12-12 09:26:13'),
(98, '192.168.43.15', 'unbanned', 'unreported', 15, '[]', '2020-12-12 09:32:10', '2020-12-12 09:34:11'),
(99, '192.168.43.15', 'unbanned', 'unreported', 15, '[]', '2020-12-12 09:39:38', '2020-12-12 10:32:03'),
(100, '192.168.43.15', 'unbanned', 'unreported', 15, '[]', '2020-12-12 09:51:41', '2020-12-12 10:32:11'),
(101, '192.168.43.15', 'unbanned', 'unreported', 16, '[]', '2020-12-12 09:52:21', '2020-12-12 09:53:23'),
(102, '156.32.45.3', 'unbanned', 'unreported', 15, '{\"country\":\"United States\",\"regionName\":\"Texas\",\"city\":\"Houston\",\"lat\":29.7312,\"lon\":-95.4394,\"timezone\":\"America\\/Chicago\",\"isp\":\"Occidental Petroleum Corporation\",\"org\":\"Occidental Petroleum Corporation\",\"as\":\"\"}', '2020-12-12 10:19:29', '2020-12-12 10:21:02'),
(103, '189.32.23.12', 'unbanned', 'unreported', 16, '{\"country\":\"Brazil\",\"regionName\":\"Parana\",\"city\":\"Curitiba\",\"lat\":-25.5039,\"lon\":-49.2908,\"timezone\":\"America\\/Sao_Paulo\",\"isp\":\"Claro S.A.\",\"org\":\"Claro S.A\",\"as\":\"AS28573 CLARO S.A.\"}', '2020-12-12 10:58:21', '2020-12-12 10:59:09'),
(104, '178.23.43.12', 'unbanned', 'unreported', 16, '{\"country\":\"Belgium\",\"regionName\":\"Flanders\",\"city\":\"Antwerp\",\"lat\":51.2261,\"lon\":4.4091,\"timezone\":\"Europe\\/Brussels\",\"isp\":\"Kinamo N.V.\\/S.A.\",\"org\":\"Kinamo N.V.\",\"as\":\"\"}', '2020-12-12 11:05:35', '2020-12-12 11:06:23'),
(105, '178.43.12.3', 'unbanned', 'unreported', 15, '{\"country\":\"Poland\",\"regionName\":\"Lower Silesia\",\"city\":\"Wroc\\u0142aw\",\"lat\":51.0955,\"lon\":17.0259,\"timezone\":\"Europe\\/Warsaw\",\"isp\":\"Orange Polska Spolka Akcyjna\",\"org\":\"Orange Polska S.A.\",\"as\":\"AS5617 Orange Polska Spolka Akcyjna\"}', '2020-12-12 11:12:36', '2020-12-12 11:13:59'),
(106, '178.23.43.13', 'unbanned', 'unreported', 16, '{\"country\":\"Belgium\",\"regionName\":\"Flanders\",\"city\":\"Antwerp\",\"lat\":51.2261,\"lon\":4.4091,\"timezone\":\"Europe\\/Brussels\",\"isp\":\"Kinamo N.V.\\/S.A.\",\"org\":\"Kinamo N.V.\",\"as\":\"\"}', '2020-12-12 11:20:40', '2020-12-12 11:21:41'),
(107, '178.23.43.12', 'unbanned', 'unreported', 16, '{\"country\":\"Belgium\",\"regionName\":\"Flanders\",\"city\":\"Antwerp\",\"lat\":51.2261,\"lon\":4.4091,\"timezone\":\"Europe\\/Brussels\",\"isp\":\"Kinamo N.V.\\/S.A.\",\"org\":\"Kinamo N.V.\",\"as\":\"\"}', '2020-12-12 11:22:42', '2020-12-12 11:23:13'),
(108, '56.43.32.21', 'unbanned', 'unreported', 16, '{\"country\":\"United States\",\"regionName\":\"New Jersey\",\"city\":\"Newark\",\"lat\":40.7357,\"lon\":-74.1724,\"timezone\":\"America\\/New_York\",\"isp\":\"United States Postal Service.\",\"org\":\"United States Postal Service\",\"as\":\"\"}', '2020-12-12 12:50:42', '2020-12-12 13:15:14'),
(109, '43.32.21.6', 'unbanned', 'unreported', 16, '{\"country\":\"China\",\"regionName\":\"Beijing\",\"city\":\"Beijing\",\"lat\":39.9042,\"lon\":116.407,\"timezone\":\"Asia\\/Shanghai\",\"isp\":\"Alibaba Cloud\",\"org\":\"Aliyun Computing Co.\",\"as\":\"AS45102 Alibaba (US) Technology Co., Ltd.\"}', '2020-12-12 13:11:14', '2020-12-12 13:14:43'),
(110, '43.32.21.6', 'unbanned', 'unreported', 16, '{\"country\":\"China\",\"regionName\":\"Beijing\",\"city\":\"Beijing\",\"lat\":39.9042,\"lon\":116.407,\"timezone\":\"Asia\\/Shanghai\",\"isp\":\"Alibaba Cloud\",\"org\":\"Aliyun Computing Co.\",\"as\":\"AS45102 Alibaba (US) Technology Co., Ltd.\"}', '2020-12-12 13:11:36', '2020-12-12 13:13:32'),
(111, '192.168.43.15', 'unbanned', 'unreported', 16, '[]', '2020-12-12 13:22:33', '2020-12-12 13:23:43'),
(112, '67.87.89.9', 'unbanned', 'unreported', 16, '{\"country\":\"United States\",\"regionName\":\"New York\",\"city\":\"Bay Shore\",\"lat\":40.7051,\"lon\":-73.243,\"timezone\":\"America\\/New_York\",\"isp\":\"Cablevision Systems Corp.\",\"org\":\"Optimum Online (Cablevision Systems)\",\"as\":\"AS6128 Cablevision Systems Corp.\"}', '2020-12-12 13:28:09', '2020-12-12 13:31:19'),
(113, '61.23.1.2', 'unbanned', 'unreported', 16, '{\"country\":\"Japan\",\"regionName\":\"Tokyo\",\"city\":\"Kamiogi\",\"lat\":35.7087,\"lon\":139.609,\"timezone\":\"Asia\\/Tokyo\",\"isp\":\"Jupiter Telecommunication Co. Ltd\",\"org\":\"Jupiter Telecommunication Co. Ltd\",\"as\":\"AS9824 Jupiter Telecommunication Co. Ltd\"}', '2020-12-12 13:38:07', '2020-12-12 13:44:26'),
(114, '61.23.1.2', 'unbanned', 'unreported', 16, '{\"country\":\"Japan\",\"regionName\":\"Tokyo\",\"city\":\"Kamiogi\",\"lat\":35.7087,\"lon\":139.609,\"timezone\":\"Asia\\/Tokyo\",\"isp\":\"Jupiter Telecommunication Co. Ltd\",\"org\":\"Jupiter Telecommunication Co. Ltd\",\"as\":\"AS9824 Jupiter Telecommunication Co. Ltd\"}', '2020-12-12 13:42:58', '2020-12-12 13:44:17'),
(115, '192.168.43.15', 'unbanned', 'unreported', 16, '[]', '2020-12-12 14:01:09', '2020-12-12 14:30:00'),
(116, '192.168.43.15', 'unbanned', 'unreported', 15, '[]', '2020-12-12 14:01:14', '2020-12-12 14:25:39'),
(117, '192.168.43.15', 'unbanned', 'unreported', 16, '[]', '2020-12-12 14:02:06', '2020-12-12 14:29:54'),
(118, '192.168.43.15', 'unbanned', 'unreported', 15, '[]', '2020-12-12 14:02:12', '2020-12-12 14:03:06'),
(119, '192.168.43.15', 'unbanned', 'unreported', 16, '[]', '2020-12-12 14:04:07', '2020-12-12 14:29:48'),
(120, '192.168.43.15', 'unbanned', 'unreported', 15, '[]', '2020-12-12 14:04:09', '2020-12-12 14:05:08'),
(121, '192.168.43.15', 'unbanned', 'unreported', 16, '[]', '2020-12-12 14:05:13', '2020-12-12 14:29:41'),
(122, '192.168.43.15', 'unbanned', 'unreported', 15, '[]', '2020-12-12 14:05:17', '2020-12-12 14:12:21'),
(123, '192.168.43.15', 'unbanned', 'unreported', 16, '[]', '2020-12-12 14:47:28', '2020-12-12 14:57:35'),
(124, '192.168.43.15', 'banned', 'unreported', 15, '[]', '2020-12-12 15:23:45', '2020-12-12 15:23:45'),
(125, '192.168.43.15', 'unbanned', 'unreported', 16, '[]', '2020-12-12 15:24:18', '2020-12-12 15:25:45'),
(126, '192.168.43.15', 'banned', 'unreported', 15, '[]', '2021-01-07 00:51:20', '2021-01-07 00:51:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `filters`
--

CREATE TABLE `filters` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `varian` enum('default','custom') COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `filters`
--

INSERT INTO `filters` (`id`, `content`, `varian`, `name`, `created_at`, `updated_at`) VALUES
(2, NULL, 'default', '3proxy', '2020-12-04 15:45:51', '2020-12-04 15:45:51'),
(3, NULL, 'default', 'apache-auth', '2020-12-04 15:45:51', '2020-12-04 15:45:51'),
(4, NULL, 'default', 'apache-badbots', '2020-12-04 15:45:52', '2020-12-04 15:45:52'),
(5, NULL, 'default', 'apache-botsearch', '2020-12-04 15:45:52', '2020-12-04 15:45:52'),
(6, NULL, 'default', 'apache-common', '2020-12-04 15:45:52', '2020-12-04 15:45:52'),
(7, NULL, 'default', 'apache-fakegooglebot', '2020-12-04 15:45:52', '2020-12-04 15:45:52'),
(8, NULL, 'default', 'apache-modsecurity', '2020-12-04 15:45:52', '2020-12-04 15:45:52'),
(9, NULL, 'default', 'apache-nohome', '2020-12-04 15:45:52', '2020-12-04 15:45:52'),
(10, NULL, 'default', 'apache-noscript', '2020-12-04 15:45:53', '2020-12-04 15:45:53'),
(11, NULL, 'default', 'apache-overflows', '2020-12-04 15:45:53', '2020-12-04 15:45:53'),
(12, NULL, 'default', 'apache-pass', '2020-12-04 15:45:53', '2020-12-04 15:45:53'),
(13, NULL, 'default', 'apache-shellshock', '2020-12-04 15:45:53', '2020-12-04 15:45:53'),
(14, NULL, 'default', 'assp', '2020-12-04 15:45:53', '2020-12-04 15:45:53'),
(15, NULL, 'default', 'asterisk', '2020-12-04 15:45:53', '2020-12-04 15:45:53'),
(16, NULL, 'default', 'bitwarden', '2020-12-04 15:45:53', '2020-12-04 15:45:53'),
(17, NULL, 'default', 'botsearch-common', '2020-12-04 15:45:53', '2020-12-04 15:45:53'),
(18, NULL, 'default', 'centreon', '2020-12-04 15:45:53', '2020-12-04 15:45:53'),
(19, NULL, 'default', 'common', '2020-12-04 15:45:53', '2020-12-04 15:45:53'),
(20, NULL, 'default', 'counter-strike', '2020-12-04 15:45:53', '2020-12-04 15:45:53'),
(21, NULL, 'default', 'courier-auth', '2020-12-04 15:45:53', '2020-12-04 15:45:53'),
(22, NULL, 'default', 'courier-smtp', '2020-12-04 15:45:53', '2020-12-04 15:45:53'),
(23, NULL, 'default', 'cyrus-imap', '2020-12-04 15:45:53', '2020-12-04 15:45:53'),
(24, NULL, 'default', 'directadmin', '2020-12-04 15:45:53', '2020-12-04 15:45:53'),
(25, NULL, 'default', 'domino-smtp', '2020-12-04 15:45:53', '2020-12-04 15:45:53'),
(26, NULL, 'default', 'dovecot', '2020-12-04 15:45:53', '2020-12-04 15:45:53'),
(27, NULL, 'default', 'dropbear', '2020-12-04 15:45:54', '2020-12-04 15:45:54'),
(28, NULL, 'default', 'drupal-auth', '2020-12-04 15:45:54', '2020-12-04 15:45:54'),
(29, NULL, 'default', 'ejabberd-auth', '2020-12-04 15:45:54', '2020-12-04 15:45:54'),
(30, NULL, 'default', 'exim-common', '2020-12-04 15:45:54', '2020-12-04 15:45:54'),
(31, NULL, 'default', 'exim', '2020-12-04 15:45:54', '2020-12-04 15:45:54'),
(32, NULL, 'default', 'exim-spam', '2020-12-04 15:45:54', '2020-12-04 15:45:54'),
(33, NULL, 'default', 'freeswitch', '2020-12-04 15:45:54', '2020-12-04 15:45:54'),
(34, NULL, 'default', 'froxlor-auth', '2020-12-04 15:45:54', '2020-12-04 15:45:54'),
(35, NULL, 'default', 'groupoffice', '2020-12-04 15:45:54', '2020-12-04 15:45:54'),
(36, NULL, 'default', 'gssftpd', '2020-12-04 15:45:54', '2020-12-04 15:45:54'),
(37, NULL, 'default', 'guacamole', '2020-12-04 15:45:54', '2020-12-04 15:45:54'),
(38, NULL, 'default', 'haproxy-http-auth', '2020-12-04 15:45:54', '2020-12-04 15:45:54'),
(39, NULL, 'default', 'horde', '2020-12-04 15:45:54', '2020-12-04 15:45:54'),
(40, NULL, 'default', 'kerio', '2020-12-04 15:45:54', '2020-12-04 15:45:54'),
(41, NULL, 'default', 'lighttpd-auth', '2020-12-04 15:45:54', '2020-12-04 15:45:54'),
(42, NULL, 'default', 'mongodb-auth', '2020-12-04 15:45:54', '2020-12-04 15:45:54'),
(43, NULL, 'default', 'monit', '2020-12-04 15:45:54', '2020-12-04 15:45:54'),
(44, NULL, 'default', 'murmur', '2020-12-04 15:45:55', '2020-12-04 15:45:55'),
(45, NULL, 'default', 'mysqld-auth', '2020-12-04 15:45:55', '2020-12-04 15:45:55'),
(46, NULL, 'default', 'nagios', '2020-12-04 15:45:55', '2020-12-04 15:45:55'),
(47, NULL, 'default', 'named-refused', '2020-12-04 15:45:55', '2020-12-04 15:45:55'),
(48, NULL, 'default', 'nginx-botsearch', '2020-12-04 15:45:55', '2020-12-04 15:45:55'),
(49, NULL, 'default', 'nginx-http-auth', '2020-12-04 15:45:55', '2020-12-04 15:45:55'),
(50, NULL, 'default', 'nginx-limit-req', '2020-12-04 15:45:55', '2020-12-04 15:45:55'),
(51, NULL, 'default', 'nsd', '2020-12-04 15:45:55', '2020-12-04 15:45:55'),
(52, NULL, 'default', 'openhab', '2020-12-04 15:45:55', '2020-12-04 15:45:55'),
(53, NULL, 'default', 'openwebmail', '2020-12-04 15:45:55', '2020-12-04 15:45:55'),
(54, NULL, 'default', 'oracleims', '2020-12-04 15:45:55', '2020-12-04 15:45:55'),
(55, NULL, 'default', 'pam-generic', '2020-12-04 15:45:55', '2020-12-04 15:45:55'),
(56, NULL, 'default', 'perdition', '2020-12-04 15:45:55', '2020-12-04 15:45:55'),
(57, NULL, 'default', 'phpmyadmin-syslog', '2020-12-04 15:45:55', '2020-12-04 15:45:55'),
(58, NULL, 'default', 'php-url-fopen', '2020-12-04 15:45:55', '2020-12-04 15:45:55'),
(59, NULL, 'default', 'portsentry', '2020-12-04 15:45:56', '2020-12-04 15:45:56'),
(60, NULL, 'default', 'postfix', '2020-12-04 15:45:56', '2020-12-04 15:45:56'),
(61, NULL, 'default', 'proftpd', '2020-12-04 15:45:56', '2020-12-04 15:45:56'),
(62, NULL, 'default', 'pure-ftpd', '2020-12-04 15:45:56', '2020-12-04 15:45:56'),
(63, NULL, 'default', 'qmail', '2020-12-04 15:45:56', '2020-12-04 15:45:56'),
(64, NULL, 'default', 'recidive', '2020-12-04 15:45:56', '2020-12-04 15:45:56'),
(65, NULL, 'default', 'roundcube-auth', '2020-12-04 15:45:56', '2020-12-04 15:45:56'),
(66, NULL, 'default', 'screensharingd', '2020-12-04 15:45:56', '2020-12-04 15:45:56'),
(67, NULL, 'default', 'selinux-common', '2020-12-04 15:45:56', '2020-12-04 15:45:56'),
(68, NULL, 'default', 'selinux-ssh', '2020-12-04 15:45:56', '2020-12-04 15:45:56'),
(69, NULL, 'default', 'sendmail-auth', '2020-12-04 15:45:56', '2020-12-04 15:45:56'),
(70, NULL, 'default', 'sendmail-reject', '2020-12-04 15:45:56', '2020-12-04 15:45:56'),
(71, NULL, 'default', 'sieve', '2020-12-04 15:45:57', '2020-12-04 15:45:57'),
(72, NULL, 'default', 'slapd', '2020-12-04 15:45:57', '2020-12-04 15:45:57'),
(73, NULL, 'default', 'sogo-auth', '2020-12-04 15:45:57', '2020-12-04 15:45:57'),
(74, NULL, 'default', 'solid-pop3d', '2020-12-04 15:45:57', '2020-12-04 15:45:57'),
(75, NULL, 'default', 'squid', '2020-12-04 15:45:57', '2020-12-04 15:45:57'),
(76, NULL, 'default', 'squirrelmail', '2020-12-04 15:45:57', '2020-12-04 15:45:57'),
(77, NULL, 'default', 'sshd', '2020-12-04 15:45:57', '2020-12-04 15:45:57'),
(78, NULL, 'default', 'stunnel', '2020-12-04 15:45:57', '2020-12-04 15:45:57'),
(79, NULL, 'default', 'suhosin', '2020-12-04 15:45:57', '2020-12-04 15:45:57'),
(80, NULL, 'default', 'tine20', '2020-12-04 15:45:57', '2020-12-04 15:45:57'),
(81, NULL, 'default', 'traefik-auth', '2020-12-04 15:45:57', '2020-12-04 15:45:57'),
(82, NULL, 'default', 'uwimap-auth', '2020-12-04 15:45:57', '2020-12-04 15:45:57'),
(83, NULL, 'default', 'vsftpd', '2020-12-04 15:45:58', '2020-12-04 15:45:58'),
(84, NULL, 'default', 'webmin-auth', '2020-12-04 15:45:58', '2020-12-04 15:45:58'),
(85, NULL, 'default', 'wuftpd', '2020-12-04 15:45:58', '2020-12-04 15:45:58'),
(86, NULL, 'default', 'xinetd-fail', '2020-12-04 15:45:58', '2020-12-04 15:45:58'),
(87, NULL, 'default', 'znc-adminlog', '2020-12-04 15:45:58', '2020-12-04 15:45:58'),
(88, NULL, 'default', 'zoneminder', '2020-12-04 15:45:58', '2020-12-04 15:45:58'),
(98, '[Definition]\r\nfailregex = ^<HOST> .* \"POST .*wp-login.php\r\n            ^<HOST> .* \"POST .*xmlrpc.php\r\nignoreregex =', 'custom', 'wp-login', '2020-12-12 08:57:32', '2020-12-12 08:57:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hosts`
--

CREATE TABLE `hosts` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` int(11) NOT NULL,
  `api_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `hosts`
--

INSERT INTO `hosts` (`id`, `ip`, `name`, `description`, `port`, `api_key`, `created_at`, `updated_at`) VALUES
(4, '192.168.43.88', 'FTP-DB', 'Testing Env', 8000, 'testenv1', '2020-11-12 07:16:14', '2020-12-12 13:56:49'),
(7, '192.168.43.87', 'Wordpress-CMS', 'Testing Env 2', 8000, 'testenv2', '2020-12-12 01:02:44', '2020-12-12 13:56:39'),
(9, '192.168.43.87', 'Dev', 'Developement Server From Bit.Co', 45, 'apawe', '2021-01-08 09:34:08', '2021-01-08 09:34:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jails`
--

CREATE TABLE `jails` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filter_id` int(10) UNSIGNED NOT NULL,
  `logpath` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `find_time` int(11) NOT NULL,
  `max_retry` int(11) NOT NULL,
  `ban_time` bigint(20) NOT NULL,
  `host_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jails`
--

INSERT INTO `jails` (`id`, `name`, `filter_id`, `logpath`, `port`, `find_time`, `max_retry`, `ban_time`, `host_id`, `status`, `created_at`, `updated_at`) VALUES
(15, 'sshd', 77, '%(sshd_log)s', 'ssh', 3, 2, 2, 4, 'Enabled', '2020-12-07 08:40:22', '2020-12-12 13:00:00'),
(16, 'sshd', 77, '%(sshd_log)s', 'ssh', 2, 2, 2, 7, 'Enabled', '2020-12-12 01:05:42', '2020-12-12 15:01:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `logs`
--

CREATE TABLE `logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `log` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('info','danger','warning','success') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `logs`
--

INSERT INTO `logs` (`id`, `log`, `level`, `created_at`, `updated_at`) VALUES
(2, 'Madani Besari added a new user named Fajri Siddiq Sindoro with a role Admin.', 'success', '2020-11-21 20:26:21', '2020-11-21 20:26:21'),
(3, 'Madani Besari deleted a user named Fajri Siddiq Sindoro.', 'success', '2020-11-21 20:29:29', '2020-11-21 20:29:29'),
(4, 'Madani Besari updated a user named Madani Besari.', 'success', '2020-11-21 20:31:37', '2020-11-21 20:31:37'),
(5, 'Madani Besari added a new role named Read Only.', 'success', '2020-11-21 20:38:57', '2020-11-21 20:38:57'),
(6, 'Madani Besari deleted a role named Read Only.', 'success', '2020-11-21 20:44:04', '2020-11-21 20:44:04'),
(7, 'Madani Besari updated a role named .', 'success', '2020-11-21 20:47:06', '2020-11-21 20:47:06'),
(8, 'Madani Besari updated a role named .', 'success', '2020-11-21 20:47:30', '2020-11-21 20:47:30'),
(9, 'Madani Besari updated a role named .', 'success', '2020-11-21 20:48:03', '2020-11-21 20:48:03'),
(10, 'Madani Besari updated a role named Admin.', 'success', '2020-11-21 20:49:26', '2020-11-21 20:49:26'),
(11, 'Madani Besari added a new host named NS2.', 'success', '2020-11-21 20:55:50', '2020-11-21 20:55:50'),
(12, 'Madani Besari updated a host named NS2.', 'success', '2020-11-21 20:56:40', '2020-11-21 20:56:40'),
(13, 'Madani Besari deleted a host named NS2.', 'success', '2020-11-21 21:03:03', '2020-11-21 21:03:03'),
(14, 'Madani Besari added a new filter named Proxmox-Auth.', 'success', '2020-11-21 21:07:28', '2020-11-21 21:07:28'),
(15, 'Madani Besari updated a filter named Proxmox-Auth.', 'success', '2020-11-21 21:08:12', '2020-11-21 21:08:12'),
(16, 'Madani Besari deleted a filter named Proxmox-Auth.', 'success', '2020-11-21 21:08:25', '2020-11-21 21:08:25'),
(17, 'Madani Besari added a new jail named Apache-Auth at 192.168.23.27.', 'success', '2020-11-21 21:20:11', '2020-11-21 21:20:11'),
(18, 'Madani Besari enabled a jail named  at 192.168.23.27.', 'success', '2020-11-21 21:21:48', '2020-11-21 21:21:48'),
(19, 'Madani Besari enabled a jail named  at 192.168.23.27.', 'success', '2020-11-21 21:23:06', '2020-11-21 21:23:06'),
(20, 'Madani Besari enabled a jail named  at 192.168.23.27.', 'success', '2020-11-21 21:24:11', '2020-11-21 21:24:11'),
(21, 'Madani Besari enabled a jail named  at 192.168.23.27.', 'success', '2020-11-21 21:24:27', '2020-11-21 21:24:27'),
(22, 'Madani Besari enabled a jail named  at 192.168.23.27.', 'success', '2020-11-21 21:24:51', '2020-11-21 21:24:51'),
(23, 'Madani Besari enabled a jail named Apache-Auth at 192.168.23.27.', 'success', '2020-11-21 21:25:48', '2020-11-21 21:25:48'),
(24, 'Madani Besari disabled a jail named Apache-Auth at 192.168.23.27.', 'success', '2020-11-21 21:27:15', '2020-11-21 21:27:15'),
(25, 'Madani Besari updated a jail named Apache-Auth at 192.168.23.27.', 'success', '2020-11-21 21:37:18', '2020-11-21 21:37:18'),
(26, 'Madani Besari unbanned IP 122.248.43.194 in Login-Jail at 192.168.23.27.', 'success', '2020-11-21 21:46:41', '2020-11-21 21:46:41'),
(27, 'Madani Besari banned IP 178.43.12.3 in Login-Jail at 192.168.23.27.', 'success', '2020-11-21 21:47:24', '2020-11-21 21:47:24'),
(28, 'Madani Besari banned IP 178.43.12.3 in Login-Jail at 192.168.23.27.', 'success', '2020-11-21 21:47:47', '2020-11-21 21:47:47'),
(29, 'Madani Besari banned IP 178.43.12.3 in Login-Jail at 192.168.23.27.', 'success', '2020-11-21 21:47:52', '2020-11-21 21:47:52'),
(30, 'Madani Besari banned IP 178.43.12.3 in Login-Jail at 192.168.23.27.', 'success', '2020-11-21 21:47:56', '2020-11-21 21:47:56'),
(31, 'Madani Besari banned IP 178.43.12.3 in Login-Jail at 192.168.23.27.', 'success', '2020-11-21 21:48:49', '2020-11-21 21:48:49'),
(32, 'Madani Besari unbanned IP 167.32.43.1 in Login-Jail at 192.168.23.27.', 'success', '2020-11-21 21:57:16', '2020-11-21 21:57:16'),
(33, 'Madani Besari banned IP 123.123.123.123 in Login-Jail at 192.168.23.27.', 'success', '2020-11-21 21:58:14', '2020-11-21 21:58:14'),
(34, 'Madani Besari banned IP 123.123.123.123 in Login-Jail at 192.168.23.27.', 'success', '2020-11-21 21:58:19', '2020-11-21 21:58:19'),
(35, 'Madani Besari banned IP 123.123.123.123 in Login-Jail at 192.168.23.27.', 'success', '2020-11-21 21:58:41', '2020-11-21 21:58:41'),
(36, 'Madani Besari banned IP 123.123.123.123 in Login-Jail at 192.168.23.27.', 'success', '2020-11-21 21:59:14', '2020-11-21 21:59:14'),
(37, 'Madani Besari updated a role named Admin.', 'success', '2020-11-30 03:19:44', '2020-11-30 03:19:44'),
(38, 'Madani Besari updated a role named Admin.', 'success', '2020-11-30 03:20:27', '2020-11-30 03:20:27'),
(39, 'Madani Besari banned IP 178.45.65.23 in Apache-Auth at 192.168.23.23.', 'success', '2020-11-30 20:37:19', '2020-11-30 20:37:19'),
(40, 'Madani Besari added a new jail named DNS Acc at 192.168.23.24.', 'success', '2020-11-30 20:38:38', '2020-11-30 20:38:38'),
(41, 'Madani Besari enabled a jail named DNS Acc at 192.168.23.24.', 'success', '2020-11-30 20:38:42', '2020-11-30 20:38:42'),
(42, 'Madani Besari enabled a jail named DNS Acc at 192.168.23.24.', 'success', '2020-11-30 20:38:54', '2020-11-30 20:38:54'),
(43, 'Madani Besari banned IP 167.43.21.3 in DNS Acc at 192.168.23.24.', 'success', '2020-11-30 20:39:13', '2020-11-30 20:39:13'),
(44, 'Madani Besari updated a role named Admin.', 'success', '2020-11-30 23:30:27', '2020-11-30 23:30:27'),
(45, 'Madani Besari updated a role named Admin.', 'success', '2020-11-30 23:31:25', '2020-11-30 23:31:25'),
(46, 'Madani Besari banned IP 176.32.32.32 in Login-Jail at 192.168.23.27.', 'success', '2020-12-01 00:30:39', '2020-12-01 00:30:39'),
(47, 'Madani Besari updated a role named Admin.', 'success', '2020-12-01 05:35:16', '2020-12-01 05:35:16'),
(48, 'Madani Besari updated a role named Admin.', 'success', '2020-12-01 05:36:29', '2020-12-01 05:36:29'),
(49, 'Madani Besari updated a role named Admin.', 'success', '2020-12-01 05:37:12', '2020-12-01 05:37:12'),
(50, 'Madani Besari disabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 05:39:25', '2020-12-01 05:39:25'),
(51, 'Madani Besari disabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 05:39:36', '2020-12-01 05:39:36'),
(52, 'Madani Besari disabled a jail named Apache-Auth at 192.168.23.27.', 'success', '2020-12-01 05:39:40', '2020-12-01 05:39:40'),
(53, 'Madani Besari disabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 05:42:24', '2020-12-01 05:42:24'),
(54, 'Madani Besari enabled a jail named Apache-Auth at 192.168.23.23.', 'success', '2020-12-01 05:43:16', '2020-12-01 05:43:16'),
(55, 'Madani Besari disabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 05:46:45', '2020-12-01 05:46:45'),
(56, 'Madani Besari disabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 05:46:55', '2020-12-01 05:46:55'),
(57, 'Madani Besari disabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 05:47:52', '2020-12-01 05:47:52'),
(58, 'Madani Besari disabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 05:48:41', '2020-12-01 05:48:41'),
(59, 'Madani Besari disabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 05:51:16', '2020-12-01 05:51:16'),
(60, 'Madani Besari disabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 05:51:40', '2020-12-01 05:51:40'),
(61, 'Madani Besari disabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 05:51:43', '2020-12-01 05:51:43'),
(62, 'Madani Besari disabled a jail named Apache-Auth at 192.168.23.27.', 'success', '2020-12-01 05:53:26', '2020-12-01 05:53:26'),
(63, 'Madani Besari enabled a jail named Apache-Auth at 192.168.23.27.', 'success', '2020-12-01 05:53:43', '2020-12-01 05:53:43'),
(64, 'Madani Besari disabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 05:55:02', '2020-12-01 05:55:02'),
(65, 'Madani Besari disabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 05:55:30', '2020-12-01 05:55:30'),
(66, 'Madani Besari disabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 05:56:31', '2020-12-01 05:56:31'),
(67, 'Madani Besari disabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 05:56:35', '2020-12-01 05:56:35'),
(68, 'Madani Besari disabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 05:56:37', '2020-12-01 05:56:37'),
(69, 'Madani Besari disabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 05:58:02', '2020-12-01 05:58:02'),
(70, 'Madani Besari disabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 05:58:28', '2020-12-01 05:58:28'),
(71, 'Madani Besari disabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 05:59:23', '2020-12-01 05:59:23'),
(72, 'Madani Besari disabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 05:59:29', '2020-12-01 05:59:29'),
(73, 'Madani Besari enabled a jail named Apache-Auth at 192.168.23.27.', 'success', '2020-12-01 05:59:34', '2020-12-01 05:59:34'),
(74, 'Madani Besari disabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 06:06:25', '2020-12-01 06:06:25'),
(75, 'Madani Besari disabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 06:15:07', '2020-12-01 06:15:07'),
(76, 'Madani Besari disabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 06:21:10', '2020-12-01 06:21:10'),
(77, 'Madani Besari enabled a jail named Apache-Auth at 192.168.23.27.', 'success', '2020-12-01 06:21:19', '2020-12-01 06:21:19'),
(78, 'Madani Besari enabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 06:21:25', '2020-12-01 06:21:25'),
(79, 'Madani Besari disabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 06:31:36', '2020-12-01 06:31:36'),
(80, 'Madani Besari disabled a jail named Apache-Auth at 192.168.23.27.', 'success', '2020-12-01 06:31:42', '2020-12-01 06:31:42'),
(81, 'Madani Besari enabled a jail named Login-Jail at 192.168.23.27.', 'success', '2020-12-01 06:31:46', '2020-12-01 06:31:46'),
(82, 'Madani Besari updated a user named Madani Besari.', 'success', '2020-12-01 13:43:20', '2020-12-01 13:43:20'),
(83, 'Madani Besari banned IP 192.167.23.247 in Login-Jail at 192.168.23.27.', 'success', '2020-12-03 15:32:42', '2020-12-03 15:32:42'),
(84, 'Madani Besari deleted a filter named Wordpress-Login.', 'success', '2020-12-04 14:28:59', '2020-12-04 14:28:59'),
(85, 'Madani Besari deleted a filter named Apache-Auth.', 'success', '2020-12-04 14:29:05', '2020-12-04 14:29:05'),
(86, 'Madani Besari added a new filter named Wordpress-Auth.', 'success', '2020-12-04 15:13:48', '2020-12-04 15:13:48'),
(87, 'Madani Besari added a new filter named Wordpress-Auth.', 'success', '2020-12-04 15:14:12', '2020-12-04 15:14:12'),
(88, 'Madani Besari added a new filter named Wordpress-Auth.', 'success', '2020-12-04 15:24:30', '2020-12-04 15:24:30'),
(89, 'Madani Besari added a new filter named Moodle-Auth.', 'success', '2020-12-04 15:54:05', '2020-12-04 15:54:05'),
(90, 'Madani Besari added a new jail named SSHD at 192.168.23.27.', 'success', '2020-12-04 16:06:42', '2020-12-04 16:06:42'),
(91, 'Madani Besari enabled a jail named SSHD at 192.168.23.27.', 'success', '2020-12-04 16:06:51', '2020-12-04 16:06:51'),
(92, 'Madani Besari banned IP 192.178.23.22 in SSHD at 192.168.23.27.', 'success', '2020-12-04 16:07:52', '2020-12-04 16:07:52'),
(93, 'Madani Besari banned IP 167.32.12.3 in SSHD at 192.168.23.27.', 'success', '2020-12-04 16:08:24', '2020-12-04 16:08:24'),
(94, 'Madani Besari banned IP 178.43.12.3 in SSHD at 192.168.23.27.', 'success', '2020-12-04 16:21:59', '2020-12-04 16:21:59'),
(95, 'Madani Besari banned IP 64.56.54.34 in SSHD at 192.168.23.27.', 'success', '2020-12-04 16:22:21', '2020-12-04 16:22:21'),
(96, 'Madani Besari deleted a filter named Moodle-Auth.', 'success', '2020-12-05 01:05:19', '2020-12-05 01:05:19'),
(97, 'Madani Besari added a new filter named moodle.', 'success', '2020-12-05 01:16:41', '2020-12-05 01:16:41'),
(98, 'Madani Besari added a new filter named Apache-Auth.', 'success', '2020-12-05 01:19:07', '2020-12-05 01:19:07'),
(99, 'Madani Besari added a new filter named moodle-auth.', 'success', '2020-12-05 01:20:03', '2020-12-05 01:20:03'),
(100, 'Madani Besari added a new filter named Apache-Auth.', 'success', '2020-12-05 01:20:27', '2020-12-05 01:20:27'),
(101, 'Madani Besari added a new filter named Moodle-Auth.', 'success', '2020-12-05 01:24:17', '2020-12-05 01:24:17'),
(102, 'Madani Besari deleted a filter named moodle.', 'success', '2020-12-05 01:38:24', '2020-12-05 01:38:24'),
(103, 'Madani Besari deleted a filter named Apache-Auth.', 'success', '2020-12-05 01:38:30', '2020-12-05 01:38:30'),
(104, 'Madani Besari deleted a filter named Wordpress-Auth.', 'success', '2020-12-05 01:38:39', '2020-12-05 01:38:39'),
(105, 'Madani Besari deleted a filter named moodle-auth.', 'success', '2020-12-05 01:38:45', '2020-12-05 01:38:45'),
(106, 'Madani Besari deleted a filter named Apache-Auth.', 'success', '2020-12-05 01:38:51', '2020-12-05 01:38:51'),
(107, 'Host CMS-Wordpress with IP address 192.168.23.27 has banned 129.2.3.4 from ecosystem, IP automatically banned to all host and jail.', 'danger', '2020-12-05 03:09:25', '2020-12-05 03:09:25'),
(108, 'Host CMS-Wordpress with IP address 192.168.23.27 has banned 119.22.33.4 from the system, this IP will be automatically banned from all hosts and the jail.', 'warning', '2020-12-05 03:13:40', '2020-12-05 03:13:40'),
(109, 'Host CMS-Wordpress with IP address 192.168.23.27 has reported 19.22.33.4 from the system, this IP will be automatically reported to all hosts and the jail.', 'warning', '2020-12-05 08:08:51', '2020-12-05 08:08:51'),
(110, 'Madani Besari updated a jail named SSHD at 192.168.23.27.', 'success', '2020-12-06 13:45:52', '2020-12-06 13:45:52'),
(111, 'Madani Besari updated a jail named SSHD at 192.168.23.27.', 'success', '2020-12-06 13:47:48', '2020-12-06 13:47:48'),
(112, 'Madani Besari disabled a jail named SSHD at 192.168.23.27.', 'success', '2020-12-06 13:50:08', '2020-12-06 13:50:08'),
(113, 'Madani Besari enabled a jail named SSHD at 192.168.23.27.', 'success', '2020-12-06 13:50:23', '2020-12-06 13:50:23'),
(114, 'Madani Besari deleted a host named Zabbix.', 'success', '2020-12-06 14:15:16', '2020-12-06 14:15:16'),
(115, 'Madani Besari deleted a host named NS1.', 'success', '2020-12-06 14:15:26', '2020-12-06 14:15:26'),
(116, 'Madani Besari deleted a host named ELK Stack.', 'success', '2020-12-06 14:15:35', '2020-12-06 14:15:35'),
(117, 'Madani Besari updated a host named CentOS-8.', 'success', '2020-12-06 14:16:08', '2020-12-06 14:16:08'),
(118, 'Madani Besari deleted a filter named moodle-auth.', 'success', '2020-12-06 14:17:37', '2020-12-06 14:17:37'),
(119, 'Madani Besari added a new filter named wplogin.', 'success', '2020-12-06 14:52:13', '2020-12-06 14:52:13'),
(120, 'Madani Besari deleted a filter named wplogin.', 'success', '2020-12-06 14:59:02', '2020-12-06 14:59:02'),
(121, 'Madani Besari added a new filter named wp-login.', 'success', '2020-12-06 15:01:37', '2020-12-06 15:01:37'),
(122, 'Madani Besari deleted a filter named wp-login.', 'success', '2020-12-06 15:17:50', '2020-12-06 15:17:50'),
(123, 'Madani Besari added a new filter named wp-login.', 'success', '2020-12-06 15:18:05', '2020-12-06 15:18:05'),
(124, 'Madani Besari updated a filter named wp-login.', 'success', '2020-12-06 15:21:01', '2020-12-06 15:21:01'),
(125, 'Madani Besari updated a filter named wp-login.', 'success', '2020-12-06 15:21:19', '2020-12-06 15:21:19'),
(126, 'Madani Besari added a new host named Ubuntu-20.', 'success', '2020-12-06 15:34:17', '2020-12-06 15:34:17'),
(127, 'Madani Besari added a new jail named wp-login at 192.168.43.87 or 5050.', 'success', '2020-12-06 15:50:20', '2020-12-06 15:50:20'),
(128, 'Madani Besari enabled a jail named wp-login at 192.168.43.87.', 'success', '2020-12-06 15:50:38', '2020-12-06 15:50:38'),
(129, 'Madani Besari added a new jail named wp-login at 192.168.43.87 or 5050.', 'success', '2020-12-06 15:56:05', '2020-12-06 15:56:05'),
(130, 'Madani Besari added a new jail named wp-login at 192.168.43.87 or 5050.', 'success', '2020-12-06 16:04:27', '2020-12-06 16:04:27'),
(131, 'Madani Besari enabled a jail named wp-login at 192.168.43.87.', 'success', '2020-12-06 16:04:59', '2020-12-06 16:04:59'),
(132, 'Madani Besari added a new jail named sshd at 192.168.43.87 or 5050.', 'success', '2020-12-06 16:07:25', '2020-12-06 16:07:25'),
(133, 'Madani Besari enabled a jail named sshd at 192.168.43.87.', 'success', '2020-12-06 16:07:40', '2020-12-06 16:07:40'),
(134, 'Madani Besari added a new jail named wp-login at 192.168.43.87 or 5050.', 'success', '2020-12-06 16:26:59', '2020-12-06 16:26:59'),
(135, 'Madani Besari added a new jail named sshd at 192.168.43.87 or 5050.', 'success', '2020-12-06 16:27:49', '2020-12-06 16:27:49'),
(136, 'Madani Besari added a new jail named wp-login at 192.168.43.87 or 5050.', 'success', '2020-12-06 16:45:47', '2020-12-06 16:45:47'),
(137, 'Host CentOS-8 with IP address 192.168.43.87 has banned 176.43.23.1 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-06 16:54:06', '2020-12-06 16:54:06'),
(138, 'Host CentOS-8 with IP address 192.168.43.87 has banned 176.43.23.1 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-06 16:56:18', '2020-12-06 16:56:18'),
(139, 'Host CentOS-8 with IP address 192.168.43.87 has banned 192.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-06 17:54:57', '2020-12-06 17:54:57'),
(140, 'Host CentOS-8 with IP address 192.168.43.87 has banned 200.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-06 17:57:37', '2020-12-06 17:57:37'),
(141, 'Madani Besari banned IP 192.168.23.22 in sshd at 192.168.43.87.', 'success', '2020-12-06 18:05:33', '2020-12-06 18:05:33'),
(142, 'Host CentOS-8 with IP address 192.168.43.87 has unbanned 192.168.23.22 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-06 18:18:07', '2020-12-06 18:18:07'),
(143, 'Madani Besari banned IP 192.168.23.21 in sshd at 192.168.43.87.', 'success', '2020-12-06 18:22:25', '2020-12-06 18:22:25'),
(144, 'Madani Besari banned IP 201.23.43.2 in sshd at 192.168.43.87.', 'success', '2020-12-06 18:22:52', '2020-12-06 18:22:52'),
(145, 'Host CentOS-8 with IP address 192.168.43.87 has unbanned 192.168.23.21 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-06 18:23:21', '2020-12-06 18:23:21'),
(146, 'Host CentOS-8 with IP address 192.168.43.87 has unbanned 201.23.43.2 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-06 18:28:03', '2020-12-06 18:28:03'),
(147, 'Host CentOS-8 with IP address 192.168.43.87 has banned 192.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-06 18:34:00', '2020-12-06 18:34:00'),
(148, 'Host CentOS-8 with IP address 192.168.43.87 has banned 192.78.43.12 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-07 02:14:43', '2020-12-07 02:14:43'),
(149, 'Host CentOS-8 with IP address 192.168.43.87 has unbanned 192.78.43.12 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-07 02:17:26', '2020-12-07 02:17:26'),
(150, 'Madani Besari unbanned IP 192.168.43.15 in sshd at 192.168.43.87.', 'success', '2020-12-07 02:25:03', '2020-12-07 02:25:03'),
(151, 'Host CentOS-8 with IP address 192.168.43.87 has banned 192.168.43.65 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-07 02:37:44', '2020-12-07 02:37:44'),
(152, 'Host CentOS-8 with IP address 192.168.43.87 has unbanned 192.168.43.65 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-07 02:38:11', '2020-12-07 02:38:11'),
(153, 'Host CentOS-8 with IP address 192.168.43.87 has banned 192.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-07 02:56:49', '2020-12-07 02:56:49'),
(154, 'Host CentOS-8 with IP address 192.168.43.87 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-07 02:57:12', '2020-12-07 02:57:12'),
(155, 'Host CentOS-8 with IP address 192.168.43.87 has banned 192.168.43.21 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-07 03:16:59', '2020-12-07 03:16:59'),
(156, 'Host CentOS-8 with IP address 192.168.43.87 has unbanned 192.168.23.21 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-07 03:28:16', '2020-12-07 03:28:16'),
(157, 'Host CentOS-8 with IP address 192.168.43.87 has banned 192.168.3.2 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-07 04:21:50', '2020-12-07 04:21:50'),
(158, 'Host CentOS-8 with IP address 192.168.43.87 has unbanned 192.168.3.2 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-07 04:22:49', '2020-12-07 04:22:49'),
(159, 'Host CentOS-8 with IP address 192.168.43.87 has banned 192.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-07 04:34:07', '2020-12-07 04:34:07'),
(160, 'Host CentOS-8 with IP address 192.168.43.87 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-07 04:34:38', '2020-12-07 04:34:38'),
(161, 'Host CentOS-8 with IP address 192.168.43.87 has banned 192.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-07 05:13:22', '2020-12-07 05:13:22'),
(162, 'Host CentOS-8 with IP address 192.168.43.87 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-07 05:13:53', '2020-12-07 05:13:53'),
(163, 'Madani Besari added a new jail named sshd at 192.168.43.87 or 5050.', 'success', '2020-12-07 06:06:10', '2020-12-07 06:06:10'),
(164, 'Madani Besari updated a jail named sshd at 192.168.43.87.', 'success', '2020-12-07 06:07:11', '2020-12-07 06:07:11'),
(165, 'Madani Besari updated a jail named sshd at 192.168.43.87.', 'success', '2020-12-07 06:07:46', '2020-12-07 06:07:46'),
(166, 'Madani Besari updated a jail named sshd at 192.168.43.87.', 'success', '2020-12-07 06:12:02', '2020-12-07 06:12:02'),
(167, 'Madani Besari updated a jail named sshd at 192.168.43.87.', 'success', '2020-12-07 06:12:49', '2020-12-07 06:12:49'),
(168, 'Host CentOS-8 with IP address 192.168.43.87 has banned 192.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-07 06:13:49', '2020-12-07 06:13:49'),
(169, 'Host CentOS-8 with IP address 192.168.43.87 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-07 06:19:33', '2020-12-07 06:19:33'),
(170, 'Madani Besari disabled a jail named sshd at 192.168.43.87.', 'success', '2020-12-07 06:26:37', '2020-12-07 06:26:37'),
(171, 'Madani Besari enabled a jail named sshd at 192.168.43.87.', 'success', '2020-12-07 06:27:00', '2020-12-07 06:27:00'),
(172, 'Host CentOS-8 with IP address 192.168.43.87 has banned 192.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-07 06:27:04', '2020-12-07 06:27:04'),
(173, 'Madani Besari disabled a jail named sshd at 192.168.43.87.', 'success', '2020-12-07 06:29:29', '2020-12-07 06:29:29'),
(174, 'Madani Besari enabled a jail named sshd at 192.168.43.87.', 'success', '2020-12-07 06:33:37', '2020-12-07 06:33:37'),
(175, 'Host CentOS-8 with IP address 192.168.43.87 has banned <ip> from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-07 06:33:39', '2020-12-07 06:33:39'),
(176, 'Host CentOS-8 with IP address 192.168.43.87 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-07 06:35:35', '2020-12-07 06:35:35'),
(177, 'Madani Besari disabled a jail named sshd at 192.168.43.87.', 'success', '2020-12-07 06:37:10', '2020-12-07 06:37:10'),
(178, 'Madani Besari enabled a jail named sshd at 192.168.43.87.', 'success', '2020-12-07 06:37:31', '2020-12-07 06:37:31'),
(179, 'Host CentOS-8 with IP address 192.168.43.87 has banned <ip> from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-07 06:37:34', '2020-12-07 06:37:34'),
(180, 'Host CentOS-8 with IP address 192.168.43.87 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-07 06:39:07', '2020-12-07 06:39:07'),
(181, 'Madani Besari disabled a jail named sshd at 192.168.43.87.', 'success', '2020-12-07 06:50:03', '2020-12-07 06:50:03'),
(182, 'Madani Besari enabled a jail named sshd at 192.168.43.87.', 'success', '2020-12-07 06:55:44', '2020-12-07 06:55:44'),
(183, 'Host CentOS-8 with IP address 192.168.43.87 has banned <ip> from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-07 06:55:47', '2020-12-07 06:55:47'),
(184, 'Host CentOS-8 with IP address 192.168.43.87 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-07 06:58:22', '2020-12-07 06:58:22'),
(185, 'Host CentOS-8 with IP address 192.168.43.87 has banned <ip> from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-07 06:58:23', '2020-12-07 06:58:23'),
(186, 'Madani Besari updated a jail named sshd at 192.168.43.87.', 'success', '2020-12-07 06:59:30', '2020-12-07 06:59:30'),
(187, 'Host CentOS-8 with IP address 192.168.43.87 has banned <ip> from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-07 06:59:36', '2020-12-07 06:59:36'),
(188, 'Madani Besari added a new jail named sshd at 192.168.43.87 or 5050.', 'success', '2020-12-07 08:40:22', '2020-12-07 08:40:22'),
(189, 'Madani Besari disabled a jail named sshd at 192.168.43.87.', 'success', '2020-12-07 08:41:18', '2020-12-07 08:41:18'),
(190, 'Madani Besari enabled a jail named sshd at 192.168.43.87.', 'success', '2020-12-07 08:41:31', '2020-12-07 08:41:31'),
(191, 'Madani Besari banned IP 178.43.12.1 in sshd at 192.168.43.87.', 'success', '2020-12-07 08:56:38', '2020-12-07 08:56:38'),
(192, 'Madani Besari updated a jail named sshd at 192.168.43.87.', 'success', '2020-12-07 08:57:06', '2020-12-07 08:57:06'),
(193, 'Madani Besari updated a jail named sshd at 192.168.43.87.', 'success', '2020-12-07 09:08:16', '2020-12-07 09:08:16'),
(194, 'Madani Besari unbanned IP 178.43.12.1 in sshd at 192.168.43.87.', 'success', '2020-12-07 09:10:23', '2020-12-07 09:10:23'),
(195, 'Madani Besari updated a jail named sshd at 192.168.43.87.', 'success', '2020-12-07 09:11:52', '2020-12-07 09:11:52'),
(196, 'Madani Besari banned IP 189.45.32.1 in sshd at 192.168.43.87.', 'success', '2020-12-07 09:22:10', '2020-12-07 09:22:10'),
(197, 'Madani Besari banned IP 189.45.32.1 in sshd at 192.168.43.87.', 'success', '2020-12-07 09:22:38', '2020-12-07 09:22:38'),
(198, 'Madani Besari banned IP 178.43.12.3 in sshd at 192.168.43.87.', 'success', '2020-12-07 09:33:46', '2020-12-07 09:33:46'),
(199, 'Madani Besari banned IP 178.43.12.3 in sshd at 192.168.43.87.', 'success', '2020-12-07 09:34:34', '2020-12-07 09:34:34'),
(200, 'Madani Besari updated a host named CentOS-8.', 'success', '2020-12-07 16:49:39', '2020-12-07 16:49:39'),
(201, 'Madani Besari updated a host named CentOS-8.', 'success', '2020-12-07 17:18:05', '2020-12-07 17:18:05'),
(202, 'Madani Besari disabled a jail named sshd at 192.168.43.87.', 'success', '2020-12-07 17:18:31', '2020-12-07 17:18:31'),
(203, 'Madani Besari enabled a jail named sshd at 192.168.43.87.', 'success', '2020-12-07 17:19:06', '2020-12-07 17:19:06'),
(204, 'Madani Besari updated a jail named sshd at 192.168.43.87.', 'success', '2020-12-07 17:20:31', '2020-12-07 17:20:31'),
(205, 'Madani Besari unbanned IP 178.43.12.3 in sshd at 192.168.43.87.', 'success', '2020-12-07 17:21:00', '2020-12-07 17:21:00'),
(206, 'Madani Besari unbanned IP 178.43.12.3 in sshd at 192.168.43.87.', 'success', '2020-12-07 17:21:13', '2020-12-07 17:21:13'),
(207, 'Madani Besari unbanned IP 189.45.32.1 in sshd at 192.168.43.87.', 'success', '2020-12-07 17:21:29', '2020-12-07 17:21:29'),
(208, 'Madani Besari unbanned IP 189.45.32.1 in sshd at 192.168.43.87.', 'success', '2020-12-07 17:21:37', '2020-12-07 17:21:37'),
(209, 'Madani Besari banned IP 187.23.43.2 in sshd at 192.168.43.87.', 'success', '2020-12-07 17:23:26', '2020-12-07 17:23:26'),
(210, 'Madani Besari updated a jail named sshd at 192.168.43.87.', 'success', '2020-12-07 17:28:34', '2020-12-07 17:28:34'),
(211, 'Host CentOS-8 with IP address 192.168.43.87 has banned 192.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-07 17:45:45', '2020-12-07 17:45:45'),
(212, 'Host CentOS-8 with IP address 192.168.43.87 has banned 192.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-07 17:45:54', '2020-12-07 17:45:54'),
(213, 'Host CentOS-8 with IP address 192.168.43.87 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-07 17:47:49', '2020-12-07 17:47:49'),
(214, 'Madani Besari unbanned IP 192.168.43.15 in sshd at 192.168.43.87.', 'success', '2020-12-07 17:51:42', '2020-12-07 17:51:42'),
(215, 'Madani Besari unbanned IP 192.168.43.15 in sshd at 192.168.43.87.', 'success', '2020-12-07 17:51:50', '2020-12-07 17:51:50'),
(216, 'Madani Besari unbanned IP 192.168.43.15 in sshd at 192.168.43.87.', 'success', '2020-12-07 17:52:08', '2020-12-07 17:52:08'),
(217, 'Host CentOS-8 with IP address 192.168.43.87 has banned 192.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-07 17:52:51', '2020-12-07 17:52:51'),
(218, 'Host CentOS-8 with IP address 192.168.43.87 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-07 17:54:50', '2020-12-07 17:54:50'),
(219, 'Madani Besari updated a host named CentOS-8.', 'success', '2020-12-08 07:10:04', '2020-12-08 07:10:04'),
(220, 'Madani Besari updated a jail named sshd at 192.168.43.87.', 'success', '2020-12-08 07:11:01', '2020-12-08 07:11:01'),
(221, 'Madani Besari unbanned IP 187.23.43.2 in sshd at 192.168.43.87.', 'success', '2020-12-08 07:11:23', '2020-12-08 07:11:23'),
(222, 'Madani Besari deleted a host named Ubuntu-20.', 'success', '2020-12-08 07:14:45', '2020-12-08 07:14:45'),
(223, 'Madani Besari updated a filter named wp-login.', 'success', '2020-12-08 07:15:04', '2020-12-08 07:15:04'),
(224, 'Madani Besari updated a filter named wp-login.', 'success', '2020-12-08 07:15:49', '2020-12-08 07:15:49'),
(225, 'Madani Besari updated a filter named wp-login.', 'success', '2020-12-08 07:16:07', '2020-12-08 07:16:07'),
(226, 'Host CentOS-8 with IP address 192.168.43.87 has banned 192.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-08 07:18:09', '2020-12-08 07:18:09'),
(227, 'Madani Besari unbanned IP 192.168.43.15 in sshd at 192.168.43.87.', 'success', '2020-12-08 07:18:19', '2020-12-08 07:18:19'),
(228, 'Host CentOS-8 with IP address 192.168.43.87 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-08 07:19:58', '2020-12-08 07:19:58'),
(229, 'Host CentOS-8 with IP address 192.168.43.87 has banned 192.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-08 10:50:58', '2020-12-08 10:50:58'),
(230, 'Host CentOS-8 with IP address 192.168.43.87 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-08 10:52:40', '2020-12-08 10:52:40'),
(231, 'Madani Besari disabled a jail named sshd at 192.168.43.87.', 'success', '2020-12-08 11:00:09', '2020-12-08 11:00:09'),
(232, 'Madani Besari enabled a jail named sshd at 192.168.43.87.', 'success', '2020-12-08 11:05:16', '2020-12-08 11:05:16'),
(233, 'Madani Besari disabled a jail named sshd at 192.168.43.87.', 'success', '2020-12-08 11:05:23', '2020-12-08 11:05:23'),
(234, 'Madani Besari enabled a jail named sshd at 192.168.43.87.', 'success', '2020-12-08 11:05:56', '2020-12-08 11:05:56'),
(235, 'Madani Besari updated a filter named wp-login.', 'success', '2020-12-08 11:17:08', '2020-12-08 11:17:08'),
(236, 'Madani Besari updated a filter named wp-login.', 'success', '2020-12-08 11:17:23', '2020-12-08 11:17:23'),
(237, 'Madani Besari banned IP 178.43.12.3 in sshd at 192.168.43.87.', 'success', '2020-12-08 15:39:13', '2020-12-08 15:39:13'),
(238, 'Madani Besari banned IP 156.54.34.2 in sshd at 192.168.43.87.', 'success', '2020-12-08 15:43:30', '2020-12-08 15:43:30'),
(239, 'Madani Besari banned IP 167.43.123.54 in sshd at 192.168.43.87.', 'success', '2020-12-08 15:56:00', '2020-12-08 15:56:00'),
(240, 'Madani Besari unbanned IP 192.168.43.15 in sshd at 192.168.43.87.', 'success', '2020-12-08 15:59:07', '2020-12-08 15:59:07'),
(241, 'Host CentOS-8 with IP address 192.168.43.87 has banned 192.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-08 16:10:47', '2020-12-08 16:10:47'),
(242, 'Host CentOS-8 with IP address 192.168.43.87 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-08 16:12:45', '2020-12-08 16:12:45'),
(243, 'Madani Besari disabled a jail named sshd at 192.168.43.87.', 'success', '2020-12-11 12:34:37', '2020-12-11 12:34:37'),
(244, 'Madani Besari enabled a jail named sshd at 192.168.43.87.', 'success', '2020-12-11 12:34:50', '2020-12-11 12:34:50'),
(245, 'Host CentOS-8 with IP address 192.168.43.87 has banned 192.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-11 12:40:59', '2020-12-11 12:40:59'),
(246, 'Madani Besari updated a jail named sshd at 192.168.43.87.', 'success', '2020-12-11 12:46:21', '2020-12-11 12:46:21'),
(247, 'Host CentOS-8 with IP address 192.168.43.87 has banned 192.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-11 12:47:06', '2020-12-11 12:47:06'),
(248, 'Host CentOS-8 with IP address 192.168.43.87 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-11 12:47:53', '2020-12-11 12:47:53'),
(249, 'Madani Besari updated a role named Admin.', 'success', '2020-12-11 12:50:38', '2020-12-11 12:50:38'),
(250, 'Madani Besari updated a role named Admin.', 'success', '2020-12-11 12:51:50', '2020-12-11 12:51:50'),
(251, 'Madani Besari added a new host named CeonOS-8-B.', 'success', '2020-12-12 01:02:43', '2020-12-12 01:02:43'),
(252, 'Madani Besari updated a host named CentOS-8.', 'success', '2020-12-12 01:03:07', '2020-12-12 01:03:07'),
(253, 'Madani Besari updated a host named CentOS-8-B.', 'success', '2020-12-12 01:03:43', '2020-12-12 01:03:43'),
(254, 'Madani Besari added a new jail named sshd at 192.168.43.87 or 80.', 'success', '2020-12-12 01:05:41', '2020-12-12 01:05:41'),
(255, 'Madani Besari updated a host named CentOS-8-B.', 'success', '2020-12-12 01:36:56', '2020-12-12 01:36:56'),
(256, 'Madani Besari updated a host named CentOS-8.', 'success', '2020-12-12 01:37:08', '2020-12-12 01:37:08'),
(257, 'Madani Besari unbanned IP 192.168.43.15 in sshd at 192.168.43.87.', 'success', '2020-12-12 02:00:20', '2020-12-12 02:00:20'),
(258, 'Madani Besari unbanned IP 167.43.123.54 in sshd at 192.168.43.88.', 'success', '2020-12-12 02:43:36', '2020-12-12 02:43:36'),
(259, 'Madani Besari unbanned IP 192.168.43.15 in sshd at 192.168.43.87.', 'success', '2020-12-12 02:45:34', '2020-12-12 02:45:34'),
(260, 'Madani Besari unbanned IP 156.54.34.2 in sshd at 192.168.43.88.', 'success', '2020-12-12 02:46:08', '2020-12-12 02:46:08'),
(261, 'Madani Besari unbanned IP 178.43.12.3 in sshd at 192.168.43.88.', 'success', '2020-12-12 02:50:45', '2020-12-12 02:50:45'),
(262, 'Madani Besari unbanned IP 178.43.12.3 in sshd at 192.168.43.88.', 'success', '2020-12-12 02:51:46', '2020-12-12 02:51:46'),
(263, 'Madani Besari unbanned IP 178.43.12.3 in sshd at 192.168.43.88.', 'success', '2020-12-12 02:53:09', '2020-12-12 02:53:09'),
(264, 'Host CentOS-8 with IP address 192.168.43.88 has banned 192.168.23.21 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-12 03:23:27', '2020-12-12 03:23:27'),
(265, 'Host CentOS-8 with IP address 192.168.43.88 has banned 192.168.23.21 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-12 03:24:30', '2020-12-12 03:24:30'),
(266, 'Host CentOS-8 with IP address 192.168.43.88 has banned 192.168.23.21 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-12 03:25:34', '2020-12-12 03:25:34'),
(267, 'Host CentOS-8 with IP address 192.168.43.88 has banned 192.168.23.21 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-12 03:26:34', '2020-12-12 03:26:34'),
(268, 'Host CentOS-8 with IP address 192.168.43.88 has banned 192.168.23.21 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-12 03:26:47', '2020-12-12 03:26:47'),
(269, 'Host CentOS-8 with IP address 192.168.43.88 has banned 192.168.23.21 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-12 03:29:11', '2020-12-12 03:29:11'),
(270, 'Madani Besari unbanned IP 192.168.43.15 in sshd at 192.168.43.87.', 'success', '2020-12-12 07:28:53', '2020-12-12 07:28:53'),
(271, 'Madani Besari updated a host named FTP-DB.', 'success', '2020-12-12 07:29:39', '2020-12-12 07:29:39'),
(272, 'Madani Besari updated a host named Wordpress-CMS.', 'success', '2020-12-12 07:29:52', '2020-12-12 07:29:52'),
(273, 'Host FTP-DB with IP address 192.168.43.88 has banned 192.168.23.214 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-12 08:46:37', '2020-12-12 08:46:37'),
(274, 'Madani Besari disabled a jail named sshd at 192.168.43.87.', 'success', '2020-12-12 08:53:18', '2020-12-12 08:53:18'),
(275, 'Madani Besari enabled a jail named sshd at 192.168.43.87.', 'success', '2020-12-12 08:53:49', '2020-12-12 08:53:49'),
(276, 'Madani Besari updated a jail named sshd at 192.168.43.87.', 'success', '2020-12-12 08:54:32', '2020-12-12 08:54:32'),
(277, 'Madani Besari deleted a filter named wp-login.', 'success', '2020-12-12 08:57:21', '2020-12-12 08:57:21'),
(278, 'Madani Besari added a new filter named wp-login.', 'success', '2020-12-12 08:57:31', '2020-12-12 08:57:31'),
(279, 'Madani Besari unbanned IP 192.168.23.214 in sshd at 192.168.43.88.', 'success', '2020-12-12 09:00:00', '2020-12-12 09:00:00'),
(280, 'Madani Besari unbanned IP 192.168.23.21 in sshd at 192.168.43.88.', 'success', '2020-12-12 09:00:05', '2020-12-12 09:00:05'),
(281, 'Madani Besari unbanned IP 192.168.23.21 in sshd at 192.168.43.88.', 'success', '2020-12-12 09:00:10', '2020-12-12 09:00:10'),
(282, 'Madani Besari unbanned IP 192.168.23.21 in sshd at 192.168.43.88.', 'success', '2020-12-12 09:00:16', '2020-12-12 09:00:16'),
(283, 'Madani Besari unbanned IP 192.168.23.21 in sshd at 192.168.43.88.', 'success', '2020-12-12 09:00:27', '2020-12-12 09:00:27'),
(284, 'Madani Besari unbanned IP 192.168.23.21 in sshd at 192.168.43.88.', 'success', '2020-12-12 09:00:33', '2020-12-12 09:00:33'),
(285, 'Madani Besari unbanned IP 192.168.23.21 in sshd at 192.168.43.88.', 'success', '2020-12-12 09:00:38', '2020-12-12 09:00:38'),
(286, 'Madani Besari unbanned IP 192.168.23.21 in sshd at 192.168.43.88.', 'success', '2020-12-12 09:00:44', '2020-12-12 09:00:44'),
(287, 'Madani Besari unbanned IP 192.168.23.21 in sshd at 192.168.43.88.', 'success', '2020-12-12 09:00:50', '2020-12-12 09:00:50'),
(288, 'Madani Besari unbanned IP 192.168.23.21 in sshd at 192.168.43.88.', 'success', '2020-12-12 09:00:57', '2020-12-12 09:00:57'),
(289, 'Madani Besari updated a jail named sshd at 192.168.43.88.', 'success', '2020-12-12 09:01:20', '2020-12-12 09:01:20'),
(290, 'Host FTP-DB with IP address 192.168.43.88 has banned 192.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-12 09:02:00', '2020-12-12 09:02:00'),
(291, 'Host FTP-DB with IP address 192.168.43.88 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-12 09:03:49', '2020-12-12 09:03:49'),
(292, 'Host Wordpress-CMS with IP address 192.168.43.87 has banned 192.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-12 09:04:48', '2020-12-12 09:04:48'),
(293, 'Host Wordpress-CMS with IP address 192.168.43.87 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-12 09:05:49', '2020-12-12 09:05:49'),
(294, 'Host Wordpress-CMS with IP address 192.168.43.87 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-12 09:11:45', '2020-12-12 09:11:45'),
(295, 'Host Wordpress-CMS with IP address 192.168.43.87 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-12 09:13:51', '2020-12-12 09:13:51'),
(296, 'Host Wordpress-CMS with IP address 192.168.43.87 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-12 09:16:03', '2020-12-12 09:16:03'),
(297, 'Host Wordpress-CMS with IP address 192.168.43.87 has banned 192.168.23.214 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-12 09:18:31', '2020-12-12 09:18:31'),
(298, 'Host Wordpress-CMS with IP address 192.168.43.87 has unbanned 192.168.23.214 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-12 09:18:56', '2020-12-12 09:18:56'),
(299, 'Host Wordpress-CMS with IP address 192.168.43.87 has banned 192.168.23.214 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-12 09:20:52', '2020-12-12 09:20:52'),
(300, 'Host Wordpress-CMS with IP address 192.168.43.87 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-12 09:23:41', '2020-12-12 09:23:41'),
(301, 'Host FTP-DB with IP address 192.168.43.88 has banned 192.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-12 09:24:13', '2020-12-12 09:24:13'),
(302, 'Host FTP-DB with IP address 192.168.43.88 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-12 09:34:13', '2020-12-12 09:34:13'),
(303, 'Madani Besari banned IP 192.168.43.15 in sshd at 192.168.43.88.', 'success', '2020-12-12 09:39:38', '2020-12-12 09:39:38'),
(304, 'Host FTP-DB with IP address 192.168.43.88 has banned 192.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-12 09:51:42', '2020-12-12 09:51:42'),
(305, 'Host Wordpress-CMS with IP address 192.168.43.87 has banned 192.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-12 09:52:23', '2020-12-12 09:52:23'),
(306, 'Host Wordpress-CMS with IP address 192.168.43.87 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-12 09:53:24', '2020-12-12 09:53:24'),
(307, 'Host FTP-DB with IP address 192.168.43.88 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-12 09:53:32', '2020-12-12 09:53:32'),
(308, 'Madani Besari banned IP 156.23.4.5 in sshd at 192.168.43.88.', 'success', '2020-12-12 10:18:27', '2020-12-12 10:18:27'),
(309, 'Madani Besari unbanned IP 192.168.43.15 in sshd at 192.168.43.88.', 'success', '2020-12-12 10:32:03', '2020-12-12 10:32:03'),
(310, 'Madani Besari unbanned IP 192.168.43.15 in sshd at 192.168.43.88.', 'success', '2020-12-12 10:32:11', '2020-12-12 10:32:11'),
(311, 'Host Wordpress-CMS with IP address 192.168.43.87 has banned 189.32.23.12 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-12 10:58:24', '2020-12-12 10:58:24'),
(312, 'Host Wordpress-CMS with IP address 192.168.43.87 has unbanned 189.32.23.12 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-12 10:59:11', '2020-12-12 10:59:11'),
(313, 'Host Wordpress-CMS with IP address 192.168.43.87 has banned 178.23.43.12 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-12 11:05:36', '2020-12-12 11:05:36'),
(314, 'Host Wordpress-CMS with IP address 192.168.43.87 has unbanned 178.23.43.12 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-12 11:06:24', '2020-12-12 11:06:24'),
(315, 'Madani Besari banned IP 156.32.34.12 in sshd at 192.168.43.88.', 'success', '2020-12-12 11:11:31', '2020-12-12 11:11:31'),
(316, 'Madani Besari banned IP 178.43.12.3 in sshd at 192.168.43.88.', 'success', '2020-12-12 11:12:06', '2020-12-12 11:12:06'),
(317, 'Madani Besari banned IP 178.43.12.3 in sshd at 192.168.43.88.', 'success', '2020-12-12 11:12:36', '2020-12-12 11:12:36'),
(318, 'Madani Besari unbanned IP 178.43.12.3 in sshd at 192.168.43.88.', 'success', '2020-12-12 11:13:59', '2020-12-12 11:13:59'),
(319, 'Madani Besari unbanned IP 192.168.23.214 in sshd at 192.168.43.87.', 'success', '2020-12-12 11:16:18', '2020-12-12 11:16:18'),
(320, 'Madani Besari unbanned IP 192.168.23.214 in sshd at 192.168.43.87.', 'success', '2020-12-12 11:16:23', '2020-12-12 11:16:23'),
(321, 'Madani Besari unbanned IP 192.168.23.214 in sshd at 192.168.43.87.', 'success', '2020-12-12 11:16:47', '2020-12-12 11:16:47'),
(322, 'Host Wordpress-CMS with IP address 192.168.43.87 has banned 178.23.43.12 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-12 11:22:42', '2020-12-12 11:22:42'),
(323, 'Host Wordpress-CMS with IP address 192.168.43.87 has unbanned 178.23.43.12 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-12 11:23:15', '2020-12-12 11:23:15'),
(324, 'Madani Besari updated a jail named sshd at 192.168.43.87.', 'success', '2020-12-12 12:47:50', '2020-12-12 12:47:50'),
(325, 'Madani Besari banned IP 56.43.32.21 in sshd at 192.168.43.87.', 'success', '2020-12-12 12:50:42', '2020-12-12 12:50:42'),
(326, 'Madani Besari disabled a jail named sshd at 192.168.43.88.', 'success', '2020-12-12 12:59:45', '2020-12-12 12:59:45'),
(327, 'Madani Besari enabled a jail named sshd at 192.168.43.88.', 'success', '2020-12-12 13:00:00', '2020-12-12 13:00:00'),
(328, 'Madani Besari updated a host named Wordpress-CMS.', 'success', '2020-12-12 13:10:07', '2020-12-12 13:10:07'),
(329, 'Host Wordpress-CMS with IP address 192.168.43.87 has banned 43.32.21.6 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-12 13:11:15', '2020-12-12 13:11:15'),
(330, 'Madani Besari banned IP 43.32.21.6 in sshd at 192.168.43.87.', 'success', '2020-12-12 13:11:36', '2020-12-12 13:11:36'),
(331, 'Madani Besari unbanned IP 43.32.21.6 in sshd at 192.168.43.87.', 'success', '2020-12-12 13:14:43', '2020-12-12 13:14:43'),
(332, 'Madani Besari unbanned IP 56.43.32.21 in sshd at 192.168.43.87.', 'success', '2020-12-12 13:15:14', '2020-12-12 13:15:14'),
(333, 'Madani Besari unbanned IP 56.43.32.21 in sshd at 192.168.43.87.', 'success', '2020-12-12 13:15:15', '2020-12-12 13:15:15'),
(334, 'Host Wordpress-CMS with IP address 192.168.43.87 has banned 192.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-12 13:22:33', '2020-12-12 13:22:33'),
(335, 'Madani Besari unbanned IP 192.168.43.15 in sshd at 192.168.43.87.', 'success', '2020-12-12 13:24:51', '2020-12-12 13:24:51'),
(336, 'Madani Besari updated a host named Wordpress-CMS.', 'success', '2020-12-12 13:26:54', '2020-12-12 13:26:54'),
(337, 'Madani Besari banned IP 67.87.89.9 in sshd at 192.168.43.87.', 'success', '2020-12-12 13:28:09', '2020-12-12 13:28:09'),
(338, 'Madani Besari unbanned IP 67.87.89.9 in sshd at 192.168.43.87.', 'success', '2020-12-12 13:31:19', '2020-12-12 13:31:19'),
(339, 'Host Wordpress-CMS with IP address 192.168.43.87 has banned 61.23.1.2 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-12 13:38:08', '2020-12-12 13:38:08'),
(340, 'Madani Besari banned IP 61.23.1.2 in sshd at 192.168.43.87.', 'success', '2020-12-12 13:42:58', '2020-12-12 13:42:58'),
(341, 'Host Wordpress-CMS with IP address 192.168.43.87 has unbanned 61.23.1.2 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-12 13:44:19', '2020-12-12 13:44:19');
INSERT INTO `logs` (`id`, `log`, `level`, `created_at`, `updated_at`) VALUES
(342, 'Madani Besari unbanned IP 61.23.1.2 in sshd at 192.168.43.87.', 'success', '2020-12-12 13:44:20', '2020-12-12 13:44:20'),
(343, 'Madani Besari unbanned IP 61.23.1.2 in sshd at 192.168.43.87.', 'success', '2020-12-12 13:44:26', '2020-12-12 13:44:26'),
(344, 'Madani Besari updated a host named Wordpress-CMS.', 'success', '2020-12-12 13:56:39', '2020-12-12 13:56:39'),
(345, 'Madani Besari updated a host named FTP-DB.', 'success', '2020-12-12 13:56:49', '2020-12-12 13:56:49'),
(346, 'Host Wordpress-CMS with IP address 192.168.43.87 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-12 14:05:10', '2020-12-12 14:05:10'),
(347, 'Madani Besari unbanned IP 192.168.43.15 in sshd at 192.168.43.88.', 'success', '2020-12-12 14:25:39', '2020-12-12 14:25:39'),
(348, 'Madani Besari unbanned IP 192.168.43.15 in sshd at 192.168.43.87.', 'success', '2020-12-12 14:29:41', '2020-12-12 14:29:41'),
(349, 'Madani Besari unbanned IP 192.168.43.15 in sshd at 192.168.43.87.', 'success', '2020-12-12 14:29:48', '2020-12-12 14:29:48'),
(350, 'Madani Besari unbanned IP 192.168.43.15 in sshd at 192.168.43.87.', 'success', '2020-12-12 14:29:54', '2020-12-12 14:29:54'),
(351, 'Madani Besari unbanned IP 192.168.43.15 in sshd at 192.168.43.87.', 'success', '2020-12-12 14:30:00', '2020-12-12 14:30:00'),
(352, 'Host Wordpress-CMS with IP address 192.168.43.87 has banned 192.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-12 14:47:28', '2020-12-12 14:47:28'),
(353, 'Madani Besari unbanned IP 192.168.43.15 in sshd at 192.168.43.87.', 'success', '2020-12-12 14:57:35', '2020-12-12 14:57:35'),
(354, 'Host Wordpress-CMS with IP address 192.168.43.87 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-12 15:01:01', '2020-12-12 15:01:01'),
(355, 'Madani Besari updated a jail named sshd at 192.168.43.87.', 'success', '2020-12-12 15:01:01', '2020-12-12 15:01:01'),
(356, 'Host FTP-DB with IP address 192.168.43.88 has banned 192.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-12 15:23:45', '2020-12-12 15:23:45'),
(357, 'Host Wordpress-CMS with IP address 192.168.43.87 has banned 192.168.43.15 from the system, this IP will be automatically banned from all hosts and the jail.', 'danger', '2020-12-12 15:24:18', '2020-12-12 15:24:18'),
(358, 'Host Wordpress-CMS with IP address 192.168.43.87 has unbanned 192.168.43.15 from the system, this IP will be automatically unbanned to all hosts and the jail.', 'warning', '2020-12-12 15:26:21', '2020-12-12 15:26:21'),
(359, 'Madani Besari added a new role named User.', 'success', '2020-12-24 08:05:44', '2020-12-24 08:05:44'),
(360, 'Madani Besari updated a role named User.', 'success', '2020-12-24 08:06:01', '2020-12-24 08:06:01'),
(361, 'Madani Besari deleted a role named User.', 'success', '2020-12-24 08:06:12', '2020-12-24 08:06:12'),
(362, 'Madani Besari added a new user named Admin 2 with a role Admin.', 'success', '2021-01-08 08:27:32', '2021-01-08 08:27:32'),
(363, 'Madani Besari updated a user named Admin Baru.', 'success', '2021-01-08 08:32:25', '2021-01-08 08:32:25'),
(364, 'Madani Besari deleted a user named Admin Baru.', 'success', '2021-01-08 08:34:58', '2021-01-08 08:34:58'),
(365, 'Madani Besari added a new role named Host-Manager.', 'success', '2021-01-08 08:59:38', '2021-01-08 08:59:38'),
(366, 'Madani Besari added a new host named Dev.', 'success', '2021-01-08 09:32:29', '2021-01-08 09:32:29'),
(367, 'Madani Besari deleted a host named Dev.', 'success', '2021-01-08 09:32:46', '2021-01-08 09:32:46'),
(368, 'Madani Besari added a new host named Dev.', 'success', '2021-01-08 09:34:08', '2021-01-08 09:34:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(13, '2014_10_12_000000_create_users_table', 1),
(14, '2014_10_12_100000_create_password_resets_table', 1),
(15, '2019_08_19_000000_create_failed_jobs_table', 1),
(16, '2020_11_06_020424_create_logs_table', 1),
(20, '2020_11_06_023747_create_hosts_table', 1),
(22, '2020_11_06_083413_create_rename_table', 1),
(24, '2020_11_06_101048_create_permission_tables', 1),
(25, '2020_11_06_025152_create_jails_table', 2),
(27, '2020_11_06_021340_create_banned_ip_table', 3),
(29, '2020_11_06_022507_create_trusted_ip_table', 5),
(30, '2020_11_06_083541_create_rename_1_table', 6),
(32, '2020_11_06_023035_create_filter_table', 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(1, 'App\\User', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'role-list', 'web', '2020-11-12 03:25:57', '2020-11-12 03:25:57'),
(2, 'role-create', 'web', '2020-11-12 03:25:57', '2020-11-12 03:25:57'),
(3, 'role-edit', 'web', '2020-11-12 03:25:57', '2020-11-12 03:25:57'),
(4, 'role-delete', 'web', '2020-11-12 03:25:57', '2020-11-12 03:25:57'),
(5, 'host-list', 'web', '2020-11-12 03:25:58', '2020-11-12 03:25:58'),
(6, 'host-create', 'web', '2020-11-12 03:25:58', '2020-11-12 03:25:58'),
(7, 'host-edit', 'web', '2020-11-12 03:25:58', '2020-11-12 03:25:58'),
(8, 'host-delete', 'web', '2020-11-12 03:25:58', '2020-11-12 03:25:58'),
(9, 'user-list', 'web', '2020-11-12 03:25:58', '2020-11-12 03:25:58'),
(10, 'user-create', 'web', '2020-11-12 03:25:58', '2020-11-12 03:25:58'),
(11, 'user-edit', 'web', '2020-11-12 03:25:58', '2020-11-12 03:25:58'),
(12, 'user-delete', 'web', '2020-11-12 03:25:58', '2020-11-12 03:25:58'),
(13, 'jail-list', 'web', '2020-11-12 03:25:58', '2020-11-12 03:25:58'),
(14, 'jail-create', 'web', '2020-11-12 03:25:58', '2020-11-12 03:25:58'),
(15, 'jail-edit', 'web', '2020-11-12 03:25:58', '2020-11-12 03:25:58'),
(16, 'jail-delete', 'web', '2020-11-12 03:25:58', '2020-11-12 03:25:58'),
(17, 'filter-list', 'web', '2020-11-12 03:25:59', '2020-11-12 03:25:59'),
(18, 'filter-create', 'web', '2020-11-12 03:25:59', '2020-11-12 03:25:59'),
(19, 'filter-edit', 'web', '2020-11-12 03:25:59', '2020-11-12 03:25:59'),
(20, 'filter-delete', 'web', '2020-11-12 03:25:59', '2020-11-12 03:25:59'),
(21, 'ban-ip', 'web', '2020-11-12 03:25:59', '2020-11-12 03:25:59'),
(22, 'unban-ip', 'web', '2020-11-12 03:25:59', '2020-11-12 03:25:59'),
(23, 'trust-ip', 'web', '2020-11-12 03:25:59', '2020-11-12 03:25:59'),
(24, 'untrust_ip', 'web', '2020-11-12 03:25:59', '2020-11-12 03:25:59'),
(25, 'log-list', 'web', '2020-11-12 03:25:59', '2020-11-12 03:25:59'),
(26, 'dashboard', 'web', '2020-11-12 03:25:59', '2020-11-12 03:25:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2020-11-12 03:26:19', '2020-11-12 03:26:19'),
(6, 'Host-Manager', 'web', '2021-01-08 08:59:39', '2021-01-08 08:59:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(5, 6),
(6, 1),
(6, 6),
(7, 1),
(7, 6),
(8, 1),
(8, 6),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `trusted_ips`
--

CREATE TABLE `trusted_ips` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jail_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `trusted_ips`
--

INSERT INTO `trusted_ips` (`id`, `ip`, `jail_id`, `created_at`, `updated_at`) VALUES
(12, '127.0.0.1', 15, '2020-12-12 13:06:42', '2020-12-12 13:06:42'),
(13, '127.0.0.1', 16, '2020-12-12 13:10:38', '2020-12-12 13:10:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Madani Besari', 'admin@gmail.com', NULL, '$2y$10$YtMucbMs2Z/vOyxdMVXT6uZoAoDaU79hQ74YuhuLkriYUFh6fOlFa', '0wPbc24R0ZI48j58C9tHaRBlnAXtgbzFZG5cSoMwXMJy68xbXvaGDqIKv0q3', '2020-11-12 03:26:18', '2020-12-01 13:43:20'),
(2, 'Muhammad Farhan Madani', 'muhammadfarhanmadani248@gmail.com', NULL, '$2y$10$PMs3qAooC1nik1KRl0WFH.o0v/TeQ0k0hnrL4ltTF.qeCoa/ushYC', NULL, '2020-11-19 03:34:56', '2020-11-19 03:34:56');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `filters`
--
ALTER TABLE `filters`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `hosts`
--
ALTER TABLE `hosts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jails`
--
ALTER TABLE `jails`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `trusted_ips`
--
ALTER TABLE `trusted_ips`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `banned_ips`
--
ALTER TABLE `banned_ips`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `filters`
--
ALTER TABLE `filters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT untuk tabel `hosts`
--
ALTER TABLE `hosts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `jails`
--
ALTER TABLE `jails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=369;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `trusted_ips`
--
ALTER TABLE `trusted_ips`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
