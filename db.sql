-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 16 سبتمبر 2020 الساعة 18:37
-- إصدار الخادم: 10.3.15-MariaDB
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
-- Database: `caputcha`
--

-- --------------------------------------------------------

--
-- بنية الجدول `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `categories`
--

INSERT INTO `categories` (`id`, `created_at`, `updated_at`, `name`, `description`, `image`, `deleted_at`) VALUES
(11, '2020-08-11 11:34:56', '2020-08-11 11:34:56', 'فواكه', 'فواكه بأنواعها', 'fruit-og-d176ef00.jpg', NULL),
(13, '2020-08-11 11:39:37', '2020-08-11 11:39:37', 'خضروات', 'خضروات بأنواعها', 'cat.jpg', NULL),
(19, '2020-08-26 15:43:02', '2020-08-26 15:43:02', 'لحوم', 'لحوم و مجمدات', '1598467382.jpg', NULL),
(20, '2020-08-26 15:43:59', '2020-08-26 15:43:59', 'مجمدات', 'فواكه و خضار مجمدة', '1598467439.jpg', NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `contracts`
--

CREATE TABLE `contracts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `market_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_amount` double(8,2) NOT NULL,
  `current_amount` float NOT NULL DEFAULT 0,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'انتظار'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `contracts`
--

INSERT INTO `contracts` (`id`, `created_at`, `updated_at`, `user_id`, `market_id`, `max_amount`, `current_amount`, `status`) VALUES
(1, '2020-04-20 18:27:26', '2020-04-20 19:17:13', '5', '4', 1000.00, 0, 'فعال'),
(3, '2020-04-29 12:08:26', '2020-04-30 09:07:54', '5', '9', 500.00, 0, 'غير فعال');

-- --------------------------------------------------------

--
-- بنية الجدول `copons`
--

CREATE TABLE `copons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `status` int(11) DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `discount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expire_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `copons`
--

INSERT INTO `copons` (`id`, `code`, `category_id`, `status`, `user_id`, `discount`, `created_at`, `updated_at`, `expire_date`) VALUES
(1, '21e1e12e142wrtg54', 2, 1, NULL, 5.00, NULL, '2020-09-15 19:24:51', NULL),
(2, 'SeptUSGU', 5, 0, NULL, 7.00, '2020-08-26 15:00:15', '2020-08-26 15:00:15', NULL),
(3, 'MFowG0xP', 5, 0, NULL, 7.00, '2020-08-26 15:00:15', '2020-08-26 15:00:15', NULL),
(4, 'jL8QT9mb', 5, 1, 58, 7.00, '2020-08-26 15:00:15', '2020-09-15 16:22:33', '2020-09-01'),
(5, 'a7e9obtx', 5, 0, NULL, 7.00, '2020-08-26 15:00:15', '2020-08-26 15:00:15', NULL),
(6, 'bi8ibEWy', 5, 0, NULL, 7.00, '2020-08-26 15:00:15', '2020-08-26 15:00:15', NULL),
(7, 'BPlBC6R1', 5, 0, NULL, 7.00, '2020-08-26 15:00:15', '2020-08-26 15:00:15', NULL),
(8, 'XYdsgxXf', 5, 0, NULL, 7.00, '2020-08-26 15:00:15', '2020-08-26 15:00:15', NULL),
(9, 'dXFeHO6h', 5, 0, NULL, 7.00, '2020-08-26 15:00:15', '2020-08-26 15:00:15', NULL),
(10, 'RYOFoUuK', 5, 1, NULL, 7.00, '2020-08-26 15:00:15', '2020-09-15 19:26:08', NULL),
(11, '0Rq3Wyoc', 5, 1, NULL, 7.00, '2020-08-26 15:00:15', '2020-09-15 19:26:05', NULL),
(12, 'cw2Os83z', 6, 0, NULL, 10.00, '2020-08-26 15:01:36', '2020-08-26 15:01:36', NULL),
(13, 'JmSbudNZ', 6, 0, NULL, 10.00, '2020-08-26 15:01:36', '2020-08-26 15:01:36', NULL),
(14, '8kthiOcB', 6, 0, NULL, 10.00, '2020-08-26 15:01:36', '2020-08-26 15:01:36', NULL),
(15, 'QW4qtRXe', 6, 0, NULL, 10.00, '2020-08-26 15:01:36', '2020-08-26 15:01:36', NULL),
(16, 's7JS4elx', 6, 0, NULL, 10.00, '2020-08-26 15:01:36', '2020-08-26 15:01:36', NULL),
(17, 'c0UWH9HM', 6, 0, NULL, 10.00, '2020-08-26 15:01:36', '2020-08-26 15:01:36', NULL),
(18, 'VKwTdGvl', 6, 0, NULL, 10.00, '2020-08-26 15:01:36', '2020-08-26 15:01:36', NULL),
(19, '8YFPS5QC', 6, 0, NULL, 10.00, '2020-08-26 15:01:36', '2020-08-26 15:01:36', NULL),
(20, 'EZLFLITZ', 6, 1, NULL, 10.00, '2020-08-26 15:01:36', '2020-08-26 15:01:36', NULL),
(21, 'VUO8VxPr', 6, 0, NULL, 10.00, '2020-08-26 15:01:36', '2020-08-26 15:01:36', NULL),
(22, 'yzqJzsXG', 6, 0, NULL, 10.00, '2020-08-26 15:01:36', '2020-08-26 15:01:36', NULL),
(23, 'Hha3NpYw', 6, 0, NULL, 10.00, '2020-08-26 15:01:36', '2020-08-26 15:01:36', NULL),
(24, '4Lx3BBag', 6, 0, NULL, 10.00, '2020-08-26 15:01:36', '2020-08-26 15:01:36', NULL),
(25, 'wlMDE3Tv', 6, 0, NULL, 10.00, '2020-08-26 15:01:36', '2020-08-26 15:01:36', NULL),
(26, 'McHiMtQR', 6, 0, NULL, 10.00, '2020-08-26 15:01:36', '2020-08-26 15:01:36', NULL),
(27, 'KXZWsPt9', 6, 0, NULL, 10.00, '2020-08-26 15:01:36', '2020-08-26 15:01:36', NULL),
(28, 'Cl18UnUj', 6, 0, NULL, 10.00, '2020-08-26 15:01:36', '2020-08-26 15:01:36', NULL),
(29, 'B5Z5vt1Y', 6, 0, NULL, 10.00, '2020-08-26 15:01:36', '2020-08-26 15:01:36', NULL),
(30, 'pUf47mZD', 6, 0, NULL, 10.00, '2020-08-26 15:01:36', '2020-08-26 15:01:36', NULL),
(31, 'XCxVPg8d', 6, 1, NULL, 10.00, '2020-08-26 15:01:36', '2020-09-15 19:32:17', NULL),
(32, 'hf8o9Ycv', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(33, 'AXDejYcw', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(34, 'huTpyvo6', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(35, 'MrIDeCAg', 7, 1, 58, 15.00, '2020-08-28 15:05:18', '2020-09-15 16:35:22', '2020-09-01'),
(36, '9sBGu6vL', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(37, '9xRhfVkA', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(38, 'nwzcbNT9', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(39, '5yy21OpI', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(40, '021d0vog', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(41, 'ElEJqVFi', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(42, 'lJWsKZQP', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(43, 'HFwKiFrd', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(44, 'd5in75sv', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(45, 'iO3gT5as', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(46, '7KfITSs4', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(47, 'TRBiFowk', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(48, 'VUKmTFUs', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(49, 'VP8PfDwL', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(50, '5gfefR60', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(51, 'XYvkgUdq', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(52, '46uGdvGo', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(53, 'BwUFVm5w', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(54, 'LujY7Ef5', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(55, 'UftJuDSj', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(56, 'VC2wn7XD', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(57, 'hWjwn9fT', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(58, 'H4PdIuZs', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(59, 'Bvi9XJ3B', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(60, 'BRIAL2Nr', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(61, 'jiTwSEOW', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(62, 'aKRxiCFi', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(63, 'FUkGQpA4', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(64, 'c6Gh0A4i', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(65, 'm2uu2Lut', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(66, '4s9KZ3th', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(67, 'JG1L3Mrr', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(68, 'bhEkSoVJ', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(69, 'E9wFay0Y', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(70, 'W4apV6Ji', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(71, 'tbgPpTEC', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(72, 'J7xxlKPB', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(73, 'FInnJMvk', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(74, '4HwOW2Pb', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(75, 'kyrxXP1N', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(76, '7RdUByz2', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(77, 'bccOAWOQ', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(78, 'JfwxtC7t', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(79, 'xtADTGUa', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(80, 'yQZ0UueF', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(81, 'jaX5WQ8E', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(82, 'Q3SCSg2g', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(83, '9KWWtfRk', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(84, 'z72qdBD1', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(85, 'zha32mJI', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(86, 'oxMRyoLg', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(87, '5nCH7U5Z', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(88, 'arKI6pbK', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(89, 'uxFkELVr', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(90, 'eiPC6dWm', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(91, 'LMBXj3Iw', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(92, 'JryFiUnV', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(93, 'JknCP9tL', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(94, 'V8SNBGV1', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(95, 'bVH6atjt', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(96, 'mhRoswR1', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(97, '6rY4bbWJ', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(98, 'rv13OyQD', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(99, 'qC2OLFPY', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(100, 'zdrXEIzP', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(101, 'uZ2SiRAx', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(102, 'xIfWqeuV', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(103, '3upthOwU', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(104, 'ORKmcJXx', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(105, 'sdhfuyCW', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(106, 'jmuGreGf', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(107, 'QCyBCuf6', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(108, 'kSGzBtvf', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(109, 'twXWPRyO', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(110, 'UWSTyf77', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(111, '8j4B6eVS', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(112, 'AyNTGYzc', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(113, '4mGsQNpa', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(114, 'Z4gogNFQ', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(115, 'uWvhXwYQ', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(116, 'FvlPUbkU', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(117, 'cR5VwdIp', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(118, '8jw2B9yW', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(119, '69fN99nV', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(120, 'CkpTUe2I', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(121, 'KPOGST9K', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(122, '72FejNMs', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(123, '8BhXu7Px', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(124, '1KsI6djC', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(125, 'ixQ97cXz', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(126, 'an8Utfl9', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(127, 'v8Wv7f6R', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(128, 'mr666EjK', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(129, 'nu3xIcFF', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(130, 'fvYgNl9t', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL),
(131, 'DzOadASd', 7, 0, NULL, 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `copon_categories`
--

CREATE TABLE `copon_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `copons_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `copon_categories`
--

INSERT INTO `copon_categories` (`id`, `name`, `discount`, `created_at`, `updated_at`, `copons_count`) VALUES
(1, 'كوتة خصم 3%', 3.00, NULL, NULL, NULL),
(2, 'كوتة خصم 5%', 5.00, NULL, NULL, NULL),
(5, 'كوتة خصم كوبوات 7%', 7.00, '2020-08-26 15:00:15', '2020-08-26 15:00:15', 10),
(6, 'كوتة خصم 10%', 10.00, '2020-08-26 15:01:36', '2020-08-26 15:01:36', 20),
(7, 'كوتة خصم 15%', 15.00, '2020-08-28 15:05:18', '2020-08-28 15:05:18', 100);

-- --------------------------------------------------------

--
-- بنية الجدول `failed_jobs`
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
-- بنية الجدول `favorits`
--

CREATE TABLE `favorits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `market_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `markets`
--

CREATE TABLE `markets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_balance` double(8,2) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  `delivery_cost` float DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `review` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `markets`
--

INSERT INTO `markets` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `address`, `phone`, `total_balance`, `owner_id`, `image`, `state`, `delivery_cost`, `tax`, `review`) VALUES
(4, '2020-04-20 14:03:56', '2020-06-22 12:17:00', NULL, 'كيرفور مول', 'الرياض - حي السلام', '123123', 0.00, 4, 'market_logo/1588248188.jpg', 1, 7, NULL, 4.5),
(8, '2020-04-28 11:13:24', '2020-04-28 16:41:04', NULL, 'سوبر ماركت العكلوك', 'غزة - الكرامة', '234234', 0.00, 1, 'market_logo/1588083204.jpg', 0, 5, NULL, 4.9),
(9, '2020-04-28 11:14:28', '2020-08-08 15:44:02', NULL, 'سوبر ماركت الطيبات', 'Palestine', '+970594295261', 0.00, 6, 'market_logo/1588083268.jpg', 0, 10, NULL, 3.73),
(12, '2020-04-30 09:03:08', '2020-04-30 09:03:08', NULL, 'سوبر ماركت ابو دلال', 'النصيرات - شارع السوق', '+970594295261', 0.00, 4, 'market_logo/1588248188.jpg', 0, 0, NULL, 4),
(13, '2020-06-13 07:02:42', '2020-06-13 07:02:42', NULL, 'CareFor10', 'Gaza', '123123', 0.00, 1, 'market_logo/1588248188.jpg', 0, 0, NULL, 4.3),
(14, '2020-06-14 15:22:59', '2020-06-18 05:37:07', NULL, 'كيرفور معدل', 'Gaza', '123123', 0.00, 1, 'market_logo/1588248188.jpg', 0, NULL, NULL, 3.7);

-- --------------------------------------------------------

--
-- بنية الجدول `market_reviews`
--

CREATE TABLE `market_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `market_id` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `market_reviews`
--

INSERT INTO `market_reviews` (`id`, `market_id`, `rate`, `created_at`, `updated_at`, `review`, `user_id`) VALUES
(1, 9, 5, '2020-08-08 15:28:30', '2020-08-08 15:28:30', NULL, 0),
(2, 9, 4, '2020-08-08 15:28:42', '2020-08-08 15:28:42', NULL, 0),
(3, 9, 4, '2020-08-08 15:28:45', '2020-08-08 15:28:45', NULL, 0),
(4, 9, 5, '2020-08-08 15:28:55', '2020-08-08 15:28:55', NULL, 0),
(5, 9, 2, '2020-08-08 15:29:30', '2020-08-08 15:29:30', NULL, 0),
(6, 9, 2, '2020-08-08 15:29:34', '2020-08-08 15:29:34', NULL, 0),
(7, 9, 2, '2020-08-08 15:29:36', '2020-08-08 15:29:36', NULL, 0),
(8, 9, 2, '2020-08-08 15:35:19', '2020-08-08 15:35:19', NULL, 0),
(9, 9, 5, '2020-08-08 15:35:32', '2020-08-08 15:35:32', NULL, 0),
(10, 9, 5, '2020-08-08 15:42:41', '2020-08-08 15:42:41', 'test review', 0),
(11, 9, 5, '2020-08-08 15:44:02', '2020-08-08 15:44:02', 'test review', 5);

-- --------------------------------------------------------

--
-- بنية الجدول `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `messages`
--

INSERT INTO `messages` (`id`, `name`, `mobile`, `title`, `body`, `created_at`, `updated_at`) VALUES
(8, 'شريف نعيم', '000999', 'مشكلة في الاسعار', 'طلب طلبية و لكن الاسعار وصلتني مختلفة عن التطبيق', '2020-09-15 13:17:37', '2020-09-15 13:17:37'),
(9, 'محمد محمود عي', '000999', 'هناك تأخير في التوصيل', 'تأخر الطلب 3 ساعات بعد موعده', '2020-09-15 13:34:03', '2020-09-15 13:34:03');

-- --------------------------------------------------------

--
-- بنية الجدول `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_04_19_173219_create_markets_table', 1),
(4, '2020_04_19_173238_create_products_table', 1),
(5, '2020_04_19_173254_create_categories_table', 1),
(6, '2020_04_19_173337_create_orders_table', 1),
(7, '2020_04_19_173403_create_order_details_table', 1),
(8, '2020_04_19_173420_create_payments_table', 1),
(9, '2014_10_12_100000_create_password_resets_table', 2),
(10, '2020_04_20_212229_create_contracts_table', 2),
(11, '2020_05_03_113514_create_favorits_table', 3),
(12, '2020_05_23_133549_create_welcomes_table', 4),
(13, '2016_06_01_000001_create_oauth_auth_codes_table', 5),
(14, '2016_06_01_000002_create_oauth_access_tokens_table', 5),
(15, '2016_06_01_000003_create_oauth_refresh_tokens_table', 5),
(16, '2016_06_01_000004_create_oauth_clients_table', 5),
(17, '2016_06_01_000005_create_oauth_personal_access_clients_table', 5);

-- --------------------------------------------------------

--
-- بنية الجدول `notifications`
--

CREATE TABLE `notifications` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `notifications`
--

INSERT INTO `notifications` (`id`, `created_at`, `updated_at`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`) VALUES
('d4a2272f-74dd-4554-85ea-5bd1c8bbde9a', '2020-07-22 07:44:57', '2020-07-22 07:44:57', 'App\\Notifications\\InvoicePaid', 'App\\User', 5, '{\"amount\":1000,\"Invoice_action\":\"paid done...\"}', NULL),
('df2198eb-4307-4914-a2ac-338034eafaa6', '2020-07-22 07:49:47', '2020-07-22 07:49:47', 'App\\Notifications\\InvoicePaid', 'App\\User', 5, '{\"amount\":1000,\"Invoice_action\":\"paid done...\"}', NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('004834f2cc9a6773d0ed296b305c023773242f9d236d05bcb49214aeccfaa898085c9cb2f1e5bda6', 28, 1, 'authToken', '[]', 0, '2020-07-27 16:19:55', '2020-07-27 16:19:55', '2021-07-27 19:19:55'),
('00e54818c7076ee7473f72789af3723262c61969f581299254ed13a26561a7d0139b0ecf7eb0fe8b', 58, 1, 'authToken', '[]', 0, '2020-09-13 22:15:47', '2020-09-13 22:15:47', '2021-09-14 01:15:47'),
('01363240d0e59d62b9ffed648e5bce0b8b9ecd2c23781c44f610746de34b86eb69c7653aa4594442', 58, 1, 'authToken', '[]', 0, '2020-09-13 20:35:32', '2020-09-13 20:35:32', '2021-09-13 23:35:32'),
('0168c82c1c93c028931fb3b36ec421662fd35582b221044ed6d1d54f2b69d38e9fe14c38808d058b', 58, 1, 'authToken', '[]', 0, '2020-09-13 15:10:02', '2020-09-13 15:10:02', '2021-09-13 18:10:02'),
('016d56edc321bfc9babf1a989856d80bdcdc8d25a15383a24412877bc8344b9312fdc0efa267d0a1', 28, 1, 'authToken', '[]', 0, '2020-07-22 09:50:29', '2020-07-22 09:50:29', '2021-07-22 12:50:29'),
('02862a7164eb3eaa5d3e1028c291849d33c291fcae5998062ba198c38fd6aa913d09c73727f18359', 28, 1, 'authToken', '[]', 0, '2020-07-26 18:28:13', '2020-07-26 18:28:13', '2021-07-26 21:28:13'),
('02af707cfb9915e6cde285efbd0a401aef8af1760ab2b9d592c75bb99c1d0f43736e8005eb624bba', 58, 1, 'authToken', '[]', 0, '2020-09-14 18:08:27', '2020-09-14 18:08:27', '2021-09-14 21:08:27'),
('02b0faddc2df280d9a8d1f4225345cfcf179e560d17028711a8a1b55a797a79468ee0908a38b9caf', 28, 1, 'authToken', '[]', 0, '2020-07-26 19:50:35', '2020-07-26 19:50:35', '2021-07-26 22:50:35'),
('0316edd06427c74b3fa92ffdb2ab11ca686d31e8d00035ea8e5f16148a02dc102d681246ce7c9554', 28, 1, 'authToken', '[]', 0, '2020-07-25 10:48:15', '2020-07-25 10:48:15', '2021-07-25 13:48:15'),
('036970b019cec0af84ccab1999ae1c9f39e453235db2a420b690e9c27da6e27ff8d61fbdcda63320', 28, 1, 'authToken', '[]', 0, '2020-07-27 15:58:41', '2020-07-27 15:58:41', '2021-07-27 18:58:41'),
('03c2ff07c320051bb123b20b3f764ed3806615e29e49203967c297b7578749d0e0d1e8c8d8da801f', 58, 1, 'authToken', '[]', 0, '2020-09-10 07:02:28', '2020-09-10 07:02:28', '2021-09-10 10:02:28'),
('04d9a9c53138fcc8119599d0c1217ad5239b8bea284c1545c8abdfca7de5fb1bc0b936fe06d06602', 28, 1, 'authToken', '[]', 0, '2020-07-25 08:48:15', '2020-07-25 08:48:15', '2021-07-25 11:48:15'),
('05258ea3a02d2a81a38b48acb8f8ce4402c7753729aef9fe581a8df25f293680712986ec3c13b971', 28, 1, 'authToken', '[]', 0, '2020-08-02 15:09:07', '2020-08-02 15:09:07', '2021-08-02 18:09:07'),
('059a995f88651b4dc619c1866be96264c516dba2db869c9a9adb06fad1af0ed9cf89c2f288b91734', 28, 1, 'authToken', '[]', 0, '2020-08-08 14:30:50', '2020-08-08 14:30:50', '2021-08-08 17:30:50'),
('05dba4d0fbef43120519b2fbea0a8a74b0651272634ac2997a7d0c89ac368f99f590b191c5663f83', 58, 1, 'authToken', '[]', 0, '2020-09-05 15:24:57', '2020-09-05 15:24:57', '2021-09-05 18:24:57'),
('072c972786ed08af918935390a4933333a35d8b2bc54b2ba1fdd87d8f8408e436fcd1d6bc48ec8e8', 58, 1, 'authToken', '[]', 0, '2020-09-09 17:39:37', '2020-09-09 17:39:37', '2021-09-09 20:39:37'),
('0787cde0aa1379d1ce75d8d26d858750da9860343cd82664aab61ca7e71b8a4b71e65e1a0d13667a', 28, 1, 'authToken', '[]', 0, '2020-07-26 23:05:11', '2020-07-26 23:05:11', '2021-07-27 02:05:11'),
('079827d54f0b7ab652bc60bf31f3687a12e888c6fcaad5daeef7781ba6102c6a9aa0d111841c20d4', 58, 1, 'authToken', '[]', 0, '2020-08-29 13:30:41', '2020-08-29 13:30:41', '2021-08-29 16:30:41'),
('07c4a7f5cf283eab9ee9a2f653fa1e826325803f61e3a816f08b2276fafcb0f590d9d3d9d9af6c57', 1, 1, 'authToken', '[]', 0, '2020-06-10 03:07:59', '2020-06-10 03:07:59', '2021-06-10 06:07:59'),
('0803abb4432536385de233b732f970e552869e0eb5287197d99cabacdb84c9e39cb5be8fbd5c30aa', 58, 1, 'authToken', '[]', 0, '2020-08-26 14:59:14', '2020-08-26 14:59:14', '2021-08-26 17:59:14'),
('081ef26e0da4040406500424ae168bde07231e4716232609941efd3970260618e853893d2631802f', 28, 1, 'authToken', '[]', 0, '2020-07-28 16:02:20', '2020-07-28 16:02:20', '2021-07-28 19:02:20'),
('0820d1ea0023ab1fe10c167277d8208a0e37a73b083c76e74d907cc207eb22728cc94c116f73c84d', 28, 1, 'authToken', '[]', 0, '2020-07-28 16:02:41', '2020-07-28 16:02:41', '2021-07-28 19:02:41'),
('08551c32ef58eb47027341cf7ca2de3d4f2c2486a783f79e07d47ddfb369f428a8d8655afd469f67', 28, 1, 'authToken', '[]', 0, '2020-08-02 10:57:20', '2020-08-02 10:57:20', '2021-08-02 13:57:20'),
('08c23d23b47b28b541c7f3ccc8e2b9d6a77eb83c7548c1bc76deb7968da388b07ada9994f8b647b3', 58, 1, 'authToken', '[]', 0, '2020-08-29 15:20:52', '2020-08-29 15:20:52', '2021-08-29 18:20:52'),
('08cb0f972bebae637ffc84834e1de9313c5ed6052f0b489b5a148e45e849bcadc7e00ca33790b000', 58, 1, 'authToken', '[]', 0, '2020-09-05 15:20:35', '2020-09-05 15:20:35', '2021-09-05 18:20:35'),
('08fd493ee88a74ba889bfd19a8b0cfc23057899753ae8027178e17d80d1b3b87d67dc249ec837170', 58, 1, 'authToken', '[]', 0, '2020-09-13 15:39:36', '2020-09-13 15:39:36', '2021-09-13 18:39:36'),
('09269e03fdc5493c12d0c3a1ef2c442b5525a65265fb2f38482daab113916855e141bd252087a1b1', 58, 1, 'authToken', '[]', 0, '2020-08-31 07:27:00', '2020-08-31 07:27:00', '2021-08-31 10:27:00'),
('0985979b78dade36e4f61d60035d8fee41e9012bb89974dee475da01f93a81b77c77fafe3e75d18e', 1, 1, 'authToken', '[]', 0, '2020-06-10 02:20:37', '2020-06-10 02:20:37', '2021-06-10 05:20:37'),
('09afdde2970da53853eacbf5e18eef4587aab4b4ca8184ccfc7ebdb50a1962c0cb8cd26559820cb5', 58, 1, 'authToken', '[]', 0, '2020-09-05 08:13:07', '2020-09-05 08:13:07', '2021-09-05 11:13:07'),
('0a56bdb5c0bbd789339f1d751aa8ecf7ace9fedd71781976d28eae6cf07877fb3238fd6a5b8e0ae0', 56, 1, 'authToken', '[]', 0, '2020-08-19 11:34:31', '2020-08-19 11:34:31', '2021-08-19 14:34:31'),
('0a658ea3bfc5a2586e2e20569a767a2d9d2b60d04a925db6ef9c1a7c2ffc8382c6dde6e6fbebb646', 58, 1, 'authToken', '[]', 0, '2020-09-12 05:16:33', '2020-09-12 05:16:33', '2021-09-12 08:16:33'),
('0b66a94df620bc762d1b9fe016b6558a0b6da08ad29348f08e4ab2ad8199d71e826e510b692bc9d5', 58, 1, 'authToken', '[]', 0, '2020-09-05 15:17:53', '2020-09-05 15:17:53', '2021-09-05 18:17:53'),
('0b79d51c5492cddaf65c8337b079ab5e80f71b8760d7b266c89af5e88fc672ffdf2414227cc77ba7', 28, 1, 'authToken', '[]', 0, '2020-07-13 17:30:21', '2020-07-13 17:30:21', '2021-07-13 20:30:21'),
('0b8fbdbf70b5fd7834ef8bcbce5b456a18de3ca48f19f7c826eb9662ff368ec8dc66dadeb15a37a6', 58, 1, 'authToken', '[]', 0, '2020-09-11 20:35:32', '2020-09-11 20:35:32', '2021-09-11 23:35:32'),
('0c652ccc913e46e6953cc2f36f52ad3f4cb569a5fed0de15d7b610be7129f66bcd1d616855ec7771', 28, 1, 'authToken', '[]', 0, '2020-07-25 15:06:53', '2020-07-25 15:06:53', '2021-07-25 18:06:53'),
('0cdb69df281c6c43e85e32ce05f1bfe4983bae1040310754649ea571de2b3f54ca00db78787d7a0c', 28, 1, 'authToken', '[]', 0, '2020-07-26 19:50:18', '2020-07-26 19:50:18', '2021-07-26 22:50:18'),
('0cdf53cdb9cf3ef3182b2a3e71c9a62716f7f82663876c6ed404b33a25b311130ea90fb10ed8e7c8', 58, 1, 'authToken', '[]', 0, '2020-09-01 12:49:55', '2020-09-01 12:49:55', '2021-09-01 15:49:55'),
('0e4f58bc4fe0333e15d45b036e16ffb13fe48c7a7d2724ce28e7c3141a8055d92317280278ef8c86', 1, 1, 'authToken', '[]', 0, '2020-06-09 05:13:20', '2020-06-09 05:13:20', '2021-06-09 08:13:20'),
('0e65e4ba0f2931d9aad82e599163ee4918ae61828b5b8af23f0bcc3af555d631b3b8688f29ba4606', 58, 1, 'authToken', '[]', 0, '2020-09-01 03:25:16', '2020-09-01 03:25:16', '2021-09-01 06:25:16'),
('0f3f3eae8cea5f22268b5a264952909ba7975596a70884111a6a09fb286a6a2e065c4f258890eda9', 58, 1, 'authToken', '[]', 0, '2020-08-28 13:13:00', '2020-08-28 13:13:00', '2021-08-28 16:13:00'),
('10814fa9521e73d67c30754f82d753274f08445c64955aa6ead5104cc5c02397a3ec45f4315b99eb', 58, 1, 'authToken', '[]', 0, '2020-09-03 11:35:45', '2020-09-03 11:35:45', '2021-09-03 14:35:45'),
('10b1d802dc543c99df2ee011ff4e4caa794c7e9ac6a2bae47159c541591ea56514d0c51d14ba6a8f', 28, 1, 'authToken', '[]', 0, '2020-07-28 19:34:51', '2020-07-28 19:34:51', '2021-07-28 22:34:51'),
('1125988c6a16c4106936281d7d82aef062b54bede8755e7e9f94038e08f854730480e40e0fbdb4c4', 58, 1, 'authToken', '[]', 0, '2020-09-05 16:29:01', '2020-09-05 16:29:01', '2021-09-05 19:29:01'),
('1240871050477c62d7de3d2466c5e04fe4a773a73a6c4a4359e24f5c30810a2374aacf2fc0ec159a', 58, 1, 'authToken', '[]', 0, '2020-09-14 00:06:54', '2020-09-14 00:06:54', '2021-09-14 03:06:54'),
('12e4b2e785ebd2bd7789ed730f92ca67e0cbb2008a1d6e24b153c761fb20418843bea9f49b22ac76', 5, 1, 'authToken', '[]', 0, '2020-06-14 13:53:45', '2020-06-14 13:53:45', '2021-06-14 16:53:45'),
('14af3a64825953d8d956f46da61ef78c1cc797f6deb29c1318869cb4c0ca0ac8cb92b01258638848', 28, 1, 'authToken', '[]', 0, '2020-07-26 19:54:08', '2020-07-26 19:54:08', '2021-07-26 22:54:08'),
('150fb616dfcbc0f476dab5fbeedd9d620174bba35cebd79e45a6933f104cb2ebbfa0d1834083ca33', 58, 1, 'authToken', '[]', 0, '2020-09-11 19:31:25', '2020-09-11 19:31:25', '2021-09-11 22:31:25'),
('15170de5d09b01c8d487522785144dac68bcaad2544b6ca9b24dc570644bf5cae367c62a3633bc0b', 58, 1, 'authToken', '[]', 0, '2020-08-29 13:49:25', '2020-08-29 13:49:25', '2021-08-29 16:49:25'),
('162ca773ce1054ef38252e2028f7f4a203d969a96fcc3acb92f041f7bf24c5eb029ee05dc0e2da10', 58, 1, 'authToken', '[]', 0, '2020-09-01 07:43:19', '2020-09-01 07:43:19', '2021-09-01 10:43:19'),
('16f3c25152717e55d1d82acb20abcea5108db71d47d1906dd2a1b58a6c4aba876a60c1b908455b47', 58, 1, 'authToken', '[]', 0, '2020-09-13 19:34:25', '2020-09-13 19:34:25', '2021-09-13 22:34:25'),
('1715e938a5b1e1642371a9c121aca516a11b496ee4784ffed54b81c9fa2979aa533a789b75790378', 58, 1, 'authToken', '[]', 0, '2020-09-01 09:57:20', '2020-09-01 09:57:20', '2021-09-01 12:57:20'),
('171f5d865b9842174ea666243ac9fd3de72b51aa0fea4b8e8715423ec85f55f4b7b406706db2dc45', 28, 1, 'authToken', '[]', 0, '2020-07-22 09:22:56', '2020-07-22 09:22:56', '2021-07-22 12:22:56'),
('17870cbcdd30ab3272f02c2f1f888960bb700cf5800877ae49cae56e9f222ffdb21ad973556107b8', 68, 1, 'authToken', '[]', 0, '2020-09-15 14:56:23', '2020-09-15 14:56:23', '2021-09-15 17:56:23'),
('1803bb4d2547ef672e640b95a9109aead72c1fb1db914b7246c463ec4afe3e7557c0e8a3e98ac1e2', 28, 1, 'authToken', '[]', 0, '2020-07-26 22:38:58', '2020-07-26 22:38:58', '2021-07-27 01:38:58'),
('182642d9c30bd77a9bae8a3604cd9b8c0fa4918c675fd6d477561ee1b10494f74727e63a14597113', 58, 1, 'authToken', '[]', 0, '2020-09-01 06:49:14', '2020-09-01 06:49:14', '2021-09-01 09:49:14'),
('18a28b57584eeb54581f03b783c96ed32cc2e005582fc37fa3b6a5cde60614caa3c4c724b9a4384a', 28, 1, 'authToken', '[]', 0, '2020-07-28 19:35:16', '2020-07-28 19:35:16', '2021-07-28 22:35:16'),
('19b5cfec526df3242843c1959b7adc4185200943b1ed3feedf5a778177452505bc9cecce2c918b86', 28, 1, 'authToken', '[]', 0, '2020-07-26 19:53:52', '2020-07-26 19:53:52', '2021-07-26 22:53:52'),
('1b2acef285532246c3378c6ba84174110493f13f2079755a6dc90cb782c746e2f28259ab5e2e9a46', 28, 1, 'authToken', '[]', 0, '2020-07-28 16:02:09', '2020-07-28 16:02:09', '2021-07-28 19:02:09'),
('1b40c4933c76bd47399e84ff5019b7bb7a470aac152852e359ba7d841e150591c3d31755e8190bd7', 58, 1, 'authToken', '[]', 0, '2020-08-31 08:17:48', '2020-08-31 08:17:48', '2021-08-31 11:17:48'),
('1bbd9ee7ca3fc0c0df88ee87eddac4d90354fdb639c1b6c37746899875d23c8d3764db3cb312face', 58, 1, 'authToken', '[]', 0, '2020-08-31 07:35:54', '2020-08-31 07:35:54', '2021-08-31 10:35:54'),
('1be3ab2eab56a6d752f01a24c02558562b485916d07d065e913e2a664b0ea9bfaeed8d75365dd31d', 28, 1, 'authToken', '[]', 0, '2020-08-08 06:23:18', '2020-08-08 06:23:18', '2021-08-08 09:23:18'),
('1c39b4b5c61b2348622f4a4d17539a4920cc5fd5b5434c41eac6e8814274b4375dbbeab2ecad332c', 67, 1, 'authToken', '[]', 0, '2020-09-14 15:50:31', '2020-09-14 15:50:31', '2021-09-14 18:50:31'),
('1cfef9351fb25f3f6ceb0e66aa993e726b196b22017c9a24824dc1a0639f9b7432ab867dee7a1e74', 58, 1, 'authToken', '[]', 0, '2020-09-11 17:31:48', '2020-09-11 17:31:48', '2021-09-11 20:31:48'),
('1d0d022fa2c222a37ae0b9786381e7b30d51a34ec77e7cff8f35d83ef4b2058e4cdf92834344f6ef', 58, 1, 'authToken', '[]', 0, '2020-09-10 08:51:05', '2020-09-10 08:51:05', '2021-09-10 11:51:05'),
('1d24b2f2d88d391a3a24f6b91941f6ee5d3f733b6333fab46397fb45148c58a3c2ecd35883fbed54', 28, 1, 'authToken', '[]', 0, '2020-07-24 06:03:04', '2020-07-24 06:03:04', '2021-07-24 09:03:04'),
('1d27b065093805668e8c77784ea1fc4d5ed167d72aaddcaaf7336b391a12eb49c13a21d4297a08ad', 58, 1, 'authToken', '[]', 0, '2020-09-13 21:56:35', '2020-09-13 21:56:35', '2021-09-14 00:56:35'),
('1d83a213265c1ee6a9c974e72dbc47201891268f96d355371f344f6bb042d17580982f641c0f2bdb', 58, 1, 'authToken', '[]', 0, '2020-08-27 17:00:10', '2020-08-27 17:00:10', '2021-08-27 20:00:10'),
('1d877e7098ef05ab7e46c661bc453511126cca2f306c8e34661615a3d5d72ac08247ff36a46774aa', 22, 1, 'authToken', '[]', 0, '2020-07-21 13:11:10', '2020-07-21 13:11:10', '2021-07-21 16:11:10'),
('1e266a684845da87eb7a9a76e13100db5118fe7762d303d24e446c11361c9bac3fddada48ff1e51e', 67, 1, 'authToken', '[]', 0, '2020-09-13 13:59:48', '2020-09-13 13:59:48', '2021-09-13 16:59:48'),
('1e5ea45c435de32b590abe9455648ef4451388e40671c327a52cf751bef46db1887bc9f40e26a13d', 28, 1, 'authToken', '[]', 0, '2020-07-26 22:40:01', '2020-07-26 22:40:01', '2021-07-27 01:40:01'),
('1ee830a9fa4e849857d2d85330df714288941b0ed89e9295dcca1291e869f512c39ec2d52ff41f2b', 28, 1, 'authToken', '[]', 0, '2020-07-23 08:39:32', '2020-07-23 08:39:32', '2021-07-23 11:39:32'),
('1f6f3f7b51a01045d78c8b90a30dd919aea06650208b0a5348264ee892eb291c0808c244a43c89e0', 28, 1, 'authToken', '[]', 0, '2020-07-25 09:07:17', '2020-07-25 09:07:17', '2021-07-25 12:07:17'),
('1fd79b2fbe8028ad97e0ffdc6399c2c4d08fa856b61788d576684589d60f99c24969ec27fcca9c8f', 28, 1, 'authToken', '[]', 0, '2020-07-22 09:57:15', '2020-07-22 09:57:15', '2021-07-22 12:57:15'),
('2030272d9b6c6e0ae414c350a43a04df637e6a68b821f77e75cb2d3c53ad8bdc2cfb4bd257e4d5b7', 5, 1, 'authToken', '[]', 0, '2020-06-23 04:58:08', '2020-06-23 04:58:08', '2021-06-23 07:58:08'),
('2038f09b4dc686072f19ab7db051fb81dfa5d2b7c7215734a1bc397c1a0f6d365324023255138f82', 28, 1, 'authToken', '[]', 0, '2020-07-23 08:40:49', '2020-07-23 08:40:49', '2021-07-23 11:40:49'),
('209e4936f534eb276d64f629125eb020e614269294f1f30c713365598e4cf87adede2dfec98cfea5', 28, 1, 'authToken', '[]', 0, '2020-07-26 22:43:37', '2020-07-26 22:43:37', '2021-07-27 01:43:37'),
('20b3bc66d447c2781a4e9d886cfd3339d5e493f2a4c880d5515bb437e9c4299615b00f4330d66422', 58, 1, 'authToken', '[]', 0, '2020-09-11 14:04:32', '2020-09-11 14:04:32', '2021-09-11 17:04:32'),
('21e68cf2e364fedf1673a8cd3ab2d1d76b493999fcea55cbe50ebd183a2cd29e6e88beab64c047d6', 5, 1, 'authToken', '[]', 0, '2020-06-14 03:04:34', '2020-06-14 03:04:34', '2021-06-14 06:04:34'),
('2248aeb3ea4ae26b74b3a2d6d8efead051e59bc87469c3026ccf14332feb943439a83bab35c7b0df', 28, 1, 'authToken', '[]', 0, '2020-07-25 09:41:45', '2020-07-25 09:41:45', '2021-07-25 12:41:45'),
('225b0f008b8e980ad9d3795dfb146e90f3e8ccf25ae599612f2126402a681655a6ee5a40a8721ad2', 58, 1, 'authToken', '[]', 0, '2020-09-10 08:44:46', '2020-09-10 08:44:46', '2021-09-10 11:44:46'),
('23442455ab9a12d343426a6de677ed08aef1922f189cf86cfcf6f96e5d373213883cd34bd4b33916', 58, 1, 'authToken', '[]', 0, '2020-08-30 05:47:38', '2020-08-30 05:47:38', '2021-08-30 08:47:38'),
('23f53ae5213336a0953729e658831efeac3ce82c22c1c4212d691b8b6bd9acf73f80084047b7be40', 58, 1, 'authToken', '[]', 0, '2020-09-13 19:32:11', '2020-09-13 19:32:11', '2021-09-13 22:32:11'),
('24fb1a09313410af6598477a3813fb251c3948bfe7fae633df594605e0fc3a3d8d561d39e9f76d29', 58, 1, 'authToken', '[]', 0, '2020-08-27 11:34:20', '2020-08-27 11:34:20', '2021-08-27 14:34:20'),
('25042b5d3408c21bee8e9fc4f8aca4101da61a695f55ab25c9120d3474b35b17cc1c06508f17e8b5', 58, 1, 'authToken', '[]', 0, '2020-09-13 23:36:45', '2020-09-13 23:36:45', '2021-09-14 02:36:45'),
('25173ace928e08ce55d6e687bf020b6c5e2585df4f6208cb0f95b7119f5b2c0bdc644a0bbbd1d275', 5, 1, 'authToken', '[]', 0, '2020-06-10 05:58:47', '2020-06-10 05:58:47', '2021-06-10 08:58:47'),
('2541a49a317663e08d67cebe9c7092a1c0bcd901cee3d977cb471186ec72d5a0268fdec941e5acd5', 28, 1, 'authToken', '[]', 0, '2020-08-07 19:31:14', '2020-08-07 19:31:14', '2021-08-07 22:31:14'),
('2620851e0c846ac4ffcb40648e60c08baadf522547c64e1dd447d70901a83ec9b36a6fb8fdacc67e', 58, 1, 'authToken', '[]', 0, '2020-08-28 05:47:42', '2020-08-28 05:47:42', '2021-08-28 08:47:42'),
('2642c1fcc97561569df9911c14ac7dff129db4162574037314ef9cf4fc85d3be098eee451645eee5', 28, 1, 'authToken', '[]', 0, '2020-07-25 11:21:45', '2020-07-25 11:21:45', '2021-07-25 14:21:45'),
('266cd6b7faebf1baa8ec18d411757d133e2ae3d280be47872aad53632d062d292e9f85b1369d641c', 28, 1, 'authToken', '[]', 0, '2020-07-26 23:01:59', '2020-07-26 23:01:59', '2021-07-27 02:01:59'),
('27c41fc2556c18bd9e9e5cb661579b185e25393c8b076a9a763de32aca06e1f2abb3190e51a0bb64', 58, 1, 'authToken', '[]', 0, '2020-09-05 14:35:23', '2020-09-05 14:35:23', '2021-09-05 17:35:23'),
('27f686a40b3e6e0ab23c70bcf246de6098504e34115eda3f23fd311b0eb674dc2435b80fa45bc6c4', 58, 1, 'authToken', '[]', 0, '2020-08-26 16:02:42', '2020-08-26 16:02:42', '2021-08-26 19:02:42'),
('28d19b296e642bb2466e1d214b993ece504b34bf436c7ae229a9abd4fe35b1a74076b4d2efc39fe9', 58, 1, 'authToken', '[]', 0, '2020-09-12 09:43:14', '2020-09-12 09:43:14', '2021-09-12 12:43:14'),
('295d6ecf0eee332444fa9b7b90f811c1f776a0c09f6f95ece4d2045e65f397bd05fd97749a50e788', 58, 1, 'authToken', '[]', 0, '2020-09-14 15:59:06', '2020-09-14 15:59:06', '2021-09-14 18:59:06'),
('2973adf34dd608c68425261373b06347ccde42fe7004ac3a6784e4b810994410b386416599fd3bf8', 58, 1, 'authToken', '[]', 0, '2020-08-31 07:29:07', '2020-08-31 07:29:07', '2021-08-31 10:29:07'),
('29a0deafae64380556c42c8dcadb8cc031b94956e9618ba76cb32888df3d3972af4a1d8faa41b67b', 58, 1, 'authToken', '[]', 0, '2020-09-11 17:48:04', '2020-09-11 17:48:04', '2021-09-11 20:48:04'),
('2a10b656804f029954a1bc185e4f47e2b0d18e90f79e24f12875c19d922a561f12104ea398a9fa30', 58, 1, 'authToken', '[]', 0, '2020-09-13 15:07:02', '2020-09-13 15:07:02', '2021-09-13 18:07:02'),
('2a734aa967f711693c1928cd98b19cc23a8e55006832c5ee9e8b7256eb4c55b9b7beabeb5539acaa', 28, 1, 'authToken', '[]', 0, '2020-07-26 22:56:05', '2020-07-26 22:56:05', '2021-07-27 01:56:05'),
('2b13bf32902b107d57a3d4132b56913f56038b0e53d58f59490995ef8c04aeb9f6b6da40474d2505', 58, 1, 'authToken', '[]', 0, '2020-09-15 17:12:20', '2020-09-15 17:12:20', '2021-09-15 20:12:20'),
('2bf731e1cec23cf62ad001af915dc656e856598d7048e0e5dfe32bae9b415fdf447556f1c5ec67b7', 58, 1, 'authToken', '[]', 0, '2020-09-01 11:14:00', '2020-09-01 11:14:00', '2021-09-01 14:14:00'),
('2d2d271417b91584697434fe422035463d438059dc078b46cd491e3bd877efa1b24a7855aa2b3ae5', 58, 1, 'authToken', '[]', 0, '2020-09-04 07:16:05', '2020-09-04 07:16:05', '2021-09-04 10:16:05'),
('2d8ae18913713d7714471cc8529f02a725458843866d6b889dfa613c3a88da6018af0f3b8b9c46cc', 22, 1, 'authToken', '[]', 0, '2020-08-04 14:15:12', '2020-08-04 14:15:12', '2021-08-04 17:15:12'),
('2e5c31630f3e22b1e1c2d5ccb789ef6c4399f7a6cd6d17c73a4d49d612d3882fe3d89efaa433d276', 58, 1, 'authToken', '[]', 0, '2020-09-02 05:11:50', '2020-09-02 05:11:50', '2021-09-02 08:11:50'),
('2f0a8dafc4de38431746f69f72a5128621edb0104806058aa10e9b86c7dfccea6bead2f64d193a16', 58, 1, 'authToken', '[]', 0, '2020-08-26 15:44:32', '2020-08-26 15:44:32', '2021-08-26 18:44:32'),
('30013b5444a8b6d7945adabe36868fbc9cc800fdf0fd093348f5336ff880a7f90761508804a6336b', 67, 1, 'authToken', '[]', 0, '2020-09-09 08:43:38', '2020-09-09 08:43:38', '2021-09-09 11:43:38'),
('308811364bfd8545597a35205bcf82ec7ee07c2fad4bd0916fccbb4f18ac397cadd086067d0a9588', 28, 1, 'authToken', '[]', 0, '2020-07-28 16:04:35', '2020-07-28 16:04:35', '2021-07-28 19:04:35'),
('31a99049c5d1188ddf1473df4cea36cfa3658f9c287c18881a7400c4c68861c75245c4325e7e8771', 58, 1, 'authToken', '[]', 0, '2020-09-12 18:18:11', '2020-09-12 18:18:11', '2021-09-12 21:18:11'),
('324cb1c5ca79e81eb10d7e1d4d5cbbe22c3ff1f9e00487dc7ed5c72087072109d90dec4903130e5b', 22, 1, 'authToken', '[]', 0, '2020-06-23 13:52:31', '2020-06-23 13:52:31', '2021-06-23 16:52:31'),
('32ab9baa83a28dd324b108173452a1665f47c0b8af0a7a41b15194784969319cfc8cd269de3defbe', 58, 1, 'authToken', '[]', 0, '2020-09-11 19:29:35', '2020-09-11 19:29:35', '2021-09-11 22:29:35'),
('32f8790d17bff0bfcf20bf2f28f8ce4b3fed089d812a236c3219c8616b4e6c8c5e352d8f05a9ca34', 58, 1, 'authToken', '[]', 0, '2020-08-28 13:00:05', '2020-08-28 13:00:05', '2021-08-28 16:00:05'),
('3310323018fc572682b3257ac97377f9d24b76a99ca1e08d72f0b8b56f84867f1c7c7fbffb000324', 58, 1, 'authToken', '[]', 0, '2020-09-15 15:04:45', '2020-09-15 15:04:45', '2021-09-15 18:04:45'),
('33522314e2e31f12bdfc2c325951e7c54256953fc760525da265ff78368088f607f0d0c871a363a1', 28, 1, 'authToken', '[]', 0, '2020-07-22 11:20:17', '2020-07-22 11:20:17', '2021-07-22 14:20:17'),
('3385d5fd52afd621c19dd11ede2da34fd1ced311a2ac873c42f86c58449a55d8fbc5ed3e74fe9ece', 58, 1, 'authToken', '[]', 0, '2020-08-20 07:23:55', '2020-08-20 07:23:55', '2021-08-20 10:23:55'),
('34434b533269f81ae082b90377e84cf8fff4c6203476a332e31c7fee35f7e210f36dee9b5732281b', 58, 1, 'authToken', '[]', 0, '2020-08-26 16:03:22', '2020-08-26 16:03:22', '2021-08-26 19:03:22'),
('344c27c2ae3732a6d70acfef32975f094469873cdff987e5b94129827d0ffe8d2d567b30b89c660a', 58, 1, 'authToken', '[]', 0, '2020-09-05 08:53:57', '2020-09-05 08:53:57', '2021-09-05 11:53:57'),
('346fe5b24b7b211e6518402c4d8ffce14b20f7082c32f4a2a0fca81c42d2fc095b0217c96bc2a531', 58, 1, 'authToken', '[]', 0, '2020-08-31 08:18:20', '2020-08-31 08:18:20', '2021-08-31 11:18:20'),
('34f7a0156cd465f6648c72cdc8e64b8f9ddd5c9a70f8152cf9ad554098b0beaac3d587c0d73ddabd', 58, 1, 'authToken', '[]', 0, '2020-09-13 21:53:56', '2020-09-13 21:53:56', '2021-09-14 00:53:56'),
('36596af866d8409e2bb373bf9c58a842c7b27989823b6c970c579fd3db7a60357b6242cfe9fd4a6b', 67, 1, 'authToken', '[]', 0, '2020-09-13 11:39:12', '2020-09-13 11:39:12', '2021-09-13 14:39:12'),
('37543c9d1f2786fbdce06e019a6066b30297d93c266f1e6e9306594170319f5b00ee693b40352830', 58, 1, 'authToken', '[]', 0, '2020-09-02 13:03:43', '2020-09-02 13:03:43', '2021-09-02 16:03:43'),
('3772abab0854c87af6954549c9fb69d90bc08f98d556f28199f47deff7bf78f57001af5d6cd1e695', 58, 1, 'authToken', '[]', 0, '2020-09-13 20:00:42', '2020-09-13 20:00:42', '2021-09-13 23:00:42'),
('38d69eac515f6662d60c678382b20acc0a453192bc8c89b1207e31421f0d2fafb00218fe6bab39e7', 58, 1, 'authToken', '[]', 0, '2020-09-07 17:57:49', '2020-09-07 17:57:49', '2021-09-07 20:57:49'),
('3925d06d43f3a1c271220c42de4940313d756fae0caa5a66f8a6aac38e8b19cad2ac857d7c16f1bb', 28, 1, 'authToken', '[]', 0, '2020-07-26 22:54:07', '2020-07-26 22:54:07', '2021-07-27 01:54:07'),
('396ffb9399a6baec5af6157c44eec87f9002643b60dc4ad793459cf871c290190067a1f745d4c2d7', 22, 1, 'authToken', '[]', 0, '2020-07-13 17:35:54', '2020-07-13 17:35:54', '2021-07-13 20:35:54'),
('3aafac248ba2145fc5aeac4f663143d5474d24848b2acd564fabdaaeae3a6fd52d98aaa326142c22', 58, 1, 'authToken', '[]', 0, '2020-09-13 15:35:21', '2020-09-13 15:35:21', '2021-09-13 18:35:21'),
('3bde1a9c9b08bee1c82b890148299274d9b73304ba590f97649c3c872aa1b76692215f4af80e3ffa', 67, 1, 'authToken', '[]', 0, '2020-09-13 16:40:28', '2020-09-13 16:40:28', '2021-09-13 19:40:28'),
('3bf6e67379d67b252884249960ab76182ec148bc1b047241a31baa50e4b50957477f900796c69773', 28, 1, 'authToken', '[]', 0, '2020-07-29 06:50:18', '2020-07-29 06:50:18', '2021-07-29 09:50:18'),
('3e03e5a3d3e8d70643e5741a7b534c70bedb123449343b61c1a6f44c97229949f2d54876d0f90775', 28, 1, 'authToken', '[]', 0, '2020-07-27 16:01:13', '2020-07-27 16:01:13', '2021-07-27 19:01:13'),
('3ea2fba08c1ef70db17f7ecd0b784df1737dff3cb2dd2c744cfeb20a35ca8fa46c7ed89e4aaa79b5', 28, 1, 'authToken', '[]', 0, '2020-07-28 19:36:29', '2020-07-28 19:36:29', '2021-07-28 22:36:29'),
('3eb3366bed05843873cf798cb8b0457d66609d5c62ba7a8258cda1c9994ffe8211e1eec48242db5d', 67, 1, 'authToken', '[]', 0, '2020-09-13 15:55:47', '2020-09-13 15:55:47', '2021-09-13 18:55:47'),
('3ef18e51d50750cd6ee6fe4e10ffe5a0211d75d205f4570b45bae466729a50775e5eb0f417b6d868', 28, 1, 'authToken', '[]', 0, '2020-08-08 06:20:52', '2020-08-08 06:20:52', '2021-08-08 09:20:52'),
('3f1982b51293ed06d5738f20f963439b69d9552c4b47f49a4558b39fa592d8a6cb1cf73275ce1ce7', 28, 1, 'authToken', '[]', 0, '2020-07-28 16:37:07', '2020-07-28 16:37:07', '2021-07-28 19:37:07'),
('3f6d501e6be2eddab33f2a189298f433c8a118fb4143c4851a8f77439706881153baecd28029256f', 5, 1, 'authToken', '[]', 0, '2020-06-13 17:54:21', '2020-06-13 17:54:21', '2021-06-13 20:54:21'),
('403abd4f2ae5c214f7f2958d9a2c511f80b01291d2861ef9a72dd0a564e5856df552d3a44c0cc02e', 58, 1, 'authToken', '[]', 0, '2020-09-01 12:55:41', '2020-09-01 12:55:41', '2021-09-01 15:55:41'),
('40796c67380b7d34ec7d6da95f3e09284692c1243f57954573385ecda5590787c9d0b3091a448562', 58, 1, 'authToken', '[]', 0, '2020-09-15 18:37:19', '2020-09-15 18:37:19', '2021-09-15 21:37:19'),
('410fe9fc6a5f2eb431fd31efdce6daf4c1a95ad37083069661a9bb77b4727d4687cf5ceef1bb57a6', 58, 1, 'authToken', '[]', 0, '2020-09-13 20:01:52', '2020-09-13 20:01:52', '2021-09-13 23:01:52'),
('41d46429b130aac4b88129a535601e3636cc836623fc9be7dbad315330d0c0de181e1f43ca8c0a37', 5, 1, 'authToken', '[]', 0, '2020-06-23 13:37:32', '2020-06-23 13:37:32', '2021-06-23 16:37:32'),
('428db6f6ebe657243b254c5eb5a2f428ea014cb6203d497d46ba1a2f2af8bc23af7e5d4ca5eb6b6c', 58, 1, 'authToken', '[]', 0, '2020-09-13 15:06:02', '2020-09-13 15:06:02', '2021-09-13 18:06:02'),
('42df0b6304d99db84665d8bd866c571cc4da71ac77fb6aef4de348fdeddf05d26a5005d2d455d00a', 28, 1, 'authToken', '[]', 0, '2020-07-26 19:50:59', '2020-07-26 19:50:59', '2021-07-26 22:50:59'),
('432b6c2ea8e3e8556dbe329481e8b482ed9686e033ab4aae0e67dacc65162e148d8f5ea89469c09c', 58, 1, 'authToken', '[]', 0, '2020-08-26 17:37:27', '2020-08-26 17:37:27', '2021-08-26 20:37:27'),
('435024641babd712948e15e81339a3f1b26eb862b890f2f49bfbef6768392c039aa843fc215c1a15', 28, 1, 'authToken', '[]', 0, '2020-07-28 16:02:11', '2020-07-28 16:02:11', '2021-07-28 19:02:11'),
('439b1b5414c775f34e0e550ccb6909ba4037996e94726728bea1e7e5e3316f202a7bd6ad13c5d746', 58, 1, 'authToken', '[]', 0, '2020-09-11 14:14:43', '2020-09-11 14:14:43', '2021-09-11 17:14:43'),
('43f650d804ebd3a94aacde0a62cc982050510afd0e7c28e8d2bb94e9904f5fc183c8a5a63e19aac3', 58, 1, 'authToken', '[]', 0, '2020-09-13 19:35:59', '2020-09-13 19:35:59', '2021-09-13 22:35:59'),
('44a5798014aad5c3131c69095f4d6e313c81a0e80154febbf652d17c3c9a6b8b25dbc08457194f00', 28, 1, 'authToken', '[]', 0, '2020-08-08 06:23:44', '2020-08-08 06:23:44', '2021-08-08 09:23:44'),
('44bd4d9a06288c02c7a51da4a28d0b535f734cbbd7f80332bc24cc9f9adaa291afedb4fcbd578c8d', 58, 1, 'authToken', '[]', 0, '2020-09-13 17:52:47', '2020-09-13 17:52:47', '2021-09-13 20:52:47'),
('44f81fadafe59bbcdf70d7d1ed6c62c8d76cb65acc3a35d4094b8570aa447832a8969fc85cf77ee5', 28, 1, 'authToken', '[]', 0, '2020-07-26 23:05:39', '2020-07-26 23:05:39', '2021-07-27 02:05:39'),
('450990ef3a18596b2ebd3b3372ec730915bbdc5b29fbee81d4daad75b5cf30efd78f0bd8da83233a', 58, 1, 'authToken', '[]', 0, '2020-09-10 06:30:44', '2020-09-10 06:30:44', '2021-09-10 09:30:44'),
('458f2a97a56988bc0f1dae9cf23a467c944de77d4ec11fe8caa889abdd1ac1a34f9a0c134dae744e', 58, 1, 'authToken', '[]', 0, '2020-08-31 07:31:17', '2020-08-31 07:31:17', '2021-08-31 10:31:17'),
('4678a97e2c42384f7148f57b73d608891bd12f589cbf1d835d7dd0b74aa2084e557287f41ca709c4', 28, 1, 'authToken', '[]', 0, '2020-07-08 06:20:35', '2020-07-08 06:20:35', '2021-07-08 09:20:35'),
('48a31ab4651ffa3ae2b79ebba933b37cfac309588b28c88f3c67bbf091d534af801f6a5832ca2df8', 28, 1, 'authToken', '[]', 0, '2020-08-07 19:21:09', '2020-08-07 19:21:09', '2021-08-07 22:21:09'),
('48a3a96a18f22c595b33f478de3523996e8edb2d3e47441fddca2cdcf664fb80d910843664e6b3d2', 58, 1, 'authToken', '[]', 0, '2020-09-14 08:07:31', '2020-09-14 08:07:31', '2021-09-14 11:07:31'),
('4970f4d218d304dc636df936925e2c8514c8b8af8673e46c6d95623c7698e26bdf849b73c34a2291', 28, 1, 'authToken', '[]', 0, '2020-07-25 10:44:19', '2020-07-25 10:44:19', '2021-07-25 13:44:19'),
('4a0665b74b0013a7ca6a122e80707de28964419f11be5ec82860eb1a9a90f11c35f7e92361bbd2f1', 5, 1, 'authToken', '[]', 0, '2020-06-21 12:48:17', '2020-06-21 12:48:17', '2021-06-21 15:48:17'),
('4ab88e32f6e884fef86c698459cf7f5766df2014110e9214e438fcc15f7532e74c2253e2b55db8ff', 58, 1, 'authToken', '[]', 0, '2020-09-02 10:54:19', '2020-09-02 10:54:19', '2021-09-02 13:54:19'),
('4b7187ddf7f04ac3883080cf7cf60380fb8a889780d487faca14039d5226c1963c22008c2654b559', 58, 1, 'authToken', '[]', 0, '2020-09-13 19:46:59', '2020-09-13 19:46:59', '2021-09-13 22:46:59'),
('4b8372df5711a629c842d37c199bcd7d7beb0247d457b47fea8af62830eac1daec968fe34cf25acd', 58, 1, 'authToken', '[]', 0, '2020-09-05 15:02:00', '2020-09-05 15:02:00', '2021-09-05 18:02:00'),
('4b88a481c55d67a019dadfd6cd9a90c49415de7c466a07a159a66d3c78d34b22589b3077acf935c7', 58, 1, 'authToken', '[]', 0, '2020-08-30 21:09:29', '2020-08-30 21:09:29', '2021-08-31 00:09:29'),
('4d9c39d1300e3b3c0aa174875ed33b691b390f39ac76b17ac49d454fc2290d6a4e7dd6d652f31520', 58, 1, 'authToken', '[]', 0, '2020-09-14 20:11:30', '2020-09-14 20:11:30', '2021-09-14 23:11:30'),
('4dbfdbb8d263bc42ab511241e3c2b364d0fc52d746a2c52fb4e375d9b77b20ba8661fd6801f646ff', 58, 1, 'authToken', '[]', 0, '2020-08-27 13:25:19', '2020-08-27 13:25:19', '2021-08-27 16:25:19'),
('4e0d42c610f4a195b462a1b848f4cfdbb812b0e1e5dfdbccb6d9d157fb0c2e19b366284e0c1f4af0', 58, 1, 'authToken', '[]', 0, '2020-09-10 06:24:10', '2020-09-10 06:24:10', '2021-09-10 09:24:10'),
('4e653fdd2add52bd202ea7cfda58a8def371a161886b32dade13fd511b393185469ac24ec290271f', 22, 1, 'authToken', '[]', 0, '2020-07-25 13:03:42', '2020-07-25 13:03:42', '2021-07-25 16:03:42'),
('4e69285c6af8c1edbc733398002630c6201c36a15d803bc603d64b52c2a7d404bd43125241065639', 58, 1, 'authToken', '[]', 0, '2020-09-11 19:34:55', '2020-09-11 19:34:55', '2021-09-11 22:34:55'),
('4f31cff22a6b2a66971040ba3af627fbb1c61825c871311892b883b28c12e7c5ed63475b2dbd81a6', 58, 1, 'authToken', '[]', 0, '2020-09-10 06:49:28', '2020-09-10 06:49:28', '2021-09-10 09:49:28'),
('4f5d27078f02be763abccddd6ae3f043bc03834035ccd705e21aaaaf1830ab5795dabb0a176c4cd8', 58, 1, 'authToken', '[]', 0, '2020-09-13 22:13:30', '2020-09-13 22:13:30', '2021-09-14 01:13:30'),
('4ff7204a218c8aa753d4a228a001d91580e807e9c7c8cdd4c3ed4ea7e563a1b77c75689173d69982', 28, 1, 'authToken', '[]', 0, '2020-07-28 16:08:50', '2020-07-28 16:08:50', '2021-07-28 19:08:50'),
('5000e18391e5a573f36fe5855461c6631be60dfded7bb0913c25fd7192e767749c41547f2a19fa21', 58, 1, 'authToken', '[]', 0, '2020-09-15 17:27:16', '2020-09-15 17:27:16', '2021-09-15 20:27:16'),
('508a080dbe921718b63fcb095262b18d4afad77b391df548c78b1cdc3bc1a77166e5ecaeffde3580', 58, 1, 'authToken', '[]', 0, '2020-08-27 12:00:07', '2020-08-27 12:00:07', '2021-08-27 15:00:07'),
('510d66ac636c36230db67bd0ece9261fbcf8cc1de60807abbbc7c44d6b6ffeefcbf01cffa551614c', 28, 1, 'authToken', '[]', 0, '2020-07-08 06:45:41', '2020-07-08 06:45:41', '2021-07-08 09:45:41'),
('52bd5d661a611ded236d62bd4a1358d7cf3f399288f9229d6734e61d0f4a5bf41a3e64c36713b45a', 58, 1, 'authToken', '[]', 0, '2020-09-07 17:01:35', '2020-09-07 17:01:35', '2021-09-07 20:01:35'),
('53a4bdad77fda53060248973354efb2923d9599a190f45567e2e91eb35f438d316785d8ce34f3060', 5, 1, 'authToken', '[]', 0, '2020-06-23 12:30:25', '2020-06-23 12:30:25', '2021-06-23 15:30:25'),
('5424044a14748d06220a6a5dfabcbbd2002448bfe694eb5e7590caab147df7f31e927ffda73528a7', 58, 1, 'authToken', '[]', 0, '2020-08-31 08:14:59', '2020-08-31 08:14:59', '2021-08-31 11:14:59'),
('54580318f1866af40284f8d2af7dc23d230bcd8feab4da48b9dd8fbec584d34857be586cb36866eb', 58, 1, 'authToken', '[]', 0, '2020-09-08 06:26:04', '2020-09-08 06:26:04', '2021-09-08 09:26:04'),
('5476271818f774f95b40adffad4e3e94f564b9b961ea2de26b0567f14b121db20c2b0bc19274a91c', 22, 1, 'authToken', '[]', 0, '2020-07-21 14:11:16', '2020-07-21 14:11:16', '2021-07-21 17:11:16'),
('552246521557e6a87a61bc0980e8cb0dff4ecd1c32ec42a0a890d4f77dae28c2c00f86fede7226ea', 56, 1, 'authToken', '[]', 0, '2020-08-19 11:42:07', '2020-08-19 11:42:07', '2021-08-19 14:42:07'),
('55cf1ff6c2c88ec86fa97e8736fe04baf03e6a2f43583c5518c09c9cee8f3e1f8932a4ff616171f0', 58, 1, 'authToken', '[]', 0, '2020-09-14 18:00:35', '2020-09-14 18:00:35', '2021-09-14 21:00:35'),
('55f7ed2167f62f4f960fda694f3d06531582c5c8e0ca65a6b68a2fc124594e86ab7823491ef9b3ba', 58, 1, 'authToken', '[]', 0, '2020-09-07 15:40:31', '2020-09-07 15:40:31', '2021-09-07 18:40:31'),
('56b61027367a8e101eb86f6a76a725ee146426150c7f6b6af0986456847abd08ae061265f6b303a3', 58, 1, 'authToken', '[]', 0, '2020-09-09 20:28:37', '2020-09-09 20:28:37', '2021-09-09 23:28:37'),
('56d95351f0e907be080ef673e39fea93ca7bc8fd1f4d51c104a9105812fd4adf02268b99f061be92', 58, 1, 'authToken', '[]', 0, '2020-09-07 16:32:53', '2020-09-07 16:32:53', '2021-09-07 19:32:53'),
('56ddc94741281844b763fe25068da8782845eab308badb323d1c79e91d4b5387b7111a9ac7dbe891', 58, 1, 'authToken', '[]', 0, '2020-09-05 16:05:29', '2020-09-05 16:05:29', '2021-09-05 19:05:29'),
('5769b7a6e9b38d2e655b10973e1a7f9841c8cbe5caa6cf22423cce0d127f581aaf77a85b6a8b3b96', 5, 1, 'authToken', '[]', 0, '2020-06-13 17:51:51', '2020-06-13 17:51:51', '2021-06-13 20:51:51'),
('577940a1c9f307683f7c7bc71f0e4f9083a6c64eb8dd7ab709b62699cf21a276dc3cc238b0cfacd2', 67, 1, 'authToken', '[]', 0, '2020-09-15 11:50:55', '2020-09-15 11:50:55', '2021-09-15 14:50:55'),
('57a62d3d7304fb7f3327aa999bb5190f9139f4e3259756e9c8e4748a1a0da71de69d25f3c8117437', 22, 1, 'authToken', '[]', 0, '2020-07-21 13:10:11', '2020-07-21 13:10:11', '2021-07-21 16:10:11'),
('5824ed53cb9cb91d22bbd880b3529c4a70144f85c76b2b5c44d7d3a56df7eaebb590d9cb95026315', 57, 1, 'authToken', '[]', 0, '2020-08-20 06:56:38', '2020-08-20 06:56:38', '2021-08-20 09:56:38'),
('5888bd116967d0e3df5e6ed302f03886ce1974db54cd433f069226e6fe23c7cdcf7e6a492aabee72', 5, 1, 'authToken', '[]', 0, '2020-06-20 11:59:02', '2020-06-20 11:59:02', '2021-06-20 14:59:02'),
('59eb7dd6615c778342b64ec3381e64ac6c8f20f7ee834e70e38148e3872fd4ce4ca140260e671a80', 24, 1, 'authToken', '[]', 0, '2020-06-24 14:23:05', '2020-06-24 14:23:05', '2021-06-24 17:23:05'),
('5a1d8cf13e2402ca89a4b7a6af35c90f77caa630308b9fa24efae62c160cdc65c837d28f4ea3e133', 28, 1, 'authToken', '[]', 0, '2020-07-26 22:54:36', '2020-07-26 22:54:36', '2021-07-27 01:54:36'),
('5a6abed2110e36b5c930b4a706d3ad672acbcafa6c0b77844f524c0da8f184122ebe55c63bada252', 28, 1, 'authToken', '[]', 0, '2020-08-08 08:22:22', '2020-08-08 08:22:22', '2021-08-08 11:22:22'),
('5a9e4cfea42ccbeb4069f98bf2fec60c49e399af43708c36f36545a0b1f9dd77fbd5e2439cd260c3', 58, 1, 'authToken', '[]', 0, '2020-09-01 03:36:00', '2020-09-01 03:36:00', '2021-09-01 06:36:00'),
('5b3cf768953c9654f96c4ff7b164ea058c5c14680f17b106f9a87ceadd8ccd6f712cd4b20f550dbd', 58, 1, 'authToken', '[]', 0, '2020-08-28 14:02:34', '2020-08-28 14:02:34', '2021-08-28 17:02:34'),
('5b9720e394d48f385d96bda14dce3039894586307888e8c8d3c7dcb01ef43568809a086e1103437b', 58, 1, 'authToken', '[]', 0, '2020-09-13 22:33:10', '2020-09-13 22:33:10', '2021-09-14 01:33:10'),
('5c1aac27ab487c58e9f5ce7509b776917d71fc4a9e1ebb00b371d2c90ad7ada607973d9a3db67061', 28, 1, 'authToken', '[]', 0, '2020-07-26 23:01:45', '2020-07-26 23:01:45', '2021-07-27 02:01:45'),
('5c47109b72fd506b01e22b21e5cf0098a703a26d429cd20f2cc84b926723fa2ccfd637601716d1eb', 28, 1, 'authToken', '[]', 0, '2020-07-28 16:18:53', '2020-07-28 16:18:53', '2021-07-28 19:18:53'),
('5d229dff3e862552e14d15d6ac956cffa5d084dc9ca11f7f1e66624fdca9fdc71aede4ef9683a9fe', 58, 1, 'authToken', '[]', 0, '2020-09-11 16:13:03', '2020-09-11 16:13:03', '2021-09-11 19:13:03'),
('5d42fe615c5bac7c21e767b553617d4537cb25e6640c1621c1fa7eeb3476aa4f61032975f478f419', 28, 1, 'authToken', '[]', 0, '2020-07-22 09:41:58', '2020-07-22 09:41:58', '2021-07-22 12:41:58'),
('5e00f295ab6a321d4845aac920c53df73e9d5ffae2e23ebe67689274ccddd54088e758feda88de1f', 28, 1, 'authToken', '[]', 0, '2020-07-26 19:53:28', '2020-07-26 19:53:28', '2021-07-26 22:53:28'),
('5e1874d0709a25fff5a7019f37430b486f1b1dfc9290653851c4497ed2e31831b2cda0e46249d597', 58, 1, 'authToken', '[]', 0, '2020-09-14 01:03:02', '2020-09-14 01:03:02', '2021-09-14 04:03:02'),
('5e2aafa5039a33ffe0b773d5083fd1f1a643f57b477581257d0b46a1db121772e2c0a6ec7892a868', 58, 1, 'authToken', '[]', 0, '2020-09-13 22:43:28', '2020-09-13 22:43:28', '2021-09-14 01:43:28'),
('5fb403182868ab580a8d82c175f44e575b821b20b633ed94af0f71d0e98b1af4bd4f3e4ae9944627', 58, 1, 'authToken', '[]', 0, '2020-09-07 15:55:15', '2020-09-07 15:55:15', '2021-09-07 18:55:15'),
('6011b7bb0616f7cd9a90d6dff50867818d310c6f2adad9a2001c61fa0ba82045abe8daae80111d92', 68, 1, 'authToken', '[]', 0, '2020-09-15 11:45:53', '2020-09-15 11:45:53', '2021-09-15 14:45:53'),
('6075ac9f25b55ada650f41254171d6b83301d2952c53c62c0268a5aa6cfc1411fe2b357976139746', 28, 1, 'authToken', '[]', 0, '2020-07-27 16:02:11', '2020-07-27 16:02:11', '2021-07-27 19:02:11'),
('60bac619399471636fb3543c5b57c5283bb77cd54ff0b19b491bae7936ac97d5771140c8badb8cb1', 58, 1, 'authToken', '[]', 0, '2020-08-27 17:04:50', '2020-08-27 17:04:50', '2021-08-27 20:04:50'),
('618e3930ee18717ad2ae51998bb7e20e6a2da78fb18397670485c95561ca799f409ed8dc5e52697e', 28, 1, 'authToken', '[]', 0, '2020-07-25 09:41:45', '2020-07-25 09:41:45', '2021-07-25 12:41:45'),
('62b4ad5c050887e64c0ac027a7f97f6243300683d2126c618773c4887a85b065e3de9c87466a7e80', 58, 1, 'authToken', '[]', 0, '2020-09-07 18:24:07', '2020-09-07 18:24:07', '2021-09-07 21:24:07'),
('6430521d5de775bef84d344277a8afe22b588d903bfadbfc55226e1bb46fe53eded6bdbe11e38c07', 58, 1, 'authToken', '[]', 0, '2020-08-28 05:55:46', '2020-08-28 05:55:46', '2021-08-28 08:55:46'),
('6500a2163403ea3a3d7b5e2a045c1c1a4e1bc1d3b862a5e7e87a06f3f24bd05b837e1ae610344521', 58, 1, 'authToken', '[]', 0, '2020-09-14 15:11:21', '2020-09-14 15:11:21', '2021-09-14 18:11:21'),
('656349c253b495669a00107a79df0a1661e89ce9465b12a7b99e8291b2e499467004c294f0fa7c5b', 58, 1, 'authToken', '[]', 0, '2020-08-26 15:49:15', '2020-08-26 15:49:15', '2021-08-26 18:49:15'),
('66a9b0a8734fc751f6430667f4069be7b8d3ed116017db93f769fe69420ab30cf71aea49a928e8a1', 28, 1, 'authToken', '[]', 0, '2020-07-23 06:20:35', '2020-07-23 06:20:35', '2021-07-23 09:20:35'),
('678564c97ecd1996524c7745065be88dbc00134d0f137216f4032b1df24bae5147c0d976cef29f2d', 58, 1, 'authToken', '[]', 0, '2020-09-15 17:28:25', '2020-09-15 17:28:25', '2021-09-15 20:28:25'),
('6796c518dcc09d9cec48152fde174814b4c7f7e7eb9afbf45713efc234ac642d78a798ce1e903e04', 58, 1, 'authToken', '[]', 0, '2020-09-13 17:58:01', '2020-09-13 17:58:01', '2021-09-13 20:58:01'),
('6845777eab3befeac77ee469f56dc6621af3dafb69c4de1b517890443dfb1c43182abb8d2d2a0587', 67, 1, 'authToken', '[]', 0, '2020-09-13 17:34:31', '2020-09-13 17:34:31', '2021-09-13 20:34:31'),
('6879557204b9ce31dd794516ea4610a8b6c78cdc94af2f6d41a6e873b63139e6768e81992b43579d', 67, 1, 'authToken', '[]', 0, '2020-09-09 08:26:35', '2020-09-09 08:26:35', '2021-09-09 11:26:35'),
('6914028c2314156f09b5c040a89c20b92729e52b6ce5f15fafbf9a541d55ed1621f65a9dc78205c9', 5, 1, 'authToken', '[]', 0, '2020-06-22 02:03:45', '2020-06-22 02:03:45', '2021-06-22 05:03:45'),
('69806ed3701b9e5c8f2233f4d34543c63def4c8d345f6e090c1cbd814251c8cd11cdd525a69563b2', 58, 1, 'authToken', '[]', 0, '2020-09-06 15:16:57', '2020-09-06 15:16:57', '2021-09-06 18:16:57'),
('69d77db545883211491b0bcaee3b980e746046a1291c737e65b3a804cea5609f9852290f3003da1f', 28, 1, 'authToken', '[]', 0, '2020-07-29 06:54:37', '2020-07-29 06:54:37', '2021-07-29 09:54:37'),
('6a12f7bdd58e10a7044a6902545662f295b0adf1c9eef88c060c70c43885525ae962b861e44d9a33', 1, 1, 'authToken', '[]', 0, '2020-06-09 16:17:51', '2020-06-09 16:17:51', '2021-06-09 19:17:51'),
('6b6a0f3b90d9e4069b01d486b918bbc668de2ab21bf27b35ee7833c914d0c09a1fb2aee10ca7afc2', 58, 1, 'authToken', '[]', 0, '2020-09-14 20:24:27', '2020-09-14 20:24:27', '2021-09-14 23:24:27'),
('6c1ff8009045956d8f6ad77c9a888fbde4c81ce4f7221e8be237db453bf98d687fcb934ddc0c3bf6', 58, 1, 'authToken', '[]', 0, '2020-08-29 15:04:57', '2020-08-29 15:04:57', '2021-08-29 18:04:57'),
('6df78d408908d7e9b7bff7c1ceee535dd18134da387acf599e90e5fd184c7515ff5af6f7d66358d7', 58, 1, 'authToken', '[]', 0, '2020-08-28 10:09:54', '2020-08-28 10:09:54', '2021-08-28 13:09:54'),
('6ea42b8425d64876ec238f7213f0deadf2bd60eb8cf132a0f2460f611b21ddedcbad0d1d080f2146', 1, 1, 'authToken', '[]', 0, '2020-06-10 03:08:22', '2020-06-10 03:08:22', '2021-06-10 06:08:22'),
('6ed9c854c3345c006fb8d38b8ead4d0edfded5225458caeb0077a3b2c2fdc0bbad86891fe243aca2', 5, 1, 'authToken', '[]', 0, '2020-06-24 08:10:51', '2020-06-24 08:10:51', '2021-06-24 11:10:51'),
('6f65cc80181064aa8166f3d9119227ce6c85f812cd5d1f2d00b89e8da109a35f569493f6fc62f816', 22, 1, 'authToken', '[]', 0, '2020-07-11 17:47:44', '2020-07-11 17:47:44', '2021-07-11 20:47:44'),
('7004d837779b11747914c350dccc0cb0a746e0f953af5a7ba4f38b050ae548853eefada7b79f454d', 58, 1, 'authToken', '[]', 0, '2020-09-12 09:52:03', '2020-09-12 09:52:03', '2021-09-12 12:52:03'),
('70f37b6987c982fd73fe02e7c1a03fa0633a402d21c84a25c0a26650293fcbad59082a8b0b7632cf', 5, 1, 'authToken', '[]', 0, '2020-06-10 06:17:03', '2020-06-10 06:17:03', '2021-06-10 09:17:03'),
('7173c87c4bd878fa68181f6dfe45715057d7c352166639525702e648f2dc30a18eefb3da19540d3d', 58, 1, 'authToken', '[]', 0, '2020-09-13 22:52:28', '2020-09-13 22:52:28', '2021-09-14 01:52:28'),
('71af005b451735915b09399fecd62e4eed9d99e688484bda34baf735eda4d4d7b3544b2e1b331f27', 58, 1, 'authToken', '[]', 0, '2020-09-13 15:31:19', '2020-09-13 15:31:19', '2021-09-13 18:31:19'),
('71da44cbfe76866fa4f08b4a5323aee1b52fce2e8b02fbb9401f576b49f0c81a808c3fb0d9cf879d', 28, 1, 'authToken', '[]', 0, '2020-07-25 09:16:02', '2020-07-25 09:16:02', '2021-07-25 12:16:02'),
('7207198c3b48b582bf957e7da475f68ea705bdff25c5f6d4e984e5abeeb237455626c035ddaaa742', 5, 1, 'authToken', '[]', 0, '2020-06-14 02:53:38', '2020-06-14 02:53:38', '2021-06-14 05:53:38'),
('727d5bd6641c948efedb050b8a3ba64760a782917cc603b16952e06b75c2ca8783d97295e6523153', 67, 1, 'authToken', '[]', 0, '2020-09-13 13:56:30', '2020-09-13 13:56:30', '2021-09-13 16:56:30'),
('738338432a2ecbde4766cb61f274211ada8d44052fd136e202e3f20af93c7b949351ea1be91b4174', 58, 1, 'authToken', '[]', 0, '2020-08-26 16:02:05', '2020-08-26 16:02:05', '2021-08-26 19:02:05'),
('74966ad24a87ce3d3c7bac99532525a6b551d6463af2f2412e46c640a7fd8c4f031e19d90e4ebc13', 58, 1, 'authToken', '[]', 0, '2020-09-07 15:43:25', '2020-09-07 15:43:25', '2021-09-07 18:43:25'),
('74ed583c027abed8541ddfc0916efe9fa21d44264cf571eb4243d6770f595944ea6d2bb5f16cd6b4', 5, 1, 'authToken', '[]', 0, '2020-06-22 02:10:37', '2020-06-22 02:10:37', '2021-06-22 05:10:37'),
('758ad654e2c661c28ee4c9449441d83216972e1eade87af9ec35f6f936879ae3be3b4022dd148c37', 28, 1, 'authToken', '[]', 0, '2020-08-10 07:08:34', '2020-08-10 07:08:34', '2021-08-10 10:08:34'),
('75f326213e07568d35a4e225f213c7ee880db42af417566d719ee0a70e297c4841aba41b00c33f62', 58, 1, 'authToken', '[]', 0, '2020-09-05 14:50:05', '2020-09-05 14:50:05', '2021-09-05 17:50:05'),
('761b94cfc8250f9832ccc83cc0b7de6573b684c23157ac326b44bcc87faccb9fe0327c1bb0a349f1', 58, 1, 'authToken', '[]', 0, '2020-09-12 18:29:00', '2020-09-12 18:29:00', '2021-09-12 21:29:00'),
('76fd64fa2c5676826b1de50572ce2dd376cb859b237af0602b824651013e39a067703ebf0541d4f4', 28, 1, 'authToken', '[]', 0, '2020-08-05 15:12:00', '2020-08-05 15:12:00', '2021-08-05 18:12:00'),
('7721de40b431db09640d447e756a68456439dce2e360ca68d812ac60ad820a078105d8f6415053a7', 26, 1, 'authToken', '[]', 0, '2020-07-07 13:44:39', '2020-07-07 13:44:39', '2021-07-07 16:44:39'),
('77857e0c321aef227624ac4f69e2fc7594876697a3f957072ada396945158e671095f330ebf04f2d', 58, 1, 'authToken', '[]', 0, '2020-09-02 12:19:43', '2020-09-02 12:19:43', '2021-09-02 15:19:43'),
('77da521c31596fbce7dc21c7bdcc264c9d021e17bc46bef1e9d67fafbc1ab91dad413ae241ea6fe2', 28, 1, 'authToken', '[]', 0, '2020-08-08 08:16:11', '2020-08-08 08:16:11', '2021-08-08 11:16:11'),
('78303217edc41758e7e6bb2a3da0314093f5deb9da98830db9a336a58c7ffae9bccf14ef0bd5ee65', 58, 1, 'authToken', '[]', 0, '2020-09-11 16:23:33', '2020-09-11 16:23:33', '2021-09-11 19:23:33'),
('79442cb52d62e333cfd30265ecdaa65500d11b6448e2ab71b43ee0b01bc9f26054058544bc443570', 67, 1, 'authToken', '[]', 0, '2020-09-13 16:09:38', '2020-09-13 16:09:38', '2021-09-13 19:09:38'),
('7a8c9460358c088512679e5de63e8e6daf14421becdb5bc6449026f4aefa7e5be5bc56615e691230', 58, 1, 'authToken', '[]', 0, '2020-09-13 19:43:40', '2020-09-13 19:43:40', '2021-09-13 22:43:40'),
('7ab61411a39f0f267d379b44e0ed09ccb0acfb180c543b1fde3ba41073dfe913733331da2949a0b3', 28, 1, 'authToken', '[]', 0, '2020-07-28 16:18:21', '2020-07-28 16:18:21', '2021-07-28 19:18:21'),
('7afaeccf85e5235a2df52161e9516a4e739d860873d6ea886541ef4b336906768c591ce7afe699dc', 58, 1, 'authToken', '[]', 0, '2020-09-14 08:12:27', '2020-09-14 08:12:27', '2021-09-14 11:12:27'),
('7ba6935886ba1a16cc11f67c26b865a207f39b6abcdb46e82e902724c12b547f50cf8f1fbac0f696', 28, 1, 'authToken', '[]', 0, '2020-07-28 16:39:42', '2020-07-28 16:39:42', '2021-07-28 19:39:42'),
('7be4ecac802e534c6e0fb446d5353a48314ea7f33a2d6b23ade48901fcc949f8d44513ff3ab08a72', 58, 1, 'authToken', '[]', 0, '2020-09-08 09:11:21', '2020-09-08 09:11:21', '2021-09-08 12:11:21'),
('7c11bcd0cf91627855122e8d5699206f2d06733f030e573a5902383a21c834e96d2b3d6808838048', 58, 1, 'authToken', '[]', 0, '2020-08-30 05:32:32', '2020-08-30 05:32:32', '2021-08-30 08:32:32'),
('7c58e17595546426ae0e6a6dfd9c28aeef7fe29dcb6e3254d2a6b7e02ec0626a94a6f168bb84d7ad', 58, 1, 'authToken', '[]', 0, '2020-09-13 17:31:37', '2020-09-13 17:31:37', '2021-09-13 20:31:37'),
('7cbaa1072e9029e4629a6e38c6298b16f07208267b1d2e2f8712e6394b361cb43edefceecae718f5', 28, 1, 'authToken', '[]', 0, '2020-07-26 18:27:58', '2020-07-26 18:27:58', '2021-07-26 21:27:58'),
('7e6587c6bc40c3f8bf52eeaaba22127846e8c244a2bf359febcfb867f1fe33f9abb87c8b17ddc47d', 58, 1, 'authToken', '[]', 0, '2020-09-11 16:00:59', '2020-09-11 16:00:59', '2021-09-11 19:00:59'),
('801d620c426ba44e15ed76b69183ea15fcc4d21ae22605cd4f8d3fbef365383ddd5d27d0d8394720', 58, 1, 'authToken', '[]', 0, '2020-09-13 22:41:20', '2020-09-13 22:41:20', '2021-09-14 01:41:20'),
('80ff21c0610be51bb4a8654c758df44c4c8453c8a8637f90218c76d201c9ef0a0540833fe2a87e95', 58, 1, 'authToken', '[]', 0, '2020-08-30 14:16:51', '2020-08-30 14:16:51', '2021-08-30 17:16:51'),
('81aaedad6da3953d9a93ea822300812ba384fb1444ab1c3f112de70737337fd16ed036758d9cca00', 58, 1, 'authToken', '[]', 0, '2020-09-01 12:54:46', '2020-09-01 12:54:46', '2021-09-01 15:54:46'),
('820b498a1e71e1ca6f05705d07175df09ee197add0d26a8572b715dfa2261e38544f59e5121f047c', 5, 1, 'authToken', '[]', 0, '2020-06-22 02:08:41', '2020-06-22 02:08:41', '2021-06-22 05:08:41'),
('829cebfa70e6b3a1dce960d97c18b2c64d7b266456e02daad7c3f845e5a1e9ac6e9c50c85a545209', 22, 1, 'authToken', '[]', 0, '2020-07-21 13:15:32', '2020-07-21 13:15:32', '2021-07-21 16:15:32'),
('83cefdd03eddce17f702b39724a4cb0543ad9c1ca9944efcdda85da2f875a71fa7882ac3e07ea66b', 28, 1, 'authToken', '[]', 0, '2020-07-27 16:00:13', '2020-07-27 16:00:13', '2021-07-27 19:00:13'),
('83cfe913c4f54c18899cdc21d1803d0269d7715fc869566a26c144d651d1786dcb630100bf36e21e', 58, 1, 'authToken', '[]', 0, '2020-09-05 14:55:05', '2020-09-05 14:55:05', '2021-09-05 17:55:05'),
('840be028c6b4b54dca6f5c45caa74758952886ca4750bc44a9b44a426a578da5bb8f8733473fdf8b', 28, 1, 'authToken', '[]', 0, '2020-08-08 08:51:20', '2020-08-08 08:51:20', '2021-08-08 11:51:20'),
('859379308b613deb74609d848afd36eeeaaaee1f92e7b7d661bfc68ad188a6444633a4b66bef000b', 58, 1, 'authToken', '[]', 0, '2020-09-13 20:54:44', '2020-09-13 20:54:44', '2021-09-13 23:54:44'),
('85e75b00285959ee75db8791a76f2785ce894852b8124fd0aafa057d57770fdfd06ec09b30a5322a', 58, 1, 'authToken', '[]', 0, '2020-09-01 10:43:19', '2020-09-01 10:43:19', '2021-09-01 13:43:19'),
('8651f3409928ef5db3e294c2ddade55e3a0fc57c8be3e949b898d95cf6ed74089ce38513c46dfc7a', 24, 1, 'authToken', '[]', 0, '2020-06-24 09:43:04', '2020-06-24 09:43:04', '2021-06-24 12:43:04'),
('866bf02952a4e1893134f8dcfe74d0515acc053a7d0513a4ef8cf7d028ff1e3acdeb02687af650b2', 58, 1, 'authToken', '[]', 0, '2020-08-29 17:50:09', '2020-08-29 17:50:09', '2021-08-29 20:50:09'),
('86b40c3b22e91d889049dc0c73f2362aa6c92a2a875172aa509bf7b5cac79b3e94fa1b4b3ca45928', 58, 1, 'authToken', '[]', 0, '2020-09-12 19:20:16', '2020-09-12 19:20:16', '2021-09-12 22:20:16'),
('86d0005b922618a893b7230a243b5ff10f141992fba591d614622a6e674b889cc1ddf65437447f32', 58, 1, 'authToken', '[]', 0, '2020-09-12 09:29:21', '2020-09-12 09:29:21', '2021-09-12 12:29:21'),
('86dc7d0584cafcbef7a5a2a1fc70b69fe6d468be8c2dc2ef00be81a8837b40ee5be9861390d11612', 58, 1, 'authToken', '[]', 0, '2020-09-13 15:06:14', '2020-09-13 15:06:14', '2021-09-13 18:06:14'),
('8798deb9c8d368abaab18f7c0431b8b71c5968c96efc8a269a5eaf2b52752574b21da73e1037d071', 1, 1, 'authToken', '[]', 0, '2020-06-10 02:12:16', '2020-06-10 02:12:16', '2021-06-10 05:12:16'),
('87ab60652d860737a2f6b1cb6c6cfdc748d1333b616e405417dd1ca2b47f44a50ddcbe67ea05459b', 28, 1, 'authToken', '[]', 0, '2020-08-08 07:22:15', '2020-08-08 07:22:15', '2021-08-08 10:22:15'),
('87c85302f6245ad394afb27a0d9ac19accf46d49f373c4737ab3116dcfe03b2f065365fa8aff1e8d', 28, 1, 'authToken', '[]', 0, '2020-08-07 19:38:57', '2020-08-07 19:38:57', '2021-08-07 22:38:57'),
('88025d3e9311fd043d32fa4a4a20dca3d651c8514cebbfed64f6736126166815660f33dcc19f67b6', 28, 1, 'authToken', '[]', 0, '2020-08-02 14:57:46', '2020-08-02 14:57:46', '2021-08-02 17:57:46'),
('88158ebec7d5dc8b348340fbe606986ffa6d129df5657d58d5ee29223c3ae0dbc3975bf3e554603c', 58, 1, 'authToken', '[]', 0, '2020-09-07 18:35:58', '2020-09-07 18:35:58', '2021-09-07 21:35:58'),
('886654c925a33e9edc0c4fae61c2a864d67ce973acfe439c45b0eab10e4a6d1f0dd7b2612a47bd3d', 58, 1, 'authToken', '[]', 0, '2020-09-13 15:24:50', '2020-09-13 15:24:50', '2021-09-13 18:24:50'),
('88fc9e320ce5effbcba4df0aeede9c2c38b728f90b3ece0776f89808ace21cb1cb555b1722efe0cc', 58, 1, 'authToken', '[]', 0, '2020-08-30 11:14:14', '2020-08-30 11:14:14', '2021-08-30 14:14:14'),
('8905a5164f12bc7e00dc80116d1476e53bf7564b4684fcf266f845bbb960cda0a77c75e662ce7922', 58, 1, 'authToken', '[]', 0, '2020-09-11 19:21:05', '2020-09-11 19:21:05', '2021-09-11 22:21:05'),
('8a121972d7a0fa24e4280a3f55a7eab4c55da2684f529a852755a772ea2e145c2df6825df76bf991', 28, 1, 'authToken', '[]', 0, '2020-07-22 09:57:11', '2020-07-22 09:57:11', '2021-07-22 12:57:11'),
('8aded6b7b53048a5941e52d763af488fa8f52bf81700784471c870edce2c9ba505f9d29cb45000cb', 58, 1, 'authToken', '[]', 0, '2020-09-14 00:44:01', '2020-09-14 00:44:01', '2021-09-14 03:44:01'),
('8c0435f8d5bfe6e460a333c67176ce00f171ff2d2c2fec1cc168bbd0dbf5643ce33e7251facf04fc', 58, 1, 'authToken', '[]', 0, '2020-08-31 08:20:47', '2020-08-31 08:20:47', '2021-08-31 11:20:47'),
('8c5933784b33e56fedb61a7f7a58244139073f37e21329288842a1731f6502fbf34af45b8989da3c', 5, 1, 'authToken', '[]', 0, '2020-06-14 13:32:07', '2020-06-14 13:32:07', '2021-06-14 16:32:07');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('8c5b636403e4509690950c32502ce00833b1e26c13cc8517c7a35897ef66010996ec359cf607f6ca', 58, 1, 'authToken', '[]', 0, '2020-08-31 07:27:36', '2020-08-31 07:27:36', '2021-08-31 10:27:36'),
('8df8d5bb1e6b7cc09ddc99f3785b8072127028760bc1f9ce7cb0709d1c7f93433bddeed76eff20ef', 58, 1, 'authToken', '[]', 0, '2020-09-08 12:15:56', '2020-09-08 12:15:56', '2021-09-08 15:15:56'),
('8ec42cbf14f696b098723449df4215f7a52e61ef675f95d3eafd7bf620f7cb3f3448643ad08b1c35', 58, 1, 'authToken', '[]', 0, '2020-09-13 21:45:26', '2020-09-13 21:45:26', '2021-09-14 00:45:26'),
('8f4a5be04d83079307a5b509ff97f583783eea2a2549ecb844c790abf91f5bba85b37e3b61e37345', 58, 1, 'authToken', '[]', 0, '2020-09-13 15:28:24', '2020-09-13 15:28:24', '2021-09-13 18:28:24'),
('8f5f617f79d7fdcd4025566052c2516f4b94f6c514bb89f3d3f32d9595f98ece6e98425e88fa54b2', 58, 1, 'authToken', '[]', 0, '2020-09-14 01:42:55', '2020-09-14 01:42:55', '2021-09-14 04:42:55'),
('8fa129c6bfcbabb564eedb25d4aa86f3c71cb08e0c30b4d70fcb611835c9aad796f752da3fe7e8bc', 28, 1, 'authToken', '[]', 0, '2020-07-22 08:57:02', '2020-07-22 08:57:02', '2021-07-22 11:57:02'),
('8fe029ba3811309d671bf7170eb2d3b345664d35cc7d75cc3ab4051a3a5a73cea90172ea05529ebb', 28, 1, 'authToken', '[]', 0, '2020-08-02 11:18:27', '2020-08-02 11:18:27', '2021-08-02 14:18:27'),
('909136db6f033544f816d08f4a222d73446760a000440a4011849a30061003c927a2d3be827b33a6', 28, 1, 'authToken', '[]', 0, '2020-07-22 09:57:33', '2020-07-22 09:57:33', '2021-07-22 12:57:33'),
('91c54a519365ec327e4477885372967362952e3afb90e15427829534f79c12fbd18f664d9140d4a1', 67, 1, 'authToken', '[]', 0, '2020-09-14 14:08:51', '2020-09-14 14:08:51', '2021-09-14 17:08:51'),
('92796dbc15fb5c2b1c620c8c14e6e791f8c4ebc53a7634dbf970e3f2add0421eb0efe29ed3b0205e', 28, 1, 'authToken', '[]', 0, '2020-07-28 09:31:13', '2020-07-28 09:31:13', '2021-07-28 12:31:13'),
('92a2909675754ab57e7b1c6faf4c4eccf0e8d0413a2563804f39a863412a8fec32b6d36e7ffbefbd', 28, 1, 'authToken', '[]', 0, '2020-07-28 20:48:16', '2020-07-28 20:48:16', '2021-07-28 23:48:16'),
('92c96f264d2d5bd971d419cff1163a46f0f694ec35001a2047e831381adbd09a107cf9945c7f8cad', 58, 1, 'authToken', '[]', 0, '2020-09-12 09:35:32', '2020-09-12 09:35:32', '2021-09-12 12:35:32'),
('933ba940601e80f2d78fc5d98ba87dbc7a98b33ff92bfee3a0152c2b4799e5a2f54cb04036e413d7', 58, 1, 'authToken', '[]', 0, '2020-09-11 11:53:56', '2020-09-11 11:53:56', '2021-09-11 14:53:56'),
('935d4388cbf7191f55aa818f2e3ad365b1f2db38aa6abd58cb19aa9f5fea28d3e1468b1de1609978', 58, 1, 'authToken', '[]', 0, '2020-09-13 19:59:07', '2020-09-13 19:59:07', '2021-09-13 22:59:07'),
('9433dd0250cd6feb435a23f7ec49e1074760293bdf8ae47d262080a5ecae568ce3cf0d1fb0206321', 58, 1, 'authToken', '[]', 0, '2020-09-02 07:56:32', '2020-09-02 07:56:32', '2021-09-02 10:56:32'),
('947a8f3bf4ecba469c0caca40138e77e4dad4b859ecf87e5ccda28a9b642508bce26221bc8cb9ae8', 58, 1, 'authToken', '[]', 0, '2020-09-13 21:03:33', '2020-09-13 21:03:33', '2021-09-14 00:03:33'),
('952f54322392cc4cdec2fb8faab8bf8c25dc60bd06a76332f5302aa3661372fb0253089ebefff7d5', 22, 1, 'authToken', '[]', 0, '2020-07-07 14:24:03', '2020-07-07 14:24:03', '2021-07-07 17:24:03'),
('95c47cc6bd3504ebf1cfe798a414b6c6896ab67e6fe1c2be4ff8e82faa136953a73586ac92e12784', 58, 1, 'authToken', '[]', 0, '2020-09-07 15:49:28', '2020-09-07 15:49:28', '2021-09-07 18:49:28'),
('95fbf916b1df7f00f697441c67a00ffb66ad884a960aa959b0ea21d4a17d8030d4791efd53025ddc', 58, 1, 'authToken', '[]', 0, '2020-09-05 15:45:50', '2020-09-05 15:45:50', '2021-09-05 18:45:50'),
('95fc482e055c7f850cd37152d92761f7f8c0e443d838b19ec7a48367b0f46f83de2d50c167333606', 28, 1, 'authToken', '[]', 0, '2020-07-25 15:27:56', '2020-07-25 15:27:56', '2021-07-25 18:27:56'),
('9609034dc2d9968601b5905411a9fa710dea9082771956cb9647c6123729b47b2f0fdd4b1a924e52', 28, 1, 'authToken', '[]', 0, '2020-07-25 15:07:02', '2020-07-25 15:07:02', '2021-07-25 18:07:02'),
('9686da362bbf7ae58f3b7936566c6ac286766ff126e40f1d86d7d77b02999de9c0c73d9c0ed3c870', 58, 1, 'authToken', '[]', 0, '2020-09-14 15:22:03', '2020-09-14 15:22:03', '2021-09-14 18:22:03'),
('96b96df311404cbfab8e8fa8abcb02b2963646ffa9cadebd20ed58f055f002939240932cc70d53a6', 58, 1, 'authToken', '[]', 0, '2020-09-12 07:44:17', '2020-09-12 07:44:17', '2021-09-12 10:44:17'),
('971b088c4748244d5cef9a13108a30c30a0f4f3ca4589bdf84241c95452fd205959bfdcbb53907fd', 58, 1, 'authToken', '[]', 0, '2020-09-13 23:41:10', '2020-09-13 23:41:10', '2021-09-14 02:41:10'),
('97f56dc3bc54571116ab2bf3f7ad42cb2a6862e89f6ba3f72740bfa4dcf92608fa3a745d0e44e5cd', 58, 1, 'authToken', '[]', 0, '2020-09-14 00:51:18', '2020-09-14 00:51:18', '2021-09-14 03:51:18'),
('97f7b07d4710d1265808e52faf9429ccf209e3597ae99b76075c150a42c909b5d8f8b9d99e5075a9', 28, 1, 'authToken', '[]', 0, '2020-07-27 15:50:39', '2020-07-27 15:50:39', '2021-07-27 18:50:39'),
('98a797f6515194d3e21702a48ef5749b24560ffe6503890914ae303437ff13a10fe72a850fe12c48', 58, 1, 'authToken', '[]', 0, '2020-08-26 15:30:41', '2020-08-26 15:30:41', '2021-08-26 18:30:41'),
('98bb09379bb0b5fad68d073eca51c5374ebb2f37ac37609f811358e7f2138e2bf3baab14a28e80c9', 58, 1, 'authToken', '[]', 0, '2020-09-13 16:37:10', '2020-09-13 16:37:10', '2021-09-13 19:37:10'),
('99631c0dcafcaeb60e056ae54b50fa55824c47285347837eb36c9294861f52898f1cf8cf3fc5466d', 58, 1, 'authToken', '[]', 0, '2020-09-05 08:38:36', '2020-09-05 08:38:36', '2021-09-05 11:38:36'),
('99cf764818bc6c11cc0a98a37c40ce6b52bbf01a5cf1e2cc61950c8851034b50c607ec9fbf84ec4f', 20, 1, 'authToken', '[]', 0, '2020-06-17 16:05:41', '2020-06-17 16:05:41', '2021-06-17 19:05:41'),
('9a75ebf6547cc0c3f207fc6ddc430c49c28b356488a86361a3987fe37604902437075255f47e7a57', 24, 1, 'authToken', '[]', 0, '2020-06-24 09:49:22', '2020-06-24 09:49:22', '2021-06-24 12:49:22'),
('9ac1fad037289489d1f1cac0215969354ee4622d1fcb9ff61a9fe78501ac76bd3c1580383b83b33e', 58, 1, 'authToken', '[]', 0, '2020-08-29 17:35:23', '2020-08-29 17:35:23', '2021-08-29 20:35:23'),
('9b68f1162fe43ec20a4da051500e40da30086d1dfdb5c185bf90b90c9912cd64e63d188d3e7fbb3f', 24, 1, 'authToken', '[]', 0, '2020-06-25 14:06:57', '2020-06-25 14:06:57', '2021-06-25 17:06:57'),
('9b894537348d4bc3feb009793f195cd8c34c7a63f6144878d4e9db9ec1d94c88d299337cb71ce16b', 28, 1, 'authToken', '[]', 0, '2020-07-26 22:38:26', '2020-07-26 22:38:26', '2021-07-27 01:38:26'),
('9c20ac26672491df51ad8d91ab537e8f0aa2980b561e58bce7949334550eda555df2fac05495a186', 58, 1, 'authToken', '[]', 0, '2020-09-14 20:00:34', '2020-09-14 20:00:34', '2021-09-14 23:00:34'),
('9ca802d34a323962c8bf0704b24973267aa3dd599a4d086b21cad7c598f045e4f9bc25d684b7b5bf', 58, 1, 'authToken', '[]', 0, '2020-09-12 22:11:30', '2020-09-12 22:11:30', '2021-09-13 01:11:30'),
('9dc8236c61f92765b661ff173508490ff1685c7230ec50ecc1574486f166e2097ddf873f2a0f2468', 28, 1, 'authToken', '[]', 0, '2020-07-27 15:57:44', '2020-07-27 15:57:44', '2021-07-27 18:57:44'),
('9f59b1ed4e02bdc1e3be9897fd961ddf633d90771b8d4e34b59f02a1410f0958944c71824bd34721', 67, 1, 'authToken', '[]', 0, '2020-09-13 16:38:36', '2020-09-13 16:38:36', '2021-09-13 19:38:36'),
('9f693dc2f83a7d3987693f546ee3925d0f8183dfc3de1cf4b065dc73bbcc1816c0310b858e2ce6e0', 58, 1, 'authToken', '[]', 0, '2020-09-14 19:16:49', '2020-09-14 19:16:49', '2021-09-14 22:16:49'),
('a03ad27ed523a1fcc322eee525122d29325b2fb836529de3823590b4bf3f0b586757d32832cac191', 28, 1, 'authToken', '[]', 0, '2020-07-25 15:10:31', '2020-07-25 15:10:31', '2021-07-25 18:10:31'),
('a05ab8bc0b8c6f458a735a692b19d4633dabdf5eec4b0c45afebfec281b84d37bd96ad0c6b28b434', 28, 1, 'authToken', '[]', 0, '2020-08-07 19:38:42', '2020-08-07 19:38:42', '2021-08-07 22:38:42'),
('a0f7a6380b34e7e737f6f66ea78be767490fdeef49060daf67698559ee93d426e7073ec2574d3a33', 58, 1, 'authToken', '[]', 0, '2020-08-27 17:39:01', '2020-08-27 17:39:01', '2021-08-27 20:39:01'),
('a1563931dc3fd25339049971b3231fd68f21605c8f2fbd53f52bb3ed74bee80ee5dc5720a7e0879b', 58, 1, 'authToken', '[]', 0, '2020-09-10 06:42:26', '2020-09-10 06:42:26', '2021-09-10 09:42:26'),
('a19e56f763f441792ee8f7daaaf028052e3e003365d63b54ebd70150786f2f788e411dee4909f0d6', 5, 1, 'authToken', '[]', 0, '2020-06-24 08:05:01', '2020-06-24 08:05:01', '2021-06-24 11:05:01'),
('a1ad71a9acabfd2c1ebbc54bb629d335931e9786e576a3f933f0d84534a4603fb20a130de4864c83', 28, 1, 'authToken', '[]', 0, '2020-07-22 09:23:10', '2020-07-22 09:23:10', '2021-07-22 12:23:10'),
('a33ee651e8af8b07d172acaf27aa27a78a33b4d8ede7f918b0638df3bffd40c4804c21857cc605c5', 28, 1, 'authToken', '[]', 0, '2020-07-21 14:01:54', '2020-07-21 14:01:54', '2021-07-21 17:01:54'),
('a35a05348910ece2953fac80d1ec4a44ff8e7f5b7798b802d1f78fe4cca71cb646947e0736fe17f5', 58, 1, 'authToken', '[]', 0, '2020-09-05 21:09:19', '2020-09-05 21:09:19', '2021-09-06 00:09:19'),
('a4204a3f39b2a58259727df62c04d8b7d3e23a86857f50126dfd1b47fc2772c912891405f9709209', 58, 1, 'authToken', '[]', 0, '2020-09-13 21:37:42', '2020-09-13 21:37:42', '2021-09-14 00:37:42'),
('a51d954db02204dd2f355c9713f37c3fcdd1521e89c73f13fbef95c17a35786d57ce11b1a7417880', 58, 1, 'authToken', '[]', 0, '2020-08-26 16:03:18', '2020-08-26 16:03:18', '2021-08-26 19:03:18'),
('a56776fe21abe39be73c21f90f7f4ac7985b52cc2fb03ea8e3dcf413a21aba06f654fb9d94530219', 56, 1, 'authToken', '[]', 0, '2020-08-26 16:38:37', '2020-08-26 16:38:37', '2021-08-26 19:38:37'),
('a5cc02158ef24c91699034164266ccc18a6b64c2f329235f205278b3c139925a363063d76da3814c', 58, 1, 'authToken', '[]', 0, '2020-08-26 14:32:23', '2020-08-26 14:32:23', '2021-08-26 17:32:23'),
('a76dd43cfc9de229fc08607b5c20580474d9432cb18c741d1de9a07fd0fd4210ce4c6d651c30bb56', 58, 1, 'authToken', '[]', 0, '2020-08-29 15:07:01', '2020-08-29 15:07:01', '2021-08-29 18:07:01'),
('a7d3be0b6b167543f3dda0a56bd6ea3966df43e037102e896f400933d10b47e3778adb01de95fd76', 58, 1, 'authToken', '[]', 0, '2020-09-12 07:46:40', '2020-09-12 07:46:40', '2021-09-12 10:46:40'),
('a8e0d1d3b2b249128ef43e614c6f76bd443b62a2cd2db1cac817c7b1731dffb81b60099fd91f5f3c', 58, 1, 'authToken', '[]', 0, '2020-09-14 15:54:58', '2020-09-14 15:54:58', '2021-09-14 18:54:58'),
('a9cb038d73fd8d3dd71b4727db711cf247f67f57b62d25b21001162db69f53a445141b8163b4b42f', 58, 1, 'authToken', '[]', 0, '2020-09-11 12:28:14', '2020-09-11 12:28:14', '2021-09-11 15:28:14'),
('aa59498498f57c7ef8c5c873204c79c91f0ee035b9a9e227d30bd02efbba37b07239b3d29645a8eb', 58, 1, 'authToken', '[]', 0, '2020-09-13 15:04:09', '2020-09-13 15:04:09', '2021-09-13 18:04:09'),
('ab6ff03a8c534293aa291b19c11959da9c6aeaca69b360c1e7e2d0a692e28d8f195ec59eea4675c9', 58, 1, 'authToken', '[]', 0, '2020-09-12 16:55:27', '2020-09-12 16:55:27', '2021-09-12 19:55:27'),
('abb443b535d9f1799d85df8727be9a1a62a40ef1ffb3140a83ec75f0fbf37d8d62b4a4fc740df290', 56, 1, 'authToken', '[]', 0, '2020-08-19 06:14:05', '2020-08-19 06:14:05', '2021-08-19 09:14:05'),
('ac192d7be9ca21056e770fd581609821225b268f421359dd168f849fcb181dd80d33d57853219d47', 58, 1, 'authToken', '[]', 0, '2020-09-05 15:12:28', '2020-09-05 15:12:28', '2021-09-05 18:12:28'),
('ae1288a249445f829e3c43f06a8f1c255aeda9b5c3e13235d17ab4d723e4b54cffd1c85ba5a396ef', 58, 1, 'authToken', '[]', 0, '2020-09-13 14:55:07', '2020-09-13 14:55:07', '2021-09-13 17:55:07'),
('ae362b6652408d2012ee2e6144d468c2c68becd9a674d645cecf38651760801970168e9bea4b3d5d', 28, 1, 'authToken', '[]', 0, '2020-07-23 08:40:02', '2020-07-23 08:40:02', '2021-07-23 11:40:02'),
('af1d888c1a451303557fa5e7ef592f24dcae84c74b884fad468eb1cd7a8d8adace6f172d9e12ab4c', 58, 1, 'authToken', '[]', 0, '2020-09-10 06:40:28', '2020-09-10 06:40:28', '2021-09-10 09:40:28'),
('af4fdd8aa1a26a311990723943e6483239947ebf496f0babf7ac8f206cb0b824aba16c58c40113f4', 28, 1, 'authToken', '[]', 0, '2020-07-28 09:30:55', '2020-07-28 09:30:55', '2021-07-28 12:30:55'),
('b0dbff49b34a7c8e37941260fcaccc09f9136c188d417c03ee4d842c4cd0ca04d6c519fc16a0f768', 58, 1, 'authToken', '[]', 0, '2020-08-26 15:50:31', '2020-08-26 15:50:31', '2021-08-26 18:50:31'),
('b11a8157de9f0bdabc00daba52cc5fe7352fbc95b3f10b82d5674fb4f71b954d55eb51daf5a1c157', 58, 1, 'authToken', '[]', 0, '2020-09-07 16:03:10', '2020-09-07 16:03:10', '2021-09-07 19:03:10'),
('b148f8d90ca2197d8813aa1b5c270e2e6465331c6312701658d989f956d74e7154f1b00fc3dfa104', 28, 1, 'authToken', '[]', 0, '2020-07-21 15:52:31', '2020-07-21 15:52:31', '2021-07-21 18:52:31'),
('b19ae68f7d03e56e1fd263f972474fb7f7f887f6f20a7eaf008faa0a7bd5ce144479f5c19abc8937', 58, 1, 'authToken', '[]', 0, '2020-09-01 07:28:52', '2020-09-01 07:28:52', '2021-09-01 10:28:52'),
('b1cf65e59e17ad70bc266cec5033aabc8b3f66e16545a4f994fb0ffa23f8d05db2c9a7b17b7eadff', 58, 1, 'authToken', '[]', 0, '2020-08-26 16:02:24', '2020-08-26 16:02:24', '2021-08-26 19:02:24'),
('b1f1a37366cfb547d13c21a2e8c2b37b0aa464886bc5535aa43f32e2b9b29bed19fd58d96db07e0d', 28, 1, 'authToken', '[]', 0, '2020-07-28 22:06:00', '2020-07-28 22:06:00', '2021-07-29 01:06:00'),
('b22930d2148277f434632653fd8e885425024b45be5c84a40a721bc0912a0373034229f5e150777c', 58, 1, 'authToken', '[]', 0, '2020-09-05 21:13:23', '2020-09-05 21:13:23', '2021-09-06 00:13:23'),
('b295b33147721d079978c1b0f147bb7a8d6632e0040c7c2bbd631312e8fb763fcbf674921ea19b32', 5, 1, 'authToken', '[]', 0, '2020-06-22 02:04:06', '2020-06-22 02:04:06', '2021-06-22 05:04:06'),
('b2bbf6f4f27b42ae63c5ef78571aa1630c7aed4e2a265c89ca67ec79d72609cce525480c1181cd2d', 58, 1, 'authToken', '[]', 0, '2020-08-31 08:58:26', '2020-08-31 08:58:26', '2021-08-31 11:58:26'),
('b356429b60a8a872be86a0dc44190df6ae7dd395f4157b8e16954fadd7856eac4460fc2f7995fa14', 5, 1, 'authToken', '[]', 0, '2020-06-10 13:25:02', '2020-06-10 13:25:02', '2021-06-10 16:25:02'),
('b3874b0b2b75d568d29caec523e9860ff26a1646ab744d04ec8672b9f6d9a819cabdb1bd32f1d0f1', 22, 1, 'authToken', '[]', 0, '2020-07-24 15:38:21', '2020-07-24 15:38:21', '2021-07-24 18:38:21'),
('b44c8c6c6ef7ccdd2b68f2034cacd8120ed9f102057c380b170d1a8c60ec68cac79c0c92a4b5d95c', 58, 1, 'authToken', '[]', 0, '2020-09-05 14:51:12', '2020-09-05 14:51:12', '2021-09-05 17:51:12'),
('b57403ac665743ebd2592095fe673dbf26b4e30e140988f8907e1067ff86db726ed51f470d579c3c', 58, 1, 'authToken', '[]', 0, '2020-09-07 16:09:12', '2020-09-07 16:09:12', '2021-09-07 19:09:12'),
('b5bbeed7dcbd9efa6d973ad753d8f04fdc2172b63e43a45791025087113d954a22801641258986da', 58, 1, 'authToken', '[]', 0, '2020-08-26 15:46:53', '2020-08-26 15:46:53', '2021-08-26 18:46:53'),
('b61186f5ff79192053080a8708555607a58f9a58f1a4a3320e29e02da6865a794cddf6de224e7bbf', 28, 1, 'authToken', '[]', 0, '2020-07-22 09:53:18', '2020-07-22 09:53:18', '2021-07-22 12:53:18'),
('b78f2e94b7729b38dad2515bed4ee1e90210766943e6036edece11bded760c44cdc2a3545925fd8d', 28, 1, 'authToken', '[]', 0, '2020-07-22 09:56:51', '2020-07-22 09:56:51', '2021-07-22 12:56:51'),
('b7ba583013f261c83762ba5dbbe71a418fd9e68827f771a0f7999cba41a666a46f58723bfb0ac4ce', 58, 1, 'authToken', '[]', 0, '2020-09-09 17:52:00', '2020-09-09 17:52:00', '2021-09-09 20:52:00'),
('b7da2dc34a2419718feab44da741df972044914d97ff69835e66896f3745262fd8d610ba56ae360e', 58, 1, 'authToken', '[]', 0, '2020-09-13 22:38:58', '2020-09-13 22:38:58', '2021-09-14 01:38:58'),
('b8190698504eb35aef1e88ca14cb68d56a023d996780c249ac08582aa276078d777de611af7bef4f', 32, 1, 'authToken', '[]', 0, '2020-07-25 13:23:30', '2020-07-25 13:23:30', '2021-07-25 16:23:30'),
('b8e300c9d492806e9f978ad6260597e116c1e84a087872087b703d519c718cbb041ca16d972d7b67', 5, 1, 'authToken', '[]', 0, '2020-06-22 02:04:48', '2020-06-22 02:04:48', '2021-06-22 05:04:48'),
('b98fef8361730d756903c36e1ae146782af48b3810fd2fdde815195fda2f795ac42562f64538f07a', 58, 1, 'authToken', '[]', 0, '2020-09-14 00:50:38', '2020-09-14 00:50:38', '2021-09-14 03:50:38'),
('ba0900553cd1e3f664788d4ebeea44fe55ca7ff22eec3113cfb5ffea203e3ca5f00acffa05050f14', 58, 1, 'authToken', '[]', 0, '2020-09-12 06:35:17', '2020-09-12 06:35:17', '2021-09-12 09:35:17'),
('bb0c644219c3a9736737225884be054ca123b448d74b1d4f082cb7c68fa1769bea62da219b35ffbb', 58, 1, 'authToken', '[]', 0, '2020-09-14 01:05:07', '2020-09-14 01:05:07', '2021-09-14 04:05:07'),
('bb7d3aedf1c504ae34211f136a112906a0956068d88ba1b974e10cfad7db7897ec8a105ea3956eac', 58, 1, 'authToken', '[]', 0, '2020-09-11 21:07:58', '2020-09-11 21:07:58', '2021-09-12 00:07:58'),
('bb94ae6875bea228f735d29513f17b6031e9629a4c3b375acf5396ad37a519a1d813531f59d2f7ec', 58, 1, 'authToken', '[]', 0, '2020-08-29 15:01:51', '2020-08-29 15:01:51', '2021-08-29 18:01:51'),
('bba26cf86c7b14b4900072c2c47a4930337808c8998195e51d6458bbfec58e6e4264563cc520b2c3', 28, 1, 'authToken', '[]', 0, '2020-07-25 09:41:44', '2020-07-25 09:41:44', '2021-07-25 12:41:44'),
('bce5d370895366b89976842879e2c4e5e290c5d875807bc54054aa5c7faae9c83f8bfbc48a9a8128', 67, 1, 'authToken', '[]', 0, '2020-09-13 11:49:46', '2020-09-13 11:49:46', '2021-09-13 14:49:46'),
('bda6a2d6e180c587603155599c102298b4ad6c85ae7fbd36a43e12a2f3a33501c78bd5931362be05', 58, 1, 'authToken', '[]', 0, '2020-09-15 16:47:28', '2020-09-15 16:47:28', '2021-09-15 19:47:28'),
('be5c94a8cbc06e6239a89d65051ae9e900b2024f4b5030f5ac2f98090ae2d4e488e88b244212d3f5', 58, 1, 'authToken', '[]', 0, '2020-09-13 17:39:53', '2020-09-13 17:39:53', '2021-09-13 20:39:53'),
('bef7410df443d26c096db24cb4612ed08ce387bfa078ff884cf4d746c8a499d5cae734358355998f', 58, 1, 'authToken', '[]', 0, '2020-09-13 17:07:50', '2020-09-13 17:07:50', '2021-09-13 20:07:50'),
('bef887cbf587369c7455aa6a19791f7a7b51adb461dc60124debbd605c3a8c87708cd9f36bb761f5', 28, 1, 'authToken', '[]', 0, '2020-07-24 06:07:06', '2020-07-24 06:07:06', '2021-07-24 09:07:06'),
('bf342374b8f3dcccac9472e9e4e51367bac0fced640376df7f2d76887a60469d2556b736fbf42b13', 58, 1, 'authToken', '[]', 0, '2020-09-13 22:56:25', '2020-09-13 22:56:25', '2021-09-14 01:56:25'),
('bf7555c1663062678e4b84cb775f3127c03827711f5d5d052995017eaca6b7a489e41d2bdf90df4f', 22, 1, 'authToken', '[]', 0, '2020-07-25 13:28:55', '2020-07-25 13:28:55', '2021-07-25 16:28:55'),
('c0b50e85c86fea0f0e1fa2a2319806f603e8de6ced7d923079682b87bc8eca1c8de5b55cda2abd46', 5, 1, 'authToken', '[]', 0, '2020-06-13 17:51:19', '2020-06-13 17:51:19', '2021-06-13 20:51:19'),
('c1b7c0288400a89e63ad24560013a012a61965b8f101f78ce4037ea8e30061db7c7d3b8b1e2e70b5', 58, 1, 'authToken', '[]', 0, '2020-09-13 19:46:10', '2020-09-13 19:46:10', '2021-09-13 22:46:10'),
('c302b0065b741dfe3bf4b97eb997be01e512f448aa5299c6ec486cef3c1bece963af773b5922e459', 1, 1, 'authToken', '[]', 0, '2020-06-09 05:46:45', '2020-06-09 05:46:45', '2021-06-09 08:46:45'),
('c3851c1f1804c82b1c3df6b5d87d9d3ce27a8f0f37dfea3abf984ead660f073dde51b456c085c9ee', 28, 1, 'authToken', '[]', 0, '2020-07-28 22:26:37', '2020-07-28 22:26:37', '2021-07-29 01:26:37'),
('c3cc304f28fac3a629124c02575d6fe8086cf82c498fc303eca1954574cf42d8c6a957d2f54db1b9', 5, 1, 'authToken', '[]', 0, '2020-06-24 08:14:16', '2020-06-24 08:14:16', '2021-06-24 11:14:16'),
('c3fc78964af39d335cb3ca8dd1f49560d8ab4b89fbf36c86333e55e4868bf0743fd6051a8df08a6e', 58, 1, 'authToken', '[]', 0, '2020-09-07 17:17:03', '2020-09-07 17:17:03', '2021-09-07 20:17:03'),
('c401203b43c85f06a6825cb4e8e76f72b119532aaaa95759404b08dc4d0633c90c56cbae6987219d', 28, 1, 'authToken', '[]', 0, '2020-07-29 06:52:27', '2020-07-29 06:52:27', '2021-07-29 09:52:27'),
('c45bd0d134c8c92283178be46bcfa9d16edcdb18fc264b16fafe4f648f49450d76d0c6d48ee81a6b', 58, 1, 'authToken', '[]', 0, '2020-09-11 12:06:22', '2020-09-11 12:06:22', '2021-09-11 15:06:22'),
('c526a8bb1a3642ceb8b46d42a758b703eef4f6e6b1f4c68ac2c4c1d8b4588d905120f32d48c4c7f8', 58, 1, 'authToken', '[]', 0, '2020-09-12 06:40:05', '2020-09-12 06:40:05', '2021-09-12 09:40:05'),
('c556128f6d9e2ac908c3aa9e6e5460d1d2e5e434509179996f56b19d5d51d045ebcf77dd4aa7c924', 5, 1, 'authToken', '[]', 0, '2020-06-21 12:50:05', '2020-06-21 12:50:05', '2021-06-21 15:50:05'),
('c569df7ec7c0511d32b492b9c5dbea3afe564adc1cc51bbdc021507ed511187f44638be9565f9a11', 58, 1, 'authToken', '[]', 0, '2020-09-11 14:12:31', '2020-09-11 14:12:31', '2021-09-11 17:12:31'),
('c6047b14449582d97a8b838400fecf5bef4159cd3cd7960a1d4f11eff4a1009ef1a18d07e29a1345', 28, 1, 'authToken', '[]', 0, '2020-07-08 06:21:24', '2020-07-08 06:21:24', '2021-07-08 09:21:24'),
('c6ef6c02c8ff695ca65c23f5953c12d1085bb6efc20c866fb9b084add38720c7444f953563cf27c0', 28, 1, 'authToken', '[]', 0, '2020-07-26 23:00:57', '2020-07-26 23:00:57', '2021-07-27 02:00:57'),
('c75edad8aff6c9a4998f482607af8047d7e0a8d395a586138a1cec97e62b5a3f9603a21ec4abf377', 58, 1, 'authToken', '[]', 0, '2020-08-26 15:06:25', '2020-08-26 15:06:25', '2021-08-26 18:06:25'),
('c8d5f0edf9e821bfebe95931286aca0a8a72678a5bc2485014653c9daa4f81bc4acbaecf4305afac', 58, 1, 'authToken', '[]', 0, '2020-09-12 09:30:46', '2020-09-12 09:30:46', '2021-09-12 12:30:46'),
('c8e55a7370c9f4453b95277853b5144816bb2f781029e81f545ead6e74d1b942c379a9571e98fc11', 58, 1, 'authToken', '[]', 0, '2020-08-26 16:02:56', '2020-08-26 16:02:56', '2021-08-26 19:02:56'),
('c92edfbf787e20794bc81b81550b46e9cf9854814a3faeb12e1f5dbf86b7056031f07e0afd24f421', 5, 1, 'authToken', '[]', 0, '2020-06-23 16:16:32', '2020-06-23 16:16:32', '2021-06-23 19:16:32'),
('ca6ff1bb70e91064f84038391533f389d3c452dd5fd5ef8dc05f3b57f7522c81ef10f6f780f4fa8f', 58, 1, 'authToken', '[]', 0, '2020-09-11 19:11:28', '2020-09-11 19:11:28', '2021-09-11 22:11:28'),
('caae4ca73185eeb8f0ee74c5e3053bd767f06ca2876137e4a1f543114b2992d8e3faf65ec550b1b9', 1, 1, 'authToken', '[]', 0, '2020-06-09 05:13:13', '2020-06-09 05:13:13', '2021-06-09 08:13:13'),
('cb0b82aed56081d539ea0e777440c3812a8d03621d850fba58d8e9abd3bae85405e0e5ddd9cc5929', 28, 1, 'authToken', '[]', 0, '2020-07-26 19:52:06', '2020-07-26 19:52:06', '2021-07-26 22:52:06'),
('ccaf86f8a8d192297a135ca702e057fc31e61ada1f41f5a48d7203c8b4aaf5ab315e4a87c4a00c3c', 28, 1, 'authToken', '[]', 0, '2020-07-26 22:56:18', '2020-07-26 22:56:18', '2021-07-27 01:56:18'),
('ccb8aa957f703dfe59c726e9d0d657663b728c130c44e25174e80bf5c2e06d345e4d196f77d0b2c4', 5, 1, 'authToken', '[]', 0, '2020-06-22 02:08:21', '2020-06-22 02:08:21', '2021-06-22 05:08:21'),
('cdd5a962225648f33855d31bec837a6a3c2e206793689ffaa9e4f6734b8e0d144c814a81d0a7bd07', 58, 1, 'authToken', '[]', 0, '2020-09-13 15:16:21', '2020-09-13 15:16:21', '2021-09-13 18:16:21'),
('ce54da94facd79a0fb4bd0ba9e2f73294379a6827f17e14dbfb30bed7b686ca45cd9bc9808e8fa49', 28, 1, 'authToken', '[]', 0, '2020-07-22 11:46:11', '2020-07-22 11:46:11', '2021-07-22 14:46:11'),
('cfb5df8613fc72071d54e4260123cd0ec53c638ab5b2254dedf12b06485447d5b2603c3ca984bd8f', 58, 1, 'authToken', '[]', 0, '2020-08-31 08:16:09', '2020-08-31 08:16:09', '2021-08-31 11:16:09'),
('cffe28aa1c84111394589c72e2b1481de02fb2efef2eb62a825779f56e313b0b066b44353388ef3a', 5, 1, 'authToken', '[]', 0, '2020-06-23 16:25:42', '2020-06-23 16:25:42', '2021-06-23 19:25:42'),
('d0310a7782b0a253f5ba9a01b62724ef5741530d1f67fa0a84a4ba61c001779a58025cbd035af3c3', 28, 1, 'authToken', '[]', 0, '2020-07-21 15:53:00', '2020-07-21 15:53:00', '2021-07-21 18:53:00'),
('d0b12a8bc8e1fba98770d0745ff2408ea48dcb149b206de396ef31e0f02cd1020a282821b877f0e7', 28, 1, 'authToken', '[]', 0, '2020-07-25 09:14:01', '2020-07-25 09:14:01', '2021-07-25 12:14:01'),
('d0bafce4ba57369e9942fa398cd3c3ab1cd7269b5284f1b7dbd3050b99ba9bf3ff325a1c3dd473f2', 58, 1, 'authToken', '[]', 0, '2020-09-10 06:04:59', '2020-09-10 06:04:59', '2021-09-10 09:04:59'),
('d0d6fd9bd24c81d3ed4694cdf026091ab2ae8259ea5692e470bf032f5bc27c627728d5ea8ff674dc', 58, 1, 'authToken', '[]', 0, '2020-09-12 05:57:31', '2020-09-12 05:57:31', '2021-09-12 08:57:31'),
('d16365f2ccf00a9ce110b4e3c19250ee13feff44d020958f5db13f2b8cd082cca4c6870d99ef9c59', 28, 1, 'authToken', '[]', 0, '2020-07-26 22:54:47', '2020-07-26 22:54:47', '2021-07-27 01:54:47'),
('d17a1ffa31bf65a91698d9044d561fcdfae6f91433e35257e93d4d73d80f8bb578e40ffbb39c6d7f', 57, 1, 'authToken', '[]', 0, '2020-08-19 10:52:38', '2020-08-19 10:52:38', '2021-08-19 13:52:38'),
('d1800ca81e176988fc32dba3374f0331c98b302f67425fc93fbcee7e6cc41f1949a3b610abd59af6', 58, 1, 'authToken', '[]', 0, '2020-08-28 13:03:21', '2020-08-28 13:03:21', '2021-08-28 16:03:21'),
('d22b8d40017c5e7591bb5e4fb737fbac1d7122c6ab2cce64c23c8cf4c2db65d68ad1900696054d44', 22, 1, 'authToken', '[]', 0, '2020-07-11 18:19:22', '2020-07-11 18:19:22', '2021-07-11 21:19:22'),
('d2bf50738835a95cb6164f61c7f5f47636c9fcf770475a74f406b348d5508c1e84c89bc97c98e52b', 1, 1, 'authToken', '[]', 0, '2020-06-09 05:13:23', '2020-06-09 05:13:23', '2021-06-09 08:13:23'),
('d2fdb4c43680691465bfda298584efeaec1cbae7bac63a08ea5018fd7583bf67d866916b5fc4f541', 22, 1, 'authToken', '[]', 0, '2020-07-01 05:37:38', '2020-07-01 05:37:38', '2021-07-01 08:37:38'),
('d3438df6b30c002517dd7a2bb94d3be31a4621586391d2f2730172d961eb719720ea4c6c49c8b0fe', 28, 1, 'authToken', '[]', 0, '2020-08-08 14:21:50', '2020-08-08 14:21:50', '2021-08-08 17:21:50'),
('d345d79387d02b11f7393d825cad3ec3b4a4714aef882ed5bd4659a0a639fbfb25aca8aabfc11c1f', 58, 1, 'authToken', '[]', 0, '2020-09-01 03:34:15', '2020-09-01 03:34:15', '2021-09-01 06:34:15'),
('d380c9e0f5eda7f9ced26b159652f5df60aad157a322e9a51e9a469d08fc13579907f6b011f199c0', 28, 1, 'authToken', '[]', 0, '2020-07-17 15:19:37', '2020-07-17 15:19:37', '2021-07-17 18:19:37'),
('d3858809c952e4a3c55053a758aa6cf154431f442371c970167e744a7bbd788d076e3078870efcc8', 58, 1, 'authToken', '[]', 0, '2020-08-28 09:45:38', '2020-08-28 09:45:38', '2021-08-28 12:45:38'),
('d41acf770fa5c4cf7489b596b14e72dcf64d77a1533e13daa345b2c3b457f99282ae18bb8422b6ac', 58, 1, 'authToken', '[]', 0, '2020-09-13 17:54:45', '2020-09-13 17:54:45', '2021-09-13 20:54:45'),
('d513dded758d9b53413bde186bdcc20f393d6dcfcce6a1626abb7714a1be98631f33f47cdbdf39a5', 28, 1, 'authToken', '[]', 0, '2020-07-25 11:21:46', '2020-07-25 11:21:46', '2021-07-25 14:21:46'),
('d5381d95368de64428462c8116bcd23dc1f9ef680c244e5605075a43f825e1fa98b8cde93b8419c8', 58, 1, 'authToken', '[]', 0, '2020-08-29 17:45:56', '2020-08-29 17:45:56', '2021-08-29 20:45:56'),
('d5511105b312eaeea08b883ff219b19afdd2a7bb2967f77b200029e2c0fc2f9a0b247274d2c317ef', 58, 1, 'authToken', '[]', 0, '2020-09-10 07:18:50', '2020-09-10 07:18:50', '2021-09-10 10:18:50'),
('d577ce371fed1c3979f18aa6cdd0ebb7fe90c955076a2f15c2d55aa56a3d53b94ff7f7d01fb91f2e', 56, 1, 'authToken', '[]', 0, '2020-08-19 06:18:57', '2020-08-19 06:18:57', '2021-08-19 09:18:57'),
('d5990639f5a96093c92dc42e5b8dd3444a1e29447588b83f6cb822024806eb002eb846e7eeb24b1e', 58, 1, 'authToken', '[]', 0, '2020-09-11 10:20:23', '2020-09-11 10:20:23', '2021-09-11 13:20:23'),
('d5af87f5d11abcdd09c30b37c2c5cde7d12c1ac83eea4e41b30adae36e0f42112aa82ce4b4ca1ca3', 1, 1, 'authToken', '[]', 0, '2020-06-10 02:12:30', '2020-06-10 02:12:30', '2021-06-10 05:12:30'),
('d5b904168772790286b935119e6ca24efae30f3380ae937d52a47c563276e7198412eca1aa753356', 58, 1, 'authToken', '[]', 0, '2020-09-10 07:44:34', '2020-09-10 07:44:34', '2021-09-10 10:44:34'),
('d5e4265e35bc405e0f14b48d5113cfa0f2d6c5e4725cb0d6e5e70e92bf24244e730ac2e81e7b77d4', 58, 1, 'authToken', '[]', 0, '2020-08-30 20:50:27', '2020-08-30 20:50:27', '2021-08-30 23:50:27'),
('d71440e62d00632d35e357858d0acd94001dc24f2f0a18d7c86f3a4449ebbd736413919856ca3ee1', 58, 1, 'authToken', '[]', 0, '2020-08-29 14:35:53', '2020-08-29 14:35:53', '2021-08-29 17:35:53'),
('d75cb54808f5c9982663a84970c533c62a4f9a7fe3964e3a9a9ede920132d7d0adfce6e399d2bbaa', 58, 1, 'authToken', '[]', 0, '2020-09-07 17:39:33', '2020-09-07 17:39:33', '2021-09-07 20:39:33'),
('d76067b7b12eae6f7f3cd41ed2d3c9a04c565e6edc87520985afccfb6716535e8835e3fc7829f0bf', 28, 1, 'authToken', '[]', 0, '2020-07-22 10:49:04', '2020-07-22 10:49:04', '2021-07-22 13:49:04'),
('d97486fa58183c1b96a737c4a83488354fb75201423258f4fa165c5145d708695f534229635185a3', 58, 1, 'authToken', '[]', 0, '2020-09-12 16:56:54', '2020-09-12 16:56:54', '2021-09-12 19:56:54'),
('d9f52a737d8bc40d091b8baab0c10a49eeddee25306f3b59ade6ad492fcbc027619fd62d11dec460', 28, 1, 'authToken', '[]', 0, '2020-07-22 08:54:16', '2020-07-22 08:54:16', '2021-07-22 11:54:16'),
('dad15b417f59073baf559608c6663417e9530074d4a7baf67d8aaa80eba678585b996b3ee30b31ca', 58, 1, 'authToken', '[]', 0, '2020-09-01 11:24:36', '2020-09-01 11:24:36', '2021-09-01 14:24:36'),
('daf95f5270b248d8c50807be885998f579e677721cdad007e6e3529be2f7b1db6f87f11dca6b8b3c', 58, 1, 'authToken', '[]', 0, '2020-09-14 01:02:54', '2020-09-14 01:02:54', '2021-09-14 04:02:54'),
('dc1c93b9a7c95bf1b3589fc4c835217b7b87d11f77288290b98748693ccacf7d38becd2af3f3c6b8', 58, 1, 'authToken', '[]', 0, '2020-09-07 17:09:20', '2020-09-07 17:09:20', '2021-09-07 20:09:20'),
('dc6654dc3e324c19334d09ddc21d010c7c4d21c96f527b7dc957bd88e917292a58279028f54b7816', 28, 1, 'authToken', '[]', 0, '2020-07-26 22:55:24', '2020-07-26 22:55:24', '2021-07-27 01:55:24'),
('dd49c4394adb1cccc3f30b232715b84a6fbc6d167ee91208632b47de1bdebeee2c50ba92849f0383', 28, 1, 'authToken', '[]', 0, '2020-07-26 23:03:18', '2020-07-26 23:03:18', '2021-07-27 02:03:18'),
('dd8fcb8ac7f8cc5a5f479fab48c198331f17d409f2669cca9dd14e48dd8ca4e711af1cb4907894ac', 28, 1, 'authToken', '[]', 0, '2020-07-28 16:37:04', '2020-07-28 16:37:04', '2021-07-28 19:37:04'),
('dda7f52b996d5399965e952e0cb5d70f05a6318eed84e008fc0a5e491c8370f713ec1b65d1a31b4f', 58, 1, 'authToken', '[]', 0, '2020-09-13 20:58:24', '2020-09-13 20:58:24', '2021-09-13 23:58:24'),
('ded14c0fffa501dfcb16f2090fa31c87350a5d2d1b3c5ee7493ea1c45a5a781b12227840c7f868c5', 67, 1, 'authToken', '[]', 0, '2020-09-15 11:47:04', '2020-09-15 11:47:04', '2021-09-15 14:47:04'),
('df79427fc7299a8e98688895c922bd16a1c833bab217234b9233eb10f5616133e022752e87707dc9', 28, 1, 'authToken', '[]', 0, '2020-07-21 15:55:36', '2020-07-21 15:55:36', '2021-07-21 18:55:36'),
('dfa67b81638c2d2f36857db78532ecc11f3c3ff83c4cc0af38beff00e282e3fa004237f10823a2c2', 5, 1, 'authToken', '[]', 0, '2020-06-24 08:01:04', '2020-06-24 08:01:04', '2021-06-24 11:01:04'),
('dfef5db0a46a91b9afacadd734dfed460e1dfe7992120bf5897105f6609eb2d8cff8b3304e1c90e3', 58, 1, 'authToken', '[]', 0, '2020-09-07 18:07:15', '2020-09-07 18:07:15', '2021-09-07 21:07:15'),
('dff0efb36276b2068da1cf1646137d646b25e9def7e31b12e1d15d0b3b3ddd1a0482749cbb89b94d', 58, 1, 'authToken', '[]', 0, '2020-08-30 06:15:57', '2020-08-30 06:15:57', '2021-08-30 09:15:57'),
('dff7eb002c34fba3d66628183b0880e280f985170f0e4e3baa8077e6d5d9a051ada9462e5f78d5ee', 58, 1, 'authToken', '[]', 0, '2020-09-12 07:18:11', '2020-09-12 07:18:11', '2021-09-12 10:18:11'),
('e00e6de77c554a3e56e35a59c9823be0b858f99f2291831951a84a2dd884845ea4b054a92d0323e9', 58, 1, 'authToken', '[]', 0, '2020-08-31 07:26:48', '2020-08-31 07:26:48', '2021-08-31 10:26:48'),
('e043b5257d601a8af09d2f312cb591c317ef40a5e5a6cdffb78ef7c93b6741ee8122e2911c90a66c', 5, 1, 'authToken', '[]', 0, '2020-06-21 12:48:20', '2020-06-21 12:48:20', '2021-06-21 15:48:20'),
('e0bd5edbc803751a3057c7fb348d28cbbb7456f0363816dfc0bc55798228513356c7141754f5056a', 58, 1, 'authToken', '[]', 0, '2020-08-31 07:39:30', '2020-08-31 07:39:30', '2021-08-31 10:39:30'),
('e0e09ab01bd0dc066ee3d4e023529e5fd0c9622167cf5d8a8c1a97fb31ef7571896735c32572c267', 58, 1, 'authToken', '[]', 0, '2020-09-13 21:59:10', '2020-09-13 21:59:10', '2021-09-14 00:59:10'),
('e22bdb225f697be7f181de782e1519b6da44dfaf3f800e9a1622798fe83ea72462d4d71f587c77e8', 5, 1, 'authToken', '[]', 0, '2020-06-23 04:57:51', '2020-06-23 04:57:51', '2021-06-23 07:57:51'),
('e35a91d0dc6cffe590310ec1da89eb576848af25d580c85558be79b751f206ebed1c2037a9f0e0e3', 28, 1, 'authToken', '[]', 0, '2020-07-25 15:26:11', '2020-07-25 15:26:11', '2021-07-25 18:26:11'),
('e3c8ee162b39a574771d6414691f27bb6fb826b2d6e829d36673f6a17722918e85d86d6ab9649619', 58, 1, 'authToken', '[]', 0, '2020-08-28 08:25:55', '2020-08-28 08:25:55', '2021-08-28 11:25:55'),
('e3e834f49ac90f9b2cd3a6683178b849d33153485a92154bc4cebec765786ff3d0cbb47dc982c59b', 28, 1, 'authToken', '[]', 0, '2020-08-02 15:22:34', '2020-08-02 15:22:34', '2021-08-02 18:22:34'),
('e3ec8e72a781f0fc71c46238a9b78911dbe965fe89185baad521f3670b6bd64afe306a0a33c4189a', 28, 1, 'authToken', '[]', 0, '2020-08-08 07:21:58', '2020-08-08 07:21:58', '2021-08-08 10:21:58'),
('e41a0895b20af1e54ba960f884bcced1201d344dfe487fe39809548ae1142b8415fc2eba84af8561', 28, 1, 'authToken', '[]', 0, '2020-08-05 08:25:32', '2020-08-05 08:25:32', '2021-08-05 11:25:32'),
('e549da2c863e3a1eb348623c0b17b429d5c4648aa2a3616c94ab1ebcc30c676c17eadcbfe1cd7c24', 67, 1, 'authToken', '[]', 0, '2020-09-13 16:12:11', '2020-09-13 16:12:11', '2021-09-13 19:12:11'),
('e5e8918bbdadc8177a56ca9da5a018bdb268e7eb1b53b341faa3def1cf942691bb6882701a00fad4', 28, 1, 'authToken', '[]', 0, '2020-07-26 22:55:06', '2020-07-26 22:55:06', '2021-07-27 01:55:06'),
('e5f042be8777e7555b2cf322d585592f1acc1ca940d7b660388d330bdd025a55551415dbdf9ad776', 58, 1, 'authToken', '[]', 0, '2020-09-13 15:09:10', '2020-09-13 15:09:10', '2021-09-13 18:09:10'),
('e7592e3ea2ebede4b96e35f393f1d9c6b455b074cef31f37cbb41953e2784a9728bee3aa05f3f974', 58, 1, 'authToken', '[]', 0, '2020-08-26 15:10:31', '2020-08-26 15:10:31', '2021-08-26 18:10:31'),
('e7c785be7932486ae8675773056e69051096221f88f57873b1ab902bbd200891aafeca572a641550', 28, 1, 'authToken', '[]', 0, '2020-07-26 23:01:29', '2020-07-26 23:01:29', '2021-07-27 02:01:29'),
('e9833810fe71282133475e9224f01448fb2cf7c36701d6f6de613aeeb78ef1610a485fdc0c270ac4', 58, 1, 'authToken', '[]', 0, '2020-09-09 19:47:47', '2020-09-09 19:47:47', '2021-09-09 22:47:47'),
('e9c0f03009c110148114307474ab94b9c01f0b3c6951472bbc7114961a6a0df04063257034dee09a', 58, 1, 'authToken', '[]', 0, '2020-09-15 07:21:07', '2020-09-15 07:21:07', '2021-09-15 10:21:07'),
('ea75cd4a4e212c6bccdc66d63cd6c817dc05fabaea48ba8f68e4506b2eb1590a4d6528af1d365da7', 58, 1, 'authToken', '[]', 0, '2020-09-09 20:04:32', '2020-09-09 20:04:32', '2021-09-09 23:04:32'),
('eace01f3f7f4b14487a1c208d022f0276ea42ac1d8b1ce82aa48c4fa5742e62af6a0512661c5d1b6', 28, 1, 'authToken', '[]', 0, '2020-07-21 14:05:37', '2020-07-21 14:05:37', '2021-07-21 17:05:37'),
('ec21c4efa058f3646842ca73e5407e7442876858739779c7001306a950a18376ecb6bd333e118f2f', 28, 1, 'authToken', '[]', 0, '2020-07-21 14:10:43', '2020-07-21 14:10:43', '2021-07-21 17:10:43'),
('ec28011dfb67b3f08f30feb7465e08233de6c745a784e17788dc53d2b73607c44fee8f3c03c0c36c', 58, 1, 'authToken', '[]', 0, '2020-09-13 15:06:21', '2020-09-13 15:06:21', '2021-09-13 18:06:21'),
('ecd7d1b9bd4acffcf4bb4e7075bdb3bb1adb30e33aa6d46bc1f26f093e98e7f85d169598721fe6e1', 58, 1, 'authToken', '[]', 0, '2020-09-12 05:55:29', '2020-09-12 05:55:29', '2021-09-12 08:55:29'),
('ed3310cfaffc42ce6336c7eef3d04a1e10c7bc596b542eed3d0d711128df587050e2e048c4a1d083', 58, 1, 'authToken', '[]', 0, '2020-09-15 18:58:10', '2020-09-15 18:58:10', '2021-09-15 21:58:10'),
('ed737f7f99188b40ed0d5f60ccdc7fb5138b4a4de862d6cf5ee058fc4fcffcf89b95a2d9c752ad34', 58, 1, 'authToken', '[]', 0, '2020-09-14 09:14:59', '2020-09-14 09:14:59', '2021-09-14 12:14:59'),
('edd06465970e3974e8e80697126a6e38fd58b86839943e549b86b89fcc37f7b4cf6823a4378d81b3', 56, 1, 'authToken', '[]', 0, '2020-08-22 08:26:24', '2020-08-22 08:26:24', '2021-08-22 11:26:24'),
('ef79b56a18c3975f62b99ea4380728e1d990d8aa957178c6bad44076349bae2ad53f1e71dc62876a', 58, 1, 'authToken', '[]', 0, '2020-09-07 18:30:32', '2020-09-07 18:30:32', '2021-09-07 21:30:32'),
('efb8f2c31d83c22febe5afcf307af53191da353220e81965748203bdd066320bc2bd7369d19a9164', 58, 1, 'authToken', '[]', 0, '2020-09-14 01:45:02', '2020-09-14 01:45:02', '2021-09-14 04:45:02'),
('f0bf0648edec161a6f90f3e8f51b7f93d69cff998b39c7d98e40378e246ca40cc9c9563647330da0', 58, 1, 'authToken', '[]', 0, '2020-08-27 18:15:52', '2020-08-27 18:15:52', '2021-08-27 21:15:52'),
('f10e314ffb581d494b78a169c3453ef8dbe5bf4d61b02656f44da5d8b91361321a902c76a4f689ba', 28, 1, 'authToken', '[]', 0, '2020-07-26 19:26:07', '2020-07-26 19:26:07', '2021-07-26 22:26:07'),
('f1619e19b213f962a557c7eca15777ae59a0d88827d3d4d51632f95248746ec4a8f6505e914c5b64', 58, 1, 'authToken', '[]', 0, '2020-09-03 10:54:06', '2020-09-03 10:54:06', '2021-09-03 13:54:06'),
('f1a53334ba389b56ef8cd0bbd52808f472b3bb3108e2814f6d9baa17dadc6da50d3e4b9743080aab', 58, 1, 'authToken', '[]', 0, '2020-09-11 10:55:29', '2020-09-11 10:55:29', '2021-09-11 13:55:29'),
('f1e1c15d57e0027b3185cbc325df7a1779ef5bd1f5457a3da75037702f02e54e40634eb76e39085d', 28, 1, 'authToken', '[]', 0, '2020-08-08 07:55:22', '2020-08-08 07:55:22', '2021-08-08 10:55:22'),
('f300355c1555081915e7aa295107122c1d294e371e3f336e697a5ee6eab53484ec40d9bb0a305a4e', 58, 1, 'authToken', '[]', 0, '2020-09-12 07:14:36', '2020-09-12 07:14:36', '2021-09-12 10:14:36'),
('f3537345ed41b7f5088e9d3767129fdc4a94c0a3366d885316499aa26499653102dc423915941d4f', 58, 1, 'authToken', '[]', 0, '2020-09-13 22:04:09', '2020-09-13 22:04:09', '2021-09-14 01:04:09'),
('f35742d16515484b5797475f24e53a41920fb566fdba983f50399cd0022a03921f089e8da45dddd9', 58, 1, 'authToken', '[]', 0, '2020-09-14 01:30:35', '2020-09-14 01:30:35', '2021-09-14 04:30:35'),
('f379744c96312788d63ef13f1e6bce7bbceae37eaa248bee7b70712a69d7c005b0f0e5e64ae568a3', 28, 1, 'authToken', '[]', 0, '2020-07-28 20:22:14', '2020-07-28 20:22:14', '2021-07-28 23:22:14'),
('f3f73daf2a3fcde70f042833f9ec280957e8a70378880df74e87decf595f370690203ce9c813a352', 28, 1, 'authToken', '[]', 0, '2020-07-22 09:50:17', '2020-07-22 09:50:17', '2021-07-22 12:50:17'),
('f47f40e8cd5e53f596958ab9bc5091b8caabe6860af320745f83180c3d011d4c436c83fb242420e8', 58, 1, 'authToken', '[]', 0, '2020-09-15 16:51:50', '2020-09-15 16:51:50', '2021-09-15 19:51:50'),
('f4ecc433c1f0aac896f0fb435fa9541cec83c4137a084361a37f6610928dd40a0ee800e269f27b19', 58, 1, 'authToken', '[]', 0, '2020-09-14 00:13:26', '2020-09-14 00:13:26', '2021-09-14 03:13:26'),
('f54a2fbc742df8a8aac7a61da0c3f83768d8a7ba1543a7429d2594280e192ed08605df8399675a82', 58, 1, 'authToken', '[]', 0, '2020-09-03 10:07:15', '2020-09-03 10:07:15', '2021-09-03 13:07:15'),
('f599efaaf74ffeae2096d96bcbd35cef66ba6e7523cc385bf46a5d844a75f427a6cc3d69bc18e9dd', 28, 1, 'authToken', '[]', 0, '2020-08-02 10:57:55', '2020-08-02 10:57:55', '2021-08-02 13:57:55'),
('f63c3902489e6831a2009b743a7361903f14099c5abebd0cb4669781a0d1b2b3a641bfba8027b956', 58, 1, 'authToken', '[]', 0, '2020-09-10 06:59:56', '2020-09-10 06:59:56', '2021-09-10 09:59:56'),
('f794ca706418bc79b25330c8b562dc816455c63767b03692d6d93a069ce3776c2bfcccdbf8bf1082', 58, 1, 'authToken', '[]', 0, '2020-08-31 07:34:06', '2020-08-31 07:34:06', '2021-08-31 10:34:06'),
('f8012e55556cb723cffcbd4b0791e336d3fa597fd7b6bd1f1d8f11fee8569d454f00996de9a9c630', 58, 1, 'authToken', '[]', 0, '2020-09-15 16:38:42', '2020-09-15 16:38:42', '2021-09-15 19:38:42'),
('f905b60e5dd803307b85baad40c3fa3df9ff2d485001581307c82d57eb548a90b060017276dbf096', 58, 1, 'authToken', '[]', 0, '2020-09-12 16:42:23', '2020-09-12 16:42:23', '2021-09-12 19:42:23'),
('f925f9bea59702bd1e319c3f88444cfa8ed2dbe5700484f3fd1f7246e812d9e42e791ed4a7f867bf', 58, 1, 'authToken', '[]', 0, '2020-09-12 17:36:14', '2020-09-12 17:36:14', '2021-09-12 20:36:14'),
('f92dcd4217c53a8dfa67fce50d1c374a76ab6885b2755daae1efff044c6f99f5e3a13c35424e5f25', 58, 1, 'authToken', '[]', 0, '2020-09-12 07:37:49', '2020-09-12 07:37:49', '2021-09-12 10:37:49'),
('f985dadce4ce7c8c719818f3a473bf03fdaeaaa46a563a8a8acefa69e6b0f7bc223d77850f3e9a89', 58, 1, 'authToken', '[]', 0, '2020-08-29 13:29:04', '2020-08-29 13:29:04', '2021-08-29 16:29:04'),
('f9b8870d94d479e16d8e5ca8a97ef9c030b0b038fb1842de50147bd53177481f6d7ecff98cd17479', 28, 1, 'authToken', '[]', 0, '2020-07-28 22:30:10', '2020-07-28 22:30:10', '2021-07-29 01:30:10'),
('fa678f61a2a07c6de4e1f68976c174e06af41bed62b0025e98eb39f50eabbf0629a4ac5061917dc0', 58, 1, 'authToken', '[]', 0, '2020-08-31 07:38:31', '2020-08-31 07:38:31', '2021-08-31 10:38:31'),
('fab9c214f1fbc80cc9265214ffee9fa0bf615cf8e605fe192f3a36c691cd8c7728a0b95b6f3e2e8e', 28, 1, 'authToken', '[]', 0, '2020-07-26 19:50:27', '2020-07-26 19:50:27', '2021-07-26 22:50:27'),
('faf60c3f8b5d5fcbeefaf4e6912f1a3b7b7ad86aa02bd4405d590714dfec353ac97ed43b1af29361', 28, 1, 'authToken', '[]', 0, '2020-07-22 11:17:23', '2020-07-22 11:17:23', '2021-07-22 14:17:23'),
('fbc4ecee30ed3788ca26438130c2b74e017cd217e8b40ed9abaaf256997ae621779c521b1a1d14a9', 1, 1, 'authToken', '[]', 0, '2020-06-09 05:15:53', '2020-06-09 05:15:53', '2021-06-09 08:15:53'),
('fc49bcd8a2a2be58d84ce2471f33fbc63e2dade8e4ce74a7f4399d77e217a698548e1f08dce300d0', 58, 1, 'authToken', '[]', 0, '2020-09-13 19:53:33', '2020-09-13 19:53:33', '2021-09-13 22:53:33'),
('fc82723bf351e67b79b10df0dc3545d39c834d90c7881bcfb7f0d66d5e77f2a2c6801cf867d19059', 58, 1, 'authToken', '[]', 0, '2020-08-29 14:13:39', '2020-08-29 14:13:39', '2021-08-29 17:13:39'),
('fcd6d6609177bf5f63aca977970db8f36644f4900c2ea6427b0691637280014dbb4e1d2461166d8d', 22, 1, 'authToken', '[]', 0, '2020-07-26 02:16:20', '2020-07-26 02:16:20', '2021-07-26 05:16:20'),
('fd2ce663aeb8ad3214ac494336020978babd6d46efad74d2de13241dfcf5bdb76fe60fb53ff66229', 58, 1, 'authToken', '[]', 0, '2020-08-31 08:35:18', '2020-08-31 08:35:18', '2021-08-31 11:35:18');

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '8SCgP7CyfKx18BJLjXVMLT8BraGsXQfiTVpo6xTd', NULL, 'http://localhost', 1, 0, 0, '2020-06-09 04:02:24', '2020-06-09 04:02:24'),
(2, NULL, 'Laravel Password Grant Client', 'Ti5qTaPiWi2XlPB1k3F3gsRku2BdkzfpbNioglCq', 'users', 'http://localhost', 0, 1, 0, '2020-06-09 04:02:24', '2020-06-09 04:02:24');

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-06-09 04:02:24', '2020-06-09 04:02:24');

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` double(8,2) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'انتظار',
  `status_code` int(11) NOT NULL DEFAULT 0,
  `delivery_cost` float DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'غير محدد',
  `day` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'غير محدد',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'غير محدد',
  `callme` int(11) NOT NULL DEFAULT 0,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `orders`
--

INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `user_id`, `total_price`, `status`, `status_code`, `delivery_cost`, `tax`, `time`, `day`, `address`, `callme`, `notes`) VALUES
(3, '2020-04-20 17:22:40', '2020-08-28 15:02:59', 58, 20.00, 'تم التسليم', 0, NULL, NULL, '', '0', '', 0, NULL),
(5, '2020-04-20 17:25:23', '2020-08-26 11:17:09', 58, 20.00, 'تم التسليم', 1, NULL, NULL, '', '0', '', 0, NULL),
(7, '2020-04-20 17:28:57', '2020-08-28 15:02:40', 58, 20.00, 'قيد التوصيل', 0, NULL, NULL, '', '0', '', 0, NULL),
(24, '2020-09-15 12:24:31', '2020-09-15 12:25:21', 58, 29.00, 'تم التسليم', 0, 5, 0.14, '10-12 صباحا', 'الخميس', 'غزة - الساحة', 1, 'لا يوجد ملاحظات'),
(25, '2020-09-15 12:26:06', '2020-09-15 13:03:39', 58, 29.00, 'تم التسليم', 0, 5, 0.14, '10-12 صباحا', 'الخميس', 'غزة - الساحة', 1, 'لا يوجد ملاحظات'),
(26, '2020-09-15 12:27:54', '2020-09-15 13:03:44', 58, 29.00, 'تم التسليم', 0, 5, 0.14, '10-12', 'الأربعاء', 'gaza', 0, 'test'),
(27, '2020-09-15 12:28:46', '2020-09-15 13:03:50', 58, 29.00, 'تم التسليم', 0, 5, 0.14, '10-12', 'الأربعاء', 'gaza', 0, 'test'),
(28, '2020-09-15 12:45:32', '2020-09-15 13:03:55', 58, 92.00, 'تم التسليم', 0, 5, 0.14, '10-12', 'الأربعاء', 'gaza', 1, 'test'),
(29, '2020-09-15 12:58:49', '2020-09-15 12:58:49', 58, 92.00, 'انتظار', 0, 5, 0.14, '10-12', 'الأربعاء', 'gaza', 1, 'test'),
(30, '2020-09-15 12:59:19', '2020-09-15 12:59:19', 58, 92.00, 'انتظار', 0, 5, 0.14, '10-12', 'الأربعاء', 'gaza', 1, 'test'),
(31, '2020-09-15 12:59:54', '2020-09-15 12:59:54', 58, 92.00, 'انتظار', 0, 5, 0.14, '10-12', 'الأربعاء', 'gaza', 1, 'test'),
(32, '2020-09-15 13:00:37', '2020-09-15 13:00:37', 58, 92.00, 'انتظار', 0, 5, 0.14, '10-12', 'الأربعاء', 'gaza', 1, 'test');

-- --------------------------------------------------------

--
-- بنية الجدول `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` double(8,2) NOT NULL,
  `price` double(8,2) NOT NULL,
  `total_price` double(8,2) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `order_details`
--

INSERT INTO `order_details` (`id`, `created_at`, `updated_at`, `product_id`, `product_name`, `order_id`, `quantity`, `price`, `total_price`, `user_id`) VALUES
(30, '2020-09-15 13:00:37', '2020-09-15 13:00:37', 38, 'مانجا معدل', 32, 4.00, 17.00, 68.00, 58),
(31, '2020-09-15 13:00:37', '2020-09-15 13:00:37', 34, 'طماطم', 32, 2.00, 12.00, 24.00, 58);

-- --------------------------------------------------------

--
-- بنية الجدول `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `market_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `payments`
--

INSERT INTO `payments` (`id`, `created_at`, `updated_at`, `user_id`, `market_id`, `amount`, `status`) VALUES
(1, '2020-04-20 18:01:15', '2020-04-20 18:01:15', 2, 4, 100.00, 'pending'),
(2, '2020-04-24 07:08:26', '2020-04-24 07:08:26', 2, 11, 100.00, 'pending');

-- --------------------------------------------------------

--
-- بنية الجدول `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) DEFAULT NULL,
  `category_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'غير محدد',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 1,
  `offer` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `products`
--

INSERT INTO `products` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `price`, `category_id`, `image`, `state`, `offer`) VALUES
(34, '2020-08-22 06:41:10', '2020-08-25 08:24:11', NULL, 'طماطم', 12.00, 'خضروات', '1598089270.jpg', 1, 1),
(38, '2020-08-22 06:49:25', '2020-08-28 15:01:05', NULL, 'مانجا معدل', 17.00, 'فواكه', '1598089765.jpg', 0, 0);

-- --------------------------------------------------------

--
-- بنية الجدول `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'tax', '0.14', NULL, NULL),
(2, 'currency', 'ريال', NULL, NULL),
(3, 'about', 'About us details', NULL, NULL),
(4, 'facebook', 'hesab', NULL, NULL),
(5, 'twitter', 'hesab', NULL, NULL),
(6, 'instagram', 'hesab', NULL, NULL),
(7, 'delavery', '5', NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `shipping_times`
--

CREATE TABLE `shipping_times` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avilable` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `shipping_times`
--

INSERT INTO `shipping_times` (`id`, `title`, `max`, `created_at`, `updated_at`, `avilable`) VALUES
(2, '10-12 صباحاً', 15, NULL, NULL, 0),
(3, '12-02 مساءاً', 15, NULL, NULL, 1),
(5, '02-04 مساءاً', 15, NULL, NULL, 1),
(6, '04-06 مساءاً', 15, NULL, NULL, 1),
(7, '06-08 مساءاً', 15, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- بنية الجدول `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `image`, `created_at`, `updated_at`) VALUES
(1, 'image1', '1600192457.jpg', NULL, '2020-09-15 14:54:17'),
(2, 'image2', '1600192472.jpg', NULL, '2020-09-15 14:54:32'),
(3, 'image3', '1600192494.jpg', NULL, '2020-09-15 14:54:54');

-- --------------------------------------------------------

--
-- بنية الجدول `upgrade_requsts`
--

CREATE TABLE `upgrade_requsts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_dept` double(8,2) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `membership` int(11) NOT NULL DEFAULT 0,
  `mobile_verify_code` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `favorits` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upgrade_status` int(11) NOT NULL DEFAULT 0,
  `points` int(11) NOT NULL DEFAULT 0,
  `balance` float NOT NULL DEFAULT 0,
  `copon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`id`, `name`, `mobile`, `total_dept`, `image`, `type`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `membership`, `mobile_verify_code`, `status`, `favorits`, `upgrade_status`, `points`, `balance`, `copon_code`) VALUES
(56, 'Ahmad', '0591234567', NULL, NULL, 0, 'Baraka@gmail.com', NULL, '$2y$10$Q1ScE8QkLdefH7f/Oi/axuXTYWnRFiRP.NT4jCtMRy/cqzT8km5Pe', NULL, '2020-08-19 06:12:09', '2020-09-15 11:47:13', 0, 7760, 1, NULL, 0, 0, 0, NULL),
(57, 'sdrif naim', '12341234', NULL, NULL, 0, 'naim@gmail.com', NULL, '$2y$10$tazaj4GeJmwlWcqC3cnhmePVW7CMRjcCwT.8d9t6G05cQ6QTuIc1K', NULL, '2020-08-19 10:50:09', '2020-08-19 10:52:08', 0, 3945, 1, NULL, 0, 130, 0, NULL),
(58, 'hashem naim', '00001111', NULL, NULL, 0, 'hashem@gmail.com', NULL, '$2y$10$eLxmvd1TQeUQo6RMSg7e7O5WujTYkK4Z6PC6OliKNNDf1QL/elnIq', NULL, '2020-08-20 06:53:16', '2020-08-20 07:23:21', 0, 8161, 1, NULL, 0, 0, 0, NULL),
(59, 'hashem naim', '333444', NULL, NULL, 0, 'snaim@gmail.com', NULL, '$2y$10$PdRZLfy7G0lbMljNipNrL.YCwKhYipzUFyGOvXDD9a4EmQVS3wgzS', NULL, '2020-08-28 09:55:51', '2020-08-28 09:55:51', 0, 6056, 0, NULL, 0, 0, 0, NULL),
(60, 'Mahmoud MB', '0599123123', NULL, NULL, 0, 'mmb@mmb.com', NULL, '$2y$10$gAcCJlUpEEfFl.FWvx37putHwKnbQ5w5aZBg5N/kyZah.R917i0n.', NULL, '2020-09-06 11:55:16', '2020-09-06 11:55:16', 0, 6825, 0, NULL, 0, 0, 0, NULL),
(61, 'hash', '05943845425', NULL, NULL, 0, 'hh@gmail.com', NULL, '$2y$10$Toig8VcUL1GtrYI4ormDaO08iR5deUVSnrk6GPYMuXN.nsmFLwZ/u', NULL, '2020-09-08 18:23:23', '2020-09-08 18:23:23', 0, 7189, 0, NULL, 0, 0, 0, NULL),
(62, 'hamamam', '0592198450', NULL, NULL, 0, 'h.yazk@gmail.com', NULL, '$2y$10$CI2TRsGQqGALrq4lUGQKVOiMnQnGOZnSr.8TuTUdw0aiGK8A5Pw72', NULL, '2020-09-08 18:29:12', '2020-09-15 13:57:31', 0, 6896, 1, NULL, 0, 0, 0, NULL),
(63, 'dd', '05943345425', NULL, NULL, 0, 'dsdhashhh@gmail.com', NULL, '$2y$10$0uExIJQqEBPuWeMI2A3iFuPQLTXo3TkVDohPHQpIkva1A4vIU9xLq', NULL, '2020-09-08 18:29:48', '2020-09-08 18:29:48', 0, 4223, 0, NULL, 0, 0, 0, NULL),
(64, 'hamamam1', '0592199450', NULL, NULL, 0, 'h.efe@gmail.com', NULL, '$2y$10$.e2bG9v7otXbqNSGLyVyhuPG8yoBUPyde5Ix8dIWX5qsTmoTsPAz.', NULL, '2020-09-08 18:39:33', '2020-09-08 18:39:33', 0, 2374, 0, NULL, 0, 0, 0, NULL),
(65, 'hamamam1', '0592199850', NULL, NULL, 0, 'h.ffe@gmail.com', NULL, '$2y$10$y74bHQUvtBbfnnUAnmXASevdOr5b1xO4eK6xrPEjjaX6..wnfdcTC', NULL, '2020-09-09 04:57:11', '2020-09-09 04:57:11', 0, 6720, 0, NULL, 0, 0, 0, NULL),
(66, 'ahmad', '0592198440', NULL, NULL, 0, 'h@gmail.com', NULL, '$2y$10$osn9DCaFnqoYC1CVtLoF4uOHSclJMcs6YZXPu4bRazCCCOqpZmMRK', NULL, '2020-09-09 05:04:44', '2020-09-09 05:04:44', 0, 8991, 0, NULL, 0, 0, 0, NULL),
(67, 'hamam1', '0598199850', NULL, NULL, 0, 'h.s@gmail.com', NULL, '$2y$10$CZwh5bt9R15Y4dCRvzvdq.5VUE6osZLDBMfclBUPmVbSKMoqdfUBm', NULL, '2020-09-09 05:30:10', '2020-09-09 05:37:26', 0, 8293, 1, NULL, 0, 0, 0, NULL),
(68, 'مدير الموقع', '009900', NULL, NULL, 0, 'admin@capotcha.com', NULL, '$2y$10$iwasM6JuGquQUrc9yDVckOQQqdndGoPwjGWsHegc2yDAA6MoWNrOy', NULL, '2020-09-15 11:44:32', '2020-09-15 11:45:09', 0, 8217, 1, NULL, 0, 0, 0, NULL),
(69, 'hamam1', '0592198459', NULL, NULL, 0, 'hy@gmail.com', NULL, '$2y$10$NH6fIWVRe91cGDN06VD88OEycckQie.K4TnViYfj5DcysTRr6zp9e', NULL, '2020-09-15 13:15:20', '2020-09-15 13:15:20', 0, 6110, 0, NULL, 0, 0, 0, NULL),
(70, 'mohammed', '0592198567', NULL, NULL, 0, 'ha@gmail.com', NULL, '$2y$10$kjMUawK9a//ZCv2McS8BNuEn92rxlHzjaZQ/lkcA1Uv4PAFQzsXEq', NULL, '2020-09-15 13:25:56', '2020-09-15 13:26:30', 0, 8281, 1, NULL, 0, 0, 0, NULL),
(71, 'hasrs', '0596565658', NULL, NULL, 0, 'hyu@gmail.com', NULL, '$2y$10$3miwMF//xgPSxs7Y.ImxmugFexHOrC8wy4t957Wsw3eyn64.J0P5u', NULL, '2020-09-15 13:54:13', '2020-09-15 13:54:33', 0, 4016, 1, NULL, 0, 0, 0, NULL),
(75, 'me', '101010', NULL, NULL, 0, 'eng.s.naim@gmail.com', NULL, '$2y$10$YXO0HILlgSeY7Y8JwHjBZuPFYLmEGivBuDaJ9tpfRSVF/3aO1wzmS', NULL, '2020-09-15 19:14:17', '2020-09-15 19:14:17', 0, 2658, 0, NULL, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `welcomes`
--

CREATE TABLE `welcomes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `welcomes`
--

INSERT INTO `welcomes` (`id`, `title`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'تسوق الآن', 'تسوق بين العديد من المتاجر\r\nوالبقالات الغذائية', 'welcome1.png', NULL, NULL),
(2, 'دفع آمن', 'تسوق بين العديد من المتاجر\r\nوالبقالات الغذائية', 'welcome2.png', NULL, NULL),
(3, 'توصيل أسرع', 'تسوق بين العديد من المتاجر\r\nوالبقالات الغذائية', 'welcome3.png', NULL, NULL),
(4, 'تتبع الطلبات', 'تسوق بين العديد من المتاجر\r\nوالبقالات الغذائية', 'welcome4.png', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `copons`
--
ALTER TABLE `copons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `copon_categories`
--
ALTER TABLE `copon_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorits`
--
ALTER TABLE `favorits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `markets`
--
ALTER TABLE `markets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `market_reviews`
--
ALTER TABLE `market_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_times`
--
ALTER TABLE `shipping_times`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upgrade_requsts`
--
ALTER TABLE `upgrade_requsts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `welcomes`
--
ALTER TABLE `welcomes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `copons`
--
ALTER TABLE `copons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `copon_categories`
--
ALTER TABLE `copon_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorits`
--
ALTER TABLE `favorits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `markets`
--
ALTER TABLE `markets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `market_reviews`
--
ALTER TABLE `market_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `shipping_times`
--
ALTER TABLE `shipping_times`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `upgrade_requsts`
--
ALTER TABLE `upgrade_requsts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `welcomes`
--
ALTER TABLE `welcomes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
