-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 21, 2023 at 01:12 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gis_esra`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int UNSIGNED NOT NULL,
  `data_type_id` int UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 11, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(58, 11, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 8),
(59, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(60, 11, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 10),
(61, 11, 'file_gjson', 'file', 'File Gjson', 0, 1, 1, 1, 1, 1, '{}', 3),
(62, 11, 'jmlppdk', 'text', 'Jumlah Penduduk', 0, 1, 1, 1, 1, 1, '{}', 4),
(63, 11, 'jml_gizi_buruk', 'text', 'Jumlah Gizi Buruk', 0, 1, 1, 1, 1, 1, '{}', 5),
(64, 11, 'jml_sembuh_gizi_buruk', 'text', 'Jumlah Sembuh Gizi Buruk', 0, 1, 1, 1, 1, 1, '{}', 6),
(65, 11, 'jml_meninggal_gizi_buruk', 'text', 'Jumlah Meninggal Gizi Buruk', 0, 1, 1, 1, 1, 1, '{}', 7),
(66, 11, 'rasio', 'text', 'Rasio', 0, 1, 1, 1, 1, 1, '{}', 11),
(67, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(68, 19, 'kec_id', 'select_dropdown', 'Kecamatan', 0, 1, 1, 1, 1, 1, '{}', 2),
(69, 19, 'tahun', 'text', 'Tahun', 0, 1, 1, 1, 1, 1, '{}', 3),
(70, 19, 'jml_kasus', 'text', 'Jml Kasus', 0, 1, 1, 1, 1, 1, '{}', 4),
(71, 19, 'jml_sembuh', 'text', 'Jml Sembuh', 0, 1, 1, 1, 1, 1, '{}', 5),
(72, 19, 'jml_meninggal', 'text', 'Jml Meninggal', 0, 1, 1, 1, 1, 1, '{}', 6),
(73, 19, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(74, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(75, 19, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 9),
(76, 19, 'data_tahun_hasone_kecamatan_relationship', 'relationship', 'Kecamatan', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\DataTahun\",\"table\":\"kecamatans\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10);

-- --------------------------------------------------------

--
-- Table structure for table `data_tahuns`
--

CREATE TABLE `data_tahuns` (
  `id` int UNSIGNED NOT NULL,
  `kec_id` int DEFAULT NULL,
  `tahun` int DEFAULT NULL,
  `jml_kasus` int DEFAULT NULL,
  `jml_sembuh` int DEFAULT NULL,
  `jml_meninggal` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_tahuns`
--

INSERT INTO `data_tahuns` (`id`, `kec_id`, `tahun`, `jml_kasus`, `jml_sembuh`, `jml_meninggal`, `created_at`, `updated_at`, `deleted_at`) VALUES
(8, 3, 2019, 18, 12, 0, '2023-11-18 23:55:30', '2023-11-18 23:55:30', NULL),
(9, 5, 2019, 1, 0, 0, '2023-11-18 23:56:43', '2023-11-18 23:56:43', NULL),
(10, 5, 2019, 14, 7, 1, '2023-11-19 00:03:17', '2023-11-19 00:03:17', NULL),
(11, 6, 2019, 13, 7, 1, '2023-11-19 00:03:59', '2023-11-19 00:03:59', NULL),
(12, 7, 2019, 6, 1, 1, '2023-11-19 00:04:53', '2023-11-19 00:04:53', NULL),
(13, 8, 2019, 14, 11, 0, '2023-11-19 00:05:15', '2023-11-19 00:05:15', NULL),
(14, 9, 2019, 0, 0, 0, '2023-11-19 00:05:33', '2023-11-19 00:05:33', NULL),
(15, 10, 2019, 0, 0, 0, '2023-11-19 00:06:28', '2023-11-19 00:06:28', NULL),
(16, 11, 2019, 8, 5, 0, '2023-11-19 00:06:48', '2023-11-19 00:06:48', NULL),
(17, 12, 2019, 8, 5, 0, '2023-11-19 00:07:06', '2023-11-19 00:07:06', NULL),
(18, 13, 2019, 8, 4, 0, '2023-11-19 00:07:35', '2023-11-19 00:07:35', NULL),
(19, 14, 2019, 0, 0, 0, '2023-11-19 00:07:49', '2023-11-19 00:07:49', NULL),
(20, 15, 2019, 1, 0, 1, '2023-11-19 00:08:09', '2023-11-19 00:08:09', NULL),
(21, 16, 2019, 7, 4, 0, '2023-11-19 00:08:24', '2023-11-19 00:08:24', NULL),
(22, 17, 2019, 3, 0, 2, '2023-11-19 00:08:42', '2023-11-19 00:08:42', NULL),
(23, 18, 2019, 14, 4, 0, '2023-11-19 00:09:06', '2023-11-19 00:09:06', NULL),
(24, 19, 2019, 16, 10, 0, '2023-11-19 00:09:24', '2023-11-19 00:09:24', NULL),
(25, 20, 2019, 22, 8, 0, '2023-11-19 00:09:46', '2023-11-19 00:09:46', NULL),
(26, 21, 2019, 26, 15, 2, '2023-11-19 00:10:07', '2023-11-19 00:10:07', NULL),
(27, 22, 2019, 14, 10, 0, '2023-11-19 00:10:32', '2023-11-19 00:10:32', NULL),
(28, 4, 2019, 1, 0, 0, '2023-11-19 00:11:45', '2023-11-19 00:11:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2023-10-21 23:54:38', '2023-10-21 23:54:38'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2023-10-21 23:54:38', '2023-10-21 23:54:38'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2023-10-21 23:54:38', '2023-10-21 23:54:38'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(9, 'kecamatan', 'kecamatan', 'Kecamatan', 'Kecamatans', 'voyager-data', 'App\\Models\\Kecamatan', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"created_at\",\"order_display_column\":\"created_at\",\"order_direction\":\"desc\",\"default_search_key\":\"created_at\"}', '2023-10-22 00:16:22', '2023-10-22 00:16:22'),
(11, 'kecamatans', 'kecamatans', 'Kecamatan', 'Kecamatans', 'voyager-folder', 'App\\Models\\Kecamatan', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"created_at\",\"order_display_column\":\"created_at\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-10-22 00:25:19', '2023-10-23 17:01:58'),
(14, 'data_dbd_tahun', 'data-dbd-tahun', 'Data Dbd Tahun', 'Data Dbd Tahuns', NULL, 'App\\Models\\DataDbdTahun', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"kec_id\",\"order_display_column\":\"jml_kasus\",\"order_direction\":\"asc\",\"default_search_key\":null}', '2023-11-09 03:42:34', '2023-11-09 03:42:34'),
(18, 'data_tahun', 'data-tahun', 'Data Tahun', 'Data Tahuns', 'voyager-data', 'App\\DataTahun', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"created_at\",\"order_display_column\":\"created_at\",\"order_direction\":\"desc\",\"default_search_key\":\"tahun\"}', '2023-11-09 03:52:59', '2023-11-09 03:52:59'),
(19, 'data_tahuns', 'data-tahuns', 'Data Tahun', 'Data Tahuns', 'voyager-data', 'App\\DataTahun', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-11-09 03:56:34', '2023-11-09 04:10:49');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kecamatans`
--

CREATE TABLE `kecamatans` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `file_gjson` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jmlppdk` int DEFAULT NULL,
  `jml_gizi_buruk` int DEFAULT NULL,
  `jml_sembuh_gizi_buruk` int DEFAULT NULL,
  `jml_meninggal_gizi_buruk` int DEFAULT NULL,
  `rasio` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kecamatans`
--

INSERT INTO `kecamatans` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`, `file_gjson`, `jmlppdk`, `jml_gizi_buruk`, `jml_sembuh_gizi_buruk`, `jml_meninggal_gizi_buruk`, `rasio`) VALUES
(3, 'Medan Selayang', '2023-10-22 02:14:38', '2023-11-18 21:25:16', NULL, '[{\"download_link\":\"kecamatans\\\\October2023\\\\bYiWAr4MXUDoHr51zX9M.geojson\",\"original_name\":\"medan_selayang.geojson\"}]', 123123, 81, 50, 0, 0),
(4, 'Medan Johor', '2023-10-22 02:15:10', '2023-10-23 17:02:55', NULL, '[{\"download_link\":\"kecamatans\\\\October2023\\\\ShJ6SkXjYyARdHRMW6D6.geojson\",\"original_name\":\"medan_johor.geojson\"}]', NULL, 6, 2, 0, 0),
(5, 'Medan Amplas', '2023-10-22 02:16:21', '2023-10-23 17:03:06', NULL, '[{\"download_link\":\"kecamatans\\\\October2023\\\\dn7sqFYgdSaXzoDGMLyC.geojson\",\"original_name\":\"menda_amplas.geojson\"}]', NULL, 56, 30, 1, 0.0178571),
(6, 'Medan Denai', '2023-10-22 02:17:02', '2023-11-18 21:33:58', NULL, '[{\"download_link\":\"kecamatans\\/October2023\\/medan_denai123_medan_denai.geojson\"}]', 123, 22, 14, 1, 0.0454545),
(7, 'Medan Tembung', '2023-10-22 02:17:29', '2023-10-23 17:03:30', NULL, '[{\"download_link\":\"kecamatans\\\\October2023\\\\RDX7SwiqZvMgHCdSlhx2.geojson\",\"original_name\":\"medan_tembung.geojson\"}]', NULL, 18, 1, 4, 0.222222),
(8, 'Medan Kota', '2023-10-22 02:17:57', '2023-10-23 17:03:45', NULL, '[{\"download_link\":\"kecamatans\\\\October2023\\\\OVhHKp1VbQ0Mo9znWhVG.geojson\",\"original_name\":\"medan_kota.geojson\"}]', NULL, 35, 24, 2, 0.0571429),
(9, 'Medan Area', '2023-10-22 02:20:18', '2023-10-23 17:03:57', NULL, '[{\"download_link\":\"kecamatans\\\\October2023\\\\aRIHmY9t1rBidzoAubmV.geojson\",\"original_name\":\"medan_area.geojson\"}]', NULL, 7, 7, 0, 0),
(10, 'Medan Baru', '2023-10-22 02:23:17', '2023-10-23 17:04:11', NULL, '[{\"download_link\":\"kecamatans\\\\October2023\\\\SyxHLWnMUVra3q9JpLjO.geojson\",\"original_name\":\"medan_baru.geojson\"}]', NULL, 0, 0, 0, 0),
(11, 'Medan Polonia', '2023-10-22 02:29:43', '2023-10-23 17:04:22', NULL, '[{\"download_link\":\"kecamatans\\\\October2023\\\\XxgH7GYoWDShLNH18z5m.geojson\",\"original_name\":\"medan_polonia.geojson\"}]', NULL, 43, 21, 0, 0),
(12, 'Medan Maimun', '2023-10-22 02:30:16', '2023-10-23 17:04:34', NULL, '[{\"download_link\":\"kecamatans\\\\October2023\\\\BEzdwVeEMbpeGbpt5ubt.geojson\",\"original_name\":\"medan_maimun.geojson\"}]', NULL, 82, 23, 2, 0.0243902),
(13, 'Medan Sunggal', '2023-10-22 02:31:43', '2023-10-23 17:04:49', NULL, '[{\"download_link\":\"kecamatans\\\\October2023\\\\FtAvjPIw7lO4f1FvhxIN.geojson\",\"original_name\":\"medan_sunggal.geojson\"}]', NULL, 30, 16, 0, 0),
(14, 'Medan Helvetia', '2023-10-22 02:35:34', '2023-10-23 17:05:00', NULL, '[{\"download_link\":\"kecamatans\\\\October2023\\\\xF4LFuvHKpKVfG0D1uk5.geojson\",\"original_name\":\"medan_helvetia.geojson\"}]', NULL, 2, 0, 0, 0),
(15, 'Medan Barat', '2023-10-22 02:36:02', '2023-10-23 17:05:16', NULL, '[{\"download_link\":\"kecamatans\\\\October2023\\\\F72bqK2PXwiKnBflDMd9.geojson\",\"original_name\":\"medan_barat.geojson\"}]', NULL, 2, 0, 1, 0.5),
(16, 'Medan Petisah', '2023-10-22 02:37:21', '2023-10-23 17:05:27', NULL, '[{\"download_link\":\"kecamatans\\\\October2023\\\\i7Np9J07ZBR1gg0h6OlY.geojson\",\"original_name\":\"medan_petisah.geojson\"}]', NULL, 30, 18, 0, 0),
(17, 'Medan Timur', '2023-10-22 02:38:03', '2023-10-23 17:05:44', NULL, '[{\"download_link\":\"kecamatans\\\\October2023\\\\JznTuXF4tz1fLiavn4Xy.geojson\",\"original_name\":\"medan_timur.geojson\"}]', NULL, 24, 10, 2, 0.0833333),
(18, 'Medan Perjuangan', '2023-10-22 02:38:52', '2023-10-23 17:06:00', NULL, '[{\"download_link\":\"kecamatans\\\\October2023\\\\2tKJOrsYFB87WzfYktEL.geojson\",\"original_name\":\"medan_perjuangan.geojson\"}]', NULL, 70, 20, 0, 0),
(19, 'Medan Deli', '2023-10-22 02:39:36', '2023-10-23 17:06:16', NULL, '[{\"download_link\":\"kecamatans\\\\October2023\\\\QUZnOb0kxfU05uyZs00q.geojson\",\"original_name\":\"medan_deli.geojson\"}]', NULL, 62, 24, 0, 0),
(20, 'Medan Labuhan', '2023-10-22 02:40:13', '2023-10-23 17:06:36', NULL, '[{\"download_link\":\"kecamatans\\\\October2023\\\\Je83KdNvjURgBBnx4AmU.geojson\",\"original_name\":\"medan_labuhan.geojson\"}]', NULL, 105, 44, 3, 0.0285714),
(21, 'Medan Marelan', '2023-10-22 02:40:57', '2023-10-23 17:06:55', NULL, '[{\"download_link\":\"kecamatans\\\\October2023\\\\02gKWCS8a16ndSpG4jQz.geojson\",\"original_name\":\"medan_marelan.geojson\"}]', NULL, 74, 39, 4, 0.0540541),
(22, 'Medan Belawan', '2023-10-22 02:41:36', '2023-10-23 17:07:06', NULL, '[{\"download_link\":\"kecamatans\\\\October2023\\\\7i3jExFrRjCKhvtwaV99.geojson\",\"original_name\":\"medan_belawan.geojson\"}]', NULL, 61, 26, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2023-10-21 23:54:38', '2023-10-21 23:54:38');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int UNSIGNED NOT NULL,
  `menu_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 6, '2023-10-21 23:54:38', '2023-10-22 00:33:12', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 2, '2023-10-21 23:54:38', '2023-10-22 00:33:08', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 3, '2023-10-21 23:54:38', '2023-10-22 00:33:08', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2023-10-21 23:54:38', '2023-10-21 23:54:38', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2023-10-21 23:54:38', '2023-10-21 23:54:38', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2023-10-21 23:54:38', '2023-10-21 23:54:38', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2023-10-21 23:54:38', '2023-10-21 23:54:38', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2023-10-21 23:54:38', '2023-10-21 23:54:38', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 5, '2023-10-21 23:54:38', '2023-10-22 00:33:12', 'voyager.settings.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2023-10-21 23:54:39', '2023-10-21 23:54:39', 'voyager.pages.index', NULL),
(15, 1, 'Kecamatans', '', '_self', 'voyager-data', NULL, NULL, 4, '2023-10-22 00:25:19', '2023-10-22 00:33:06', 'voyager.kecamatans.index', NULL),
(20, 1, 'Data Tahuns', '', '_self', 'voyager-ticket', '#000000', NULL, 11, '2023-11-09 03:56:34', '2023-11-09 04:01:41', 'voyager.data-tahuns.index', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2016_01_01_000000_create_pages_table', 2),
(25, '2016_01_01_000000_create_posts_table', 2),
(26, '2016_02_15_204651_create_categories_table', 2),
(27, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int UNSIGNED NOT NULL,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2023-10-21 23:54:39', '2023-10-21 23:54:39');

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2023-10-21 23:54:38', '2023-10-21 23:54:38'),
(2, 'browse_bread', NULL, '2023-10-21 23:54:38', '2023-10-21 23:54:38'),
(3, 'browse_database', NULL, '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(4, 'browse_media', NULL, '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(5, 'browse_compass', NULL, '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(6, 'browse_menus', 'menus', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(7, 'read_menus', 'menus', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(8, 'edit_menus', 'menus', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(9, 'add_menus', 'menus', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(10, 'delete_menus', 'menus', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(11, 'browse_roles', 'roles', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(12, 'read_roles', 'roles', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(13, 'edit_roles', 'roles', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(14, 'add_roles', 'roles', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(15, 'delete_roles', 'roles', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(16, 'browse_users', 'users', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(17, 'read_users', 'users', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(18, 'edit_users', 'users', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(19, 'add_users', 'users', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(20, 'delete_users', 'users', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(21, 'browse_settings', 'settings', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(22, 'read_settings', 'settings', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(23, 'edit_settings', 'settings', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(24, 'add_settings', 'settings', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(25, 'delete_settings', 'settings', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(36, 'browse_pages', 'pages', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(37, 'read_pages', 'pages', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(38, 'edit_pages', 'pages', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(39, 'add_pages', 'pages', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(40, 'delete_pages', 'pages', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(41, 'browse_kecamatan', 'kecamatan', '2023-10-22 00:16:22', '2023-10-22 00:16:22'),
(42, 'read_kecamatan', 'kecamatan', '2023-10-22 00:16:22', '2023-10-22 00:16:22'),
(43, 'edit_kecamatan', 'kecamatan', '2023-10-22 00:16:22', '2023-10-22 00:16:22'),
(44, 'add_kecamatan', 'kecamatan', '2023-10-22 00:16:22', '2023-10-22 00:16:22'),
(45, 'delete_kecamatan', 'kecamatan', '2023-10-22 00:16:22', '2023-10-22 00:16:22'),
(46, 'browse_kecamatans', 'kecamatans', '2023-10-22 00:25:19', '2023-10-22 00:25:19'),
(47, 'read_kecamatans', 'kecamatans', '2023-10-22 00:25:19', '2023-10-22 00:25:19'),
(48, 'edit_kecamatans', 'kecamatans', '2023-10-22 00:25:19', '2023-10-22 00:25:19'),
(49, 'add_kecamatans', 'kecamatans', '2023-10-22 00:25:19', '2023-10-22 00:25:19'),
(50, 'delete_kecamatans', 'kecamatans', '2023-10-22 00:25:19', '2023-10-22 00:25:19'),
(51, 'browse_data_dbd_tahun', 'data_dbd_tahun', '2023-11-09 03:42:34', '2023-11-09 03:42:34'),
(52, 'read_data_dbd_tahun', 'data_dbd_tahun', '2023-11-09 03:42:34', '2023-11-09 03:42:34'),
(53, 'edit_data_dbd_tahun', 'data_dbd_tahun', '2023-11-09 03:42:34', '2023-11-09 03:42:34'),
(54, 'add_data_dbd_tahun', 'data_dbd_tahun', '2023-11-09 03:42:34', '2023-11-09 03:42:34'),
(55, 'delete_data_dbd_tahun', 'data_dbd_tahun', '2023-11-09 03:42:34', '2023-11-09 03:42:34'),
(61, 'browse_data_tahun', 'data_tahun', '2023-11-09 03:52:59', '2023-11-09 03:52:59'),
(62, 'read_data_tahun', 'data_tahun', '2023-11-09 03:52:59', '2023-11-09 03:52:59'),
(63, 'edit_data_tahun', 'data_tahun', '2023-11-09 03:52:59', '2023-11-09 03:52:59'),
(64, 'add_data_tahun', 'data_tahun', '2023-11-09 03:52:59', '2023-11-09 03:52:59'),
(65, 'delete_data_tahun', 'data_tahun', '2023-11-09 03:52:59', '2023-11-09 03:52:59'),
(66, 'browse_data_tahuns', 'data_tahuns', '2023-11-09 03:56:34', '2023-11-09 03:56:34'),
(67, 'read_data_tahuns', 'data_tahuns', '2023-11-09 03:56:34', '2023-11-09 03:56:34'),
(68, 'edit_data_tahuns', 'data_tahuns', '2023-11-09 03:56:34', '2023-11-09 03:56:34'),
(69, 'add_data_tahuns', 'data_tahuns', '2023-11-09 03:56:34', '2023-11-09 03:56:34'),
(70, 'delete_data_tahuns', 'data_tahuns', '2023-11-09 03:56:34', '2023-11-09 03:56:34');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
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
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int UNSIGNED NOT NULL,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-10-21 23:54:39', '2023-10-21 23:54:39');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2023-10-21 23:54:38', '2023-10-21 23:54:38');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2023-10-21 23:54:39', '2023-10-21 23:54:39'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2023-10-21 23:54:39', '2023-10-21 23:54:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$2AzFYrZsVlhBMIZ8dSJGkuH2kLeeqU0qsPQYpuCj7UEYIuNc0Ln9O', 'Gt5ozTs9LvLZdJYd9bgryS55xo30fqPLEI1gIIrQcJqfjEUUlymQq7MWcySu', NULL, '2023-10-21 23:54:39', '2023-10-21 23:54:39');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_tahuns`
--
ALTER TABLE `data_tahuns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `kecamatans`
--
ALTER TABLE `kecamatans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `data_tahuns`
--
ALTER TABLE `data_tahuns`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kecamatans`
--
ALTER TABLE `kecamatans`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
