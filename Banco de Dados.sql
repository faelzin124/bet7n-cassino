-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 06/01/2025 às 16:58
-- Versão do servidor: 10.7.3-MariaDB-log
-- Versão do PHP: 8.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `free`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `affiliate_histories`
--

CREATE TABLE `affiliate_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `inviter` int(10) UNSIGNED NOT NULL,
  `commission` decimal(20,2) NOT NULL DEFAULT 0.00,
  `commission_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposited` tinyint(4) DEFAULT 0,
  `deposited_amount` decimal(10,2) DEFAULT 0.00,
  `losses` bigint(20) DEFAULT 0,
  `losses_amount` decimal(10,2) DEFAULT 0.00,
  `commission_paid` decimal(10,2) DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `receita` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `affiliate_withdraws`
--

CREATE TABLE `affiliate_withdraws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `proof` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `pix_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pix_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'home',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `banners`
--

INSERT INTO `banners` (`id`, `link`, `image`, `type`, `description`, `created_at`, `updated_at`) VALUES
(18, '#', '01J1D4ESJ2F50MM159PJDVCRXM.webp', 'home', '....', '2024-04-07 16:30:46', '2024-06-27 15:19:07'),
(24, NULL, '01J5VSBTK7WCHYWYPGGNV38QPT.gif', 'carousel', NULL, '2024-08-21 21:56:39', '2024-08-21 22:05:48'),
(25, NULL, '01J5VSCJGYC9VD3HHWMVWEZ0N7.gif', 'carousel', NULL, '2024-08-21 21:57:03', '2024-08-21 22:05:56'),
(21, NULL, '01J1E1XF67VMVQAA8SMP8QMVE6.webp', 'home', NULL, '2024-06-27 20:53:56', '2024-06-27 20:53:56'),
(22, NULL, '01J1E1ZV85FJJVFBYXJTTKVE2B.png', 'home', NULL, '2024-06-27 20:55:14', '2024-06-27 20:55:14');

-- --------------------------------------------------------

--
-- Estrutura para tabela `baus`
--

CREATE TABLE `baus` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bau_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `caminho` varchar(255) DEFAULT NULL,
  `dataS` timestamp NULL DEFAULT NULL,
  `aberto_em` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `baus`
--

INSERT INTO `baus` (`id`, `user_id`, `bau_id`, `status`, `caminho`, `dataS`, `aberto_em`, `updated_at`, `created_at`) VALUES
(36, 441, 1, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 13:29:24', '2024-08-22 13:29:24'),
(37, 441, 2, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 13:29:24', '2024-08-22 13:29:24'),
(38, 441, 3, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 13:29:24', '2024-08-22 13:29:24'),
(39, 441, 4, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 14:33:46', '2024-08-22 14:33:46'),
(40, 441, 5, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 14:33:46', '2024-08-22 14:33:46'),
(41, 441, 6, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 14:33:46', '2024-08-22 14:33:46'),
(42, 441, 7, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 14:33:46', '2024-08-22 14:33:46'),
(43, 441, 8, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 14:33:46', '2024-08-22 14:33:46'),
(44, 441, 9, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 15:48:06', '2024-08-22 15:48:06'),
(45, 441, 10, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 15:48:06', '2024-08-22 15:48:06'),
(46, 441, 11, 3, '/assets/images/big1.png', NULL, '2024-08-22 15:48:22', '2024-08-22 15:48:22', '2024-08-22 15:48:06'),
(47, 441, 12, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 16:13:03', '2024-08-22 16:13:03'),
(48, 441, 13, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 16:32:43', '2024-08-22 16:32:43'),
(49, 441, 14, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 16:32:43', '2024-08-22 16:32:43'),
(50, 441, 15, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 16:32:43', '2024-08-22 16:32:43'),
(51, 441, 16, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 16:32:43', '2024-08-22 16:32:43'),
(52, 441, 17, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 16:32:43', '2024-08-22 16:32:43'),
(53, 441, 18, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 16:32:43', '2024-08-22 16:32:43'),
(54, 441, 19, 3, '/assets/images/big1.png', NULL, '2024-08-22 17:44:55', '2024-08-22 17:44:55', '2024-08-22 16:32:43'),
(55, 441, 20, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 17:44:52', '2024-08-22 17:44:52'),
(56, 441, 21, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 17:44:52', '2024-08-22 17:44:52'),
(57, 441, 22, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 17:44:52', '2024-08-22 17:44:52'),
(58, 441, 23, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 17:44:52', '2024-08-22 17:44:52'),
(59, 441, 24, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 17:44:52', '2024-08-22 17:44:52'),
(60, 441, 25, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 17:44:52', '2024-08-22 17:44:52'),
(61, 441, 26, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 17:44:52', '2024-08-22 17:44:52'),
(62, 441, 27, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 17:44:52', '2024-08-22 17:44:52'),
(63, 441, 28, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 17:44:52', '2024-08-22 17:44:52'),
(64, 441, 29, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 17:44:52', '2024-08-22 17:44:52'),
(65, 441, 30, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 18:56:04', '2024-08-22 18:56:04'),
(66, 441, 31, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 18:56:04', '2024-08-22 18:56:04'),
(67, 441, 32, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 18:56:04', '2024-08-22 18:56:04'),
(68, 441, 33, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 18:56:04', '2024-08-22 18:56:04'),
(69, 441, 34, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 18:56:04', '2024-08-22 18:56:04'),
(70, 441, 35, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 18:56:04', '2024-08-22 18:56:04'),
(71, 441, 36, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 18:56:04', '2024-08-22 18:56:04'),
(72, 441, 37, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 18:56:04', '2024-08-22 18:56:04'),
(73, 441, 38, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 18:56:04', '2024-08-22 18:56:04'),
(74, 441, 39, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 18:56:04', '2024-08-22 18:56:04'),
(75, 441, 40, 2, '/assets/images/big2.png', NULL, NULL, '2024-08-22 18:56:04', '2024-08-22 18:56:04'),
(76, 524, 1, 3, '/assets/images/big1.png', NULL, '2024-08-23 06:01:25', '2024-08-23 06:01:25', '2024-08-23 04:10:40'),
(77, 560, 1, 3, '/assets/images/big1.png', NULL, '2024-09-16 18:00:38', '2024-09-16 18:00:38', '2024-09-16 17:31:52');

-- --------------------------------------------------------

--
-- Estrutura para tabela `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Popular', 'Popular', '/storage/rox/popular_off.png', 'popular', '2023-11-13 14:59:07', '2024-04-30 18:13:46'),
(17, 'Slots', 'Slots', '/storage/rox/slots_off.png', 'slots', '2023-12-24 12:06:46', '2024-04-30 18:13:57'),
(18, 'PGSoft', 'PGSoft', '/storage/rox/pgsoft-off.png', 'pgsoft', '2023-12-24 12:10:01', '2024-04-30 18:14:17'),
(19, 'Pragmatic', 'Pragmatic', '/storage/rox/pragmatic-off.png', 'pragmatic', '2023-12-24 12:12:36', '2024-04-30 18:14:37'),
(22, 'Cartas', 'Cartas', '/storage/rox/cartas_off.png', 'cartas', '2024-04-16 11:26:47', '2024-04-30 18:15:22'),
(20, 'Favoritos', 'Favoritos', '/storage/rox/favorito_off.png', 'favoritos', '2023-12-24 12:19:42', '2024-04-30 18:14:49'),
(21, 'Recentes', 'Recentes', '/storage/rox/recente_off.png', 'recentes', '2023-12-24 20:03:48', '2024-04-30 18:15:05');

-- --------------------------------------------------------

--
-- Estrutura para tabela `category_game`
--

CREATE TABLE `category_game` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `created_at`, `updated_at`) VALUES
(1, 'Leke', 'ALL', 'Lek', '2023-11-07 18:01:38', NULL),
(2, 'Dollars', 'USD', '$', '2023-11-07 18:01:38', NULL),
(3, 'Afghanis', 'AFN', '؋', '2023-11-07 18:01:38', NULL),
(4, 'Pesos', 'ARS', '$', '2023-11-07 18:01:38', NULL),
(5, 'Guilders', 'AWG', 'ƒ', '2023-11-07 18:01:38', NULL),
(6, 'Dollars', 'AUD', '$', '2023-11-07 18:01:38', NULL),
(7, 'New Manats', 'AZN', 'ман', '2023-11-07 18:01:38', NULL),
(8, 'Dollars', 'BSD', '$', '2023-11-07 18:01:38', NULL),
(9, 'Dollars', 'BBD', '$', '2023-11-07 18:01:38', NULL),
(10, 'Rubles', 'BYR', 'p.', '2023-11-07 18:01:38', NULL),
(11, 'Euro', 'EUR', '€', '2023-11-07 18:01:38', NULL),
(12, 'Dollars', 'BZD', 'BZ$', '2023-11-07 18:01:38', NULL),
(13, 'Dollars', 'BMD', '$', '2023-11-07 18:01:38', NULL),
(14, 'Bolivianos', 'BOB', '$b', '2023-11-07 18:01:38', NULL),
(15, 'Convertible Marka', 'BAM', 'KM', '2023-11-07 18:01:38', NULL),
(16, 'Pula', 'BWP', 'P', '2023-11-07 18:01:38', NULL),
(17, 'Leva', 'BGN', 'лв', '2023-11-07 18:01:38', NULL),
(18, 'Reais', 'BRL', 'R$', '2023-11-07 18:01:38', NULL),
(19, 'Pounds', 'GBP', '£', '2023-11-07 18:01:38', NULL),
(20, 'Dollars', 'BND', '$', '2023-11-07 18:01:38', NULL),
(21, 'Riels', 'KHR', '៛', '2023-11-07 18:01:38', NULL),
(22, 'Dollars', 'CAD', '$', '2023-11-07 18:01:38', NULL),
(23, 'Dollars', 'KYD', '$', '2023-11-07 18:01:38', NULL),
(24, 'Pesos', 'CLP', '$', '2023-11-07 18:01:38', NULL),
(25, 'Yuan Renminbi', 'CNY', '¥', '2023-11-07 18:01:38', NULL),
(26, 'Pesos', 'COP', '$', '2023-11-07 18:01:38', NULL),
(27, 'Colón', 'CRC', '₡', '2023-11-07 18:01:38', NULL),
(28, 'Kuna', 'HRK', 'kn', '2023-11-07 18:01:38', NULL),
(29, 'Pesos', 'CUP', '₱', '2023-11-07 18:01:38', NULL),
(30, 'Koruny', 'CZK', 'Kč', '2023-11-07 18:01:38', NULL),
(31, 'Kroner', 'DKK', 'kr', '2023-11-07 18:01:38', NULL),
(32, 'Pesos', 'DOP', 'RD$', '2023-11-07 18:01:38', NULL),
(33, 'Dollars', 'XCD', '$', '2023-11-07 18:01:38', NULL),
(34, 'Pounds', 'EGP', '£', '2023-11-07 18:01:38', NULL),
(35, 'Colones', 'SVC', '$', '2023-11-07 18:01:38', NULL),
(36, 'Pounds', 'FKP', '£', '2023-11-07 18:01:38', NULL),
(37, 'Dollars', 'FJD', '$', '2023-11-07 18:01:38', NULL),
(38, 'Cedis', 'GHC', '¢', '2023-11-07 18:01:38', NULL),
(39, 'Pounds', 'GIP', '£', '2023-11-07 18:01:38', NULL),
(40, 'Quetzales', 'GTQ', 'Q', '2023-11-07 18:01:38', NULL),
(41, 'Pounds', 'GGP', '£', '2023-11-07 18:01:38', NULL),
(42, 'Dollars', 'GYD', '$', '2023-11-07 18:01:38', NULL),
(43, 'Lempiras', 'HNL', 'L', '2023-11-07 18:01:38', NULL),
(44, 'Dollars', 'HKD', '$', '2023-11-07 18:01:38', NULL),
(45, 'Forint', 'HUF', 'Ft', '2023-11-07 18:01:38', NULL),
(46, 'Kronur', 'ISK', 'kr', '2023-11-07 18:01:38', NULL),
(47, 'Rupees', 'INR', 'Rp', '2023-11-07 18:01:38', NULL),
(48, 'Rupiahs', 'IDR', 'Rp', '2023-11-07 18:01:38', NULL),
(49, 'Rials', 'IRR', '﷼', '2023-11-07 18:01:38', NULL),
(50, 'Pounds', 'IMP', '£', '2023-11-07 18:01:38', NULL),
(51, 'New Shekels', 'ILS', '₪', '2023-11-07 18:01:38', NULL),
(52, 'Dollars', 'JMD', 'J$', '2023-11-07 18:01:38', NULL),
(53, 'Yen', 'JPY', '¥', '2023-11-07 18:01:38', NULL),
(54, 'Pounds', 'JEP', '£', '2023-11-07 18:01:38', NULL),
(55, 'Tenge', 'KZT', 'лв', '2023-11-07 18:01:38', NULL),
(56, 'Won', 'KPW', '₩', '2023-11-07 18:01:38', NULL),
(57, 'Won', 'KRW', '₩', '2023-11-07 18:01:38', NULL),
(58, 'Soms', 'KGS', 'лв', '2023-11-07 18:01:38', NULL),
(59, 'Kips', 'LAK', '₭', '2023-11-07 18:01:38', NULL),
(60, 'Lati', 'LVL', 'Ls', '2023-11-07 18:01:38', NULL),
(61, 'Pounds', 'LBP', '£', '2023-11-07 18:01:38', NULL),
(62, 'Dollars', 'LRD', '$', '2023-11-07 18:01:38', NULL),
(63, 'Switzerland Francs', 'CHF', 'CHF', '2023-11-07 18:01:38', NULL),
(64, 'Litai', 'LTL', 'Lt', '2023-11-07 18:01:38', NULL),
(65, 'Denars', 'MKD', 'ден', '2023-11-07 18:01:38', NULL),
(66, 'Ringgits', 'MYR', 'RM', '2023-11-07 18:01:38', NULL),
(67, 'Rupees', 'MUR', '₨', '2023-11-07 18:01:38', NULL),
(68, 'Pesos', 'MXN', '$', '2023-11-07 18:01:38', NULL),
(69, 'Tugriks', 'MNT', '₮', '2023-11-07 18:01:38', NULL),
(70, 'Meticais', 'MZN', 'MT', '2023-11-07 18:01:38', NULL),
(71, 'Dollars', 'NAD', '$', '2023-11-07 18:01:38', NULL),
(72, 'Rupees', 'NPR', '₨', '2023-11-07 18:01:38', NULL),
(73, 'Guilders', 'ANG', 'ƒ', '2023-11-07 18:01:38', NULL),
(74, 'Dollars', 'NZD', '$', '2023-11-07 18:01:38', NULL),
(75, 'Cordobas', 'NIO', 'C$', '2023-11-07 18:01:38', NULL),
(76, 'Nairas', 'NGN', '₦', '2023-11-07 18:01:38', NULL),
(77, 'Krone', 'NOK', 'kr', '2023-11-07 18:01:38', NULL),
(78, 'Rials', 'OMR', '﷼', '2023-11-07 18:01:38', NULL),
(79, 'Rupees', 'PKR', '₨', '2023-11-07 18:01:38', NULL),
(80, 'Balboa', 'PAB', 'B/.', '2023-11-07 18:01:38', NULL),
(81, 'Guarani', 'PYG', 'Gs', '2023-11-07 18:01:38', NULL),
(82, 'Nuevos Soles', 'PEN', 'S/.', '2023-11-07 18:01:38', NULL),
(83, 'Pesos', 'PHP', 'Php', '2023-11-07 18:01:38', NULL),
(84, 'Zlotych', 'PLN', 'zł', '2023-11-07 18:01:38', NULL),
(85, 'Rials', 'QAR', '﷼', '2023-11-07 18:01:38', NULL),
(86, 'New Lei', 'RON', 'lei', '2023-11-07 18:01:38', NULL),
(87, 'Rubles', 'RUB', 'руб', '2023-11-07 18:01:38', NULL),
(88, 'Pounds', 'SHP', '£', '2023-11-07 18:01:38', NULL),
(89, 'Riyals', 'SAR', '﷼', '2023-11-07 18:01:38', NULL),
(90, 'Dinars', 'RSD', 'Дин.', '2023-11-07 18:01:38', NULL),
(91, 'Rupees', 'SCR', '₨', '2023-11-07 18:01:38', NULL),
(92, 'Dollars', 'SGD', '$', '2023-11-07 18:01:38', NULL),
(93, 'Dollars', 'SBD', '$', '2023-11-07 18:01:38', NULL),
(94, 'Shillings', 'SOS', 'S', '2023-11-07 18:01:38', NULL),
(95, 'Rand', 'ZAR', 'R', '2023-11-07 18:01:38', NULL),
(96, 'Rupees', 'LKR', '₨', '2023-11-07 18:01:38', NULL),
(97, 'Kronor', 'SEK', 'kr', '2023-11-07 18:01:38', NULL),
(98, 'Dollars', 'SRD', '$', '2023-11-07 18:01:38', NULL),
(99, 'Pounds', 'SYP', '£', '2023-11-07 18:01:38', NULL),
(100, 'New Dollars', 'TWD', 'NT$', '2023-11-07 18:01:38', NULL),
(101, 'Baht', 'THB', '฿', '2023-11-07 18:01:38', NULL),
(102, 'Dollars', 'TTD', 'TT$', '2023-11-07 18:01:38', NULL),
(103, 'Lira', 'TRY', '₺', '2023-11-07 18:01:38', NULL),
(104, 'Liras', 'TRL', '£', '2023-11-07 18:01:38', NULL),
(105, 'Dollars', 'TVD', '$', '2023-11-07 18:01:38', NULL),
(106, 'Hryvnia', 'UAH', '₴', '2023-11-07 18:01:38', NULL),
(107, 'Pesos', 'UYU', '$U', '2023-11-07 18:01:38', NULL),
(108, 'Sums', 'UZS', 'лв', '2023-11-07 18:01:38', NULL),
(109, 'Bolivares Fuertes', 'VEF', 'Bs', '2023-11-07 18:01:38', NULL),
(110, 'Dong', 'VND', '₫', '2023-11-07 18:01:38', NULL),
(111, 'Rials', 'YER', '﷼', '2023-11-07 18:01:38', NULL),
(112, 'Zimbabwe Dollars', 'ZWD', 'Z$', '2023-11-07 18:01:38', NULL),
(113, 'Rupees', 'INR', '₹', '2023-11-07 18:01:38', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `currency_alloweds`
--

CREATE TABLE `currency_alloweds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `custom_layouts`
--

CREATE TABLE `custom_layouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `font_family_default` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#0073D2',
  `primary_opacity_color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secundary_color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#084375',
  `gray_dark_color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#3b3b3b',
  `gray_light_color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#c9c9c9',
  `gray_medium_color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#676767',
  `gray_over_color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#1A1C20',
  `title_color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#ffffff',
  `text_color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#98A7B5',
  `sub_text_color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#656E78',
  `placeholder_color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#4D565E',
  `background_color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#24262B',
  `background_base` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '#ECEFF1',
  `background_base_dark` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '#24262B',
  `carousel_banners` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '#1E2024',
  `carousel_banners_dark` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '#1E2024',
  `sidebar_color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sidebar_color_dark` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `navtop_color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `navtop_color_dark` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `side_menu` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `side_menu_dark` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input_primary` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input_primary_dark` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_color_dark` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_color_dark` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `border_radius` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '.25rem',
  `custom_css` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_js` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_header` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_body` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `instagram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telegram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whastapp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `custom_layouts`
--

INSERT INTO `custom_layouts` (`id`, `font_family_default`, `primary_color`, `primary_opacity_color`, `secundary_color`, `gray_dark_color`, `gray_light_color`, `gray_medium_color`, `gray_over_color`, `title_color`, `text_color`, `sub_text_color`, `placeholder_color`, `background_color`, `background_base`, `background_base_dark`, `carousel_banners`, `carousel_banners_dark`, `sidebar_color`, `sidebar_color_dark`, `navtop_color`, `navtop_color_dark`, `side_menu`, `side_menu_dark`, `input_primary`, `input_primary_dark`, `footer_color`, `footer_color_dark`, `card_color`, `card_color_dark`, `border_radius`, `custom_css`, `custom_js`, `custom_header`, `custom_body`, `created_at`, `updated_at`, `instagram`, `facebook`, `telegram`, `twitter`, `whastapp`, `youtube`) VALUES
(1, '\'Roboto Condensed\', sans-serif', '#540003', '#000', '#ffffff', '#000000', '#F6D469', '#F6D469', '#191A1E', '#F6D469', '#F6D469', '#F6D469', '#F6D469', '#F6D469', '#700004', '#700004', '#dbdbdb', '#700004', '#700004', '#700004', '#ffffff0e', '#0f1923', '#F6D469', '#0f1923', '#F6D469', '#F6D469', '#919191', '#0f1923', '#F6D469', '#1E2024', '.25rem', '\n.screen-button{\ndisplay: none !important;\n}', '<div class=\"w-full relative\">\n    <div class=\"text-[var(--theme-text-color)] font-bold my-[20px] text-[22px] w-full min-h-[24px] text-center leading-[1.3]\">\n        <span class=\"w-full -mb-[2.58824px] pb-[-2.58824px] text-[22px] inline-block leading-[0] overflow-hidden\">\n            <span class=\"text-[14.9067px] sm:text-[22px] inline-block w-full\">\n                <span class=\"leading-[1.2] [overflow:initial] text-center overflow-ellipsis align-middle\" style=\"-webkit-line-clamp: 5;\">\n                    🎁 Venha se Divertir no maior site do Brasil\n                </span>\n            </span>\n        </span>\n    </div>\n    <div class=\"text-[var(--theme-text-color)] pb-[20px] sm:pb-0 sm:h-[405px] text-[14px] leading-[1.56] text-left w-full\">\n        <div class=\"w-full h-full px-[30px]\">\n            <div class=\"sm:h-full overflow-x-hidden overflow-y-scroll [scrollbar-width:none]\">\n                <div class=\"my-scrollbar-content\">\n                    <div class=\"D4IXpi08hh8lVGgzIBUz\">\n                        <div>\n                            <p class=\"mb-0\">\n                                ✈️Clique no canal:\n                                <a href=\"https://t.me/+DrpLV5JzhswxOGUx\" target=\"_blank\" rel=\"noopener\">\n                                    <span style=\"color: #ffeb00;\">Telegram</span>\n                                </a>\n                                <br>❤️Convide amigos e ganhe\n                                <span style=\"color: #ffeb00;\">40% pelo deposito</span>\n                                de cada deposito feito não é sonho❤️\n                                <br>🎁Bônus de primeiro depósito para novos usuários\n                                <span style=\"color: #ffeb00;\">25%</span>\n                                \n                                \n\n                                <br>👉 Passos: Visitar → Eventos/Promoções → Recomendar amigos → Receber/Receber\n                            </p>\n                        </div>\n                    </div>\n                </div>\n            </div>\n        </div>\n    </div>\n</div>\n', '', '', '2024-01-01 14:36:03', '2025-01-06 08:47:34', 'https://t.me/+DrpLV5JzhswxOGUx', 'https://t.me/+DrpLV5JzhswxOGUx', 'https://t.me/+DrpLV5JzhswxOGUx', 'https://t.me/+DrpLV5JzhswxOGUx', 'https://t.me/+DrpLV5JzhswxOGUx', 'https://t.me/+DrpLV5JzhswxOGUx');

-- --------------------------------------------------------

--
-- Estrutura para tabela `debug`
--

CREATE TABLE `debug` (
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proof` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `currency` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `digito_pay_payments`
--

CREATE TABLE `digito_pay_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `withdrawal_id` int(10) UNSIGNED NOT NULL,
  `pix_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pix_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `observation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `games`
--

CREATE TABLE `games` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` int(10) UNSIGNED NOT NULL,
  `game_server_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `game_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `technology` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_lobby` tinyint(4) NOT NULL DEFAULT 0,
  `is_mobile` tinyint(4) NOT NULL DEFAULT 0,
  `has_freespins` tinyint(4) NOT NULL DEFAULT 0,
  `has_tables` tinyint(4) NOT NULL DEFAULT 0,
  `only_demo` tinyint(4) DEFAULT 0,
  `rtp` bigint(20) NOT NULL COMMENT 'Controle de RTP em porcentagem',
  `distribution` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'O nome do provedor',
  `views` bigint(20) NOT NULL DEFAULT 0,
  `is_featured` tinyint(1) DEFAULT 0,
  `show_home` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `games`
--

INSERT INTO `games` (`id`, `provider_id`, `game_server_url`, `game_id`, `game_name`, `game_code`, `game_type`, `description`, `cover`, `status`, `technology`, `has_lobby`, `is_mobile`, `has_freespins`, `has_tables`, `only_demo`, `rtp`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`) VALUES
(1186, 1, NULL, '48', 'Double Fortune', '48', 'slot', NULL, '01J1D491Q29HGFV5C1PTRMBNF2.jpg', '1', NULL, 0, 0, 0, 0, 0, 90, 'wizzepro', 500000003, 0, 1, '2024-06-26 18:15:16', '2025-01-02 09:34:36'),
(1187, 1, NULL, '42', 'Ganesha Gold', '42', 'slot', NULL, '01J1D48FYP54MWCEA99PMKA5KG.jpg', '1', NULL, 0, 0, 0, 0, 0, 90, 'wizzepro', 500000000, 0, 1, '2024-06-26 18:21:11', '2024-09-18 12:29:30'),
(1188, 1, NULL, '63', 'Dragon Tiger Luck', '63', 'slot', NULL, '01J1D47X4J6E99V1S9GJS2FWF7.jpg', '1', NULL, 0, 0, 0, 0, 0, 90, 'wizzepro', 500000000, 0, 1, '2024-06-26 18:22:54', '2024-09-18 12:29:28'),
(1189, 1, NULL, '40', 'Jungle Delight', '40', 'slot', NULL, '01J1D4719PT2EZBDQZYMF1EQ31.jpg', '1', NULL, 0, 0, 0, 0, 0, 90, 'wizzepro', 500000000, 0, 1, '2024-06-26 18:23:42', '2024-09-18 12:29:28'),
(1190, 1, NULL, '69', 'Bikini Paradise', '69', 'slot', NULL, '01J1D46FHEPTSGDH71Z5Z6KZA7.jpg', '1', NULL, 0, 0, 0, 0, 0, 90, 'wizzepro', 500000006, 0, 1, '2024-06-26 18:25:02', '2024-10-18 09:05:46'),
(1191, 1, NULL, '68', 'Fortune Mouse', '68', 'slot', NULL, '01J1D45Y482BBXBM7RYBAG4TEG.avif', '1', NULL, 0, 0, 0, 0, 0, 90, 'wizzepro', 500000002, 0, 1, '2024-06-26 18:26:01', '2024-10-13 11:48:07'),
(1192, 1, NULL, '98', 'Fortune OX', '98', 'slot', NULL, '01J1D456G9KWD75JW8WW5SCJCS.avif', '1', NULL, 0, 0, 0, 0, 0, 90, 'wizzepro', 500000029, 0, 1, '2024-06-26 18:26:32', '2024-10-21 07:28:34'),
(1193, 1, NULL, '1543462', 'Fortune Rabbit', '1543462', 'slot', NULL, '01J1D44M2DZ70NXGXAJG4VA84F.avif', '1', NULL, 0, 0, 0, 0, 0, 90, 'wizzepro', 500000004, 0, 1, '2024-06-26 18:27:22', '2025-01-06 08:50:07'),
(1194, 1, NULL, '1695365', 'Fortune Dragon', '1695365', 'slot', NULL, '01J1D440FJPF57J40W92DWGKDE.avif', '1', NULL, 0, 0, 0, 0, 0, 90, 'wizzepro', 500000007, 0, 1, '2024-06-26 18:28:11', '2024-10-18 08:44:38'),
(1195, 1, NULL, '126', 'Fortune Tiger', '126', 'slot', NULL, '01J82W4C1PSZDECG5KTNWR4E38.jpg', '1', NULL, 0, 0, 0, 0, 0, 90, 'wizzepro', 500000099, 0, 1, '2024-06-26 18:28:53', '2025-01-06 08:53:00'),
(1197, 1, NULL, '1682240', 'Cash Mania', '1682240', 'slot', NULL, '01J82W3CA4DFNRCHGCK1PRRXPT.jpg', '1', NULL, 0, 0, 0, 0, 0, 90, 'wizzepro', 500000032, 0, 1, '2024-09-06 22:15:13', '2024-10-21 21:04:16'),
(1198, 1, NULL, '1451122', 'Dragon Hatch', '1451122', 'slot', NULL, '01J82W7QKBSFGJ5WFJKCC0ZTTR.jpg', '1', NULL, 0, 0, 0, 0, 0, 90, 'wizzepro', 500000000, 0, 1, '2024-09-06 22:20:31', '2024-09-19 16:19:53'),
(1199, 1, NULL, '1492288', 'pinata-wins', '1492288', 'slot', NULL, '01J82WARK2BZ1T1471P4YKH3DG.jpg', '1', NULL, 0, 0, 0, 0, 0, 90, 'wizzepro', 500000000, 0, 1, '2024-09-06 22:23:26', '2024-10-09 20:35:09'),
(1200, 1, NULL, '1738001', 'chicky-run', '1738001', 'slot', NULL, '01J82WCMM07NFY5044NG4T6978.jpg', '1', NULL, 0, 0, 0, 0, 0, 90, 'wizzepro', 500000001, 0, 1, '2024-09-06 22:27:36', '2024-10-18 06:22:08'),
(1201, 1, NULL, '1508783', 'wild-ape-3258', '1508783', 'slot', NULL, '01J82WA214ZDJQQX8HBBQ2MVGN.jpg', '1', 'html5', 0, 0, 0, 0, 0, 90, 'wizzepro', 500000000, 0, 1, '2024-09-06 22:30:54', '2024-10-05 14:21:50'),
(1202, 1, NULL, '1778752', 'futebol-fever', '1778752', 'PGSoft', NULL, '01J82WDXA5V78ZCEHX0AMH6FA3.jpg', '1', NULL, 0, 0, 0, 0, 0, 90, 'wizzepro', 5000020, 0, 1, '2024-09-06 22:33:49', '2024-12-13 15:43:20'),
(1581, 2, NULL, 'vs10bbbonanza', 'Big Bass Bonanza', 'vs10bbbonanza', 'slots', NULL, '01J5HH5VTCTVEGZMEJCH00AR6R.avif', '1', 'html5', 0, 1, 0, 0, 0, 1, 'apipragmatic40', 1897, 0, 1, '2024-03-06 14:41:58', '2024-08-22 21:16:45'),
(1205, 2, NULL, 'vs10bbbonanza', 'Big Bass Bonanza', 'vs10bbbonanza', 'Pragmatic', NULL, 'pragmatic/01J5HH5VTCTVEGZMEJCH00AR6R.avif', '0', 'html5', 0, 1, 0, 0, 0, 1, 'xgamesclub', 0, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1206, 2, NULL, 'vs10bbkir', 'Big Bass Bonanza Keeping it Reel', 'vs10bbkir', 'Pragmatic', NULL, 'pragmatic/01J5HH6D61H5RTPRCTG5ZY06B1.avif', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 0, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1207, 2, NULL, 'vs10bxmasbnza', 'Christmans Big Bass Bonanza', 'vs10bxmasbnza', 'Pragmatic', NULL, 'pragmatic/01J5HH6ZX01EHHACTKRMDSTBHY.avif', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 0, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1208, 2, NULL, 'vs10cowgold', 'Cowboys Gold', 'vs10cowgold', 'Pragmatic', NULL, 'pragmatic/01J5HH7HPQ9113E27HN9W8PPJH.avif', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 2, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1209, 2, NULL, 'vs10returndead', 'Return of the Dead', 'vs10returndead', 'Pragmatic', NULL, 'pragmatic/01J5HH85FJGEQ9ESEQ3ZZ1MQ2T.avif', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 1, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1210, 2, NULL, 'vs10txbigbass', 'Big Bass Splash', 'vs10txbigbass', 'Pragmatic', NULL, 'pragmatic/01J5HH8SS5YQDKRZAR0G14Y08Y.avif', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 0, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1211, 2, NULL, 'vs10vampwolf', 'Vampires vs Wolves', 'vs10vampwolf', 'Pragmatic', NULL, 'pragmatic/01J5HH9FQ7FW5C4F2B3ET9SEY4.avif', '0', 'html5', 0, 1, 0, 0, 0, 1, 'xgamesclub', 0, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1212, 2, NULL, 'vs12bbb', 'Bigger Bass Bonanza', 'vs12bbb', 'Pragmatic', NULL, 'pragmatic/01J5HHA1D2NBR3YKPNGZ79R54P.avif', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 0, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1213, 2, NULL, 'vs12bbbxmas', 'Bigger Bass Blizzard Christmas Catch', 'vs12bbbxmas', 'Pragmatic', NULL, 'pragmatic/01J5HHAWKEC05W3H4YR91REQMJ.avif', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 0, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1214, 2, NULL, 'vs20bchprty', 'Wild Beach Party', 'vs20bchprty', 'Pragmatic', NULL, 'pragmatic/01J5HH58367F3T1YSKY699N1DH.avif', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 0, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1215, 2, NULL, 'vs20bonzgold', 'Bonanza Gold', 'vs20bonzgold', 'Pragmatic', NULL, 'pragmatic/01J5HHC0Y8MJV90BGV8PZGFGJH.avif', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 3, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1216, 2, NULL, 'vs20candvil', 'Candy Village', 'vs20candvil', 'Pragmatic', NULL, 'pragmatic/01J5HHCMTC4SVZKCE0XEC7WTEH.avif', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 0, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1217, 2, NULL, 'vs20daydead', 'Day of Dead', 'vs20daydead', 'Pragmatic', NULL, 'pragmatic/01J5HHD6J24Q2GGPS65D626WEE.avif', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 0, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1218, 2, NULL, 'vs20doghouse', 'The Dog House', 'vs20doghouse', 'Pragmatic', NULL, 'pragmatic/01J5HHDRXWFHTNSQTSB9N9CQWR.avif', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 1, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1219, 2, NULL, 'vs20egypt', 'Egyptian Fortunes', 'vs20egypt', 'Pragmatic', NULL, 'pragmatic/01J5HHEAX4ANJ84WFTHN2VHVJG.avif', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 0, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1220, 2, NULL, 'vs20fruitsw', 'Sweet Bonanza', 'vs20fruitsw', 'Pragmatic', NULL, 'pragmatic/01J5HHEX8BYVPK94QAP7VC3KDE.avif', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 0, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1221, 2, NULL, 'vs20olympgate', 'Gates of Olympus', 'vs20olympgate', 'Pragmatic', NULL, 'pragmatic/01J5HHFG65DEK4WT9DVKKZMCPZ.avif', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 1, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1222, 2, NULL, 'vs20pbonanza', 'Pyramid Bonanza', 'vs20pbonanza', 'Pragmatic', NULL, 'pragmatic/01J5HHG2X9SDVYNZS3BXMZZJ4G.avif', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 0, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1223, 2, NULL, 'vs20sbxmas', 'Sweet Bonanza Xmas', 'vs20sbxmas', 'Pragmatic', NULL, 'pragmatic/01J5HHBF0GZ2QV5KJ5XJEH5M5T.avif', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 0, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1224, 2, NULL, 'vs20schristmas', 'Starlight Christmas', 'vs20schristmas', 'Pragmatic', NULL, 'pragmatic/01J5HGJQNAK6XJ755Z43N6FVYZ.png', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 0, 0, 0, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1225, 2, NULL, 'vs20starlight', 'Starlight Princess', 'vs20starlight', 'Pragmatic', NULL, 'pragmatic/01J5HGKB4NB5GA87M3Q1ZBFDVZ.png', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 1, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1226, 2, NULL, 'vs20sugarrush', 'Suggar Rush', 'vs20sugarrush', 'Pragmatic', NULL, 'pragmatic/01J5HGM4R2AZ9S1PFXWY10TBWC.png', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 34, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1227, 2, NULL, 'vs20sugarrushx', 'Suggar Rush 1000', 'vs20sugarrushx', 'Pragmatic', NULL, 'pragmatic/01J5HGMQMK4HP7BD47ACHW7NAC.png', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 2, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1228, 2, NULL, 'vs20tweethouse', 'The Tweety House', 'vs20tweethouse', 'Pragmatic', NULL, 'pragmatic/01J5HGN9X4JN4R0WEKX4YHN93Q.png', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 0, 0, 1, '2024-03-06 11:41:58', '2024-08-17 23:29:34'),
(1229, 2, NULL, 'vs20wildboost', 'Wild Booster', 'vs20wildboost', 'Pragmatic', NULL, 'pragmatic/01J5HGNV1WRKSFWVT637Z0KHP2.png', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 0, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1230, 2, NULL, 'vs20wildpix', 'Wild Pixies', 'vs20wildpix', 'Pragmatic', NULL, 'pragmatic/01J5HGPD0WQ79Z0EVR77745D72.png', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 0, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1231, 2, NULL, 'vs25chilli', 'Chili Heat', 'vs25chilli', 'Pragmatic', NULL, 'pragmatic/01J5HGPYPAKCSV6K3GTBGZWEBK.png', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 0, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1232, 2, NULL, 'vs25gladiator', 'Wild Gladiators', 'vs25gladiator', 'Pragmatic', NULL, 'pragmatic/01J5HGQJ9NWQMWTJTDT0E8A84W.png', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 2, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1233, 2, NULL, 'vs25pyramid', 'Pyramid King', 'vs25pyramid', 'Pragmatic', NULL, 'pragmatic/01J5HGWVHGNGC53BTJKXDYD83N.jpg', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 0, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1234, 2, NULL, 'vs25tigerwar', 'The Tiger Warrior', 'vs25tigerwar', 'Pragmatic', NULL, 'pragmatic/01J5HH0AYBGAKM2JEF8FDD8RNK.avif', '0', 'html5', 0, 1, 0, 0, 0, 1, 'xgamesclub', 10, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1235, 2, NULL, 'vs25wolfgold', 'Wolf Gold', 'vs25wolfgold', 'Pragmatic', NULL, 'pragmatic/01J5HH112ZQM0N71T2KC2CD9EP.avif', '0', 'html5', 0, 1, 0, 0, 0, 1, 'xgamesclub', 1, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1236, 2, NULL, 'vs40pirate', 'Pirate Gold', 'vs40pirate', 'Pragmatic', NULL, 'pragmatic/01J5HH1JQT4VCFKVJHD3V641YN.avif', '0', 'html5', 0, 1, 0, 0, 0, 1, 'xgamesclub', 1, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1237, 2, NULL, 'vs40samurai3', 'Rise of Samurai 3', 'vs40samurai3', 'Pragmatic', NULL, 'pragmatic/01J5HH28KVPATZ9G8QGZ18ZSF5.avif', '0', 'html5', 1, 0, 0, 0, 0, 1, 'xgamesclub', 0, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1238, 2, NULL, 'vs40spartaking', 'Spartan King', 'vs40spartaking', 'Pragmatic', NULL, 'pragmatic/01J5HH2YDWZ6J1JD2GKWZ7ZG9C.avif', '0', 'html5', 0, 1, 0, 0, 0, 1, 'xgamesclub', 0, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1239, 2, NULL, 'vs40wildwest', 'Wild West Gold', 'vs40wildwest', 'Pragmatic', NULL, 'pragmatic/01J5HH3GHP7RRSTQ4GTGZ10PHP.avif', '0', 'html5', 0, 1, 0, 0, 0, 1, 'xgamesclub', 2, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1240, 2, NULL, 'vs50safariking', 'Safari King', 'vs50safariking', 'Pragmatic', NULL, 'pragmatic/01J5HH42T1GYVP5ZXY8D6TEC0G.avif', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 0, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1241, 2, NULL, 'vs5strh', 'Striking Hot 5', 'vs5strh', 'Pragmatic', NULL, 'pragmatic/01J5HH4PH3KWMKKCD00WPCR2H6.avif', '0', 'html5', 0, 0, 0, 0, 0, 1, 'xgamesclub', 1, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1242, 2, NULL, 'vs5super7', 'Super 7s', 'vs5super7', 'Pragmatic', NULL, 'pragmatic/01J5HGGK4EWZJVDDB925PW4YE8.png', '0', 'html5', 0, 1, 0, 0, 0, 1, 'xgamesclub', 1, 0, 1, '2024-03-06 11:41:58', '2024-09-09 14:33:19'),
(1580, 29, NULL, '8357', 'Sport Bet', '8357', 'sport', NULL, '01J870E4V9GQNZM6203QDF27GC.jpg', '1', 'html5', 0, 0, 0, 0, 0, 90, 'playconnect', 50000000032, 0, 0, '2024-09-13 04:46:03', '2025-01-02 02:38:26'),
(1582, 2, NULL, 'vs10bbkir', 'Big Bass Bonanza Keeping it Reel', 'vs10bbkir', 'Pragmatic', NULL, '01J5HH6D61H5RTPRCTG5ZY06B1.avif', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 1896, 0, 1, '2024-03-06 14:41:58', '2024-08-23 20:05:59'),
(1583, 2, NULL, 'vs10bxmasbnza', 'Christmans Big Bass Bonanza', 'vs10bxmasbnza', 'Pragmatic', NULL, '01J5HH6ZX01EHHACTKRMDSTBHY.avif', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 1897, 0, 1, '2024-03-06 14:41:58', '2024-08-23 17:25:30'),
(1584, 2, NULL, 'vs10cowgold', 'Cowboys Gold', 'vs10cowgold', 'Pragmatic', NULL, '01J5HH7HPQ9113E27HN9W8PPJH.avif', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 2, 0, 1, '2024-03-06 14:41:58', '2024-08-22 23:55:02'),
(1585, 2, NULL, 'vs10returndead', 'Return of the Dead', 'vs10returndead', 'Pragmatic', NULL, '01J5HH85FJGEQ9ESEQ3ZZ1MQ2T.avif', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 1, 0, 1, '2024-03-06 14:41:58', '2024-08-23 00:08:16'),
(1586, 2, NULL, 'vs10txbigbass', 'Big Bass Splash', 'vs10txbigbass', 'Pragmatic', NULL, '01J5HH8SS5YQDKRZAR0G14Y08Y.avif', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 1896, 0, 1, '2024-03-06 14:41:58', '2024-08-23 18:08:07'),
(1587, 2, NULL, 'vs10vampwolf', 'Vampires vs Wolves', 'vs10vampwolf', 'Pragmatic', NULL, '01J5HH9FQ7FW5C4F2B3ET9SEY4.avif', '1', 'html5', 0, 1, 0, 0, 0, 1, 'apipragmatic40', 0, 0, 1, '2024-03-06 14:41:58', '2024-08-18 15:59:19'),
(1588, 2, NULL, 'vs12bbb', 'Bigger Bass Bonanza', 'vs12bbb', 'Pragmatic', NULL, '01J5HHA1D2NBR3YKPNGZ79R54P.avif', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 1898, 0, 1, '2024-03-06 14:41:58', '2024-08-23 17:28:17'),
(1589, 2, NULL, 'vs12bbbxmas', 'Bigger Bass Blizzard Christmas Catch', 'vs12bbbxmas', 'Pragmatic', NULL, '01J5HHAWKEC05W3H4YR91REQMJ.avif', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 1905, 0, 1, '2024-03-06 14:41:58', '2024-12-13 22:58:32'),
(1590, 2, NULL, 'vs20bchprty', 'Wild Beach Party', 'vs20bchprty', 'Pragmatic', NULL, '01J5HH58367F3T1YSKY699N1DH.avif', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 1904, 0, 1, '2024-03-06 14:41:58', '2024-08-23 15:38:00'),
(1591, 2, NULL, 'vs20bonzgold', 'Bonanza Gold', 'vs20bonzgold', 'Pragmatic', NULL, '01J5HHC0Y8MJV90BGV8PZGFGJH.avif', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 3, 0, 1, '2024-03-06 14:41:58', '2024-08-23 17:16:24'),
(1592, 2, NULL, 'vs20candvil', 'Candy Village', 'vs20candvil', 'Pragmatic', NULL, '01J5HHCMTC4SVZKCE0XEC7WTEH.avif', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 1898, 0, 1, '2024-03-06 14:41:58', '2024-08-23 17:56:30'),
(1593, 2, NULL, 'vs20daydead', 'Day of Dead', 'vs20daydead', 'Pragmatic', NULL, '01J5HHD6J24Q2GGPS65D626WEE.avif', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 1896, 0, 1, '2024-03-06 14:41:58', '2024-08-22 17:03:52'),
(1594, 2, NULL, 'vs20doghouse', 'The Dog House', 'vs20doghouse', 'Pragmatic', NULL, '01J5HHDRXWFHTNSQTSB9N9CQWR.avif', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 1940, 0, 1, '2024-03-06 14:41:58', '2024-08-23 19:05:02'),
(1595, 2, NULL, 'vs20egypt', 'Egyptian Fortunes', 'vs20egypt', 'Pragmatic', NULL, '01J5HHEAX4ANJ84WFTHN2VHVJG.avif', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 1896, 0, 1, '2024-03-06 14:41:58', '2024-08-22 23:41:16'),
(1596, 2, NULL, 'vs20fruitsw', 'Sweet Bonanza', 'vs20fruitsw', 'Pragmatic', NULL, '01J5HHEX8BYVPK94QAP7VC3KDE.avif', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 1909, 0, 1, '2024-03-06 14:41:58', '2024-08-23 21:34:29'),
(1597, 2, NULL, 'vs20olympgate', 'Gates of Olympus', 'vs20olympgate', 'Pragmatic', NULL, '01J5HHFG65DEK4WT9DVKKZMCPZ.avif', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 1910, 0, 1, '2024-03-06 14:41:58', '2024-08-23 14:46:46'),
(1598, 2, NULL, 'vs20pbonanza', 'Pyramid Bonanza', 'vs20pbonanza', 'Pragmatic', NULL, '01J5HHG2X9SDVYNZS3BXMZZJ4G.avif', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 1898, 0, 1, '2024-03-06 14:41:58', '2024-08-23 00:10:54'),
(1599, 2, NULL, 'vs20sbxmas', 'Sweet Bonanza Xmas', 'vs20sbxmas', 'Pragmatic', NULL, '01J5HHBF0GZ2QV5KJ5XJEH5M5T.avif', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 1899, 0, 1, '2024-03-06 14:41:58', '2024-08-23 21:22:39'),
(1600, 2, NULL, 'vs20schristmas', 'Starlight Christmas', 'vs20schristmas', 'Pragmatic', NULL, '01J5HGJQNAK6XJ755Z43N6FVYZ.png', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 0, 0, 0, '2024-03-06 14:41:58', '2024-08-18 03:08:39'),
(1601, 2, NULL, 'vs20starlight', 'Starlight Princess', 'vs20starlight', 'Pragmatic', NULL, '01J5HGKB4NB5GA87M3Q1ZBFDVZ.png', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 1, 0, 1, '2024-03-06 14:41:58', '2024-08-22 20:35:17'),
(1602, 2, NULL, 'vs20sugarrush', 'Suggar Rush', 'vs20sugarrush', 'Pragmatic', NULL, '01J5HGM4R2AZ9S1PFXWY10TBWC.png', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 11, 0, 1, '2024-03-06 14:41:58', '2024-11-06 23:43:18'),
(1603, 2, NULL, 'vs20sugarrushx', 'Suggar Rush 1000', 'vs20sugarrushx', 'Pragmatic', NULL, '01J5HGMQMK4HP7BD47ACHW7NAC.png', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 3, 0, 1, '2024-03-06 14:41:58', '2024-12-13 15:35:14'),
(1604, 2, NULL, 'vs20tweethouse', 'The Tweety House', 'vs20tweethouse', 'Pragmatic', NULL, '01J5HGN9X4JN4R0WEKX4YHN93Q.png', '0', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 1897, 0, 1, '2024-03-06 14:41:58', '2024-08-18 02:29:34'),
(1605, 2, NULL, 'vs20wildboost', 'Wild Booster', 'vs20wildboost', 'Pragmatic', NULL, '01J5HGNV1WRKSFWVT637Z0KHP2.png', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 0, 0, 1, '2024-03-06 14:41:58', '2024-08-18 15:51:17'),
(1606, 2, NULL, 'vs20wildpix', 'Wild Pixies', 'vs20wildpix', 'Pragmatic', NULL, '01J5HGPD0WQ79Z0EVR77745D72.png', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 0, 0, 1, '2024-03-06 14:41:58', '2024-08-18 15:52:19'),
(1607, 2, NULL, 'vs25chilli', 'Chili Heat', 'vs25chilli', 'Pragmatic', NULL, '01J5HGPYPAKCSV6K3GTBGZWEBK.png', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 0, 0, 1, '2024-03-06 14:41:58', '2024-08-18 15:52:35'),
(1608, 2, NULL, 'vs25gladiator', 'Wild Gladiators', 'vs25gladiator', 'Pragmatic', NULL, '01J5HGQJ9NWQMWTJTDT0E8A84W.png', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 2, 0, 1, '2024-03-06 14:41:58', '2024-08-22 23:41:59'),
(1609, 2, NULL, 'vs25pyramid', 'Pyramid King', 'vs25pyramid', 'Pragmatic', NULL, '01J5HGWVHGNGC53BTJKXDYD83N.jpg', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 0, 0, 1, '2024-03-06 14:41:58', '2024-08-18 15:53:07'),
(1610, 2, NULL, 'vs25tigerwar', 'The Tiger Warrior', 'vs25tigerwar', 'Pragmatic', NULL, '01J5HH0AYBGAKM2JEF8FDD8RNK.avif', '1', 'html5', 0, 1, 0, 0, 0, 1, 'apipragmatic40', 9, 0, 1, '2024-03-06 14:41:58', '2024-08-23 17:58:36'),
(1611, 2, NULL, 'vs25wolfgold', 'Wolf Gold', 'vs25wolfgold', 'Pragmatic', NULL, '01J5HH112ZQM0N71T2KC2CD9EP.avif', '1', 'html5', 0, 1, 0, 0, 0, 1, 'apipragmatic40', 1, 0, 1, '2024-03-06 14:41:58', '2024-08-22 22:47:10'),
(1612, 2, NULL, 'vs40pirate', 'Pirate Gold', 'vs40pirate', 'Pragmatic', NULL, '01J5HH1JQT4VCFKVJHD3V641YN.avif', '1', 'html5', 0, 1, 0, 0, 0, 1, 'apipragmatic40', 1, 0, 1, '2024-03-06 14:41:58', '2024-08-22 17:49:09'),
(1613, 2, NULL, 'vs40samurai3', 'Rise of Samurai 3', 'vs40samurai3', 'Pragmatic', NULL, '01J5HH28KVPATZ9G8QGZ18ZSF5.avif', '1', 'html5', 1, 0, 0, 0, 0, 1, 'apipragmatic40', 0, 0, 1, '2024-03-06 14:41:58', '2024-08-18 15:56:57'),
(1614, 2, NULL, 'vs40spartaking', 'Spartan King', 'vs40spartaking', 'Pragmatic', NULL, '01J5HH2YDWZ6J1JD2GKWZ7ZG9C.avif', '1', 'html5', 0, 1, 0, 0, 0, 1, 'apipragmatic40', 0, 0, 1, '2024-03-06 14:41:58', '2024-08-18 15:57:15'),
(1615, 2, NULL, 'vs40wildwest', 'Wild West Gold', 'vs40wildwest', 'Pragmatic', NULL, '01J5HH3GHP7RRSTQ4GTGZ10PHP.avif', '1', 'html5', 0, 1, 0, 0, 0, 1, 'apipragmatic40', 2, 0, 1, '2024-03-06 14:41:58', '2024-08-23 14:48:56'),
(1616, 2, NULL, 'vs50safariking', 'Safari King', 'vs50safariking', 'game_type', NULL, '01J5HH42T1GYVP5ZXY8D6TEC0G.avif', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 0, 0, 1, '2024-03-06 14:41:58', '2024-08-18 15:57:38'),
(1617, 2, NULL, 'vs5strh', 'Striking Hot 5', 'vs5strh', 'game_type', NULL, '01J5HH4PH3KWMKKCD00WPCR2H6.avif', '1', 'html5', 0, 0, 0, 0, 0, 1, 'apipragmatic40', 1, 0, 1, '2024-03-06 14:41:58', '2024-08-23 17:23:17'),
(1618, 2, NULL, 'vs5super7', 'Super 7s', 'vs5super7', 'Pragmatic', NULL, '01J5HGGK4EWZJVDDB925PW4YE8.png', '1', 'html5', 0, 1, 0, 0, 0, 1, 'apipragmatic40', 0, 0, 1, '2024-03-06 14:41:58', '2024-08-18 15:58:03');

-- --------------------------------------------------------

--
-- Estrutura para tabela `games_keys`
--

CREATE TABLE `games_keys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `apipragmatic40_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apipragmatic40_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apipragmatic40_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apipragmatic40_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wizze_agent_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wizze_agent_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wizze_agent_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wizze_api_endpoint` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `games_keys`
--

INSERT INTO `games_keys` (`id`, `apipragmatic40_url`, `apipragmatic40_secret`, `apipragmatic40_code`, `apipragmatic40_token`, `wizze_agent_code`, `wizze_agent_token`, `wizze_agent_secret`, `wizze_api_endpoint`, `created_at`, `updated_at`) VALUES
(1, 'https://api.xgamesclub.com', '03144727451d95070616e1af86142c93', 'demo01', '993eb24fa968f5e42db16373a6ad4599', 'free', '3b0cb5e30d0d1aee62ba02d1870cb914', '6c2e609fc7ee3672f3abfc97317e9a33', 'https://api.pg-softgames.site/api/v1/', '2023-11-30 18:03:08', '2025-01-06 08:52:41');

-- --------------------------------------------------------

--
-- Estrutura para tabela `game_favorites`
--

CREATE TABLE `game_favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `game_likes`
--

CREATE TABLE `game_likes` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `game_reviews`
--

CREATE TABLE `game_reviews` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `suitpay_uri` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suitpay_cliente_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suitpay_cliente_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_production` tinyint(4) DEFAULT 0,
  `stripe_public_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_secret_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_webhook_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `gateways`
--

INSERT INTO `gateways` (`id`, `suitpay_uri`, `suitpay_cliente_id`, `suitpay_cliente_secret`, `stripe_production`, `stripe_public_key`, `stripe_secret_key`, `stripe_webhook_key`, `created_at`, `updated_at`) VALUES
(1, 'https://api.suitmoney.com', 'talitonsilva_BCHLH7MW', 'PC4g2zAkQb1NMmT052mRva9e0vmQNBQZQfQ9LQk7hBNMVGuufTnmjtY3N24OhwKmYSqtSn6ta51hOr1aaJcANyjXlNIoCha1j41l', 0, NULL, NULL, NULL, '2023-11-30 21:05:51', '2024-12-31 17:17:09');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggds_spin_config`
--

CREATE TABLE `ggds_spin_config` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `prizes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `ggds_spin_config`
--

INSERT INTO `ggds_spin_config` (`id`, `prizes`, `created_at`, `updated_at`) VALUES
(1, '[{\"currency\":\"BRL\",\"value\":5},{\"currency\":\"BRL\",\"value\":0},{\"currency\":\"BRL\",\"value\":1},{\"currency\":\"BRL\",\"value\":0},{\"currency\":\"BRL\",\"value\":2},{\"currency\":\"BRL\",\"value\":5},{\"currency\":\"BRL\",\"value\":0},{\"currency\":\"BRL\",\"value\":5},{\"currency\":\"BRL\",\"value\":1},{\"currency\":\"BRL\",\"value\":0},{\"currency\":\"BRL\",\"value\":3},{\"currency\":\"BRL\",\"value\":0},{\"currency\":\"BRL\",\"value\":1},{\"currency\":\"BRL\",\"value\":5},{\"currency\":\"BRL\",\"value\":0},{\"currency\":\"BRL\",\"value\":10}]', '2024-01-11 20:52:59', '2024-04-13 11:07:31');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggds_spin_runs`
--

CREATE TABLE `ggds_spin_runs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonce` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `possibilities` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `prize` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `ggds_spin_runs`
--

INSERT INTO `ggds_spin_runs` (`id`, `key`, `nonce`, `possibilities`, `prize`, `created_at`, `updated_at`) VALUES
(1, '526db7d417473d56275f7dffa72c0c3382aa76df7adcfe7216951fca7dc5e810', '11bea414-f850-460a-91d2-a9703e47ca2e', '[{\"currency\":\"BRL\",\"value\":5},{\"currency\":\"BRL\",\"value\":10},{\"currency\":\"BRL\",\"value\":25},{\"currency\":\"BRL\",\"value\":30},{\"currency\":\"BRL\",\"value\":40},{\"currency\":\"BRL\",\"value\":50},{\"currency\":\"BRL\",\"value\":90},{\"currency\":\"BRL\",\"value\":100},{\"currency\":\"BRL\",\"value\":140},{\"currency\":\"BRL\",\"value\":15},{\"currency\":\"BRL\",\"value\":30},{\"currency\":\"BRL\",\"value\":500},{\"currency\":\"BRL\",\"value\":1000},{\"currency\":\"BRL\",\"value\":1500},{\"currency\":\"BRL\",\"value\":2000},{\"currency\":\"BRL\",\"value\":2500}]', '{\"currency\":\"BRL\",\"value\":15}', '2024-06-10 21:48:09', '2024-06-10 21:48:09'),
(2, '2c35774a073f9e945a91b9b12b5147639cca66234af69b34b0d6656595372c96', '2b712589-b2ad-40af-82c3-ea01fec5f308', '[{\"currency\":\"BRL\",\"value\":5},{\"currency\":\"BRL\",\"value\":10},{\"currency\":\"BRL\",\"value\":25},{\"currency\":\"BRL\",\"value\":30},{\"currency\":\"BRL\",\"value\":40},{\"currency\":\"BRL\",\"value\":50},{\"currency\":\"BRL\",\"value\":90},{\"currency\":\"BRL\",\"value\":100},{\"currency\":\"BRL\",\"value\":140},{\"currency\":\"BRL\",\"value\":15},{\"currency\":\"BRL\",\"value\":30},{\"currency\":\"BRL\",\"value\":500},{\"currency\":\"BRL\",\"value\":1000},{\"currency\":\"BRL\",\"value\":1500},{\"currency\":\"BRL\",\"value\":2000},{\"currency\":\"BRL\",\"value\":2500}]', '{\"currency\":\"BRL\",\"value\":5}', '2024-06-10 21:48:20', '2024-06-10 21:48:20'),
(3, 'b2fb0a536434ff90262f17a8963eae59832e778196200fad4ecc1910acbb57f8', '12186e41-b242-4384-8d36-bdcf6a98f9a7', '[{\"currency\":\"BRL\",\"value\":5},{\"currency\":\"BRL\",\"value\":10},{\"currency\":\"BRL\",\"value\":25},{\"currency\":\"BRL\",\"value\":30},{\"currency\":\"BRL\",\"value\":40},{\"currency\":\"BRL\",\"value\":50},{\"currency\":\"BRL\",\"value\":90},{\"currency\":\"BRL\",\"value\":100},{\"currency\":\"BRL\",\"value\":140},{\"currency\":\"BRL\",\"value\":15},{\"currency\":\"BRL\",\"value\":30},{\"currency\":\"BRL\",\"value\":500},{\"currency\":\"BRL\",\"value\":1000},{\"currency\":\"BRL\",\"value\":1500},{\"currency\":\"BRL\",\"value\":2000},{\"currency\":\"BRL\",\"value\":2500}]', '{\"currency\":\"BRL\",\"value\":5}', '2024-06-28 07:36:39', '2024-06-28 07:36:39');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggr_games`
--

CREATE TABLE `ggr_games` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `game` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance_bet` decimal(20,2) NOT NULL DEFAULT 0.00,
  `balance_win` decimal(20,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aggregator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggr_games_world_slots`
--

CREATE TABLE `ggr_games_world_slots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `game` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance_bet` decimal(20,2) NOT NULL DEFAULT 0.00,
  `balance_win` decimal(20,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'BRL',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `liked_user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0000_00_00_000000_create_websockets_statistics_entries_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(15, '2023_10_30_034921_create_settings_table', 6),
(7, '2023_11_03_205251_create_sport_categories_table', 1),
(8, '2023_11_03_205252_create_sports_table', 1),
(10, '2023_11_04_001342_create_sport_events_table', 2),
(11, '2023_11_04_213841_add_fields_to_users_table', 3),
(12, '2023_11_07_202919_create_currencies_table', 4),
(13, '2023_11_07_210310_create_wallets_table', 5),
(16, '2023_11_07_214236_create_withdrawals_table', 7),
(17, '2023_11_07_214240_create_deposits_table', 7),
(18, '2023_11_07_214244_create_orders_table', 7),
(19, '2023_11_07_214708_create_suit_pay_payments_table', 7),
(20, '2023_11_07_215204_create_notifications_table', 8),
(21, '2023_11_07_202919_create_currency_alloweds_table', 9),
(22, '2023_11_11_205824_create_casino_categories_table', 9),
(23, '2023_11_11_205834_create_casino_providers_table', 9),
(24, '2023_11_11_205938_create_casino_games_slotgrators_table', 9),
(25, '2023_11_11_210018_create_casino_games_kscinuses_table', 9),
(26, '2023_11_12_225424_create_transactions_table', 10),
(27, '2023_11_12_225431_create_affiliate_histories_table', 10),
(28, '2023_11_12_234643_add_field_to_wallet_table', 11),
(29, '2023_11_14_203632_create_likes_table', 12),
(30, '2023_09_27_214903_create_wallet_changes_table', 13),
(31, '2023_11_16_155140_create_permission_tables', 14),
(32, '2023_11_17_012533_add_language_to_users_table', 15),
(33, '2023_11_22_171616_create_football_leagues_table', 16),
(34, '2023_11_22_175530_create_football_venues_table', 17),
(35, '2023_11_22_175547_create_football_teams_table', 17),
(36, '2023_11_23_143637_create_football_events_table', 18),
(38, '2023_11_29_134520_create_sport_bets_table', 19),
(39, '2023_11_29_135451_create_sport_bets_odds_table', 19),
(40, '2023_11_30_195548_create_gateways_table', 20),
(41, '2023_11_30_195557_create_games_keys_table', 20),
(42, '2023_11_30_195609_create_setting_mails_table', 20),
(43, '2023_10_08_111755_add_fields_to_game_exclusives_table', 20),
(44, '2023_10_07_183921_create_game_exclusives_table', 21),
(45, '2023_10_11_144956_create_system_wallets_table', 22),
(46, '2023_12_18_172721_create_banners_table', 23),
(47, '2023_12_20_135908_create_casino_games_salsas_table', 24),
(48, '2023_12_23_224032_create_fivers_providers_table', 25),
(49, '2023_12_23_224105_create_fivers_games_table', 25),
(50, '2023_12_31_121453_create_custom_layouts_table', 26),
(51, '2024_01_01_193712_create_g_g_r_games_fivers_table', 27),
(52, '2024_01_14_155144_create_missions_table', 28),
(53, '2024_01_14_155150_create_mission_users_table', 28),
(54, '2024_01_19_120728_create_ka_gamings_table', 29),
(55, '2024_01_19_170650_create_categories_table', 30),
(56, '2024_01_19_170657_create_providers_table', 30),
(57, '2024_01_19_170658_create_games_table', 31),
(58, '2023_10_07_183920_create_categories_table', 32),
(59, '2023_10_07_183921_create_providers_table', 33),
(60, '2023_10_07_183922_create_games_table', 34),
(61, '2024_01_20_144529_create_category_games_table', 35),
(62, '2024_01_20_182155_add_vibra_to_games_keys_table', 36),
(63, '2024_01_21_173742_create_game_favorites_table', 37),
(64, '2024_01_21_173752_create_game_likes_table', 37),
(65, '2024_01_21_173803_create_game_reviews_table', 37),
(66, '2024_01_11_231932_create_vibra_casino_games_table', 38),
(69, '2024_01_28_194456_add_vip_to_wallet_table', 40),
(68, '2024_01_28_194645_create_vips_table', 39),
(70, '2024_01_28_231843_create_vip_users_table', 41),
(71, '2024_01_29_102939_add_paid_to_limits_table', 41),
(72, '2024_01_10_001705_create_sub_affiliates_table', 42),
(73, '2024_01_30_120547_create_affiliate_withdraws_table', 43),
(74, '2024_02_09_233936_add_worldslot_to_games_keys_table', 44),
(75, '2024_02_10_191215_add_disable_spin_to_settings_table', 45),
(76, '2024_02_17_210822_add_games2_to_games_keys_table', 46),
(78, '2024_02_20_004853_add_sub_to_settings_table', 47),
(79, '2024_02_24_121146_add_header_to_custom_layouts_table', 48),
(80, '2024_02_26_144235_create_ggr_games_world_slots_table', 49),
(81, '2024_03_01_172613_add_evergame_to_games_keys_table', 50),
(82, '2024_03_03_201700_add_venixkey_to_games_keys_table', 51),
(83, '2024_03_08_201557_add_play_gaming_to_games_keys_table', 52),
(84, '2024_03_21_154342_add_headerbody_to_custom_layouts_table', 53),
(85, '2024_03_21_154342_add_headerbody_to_custom_layouts_table', 54),
(86, '2024_03_21_223739_add_sharkpay_to_gateways_table', 55),
(87, '2024_03_21_230017_add_reference_to_transactions_table', 56),
(88, '2024_03_24_125025_add_rollver_protection_to_settings_table', 57),
(89, '2024_03_24_134101_add_accept_bonus_to_transactions_table', 58),
(90, '2024_03_24_172243_add_receita_to_affiliate_histories_table', 59),
(91, '2024_03_26_161932_add_baseline_column_to_settings_table', 60),
(92, '2024_03_26_234226_add_playigaming_column_to_games_key_table', 61),
(93, '2024_03_25_231103_add_mercado_pago_column_to_gateways_table', 62),
(94, '2024_03_30_215051_add_social_to_custom_layouts_table', 63),
(98, '2024_03_30_225900_create_digito_pay_payments_table', 66),
(96, '2024_03_30_225929_add_digitopay_to_gateways_table', 64),
(97, '2024_03_31_124211_add_digitopay_to_settings_table', 65),
(99, '2024_04_02_140932_add_default_gateway_to_settings_table', 67),
(100, '2024_03_08_201557_add_imperium_games_to_games_keys_table', 68),
(101, '2024_04_12_201402_add_hash_to_transactions_table', 69);

-- --------------------------------------------------------

--
-- Estrutura para tabela `missions`
--

CREATE TABLE `missions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `challenge_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `challenge_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `challenge_rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `challenge_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'game',
  `challenge_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `challenge_start_date` datetime NOT NULL,
  `challenge_end_date` datetime NOT NULL,
  `challenge_bonus` decimal(20,2) NOT NULL DEFAULT 0.00,
  `challenge_total` bigint(20) NOT NULL DEFAULT 1,
  `challenge_currency` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `challenge_provider` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `challenge_gameid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mission_users`
--

CREATE TABLE `mission_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `mission_id` int(10) UNSIGNED NOT NULL,
  `rounds` bigint(20) DEFAULT 0,
  `rewards` decimal(10,2) DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 330),
(2, 'App\\Models\\User', 387),
(2, 'App\\Models\\User', 388),
(2, 'App\\Models\\User', 389),
(2, 'App\\Models\\User', 390),
(2, 'App\\Models\\User', 391),
(2, 'App\\Models\\User', 393),
(2, 'App\\Models\\User', 394),
(2, 'App\\Models\\User', 395),
(2, 'App\\Models\\User', 396),
(2, 'App\\Models\\User', 397),
(2, 'App\\Models\\User', 398),
(2, 'App\\Models\\User', 400),
(2, 'App\\Models\\User', 401),
(2, 'App\\Models\\User', 402),
(2, 'App\\Models\\User', 403),
(2, 'App\\Models\\User', 404),
(2, 'App\\Models\\User', 405),
(2, 'App\\Models\\User', 406),
(2, 'App\\Models\\User', 407),
(2, 'App\\Models\\User', 409),
(2, 'App\\Models\\User', 411),
(2, 'App\\Models\\User', 412),
(2, 'App\\Models\\User', 413),
(2, 'App\\Models\\User', 414),
(2, 'App\\Models\\User', 416),
(2, 'App\\Models\\User', 417),
(2, 'App\\Models\\User', 418),
(2, 'App\\Models\\User', 419),
(2, 'App\\Models\\User', 421),
(2, 'App\\Models\\User', 423),
(2, 'App\\Models\\User', 424),
(2, 'App\\Models\\User', 427),
(2, 'App\\Models\\User', 428),
(2, 'App\\Models\\User', 429),
(2, 'App\\Models\\User', 430),
(2, 'App\\Models\\User', 431),
(2, 'App\\Models\\User', 433),
(2, 'App\\Models\\User', 435),
(2, 'App\\Models\\User', 436),
(2, 'App\\Models\\User', 574);

-- --------------------------------------------------------

--
-- Estrutura para tabela `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `game` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_money` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `providers` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refunded` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `round_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_demo_agent` tinyint(1) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('sillencybass@gmail.com', 'XuHWO', '2024-10-17 03:15:59'),
('talitonfnpc@gmail.com', 'NXkyE', '2024-10-17 03:48:29'),
('sergiolima78@gmail.com', '7MU4l', '2025-01-05 13:27:53');

-- --------------------------------------------------------

--
-- Estrutura para tabela `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'games-exclusive-edit', 'web', '2023-10-12 16:23:45', '2023-10-12 18:12:28'),
(2, 'games-exclusive-view', 'web', '2023-10-12 16:23:56', '2023-10-12 18:11:25'),
(3, 'games-exclusive-create', 'web', '2023-10-12 16:25:06', '2023-10-12 18:11:10'),
(4, 'admin-view', 'web', '2023-10-12 17:56:35', '2023-10-12 17:56:35'),
(5, 'admin-create', 'web', '2023-10-12 18:56:02', '2023-10-12 18:56:02'),
(6, 'admin-edit', 'web', '2023-10-12 18:56:27', '2023-10-12 18:56:27'),
(7, 'admin-delete', 'web', '2023-10-12 18:56:55', '2023-10-12 18:56:55'),
(8, 'category-view', 'web', '2023-10-12 19:01:31', '2023-10-12 19:01:31'),
(9, 'category-create', 'web', '2023-10-12 19:01:46', '2023-10-12 19:01:46'),
(10, 'category-edit', 'web', '2023-10-12 19:01:59', '2023-10-12 19:01:59'),
(11, 'category-delete', 'web', '2023-10-12 19:02:09', '2023-10-12 19:02:09'),
(12, 'game-view', 'web', '2023-10-12 19:02:27', '2023-10-12 19:02:27'),
(13, 'game-create', 'web', '2023-10-12 19:02:36', '2023-10-12 19:02:36'),
(14, 'game-edit', 'web', '2023-10-12 19:02:44', '2023-10-12 19:02:44'),
(15, 'game-delete', 'web', '2023-10-12 19:02:54', '2023-10-12 19:02:54'),
(16, 'wallet-view', 'web', '2023-10-12 19:05:49', '2023-10-12 19:05:49'),
(17, 'wallet-create', 'web', '2023-10-12 19:06:01', '2023-10-12 19:06:01'),
(18, 'wallet-edit', 'web', '2023-10-12 19:06:11', '2023-10-12 19:06:11'),
(19, 'wallet-delete', 'web', '2023-10-12 19:06:18', '2023-10-12 19:06:18'),
(20, 'deposit-view', 'web', '2023-10-12 19:06:44', '2023-10-12 19:06:44'),
(21, 'deposit-create', 'web', '2023-10-12 19:06:56', '2023-10-12 19:06:56'),
(22, 'deposit-edit', 'web', '2023-10-12 19:07:05', '2023-10-12 19:07:05'),
(23, 'deposit-update', 'web', '2023-10-12 19:08:00', '2023-10-12 19:08:00'),
(24, 'deposit-delete', 'web', '2023-10-12 19:08:11', '2023-10-12 19:08:11'),
(25, 'withdrawal-view', 'web', '2023-10-12 19:09:31', '2023-10-12 19:09:31'),
(26, 'withdrawal-create', 'web', '2023-10-12 19:09:40', '2023-10-12 19:09:40'),
(27, 'withdrawal-edit', 'web', '2023-10-12 19:09:51', '2023-10-12 19:09:51'),
(28, 'withdrawal-update', 'web', '2023-10-12 19:10:00', '2023-10-12 19:10:00'),
(29, 'withdrawal-delete', 'web', '2023-10-12 19:10:09', '2023-10-12 19:10:09'),
(30, 'order-view', 'web', '2023-10-12 19:12:36', '2023-10-12 19:12:36'),
(31, 'order-create', 'web', '2023-10-12 19:12:47', '2023-10-12 19:12:47'),
(32, 'order-edit', 'web', '2023-10-12 19:12:56', '2023-10-12 19:12:56'),
(33, 'order-update', 'web', '2023-10-12 19:13:06', '2023-10-12 19:13:06'),
(34, 'order-delete', 'web', '2023-10-12 19:13:19', '2023-10-12 19:13:19'),
(35, 'admin-menu-view', 'web', '2023-10-12 20:26:06', '2023-10-12 20:26:06'),
(36, 'setting-view', 'web', '2023-10-12 21:25:46', '2023-10-12 21:25:46'),
(37, 'setting-create', 'web', '2023-10-12 21:25:57', '2023-10-12 21:25:57'),
(38, 'setting-edit', 'web', '2023-10-12 21:26:06', '2023-10-12 21:26:06'),
(39, 'setting-update', 'web', '2023-10-12 21:26:19', '2023-10-12 21:26:19'),
(40, 'setting-delete', 'web', '2023-10-12 21:26:33', '2023-10-12 21:26:33');

-- --------------------------------------------------------

--
-- Estrutura para tabela `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `providers`
--

CREATE TABLE `providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `rtp` bigint(20) DEFAULT 90,
  `views` bigint(20) DEFAULT 1,
  `distribution` varchar(50) DEFAULT 'play_fiver',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `providers`
--

INSERT INTO `providers` (`id`, `cover`, `code`, `name`, `status`, `rtp`, `views`, `distribution`, `created_at`, `updated_at`) VALUES
(2, NULL, 'PRAGMATIC', 'PRAGMATIC', 1, 90, 1, 'play_fiver', '2024-04-16 02:51:14', '2024-05-09 01:18:26'),
(3, NULL, 'SPRIBE', 'SPRIBE', 1, 90, 1, 'play_fiver', '2024-04-16 14:38:13', '2024-06-08 00:39:45'),
(9, NULL, 'NETENT', 'NETENT', 1, 90, 1, 'play_fiver', '2024-04-16 15:30:19', '2024-05-06 17:13:19'),
(13, NULL, 'DREAMTECH', 'DREAMTECH', 1, 90, 1, 'play_fiver', '2024-04-16 17:48:28', '2024-05-09 00:55:00'),
(1, NULL, 'PGSOFT', 'PGSOFT', 1, 90, 1, 'play_fiver', '2024-05-02 13:49:33', '2024-07-23 05:54:13'),
(4, NULL, 'GALAXSYS', 'GALAXSYS', 1, 90, 1, 'play_fiver', '2024-05-02 14:24:20', '2024-05-09 00:54:52'),
(5, NULL, 'NOVAMATIC', 'NOVAMATIC', 1, 90, 1, 'play_fiver', '2024-05-02 14:42:14', '2024-05-06 17:07:08'),
(6, NULL, 'MICROGAMING', 'MICROGAMING', 1, 90, 1, 'play_fiver', '2024-05-02 14:51:14', '2024-05-06 17:09:52'),
(7, NULL, 'HABANERO', 'HABANERO', 1, 90, 1, 'play_fiver', '2024-05-02 16:15:37', '2024-05-06 17:10:28'),
(8, NULL, 'PLAYNGO', 'PLAYNGO', 1, 90, 1, 'play_fiver', '2024-05-02 16:22:19', '2024-05-06 17:11:29'),
(10, NULL, 'PLAYSON', 'PLAYSON', 1, 90, 1, 'play_fiver', '2024-05-02 16:49:33', '2024-05-06 17:14:01'),
(11, NULL, 'PRAGMATICLIVE', 'PRAGMATICLIVE', 1, 90, 1, 'play_fiver', '2024-05-02 17:53:24', '2024-05-06 17:15:46'),
(12, NULL, 'TOPTREND', 'TOPTREND', 1, 90, 1, 'play_fiver', '2024-05-02 17:58:52', '2024-05-06 17:17:12'),
(15, NULL, 'BOOONGO', 'BOOONGO', 1, 90, 1, 'play_fiver', '2024-05-03 14:18:11', '2024-05-09 01:19:22'),
(14, NULL, 'EVOPLAY', 'EVOPLAY', 1, 90, 1, 'play_fiver', '2024-05-03 14:25:49', '2024-07-15 20:29:21'),
(16, NULL, 'CQ9', 'CQ9', 1, 90, 1, 'play_fiver', '2024-05-23 20:48:08', '2024-05-23 21:24:22'),
(17, NULL, 'REELKINGDOM', 'REELKINGDOM', 1, 90, 1, 'play_fiver', '2024-05-29 18:30:55', '2024-05-29 18:30:55'),
(18, NULL, 'EVOLUTION', 'EVOLUTION', 1, 90, 1, 'play_fiver', '2024-06-17 17:05:10', '2024-06-17 17:05:10'),
(11125, NULL, 'teste', 'teste', 0, 90, 10, 'play_fiver', '2024-07-23 06:05:14', '2024-07-23 06:09:53'),
(29, NULL, 'sport_betting', 'Sport Betting', 1, 90, 1, 'playconnect', '2024-09-13 04:44:55', '2024-09-13 05:03:16');

-- --------------------------------------------------------

--
-- Estrutura para tabela `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2023-10-12 16:20:41', '2023-10-12 16:20:41'),
(2, 'afiliado', 'web', '2023-10-12 16:21:08', '2023-10-12 16:21:08');

-- --------------------------------------------------------

--
-- Estrutura para tabela `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `software_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_favicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_logo_white` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_logo_black` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'BRL',
  `decimal_format` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dot',
  `currency_position` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'left',
  `revshare_percentage` bigint(20) DEFAULT 20,
  `ngr_percent` bigint(20) DEFAULT 20,
  `soccer_percentage` bigint(20) DEFAULT 30,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'R$',
  `storage` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `initial_bonus` bigint(20) DEFAULT 0,
  `min_deposit` int(11) DEFAULT NULL,
  `max_deposit` int(11) DEFAULT NULL,
  `min_withdrawal` int(11) DEFAULT NULL,
  `max_withdrawal` int(11) DEFAULT NULL,
  `rollover` bigint(20) DEFAULT 10,
  `rollover_deposit` bigint(20) DEFAULT 1,
  `suitpay_is_enable` tinyint(4) DEFAULT 1,
  `stripe_is_enable` tinyint(4) DEFAULT 1,
  `bspay_is_enable` tinyint(4) DEFAULT 0,
  `sharkpay_is_enable` tinyint(4) DEFAULT 1,
  `turn_on_football` tinyint(4) DEFAULT 1,
  `revshare_reverse` tinyint(1) DEFAULT 1,
  `bonus_vip` bigint(20) DEFAULT 100,
  `activate_vip_bonus` tinyint(1) DEFAULT 1,
  `updated_at` timestamp NULL DEFAULT NULL,
  `maintenance_mode` tinyint(4) DEFAULT 0,
  `withdrawal_limit` bigint(20) DEFAULT NULL,
  `withdrawal_period` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disable_spin` tinyint(1) NOT NULL DEFAULT 0,
  `perc_sub_lv1` bigint(20) NOT NULL DEFAULT 4,
  `perc_sub_lv2` bigint(20) NOT NULL DEFAULT 2,
  `perc_sub_lv3` bigint(20) NOT NULL DEFAULT 3,
  `disable_rollover` tinyint(4) DEFAULT 0,
  `rollover_protection` bigint(20) NOT NULL DEFAULT 1,
  `cpa_baseline` decimal(10,2) DEFAULT NULL,
  `cpa_value` decimal(10,2) DEFAULT NULL,
  `cpa_percentage_baseline` decimal(10,2) DEFAULT NULL,
  `cpa_percentage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mercadopago_is_enable` tinyint(4) DEFAULT 0,
  `digitopay_is_enable` tinyint(4) NOT NULL DEFAULT 0,
  `default_gateway` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'digitopay',
  `trunk_baseline` decimal(20,2) NOT NULL DEFAULT 20.00,
  `trunk_aposta` decimal(20,2) NOT NULL DEFAULT 20.00,
  `trunk_valor` decimal(20,2) NOT NULL DEFAULT 20.00,
  `modal_popup` tinyint(1) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `settings`
--

INSERT INTO `settings` (`id`, `software_name`, `software_description`, `software_favicon`, `software_logo_white`, `software_logo_black`, `software_background`, `currency_code`, `decimal_format`, `currency_position`, `revshare_percentage`, `ngr_percent`, `soccer_percentage`, `prefix`, `storage`, `initial_bonus`, `min_deposit`, `max_deposit`, `min_withdrawal`, `max_withdrawal`, `rollover`, `rollover_deposit`, `suitpay_is_enable`, `stripe_is_enable`, `bspay_is_enable`, `sharkpay_is_enable`, `turn_on_football`, `revshare_reverse`, `bonus_vip`, `activate_vip_bonus`, `updated_at`, `maintenance_mode`, `withdrawal_limit`, `withdrawal_period`, `disable_spin`, `perc_sub_lv1`, `perc_sub_lv2`, `perc_sub_lv3`, `disable_rollover`, `rollover_protection`, `cpa_baseline`, `cpa_value`, `cpa_percentage_baseline`, `cpa_percentage`, `mercadopago_is_enable`, `digitopay_is_enable`, `default_gateway`, `trunk_baseline`, `trunk_aposta`, `trunk_valor`, `modal_popup`) VALUES
(1, 'SCRIPT DE CASSINO', 'Os melhores jogos de cassino e slots com PIX automático.', 'uploads/L1Fd8MvIzKM09QxjdVW85dHWTzFbLSrllXftNEPf.png', 'uploads/L0P15mdwx86agfrFcGiefjrKT6kCygsq8IV0goyI.png', 'uploads/L0P15mdwx86agfrFcGiefjrKT6kCygsq8IV0goyI.png', 'uploads/Aqp3JkS4rnJ4lmdkBboUAjiFFlui7EtX4jm1opTB.webp', 'BRL', 'dot', 'left', 0, 0, 30, 'R$', 'local', 0, 1, 10000, 10, 50000, 10, 1, 1, 0, 0, 0, 1, 0, 0, 0, '2025-01-06 08:55:04', 0, 1, 'daily', 1, 0, 0, 0, 0, 4, 5.00, 15.00, 0.00, '40', 0, 0, 'suitpay', 50.00, 30.00, 5.00, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `setting_mails`
--

CREATE TABLE `setting_mails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `software_smtp_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_smtp_mail_host` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_smtp_mail_port` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_smtp_mail_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_smtp_mail_password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_smtp_mail_encryption` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_smtp_mail_from_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_smtp_mail_from_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `setting_mails`
--

INSERT INTO `setting_mails` (`id`, `software_smtp_type`, `software_smtp_mail_host`, `software_smtp_mail_port`, `software_smtp_mail_username`, `software_smtp_mail_password`, `software_smtp_mail_encryption`, `software_smtp_mail_from_address`, `software_smtp_mail_from_name`, `created_at`, `updated_at`) VALUES
(1, 'smtp', 'smtp.hostinger.com', '587', 'contato@tigrinpagador.com.br', 'Admin1212@', 'ssl', 'contato@tigrinpagador.com.br', 'Teste', '2024-10-16 04:23:44', '2024-10-16 04:26:48');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sub_affiliates`
--

CREATE TABLE `sub_affiliates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `affiliate_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `suit_pay_payments`
--

CREATE TABLE `suit_pay_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `withdrawal_id` bigint(20) UNSIGNED NOT NULL,
  `pix_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pix_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `observation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `system_wallets`
--

CREATE TABLE `system_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` decimal(27,12) NOT NULL DEFAULT 0.000000000000,
  `balance_min` decimal(27,12) NOT NULL DEFAULT 10000.100000000000,
  `pay_upto_percentage` decimal(4,2) NOT NULL DEFAULT 45.00,
  `mode` enum('balance_min','percentage') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

--
-- Despejando dados para a tabela `system_wallets`
--

INSERT INTO `system_wallets` (`id`, `label`, `balance`, `balance_min`, `pay_upto_percentage`, `mode`, `created_at`, `updated_at`) VALUES
(1, 'system', 261.800000000000, 10000.100000000000, 45.00, 'percentage', '2023-10-11 16:11:15', '2023-10-16 18:42:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(20,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'usd',
  `status` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accept_bonus` tinyint(1) NOT NULL DEFAULT 1,
  `hash` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `oauth_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oauth_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpf` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logged_in` tinyint(4) NOT NULL DEFAULT 0,
  `banned` tinyint(4) NOT NULL DEFAULT 0,
  `inviter` int(11) DEFAULT NULL,
  `inviter_code` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affiliate_revenue_share` bigint(20) NOT NULL DEFAULT 2,
  `affiliate_revenue_share_fake` bigint(20) DEFAULT NULL,
  `affiliate_cpa` decimal(20,2) NOT NULL DEFAULT 10.00,
  `affiliate_percentage_cpa` decimal(10,2) DEFAULT NULL,
  `affiliate_percentage_baseline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affiliate_baseline` decimal(20,2) NOT NULL DEFAULT 40.00,
  `is_demo_agent` tinyint(4) NOT NULL DEFAULT 0,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pt_BR',
  `role_id` int(11) DEFAULT 3,
  `affiliate_bau_baseline` decimal(20,2) NOT NULL DEFAULT 20.00,
  `affiliate_bau_value` decimal(20,2) NOT NULL DEFAULT 20.00,
  `affiliate_bau_aposta` decimal(20,2) NOT NULL DEFAULT 20.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `oauth_id`, `oauth_type`, `avatar`, `last_name`, `cpf`, `phone`, `logged_in`, `banned`, `inviter`, `inviter_code`, `affiliate_revenue_share`, `affiliate_revenue_share_fake`, `affiliate_cpa`, `affiliate_percentage_cpa`, `affiliate_percentage_baseline`, `affiliate_baseline`, `is_demo_agent`, `status`, `language`, `role_id`, `affiliate_bau_baseline`, `affiliate_bau_value`, `affiliate_bau_aposta`) VALUES
(1, 'Admin', 'admin@hotmail.com', NULL, '$2y$10$CZfgaz1HNvSjTlgN8.CvS.BhBuEqBHGTs5L0gMy8NFg0/azqlyiaC', 'yuXroJjhErhHyfU537okXTpwYXY5mhv3drcx3R22NzqDCJ7l7bPNkxaYOVmp', '2023-11-07 22:15:13', '2024-12-12 21:36:43', NULL, NULL, 'uploads/8lx3OeL0c6GX18GMIhbgf2Kj4JVew0NRmnTUYYSb.png', NULL, NULL, NULL, 0, 0, NULL, 'IL9O93HOCY', 20, NULL, 10.00, 50.00, '0', 40.00, 0, 'active', 'pt_BR', 1, 20.00, 20.00, 20.00),
(574, 'Demo', '11111111111@gmail.com', NULL, '$2y$10$KGGfxcyCEVZec5AYMO/QK.9JY9FoT8hpOrgvwVGRnoJO5CDXacD/.', NULL, '2024-09-30 18:18:17', '2025-01-06 08:57:49', NULL, NULL, NULL, NULL, '5645645656', '11111111111', 0, 0, NULL, '8469189702', 0, NULL, 15.00, 40.00, '0', 5.00, 1, 'active', 'pt_BR', 3, 50.00, 5.00, 30.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vips`
--

CREATE TABLE `vips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bet_symbol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bet_level` bigint(20) NOT NULL DEFAULT 1,
  `bet_required` bigint(20) DEFAULT NULL,
  `bet_period` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bet_bonus` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vip_users`
--

CREATE TABLE `vip_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `vip_id` int(10) UNSIGNED NOT NULL,
  `level` bigint(20) NOT NULL,
  `points` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `currency` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` decimal(20,2) NOT NULL DEFAULT 0.00,
  `balance_bonus_rollover` decimal(10,2) DEFAULT 0.00,
  `balance_deposit_rollover` decimal(10,2) DEFAULT 0.00,
  `balance_withdrawal` decimal(10,2) DEFAULT 0.00,
  `balance_bonus` decimal(20,2) NOT NULL DEFAULT 0.00,
  `balance_cryptocurrency` decimal(20,8) NOT NULL DEFAULT 0.00000000,
  `balance_demo` decimal(20,8) DEFAULT 1000.00000000,
  `refer_rewards` decimal(20,2) NOT NULL DEFAULT 0.00,
  `hide_balance` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_bet` decimal(20,2) NOT NULL DEFAULT 0.00,
  `total_won` bigint(20) NOT NULL DEFAULT 0,
  `total_lose` bigint(20) NOT NULL DEFAULT 0,
  `last_won` bigint(20) NOT NULL DEFAULT 0,
  `last_lose` bigint(20) NOT NULL DEFAULT 0,
  `vip_level` bigint(20) DEFAULT 0,
  `vip_points` bigint(20) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `currency`, `symbol`, `balance`, `balance_bonus_rollover`, `balance_deposit_rollover`, `balance_withdrawal`, `balance_bonus`, `balance_cryptocurrency`, `balance_demo`, `refer_rewards`, `hide_balance`, `active`, `created_at`, `updated_at`, `total_bet`, `total_won`, `total_lose`, `last_won`, `last_lose`, `vip_level`, `vip_points`) VALUES
(1, 1, 'BRL', 'R$', 0.00, 0.00, 0.00, 342.37, 0.00, 0.00000000, 0.00000000, 0.00, 0, 1, '2023-11-07 22:15:13', '2024-12-13 15:48:01', 0.00, 0, 0, 0, 0, 1, 10000),
(568, 574, 'BRL', 'R$', 20.00, 0.00, 20.00, 243.34, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2024-09-30 18:18:17', '2025-01-04 23:12:40', 0.00, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `wallet_changes`
--

CREATE TABLE `wallet_changes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_bonus` decimal(20,2) NOT NULL DEFAULT 0.00,
  `value_total` decimal(20,2) NOT NULL DEFAULT 0.00,
  `value_roi` decimal(20,2) NOT NULL DEFAULT 0.00,
  `value_entry` decimal(20,2) NOT NULL DEFAULT 0.00,
  `refer_rewards` decimal(20,2) NOT NULL DEFAULT 0.00,
  `game` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `websockets_statistics_entries`
--

CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proof` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `pix_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pix_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wizzepro`
--

CREATE TABLE `wizzepro` (
  `id` int(11) NOT NULL,
  `wizzepro_account` varchar(191) NOT NULL,
  `wizzepro_secret` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `qrcode_message` text DEFAULT NULL,
  `payment_message` text DEFAULT NULL,
  `reset_password` text DEFAULT NULL,
  `message_register` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `wizzepro`
--

INSERT INTO `wizzepro` (`id`, `wizzepro_account`, `wizzepro_secret`, `status`, `qrcode_message`, `payment_message`, `reset_password`, `message_register`, `created_at`, `updated_at`) VALUES
(1, 'ss', 'sss', 1, 'Obrigado por recarregar! Seu PIX foi gerado com sucesso. CODIGO PIX ABAIXO:\n', NULL, 'Alguem solicitou alteração de senha de sua conta. Se não foi você ignore.\nSeu código de redefinição de senha é {token}. Acesse o link: {resetLink}.', 'Olá seja bem Vindo! ficaremos feliz se participar do meu grupo do WhatsApp: link', '2024-10-16 18:25:56', '2025-01-06 08:41:26');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `affiliate_histories`
--
ALTER TABLE `affiliate_histories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `affiliate_histories_user_id_index` (`user_id`) USING BTREE,
  ADD KEY `affiliate_histories_inviter_index` (`inviter`) USING BTREE;

--
-- Índices de tabela `affiliate_withdraws`
--
ALTER TABLE `affiliate_withdraws`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `affiliate_withdraws_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `baus`
--
ALTER TABLE `baus`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `casino_categories_slug_unique` (`slug`) USING BTREE;

--
-- Índices de tabela `category_game`
--
ALTER TABLE `category_game`
  ADD KEY `category_games_category_id_foreign` (`category_id`) USING BTREE,
  ADD KEY `category_games_game_id_foreign` (`game_id`) USING BTREE;

--
-- Índices de tabela `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `currency_alloweds`
--
ALTER TABLE `currency_alloweds`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `currency_alloweds_currency_id_foreign` (`currency_id`) USING BTREE;

--
-- Índices de tabela `custom_layouts`
--
ALTER TABLE `custom_layouts`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `deposits_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `digito_pay_payments`
--
ALTER TABLE `digito_pay_payments`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `digito_pay_payments_user_id_index` (`user_id`) USING BTREE,
  ADD KEY `digito_pay_payments_withdrawal_id_index` (`withdrawal_id`) USING BTREE;

--
-- Índices de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE;

--
-- Índices de tabela `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `games_provider_id_index` (`provider_id`) USING BTREE,
  ADD KEY `games_game_code_index` (`game_code`) USING BTREE;

--
-- Índices de tabela `games_keys`
--
ALTER TABLE `games_keys`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `game_favorites`
--
ALTER TABLE `game_favorites`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `game_favorites_user_id_game_id_unique` (`user_id`,`game_id`) USING BTREE,
  ADD KEY `game_favorites_game_id_foreign` (`game_id`) USING BTREE;

--
-- Índices de tabela `game_likes`
--
ALTER TABLE `game_likes`
  ADD UNIQUE KEY `game_likes_user_id_game_id_unique` (`user_id`,`game_id`) USING BTREE,
  ADD KEY `game_likes_game_id_foreign` (`game_id`) USING BTREE;

--
-- Índices de tabela `game_reviews`
--
ALTER TABLE `game_reviews`
  ADD UNIQUE KEY `game_reviews_user_id_game_id_unique` (`user_id`,`game_id`) USING BTREE,
  ADD KEY `game_reviews_game_id_foreign` (`game_id`) USING BTREE;

--
-- Índices de tabela `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `ggds_spin_config`
--
ALTER TABLE `ggds_spin_config`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `ggds_spin_runs`
--
ALTER TABLE `ggds_spin_runs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `ggr_games`
--
ALTER TABLE `ggr_games`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `ggr_games_fivers_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `ggr_games_world_slots`
--
ALTER TABLE `ggr_games_world_slots`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `ggr_games_world_slots_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `likes_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `likes_liked_user_id_foreign` (`liked_user_id`) USING BTREE;

--
-- Índices de tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `missions`
--
ALTER TABLE `missions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `mission_users`
--
ALTER TABLE `mission_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `mission_users_user_id_index` (`user_id`) USING BTREE,
  ADD KEY `mission_users_mission_id_index` (`mission_id`) USING BTREE;

--
-- Índices de tabela `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Índices de tabela `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Índices de tabela `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`) USING BTREE;

--
-- Índices de tabela `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `orders_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`) USING BTREE;

--
-- Índices de tabela `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`) USING BTREE;

--
-- Índices de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`) USING BTREE,
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`) USING BTREE;

--
-- Índices de tabela `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`) USING BTREE;

--
-- Índices de tabela `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE;

--
-- Índices de tabela `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `setting_mails`
--
ALTER TABLE `setting_mails`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `sub_affiliates`
--
ALTER TABLE `sub_affiliates`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `sub_affiliates_affiliate_id_index` (`affiliate_id`) USING BTREE,
  ADD KEY `sub_affiliates_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `suit_pay_payments`
--
ALTER TABLE `suit_pay_payments`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `suit_pay_payments_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `suit_pay_payments_withdrawal_id_foreign` (`withdrawal_id`) USING BTREE;

--
-- Índices de tabela `system_wallets`
--
ALTER TABLE `system_wallets`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `transactions_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `users_email_unique` (`email`) USING BTREE;

--
-- Índices de tabela `vips`
--
ALTER TABLE `vips`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `vip_users`
--
ALTER TABLE `vip_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `vip_users_user_id_index` (`user_id`) USING BTREE,
  ADD KEY `vip_users_vip_id_index` (`vip_id`) USING BTREE;

--
-- Índices de tabela `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `wallets_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `wallet_changes`
--
ALTER TABLE `wallet_changes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `wallet_changes_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `withdrawals_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `wizzepro`
--
ALTER TABLE `wizzepro`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `affiliate_histories`
--
ALTER TABLE `affiliate_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `affiliate_withdraws`
--
ALTER TABLE `affiliate_withdraws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `baus`
--
ALTER TABLE `baus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT de tabela `currency_alloweds`
--
ALTER TABLE `currency_alloweds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `custom_layouts`
--
ALTER TABLE `custom_layouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `digito_pay_payments`
--
ALTER TABLE `digito_pay_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `games`
--
ALTER TABLE `games`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1619;

--
-- AUTO_INCREMENT de tabela `games_keys`
--
ALTER TABLE `games_keys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `game_favorites`
--
ALTER TABLE `game_favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `ggds_spin_config`
--
ALTER TABLE `ggds_spin_config`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `ggds_spin_runs`
--
ALTER TABLE `ggds_spin_runs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `ggr_games`
--
ALTER TABLE `ggr_games`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ggr_games_world_slots`
--
ALTER TABLE `ggr_games_world_slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT de tabela `missions`
--
ALTER TABLE `missions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mission_users`
--
ALTER TABLE `mission_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `setting_mails`
--
ALTER TABLE `setting_mails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `sub_affiliates`
--
ALTER TABLE `sub_affiliates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `suit_pay_payments`
--
ALTER TABLE `suit_pay_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `system_wallets`
--
ALTER TABLE `system_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=601;

--
-- AUTO_INCREMENT de tabela `vips`
--
ALTER TABLE `vips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `vip_users`
--
ALTER TABLE `vip_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=595;

--
-- AUTO_INCREMENT de tabela `wallet_changes`
--
ALTER TABLE `wallet_changes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wizzepro`
--
ALTER TABLE `wizzepro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
