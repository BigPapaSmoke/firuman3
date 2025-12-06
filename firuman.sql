-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 03, 2025 at 12:58 AM
-- Server version: 10.11.13-MariaDB-0ubuntu0.24.04.1
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `firuman`
--

-- --------------------------------------------------------

--
-- Table structure for table `ns_failed_jobs`
--

CREATE TABLE `ns_failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_jobs`
--

CREATE TABLE `ns_jobs` (
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
-- Table structure for table `ns_messages`
--

CREATE TABLE `ns_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL,
  `recipient_id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `type` enum('message','report_request','system') NOT NULL DEFAULT 'message',
  `priority` enum('low','normal','high','urgent') NOT NULL DEFAULT 'normal',
  `read_at` timestamp NULL DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_migrations`
--

CREATE TABLE `ns_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ns_migrations`
--

INSERT INTO `ns_migrations` (`id`, `migration`, `batch`, `type`) VALUES
(1, '2018_08_08_100000_create_telescope_entries_table', 1, NULL),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1, NULL),
(3, '2022_10_28_123458_setup_migration_table', 1, NULL),
(4, '2025_01_20_000001_create_messages_table', 1, NULL),
(5, '2014_10_13_000000_create_users_table', 0, 'core'),
(6, '2017_07_28_130434_create_roles_table', 0, 'core'),
(7, '2017_07_28_130610_create_permissions_table', 0, 'core'),
(8, '2018_08_08_100000_create_telescope_entries_table', 0, 'core'),
(9, '2019_08_19_000000_create_failed_jobs_table', 0, 'core'),
(10, '2020_06_20_000000_create_permissions', 0, 'core'),
(11, '2020_06_20_000000_create_roles', 0, 'core'),
(12, '2020_10_11_122857_create_jobs_table', 0, 'core'),
(13, '2020_11_04_124040_add_new_customers_permission_nov4', 0, 'core'),
(14, '2020_11_11_151614_nov11_create_nexopos_users_attributes_table', 0, 'core'),
(15, '2020_11_12_205243_nov12_create_order_permission', 0, 'core'),
(16, '2020_11_25_203531_nov25_fix_report_permissions_attribution', 0, 'core'),
(17, '2020_12_08_210001_dec8add_new_permissions', 0, 'core'),
(18, '2020_12_19_221434_create_nexopos_modules_migrations_table', 0, 'core'),
(19, '2021_01_07_143635_add_new_customer_permission_janv7_21', 0, 'core'),
(20, '2021_03_09_165538_create_new_permissions_march_9', 0, 'core'),
(21, '2021_05_25_175424_update_add_payment_type_permissions', 0, 'core'),
(22, '2021_05_28_114827_create_new_report_permissions_may28', 0, 'core'),
(23, '2021_06_24_053134_update_permissions_jun24', 0, 'core'),
(24, '2021_07_31_153029_update_dashboard_days_report_jul31', 0, 'core'),
(25, '2014_10_12_000000_create_medias_table', 0, 'create'),
(26, '2017_12_29_174613_create_options_table', 0, 'create'),
(27, '2020_06_20_000000_create_customers_groups_table', 0, 'create'),
(28, '2020_06_20_000000_create_customers_table', 0, 'create'),
(29, '2020_06_20_000000_create_expenses_categories_table', 0, 'create'),
(30, '2020_06_20_000000_create_expenses_table', 0, 'create'),
(31, '2020_06_20_000000_create_orders_addresses_table', 0, 'create'),
(32, '2020_06_20_000000_create_orders_coupons_table', 0, 'create'),
(33, '2020_06_20_000000_create_orders_metas_table', 0, 'create'),
(34, '2020_06_20_000000_create_orders_payment_table', 0, 'create'),
(35, '2020_06_20_000000_create_orders_products_table', 0, 'create'),
(36, '2020_06_20_000000_create_orders_table', 0, 'create'),
(37, '2020_06_20_000000_create_procurements_products_table', 0, 'create'),
(38, '2020_06_20_000000_create_procurements_table', 0, 'create'),
(39, '2020_06_20_000000_create_products_categories_table', 0, 'create'),
(40, '2020_06_20_000000_create_products_gallery_table', 0, 'create'),
(41, '2020_06_20_000000_create_products_history_table', 0, 'create'),
(42, '2020_06_20_000000_create_products_metas_table', 0, 'create'),
(43, '2020_06_20_000000_create_products_table', 0, 'create'),
(44, '2020_06_20_000000_create_products_taxes_table', 0, 'create'),
(45, '2020_06_20_000000_create_products_unit_quantities', 0, 'create'),
(46, '2020_06_20_000000_create_providers_table', 0, 'create'),
(47, '2020_06_20_000000_create_registers_history_table', 0, 'create'),
(48, '2020_06_20_000000_create_registers_table', 0, 'create'),
(49, '2020_06_20_000000_create_rewards_system_rules_table', 0, 'create'),
(50, '2020_06_20_000000_create_rewards_system_table', 0, 'create'),
(51, '2020_06_20_000000_create_taxes_table', 0, 'create'),
(52, '2020_06_20_000000_create_units_group_table', 0, 'create'),
(53, '2020_06_20_000000_create_units_table', 0, 'create'),
(54, '2020_08_01_143801_create_customers_coupons_table', 0, 'create'),
(55, '2020_10_10_224639_create_dashboard_table', 0, 'create'),
(56, '2020_10_11_074631_create_nexopos_notifications_table', 0, 'create'),
(57, '2020_10_17_231628_create_nexopos_orders_storage', 0, 'create'),
(58, '2020_10_29_150642_create_nexopos_expenses_history_table', 0, 'create'),
(59, '2020_11_17_120204_nov17_add_fields_to_nexopos_orders_products_table', 0, 'create'),
(60, '2020_12_11_210734_create_nexopos_dashboard_months_table', 0, 'create'),
(61, '2021_01_23_225101_create_coupons_table', 0, 'create'),
(62, '2021_01_23_225713_create_customers_rewards_table', 0, 'create'),
(63, '2021_02_21_144532_create_orders_instalments_table', 0, 'create'),
(64, '2021_02_23_004748_create_new_instalments_permissions', 0, 'create'),
(65, '2021_05_25_131104_create_nexopos_payments_types_table', 0, 'create'),
(66, '2022_01_20_202253_create_user_role_relations_table', 0, 'create'),
(67, '2022_05_13_142039_create_products_group_items_table', 0, 'create'),
(68, '2022_10_12_083552_update_register_history_oct12_22', 0, 'create'),
(69, '2022_10_28_093041_update_expense_table28_oct22', 0, 'create'),
(70, '2022_11_25_071626_create_users_widgets_table', 0, 'create'),
(71, '2023_10_31_120602_stock_history_detailed', 0, 'create'),
(72, '2024_04_29_214452_create_transaction_balance_days_table', 0, 'create'),
(73, '2024_04_29_214459_create_transaction_balance_months_table', 0, 'create'),
(74, '2024_09_02_023528_create_accounting_table_actions', 0, 'create'),
(75, '2025_01_22_113445_create_nexopos_orders_settings_table', 0, 'create'),
(76, '2022_11_28_000259_v5x_general_database_update', 0, 'update'),
(77, '2022_11_30_224820_update_orders_coupon_table', 0, 'update'),
(78, '2023_02_14_123130_update_product_history_table14_fev23', 0, 'update'),
(79, '2023_03_16_214039_update_expense_table', 0, 'update'),
(80, '2023_07_30_235454_fix_wrong_purchase_price_32_jul_23', 0, 'update'),
(81, '2024_01_26_075544_update_expenses_and_accounts', 0, 'update'),
(82, '2024_01_26_165001_update_transaction_histories', 0, 'update'),
(83, '2024_02_29_035014_update_add_new_pos_permissions', 0, 'update'),
(84, '2024_03_12_235545_update_v5_2_0', 0, 'update'),
(85, '2024_03_25_150121_update_user_widget', 0, 'update'),
(86, '2024_04_04_234202_update_transactions_adds_missing_field', 0, 'update'),
(87, '2024_04_18_084130_update_transactions_history_table', 0, 'update'),
(88, '2024_04_29_110922_update_cash_registers_table', 0, 'update'),
(89, '2024_06_14_013012_update_to_nexopos_v53', 0, 'update'),
(90, '2024_06_28_183019_update_add_permission_to_products_unit_conversion', 0, 'update'),
(91, '2024_07_19_145205_update_nexopos_transactions_accounts', 0, 'update'),
(92, '2024_07_29_171109_update_orders_total_cogs', 0, 'update'),
(93, '2025_01_27_093541_remove_deprecated_options', 0, 'update');

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_coupons`
--

CREATE TABLE `ns_nexopos_coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'discount',
  `discount_value` float NOT NULL DEFAULT 0,
  `valid_until` datetime DEFAULT NULL,
  `minimum_cart_value` float DEFAULT 0,
  `maximum_cart_value` float DEFAULT 0,
  `valid_hours_start` datetime DEFAULT NULL,
  `valid_hours_end` datetime DEFAULT NULL,
  `limit_usage` float NOT NULL DEFAULT 0,
  `groups_id` varchar(255) DEFAULT NULL,
  `customers_id` varchar(255) DEFAULT NULL,
  `author` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_coupons_categories`
--

CREATE TABLE `ns_nexopos_coupons_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_coupons_customers`
--

CREATE TABLE `ns_nexopos_coupons_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_coupons_customers_groups`
--

CREATE TABLE `ns_nexopos_coupons_customers_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_coupons_products`
--

CREATE TABLE `ns_nexopos_coupons_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_customers_account_history`
--

CREATE TABLE `ns_nexopos_customers_account_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `previous_amount` double NOT NULL DEFAULT 0,
  `amount` double NOT NULL DEFAULT 0,
  `next_amount` double NOT NULL DEFAULT 0,
  `operation` varchar(255) NOT NULL,
  `author` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_customers_addresses`
--

CREATE TABLE `ns_nexopos_customers_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address_1` varchar(255) DEFAULT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `pobox` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `author` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ns_nexopos_customers_addresses`
--

INSERT INTO `ns_nexopos_customers_addresses` (`id`, `customer_id`, `type`, `email`, `first_name`, `last_name`, `phone`, `address_1`, `address_2`, `country`, `city`, `pobox`, `company`, `uuid`, `author`, `created_at`, `updated_at`) VALUES
(1, 18, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, '2025-11-28 21:17:16', '2025-11-28 21:17:16'),
(2, 18, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, '2025-11-28 21:17:16', '2025-11-28 21:17:16');

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_customers_coupons`
--

CREATE TABLE `ns_nexopos_customers_coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `usage` int(11) NOT NULL DEFAULT 0,
  `limit_usage` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `code` varchar(255) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_customers_groups`
--

CREATE TABLE `ns_nexopos_customers_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `reward_system_id` int(11) DEFAULT 0,
  `minimal_credit_payment` int(11) NOT NULL DEFAULT 0,
  `author` int(11) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ns_nexopos_customers_groups`
--

INSERT INTO `ns_nexopos_customers_groups` (`id`, `name`, `description`, `reward_system_id`, `minimal_credit_payment`, `author`, `uuid`, `created_at`, `updated_at`) VALUES
(1, 'Insane Walk-Ins', NULL, NULL, 0, 17, NULL, '2025-11-28 21:16:42', '2025-11-28 21:16:42');

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_customers_rewards`
--

CREATE TABLE `ns_nexopos_customers_rewards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `reward_id` int(11) NOT NULL,
  `reward_name` varchar(255) NOT NULL,
  `points` float NOT NULL,
  `target` float NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_dashboard_days`
--

CREATE TABLE `ns_nexopos_dashboard_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total_unpaid_orders` float NOT NULL DEFAULT 0,
  `day_unpaid_orders` float NOT NULL DEFAULT 0,
  `total_unpaid_orders_count` float NOT NULL DEFAULT 0,
  `day_unpaid_orders_count` float NOT NULL DEFAULT 0,
  `total_paid_orders` float NOT NULL DEFAULT 0,
  `day_paid_orders` float NOT NULL DEFAULT 0,
  `total_paid_orders_count` float NOT NULL DEFAULT 0,
  `day_paid_orders_count` float NOT NULL DEFAULT 0,
  `total_partially_paid_orders` float NOT NULL DEFAULT 0,
  `day_partially_paid_orders` float NOT NULL DEFAULT 0,
  `total_partially_paid_orders_count` float NOT NULL DEFAULT 0,
  `day_partially_paid_orders_count` float NOT NULL DEFAULT 0,
  `total_income` float NOT NULL DEFAULT 0,
  `day_income` float NOT NULL DEFAULT 0,
  `total_discounts` float NOT NULL DEFAULT 0,
  `day_discounts` float NOT NULL DEFAULT 0,
  `day_taxes` float NOT NULL DEFAULT 0,
  `total_taxes` float NOT NULL DEFAULT 0,
  `total_wasted_goods_count` float NOT NULL DEFAULT 0,
  `day_wasted_goods_count` float NOT NULL DEFAULT 0,
  `total_wasted_goods` float NOT NULL DEFAULT 0,
  `day_wasted_goods` float NOT NULL DEFAULT 0,
  `total_expenses` float NOT NULL DEFAULT 0,
  `day_expenses` float NOT NULL DEFAULT 0,
  `day_of_year` int(11) NOT NULL DEFAULT 0,
  `range_starts` datetime DEFAULT NULL,
  `range_ends` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_dashboard_months`
--

CREATE TABLE `ns_nexopos_dashboard_months` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `month_taxes` float NOT NULL DEFAULT 0,
  `month_unpaid_orders` float NOT NULL DEFAULT 0,
  `month_unpaid_orders_count` float NOT NULL DEFAULT 0,
  `month_paid_orders` float NOT NULL DEFAULT 0,
  `month_paid_orders_count` float NOT NULL DEFAULT 0,
  `month_partially_paid_orders` float NOT NULL DEFAULT 0,
  `month_partially_paid_orders_count` float NOT NULL DEFAULT 0,
  `month_income` float NOT NULL DEFAULT 0,
  `month_discounts` float NOT NULL DEFAULT 0,
  `month_wasted_goods_count` float NOT NULL DEFAULT 0,
  `month_wasted_goods` float NOT NULL DEFAULT 0,
  `month_expenses` float NOT NULL DEFAULT 0,
  `total_wasted_goods` float NOT NULL DEFAULT 0,
  `total_unpaid_orders` float NOT NULL DEFAULT 0,
  `total_unpaid_orders_count` float NOT NULL DEFAULT 0,
  `total_paid_orders` float NOT NULL DEFAULT 0,
  `total_paid_orders_count` float NOT NULL DEFAULT 0,
  `total_partially_paid_orders` float NOT NULL DEFAULT 0,
  `total_partially_paid_orders_count` float NOT NULL DEFAULT 0,
  `total_income` float NOT NULL DEFAULT 0,
  `total_discounts` float NOT NULL DEFAULT 0,
  `total_taxes` float NOT NULL DEFAULT 0,
  `total_wasted_goods_count` float NOT NULL DEFAULT 0,
  `total_expenses` float NOT NULL DEFAULT 0,
  `month_of_year` int(11) NOT NULL DEFAULT 0,
  `range_starts` datetime NOT NULL,
  `range_ends` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_dashboard_weeks`
--

CREATE TABLE `ns_nexopos_dashboard_weeks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total_gross_income` float NOT NULL DEFAULT 0,
  `total_taxes` float NOT NULL DEFAULT 0,
  `total_expenses` float NOT NULL DEFAULT 0,
  `total_net_income` float NOT NULL DEFAULT 0,
  `week_number` int(11) NOT NULL DEFAULT 0,
  `range_starts` datetime DEFAULT NULL,
  `range_ends` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_medias`
--

CREATE TABLE `ns_nexopos_medias` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `extension` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ns_nexopos_medias`
--

INSERT INTO `ns_nexopos_medias` (`id`, `name`, `extension`, `slug`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'whistling-chaser', 'png', '2025/11/whistling-chaser', 17, '2025-11-28 19:07:08', '2025-11-28 19:07:08'),
(2, 'amazing', 'png', '2025/11/amazing', 17, '2025-11-28 20:59:25', '2025-11-28 20:59:25'),
(3, 'firumanbrowser', 'jpg', '2025/11/firumanbrowser', 17, '2025-11-28 21:04:39', '2025-11-28 21:04:39'),
(4, 'alienufo', 'jpg', '2025/11/alienufo', 17, '2025-11-30 23:13:07', '2025-11-30 23:13:07'),
(5, 'daises', 'jpeg', '2025/11/daises', 17, '2025-11-30 23:13:07', '2025-11-30 23:13:07'),
(6, 'groundbloom', 'jpeg', '2025/11/groundbloom', 17, '2025-11-30 23:13:07', '2025-11-30 23:13:07'),
(7, 'whistling-chaser338522', 'png', '2025/11/whistling-chaser338522', 17, '2025-11-30 23:13:07', '2025-11-30 23:13:07'),
(8, 'lotus', 'jpg', '2025/11/lotus', 17, '2025-11-30 23:13:07', '2025-11-30 23:13:07'),
(9, 'groundbloom409622', 'jpeg', '2025/11/groundbloom409622', 17, '2025-11-30 23:13:07', '2025-11-30 23:13:07'),
(10, 'amazing443126', 'png', '2025/11/amazing443126', 17, '2025-11-30 23:13:07', '2025-11-30 23:13:07'),
(11, 'lotus485116', 'jpg', '2025/11/lotus485116', 17, '2025-11-30 23:13:07', '2025-11-30 23:13:07'),
(12, 'lotus523778', 'jpg', '2025/11/lotus523778', 17, '2025-11-30 23:13:07', '2025-11-30 23:13:07'),
(13, 'daises561163', 'jpeg', '2025/11/daises561163', 17, '2025-11-30 23:13:07', '2025-11-30 23:13:07'),
(14, 'amazing593428', 'png', '2025/11/amazing593428', 17, '2025-11-30 23:13:07', '2025-11-30 23:13:07'),
(15, 'triwheel', 'jpg', '2025/11/triwheel', 17, '2025-11-30 23:13:07', '2025-11-30 23:13:07'),
(16, 'groundbloom704029', 'jpeg', '2025/11/groundbloom704029', 17, '2025-11-30 23:13:07', '2025-11-30 23:13:07'),
(17, 'daises736423', 'jpeg', '2025/11/daises736423', 17, '2025-11-30 23:13:07', '2025-11-30 23:13:07'),
(18, 'whistling-chaser767528', 'png', '2025/11/whistling-chaser767528', 17, '2025-11-30 23:13:07', '2025-11-30 23:13:07'),
(19, 'spaceflyer', 'png', '2025/11/spaceflyer', 17, '2025-11-30 23:13:07', '2025-11-30 23:13:07'),
(20, 'groundbloom845045', 'jpeg', '2025/11/groundbloom845045', 17, '2025-11-30 23:13:07', '2025-11-30 23:13:07'),
(21, 'lotus878734', 'jpg', '2025/11/lotus878734', 17, '2025-11-30 23:13:07', '2025-11-30 23:13:07'),
(22, 'spaceflyer915977', 'png', '2025/11/spaceflyer915977', 17, '2025-11-30 23:13:07', '2025-11-30 23:13:07'),
(23, 'lotus961548', 'jpg', '2025/11/lotus961548', 17, '2025-11-30 23:13:07', '2025-11-30 23:13:07'),
(24, 'spaceflyer999148', 'png', '2025/11/spaceflyer999148', 17, '2025-11-30 23:13:08', '2025-11-30 23:13:08'),
(25, 'spaceflyer47382', 'png', '2025/11/spaceflyer47382', 17, '2025-11-30 23:13:08', '2025-11-30 23:13:08'),
(26, 'triwheel92940', 'jpg', '2025/11/triwheel92940', 17, '2025-11-30 23:13:08', '2025-11-30 23:13:08'),
(27, 'triwheel160748', 'jpg', '2025/11/triwheel160748', 17, '2025-11-30 23:13:08', '2025-11-30 23:13:08'),
(28, 'whistling-chaser233466', 'png', '2025/11/whistling-chaser233466', 17, '2025-11-30 23:13:08', '2025-11-30 23:13:08'),
(29, 'whistling-chaser264155', 'png', '2025/11/whistling-chaser264155', 17, '2025-11-30 23:13:08', '2025-11-30 23:13:08'),
(30, 'spaceflyer301349', 'png', '2025/11/spaceflyer301349', 17, '2025-11-30 23:13:08', '2025-11-30 23:13:08'),
(31, 'triwheel347353', 'jpg', '2025/11/triwheel347353', 17, '2025-11-30 23:13:08', '2025-11-30 23:13:08'),
(32, 'triwheel414861', 'jpg', '2025/11/triwheel414861', 17, '2025-11-30 23:13:08', '2025-11-30 23:13:08'),
(33, 'spaceflyer483918', 'png', '2025/11/spaceflyer483918', 17, '2025-11-30 23:13:08', '2025-11-30 23:13:08'),
(34, 'whistling-chaser529800', 'png', '2025/11/whistling-chaser529800', 17, '2025-11-30 23:13:08', '2025-11-30 23:13:08'),
(35, 'whistling-chaser560634', 'png', '2025/11/whistling-chaser560634', 17, '2025-11-30 23:13:08', '2025-11-30 23:13:08'),
(36, 'triwheel592049', 'jpg', '2025/11/triwheel592049', 17, '2025-11-30 23:13:08', '2025-11-30 23:13:08'),
(37, 'triwheel660402', 'jpg', '2025/11/triwheel660402', 17, '2025-11-30 23:13:08', '2025-11-30 23:13:08'),
(38, 'whistling-chaser728572', 'png', '2025/11/whistling-chaser728572', 17, '2025-11-30 23:13:08', '2025-11-30 23:13:08'),
(39, 'whistling-chaser761153', 'png', '2025/11/whistling-chaser761153', 17, '2025-11-30 23:13:08', '2025-11-30 23:13:08'),
(40, 'lotus405048', 'jpg', '2025/11/lotus405048', 17, '2025-11-30 23:19:12', '2025-11-30 23:19:12'),
(41, '6301205-cobra-copters-1024x940', 'png', '2025/11/6301205-cobra-copters-1024x940', 17, '2025-11-30 23:24:04', '2025-11-30 23:24:04'),
(42, 'nightplane', 'jpeg', '2025/11/nightplane', 17, '2025-11-30 23:24:04', '2025-11-30 23:24:04'),
(43, 'outerspace', 'jpeg', '2025/11/outerspace', 17, '2025-11-30 23:24:04', '2025-11-30 23:24:04'),
(44, 'tntbomb', 'jpeg', '2025/11/tntbomb', 17, '2025-11-30 23:24:04', '2025-11-30 23:24:04'),
(45, 'outerspace992942', 'jpeg', '2025/11/outerspace992942', 17, '2025-11-30 23:24:05', '2025-11-30 23:24:05'),
(46, 'tntbomb26568', 'jpeg', '2025/11/tntbomb26568', 17, '2025-11-30 23:24:05', '2025-11-30 23:24:05'),
(47, 'tntbomb59691', 'jpeg', '2025/11/tntbomb59691', 17, '2025-11-30 23:24:05', '2025-11-30 23:24:05'),
(48, 'dragonfly', 'png', '2025/11/dragonfly', 17, '2025-11-30 23:24:05', '2025-11-30 23:24:05'),
(49, 'dragonfly137271', 'png', '2025/11/dragonfly137271', 17, '2025-11-30 23:24:05', '2025-11-30 23:24:05'),
(50, 'nightplane178898', 'jpeg', '2025/11/nightplane178898', 17, '2025-11-30 23:24:05', '2025-11-30 23:24:05'),
(51, 'nightplane210906', 'jpeg', '2025/11/nightplane210906', 17, '2025-11-30 23:24:05', '2025-11-30 23:24:05'),
(52, 'outerspace243217', 'jpeg', '2025/11/outerspace243217', 17, '2025-11-30 23:24:05', '2025-11-30 23:24:05'),
(53, 'outerspace274098', 'jpeg', '2025/11/outerspace274098', 17, '2025-11-30 23:24:05', '2025-11-30 23:24:05'),
(54, 'tntbomb305680', 'jpeg', '2025/11/tntbomb305680', 17, '2025-11-30 23:24:05', '2025-11-30 23:24:05'),
(55, 'tntbomb337805', 'jpeg', '2025/11/tntbomb337805', 17, '2025-11-30 23:24:05', '2025-11-30 23:24:05'),
(56, 'crazyape', 'jpeg', '2025/11/crazyape', 17, '2025-11-30 23:35:09', '2025-11-30 23:35:09'),
(57, 'kitty', 'jpeg', '2025/11/kitty', 17, '2025-11-30 23:35:09', '2025-11-30 23:35:09'),
(58, 'panda', 'jpeg', '2025/11/panda', 17, '2025-11-30 23:35:09', '2025-11-30 23:35:09'),
(59, 'pitstop', 'jpeg', '2025/11/pitstop', 17, '2025-11-30 23:35:09', '2025-11-30 23:35:09'),
(60, 'sirdump', 'jpeg', '2025/11/sirdump', 17, '2025-11-30 23:35:09', '2025-11-30 23:35:09'),
(61, 'smallbees', 'jpeg', '2025/11/smallbees', 17, '2025-11-30 23:35:09', '2025-11-30 23:35:09'),
(62, 'snake', 'jpeg', '2025/11/snake', 17, '2025-11-30 23:35:09', '2025-11-30 23:35:09'),
(63, 'kitty910020', 'jpeg', '2025/11/kitty910020', 17, '2025-11-30 23:35:09', '2025-11-30 23:35:09'),
(64, 'panda942396', 'jpeg', '2025/11/panda942396', 17, '2025-11-30 23:35:09', '2025-11-30 23:35:09'),
(65, 'pitstop975007', 'jpeg', '2025/11/pitstop975007', 17, '2025-11-30 23:35:09', '2025-11-30 23:35:09'),
(66, 'sirdump6988', 'jpeg', '2025/11/sirdump6988', 17, '2025-11-30 23:35:10', '2025-11-30 23:35:10'),
(67, 'smallbees39984', 'jpeg', '2025/11/smallbees39984', 17, '2025-11-30 23:35:10', '2025-11-30 23:35:10'),
(68, 'panda71673', 'jpeg', '2025/11/panda71673', 17, '2025-11-30 23:35:10', '2025-11-30 23:35:10'),
(69, 'snake103536', 'jpeg', '2025/11/snake103536', 17, '2025-11-30 23:35:10', '2025-11-30 23:35:10'),
(70, 'pitstop135826', 'jpeg', '2025/11/pitstop135826', 17, '2025-11-30 23:35:10', '2025-11-30 23:35:10'),
(71, 'sirdump167825', 'jpeg', '2025/11/sirdump167825', 17, '2025-11-30 23:35:10', '2025-11-30 23:35:10'),
(72, 'smallbees200452', 'jpeg', '2025/11/smallbees200452', 17, '2025-11-30 23:35:10', '2025-11-30 23:35:10'),
(73, 'pitstop233127', 'jpeg', '2025/11/pitstop233127', 17, '2025-11-30 23:35:10', '2025-11-30 23:35:10'),
(74, 'snake265003', 'jpeg', '2025/11/snake265003', 17, '2025-11-30 23:35:10', '2025-11-30 23:35:10'),
(75, 'smallbees297170', 'jpeg', '2025/11/smallbees297170', 17, '2025-11-30 23:35:10', '2025-11-30 23:35:10'),
(76, 'sirdump330991', 'jpeg', '2025/11/sirdump330991', 17, '2025-11-30 23:35:10', '2025-11-30 23:35:10'),
(77, 'snake363524', 'jpeg', '2025/11/snake363524', 17, '2025-11-30 23:35:10', '2025-11-30 23:35:10'),
(78, 'sirdump395170', 'jpeg', '2025/11/sirdump395170', 17, '2025-11-30 23:35:10', '2025-11-30 23:35:10'),
(79, 'snake426683', 'jpeg', '2025/11/snake426683', 17, '2025-11-30 23:35:10', '2025-11-30 23:35:10'),
(80, 'smallbees458882', 'jpeg', '2025/11/smallbees458882', 17, '2025-11-30 23:35:10', '2025-11-30 23:35:10'),
(81, 'smallbees493535', 'jpeg', '2025/11/smallbees493535', 17, '2025-11-30 23:35:10', '2025-11-30 23:35:10'),
(82, 'snake526596', 'jpeg', '2025/11/snake526596', 17, '2025-11-30 23:35:10', '2025-11-30 23:35:10'),
(83, 'snake561303', 'jpeg', '2025/11/snake561303', 17, '2025-11-30 23:35:10', '2025-11-30 23:35:10'),
(84, 'planedrop', 'jpeg', '2025/11/planedrop', 17, '2025-11-30 23:42:00', '2025-11-30 23:42:00'),
(85, 'smokejumper', 'jpeg', '2025/11/smokejumper', 17, '2025-11-30 23:42:00', '2025-11-30 23:42:00'),
(86, 'smokejumper485405', 'jpeg', '2025/11/smokejumper485405', 17, '2025-11-30 23:42:00', '2025-11-30 23:42:00'),
(87, 'colorspark', 'jpeg', '2025/11/colorspark', 17, '2025-11-30 23:46:11', '2025-11-30 23:46:11'),
(88, 'pixie', 'jpeg', '2025/11/pixie', 17, '2025-11-30 23:46:11', '2025-11-30 23:46:11'),
(89, 'spark', 'jpeg', '2025/11/spark', 17, '2025-11-30 23:46:11', '2025-11-30 23:46:11'),
(90, 'straight', 'jpeg', '2025/11/straight', 17, '2025-11-30 23:46:11', '2025-11-30 23:46:11'),
(91, 'pixie222936', 'jpeg', '2025/11/pixie222936', 17, '2025-11-30 23:46:11', '2025-11-30 23:46:11'),
(92, 'spark255010', 'jpeg', '2025/11/spark255010', 17, '2025-11-30 23:46:11', '2025-11-30 23:46:11'),
(93, 'straight286957', 'jpeg', '2025/11/straight286957', 17, '2025-11-30 23:46:11', '2025-11-30 23:46:11'),
(94, 'spark318639', 'jpeg', '2025/11/spark318639', 17, '2025-11-30 23:46:11', '2025-11-30 23:46:11'),
(95, 'straight351147', 'jpeg', '2025/11/straight351147', 17, '2025-11-30 23:46:11', '2025-11-30 23:46:11'),
(96, 'straight383592', 'jpeg', '2025/11/straight383592', 17, '2025-11-30 23:46:11', '2025-11-30 23:46:11'),
(97, 'assorted', 'jpeg', '2025/11/assorted', 17, '2025-11-30 23:59:20', '2025-11-30 23:59:20'),
(98, 'babyshot', 'jpeg', '2025/11/babyshot', 17, '2025-11-30 23:59:20', '2025-11-30 23:59:20'),
(99, 'boomer', 'jpeg', '2025/11/boomer', 17, '2025-11-30 23:59:20', '2025-11-30 23:59:20'),
(100, 'colorpearl', 'jpeg', '2025/11/colorpearl', 17, '2025-11-30 23:59:20', '2025-11-30 23:59:20'),
(101, 'crackling', 'jpeg', '2025/11/crackling', 17, '2025-11-30 23:59:20', '2025-11-30 23:59:20'),
(102, 'hotshotcrackling', 'jpeg', '2025/11/hotshotcrackling', 17, '2025-11-30 23:59:20', '2025-11-30 23:59:20'),
(103, 'maddog', 'jpeg', '2025/11/maddog', 17, '2025-11-30 23:59:20', '2025-11-30 23:59:20'),
(104, 'minimagic', 'jpeg', '2025/11/minimagic', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(105, 'redrhino', 'jpeg', '2025/11/redrhino', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(106, 'babyshot49172', 'jpeg', '2025/11/babyshot49172', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(107, 'boomer81071', 'jpeg', '2025/11/boomer81071', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(108, 'colorpearl113976', 'jpeg', '2025/11/colorpearl113976', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(109, 'crackling145778', 'jpeg', '2025/11/crackling145778', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(110, 'maddog177444', 'jpeg', '2025/11/maddog177444', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(111, 'hotshotcrackling209207', 'jpeg', '2025/11/hotshotcrackling209207', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(112, 'minimagic241111', 'jpeg', '2025/11/minimagic241111', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(113, 'redrhino272658', 'jpeg', '2025/11/redrhino272658', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(114, 'boomer304072', 'jpeg', '2025/11/boomer304072', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(115, 'colorpearl335750', 'jpeg', '2025/11/colorpearl335750', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(116, 'crackling367894', 'jpeg', '2025/11/crackling367894', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(117, 'hotshotcrackling399839', 'jpeg', '2025/11/hotshotcrackling399839', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(118, 'minimagic431876', 'jpeg', '2025/11/minimagic431876', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(119, 'maddog463480', 'jpeg', '2025/11/maddog463480', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(120, 'redrhino498699', 'jpeg', '2025/11/redrhino498699', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(121, 'colorpearl532702', 'jpeg', '2025/11/colorpearl532702', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(122, 'crackling564978', 'jpeg', '2025/11/crackling564978', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(123, 'maddog599794', 'jpeg', '2025/11/maddog599794', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(124, 'hotshotcrackling632669', 'jpeg', '2025/11/hotshotcrackling632669', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(125, 'redrhino664805', 'jpeg', '2025/11/redrhino664805', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(126, 'minimagic700949', 'jpeg', '2025/11/minimagic700949', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(127, 'crackling732256', 'jpeg', '2025/11/crackling732256', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(128, 'hotshotcrackling769851', 'jpeg', '2025/11/hotshotcrackling769851', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(129, 'minimagic803251', 'jpeg', '2025/11/minimagic803251', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(130, 'maddog835682', 'jpeg', '2025/11/maddog835682', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(131, 'redrhino868136', 'jpeg', '2025/11/redrhino868136', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(132, 'maddog903533', 'jpeg', '2025/11/maddog903533', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(133, 'hotshotcrackling935268', 'jpeg', '2025/11/hotshotcrackling935268', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(134, 'redrhino968568', 'jpeg', '2025/11/redrhino968568', 17, '2025-11-30 23:59:21', '2025-11-30 23:59:21'),
(135, 'minimagic2868', 'jpeg', '2025/11/minimagic2868', 17, '2025-11-30 23:59:22', '2025-11-30 23:59:22'),
(136, 'minimagic37016', 'jpeg', '2025/11/minimagic37016', 17, '2025-11-30 23:59:22', '2025-11-30 23:59:22'),
(137, 'maddog69432', 'jpeg', '2025/11/maddog69432', 17, '2025-11-30 23:59:22', '2025-11-30 23:59:22'),
(138, 'redrhino101869', 'jpeg', '2025/11/redrhino101869', 17, '2025-11-30 23:59:22', '2025-11-30 23:59:22'),
(139, 'redrhino134864', 'jpeg', '2025/11/redrhino134864', 17, '2025-11-30 23:59:22', '2025-11-30 23:59:22'),
(140, 'minimagic167427', 'jpeg', '2025/11/minimagic167427', 17, '2025-11-30 23:59:22', '2025-11-30 23:59:22'),
(141, 'redrhino203996', 'jpeg', '2025/11/redrhino203996', 17, '2025-11-30 23:59:22', '2025-11-30 23:59:22'),
(142, 'money', 'png', '2025/12/money', 17, '2025-12-01 21:33:51', '2025-12-01 21:33:51'),
(143, '5ballmagical', 'jpeg', '2025/12/5ballmagical', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(144, '5boomer', 'jpeg', '2025/12/5boomer', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(145, '5maddog', 'jpeg', '2025/12/5maddog', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(146, '8magical', 'jpeg', '2025/12/8magical', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(147, 'boompow', 'jpeg', '2025/12/boompow', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(148, 'handful', 'jpeg', '2025/12/handful', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(149, 'm5000', 'jpeg', '2025/12/m5000', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(150, 'mini', 'jpeg', '2025/12/mini', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(151, 'reddevil', 'jpeg', '2025/12/reddevil', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(152, '5boomer273536', 'jpeg', '2025/12/5boomer273536', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(153, '5maddog305204', 'jpeg', '2025/12/5maddog305204', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(154, '8magical336838', 'jpeg', '2025/12/8magical336838', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(155, 'boompow369447', 'jpeg', '2025/12/boompow369447', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(156, 'handful401189', 'jpeg', '2025/12/handful401189', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(157, 'm5000432455', 'jpeg', '2025/12/m5000432455', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(158, 'mini464252', 'jpeg', '2025/12/mini464252', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(159, 'reddevil497555', 'jpeg', '2025/12/reddevil497555', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(160, '5maddog528800', 'jpeg', '2025/12/5maddog528800', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(161, '8magical560153', 'jpeg', '2025/12/8magical560153', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(162, 'boompow591908', 'jpeg', '2025/12/boompow591908', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(163, 'handful623502', 'jpeg', '2025/12/handful623502', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(164, 'm5000656780', 'jpeg', '2025/12/m5000656780', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(165, 'mini687798', 'jpeg', '2025/12/mini687798', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(166, 'reddevil719594', 'jpeg', '2025/12/reddevil719594', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(167, '8magical751566', 'jpeg', '2025/12/8magical751566', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(168, 'boompow783347', 'jpeg', '2025/12/boompow783347', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(169, 'handful816450', 'jpeg', '2025/12/handful816450', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(170, 'm5000848273', 'jpeg', '2025/12/m5000848273', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(171, 'mini878839', 'jpeg', '2025/12/mini878839', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(172, 'reddevil909633', 'jpeg', '2025/12/reddevil909633', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(173, 'boompow941376', 'jpeg', '2025/12/boompow941376', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(174, 'handful973253', 'jpeg', '2025/12/handful973253', 17, '2025-12-01 21:44:01', '2025-12-01 21:44:01'),
(175, 'm50004460', 'jpeg', '2025/12/m50004460', 17, '2025-12-01 21:44:02', '2025-12-01 21:44:02'),
(176, 'mini35149', 'jpeg', '2025/12/mini35149', 17, '2025-12-01 21:44:02', '2025-12-01 21:44:02'),
(177, 'reddevil66877', 'jpeg', '2025/12/reddevil66877', 17, '2025-12-01 21:44:02', '2025-12-01 21:44:02'),
(178, 'handful99201', 'jpeg', '2025/12/handful99201', 17, '2025-12-01 21:44:02', '2025-12-01 21:44:02'),
(179, 'm5000130800', 'jpeg', '2025/12/m5000130800', 17, '2025-12-01 21:44:02', '2025-12-01 21:44:02'),
(180, 'mini161783', 'jpeg', '2025/12/mini161783', 17, '2025-12-01 21:44:02', '2025-12-01 21:44:02'),
(181, 'reddevil194273', 'jpeg', '2025/12/reddevil194273', 17, '2025-12-01 21:44:02', '2025-12-01 21:44:02'),
(182, 'm5000226961', 'jpeg', '2025/12/m5000226961', 17, '2025-12-01 21:44:02', '2025-12-01 21:44:02'),
(183, 'mini258567', 'jpeg', '2025/12/mini258567', 17, '2025-12-01 21:44:02', '2025-12-01 21:44:02'),
(184, 'reddevil290089', 'jpeg', '2025/12/reddevil290089', 17, '2025-12-01 21:44:02', '2025-12-01 21:44:02'),
(185, 'mini322721', 'jpeg', '2025/12/mini322721', 17, '2025-12-01 21:44:02', '2025-12-01 21:44:02'),
(186, 'reddevil355551', 'jpeg', '2025/12/reddevil355551', 17, '2025-12-01 21:44:02', '2025-12-01 21:44:02'),
(187, 'reddevil388365', 'jpeg', '2025/12/reddevil388365', 17, '2025-12-01 21:44:02', '2025-12-01 21:44:02'),
(188, 'texas', 'png', '2025/12/texas', 17, '2025-12-01 21:51:54', '2025-12-01 21:51:54'),
(189, '10hotshot', 'jpeg', '2025/12/10hotshot', 17, '2025-12-01 21:57:04', '2025-12-01 21:57:04'),
(190, 'insane', 'jpeg', '2025/12/insane', 17, '2025-12-01 22:03:19', '2025-12-01 22:03:19'),
(191, '4oz', 'png', '2025/12/4oz', 17, '2025-12-01 22:06:25', '2025-12-01 22:06:25'),
(192, 'baller', 'jpeg', '2025/12/baller', 17, '2025-12-01 22:08:40', '2025-12-01 22:08:40'),
(193, 'tnt', 'jpeg', '2025/12/tnt', 17, '2025-12-01 22:11:31', '2025-12-01 22:11:31'),
(194, 'butter', 'jpeg', '2025/12/butter', 17, '2025-12-01 22:13:46', '2025-12-01 22:13:46'),
(195, 'cluster', 'jpeg', '2025/12/cluster', 17, '2025-12-01 22:15:01', '2025-12-01 22:15:01'),
(196, 'happy', 'jpeg', '2025/12/happy', 17, '2025-12-01 22:16:12', '2025-12-01 22:16:12'),
(197, 'need', 'jpeg', '2025/12/need', 17, '2025-12-01 22:17:35', '2025-12-01 22:17:35'),
(198, 'reddevil782155', 'jpeg', '2025/12/reddevil782155', 17, '2025-12-01 22:18:48', '2025-12-01 22:18:48'),
(199, 'ring', 'jpeg', '2025/12/ring', 17, '2025-12-01 22:21:18', '2025-12-01 22:21:18'),
(200, 'screaming', 'jpeg', '2025/12/screaming', 17, '2025-12-01 22:22:27', '2025-12-01 22:22:27'),
(201, 'ear', 'jpeg', '2025/12/ear', 17, '2025-12-01 22:24:07', '2025-12-01 22:24:07'),
(202, 'texas139890', 'jpeg', '2025/12/texas139890', 17, '2025-12-01 22:25:30', '2025-12-01 22:25:30'),
(203, 'texaspop', 'jpeg', '2025/12/texaspop', 17, '2025-12-01 22:26:45', '2025-12-01 22:26:45'),
(204, 'wicked', 'png', '2025/12/wicked', 17, '2025-12-01 22:27:57', '2025-12-01 22:27:57'),
(205, 'xforce', 'jpeg', '2025/12/xforce', 17, '2025-12-01 22:29:53', '2025-12-01 22:29:53'),
(206, 'whistling', 'jpeg', '2025/12/whistling', 17, '2025-12-01 22:33:35', '2025-12-01 22:33:35'),
(207, '6', 'jpeg', '2025/12/6', 17, '2025-12-01 22:35:06', '2025-12-01 22:35:06'),
(208, 'mammoth', 'jpeg', '2025/12/mammoth', 17, '2025-12-01 22:37:19', '2025-12-01 22:37:19');

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_modules_migrations`
--

CREATE TABLE `ns_nexopos_modules_migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_notifications`
--

CREATE TABLE `ns_nexopos_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '#',
  `source` varchar(255) NOT NULL DEFAULT 'system',
  `dismissable` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ns_nexopos_notifications`
--

INSERT INTO `ns_nexopos_notifications` (`id`, `user_id`, `identifier`, `title`, `description`, `url`, `source`, `dismissable`, `created_at`, `updated_at`) VALUES
(1, 17, 'ns.notifications.workers-disabled', 'Task Scheduling Disabled', 'NexoPOS is unable to schedule background tasks. This might restrict necessary features. Click here to learn how to fix it.', 'https://my.nexopos.com/en/documentation/troubleshooting/workers-or-async-requests-disabled?utm_source=nexopos&utm_campaign=warning&utm_medium=app', 'system', 1, '2025-11-28 23:37:13', '2025-12-02 22:23:50'),
(2, 17, 'ns.notifications.cron-disabled', 'Cron Disabled', 'Cron jobs aren\'t configured correctly on NexoPOS. This might restrict necessary features. Click here to learn how to fix it.', 'https://my.nexopos.com/en/documentation/troubleshooting/workers-or-async-requests-disabled?utm_source=nexopos&utm_campaign=warning&utm_medium=app', 'system', 1, '2025-11-28 23:37:13', '2025-12-02 22:23:50');

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_options`
--

CREATE TABLE `ns_nexopos_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `expire_on` datetime DEFAULT NULL,
  `array` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ns_nexopos_options`
--

INSERT INTO `ns_nexopos_options` (`id`, `user_id`, `key`, `value`, `expire_on`, `array`, `created_at`, `updated_at`) VALUES
(1, NULL, 'ns_registration_enabled', 'no', NULL, 0, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(2, NULL, 'ns_store_name', 'Sumiton', NULL, 0, '2025-11-28 23:37:02', '2025-11-29 00:30:51'),
(3, NULL, 'ns_pos_allow_decimal_quantities', 'no', NULL, 0, '2025-11-28 23:37:02', '2025-11-28 21:14:44'),
(4, NULL, 'ns_pos_quick_product', 'yes', NULL, 0, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(5, NULL, 'ns_pos_show_quantity', 'no', NULL, 0, '2025-11-28 23:37:02', '2025-11-28 21:27:40'),
(6, NULL, 'ns_currency_precision', '2', NULL, 0, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(7, NULL, 'ns_pos_hide_empty_categories', 'no', NULL, 0, '2025-11-28 23:37:02', '2025-11-28 21:10:37'),
(8, NULL, 'ns_pos_unit_price_ediable', 'yes', NULL, 0, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(9, NULL, 'ns_pos_order_types', '[\"takeaway\"]', NULL, 1, '2025-11-28 23:37:02', '2025-11-28 18:31:57'),
(10, NULL, 'ns_pos_registers_default_change_payment_type', '1', NULL, 0, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(11, NULL, 'ns_store_language', 'en', NULL, 0, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(12, NULL, 'ns_currency_symbol', '$', NULL, 0, '2025-11-29 00:30:51', '2025-11-29 00:30:51'),
(13, NULL, 'ns_currency_iso', 'USD', NULL, 0, '2025-11-29 00:30:51', '2025-11-29 00:30:51'),
(14, NULL, 'ns_currency_position', 'before', NULL, 0, '2025-11-29 00:30:51', '2025-11-29 00:30:51'),
(15, NULL, 'ns_currency_prefered', 'symbol', NULL, 0, '2025-11-29 00:30:51', '2025-11-29 00:30:51'),
(16, NULL, 'ns_currency_thousand_separator', ',', NULL, 0, '2025-11-29 00:30:51', '2025-11-29 00:30:51'),
(17, NULL, 'ns_currency_decimal_separator', '.', NULL, 0, '2025-11-29 00:30:51', '2025-11-29 00:30:51'),
(18, NULL, 'ns_date_format', 'M dS, Y', NULL, 0, '2025-11-29 00:31:10', '2025-11-29 00:31:10'),
(19, NULL, 'ns_datetime_format', 'M dS, Y H:i', NULL, 0, '2025-11-29 00:31:10', '2025-11-29 00:31:10'),
(20, NULL, 'ns_datetime_timezone', 'America/Chicago', NULL, 0, '2025-11-29 00:31:10', '2025-11-29 00:31:10'),
(21, NULL, 'ns_pos_layout', 'grocery_shop', NULL, 0, '2025-11-28 18:31:57', '2025-11-28 18:31:57'),
(22, NULL, 'ns_pos_complete_sale_audio', 'http://127.0.0.1:8000/audio/cash-sound.mp3', NULL, 0, '2025-11-28 18:31:57', '2025-11-28 18:31:57'),
(23, NULL, 'ns_pos_new_item_audio', 'http://127.0.0.1:8000/audio/ding.mp3', NULL, 0, '2025-11-28 18:31:57', '2025-11-28 18:31:57'),
(24, NULL, 'ns_pos_printing_document', 'receipt', NULL, 0, '2025-11-28 18:31:57', '2025-11-28 18:31:57'),
(25, NULL, 'ns_pos_printing_enabled_for', 'disabled', NULL, 0, '2025-11-28 18:31:57', '2025-11-28 18:31:57'),
(26, NULL, 'ns_pos_printing_gateway', 'default', NULL, 0, '2025-11-28 18:31:57', '2025-11-28 18:31:57'),
(27, NULL, 'ns_pos_vat', 'disabled', NULL, 0, '2025-11-28 18:31:57', '2025-11-28 18:31:57'),
(28, NULL, 'ns_pos_keyboard_cancel_order', '[]', NULL, 1, '2025-11-28 18:31:57', '2025-11-28 18:31:57'),
(29, NULL, 'ns_pos_keyboard_hold_order', '[]', NULL, 1, '2025-11-28 18:31:57', '2025-11-28 18:31:57'),
(30, NULL, 'ns_pos_keyboard_create_customer', '[]', NULL, 1, '2025-11-28 18:31:57', '2025-11-28 18:31:57'),
(31, NULL, 'ns_pos_keyboard_payment', '[]', NULL, 1, '2025-11-28 18:31:57', '2025-11-28 18:31:57'),
(32, NULL, 'ns_pos_keyboard_shipping', '[]', NULL, 1, '2025-11-28 18:31:57', '2025-11-28 18:31:57'),
(33, NULL, 'ns_pos_keyboard_note', '[]', NULL, 1, '2025-11-28 18:31:57', '2025-11-28 18:31:57'),
(34, NULL, 'ns_pos_keyboard_order_type', '[]', NULL, 1, '2025-11-28 18:31:57', '2025-11-28 18:31:57'),
(35, NULL, 'ns_pos_keyboard_fullscreen', '[]', NULL, 1, '2025-11-28 18:31:57', '2025-11-28 18:31:57'),
(36, NULL, 'ns_pos_keyboard_quick_search', '[]', NULL, 1, '2025-11-28 18:31:57', '2025-11-28 18:31:57'),
(37, NULL, 'ns_pos_keyboard_toggle_merge', '[]', NULL, 1, '2025-11-28 18:31:57', '2025-11-28 18:31:57'),
(38, NULL, 'ns_pos_items_merge', 'yes', NULL, 0, '2025-11-28 18:31:57', '2025-11-28 18:31:57'),
(39, NULL, 'ns_pos_allow_wholesale_price', 'no', NULL, 0, '2025-11-28 18:31:57', '2025-11-28 18:31:57'),
(40, NULL, 'ns_pos_quick_product_default_unit', '1', NULL, 0, '2025-11-28 21:10:37', '2025-11-28 21:10:37'),
(41, NULL, 'ns_pos_price_with_tax', 'yes', NULL, 0, '2025-11-28 21:10:37', '2025-11-28 21:10:37'),
(42, NULL, 'ns_pos_numpad', 'advanced', NULL, 0, '2025-11-28 21:10:37', '2025-11-28 21:10:37'),
(43, NULL, 'ns_pos_force_autofocus', 'yes', NULL, 0, '2025-11-28 21:10:37', '2025-11-28 21:10:37'),
(44, NULL, 'ns_pos_hide_exhausted_products', 'no', NULL, 0, '2025-11-28 21:10:37', '2025-11-28 21:10:37'),
(45, NULL, 'ns_orders_code_type', 'number_sequential', NULL, 0, '2025-11-28 21:15:58', '2025-11-28 21:15:58'),
(46, NULL, 'ns_orders_allow_unpaid', 'no', NULL, 0, '2025-11-28 21:15:58', '2025-11-28 21:15:58'),
(47, NULL, 'ns_orders_allow_partial', 'no', NULL, 0, '2025-11-28 21:15:58', '2025-11-28 21:15:58'),
(48, NULL, 'ns_orders_strict_instalments', 'no', NULL, 0, '2025-11-28 21:15:58', '2025-11-28 21:15:58'),
(49, NULL, 'ns_orders_quotation_expiration', '30', NULL, 0, '2025-11-28 21:15:58', '2025-11-28 21:15:58'),
(50, NULL, 'ns_customers_rewards_enabled', 'no', NULL, 0, '2025-11-28 21:19:53', '2025-11-28 21:19:53'),
(51, NULL, 'ns_customers_force_valid_email', 'no', NULL, 0, '2025-11-28 21:19:53', '2025-11-28 21:19:53'),
(52, NULL, 'ns_customers_force_unique_phone', 'no', NULL, 0, '2025-11-28 21:19:53', '2025-11-28 21:19:53'),
(53, NULL, 'ns_customers_default', '18', NULL, 0, '2025-11-28 21:19:53', '2025-11-28 21:19:53'),
(54, NULL, 'ns_customers_default_group', '1', NULL, 0, '2025-11-28 21:19:53', '2025-11-28 21:19:53'),
(55, NULL, 'ns_customers_credit_enabled', 'no', NULL, 0, '2025-11-28 21:19:53', '2025-11-28 21:19:53'),
(56, NULL, 'ns_invoice_receipt_template', 'default', NULL, 0, '2025-11-28 21:22:30', '2025-11-28 21:22:30'),
(57, NULL, 'ns_invoice_merge_similar_products', 'yes', NULL, 0, '2025-11-28 21:22:30', '2025-11-28 21:22:30'),
(58, NULL, 'ns_invoice_display_tax_breakdown', 'yes', NULL, 0, '2025-11-28 21:22:30', '2025-11-28 21:22:30');

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_orders`
--

CREATE TABLE `ns_nexopos_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `process_status` varchar(255) NOT NULL DEFAULT 'pending',
  `delivery_status` varchar(255) NOT NULL DEFAULT 'pending',
  `discount` float NOT NULL DEFAULT 0,
  `discount_type` varchar(255) DEFAULT NULL,
  `support_instalments` tinyint(1) NOT NULL DEFAULT 1,
  `discount_percentage` float DEFAULT NULL,
  `shipping` float NOT NULL DEFAULT 0,
  `shipping_rate` float NOT NULL DEFAULT 0,
  `shipping_type` varchar(255) DEFAULT NULL,
  `total_without_tax` float NOT NULL DEFAULT 0,
  `subtotal` float NOT NULL DEFAULT 0,
  `total_with_tax` float NOT NULL DEFAULT 0,
  `total_coupons` float NOT NULL DEFAULT 0,
  `total_cogs` float NOT NULL DEFAULT 0,
  `total` float NOT NULL DEFAULT 0,
  `tax_value` float NOT NULL DEFAULT 0,
  `products_tax_value` double NOT NULL DEFAULT 0,
  `tax_group_id` int(11) DEFAULT NULL,
  `tax_type` varchar(255) DEFAULT NULL,
  `tendered` float NOT NULL DEFAULT 0,
  `change` float NOT NULL DEFAULT 0,
  `final_payment_date` datetime DEFAULT NULL,
  `total_instalments` int(11) NOT NULL DEFAULT 0,
  `customer_id` int(11) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `note_visibility` varchar(255) DEFAULT NULL,
  `author` int(11) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `register_id` int(11) DEFAULT NULL,
  `voidance_reason` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_orders_addresses`
--

CREATE TABLE `ns_nexopos_orders_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address_1` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `pobox` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `author` int(11) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_orders_count`
--

CREATE TABLE `ns_nexopos_orders_count` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `count` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_orders_coupons`
--

CREATE TABLE `ns_nexopos_orders_coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `customer_coupon_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `discount_value` float NOT NULL,
  `minimum_cart_value` float NOT NULL DEFAULT 0,
  `maximum_cart_value` float NOT NULL DEFAULT 0,
  `limit_usage` int(11) NOT NULL DEFAULT 0,
  `value` float NOT NULL DEFAULT 0,
  `author` int(11) NOT NULL,
  `counted` tinyint(1) NOT NULL DEFAULT 0,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_orders_instalments`
--

CREATE TABLE `ns_nexopos_orders_instalments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `order_id` int(11) DEFAULT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `payment_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_orders_metas`
--

CREATE TABLE `ns_nexopos_orders_metas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `author` int(11) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_orders_payments`
--

CREATE TABLE `ns_nexopos_orders_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `value` float NOT NULL DEFAULT 0,
  `author` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_orders_products`
--

CREATE TABLE `ns_nexopos_orders_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit_name` varchar(255) DEFAULT NULL,
  `mode` varchar(255) NOT NULL DEFAULT 'normal',
  `product_type` varchar(255) NOT NULL DEFAULT 'product',
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `unit_quantity_id` int(11) NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `procurement_product_id` int(11) DEFAULT NULL,
  `tax_group_id` int(11) NOT NULL DEFAULT 0,
  `tax_type` varchar(255) NOT NULL DEFAULT '0',
  `uuid` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'sold',
  `return_observations` text DEFAULT NULL,
  `return_condition` varchar(255) DEFAULT NULL,
  `discount_type` varchar(255) NOT NULL DEFAULT 'none',
  `discount` float NOT NULL DEFAULT 0,
  `quantity` float NOT NULL,
  `discount_percentage` float NOT NULL DEFAULT 0,
  `unit_price` float NOT NULL DEFAULT 0,
  `price_with_tax` float NOT NULL DEFAULT 0,
  `price_without_tax` float NOT NULL DEFAULT 0,
  `wholesale_tax_value` float NOT NULL DEFAULT 0,
  `sale_tax_value` float NOT NULL DEFAULT 0,
  `tax_value` float NOT NULL DEFAULT 0,
  `rate` double NOT NULL DEFAULT 0,
  `total_price` float NOT NULL DEFAULT 0,
  `total_price_with_tax` float NOT NULL DEFAULT 0,
  `total_price_without_tax` float NOT NULL DEFAULT 0,
  `total_purchase_price` float NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_orders_products_refunds`
--

CREATE TABLE `ns_nexopos_orders_products_refunds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_refund_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `unit_price` float NOT NULL,
  `tax_value` float NOT NULL DEFAULT 0,
  `quantity` float NOT NULL,
  `total_price` float NOT NULL,
  `condition` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `author` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_orders_refunds`
--

CREATE TABLE `ns_nexopos_orders_refunds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `total` float NOT NULL,
  `tax_value` float NOT NULL DEFAULT 0,
  `shipping` float NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_orders_settings`
--

CREATE TABLE `ns_nexopos_orders_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_orders_storage`
--

CREATE TABLE `ns_nexopos_orders_storage` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `unit_quantity_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `session_identifier` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_orders_taxes`
--

CREATE TABLE `ns_nexopos_orders_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `rate` double NOT NULL,
  `tax_name` varchar(255) DEFAULT NULL,
  `tax_value` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_payments_types`
--

CREATE TABLE `ns_nexopos_payments_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `author` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `readonly` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ns_nexopos_payments_types`
--

INSERT INTO `ns_nexopos_payments_types` (`id`, `label`, `identifier`, `priority`, `description`, `author`, `active`, `readonly`, `created_at`, `updated_at`) VALUES
(1, 'Cash', 'cash-payment', 0, NULL, 17, 1, 1, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(2, 'Bank Payment', 'bank-payment', 0, NULL, 17, 1, 1, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(3, 'Customer Account', 'account-payment', 0, NULL, 17, 1, 1, '2025-11-28 23:37:02', '2025-11-28 23:37:02');

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_permissions`
--

CREATE TABLE `ns_nexopos_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ns_nexopos_permissions`
--

INSERT INTO `ns_nexopos_permissions` (`id`, `name`, `namespace`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Create Users', 'create.users', 'Can create users', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(2, 'Read Users', 'read.users', 'Can read users', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(3, 'Update Users', 'update.users', 'Can update users', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(4, 'Delete Users', 'delete.users', 'Can delete users', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(5, 'Create Roles', 'create.roles', 'Can create roles', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(6, 'Read Roles', 'read.roles', 'Can read roles', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(7, 'Update Roles', 'update.roles', 'Can update roles', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(8, 'Delete Roles', 'delete.roles', 'Can delete roles', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(9, 'Update Core', 'update.core', 'Can update core', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(10, 'Manage Profile', 'manage.profile', 'Can manage profile', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(11, 'Manage Modules', 'manage.modules', 'Can manage module : install, delete, update, migrate, enable, disable', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(12, 'Manage Options', 'manage.options', 'Can manage options : read, update', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(13, 'View Dashboard', 'read.dashboard', 'Can access the dashboard and see metrics', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(14, 'Upload Medias', 'nexopos.upload.medias', 'Let the user upload medias.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(15, 'See Medias', 'nexopos.see.medias', 'Let the user see medias.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(16, 'Delete Medias', 'nexopos.delete.medias', 'Let the user delete medias.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(17, 'Update Medias', 'nexopos.update.medias', 'Let the user update uploaded medias.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(18, 'Create Categories', 'nexopos.create.categories', 'Let the user create products categories.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(19, 'Delete Categories', 'nexopos.delete.categories', 'Let the user delete products categories.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(20, 'Update Categories', 'nexopos.update.categories', 'Let the user update products categories.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(21, 'Read Categories', 'nexopos.read.categories', 'Let the user read products categories.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(22, 'Create Customers', 'nexopos.create.customers', 'Let the user create customers.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(23, 'Delete Customers', 'nexopos.delete.customers', 'Let the user delete customers.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(24, 'Update Customers', 'nexopos.update.customers', 'Let the user update customers.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(25, 'Read Customers', 'nexopos.read.customers', 'Let the user read customers.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(26, 'Import Customers', 'nexopos.import.customers', 'Let the user import customers.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(27, 'Manage Customer Account History', 'nexopos.customers.manage-account-history', 'Can add, deduct amount from each customers account.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(28, 'Create Customers Groups', 'nexopos.create.customers-groups', 'Let the user create Customers Groups', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(29, 'Delete Customers Groups', 'nexopos.delete.customers-groups', 'Let the user delete Customers Groups', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(30, 'Update Customers Groups', 'nexopos.update.customers-groups', 'Let the user update Customers Groups', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(31, 'Read Customers Groups', 'nexopos.read.customers-groups', 'Let the user read Customers Groups', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(32, 'Create Coupons', 'nexopos.create.coupons', 'Let the user create coupons', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(33, 'Delete Coupons', 'nexopos.delete.coupons', 'Let the user delete coupons', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(34, 'Update Coupons', 'nexopos.update.coupons', 'Let the user update coupons', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(35, 'Read Coupons', 'nexopos.read.coupons', 'Let the user read coupons', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(36, 'Create Transaction Account', 'nexopos.create.transactions-account', 'Let the user create transactions account', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(37, 'Delete Transactions Account', 'nexopos.delete.transactions-account', 'Let the user delete Transaction Account', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(38, 'Update Transactions Account', 'nexopos.update.transactions-account', 'Let the user update Transaction Account', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(39, 'Read Transactions Account', 'nexopos.read.transactions-account', 'Let the user read Transaction Account', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(40, 'Create Transaction', 'nexopos.create.transactions', 'Let the user create transactions', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(41, 'Delete Transaction', 'nexopos.delete.transactions', 'Let the user delete transactions', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(42, 'Update Transaction', 'nexopos.update.transactions', 'Let the user update transactions', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(43, 'Read Transaction', 'nexopos.read.transactions', 'Let the user read transactions', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(44, 'Read Transactions History', 'nexopos.read.transactions-history', 'Give access to the transactions history.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(45, 'Delete Transactions History', 'nexopos.delete.transactions-history', 'Allow to delete an Transactions History.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(46, 'Update Transactions History', 'nexopos.update.transactions-history', 'Allow to the Transactions History.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(47, 'Create Transactions History', 'nexopos.create.transactions-history', 'Allow to create a Transactions History.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(48, 'Create Orders', 'nexopos.create.orders', 'Let the user create orders', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(49, 'Delete Orders', 'nexopos.delete.orders', 'Let the user delete orders', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(50, 'Update Orders', 'nexopos.update.orders', 'Let the user update orders', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(51, 'Read Orders', 'nexopos.read.orders', 'Let the user read orders', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(52, 'Void Order', 'nexopos.void.orders', 'Let the user void orders', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(53, 'Refund Order', 'nexopos.refund.orders', 'Let the user refund orders', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(54, 'Make Payment To orders', 'nexopos.make-payment.orders', 'Allow the user to make payments to orders.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(55, 'Create Procurements', 'nexopos.create.procurements', 'Let the user create procurements', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(56, 'Delete Procurements', 'nexopos.delete.procurements', 'Let the user delete procurements', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(57, 'Update Procurements', 'nexopos.update.procurements', 'Let the user update procurements', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(58, 'Read Procurements', 'nexopos.read.procurements', 'Let the user read procurements', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(59, 'Create Providers', 'nexopos.create.providers', 'Let the user create providers', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(60, 'Delete Providers', 'nexopos.delete.providers', 'Let the user delete providers', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(61, 'Update Providers', 'nexopos.update.providers', 'Let the user update providers', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(62, 'Read Providers', 'nexopos.read.providers', 'Let the user read providers', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(63, 'Create Products', 'nexopos.create.products', 'Let the user create products', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(64, 'Delete Products', 'nexopos.delete.products', 'Let the user delete products', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(65, 'Update Products', 'nexopos.update.products', 'Let the user update products', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(66, 'Read Products', 'nexopos.read.products', 'Let the user read products', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(67, 'Convert Products Units', 'nexopos.convert.products-units', 'Let the user convert products', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(68, 'Read Product History', 'nexopos.read.products-history', 'Let the user read products history', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(69, 'Adjust Product Stock', 'nexopos.make.products-adjustments', 'Let the user adjust product stock.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(70, 'Create Product Units/Unit Group', 'nexopos.create.products-units', 'Let the user create products units.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(71, 'Read Product Units/Unit Group', 'nexopos.read.products-units', 'Let the user read products units.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(72, 'Update Product Units/Unit Group', 'nexopos.update.products-units', 'Let the user update products units.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(73, 'Delete Product Units/Unit Group', 'nexopos.delete.products-units', 'Let the user delete products units.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(74, 'Create Registers', 'nexopos.create.registers', 'Let the user create registers', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(75, 'Delete Registers', 'nexopos.delete.registers', 'Let the user delete registers', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(76, 'Update Registers', 'nexopos.update.registers', 'Let the user update registers', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(77, 'Read Registers', 'nexopos.read.registers', 'Let the user read registers', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(78, 'Read Registers History', 'nexopos.read.registers-history', 'Let the user read registers history', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(79, 'Read Use Registers', 'nexopos.use.registers', 'Let the user use registers', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(80, 'Create Rewards', 'nexopos.create.rewards', 'Let the user create Rewards', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(81, 'Delete Rewards', 'nexopos.delete.rewards', 'Let the user delete Rewards', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(82, 'Update Rewards', 'nexopos.update.rewards', 'Let the user update Rewards', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(83, 'Read Rewards', 'nexopos.read.rewards', 'Let the user read Rewards', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(84, 'Create Taxes', 'nexopos.create.taxes', 'Let the user create taxes', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(85, 'Delete Taxes', 'nexopos.delete.taxes', 'Let the user delete taxes', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(86, 'Update Taxes', 'nexopos.update.taxes', 'Let the user update taxes', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(87, 'Read Taxes', 'nexopos.read.taxes', 'Let the user read taxes', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(88, 'See Sale Report', 'nexopos.reports.sales', 'Let you see the sales report', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(89, 'See Products Report', 'nexopos.reports.products-report', 'Let you see the Products report', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(90, 'See Best Report', 'nexopos.reports.best_sales', 'Let you see the best_sales report', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(91, 'See Transaction Report', 'nexopos.reports.transactions', 'Let you see the transactions report', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(92, 'See Yearly Sales', 'nexopos.reports.yearly', 'Allow to see the yearly sales.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(93, 'See Customers', 'nexopos.reports.customers', 'Allow to see the customers', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(94, 'See Inventory Tracking', 'nexopos.reports.inventory', 'Allow to see the inventory', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(95, 'See Customers Statement', 'nexopos.reports.customers-statement', 'Allow to see the customers statement.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(96, 'Read Sales by Payment Types', 'nexopos.reports.payment-types', 'Let the user read the report that shows sales by payment types.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(97, 'Read Low Stock Report', 'nexopos.reports.low-stock', 'Let the user read the report that shows low stock.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(98, 'Read Stock History', 'nexopos.reports.stock-history', 'Let the user read the stock history report.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(99, 'Manage Order Payments', 'nexopos.manage-payments-types', 'Allow to create, update and delete payments type.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(100, 'Edit Purchase Price', 'nexopos.pos.edit-purchase-price', 'Let the user edit the purchase price of products.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(101, 'Edit Order Settings', 'nexopos.pos.edit-settings', 'Let the user edit the order settings.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(102, 'Edit Product Discounts', 'nexopos.pos.products-discount', 'Let the user add discount on products.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(103, 'Edit Cart Discounts', 'nexopos.pos.cart-discount', 'Let the user add discount on cart.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(104, 'POS: Delete Order Products', 'nexopos.pos.delete-order-product', 'Let the user delete order products on POS.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(105, 'Widget: Incomplete Sale Card Widget', 'nexopos.see.incomplete-sale-card-widget', 'Will display a card of current and overall incomplete sales.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(106, 'Widget: Expense Card Widget', 'nexopos.see.expense-card-widget', 'Will display a card of current and overwall expenses.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(107, 'Widget: Sale Card Widget', 'nexopos.see.sale-card-widget', 'Will display current and overall sales.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(108, 'Widget: Best Customers', 'nexopos.see.best-customers-widget', 'Will display all customers with the highest purchases.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(109, 'Widget: Profile', 'nexopos.see.profile-widget', 'Will display a profile widget with user stats.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(110, 'Widget: Orders Chart', 'nexopos.see.orders-chart-widget', 'Will display a chart of weekly sales.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(111, 'Widget: Orders Summary', 'nexopos.see.orders-summary-widget', 'Will display a summary of recent sales.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(112, 'Widget: Best Cashiers', 'nexopos.see.best-cashier-widget', 'Will display all cashiers who performs well.', '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(113, 'Read Cash Flow History', 'nexopos.read.cash-flow-history', 'Allow to the Cash Flow History.', '2025-11-28 23:36:59', '2025-11-28 23:36:59'),
(114, 'Delete Expense History', 'nexopos.delete.cash-flow-history', 'Allow to delete an expense history.', '2025-11-28 23:36:59', '2025-11-28 23:36:59'),
(115, 'Manage Customers Account', 'nexopos.customers.manage-account', 'Allow to manage customer virtual deposit account.', '2025-11-28 23:36:59', '2025-11-28 23:36:59'),
(116, 'Create Products Labels', 'nexopos.create.products-labels', 'Allow the user to create products labels', '2025-11-28 23:36:59', '2025-11-28 23:36:59'),
(117, 'Create Instalment', 'nexopos.create.orders-instalments', 'Allow the user to create instalments.', '2025-11-28 23:37:01', '2025-11-28 23:37:01'),
(118, 'Update Instalment', 'nexopos.update.orders-instalments', 'Allow the user to update instalments.', '2025-11-28 23:37:01', '2025-11-28 23:37:01'),
(119, 'Read Instalment', 'nexopos.read.orders-instalments', 'Allow the user to read instalments.', '2025-11-28 23:37:01', '2025-11-28 23:37:01'),
(120, 'Delete Instalment', 'nexopos.delete.orders-instalments', 'Allow the user to delete instalments.', '2025-11-28 23:37:01', '2025-11-28 23:37:01');

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_procurements`
--

CREATE TABLE `ns_nexopos_procurements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `value` float NOT NULL DEFAULT 0,
  `cost` float NOT NULL DEFAULT 0,
  `tax_value` float NOT NULL DEFAULT 0,
  `invoice_reference` varchar(255) DEFAULT NULL,
  `automatic_approval` tinyint(1) DEFAULT 0,
  `delivery_time` datetime DEFAULT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL DEFAULT 'unpaid',
  `delivery_status` varchar(255) NOT NULL DEFAULT 'pending',
  `total_items` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `author` int(11) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_procurements_products`
--

CREATE TABLE `ns_nexopos_procurements_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `gross_purchase_price` float NOT NULL DEFAULT 0,
  `net_purchase_price` float NOT NULL DEFAULT 0,
  `procurement_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `purchase_price` float NOT NULL DEFAULT 0,
  `quantity` float NOT NULL,
  `available_quantity` float NOT NULL,
  `tax_group_id` int(11) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `tax_type` varchar(255) NOT NULL,
  `tax_value` float NOT NULL DEFAULT 0,
  `total_purchase_price` float NOT NULL DEFAULT 0,
  `unit_id` int(11) NOT NULL,
  `convert_unit_id` int(11) DEFAULT NULL,
  `author` int(11) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_products`
--

CREATE TABLE `ns_nexopos_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `tax_type` varchar(255) DEFAULT NULL,
  `tax_group_id` int(11) DEFAULT NULL,
  `tax_value` float NOT NULL DEFAULT 0,
  `product_type` varchar(255) NOT NULL DEFAULT 'product',
  `type` varchar(255) NOT NULL DEFAULT 'tangible',
  `accurate_tracking` tinyint(1) NOT NULL DEFAULT 0,
  `auto_cogs` tinyint(1) NOT NULL DEFAULT 1,
  `status` varchar(255) NOT NULL DEFAULT 'available',
  `stock_management` varchar(255) NOT NULL DEFAULT 'enabled',
  `barcode` varchar(255) NOT NULL,
  `barcode_type` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `unit_group` int(11) NOT NULL,
  `on_expiration` varchar(255) NOT NULL DEFAULT 'prevent_sales',
  `expires` tinyint(1) NOT NULL DEFAULT 0,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `author` int(11) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ns_nexopos_products`
--

INSERT INTO `ns_nexopos_products` (`id`, `name`, `tax_type`, `tax_group_id`, `tax_value`, `product_type`, `type`, `accurate_tracking`, `auto_cogs`, `status`, `stock_management`, `barcode`, `barcode_type`, `sku`, `description`, `thumbnail_id`, `category_id`, `parent_id`, `unit_group`, `on_expiration`, `expires`, `searchable`, `author`, `uuid`, `created_at`, `updated_at`) VALUES
(1, 'name', 'tax_type', 0, 0, 'product_type', 'type', 0, 0, 'status', 'stock_management', 'barcode', 'barcode_type', 'sku', 'description', 0, 0, 0, 0, 'on_expiration', 0, 0, 0, 'uuid', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1001, '#10 Xenon Sparklers', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866074762', 'code128', 'Spark-1001', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1002, '10 Ball BC Crackling Candle', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244105106', 'code128', 'Roman-1001', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1003, '10 Ball BC Crackling Candle Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'KX0tJfarsx', 'code128', 'Roman-1002', 'NULL', 0, 39, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-12-01 00:00:09'),
(1004, '10 Ball Boomer Candle', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530180822', 'code128', 'Roman-1003', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1005, '10 Ball Boomer Candle single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'sOtBCWg4yc', 'code128', 'Roman-1004', 'NULL', 0, 39, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-12-01 00:00:47'),
(1006, '10 Ball Color Pearl w/Bang Boomer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530180426', 'code128', 'Roman-1005', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1007, '10 Ball Color Pearl w/Bang Boomer Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'gfnJbGsTF0', 'code128', 'Roman-1006', 'NULL', 0, 39, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-12-01 00:02:41'),
(1008, '10 Ball Color With report TNT', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736017263', 'code128', 'Roman-1007', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1009, '10 Ball Color With report TNT Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '00pQ4BHbe6', 'code128', 'Roman-1008', 'NULL', 0, 39, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-12-01 00:01:48'),
(1010, '10 Ball Hot Shot Crackling', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736001576', 'code128', 'Roman-1009', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1011, '10 Ball Hot Shot Crackling Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'e6SQ3ca0cu', 'code128', 'Roman-1010', 'NULL', 0, 39, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-12-01 21:57:34'),
(1012, '10 Ball Mad Dog', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736006076', 'code128', 'Roman-1011', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1013, '10 Ball Mad Dog Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'MoHkJAKDkX', 'code128', 'Roman-1012', 'NULL', 0, 39, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-12-01 00:03:27'),
(1014, '10 Ball Mini Magic Candle', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009002983', 'code128', 'Roman-1013', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1015, '10 Ball Mini Magic Candle-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'EKuoWDbKbX', 'code128', 'Roman-1014', 'NULL', 0, 39, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-12-01 00:04:12'),
(1016, '10 Ball RC RR', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270111020', 'code128', 'Roman-1015', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1017, '10 Ball Red Rhino Candle-pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '814327011102', 'code128', 'Roman-1016', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1018, '10 Ball Red Rhino Candle-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'hS0oGfpPzB', 'code128', 'Roman-1017', 'NULL', 0, 39, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-12-01 00:04:56'),
(1019, '10 Ball Red Rhino Roman Candle', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270111013', 'code128', 'Roman-1018', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1020, '10 Ball TNT Assorted', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736014651', 'code128', 'Roman-1019', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1021, '10 Ball TNT Assorted Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'Kq7nMpd3D7', 'code128', 'Roman-1020', 'NULL', 0, 39, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-12-01 00:06:20'),
(1022, '10 Crackling Roman Candle Single TNT', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'mFMPxVn49V', 'code128', 'Roman-1021', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-30 23:56:00'),
(1023, '10 Mini Boomer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530181225', 'code128', 'Roman-1022', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1024, '10 Mini Boomer Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'Ztd7zWwigQ', 'code128', 'Roman-1023', 'NULL', 0, 39, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-12-01 21:44:55'),
(1025, '10/200 Black Cat', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244112005', 'code128', '500g-1379', 'NULL', 0, 20, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1026, '10/200 Hog Wild', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880200321', 'code128', 'Hog-1001', 'NULL', 0, 22, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1027, '10/200 Thunder Bomb', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'FHgii3jd8V', 'code128', 'ThunderBomb-1001', 'NULL', 0, 22, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-30 23:29:15'),
(1028, '100 Saturn Missile WC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530138113', 'code128', 'Multi-1001', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1029, '100 Shot Saturn TNT', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736009169', 'code128', 'Multi-1002', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1030, '1000 Gram Display', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244964017', 'code128', '500g-1001', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1031, '1000 Gram Finale BC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', '500g-1002', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1032, '1000 Red Devil Roll', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736009015', 'code128', 'Special-1001', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1033, '1000 Roll World Class Roll', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880202417', 'code128', 'ThunderBomb-1002', 'NULL', 0, 22, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1034, '1000 Shot Saturn Missile America\'s Battery', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Multi-1003', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1035, '1000 Thunder Bomb Roll', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970120314', 'code128', 'Special-1003', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1036, '100ct Black Cat', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530051016', 'code128', 'bc-1001', 'NULL', 0, 20, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1037, '100ct Red Devil', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '77545464646', 'code128', 'RedDevil-1001', 'NULL', 0, 22, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1038, '100ct Thunder Bomb', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736012473', 'code128', 'ThunderBomb-1003', 'NULL', 0, 22, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1039, '100pk Mad Dog', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530050316', 'code128', 'MadDog-1001', 'NULL', 0, 20, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1040, '10Ball Baby Shot (Red Rhino)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736012442', 'code128', 'Roman-1024', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1041, '10Ball Baby Shot-Single Red Rhino', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270110924', 'code128', 'Roman-1025', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-30 23:56:56'),
(1042, '10in Gold TNT Sparklers RWB 12pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Spark-1002', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1043, '120 Second Showcase', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736022793', 'code128', '500g-1003', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1044, '14in Morning Glory 24ct Pack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866116431', 'code128', 'Spark-1003', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1045, '14in Morning Glory 24ct Winda', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270110412', 'code128', 'Spark-1004', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1046, '16000 Red Devil Roll', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108098101', 'code128', 'Special-1004', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-12-01 22:20:16'),
(1047, '16000 Red Rhino', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270100918', 'code128', 'Special-1005', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1048, '16000 Roll Thunder Bomb', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530051610', 'code128', 'Special-1006', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1049, '16ct Mad Dog', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'mad16', 'code128', 'MadDog-1002', 'NULL', 0, 20, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1050, '16ct Power Cracker', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'RedDevil-1002', 'NULL', 0, 22, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1051, '16ct Red Devil', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270100017', 'code128', 'RedDevil-1003', 'NULL', 0, 22, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1052, '16ct Thunder Bomb-Single Pac', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'oPLW9zVIda', 'code128', 'ThunderBomb-1004', 'NULL', 0, 22, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-12-01 22:57:13'),
(1053, '180 Degree Fountain', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530050118', 'code128', 'Fountain-1001', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1054, '2 Color Space Ship-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108311200', 'code128', 'Wing-1001', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1055, '2 Color Spaceship (3pk)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530220917', 'code128', 'Wing-1002', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1056, '2 Minute Firework', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009908063', 'code128', '500g-1004', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1057, '2-Color Space ship 6pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244064335', 'code128', 'Wing-1003', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1058, '2-Color Space ship 6pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736011407', 'code128', 'Wing-1004', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1059, '20 Gold Sparklers TNT', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530220924', 'code128', 'Spark-1005', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1060, '20 Gold Sparklers WC Wedding Sparklers 20in 10boxes of 2', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736022847', 'code128', 'Spark-1006', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1061, '20 Gold Sparklers WC Wedding Sparklers 20in 1box 2pc', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253375727', 'code128', 'Spark-1007', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1062, '20/100 Mad Dog', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253375710', 'code128', 'MadDog-1003', 'NULL', 0, 20, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1063, '20/100 Red Devil', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736008735', 'code128', 'RedDevil-1004', 'NULL', 0, 22, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1064, '20/100 Thunder Bomb', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736008933', 'code128', 'ThunderBomb-1006', 'NULL', 0, 22, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1065, '200 Shot Color Tail Saturn Missile', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530050323', 'code128', 'Multi-1004', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1066, '2000 Red Devil Roll', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866116806', 'code128', 'Special-1007', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1067, '2000 Roll Outlaw', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736009022', 'code128', 'Special-1008', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1068, '2000 Roll Thunder Bomb', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880202516', 'code128', 'Special-1009', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1069, '2000 Special Firecracker', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530050712', 'code128', 'Special-1010', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1070, '200ct Hog Wild Crackers', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530057117', 'code128', 'Hog-1002', 'NULL', 0, 22, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1071, '200ct Thunder Bomb', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880200314', 'code128', 'ThunderBomb-1007', 'NULL', 0, 22, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-30 23:29:56'),
(1072, '25 Gun Salute', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244102006', 'code128', 'Multi-1005', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1073, '25 Saturn Missile Base TNT', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880250012', 'code128', 'Multi-1006', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1074, '25 Saturn Missile-Red Rhino', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736009206', 'code128', 'Multi-1007', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1075, '25 Zombies', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970114214', 'code128', 'Multi-1008', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1076, '28 Shot Finale', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009003744', 'code128', '500g-1005', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1077, '2nd Degree Burn', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009004079', 'code128', '500g-1006', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1078, '3 Minute Monster', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108804566', 'code128', '500g-1007', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1079, '3 Minute Time Bomb', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866132158', 'code128', '500g-1008', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1080, '3 Monkeys (Hear No Evil)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866105169', 'code128', 'Multi-1009', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1081, '3 Monkeys (See No Evil)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '514677560106', 'code128', 'Multi-1010', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1082, '3 Monkeys (Speak No Evil)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '514677460109', 'code128', 'Multi-1011', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1083, '3 Stage Spaceship 4 Pack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '514677660103', 'code128', 'Wing-1005', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1084, '3 Stage Spaceship Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108602605', 'code128', 'Wing-1006', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1085, '3 To Get Ready', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108602612', 'code128', 'Poly-1001', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1086, '300 Saturn Missile Mad Ox', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530047019', 'code128', 'Multi-1012', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1087, '300 Saturn Missile WC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866082521', 'code128', 'Multi-1013', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1088, '300 Shot Saturn Missile RR', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531311515', 'code128', 'Multi-1014', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1089, '40 Mammoth Parachute-single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270180415', 'code128', 'Para-1001', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1090, '40 Mammoth Parachutes-pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530170717', 'code128', 'Para-1002', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1091, '40/16 Black Cat', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530170724', 'code128', 'bc-1003', 'NULL', 0, 20, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1092, '40/16 Mad Dog', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244114160', 'code128', 'MadDog-1004', 'NULL', 0, 20, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1093, '40/16 Red Devil', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736008711', 'code128', 'RedDevil-1005', 'NULL', 0, 22, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1094, '40/16 Thunder Bomb', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736008902', 'code128', 'ThunderBomb-1008', 'NULL', 0, 22, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1095, '40/50 Black Cat', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530052525', 'code128', 'bc-1004', 'NULL', 0, 20, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1096, '40/50 Mad Dog', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244110506', 'code128', 'MadDog-1005', 'NULL', 0, 20, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1097, '40/50 Thunder Bomb', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736008728', 'code128', 'ThunderBomb-1009', 'NULL', 0, 22, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1098, '40/50ct Hog Wild Crackers', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530050224', 'code128', 'Hog-1003', 'NULL', 0, 22, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1099, '4000 Special Cracker', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880200123', 'code128', 'Special-1011', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1100, '400pk Black Cat', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531310716', 'code128', 'bc-1005', 'NULL', 0, 20, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1101, '488 Roll Crackers WC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244154005', 'code128', 'Special-1012', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1102, '4K Ultra HD', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530053911', 'code128', '500g-1010', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1103, '4oz BC Rockets', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108557400', 'code128', 'SkyRocket-1001', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1104, '4oz BC Rockets', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009003621', 'code128', 'SkyRocket-1002', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1105, '4oz Rocket Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244004102', 'code128', 'SkyRocket-1003', 'NULL', 0, 41, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1106, '4oz WC Rockets', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'SkyRocket-1004', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1107, '4th of July Backpack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530010310', 'code128', 'Para-1003', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1108, '5 Ball Assorted Roman Candles', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108002306', 'code128', 'Roman-1026', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1109, '5 Ball Boomer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108402205', 'code128', 'Roman-1027', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1110, '5 Ball Boomer pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530180624', 'code128', 'Roman-1028', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1111, '5 Ball Boomer Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530180617', 'code128', 'Roman-1029', 'NULL', 0, 39, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1112, '5 Ball Color Pearl w/bang', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Roman-1030', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1113, '5 Ball Exploding pk (Red Rhino)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530180327', 'code128', 'Roman-1031', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1114, '5 Ball Exploding Single (Red Rhino)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270111129', 'code128', 'Roman-1032', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1115, '5 Ball Mad Dog', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270111112', 'code128', 'Roman-1033', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1116, '5 Ball Mad Dog Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736006069', 'code128', 'Roman-1034', 'NULL', 0, 39, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1117, '5 Magical Roman Candles Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8gRA0CFu0f', 'code128', 'Roman-1035', 'NULL', 0, 39, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-12-01 22:00:25'),
(1118, '5\" BC Shell', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Reload-1', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1119, '5/400 Black Cat ', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'bc-1006', 'NULL', 0, 20, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1120, '50ct Hog Wild Crackers', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244154012', 'code128', 'Hog-1004', 'NULL', 0, 22, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1121, '50ct Thunder Bomb', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880200116', 'code128', 'ThunderBomb-1010', 'NULL', 0, 22, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1122, '50pk Black Cat', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530050217', 'code128', 'bc-1007', 'NULL', 0, 20, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1123, '5in Assassin of Artillery', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244101504', 'code128', 'Reload-1002', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1124, '5in Chameleon Shells', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970114511', 'code128', 'Reload-1003', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1125, '5in Growler Shell', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108805006', 'code128', 'Reload-1004', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1126, '5in Heavyweight', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253354715', 'code128', 'Reload-1005', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1127, '5in Monster Shell', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Reload-1006', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1128, '6 Minute Smoke-single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736042050', 'code128', 'Smoke-1001', 'NULL', 0, 45, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1129, '6 Minutes Smoke-pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Smoke-1002', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1130, '6in Mad Dog Shell', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108260164', 'code128', 'Reload-1007', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1131, '6in Scatter Bombs', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736042067', 'code128', 'Reload-1008', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1132, '7 Devils', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108805204', 'code128', 'Multi-1015', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1133, '7 Lantern 6 Pack TO', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736035946', 'code128', 'Para-1004', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1134, '7 Lantern Parachute 6pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880232520', 'code128', 'Para-1005', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1135, '7 Lantern Parachute pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530170120', 'code128', 'Para-1006', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1136, '7 Lantern Parachute pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736011650', 'code128', 'Para-1007', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1137, '7 Lantern Parachute single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244641314', 'code128', 'Para-1008', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1138, '7 Lantern Parachutes-single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244064137', 'code128', 'Para-1009', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1139, '7 Lanterns Parachute-single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736011698', 'code128', 'Para-1010', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1140, '750 Shot Saturn Missile Small', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530170113', 'code128', 'Multi-1016', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1141, '8 Ball Magic Comet Candle', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253395411', 'code128', 'Roman-1036', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1142, '8 Ball Magic Comet Candle Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736038787', 'code128', 'Roman-1037', 'NULL', 0, 39, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1143, '8 Ball Texas Cyclone Roman Candle', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Roman-1038', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1144, '8 Ball Texas Cyclone Roman Candle Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736008476', 'code128', 'Roman-1039', 'NULL', 0, 39, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1145, '80/16 Black Cat', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'bc-1008', 'NULL', 0, 20, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1146, '80/16 Mad Dog', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244118168', 'code128', 'MadDog-1006', 'NULL', 0, 20, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1147, '80/16 Thunder Bomb', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736006717', 'code128', 'ThunderBomb-1011', 'NULL', 0, 22, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1148, '800 Saturn Battery', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530050125', 'code128', 'Multi-1017', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1149, '8oz B/C Rockets', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270180811', 'code128', 'SkyRocket-1005', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1150, '8oz Red Devil Rockets', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244004126', 'code128', 'SkyRocket-1006', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1151, '8oz Rocket Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '13995003055', 'code128', 'SkyRocket-1007', 'NULL', 0, 41, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1152, '8oz WC Rockets', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'SkyRocket-1008', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1153, '96 Lil Zipper', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530010518', 'code128', 'Multi-1018', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1154, '9MM', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009003461', 'code128', '500g-1011', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1155, 'A. I.', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531544715', 'code128', 'Multi-1019', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1156, 'Absolute Destruction', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253300101', 'code128', '500g-1012', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1157, 'Absolute Dominance', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244064588', 'code128', 'Tray-1001', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1158, 'Absolute Power C', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866113126', 'code128', 'Tray-1002', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1159, 'Absolute Power W/Giant Silver Tail', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736014491', 'code128', 'Reload-1009', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1160, 'Academic Pyro', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108802715', 'code128', '500g-1013', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1161, 'Addicted to Loud', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '810000100217', 'code128', '500g-1014', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1162, 'Adrenaline Rush Fountain 500gram', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108538805', 'code128', 'Fountain-1002', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1163, 'Adult Snappers', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880229711', 'code128', 'Novel-1001', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1164, 'Adults Only', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253369214', 'code128', 'Multi-1020', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1165, 'Agent of Boom', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531336211', 'code128', '500g-1015', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1166, 'Air Cavalry Box', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108803262', 'code128', 'Para-1011', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1167, 'Air Cavalry Parachutes/w-man', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736013548', 'code128', 'Para-1012', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1168, 'Air Fighter', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736013555', 'code128', 'Tray-1003', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1169, 'Air Force', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108000111', 'code128', 'Tray-1004', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1170, 'Air Show', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970104215', 'code128', '500g-1016', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1171, 'Air Supremacy', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253365216', 'code128', '500g-1017', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1172, 'Air Trooper', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880273110', 'code128', 'Para-1013', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1173, 'Alien UFO-Pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270140112', 'code128', 'Ground-1000', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-30 23:18:31'),
(1174, 'Alien UFO-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'WaHBiFB0ZC', 'code128', 'Ground-1001', 'NULL', 0, 17, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-30 23:15:47'),
(1175, 'All Gas No Brakes', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', '500g-1018', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1176, 'All In', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108556106', 'code128', '500g-1019', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1177, 'Alpha Male', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108548309', 'code128', '500g-1020', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1178, 'Amazing Ballet', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253365810', 'code128', '500g-1021', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1179, 'Amazing fountains Pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108531707', 'code128', 'Fountain-1003', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1180, 'Amazing Fountains-single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736002337', 'code128', 'Fountain-1004', 'NULL', 0, 15, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1181, 'America Power Series', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', '500g-1022', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1182, 'America Praying', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866112563', 'code128', '500g-1023', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1183, 'American Born', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253365711', 'code128', '500g-1024', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 21:00:34'),
(1184, 'American Cannonballs', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253334519', 'code128', 'Smoke-1003', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1185, 'American Dog Fight', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970109913', 'code128', '500g-1025', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1186, 'American Envy', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736037469', 'code128', 'Tray-1005', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1187, 'American Glory', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052532443314', 'code128', '500g-1026', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1188, 'American Muscle', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253301870', 'code128', 'Multi-1021', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1189, 'American Pyro', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253310711', 'code128', 'Tray-1006', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1190, 'American Pyro', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970123513', 'code128', 'Tray-1007', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1191, 'American Riders', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270181917', 'code128', '500g-1027', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1192, 'American Strategy', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531545316', 'code128', 'Tray-1008', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1193, 'American Trucker', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253301931', 'code128', '500g-1028', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1194, 'Americana', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531322511', 'code128', 'Reload-1010', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1195, 'Americano-Pyro Blends', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866098836', 'code128', 'Fountain-1005', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1196, 'Americas Best', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108320714', 'code128', '500g-1029', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1197, 'Americas Elite', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736013517', 'code128', 'Reload-1011', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1198, 'Americas Pastime', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244063703', 'code128', '500g-1030', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29');
INSERT INTO `ns_nexopos_products` (`id`, `name`, `tax_type`, `tax_group_id`, `tax_value`, `product_type`, `type`, `accurate_tracking`, `auto_cogs`, `status`, `stock_management`, `barcode`, `barcode_type`, `sku`, `description`, `thumbnail_id`, `category_id`, `parent_id`, `unit_group`, `on_expiration`, `expires`, `searchable`, `author`, `uuid`, `created_at`, `updated_at`) VALUES
(1199, 'Americas Rhythm', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531545613', 'code128', '500g-1031', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1200, 'Ammo Crate', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531502517', 'code128', '500g-1032', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1201, 'Ammo Smoke', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009961044', 'code128', 'Smoke-1004', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1202, 'Amped Up (NOT SOLD SEPARATE)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736006502', 'code128', '500g-1033', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1203, 'Angry Leprechaun', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108954810', 'code128', '500g-1034', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1204, 'Angry Pandas', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253334618', 'code128', '500g-1035', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1205, 'Angry Wife', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108543403', 'code128', 'Multi-1022', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1206, 'Anti Gravity', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253349810', 'code128', 'Ground-1002', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1207, 'Any 25 Saturn Missile', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866090007', 'code128', 'Multi-1023', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1208, 'Any Festival Balls', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244006793', 'code128', 'Reload-1012', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1209, 'Any Premium Artillery', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253335219', 'code128', 'Reload-1013', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1210, 'Apocalypse', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '814327017401', 'code128', 'Reload-1014', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1211, 'Apocalyptic Warrior', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970105717', 'code128', '500g-1036', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1212, 'Armed Forces', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736034208', 'code128', '500g-1037', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1213, 'Armed Forces', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253310223', 'code128', '500g-1038', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1214, 'Armed Forces', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253310230', 'code128', '500g-1039', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1215, 'Armed Forces', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253310247', 'code128', '500g-1040', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1216, 'Armed Forces', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253310254', 'code128', '500g-1041', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1217, 'Armed Forces 8shot Multi', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253310261', 'code128', 'Multi-1024', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1218, 'Armored Car', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736025978', 'code128', 'Poly-1002', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1219, 'Artificial Satellite', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970104314', 'code128', 'Wing-1007', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1220, 'Artificial Satellite Pk (TNT)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270130519', 'code128', 'Wing-1008', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1221, 'Artistic Pyro', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736016525', 'code128', '500g-1042', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1222, 'Assassin 500 Gram', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108551101', 'code128', '500g-1043', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1223, 'Assorted Artillery Shell (Winda)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270169014', 'code128', 'Reload-1015', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1224, 'At It Again', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108515059', 'code128', 'Multi-1025', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1225, 'Atomic Salsa-500 gram', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531336716', 'code128', 'Fountain-1006', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1226, 'Atomizer 3in Shell', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736042555', 'code128', '500g-1044', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1227, 'Avengers', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270160417', 'code128', 'Reload-1016', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1228, 'B-2 Bomber', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531401414', 'code128', '500g-1045', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1229, 'B-3 Bomber pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108557806', 'code128', 'Wing-1009', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1230, 'B-3 Bomber Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270130625', 'code128', 'Wing-1010', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1231, 'Baby Dino', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '55222144555', 'code128', '500g-1046', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1232, 'Back Yard Hero', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253365315', 'code128', 'Reload-1017', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1233, 'Backstreet Diva', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531401810', 'code128', '500g-1047', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1234, 'Backyard Party', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970128310', 'code128', 'Fountain-1007', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1235, 'Bad Boy', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '687985984817', 'code128', '500g-1048', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1236, 'Bada Bing', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253366015', 'code128', 'Multi-1026', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1237, 'Baller Rocket', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531312611', 'code128', 'SkyRocket-1009', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1238, 'Baller Rocket-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736018772', 'code128', 'SkyRocket-1010', 'NULL', 0, 41, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1239, 'Ballerina Ball', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Fountain-1008', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1240, 'Balls of Fire 210 Shot', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108308507', 'code128', 'Roman-1040', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1241, 'Bang Snap / Snapper / Pop it Winda', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530185414', 'code128', 'Novel-1002', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1242, 'Banguccino-Pyro Blends', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108900220', 'code128', 'Fountain-1009', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1243, 'Bat out of Hell', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108320721', 'code128', 'Multi-1027', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1244, 'Batter Up', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736016655', 'code128', '500g-1049', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1245, 'Battle Call', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270160813', 'code128', 'Multi-1028', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1246, 'Battle Ready', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736031252', 'code128', '500g-1050', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1247, 'Battle Trax PK', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '19197011581', 'code128', 'Multi-1029', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1248, 'Battle Trax Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970128822', 'code128', 'Novel-1003', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1249, 'Bazooka Candle', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970128815', 'code128', 'Roman-1041', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1250, 'Bazooka Candle Camo', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244052127', 'code128', 'Fountain-1010', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1251, 'BC Night Display', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244052110', 'code128', 'Tray-1009', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1252, 'BC Night Display', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244000029', 'code128', 'Tray-1010', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1253, 'BC Ring Shells Rockets', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244000012', 'code128', 'SkyRocket-1011', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1254, 'Beach Nut', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244004492', 'code128', 'Multi-1030', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1255, 'Beach Vibes', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880250517', 'code128', 'Multi-1031', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1256, 'Bearing Arms', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108601462', 'code128', '500g-1051', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1257, 'Beauty & Beast', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970118816', 'code128', '500g-1052', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1258, 'Beer Pack Fountain', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253312517', 'code128', 'Fountain-1011', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1259, 'Bent Rail', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531135814', 'code128', '500g-1053', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1260, 'Best of Show', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253300385', 'code128', '500g-1054', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1261, 'Big and Bad', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736031771', 'code128', 'Multi-1032', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1262, 'Big Bad Wolf', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108512607', 'code128', '500g-1055', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1263, 'Big Bang', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270166211', 'code128', 'Tray-1011', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1264, 'Big Bomb Bag', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736012930', 'code128', 'Poly-1003', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1265, 'Big Bomb Jumbo', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736001651', 'code128', 'Special-1013', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1266, 'Big Bomb Jumbo Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736015290', 'code128', 'Special-1014', 'NULL', 0, 25, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1267, 'Big Bomb Rocket', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'SkyRocket-1012', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1268, 'Big Bomb Rocket Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736008292', 'code128', 'SkyRocket-1013', 'NULL', 0, 41, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1269, 'Big Bomb Tray', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Tray-1012', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1270, 'Big City Display', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736004485', 'code128', 'Tray-1013', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1271, 'Big Red', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009001092', 'code128', '500g-1056', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1272, 'Binge', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270195716', 'code128', 'Reload-1018', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1273, 'Bite Your Tushy', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '687985907403', 'code128', '500g-1057', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1274, 'Black Cat 16ct', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531343219', 'code128', 'bc-1009', 'NULL', 0, 20, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1275, 'Black Cat Black Box', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Reload-1019', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1276, 'Black Cat Classic Artillery', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244061228', 'code128', 'Reload-1020', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1277, 'Black Dynamite', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244064090', 'code128', '500g-1058', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1278, 'Black Ops', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531515913', 'code128', '500g-1059', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1279, 'Black Site Armaments', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531527015', 'code128', 'Reload-1021', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1280, 'Black Tote Poly Bag BC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108804702', 'code128', 'Poly-1004', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1281, 'Black Widow', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244000050', 'code128', 'Fountain-1012', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1282, 'Blast Master', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736026890', 'code128', 'Reload-1022', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1283, 'Blaze and Ice', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736033607', 'code128', '500g-1060', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1284, 'Blood Sweat & Tears', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253393417', 'code128', 'Multi-1033', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1285, 'Blue (BC)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253350212', 'code128', '500g-1061', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1286, 'Blue Hawaii', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244063796', 'code128', '500g-1062', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1287, 'Blue Magic', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736021642', 'code128', 'Multi-1034', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1288, 'Bomb Bastic', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736032600', 'code128', 'Multi-1035', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1289, 'Bomb Chicka Bomb', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531337911', 'code128', 'Multi-1036', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1290, 'Bond', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531337218', 'code128', '500g-1063', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1291, 'Bone Breaker', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736030040', 'code128', '500g-1064', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1292, 'Bone Yard', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736038800', 'code128', 'Multi-1037', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1293, 'Booby Traps', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531340317', 'code128', 'Novel-1004', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1294, 'Boom Ball', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866009337', 'code128', 'Poly-1005', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1295, 'Boom Boom Pow Pow', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '85186610027765', 'code128', 'Roman-1042', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1296, 'Boom Boom Pow Pow-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530186251', 'code128', 'Roman-1043', 'NULL', 0, 39, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1297, 'Boomcha-Pyro Blends', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Fountain-1013', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1298, 'Boomer Bottle Rockets', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108320738', 'code128', 'Bottle-1001', 'NULL', 0, 42, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1299, 'Boomer Premium Art Shell', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530080320', 'code128', 'Reload-1023', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1300, 'Boominator', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530143513', 'code128', 'Multi-1038', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1301, 'Booty Chaser', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736036141', 'code128', 'Multi-1039', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1302, 'Born to Ride', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970114917', 'code128', '500g-1065', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1303, 'Boss Frog', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270161315', 'code128', '500g-1066', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1304, 'Boss Lady', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970119011', 'code128', 'Multi-1040', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1305, 'Bottoms Up', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253350410', 'code128', '500g-1067', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1306, 'Boy or Girl (Blue-Boy)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108555000', 'code128', '500g-1068', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1307, 'Boy or Girl (Pink-Girl)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108550609', 'code128', '500g-1069', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1308, 'Brave Eagle', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108550708', 'code128', 'Fountain-1014', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1309, 'Break the Vault', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108320806', 'code128', '500g-1070', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1310, 'Bring It', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108555208', 'code128', '500g-1071', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1311, 'Bring it On', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736033614', 'code128', 'Multi-1041', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1312, 'Bring It-Fountain', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '50090055', 'code128', 'Fountain-1015', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1313, 'Broadcast Frequency', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880226512', 'code128', '500g-1072', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1314, 'Bruno', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108803866', 'code128', '500g-1073', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1315, 'Buckle Up', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Multi-1042', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1316, 'Bugs Bugs Bugs', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Wing-1011', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1317, 'Bull Run', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866112372', 'code128', 'Multi-1043', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1318, 'Bullet Blossoms', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244063895', 'code128', '500g-1074', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1319, 'Bursting Bouquet', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108555802', 'code128', 'Fountain-1016', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1320, 'Bursting with Pride Bag', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270147111', 'code128', 'Poly-1006', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1321, 'Butterfly Rocket Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736000289', 'code128', 'SkyRocket-1014', 'NULL', 0, 41, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1322, 'Butterfly Rocket-BC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'SkyRocket-1015', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1323, 'Butterfly Rockets Pk (T0510)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244104529', 'code128', 'SkyRocket-1016', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1324, 'Butterfly Rockets Pk (T0510)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '6520090006682', 'code128', 'SkyRocket-1017', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1325, 'Butterfly Rockets TNT', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '6520090066826', 'code128', 'SkyRocket-1018', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1326, 'Butterfly Rockets-Boomer Pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736014866', 'code128', 'SkyRocket-1019', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1327, 'Cajun Kid', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530100424', 'code128', 'Tray-1014', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1328, 'Cajun Kid', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970124114', 'code128', 'Tray-1015', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1329, 'Call Me Wayne', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880281115', 'code128', '500g-1075', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1330, 'Camellia Flower', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253312418', 'code128', 'Ground-1003', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1331, 'Camellia Flower pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '92143700022', 'code128', 'Ground-1004', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1332, 'Camo Smoke', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Smoke-1005', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1333, 'Can of Worms', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009001757', 'code128', 'Novel-1005', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1334, 'Candle Bomb Blue Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736028177', 'code128', 'Roman-1045', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1335, 'Candle Bomb Green Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244025220', 'code128', 'Roman-1046', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1336, 'Candle Bomb pack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244035229', 'code128', 'Roman-1047', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1337, 'Candle Bomb Purple Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244005222', 'code128', 'Roman-1048', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1338, 'Candle Bomb Red Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244045228', 'code128', 'Roman-1049', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1339, 'Captain Jake', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244015221', 'code128', '500g-1076', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1340, 'Carolina Reaper', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531530510', 'code128', '500g-1077', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1341, 'Carousel Fountains', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108556700', 'code128', 'Fountain-1017', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1342, 'Cave Busters', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736026265', 'code128', 'Reload-1024', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1343, 'Centrifuge', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736023448', 'code128', 'Fountain-1018', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1344, 'CEO of Assortments', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244022328', 'code128', 'Tray-1016', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1345, 'Chameleon 2000', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Multi-1044', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1346, 'Chameleon 5000', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108518104', 'code128', '500g-1078', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1347, 'Champangne Party Popper 6 PCS', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108555703', 'code128', 'Novel-1006', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1348, 'Chaos', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530161029', 'code128', '500g-1079', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1349, 'Chaotic Incident', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531514213', 'code128', '500g-1080', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1350, 'Charge', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108555307', 'code128', 'Multi-1045', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1351, 'Cheeky Fountain', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253300033', 'code128', 'Fountain-1019', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1352, 'Cheers!', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736029884', 'code128', '500g-1081', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1353, 'Cherry Drop', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880273219', 'code128', '500g-1082', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1354, 'Chick Stick Pink Smoke 2 pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270168611', 'code128', 'Smoke-1006', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1355, 'Chicken Blowing Balloon', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530203620', 'code128', 'Novel-1007', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1356, 'Chicken Coop PK', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531605911', 'code128', 'Novel-1008', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1357, 'Chicken On A Chain', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736014620', 'code128', '500g-1083', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1358, 'Chopper', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531511410', 'code128', 'Multi-1046', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1359, 'Chroma Chameleon', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736030194', 'code128', '500g-1084', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1360, 'Circus Peanuts', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Novel-1009', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1361, 'Civil War', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530222812', 'code128', '500g-1085', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1362, 'Climbing Panda PK', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253351813', 'code128', 'Novel-1010', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1363, 'Climbing Panda PK', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736011896', 'code128', 'Novel-1011', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1364, 'Climbing Panda-single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530161111', 'code128', 'Novel-1012', 'NULL', 0, 31, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1365, 'Clocked Out', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', '500g-1086', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1366, 'Club 54', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270195617', 'code128', '500g-1087', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1367, 'Club Mix', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', '500g-1088', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1368, 'Cluster Bees Rocket Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108551804', 'code128', 'SkyRocket-1020', 'NULL', 0, 41, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1369, 'Cluster Bees Rockets pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'SkyRocket-1021', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1370, 'Cluster Bees Rockets pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736014873', 'code128', 'SkyRocket-1022', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1371, 'Clustering Bee Pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '6520090006378', 'code128', 'SkyRocket-1023', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1372, 'Cobra Copter-single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530100325', 'code128', 'Wing-1012', 'NULL', 0, 19, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1373, 'Cobra Copters pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Wing-1013', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1374, 'Cobra Strike', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970120512', 'code128', 'Multi-1047', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1375, 'Colonel Popper', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '676551031932', 'code128', '500g-1089', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1376, 'Color Cascade', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108558605', 'code128', '500g-1090', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1377, 'Color Changing Smoke Sticks Green to Orange', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108547203', 'code128', 'Smoke-1007', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1378, 'Color Changing Smoke Sticks Pink to Blue', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108601318', 'code128', 'Smoke-1008', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1379, 'Color Changing Smoke Sticks Yellow to Purple', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108601325', 'code128', 'Smoke-1009', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1380, 'Color Pearl 48 (2PK) (BC)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108601370', 'code128', 'Multi-1048', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1381, 'Color Pearl 48 (BC)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244260386', 'code128', 'Multi-1049', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1382, 'Color Pearl 48 (TNT)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244060382', 'code128', 'Multi-1050', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1383, 'Color Pearl 96 shot TNT', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736011544', 'code128', 'Multi-1051', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1384, 'Color Pearl Boomer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '0277360115510', 'code128', 'Multi-1052', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1385, 'Color Pearl Flower 48 Red Rhino', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530130414', 'code128', 'Multi-1053', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1386, 'Color Pearl Flower 96 Red Rhino', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270150715', 'code128', 'Multi-1054', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1387, 'Color Rain', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270150814', 'code128', 'Multi-1055', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1388, 'Color Smoke  6pk (BC)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970117819', 'code128', 'Smoke-1010', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1389, 'Color Smoke Balls RR', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244070268', 'code128', 'Smoke-1011', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1390, 'Color Smoke Grenade', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270112218', 'code128', 'Smoke-1012', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1391, 'Color Smoke Grenade', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '111111000923', 'code128', 'Smoke-1013', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1392, 'Color Snake', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108260256', 'code128', 'Novel-1013', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1393, 'Color Snake 4pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530168813', 'code128', 'Novel-1014', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1394, 'Color Snake 8 PK', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736012701', 'code128', 'Novel-1015', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1395, 'Color Snakes 6 pack RR', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736015795', 'code128', 'Novel-1016', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1396, 'Color Snakes 6pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270134623', 'code128', 'Novel-1017', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1397, 'Color Sparkler WC 12 Pack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530168820', 'code128', 'Spark-1008', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1398, 'Color Sparklers No.10 RR', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530192719', 'code128', 'Spark-1009', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1399, 'Color Sparklers Single (BlueBx)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270110016', 'code128', 'Spark-1010', 'NULL', 0, 37, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1400, 'Color Sparklers WC 12 Pack (BlueBx)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Spark-1011', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29');
INSERT INTO `ns_nexopos_products` (`id`, `name`, `tax_type`, `tax_group_id`, `tax_value`, `product_type`, `type`, `accurate_tracking`, `auto_cogs`, `status`, `stock_management`, `barcode`, `barcode_type`, `sku`, `description`, `thumbnail_id`, `category_id`, `parent_id`, `unit_group`, `on_expiration`, `expires`, `searchable`, `author`, `uuid`, `created_at`, `updated_at`) VALUES
(1401, 'Color War (BC)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530196212', 'code128', '500g-1091', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1402, 'Colorful Skies', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Multi-1056', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1403, 'Colors Galore', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270157714', 'code128', 'Reload-1025', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1404, 'Colossus', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866119746', 'code128', '500g-1092', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1405, 'Combat Zone', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736030170', 'code128', '500g-1093', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1406, 'Combat Zone', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244064076', 'code128', '500g-1094', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1407, 'Combat Zone', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '933175781146', 'code128', 'Smoke-1014', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1408, 'Come On', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530203910', 'code128', '500g-1095', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1409, 'Computer Fountains', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253153090', 'code128', 'Fountain-1020', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1410, 'Contraband', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530128916', 'code128', '500g-1096', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1411, 'Contraband', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009961051', 'code128', '500g-1097', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1412, 'Corruption', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '662394946420', 'code128', '500g-1098', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1413, 'Cosmic Titan', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736022670', 'code128', '500g-1099', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1414, 'Country Boy', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970116317', 'code128', '500g-1100', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1415, 'Courageous', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253300415', 'code128', 'Multi-1057', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1416, 'Courtesy of Red White Blue', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736035793', 'code128', '500g-1101', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1417, 'Cowboy Up!', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531540519', 'code128', 'Multi-1058', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1418, 'Crack Me Up', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880253013', 'code128', '500g-1102', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1419, 'Crackling Balls', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736026494', 'code128', 'Novel-1018', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1420, 'Crackling Balls Red Rhino', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530165317', 'code128', 'Novel-1019', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1421, 'Crackling Color Palm', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270132414', 'code128', 'Multi-1059', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1422, 'Crackling Thunderstring 12ft 2pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531322818', 'code128', 'Novel-1020', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1423, 'Crackling Thunderstring 12ft single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736020843', 'code128', 'Novel-1021', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1424, 'Crackling Thunderstring 6ft 2pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736020577', 'code128', 'Novel-1022', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1425, 'Crackling Thunderstring 6ft single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736020560', 'code128', 'Novel-1023', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1426, 'Crazy Ape 2pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736020591', 'code128', 'Novel-1024', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1427, 'Crazy Ape Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970117512', 'code128', 'Novel-1025', 'NULL', 0, 31, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1428, 'Crazy Exciting Steroids', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', '500g-1103', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1429, 'Crazy Exciting-Multi Aerial', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531503910', 'code128', 'Multi-1060', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1430, 'Crazy Eyeball 32pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531317715', 'code128', 'Ground-1005', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1431, 'Crazy Eyeballs', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736013234', 'code128', 'Ground-1006', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1432, 'Crazy Like A Fox', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736013210', 'code128', 'Multi-1061', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1433, 'Crickets Fountains', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108600762', 'code128', 'Fountain-1021', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1434, 'Crisis Alert', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736007837', 'code128', '500g-1104', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1435, 'Cross the Line', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736031764', 'code128', '500g-1105', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1436, 'Crushing Candy', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108553907', 'code128', 'Fountain-1022', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1437, 'Crystallized', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531145615', 'code128', 'Fountain-1023', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1438, 'Cuckoo Boomer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970116911', 'code128', 'Fountain-1024', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1439, 'Cuckoo Pack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530123218', 'code128', 'Fountain-1025', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1440, 'Cuckoo-Red Rhino-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530123225', 'code128', 'Fountain-1026', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1441, 'Cuckoo-Red Rhino/Pack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270142710', 'code128', 'Fountain-1027', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1442, 'Cuckoo-TNT', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270142727', 'code128', 'Fountain-1028', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1443, 'Cutlass', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736009602', 'code128', 'Multi-1062', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1444, 'CyberSpace Rocket', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736038824', 'code128', 'SkyRocket-1024', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1445, 'Da Vinci', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253320215', 'code128', '500g-1106', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1446, 'Daddy Shoes', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Fountain-1029', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1447, 'Dancing Daises-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'GIFBlX6eq8', 'code128', 'Ground-1007', 'NULL', 0, 17, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-30 23:16:16'),
(1448, 'Dancing Daisies', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880228516', 'code128', 'Ground-1008', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1449, 'Dancing Devil  TNT', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Ground-1009', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1450, 'Dang It Carl', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736020942', 'code128', 'Multi-1063', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1451, 'Dark Ghost', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736035915', 'code128', 'Multi-1064', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1452, 'Dark Revenge', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970110315', 'code128', '500g-1107', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1453, 'Darts', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531336815', 'code128', 'Wing-1014', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1454, 'Deadly Catch', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736030057', 'code128', '500g-1108', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1455, 'Death By Stereo', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866012047', 'code128', '500g-1109', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1456, 'Death Squad', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531544616', 'code128', 'Multi-1065', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1457, 'Death Squad', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970127917', 'code128', 'Multi-1066', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1458, 'Deathcon 1', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253154500', 'code128', '500g-1110', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1459, 'Decimator', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531545019', 'code128', 'Reload-1026', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1460, 'Deja Blue', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108804467', 'code128', 'Multi-1067', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1461, 'Delta Fire', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '814327017210', 'code128', 'Multi-1068', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1462, 'Demolition', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531313618', 'code128', '500g-1111', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1463, 'Desert at Night (BC)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736029983', 'code128', 'Multi-1069', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1464, 'Desert at Night (Red Rhino)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736019922', 'code128', 'Multi-1070', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1465, 'Desert Smoke', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244160600', 'code128', 'Smoke-1015', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1466, 'Destroyer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270150913', 'code128', '500g-1112', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1467, 'Diablo', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530200513', 'code128', 'Reload-1027', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1468, 'Diablo', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736016594', 'code128', 'Reload-1028', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1469, 'Disco Ball 9\'s', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244063154', 'code128', '500g-1113', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1470, 'Diversion', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244063291', 'code128', '500g-1114', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1471, 'Divide & Conquer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108553600', 'code128', 'Reload-1029', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1472, 'Doggie Doo Doo', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736040940', 'code128', 'Novel-1026', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1473, 'Dogs Days of Summer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '690000000058', 'code128', 'Multi-1071', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1474, 'Dominator Black Box (Festival Ball)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009903457', 'code128', 'Reload-1030', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1475, 'Donut Shells', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970125913', 'code128', 'Reload-1031', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1476, 'Doomsday Machine', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866006381', 'code128', '500g-1115', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1477, 'Double Dragon', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108804504', 'code128', 'Reload-1032', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1478, 'Double Scoop', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970113613', 'code128', '500g-1116', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1479, 'Double Tap', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108804405', 'code128', '500g-1117', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1480, 'Double Trouble 6\" Shell', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108555901', 'code128', 'Reload-1033', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1481, 'Dr Jekyll', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970115419', 'code128', '500g-1118', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1482, 'Dr Shell', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '0277360', 'code128', 'Reload-1034', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1483, 'Dr. Boom', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253310919', 'code128', '500g-1119', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1484, 'Dragon', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108804801', 'code128', 'Novel-1027', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1485, 'Dragon Fire', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Fountain-1030', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1486, 'Dragon Throne-500gram', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253354616', 'code128', 'Fountain-1031', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1487, 'Dragonfly single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '811451015150', 'code128', 'Wing-1015', 'NULL', 0, 19, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1488, 'Dragons Nest', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108321803', 'code128', '500g-1120', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1489, 'Dreamcatcher', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', '500g-1121', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1490, 'Drone Attack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736034161', 'code128', 'Wing-1016', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1491, 'Drone Attack-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108538508', 'code128', 'Wing-1017', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1492, 'Drone Swarm Pack Only', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253366411', 'code128', 'Wing-1018', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1493, 'Drop Zone', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '11233312465464', 'code128', 'Para-1014', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1494, 'Duck And Cover', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866112433', 'code128', '500g-1122', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1495, 'Dueling Dragon Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530172414', 'code128', 'Novel-1028', 'NULL', 0, 31, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1496, 'Dueling Dragons 2pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880276319', 'code128', 'Novel-1029', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1497, 'Dyno Mighty Mite  BDL', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Special-1015', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1498, 'Dyno Mighty Mite-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736029570', 'code128', 'Special-1016', 'NULL', 0, 25, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1499, 'Eagle', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530020715', 'code128', 'Multi-1072', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1500, 'El Toro', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866125211', 'code128', '500g-1123', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1501, 'Electric Carnival', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270195211', 'code128', 'Multi-1073', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1502, 'Emoji Fountain', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '820000001049', 'code128', 'Fountain-1032', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1503, 'Envy', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009101006', 'code128', '500g-1124', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1504, 'Epic Explosion', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736034437', 'code128', '500g-1125', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1505, 'Eternal Power', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Multi-1074', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1506, 'Evil', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736036417', 'code128', 'Multi-1075', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1507, 'Evil Clown', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531336914', 'code128', '500g-1126', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1508, 'Excalibur', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253300187', 'code128', 'Reload-1035', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1509, 'Excalibur Platinum', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530140116', 'code128', 'Reload-1036', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1510, 'Excellent Bag', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253357013', 'code128', 'Poly-1007', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1511, 'Executioner', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244300327', 'code128', 'Multi-1076', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1512, 'Explosso-Pyro Blends', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531338017', 'code128', 'Fountain-1033', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1513, 'Extreme Machine', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108320745', 'code128', '500g-1127', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1514, 'Eye Candy 16shot Winda', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531318712', 'code128', 'Multi-1077', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1515, 'Eye Candy 8shot/Red Rhino', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108512218', 'code128', 'Multi-1078', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1516, 'Eye In The Sky', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270157011', 'code128', '500g-1128', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1517, 'Fall Out', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880274117', 'code128', '500g-1129', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1518, 'Fan Of Freedom', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736025930', 'code128', '500g-1130', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1519, 'Fancy Freedom', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736037520', 'code128', '500g-1131', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1520, 'Fanta Sea Pack Only', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108955633', 'code128', 'Wing-1019', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1521, 'Fantastic Beast', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108604104', 'code128', '500g-1132', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1522, 'Fast & Furious', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108551903', 'code128', 'Tray-1017', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1523, 'Fast & Furious', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970123612', 'code128', 'Tray-1018', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1524, 'Fat Cat', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270182112', 'code128', 'Fountain-1034', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1525, 'Feel The Heat', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736013296', 'code128', '500g-1133', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1526, 'Feel the Rush', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531539117', 'code128', 'Multi-1079', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1527, 'Ferris Wheel', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531335313', 'code128', 'Novel-1030', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1528, 'Festival Balls BC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736021116', 'code128', 'Reload-1037', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1529, 'Festival Balls Boomer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244061730', 'code128', 'Reload-1038', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1530, 'Festival Balls-Cutting Edge', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '219961848168', 'code128', 'Reload-1039', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1531, 'Fidget Spinner', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '814527309115', 'code128', 'Novel-1031', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1532, 'Fighting Rooster', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970117116', 'code128', '500g-1134', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1533, 'Fire and Fury', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531513711', 'code128', '500g-1135', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1534, 'Fire Crackle', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253330511', 'code128', 'Novel-1032', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1535, 'Fire Engine', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736006038', 'code128', 'Novel-1033', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1536, 'Fire Hydrant', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736013241', 'code128', 'Fountain-1035', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1537, 'Fire Lollipop', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '811451014214', 'code128', 'Fountain-1036', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1538, 'Fire Ninja', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108501564', 'code128', '500g-1136', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1539, 'Fire of Battle', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108558407', 'code128', '500g-1137', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1540, 'Fire Over Water', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880276210', 'code128', '500g-1138', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1541, 'Fire Truck', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270162114', 'code128', 'Novel-1034', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1542, 'Firearm Series (Revolver)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531603320', 'code128', '500g-1139', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1543, 'Firearm Series (Rifle)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970108718', 'code128', '500g-1140', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1544, 'Firearm Series (Semi Auto)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970108411', 'code128', '500g-1141', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1545, 'Firearm Series (Shotgun)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970108619', 'code128', '500g-1142', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1546, 'Firecracker Bomb  BC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970108510', 'code128', 'Special-1017', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1547, 'Fireworks Fiesta', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244001163', 'code128', 'Multi-1080', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1548, 'Fireworks Spectacular', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009306340', 'code128', '500g-1143', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1549, 'Fireworks Tycoon', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970127818', 'code128', 'Multi-1081', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1550, 'Fish On', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736033539', 'code128', 'Fountain-1037', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1551, 'Fish Tank', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736042395', 'code128', '500g-1144', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1552, 'Fish Tank 6inch Reload', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108805105', 'code128', 'Reload-1040', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1553, 'Fist Bump', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108805105', 'code128', '500g-1145', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1554, 'Flabbergasted', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530290712', 'code128', 'Multi-1082', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1555, 'Flame Runner', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108518708', 'code128', 'Novel-1035', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1556, 'Flashing Strobes', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970129126', 'code128', 'Novel-1036', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1557, 'Flawless', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270132711', 'code128', '500g-1146', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1558, 'Flippin\' Awesome', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736044238', 'code128', 'Fountain-1038', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1559, 'Flower Pot', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531204718', 'code128', 'Fountain-1039', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1560, 'Flying Color Butterfly RR', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736042241', 'code128', 'SkyRocket-1025', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1561, 'Flying Space', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270122316', 'code128', 'Poly-1008', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1562, 'Folds Of Honor', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108001705', 'code128', '500g-1147', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1563, 'For Honor', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253300941', 'code128', 'Poly-1009', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1564, 'For Our Flag', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108210374', 'code128', 'Multi-1083', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1565, 'Forged of Fire', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970110810', 'code128', '500g-1148', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1566, 'Frankenmine', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970122011', 'code128', 'Multi-1084', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1567, 'Free Insane Product', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108519705', 'code128', '500g-1149', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1568, 'Free Ride', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '22334455', 'code128', '500g-1150', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1569, 'Freebird', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270195112', 'code128', '500g-1151', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1570, 'Freedom Reigns', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970113316', 'code128', 'Fountain-1040', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1571, 'Friendship Pagoda', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736042166', 'code128', 'Novel-1037', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1572, 'Frog Box of 6', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530210918', 'code128', 'Novel-1038', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1573, 'Frog Prince', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530161326', 'code128', 'Fountain-1041', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1574, 'Frog Princess', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531137719', 'code128', 'Fountain-1042', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1575, 'Frog Red Rhino Box6', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531144915', 'code128', 'Novel-1039', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1576, 'Frog Red Rhino-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270132926', 'code128', 'Novel-1040', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1577, 'Frog-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270132919', 'code128', 'Novel-1041', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1578, 'Fruit Bowls 4pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530161319', 'code128', 'Fountain-1043', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1579, 'Fruit Bowls Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736044429', 'code128', 'Fountain-1044', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1580, 'Ftn Dew', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736044436', 'code128', 'Fountain-1045', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1581, 'Full Speed', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '514677002002', 'code128', 'Multi-1085', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1582, 'Fun Fuel', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253300132', 'code128', 'Multi-1086', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1583, 'Future Warrior', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108519101', 'code128', '500g-1152', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1584, 'G Force', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531543916', 'code128', 'Reload-1041', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1585, 'Galactic Revolt', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108803101', 'code128', 'Fountain-1046', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1586, 'Gambler-Texas Outlaw/Pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736033928', 'code128', 'Roman-1050', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1587, 'Gambler-Texas Outlaw/Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880235026', 'code128', 'Roman-1051', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1588, 'Game Fish', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880235019', 'code128', 'Multi-1087', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1589, 'Garden In Spring', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880255215', 'code128', 'Multi-1088', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1590, 'Garden in Spring BC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736011414', 'code128', 'Multi-1089', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1591, 'Garden In Spring Boomer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244160594', 'code128', 'Multi-1090', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1592, 'Garden In Spring-Red Rhino', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530134016', 'code128', 'Multi-1091', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1593, 'Gator Hunter', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270151217', 'code128', '500g-1153', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1594, 'Ghost Star Rockets', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736030026', 'code128', 'SkyRocket-1026', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1595, 'Giant Chute Pack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108202805', 'code128', 'Para-1015', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1596, 'Giant Chute Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270140426', 'code128', 'Para-1016', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1597, 'Giggles', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270140419', 'code128', 'Fountain-1047', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1598, 'Girl Pink Smoke', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866134732', 'code128', 'Smoke-1016', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1599, 'Girl Power', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736039869', 'code128', 'Fountain-1048', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1600, 'Glitterous Light Rocket RR', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530121016', 'code128', 'SkyRocket-1027', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1601, 'Global Getaway', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270122415', 'code128', 'Tray-1019', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1602, 'Global Warning', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108004201', 'code128', 'Multi-1092', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1603, 'Glory Days', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531337515', 'code128', 'Multi-1093', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29');
INSERT INTO `ns_nexopos_products` (`id`, `name`, `tax_type`, `tax_group_id`, `tax_value`, `product_type`, `type`, `accurate_tracking`, `auto_cogs`, `status`, `stock_management`, `barcode`, `barcode_type`, `sku`, `description`, `thumbnail_id`, `category_id`, `parent_id`, `unit_group`, `on_expiration`, `expires`, `searchable`, `author`, `uuid`, `created_at`, `updated_at`) VALUES
(1604, 'Glow Pop-Its', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531338215', 'code128', 'Novel-1042', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1605, 'Glow Sticks', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736046201', 'code128', 'Spark-1012', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1606, 'Glow Stix', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970116614', 'code128', 'Spark-1013', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1607, 'Go Fast (Garage) series (American Made)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253366510', 'code128', '500g-1154', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1608, 'Go Fast (Garage) series (F1 Outlaw)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970111510', 'code128', '500g-1155', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1609, 'Go Fast (Garage) series (Pullin G\'s)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970111619', 'code128', '500g-1156', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1610, 'Go Fast (Garage) series (Slingshot)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970111817', 'code128', '500g-1157', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1611, 'Going Haywire', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970111718', 'code128', 'Multi-1094', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1612, 'Gold Rush', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244062799', 'code128', 'Multi-1095', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1613, 'Gold Sparklers 8-WC (Red BX)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108515509', 'code128', 'Spark-1014', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1614, 'Gold Sparklers No.10 RR', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530192214', 'code128', 'Spark-1015', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1615, 'Goliath', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270110115', 'code128', 'Reload-1042', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1616, 'Goliath', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253026520', 'code128', 'Reload-1043', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1617, 'Good Thinkin Lincoln 134\'s', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530140413', 'code128', '500g-1158', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1618, 'Goody Bag', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108558209', 'code128', 'Poly-1010', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1619, 'Gorilla Warfare', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736012510', 'code128', '500g-1159', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1620, 'Graffiti', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531514718', 'code128', 'Multi-1096', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1621, 'Grand Cannon', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253300149', 'code128', 'Fountain-1049', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1622, 'Grapes Over Vineyard', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108321506', 'code128', 'Multi-1097', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1623, 'Grave Digger', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531316718', 'code128', '500g-1160', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1624, 'Great Balls of Smoke', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531321118', 'code128', 'Smoke-1017', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1625, 'Greeeen', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253338319', 'code128', '500g-1161', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1626, 'Green Artificial Satellite Pk-Boomer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531530817', 'code128', 'Wing-1020', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1627, 'Green Goblin', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530220511', 'code128', 'Fountain-1050', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1628, 'Green Tote Poly Bag BC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '181206805993', 'code128', 'Poly-1011', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1629, 'Ground Blasters', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244110056', 'code128', 'Special-1018', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1630, 'Ground Bloom 6pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736010462', 'code128', 'Ground-1010', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1631, 'Ground Bloom Bdl-TNT', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270123627', 'code128', 'Ground-1011', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1632, 'Ground Bloom Brick', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736001996', 'code128', 'Ground-1012', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1633, 'Ground Bloom Flower bdl', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736036001996', 'code128', 'Ground-1013', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1634, 'Ground Bloom Flower pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530210222', 'code128', 'Ground-1014', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1635, 'Ground Bloom Flowers 6pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244008254', 'code128', 'Ground-1015', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1636, 'Ground Bloom Fountain', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530210215', 'code128', 'Fountain-1051', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1637, 'Ground Bloom Pack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108306602', 'code128', 'Ground-1016', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1638, 'Ground Bloom Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '13995009200', 'code128', 'Ground-1017', 'NULL', 0, 17, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1639, 'Ground Mines Pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Special-1019', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1640, 'Gun Safe Series', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244013913', 'code128', '500g-1162', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1641, 'Half Ton', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '997215079797', 'code128', 'Multi-1098', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1642, 'Hallowed Ground', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '687985712922', 'code128', 'Fountain-1052', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1643, 'Hammer Down 80\'s', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736028870', 'code128', '500g-1163', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1644, 'Handfull BC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108557905', 'code128', 'Roman-1052', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1645, 'Handfull Roman Candle Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244005048', 'code128', 'Roman-1053', 'NULL', 0, 39, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1646, 'Handheld Lucky Wheels', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Fountain-1053', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1647, 'Happy 16', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108602803', 'code128', 'Multi-1099', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1648, 'Happy 16 Boomer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244060498', 'code128', 'Multi-1100', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1649, 'Happy 36', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530130711', 'code128', 'Multi-1101', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1650, 'Happy 36 TNT', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244060795', 'code128', 'Multi-1102', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1651, 'Happy 49 Shot', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736009176', 'code128', 'Multi-1103', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1652, 'Happy Dinosaur', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970109517', 'code128', 'Novel-1043', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1653, 'Happy Face Rocket Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108700769', 'code128', 'SkyRocket-1028', 'NULL', 0, 41, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1654, 'Happy Face Rockets', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'SkyRocket-1029', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1655, 'Happy Fireworks 36', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736026388', 'code128', 'Multi-1104', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1656, 'Happy Lamp', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530130810', 'code128', 'Novel-1044', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1657, 'Happy Wheels', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736012596', 'code128', 'Novel-1045', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1658, 'Haulin Fast', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866129738', 'code128', 'Novel-1046', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1659, 'Haunted House', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244003921', 'code128', 'Fountain-1054', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1660, 'Hawaii Dream', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244021826', 'code128', '500g-1164', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1661, 'Head Spin 2pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108547111', 'code128', 'Ground-1018', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1662, 'Heart Shaped Sparkler', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108603909', 'code128', 'Spark-1016', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1663, 'Heavy Steel', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866077060', 'code128', '500g-1165', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1664, 'Hello Neighbor', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736044283', 'code128', 'Multi-1105', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1665, 'Hen House', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253310414', 'code128', 'Novel-1047', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1666, 'Hen Laying Eggs', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531605829', 'code128', 'Novel-1048', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1667, 'Here and Now', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736013333', 'code128', '500g-1166', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1668, 'Here Fishy Fishy', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736030217', 'code128', 'Fountain-1055', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1669, 'Here we Go', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970100712', 'code128', '500g-1167', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1670, 'High Def', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736031399', 'code128', '500g-1168', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1671, 'High Falutin', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531530619', 'code128', '500g-1169', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1672, 'Hillbilly Lunatic', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '687985245710', 'code128', 'Multi-1106', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1673, 'Hip Hop', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009118004', 'code128', 'Fountain-1056', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1674, 'Hit The Road Jack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970116713', 'code128', '500g-1170', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1675, 'Hog Wild Pyro 60shot', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '687985245819', 'code128', 'Reload-1044', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1676, 'Holiday Road', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880245117', 'code128', 'Fountain-1057', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1677, 'Home Of The Brave', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970101115', 'code128', 'Reload-1045', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1678, 'Home Run', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253316492', 'code128', 'Multi-1107', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1679, 'Home Turf', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108513406', 'code128', 'Multi-1108', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1680, 'Honey Badger', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Multi-1109', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1681, 'Honor and Glory', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531340416', 'code128', '500g-1171', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1682, 'Honor and Respect', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253330412', 'code128', '500g-1172', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1683, 'Hoot Hoot Hooray!', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253310513', 'code128', 'Fountain-1058', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1684, 'Horse Power', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108321902', 'code128', '500g-1173', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1685, 'Hot Dog', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970111312', 'code128', 'Multi-1110', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1686, 'Hot Mama', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531342212', 'code128', '500g-1174', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1687, 'Hot Mama (BC)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244064328', 'code128', '500g-1175', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1688, 'Hot Rod Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '819383047045', 'code128', 'Novel-1049', 'NULL', 0, 31, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1689, 'Hot Rods-pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Novel-1050', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1690, 'Hot Shot Polybag', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970112920', 'code128', 'Poly-1012', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1691, 'Howling Commandos', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736000098', 'code128', 'SkyRocket-1030', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1692, 'Hunter', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108203000', 'code128', 'Multi-1111', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1693, 'Hyped Up', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736031207', 'code128', '500g-1176', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1694, 'Impressionist', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970120215', 'code128', '500g-1177', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1695, 'In Honor Of', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108547609', 'code128', 'Multi-1112', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1696, 'Inferno', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531338918', 'code128', 'Multi-1113', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1697, 'Inferno Punch', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108516704', 'code128', '500g-1178', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1698, 'Inked', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253311213', 'code128', '500g-1179', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1699, 'Insane Force', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531540113', 'code128', 'Tray-1020', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1700, 'Insane Force(2)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253301962', 'code128', 'Tray-1021', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1701, 'Insurgent Uprising', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253397514', 'code128', '500g-1180', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1702, 'Interceptor Rockets', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108556007', 'code128', 'SkyRocket-1031', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1703, 'Into The Blue 285 Shot', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736020225', 'code128', 'Roman-1054', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1704, 'Iron Dome System', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108403202', 'code128', '500g-1181', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1705, 'Iron Dome System', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244063512', 'code128', '500g-1182', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1706, 'It\'s A Boy Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '592211428975', 'code128', 'Multi-1114', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1707, 'It\'s A Boy Smoke', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253301320', 'code128', 'Smoke-1018', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1708, 'It\'s A Boy twist confetti WC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736039852', 'code128', 'Novel-1051', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1709, 'It\'s A Boy/Girl Set', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253363410', 'code128', 'Multi-1115', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1710, 'It\'s A Girl Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '10805253301310', 'code128', 'Multi-1116', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1711, 'It\'s A Girl twist confetti WC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253301313', 'code128', 'Novel-1052', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1712, 'Its Go Time', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253363311', 'code128', '500g-1183', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1713, 'Jamaican Thunder', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253300170', 'code128', 'Multi-1117', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1714, 'Jealous Neighbor', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009003324', 'code128', '500g-1184', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1715, 'Jellyfish Aquarium', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736032860', 'code128', '500g-1185', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1716, 'Jester\'s Revenge', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108551002', 'code128', '500g-1186', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1717, 'Jet', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108534609', 'code128', 'Multi-1118', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1718, 'Jr. Pyro Backpack BC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244064472', 'code128', 'Poly-1013', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1719, 'Jr. Pyro Backpack BC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244030729', 'code128', 'Poly-1014', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1720, 'Jumbo Morning Glory', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244000890', 'code128', 'Spark-1017', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1721, 'Jumbo Morning Glory 36inch Boomer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530195819', 'code128', 'Spark-1018', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1722, 'Jumbo Morning Glory 36inch RR', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253191013', 'code128', 'Spark-1019', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1723, 'Jumbo Morning Glory 36inch TNT', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270110511', 'code128', 'Spark-1020', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1724, 'Jumbo Neon Smoke Ball', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736009985', 'code128', 'Smoke-1019', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1725, 'Jumbo Purple Rain', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108601400', 'code128', 'Fountain-1059', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1726, 'Jumbo Smoke Ball Bomb Blue', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736027651', 'code128', 'Smoke-1020', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1727, 'Jumbo Smoke Ball Bomb Green', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244037230', 'code128', 'Smoke-1021', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1728, 'Jumbo Smoke Ball Bomb Orange', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244017232', 'code128', 'Smoke-1022', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1729, 'Jumbo Smoke Ball Bomb Pink', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244047239', 'code128', 'Smoke-1023', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1730, 'Jumping Jack 12ct', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244057238', 'code128', 'Ground-1019', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1731, 'Jumping Jack 48ct (TNT)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736011773', 'code128', 'Ground-1020', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1732, 'Jumping Jack 48ct (WC)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736011469', 'code128', 'Ground-1021', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1733, 'Jumping Jacks BDL', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253621077', 'code128', 'Ground-1022', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1734, 'Jumping Jacks Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8145270183625', 'code128', 'Ground-1023', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1735, 'Jumping Jakes', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8145270183618', 'code128', 'Ground-1024', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1736, 'June Bug', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253332416', 'code128', 'Fountain-1060', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1737, 'June Bug-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270146527', 'code128', 'Fountain-1061', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1738, 'Junior Pyro', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270146510', 'code128', 'Tray-1022', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1739, 'Junk in the Trunk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '952009001017', 'code128', 'Poly-1015', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1740, 'Jurassic Land', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530047910', 'code128', 'Novel-1053', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1741, 'Justified', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253363113', 'code128', '500g-1187', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1742, 'Keep On Rollin', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736030224', 'code128', 'Multi-1119', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1743, 'Kick Butts', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736037162', 'code128', 'Multi-1120', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1744, 'Kid\'s Funny Backpack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108600564', 'code128', 'Poly-1016', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1745, 'Kids Fun Assortment', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108002405', 'code128', 'Poly-1017', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1746, 'Kids Garage', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108003402', 'code128', 'Novel-1054', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1747, 'Kids Garage-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970117222', 'code128', 'Novel-1055', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1748, 'Kill Bill', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970117215', 'code128', '500g-1188', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1749, 'Killer Bee Single Boomer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531546511', 'code128', 'Fountain-1062', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1750, 'Killer Bees Single TNT', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530124611', 'code128', 'Fountain-1063', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1751, 'Killer Bees-4pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736009619', 'code128', 'Fountain-1064', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1752, 'Killer Bees-4pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530124628', 'code128', 'Fountain-1065', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1753, 'Killer Cake', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '13995003208', 'code128', 'Multi-1121', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1754, 'Killer Quad', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108514915', 'code128', 'Reload-1046', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1755, 'Killer Value', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866028130', 'code128', 'Tray-1023', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1756, 'Killer Value(2)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530045817', 'code128', 'Tray-1024', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1757, 'Killer Willow 5in', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253396913', 'code128', 'Reload-1047', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1758, 'King Arthur', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970117710', 'code128', 'Reload-1048', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1759, 'King Cake', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253414921', 'code128', '500g-1189', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1760, 'King Crab', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108556908', 'code128', 'Novel-1056', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1761, 'King Crab', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530162118', 'code128', 'Novel-1057', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1762, 'King of Pirates', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530162125', 'code128', '500g-1190', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1763, 'King Slayer Artillery 24', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253330610', 'code128', 'Reload-1049', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1764, 'Kitty Hawk-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866072324', 'code128', 'Novel-1058', 'NULL', 0, 31, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1765, 'Kitty Hawk(pk)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Novel-1059', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1766, 'Koi Pond', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '687985712618', 'code128', 'Fountain-1066', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1767, 'Lady Bugs', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108309009', 'code128', 'Ground-1025', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1768, 'Lady Bugs', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108600908', 'code128', 'Ground-1026', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1769, 'LadyBugs- Red Rhino', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '687985503520', 'code128', 'Ground-1027', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1770, 'Land Mines', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270130724', 'code128', 'Novel-1060', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1771, 'Land of Free', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866017387', 'code128', 'Multi-1122', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1772, 'Landmark Finale', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530130117', 'code128', 'Tray-1025', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1773, 'Large and in Charge', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970118090', 'code128', '500g-1191', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1774, 'Large Sunflower PK (Boomer)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736033621', 'code128', 'Wing-1021', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1775, 'Laser Candle 120 Shot', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530221624', 'code128', 'Roman-1055', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1776, 'Laser Candle 196 shot', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736019847', 'code128', 'Roman-1056', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1777, 'Laser Candle 240 Shot', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736042401', 'code128', 'Roman-1057', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1778, 'Laser Candle 84 Shot', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736042685', 'code128', 'Roman-1058', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-30 23:57:30'),
(1779, 'Last Dance', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', '500g-1192', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1780, 'Laying Down The Law', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736044207', 'code128', 'Tray-1026', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1781, 'Let Freedom Ring', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253397019', 'code128', '500g-1193', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1782, 'Let it Rip', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '807880268413', 'code128', 'Multi-1123', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1783, 'Let\'s Go Brandon', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '687985267910', 'code128', 'Multi-1124', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1784, 'Leviathan', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253401013', 'code128', '500g-1194', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1785, 'Liberty Tray', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253354418', 'code128', 'Tray-1027', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1786, 'Life of the Party', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736013166', 'code128', 'Tray-1028', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1787, 'Light House', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108002504', 'code128', 'Fountain-1067', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1788, 'Light Saber', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108309306', 'code128', 'Fountain-1068', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1789, 'Lightning Flash', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '201207210807', 'code128', 'Novel-1061', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1790, 'Lil Patriot-4pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '13995006100', 'code128', 'Fountain-1069', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1791, 'Lil Patroit-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736014705', 'code128', 'Fountain-1070', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1792, 'Lil Pyro Bucket', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736014163', 'code128', 'Poly-1018', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1793, 'Lil Red Devils', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009900081', 'code128', 'Fountain-1071', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1794, 'Lion King', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736022519', 'code128', 'Multi-1125', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1795, 'Little Big', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531524519', 'code128', 'Tray-1029', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1796, 'Little Bug Legend', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052532451616', 'code128', 'Ground-1028', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1797, 'Little Dynamite', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '612016238386', 'code128', 'Special-1020', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1798, 'Little Monsters Pack Only', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244001057', 'code128', 'Fountain-1072', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1799, 'Little Nemo', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108308903', 'code128', 'Multi-1126', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1800, 'Live, Laugh, Love', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270152313', 'code128', 'Fountain-1073', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1801, 'Livin', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736042708', 'code128', '500g-1195', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1802, 'Livin The Dream', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244064441', 'code128', '500g-1196', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1803, 'Loaded Gun', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '982749103070', 'code128', '500g-1197', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1804, 'Log Splitter', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880268512', 'code128', 'Multi-1127', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1805, 'Lord of War', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108519903', 'code128', 'Reload-1050', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29');
INSERT INTO `ns_nexopos_products` (`id`, `name`, `tax_type`, `tax_group_id`, `tax_value`, `product_type`, `type`, `accurate_tracking`, `auto_cogs`, `status`, `stock_management`, `barcode`, `barcode_type`, `sku`, `description`, `thumbnail_id`, `category_id`, `parent_id`, `unit_group`, `on_expiration`, `expires`, `searchable`, `author`, `uuid`, `created_at`, `updated_at`) VALUES
(1806, 'Lost Control', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880245018', 'code128', 'Multi-1128', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1807, 'Lost Loot', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736028559', 'code128', '500g-1198', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1808, 'Lotus Lantern-Pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736019748', 'code128', 'Ground-1029', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1809, 'Lotus Lantern-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108601004', 'code128', 'Ground-1030', 'NULL', 0, 17, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1810, 'Loud & Proud', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', '500g-1199', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1811, 'Loud and Nasty', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531538912', 'code128', 'Multi-1130', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1812, 'Loyal to All', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009960757', 'code128', 'Multi-1131', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1813, 'Loyal to None', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970115013', 'code128', '500g-1200', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1814, 'Loyal To None', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253131064', 'code128', '500g-1201', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1815, 'Luna Chick', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531312116', 'code128', 'Multi-1132', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1816, 'M Cracker-Any .40', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531337713', 'code128', 'Special-1021', 'NULL', 0, 25, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1817, 'M-1000 pack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Special-1022', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1818, 'M-60 36ct', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736042654', 'code128', 'Special-1023', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1819, 'M1000', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270101212', 'code128', 'Special-1024', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1820, 'M1000', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736010127', 'code128', 'Special-1025', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1821, 'M1000 Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '872421080417', 'code128', 'Special-1026', 'NULL', 0, 25, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1822, 'M150 36ct', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Special-1027', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1823, 'M150 Crackers 12pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009901590', 'code128', 'Special-1028', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1824, 'M150 Crackers BC 12pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '872421090256', 'code128', 'Special-1029', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1825, 'M150 Salutes 36', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244001170', 'code128', 'Special-1030', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1826, 'M150 Single Cracker', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244001149', 'code128', 'Special-1031', 'NULL', 0, 25, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1827, 'M5000 12pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Special-1032', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1828, 'M5000 36ct', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530020319', 'code128', 'Special-1033', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1829, 'M5000 Crackling Candle', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530020210', 'code128', 'Roman-1059', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1830, 'M5000 Crackling Candle', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530181317', 'code128', 'Roman-1060', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1831, 'M5000 Crackling Candle Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530181324', 'code128', 'Roman-1061', 'NULL', 0, 39, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1832, 'M5000 Single Cracker', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Special-1034', 'NULL', 0, 25, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1833, 'Mad Doctor', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', '500g-1202', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1834, 'Mad Dog 12 Artillery Shells', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009117007', 'code128', 'Reload-1051', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1835, 'Mad Dog Fountains', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736023479', 'code128', 'Fountain-1074', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1836, 'Mafia Boss', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736006021', 'code128', '500g-1203', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1837, 'Magic', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108558704', 'code128', '500g-1204', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1838, 'Magic Bunny Set', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253300194', 'code128', 'Novel-1062', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1839, 'Magic Comet Single (TNT)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108700714', 'code128', 'Ground-1031', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1840, 'Magic Crystal Comet', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736013524', 'code128', 'Ground-1032', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1841, 'Magic Crystal Comet (TNT)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530222010', 'code128', 'Wing-1022', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1842, 'Magic Gems/Hog Wild-Box', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '0277360135310', 'code128', 'Ground-1033', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1843, 'Magic Gems/Hog Wild-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880209324', 'code128', 'Ground-1034', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1844, 'Magic Wands', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880209317', 'code128', 'Spark-1021', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1845, 'Magic Whip', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970112814', 'code128', 'Novel-1063', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1846, 'Magical Barrage 100 4pack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736035922', 'code128', 'Multi-1133', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1847, 'Magical Barrage 100 Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736009886', 'code128', 'Multi-1134', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1848, 'Magical Barrage 100 Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736009909', 'code128', 'Multi-1135', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1849, 'Magical Barrage Red Rhino', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009996336', 'code128', 'Multi-1136', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1850, 'Major Mojo', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270152511', 'code128', 'Tray-1030', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1851, 'Make America Great Again', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052532440016', 'code128', '500g-1205', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1852, 'Mamba Forever', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108550210', 'code128', 'Multi-1137', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1853, 'Mammoth Smoke-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108520008', 'code128', 'Smoke-1024', 'NULL', 0, 45, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-12-01 22:36:24'),
(1854, 'Mammoth Smoke', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'fUYPMbAG8g', 'code128', 'Smoke-1025', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-12-01 22:38:10'),
(1855, 'Mammoth Sun Ring', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880223016', 'code128', '500g-1206', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1856, 'Man Cave', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866017325', 'code128', '500g-1207', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1857, 'Mandarin Red Cracker Snaps', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108552702', 'code128', 'Special-1035', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1858, 'Marine Life', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530166611', 'code128', '500g-1208', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1859, 'Masquerade', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253365513', 'code128', '500g-1209', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1860, 'Master Blaster 196 Shot', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880271116', 'code128', 'Roman-1062', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1861, 'Matrix Power', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108401802', 'code128', 'Multi-1138', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1862, 'Maverick Rocket', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '812037239397', 'code128', 'SkyRocket-1032', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1863, 'Medusa Rage', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253312319', 'code128', 'Multi-1139', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1864, 'Men of Steel', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736035977', 'code128', '500g-1210', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1865, 'Meow', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '807880268918', 'code128', 'Multi-1140', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1866, 'Mercurial Bee', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736033485', 'code128', 'Multi-1141', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1867, 'Mercury Tray', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108501007', 'code128', 'Tray-1031', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1868, 'Mesmerize', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736012565', 'code128', 'Fountain-1075', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1869, 'Midnight Sunburn', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531136514', 'code128', '500g-1211', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1870, 'Mighty Cobra', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531508113', 'code128', 'Multi-1142', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1871, 'Mighty Crackers', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270152610', 'code128', 'Special-1036', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1872, 'Mighty Python 19', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530054413', 'code128', 'Multi-1143', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1873, 'Mighty, Magic, Mystic', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736001040', 'code128', 'Fountain-1076', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1874, 'Migraine', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253367111', 'code128', '500g-1212', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1875, 'Military Finale', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531512516', 'code128', 'Tray-1032', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1876, 'Military Parachute 2pk w/man', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970118199', 'code128', 'Para-1017', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1877, 'Military Parachute single w/men', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108508303', 'code128', 'Para-1018', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1878, 'Military Tank', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108508310', 'code128', '500g-1213', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1879, 'Mini Artillery 6 TNT', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531517313', 'code128', 'Reload-1052', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1880, 'Mini Blaster 280 Shot', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736013197', 'code128', 'Roman-1063', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1881, 'Mini Mag Boomer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108402007', 'code128', 'Reload-1053', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1882, 'Mini Max\'d Out', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530143612', 'code128', 'Reload-1054', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1883, 'Mini Monster PK', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270173615', 'code128', 'Fountain-1077', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1884, 'Mini Monster-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736003341', 'code128', 'Fountain-1078', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1885, 'Mini Shell Kit', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736003334', 'code128', 'Reload-1055', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1886, 'Mini Waffle Cone Blueberry', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108801015', 'code128', 'Fountain-1080', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1887, 'Mini Waffle Cone Lemon', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '514677502182', 'code128', 'Fountain-1081', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1888, 'Mini Waffle Cone Orange', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '514677402185', 'code128', 'Fountain-1082', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1889, 'Mini Waffle Cone PK', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '514677202181', 'code128', 'Fountain-1083', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1890, 'Mini Waffle Cone Strawberry', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '514677102184', 'code128', 'SkyRocket-1033', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1891, 'Misc Bills1', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '514677302188', 'code128', 'Misc-1001', 'NULL', 0, 48, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1892, 'Misc Items2', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'Bs5Aea1yd7', 'code128', 'Misc-1002', 'NULL', 0, 48, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1893, 'Misc Items3', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'XKljx92WQs', 'code128', 'Misc-1003', 'NULL', 0, 48, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1894, 'Misc Items4', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'NqI80VcqH3', 'code128', 'Misc-1004', 'NULL', 0, 48, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1895, 'Misc Items5', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '9CJrzBVFkQ', 'code128', 'Misc-1005', 'NULL', 0, 48, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1896, 'Misc Items6', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'AlRborl8x4', 'code128', 'Misc-1006', 'NULL', 0, 48, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1897, 'Misc Items7', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'rjST91mn10', 'code128', 'Misc-1007', 'NULL', 0, 48, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1898, 'Misc Items8', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'zbfpcawtdJ', 'code128', 'Misc-1008', 'NULL', 0, 48, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1899, 'Misc Items9', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'EPd7W9eO4m', 'code128', 'Misc-1009', 'NULL', 0, 48, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1900, 'Misc. Roman Candles', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8kXe6vm6SM', 'code128', 'Roman-1064', 'NULL', 0, 39, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1901, 'Missile Base Bravo', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Novel-1064', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1902, 'MOAB', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970117314', 'code128', 'Reload-1056', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1903, 'Mobsters', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530145319', 'code128', '500g-1214', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1904, 'Mondays Suck', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253320116', 'code128', 'Multi-1144', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1905, 'Monster Crackling Balls', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970110711', 'code128', 'Novel-1065', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1906, 'Monster Parade', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736020539', 'code128', 'Fountain-1084', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1907, 'Monster Truck', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736036431', 'code128', 'Novel-1066', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1908, 'Monsterous Assortment', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736006380', 'code128', 'Tray-1033', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1909, 'Mood Rings', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '691051000332', 'code128', 'Reload-1057', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1910, 'Moody Blue', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736044863', 'code128', 'Multi-1145', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1911, 'Moon Traveler Bottle Rocket single 12', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108513901', 'code128', 'Bottle-1002', 'NULL', 0, 43, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1912, 'Moon Travelers(Blue PK)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Bottle-1003', 'NULL', 0, 42, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1913, 'Moonshine', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009950444', 'code128', 'Fountain-1085', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1914, 'More For Your Money', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244021536', 'code128', 'Tray-1034', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1915, 'More for Your Money-Tray', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530045718', 'code128', 'Tray-1035', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1916, 'Morning Glory 14', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253397217', 'code128', 'Spark-1022', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1917, 'Morning Glory 14', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '814327011041', 'code128', 'Spark-1023', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1918, 'Morning Glory 14-Pack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736023059', 'code128', 'Spark-1024', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1919, 'Morning Glory 14-Pack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244313273', 'code128', 'Spark-1025', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1920, 'Morning Glory 36-BC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530190616', 'code128', 'Spark-1026', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1921, 'Morning Glory-TNT', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244313242', 'code128', 'Spark-1027', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1922, 'Mother of All Bombs', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736023042', 'code128', '500g-1215', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1923, 'Motor Mouth', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108549405', 'code128', 'Multi-1146', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1924, 'Mr Reaper', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531324614', 'code128', '500g-1216', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1925, 'Mr. Poop', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253390713', 'code128', 'Novel-1067', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1926, 'Mr. Turtle Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253354210', 'code128', 'Novel-1068', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1927, 'Mr. Turtle-pack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530163726', 'code128', 'Novel-1069', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1928, 'Mystical Beast', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736001873', 'code128', 'Novel-1070', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1929, 'Nation Ovation', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970129225', 'code128', 'Multi-1147', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1930, 'Need for Speed Rocket', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108518401', 'code128', 'SkyRocket-1034', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1931, 'Need for Speed Rocket-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530014110', 'code128', 'SkyRocket-1035', 'NULL', 0, 41, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1932, 'Need for Speed Rockets pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'SkyRocket-1036', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1933, 'Neon Beast Fountain 500 gram', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253401419', 'code128', 'Fountain-1086', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1934, 'Neon Beef', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970112319', 'code128', 'Reload-1058', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1935, 'Neon Blast', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108804306', 'code128', '500g-1217', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1936, 'Neon Brawn', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108545216', 'code128', 'Reload-1059', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1937, 'Neon Camo Smoke BC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108804207', 'code128', 'Smoke-1026', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1938, 'Neon Demon', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244007257', 'code128', '500g-1218', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1939, 'Neon Demon', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '474568245443', 'code128', '500g-1219', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1940, 'Neon Jelly Bean', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009004116', 'code128', 'Fountain-1087', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1941, 'Neon Sparklers', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108309207', 'code128', 'Spark-1028', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1942, 'Neon Streak', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108900404', 'code128', '500g-1220', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1943, 'New Adult Snappers', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970115716', 'code128', 'Novel-1071', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1944, 'Night Plane-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970117611', 'code128', 'Wing-1023', 'NULL', 0, 19, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1945, 'Night Planes Pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Wing-1024', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1946, 'Night Rampage', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009908056', 'code128', 'Multi-1148', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1947, 'Night Saber Sword', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736031245', 'code128', 'Fountain-1088', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1948, 'Night Walkers', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253332515', 'code128', 'Reload-1060', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1949, 'Night Watch', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009003553', 'code128', 'Multi-1149', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1950, 'Nitro Racer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736026470', 'code128', 'Novel-1072', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1951, 'No Escape', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '811451014993', 'code128', '500g-1221', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1952, 'No Excuse', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736030231', 'code128', '500g-1222', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1953, 'No Limit', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736040926', 'code128', 'Reload-1061', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1954, 'NO. 20 Gold Sparkler (BC)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736027699', 'code128', 'Spark-1029', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1955, 'Normandy Landing Craft', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244203130', 'code128', 'Novel-1073', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1956, 'Not in My Yard', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '687985708314', 'code128', '500g-1223', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1957, 'Nuclear Fission', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531322313', 'code128', '500g-1224', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1958, 'Nuclear Reactor', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108519002', 'code128', '500g-1225', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1959, 'Nuclear Winter', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736042357', 'code128', '500g-1226', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1960, 'Nude Beach', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253336117', 'code128', 'Multi-1150', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1961, 'Nuts Please', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880254614', 'code128', 'Fountain-1089', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1962, 'Ocean Theatre', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970121212', 'code128', 'Novel-1074', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1963, 'One Bad Mother', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108602704', 'code128', '500g-1227', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1964, 'One Bad Mother in Law', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531318514', 'code128', '500g-1228', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1965, 'One for the Money', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531503712', 'code128', 'Poly-1019', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1966, 'Operation Hang Time', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530046814', 'code128', '500g-1229', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1967, 'Ordinance Disposal', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108556809', 'code128', 'Tray-1036', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1968, 'Oriental Express', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970124312', 'code128', 'Novel-1075', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1969, 'Original Gangster', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531600824', 'code128', 'Multi-1151', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1970, 'Our America', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970118618', 'code128', 'Tray-1037', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1971, 'Our Baby Reveal-Red Rhino', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970123810', 'code128', 'Multi-1152', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1972, 'Outer Space Jets 2 Stage 6pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970108312', 'code128', 'Wing-1025', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1973, 'Outer Space Jets 2 Stage-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108372614', 'code128', 'Wing-1026', 'NULL', 0, 19, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1974, 'Outlaw Bullets', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', '500g-1230', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1975, 'Outlaw Busters', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880273912', 'code128', 'Special-1037', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1976, 'Outlaw Ruckus', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880203315', 'code128', 'Multi-1153', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1977, 'Outlaw Trucker', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880254713', 'code128', '500g-1231', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1978, 'Ox Kids Backpack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880271512', 'code128', 'Poly-1020', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1979, 'Oxrageous', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866081302', 'code128', '500g-1232', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1980, 'Pain & Gain', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866105558', 'code128', '500g-1233', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1981, 'Panda Tai', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '80525331271', 'code128', '500g-1234', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1982, 'Pandamonium', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531542216', 'code128', '500g-1235', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1983, 'Paparazzi', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108548408', 'code128', 'Fountain-1090', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1984, 'Parachute Battalion 7', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531141716', 'code128', 'Para-1019', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1985, 'Parachute w7 men', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530171011', 'code128', 'Para-1020', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1986, 'Parrots Prattle', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880232513', 'code128', '500g-1236', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1987, 'Party Animal', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '687985298518', 'code128', 'Tray-1038', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1988, 'Party Bus', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244001200', 'code128', '500g-1237', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1989, 'Party Candles Pack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108555505', 'code128', 'Fountain-1091', 'NULL', 0, 15, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1990, 'Party Candles-Singles', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Fountain-1092', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1991, 'Party Like It\'s 1776', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970112517', 'code128', '500g-1238', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1992, 'Party Pack 3', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108555406', 'code128', 'Tray-1039', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 21:06:03'),
(1993, 'Party Pack 4', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '161273215246', 'code128', 'Tray-1040', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1994, 'Party Pack 5', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244001002', 'code128', 'Tray-1041', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1995, 'Party Pack 6', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244000654', 'code128', 'Tray-1042', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1996, 'Party Popper Gun', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244000456', 'code128', 'Novel-1076', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1997, 'Party Popper Gun Refills', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866009511', 'code128', 'Novel-1077', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1998, 'Party popper single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866089377', 'code128', 'Novel-1078', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(1999, 'Party Poppers 12pk Red Rhino', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530161012', 'code128', 'Novel-1079', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2000, 'Party Poppers-box', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270133923', 'code128', 'Novel-1080', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2001, 'Party Poppers-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530165423', 'code128', 'Novel-1081', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2002, 'Party Pyro Pack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530165416', 'code128', '500g-1239', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2003, 'Party Sparklers', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108955855', 'code128', 'Spark-1030', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2004, 'Party Zone Popper Fun Pak', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108901203', 'code128', 'Novel-1082', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2005, 'Patriot Pyro', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253416826', 'code128', 'Multi-1154', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2006, 'Patriot Rocket', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736037506', 'code128', 'SkyRocket-1037', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2007, 'Patriotic Sky Buster', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736001958', 'code128', 'Multi-1155', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29');
INSERT INTO `ns_nexopos_products` (`id`, `name`, `tax_type`, `tax_group_id`, `tax_value`, `product_type`, `type`, `accurate_tracking`, `auto_cogs`, `status`, `stock_management`, `barcode`, `barcode_type`, `sku`, `description`, `thumbnail_id`, `category_id`, `parent_id`, `unit_group`, `on_expiration`, `expires`, `searchable`, `author`, `uuid`, `created_at`, `updated_at`) VALUES
(2008, 'Peacock', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108557103', 'code128', '500g-1240', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2009, 'Pee-Ka-Boo', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531503811', 'code128', 'Multi-1156', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2010, 'Phenomenal Show', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253334113', 'code128', '500g-1241', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2011, 'Piccolo Petes-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736036035', 'code128', 'Fountain-1093', 'NULL', 0, 15, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2012, 'Pig Skin', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', '500g-1242', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2013, 'Pink (BC)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531539018', 'code128', '500g-1243', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2014, 'Pink Diamonds', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244063789', 'code128', 'Fountain-1094', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2015, 'Pink Hero', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736018895', 'code128', '500g-1244', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2016, 'Pink Ice', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736036400', 'code128', 'Fountain-1095', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2017, 'Pink/Blue Smoke Stick (Red Rhino)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736018963', 'code128', 'Smoke-1027', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2018, 'Pirates Code', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970109210', 'code128', '500g-1245', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2019, 'Pirates Invasion', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270167119', 'code128', 'Multi-1157', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2020, 'Pit Bull', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108517206', 'code128', 'Multi-1158', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2021, 'Pit Stop-box', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736046126', 'code128', 'Novel-1083', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2022, 'Pit Stop-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736023288', 'code128', 'Novel-1084', 'NULL', 0, 31, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2023, 'Pixie Stix 5pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Spark-1031', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2024, 'Pixie Stix Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736044412', 'code128', 'Spark-1032', 'NULL', 0, 37, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2025, 'Pizza Sampler', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', '500g-1246', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2026, 'Plane Drops Parachute', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108955640', 'code128', 'Para-1021', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2027, 'Plane Drops Parachute-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108730667', 'code128', 'Para-1022', 'NULL', 0, 35, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2028, 'Polar Attack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', '500g-1247', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2029, 'Polar Divide', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253311312', 'code128', '500g-1248', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2030, 'Polar-Iced', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880274810', 'code128', '500g-1249', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2031, 'Pool Party', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970115112', 'code128', 'Multi-1159', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2032, 'POOP!', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970114719', 'code128', 'Novel-1085', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2033, 'Poopy Puppy', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108602308', 'code128', 'Novel-1086', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2034, 'Poopy Puppy-Texas Outlaw', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530222713', 'code128', 'Novel-1087', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2035, 'Pop-It\'s TNT-40ct Box', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880212911', 'code128', 'Novel-1088', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2036, 'Popping Smoke Grenade', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736016433', 'code128', 'Smoke-1028', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2037, 'Poser', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970108114', 'code128', '500g-1250', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2038, 'Pot O\' Smoke', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253390119', 'code128', 'Smoke-1029', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2039, 'Powder House', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970109111', 'code128', 'Multi-1160', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2040, 'Power Crackers 100ct-Red Rhino', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736016648', 'code128', 'Hog-1005', 'NULL', 0, 22, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2041, 'Power Crackers 20/100 Red Rhino', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270100215', 'code128', 'RedDevil-1006', 'NULL', 0, 22, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2042, 'Power of Pride', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270100222', 'code128', 'Reload-1062', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2043, 'Power Wagon', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270172212', 'code128', 'Poly-1021', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2044, 'Powersurge 104 Break', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253331716', 'code128', 'Reload-1063', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2045, 'Premium Crackling Canister HW', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736025381', 'code128', 'Reload-1064', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2046, 'Premium Festival Canister Red Rhino', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970105212', 'code128', 'Reload-1065', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2047, 'Premium Happy Planet 36shot', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270174117', 'code128', 'Multi-1161', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2048, 'Premium Whistling Canister TO', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108770212', 'code128', 'Reload-1066', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2049, 'Premium Whistling Moon Travelers HW', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970105311', 'code128', 'Bottle-1004', 'NULL', 0, 42, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2050, 'Pride in the Water', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970108923', 'code128', '500g-1251', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2051, 'Prime Time', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253310810', 'code128', 'Reload-1067', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2052, 'Princess', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736024001', 'code128', 'Novel-1089', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2053, 'Princess Parachute', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253362819', 'code128', 'Para-1023', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2054, 'Princess Parachute-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108508907', 'code128', 'Para-1024', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2055, 'Princess Power Sword', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108508914', 'code128', 'Fountain-1096', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2056, 'Pro 4 Gold', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '201606802214', 'code128', 'Reload-1068', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2057, 'Proud', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244063529', 'code128', '500g-1252', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2058, 'Proudly We Hail', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531516712', 'code128', '500g-1253', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2059, 'Psychedelic Jellyfish', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108552603', 'code128', '500g-1254', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2060, 'Punk Rock BC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970116218', 'code128', 'Multi-1162', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2061, 'Puppy Dog Eyes', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244063918', 'code128', 'Multi-1163', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2062, 'Puppy Fountain', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253407213', 'code128', 'Fountain-1097', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2063, 'Puppy Readers', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108321407', 'code128', '500g-1255', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2064, 'Purple People Eater', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253364615', 'code128', 'Multi-1164', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2065, 'Purple People Eaters Revenge', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736010301', 'code128', '500g-1256', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2066, 'Purple Rain', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736040063', 'code128', 'Fountain-1098', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2067, 'Put It In Reverse', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736003747', 'code128', 'Multi-1165', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2068, 'Puzzle Cube', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736044252', 'code128', 'Fountain-1099', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2069, 'Pyro Blast', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108320905', 'code128', 'Tray-1043', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2070, 'Pyro Blends-4pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009001047', 'code128', 'Fountain-1100', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2071, 'Pyro Bucket Large', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108320707', 'code128', 'Poly-1022', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2072, 'Pyro City Display', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '6520099000070', 'code128', 'Tray-1044', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2073, 'Pyro Gal', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009001115', 'code128', '500g-1257', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2074, 'Pyro Mon', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970101214', 'code128', 'Fountain-1101', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2075, 'Pyro Packed Fountain Blue', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108502066', 'code128', 'Fountain-1102', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2076, 'Pyro Packed Fountain Green', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866123286', 'code128', 'Fountain-1103', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2077, 'Pyro Packed Fountain Pink', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866125983', 'code128', 'Fountain-1104', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2078, 'Pyro Panther', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866125976', 'code128', '500g-1258', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2079, 'Pyro Particles', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8352531520413', 'code128', '500g-1259', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2080, 'Pyro Party', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108803668', 'code128', 'Tray-1045', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2081, 'Pyro Playhouse', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009001054', 'code128', 'Tray-1046', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2082, 'Pyro Tsunami', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052532452514', 'code128', '500g-1260', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2083, 'Pyro Tsunami', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '220472714684', 'code128', '500g-1261', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2084, 'Pyro World', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108554201', 'code128', '500g-1262', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2085, 'Pyromaniac', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970101412', 'code128', 'Tray-1047', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2086, 'R/D Assorted 12pk Jumbo Rockets', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736006663', 'code128', 'SkyRocket-1038', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2087, 'Raging Ghoul', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736007110', 'code128', 'Multi-1166', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2088, 'Rainbow', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736036394', 'code128', '500g-1263', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2089, 'Rainbow Cupcake', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108548217', 'code128', 'Fountain-1105', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2090, 'Rainbow Vortex', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108322503', 'code128', '500g-1264', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2091, 'Rainfire Nishiki Kamuro', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736044313', 'code128', 'Reload-1069', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2092, 'Ramp It Up', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108804603', 'code128', 'Multi-1167', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2093, 'Reaper', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736036028', 'code128', 'Fountain-1106', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2094, 'Rebel Rouser', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531205517', 'code128', 'Multi-1168', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2095, 'Red Devil', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244063123', 'code128', '500g-1265', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2096, 'Red Devil Artillery Shells', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736044290', 'code128', 'Reload-1070', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2097, 'Red Devil Rocket-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736023424', 'code128', 'SkyRocket-1039', 'NULL', 0, 41, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2098, 'Red Devil Roman Candle Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'W02G4j82zX', 'code128', 'Roman-1065', 'NULL', 0, 39, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-12-01 21:56:06'),
(2099, 'Red Devil-Tray', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Tray-1048', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2100, 'Red Dirt Rampage', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736010509', 'code128', 'Novel-1090', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2101, 'Red Hot Dynamite (Water Cracker)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970129317', 'code128', 'Special-1038', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2102, 'Red Passion', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270101519', 'code128', '500g-1266', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2103, 'Red Rhino Day Parachute', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Para-1025', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2104, 'Red Snapper (Adult Snapper)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270140617', 'code128', 'Special-1039', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2105, 'Red Star', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736032310', 'code128', 'Multi-1169', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2106, 'Red White and Blue Forever', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531339113', 'code128', '500g-1267', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2107, 'Reel Catch', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531318613', 'code128', '500g-1268', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2108, 'Reflection', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970116416', 'code128', 'Fountain-1107', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2109, 'Reign Supreme', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530130018', 'code128', '500g-1269', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2110, 'Report to Duty 86\'s', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253301795', 'code128', '500g-1270', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2111, 'Rescue Squad', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108557301', 'code128', 'Multi-1170', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2112, 'Rescue Squad-pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736035755', 'code128', 'Novel-1091', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2113, 'Retaliation', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970117420', 'code128', 'Fountain-1108', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2114, 'Reveal Smoke', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253329713', 'code128', 'Smoke-1030', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2115, 'Reveal Time Boy Twist Confetti TNT', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736034598', 'code128', 'Novel-1092', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2116, 'Reveal Time Girl Twist Confetti TNT', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736040292', 'code128', 'Novel-1093', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2117, 'Rhinomite', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736040308', 'code128', 'Special-1040', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2118, 'Ring Rocket TNT', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270101618', 'code128', 'SkyRocket-1040', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2119, 'Ring Shell Rocket-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736016495', 'code128', 'SkyRocket-1041', 'NULL', 0, 41, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2120, 'Ring Shell Rockets WC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'SkyRocket-1042', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2121, 'Rip Rock and Roll', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530014219', 'code128', '500g-1271', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2122, 'Ripper Missile-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866079736', 'code128', 'SkyRocket-1043', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2123, 'Ripper Rocket-Pack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970109616', 'code128', 'Wing-1027', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2124, 'Road Construction', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970109623', 'code128', 'Multi-1171', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2125, 'Road Rage 500 gram', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270156618', 'code128', '500g-1272', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2126, 'Road Rage multi aerial', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108804764', 'code128', 'Multi-1172', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2127, 'Road Show', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244064267', 'code128', '500g-1273', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2128, 'Road to America', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970101610', 'code128', '500g-1274', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2129, 'Road Trip', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108533107', 'code128', 'Multi-1173', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2130, 'Rock Star', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531351511', 'code128', 'Multi-1174', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2131, 'Rock the Boat', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244063925', 'code128', 'Tray-1049', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2132, 'Rounders', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108003020', 'code128', '500g-1275', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2133, 'Route 66', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108801169', 'code128', 'Tray-1050', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2134, 'Rover', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970123919', 'code128', 'Novel-1094', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2135, 'Rowdy Party 350 Gram', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531600428', 'code128', 'Multi-1175', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2136, 'Ruckus', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108515905', 'code128', 'Reload-1071', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2137, 'Ruler of the Day', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '687985269013', 'code128', 'Para-1026', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2138, 'Rush Hour 100\'s', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736034093', 'code128', '500g-1276', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2139, 'Sacrifice', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108554706', 'code128', '500g-1277', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2140, 'Salute', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253302914', 'code128', 'Multi-1176', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2141, 'Salute to America', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736044184', 'code128', '500g-1278', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2142, 'Saturday Night Special', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736011636', 'code128', '500g-1279', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2143, 'Saturn Missile 25 WC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '687985297917', 'code128', 'Multi-1177', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2144, 'Saturn Missile 325 Shot Round', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530138212', 'code128', 'Multi-1178', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2145, 'Saturn Missile 750 Boomer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270180613', 'code128', 'Multi-1179', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2146, 'Saturn Missile Base 100 BC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531322214', 'code128', 'Multi-1180', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2147, 'Saturn Missile Red Rhino', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244006809', 'code128', 'Multi-1181', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2148, 'Saturn Missiles 100shot Red Rhino', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970110117', 'code128', 'Multi-1182', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2149, 'Saturn Missiles 25shot WC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970114412', 'code128', 'Multi-1183', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2150, 'Say What', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253354814', 'code128', '500g-1280', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2151, 'Scarface', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531545415', 'code128', 'Fountain-1109', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2152, 'School\'s Out Back Pack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531205210', 'code128', 'Poly-1023', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2153, 'Screaming Rattlers Rocket', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270183218', 'code128', 'SkyRocket-1044', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2154, 'Screaming Rattlers Rocket-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736002733', 'code128', 'SkyRocket-1045', 'NULL', 0, 41, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2155, 'Screw Loose', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', '500g-1281', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2156, 'Sea to Shining Sea', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108558803', 'code128', '500g-1282', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2157, 'Search & Rescue 2pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531533016', 'code128', 'Novel-1095', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2158, 'Search and Destroy', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736028856', 'code128', '500g-1283', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2159, 'Second Amendment', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970102013', 'code128', '500g-1284', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2160, 'Second Amendment', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880275718', 'code128', '500g-1285', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2161, 'Secret Agent', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '807880275718', 'code128', '500g-1286', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2162, 'Secret Weapon', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253300392', 'code128', 'Multi-1184', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2163, 'Selfie', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530182710', 'code128', 'Multi-1185', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2164, 'Send it to the Max', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253300057', 'code128', '500g-1287', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2165, 'Serious Equipment', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108803767', 'code128', 'Reload-1072', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2166, 'Sexy Rider', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '687985901104', 'code128', '500g-1288', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2167, 'Shark Fountain-pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531507314', 'code128', 'Fountain-1110', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2168, 'Shark Fountain-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736042715', 'code128', 'Fountain-1111', 'NULL', 0, 15, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2169, 'Sharp Shooter', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', '500g-1289', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2170, 'SHHH!!!', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253312616', 'code128', 'Fountain-1112', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2171, 'Shipwrecked', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244022120', 'code128', 'Multi-1186', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2172, 'Show of Force', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253368712', 'code128', '500g-1290', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2173, 'Show of Strength', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970111114', 'code128', '500g-1291', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2174, 'SideArm Showdown', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736028900', 'code128', '500g-1292', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2175, 'Silver Flash Box', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Special-1041', 'NULL', 0, 25, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2176, 'Silver Flash Single Cracker', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Special-1042', 'NULL', 0, 25, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2177, 'Silver Palms', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', '500g-1293', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2178, 'Single Day Parachute', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244064182', 'code128', 'Para-1027', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2179, 'Single Day Parachute', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530170519', 'code128', 'Para-1028', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2180, 'Single Day Parachute 6pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736011681', 'code128', 'Para-1029', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2181, 'Single Day Parachute RR', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736011643', 'code128', 'Para-1030', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2182, 'Single Day Parachutes-pack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270140624', 'code128', 'Para-1031', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2183, 'Single Night Parachute', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530170526', 'code128', 'Multi-1187', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2184, 'Single Night Parachute 6 Pack RR', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530170311', 'code128', 'Para-1032', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2185, 'Single Night Parachute RR', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270140822', 'code128', 'Para-1033', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2186, 'Single Night Parachute-pack (BC)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270140815', 'code128', 'Multi-1188', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2187, 'Single Night Parachutes-pack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244060399', 'code128', 'Para-1034', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2188, 'SINGLE Sparklers PK #8', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530170328', 'code128', 'Spark-1033', 'NULL', 0, 37, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2189, 'Sir Dumps A Lot  (2PK)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Novel-1096', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2190, 'Sir Dumps A-Lot-single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736030125', 'code128', 'Novel-1097', 'NULL', 0, 31, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2191, 'Sir Lancelot', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Reload-1073', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2192, 'Skull & Crossbones', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253414938', 'code128', 'Multi-1189', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2193, 'Skull Fountain', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736032853', 'code128', 'Fountain-1113', 'NULL', 0, 15, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2194, 'Sky Fall', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', '500g-1294', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2195, 'Sky Lantern  Any Color (#2)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253301788', 'code128', 'Novel-1098', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2196, 'Sky Lantern Any Color', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009200006', 'code128', 'Novel-1099', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2197, 'Sky Lantern Any Color', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052536543218', 'code128', 'Novel-1100', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2198, 'Sky Lantern Flag(#2)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052536543416', 'code128', 'Novel-1101', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2199, 'Sky Lantern White', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652001110037', 'code128', 'Novel-1102', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2200, 'Sky Lanterns Flag', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009100009', 'code128', 'Novel-1103', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2201, 'Sky Lanterns Heart', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052536543515', 'code128', 'Novel-1104', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2202, 'Sky Shooter 100 Shot Winda', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052536543317', 'code128', 'Multi-1190', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2203, 'Sky Shooter 15 Shot Red Rhino 500gram', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108514410', 'code128', '500g-1295', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2204, 'Sky Smackers', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970101511', 'code128', 'Multi-1191', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2205, 'Sky Smoke', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108521005', 'code128', 'Wing-1028', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2206, 'Sky Smoke-4pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970113118', 'code128', 'Wing-1029', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2207, 'Sky Team', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970113125', 'code128', 'Wing-1030', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2208, 'Slammers (Adult Snaps)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108601905', 'code128', 'Special-1043', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2209, 'Slammers 24ct Box (Adult Snaps)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866092261', 'code128', 'Special-1044', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29');
INSERT INTO `ns_nexopos_products` (`id`, `name`, `tax_type`, `tax_group_id`, `tax_value`, `product_type`, `type`, `accurate_tracking`, `auto_cogs`, `status`, `stock_management`, `barcode`, `barcode_type`, `sku`, `description`, `thumbnail_id`, `category_id`, `parent_id`, `unit_group`, `on_expiration`, `expires`, `searchable`, `author`, `uuid`, `created_at`, `updated_at`) VALUES
(2210, 'Slime Blaster', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866092278', 'code128', 'Fountain-1114', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2211, 'Small Bees', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866112631', 'code128', 'Wing-1031', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2212, 'Small Bees (Red Rhino)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009908025', 'code128', 'Wing-1032', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2213, 'Small Bees Boomer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270131011', 'code128', 'Wing-1033', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2214, 'Small Bees Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530220818', 'code128', 'Novel-1105', 'NULL', 0, 19, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-30 23:36:37'),
(2215, 'Small Bees TNT', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Wing-1034', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2216, 'Small Snow Cone', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736011810', 'code128', 'Fountain-1115', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2217, 'Small Snow Cone', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108309740', 'code128', 'Fountain-1116', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2218, 'Small Snow Cone', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108309719', 'code128', 'Fountain-1117', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2219, 'Small Snow Cone pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108309726', 'code128', 'Fountain-1118', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2220, 'Small Sunflower-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108309702', 'code128', 'Wing-1035', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2221, 'Small Sunflowers Pk Boomer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '95545122522', 'code128', 'Wing-1036', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2222, 'Smash Hit', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530221723', 'code128', 'Fountain-1119', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2223, 'Smiling Face', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '687985435418', 'code128', 'Multi-1192', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2224, 'Smiling From Ear to Ear Rockets', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531337614', 'code128', 'SkyRocket-1046', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2225, 'Smiling From Ear to Ear Rockets-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530015520', 'code128', 'SkyRocket-1047', 'NULL', 0, 41, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2226, 'Smoke Balls Bulk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Smoke-1031', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2227, 'Smoke Bomb Cracker', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '13995009415', 'code128', 'Smoke-1032', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2228, 'Smoke Dragon (Daytime Firework)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736026821', 'code128', 'Multi-1193', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2229, 'Smoke Grenade-pull string', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108514304', 'code128', 'Smoke-1033', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2230, 'Smoke Grenade-w/fuse', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736017201', 'code128', 'Smoke-1034', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2231, 'Smoke Jumper 2pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736035564', 'code128', 'Para-1035', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2232, 'Smoke Jumper Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736014309', 'code128', 'Para-1036', 'NULL', 0, 35, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2233, 'Smokin Hot', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', '500g-1296', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2234, 'Snake Charmer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531514916', 'code128', '500g-1297', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2235, 'Snake Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531544517', 'code128', 'Novel-1106', 'NULL', 0, 31, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2236, 'Snapper/Snap/Pop It RR', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Novel-1107', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2237, 'Snappers-World Class', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880213215', 'code128', 'Novel-1108', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2238, 'Sniper Fire', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531604815', 'code128', '500g-1298', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2239, 'Snow Cone Handheld-Blueberry', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736035816', 'code128', 'Fountain-1120', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2240, 'Snow Cone Handheld-Green Apple', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108321315', 'code128', 'Fountain-1121', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2241, 'Snow Cone Handheld-Purple', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108321322', 'code128', 'Fountain-1122', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2242, 'Snow Cone Handheld-Strawberry', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108321346', 'code128', 'Fountain-1123', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2243, 'Snow Cone Small', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108321339', 'code128', 'Fountain-1124', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2244, 'Snow Cone Small', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108309733', 'code128', 'Fountain-1125', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2245, 'Snow Cone Small', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108309740', 'code128', 'Fountain-1123', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2246, 'Snow Cone-Lg', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Fountain-1126', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2247, 'Soccer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108308804', 'code128', 'Fountain-1127', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2248, 'Sorcerer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108320202', 'code128', '500g-1299', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2249, 'Sorcerers Stone', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Multi-1194', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2250, 'Southern Pride', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970125418', 'code128', 'Tray-1051', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2251, 'Southern Storm', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880281313', 'code128', 'Multi-1195', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2252, 'Space Chase', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Multi-1196', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2253, 'Space Falcon', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531337317', 'code128', 'SkyRocket-1048', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2254, 'Space Flyer Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108202706', 'code128', 'Ground-1035', 'NULL', 0, 17, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2255, 'Space Flyers', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Wing-1037', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2256, 'Sparkling Flower Pots BX', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736011520', 'code128', 'Fountain-1128', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2257, 'Sparkling Flower Pots-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Fountain-1129', 'NULL', 0, 15, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2258, 'Speed Balls pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Ground-1036', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2259, 'Speed Balls pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530212318', 'code128', 'Ground-1037', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2260, 'Spider Bite', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253421233', 'code128', '500g-1300', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2261, 'Spider Nebula', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009004123', 'code128', '500g-1301', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2262, 'Spinning Sparkler', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108554102', 'code128', 'Spark-1034', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2263, 'Spiral', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866105831', 'code128', 'Novel-1109', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2264, 'Spitfire', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253421400', 'code128', 'Novel-1110', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2265, 'Spitfire-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530163122', 'code128', 'Novel-1111', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2266, 'Spleen Splitters', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530163115', 'code128', '500g-1302', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2267, 'Sprinkle Donuts', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '901003740019', 'code128', '500g-1303', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2268, 'Staff of Ra 10 Ball', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108554409', 'code128', 'Roman-1066', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2269, 'Stampede 104 Shot', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270113017', 'code128', '500g-1304', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2270, 'Standing Ovation', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866082552', 'code128', 'Multi-1197', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2271, 'Star Light', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531333913', 'code128', 'Tray-1052', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2272, 'Star Spangled Cannon', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108001217', 'code128', 'Reload-1074', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2273, 'Star Spangled Saturn 440', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Multi-1198', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2274, 'Stars & Stripes Tray', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108553006', 'code128', 'Tray-1053', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2275, 'Stars & Stripes-Multi Aerial', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530040416', 'code128', 'Multi-1199', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2276, 'Stars & Stripes-Tray', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052532451517', 'code128', 'Tray-1054', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2277, 'Steel Wave', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736014781', 'code128', 'Multi-1200', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2278, 'Step Mutha', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009003539', 'code128', '500g-1305', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2279, 'Step On The Gas', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253406513', 'code128', 'Fountain-1130', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2280, 'Stink Bombs', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '97138663191', 'code128', 'Novel-1112', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2281, 'Straight Shooter Sparkler', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'zJBusP7w0S', 'code128', 'Spark-1036', 'NULL', 0, 37, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-30 23:46:42'),
(2282, 'Stunner', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009960924', 'code128', 'Multi-1201', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2283, 'Sunflower Large Boomer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530221617', 'code128', 'Wing-1038', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2284, 'Sunshine State', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108546107', 'code128', '500g-1306', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2285, 'Sunspots', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736028146', 'code128', 'Ground-1038', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2286, 'Super Bombs', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108805402', 'code128', 'Reload-1075', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2287, 'Super Magnum', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530147818', 'code128', 'Reload-1076', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2288, 'Super Magnum', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530140819', 'code128', 'Reload-1077', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2289, 'Super Saturn Missile 300 TNT', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736013845', 'code128', 'Multi-1202', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2290, 'Super Slugger', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108321605', 'code128', 'Fountain-1131', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2291, 'Super Stallion', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '687985200214', 'code128', 'Multi-1203', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2292, 'Super TNT-Tray Assortment', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736003037', 'code128', 'Tray-1055', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2293, 'Surprise Attack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736038763', 'code128', 'SkyRocket-1049', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2294, 'Swamp Dog', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736032686', 'code128', '500g-1307', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2295, 'Swamp Gator', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108539000', 'code128', '500g-1308', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2296, 'Sweets', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531145318', 'code128', 'Fountain-1132', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2297, 'T6 Artillery Shells', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736014859', 'code128', 'Reload-1078', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2298, 'TA DAH', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108553204', 'code128', '500g-1309', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2299, 'Taco Truck', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108520701', 'code128', 'Multi-1204', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2300, 'Taco Tuesday', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253400214', 'code128', 'Fountain-1133', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2301, 'Tactical Candle', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244105212', 'code128', 'Roman-1067', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2302, 'Tad Poles', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531146919', 'code128', 'Fountain-1134', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2303, 'Tail Gator', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531323716', 'code128', 'Multi-1205', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2304, 'Take Me To Your Leader', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108603008', 'code128', 'Multi-1206', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2305, 'Take Names', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108600663', 'code128', 'Multi-1207', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2306, 'Tank Busters', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108804900', 'code128', 'Reload-1079', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2307, 'Tank Girl', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253300354', 'code128', '500g-1310', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2308, 'Tank-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530163214', 'code128', 'Novel-1113', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2309, 'Tank-Single/Red Rhino', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270135118', 'code128', 'Novel-1114', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2310, 'Tanks-box12', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530163221', 'code128', 'Novel-1115', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2311, 'Targeted', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253336216', 'code128', '500g-1311', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2312, 'Tasmanian Devil', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244018109', 'code128', 'Fountain-1135', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2313, 'Tasmanian Devil 3pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244108107', 'code128', 'Ground-1039', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2314, 'Team 6', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736028542', 'code128', 'Multi-1208', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2315, 'Temple of Gods', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108554508', 'code128', '500g-1312', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2316, 'Tequila Party', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253336612', 'code128', 'Multi-1209', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2317, 'Texas Battery 504shots', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880222514', 'code128', 'Multi-1210', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2318, 'Texas Cyclone 19 Shot', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736044276', 'code128', 'Multi-1211', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2319, 'Texas Cyclone Rocket-pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736007134', 'code128', 'SkyRocket-1050', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2320, 'Texas Cyclone Rocket-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'H75T2iiCAq', 'code128', 'SkyRocket-1051', 'NULL', 0, 41, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-12-01 22:25:58'),
(2321, 'Texas Giant Bag', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880280415', 'code128', 'Poly-1024', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2322, 'Texas Outlaw Sword', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880214014', 'code128', 'Fountain-1136', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2323, 'Texas Pop Pk (TOBC)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009955951', 'code128', 'SkyRocket-1052', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2324, 'Texas Pop Pk TNT', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736011841', 'code128', 'SkyRocket-1053', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2325, 'Texas Pop Rocket Boomer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530100912', 'code128', 'SkyRocket-1054', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2326, 'Texas Pop-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'nQDcHrXXrA', 'code128', 'SkyRocket-1055', 'NULL', 0, 41, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-12-01 22:27:15'),
(2327, 'Thats Your Problem', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '80525313283', 'code128', 'Multi-1212', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2328, 'The 8th Wonder/Fantastic Beast', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108551903', 'code128', '500g-1313', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2329, 'The Ammo Hut', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866027812', 'code128', 'Tray-1056', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2330, 'The Blues', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009004147', 'code128', '500g-1314', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2331, 'The Cowboy', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531341918', 'code128', 'Multi-1213', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2332, 'The Dancing Trolls', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108603503', 'code128', 'Ground-1040', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2333, 'The Dude', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970119110', 'code128', '500g-1315', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2334, 'The Force Blue', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866126027', 'code128', 'Fountain-1137', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2335, 'The Force Green', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866126003', 'code128', 'Fountain-1138', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2336, 'The Force Orange', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866125082', 'code128', 'Fountain-1139', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2337, 'The Force Pink', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866125990', 'code128', 'Fountain-1140', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2338, 'The Force Red', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866126010', 'code128', 'Fountain-1141', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2339, 'The Garage Series (kit)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '636233391463', 'code128', '500g-1316', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2340, 'The Godfather', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009001085', 'code128', 'Tray-1057', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2341, 'The Gun Safe Series (kit)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '997215079797', 'code128', '500g-1317', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2342, 'The Instigator', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253023680', 'code128', 'Reload-1080', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2343, 'The Jack Hammer', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108804665', 'code128', '500g-1318', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2344, 'The Judge Artillery', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108804665', 'code128', 'Reload-1081', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2345, 'The King', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052532451319', 'code128', 'Tray-1058', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2346, 'The King Tray', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530040119', 'code128', 'Tray-1059', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2347, 'The Last Dance', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736044207', 'code128', '500g-1319', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2348, 'The Martian', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108602902', 'code128', 'Novel-1116', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2349, 'The Max', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '687985908806', 'code128', 'Tray-1060', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2350, 'The Nite Theater', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736011384', 'code128', '500g-1320', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2351, 'The One', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270161216', 'code128', '500g-1321', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2352, 'The Patriot 6\" Shell', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244064380', 'code128', 'Reload-1082', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2353, 'The Protector', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970115518', 'code128', '500g-1322', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2354, 'The Reveal Boy-120', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253312012', 'code128', 'Fountain-1142', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2355, 'The Reveal Boy-120', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', '500g-1', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2356, 'The Terminator (kit)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '325886730918', 'code128', '500g-1323', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2357, 'The Terminator Kit', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244964376', 'code128', '500g-1324', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2358, 'The Wacky Whistling Machine', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244008414', 'code128', 'Ground-1041', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2359, 'The Whole 9 Yards', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '80525313182', 'code128', '500g-1325', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2360, 'The Whole 9 Yards', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531318217', 'code128', '500g-1326', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2361, 'The Yeti', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253389915', 'code128', '500g-1327', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2362, 'Thin Blue Line', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253312814', 'code128', '500g-1328', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2363, 'Think Twice', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531342311', 'code128', 'Multi-1214', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2364, 'Threshold', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736028603', 'code128', 'Multi-1215', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2365, 'Thriller Bag', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736009282', 'code128', 'Poly-1025', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2366, 'Thunder Buster', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736010486', 'code128', 'Tray-1061', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2367, 'Thunder Mania', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108401703', 'code128', 'Roman-1068', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2368, 'Thunder Monster', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736040025', 'code128', 'Multi-1216', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2369, 'ThunderDome', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253303256', 'code128', 'Multi-1217', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2370, 'Ticket to Ride', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108556601', 'code128', '500g-1329', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2371, 'Tickled Pink', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736018901', 'code128', 'Fountain-1143', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2372, 'Time Machine', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736033492', 'code128', '500g-1330', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2373, 'Titan TX Missile-Texas Outlaw Pack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970109722', 'code128', 'SkyRocket-1056', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2374, 'Titan TX Missile-Texas Outlaw-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970109715', 'code128', 'SkyRocket-1057', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2375, 'Titanium Fire', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970120710', 'code128', 'Multi-1218', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2376, 'TNT 12shot Artillery Shells', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Reload-1083', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2377, 'TNT 8 Gold Sparklers 12pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736040667', 'code128', 'Spark-1037', 'NULL', 0, 36, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2378, 'TNT Artillery Shell (with comet tail)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736023462', 'code128', 'Reload-1084', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2379, 'TNT Blasts', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736003709', 'code128', 'Novel-1117', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2380, 'TNT Blasts', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736003716', 'code128', 'Novel-1118', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2381, 'TNT Bomb (6pk)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736034048', 'code128', 'Wing-1039', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2382, 'TNT Bomb Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'RTgvq8vlMu', 'code128', 'Wing-1040', 'NULL', 0, 19, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-30 23:24:46'),
(2383, 'TNT Bottle Rockets', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736011537', 'code128', 'Bottle-1005', 'NULL', 0, 42, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2384, 'TNT Dragonfly pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736034031', 'code128', 'Wing-1041', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2385, 'TNT Festival Balls', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736042142', 'code128', 'Reload-1085', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2386, 'TNT Green Palm', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736042791', 'code128', '500g-1331', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2387, 'TNT Magical-RC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736011360', 'code128', 'Roman-1069', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2388, 'TNT Magical-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'XRZITJxYTW', 'code128', 'Roman-1070', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-30 23:58:22'),
(2389, 'TNT Moon Traveler Bottle Rocket', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'pFz6VYgUQd', 'code128', 'Bottle-1006', 'NULL', 0, 43, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-12-01 22:31:36'),
(2390, 'TNT Poker Chip', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736036592', 'code128', 'Ground-1042', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2391, 'TNT Polybag', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736000104', 'code128', 'Poly-1026', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2392, 'TNT Pop-It\'s Red', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736016426', 'code128', 'Novel-1119', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2393, 'TNT Pop-Its', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736022977', 'code128', 'Novel-1120', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2394, 'TNT Premium Roman Candle', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736044399', 'code128', 'Roman-1071', 'NULL', 0, 38, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2395, 'TNT Red Palm', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736042784', 'code128', '500g-1332', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2396, 'TNT Smoke 6pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '13995009408', 'code128', 'Smoke-1035', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2397, 'TNT Smoke Ball 6pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736026845', 'code128', 'Smoke-1036', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2398, 'To the Moon 25\'s', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', '500g-1333', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2399, 'Tongue Tied', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '80525331631', 'code128', '500g-1334', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2400, 'Tongue Tied', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253316317', 'code128', '500g-1335', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2401, 'Top Maverick / Pyro Pilot', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108518203', 'code128', 'Multi-1219', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2402, 'Topping Out', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270168413', 'code128', '500g-1336', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2403, 'Torpedo', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009103390', 'code128', 'Novel-1121', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2404, 'Torpedo Single BX', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009003454', 'code128', 'Special-1045', 'NULL', 0, 24, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2405, 'Total Diva', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736037360', 'code128', '500g-1337', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2406, 'Total Dominance', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866123989', 'code128', 'Tray-1062', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2407, 'Toxic', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253365414', 'code128', '500g-1338', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2408, 'Traffic Jam', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108804160', 'code128', '500g-1339', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2409, 'Tree Fort', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253391918', 'code128', 'Fountain-1144', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2410, 'Tri-Rotating Wheel', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'fyl6rdUlgs', 'code128', 'Ground-1043', 'NULL', 0, 17, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-30 23:13:57'),
(2411, 'Trigger Happy', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253154025', 'code128', '500g-1340', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29');
INSERT INTO `ns_nexopos_products` (`id`, `name`, `tax_type`, `tax_group_id`, `tax_value`, `product_type`, `type`, `accurate_tracking`, `auto_cogs`, `status`, `stock_management`, `barcode`, `barcode_type`, `sku`, `description`, `thumbnail_id`, `category_id`, `parent_id`, `unit_group`, `on_expiration`, `expires`, `searchable`, `author`, `uuid`, `created_at`, `updated_at`) VALUES
(2412, 'Trigger Happy', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531540212', 'code128', '500g-1341', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2413, 'Tropical Birds Pack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736042678', 'code128', 'Fountain-1145', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2414, 'Tropical Birds-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Fountain-1146', 'NULL', 0, 15, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2415, 'Tropical Chaos', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970115914', 'code128', '500g-1342', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2416, 'Truckin Home', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531504016', 'code128', '500g-1343', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2417, 'True Art', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253300330', 'code128', '500g-1344', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2418, 'True Rebel', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270162619', 'code128', '500g-1345', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2419, 'Tuff & Fluffy', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970131716', 'code128', 'Fountain-1147', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2420, 'Tweaked Out', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009004109', 'code128', '500g-1346', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2421, 'Tweaked Out', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '899280444227', 'code128', '500g-1347', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2422, 'Twin Freaks', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531203810', 'code128', 'Ground-1044', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2423, 'Twisted', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531203919', 'code128', 'Ground-1045', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2424, 'Twitter Glitter 22 LG TNT', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736022953', 'code128', 'Multi-1220', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2425, 'Two for the Show', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530046913', 'code128', 'Poly-1027', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2426, 'Two Min Pro OX', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Wing-1042', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2427, 'UFO pk (Red Rhino)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270131417', 'code128', 'Wing-1043', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-30 23:17:40'),
(2428, 'UFO-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Reload-1086', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2429, 'Ultimate Outlaw', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8107880244615', 'code128', 'Reload-1087', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2430, 'Ultimate Power', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108804108', 'code128', 'Multi-1221', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2431, 'Ultra 96', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244062782', 'code128', 'Multi-1222', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2432, 'Unbeatable', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736034345', 'code128', '500g-1348', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2433, 'Unfair Advantage', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531530312', 'code128', 'Novel-1122', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2434, 'Unicorn', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '514677002163', 'code128', 'Fountain-1148', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2435, 'United States', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253300439', 'code128', '500g-1349', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2436, 'United States of America', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253350816', 'code128', '500g-1350', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2437, 'United We Stand', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530142714', 'code128', 'Reload-1088', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2438, 'Unstoppable', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', '500g-1351', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2439, 'Urban Jedi', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970110919', 'code128', 'Multi-1223', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2440, 'USA Conqueror 182\'s', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108534500', 'code128', '500g-1352', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2441, 'USA Jumbo Gyros Pack Only', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108701360', 'code128', 'Wing-1044', 'NULL', 0, 18, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2442, 'USA Pride', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253330818', 'code128', '500g-1353', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2443, 'USA Rocks', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970124015', 'code128', 'Tray-1063', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2444, 'USA Strong Series Kit', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253375499', 'code128', 'Tray-1064', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2445, 'USA Tray-WC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052532451418', 'code128', 'Tray-1065', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2446, 'USA WC', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530040218', 'code128', 'Tray-1066', 'NULL', 0, 12, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2447, 'USA! USA!  3\"', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970122318', 'code128', '500g-1354', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2448, 'Utterly In Love', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253364912', 'code128', '500g-1355', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2449, 'V Day', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108802968', 'code128', '500g-1356', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2450, 'Vacation Destination', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270164217', 'code128', '500g-1357', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2451, 'Vampire Hunter', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244064557', 'code128', 'Multi-1224', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2452, 'Venomous Snake', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108700721', 'code128', 'Novel-1123', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2453, 'Vibe Check', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108520305', 'code128', 'Multi-1225', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2454, 'Victory Celebration', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009925497', 'code128', 'Para-1037', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2455, 'Victory Celebration', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530170212', 'code128', 'Para-1038', 'NULL', 0, 34, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2456, 'Victory Sword', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '131611802209', 'code128', 'Fountain-1149', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2457, 'VIP 180\'s', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108558902', 'code128', '500g-1358', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2458, 'Waffle Cone Large', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '514677002170', 'code128', 'Fountain-1150', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2459, 'Wailing Wheel BC (Single)', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244008179', 'code128', 'Ground-1046', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2460, 'Walk the Line', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970101818', 'code128', '500g-1359', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2461, 'Walking Dead', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244063178', 'code128', 'Multi-1226', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2462, 'War Chest', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736026517', 'code128', '500g-1360', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2463, 'War Games', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009906533', 'code128', '500g-1361', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2464, 'Warrior Princess-Sword', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270147913', 'code128', 'Fountain-1152', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2465, 'Warrior\'s Realm', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970113811', 'code128', '500g-1362', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2466, 'Warrior\'s Tale', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736042326', 'code128', '500g-1363', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2467, 'What a Girl Wants', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530044315', 'code128', 'Poly-1028', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2468, 'What Boys are Made Of', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530044216', 'code128', 'Poly-1029', 'NULL', 0, 10, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2469, 'What\'s Up', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736010318', 'code128', 'Multi-1227', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2470, 'Whiplash', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531338314', 'code128', 'Multi-1228', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2471, 'Whirlwind', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736026500', 'code128', '500g-1364', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2472, 'Whirlwind Romance', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108519316', 'code128', 'Multi-1229', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2473, 'Whistling Bottle Rocket single pk12', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'd4dBwVc9Bf', 'code128', 'Bottle-1007', 'NULL', 0, 43, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-12-01 22:34:08'),
(2474, 'Whistling Bottle Rockets-TNT', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736011339', 'code128', 'Bottle-1008', 'NULL', 0, 42, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2475, 'Whistling Chaser-TNT', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736020058', 'code128', 'Chaser-1001', 'NULL', 0, 9, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2476, 'Whistling Chasers 8ct', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009002549', 'code128', 'Chaser-1002', 'NULL', 0, 9, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2477, 'Whistling Chasers PK', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530213216', 'code128', 'Chaser-1003', 'NULL', 0, 9, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2478, 'Whistling Chasers Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '', 'code128', 'Chaser-1004', 'NULL', 0, 9, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2479, 'Whistling Jake', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530141618', 'code128', 'Reload-1089', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2480, 'Whistling Moon Travelers Winda', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108044504', 'code128', 'Bottle-1009', 'NULL', 0, 42, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:58:08'),
(2481, 'Whistling Moon Travellers', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530080627', 'code128', 'Bottle-1010', 'NULL', 0, 42, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2482, 'Whistling Pete Rocket', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736011209', 'code128', 'SkyRocket-1058', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2483, 'White Stag', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270173714', 'code128', '500g-1365', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2484, 'White Tiger', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270156717', 'code128', 'Multi-1230', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2485, 'Who Runs the World', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108802760', 'code128', '500g-1366', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2486, 'Wicked Grin-pk', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244004805', 'code128', 'SkyRocket-1059', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2487, 'Wicked Grin-Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', 'ecK8JRHB6C', 'code128', 'SkyRocket-1060', 'NULL', 0, 41, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-12-01 22:28:22'),
(2488, 'Widow Maker', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052531322412', 'code128', '500g-1367', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2489, 'Wiggle, Wiggle, Wiggle', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253329614', 'code128', 'Fountain-1153', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2490, 'Wild Boar Artillery', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970105816', 'code128', 'Reload-1090', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2491, 'Wild Wild Willows', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108520503', 'code128', 'Multi-1231', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2492, 'Willow Maker', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970121915', 'code128', '500g-1368', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2493, 'Winda US 66', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108554607', 'code128', '500g-1369', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2494, 'Winda Vision', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108557509', 'code128', '500g-1370', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2495, 'Wings of Fire', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108550401', 'code128', '500g-1371', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2496, 'Winter Ballistic', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108515301', 'code128', 'Multi-1232', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2497, 'Wired', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '715244022205', 'code128', 'Fountain-1154', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2498, 'Wolf Warrior', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108801862', 'code128', '500g-1372', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2499, 'Woodpecker Fountain', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108502363', 'code128', 'Fountain-1155', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2500, 'Worms for Sale', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270136115', 'code128', 'Novel-1124', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2501, 'X Force Rocket 12 Pack', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866086055', 'code128', 'SkyRocket-1061', 'NULL', 0, 40, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2502, 'X Force Rocket Single', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '851866086123', 'code128', 'SkyRocket-1062', 'NULL', 0, 41, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2503, 'X-Class', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736040933', 'code128', '500g-1373', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2504, 'Yellow/Orange/Green Smoke', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '191970109319', 'code128', 'Smoke-1037', 'NULL', 0, 44, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2505, 'Yin Yang 9\'s', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108547005', 'code128', '500g-1374', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2506, 'Yo Vito', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8143270158018', 'code128', 'Multi-1233', 'NULL', 0, 28, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2507, 'You Da Man', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736031740', 'code128', '500g-1375', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2508, 'Zenith', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009119001', 'code128', 'Novel-1125', 'NULL', 0, 30, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2509, 'Zero  to Hero', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '705108551507', 'code128', '500g-1376', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2510, 'Zeus', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '8052530147214', 'code128', 'Reload-1091', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2511, 'Zingers', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '814327013151', 'code128', 'Ground-1047', 'NULL', 0, 16, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2512, 'Zippity Do Dah', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253375291', 'code128', '500g-1377', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2513, 'Zombie', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '805253301764', 'code128', '500g-1378', 'NULL', 0, 46, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2514, 'Zombie Blaster', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '652009003546', 'code128', 'Reload-1092', 'NULL', 0, 26, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2515, 'Zombies Fountains', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '027736012183', 'code128', 'Fountain-1156', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29'),
(2516, 'Zorro Sword', 'inclusive', 0, 0, 'product', 'materialized', 0, 0, 'available', 'enabled', '12068022191', 'code128', 'Fountain-1157', 'NULL', 0, 14, 0, 1, 'prevent-sales', 0, 1, 17, 'NULL', '2025-11-28 20:25:29', '2025-11-28 20:25:29');

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_products_categories`
--

CREATE TABLE `ns_nexopos_products_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT 0,
  `media_id` int(11) NOT NULL DEFAULT 0,
  `preview_url` varchar(255) DEFAULT NULL,
  `displays_on_pos` tinyint(1) NOT NULL DEFAULT 1,
  `total_items` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `author` int(11) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ns_nexopos_products_categories`
--

INSERT INTO `ns_nexopos_products_categories` (`id`, `name`, `parent_id`, `media_id`, `preview_url`, `displays_on_pos`, `total_items`, `description`, `author`, `uuid`, `created_at`, `updated_at`) VALUES
(1, 'CheatSheet', 0, 0, 'https://t3.ftcdn.net/jpg/08/72/46/18/360_F_872461884_PgbzLjcNjivJcRuChgt0oOZrUVyffIqW.jpg', 1, 0, 'NULL', 2, 'NULL', '2022-05-08 01:04:39', '2025-11-30 23:04:43'),
(8, 'BOGO', 0, 0, 'http://insanemccain.firuman.com/storage/store_23/2024/12/joe351756.png', 1, 52, 'NULL', 2, 'NULL', '2022-05-08 01:02:07', '2025-07-01 22:17:16'),
(9, 'CHASERS', 0, 0, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.b-WaVqZ1iyDvu49OzoIJdgHaD7%26pid%3DApi&f=1', 1, 4, 'NULL', 2, 'NULL', '2022-05-08 01:19:44', '2025-11-28 20:55:56'),
(10, 'POLYBAG', 0, 0, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.xiv_L8T8L6JmCgNJztvA7gHaIi%26pid%3DApi&f=1', 0, 29, 'NULL', 2, 'NULL', '2022-05-08 01:07:00', '2023-05-25 23:21:03'),
(12, 'TRAY ASSORTMENTS', 0, 0, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.RpeNCbx0RtlmQvkMqHbLAwHaHS%26pid%3DApi&f=1', 0, 57, 'NULL', 2, 'NULL', '2022-05-08 01:08:20', '2024-12-29 20:22:26'),
(13, 'Fountains-Single', 0, 0, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.UjYYE_6BQb2AzM0drSPsgQHaKM%26pid%3DApi&f=1', 1, 7, 'NULL', 2, 'NULL', '2022-05-29 02:53:20', '2023-05-26 00:57:41'),
(14, 'FOUNTAINS', 0, 0, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.2BCQnKIOtGlinb4QsDjyKwHaGW%26pid%3DApi&f=1', 0, 148, 'NULL', 2, 'NULL', '2022-05-08 01:09:31', '2025-11-28 21:00:05'),
(16, 'GROUND SPINNERS', 0, 0, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.0KTy-k_35AN5oXbKNMA6kgHaGH%26pid%3DApi&f=1', 0, 42, 'NULL', 2, 'NULL', '2022-05-08 01:18:41', '2025-11-30 23:18:31'),
(17, 'Ground Spinners-Single', 0, 0, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.UJHG3s8B9MokdVXxq6gDcAHaGb%26pid%3DApi&f=1', 1, 6, 'NULL', 2, 'NULL', '2022-05-13 21:05:21', '2025-11-30 23:18:31'),
(18, 'WINGED ITEMS', 0, 0, 'http://insanemccain.firuman.com/storage/store_23/2024/12/winged814766.png', 0, 39, 'NULL', 2, 'NULL', '2022-05-08 01:20:57', '2025-11-30 23:17:40'),
(19, 'Winged-Single', 0, 0, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.rPesyyO_Ps7Awpf5uthwWQHaE9%26pid%3DApi&f=1', 1, 6, 'NULL', 2, 'NULL', '2022-05-13 03:20:56', '2025-11-30 23:36:37'),
(20, 'FIRECRACKERS BLACK CAT/MAD DOG', 0, 0, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.4ngiTniVpyWLJRjY4M7OKwHaHa%26pid%3DApi&f=1', 0, 14, 'NULL', 2, 'NULL', '2022-05-08 01:12:50', '2022-10-26 01:49:59'),
(21, 'Firecracker-Single', 0, 0, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.nn9ZMre_mwgkrvrwpHSIeQHaJq%26pid%3DApi&f=1', 1, 0, 'NULL', 2, 'NULL', '2022-05-13 03:19:20', '2025-11-30 23:29:56'),
(22, 'FIRECRACKERS RED DEVIL/RED RHINO/TEXAS OUTLAW/HOG WILD/THUNDER BOMB', 0, 0, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.jy9O6kjZsoLkcJ4yV_zlgwAAAA%26pid%3DApi&f=1', 0, 21, 'NULL', 2, 'NULL', '2022-05-08 01:14:16', '2025-11-30 23:29:56'),
(24, 'SPECIAL FIRECRACKERS', 0, 0, 'http://insanemccain.firuman.com/storage/store_23/2024/12/special.gif', 0, 36, 'NULL', 2, 'NULL', '2022-05-08 01:10:52', '2024-06-27 21:40:43'),
(26, 'RELOADABLES', 0, 0, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.SdAkZn9vHcgLrK0V4lV2ewHaE7%26pid%3DApi&f=1', 0, 92, 'NULL', 2, 'NULL', '2022-05-08 01:24:38', '2025-06-28 19:46:49'),
(28, 'MULTI AERIALS', 0, 0, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.u0enp3K1HiDqyUatKgQO0QHaJn%26pid%3DApi&f=1', 0, 208, 'NULL', 2, 'NULL', '2022-05-08 01:25:36', '2024-06-28 21:08:15'),
(30, 'NOVELTY ITEMS', 0, 0, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.-VH5dvZlLKYY1D1VzoI20AAAAA%26pid%3DApi&f=1', 0, 88, 'NULL', 2, 'NULL', '2022-05-08 01:27:08', '2023-06-30 23:07:06'),
(31, 'Novelty-Single', 0, 0, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.Qfc4XW6LR3Fw-GPe7z5GWwHaD1%26pid%3DApi&f=1', 1, 8, 'NULL', 2, 'NULL', '2022-05-15 01:07:41', '2025-11-30 23:36:37'),
(34, 'PARACHUTES', 0, 0, 'http://insanemccain.firuman.com/storage/store_23/2024/12/parachute877060.png', 0, 29, 'NULL', 2, 'NULL', '2022-05-08 01:28:28', '2023-05-30 01:38:07'),
(35, 'Parachute-single', 0, 0, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.sdcrdtmkpq_S18eLQMFa6wHaIF%26pid%3DApi&f=1', 1, 2, 'NULL', 2, 'NULL', '2022-05-15 01:22:21', '2025-11-30 23:42:38'),
(36, 'SPARKLERS', 0, 0, 'http://insanemccain.firuman.com/storage/store_23/2024/12/sparklers.png', 0, 1, 'NULL', 2, 'NULL', '2022-05-08 01:34:01', '2025-11-28 20:19:23'),
(37, 'Sparklers-Single', 0, 0, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.aGIQnfbkksa3Q80nqwFCbQHaIC%26pid%3DApi&f=1', 1, 4, 'NULL', 2, 'NULL', '2022-05-15 21:14:38', '2025-11-30 23:46:42'),
(38, 'ROMAN CANDLES', 0, 0, 'http://insanemccain.firuman.com/storage/store_23/2024/12/romancandles.png', 0, 50, 'NULL', 2, 'NULL', '2022-05-08 01:29:29', '2025-11-30 23:58:22'),
(39, 'Roman Candle-Single', 0, 0, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.nNIUwHHXRJOhNVghe6Ot4AHaHa%26pid%3DApi&f=1', 1, 20, 'NULL', 2, 'NULL', '2022-05-13 21:58:26', '2025-11-30 23:58:22'),
(40, 'SKY ROCKETS', 0, 0, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.vRWg98HsF_cP23aQDpTp2wHaIu%26pid%3DApi&f=1', 0, 40, 'NULL', 2, 'NULL', '2022-05-08 01:30:20', '2024-06-26 15:51:05'),
(41, 'Sky Rockets-Single', 0, 0, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.WK0sgRcaw5f7-YL81Vi13wHaG0%26pid%3DApi&f=1', 1, 16, 'NULL', 2, 'NULL', '2022-05-15 20:46:45', '2025-12-01 22:06:53'),
(42, 'BOTTLE ROCKETS', 0, 0, 'http://insanemccain.firuman.com/storage/store_23/2024/12/bottle364093.png', 0, 6, 'NULL', 2, 'NULL', '2022-05-08 01:31:38', '2024-06-26 16:15:31'),
(43, 'Bottle Rockets-Single', 0, 0, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.saCDLUun-vU_LNExYHTmUAAAAA%26pid%3DApi&f=1', 1, 3, 'NULL', 2, 'NULL', '2022-06-19 01:59:58', '2025-12-01 22:31:36'),
(44, 'SMOKE ITEMS', 0, 0, 'http://insanemccain.firuman.com/storage/store_23/2024/12/smoke1.png', 0, 35, 'NULL', 2, 'NULL', '2022-05-08 01:32:54', '2025-12-01 22:38:10'),
(45, 'Smoke-Single', 0, 0, 'NULL', 1, 2, 'NULL', 2, 'NULL', '2022-06-29 15:21:53', '2023-05-25 23:45:57'),
(46, '500 GRAM', 0, 0, 'http://insanemccain.firuman.com/storage/store_23/2024/12/500g.png', 1, 378, 'NULL', 2, 'NULL', '2022-05-08 01:36:24', '2025-06-28 19:37:45'),
(47, '350gram Multi Aerial', 0, 0, 'https://img.freepik.com/premium-vector/crazy-cartoon-funny-face-with-smiling-expression-vector-illustration_20412-1029.jpg', 1, 1, 'NULL', 2, 'NULL', '2023-05-25 23:53:15', '2023-05-25 23:54:48'),
(48, 'Misc', 0, 0, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.7_oIWxZWXnlWqmiQp0Rd1QHaIE%26pid%3DApi&f=1', 1, 9, 'NULL', 2, 'NULL', '2022-06-13 22:06:43', '2022-09-28 01:09:28');

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_products_galleries`
--

CREATE TABLE `ns_nexopos_products_galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `media_id` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `author` int(11) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ns_nexopos_products_galleries`
--

INSERT INTO `ns_nexopos_products_galleries` (`id`, `name`, `product_id`, `media_id`, `url`, `order`, `featured`, `author`, `uuid`, `created_at`, `updated_at`) VALUES
(1, NULL, 2476, NULL, 'http://127.0.0.1:8000/storage/2025/11/whistling-chaser.png', 0, 0, 17, NULL, '2025-11-28 20:55:56', '2025-11-28 20:55:56'),
(2, NULL, 2477, NULL, 'http://127.0.0.1:8000/storage/2025/11/whistling-chaser.png', 0, 1, 17, NULL, '2025-11-28 20:57:00', '2025-11-28 20:57:00'),
(3, NULL, 2478, NULL, 'http://127.0.0.1:8000/storage/2025/11/whistling-chaser.png', 0, 1, 17, NULL, '2025-11-28 20:57:33', '2025-11-28 20:57:33'),
(4, NULL, 2479, NULL, 'http://127.0.0.1:8000/storage/2025/11/whistling-chaser.png', 0, 1, 17, NULL, '2025-11-28 20:58:08', '2025-11-28 20:58:08'),
(5, NULL, 1181, NULL, 'http://127.0.0.1:8000/storage/2025/11/amazing.png', 0, 1, 17, NULL, '2025-11-28 21:00:05', '2025-11-28 21:00:05'),
(6, NULL, 1182, NULL, 'http://127.0.0.1:8000/storage/2025/11/amazing.png', 0, 1, 17, NULL, '2025-11-28 21:00:34', '2025-11-28 21:00:34'),
(7, NULL, 1991, NULL, 'http://127.0.0.1:8000/storage/2025/11/firumanbrowser.jpg', 0, 1, 17, NULL, '2025-11-28 21:06:03', '2025-11-28 21:06:03'),
(8, NULL, 1992, NULL, 'http://127.0.0.1:8000/storage/2025/11/firumanbrowser.jpg', 0, 1, 17, NULL, '2025-11-28 21:06:33', '2025-11-28 21:06:33'),
(9, NULL, 2475, NULL, 'http://127.0.0.1:8000/storage/2025/11/whistling-chaser.png', 0, 1, 17, NULL, '2025-11-30 23:05:47', '2025-11-30 23:05:47'),
(10, NULL, 2410, NULL, 'http://127.0.0.1:8000/storage/2025/11/triwheel92940.jpg', 0, 1, 17, NULL, '2025-11-30 23:13:57', '2025-11-30 23:13:57'),
(11, NULL, 2254, NULL, 'http://127.0.0.1:8000/storage/2025/11/spaceflyer483918.png', 0, 0, 17, NULL, '2025-11-30 23:14:35', '2025-11-30 23:14:35'),
(12, NULL, 1638, NULL, 'http://127.0.0.1:8000/storage/2025/11/groundbloom.jpeg', 0, 1, 17, NULL, '2025-11-30 23:15:12', '2025-11-30 23:15:12'),
(13, NULL, 1174, NULL, 'http://127.0.0.1:8000/storage/2025/11/alienufo.jpg', 0, 1, 17, NULL, '2025-11-30 23:15:47', '2025-11-30 23:15:47'),
(14, NULL, 1447, NULL, 'http://127.0.0.1:8000/storage/2025/11/daises.jpeg', 0, 1, 17, NULL, '2025-11-30 23:16:16', '2025-11-30 23:16:16'),
(15, NULL, 1809, NULL, 'http://127.0.0.1:8000/storage/2025/11/lotus405048.jpg', 0, 1, 17, NULL, '2025-11-30 23:19:24', '2025-11-30 23:19:24'),
(16, NULL, 2382, NULL, 'http://127.0.0.1:8000/storage/2025/11/tntbomb337805.jpeg', 0, 1, 17, NULL, '2025-11-30 23:24:46', '2025-11-30 23:24:46'),
(17, NULL, 1973, NULL, 'http://127.0.0.1:8000/storage/2025/11/outerspace243217.jpeg', 0, 1, 17, NULL, '2025-11-30 23:25:43', '2025-11-30 23:25:43'),
(18, NULL, 1944, NULL, 'http://127.0.0.1:8000/storage/2025/11/nightplane210906.jpeg', 0, 1, 17, NULL, '2025-11-30 23:26:32', '2025-11-30 23:26:32'),
(19, NULL, 1487, NULL, 'http://127.0.0.1:8000/storage/2025/11/dragonfly137271.png', 0, 1, 17, NULL, '2025-11-30 23:27:20', '2025-11-30 23:27:20'),
(20, NULL, 1372, NULL, 'http://127.0.0.1:8000/storage/2025/11/6301205-cobra-copters-1024x940.png', 0, 1, 17, NULL, '2025-11-30 23:27:56', '2025-11-30 23:27:56'),
(21, NULL, 2235, NULL, 'http://127.0.0.1:8000/storage/2025/11/snake265003.jpeg', 0, 1, 17, NULL, '2025-11-30 23:35:52', '2025-11-30 23:35:52'),
(22, NULL, 2214, NULL, 'http://127.0.0.1:8000/storage/2025/11/smallbees297170.jpeg', 0, 1, 17, NULL, '2025-11-30 23:36:37', '2025-11-30 23:36:37'),
(23, NULL, 2190, NULL, 'http://127.0.0.1:8000/storage/2025/11/sirdump6988.jpeg', 0, 1, 17, NULL, '2025-11-30 23:37:08', '2025-11-30 23:37:08'),
(24, NULL, 1764, NULL, 'http://127.0.0.1:8000/storage/2025/11/kitty.jpeg', 0, 1, 17, NULL, '2025-11-30 23:37:49', '2025-11-30 23:37:49'),
(25, NULL, 1427, NULL, 'http://127.0.0.1:8000/storage/2025/11/crazyape.jpeg', 0, 1, 17, NULL, '2025-11-30 23:38:24', '2025-11-30 23:38:24'),
(27, NULL, 1364, NULL, 'http://127.0.0.1:8000/storage/2025/11/panda.jpeg', 0, 1, 17, NULL, '2025-11-30 23:39:04', '2025-11-30 23:39:04'),
(28, NULL, 2022, NULL, 'http://127.0.0.1:8000/storage/2025/11/pitstop233127.jpeg', 0, 1, 17, NULL, '2025-11-30 23:40:11', '2025-11-30 23:40:11'),
(29, NULL, 2232, NULL, 'http://127.0.0.1:8000/storage/2025/11/smokejumper.jpeg', 0, 1, 17, NULL, '2025-11-30 23:42:38', '2025-11-30 23:42:38'),
(30, NULL, 2027, NULL, 'http://127.0.0.1:8000/storage/2025/11/planedrop.jpeg', 0, 1, 17, NULL, '2025-11-30 23:43:02', '2025-11-30 23:43:02'),
(31, NULL, 2281, NULL, 'http://127.0.0.1:8000/storage/2025/11/straight286957.jpeg', 0, 1, 17, NULL, '2025-11-30 23:46:42', '2025-11-30 23:46:42'),
(32, NULL, 1399, NULL, 'http://127.0.0.1:8000/storage/2025/11/colorspark.jpeg', 0, 1, 17, NULL, '2025-11-30 23:47:18', '2025-11-30 23:47:18'),
(33, NULL, 2188, NULL, 'http://127.0.0.1:8000/storage/2025/11/spark.jpeg', 0, 1, 17, NULL, '2025-11-30 23:48:05', '2025-11-30 23:48:05'),
(34, NULL, 2024, NULL, 'http://127.0.0.1:8000/storage/2025/11/pixie.jpeg', 0, 1, 17, NULL, '2025-11-30 23:48:34', '2025-11-30 23:48:34'),
(35, NULL, 1003, NULL, 'http://127.0.0.1:8000/storage/2025/11/crackling145778.jpeg', 0, 1, 17, NULL, '2025-12-01 00:00:09', '2025-12-01 00:00:09'),
(36, NULL, 1005, NULL, 'http://127.0.0.1:8000/storage/2025/11/colorpearl113976.jpeg', 0, 1, 17, NULL, '2025-12-01 00:00:47', '2025-12-01 00:00:47'),
(37, NULL, 1009, NULL, 'http://127.0.0.1:8000/storage/2025/11/boomer81071.jpeg', 0, 1, 17, NULL, '2025-12-01 00:01:48', '2025-12-01 00:01:48'),
(38, NULL, 1007, NULL, 'http://127.0.0.1:8000/storage/2025/11/colorpearl335750.jpeg', 0, 1, 17, NULL, '2025-12-01 00:02:41', '2025-12-01 00:02:41'),
(39, NULL, 1013, NULL, 'http://127.0.0.1:8000/storage/2025/11/maddog69432.jpeg', 0, 1, 17, NULL, '2025-12-01 00:03:27', '2025-12-01 00:03:27'),
(40, NULL, 1015, NULL, 'http://127.0.0.1:8000/storage/2025/11/minimagic37016.jpeg', 0, 1, 17, NULL, '2025-12-01 00:04:12', '2025-12-01 00:04:12'),
(41, NULL, 1018, NULL, 'http://127.0.0.1:8000/storage/2025/11/redrhino134864.jpeg', 0, 1, 17, NULL, '2025-12-01 00:04:56', '2025-12-01 00:04:56'),
(42, NULL, 1021, NULL, 'http://127.0.0.1:8000/storage/2025/11/minimagic37016.jpeg', 0, 1, 17, NULL, '2025-12-01 00:06:20', '2025-12-01 00:06:20'),
(43, NULL, 1891, NULL, 'http://127.0.0.1:8000/storage/2025/12/money.png', 0, 1, 17, NULL, '2025-12-01 21:34:31', '2025-12-01 21:34:31'),
(44, NULL, 1892, NULL, 'http://127.0.0.1:8000/storage/2025/12/money.png', 0, 0, 17, NULL, '2025-12-01 21:34:53', '2025-12-01 21:34:53'),
(45, NULL, 1893, NULL, 'http://127.0.0.1:8000/storage/2025/12/money.png', 0, 1, 17, NULL, '2025-12-01 21:35:20', '2025-12-01 21:35:20'),
(46, NULL, 1894, NULL, 'http://127.0.0.1:8000/storage/2025/12/money.png', 0, 1, 17, NULL, '2025-12-01 21:35:45', '2025-12-01 21:35:45'),
(47, NULL, 1895, NULL, 'http://127.0.0.1:8000/storage/2025/12/money.png', 0, 1, 17, NULL, '2025-12-01 21:36:15', '2025-12-01 21:36:15'),
(48, NULL, 1896, NULL, 'http://127.0.0.1:8000/storage/2025/12/money.png', 0, 1, 17, NULL, '2025-12-01 21:36:44', '2025-12-01 21:36:44'),
(49, NULL, 1897, NULL, 'http://127.0.0.1:8000/storage/2025/12/money.png', 0, 0, 17, NULL, '2025-12-01 21:37:09', '2025-12-01 21:37:09'),
(50, NULL, 1898, NULL, 'http://127.0.0.1:8000/storage/2025/12/money.png', 0, 0, 17, NULL, '2025-12-01 21:37:32', '2025-12-01 21:37:32'),
(51, NULL, 1899, NULL, 'http://127.0.0.1:8000/storage/2025/12/money.png', 0, 0, 17, NULL, '2025-12-01 21:37:52', '2025-12-01 21:37:52'),
(52, NULL, 1024, NULL, 'http://127.0.0.1:8000/storage/2025/12/mini35149.jpeg', 0, 0, 17, NULL, '2025-12-01 21:44:55', '2025-12-01 21:44:55'),
(53, NULL, 1116, NULL, 'http://127.0.0.1:8000/storage/2025/12/5maddog.jpeg', 0, 0, 17, NULL, '2025-12-01 21:46:34', '2025-12-01 21:46:34'),
(54, NULL, 1111, NULL, 'http://127.0.0.1:8000/storage/2025/12/5boomer.jpeg', 0, 0, 17, NULL, '2025-12-01 21:47:35', '2025-12-01 21:47:35'),
(55, NULL, 1142, NULL, 'http://127.0.0.1:8000/storage/2025/12/8magical.jpeg', 0, 0, 17, NULL, '2025-12-01 21:49:59', '2025-12-01 21:49:59'),
(56, NULL, 1144, NULL, 'http://127.0.0.1:8000/storage/2025/12/texas.png', 0, 1, 17, NULL, '2025-12-01 21:52:15', '2025-12-01 21:52:15'),
(57, NULL, 1296, NULL, 'http://127.0.0.1:8000/storage/2025/12/boompow.jpeg', 0, 0, 17, NULL, '2025-12-01 21:53:00', '2025-12-01 21:53:00'),
(58, NULL, 1645, NULL, 'http://127.0.0.1:8000/storage/2025/12/handful.jpeg', 0, 1, 17, NULL, '2025-12-01 21:54:05', '2025-12-01 21:54:05'),
(60, NULL, 1831, NULL, 'http://127.0.0.1:8000/storage/2025/12/m50004460.jpeg', 0, 0, 17, NULL, '2025-12-01 21:55:23', '2025-12-01 21:55:23'),
(61, NULL, 2098, NULL, 'http://127.0.0.1:8000/storage/2025/12/reddevil.jpeg', 0, 1, 17, NULL, '2025-12-01 21:56:06', '2025-12-01 21:56:06'),
(62, NULL, 1011, NULL, 'http://127.0.0.1:8000/storage/2025/12/10hotshot.jpeg', 0, 0, 17, NULL, '2025-12-01 21:57:34', '2025-12-01 21:57:34'),
(63, NULL, 1117, NULL, 'http://127.0.0.1:8000/storage/2025/12/5ballmagical.jpeg', 0, 1, 17, NULL, '2025-12-01 22:00:25', '2025-12-01 22:00:25'),
(64, NULL, 1900, NULL, 'http://127.0.0.1:8000/storage/2025/12/insane.jpeg', 0, 1, 17, NULL, '2025-12-01 22:03:57', '2025-12-01 22:03:57'),
(65, NULL, 1105, NULL, 'http://127.0.0.1:8000/storage/2025/12/4oz.png', 0, 0, 17, NULL, '2025-12-01 22:06:53', '2025-12-01 22:06:53'),
(67, NULL, 1238, NULL, 'http://127.0.0.1:8000/storage/2025/12/baller.jpeg', 0, 0, 17, NULL, '2025-12-01 22:10:05', '2025-12-01 22:10:05'),
(68, NULL, 1151, NULL, 'http://127.0.0.1:8000/storage/2025/12/tnt.jpeg', 0, 1, 17, NULL, '2025-12-01 22:12:03', '2025-12-01 22:12:03'),
(69, NULL, 1268, NULL, 'http://127.0.0.1:8000/storage/2025/12/tnt.jpeg', 0, 0, 17, NULL, '2025-12-01 22:12:56', '2025-12-01 22:12:56'),
(70, NULL, 1321, NULL, 'http://127.0.0.1:8000/storage/2025/12/butter.jpeg', 0, 1, 17, NULL, '2025-12-01 22:14:14', '2025-12-01 22:14:14'),
(71, NULL, 1368, NULL, 'http://127.0.0.1:8000/storage/2025/12/cluster.jpeg', 0, 1, 17, NULL, '2025-12-01 22:15:27', '2025-12-01 22:15:27'),
(72, NULL, 1653, NULL, 'http://127.0.0.1:8000/storage/2025/12/happy.jpeg', 0, 0, 17, NULL, '2025-12-01 22:16:43', '2025-12-01 22:16:43'),
(73, NULL, 1931, NULL, 'http://127.0.0.1:8000/storage/2025/12/need.jpeg', 0, 0, 17, NULL, '2025-12-01 22:18:01', '2025-12-01 22:18:01'),
(74, NULL, 2097, NULL, 'http://127.0.0.1:8000/storage/2025/12/reddevil782155.jpeg', 0, 0, 17, NULL, '2025-12-01 22:19:29', '2025-12-01 22:19:29'),
(75, NULL, 2119, NULL, 'http://127.0.0.1:8000/storage/2025/12/ring.jpeg', 0, 0, 17, NULL, '2025-12-01 22:21:43', '2025-12-01 22:21:43'),
(76, NULL, 2154, NULL, 'http://127.0.0.1:8000/storage/2025/12/screaming.jpeg', 0, 0, 17, NULL, '2025-12-01 22:23:04', '2025-12-01 22:23:04'),
(77, NULL, 2225, NULL, 'http://127.0.0.1:8000/storage/2025/12/ear.jpeg', 0, 0, 17, NULL, '2025-12-01 22:24:34', '2025-12-01 22:24:34'),
(78, NULL, 2320, NULL, 'http://127.0.0.1:8000/storage/2025/12/texas139890.jpeg', 0, 0, 17, NULL, '2025-12-01 22:25:58', '2025-12-01 22:25:58'),
(79, NULL, 2326, NULL, 'http://127.0.0.1:8000/storage/2025/12/texaspop.jpeg', 0, 0, 17, NULL, '2025-12-01 22:27:15', '2025-12-01 22:27:15'),
(80, NULL, 2487, NULL, 'http://127.0.0.1:8000/storage/2025/12/wicked.png', 0, 0, 17, NULL, '2025-12-01 22:28:22', '2025-12-01 22:28:22'),
(81, NULL, 2502, NULL, 'http://127.0.0.1:8000/storage/2025/12/xforce.jpeg', 0, 0, 17, NULL, '2025-12-01 22:30:28', '2025-12-01 22:30:28'),
(82, NULL, 2389, NULL, 'http://127.0.0.1:8000/storage/2025/12/tnt.jpeg', 0, 0, 17, NULL, '2025-12-01 22:31:36', '2025-12-01 22:31:36'),
(83, NULL, 1911, NULL, 'http://127.0.0.1:8000/storage/2025/12/insane.jpeg', 0, 0, 17, NULL, '2025-12-01 22:32:20', '2025-12-01 22:32:20'),
(84, NULL, 2473, NULL, 'http://127.0.0.1:8000/storage/2025/12/whistling.jpeg', 0, 0, 17, NULL, '2025-12-01 22:34:08', '2025-12-01 22:34:08'),
(85, NULL, 1128, NULL, 'http://127.0.0.1:8000/storage/2025/12/6.jpeg', 0, 0, 17, NULL, '2025-12-01 22:35:32', '2025-12-01 22:35:32'),
(86, NULL, 1853, NULL, 'http://127.0.0.1:8000/storage/2025/12/mammoth.jpeg', 0, 0, 17, NULL, '2025-12-01 22:37:43', '2025-12-01 22:37:43');

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_products_histories`
--

CREATE TABLE `ns_nexopos_products_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `procurement_id` int(11) DEFAULT NULL,
  `procurement_product_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_product_id` int(11) DEFAULT NULL,
  `operation_type` varchar(255) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `before_quantity` float DEFAULT NULL,
  `quantity` float NOT NULL,
  `after_quantity` float DEFAULT NULL,
  `unit_price` float NOT NULL,
  `total_price` float NOT NULL,
  `description` text DEFAULT NULL,
  `author` int(11) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ns_nexopos_products_histories`
--

INSERT INTO `ns_nexopos_products_histories` (`id`, `product_id`, `procurement_id`, `procurement_product_id`, `order_id`, `order_product_id`, `operation_type`, `unit_id`, `before_quantity`, `quantity`, `after_quantity`, `unit_price`, `total_price`, `description`, `author`, `uuid`, `created_at`, `updated_at`) VALUES
(1, 2519, NULL, NULL, NULL, NULL, 'added', 1, 0, 100, 100, 1, 100, '', 17, NULL, '2025-11-28 19:26:48', '2025-11-28 19:26:48');

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_products_histories_combined`
--

CREATE TABLE `ns_nexopos_products_histories_combined` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `product_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `initial_quantity` double NOT NULL DEFAULT 0,
  `sold_quantity` double NOT NULL DEFAULT 0,
  `procured_quantity` double NOT NULL DEFAULT 0,
  `defective_quantity` double NOT NULL DEFAULT 0,
  `final_quantity` double NOT NULL DEFAULT 0,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ns_nexopos_products_histories_combined`
--

INSERT INTO `ns_nexopos_products_histories_combined` (`id`, `name`, `date`, `product_id`, `unit_id`, `initial_quantity`, `sold_quantity`, `procured_quantity`, `defective_quantity`, `final_quantity`, `uuid`, `created_at`, `updated_at`) VALUES
(1, 'Test Product', '2025-11-28', 2519, 1, 0, 0, 100, 0, 100, NULL, '2025-11-28 19:26:48', '2025-11-28 19:26:48');

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_products_metas`
--

CREATE TABLE `ns_nexopos_products_metas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `author` int(11) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_products_subitems`
--

CREATE TABLE `ns_nexopos_products_subitems` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `unit_quantity_id` int(11) NOT NULL,
  `sale_price` double NOT NULL DEFAULT 0,
  `quantity` double NOT NULL DEFAULT 0,
  `total_price` double NOT NULL DEFAULT 0,
  `author` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_products_taxes`
--

CREATE TABLE `ns_nexopos_products_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `unit_quantity_id` int(11) NOT NULL,
  `tax_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `rate` float NOT NULL,
  `value` float NOT NULL,
  `author` int(11) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_products_unit_quantities`
--

CREATE TABLE `ns_nexopos_products_unit_quantities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'product',
  `preview_url` varchar(255) DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `quantity` float NOT NULL,
  `low_quantity` float NOT NULL DEFAULT 0,
  `stock_alert_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `sale_price` float NOT NULL DEFAULT 0,
  `sale_price_edit` float NOT NULL DEFAULT 0,
  `sale_price_without_tax` float NOT NULL DEFAULT 0,
  `sale_price_with_tax` float NOT NULL DEFAULT 0,
  `sale_price_tax` float NOT NULL DEFAULT 0,
  `wholesale_price` float NOT NULL DEFAULT 0,
  `wholesale_price_edit` float NOT NULL DEFAULT 0,
  `wholesale_price_with_tax` float NOT NULL DEFAULT 0,
  `wholesale_price_without_tax` float NOT NULL DEFAULT 0,
  `wholesale_price_tax` float NOT NULL DEFAULT 0,
  `custom_price` float NOT NULL DEFAULT 0,
  `custom_price_edit` float NOT NULL DEFAULT 0,
  `custom_price_with_tax` float NOT NULL DEFAULT 0,
  `custom_price_without_tax` float NOT NULL DEFAULT 0,
  `custom_price_tax` float NOT NULL DEFAULT 0,
  `visible` tinyint(1) NOT NULL DEFAULT 1,
  `convert_unit_id` int(11) DEFAULT NULL,
  `cogs` double NOT NULL DEFAULT 0,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ns_nexopos_products_unit_quantities`
--

INSERT INTO `ns_nexopos_products_unit_quantities` (`id`, `product_id`, `type`, `preview_url`, `expiration_date`, `unit_id`, `barcode`, `quantity`, `low_quantity`, `stock_alert_enabled`, `sale_price`, `sale_price_edit`, `sale_price_without_tax`, `sale_price_with_tax`, `sale_price_tax`, `wholesale_price`, `wholesale_price_edit`, `wholesale_price_with_tax`, `wholesale_price_without_tax`, `wholesale_price_tax`, `custom_price`, `custom_price_edit`, `custom_price_with_tax`, `custom_price_without_tax`, `custom_price_tax`, `visible`, `convert_unit_id`, `cogs`, `uuid`, `created_at`, `updated_at`) VALUES
(1001, 1001, 'product', '', '0000-00-00 00:00:00', 1, '851866074762', 10000, 0, 0, 1.49, 1.49, 1.49, 1.49, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1002, 1002, 'product', '', '0000-00-00 00:00:00', 1, '715244105106', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1003, 1003, 'product', '', '0000-00-00 00:00:00', 1, 'KX0tJfarsx-1003', 10000, 0, 0, 1.95, 1.95, 1.95, 1.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 00:00:09'),
(1004, 1004, 'product', '', '0000-00-00 00:00:00', 1, '8052530180822', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1005, 1005, 'product', '', '0000-00-00 00:00:00', 1, 'sOtBCWg4yc-1005', 10000, 0, 0, 1.25, 1.25, 1.25, 1.25, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 00:00:47'),
(1006, 1006, 'product', '', '0000-00-00 00:00:00', 1, '8052530180426', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1007, 1007, 'product', '', '0000-00-00 00:00:00', 1, 'gfnJbGsTF0-1007', 10000, 0, 0, 2.25, 2.25, 2.25, 2.25, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 00:02:41'),
(1008, 1008, 'product', '', '0000-00-00 00:00:00', 1, '027736017263', 10000, 0, 0, 9.5, 9.5, 9.5, 9.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1009, 1009, 'product', '', '0000-00-00 00:00:00', 1, '00pQ4BHbe6-1009', 10000, 0, 0, 2.5, 2.5, 2.5, 2.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 00:01:48'),
(1010, 1010, 'product', '', '0000-00-00 00:00:00', 1, '027736001576', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1011, 1011, 'product', '', '0000-00-00 00:00:00', 1, 'e6SQ3ca0cu-1011', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 21:57:34'),
(1012, 1012, 'product', '', '0000-00-00 00:00:00', 1, '027736006076', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1013, 1013, 'product', '', '0000-00-00 00:00:00', 1, 'MoHkJAKDkX-1013', 10000, 0, 0, 2.25, 2.25, 2.25, 2.25, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 00:03:27'),
(1014, 1014, 'product', '', '0000-00-00 00:00:00', 1, '652009002983', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1015, 1015, 'product', '', '0000-00-00 00:00:00', 1, 'EKuoWDbKbX-1015', 10000, 0, 0, 0.7, 0.7, 0.7, 0.7, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 00:04:12'),
(1016, 1016, 'product', '', '0000-00-00 00:00:00', 1, '8143270111020', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1017, 1017, 'product', '', '0000-00-00 00:00:00', 1, '814327011102', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1018, 1018, 'product', '', '0000-00-00 00:00:00', 1, 'hS0oGfpPzB-1018', 10000, 0, 0, 1.5, 1.5, 1.5, 1.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 00:04:56'),
(1019, 1019, 'product', '', '0000-00-00 00:00:00', 1, '8143270111013', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1020, 1020, 'product', '', '0000-00-00 00:00:00', 1, '027736014651', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1021, 1021, 'product', '', '0000-00-00 00:00:00', 1, 'Kq7nMpd3D7-1021', 10000, 0, 0, 2.25, 2.25, 2.25, 2.25, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 00:06:20'),
(1022, 1022, 'product', '', '0000-00-00 00:00:00', 1, 'mFMPxVn49V-1022', 10000, 0, 0, 1, 1, 1, 1, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:56:00'),
(1023, 1023, 'product', '', '0000-00-00 00:00:00', 1, '8052530181225', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1024, 1024, 'product', '', '0000-00-00 00:00:00', 1, 'Ztd7zWwigQ-1024', 10000, 0, 0, 0.7, 0.7, 0.7, 0.7, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 21:44:55'),
(1025, 1025, 'product', '', '0000-00-00 00:00:00', 1, '715244112005', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1026, 1026, 'product', '', '0000-00-00 00:00:00', 1, '8107880200321', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1027, 1027, 'product', '', '0000-00-00 00:00:00', 1, 'FHgii3jd8V-1027', 10000, 0, 0, 0, 0, 0, 0, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:29:15'),
(1028, 1028, 'product', '', '0000-00-00 00:00:00', 1, '8052530138113', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1029, 1029, 'product', '', '0000-00-00 00:00:00', 1, '027736009169', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1030, 1030, 'product', '', '0000-00-00 00:00:00', 1, '715244964017', 10000, 0, 0, 179, 179, 179, 179, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1031, 1031, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 229, 229, 229, 229, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1032, 1032, 'product', '', '0000-00-00 00:00:00', 1, '027736009015', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1033, 1033, 'product', '', '0000-00-00 00:00:00', 1, '8107880202417', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1034, 1034, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 159, 159, 159, 159, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1035, 1035, 'product', '', '0000-00-00 00:00:00', 1, '191970120314', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1036, 1036, 'product', '', '0000-00-00 00:00:00', 1, '8052530051016', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1037, 1037, 'product', '', '0000-00-00 00:00:00', 1, '77545464646', 10000, 0, 0, 1.75, 1.75, 1.75, 1.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1038, 1038, 'product', '', '0000-00-00 00:00:00', 1, '027736012473', 10000, 0, 0, 1.75, 1.75, 1.75, 1.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1039, 1039, 'product', '', '0000-00-00 00:00:00', 1, '8052530050316', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1040, 1040, 'product', '', '0000-00-00 00:00:00', 1, '027736012442', 10000, 0, 0, 4.5, 4.5, 4.5, 4.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1041, 1041, 'product', '', '0000-00-00 00:00:00', 1, '8143270110924-1041', 10000, 0, 0, 0.5, 0.5, 0.5, 0.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:56:56'),
(1042, 1042, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1043, 1043, 'product', '', '0000-00-00 00:00:00', 1, '027736022793', 10000, 0, 0, 64.95, 64.95, 64.95, 64.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1044, 1044, 'product', '', '0000-00-00 00:00:00', 1, '851866116431', 10000, 0, 0, 22.95, 22.95, 22.95, 22.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1045, 1045, 'product', '', '0000-00-00 00:00:00', 1, '8143270110412', 10000, 0, 0, 22.95, 22.95, 22.95, 22.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1046, 1046, 'product', '', '0000-00-00 00:00:00', 1, '705108098101-1046', 10000, 0, 0, 149, 149, 149, 149, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 22:20:16'),
(1047, 1047, 'product', '', '0000-00-00 00:00:00', 1, '8143270100918', 10000, 0, 0, 149, 149, 149, 149, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1048, 1048, 'product', '', '0000-00-00 00:00:00', 1, '8052530051610', 10000, 0, 0, 149, 149, 149, 149, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1049, 1049, 'product', '', '0000-00-00 00:00:00', 1, 'mad16', 10000, 0, 0, 0.5, 0.5, 0.5, 0.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1050, 1050, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 0.39, 0.39, 0.39, 0.39, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1051, 1051, 'product', '', '0000-00-00 00:00:00', 1, '8143270100017', 10000, 0, 0, 0.35, 0.35, 0.35, 0.35, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1052, 1052, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 0.35, 0.35, 0.35, 0.35, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1053, 1053, 'product', '', '0000-00-00 00:00:00', 1, '8052530050118', 10000, 0, 0, 28.95, 28.95, 28.95, 28.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1054, 1054, 'product', '', '0000-00-00 00:00:00', 1, '705108311200', 10000, 0, 0, 2.25, 2.25, 2.25, 2.25, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1055, 1055, 'product', '', '0000-00-00 00:00:00', 1, '8052530220917', 10000, 0, 0, 6.5, 6.5, 6.5, 6.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1056, 1056, 'product', '', '0000-00-00 00:00:00', 1, '652009908063', 10000, 0, 0, 79.95, 79.95, 79.95, 79.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1057, 1057, 'product', '', '0000-00-00 00:00:00', 1, '715244064335', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1058, 1058, 'product', '', '0000-00-00 00:00:00', 1, '027736011407', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1059, 1059, 'product', '', '0000-00-00 00:00:00', 1, '8052530220924', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1060, 1060, 'product', '', '0000-00-00 00:00:00', 1, '027736022847', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1061, 1061, 'product', '', '0000-00-00 00:00:00', 1, '805253375727', 10000, 0, 0, 1.75, 1.75, 1.75, 1.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1062, 1062, 'product', '', '0000-00-00 00:00:00', 1, '805253375710', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1063, 1063, 'product', '', '0000-00-00 00:00:00', 1, '027736008735', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1064, 1064, 'product', '', '0000-00-00 00:00:00', 1, '027736008933', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1065, 1065, 'product', '', '0000-00-00 00:00:00', 1, '8052530050323', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1066, 1066, 'product', '', '0000-00-00 00:00:00', 1, '851866116806', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1067, 1067, 'product', '', '0000-00-00 00:00:00', 1, '027736009022', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1068, 1068, 'product', '', '0000-00-00 00:00:00', 1, '8107880202516', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1069, 1069, 'product', '', '0000-00-00 00:00:00', 1, '8052530050712', 10000, 0, 0, 3.5, 3.5, 3.5, 3.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1070, 1070, 'product', '', '0000-00-00 00:00:00', 1, '8052530057117', 10000, 0, 0, 3.5, 3.5, 3.5, 3.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1071, 1071, 'product', '', '0000-00-00 00:00:00', 1, '8107880200314-1071', 10000, 0, 0, 3.99, 3.99, 3.99, 3.99, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:29:56'),
(1072, 1072, 'product', '', '0000-00-00 00:00:00', 1, '715244102006', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1073, 1073, 'product', '', '0000-00-00 00:00:00', 1, '8107880250012', 10000, 0, 0, 2.98, 2.98, 2.98, 2.98, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1074, 1074, 'product', '', '0000-00-00 00:00:00', 1, '027736009206', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1075, 1075, 'product', '', '0000-00-00 00:00:00', 1, '191970114214', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1076, 1076, 'product', '', '0000-00-00 00:00:00', 1, '652009003744', 10000, 0, 0, 18.95, 18.95, 18.95, 18.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1077, 1077, 'product', '', '0000-00-00 00:00:00', 1, '652009004079', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1078, 1078, 'product', '', '0000-00-00 00:00:00', 1, '705108804566', 10000, 0, 0, 85, 85, 85, 85, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1079, 1079, 'product', '', '0000-00-00 00:00:00', 1, '851866132158', 10000, 0, 0, 85, 85, 85, 85, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1080, 1080, 'product', '', '0000-00-00 00:00:00', 1, '851866105169', 10000, 0, 0, 6.5, 6.5, 6.5, 6.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1081, 1081, 'product', '', '0000-00-00 00:00:00', 1, '514677560106', 10000, 0, 0, 6.5, 6.5, 6.5, 6.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1082, 1082, 'product', '', '0000-00-00 00:00:00', 1, '514677460109', 10000, 0, 0, 6.5, 6.5, 6.5, 6.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1083, 1083, 'product', '', '0000-00-00 00:00:00', 1, '514677660103', 10000, 0, 0, 11.95, 11.95, 11.95, 11.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1084, 1084, 'product', '', '0000-00-00 00:00:00', 1, '705108602605', 10000, 0, 0, 11.95, 11.95, 11.95, 11.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1085, 1085, 'product', '', '0000-00-00 00:00:00', 1, '705108602612', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1086, 1086, 'product', '', '0000-00-00 00:00:00', 1, '8052530047019', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1087, 1087, 'product', '', '0000-00-00 00:00:00', 1, '851866082521', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1088, 1088, 'product', '', '0000-00-00 00:00:00', 1, '8052531311515', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1089, 1089, 'product', '', '0000-00-00 00:00:00', 1, '8143270180415', 10000, 0, 0, 5.5, 5.5, 5.5, 5.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1090, 1090, 'product', '', '0000-00-00 00:00:00', 1, '8052530170717', 10000, 0, 0, 5.5, 5.5, 5.5, 5.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1091, 1091, 'product', '', '0000-00-00 00:00:00', 1, '8052530170724', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1092, 1092, 'product', '', '0000-00-00 00:00:00', 1, '715244114160', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1093, 1093, 'product', '', '0000-00-00 00:00:00', 1, '027736008711', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1094, 1094, 'product', '', '0000-00-00 00:00:00', 1, '027736008902', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1095, 1095, 'product', '', '0000-00-00 00:00:00', 1, '8052530052525', 10000, 0, 0, 34.95, 34.95, 34.95, 34.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1096, 1096, 'product', '', '0000-00-00 00:00:00', 1, '715244110506', 10000, 0, 0, 34.95, 34.95, 34.95, 34.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1097, 1097, 'product', '', '0000-00-00 00:00:00', 1, '027736008728', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1098, 1098, 'product', '', '0000-00-00 00:00:00', 1, '8052530050224', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1099, 1099, 'product', '', '0000-00-00 00:00:00', 1, '8107880200123', 10000, 0, 0, 48.95, 48.95, 48.95, 48.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1100, 1100, 'product', '', '0000-00-00 00:00:00', 1, '8052531310716', 10000, 0, 0, 6.99, 6.99, 6.99, 6.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1101, 1101, 'product', '', '0000-00-00 00:00:00', 1, '715244154005', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1102, 1102, 'product', '', '0000-00-00 00:00:00', 1, '8052530053911', 10000, 0, 0, 139, 139, 139, 139, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1103, 1103, 'product', '', '0000-00-00 00:00:00', 1, '705108557400', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1104, 1104, 'product', '', '0000-00-00 00:00:00', 1, '652009003621', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1105, 1105, 'product', '', '0000-00-00 00:00:00', 1, '715244004102-1105', 10000, 0, 0, 1.1, 1.1, 1.1, 1.1, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 22:06:53'),
(1106, 1106, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1107, 1107, 'product', '', '0000-00-00 00:00:00', 1, '8052530010310', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1108, 1108, 'product', '', '0000-00-00 00:00:00', 1, '705108002306', 10000, 0, 0, 4.5, 4.5, 4.5, 4.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1109, 1109, 'product', '', '0000-00-00 00:00:00', 1, '705108402205', 10000, 0, 0, 4.95, 4.95, 4.95, 4.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1110, 1110, 'product', '', '0000-00-00 00:00:00', 1, '8052530180624', 10000, 0, 0, 4.95, 4.95, 4.95, 4.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1111, 1111, 'product', '', '0000-00-00 00:00:00', 1, '8052530180617-1111', 10000, 0, 0, 0.95, 0.95, 0.95, 0.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 21:47:35'),
(1112, 1112, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 4.95, 4.95, 4.95, 4.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1113, 1113, 'product', '', '0000-00-00 00:00:00', 1, '8052530180327', 10000, 0, 0, 4.95, 4.95, 4.95, 4.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1114, 1114, 'product', '', '0000-00-00 00:00:00', 1, '8143270111129', 10000, 0, 0, 1.25, 1.25, 1.25, 1.25, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1115, 1115, 'product', '', '0000-00-00 00:00:00', 1, '8143270111112', 10000, 0, 0, 4.99, 4.99, 4.99, 4.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1116, 1116, 'product', '', '0000-00-00 00:00:00', 1, '027736006069-1116', 10000, 0, 0, 1.95, 1.95, 1.95, 1.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 21:46:34'),
(1117, 1117, 'product', '', '0000-00-00 00:00:00', 1, '8gRA0CFu0f-1117', 10000, 0, 0, 1.25, 1.25, 1.25, 1.25, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 22:00:25'),
(1118, 1118, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 139, 139, 139, 139, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1119, 1119, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1120, 1120, 'product', '', '0000-00-00 00:00:00', 1, '715244154012', 10000, 0, 0, 0.75, 0.75, 0.75, 0.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1121, 1121, 'product', '', '0000-00-00 00:00:00', 1, '8107880200116', 10000, 0, 0, 0.75, 0.75, 0.75, 0.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1122, 1122, 'product', '', '0000-00-00 00:00:00', 1, '8052530050217', 10000, 0, 0, 0.95, 0.95, 0.95, 0.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1123, 1123, 'product', '', '0000-00-00 00:00:00', 1, '715244101504', 10000, 0, 0, 119, 119, 119, 119, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1124, 1124, 'product', '', '0000-00-00 00:00:00', 1, '191970114511', 10000, 0, 0, 129, 129, 129, 129, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1125, 1125, 'product', '', '0000-00-00 00:00:00', 1, '705108805006', 10000, 0, 0, 139, 139, 139, 139, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1126, 1126, 'product', '', '0000-00-00 00:00:00', 1, '805253354715', 10000, 0, 0, 69.95, 69.95, 69.95, 69.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1127, 1127, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 179, 179, 179, 179, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1128, 1128, 'product', '', '0000-00-00 00:00:00', 1, '027736042050-1128', 10000, 0, 0, 3.75, 3.75, 3.75, 3.75, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 22:35:32'),
(1129, 1129, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1130, 1130, 'product', '', '0000-00-00 00:00:00', 1, '705108260164', 10000, 0, 0, 199, 199, 199, 199, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1131, 1131, 'product', '', '0000-00-00 00:00:00', 1, '027736042067', 10000, 0, 0, 36.95, 36.95, 36.95, 36.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1132, 1132, 'product', '', '0000-00-00 00:00:00', 1, '705108805204', 10000, 0, 0, 7.99, 7.99, 7.99, 7.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1133, 1133, 'product', '', '0000-00-00 00:00:00', 1, '027736035946', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1134, 1134, 'product', '', '0000-00-00 00:00:00', 1, '8107880232520', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1135, 1135, 'product', '', '0000-00-00 00:00:00', 1, '8052530170120', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1136, 1136, 'product', '', '0000-00-00 00:00:00', 1, '027736011650', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1137, 1137, 'product', '', '0000-00-00 00:00:00', 1, '715244641314', 10000, 0, 0, 4.5, 4.5, 4.5, 4.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1138, 1138, 'product', '', '0000-00-00 00:00:00', 1, '715244064137', 10000, 0, 0, 4.5, 4.5, 4.5, 4.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1139, 1139, 'product', '', '0000-00-00 00:00:00', 1, '027736011698', 10000, 0, 0, 4.5, 4.5, 4.5, 4.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1140, 1140, 'product', '', '0000-00-00 00:00:00', 1, '8052530170113', 10000, 0, 0, 79, 79, 79, 79, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1141, 1141, 'product', '', '0000-00-00 00:00:00', 1, '805253395411', 10000, 0, 0, 21.95, 21.95, 21.95, 21.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1142, 1142, 'product', '', '0000-00-00 00:00:00', 1, '027736038787-1142', 10000, 0, 0, 5.5, 5.5, 5.5, 5.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 21:49:59'),
(1143, 1143, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1144, 1144, 'product', '', '0000-00-00 00:00:00', 1, '027736008476-1144', 10000, 0, 0, 5.95, 5.95, 5.95, 5.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 21:52:15'),
(1145, 1145, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1146, 1146, 'product', '', '0000-00-00 00:00:00', 1, '715244118168', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1147, 1147, 'product', '', '0000-00-00 00:00:00', 1, '027736006717', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1148, 1148, 'product', '', '0000-00-00 00:00:00', 1, '8052530050125', 10000, 0, 0, 149, 149, 149, 149, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1149, 1149, 'product', '', '0000-00-00 00:00:00', 1, '8143270180811', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1150, 1150, 'product', '', '0000-00-00 00:00:00', 1, '715244004126', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1151, 1151, 'product', '', '0000-00-00 00:00:00', 1, '13995003055-1151', 10000, 0, 0, 1.3, 1.3, 1.3, 1.3, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 22:10:53'),
(1152, 1152, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1153, 1153, 'product', '', '0000-00-00 00:00:00', 1, '8052530010518', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1154, 1154, 'product', '', '0000-00-00 00:00:00', 1, '652009003461', 10000, 0, 0, 134, 134, 134, 134, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1155, 1155, 'product', '', '0000-00-00 00:00:00', 1, '8052531544715', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1156, 1156, 'product', '', '0000-00-00 00:00:00', 1, '805253300101', 10000, 0, 0, 64.95, 64.95, 64.95, 64.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1157, 1157, 'product', '', '0000-00-00 00:00:00', 1, '715244064588', 10000, 0, 0, 329, 329, 329, 329, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1158, 1158, 'product', '', '0000-00-00 00:00:00', 1, '851866113126', 10000, 0, 0, 289, 289, 289, 289, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1159, 1159, 'product', '', '0000-00-00 00:00:00', 1, '027736014491', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1160, 1160, 'product', '', '0000-00-00 00:00:00', 1, '705108802715', 10000, 0, 0, 59, 59, 59, 59, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1161, 1161, 'product', '', '0000-00-00 00:00:00', 1, '810000100217', 10000, 0, 0, 129, 129, 129, 129, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1162, 1162, 'product', '', '0000-00-00 00:00:00', 1, '705108538805', 10000, 0, 0, 44.95, 44.95, 44.95, 44.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1163, 1163, 'product', '', '0000-00-00 00:00:00', 1, '8107880229711', 10000, 0, 0, 2.75, 2.75, 2.75, 2.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1164, 1164, 'product', '', '0000-00-00 00:00:00', 1, '805253369214', 10000, 0, 0, 5.95, 5.95, 5.95, 5.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1165, 1165, 'product', '', '0000-00-00 00:00:00', 1, '8052531336211', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1166, 1166, 'product', '', '0000-00-00 00:00:00', 1, '705108803262', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1167, 1167, 'product', '', '0000-00-00 00:00:00', 1, '027736013548', 10000, 0, 0, 4.95, 4.95, 4.95, 4.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1168, 1168, 'product', '', '0000-00-00 00:00:00', 1, '027736013555', 10000, 0, 0, 99, 99, 99, 99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1169, 1169, 'product', '', '0000-00-00 00:00:00', 1, '705108000111', 10000, 0, 0, 44.95, 44.95, 44.95, 44.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1170, 1170, 'product', '', '0000-00-00 00:00:00', 1, '191970104215', 10000, 0, 0, 67.95, 67.95, 67.95, 67.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1171, 1171, 'product', '', '0000-00-00 00:00:00', 1, '805253365216', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1172, 1172, 'product', '', '0000-00-00 00:00:00', 1, '8107880273110', 10000, 0, 0, 8, 8, 8, 8, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1173, 1173, 'product', '', '0000-00-00 00:00:00', 1, '8143270140112-1173', 10000, 0, 0, 4.95, 4.95, 4.95, 4.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:18:31'),
(1174, 1174, 'product', '', '0000-00-00 00:00:00', 1, 'WaHBiFB0ZC-1174', 10000, 0, 0, 0.99, 0.99, 0.99, 0.99, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:15:47'),
(1175, 1175, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 64.95, 64.95, 64.95, 64.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1176, 1176, 'product', '', '0000-00-00 00:00:00', 1, '705108556106', 10000, 0, 0, 84.95, 84.95, 84.95, 84.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1177, 1177, 'product', '', '0000-00-00 00:00:00', 1, '705108548309', 10000, 0, 0, 152, 152, 152, 152, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1178, 1178, 'product', '', '0000-00-00 00:00:00', 1, '805253365810', 10000, 0, 0, 129, 129, 129, 129, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1179, 1179, 'product', '', '0000-00-00 00:00:00', 1, '705108531707', 10000, 0, 0, 3.75, 3.75, 3.75, 3.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1180, 1180, 'product', '', '0000-00-00 00:00:00', 1, '027736002337', 10000, 0, 0, 0.95, 0.95, 0.95, 0.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1181, 1181, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 44.95, 44.95, 44.95, 44.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1182, 1182, 'product', '', '0000-00-00 00:00:00', 1, '851866112563', 10000, 0, 0, 125, 125, 125, 125, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1183, 1183, 'product', '', '0000-00-00 00:00:00', 1, '805253365711', 10000, 0, 0, 62, 62, 62, 62, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1184, 1184, 'product', '', '0000-00-00 00:00:00', 1, '805253334519', 10000, 0, 0, 18.95, 18.95, 18.95, 18.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1185, 1185, 'product', '', '0000-00-00 00:00:00', 1, '191970109913', 10000, 0, 0, 149, 149, 149, 149, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1186, 1186, 'product', '', '0000-00-00 00:00:00', 1, '027736037469', 10000, 0, 0, 489, 489, 489, 489, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1187, 1187, 'product', '', '0000-00-00 00:00:00', 1, '8052532443314', 10000, 0, 0, 69, 69, 69, 69, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1188, 1188, 'product', '', '0000-00-00 00:00:00', 1, '805253301870', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1189, 1189, 'product', '', '0000-00-00 00:00:00', 1, '805253310711', 10000, 0, 0, 44.95, 44.95, 44.95, 44.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1190, 1190, 'product', '', '0000-00-00 00:00:00', 1, '191970123513', 10000, 0, 0, 44.95, 44.95, 44.95, 44.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1191, 1191, 'product', '', '0000-00-00 00:00:00', 1, '8143270181917', 10000, 0, 0, 67.46, 67.46, 67.46, 67.46, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1192, 1192, 'product', '', '0000-00-00 00:00:00', 1, '8052531545316', 10000, 0, 0, 69, 69, 69, 69, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1193, 1193, 'product', '', '0000-00-00 00:00:00', 1, '805253301931', 10000, 0, 0, 107, 107, 107, 107, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1194, 1194, 'product', '', '0000-00-00 00:00:00', 1, '8052531322511', 10000, 0, 0, 79.95, 79.95, 79.95, 79.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1195, 1195, 'product', '', '0000-00-00 00:00:00', 1, '851866098836', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1196, 1196, 'product', '', '0000-00-00 00:00:00', 1, '705108320714', 10000, 0, 0, 99, 99, 99, 99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1197, 1197, 'product', '', '0000-00-00 00:00:00', 1, '027736013517', 10000, 0, 0, 299, 299, 299, 299, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1198, 1198, 'product', '', '0000-00-00 00:00:00', 1, '715244063703', 10000, 0, 0, 85.95, 85.95, 85.95, 85.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1199, 1199, 'product', '', '0000-00-00 00:00:00', 1, '8052531545613', 10000, 0, 0, 189, 189, 189, 189, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1200, 1200, 'product', '', '0000-00-00 00:00:00', 1, '8052531502517', 10000, 0, 0, 219, 219, 219, 219, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1201, 1201, 'product', '', '0000-00-00 00:00:00', 1, '652009961044', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1202, 1202, 'product', '', '0000-00-00 00:00:00', 1, '027736006502', 10000, 0, 0, 129, 129, 129, 129, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1203, 1203, 'product', '', '0000-00-00 00:00:00', 1, '705108954810', 10000, 0, 0, 67.95, 67.95, 67.95, 67.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1204, 1204, 'product', '', '0000-00-00 00:00:00', 1, '805253334618', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1205, 1205, 'product', '', '0000-00-00 00:00:00', 1, '705108543403', 10000, 0, 0, 18.95, 18.95, 18.95, 18.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1206, 1206, 'product', '', '0000-00-00 00:00:00', 1, '805253349810', 10000, 0, 0, 2.5, 2.5, 2.5, 2.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1207, 1207, 'product', '', '0000-00-00 00:00:00', 1, '851866090007', 10000, 0, 0, 2.99, 2.99, 2.99, 2.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1208, 1208, 'product', '', '0000-00-00 00:00:00', 1, '715244006793', 10000, 0, 0, 13.48, 13.48, 13.48, 13.48, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1209, 1209, 'product', '', '0000-00-00 00:00:00', 1, '805253335219', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1210, 1210, 'product', '', '0000-00-00 00:00:00', 1, '814327017401', 10000, 0, 0, 119, 119, 119, 119, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1211, 1211, 'product', '', '0000-00-00 00:00:00', 1, '191970105717', 10000, 0, 0, 68.95, 68.95, 68.95, 68.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1212, 1212, 'product', '', '0000-00-00 00:00:00', 1, '027736034208', 10000, 0, 0, 41.95, 41.95, 41.95, 41.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1213, 1213, 'product', '', '0000-00-00 00:00:00', 1, '805253310223', 10000, 0, 0, 41.95, 41.95, 41.95, 41.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1214, 1214, 'product', '', '0000-00-00 00:00:00', 1, '805253310230', 10000, 0, 0, 41.95, 41.95, 41.95, 41.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1215, 1215, 'product', '', '0000-00-00 00:00:00', 1, '805253310247', 10000, 0, 0, 41.95, 41.95, 41.95, 41.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1216, 1216, 'product', '', '0000-00-00 00:00:00', 1, '805253310254', 10000, 0, 0, 41.95, 41.95, 41.95, 41.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1217, 1217, 'product', '', '0000-00-00 00:00:00', 1, '805253310261', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1218, 1218, 'product', '', '0000-00-00 00:00:00', 1, '027736025978', 10000, 0, 0, 42.95, 42.95, 42.95, 42.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1219, 1219, 'product', '', '0000-00-00 00:00:00', 1, '191970104314', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1220, 1220, 'product', '', '0000-00-00 00:00:00', 1, '8143270130519', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1221, 1221, 'product', '', '0000-00-00 00:00:00', 1, '027736016525', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1222, 1222, 'product', '', '0000-00-00 00:00:00', 1, '705108551101', 10000, 0, 0, 69, 69, 69, 69, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1223, 1223, 'product', '', '0000-00-00 00:00:00', 1, '8143270169014', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1224, 1224, 'product', '', '0000-00-00 00:00:00', 1, '705108515059', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1225, 1225, 'product', '', '0000-00-00 00:00:00', 1, '8052531336716', 10000, 0, 0, 69.95, 69.95, 69.95, 69.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1226, 1226, 'product', '', '0000-00-00 00:00:00', 1, '027736042555', 10000, 0, 0, 139, 139, 139, 139, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1227, 1227, 'product', '', '0000-00-00 00:00:00', 1, '8143270160417', 10000, 0, 0, 89, 89, 89, 89, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1228, 1228, 'product', '', '0000-00-00 00:00:00', 1, '8052531401414', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00');
INSERT INTO `ns_nexopos_products_unit_quantities` (`id`, `product_id`, `type`, `preview_url`, `expiration_date`, `unit_id`, `barcode`, `quantity`, `low_quantity`, `stock_alert_enabled`, `sale_price`, `sale_price_edit`, `sale_price_without_tax`, `sale_price_with_tax`, `sale_price_tax`, `wholesale_price`, `wholesale_price_edit`, `wholesale_price_with_tax`, `wholesale_price_without_tax`, `wholesale_price_tax`, `custom_price`, `custom_price_edit`, `custom_price_with_tax`, `custom_price_without_tax`, `custom_price_tax`, `visible`, `convert_unit_id`, `cogs`, `uuid`, `created_at`, `updated_at`) VALUES
(1229, 1229, 'product', '', '0000-00-00 00:00:00', 1, '705108557806', 10000, 0, 0, 5.64, 5.64, 5.64, 5.64, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1230, 1230, 'product', '', '0000-00-00 00:00:00', 1, '8143270130625', 10000, 0, 0, 0.94, 0.94, 0.94, 0.94, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1231, 1231, 'product', '', '0000-00-00 00:00:00', 1, '55222144555', 10000, 0, 0, 69, 69, 69, 69, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1232, 1232, 'product', '', '0000-00-00 00:00:00', 1, '805253365315', 10000, 0, 0, 369, 369, 369, 369, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1233, 1233, 'product', '', '0000-00-00 00:00:00', 1, '8052531401810', 10000, 0, 0, 89, 89, 89, 89, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1234, 1234, 'product', '', '0000-00-00 00:00:00', 1, '191970128310', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1235, 1235, 'product', '', '0000-00-00 00:00:00', 1, '687985984817', 10000, 0, 0, 179, 179, 179, 179, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1236, 1236, 'product', '', '0000-00-00 00:00:00', 1, '805253366015', 10000, 0, 0, 18.95, 18.95, 18.95, 18.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1237, 1237, 'product', '', '0000-00-00 00:00:00', 1, '8052531312611', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1238, 1238, 'product', '', '0000-00-00 00:00:00', 1, '027736018772-1238', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 22:09:11'),
(1239, 1239, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 28.95, 28.95, 28.95, 28.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1240, 1240, 'product', '', '0000-00-00 00:00:00', 1, '705108308507', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1241, 1241, 'product', '', '0000-00-00 00:00:00', 1, '8052530185414', 10000, 0, 0, 0.99, 0.99, 0.99, 0.99, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1242, 1242, 'product', '', '0000-00-00 00:00:00', 1, '705108900220', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1243, 1243, 'product', '', '0000-00-00 00:00:00', 1, '705108320721', 10000, 0, 0, 39.95, 39.95, 39.95, 39.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1244, 1244, 'product', '', '0000-00-00 00:00:00', 1, '027736016655', 10000, 0, 0, 79.95, 79.95, 79.95, 79.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1245, 1245, 'product', '', '0000-00-00 00:00:00', 1, '8143270160813', 10000, 0, 0, 28.95, 28.95, 28.95, 28.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1246, 1246, 'product', '', '0000-00-00 00:00:00', 1, '027736031252', 10000, 0, 0, 79, 79, 79, 79, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1247, 1247, 'product', '', '0000-00-00 00:00:00', 1, '19197011581', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1248, 1248, 'product', '', '0000-00-00 00:00:00', 1, '191970128822', 10000, 0, 0, 3.5, 3.5, 3.5, 3.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1249, 1249, 'product', '', '0000-00-00 00:00:00', 1, '191970128815', 10000, 0, 0, 22.95, 22.95, 22.95, 22.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1250, 1250, 'product', '', '0000-00-00 00:00:00', 1, '715244052127', 10000, 0, 0, 22.95, 22.95, 22.95, 22.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1251, 1251, 'product', '', '0000-00-00 00:00:00', 1, '715244052110', 10000, 0, 0, 269, 269, 269, 269, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1252, 1252, 'product', '', '0000-00-00 00:00:00', 1, '715244000029', 10000, 0, 0, 269, 269, 269, 269, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1253, 1253, 'product', '', '0000-00-00 00:00:00', 1, '715244000012', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1254, 1254, 'product', '', '0000-00-00 00:00:00', 1, '715244004492', 10000, 0, 0, 12.48, 12.48, 12.48, 12.48, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1255, 1255, 'product', '', '0000-00-00 00:00:00', 1, '8107880250517', 10000, 0, 0, 14, 14, 14, 14, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1256, 1256, 'product', '', '0000-00-00 00:00:00', 1, '705108601462', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1257, 1257, 'product', '', '0000-00-00 00:00:00', 1, '191970118816', 10000, 0, 0, 53.95, 53.95, 53.95, 53.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1258, 1258, 'product', '', '0000-00-00 00:00:00', 1, '805253312517', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1259, 1259, 'product', '', '0000-00-00 00:00:00', 1, '8052531135814', 10000, 0, 0, 67.95, 67.95, 67.95, 67.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1260, 1260, 'product', '', '0000-00-00 00:00:00', 1, '805253300385', 10000, 0, 0, 54.95, 54.95, 54.95, 54.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1261, 1261, 'product', '', '0000-00-00 00:00:00', 1, '027736031771', 10000, 0, 0, 22.95, 22.95, 22.95, 22.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1262, 1262, 'product', '', '0000-00-00 00:00:00', 1, '705108512607', 10000, 0, 0, 79.95, 79.95, 79.95, 79.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1263, 1263, 'product', '', '0000-00-00 00:00:00', 1, '8143270166211', 10000, 0, 0, 899, 899, 899, 899, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1264, 1264, 'product', '', '0000-00-00 00:00:00', 1, '027736012930', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1265, 1265, 'product', '', '0000-00-00 00:00:00', 1, '027736001651', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1266, 1266, 'product', '', '0000-00-00 00:00:00', 1, '027736015290', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1267, 1267, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 17.95, 17.95, 17.95, 17.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1268, 1268, 'product', '', '0000-00-00 00:00:00', 1, '027736008292-1268', 10000, 0, 0, 3.5, 3.5, 3.5, 3.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 22:12:56'),
(1269, 1269, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 69.95, 69.95, 69.95, 69.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1270, 1270, 'product', '', '0000-00-00 00:00:00', 1, '027736004485', 10000, 0, 0, 159, 159, 159, 159, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1271, 1271, 'product', '', '0000-00-00 00:00:00', 1, '652009001092', 10000, 0, 0, 69, 69, 69, 69, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1272, 1272, 'product', '', '0000-00-00 00:00:00', 1, '8143270195716', 10000, 0, 0, 119, 119, 119, 119, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1273, 1273, 'product', '', '0000-00-00 00:00:00', 1, '687985907403', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1274, 1274, 'product', '', '0000-00-00 00:00:00', 1, '8052531343219', 10000, 0, 0, 0.5, 0.5, 0.5, 0.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1275, 1275, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1276, 1276, 'product', '', '0000-00-00 00:00:00', 1, '715244061228', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1277, 1277, 'product', '', '0000-00-00 00:00:00', 1, '715244064090', 10000, 0, 0, 188, 188, 188, 188, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1278, 1278, 'product', '', '0000-00-00 00:00:00', 1, '8052531515913', 10000, 0, 0, 116, 116, 116, 116, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1279, 1279, 'product', '', '0000-00-00 00:00:00', 1, '8052531527015', 10000, 0, 0, 129, 129, 129, 129, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1280, 1280, 'product', '', '0000-00-00 00:00:00', 1, '705108804702', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1281, 1281, 'product', '', '0000-00-00 00:00:00', 1, '715244000050', 10000, 0, 0, 4.95, 4.95, 4.95, 4.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1282, 1282, 'product', '', '0000-00-00 00:00:00', 1, '027736026890', 10000, 0, 0, 129, 129, 129, 129, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1283, 1283, 'product', '', '0000-00-00 00:00:00', 1, '027736033607', 10000, 0, 0, 53.95, 53.95, 53.95, 53.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1284, 1284, 'product', '', '0000-00-00 00:00:00', 1, '805253393417', 10000, 0, 0, 28.95, 28.95, 28.95, 28.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1285, 1285, 'product', '', '0000-00-00 00:00:00', 1, '805253350212', 10000, 0, 0, 54, 54, 54, 54, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1286, 1286, 'product', '', '0000-00-00 00:00:00', 1, '715244063796', 10000, 0, 0, 74.95, 74.95, 74.95, 74.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1287, 1287, 'product', '', '0000-00-00 00:00:00', 1, '027736021642', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1288, 1288, 'product', '', '0000-00-00 00:00:00', 1, '027736032600', 10000, 0, 0, 5.99, 5.99, 5.99, 5.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1289, 1289, 'product', '', '0000-00-00 00:00:00', 1, '8052531337911', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1290, 1290, 'product', '', '0000-00-00 00:00:00', 1, '8052531337218', 10000, 0, 0, 72.95, 72.95, 72.95, 72.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1291, 1291, 'product', '', '0000-00-00 00:00:00', 1, '027736030040', 10000, 0, 0, 46, 46, 46, 46, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1292, 1292, 'product', '', '0000-00-00 00:00:00', 1, '027736038800', 10000, 0, 0, 36.95, 36.95, 36.95, 36.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1293, 1293, 'product', '', '0000-00-00 00:00:00', 1, '8052531340317', 10000, 0, 0, 0.9, 0.9, 0.9, 0.9, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1294, 1294, 'product', '', '0000-00-00 00:00:00', 1, '851866009337', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1295, 1295, 'product', '', '0000-00-00 00:00:00', 1, '85186610027765', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1296, 1296, 'product', '', '0000-00-00 00:00:00', 1, '8052530186251-1296', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 21:53:00'),
(1297, 1297, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1298, 1298, 'product', '', '0000-00-00 00:00:00', 1, '705108320738', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1299, 1299, 'product', '', '0000-00-00 00:00:00', 1, '8052530080320', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1300, 1300, 'product', '', '0000-00-00 00:00:00', 1, '8052530143513', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1301, 1301, 'product', '', '0000-00-00 00:00:00', 1, '027736036141', 10000, 0, 0, 22.95, 22.95, 22.95, 22.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1302, 1302, 'product', '', '0000-00-00 00:00:00', 1, '191970114917', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1303, 1303, 'product', '', '0000-00-00 00:00:00', 1, '8143270161315', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1304, 1304, 'product', '', '0000-00-00 00:00:00', 1, '191970119011', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1305, 1305, 'product', '', '0000-00-00 00:00:00', 1, '805253350410', 10000, 0, 0, 44.95, 44.95, 44.95, 44.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1306, 1306, 'product', '', '0000-00-00 00:00:00', 1, '705108555000', 10000, 0, 0, 54.95, 54.95, 54.95, 54.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1307, 1307, 'product', '', '0000-00-00 00:00:00', 1, '705108550609', 10000, 0, 0, 54.95, 54.95, 54.95, 54.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1308, 1308, 'product', '', '0000-00-00 00:00:00', 1, '705108550708', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1309, 1309, 'product', '', '0000-00-00 00:00:00', 1, '705108320806', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1310, 1310, 'product', '', '0000-00-00 00:00:00', 1, '705108555208', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1311, 1311, 'product', '', '0000-00-00 00:00:00', 1, '027736033614', 10000, 0, 0, 69.95, 69.95, 69.95, 69.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1312, 1312, 'product', '', '0000-00-00 00:00:00', 1, '50090055', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1313, 1313, 'product', '', '0000-00-00 00:00:00', 1, '8107880226512', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1314, 1314, 'product', '', '0000-00-00 00:00:00', 1, '705108803866', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1315, 1315, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 42.95, 42.95, 42.95, 42.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1316, 1316, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1317, 1317, 'product', '', '0000-00-00 00:00:00', 1, '851866112372', 10000, 0, 0, 2.49, 2.49, 2.49, 2.49, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1318, 1318, 'product', '', '0000-00-00 00:00:00', 1, '715244063895', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1319, 1319, 'product', '', '0000-00-00 00:00:00', 1, '705108555802', 10000, 0, 0, 74.95, 74.95, 74.95, 74.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1320, 1320, 'product', '', '0000-00-00 00:00:00', 1, '8143270147111', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1321, 1321, 'product', '', '0000-00-00 00:00:00', 1, '027736000289-1321', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 22:14:14'),
(1322, 1322, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 0.75, 0.75, 0.75, 0.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1323, 1323, 'product', '', '0000-00-00 00:00:00', 1, '715244104529', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1324, 1324, 'product', '', '0000-00-00 00:00:00', 1, '6520090006682', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1325, 1325, 'product', '', '0000-00-00 00:00:00', 1, '6520090066826', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1326, 1326, 'product', '', '0000-00-00 00:00:00', 1, '027736014866', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1327, 1327, 'product', '', '0000-00-00 00:00:00', 1, '8052530100424', 10000, 0, 0, 15.95, 15.95, 15.95, 15.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1328, 1328, 'product', '', '0000-00-00 00:00:00', 1, '191970124114', 10000, 0, 0, 15.95, 15.95, 15.95, 15.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1329, 1329, 'product', '', '0000-00-00 00:00:00', 1, '8107880281115', 10000, 0, 0, 35.95, 35.95, 35.95, 35.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1330, 1330, 'product', '', '0000-00-00 00:00:00', 1, '805253312418', 10000, 0, 0, 1.99, 1.99, 1.99, 1.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1331, 1331, 'product', '', '0000-00-00 00:00:00', 1, '92143700022', 10000, 0, 0, 1.99, 1.99, 1.99, 1.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1332, 1332, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 1.99, 1.99, 1.99, 1.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1333, 1333, 'product', '', '0000-00-00 00:00:00', 1, '652009001757', 10000, 0, 0, 2.5, 2.5, 2.5, 2.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1334, 1334, 'product', '', '0000-00-00 00:00:00', 1, '027736028177', 10000, 0, 0, 3.99, 3.99, 3.99, 3.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1335, 1335, 'product', '', '0000-00-00 00:00:00', 1, '715244025220', 10000, 0, 0, 3.99, 3.99, 3.99, 3.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1336, 1336, 'product', '', '0000-00-00 00:00:00', 1, '715244035229', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1337, 1337, 'product', '', '0000-00-00 00:00:00', 1, '715244005222', 10000, 0, 0, 3.99, 3.99, 3.99, 3.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1338, 1338, 'product', '', '0000-00-00 00:00:00', 1, '715244045228', 10000, 0, 0, 3.99, 3.99, 3.99, 3.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1339, 1339, 'product', '', '0000-00-00 00:00:00', 1, '715244015221', 10000, 0, 0, 63.95, 63.95, 63.95, 63.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1340, 1340, 'product', '', '0000-00-00 00:00:00', 1, '8052531530510', 10000, 0, 0, 54.95, 54.95, 54.95, 54.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1341, 1341, 'product', '', '0000-00-00 00:00:00', 1, '705108556700', 10000, 0, 0, 2.99, 2.99, 2.99, 2.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1342, 1342, 'product', '', '0000-00-00 00:00:00', 1, '027736026265', 10000, 0, 0, 36.95, 36.95, 36.95, 36.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1343, 1343, 'product', '', '0000-00-00 00:00:00', 1, '027736023448', 10000, 0, 0, 32.95, 32.95, 32.95, 32.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1344, 1344, 'product', '', '0000-00-00 00:00:00', 1, '715244022328', 10000, 0, 0, 899, 899, 899, 899, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1345, 1345, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1346, 1346, 'product', '', '0000-00-00 00:00:00', 1, '705108518104', 10000, 0, 0, 129, 129, 129, 129, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1347, 1347, 'product', '', '0000-00-00 00:00:00', 1, '705108555703', 10000, 0, 0, 1.99, 1.99, 1.99, 1.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1348, 1348, 'product', '', '0000-00-00 00:00:00', 1, '8052530161029', 10000, 0, 0, 41, 41, 41, 41, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1349, 1349, 'product', '', '0000-00-00 00:00:00', 1, '8052531514213', 10000, 0, 0, 119, 119, 119, 119, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1350, 1350, 'product', '', '0000-00-00 00:00:00', 1, '705108555307', 10000, 0, 0, 8.5, 8.5, 8.5, 8.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1351, 1351, 'product', '', '0000-00-00 00:00:00', 1, '805253300033', 10000, 0, 0, 4.5, 4.5, 4.5, 4.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1352, 1352, 'product', '', '0000-00-00 00:00:00', 1, '027736029884', 10000, 0, 0, 64.95, 64.95, 64.95, 64.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1353, 1353, 'product', '', '0000-00-00 00:00:00', 1, '8107880273219', 10000, 0, 0, 69, 69, 69, 69, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1354, 1354, 'product', '', '0000-00-00 00:00:00', 1, '8143270168611', 10000, 0, 0, 4.95, 4.95, 4.95, 4.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1355, 1355, 'product', '', '0000-00-00 00:00:00', 1, '8052530203620', 10000, 0, 0, 1.99, 1.99, 1.99, 1.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1356, 1356, 'product', '', '0000-00-00 00:00:00', 1, '8052531605911', 10000, 0, 0, 5.95, 5.95, 5.95, 5.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1357, 1357, 'product', '', '0000-00-00 00:00:00', 1, '027736014620', 10000, 0, 0, 71.95, 71.95, 71.95, 71.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1358, 1358, 'product', '', '0000-00-00 00:00:00', 1, '8052531511410', 10000, 0, 0, 18.95, 18.95, 18.95, 18.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1359, 1359, 'product', '', '0000-00-00 00:00:00', 1, '027736030194', 10000, 0, 0, 119.95, 119.95, 119.95, 119.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1360, 1360, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 1.95, 1.95, 1.95, 1.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1361, 1361, 'product', '', '0000-00-00 00:00:00', 1, '8052530222812', 10000, 0, 0, 199, 199, 199, 199, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1362, 1362, 'product', '', '0000-00-00 00:00:00', 1, '805253351813', 10000, 0, 0, 15, 15, 15, 15, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1363, 1363, 'product', '', '0000-00-00 00:00:00', 1, '027736011896', 10000, 0, 0, 15, 15, 15, 15, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1364, 1364, 'product', '', '0000-00-00 00:00:00', 1, '8052530161111-1364', 10000, 0, 0, 0, 0, 0, 0, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:38:59'),
(1365, 1365, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 79, 79, 79, 79, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1366, 1366, 'product', '', '0000-00-00 00:00:00', 1, '8143270195617', 10000, 0, 0, 69, 69, 69, 69, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1367, 1367, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 74, 74, 74, 74, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1368, 1368, 'product', '', '0000-00-00 00:00:00', 1, '705108551804-1368', 10000, 0, 0, 0.75, 0.75, 0.75, 0.75, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 22:15:27'),
(1369, 1369, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1370, 1370, 'product', '', '0000-00-00 00:00:00', 1, '027736014873', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1371, 1371, 'product', '', '0000-00-00 00:00:00', 1, '6520090006378', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1372, 1372, 'product', '', '0000-00-00 00:00:00', 1, '8052530100325-1372', 10000, 0, 0, 3.5, 3.5, 3.5, 3.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:27:56'),
(1373, 1373, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1374, 1374, 'product', '', '0000-00-00 00:00:00', 1, '191970120512', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1375, 1375, 'product', '', '0000-00-00 00:00:00', 1, '676551031932', 10000, 0, 0, 54.95, 54.95, 54.95, 54.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1376, 1376, 'product', '', '0000-00-00 00:00:00', 1, '705108558605', 10000, 0, 0, 46.95, 46.95, 46.95, 46.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1377, 1377, 'product', '', '0000-00-00 00:00:00', 1, '705108547203', 10000, 0, 0, 2.5, 2.5, 2.5, 2.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1378, 1378, 'product', '', '0000-00-00 00:00:00', 1, '705108601318', 10000, 0, 0, 2.5, 2.5, 2.5, 2.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1379, 1379, 'product', '', '0000-00-00 00:00:00', 1, '705108601325', 10000, 0, 0, 2.5, 2.5, 2.5, 2.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1380, 1380, 'product', '', '0000-00-00 00:00:00', 1, '705108601370', 10000, 0, 0, 8.96, 8.96, 8.96, 8.96, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1381, 1381, 'product', '', '0000-00-00 00:00:00', 1, '715244260386', 10000, 0, 0, 4.48, 4.48, 4.48, 4.48, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1382, 1382, 'product', '', '0000-00-00 00:00:00', 1, '715244060382', 10000, 0, 0, 4.48, 4.48, 4.48, 4.48, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1383, 1383, 'product', '', '0000-00-00 00:00:00', 1, '027736011544', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1384, 1384, 'product', '', '0000-00-00 00:00:00', 1, '0277360115510', 10000, 0, 0, 4.48, 4.48, 4.48, 4.48, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1385, 1385, 'product', '', '0000-00-00 00:00:00', 1, '8052530130414', 10000, 0, 0, 4.48, 4.48, 4.48, 4.48, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1386, 1386, 'product', '', '0000-00-00 00:00:00', 1, '8143270150715', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1387, 1387, 'product', '', '0000-00-00 00:00:00', 1, '8143270150814', 10000, 0, 0, 32.95, 32.95, 32.95, 32.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1388, 1388, 'product', '', '0000-00-00 00:00:00', 1, '191970117819', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1389, 1389, 'product', '', '0000-00-00 00:00:00', 1, '715244070268', 10000, 0, 0, 3.48, 3.48, 3.48, 3.48, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1390, 1390, 'product', '', '0000-00-00 00:00:00', 1, '8143270112218', 10000, 0, 0, 3.5, 3.5, 3.5, 3.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1391, 1391, 'product', '', '0000-00-00 00:00:00', 1, '111111000923', 10000, 0, 0, 3.5, 3.5, 3.5, 3.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1392, 1392, 'product', '', '0000-00-00 00:00:00', 1, '705108260256', 10000, 0, 0, 0.63, 0.63, 0.63, 0.63, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1393, 1393, 'product', '', '0000-00-00 00:00:00', 1, '8052530168813', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1394, 1394, 'product', '', '0000-00-00 00:00:00', 1, '027736012701', 10000, 0, 0, 4.95, 4.95, 4.95, 4.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1395, 1395, 'product', '', '0000-00-00 00:00:00', 1, '027736015795', 10000, 0, 0, 3.78, 3.78, 3.78, 3.78, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1396, 1396, 'product', '', '0000-00-00 00:00:00', 1, '8143270134623', 10000, 0, 0, 3.78, 3.78, 3.78, 3.78, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1397, 1397, 'product', '', '0000-00-00 00:00:00', 1, '8052530168820', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1398, 1398, 'product', '', '0000-00-00 00:00:00', 1, '8052530192719', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1399, 1399, 'product', '', '0000-00-00 00:00:00', 1, '8143270110016-1399', 10000, 0, 0, 1.25, 1.25, 1.25, 1.25, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:47:18'),
(1400, 1400, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1401, 1401, 'product', '', '0000-00-00 00:00:00', 1, '8052530196212', 10000, 0, 0, 95, 95, 95, 95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1402, 1402, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 13.48, 13.48, 13.48, 13.48, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1403, 1403, 'product', '', '0000-00-00 00:00:00', 1, '8143270157714', 10000, 0, 0, 95, 95, 95, 95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1404, 1404, 'product', '', '0000-00-00 00:00:00', 1, '851866119746', 10000, 0, 0, 125, 125, 125, 125, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1405, 1405, 'product', '', '0000-00-00 00:00:00', 1, '027736030170', 10000, 0, 0, 149, 149, 149, 149, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1406, 1406, 'product', '', '0000-00-00 00:00:00', 1, '715244064076', 10000, 0, 0, 149, 149, 149, 149, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1407, 1407, 'product', '', '0000-00-00 00:00:00', 1, '933175781146', 10000, 0, 0, 149, 149, 149, 149, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1408, 1408, 'product', '', '0000-00-00 00:00:00', 1, '8052530203910', 10000, 0, 0, 6.99, 6.99, 6.99, 6.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1409, 1409, 'product', '', '0000-00-00 00:00:00', 1, '805253153090', 10000, 0, 0, 39.95, 39.95, 39.95, 39.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1410, 1410, 'product', '', '0000-00-00 00:00:00', 1, '8052530128916', 10000, 0, 0, 59, 59, 59, 59, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1411, 1411, 'product', '', '0000-00-00 00:00:00', 1, '652009961051', 10000, 0, 0, 59, 59, 59, 59, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1412, 1412, 'product', '', '0000-00-00 00:00:00', 1, '662394946420', 10000, 0, 0, 169, 169, 169, 169, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1413, 1413, 'product', '', '0000-00-00 00:00:00', 1, '027736022670', 10000, 0, 0, 149, 149, 149, 149, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1414, 1414, 'product', '', '0000-00-00 00:00:00', 1, '191970116317', 10000, 0, 0, 179, 179, 179, 179, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1415, 1415, 'product', '', '0000-00-00 00:00:00', 1, '805253300415', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1416, 1416, 'product', '', '0000-00-00 00:00:00', 1, '027736035793', 10000, 0, 0, 39.95, 39.95, 39.95, 39.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1417, 1417, 'product', '', '0000-00-00 00:00:00', 1, '8052531540519', 10000, 0, 0, 15.95, 15.95, 15.95, 15.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1418, 1418, 'product', '', '0000-00-00 00:00:00', 1, '8107880253013', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1419, 1419, 'product', '', '0000-00-00 00:00:00', 1, '027736026494', 10000, 0, 0, 1.74, 1.74, 1.74, 1.74, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1420, 1420, 'product', '', '0000-00-00 00:00:00', 1, '8052530165317', 10000, 0, 0, 1.74, 1.74, 1.74, 1.74, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1421, 1421, 'product', '', '0000-00-00 00:00:00', 1, '8143270132414', 10000, 0, 0, 28.95, 28.95, 28.95, 28.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1422, 1422, 'product', '', '0000-00-00 00:00:00', 1, '8052531322818', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1423, 1423, 'product', '', '0000-00-00 00:00:00', 1, '027736020843', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1424, 1424, 'product', '', '0000-00-00 00:00:00', 1, '027736020577', 10000, 0, 0, 15.95, 15.95, 15.95, 15.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1425, 1425, 'product', '', '0000-00-00 00:00:00', 1, '027736020560', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1426, 1426, 'product', '', '0000-00-00 00:00:00', 1, '027736020591', 10000, 0, 0, 5.95, 5.95, 5.95, 5.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1427, 1427, 'product', '', '0000-00-00 00:00:00', 1, '191970117512-1427', 10000, 0, 0, 2.5, 2.5, 2.5, 2.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:38:24'),
(1428, 1428, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 71.95, 71.95, 71.95, 71.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1429, 1429, 'product', '', '0000-00-00 00:00:00', 1, '8052531503910', 10000, 0, 0, 28.95, 28.95, 28.95, 28.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1430, 1430, 'product', '', '0000-00-00 00:00:00', 1, '8052531317715', 10000, 0, 0, 79.95, 79.95, 79.95, 79.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1431, 1431, 'product', '', '0000-00-00 00:00:00', 1, '027736013234', 10000, 0, 0, 3.24, 3.24, 3.24, 3.24, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1432, 1432, 'product', '', '0000-00-00 00:00:00', 1, '027736013210', 10000, 0, 0, 16, 16, 16, 16, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1433, 1433, 'product', '', '0000-00-00 00:00:00', 1, '705108600762', 10000, 0, 0, 5.99, 5.99, 5.99, 5.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1434, 1434, 'product', '', '0000-00-00 00:00:00', 1, '027736007837', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1435, 1435, 'product', '', '0000-00-00 00:00:00', 1, '027736031764', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1436, 1436, 'product', '', '0000-00-00 00:00:00', 1, '705108553907', 10000, 0, 0, 17.95, 17.95, 17.95, 17.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1437, 1437, 'product', '', '0000-00-00 00:00:00', 1, '8052531145615', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1438, 1438, 'product', '', '0000-00-00 00:00:00', 1, '191970116911', 10000, 0, 0, 2.5, 2.5, 2.5, 2.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1439, 1439, 'product', '', '0000-00-00 00:00:00', 1, '8052530123218', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1440, 1440, 'product', '', '0000-00-00 00:00:00', 1, '8052530123225', 10000, 0, 0, 2.5, 2.5, 2.5, 2.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1441, 1441, 'product', '', '0000-00-00 00:00:00', 1, '8143270142710', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1442, 1442, 'product', '', '0000-00-00 00:00:00', 1, '8143270142727', 10000, 0, 0, 2.5, 2.5, 2.5, 2.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1443, 1443, 'product', '', '0000-00-00 00:00:00', 1, '027736009602', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1444, 1444, 'product', '', '0000-00-00 00:00:00', 1, '027736038824', 10000, 0, 0, 69.95, 69.95, 69.95, 69.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1445, 1445, 'product', '', '0000-00-00 00:00:00', 1, '805253320215', 10000, 0, 0, 129, 129, 129, 129, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1446, 1446, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1447, 1447, 'product', '', '0000-00-00 00:00:00', 1, 'GIFBlX6eq8-1447', 10000, 0, 0, 0.75, 0.75, 0.75, 0.75, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:16:16'),
(1448, 1448, 'product', '', '0000-00-00 00:00:00', 1, '8107880228516', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1449, 1449, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 2.5, 2.5, 2.5, 2.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1450, 1450, 'product', '', '0000-00-00 00:00:00', 1, '027736020942', 10000, 0, 0, 22.95, 22.95, 22.95, 22.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1451, 1451, 'product', '', '0000-00-00 00:00:00', 1, '027736035915', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1452, 1452, 'product', '', '0000-00-00 00:00:00', 1, '191970110315', 10000, 0, 0, 69, 69, 69, 69, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1453, 1453, 'product', '', '0000-00-00 00:00:00', 1, '8052531336815', 10000, 0, 0, 2.25, 2.25, 2.25, 2.25, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1454, 1454, 'product', '', '0000-00-00 00:00:00', 1, '027736030057', 10000, 0, 0, 125, 125, 125, 125, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1455, 1455, 'product', '', '0000-00-00 00:00:00', 1, '851866012047', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1456, 1456, 'product', '', '0000-00-00 00:00:00', 1, '8052531544616', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00');
INSERT INTO `ns_nexopos_products_unit_quantities` (`id`, `product_id`, `type`, `preview_url`, `expiration_date`, `unit_id`, `barcode`, `quantity`, `low_quantity`, `stock_alert_enabled`, `sale_price`, `sale_price_edit`, `sale_price_without_tax`, `sale_price_with_tax`, `sale_price_tax`, `wholesale_price`, `wholesale_price_edit`, `wholesale_price_with_tax`, `wholesale_price_without_tax`, `wholesale_price_tax`, `custom_price`, `custom_price_edit`, `custom_price_with_tax`, `custom_price_without_tax`, `custom_price_tax`, `visible`, `convert_unit_id`, `cogs`, `uuid`, `created_at`, `updated_at`) VALUES
(1457, 1457, 'product', '', '0000-00-00 00:00:00', 1, '191970127917', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1458, 1458, 'product', '', '0000-00-00 00:00:00', 1, '805253154500', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1459, 1459, 'product', '', '0000-00-00 00:00:00', 1, '8052531545019', 10000, 0, 0, 169, 169, 169, 169, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1460, 1460, 'product', '', '0000-00-00 00:00:00', 1, '705108804467', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1461, 1461, 'product', '', '0000-00-00 00:00:00', 1, '814327017210', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1462, 1462, 'product', '', '0000-00-00 00:00:00', 1, '8052531313618', 10000, 0, 0, 44.95, 44.95, 44.95, 44.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1463, 1463, 'product', '', '0000-00-00 00:00:00', 1, '027736029983', 10000, 0, 0, 6.48, 6.48, 6.48, 6.48, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1464, 1464, 'product', '', '0000-00-00 00:00:00', 1, '027736019922', 10000, 0, 0, 6.48, 6.48, 6.48, 6.48, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1465, 1465, 'product', '', '0000-00-00 00:00:00', 1, '715244160600', 10000, 0, 0, 1.99, 1.99, 1.99, 1.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1466, 1466, 'product', '', '0000-00-00 00:00:00', 1, '8143270150913', 10000, 0, 0, 199, 199, 199, 199, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1467, 1467, 'product', '', '0000-00-00 00:00:00', 1, '8052530200513', 10000, 0, 0, 89.95, 89.95, 89.95, 89.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1468, 1468, 'product', '', '0000-00-00 00:00:00', 1, '027736016594', 10000, 0, 0, 89.95, 89.95, 89.95, 89.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1469, 1469, 'product', '', '0000-00-00 00:00:00', 1, '715244063154', 10000, 0, 0, 119, 119, 119, 119, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1470, 1470, 'product', '', '0000-00-00 00:00:00', 1, '715244063291', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1471, 1471, 'product', '', '0000-00-00 00:00:00', 1, '705108553600', 10000, 0, 0, 89.95, 89.95, 89.95, 89.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1472, 1472, 'product', '', '0000-00-00 00:00:00', 1, '027736040940', 10000, 0, 0, 2.25, 2.25, 2.25, 2.25, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1473, 1473, 'product', '', '0000-00-00 00:00:00', 1, '690000000058', 10000, 0, 0, 21.95, 21.95, 21.95, 21.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1474, 1474, 'product', '', '0000-00-00 00:00:00', 1, '652009903457', 10000, 0, 0, 13.48, 13.48, 13.48, 13.48, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1475, 1475, 'product', '', '0000-00-00 00:00:00', 1, '191970125913', 10000, 0, 0, 39.95, 39.95, 39.95, 39.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1476, 1476, 'product', '', '0000-00-00 00:00:00', 1, '851866006381', 10000, 0, 0, 119, 119, 119, 119, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1477, 1477, 'product', '', '0000-00-00 00:00:00', 1, '705108804504', 10000, 0, 0, 38.95, 38.95, 38.95, 38.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1478, 1478, 'product', '', '0000-00-00 00:00:00', 1, '191970113613', 10000, 0, 0, 69.95, 69.95, 69.95, 69.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1479, 1479, 'product', '', '0000-00-00 00:00:00', 1, '705108804405', 10000, 0, 0, 69.95, 69.95, 69.95, 69.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1480, 1480, 'product', '', '0000-00-00 00:00:00', 1, '705108555901', 10000, 0, 0, 169, 169, 169, 169, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1481, 1481, 'product', '', '0000-00-00 00:00:00', 1, '191970115419', 10000, 0, 0, 58.95, 58.95, 58.95, 58.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1482, 1482, 'product', '', '0000-00-00 00:00:00', 1, '0277360', 10000, 0, 0, 34.95, 34.95, 34.95, 34.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1483, 1483, 'product', '', '0000-00-00 00:00:00', 1, '805253310919', 10000, 0, 0, 79.95, 79.95, 79.95, 79.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1484, 1484, 'product', '', '0000-00-00 00:00:00', 1, '705108804801', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1485, 1485, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 17.95, 17.95, 17.95, 17.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1486, 1486, 'product', '', '0000-00-00 00:00:00', 1, '805253354616', 10000, 0, 0, 36.95, 36.95, 36.95, 36.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1487, 1487, 'product', '', '0000-00-00 00:00:00', 1, '811451015150-1487', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:27:20'),
(1488, 1488, 'product', '', '0000-00-00 00:00:00', 1, '705108321803', 10000, 0, 0, 59, 59, 59, 59, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1489, 1489, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 74.95, 74.95, 74.95, 74.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1490, 1490, 'product', '', '0000-00-00 00:00:00', 1, '027736034161', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1491, 1491, 'product', '', '0000-00-00 00:00:00', 1, '705108538508', 10000, 0, 0, 2.75, 2.75, 2.75, 2.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1492, 1492, 'product', '', '0000-00-00 00:00:00', 1, '805253366411', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1493, 1493, 'product', '', '0000-00-00 00:00:00', 1, '11233312465464', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1494, 1494, 'product', '', '0000-00-00 00:00:00', 1, '851866112433', 10000, 0, 0, 79.95, 79.95, 79.95, 79.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1495, 1495, 'product', '', '0000-00-00 00:00:00', 1, '8052530172414', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1496, 1496, 'product', '', '0000-00-00 00:00:00', 1, '8107880276319', 10000, 0, 0, 7.65, 7.65, 7.65, 7.65, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1497, 1497, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1498, 1498, 'product', '', '0000-00-00 00:00:00', 1, '027736029570', 10000, 0, 0, 4.5, 4.5, 4.5, 4.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1499, 1499, 'product', '', '0000-00-00 00:00:00', 1, '8052530020715', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1500, 1500, 'product', '', '0000-00-00 00:00:00', 1, '851866125211', 10000, 0, 0, 52.95, 52.95, 52.95, 52.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1501, 1501, 'product', '', '0000-00-00 00:00:00', 1, '8143270195211', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1502, 1502, 'product', '', '0000-00-00 00:00:00', 1, '820000001049', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1503, 1503, 'product', '', '0000-00-00 00:00:00', 1, '652009101006', 10000, 0, 0, 46.95, 46.95, 46.95, 46.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1504, 1504, 'product', '', '0000-00-00 00:00:00', 1, '027736034437', 10000, 0, 0, 54.95, 54.95, 54.95, 54.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1505, 1505, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1506, 1506, 'product', '', '0000-00-00 00:00:00', 1, '027736036417', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1507, 1507, 'product', '', '0000-00-00 00:00:00', 1, '8052531336914', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1508, 1508, 'product', '', '0000-00-00 00:00:00', 1, '805253300187', 10000, 0, 0, 109.95, 109.95, 109.95, 109.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1509, 1509, 'product', '', '0000-00-00 00:00:00', 1, '8052530140116', 10000, 0, 0, 139, 139, 139, 139, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1510, 1510, 'product', '', '0000-00-00 00:00:00', 1, '805253357013', 10000, 0, 0, 44.95, 44.95, 44.95, 44.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1511, 1511, 'product', '', '0000-00-00 00:00:00', 1, '715244300327', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1512, 1512, 'product', '', '0000-00-00 00:00:00', 1, '8052531338017', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1513, 1513, 'product', '', '0000-00-00 00:00:00', 1, '705108320745', 10000, 0, 0, 67.95, 67.95, 67.95, 67.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1514, 1514, 'product', '', '0000-00-00 00:00:00', 1, '8052531318712', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1515, 1515, 'product', '', '0000-00-00 00:00:00', 1, '705108512218', 10000, 0, 0, 16, 16, 16, 16, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1516, 1516, 'product', '', '0000-00-00 00:00:00', 1, '8143270157011', 10000, 0, 0, 59, 59, 59, 59, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1517, 1517, 'product', '', '0000-00-00 00:00:00', 1, '8107880274117', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1518, 1518, 'product', '', '0000-00-00 00:00:00', 1, '027736025930', 10000, 0, 0, 79, 79, 79, 79, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1519, 1519, 'product', '', '0000-00-00 00:00:00', 1, '027736037520', 10000, 0, 0, 169, 169, 169, 169, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1520, 1520, 'product', '', '0000-00-00 00:00:00', 1, '705108955633', 10000, 0, 0, 15.95, 15.95, 15.95, 15.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1521, 1521, 'product', '', '0000-00-00 00:00:00', 1, '705108604104', 10000, 0, 0, 52, 52, 52, 52, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1522, 1522, 'product', '', '0000-00-00 00:00:00', 1, '705108551903', 10000, 0, 0, 39.95, 39.95, 39.95, 39.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1523, 1523, 'product', '', '0000-00-00 00:00:00', 1, '191970123612', 10000, 0, 0, 39.95, 39.95, 39.95, 39.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1524, 1524, 'product', '', '0000-00-00 00:00:00', 1, '8143270182112', 10000, 0, 0, 5.95, 5.95, 5.95, 5.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1525, 1525, 'product', '', '0000-00-00 00:00:00', 1, '027736013296', 10000, 0, 0, 42.95, 42.95, 42.95, 42.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1526, 1526, 'product', '', '0000-00-00 00:00:00', 1, '8052531539117', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1527, 1527, 'product', '', '0000-00-00 00:00:00', 1, '8052531335313', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1528, 1528, 'product', '', '0000-00-00 00:00:00', 1, '027736021116', 10000, 0, 0, 13.48, 13.48, 13.48, 13.48, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1529, 1529, 'product', '', '0000-00-00 00:00:00', 1, '715244061730', 10000, 0, 0, 13.48, 13.48, 13.48, 13.48, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1530, 1530, 'product', '', '0000-00-00 00:00:00', 1, '219961848168', 10000, 0, 0, 13.48, 13.48, 13.48, 13.48, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1531, 1531, 'product', '', '0000-00-00 00:00:00', 1, '814527309115', 10000, 0, 0, 2.99, 2.99, 2.99, 2.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1532, 1532, 'product', '', '0000-00-00 00:00:00', 1, '191970117116', 10000, 0, 0, 71.95, 71.95, 71.95, 71.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1533, 1533, 'product', '', '0000-00-00 00:00:00', 1, '8052531513711', 10000, 0, 0, 89.95, 89.95, 89.95, 89.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1534, 1534, 'product', '', '0000-00-00 00:00:00', 1, '805253330511', 10000, 0, 0, 2.5, 2.5, 2.5, 2.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1535, 1535, 'product', '', '0000-00-00 00:00:00', 1, '027736006038', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1536, 1536, 'product', '', '0000-00-00 00:00:00', 1, '027736013241', 10000, 0, 0, 18.95, 18.95, 18.95, 18.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1537, 1537, 'product', '', '0000-00-00 00:00:00', 1, '811451014214', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1538, 1538, 'product', '', '0000-00-00 00:00:00', 1, '705108501564', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1539, 1539, 'product', '', '0000-00-00 00:00:00', 1, '705108558407', 10000, 0, 0, 79.95, 79.95, 79.95, 79.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1540, 1540, 'product', '', '0000-00-00 00:00:00', 1, '8107880276210', 10000, 0, 0, 169, 169, 169, 169, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1541, 1541, 'product', '', '0000-00-00 00:00:00', 1, '8143270162114', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1542, 1542, 'product', '', '0000-00-00 00:00:00', 1, '8052531603320', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1543, 1543, 'product', '', '0000-00-00 00:00:00', 1, '191970108718', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1544, 1544, 'product', '', '0000-00-00 00:00:00', 1, '191970108411', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1545, 1545, 'product', '', '0000-00-00 00:00:00', 1, '191970108619', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1546, 1546, 'product', '', '0000-00-00 00:00:00', 1, '191970108510', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1547, 1547, 'product', '', '0000-00-00 00:00:00', 1, '715244001163', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1548, 1548, 'product', '', '0000-00-00 00:00:00', 1, '652009306340', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1549, 1549, 'product', '', '0000-00-00 00:00:00', 1, '191970127818', 10000, 0, 0, 17.95, 17.95, 17.95, 17.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1550, 1550, 'product', '', '0000-00-00 00:00:00', 1, '027736033539', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1551, 1551, 'product', '', '0000-00-00 00:00:00', 1, '027736042395', 10000, 0, 0, 59, 59, 59, 59, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1552, 1552, 'product', '', '0000-00-00 00:00:00', 1, '705108805105', 10000, 0, 0, 79, 79, 79, 79, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1553, 1553, 'product', '', '0000-00-00 00:00:00', 1, '705108805105', 10000, 0, 0, 161, 161, 161, 161, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1554, 1554, 'product', '', '0000-00-00 00:00:00', 1, '8052530290712', 10000, 0, 0, 15.5, 15.5, 15.5, 15.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1555, 1555, 'product', '', '0000-00-00 00:00:00', 1, '705108518708', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1556, 1556, 'product', '', '0000-00-00 00:00:00', 1, '191970129126', 10000, 0, 0, 2.25, 2.25, 2.25, 2.25, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1557, 1557, 'product', '', '0000-00-00 00:00:00', 1, '8143270132711', 10000, 0, 0, 179, 179, 179, 179, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1558, 1558, 'product', '', '0000-00-00 00:00:00', 1, '027736044238', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1559, 1559, 'product', '', '0000-00-00 00:00:00', 1, '8052531204718', 10000, 0, 0, 15.95, 15.95, 15.95, 15.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1560, 1560, 'product', '', '0000-00-00 00:00:00', 1, '027736042241', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1561, 1561, 'product', '', '0000-00-00 00:00:00', 1, '8143270122316', 10000, 0, 0, 54.95, 54.95, 54.95, 54.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1562, 1562, 'product', '', '0000-00-00 00:00:00', 1, '705108001705', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1563, 1563, 'product', '', '0000-00-00 00:00:00', 1, '805253300941', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1564, 1564, 'product', '', '0000-00-00 00:00:00', 1, '705108210374', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1565, 1565, 'product', '', '0000-00-00 00:00:00', 1, '191970110810', 10000, 0, 0, 89, 89, 89, 89, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1566, 1566, 'product', '', '0000-00-00 00:00:00', 1, '191970122011', 10000, 0, 0, 21.95, 21.95, 21.95, 21.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1567, 1567, 'product', '', '0000-00-00 00:00:00', 1, '705108519705', 10000, 0, 0, 0, 0, 0, 0, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1568, 1568, 'product', '', '0000-00-00 00:00:00', 1, '22334455', 10000, 0, 0, 79.95, 79.95, 79.95, 79.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1569, 1569, 'product', '', '0000-00-00 00:00:00', 1, '8143270195112', 10000, 0, 0, 79.95, 79.95, 79.95, 79.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1570, 1570, 'product', '', '0000-00-00 00:00:00', 1, '191970113316', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1571, 1571, 'product', '', '0000-00-00 00:00:00', 1, '027736042166', 10000, 0, 0, 4.5, 4.5, 4.5, 4.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1572, 1572, 'product', '', '0000-00-00 00:00:00', 1, '8052530210918', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1573, 1573, 'product', '', '0000-00-00 00:00:00', 1, '8052530161326', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1574, 1574, 'product', '', '0000-00-00 00:00:00', 1, '8052531137719', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1575, 1575, 'product', '', '0000-00-00 00:00:00', 1, '8052531144915', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1576, 1576, 'product', '', '0000-00-00 00:00:00', 1, '8143270132926', 10000, 0, 0, 2.5, 2.5, 2.5, 2.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1577, 1577, 'product', '', '0000-00-00 00:00:00', 1, '8143270132919', 10000, 0, 0, 2.5, 2.5, 2.5, 2.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1578, 1578, 'product', '', '0000-00-00 00:00:00', 1, '8052530161319', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1579, 1579, 'product', '', '0000-00-00 00:00:00', 1, '027736044429', 10000, 0, 0, 8.5, 8.5, 8.5, 8.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1580, 1580, 'product', '', '0000-00-00 00:00:00', 1, '027736044436', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1581, 1581, 'product', '', '0000-00-00 00:00:00', 1, '514677002002', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1582, 1582, 'product', '', '0000-00-00 00:00:00', 1, '805253300132', 10000, 0, 0, 18.95, 18.95, 18.95, 18.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1583, 1583, 'product', '', '0000-00-00 00:00:00', 1, '705108519101', 10000, 0, 0, 38, 38, 38, 38, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1584, 1584, 'product', '', '0000-00-00 00:00:00', 1, '8052531543916', 10000, 0, 0, 139, 139, 139, 139, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1585, 1585, 'product', '', '0000-00-00 00:00:00', 1, '705108803101', 10000, 0, 0, 5.95, 5.95, 5.95, 5.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1586, 1586, 'product', '', '0000-00-00 00:00:00', 1, '027736033928', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1587, 1587, 'product', '', '0000-00-00 00:00:00', 1, '8107880235026', 10000, 0, 0, 3.5, 3.5, 3.5, 3.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1588, 1588, 'product', '', '0000-00-00 00:00:00', 1, '8107880235019', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1589, 1589, 'product', '', '0000-00-00 00:00:00', 1, '8107880255215', 10000, 0, 0, 6.4, 6.4, 6.4, 6.4, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1590, 1590, 'product', '', '0000-00-00 00:00:00', 1, '027736011414', 10000, 0, 0, 6.4, 6.4, 6.4, 6.4, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1591, 1591, 'product', '', '0000-00-00 00:00:00', 1, '715244160594', 10000, 0, 0, 6.4, 6.4, 6.4, 6.4, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1592, 1592, 'product', '', '0000-00-00 00:00:00', 1, '8052530134016', 10000, 0, 0, 6.4, 6.4, 6.4, 6.4, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1593, 1593, 'product', '', '0000-00-00 00:00:00', 1, '8143270151217', 10000, 0, 0, 79.95, 79.95, 79.95, 79.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1594, 1594, 'product', '', '0000-00-00 00:00:00', 1, '027736030026', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1595, 1595, 'product', '', '0000-00-00 00:00:00', 1, '705108202805', 10000, 0, 0, 21.95, 21.95, 21.95, 21.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1596, 1596, 'product', '', '0000-00-00 00:00:00', 1, '8143270140426', 10000, 0, 0, 5.5, 5.5, 5.5, 5.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1597, 1597, 'product', '', '0000-00-00 00:00:00', 1, '8143270140419', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1598, 1598, 'product', '', '0000-00-00 00:00:00', 1, '851866134732', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1599, 1599, 'product', '', '0000-00-00 00:00:00', 1, '027736039869', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1600, 1600, 'product', '', '0000-00-00 00:00:00', 1, '8052530121016', 10000, 0, 0, 89, 89, 89, 89, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1601, 1601, 'product', '', '0000-00-00 00:00:00', 1, '8143270122415', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1602, 1602, 'product', '', '0000-00-00 00:00:00', 1, '705108004201', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1603, 1603, 'product', '', '0000-00-00 00:00:00', 1, '8052531337515', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1604, 1604, 'product', '', '0000-00-00 00:00:00', 1, '8052531338215', 10000, 0, 0, 2.5, 2.5, 2.5, 2.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1605, 1605, 'product', '', '0000-00-00 00:00:00', 1, '027736046201', 10000, 0, 0, 4.95, 4.95, 4.95, 4.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1606, 1606, 'product', '', '0000-00-00 00:00:00', 1, '191970116614', 10000, 0, 0, 4.95, 4.95, 4.95, 4.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1607, 1607, 'product', '', '0000-00-00 00:00:00', 1, '805253366510', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1608, 1608, 'product', '', '0000-00-00 00:00:00', 1, '191970111510', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1609, 1609, 'product', '', '0000-00-00 00:00:00', 1, '191970111619', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1610, 1610, 'product', '', '0000-00-00 00:00:00', 1, '191970111817', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1611, 1611, 'product', '', '0000-00-00 00:00:00', 1, '191970111718', 10000, 0, 0, 23.95, 23.95, 23.95, 23.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1612, 1612, 'product', '', '0000-00-00 00:00:00', 1, '715244062799', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1613, 1613, 'product', '', '0000-00-00 00:00:00', 1, '705108515509', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1614, 1614, 'product', '', '0000-00-00 00:00:00', 1, '8052530192214', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1615, 1615, 'product', '', '0000-00-00 00:00:00', 1, '8143270110115', 10000, 0, 0, 169, 169, 169, 169, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1616, 1616, 'product', '', '0000-00-00 00:00:00', 1, '805253026520', 10000, 0, 0, 169, 169, 169, 169, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1617, 1617, 'product', '', '0000-00-00 00:00:00', 1, '8052530140413', 10000, 0, 0, 36.95, 36.95, 36.95, 36.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1618, 1618, 'product', '', '0000-00-00 00:00:00', 1, '705108558209', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1619, 1619, 'product', '', '0000-00-00 00:00:00', 1, '027736012510', 10000, 0, 0, 71.95, 71.95, 71.95, 71.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1620, 1620, 'product', '', '0000-00-00 00:00:00', 1, '8052531514718', 10000, 0, 0, 22.95, 22.95, 22.95, 22.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1621, 1621, 'product', '', '0000-00-00 00:00:00', 1, '805253300149', 10000, 0, 0, 23.95, 23.95, 23.95, 23.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1622, 1622, 'product', '', '0000-00-00 00:00:00', 1, '705108321506', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1623, 1623, 'product', '', '0000-00-00 00:00:00', 1, '8052531316718', 10000, 0, 0, 68.95, 68.95, 68.95, 68.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1624, 1624, 'product', '', '0000-00-00 00:00:00', 1, '8052531321118', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1625, 1625, 'product', '', '0000-00-00 00:00:00', 1, '805253338319', 10000, 0, 0, 74.95, 74.95, 74.95, 74.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1626, 1626, 'product', '', '0000-00-00 00:00:00', 1, '8052531530817', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1627, 1627, 'product', '', '0000-00-00 00:00:00', 1, '8052530220511', 10000, 0, 0, 21.95, 21.95, 21.95, 21.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1628, 1628, 'product', '', '0000-00-00 00:00:00', 1, '181206805993', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1629, 1629, 'product', '', '0000-00-00 00:00:00', 1, '715244110056', 10000, 0, 0, 4.95, 4.95, 4.95, 4.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1630, 1630, 'product', '', '0000-00-00 00:00:00', 1, '027736010462', 10000, 0, 0, 1.38, 1.38, 1.38, 1.38, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1631, 1631, 'product', '', '0000-00-00 00:00:00', 1, '8143270123627', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1632, 1632, 'product', '', '0000-00-00 00:00:00', 1, '027736001996', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1633, 1633, 'product', '', '0000-00-00 00:00:00', 1, '027736036001996', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1634, 1634, 'product', '', '0000-00-00 00:00:00', 1, '8052530210222', 10000, 0, 0, 1.38, 1.38, 1.38, 1.38, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1635, 1635, 'product', '', '0000-00-00 00:00:00', 1, '715244008254', 10000, 0, 0, 1.38, 1.38, 1.38, 1.38, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1636, 1636, 'product', '', '0000-00-00 00:00:00', 1, '8052530210215', 10000, 0, 0, 1.38, 1.38, 1.38, 1.38, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1637, 1637, 'product', '', '0000-00-00 00:00:00', 1, '705108306602', 10000, 0, 0, 1.38, 1.38, 1.38, 1.38, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1638, 1638, 'product', '', '0000-00-00 00:00:00', 1, '13995009200-1638', 10000, 0, 0, 0.23, 0.23, 0.23, 0.23, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:15:12'),
(1639, 1639, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 6.99, 6.99, 6.99, 6.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1640, 1640, 'product', '', '0000-00-00 00:00:00', 1, '715244013913', 10000, 0, 0, 189, 189, 189, 189, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1641, 1641, 'product', '', '0000-00-00 00:00:00', 1, '997215079797', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1642, 1642, 'product', '', '0000-00-00 00:00:00', 1, '687985712922', 10000, 0, 0, 18.95, 18.95, 18.95, 18.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1643, 1643, 'product', '', '0000-00-00 00:00:00', 1, '027736028870', 10000, 0, 0, 99.95, 99.95, 99.95, 99.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1644, 1644, 'product', '', '0000-00-00 00:00:00', 1, '705108557905', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1645, 1645, 'product', '', '0000-00-00 00:00:00', 1, '715244005048-1645', 10000, 0, 0, 3.25, 3.25, 3.25, 3.25, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 21:54:05'),
(1646, 1646, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1647, 1647, 'product', '', '0000-00-00 00:00:00', 1, '705108602803', 10000, 0, 0, 5.95, 5.95, 5.95, 5.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1648, 1648, 'product', '', '0000-00-00 00:00:00', 1, '715244060498', 10000, 0, 0, 5.95, 5.95, 5.95, 5.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1649, 1649, 'product', '', '0000-00-00 00:00:00', 1, '8052530130711', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1650, 1650, 'product', '', '0000-00-00 00:00:00', 1, '715244060795', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1651, 1651, 'product', '', '0000-00-00 00:00:00', 1, '027736009176', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1652, 1652, 'product', '', '0000-00-00 00:00:00', 1, '191970109517', 10000, 0, 0, 4.5, 4.5, 4.5, 4.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1653, 1653, 'product', '', '0000-00-00 00:00:00', 1, '705108700769-1653', 10000, 0, 0, 4.95, 4.95, 4.95, 4.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 22:16:43'),
(1654, 1654, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 21.95, 21.95, 21.95, 21.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1655, 1655, 'product', '', '0000-00-00 00:00:00', 1, '027736026388', 10000, 0, 0, 0, 0, 0, 0, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1656, 1656, 'product', '', '0000-00-00 00:00:00', 1, '8052530130810', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1657, 1657, 'product', '', '0000-00-00 00:00:00', 1, '027736012596', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1658, 1658, 'product', '', '0000-00-00 00:00:00', 1, '851866129738', 10000, 0, 0, 9.85, 9.85, 9.85, 9.85, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1659, 1659, 'product', '', '0000-00-00 00:00:00', 1, '715244003921', 10000, 0, 0, 21.95, 21.95, 21.95, 21.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1660, 1660, 'product', '', '0000-00-00 00:00:00', 1, '715244021826', 10000, 0, 0, 56.95, 56.95, 56.95, 56.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1661, 1661, 'product', '', '0000-00-00 00:00:00', 1, '705108547111', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1662, 1662, 'product', '', '0000-00-00 00:00:00', 1, '705108603909', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1663, 1663, 'product', '', '0000-00-00 00:00:00', 1, '851866077060', 10000, 0, 0, 199, 199, 199, 199, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1664, 1664, 'product', '', '0000-00-00 00:00:00', 1, '027736044283', 10000, 0, 0, 18.95, 18.95, 18.95, 18.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1665, 1665, 'product', '', '0000-00-00 00:00:00', 1, '805253310414', 10000, 0, 0, 3.5, 3.5, 3.5, 3.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1666, 1666, 'product', '', '0000-00-00 00:00:00', 1, '8052531605829', 10000, 0, 0, 2.75, 2.75, 2.75, 2.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1667, 1667, 'product', '', '0000-00-00 00:00:00', 1, '027736013333', 10000, 0, 0, 54.95, 54.95, 54.95, 54.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1668, 1668, 'product', '', '0000-00-00 00:00:00', 1, '027736030217', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1669, 1669, 'product', '', '0000-00-00 00:00:00', 1, '191970100712', 10000, 0, 0, 48, 48, 48, 48, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1670, 1670, 'product', '', '0000-00-00 00:00:00', 1, '027736031399', 10000, 0, 0, 53, 53, 53, 53, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1671, 1671, 'product', '', '0000-00-00 00:00:00', 1, '8052531530619', 10000, 0, 0, 64.95, 64.95, 64.95, 64.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1672, 1672, 'product', '', '0000-00-00 00:00:00', 1, '687985245710', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1673, 1673, 'product', '', '0000-00-00 00:00:00', 1, '652009118004', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1674, 1674, 'product', '', '0000-00-00 00:00:00', 1, '191970116713', 10000, 0, 0, 44.99, 44.99, 44.99, 44.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1675, 1675, 'product', '', '0000-00-00 00:00:00', 1, '687985245819', 10000, 0, 0, 319, 319, 319, 319, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1676, 1676, 'product', '', '0000-00-00 00:00:00', 1, '8107880245117', 10000, 0, 0, 28.95, 28.95, 28.95, 28.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1677, 1677, 'product', '', '0000-00-00 00:00:00', 1, '191970101115', 10000, 0, 0, 79, 79, 79, 79, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1678, 1678, 'product', '', '0000-00-00 00:00:00', 1, '805253316492', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1679, 1679, 'product', '', '0000-00-00 00:00:00', 1, '705108513406', 10000, 0, 0, 0, 0, 0, 0, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1680, 1680, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 44.95, 44.95, 44.95, 44.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1681, 1681, 'product', '', '0000-00-00 00:00:00', 1, '8052531340416', 10000, 0, 0, 52.95, 52.95, 52.95, 52.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1682, 1682, 'product', '', '0000-00-00 00:00:00', 1, '805253330412', 10000, 0, 0, 62, 62, 62, 62, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00');
INSERT INTO `ns_nexopos_products_unit_quantities` (`id`, `product_id`, `type`, `preview_url`, `expiration_date`, `unit_id`, `barcode`, `quantity`, `low_quantity`, `stock_alert_enabled`, `sale_price`, `sale_price_edit`, `sale_price_without_tax`, `sale_price_with_tax`, `sale_price_tax`, `wholesale_price`, `wholesale_price_edit`, `wholesale_price_with_tax`, `wholesale_price_without_tax`, `wholesale_price_tax`, `custom_price`, `custom_price_edit`, `custom_price_with_tax`, `custom_price_without_tax`, `custom_price_tax`, `visible`, `convert_unit_id`, `cogs`, `uuid`, `created_at`, `updated_at`) VALUES
(1683, 1683, 'product', '', '0000-00-00 00:00:00', 1, '805253310513', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1684, 1684, 'product', '', '0000-00-00 00:00:00', 1, '705108321902', 10000, 0, 0, 65, 65, 65, 65, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1685, 1685, 'product', '', '0000-00-00 00:00:00', 1, '191970111312', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1686, 1686, 'product', '', '0000-00-00 00:00:00', 1, '8052531342212', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1687, 1687, 'product', '', '0000-00-00 00:00:00', 1, '715244064328', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1688, 1688, 'product', '', '0000-00-00 00:00:00', 1, '819383047045', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1689, 1689, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 17.95, 17.95, 17.95, 17.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1690, 1690, 'product', '', '0000-00-00 00:00:00', 1, '191970112920', 10000, 0, 0, 17.95, 17.95, 17.95, 17.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1691, 1691, 'product', '', '0000-00-00 00:00:00', 1, '027736000098', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1692, 1692, 'product', '', '0000-00-00 00:00:00', 1, '705108203000', 10000, 0, 0, 0, 0, 0, 0, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1693, 1693, 'product', '', '0000-00-00 00:00:00', 1, '027736031207', 10000, 0, 0, 139, 139, 139, 139, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1694, 1694, 'product', '', '0000-00-00 00:00:00', 1, '191970120215', 10000, 0, 0, 69.95, 69.95, 69.95, 69.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1695, 1695, 'product', '', '0000-00-00 00:00:00', 1, '705108547609', 10000, 0, 0, 21.95, 21.95, 21.95, 21.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1696, 1696, 'product', '', '0000-00-00 00:00:00', 1, '8052531338918', 10000, 0, 0, 21.95, 21.95, 21.95, 21.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1697, 1697, 'product', '', '0000-00-00 00:00:00', 1, '705108516704', 10000, 0, 0, 34.95, 34.95, 34.95, 34.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1698, 1698, 'product', '', '0000-00-00 00:00:00', 1, '805253311213', 10000, 0, 0, 134, 134, 134, 134, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1699, 1699, 'product', '', '0000-00-00 00:00:00', 1, '8052531540113', 10000, 0, 0, 42.95, 42.95, 42.95, 42.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1700, 1700, 'product', '', '0000-00-00 00:00:00', 1, '805253301962', 10000, 0, 0, 42.95, 42.95, 42.95, 42.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1701, 1701, 'product', '', '0000-00-00 00:00:00', 1, '805253397514', 10000, 0, 0, 54, 54, 54, 54, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1702, 1702, 'product', '', '0000-00-00 00:00:00', 1, '705108556007', 10000, 0, 0, 29.5, 29.5, 29.5, 29.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1703, 1703, 'product', '', '0000-00-00 00:00:00', 1, '027736020225', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1704, 1704, 'product', '', '0000-00-00 00:00:00', 1, '705108403202', 10000, 0, 0, 199, 199, 199, 199, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1705, 1705, 'product', '', '0000-00-00 00:00:00', 1, '715244063512', 10000, 0, 0, 199, 199, 199, 199, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1706, 1706, 'product', '', '0000-00-00 00:00:00', 1, '592211428975', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1707, 1707, 'product', '', '0000-00-00 00:00:00', 1, '805253301320', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1708, 1708, 'product', '', '0000-00-00 00:00:00', 1, '027736039852', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1709, 1709, 'product', '', '0000-00-00 00:00:00', 1, '805253363410', 10000, 0, 0, 36.95, 36.95, 36.95, 36.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1710, 1710, 'product', '', '0000-00-00 00:00:00', 1, '10805253301310', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1711, 1711, 'product', '', '0000-00-00 00:00:00', 1, '805253301313', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1712, 1712, 'product', '', '0000-00-00 00:00:00', 1, '805253363311', 10000, 0, 0, 44, 44, 44, 44, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1713, 1713, 'product', '', '0000-00-00 00:00:00', 1, '805253300170', 10000, 0, 0, 17.95, 17.95, 17.95, 17.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1714, 1714, 'product', '', '0000-00-00 00:00:00', 1, '652009003324', 10000, 0, 0, 42.95, 42.95, 42.95, 42.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1715, 1715, 'product', '', '0000-00-00 00:00:00', 1, '027736032860', 10000, 0, 0, 129, 129, 129, 129, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1716, 1716, 'product', '', '0000-00-00 00:00:00', 1, '705108551002', 10000, 0, 0, 199, 199, 199, 199, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1717, 1717, 'product', '', '0000-00-00 00:00:00', 1, '705108534609', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1718, 1718, 'product', '', '0000-00-00 00:00:00', 1, '715244064472', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1719, 1719, 'product', '', '0000-00-00 00:00:00', 1, '715244030729', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1720, 1720, 'product', '', '0000-00-00 00:00:00', 1, '715244000890', 10000, 0, 0, 5.5, 5.5, 5.5, 5.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1721, 1721, 'product', '', '0000-00-00 00:00:00', 1, '8052530195819', 10000, 0, 0, 5.5, 5.5, 5.5, 5.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1722, 1722, 'product', '', '0000-00-00 00:00:00', 1, '805253191013', 10000, 0, 0, 5.5, 5.5, 5.5, 5.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1723, 1723, 'product', '', '0000-00-00 00:00:00', 1, '8143270110511', 10000, 0, 0, 5.5, 5.5, 5.5, 5.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1724, 1724, 'product', '', '0000-00-00 00:00:00', 1, '027736009985', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1725, 1725, 'product', '', '0000-00-00 00:00:00', 1, '705108601400', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1726, 1726, 'product', '', '0000-00-00 00:00:00', 1, '027736027651', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1727, 1727, 'product', '', '0000-00-00 00:00:00', 1, '715244037230', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1728, 1728, 'product', '', '0000-00-00 00:00:00', 1, '715244017232', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1729, 1729, 'product', '', '0000-00-00 00:00:00', 1, '715244047239', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1730, 1730, 'product', '', '0000-00-00 00:00:00', 1, '715244057238', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1731, 1731, 'product', '', '0000-00-00 00:00:00', 1, '027736011773', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1732, 1732, 'product', '', '0000-00-00 00:00:00', 1, '027736011469', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1733, 1733, 'product', '', '0000-00-00 00:00:00', 1, '805253621077', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1734, 1734, 'product', '', '0000-00-00 00:00:00', 1, '8145270183625', 10000, 0, 0, 0.35, 0.35, 0.35, 0.35, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1735, 1735, 'product', '', '0000-00-00 00:00:00', 1, '8145270183618', 10000, 0, 0, 2.25, 2.25, 2.25, 2.25, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1736, 1736, 'product', '', '0000-00-00 00:00:00', 1, '805253332416', 10000, 0, 0, 11.95, 11.95, 11.95, 11.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1737, 1737, 'product', '', '0000-00-00 00:00:00', 1, '8143270146527', 10000, 0, 0, 2.25, 2.25, 2.25, 2.25, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1738, 1738, 'product', '', '0000-00-00 00:00:00', 1, '8143270146510', 10000, 0, 0, 32, 32, 32, 32, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1739, 1739, 'product', '', '0000-00-00 00:00:00', 1, '952009001017', 10000, 0, 0, 39.95, 39.95, 39.95, 39.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1740, 1740, 'product', '', '0000-00-00 00:00:00', 1, '8052530047910', 10000, 0, 0, 1.49, 1.49, 1.49, 1.49, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1741, 1741, 'product', '', '0000-00-00 00:00:00', 1, '805253363113', 10000, 0, 0, 54.95, 54.95, 54.95, 54.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1742, 1742, 'product', '', '0000-00-00 00:00:00', 1, '027736030224', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1743, 1743, 'product', '', '0000-00-00 00:00:00', 1, '027736037162', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1744, 1744, 'product', '', '0000-00-00 00:00:00', 1, '705108600564', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1745, 1745, 'product', '', '0000-00-00 00:00:00', 1, '705108002405', 10000, 0, 0, 13.95, 13.95, 13.95, 13.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1746, 1746, 'product', '', '0000-00-00 00:00:00', 1, '705108003402', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1747, 1747, 'product', '', '0000-00-00 00:00:00', 1, '191970117222', 10000, 0, 0, 1.95, 1.95, 1.95, 1.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1748, 1748, 'product', '', '0000-00-00 00:00:00', 1, '191970117215', 10000, 0, 0, 79.95, 79.95, 79.95, 79.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1749, 1749, 'product', '', '0000-00-00 00:00:00', 1, '8052531546511', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1750, 1750, 'product', '', '0000-00-00 00:00:00', 1, '8052530124611', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1751, 1751, 'product', '', '0000-00-00 00:00:00', 1, '027736009619', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1752, 1752, 'product', '', '0000-00-00 00:00:00', 1, '8052530124628', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1753, 1753, 'product', '', '0000-00-00 00:00:00', 1, '13995003208', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1754, 1754, 'product', '', '0000-00-00 00:00:00', 1, '705108514915', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1755, 1755, 'product', '', '0000-00-00 00:00:00', 1, '851866028130', 10000, 0, 0, 32.95, 32.95, 32.95, 32.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1756, 1756, 'product', '', '0000-00-00 00:00:00', 1, '8052530045817', 10000, 0, 0, 32.95, 32.95, 32.95, 32.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1757, 1757, 'product', '', '0000-00-00 00:00:00', 1, '805253396913', 10000, 0, 0, 39.95, 39.95, 39.95, 39.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1758, 1758, 'product', '', '0000-00-00 00:00:00', 1, '191970117710', 10000, 0, 0, 69.95, 69.95, 69.95, 69.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1759, 1759, 'product', '', '0000-00-00 00:00:00', 1, '805253414921', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1760, 1760, 'product', '', '0000-00-00 00:00:00', 1, '705108556908', 10000, 0, 0, 5.95, 5.95, 5.95, 5.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1761, 1761, 'product', '', '0000-00-00 00:00:00', 1, '8052530162118', 10000, 0, 0, 5.95, 5.95, 5.95, 5.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1762, 1762, 'product', '', '0000-00-00 00:00:00', 1, '8052530162125', 10000, 0, 0, 53.95, 53.95, 53.95, 53.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1763, 1763, 'product', '', '0000-00-00 00:00:00', 1, '805253330610', 10000, 0, 0, 119, 119, 119, 119, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1764, 1764, 'product', '', '0000-00-00 00:00:00', 1, '851866072324-1764', 10000, 0, 0, 4.95, 4.95, 4.95, 4.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:37:49'),
(1765, 1765, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 9.85, 9.85, 9.85, 9.85, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1766, 1766, 'product', '', '0000-00-00 00:00:00', 1, '687985712618', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1767, 1767, 'product', '', '0000-00-00 00:00:00', 1, '705108309009', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1768, 1768, 'product', '', '0000-00-00 00:00:00', 1, '705108600908', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1769, 1769, 'product', '', '0000-00-00 00:00:00', 1, '687985503520', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1770, 1770, 'product', '', '0000-00-00 00:00:00', 1, '8143270130724', 10000, 0, 0, 5.5, 5.5, 5.5, 5.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1771, 1771, 'product', '', '0000-00-00 00:00:00', 1, '851866017387', 10000, 0, 0, 21.95, 21.95, 21.95, 21.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1772, 1772, 'product', '', '0000-00-00 00:00:00', 1, '8052530130117', 10000, 0, 0, 349, 349, 349, 349, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1773, 1773, 'product', '', '0000-00-00 00:00:00', 1, '191970118090', 10000, 0, 0, 109, 109, 109, 109, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1774, 1774, 'product', '', '0000-00-00 00:00:00', 1, '027736033621', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1775, 1775, 'product', '', '0000-00-00 00:00:00', 1, '8052530221624', 10000, 0, 0, 21.95, 21.95, 21.95, 21.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1776, 1776, 'product', '', '0000-00-00 00:00:00', 1, '027736019847', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1777, 1777, 'product', '', '0000-00-00 00:00:00', 1, '027736042401', 10000, 0, 0, 21.95, 21.95, 21.95, 21.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1778, 1778, 'product', '', '0000-00-00 00:00:00', 1, '027736042685-1778', 10000, 0, 0, 17.95, 17.95, 17.95, 17.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:57:30'),
(1779, 1779, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 119, 119, 119, 119, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1780, 1780, 'product', '', '0000-00-00 00:00:00', 1, '027736044207', 10000, 0, 0, 329, 329, 329, 329, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1781, 1781, 'product', '', '0000-00-00 00:00:00', 1, '805253397019', 10000, 0, 0, 74.95, 74.95, 74.95, 74.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1782, 1782, 'product', '', '0000-00-00 00:00:00', 1, '807880268413', 10000, 0, 0, 18, 18, 18, 18, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1783, 1783, 'product', '', '0000-00-00 00:00:00', 1, '687985267910', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1784, 1784, 'product', '', '0000-00-00 00:00:00', 1, '805253401013', 10000, 0, 0, 98.95, 98.95, 98.95, 98.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1785, 1785, 'product', '', '0000-00-00 00:00:00', 1, '805253354418', 10000, 0, 0, 46.95, 46.95, 46.95, 46.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1786, 1786, 'product', '', '0000-00-00 00:00:00', 1, '027736013166', 10000, 0, 0, 169, 169, 169, 169, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1787, 1787, 'product', '', '0000-00-00 00:00:00', 1, '705108002504', 10000, 0, 0, 22.95, 22.95, 22.95, 22.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1788, 1788, 'product', '', '0000-00-00 00:00:00', 1, '705108309306', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1789, 1789, 'product', '', '0000-00-00 00:00:00', 1, '201207210807', 10000, 0, 0, 2.25, 2.25, 2.25, 2.25, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1790, 1790, 'product', '', '0000-00-00 00:00:00', 1, '13995006100', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1791, 1791, 'product', '', '0000-00-00 00:00:00', 1, '027736014705', 10000, 0, 0, 4.95, 4.95, 4.95, 4.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1792, 1792, 'product', '', '0000-00-00 00:00:00', 1, '027736014163', 10000, 0, 0, 22.95, 22.95, 22.95, 22.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1793, 1793, 'product', '', '0000-00-00 00:00:00', 1, '652009900081', 10000, 0, 0, 5.95, 5.95, 5.95, 5.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1794, 1794, 'product', '', '0000-00-00 00:00:00', 1, '027736022519', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1795, 1795, 'product', '', '0000-00-00 00:00:00', 1, '8052531524519', 10000, 0, 0, 44.95, 44.95, 44.95, 44.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1796, 1796, 'product', '', '0000-00-00 00:00:00', 1, '8052532451616', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1797, 1797, 'product', '', '0000-00-00 00:00:00', 1, '612016238386', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1798, 1798, 'product', '', '0000-00-00 00:00:00', 1, '715244001057', 10000, 0, 0, 0, 0, 0, 0, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1799, 1799, 'product', '', '0000-00-00 00:00:00', 1, '705108308903', 10000, 0, 0, 36.95, 36.95, 36.95, 36.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1800, 1800, 'product', '', '0000-00-00 00:00:00', 1, '8143270152313', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1801, 1801, 'product', '', '0000-00-00 00:00:00', 1, '027736042708', 10000, 0, 0, 49, 49, 49, 49, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1802, 1802, 'product', '', '0000-00-00 00:00:00', 1, '715244064441', 10000, 0, 0, 52.95, 52.95, 52.95, 52.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1803, 1803, 'product', '', '0000-00-00 00:00:00', 1, '982749103070', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1804, 1804, 'product', '', '0000-00-00 00:00:00', 1, '8107880268512', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1805, 1805, 'product', '', '0000-00-00 00:00:00', 1, '705108519903', 10000, 0, 0, 369, 369, 369, 369, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1806, 1806, 'product', '', '0000-00-00 00:00:00', 1, '8107880245018', 10000, 0, 0, 18.95, 18.95, 18.95, 18.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1807, 1807, 'product', '', '0000-00-00 00:00:00', 1, '027736028559', 10000, 0, 0, 36.95, 36.95, 36.95, 36.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1808, 1808, 'product', '', '0000-00-00 00:00:00', 1, '027736019748', 10000, 0, 0, 5.95, 5.95, 5.95, 5.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1809, 1809, 'product', '', '0000-00-00 00:00:00', 1, '705108601004-1809', 10000, 0, 0, 1.75, 1.75, 1.75, 1.75, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:19:24'),
(1810, 1810, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1811, 1811, 'product', '', '0000-00-00 00:00:00', 1, '8052531538912', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1812, 1812, 'product', '', '0000-00-00 00:00:00', 1, '652009960757', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1813, 1813, 'product', '', '0000-00-00 00:00:00', 1, '191970115013', 10000, 0, 0, 89.95, 89.95, 89.95, 89.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1814, 1814, 'product', '', '0000-00-00 00:00:00', 1, '805253131064', 10000, 0, 0, 89.95, 89.95, 89.95, 89.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1815, 1815, 'product', '', '0000-00-00 00:00:00', 1, '8052531312116', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1816, 1816, 'product', '', '0000-00-00 00:00:00', 1, '8052531337713', 10000, 0, 0, 0.4, 0.4, 0.4, 0.4, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1817, 1817, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 4.5, 4.5, 4.5, 4.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1818, 1818, 'product', '', '0000-00-00 00:00:00', 1, '027736042654', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1819, 1819, 'product', '', '0000-00-00 00:00:00', 1, '8143270101212', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1820, 1820, 'product', '', '0000-00-00 00:00:00', 1, '027736010127', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1821, 1821, 'product', '', '0000-00-00 00:00:00', 1, '872421080417', 10000, 0, 0, 0.4, 0.4, 0.4, 0.4, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1822, 1822, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1823, 1823, 'product', '', '0000-00-00 00:00:00', 1, '652009901590', 10000, 0, 0, 4.5, 4.5, 4.5, 4.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1824, 1824, 'product', '', '0000-00-00 00:00:00', 1, '872421090256', 10000, 0, 0, 4.5, 4.5, 4.5, 4.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1825, 1825, 'product', '', '0000-00-00 00:00:00', 1, '715244001170', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1826, 1826, 'product', '', '0000-00-00 00:00:00', 1, '715244001149', 10000, 0, 0, 0.4, 0.4, 0.4, 0.4, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1827, 1827, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 4.5, 4.5, 4.5, 4.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1828, 1828, 'product', '', '0000-00-00 00:00:00', 1, '8052530020319', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1829, 1829, 'product', '', '0000-00-00 00:00:00', 1, '8052530020210', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1830, 1830, 'product', '', '0000-00-00 00:00:00', 1, '8052530181317', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1831, 1831, 'product', '', '0000-00-00 00:00:00', 1, '8052530181324-1831', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 21:54:57'),
(1832, 1832, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 0.4, 0.4, 0.4, 0.4, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1833, 1833, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 29, 29, 29, 29, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1834, 1834, 'product', '', '0000-00-00 00:00:00', 1, '652009117007', 10000, 0, 0, 36.95, 36.95, 36.95, 36.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1835, 1835, 'product', '', '0000-00-00 00:00:00', 1, '027736023479', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1836, 1836, 'product', '', '0000-00-00 00:00:00', 1, '027736006021', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1837, 1837, 'product', '', '0000-00-00 00:00:00', 1, '705108558704', 10000, 0, 0, 44.95, 44.95, 44.95, 44.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1838, 1838, 'product', '', '0000-00-00 00:00:00', 1, '805253300194', 10000, 0, 0, 4.5, 4.5, 4.5, 4.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1839, 1839, 'product', '', '0000-00-00 00:00:00', 1, '705108700714', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1840, 1840, 'product', '', '0000-00-00 00:00:00', 1, '027736013524', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1841, 1841, 'product', '', '0000-00-00 00:00:00', 1, '8052530222010', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1842, 1842, 'product', '', '0000-00-00 00:00:00', 1, '0277360135310', 10000, 0, 0, 6.75, 6.75, 6.75, 6.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1843, 1843, 'product', '', '0000-00-00 00:00:00', 1, '8107880209324', 10000, 0, 0, 3.5, 3.5, 3.5, 3.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1844, 1844, 'product', '', '0000-00-00 00:00:00', 1, '8107880209317', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1845, 1845, 'product', '', '0000-00-00 00:00:00', 1, '191970112814', 10000, 0, 0, 5.95, 5.95, 5.95, 5.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1846, 1846, 'product', '', '0000-00-00 00:00:00', 1, '027736035922', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1847, 1847, 'product', '', '0000-00-00 00:00:00', 1, '027736009886', 10000, 0, 0, 8.5, 8.5, 8.5, 8.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1848, 1848, 'product', '', '0000-00-00 00:00:00', 1, '027736009909', 10000, 0, 0, 8.5, 8.5, 8.5, 8.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1849, 1849, 'product', '', '0000-00-00 00:00:00', 1, '652009996336', 10000, 0, 0, 8.5, 8.5, 8.5, 8.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1850, 1850, 'product', '', '0000-00-00 00:00:00', 1, '8143270152511', 10000, 0, 0, 79.95, 79.95, 79.95, 79.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1851, 1851, 'product', '', '0000-00-00 00:00:00', 1, '8052532440016', 10000, 0, 0, 79.95, 79.95, 79.95, 79.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1852, 1852, 'product', '', '0000-00-00 00:00:00', 1, '705108550210', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1853, 1853, 'product', '', '0000-00-00 00:00:00', 1, '705108520008-1853', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 22:36:24'),
(1854, 1854, 'product', '', '0000-00-00 00:00:00', 1, 'fUYPMbAG8g-1854', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 22:38:10'),
(1855, 1855, 'product', '', '0000-00-00 00:00:00', 1, '8107880223016', 10000, 0, 0, 69, 69, 69, 69, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1856, 1856, 'product', '', '0000-00-00 00:00:00', 1, '851866017325', 10000, 0, 0, 64.95, 64.95, 64.95, 64.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1857, 1857, 'product', '', '0000-00-00 00:00:00', 1, '705108552702', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1858, 1858, 'product', '', '0000-00-00 00:00:00', 1, '8052530166611', 10000, 0, 0, 79.95, 79.95, 79.95, 79.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1859, 1859, 'product', '', '0000-00-00 00:00:00', 1, '805253365513', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1860, 1860, 'product', '', '0000-00-00 00:00:00', 1, '8107880271116', 10000, 0, 0, 18.5, 18.5, 18.5, 18.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1861, 1861, 'product', '', '0000-00-00 00:00:00', 1, '705108401802', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1862, 1862, 'product', '', '0000-00-00 00:00:00', 1, '812037239397', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1863, 1863, 'product', '', '0000-00-00 00:00:00', 1, '805253312319', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1864, 1864, 'product', '', '0000-00-00 00:00:00', 1, '027736035977', 10000, 0, 0, 219, 219, 219, 219, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1865, 1865, 'product', '', '0000-00-00 00:00:00', 1, '807880268918', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1866, 1866, 'product', '', '0000-00-00 00:00:00', 1, '027736033485', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1867, 1867, 'product', '', '0000-00-00 00:00:00', 1, '705108501007', 10000, 0, 0, 22.95, 22.95, 22.95, 22.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1868, 1868, 'product', '', '0000-00-00 00:00:00', 1, '027736012565', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1869, 1869, 'product', '', '0000-00-00 00:00:00', 1, '8052531136514', 10000, 0, 0, 67, 67, 67, 67, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1870, 1870, 'product', '', '0000-00-00 00:00:00', 1, '8052531508113', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1871, 1871, 'product', '', '0000-00-00 00:00:00', 1, '8143270152610', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1872, 1872, 'product', '', '0000-00-00 00:00:00', 1, '8052530054413', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1873, 1873, 'product', '', '0000-00-00 00:00:00', 1, '027736001040', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1874, 1874, 'product', '', '0000-00-00 00:00:00', 1, '805253367111', 10000, 0, 0, 89.99, 89.99, 89.99, 89.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1875, 1875, 'product', '', '0000-00-00 00:00:00', 1, '8052531512516', 10000, 0, 0, 449, 449, 449, 449, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1876, 1876, 'product', '', '0000-00-00 00:00:00', 1, '191970118199', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1877, 1877, 'product', '', '0000-00-00 00:00:00', 1, '705108508303', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1878, 1878, 'product', '', '0000-00-00 00:00:00', 1, '705108508310', 10000, 0, 0, 58.95, 58.95, 58.95, 58.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1879, 1879, 'product', '', '0000-00-00 00:00:00', 1, '8052531517313', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1880, 1880, 'product', '', '0000-00-00 00:00:00', 1, '027736013197', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1881, 1881, 'product', '', '0000-00-00 00:00:00', 1, '705108402007', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1882, 1882, 'product', '', '0000-00-00 00:00:00', 1, '8052530143612', 10000, 0, 0, 39.95, 39.95, 39.95, 39.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1883, 1883, 'product', '', '0000-00-00 00:00:00', 1, '8143270173615', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1884, 1884, 'product', '', '0000-00-00 00:00:00', 1, '027736003341', 10000, 0, 0, 1.99, 1.99, 1.99, 1.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1885, 1885, 'product', '', '0000-00-00 00:00:00', 1, '027736003334', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1886, 1886, 'product', '', '0000-00-00 00:00:00', 1, '705108801015', 10000, 0, 0, 2.99, 2.99, 2.99, 2.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1887, 1887, 'product', '', '0000-00-00 00:00:00', 1, '514677502182', 10000, 0, 0, 2.99, 2.99, 2.99, 2.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1888, 1888, 'product', '', '0000-00-00 00:00:00', 1, '514677402185', 10000, 0, 0, 2.99, 2.99, 2.99, 2.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1889, 1889, 'product', '', '0000-00-00 00:00:00', 1, '514677202181', 10000, 0, 0, 2.99, 2.99, 2.99, 2.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1890, 1890, 'product', '', '0000-00-00 00:00:00', 1, '514677102184', 10000, 0, 0, 2.99, 2.99, 2.99, 2.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1891, 1891, 'product', '', '0000-00-00 00:00:00', 1, '514677302188-1891', 10000, 0, 0, 1, 1, 1, 1, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 21:34:31'),
(1892, 1892, 'product', '', '0000-00-00 00:00:00', 1, 'Bs5Aea1yd7-1892', 10000, 0, 0, 1, 1, 1, 1, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 21:34:53'),
(1893, 1893, 'product', '', '0000-00-00 00:00:00', 1, 'XKljx92WQs-1893', 10000, 0, 0, 1, 1, 1, 1, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 21:35:20'),
(1894, 1894, 'product', '', '0000-00-00 00:00:00', 1, 'NqI80VcqH3-1894', 10000, 0, 0, 1, 1, 1, 1, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 21:35:45'),
(1895, 1895, 'product', '', '0000-00-00 00:00:00', 1, '9CJrzBVFkQ-1895', 10000, 0, 0, 1, 1, 1, 1, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 21:36:15'),
(1896, 1896, 'product', '', '0000-00-00 00:00:00', 1, 'AlRborl8x4-1896', 10000, 0, 0, 1, 1, 1, 1, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 21:36:44'),
(1897, 1897, 'product', '', '0000-00-00 00:00:00', 1, 'rjST91mn10-1897', 10000, 0, 0, 1, 1, 1, 1, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 21:37:09'),
(1898, 1898, 'product', '', '0000-00-00 00:00:00', 1, 'zbfpcawtdJ-1898', 10000, 0, 0, 1, 1, 1, 1, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 21:37:32'),
(1899, 1899, 'product', '', '0000-00-00 00:00:00', 1, 'EPd7W9eO4m-1899', 10000, 0, 0, 1, 1, 1, 1, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 21:37:52'),
(1900, 1900, 'product', '', '0000-00-00 00:00:00', 1, '8kXe6vm6SM-1900', 10000, 0, 0, 0.99, 0.99, 0.99, 0.99, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 22:03:57'),
(1901, 1901, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1902, 1902, 'product', '', '0000-00-00 00:00:00', 1, '191970117314-1902', 10000, 0, 0, 299, 299, 299, 299, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 15:34:41'),
(1903, 1903, 'product', '', '0000-00-00 00:00:00', 1, '8052530145319', 10000, 0, 0, 44.95, 44.95, 44.95, 44.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1904, 1904, 'product', '', '0000-00-00 00:00:00', 1, '805253320116', 10000, 0, 0, 13.4, 13.4, 13.4, 13.4, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1905, 1905, 'product', '', '0000-00-00 00:00:00', 1, '191970110711', 10000, 0, 0, 2.5, 2.5, 2.5, 2.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1906, 1906, 'product', '', '0000-00-00 00:00:00', 1, '027736020539', 10000, 0, 0, 11.95, 11.95, 11.95, 11.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1907, 1907, 'product', '', '0000-00-00 00:00:00', 1, '027736036431', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1908, 1908, 'product', '', '0000-00-00 00:00:00', 1, '027736006380', 10000, 0, 0, 279, 279, 279, 279, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1909, 1909, 'product', '', '0000-00-00 00:00:00', 1, '691051000332', 10000, 0, 0, 69.95, 69.95, 69.95, 69.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00');
INSERT INTO `ns_nexopos_products_unit_quantities` (`id`, `product_id`, `type`, `preview_url`, `expiration_date`, `unit_id`, `barcode`, `quantity`, `low_quantity`, `stock_alert_enabled`, `sale_price`, `sale_price_edit`, `sale_price_without_tax`, `sale_price_with_tax`, `sale_price_tax`, `wholesale_price`, `wholesale_price_edit`, `wholesale_price_with_tax`, `wholesale_price_without_tax`, `wholesale_price_tax`, `custom_price`, `custom_price_edit`, `custom_price_with_tax`, `custom_price_without_tax`, `custom_price_tax`, `visible`, `convert_unit_id`, `cogs`, `uuid`, `created_at`, `updated_at`) VALUES
(1910, 1910, 'product', '', '0000-00-00 00:00:00', 1, '027736044863', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1911, 1911, 'product', '', '0000-00-00 00:00:00', 1, '705108513901-1911', 10000, 0, 0, 0.99, 0.99, 0.99, 0.99, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 22:32:20'),
(1912, 1912, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1913, 1913, 'product', '', '0000-00-00 00:00:00', 1, '652009950444', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1914, 1914, 'product', '', '0000-00-00 00:00:00', 1, '715244021536', 10000, 0, 0, 39.95, 39.95, 39.95, 39.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1915, 1915, 'product', '', '0000-00-00 00:00:00', 1, '8052530045718', 10000, 0, 0, 39.95, 39.95, 39.95, 39.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1916, 1916, 'product', '', '0000-00-00 00:00:00', 1, '805253397217', 10000, 0, 0, 0.99, 0.99, 0.99, 0.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1917, 1917, 'product', '', '0000-00-00 00:00:00', 1, '814327011041', 10000, 0, 0, 0.99, 0.99, 0.99, 0.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1918, 1918, 'product', '', '0000-00-00 00:00:00', 1, '027736023059', 10000, 0, 0, 22.95, 22.95, 22.95, 22.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1919, 1919, 'product', '', '0000-00-00 00:00:00', 1, '715244313273', 10000, 0, 0, 22.95, 22.95, 22.95, 22.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1920, 1920, 'product', '', '0000-00-00 00:00:00', 1, '8052530190616', 10000, 0, 0, 5.5, 5.5, 5.5, 5.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1921, 1921, 'product', '', '0000-00-00 00:00:00', 1, '715244313242', 10000, 0, 0, 11.95, 11.95, 11.95, 11.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1922, 1922, 'product', '', '0000-00-00 00:00:00', 1, '027736023042', 10000, 0, 0, 139, 139, 139, 139, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1923, 1923, 'product', '', '0000-00-00 00:00:00', 1, '705108549405', 10000, 0, 0, 28.95, 28.95, 28.95, 28.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1924, 1924, 'product', '', '0000-00-00 00:00:00', 1, '8052531324614', 10000, 0, 0, 79.99, 79.99, 79.99, 79.99, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1925, 1925, 'product', '', '0000-00-00 00:00:00', 1, '805253390713', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1926, 1926, 'product', '', '0000-00-00 00:00:00', 1, '805253354210', 10000, 0, 0, 3.5, 3.5, 3.5, 3.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1927, 1927, 'product', '', '0000-00-00 00:00:00', 1, '8052530163726', 10000, 0, 0, 5.95, 5.95, 5.95, 5.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1928, 1928, 'product', '', '0000-00-00 00:00:00', 1, '027736001873', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1929, 1929, 'product', '', '0000-00-00 00:00:00', 1, '191970129225', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1930, 1930, 'product', '', '0000-00-00 00:00:00', 1, '705108518401', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1931, 1931, 'product', '', '0000-00-00 00:00:00', 1, '8052530014110-1931', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 22:18:01'),
(1932, 1932, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1933, 1933, 'product', '', '0000-00-00 00:00:00', 1, '805253401419', 10000, 0, 0, 39.95, 39.95, 39.95, 39.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1934, 1934, 'product', '', '0000-00-00 00:00:00', 1, '191970112319', 10000, 0, 0, 129, 129, 129, 129, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1935, 1935, 'product', '', '0000-00-00 00:00:00', 1, '705108804306', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1936, 1936, 'product', '', '0000-00-00 00:00:00', 1, '705108545216', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1937, 1937, 'product', '', '0000-00-00 00:00:00', 1, '705108804207', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1938, 1938, 'product', '', '0000-00-00 00:00:00', 1, '715244007257', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1939, 1939, 'product', '', '0000-00-00 00:00:00', 1, '474568245443', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1940, 1940, 'product', '', '0000-00-00 00:00:00', 1, '652009004116', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1941, 1941, 'product', '', '0000-00-00 00:00:00', 1, '705108309207', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1942, 1942, 'product', '', '0000-00-00 00:00:00', 1, '705108900404', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1943, 1943, 'product', '', '0000-00-00 00:00:00', 1, '191970115716', 10000, 0, 0, 2.75, 2.75, 2.75, 2.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1944, 1944, 'product', '', '0000-00-00 00:00:00', 1, '191970117611-1944', 10000, 0, 0, 2.5, 2.5, 2.5, 2.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:26:32'),
(1945, 1945, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 8.5, 8.5, 8.5, 8.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1946, 1946, 'product', '', '0000-00-00 00:00:00', 1, '652009908056', 10000, 0, 0, 22.95, 22.95, 22.95, 22.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1947, 1947, 'product', '', '0000-00-00 00:00:00', 1, '027736031245', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1948, 1948, 'product', '', '0000-00-00 00:00:00', 1, '805253332515', 10000, 0, 0, 119, 119, 119, 119, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1949, 1949, 'product', '', '0000-00-00 00:00:00', 1, '652009003553', 10000, 0, 0, 9.5, 9.5, 9.5, 9.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1950, 1950, 'product', '', '0000-00-00 00:00:00', 1, '027736026470', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1951, 1951, 'product', '', '0000-00-00 00:00:00', 1, '811451014993', 10000, 0, 0, 36.95, 36.95, 36.95, 36.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1952, 1952, 'product', '', '0000-00-00 00:00:00', 1, '027736030231', 10000, 0, 0, 54.95, 54.95, 54.95, 54.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1953, 1953, 'product', '', '0000-00-00 00:00:00', 1, '027736040926', 10000, 0, 0, 54.95, 54.95, 54.95, 54.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1954, 1954, 'product', '', '0000-00-00 00:00:00', 1, '027736027699', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1955, 1955, 'product', '', '0000-00-00 00:00:00', 1, '715244203130', 10000, 0, 0, 6.55, 6.55, 6.55, 6.55, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1956, 1956, 'product', '', '0000-00-00 00:00:00', 1, '687985708314', 10000, 0, 0, 68.95, 68.95, 68.95, 68.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1957, 1957, 'product', '', '0000-00-00 00:00:00', 1, '8052531322313', 10000, 0, 0, 28.95, 28.95, 28.95, 28.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1958, 1958, 'product', '', '0000-00-00 00:00:00', 1, '705108519002', 10000, 0, 0, 79.95, 79.95, 79.95, 79.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1959, 1959, 'product', '', '0000-00-00 00:00:00', 1, '027736042357', 10000, 0, 0, 62.95, 62.95, 62.95, 62.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1960, 1960, 'product', '', '0000-00-00 00:00:00', 1, '805253336117', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1961, 1961, 'product', '', '0000-00-00 00:00:00', 1, '8107880254614', 10000, 0, 0, 34.95, 34.95, 34.95, 34.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1962, 1962, 'product', '', '0000-00-00 00:00:00', 1, '191970121212', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1963, 1963, 'product', '', '0000-00-00 00:00:00', 1, '705108602704', 10000, 0, 0, 67.46, 67.46, 67.46, 67.46, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1964, 1964, 'product', '', '0000-00-00 00:00:00', 1, '8052531318514', 10000, 0, 0, 71.95, 71.95, 71.95, 71.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1965, 1965, 'product', '', '0000-00-00 00:00:00', 1, '8052531503712', 10000, 0, 0, 29.99, 29.99, 29.99, 29.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1966, 1966, 'product', '', '0000-00-00 00:00:00', 1, '8052530046814', 10000, 0, 0, 44.95, 44.95, 44.95, 44.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1967, 1967, 'product', '', '0000-00-00 00:00:00', 1, '705108556809', 10000, 0, 0, 249, 249, 249, 249, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1968, 1968, 'product', '', '0000-00-00 00:00:00', 1, '191970124312', 10000, 0, 0, 6.05, 6.05, 6.05, 6.05, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1969, 1969, 'product', '', '0000-00-00 00:00:00', 1, '8052531600824', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1970, 1970, 'product', '', '0000-00-00 00:00:00', 1, '191970118618', 10000, 0, 0, 69, 69, 69, 69, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1971, 1971, 'product', '', '0000-00-00 00:00:00', 1, '191970123810', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1972, 1972, 'product', '', '0000-00-00 00:00:00', 1, '191970108312', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1973, 1973, 'product', '', '0000-00-00 00:00:00', 1, '705108372614-1973', 10000, 0, 0, 2.25, 2.25, 2.25, 2.25, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:25:43'),
(1974, 1974, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 149, 149, 149, 149, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1975, 1975, 'product', '', '0000-00-00 00:00:00', 1, '8107880273912', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1976, 1976, 'product', '', '0000-00-00 00:00:00', 1, '8107880203315', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1977, 1977, 'product', '', '0000-00-00 00:00:00', 1, '8107880254713', 10000, 0, 0, 74.95, 74.95, 74.95, 74.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1978, 1978, 'product', '', '0000-00-00 00:00:00', 1, '8107880271512', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1979, 1979, 'product', '', '0000-00-00 00:00:00', 1, '851866081302', 10000, 0, 0, 64.95, 64.95, 64.95, 64.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1980, 1980, 'product', '', '0000-00-00 00:00:00', 1, '851866105558', 10000, 0, 0, 53.95, 53.95, 53.95, 53.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1981, 1981, 'product', '', '0000-00-00 00:00:00', 1, '80525331271', 10000, 0, 0, 79.95, 79.95, 79.95, 79.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1982, 1982, 'product', '', '0000-00-00 00:00:00', 1, '8052531542216', 10000, 0, 0, 129, 129, 129, 129, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1983, 1983, 'product', '', '0000-00-00 00:00:00', 1, '705108548408', 10000, 0, 0, 4.5, 4.5, 4.5, 4.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1984, 1984, 'product', '', '0000-00-00 00:00:00', 1, '8052531141716', 10000, 0, 0, 34.95, 34.95, 34.95, 34.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1985, 1985, 'product', '', '0000-00-00 00:00:00', 1, '8052530171011', 10000, 0, 0, 0, 0, 0, 0, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1986, 1986, 'product', '', '0000-00-00 00:00:00', 1, '8107880232513', 10000, 0, 0, 79, 79, 79, 79, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1987, 1987, 'product', '', '0000-00-00 00:00:00', 1, '687985298518', 10000, 0, 0, 189, 189, 189, 189, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1988, 1988, 'product', '', '0000-00-00 00:00:00', 1, '715244001200', 10000, 0, 0, 79.95, 79.95, 79.95, 79.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1989, 1989, 'product', '', '0000-00-00 00:00:00', 1, '705108555505', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1990, 1990, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 1.75, 1.75, 1.75, 1.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1991, 1991, 'product', '', '0000-00-00 00:00:00', 1, '191970112517', 10000, 0, 0, 129, 129, 129, 129, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1992, 1992, 'product', '', '0000-00-00 00:00:00', 1, '705108555406', 10000, 0, 0, 79.95, 79.95, 79.95, 79.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1993, 1993, 'product', '', '0000-00-00 00:00:00', 1, '161273215246', 10000, 0, 0, 89.95, 89.95, 89.95, 89.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1994, 1994, 'product', '', '0000-00-00 00:00:00', 1, '715244001002', 10000, 0, 0, 139, 139, 139, 139, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1995, 1995, 'product', '', '0000-00-00 00:00:00', 1, '715244000654', 10000, 0, 0, 149, 149, 149, 149, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1996, 1996, 'product', '', '0000-00-00 00:00:00', 1, '715244000456', 10000, 0, 0, 4.95, 4.95, 4.95, 4.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1997, 1997, 'product', '', '0000-00-00 00:00:00', 1, '851866009511', 10000, 0, 0, 4.95, 4.95, 4.95, 4.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1998, 1998, 'product', '', '0000-00-00 00:00:00', 1, '851866089377', 10000, 0, 0, 1.99, 1.99, 1.99, 1.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(1999, 1999, 'product', '', '0000-00-00 00:00:00', 1, '8052530161012', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2000, 2000, 'product', '', '0000-00-00 00:00:00', 1, '8143270133923', 10000, 0, 0, 17.95, 17.95, 17.95, 17.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2001, 2001, 'product', '', '0000-00-00 00:00:00', 1, '8052530165423', 10000, 0, 0, 0.35, 0.35, 0.35, 0.35, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2002, 2002, 'product', '', '0000-00-00 00:00:00', 1, '8052530165416', 10000, 0, 0, 269, 269, 269, 269, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2003, 2003, 'product', '', '0000-00-00 00:00:00', 1, '705108955855', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2004, 2004, 'product', '', '0000-00-00 00:00:00', 1, '705108901203', 10000, 0, 0, 2.99, 2.99, 2.99, 2.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2005, 2005, 'product', '', '0000-00-00 00:00:00', 1, '805253416826', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2006, 2006, 'product', '', '0000-00-00 00:00:00', 1, '027736037506', 10000, 0, 0, 15.5, 15.5, 15.5, 15.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2007, 2007, 'product', '', '0000-00-00 00:00:00', 1, '027736001958', 10000, 0, 0, 36.95, 36.95, 36.95, 36.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2008, 2008, 'product', '', '0000-00-00 00:00:00', 1, '705108557103', 10000, 0, 0, 179, 179, 179, 179, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2009, 2009, 'product', '', '0000-00-00 00:00:00', 1, '8052531503811', 10000, 0, 0, 22.95, 22.95, 22.95, 22.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2010, 2010, 'product', '', '0000-00-00 00:00:00', 1, '805253334113', 10000, 0, 0, 69.95, 69.95, 69.95, 69.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2011, 2011, 'product', '', '0000-00-00 00:00:00', 1, '027736036035', 10000, 0, 0, 1.95, 1.95, 1.95, 1.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2012, 2012, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 51.95, 51.95, 51.95, 51.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2013, 2013, 'product', '', '0000-00-00 00:00:00', 1, '8052531539018', 10000, 0, 0, 54, 54, 54, 54, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2014, 2014, 'product', '', '0000-00-00 00:00:00', 1, '715244063789', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2015, 2015, 'product', '', '0000-00-00 00:00:00', 1, '027736018895', 10000, 0, 0, 79, 79, 79, 79, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2016, 2016, 'product', '', '0000-00-00 00:00:00', 1, '027736036400', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2017, 2017, 'product', '', '0000-00-00 00:00:00', 1, '027736018963', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2018, 2018, 'product', '', '0000-00-00 00:00:00', 1, '191970109210', 10000, 0, 0, 69.95, 69.95, 69.95, 69.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2019, 2019, 'product', '', '0000-00-00 00:00:00', 1, '8143270167119', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2020, 2020, 'product', '', '0000-00-00 00:00:00', 1, '705108517206', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2021, 2021, 'product', '', '0000-00-00 00:00:00', 1, '027736046126', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2022, 2022, 'product', '', '0000-00-00 00:00:00', 1, '027736023288-2022', 10000, 0, 0, 1.95, 1.95, 1.95, 1.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:40:11'),
(2023, 2023, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2024, 2024, 'product', '', '0000-00-00 00:00:00', 1, '027736044412-2024', 10000, 0, 0, 2.49, 2.49, 2.49, 2.49, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:48:34'),
(2025, 2025, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 239, 239, 239, 239, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2026, 2026, 'product', '', '0000-00-00 00:00:00', 1, '705108955640', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2027, 2027, 'product', '', '0000-00-00 00:00:00', 1, '705108730667-2027', 10000, 0, 0, 1.5, 1.5, 1.5, 1.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:43:02'),
(2028, 2028, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 56.95, 56.95, 56.95, 56.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2029, 2029, 'product', '', '0000-00-00 00:00:00', 1, '805253311312', 10000, 0, 0, 49, 49, 49, 49, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2030, 2030, 'product', '', '0000-00-00 00:00:00', 1, '8107880274810', 10000, 0, 0, 32.95, 32.95, 32.95, 32.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2031, 2031, 'product', '', '0000-00-00 00:00:00', 1, '191970115112', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2032, 2032, 'product', '', '0000-00-00 00:00:00', 1, '191970114719', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2033, 2033, 'product', '', '0000-00-00 00:00:00', 1, '705108602308', 10000, 0, 0, 2.25, 2.25, 2.25, 2.25, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2034, 2034, 'product', '', '0000-00-00 00:00:00', 1, '8052530222713', 10000, 0, 0, 2.25, 2.25, 2.25, 2.25, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2035, 2035, 'product', '', '0000-00-00 00:00:00', 1, '8107880212911', 10000, 0, 0, 35, 35, 35, 35, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2036, 2036, 'product', '', '0000-00-00 00:00:00', 1, '027736016433', 10000, 0, 0, 6.99, 6.99, 6.99, 6.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2037, 2037, 'product', '', '0000-00-00 00:00:00', 1, '191970108114', 10000, 0, 0, 89.1, 89.1, 89.1, 89.1, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2038, 2038, 'product', '', '0000-00-00 00:00:00', 1, '805253390119', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2039, 2039, 'product', '', '0000-00-00 00:00:00', 1, '191970109111', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2040, 2040, 'product', '', '0000-00-00 00:00:00', 1, '027736016648', 10000, 0, 0, 1.75, 1.75, 1.75, 1.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2041, 2041, 'product', '', '0000-00-00 00:00:00', 1, '8143270100215', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2042, 2042, 'product', '', '0000-00-00 00:00:00', 1, '8143270100222', 10000, 0, 0, 269, 269, 269, 269, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2043, 2043, 'product', '', '0000-00-00 00:00:00', 1, '8143270172212', 10000, 0, 0, 56.95, 56.95, 56.95, 56.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2044, 2044, 'product', '', '0000-00-00 00:00:00', 1, '805253331716', 10000, 0, 0, 299, 299, 299, 299, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2045, 2045, 'product', '', '0000-00-00 00:00:00', 1, '027736025381', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2046, 2046, 'product', '', '0000-00-00 00:00:00', 1, '191970105212', 10000, 0, 0, 13.48, 13.48, 13.48, 13.48, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2047, 2047, 'product', '', '0000-00-00 00:00:00', 1, '8143270174117', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2048, 2048, 'product', '', '0000-00-00 00:00:00', 1, '705108770212', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2049, 2049, 'product', '', '0000-00-00 00:00:00', 1, '191970105311', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2050, 2050, 'product', '', '0000-00-00 00:00:00', 1, '191970108923', 10000, 0, 0, 62.95, 62.95, 62.95, 62.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2051, 2051, 'product', '', '0000-00-00 00:00:00', 1, '805253310810', 10000, 0, 0, 199, 199, 199, 199, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2052, 2052, 'product', '', '0000-00-00 00:00:00', 1, '027736024001', 10000, 0, 0, 1.49, 1.49, 1.49, 1.49, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2053, 2053, 'product', '', '0000-00-00 00:00:00', 1, '805253362819', 10000, 0, 0, 22.95, 22.95, 22.95, 22.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2054, 2054, 'product', '', '0000-00-00 00:00:00', 1, '705108508907', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2055, 2055, 'product', '', '0000-00-00 00:00:00', 1, '705108508914', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2056, 2056, 'product', '', '0000-00-00 00:00:00', 1, '201606802214', 10000, 0, 0, 149, 149, 149, 149, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2057, 2057, 'product', '', '0000-00-00 00:00:00', 1, '715244063529', 10000, 0, 0, 39.95, 39.95, 39.95, 39.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2058, 2058, 'product', '', '0000-00-00 00:00:00', 1, '8052531516712', 10000, 0, 0, 64.95, 64.95, 64.95, 64.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2059, 2059, 'product', '', '0000-00-00 00:00:00', 1, '705108552603', 10000, 0, 0, 189, 189, 189, 189, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2060, 2060, 'product', '', '0000-00-00 00:00:00', 1, '191970116218', 10000, 0, 0, 21.95, 21.95, 21.95, 21.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2061, 2061, 'product', '', '0000-00-00 00:00:00', 1, '715244063918', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2062, 2062, 'product', '', '0000-00-00 00:00:00', 1, '805253407213', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2063, 2063, 'product', '', '0000-00-00 00:00:00', 1, '705108321407', 10000, 0, 0, 28.95, 28.95, 28.95, 28.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2064, 2064, 'product', '', '0000-00-00 00:00:00', 1, '805253364615', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2065, 2065, 'product', '', '0000-00-00 00:00:00', 1, '027736010301', 10000, 0, 0, 79.95, 79.95, 79.95, 79.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2066, 2066, 'product', '', '0000-00-00 00:00:00', 1, '027736040063', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2067, 2067, 'product', '', '0000-00-00 00:00:00', 1, '027736003747', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2068, 2068, 'product', '', '0000-00-00 00:00:00', 1, '027736044252', 10000, 0, 0, 17.95, 17.95, 17.95, 17.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2069, 2069, 'product', '', '0000-00-00 00:00:00', 1, '705108320905', 10000, 0, 0, 89.95, 89.95, 89.95, 89.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2070, 2070, 'product', '', '0000-00-00 00:00:00', 1, '652009001047', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2071, 2071, 'product', '', '0000-00-00 00:00:00', 1, '705108320707', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2072, 2072, 'product', '', '0000-00-00 00:00:00', 1, '6520099000070', 10000, 0, 0, 259, 259, 259, 259, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2073, 2073, 'product', '', '0000-00-00 00:00:00', 1, '652009001115', 10000, 0, 0, 54.95, 54.95, 54.95, 54.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2074, 2074, 'product', '', '0000-00-00 00:00:00', 1, '191970101214', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2075, 2075, 'product', '', '0000-00-00 00:00:00', 1, '705108502066', 10000, 0, 0, 3, 3, 3, 3, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2076, 2076, 'product', '', '0000-00-00 00:00:00', 1, '851866123286', 10000, 0, 0, 3, 3, 3, 3, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2077, 2077, 'product', '', '0000-00-00 00:00:00', 1, '851866125983', 10000, 0, 0, 3, 3, 3, 3, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2078, 2078, 'product', '', '0000-00-00 00:00:00', 1, '851866125976', 10000, 0, 0, 69.95, 69.95, 69.95, 69.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2079, 2079, 'product', '', '0000-00-00 00:00:00', 1, '8352531520413', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2080, 2080, 'product', '', '0000-00-00 00:00:00', 1, '705108803668', 10000, 0, 0, 56.95, 56.95, 56.95, 56.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2081, 2081, 'product', '', '0000-00-00 00:00:00', 1, '652009001054', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2082, 2082, 'product', '', '0000-00-00 00:00:00', 1, '8052532452514', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2083, 2083, 'product', '', '0000-00-00 00:00:00', 1, '220472714684', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2084, 2084, 'product', '', '0000-00-00 00:00:00', 1, '705108554201', 10000, 0, 0, 78.95, 78.95, 78.95, 78.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2085, 2085, 'product', '', '0000-00-00 00:00:00', 1, '191970101412', 10000, 0, 0, 239, 239, 239, 239, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2086, 2086, 'product', '', '0000-00-00 00:00:00', 1, '027736006663', 10000, 0, 0, 34.95, 34.95, 34.95, 34.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2087, 2087, 'product', '', '0000-00-00 00:00:00', 1, '027736007110', 10000, 0, 0, 22.95, 22.95, 22.95, 22.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2088, 2088, 'product', '', '0000-00-00 00:00:00', 1, '027736036394', 10000, 0, 0, 74.95, 74.95, 74.95, 74.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2089, 2089, 'product', '', '0000-00-00 00:00:00', 1, '705108548217', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2090, 2090, 'product', '', '0000-00-00 00:00:00', 1, '705108322503', 10000, 0, 0, 64.95, 64.95, 64.95, 64.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2091, 2091, 'product', '', '0000-00-00 00:00:00', 1, '027736044313', 10000, 0, 0, 32.95, 32.95, 32.95, 32.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2092, 2092, 'product', '', '0000-00-00 00:00:00', 1, '705108804603', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2093, 2093, 'product', '', '0000-00-00 00:00:00', 1, '027736036028', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2094, 2094, 'product', '', '0000-00-00 00:00:00', 1, '8052531205517', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2095, 2095, 'product', '', '0000-00-00 00:00:00', 1, '715244063123', 10000, 0, 0, 49, 49, 49, 49, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2096, 2096, 'product', '', '0000-00-00 00:00:00', 1, '027736044290', 10000, 0, 0, 39.95, 39.95, 39.95, 39.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2097, 2097, 'product', '', '0000-00-00 00:00:00', 1, '027736023424-2097', 10000, 0, 0, 1.25, 1.25, 1.25, 1.25, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 22:19:29'),
(2098, 2098, 'product', '', '0000-00-00 00:00:00', 1, 'W02G4j82zX-2098', 10000, 0, 0, 1.6, 1.6, 1.6, 1.6, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 21:56:06'),
(2099, 2099, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2100, 2100, 'product', '', '0000-00-00 00:00:00', 1, '027736010509', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2101, 2101, 'product', '', '0000-00-00 00:00:00', 1, '191970129317', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2102, 2102, 'product', '', '0000-00-00 00:00:00', 1, '8143270101519', 10000, 0, 0, 62.95, 62.95, 62.95, 62.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2103, 2103, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 1.5, 1.5, 1.5, 1.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2104, 2104, 'product', '', '0000-00-00 00:00:00', 1, '8143270140617', 10000, 0, 0, 2.75, 2.75, 2.75, 2.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2105, 2105, 'product', '', '0000-00-00 00:00:00', 1, '027736032310', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2106, 2106, 'product', '', '0000-00-00 00:00:00', 1, '8052531339113', 10000, 0, 0, 56.95, 56.95, 56.95, 56.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2107, 2107, 'product', '', '0000-00-00 00:00:00', 1, '8052531318613', 10000, 0, 0, 79.95, 79.95, 79.95, 79.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2108, 2108, 'product', '', '0000-00-00 00:00:00', 1, '191970116416', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2109, 2109, 'product', '', '0000-00-00 00:00:00', 1, '8052530130018', 10000, 0, 0, 38.95, 38.95, 38.95, 38.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2110, 2110, 'product', '', '0000-00-00 00:00:00', 1, '805253301795', 10000, 0, 0, 129, 129, 129, 129, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2111, 2111, 'product', '', '0000-00-00 00:00:00', 1, '705108557301', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2112, 2112, 'product', '', '0000-00-00 00:00:00', 1, '027736035755', 10000, 0, 0, 5.95, 5.95, 5.95, 5.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2113, 2113, 'product', '', '0000-00-00 00:00:00', 1, '191970117420', 10000, 0, 0, 18.5, 18.5, 18.5, 18.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2114, 2114, 'product', '', '0000-00-00 00:00:00', 1, '805253329713', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2115, 2115, 'product', '', '0000-00-00 00:00:00', 1, '027736034598', 10000, 0, 0, 4.99, 4.99, 4.99, 4.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2116, 2116, 'product', '', '0000-00-00 00:00:00', 1, '027736040292', 10000, 0, 0, 4.99, 4.99, 4.99, 4.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2117, 2117, 'product', '', '0000-00-00 00:00:00', 1, '027736040308', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2118, 2118, 'product', '', '0000-00-00 00:00:00', 1, '8143270101618', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2119, 2119, 'product', '', '0000-00-00 00:00:00', 1, '027736016495-2119', 10000, 0, 0, 3.75, 3.75, 3.75, 3.75, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 22:21:43'),
(2120, 2120, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2121, 2121, 'product', '', '0000-00-00 00:00:00', 1, '8052530014219', 10000, 0, 0, 149.99, 149.99, 149.99, 149.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2122, 2122, 'product', '', '0000-00-00 00:00:00', 1, '851866079736', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2123, 2123, 'product', '', '0000-00-00 00:00:00', 1, '191970109616', 10000, 0, 0, 21.95, 21.95, 21.95, 21.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2124, 2124, 'product', '', '0000-00-00 00:00:00', 1, '191970109623', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2125, 2125, 'product', '', '0000-00-00 00:00:00', 1, '8143270156618', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2126, 2126, 'product', '', '0000-00-00 00:00:00', 1, '705108804764', 10000, 0, 0, 21.95, 21.95, 21.95, 21.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2127, 2127, 'product', '', '0000-00-00 00:00:00', 1, '715244064267', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2128, 2128, 'product', '', '0000-00-00 00:00:00', 1, '191970101610', 10000, 0, 0, 119, 119, 119, 119, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2129, 2129, 'product', '', '0000-00-00 00:00:00', 1, '705108533107', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2130, 2130, 'product', '', '0000-00-00 00:00:00', 1, '8052531351511', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2131, 2131, 'product', '', '0000-00-00 00:00:00', 1, '715244063925', 10000, 0, 0, 69.95, 69.95, 69.95, 69.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2132, 2132, 'product', '', '0000-00-00 00:00:00', 1, '705108003020', 10000, 0, 0, 44.95, 44.95, 44.95, 44.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2133, 2133, 'product', '', '0000-00-00 00:00:00', 1, '705108801169', 10000, 0, 0, 139.99, 139.99, 139.99, 139.99, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2134, 2134, 'product', '', '0000-00-00 00:00:00', 1, '191970123919', 10000, 0, 0, 7.65, 7.65, 7.65, 7.65, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2135, 2135, 'product', '', '0000-00-00 00:00:00', 1, '8052531600428', 10000, 0, 0, 28.95, 28.95, 28.95, 28.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00');
INSERT INTO `ns_nexopos_products_unit_quantities` (`id`, `product_id`, `type`, `preview_url`, `expiration_date`, `unit_id`, `barcode`, `quantity`, `low_quantity`, `stock_alert_enabled`, `sale_price`, `sale_price_edit`, `sale_price_without_tax`, `sale_price_with_tax`, `sale_price_tax`, `wholesale_price`, `wholesale_price_edit`, `wholesale_price_with_tax`, `wholesale_price_without_tax`, `wholesale_price_tax`, `custom_price`, `custom_price_edit`, `custom_price_with_tax`, `custom_price_without_tax`, `custom_price_tax`, `visible`, `convert_unit_id`, `cogs`, `uuid`, `created_at`, `updated_at`) VALUES
(2136, 2136, 'product', '', '0000-00-00 00:00:00', 1, '705108515905', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2137, 2137, 'product', '', '0000-00-00 00:00:00', 1, '687985269013', 10000, 0, 0, 44.95, 44.95, 44.95, 44.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2138, 2138, 'product', '', '0000-00-00 00:00:00', 1, '027736034093', 10000, 0, 0, 89.95, 89.95, 89.95, 89.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2139, 2139, 'product', '', '0000-00-00 00:00:00', 1, '705108554706', 10000, 0, 0, 48.95, 48.95, 48.95, 48.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2140, 2140, 'product', '', '0000-00-00 00:00:00', 1, '805253302914', 10000, 0, 0, 34.95, 34.95, 34.95, 34.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2141, 2141, 'product', '', '0000-00-00 00:00:00', 1, '027736044184', 10000, 0, 0, 99, 99, 99, 99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2142, 2142, 'product', '', '0000-00-00 00:00:00', 1, '027736011636', 10000, 0, 0, 69.95, 69.95, 69.95, 69.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2143, 2143, 'product', '', '0000-00-00 00:00:00', 1, '687985297917', 10000, 0, 0, 2.98, 2.98, 2.98, 2.98, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2144, 2144, 'product', '', '0000-00-00 00:00:00', 1, '8052530138212', 10000, 0, 0, 39.95, 39.95, 39.95, 39.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2145, 2145, 'product', '', '0000-00-00 00:00:00', 1, '8143270180613', 10000, 0, 0, 149, 149, 149, 149, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2146, 2146, 'product', '', '0000-00-00 00:00:00', 1, '8052531322214', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2147, 2147, 'product', '', '0000-00-00 00:00:00', 1, '715244006809', 10000, 0, 0, 2.98, 2.98, 2.98, 2.98, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2148, 2148, 'product', '', '0000-00-00 00:00:00', 1, '191970110117', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2149, 2149, 'product', '', '0000-00-00 00:00:00', 1, '191970114412', 10000, 0, 0, 2.98, 2.98, 2.98, 2.98, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2150, 2150, 'product', '', '0000-00-00 00:00:00', 1, '805253354814', 10000, 0, 0, 75.6, 75.6, 75.6, 75.6, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2151, 2151, 'product', '', '0000-00-00 00:00:00', 1, '8052531545415', 10000, 0, 0, 39, 39, 39, 39, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2152, 2152, 'product', '', '0000-00-00 00:00:00', 1, '8052531205210', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2153, 2153, 'product', '', '0000-00-00 00:00:00', 1, '8143270183218', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2154, 2154, 'product', '', '0000-00-00 00:00:00', 1, '027736002733-2154', 10000, 0, 0, 1.5, 1.5, 1.5, 1.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 22:23:04'),
(2155, 2155, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 54, 54, 54, 54, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2156, 2156, 'product', '', '0000-00-00 00:00:00', 1, '705108558803', 10000, 0, 0, 169.95, 169.95, 169.95, 169.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2157, 2157, 'product', '', '0000-00-00 00:00:00', 1, '8052531533016', 10000, 0, 0, 7.65, 7.65, 7.65, 7.65, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2158, 2158, 'product', '', '0000-00-00 00:00:00', 1, '027736028856', 10000, 0, 0, 79, 79, 79, 79, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2159, 2159, 'product', '', '0000-00-00 00:00:00', 1, '191970102013', 10000, 0, 0, 74.95, 74.95, 74.95, 74.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2160, 2160, 'product', '', '0000-00-00 00:00:00', 1, '8107880275718', 10000, 0, 0, 74.95, 74.95, 74.95, 74.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2161, 2161, 'product', '', '0000-00-00 00:00:00', 1, '807880275718', 10000, 0, 0, 76.95, 76.95, 76.95, 76.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2162, 2162, 'product', '', '0000-00-00 00:00:00', 1, '805253300392', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2163, 2163, 'product', '', '0000-00-00 00:00:00', 1, '8052530182710', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2164, 2164, 'product', '', '0000-00-00 00:00:00', 1, '805253300057', 10000, 0, 0, 54.95, 54.95, 54.95, 54.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2165, 2165, 'product', '', '0000-00-00 00:00:00', 1, '705108803767', 10000, 0, 0, 299, 299, 299, 299, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2166, 2166, 'product', '', '0000-00-00 00:00:00', 1, '687985901104', 10000, 0, 0, 53, 53, 53, 53, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2167, 2167, 'product', '', '0000-00-00 00:00:00', 1, '8052531507314', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2168, 2168, 'product', '', '0000-00-00 00:00:00', 1, '027736042715', 10000, 0, 0, 2.75, 2.75, 2.75, 2.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2169, 2169, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 53.95, 53.95, 53.95, 53.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2170, 2170, 'product', '', '0000-00-00 00:00:00', 1, '805253312616', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2171, 2171, 'product', '', '0000-00-00 00:00:00', 1, '715244022120', 10000, 0, 0, 22.95, 22.95, 22.95, 22.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2172, 2172, 'product', '', '0000-00-00 00:00:00', 1, '805253368712', 10000, 0, 0, 42.95, 42.95, 42.95, 42.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2173, 2173, 'product', '', '0000-00-00 00:00:00', 1, '191970111114', 10000, 0, 0, 49, 49, 49, 49, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2174, 2174, 'product', '', '0000-00-00 00:00:00', 1, '027736028900', 10000, 0, 0, 84.95, 84.95, 84.95, 84.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2175, 2175, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 8.95, 8.95, 8.95, 8.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2176, 2176, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 0.4, 0.4, 0.4, 0.4, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2177, 2177, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 54.95, 54.95, 54.95, 54.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2178, 2178, 'product', '', '0000-00-00 00:00:00', 1, '715244064182', 10000, 0, 0, 1.25, 1.25, 1.25, 1.25, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2179, 2179, 'product', '', '0000-00-00 00:00:00', 1, '8052530170519', 10000, 0, 0, 1.25, 1.25, 1.25, 1.25, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2180, 2180, 'product', '', '0000-00-00 00:00:00', 1, '027736011681', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2181, 2181, 'product', '', '0000-00-00 00:00:00', 1, '027736011643', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2182, 2182, 'product', '', '0000-00-00 00:00:00', 1, '8143270140624', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2183, 2183, 'product', '', '0000-00-00 00:00:00', 1, '8052530170526', 10000, 0, 0, 1.25, 1.25, 1.25, 1.25, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2184, 2184, 'product', '', '0000-00-00 00:00:00', 1, '8052530170311', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2185, 2185, 'product', '', '0000-00-00 00:00:00', 1, '8143270140822', 10000, 0, 0, 1.25, 1.25, 1.25, 1.25, 0, 0.0090909, 0.01, 0.01, 0.0090909, 0.0009091, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2186, 2186, 'product', '', '0000-00-00 00:00:00', 1, '8143270140815', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2187, 2187, 'product', '', '0000-00-00 00:00:00', 1, '715244060399', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2188, 2188, 'product', '', '0000-00-00 00:00:00', 1, '8052530170328-2188', 10000, 0, 0, 0.99, 0.99, 0.99, 0.99, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:48:05'),
(2189, 2189, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 5.95, 5.95, 5.95, 5.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2190, 2190, 'product', '', '0000-00-00 00:00:00', 1, '027736030125-2190', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:37:08'),
(2191, 2191, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 36.95, 36.95, 36.95, 36.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2192, 2192, 'product', '', '0000-00-00 00:00:00', 1, '805253414938', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2193, 2193, 'product', '', '0000-00-00 00:00:00', 1, '027736032853', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2194, 2194, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 38.95, 38.95, 38.95, 38.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2195, 2195, 'product', '', '0000-00-00 00:00:00', 1, '805253301788', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2196, 2196, 'product', '', '0000-00-00 00:00:00', 1, '652009200006', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2197, 2197, 'product', '', '0000-00-00 00:00:00', 1, '8052536543218', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2198, 2198, 'product', '', '0000-00-00 00:00:00', 1, '8052536543416', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2199, 2199, 'product', '', '0000-00-00 00:00:00', 1, '652001110037', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2200, 2200, 'product', '', '0000-00-00 00:00:00', 1, '652009100009', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2201, 2201, 'product', '', '0000-00-00 00:00:00', 1, '8052536543515', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2202, 2202, 'product', '', '0000-00-00 00:00:00', 1, '8052536543317', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2203, 2203, 'product', '', '0000-00-00 00:00:00', 1, '705108514410', 10000, 0, 0, 44.95, 44.95, 44.95, 44.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2204, 2204, 'product', '', '0000-00-00 00:00:00', 1, '191970101511', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2205, 2205, 'product', '', '0000-00-00 00:00:00', 1, '705108521005', 10000, 0, 0, 2.75, 2.75, 2.75, 2.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2206, 2206, 'product', '', '0000-00-00 00:00:00', 1, '191970113118', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2207, 2207, 'product', '', '0000-00-00 00:00:00', 1, '191970113125', 10000, 0, 0, 2.25, 2.25, 2.25, 2.25, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2208, 2208, 'product', '', '0000-00-00 00:00:00', 1, '705108601905', 10000, 0, 0, 2.75, 2.75, 2.75, 2.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2209, 2209, 'product', '', '0000-00-00 00:00:00', 1, '851866092261', 10000, 0, 0, 48, 48, 48, 48, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2210, 2210, 'product', '', '0000-00-00 00:00:00', 1, '851866092278', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2211, 2211, 'product', '', '0000-00-00 00:00:00', 1, '851866112631', 10000, 0, 0, 1.75, 1.75, 1.75, 1.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2212, 2212, 'product', '', '0000-00-00 00:00:00', 1, '652009908025', 10000, 0, 0, 1.75, 1.75, 1.75, 1.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2213, 2213, 'product', '', '0000-00-00 00:00:00', 1, '8143270131011', 10000, 0, 0, 1.75, 1.75, 1.75, 1.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2214, 2214, 'product', '', '0000-00-00 00:00:00', 1, '8052530220818-2214', 10000, 0, 0, 0.25, 0.25, 0.25, 0.25, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:36:37'),
(2215, 2215, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 1.75, 1.75, 1.75, 1.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2216, 2216, 'product', '', '0000-00-00 00:00:00', 1, '027736011810', 10000, 0, 0, 4.5, 4.5, 4.5, 4.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2217, 2217, 'product', '', '0000-00-00 00:00:00', 1, '705108309740', 10000, 0, 0, 4.5, 4.5, 4.5, 4.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2218, 2218, 'product', '', '0000-00-00 00:00:00', 1, '705108309719', 10000, 0, 0, 4.5, 4.5, 4.5, 4.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2219, 2219, 'product', '', '0000-00-00 00:00:00', 1, '705108309726', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2220, 2220, 'product', '', '0000-00-00 00:00:00', 1, '705108309702', 10000, 0, 0, 0.4, 0.4, 0.4, 0.4, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2221, 2221, 'product', '', '0000-00-00 00:00:00', 1, '95545122522', 10000, 0, 0, 3.75, 3.75, 3.75, 3.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2222, 2222, 'product', '', '0000-00-00 00:00:00', 1, '8052530221723', 10000, 0, 0, 17.95, 17.95, 17.95, 17.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2223, 2223, 'product', '', '0000-00-00 00:00:00', 1, '687985435418', 10000, 0, 0, 7.99, 7.99, 7.99, 7.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2224, 2224, 'product', '', '0000-00-00 00:00:00', 1, '8052531337614', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2225, 2225, 'product', '', '0000-00-00 00:00:00', 1, '8052530015520-2225', 10000, 0, 0, 5.5, 5.5, 5.5, 5.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 22:24:34'),
(2226, 2226, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 37.5, 37.5, 37.5, 37.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2227, 2227, 'product', '', '0000-00-00 00:00:00', 1, '13995009415', 10000, 0, 0, 3.25, 3.25, 3.25, 3.25, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2228, 2228, 'product', '', '0000-00-00 00:00:00', 1, '027736026821', 10000, 0, 0, 18.95, 18.95, 18.95, 18.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2229, 2229, 'product', '', '0000-00-00 00:00:00', 1, '705108514304', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2230, 2230, 'product', '', '0000-00-00 00:00:00', 1, '027736017201', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2231, 2231, 'product', '', '0000-00-00 00:00:00', 1, '027736035564', 10000, 0, 0, 28.95, 28.95, 28.95, 28.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2232, 2232, 'product', '', '0000-00-00 00:00:00', 1, '027736014309-2232', 10000, 0, 0, 16, 16, 16, 16, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:42:38'),
(2233, 2233, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 0, 0, 0, 0, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2234, 2234, 'product', '', '0000-00-00 00:00:00', 1, '8052531514916', 10000, 0, 0, 110.95, 110.95, 110.95, 110.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2235, 2235, 'product', '', '0000-00-00 00:00:00', 1, '8052531544517-2235', 10000, 0, 0, 0.63, 0.63, 0.63, 0.63, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:35:52'),
(2236, 2236, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 0.99, 0.99, 0.99, 0.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2237, 2237, 'product', '', '0000-00-00 00:00:00', 1, '8107880213215', 10000, 0, 0, 0.99, 0.99, 0.99, 0.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2238, 2238, 'product', '', '0000-00-00 00:00:00', 1, '8052531604815', 10000, 0, 0, 69, 69, 69, 69, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2239, 2239, 'product', '', '0000-00-00 00:00:00', 1, '027736035816', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2240, 2240, 'product', '', '0000-00-00 00:00:00', 1, '705108321315', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2241, 2241, 'product', '', '0000-00-00 00:00:00', 1, '705108321322', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2242, 2242, 'product', '', '0000-00-00 00:00:00', 1, '705108321346', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2243, 2243, 'product', '', '0000-00-00 00:00:00', 1, '705108321339', 10000, 0, 0, 4.5, 4.5, 4.5, 4.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2244, 2244, 'product', '', '0000-00-00 00:00:00', 1, '705108309733', 10000, 0, 0, 0, 0, 0, 0, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2245, 2245, 'product', '', '0000-00-00 00:00:00', 1, '705108309740', 10000, 0, 0, 4.5, 4.5, 4.5, 4.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2246, 2246, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 28.95, 28.95, 28.95, 28.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2247, 2247, 'product', '', '0000-00-00 00:00:00', 1, '705108308804', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2248, 2248, 'product', '', '0000-00-00 00:00:00', 1, '705108320202', 10000, 0, 0, 39, 39, 39, 39, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2249, 2249, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 21.95, 21.95, 21.95, 21.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2250, 2250, 'product', '', '0000-00-00 00:00:00', 1, '191970125418', 10000, 0, 0, 119, 119, 119, 119, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2251, 2251, 'product', '', '0000-00-00 00:00:00', 1, '8107880281313', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2252, 2252, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2253, 2253, 'product', '', '0000-00-00 00:00:00', 1, '8052531337317', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2254, 2254, 'product', '', '0000-00-00 00:00:00', 1, '705108202706-2254', 10000, 0, 0, 0.99, 0.99, 0.99, 0.99, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:14:35'),
(2255, 2255, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 4.99, 4.99, 4.99, 4.99, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2256, 2256, 'product', '', '0000-00-00 00:00:00', 1, '027736011520', 10000, 0, 0, 15.95, 15.95, 15.95, 15.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2257, 2257, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2258, 2258, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 2.5, 2.5, 2.5, 2.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2259, 2259, 'product', '', '0000-00-00 00:00:00', 1, '8052530212318', 10000, 0, 0, 2.5, 2.5, 2.5, 2.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2260, 2260, 'product', '', '0000-00-00 00:00:00', 1, '805253421233', 10000, 0, 0, 39.95, 39.95, 39.95, 39.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2261, 2261, 'product', '', '0000-00-00 00:00:00', 1, '652009004123', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2262, 2262, 'product', '', '0000-00-00 00:00:00', 1, '705108554102', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2263, 2263, 'product', '', '0000-00-00 00:00:00', 1, '851866105831', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2264, 2264, 'product', '', '0000-00-00 00:00:00', 1, '805253421400', 10000, 0, 0, 6.55, 6.55, 6.55, 6.55, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2265, 2265, 'product', '', '0000-00-00 00:00:00', 1, '8052530163122', 10000, 0, 0, 3.5, 3.5, 3.5, 3.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2266, 2266, 'product', '', '0000-00-00 00:00:00', 1, '8052530163115', 10000, 0, 0, 69, 69, 69, 69, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2267, 2267, 'product', '', '0000-00-00 00:00:00', 1, '901003740019', 10000, 0, 0, 69.95, 69.95, 69.95, 69.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2268, 2268, 'product', '', '0000-00-00 00:00:00', 1, '705108554409', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2269, 2269, 'product', '', '0000-00-00 00:00:00', 1, '8143270113017', 10000, 0, 0, 149, 149, 149, 149, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2270, 2270, 'product', '', '0000-00-00 00:00:00', 1, '851866082552', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2271, 2271, 'product', '', '0000-00-00 00:00:00', 1, '8052531333913', 10000, 0, 0, 22.95, 22.95, 22.95, 22.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2272, 2272, 'product', '', '0000-00-00 00:00:00', 1, '705108001217', 10000, 0, 0, 36.95, 36.95, 36.95, 36.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2273, 2273, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 109, 109, 109, 109, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2274, 2274, 'product', '', '0000-00-00 00:00:00', 1, '705108553006', 10000, 0, 0, 74.95, 74.95, 74.95, 74.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2275, 2275, 'product', '', '0000-00-00 00:00:00', 1, '8052530040416', 10000, 0, 0, 24, 24, 24, 24, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2276, 2276, 'product', '', '0000-00-00 00:00:00', 1, '8052532451517', 10000, 0, 0, 74.95, 74.95, 74.95, 74.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2277, 2277, 'product', '', '0000-00-00 00:00:00', 1, '027736014781', 10000, 0, 0, 0, 0, 0, 0, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2278, 2278, 'product', '', '0000-00-00 00:00:00', 1, '652009003539', 10000, 0, 0, 59, 59, 59, 59, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2279, 2279, 'product', '', '0000-00-00 00:00:00', 1, '805253406513', 10000, 0, 0, 18.95, 18.95, 18.95, 18.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2280, 2280, 'product', '', '0000-00-00 00:00:00', 1, '97138663191', 10000, 0, 0, 0, 0, 0, 0, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2281, 2281, 'product', '', '0000-00-00 00:00:00', 1, 'zJBusP7w0S-2281', 10000, 0, 0, 1.69, 1.69, 1.69, 1.69, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-30 23:46:42'),
(2282, 2282, 'product', '', '0000-00-00 00:00:00', 1, '652009960924', 10000, 0, 0, 0, 0, 0, 0, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2283, 2283, 'product', '', '0000-00-00 00:00:00', 1, '8052530221617', 10000, 0, 0, 0, 0, 0, 0, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2284, 2284, 'product', '', '0000-00-00 00:00:00', 1, '705108546107', 10000, 0, 0, 54.95, 54.95, 54.95, 54.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2285, 2285, 'product', '', '0000-00-00 00:00:00', 1, '027736028146', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2286, 2286, 'product', '', '0000-00-00 00:00:00', 1, '705108805402', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2287, 2287, 'product', '', '0000-00-00 00:00:00', 1, '8052530147818', 10000, 0, 0, 39.95, 39.95, 39.95, 39.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2288, 2288, 'product', '', '0000-00-00 00:00:00', 1, '8052530140819', 10000, 0, 0, 39.95, 39.95, 39.95, 39.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2289, 2289, 'product', '', '0000-00-00 00:00:00', 1, '027736013845', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2290, 2290, 'product', '', '0000-00-00 00:00:00', 1, '705108321605', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2291, 2291, 'product', '', '0000-00-00 00:00:00', 1, '687985200214', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2292, 2292, 'product', '', '0000-00-00 00:00:00', 1, '027736003037', 10000, 0, 0, 79.95, 79.95, 79.95, 79.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2293, 2293, 'product', '', '0000-00-00 00:00:00', 1, '027736038763', 10000, 0, 0, 34.95, 34.95, 34.95, 34.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2294, 2294, 'product', '', '0000-00-00 00:00:00', 1, '027736032686', 10000, 0, 0, 54.95, 54.95, 54.95, 54.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2295, 2295, 'product', '', '0000-00-00 00:00:00', 1, '705108539000', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2296, 2296, 'product', '', '0000-00-00 00:00:00', 1, '8052531145318', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2297, 2297, 'product', '', '0000-00-00 00:00:00', 1, '027736014859', 10000, 0, 0, 89, 89, 89, 89, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2298, 2298, 'product', '', '0000-00-00 00:00:00', 1, '705108553204', 10000, 0, 0, 64.95, 64.95, 64.95, 64.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2299, 2299, 'product', '', '0000-00-00 00:00:00', 1, '705108520701', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2300, 2300, 'product', '', '0000-00-00 00:00:00', 1, '805253400214', 10000, 0, 0, 39.95, 39.95, 39.95, 39.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2301, 2301, 'product', '', '0000-00-00 00:00:00', 1, '715244105212', 10000, 0, 0, 22.95, 22.95, 22.95, 22.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2302, 2302, 'product', '', '0000-00-00 00:00:00', 1, '8052531146919', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2303, 2303, 'product', '', '0000-00-00 00:00:00', 1, '8052531323716', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2304, 2304, 'product', '', '0000-00-00 00:00:00', 1, '705108603008', 10000, 0, 0, 44.95, 44.95, 44.95, 44.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2305, 2305, 'product', '', '0000-00-00 00:00:00', 1, '705108600663', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2306, 2306, 'product', '', '0000-00-00 00:00:00', 1, '705108804900', 10000, 0, 0, 139, 139, 139, 139, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2307, 2307, 'product', '', '0000-00-00 00:00:00', 1, '805253300354', 10000, 0, 0, 72.95, 72.95, 72.95, 72.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2308, 2308, 'product', '', '0000-00-00 00:00:00', 1, '8052530163214', 10000, 0, 0, 0.75, 0.75, 0.75, 0.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2309, 2309, 'product', '', '0000-00-00 00:00:00', 1, '8143270135118', 10000, 0, 0, 0.75, 0.75, 0.75, 0.75, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2310, 2310, 'product', '', '0000-00-00 00:00:00', 1, '8052530163221', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2311, 2311, 'product', '', '0000-00-00 00:00:00', 1, '805253336216', 10000, 0, 0, 53.95, 53.95, 53.95, 53.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2312, 2312, 'product', '', '0000-00-00 00:00:00', 1, '715244018109', 10000, 0, 0, 2.5, 2.5, 2.5, 2.5, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2313, 2313, 'product', '', '0000-00-00 00:00:00', 1, '715244108107', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2314, 2314, 'product', '', '0000-00-00 00:00:00', 1, '027736028542', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2315, 2315, 'product', '', '0000-00-00 00:00:00', 1, '705108554508', 10000, 0, 0, 69.95, 69.95, 69.95, 69.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2316, 2316, 'product', '', '0000-00-00 00:00:00', 1, '805253336612', 10000, 0, 0, 5.95, 5.95, 5.95, 5.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2317, 2317, 'product', '', '0000-00-00 00:00:00', 1, '8107880222514', 10000, 0, 0, 129, 129, 129, 129, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2318, 2318, 'product', '', '0000-00-00 00:00:00', 1, '027736044276', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2319, 2319, 'product', '', '0000-00-00 00:00:00', 1, '027736007134', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2320, 2320, 'product', '', '0000-00-00 00:00:00', 1, 'H75T2iiCAq-2320', 10000, 0, 0, 5.95, 5.95, 5.95, 5.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 22:25:58'),
(2321, 2321, 'product', '', '0000-00-00 00:00:00', 1, '8107880280415', 10000, 0, 0, 44.95, 44.95, 44.95, 44.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2322, 2322, 'product', '', '0000-00-00 00:00:00', 1, '8107880214014', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2323, 2323, 'product', '', '0000-00-00 00:00:00', 1, '652009955951', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2324, 2324, 'product', '', '0000-00-00 00:00:00', 1, '027736011841', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2325, 2325, 'product', '', '0000-00-00 00:00:00', 1, '8052530100912', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2326, 2326, 'product', '', '0000-00-00 00:00:00', 1, 'nQDcHrXXrA-2326', 10000, 0, 0, 0.75, 0.75, 0.75, 0.75, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-12-01 22:27:15'),
(2327, 2327, 'product', '', '0000-00-00 00:00:00', 1, '80525313283', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2328, 2328, 'product', '', '0000-00-00 00:00:00', 1, '705108551903', 10000, 0, 0, 52, 52, 52, 52, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2329, 2329, 'product', '', '0000-00-00 00:00:00', 1, '851866027812', 10000, 0, 0, 169, 169, 169, 169, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2330, 2330, 'product', '', '0000-00-00 00:00:00', 1, '652009004147', 10000, 0, 0, 69.95, 69.95, 69.95, 69.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2331, 2331, 'product', '', '0000-00-00 00:00:00', 1, '8052531341918', 10000, 0, 0, 24.95, 24.95, 24.95, 24.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2332, 2332, 'product', '', '0000-00-00 00:00:00', 1, '705108603503', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2333, 2333, 'product', '', '0000-00-00 00:00:00', 1, '191970119110', 10000, 0, 0, 42.95, 42.95, 42.95, 42.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2334, 2334, 'product', '', '0000-00-00 00:00:00', 1, '851866126027', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2335, 2335, 'product', '', '0000-00-00 00:00:00', 1, '851866126003', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2336, 2336, 'product', '', '0000-00-00 00:00:00', 1, '851866125082', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2337, 2337, 'product', '', '0000-00-00 00:00:00', 1, '851866125990', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2338, 2338, 'product', '', '0000-00-00 00:00:00', 1, '851866126010', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2339, 2339, 'product', '', '0000-00-00 00:00:00', 1, '636233391463', 10000, 0, 0, 169, 169, 169, 169, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2340, 2340, 'product', '', '0000-00-00 00:00:00', 1, '652009001085', 10000, 0, 0, 849, 849, 849, 849, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2341, 2341, 'product', '', '0000-00-00 00:00:00', 1, '997215079797', 10000, 0, 0, 189, 189, 189, 189, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2342, 2342, 'product', '', '0000-00-00 00:00:00', 1, '805253023680', 10000, 0, 0, 459, 459, 459, 459, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2343, 2343, 'product', '', '0000-00-00 00:00:00', 1, '705108804665', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2344, 2344, 'product', '', '0000-00-00 00:00:00', 1, '705108804665', 10000, 0, 0, 99.9, 99.9, 99.9, 99.9, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2345, 2345, 'product', '', '0000-00-00 00:00:00', 1, '8052532451319', 10000, 0, 0, 169, 169, 169, 169, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2346, 2346, 'product', '', '0000-00-00 00:00:00', 1, '8052530040119', 10000, 0, 0, 169, 169, 169, 169, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2347, 2347, 'product', '', '0000-00-00 00:00:00', 1, '027736044207', 10000, 0, 0, 119, 119, 119, 119, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2348, 2348, 'product', '', '0000-00-00 00:00:00', 1, '705108602902', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2349, 2349, 'product', '', '0000-00-00 00:00:00', 1, '687985908806', 10000, 0, 0, 799, 799, 799, 799, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2350, 2350, 'product', '', '0000-00-00 00:00:00', 1, '027736011384', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2351, 2351, 'product', '', '0000-00-00 00:00:00', 1, '8143270161216', 10000, 0, 0, 169, 169, 169, 169, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2352, 2352, 'product', '', '0000-00-00 00:00:00', 1, '715244064380', 10000, 0, 0, 139, 139, 139, 139, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2353, 2353, 'product', '', '0000-00-00 00:00:00', 1, '191970115518', 10000, 0, 0, 79, 79, 79, 79, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2354, 2354, 'product', '', '0000-00-00 00:00:00', 1, '805253312012', 10000, 0, 0, 0, 0, 0, 0, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2355, 2355, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 0, 0, 0, 0, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2356, 2356, 'product', '', '0000-00-00 00:00:00', 1, '325886730918', 10000, 0, 0, 159, 159, 159, 159, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2357, 2357, 'product', '', '0000-00-00 00:00:00', 1, '715244964376', 10000, 0, 0, 159, 159, 159, 159, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2358, 2358, 'product', '', '0000-00-00 00:00:00', 1, '715244008414', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2359, 2359, 'product', '', '0000-00-00 00:00:00', 1, '80525313182', 10000, 0, 0, 62, 62, 62, 62, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2360, 2360, 'product', '', '0000-00-00 00:00:00', 1, '8052531318217', 10000, 0, 0, 62, 62, 62, 62, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2361, 2361, 'product', '', '0000-00-00 00:00:00', 1, '805253389915', 10000, 0, 0, 69.95, 69.95, 69.95, 69.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2362, 2362, 'product', '', '0000-00-00 00:00:00', 1, '805253312814', 10000, 0, 0, 58, 58, 58, 58, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2363, 2363, 'product', '', '0000-00-00 00:00:00', 1, '8052531342311', 10000, 0, 0, 18.95, 18.95, 18.95, 18.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2364, 2364, 'product', '', '0000-00-00 00:00:00', 1, '027736028603', 10000, 0, 0, 23.95, 23.95, 23.95, 23.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00');
INSERT INTO `ns_nexopos_products_unit_quantities` (`id`, `product_id`, `type`, `preview_url`, `expiration_date`, `unit_id`, `barcode`, `quantity`, `low_quantity`, `stock_alert_enabled`, `sale_price`, `sale_price_edit`, `sale_price_without_tax`, `sale_price_with_tax`, `sale_price_tax`, `wholesale_price`, `wholesale_price_edit`, `wholesale_price_with_tax`, `wholesale_price_without_tax`, `wholesale_price_tax`, `custom_price`, `custom_price_edit`, `custom_price_with_tax`, `custom_price_without_tax`, `custom_price_tax`, `visible`, `convert_unit_id`, `cogs`, `uuid`, `created_at`, `updated_at`) VALUES
(2365, 2365, 'product', '', '0000-00-00 00:00:00', 1, '027736009282', 10000, 0, 0, 18.95, 18.95, 18.95, 18.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2366, 2366, 'product', '', '0000-00-00 00:00:00', 1, '027736010486', 10000, 0, 0, 139, 139, 139, 139, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2367, 2367, 'product', '', '0000-00-00 00:00:00', 1, '705108401703', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2368, 2368, 'product', '', '0000-00-00 00:00:00', 1, '027736040025', 10000, 0, 0, 18.95, 18.95, 18.95, 18.95, 0, 0.01, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2369, 2369, 'product', '', '0000-00-00 00:00:00', 1, '805253303256', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2370, 2370, 'product', '', '0000-00-00 00:00:00', 1, '705108556601', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2371, 2371, 'product', '', '0000-00-00 00:00:00', 1, '027736018901', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2372, 2372, 'product', '', '0000-00-00 00:00:00', 1, '027736033492', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2373, 2373, 'product', '', '0000-00-00 00:00:00', 1, '191970109722', 10000, 0, 0, 39.95, 39.95, 39.95, 39.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2374, 2374, 'product', '', '0000-00-00 00:00:00', 1, '191970109715', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2375, 2375, 'product', '', '0000-00-00 00:00:00', 1, '191970120710', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2376, 2376, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 39.95, 39.95, 39.95, 39.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2377, 2377, 'product', '', '0000-00-00 00:00:00', 1, '027736040667', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2378, 2378, 'product', '', '0000-00-00 00:00:00', 1, '027736023462', 10000, 0, 0, 18.48, 18.48, 18.48, 18.48, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2379, 2379, 'product', '', '0000-00-00 00:00:00', 1, '027736003709', 10000, 0, 0, 2.25, 2.25, 2.25, 2.25, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2380, 2380, 'product', '', '0000-00-00 00:00:00', 1, '027736003716', 10000, 0, 0, 2.25, 2.25, 2.25, 2.25, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2381, 2381, 'product', '', '0000-00-00 00:00:00', 1, '027736034048', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', '2022-05-08 01:43:00', '2025-11-28 07:05:00'),
(2382, 2382, 'product', '', '0000-00-00 00:00:00', 1, 'RTgvq8vlMu-2382', 10000, 0, 0, 2.5, 2.5, 2.5, 2.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2024-12-21 20:00:20', '2025-11-30 23:24:46'),
(2383, 2383, 'product', '', '0000-00-00 00:00:00', 1, '027736011537', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.1, 0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2024-12-23 23:25:17', '2025-11-28 07:05:00'),
(2384, 2384, 'product', '', '0000-00-00 00:00:00', 1, '027736034031', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.1, 0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2024-12-23 23:57:59', '2025-11-28 07:05:00'),
(2385, 2385, 'product', '', '0000-00-00 00:00:00', 1, '027736042142', 10000, 0, 0, 13.48, 13.48, 13.48, 13.48, 0, 0.1, 0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2024-12-24 00:04:04', '2025-11-28 07:05:00'),
(2386, 2386, 'product', '', '0000-00-00 00:00:00', 1, '027736042791', 10000, 0, 0, 89, 89, 89, 89, 0, 0.1, 0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2024-12-24 00:06:36', '2025-11-28 07:05:00'),
(2387, 2387, 'product', '', '0000-00-00 00:00:00', 1, '027736011360', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.1, 0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2024-12-24 00:09:42', '2025-11-28 07:05:00'),
(2388, 2388, 'product', '', '0000-00-00 00:00:00', 1, 'XRZITJxYTW-2388', 10000, 0, 0, 1.99, 1.99, 1.99, 1.99, 0, 0.1, 0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2024-12-24 00:22:16', '2025-11-30 23:58:22'),
(2389, 2389, 'product', '', '0000-00-00 00:00:00', 1, 'pFz6VYgUQd-2389', 10000, 0, 0, 1.5, 1.5, 1.5, 1.5, 0, 0.1, 0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2024-12-24 02:04:00', '2025-12-01 22:31:36'),
(2390, 2390, 'product', '', '0000-00-00 00:00:00', 1, '027736036592', 10000, 0, 0, 1.75, 1.75, 1.75, 1.75, 0, 0.1, 0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2024-12-24 02:07:52', '2025-11-28 07:05:00'),
(2391, 2391, 'product', '', '0000-00-00 00:00:00', 1, '027736000104', 10000, 0, 0, 36.95, 36.95, 36.95, 36.95, 0, 0.1, 0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2024-12-24 02:15:54', '2025-11-28 07:05:00'),
(2392, 2392, 'product', '', '0000-00-00 00:00:00', 1, '027736016426', 10000, 0, 0, 0.99, 0.99, 0.99, 0.99, 0, 0.1, 0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2024-12-24 02:18:35', '2025-11-28 07:05:00'),
(2393, 2393, 'product', '', '0000-00-00 00:00:00', 1, '027736022977', 10000, 0, 0, 0.99, 0.99, 0.99, 0.99, 0, 0.1, 0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2024-12-24 02:19:57', '2025-11-28 07:05:00'),
(2394, 2394, 'product', '', '0000-00-00 00:00:00', 1, '027736044399', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.1, 0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2024-12-24 23:12:07', '2025-11-28 07:05:00'),
(2395, 2395, 'product', '', '0000-00-00 00:00:00', 1, '027736042784', 10000, 0, 0, 89, 89, 89, 89, 0, 0.1, 0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2024-12-27 22:14:17', '2025-11-28 07:05:00'),
(2396, 2396, 'product', '', '0000-00-00 00:00:00', 1, '13995009408', 10000, 0, 0, 3.48, 3.48, 3.48, 3.48, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2024-12-28 01:10:17', '2025-11-28 07:05:00'),
(2397, 2397, 'product', '', '0000-00-00 00:00:00', 1, '027736026845', 10000, 0, 0, 3.48, 3.48, 3.48, 3.48, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 19:34:26', '2025-11-28 07:05:00'),
(2398, 2398, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 56, 56, 56, 56, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 19:42:34', '2025-11-28 07:05:00'),
(2399, 2399, 'product', '', '0000-00-00 00:00:00', 1, '80525331631', 10000, 0, 0, 67.46, 67.46, 67.46, 67.46, 0, 0.1, 0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 19:45:44', '2025-11-28 07:05:00'),
(2400, 2400, 'product', '', '0000-00-00 00:00:00', 1, '805253316317', 10000, 0, 0, 67.46, 67.46, 67.46, 67.46, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 19:47:40', '2025-11-28 07:05:00'),
(2401, 2401, 'product', '', '0000-00-00 00:00:00', 1, '705108518203', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 19:49:00', '2025-11-28 07:05:00'),
(2402, 2402, 'product', '', '0000-00-00 00:00:00', 1, '8143270168413', 10000, 0, 0, 59, 59, 59, 59, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 19:50:32', '2025-11-28 07:05:00'),
(2403, 2403, 'product', '', '0000-00-00 00:00:00', 1, '652009103390', 10000, 0, 0, 84.75, 84.75, 84.75, 84.75, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:04:42', '2025-11-28 07:05:00'),
(2404, 2404, 'product', '', '0000-00-00 00:00:00', 1, '652009003454', 10000, 0, 0, 2.75, 2.75, 2.75, 2.75, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:07:32', '2025-11-28 07:05:00'),
(2405, 2405, 'product', '', '0000-00-00 00:00:00', 1, '027736037360', 10000, 0, 0, 58.95, 58.95, 58.95, 58.95, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:12:36', '2025-11-28 07:05:00'),
(2406, 2406, 'product', '', '0000-00-00 00:00:00', 1, '851866123989', 10000, 0, 0, 129, 129, 129, 129, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:13:33', '2025-11-28 07:05:00'),
(2407, 2407, 'product', '', '0000-00-00 00:00:00', 1, '805253365414', 10000, 0, 0, 67.95, 67.95, 67.95, 67.95, 0, 0.1, 0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:19:45', '2025-11-28 07:05:00'),
(2408, 2408, 'product', '', '0000-00-00 00:00:00', 1, '705108804160', 10000, 0, 0, 54.95, 54.95, 54.95, 54.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:21:15', '2025-11-28 07:05:00'),
(2409, 2409, 'product', '', '0000-00-00 00:00:00', 1, '805253391918', 10000, 0, 0, 28.95, 28.95, 28.95, 28.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:22:19', '2025-11-28 07:05:00'),
(2410, 2410, 'product', '', '0000-00-00 00:00:00', 1, 'fyl6rdUlgs-2410', 10000, 0, 0, 1.99, 1.99, 1.99, 1.99, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:23:30', '2025-11-30 23:13:57'),
(2411, 2411, 'product', '', '0000-00-00 00:00:00', 1, '805253154025', 10000, 0, 0, 51.95, 51.95, 51.95, 51.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:25:02', '2025-11-28 07:05:00'),
(2412, 2412, 'product', '', '0000-00-00 00:00:00', 1, '8052531540212', 10000, 0, 0, 51.95, 51.95, 51.95, 51.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:27:22', '2025-11-28 07:05:00'),
(2413, 2413, 'product', '', '0000-00-00 00:00:00', 1, '027736042678', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:28:51', '2025-11-28 07:05:00'),
(2414, 2414, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 2.25, 2.25, 2.25, 2.25, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:29:46', '2025-11-28 07:05:00'),
(2415, 2415, 'product', '', '0000-00-00 00:00:00', 1, '191970115914', 10000, 0, 0, 119, 119, 119, 119, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:31:01', '2025-11-28 07:05:00'),
(2416, 2416, 'product', '', '0000-00-00 00:00:00', 1, '8052531504016', 10000, 0, 0, 179.1, 179.1, 179.1, 179.1, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:32:09', '2025-11-28 07:05:00'),
(2417, 2417, 'product', '', '0000-00-00 00:00:00', 1, '805253300330', 10000, 0, 0, 71, 71, 71, 71, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:35:09', '2025-11-28 07:05:00'),
(2418, 2418, 'product', '', '0000-00-00 00:00:00', 1, '8143270162619', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:38:22', '2025-11-28 07:05:00'),
(2419, 2419, 'product', '', '0000-00-00 00:00:00', 1, '191970131716', 10000, 0, 0, 18.95, 18.95, 18.95, 18.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:39:13', '2025-11-28 07:05:00'),
(2420, 2420, 'product', '', '0000-00-00 00:00:00', 1, '652009004109', 10000, 0, 0, 69.95, 69.95, 69.95, 69.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:40:22', '2025-11-28 07:05:00'),
(2421, 2421, 'product', '', '0000-00-00 00:00:00', 1, '899280444227', 10000, 0, 0, 69.95, 69.95, 69.95, 69.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:41:46', '2025-11-28 07:05:00'),
(2422, 2422, 'product', '', '0000-00-00 00:00:00', 1, '8052531203810', 10000, 0, 0, 2.49, 2.49, 2.49, 2.49, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:42:54', '2025-11-28 07:05:00'),
(2423, 2423, 'product', '', '0000-00-00 00:00:00', 1, '8052531203919', 10000, 0, 0, 2.5, 2.5, 2.5, 2.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:45:31', '2025-11-28 07:05:00'),
(2424, 2424, 'product', '', '0000-00-00 00:00:00', 1, '027736022953', 10000, 0, 0, 4.95, 4.95, 4.95, 4.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:47:04', '2025-11-28 07:05:00'),
(2425, 2425, 'product', '', '0000-00-00 00:00:00', 1, '8052530046913', 10000, 0, 0, 54.95, 54.95, 54.95, 54.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:48:18', '2025-11-28 07:05:00'),
(2426, 2426, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 79.95, 79.95, 79.95, 79.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:50:03', '2025-11-28 07:05:00'),
(2427, 2427, 'product', '', '0000-00-00 00:00:00', 1, '8143270131417-2427', 10000, 0, 0, 4.95, 4.95, 4.95, 4.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:51:04', '2025-11-30 23:17:40'),
(2428, 2428, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 1.25, 1.25, 1.25, 1.25, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:52:31', '2025-11-28 07:05:00'),
(2429, 2429, 'product', '', '0000-00-00 00:00:00', 1, '8107880244615', 10000, 0, 0, 129.95, 129.95, 129.95, 129.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:55:19', '2025-11-28 07:05:00'),
(2430, 2430, 'product', '', '0000-00-00 00:00:00', 1, '705108804108', 10000, 0, 0, 34.95, 34.95, 34.95, 34.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 20:57:53', '2025-11-28 07:05:00'),
(2431, 2431, 'product', '', '0000-00-00 00:00:00', 1, '715244062782', 10000, 0, 0, 6.95, 6.95, 6.95, 6.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 21:00:11', '2025-11-28 07:05:00'),
(2432, 2432, 'product', '', '0000-00-00 00:00:00', 1, '027736034345', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 21:02:01', '2025-11-28 07:05:00'),
(2433, 2433, 'product', '', '0000-00-00 00:00:00', 1, '8052531530312', 10000, 0, 0, 197.95, 197.95, 197.95, 197.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 21:03:34', '2025-11-28 07:05:00'),
(2434, 2434, 'product', '', '0000-00-00 00:00:00', 1, '514677002163', 10000, 0, 0, 21.95, 21.95, 21.95, 21.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 21:05:29', '2025-11-28 07:05:00'),
(2435, 2435, 'product', '', '0000-00-00 00:00:00', 1, '805253300439', 10000, 0, 0, 224.1, 224.1, 224.1, 224.1, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 21:06:49', '2025-11-28 07:05:00'),
(2436, 2436, 'product', '', '0000-00-00 00:00:00', 1, '805253350816', 10000, 0, 0, 67.95, 67.95, 67.95, 67.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 21:11:20', '2025-11-28 07:05:00'),
(2437, 2437, 'product', '', '0000-00-00 00:00:00', 1, '8052530142714', 10000, 0, 0, 269, 269, 269, 269, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 21:15:40', '2025-11-28 07:05:00'),
(2438, 2438, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 21:17:46', '2025-11-28 07:05:00'),
(2439, 2439, 'product', '', '0000-00-00 00:00:00', 1, '191970110919', 10000, 0, 0, 13.4, 13.4, 13.4, 13.4, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 21:18:52', '2025-11-28 07:05:00'),
(2440, 2440, 'product', '', '0000-00-00 00:00:00', 1, '705108534500', 10000, 0, 0, 149, 149, 149, 149, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 21:21:07', '2025-11-28 07:05:00'),
(2441, 2441, 'product', '', '0000-00-00 00:00:00', 1, '705108701360', 10000, 0, 0, 5.5, 5.5, 5.5, 5.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-04 21:22:54', '2025-11-28 07:05:00'),
(2442, 2442, 'product', '', '0000-00-00 00:00:00', 1, '805253330818', 10000, 0, 0, 80.95, 80.95, 80.95, 80.95, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 14:46:14', '2025-11-28 07:05:00'),
(2443, 2443, 'product', '', '0000-00-00 00:00:00', 1, '191970124015', 10000, 0, 0, 159, 159, 159, 159, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 14:48:13', '2025-11-28 07:05:00'),
(2444, 2444, 'product', '', '0000-00-00 00:00:00', 1, '805253375499', 10000, 0, 0, 199, 199, 199, 199, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 14:49:18', '2025-11-28 07:05:00'),
(2445, 2445, 'product', '', '0000-00-00 00:00:00', 1, '8052532451418', 10000, 0, 0, 129.95, 129.95, 129.95, 129.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 14:50:40', '2025-11-28 07:05:00'),
(2446, 2446, 'product', '', '0000-00-00 00:00:00', 1, '8052530040218', 10000, 0, 0, 129.95, 129.95, 129.95, 129.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 14:54:35', '2025-11-28 07:05:00'),
(2447, 2447, 'product', '', '0000-00-00 00:00:00', 1, '191970122318', 10000, 0, 0, 199, 199, 199, 199, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 15:00:27', '2025-11-28 07:05:00'),
(2448, 2448, 'product', '', '0000-00-00 00:00:00', 1, '805253364912', 10000, 0, 0, 51.95, 51.95, 51.95, 51.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 15:01:16', '2025-11-28 07:05:00'),
(2449, 2449, 'product', '', '0000-00-00 00:00:00', 1, '705108802968', 10000, 0, 0, 54.95, 54.95, 54.95, 54.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 15:02:10', '2025-11-28 07:05:00'),
(2450, 2450, 'product', '', '0000-00-00 00:00:00', 1, '8143270164217', 10000, 0, 0, 56.95, 56.95, 56.95, 56.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 15:03:56', '2025-11-28 07:05:00'),
(2451, 2451, 'product', '', '0000-00-00 00:00:00', 1, '715244064557', 10000, 0, 0, 26.95, 26.95, 26.95, 26.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 15:04:57', '2025-11-28 07:05:00'),
(2452, 2452, 'product', '', '0000-00-00 00:00:00', 1, '705108700721', 10000, 0, 0, 4.5, 4.5, 4.5, 4.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 15:05:41', '2025-11-28 07:05:00'),
(2453, 2453, 'product', '', '0000-00-00 00:00:00', 1, '705108520305', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 15:11:38', '2025-11-28 07:05:00'),
(2454, 2454, 'product', '', '0000-00-00 00:00:00', 1, '652009925497', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 15:19:31', '2025-11-28 07:05:00'),
(2455, 2455, 'product', '', '0000-00-00 00:00:00', 1, '8052530170212', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 15:23:54', '2025-11-28 07:05:00'),
(2456, 2456, 'product', '', '0000-00-00 00:00:00', 1, '131611802209', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 15:26:03', '2025-11-28 07:05:00'),
(2457, 2457, 'product', '', '0000-00-00 00:00:00', 1, '705108558902', 10000, 0, 0, 179, 179, 179, 179, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 15:28:05', '2025-11-28 07:05:00'),
(2458, 2458, 'product', '', '0000-00-00 00:00:00', 1, '514677002170', 10000, 0, 0, 18.95, 18.95, 18.95, 18.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 15:29:12', '2025-11-28 07:05:00'),
(2459, 2459, 'product', '', '0000-00-00 00:00:00', 1, '715244008179', 10000, 0, 0, 3.95, 3.95, 3.95, 3.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 15:31:08', '2025-11-28 07:05:00'),
(2460, 2460, 'product', '', '0000-00-00 00:00:00', 1, '191970101818', 10000, 0, 0, 69, 69, 69, 69, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 15:34:48', '2025-11-28 07:05:00'),
(2461, 2461, 'product', '', '0000-00-00 00:00:00', 1, '715244063178', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 15:41:10', '2025-11-28 07:05:00'),
(2462, 2462, 'product', '', '0000-00-00 00:00:00', 1, '027736026517', 10000, 0, 0, 59.95, 59.95, 59.95, 59.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 15:42:29', '2025-11-28 07:05:00'),
(2463, 2463, 'product', '', '0000-00-00 00:00:00', 1, '652009906533', 10000, 0, 0, 149, 149, 149, 149, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 15:44:54', '2025-11-28 07:05:00'),
(2464, 2464, 'product', '', '0000-00-00 00:00:00', 1, '8143270147913', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 15:51:36', '2025-11-28 07:05:00'),
(2465, 2465, 'product', '', '0000-00-00 00:00:00', 1, '191970113811', 10000, 0, 0, 124.95, 124.95, 124.95, 124.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 15:57:52', '2025-11-28 07:05:00'),
(2466, 2466, 'product', '', '0000-00-00 00:00:00', 1, '027736042326', 10000, 0, 0, 42.95, 42.95, 42.95, 42.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 16:03:04', '2025-11-28 07:05:00'),
(2467, 2467, 'product', '', '0000-00-00 00:00:00', 1, '8052530044315', 10000, 0, 0, 34.95, 34.95, 34.95, 34.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 16:11:00', '2025-11-28 07:05:00'),
(2468, 2468, 'product', '', '0000-00-00 00:00:00', 1, '8052530044216', 10000, 0, 0, 34.95, 34.95, 34.95, 34.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 16:12:25', '2025-11-28 07:05:00'),
(2469, 2469, 'product', '', '0000-00-00 00:00:00', 1, '027736010318', 10000, 0, 0, 22.95, 22.95, 22.95, 22.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 16:21:39', '2025-11-28 07:05:00'),
(2470, 2470, 'product', '', '0000-00-00 00:00:00', 1, '8052531338314', 10000, 0, 0, 12.95, 12.95, 12.95, 12.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 17:06:02', '2025-11-28 07:05:00'),
(2471, 2471, 'product', '', '0000-00-00 00:00:00', 1, '027736026500', 10000, 0, 0, 54.95, 54.95, 54.95, 54.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 17:07:50', '2025-11-28 07:05:00'),
(2472, 2472, 'product', '', '0000-00-00 00:00:00', 1, '705108519316', 10000, 0, 0, 32.95, 32.95, 32.95, 32.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 17:09:09', '2025-11-28 07:05:00'),
(2473, 2473, 'product', '', '0000-00-00 00:00:00', 1, 'd4dBwVc9Bf-2473', 10000, 0, 0, 1.5, 1.5, 1.5, 1.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 17:10:12', '2025-12-01 22:34:08'),
(2474, 2474, 'product', '', '0000-00-00 00:00:00', 1, '027736011339', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 17:11:19', '2025-11-28 07:05:00'),
(2475, 2475, 'product', '', '0000-00-00 00:00:00', 1, '027736020058-2475', 10000, 0, 0, 3.5, 3.5, 3.5, 3.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 17:12:24', '2025-11-30 23:05:47'),
(2476, 2476, 'product', '', '0000-00-00 00:00:00', 1, '652009002549', 10000, 0, 0, 3.5, 3.5, 3.5, 3.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 17:15:23', '2025-11-28 07:05:00'),
(2477, 2477, 'product', '', '0000-00-00 00:00:00', 1, '8052530213216', 10000, 0, 0, 3.5, 3.5, 3.5, 3.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 17:16:48', '2025-11-28 07:05:00'),
(2478, 2478, 'product', '', '0000-00-00 00:00:00', 1, '', 10000, 0, 0, 0.5, 0.5, 0.5, 0.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 17:21:29', '2025-11-28 07:05:00'),
(2479, 2479, 'product', '', '0000-00-00 00:00:00', 1, '8052530141618', 10000, 0, 0, 21.95, 21.95, 21.95, 21.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 18:12:08', '2025-11-28 07:05:00'),
(2480, 2480, 'product', '', '0000-00-00 00:00:00', 1, '705108044504', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 18:40:14', '2025-11-28 07:05:00'),
(2481, 2481, 'product', '', '0000-00-00 00:00:00', 1, '8052530080627', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 18:41:33', '2025-11-28 07:05:00'),
(2482, 2482, 'product', '', '0000-00-00 00:00:00', 1, '027736011209', 10000, 0, 0, 4.5, 4.5, 4.5, 4.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 18:42:49', '2025-11-28 07:05:00'),
(2483, 2483, 'product', '', '0000-00-00 00:00:00', 1, '8143270173714', 10000, 0, 0, 44.95, 44.95, 44.95, 44.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 18:48:14', '2025-11-28 07:05:00'),
(2484, 2484, 'product', '', '0000-00-00 00:00:00', 1, '8143270156717', 10000, 0, 0, 7.95, 7.95, 7.95, 7.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 18:49:28', '2025-11-28 07:05:00'),
(2485, 2485, 'product', '', '0000-00-00 00:00:00', 1, '705108802760', 10000, 0, 0, 44, 44, 44, 44, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 19:00:19', '2025-11-28 07:05:00'),
(2486, 2486, 'product', '', '0000-00-00 00:00:00', 1, '715244004805', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 19:01:13', '2025-11-28 07:05:00'),
(2487, 2487, 'product', '', '0000-00-00 00:00:00', 1, 'ecK8JRHB6C-2487', 10000, 0, 0, 4.5, 4.5, 4.5, 4.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-05 19:02:22', '2025-12-01 22:28:22'),
(2488, 2488, 'product', '', '0000-00-00 00:00:00', 1, '8052531322412', 10000, 0, 0, 48.95, 48.95, 48.95, 48.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-10 16:08:08', '2025-11-28 07:05:00'),
(2489, 2489, 'product', '', '0000-00-00 00:00:00', 1, '805253329614', 10000, 0, 0, 18.95, 18.95, 18.95, 18.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-10 16:10:21', '2025-11-28 07:05:00'),
(2490, 2490, 'product', '', '0000-00-00 00:00:00', 1, '191970105816', 10000, 0, 0, 119, 119, 119, 119, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-10 16:11:26', '2025-11-28 07:05:00'),
(2491, 2491, 'product', '', '0000-00-00 00:00:00', 1, '705108520503', 10000, 0, 0, 17.5, 17.5, 17.5, 17.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-10 16:13:03', '2025-11-28 07:05:00'),
(2492, 2492, 'product', '', '0000-00-00 00:00:00', 1, '191970121915', 10000, 0, 0, 72, 72, 72, 72, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-10 16:14:02', '2025-11-28 07:05:00'),
(2493, 2493, 'product', '', '0000-00-00 00:00:00', 1, '705108554607', 10000, 0, 0, 54.95, 54.95, 54.95, 54.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-10 16:19:53', '2025-11-28 07:05:00'),
(2494, 2494, 'product', '', '0000-00-00 00:00:00', 1, '705108557509', 10000, 0, 0, 99, 99, 99, 99, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-10 16:23:01', '2025-11-28 07:05:00'),
(2495, 2495, 'product', '', '0000-00-00 00:00:00', 1, '705108550401', 10000, 0, 0, 64, 64, 64, 64, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-10 16:25:09', '2025-11-28 07:05:00'),
(2496, 2496, 'product', '', '0000-00-00 00:00:00', 1, '705108515301', 10000, 0, 0, 14.95, 14.95, 14.95, 14.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-10 16:28:32', '2025-11-28 07:05:00'),
(2497, 2497, 'product', '', '0000-00-00 00:00:00', 1, '715244022205', 10000, 0, 0, 19.95, 19.95, 19.95, 19.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-10 16:37:34', '2025-11-28 07:05:00'),
(2498, 2498, 'product', '', '0000-00-00 00:00:00', 1, '705108801862', 10000, 0, 0, 52, 52, 52, 52, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-10 16:39:00', '2025-11-28 07:05:00'),
(2499, 2499, 'product', '', '0000-00-00 00:00:00', 1, '705108502363', 10000, 0, 0, 16.95, 16.95, 16.95, 16.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-10 16:41:59', '2025-11-28 07:05:00'),
(2500, 2500, 'product', '', '0000-00-00 00:00:00', 1, '8143270136115', 10000, 0, 0, 2.5, 2.5, 2.5, 2.5, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-10 16:43:13', '2025-11-28 07:05:00'),
(2501, 2501, 'product', '', '0000-00-00 00:00:00', 1, '851866086055', 10000, 0, 0, 29.95, 29.95, 29.95, 29.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-10 17:01:46', '2025-11-28 07:05:00'),
(2502, 2502, 'product', '', '0000-00-00 00:00:00', 1, '851866086123-2502', 10000, 0, 0, 1.95, 1.95, 1.95, 1.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-10 17:02:50', '2025-12-01 22:30:28'),
(2503, 2503, 'product', '', '0000-00-00 00:00:00', 1, '027736040933', 10000, 0, 0, 49.95, 49.95, 49.95, 49.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-10 17:04:29', '2025-11-28 07:05:00'),
(2504, 2504, 'product', '', '0000-00-00 00:00:00', 1, '191970109319', 10000, 0, 0, 2.95, 2.95, 2.95, 2.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-11 15:18:20', '2025-11-28 07:05:00'),
(2505, 2505, 'product', '', '0000-00-00 00:00:00', 1, '705108547005', 10000, 0, 0, 109, 109, 109, 109, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-11 15:34:36', '2025-11-28 07:05:00'),
(2506, 2506, 'product', '', '0000-00-00 00:00:00', 1, '8143270158018', 10000, 0, 0, 18.95, 18.95, 18.95, 18.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-11 15:37:06', '2025-11-28 07:05:00'),
(2507, 2507, 'product', '', '0000-00-00 00:00:00', 1, '027736031740', 10000, 0, 0, 69.95, 69.95, 69.95, 69.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-11 15:37:41', '2025-11-28 07:05:00'),
(2508, 2508, 'product', '', '0000-00-00 00:00:00', 1, '652009119001', 10000, 0, 0, 5.95, 5.95, 5.95, 5.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-11 15:38:18', '2025-11-28 07:05:00'),
(2509, 2509, 'product', '', '0000-00-00 00:00:00', 1, '705108551507', 10000, 0, 0, 69.95, 69.95, 69.95, 69.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-21 21:37:44', '2025-11-28 07:05:00'),
(2510, 2510, 'product', '', '0000-00-00 00:00:00', 1, '8052530147214', 10000, 0, 0, 129, 129, 129, 129, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-21 21:39:00', '2025-11-28 07:05:00'),
(2511, 2511, 'product', '', '0000-00-00 00:00:00', 1, '814327013151', 10000, 0, 0, 1.95, 1.95, 1.95, 1.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-21 21:42:31', '2025-11-28 07:05:00'),
(2512, 2512, 'product', '', '0000-00-00 00:00:00', 1, '805253375291', 10000, 0, 0, 225.95, 225.95, 225.95, 225.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-21 21:46:36', '2025-11-28 07:05:00'),
(2513, 2513, 'product', '', '0000-00-00 00:00:00', 1, '805253301764', 10000, 0, 0, 44.95, 44.95, 44.95, 44.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-23 15:55:09', '2025-11-28 07:05:00'),
(2514, 2514, 'product', '', '0000-00-00 00:00:00', 1, '652009003546', 10000, 0, 0, 39.95, 39.95, 39.95, 39.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-23 15:55:57', '2025-11-28 07:05:00'),
(2515, 2515, 'product', '', '0000-00-00 00:00:00', 1, '027736012183', 10000, 0, 0, 10.95, 10.95, 10.95, 10.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-23 16:31:17', '2025-11-28 07:05:00'),
(2516, 2516, 'product', '', '0000-00-00 00:00:00', 1, '12068022191', 10000, 0, 0, 9.95, 9.95, 9.95, 9.95, 0, 0.01, 0.01, 0.01, 0.01, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'NULL', '2025-06-23 16:37:28', '2025-11-28 07:05:00');

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_providers`
--

CREATE TABLE `ns_nexopos_providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address_1` varchar(255) DEFAULT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `author` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `amount_due` float NOT NULL DEFAULT 0,
  `amount_paid` float NOT NULL DEFAULT 0,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_registers`
--

CREATE TABLE `ns_nexopos_registers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'closed',
  `description` text DEFAULT NULL,
  `used_by` int(11) DEFAULT NULL,
  `author` int(11) NOT NULL,
  `balance` float NOT NULL DEFAULT 0,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_registers_history`
--

CREATE TABLE `ns_nexopos_registers_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `register_id` int(11) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `payment_type_id` int(11) NOT NULL DEFAULT 0,
  `order_id` int(11) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `author` int(11) NOT NULL,
  `value` float NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `balance_before` float NOT NULL DEFAULT 0,
  `transaction_type` varchar(255) DEFAULT NULL,
  `balance_after` float NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_rewards_system`
--

CREATE TABLE `ns_nexopos_rewards_system` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `author` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `target` float NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_rewards_system_rules`
--

CREATE TABLE `ns_nexopos_rewards_system_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from` float NOT NULL,
  `to` float NOT NULL,
  `reward` float NOT NULL,
  `reward_id` int(11) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `author` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_roles`
--

CREATE TABLE `ns_nexopos_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `reward_system_id` int(11) DEFAULT NULL,
  `minimal_credit_payment` double NOT NULL DEFAULT 0,
  `author` int(11) DEFAULT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ns_nexopos_roles`
--

INSERT INTO `ns_nexopos_roles` (`id`, `name`, `namespace`, `description`, `reward_system_id`, `minimal_credit_payment`, `author`, `locked`, `created_at`, `updated_at`) VALUES
(1, 'User', 'user', 'Basic user role.', NULL, 0, NULL, 1, '2025-11-28 23:36:58', '2025-11-28 23:36:58'),
(2, 'Administrator', 'admin', 'Master role which can perform all actions like create users, install/update/delete modules and much more.', NULL, 0, NULL, 1, '2025-11-28 23:36:59', '2025-11-28 23:36:59'),
(3, 'Store Administrator', 'nexopos.store.administrator', 'Has a control over an entire store of NexoPOS.', NULL, 0, NULL, 1, '2025-11-28 23:36:59', '2025-11-28 23:36:59'),
(4, 'Store Cashier', 'nexopos.store.cashier', 'Has a control over the sale process.', NULL, 0, NULL, 1, '2025-11-28 23:36:59', '2025-11-28 23:36:59'),
(5, 'Store Customer', 'nexopos.store.customer', 'Can purchase orders and manage his profile.', NULL, 0, NULL, 1, '2025-11-28 23:36:59', '2025-11-28 23:36:59');

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_role_permission`
--

CREATE TABLE `ns_nexopos_role_permission` (
  `permission_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ns_nexopos_role_permission`
--

INSERT INTO `ns_nexopos_role_permission` (`permission_id`, `role_id`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 1),
(10, 2),
(10, 3),
(10, 4),
(10, 5),
(11, 2),
(12, 2),
(13, 2),
(13, 3),
(13, 4),
(13, 5),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(18, 3),
(19, 2),
(19, 3),
(20, 2),
(20, 3),
(21, 2),
(21, 3),
(22, 2),
(22, 3),
(23, 2),
(23, 3),
(24, 2),
(24, 3),
(25, 2),
(25, 3),
(26, 2),
(26, 3),
(27, 2),
(27, 3),
(27, 4),
(28, 2),
(28, 3),
(29, 2),
(29, 3),
(30, 2),
(30, 3),
(31, 2),
(31, 3),
(32, 2),
(32, 3),
(33, 2),
(33, 3),
(34, 2),
(34, 3),
(35, 2),
(35, 3),
(36, 2),
(36, 3),
(37, 2),
(37, 3),
(38, 2),
(38, 3),
(39, 2),
(39, 3),
(40, 2),
(40, 3),
(41, 2),
(41, 3),
(42, 2),
(42, 3),
(43, 2),
(43, 3),
(44, 2),
(44, 3),
(45, 2),
(45, 3),
(46, 2),
(46, 3),
(47, 2),
(47, 3),
(48, 2),
(48, 3),
(48, 4),
(49, 2),
(49, 3),
(50, 2),
(50, 3),
(50, 4),
(51, 2),
(51, 3),
(51, 4),
(52, 2),
(52, 3),
(52, 4),
(53, 2),
(53, 3),
(53, 4),
(54, 2),
(54, 3),
(54, 4),
(55, 2),
(55, 3),
(56, 2),
(56, 3),
(57, 2),
(57, 3),
(58, 2),
(58, 3),
(59, 2),
(59, 3),
(60, 2),
(60, 3),
(61, 2),
(61, 3),
(62, 2),
(62, 3),
(63, 2),
(63, 3),
(64, 2),
(64, 3),
(65, 2),
(65, 3),
(66, 2),
(66, 3),
(67, 2),
(67, 3),
(68, 2),
(68, 3),
(69, 2),
(69, 3),
(70, 2),
(70, 3),
(71, 2),
(71, 3),
(72, 2),
(72, 3),
(73, 2),
(73, 3),
(74, 2),
(74, 3),
(75, 2),
(75, 3),
(76, 2),
(76, 3),
(77, 2),
(77, 3),
(78, 2),
(78, 3),
(79, 2),
(79, 3),
(80, 2),
(80, 3),
(81, 2),
(81, 3),
(82, 2),
(82, 3),
(83, 2),
(83, 3),
(84, 2),
(84, 3),
(85, 2),
(85, 3),
(86, 2),
(86, 3),
(87, 2),
(87, 3),
(88, 2),
(88, 3),
(89, 2),
(89, 3),
(90, 2),
(90, 3),
(91, 2),
(91, 3),
(92, 2),
(92, 3),
(93, 2),
(93, 3),
(94, 2),
(94, 3),
(95, 2),
(95, 3),
(96, 2),
(96, 3),
(97, 2),
(97, 3),
(98, 2),
(98, 3),
(99, 2),
(99, 3),
(100, 2),
(100, 3),
(100, 4),
(101, 2),
(101, 3),
(101, 4),
(102, 2),
(102, 3),
(102, 4),
(103, 2),
(103, 3),
(103, 4),
(104, 2),
(104, 3),
(104, 4),
(105, 2),
(105, 3),
(106, 2),
(106, 3),
(107, 2),
(107, 3),
(108, 2),
(108, 3),
(109, 1),
(109, 2),
(109, 3),
(109, 4),
(109, 5),
(110, 2),
(110, 3),
(111, 2),
(111, 3),
(112, 2),
(112, 3),
(113, 2),
(113, 3),
(114, 2),
(114, 3),
(115, 2),
(115, 3),
(116, 2),
(116, 3),
(117, 2),
(117, 3),
(118, 2),
(118, 3),
(119, 2),
(119, 3),
(120, 2),
(120, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_taxes`
--

CREATE TABLE `ns_nexopos_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `rate` float NOT NULL,
  `tax_group_id` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_taxes_groups`
--

CREATE TABLE `ns_nexopos_taxes_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `author` int(11) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_transactions`
--

CREATE TABLE `ns_nexopos_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `account_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `media_id` int(11) NOT NULL DEFAULT 0,
  `value` float NOT NULL DEFAULT 0,
  `recurring` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `group_id` int(11) DEFAULT NULL,
  `occurrence` varchar(255) DEFAULT NULL,
  `occurrence_value` varchar(255) DEFAULT NULL,
  `scheduled_date` datetime DEFAULT NULL,
  `author` int(11) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_transactions_accounts`
--

CREATE TABLE `ns_nexopos_transactions_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `account` varchar(255) NOT NULL DEFAULT '0',
  `sub_category_id` int(11) DEFAULT NULL,
  `category_identifier` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `author` int(11) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ns_nexopos_transactions_accounts`
--

INSERT INTO `ns_nexopos_transactions_accounts` (`id`, `name`, `account`, `sub_category_id`, `category_identifier`, `description`, `author`, `uuid`, `created_at`, `updated_at`) VALUES
(1, 'Fixed Assets', '1001-assets-fixed-assets', NULL, 'assets', NULL, 17, NULL, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(2, 'Current Assets', '1002-assets-current-assets', NULL, 'assets', NULL, 17, NULL, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(3, 'Inventory Account', '1003-assets-inventory-account', NULL, 'assets', NULL, 17, NULL, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(4, 'Current Liabilities', '2001-liabilities-current-liabilities', NULL, 'liabilities', NULL, 17, NULL, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(5, 'Sales Revenues', '4001-revenues-sales-revenues', NULL, 'revenues', NULL, 17, NULL, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(6, 'Direct Expenses', '5001-expenses-direct-expenses', NULL, 'expenses', NULL, 17, NULL, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(7, 'Expenses Cash', '1004-assets-expenses-cash', 2, 'assets', NULL, 17, NULL, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(8, 'Procurement Cash', '1005-assets-procurement-cash', 2, 'assets', NULL, 17, NULL, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(9, 'Procurement Payable', '2002-liabilities-procurement-payable', 4, 'liabilities', NULL, 17, NULL, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(10, 'Receivables', '1006-assets-receivables', 2, 'assets', NULL, 17, NULL, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(11, 'Sales', '1007-assets-sales', 2, 'assets', NULL, 17, NULL, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(12, 'Refunds', '4002-revenues-refunds', 5, 'revenues', NULL, 17, NULL, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(13, 'Sales COGS', '5002-expenses-sales-cogs', 6, 'expenses', NULL, 17, NULL, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(14, 'Operating Expenses', '5003-expenses-operating-expenses', 6, 'expenses', NULL, 17, NULL, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(15, 'Rent Expenses', '5004-expenses-rent-expenses', 6, 'expenses', NULL, 17, NULL, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(16, 'Other Expenses', '5005-expenses-other-expenses', 6, 'expenses', NULL, 17, NULL, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(17, 'Salaries And Wages', '5006-expenses-salaries-and-wages', 6, 'expenses', NULL, 17, NULL, '2025-11-28 23:37:02', '2025-11-28 23:37:02');

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_transactions_actions_rules`
--

CREATE TABLE `ns_nexopos_transactions_actions_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `on` varchar(255) NOT NULL,
  `action` enum('increase','decrease') NOT NULL,
  `account_id` int(11) NOT NULL,
  `do` enum('increase','decrease') NOT NULL,
  `offset_account_id` int(11) NOT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ns_nexopos_transactions_actions_rules`
--

INSERT INTO `ns_nexopos_transactions_actions_rules` (`id`, `on`, `action`, `account_id`, `do`, `offset_account_id`, `locked`, `created_at`, `updated_at`) VALUES
(1, 'procurement_unpaid', 'increase', 3, 'increase', 9, 0, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(2, 'procurement_paid', 'increase', 3, 'decrease', 8, 0, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(3, 'procurement_paid', 'increase', 7, 'decrease', 8, 0, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(4, 'procurement_from_unpaid_to_paid', 'decrease', 9, 'decrease', 8, 0, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(5, 'order_unpaid', 'increase', 10, 'increase', 5, 0, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(6, 'order_unpaid', 'increase', 7, 'decrease', 3, 0, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(7, 'order_from_unpaid_to_paid', 'decrease', 11, 'increase', 10, 0, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(8, 'order_paid', 'increase', 11, 'increase', 5, 0, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(9, 'order_refunded', 'decrease', 5, 'decrease', 11, 0, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(10, 'order_cogs', 'increase', 13, 'decrease', 3, 0, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(11, 'order_paid_voided', 'increase', 11, 'decrease', 11, 0, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(12, 'order_unpaid_voided', 'decrease', 5, 'decrease', 10, 0, '2025-11-28 23:37:02', '2025-11-28 23:37:02');

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_transactions_balance_days`
--

CREATE TABLE `ns_nexopos_transactions_balance_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opening_balance` double NOT NULL DEFAULT 0,
  `income` double NOT NULL DEFAULT 0,
  `expense` double NOT NULL DEFAULT 0,
  `closing_balance` double NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_transactions_balance_months`
--

CREATE TABLE `ns_nexopos_transactions_balance_months` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opening_balance` double NOT NULL DEFAULT 0,
  `income` double NOT NULL DEFAULT 0,
  `expense` double NOT NULL DEFAULT 0,
  `closing_balance` double NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_transactions_histories`
--

CREATE TABLE `ns_nexopos_transactions_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `operation` varchar(255) NOT NULL,
  `is_reflection` tinyint(1) NOT NULL DEFAULT 0,
  `reflection_source_id` int(11) DEFAULT NULL,
  `transaction_account_id` int(11) DEFAULT NULL,
  `procurement_id` int(11) DEFAULT NULL,
  `order_refund_id` int(11) DEFAULT NULL,
  `order_payment_id` int(11) DEFAULT NULL,
  `order_refund_product_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_product_id` int(11) DEFAULT NULL,
  `register_history_id` int(11) DEFAULT NULL,
  `customer_account_history_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `value` float NOT NULL DEFAULT 0,
  `trigger_date` datetime DEFAULT NULL,
  `rule_id` int(11) DEFAULT NULL,
  `author` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_units`
--

CREATE TABLE `ns_nexopos_units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `author` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `value` float NOT NULL,
  `preview_url` varchar(255) DEFAULT NULL,
  `base_unit` tinyint(1) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ns_nexopos_units`
--

INSERT INTO `ns_nexopos_units` (`id`, `name`, `identifier`, `description`, `author`, `group_id`, `value`, `preview_url`, `base_unit`, `uuid`, `created_at`, `updated_at`) VALUES
(1, 'Piece', 'piece', NULL, 17, 1, 1, NULL, 1, NULL, '2025-11-28 18:35:18', '2025-11-28 18:35:18');

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_units_groups`
--

CREATE TABLE `ns_nexopos_units_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `author` int(11) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ns_nexopos_units_groups`
--

INSERT INTO `ns_nexopos_units_groups` (`id`, `name`, `description`, `author`, `uuid`, `created_at`, `updated_at`) VALUES
(1, 'Case', NULL, 17, NULL, '2025-11-28 18:34:55', '2025-11-28 18:34:55');

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_users`
--

CREATE TABLE `ns_nexopos_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `author` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `pobox` varchar(255) DEFAULT NULL,
  `activation_expiration` datetime DEFAULT NULL,
  `total_sales_count` int(11) NOT NULL DEFAULT 0,
  `total_sales` float NOT NULL DEFAULT 0,
  `birth_date` datetime DEFAULT NULL,
  `purchases_amount` double NOT NULL DEFAULT 0,
  `owed_amount` double NOT NULL DEFAULT 0,
  `credit_limit_amount` double NOT NULL DEFAULT 0,
  `account_amount` double NOT NULL DEFAULT 0,
  `activation_token` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ns_nexopos_users`
--

INSERT INTO `ns_nexopos_users` (`id`, `username`, `active`, `author`, `email`, `password`, `group_id`, `first_name`, `last_name`, `gender`, `phone`, `pobox`, `activation_expiration`, `total_sales_count`, `total_sales`, `birth_date`, `purchases_amount`, `owed_amount`, `credit_limit_amount`, `account_amount`, `activation_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(17, 'admin', 1, 1, 'admin@firuman', '$2y$10$zefCbQYGvILeZvEc651LgubiA2wXGsReXf3LudKhoxquh0AJiJ5o.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0, NULL, NULL, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(18, 'customer-19@127.0.0.1', 0, 17, 'customer-19@127.0.0.1', '$2y$10$VVjAdu4W4FWhSLxxhySDY.WktY3EJleNR07WcLQ8zLBUY//3MuOCm', 1, 'Walk-Ins', NULL, NULL, NULL, NULL, NULL, 0, 0, '2025-11-28 15:16:50', 0, 0, 0, 0, NULL, NULL, '2025-11-28 21:17:16', '2025-11-28 21:17:16');

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_users_attributes`
--

CREATE TABLE `ns_nexopos_users_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `avatar_link` varchar(255) DEFAULT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ns_nexopos_users_attributes`
--

INSERT INTO `ns_nexopos_users_attributes` (`id`, `user_id`, `avatar_link`, `theme`, `language`) VALUES
(1, 17, NULL, NULL, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_users_roles_relations`
--

CREATE TABLE `ns_nexopos_users_roles_relations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ns_nexopos_users_roles_relations`
--

INSERT INTO `ns_nexopos_users_roles_relations` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 2, 17, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
(2, 5, 18, '2025-11-28 21:17:16', '2025-11-28 21:17:16');

-- --------------------------------------------------------

--
-- Table structure for table `ns_nexopos_users_widgets`
--

CREATE TABLE `ns_nexopos_users_widgets` (
  `id` char(36) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `column` varchar(255) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ns_nexopos_users_widgets`
--

INSERT INTO `ns_nexopos_users_widgets` (`id`, `identifier`, `column`, `class_name`, `position`, `user_id`, `created_at`, `updated_at`) VALUES
('a07781fa-90e1-454f-a623-2195a1fbc298', 'nsIncompleteSaleCardWidget', 'first-column', 'App\\Widgets\\IncompleteSaleCardWidget', 0, 17, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
('a07781fa-9352-4123-be17-6ad02fd1cb18', 'nsBestCustomers', 'first-column', 'App\\Widgets\\BestCustomersWidget', 1, 17, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
('a07781fa-9461-4200-913b-d0cb496eff2b', 'nsOrdersSummary', 'first-column', 'App\\Widgets\\OrdersSummaryWidget', 2, 17, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
('a07781fa-964a-45fc-82f7-2233debde780', 'nsExpenseCardWidget', 'second-column', 'App\\Widgets\\ExpenseCardWidget', 0, 17, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
('a07781fa-975c-425a-b5b2-2d3f43c94038', 'nsProfileWidget', 'second-column', 'App\\Widgets\\ProfileWidget', 1, 17, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
('a07781fa-986a-4b73-be17-3c93886c4134', 'nsBestCashiers', 'second-column', 'App\\Widgets\\BestCashiersWidget', 2, 17, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
('a07781fa-9984-4e8e-8921-65784a0fda6b', 'nsSaleCardWidget', 'third-column', 'App\\Widgets\\SaleCardWidget', 0, 17, '2025-11-28 23:37:02', '2025-11-28 23:37:02'),
('a07781fa-9b3e-4234-b522-fe558fcfb8a6', 'nsOrdersChart', 'third-column', 'App\\Widgets\\OrdersChartWidget', 1, 17, '2025-11-28 23:37:02', '2025-11-28 23:37:02');

-- --------------------------------------------------------

--
-- Table structure for table `ns_personal_access_tokens`
--

CREATE TABLE `ns_personal_access_tokens` (
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

-- --------------------------------------------------------

--
-- Table structure for table `ns_telescope_entries`
--

CREATE TABLE `ns_telescope_entries` (
  `sequence` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `batch_id` char(36) NOT NULL,
  `family_hash` varchar(255) DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(20) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_telescope_entries_tags`
--

CREATE TABLE `ns_telescope_entries_tags` (
  `entry_uuid` char(36) NOT NULL,
  `tag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_telescope_monitoring`
--

CREATE TABLE `ns_telescope_monitoring` (
  `tag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ns_failed_jobs`
--
ALTER TABLE `ns_failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_jobs`
--
ALTER TABLE `ns_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ns_jobs_queue_index` (`queue`);

--
-- Indexes for table `ns_messages`
--
ALTER TABLE `ns_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ns_messages_recipient_id_read_at_index` (`recipient_id`,`read_at`),
  ADD KEY `ns_messages_sender_id_created_at_index` (`sender_id`,`created_at`);

--
-- Indexes for table `ns_migrations`
--
ALTER TABLE `ns_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_coupons`
--
ALTER TABLE `ns_nexopos_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_coupons_categories`
--
ALTER TABLE `ns_nexopos_coupons_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_coupons_customers`
--
ALTER TABLE `ns_nexopos_coupons_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_coupons_customers_groups`
--
ALTER TABLE `ns_nexopos_coupons_customers_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_coupons_products`
--
ALTER TABLE `ns_nexopos_coupons_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_customers_account_history`
--
ALTER TABLE `ns_nexopos_customers_account_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_customers_addresses`
--
ALTER TABLE `ns_nexopos_customers_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_customers_coupons`
--
ALTER TABLE `ns_nexopos_customers_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_customers_groups`
--
ALTER TABLE `ns_nexopos_customers_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_customers_rewards`
--
ALTER TABLE `ns_nexopos_customers_rewards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_dashboard_days`
--
ALTER TABLE `ns_nexopos_dashboard_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_dashboard_months`
--
ALTER TABLE `ns_nexopos_dashboard_months`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_dashboard_weeks`
--
ALTER TABLE `ns_nexopos_dashboard_weeks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_medias`
--
ALTER TABLE `ns_nexopos_medias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ns_nexopos_medias_name_unique` (`name`);

--
-- Indexes for table `ns_nexopos_modules_migrations`
--
ALTER TABLE `ns_nexopos_modules_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_notifications`
--
ALTER TABLE `ns_nexopos_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_options`
--
ALTER TABLE `ns_nexopos_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_orders`
--
ALTER TABLE `ns_nexopos_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_orders_addresses`
--
ALTER TABLE `ns_nexopos_orders_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_orders_count`
--
ALTER TABLE `ns_nexopos_orders_count`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_orders_coupons`
--
ALTER TABLE `ns_nexopos_orders_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_orders_instalments`
--
ALTER TABLE `ns_nexopos_orders_instalments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_orders_metas`
--
ALTER TABLE `ns_nexopos_orders_metas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_orders_payments`
--
ALTER TABLE `ns_nexopos_orders_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_orders_products`
--
ALTER TABLE `ns_nexopos_orders_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_orders_products_refunds`
--
ALTER TABLE `ns_nexopos_orders_products_refunds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_orders_refunds`
--
ALTER TABLE `ns_nexopos_orders_refunds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_orders_settings`
--
ALTER TABLE `ns_nexopos_orders_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_orders_storage`
--
ALTER TABLE `ns_nexopos_orders_storage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_orders_taxes`
--
ALTER TABLE `ns_nexopos_orders_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_payments_types`
--
ALTER TABLE `ns_nexopos_payments_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_permissions`
--
ALTER TABLE `ns_nexopos_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ns_nexopos_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `ns_nexopos_permissions_namespace_unique` (`namespace`);

--
-- Indexes for table `ns_nexopos_procurements`
--
ALTER TABLE `ns_nexopos_procurements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_procurements_products`
--
ALTER TABLE `ns_nexopos_procurements_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_products`
--
ALTER TABLE `ns_nexopos_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_products_categories`
--
ALTER TABLE `ns_nexopos_products_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_products_galleries`
--
ALTER TABLE `ns_nexopos_products_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_products_histories`
--
ALTER TABLE `ns_nexopos_products_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_products_histories_combined`
--
ALTER TABLE `ns_nexopos_products_histories_combined`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_products_metas`
--
ALTER TABLE `ns_nexopos_products_metas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_products_subitems`
--
ALTER TABLE `ns_nexopos_products_subitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_products_taxes`
--
ALTER TABLE `ns_nexopos_products_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_products_unit_quantities`
--
ALTER TABLE `ns_nexopos_products_unit_quantities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_providers`
--
ALTER TABLE `ns_nexopos_providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ns_nexopos_providers_email_unique` (`email`);

--
-- Indexes for table `ns_nexopos_registers`
--
ALTER TABLE `ns_nexopos_registers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_registers_history`
--
ALTER TABLE `ns_nexopos_registers_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_rewards_system`
--
ALTER TABLE `ns_nexopos_rewards_system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_rewards_system_rules`
--
ALTER TABLE `ns_nexopos_rewards_system_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_roles`
--
ALTER TABLE `ns_nexopos_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ns_nexopos_roles_name_unique` (`name`),
  ADD UNIQUE KEY `ns_nexopos_roles_namespace_unique` (`namespace`);

--
-- Indexes for table `ns_nexopos_role_permission`
--
ALTER TABLE `ns_nexopos_role_permission`
  ADD PRIMARY KEY (`permission_id`,`role_id`);

--
-- Indexes for table `ns_nexopos_taxes`
--
ALTER TABLE `ns_nexopos_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_taxes_groups`
--
ALTER TABLE `ns_nexopos_taxes_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_transactions`
--
ALTER TABLE `ns_nexopos_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_transactions_accounts`
--
ALTER TABLE `ns_nexopos_transactions_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_transactions_actions_rules`
--
ALTER TABLE `ns_nexopos_transactions_actions_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_transactions_balance_days`
--
ALTER TABLE `ns_nexopos_transactions_balance_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_transactions_balance_months`
--
ALTER TABLE `ns_nexopos_transactions_balance_months`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_transactions_histories`
--
ALTER TABLE `ns_nexopos_transactions_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_units`
--
ALTER TABLE `ns_nexopos_units`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ns_nexopos_units_identifier_unique` (`identifier`);

--
-- Indexes for table `ns_nexopos_units_groups`
--
ALTER TABLE `ns_nexopos_units_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_users`
--
ALTER TABLE `ns_nexopos_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ns_nexopos_users_email_unique` (`email`);

--
-- Indexes for table `ns_nexopos_users_attributes`
--
ALTER TABLE `ns_nexopos_users_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_users_roles_relations`
--
ALTER TABLE `ns_nexopos_users_roles_relations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_nexopos_users_widgets`
--
ALTER TABLE `ns_nexopos_users_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_personal_access_tokens`
--
ALTER TABLE `ns_personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ns_personal_access_tokens_token_unique` (`token`),
  ADD KEY `ns_personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `ns_telescope_entries`
--
ALTER TABLE `ns_telescope_entries`
  ADD PRIMARY KEY (`sequence`),
  ADD UNIQUE KEY `ns_telescope_entries_uuid_unique` (`uuid`),
  ADD KEY `ns_telescope_entries_batch_id_index` (`batch_id`),
  ADD KEY `ns_telescope_entries_family_hash_index` (`family_hash`),
  ADD KEY `ns_telescope_entries_created_at_index` (`created_at`),
  ADD KEY `ns_telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`);

--
-- Indexes for table `ns_telescope_entries_tags`
--
ALTER TABLE `ns_telescope_entries_tags`
  ADD KEY `ns_telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  ADD KEY `ns_telescope_entries_tags_tag_index` (`tag`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ns_failed_jobs`
--
ALTER TABLE `ns_failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_jobs`
--
ALTER TABLE `ns_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_messages`
--
ALTER TABLE `ns_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_migrations`
--
ALTER TABLE `ns_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `ns_nexopos_coupons`
--
ALTER TABLE `ns_nexopos_coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_coupons_categories`
--
ALTER TABLE `ns_nexopos_coupons_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_coupons_customers`
--
ALTER TABLE `ns_nexopos_coupons_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_coupons_customers_groups`
--
ALTER TABLE `ns_nexopos_coupons_customers_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_coupons_products`
--
ALTER TABLE `ns_nexopos_coupons_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_customers_account_history`
--
ALTER TABLE `ns_nexopos_customers_account_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_customers_addresses`
--
ALTER TABLE `ns_nexopos_customers_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ns_nexopos_customers_coupons`
--
ALTER TABLE `ns_nexopos_customers_coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_customers_groups`
--
ALTER TABLE `ns_nexopos_customers_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ns_nexopos_customers_rewards`
--
ALTER TABLE `ns_nexopos_customers_rewards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_dashboard_days`
--
ALTER TABLE `ns_nexopos_dashboard_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_dashboard_months`
--
ALTER TABLE `ns_nexopos_dashboard_months`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_dashboard_weeks`
--
ALTER TABLE `ns_nexopos_dashboard_weeks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_medias`
--
ALTER TABLE `ns_nexopos_medias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `ns_nexopos_modules_migrations`
--
ALTER TABLE `ns_nexopos_modules_migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_notifications`
--
ALTER TABLE `ns_nexopos_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ns_nexopos_options`
--
ALTER TABLE `ns_nexopos_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `ns_nexopos_orders`
--
ALTER TABLE `ns_nexopos_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_orders_addresses`
--
ALTER TABLE `ns_nexopos_orders_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_orders_count`
--
ALTER TABLE `ns_nexopos_orders_count`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_orders_coupons`
--
ALTER TABLE `ns_nexopos_orders_coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_orders_instalments`
--
ALTER TABLE `ns_nexopos_orders_instalments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_orders_metas`
--
ALTER TABLE `ns_nexopos_orders_metas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_orders_payments`
--
ALTER TABLE `ns_nexopos_orders_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_orders_products`
--
ALTER TABLE `ns_nexopos_orders_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_orders_products_refunds`
--
ALTER TABLE `ns_nexopos_orders_products_refunds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_orders_refunds`
--
ALTER TABLE `ns_nexopos_orders_refunds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_orders_settings`
--
ALTER TABLE `ns_nexopos_orders_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_orders_storage`
--
ALTER TABLE `ns_nexopos_orders_storage`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_orders_taxes`
--
ALTER TABLE `ns_nexopos_orders_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_payments_types`
--
ALTER TABLE `ns_nexopos_payments_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ns_nexopos_permissions`
--
ALTER TABLE `ns_nexopos_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `ns_nexopos_procurements`
--
ALTER TABLE `ns_nexopos_procurements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_procurements_products`
--
ALTER TABLE `ns_nexopos_procurements_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_products`
--
ALTER TABLE `ns_nexopos_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2518;

--
-- AUTO_INCREMENT for table `ns_nexopos_products_categories`
--
ALTER TABLE `ns_nexopos_products_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `ns_nexopos_products_galleries`
--
ALTER TABLE `ns_nexopos_products_galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `ns_nexopos_products_histories`
--
ALTER TABLE `ns_nexopos_products_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ns_nexopos_products_histories_combined`
--
ALTER TABLE `ns_nexopos_products_histories_combined`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ns_nexopos_products_metas`
--
ALTER TABLE `ns_nexopos_products_metas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_products_subitems`
--
ALTER TABLE `ns_nexopos_products_subitems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_products_taxes`
--
ALTER TABLE `ns_nexopos_products_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_products_unit_quantities`
--
ALTER TABLE `ns_nexopos_products_unit_quantities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2517;

--
-- AUTO_INCREMENT for table `ns_nexopos_providers`
--
ALTER TABLE `ns_nexopos_providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_registers`
--
ALTER TABLE `ns_nexopos_registers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_registers_history`
--
ALTER TABLE `ns_nexopos_registers_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_rewards_system`
--
ALTER TABLE `ns_nexopos_rewards_system`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_rewards_system_rules`
--
ALTER TABLE `ns_nexopos_rewards_system_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_roles`
--
ALTER TABLE `ns_nexopos_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ns_nexopos_taxes`
--
ALTER TABLE `ns_nexopos_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_taxes_groups`
--
ALTER TABLE `ns_nexopos_taxes_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_transactions`
--
ALTER TABLE `ns_nexopos_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_transactions_accounts`
--
ALTER TABLE `ns_nexopos_transactions_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `ns_nexopos_transactions_actions_rules`
--
ALTER TABLE `ns_nexopos_transactions_actions_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ns_nexopos_transactions_balance_days`
--
ALTER TABLE `ns_nexopos_transactions_balance_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_transactions_balance_months`
--
ALTER TABLE `ns_nexopos_transactions_balance_months`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_transactions_histories`
--
ALTER TABLE `ns_nexopos_transactions_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_nexopos_units`
--
ALTER TABLE `ns_nexopos_units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ns_nexopos_units_groups`
--
ALTER TABLE `ns_nexopos_units_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ns_nexopos_users`
--
ALTER TABLE `ns_nexopos_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ns_nexopos_users_attributes`
--
ALTER TABLE `ns_nexopos_users_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ns_nexopos_users_roles_relations`
--
ALTER TABLE `ns_nexopos_users_roles_relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ns_personal_access_tokens`
--
ALTER TABLE `ns_personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_telescope_entries`
--
ALTER TABLE `ns_telescope_entries`
  MODIFY `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ns_telescope_entries_tags`
--
ALTER TABLE `ns_telescope_entries_tags`
  ADD CONSTRAINT `ns_telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `ns_telescope_entries` (`uuid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
