-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 06, 2023 at 12:11 AM
-- Server version: 10.3.37-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sbitcom_sspoultry`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `branch` varchar(11) DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `password`, `image`, `branch`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$VLBJ81ss/n0KFMNIKvOTd.8N6HjO4LTGTCfooA0XiE5MDhbuyMa9q', NULL, '1', '1', NULL, NULL),
(2, 'Shuvo', 'shuvo@gmail.com', '01811358605', '$2y$10$VLBJ81ss/n0KFMNIKvOTd.8N6HjO4LTGTCfooA0XiE5MDhbuyMa9q', NULL, 'BRC-01', '1', NULL, NULL),
(11, 'Admin', 'mohinsaki@gmail.com', NULL, '$2y$10$VLBJ81ss/n0KFMNIKvOTd.8N6HjO4LTGTCfooA0XiE5MDhbuyMa9q', NULL, '1', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `asset_categoreys`
--

CREATE TABLE `asset_categoreys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `asset_title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `status` int(11) NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `asset_categoreys`
--

INSERT INTO `asset_categoreys` (`id`, `asset_title`, `description`, `status`, `admin_id`, `created_at`, `updated_at`) VALUES
(4, 'Test', 'Tests', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `asset_depreciations`
--

CREATE TABLE `asset_depreciations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `asset_title_id` bigint(20) UNSIGNED NOT NULL,
  `depreciation_value_per` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` int(11) NOT NULL,
  `admin_id` varchar(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `asset_depreciations`
--

INSERT INTO `asset_depreciations` (`id`, `asset_title_id`, `depreciation_value_per`, `description`, `status`, `admin_id`, `created_at`, `updated_at`) VALUES
(12, 4, '6', 'Test', 1, '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `asset_expenses`
--

CREATE TABLE `asset_expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `asset_title_id` bigint(20) UNSIGNED NOT NULL,
  `taka_ammount` double NOT NULL,
  `status` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `asset_expenses`
--

INSERT INTO `asset_expenses` (`id`, `date`, `branch_id`, `asset_title_id`, `taka_ammount`, `status`, `description`, `admin_id`, `created_at`, `updated_at`) VALUES
(3, '2022-12-12', 1, 4, 500, 1, 'Test', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bank_information`
--

CREATE TABLE `bank_information` (
  `id` int(10) NOT NULL,
  `bank_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `bankingType` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `branch_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `creat_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_transaction`
--

CREATE TABLE `bank_transaction` (
  `id` int(15) NOT NULL,
  `account_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `vouchar_cheque_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `deposit_withdraw_amount` double DEFAULT NULL,
  `deposit_withdraw_date` date DEFAULT NULL,
  `deposit_withdraw_entryDate` date DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `branch_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branch_info`
--

CREATE TABLE `branch_info` (
  `branch_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `branch_sl` int(11) NOT NULL,
  `company_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `branch_name_en` varchar(255) DEFAULT NULL,
  `branch_name_bn` varchar(255) DEFAULT NULL,
  `branch_mobile` varchar(50) DEFAULT NULL,
  `branch_address_en` text DEFAULT NULL,
  `branch_address_bn` text DEFAULT NULL,
  `branch_email` varchar(50) DEFAULT NULL,
  `official_contact _no` varchar(35) DEFAULT NULL,
  `status` int(2) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `branch_info`
--

INSERT INTO `branch_info` (`branch_id`, `branch_sl`, `company_id`, `branch_name_en`, `branch_name_bn`, `branch_mobile`, `branch_address_en`, `branch_address_bn`, `branch_email`, `official_contact _no`, `status`) VALUES
('1', 1, '1', 'Main Branch', NULL, '0181135860', 'feni', NULL, 'info@sbit.com.bd', NULL, 1),
('BRC-01', 3, '1', 'Feni Branch', NULL, '0181135860', 'fen', 'fen', 'mohinsaki@gmail.com', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cash_close`
--

CREATE TABLE `cash_close` (
  `id` int(10) NOT NULL,
  `cash_date` date NOT NULL,
  `cash` double DEFAULT NULL,
  `bankbalance` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `admin_id` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cash_close`
--

INSERT INTO `cash_close` (`id`, `cash_date`, `cash`, `bankbalance`, `comment`, `admin_id`, `created_at`, `updated_at`) VALUES
(8, '2022-11-05', -2991259.86, 'Total Bank Balance: <br>0Tk. <br> Cash in Hand :  <br> -2991259.86Tk.', NULL, 1, '2022-11-04 18:00:00', '2022-11-05 15:24:05'),
(9, '2022-01-01', 0, NULL, 'opening_balance', NULL, '2022-12-08 16:46:02', '2022-12-08 16:49:32');

-- --------------------------------------------------------

--
-- Table structure for table `cash_close_expense`
--

CREATE TABLE `cash_close_expense` (
  `id` int(11) NOT NULL,
  `cash_date` date NOT NULL,
  `purchase` double(11,2) DEFAULT NULL,
  `salary` double(11,2) DEFAULT NULL,
  `bank_deposit` double(11,2) DEFAULT NULL,
  `expenses` double(11,2) DEFAULT NULL,
  `return` double(11,2) DEFAULT NULL,
  `total` double(11,2) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cash_close_expense`
--

INSERT INTO `cash_close_expense` (`id`, `cash_date`, `purchase`, `salary`, `bank_deposit`, `expenses`, `return`, `total`, `admin_id`, `created_at`, `updated_at`) VALUES
(8, '2022-11-05', 3407702.76, 0.00, 0.00, 22340.00, 0.00, 3430042.76, 1, '2022-11-04 18:00:00', '2022-11-05 15:24:05');

-- --------------------------------------------------------

--
-- Table structure for table `cash_close_income`
--

CREATE TABLE `cash_close_income` (
  `id` int(11) NOT NULL,
  `cash_date` date NOT NULL,
  `sales` double(11,2) DEFAULT NULL,
  `others` double(11,2) DEFAULT NULL,
  `bank_withdraw` double(11,2) DEFAULT NULL,
  `return` double(11,2) DEFAULT NULL,
  `total` double(11,2) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `previous_cash` double(11,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `cash_close_income`
--

INSERT INTO `cash_close_income` (`id`, `cash_date`, `sales`, `others`, `bank_withdraw`, `return`, `total`, `admin_id`, `previous_cash`, `created_at`, `updated_at`) VALUES
(8, '2022-11-05', 438782.90, 0.00, 0.00, 0.00, 438782.90, 1, 0.00, '2022-11-04 18:00:00', '2022-11-05 15:24:05');

-- --------------------------------------------------------

--
-- Table structure for table `company_info`
--

CREATE TABLE `company_info` (
  `company_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `company_name_en` varchar(255) DEFAULT NULL,
  `company_name_bn` varchar(255) DEFAULT NULL,
  `company_mobile` varchar(50) DEFAULT NULL,
  `company_address_en` text DEFAULT NULL,
  `company_address_bn` text DEFAULT NULL,
  `company_email` varchar(50) DEFAULT NULL,
  `company_contact _no` varchar(35) DEFAULT NULL,
  `banner` varchar(50) DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `status` int(2) DEFAULT 1,
  `vat` double(11,2) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `openingbalance` double(11,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company_info`
--

INSERT INTO `company_info` (`company_id`, `company_name_en`, `company_name_bn`, `company_mobile`, `company_address_en`, `company_address_bn`, `company_email`, `company_contact _no`, `banner`, `logo`, `status`, `vat`, `date`, `openingbalance`) VALUES
('1', 'Main Branch', NULL, '0181135860', 'Feni', NULL, 'shuvok569@gmail.com', NULL, 'public/Admin/companyimage/190922_22_53_56.jpg', NULL, 1, 0.00, '2022-01-01', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `customer_info`
--

CREATE TABLE `customer_info` (
  `customer_id` varchar(122) NOT NULL,
  `Customer_branch_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `customer_sl` int(11) NOT NULL,
  `customer_name_en` varchar(255) DEFAULT NULL,
  `customer_name_bn` varchar(255) DEFAULT NULL,
  `customer_email` varchar(30) DEFAULT NULL,
  `customer_phone` varchar(15) DEFAULT NULL,
  `customer_address` text DEFAULT NULL,
  `customer_admin_id` varchar(15) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer_info`
--

INSERT INTO `customer_info` (`customer_id`, `Customer_branch_id`, `customer_sl`, `customer_name_en`, `customer_name_bn`, `customer_email`, `customer_phone`, `customer_address`, `customer_admin_id`, `type`, `created_at`, `updated_at`) VALUES
('C-00001', '1', 146, 'MR DR OSMAN', NULL, NULL, '01813290522', 'AMIR UDDIN MUNSIR HAT', '1', 1, '2022-10-11 05:11:34', '2022-10-24 05:26:49'),
('C-00002', '1', 126, 'General Customer', NULL, NULL, NULL, NULL, '1', 1, '2022-10-03 12:37:09', '2022-10-24 05:26:49'),
('C-00003', '1', 127, 'SUMON', NULL, NULL, '01824196593', 'BOKTER MUNSHI', '1', 1, '2022-10-03 12:45:51', '2022-10-24 05:26:49'),
('C-00004', '1', 128, 'MONJURUL', NULL, NULL, '01820195551', 'SAFAR PUR', '1', 1, '2022-10-03 12:47:59', '2022-10-24 05:26:49'),
('C-00005', '1', 129, 'MR ROBIN', NULL, NULL, '01815419681', 'LOXMI PUR', '1', NULL, '2022-10-03 12:49:25', '2022-10-24 05:26:49'),
('C-00006', '1', 130, 'MR ABDUR SOTTAR', NULL, NULL, '01814367709', 'SAFAR PUR', '1', NULL, '2022-10-03 12:50:36', '2022-10-24 05:26:49'),
('C-00007', '1', 131, 'MR ABDUL HALIM', NULL, NULL, '01771872062', 'SAFAR PUR', '1', NULL, '2022-10-03 12:51:49', '2022-10-24 05:26:49'),
('C-00008', '1', 132, 'LABRI', NULL, NULL, '01866747394', 'CHAN PUR', '1', NULL, '2022-10-03 12:54:17', '2022-10-24 05:26:49'),
('C-00009', '1', 133, 'SS POULTRY FARME', NULL, NULL, '01798210130', 'SAFAR PUR', '1', NULL, '2022-10-03 12:55:21', '2022-10-24 05:26:49'),
('C-00010', '1', 134, 'SARAFAT ULLAH', NULL, NULL, '01818451528', 'GOBINDA PUR', '1', NULL, '2022-10-03 12:56:38', '2022-10-24 05:26:49'),
('C-00011', '1', 135, 'SS CATTEL FARME', NULL, NULL, '01798210130', 'SAFAR PUR', '1', NULL, '2022-10-03 12:57:41', '2022-10-24 05:26:49'),
('C-00012', '1', 136, 'DAUD DOTOLA', NULL, NULL, '018309742146', 'CHAN PUR', '1', NULL, '2022-10-03 12:59:19', '2022-10-24 05:26:49'),
('C-00013', '1', 137, 'MR BABLU', NULL, NULL, '01819089528', 'LOKUR DOKAN', '1', NULL, '2022-10-03 13:00:55', '2022-10-24 05:26:49'),
('C-00014', '1', 138, 'MR TIPU DIS', NULL, NULL, '01813501166', 'AHMMED PUR', '1', NULL, '2022-10-03 13:02:17', '2022-10-24 05:26:49'),
('C-00015', '1', 139, 'MR SOBUJ JAMAI', NULL, NULL, '01816832438', 'AMIR UDDIN MUNSHI', '1', NULL, '2022-10-03 13:03:46', '2022-10-24 05:26:49'),
('C-00016', '1', 140, 'MR SHADAT HOSAIN TIPU', NULL, NULL, '01819666380', 'DOLIA UKIL BARI', '1', NULL, '2022-10-03 13:08:18', '2022-10-24 05:26:49'),
('C-00017', '1', 141, 'MR ATIKULLAH HAZARI', NULL, NULL, '01829574370', 'SAFAR PUR', '1', NULL, '2022-10-03 13:10:48', '2022-10-24 05:26:49'),
('C-00018', '1', 142, 'MR AKRAM MASTAR', NULL, NULL, '01817226872', 'AHMMED PUR', '1', 1, '2022-10-03 13:42:03', '2022-10-24 05:26:49'),
('C-00019', '1', 144, 'MR FORHAD', NULL, NULL, '01762625642', 'BARYAR HAT', '1', 1, '2022-10-04 11:32:06', '2022-10-24 05:26:49'),
('C-00020', '1', 145, 'MR ABU TYOB', NULL, NULL, '01838456596', 'COR KRISNO JOY', '1', 1, '2022-10-08 05:03:02', '2022-10-24 05:26:49'),
('C-00021', '3', 156, 'MR BABUL', NULL, NULL, '01820559310', 'CHOR LAMSI KOMONDAR BARI', '1', 1, '2022-10-26 06:38:38', '2022-10-26 09:10:30'),
('C-00022', '1', 157, 'MR ABUL KASEM', NULL, NULL, '01817732092', 'CHORKRISNO JOY', '1', 1, '2022-10-27 13:45:55', '2022-10-27 13:45:55'),
('C-00023', '1', 158, 'MR SAIFUL', NULL, NULL, '01975096470', 'CHORLAMCI', '1', 1, '2022-10-27 14:05:55', '2022-10-27 14:05:55'),
('C-00024', '1', 159, 'MR DR MASUD', NULL, NULL, '01640125895', 'HAJI PUR', '1', 1, '2022-10-27 14:38:31', '2022-10-27 14:38:31'),
('C-00025', '1', 160, 'MR MEMBAR', NULL, NULL, '01858174793', 'AHMMAD PUR', '1', 1, '2022-10-28 12:04:18', '2022-10-28 12:04:18'),
('C-00026', '1', 161, 'MR BABUL', NULL, NULL, '01820559310', 'CHORLAMCI', '1', 1, '2022-10-29 12:30:37', '2022-10-29 12:30:37'),
('C-00027', '1', 162, 'AZAD VETANARY', NULL, NULL, '01792003849', 'AMIR UDDIN MUNSHIR HAT', '1', 1, '2022-11-11 13:29:27', '2022-11-11 13:29:27'),
('C-00028', '1', 163, 'MR SAGOR', NULL, NULL, '01838671528', 'CHOR KRISNOJOY', '1', 1, '2022-11-18 14:06:39', '2022-11-18 14:06:39'),
('C-00029', '1', 164, 'MR Shadat Hossain', NULL, NULL, '01824482826', NULL, '1', 1, '2022-11-22 04:06:29', '2022-11-22 04:06:29');

-- --------------------------------------------------------

--
-- Table structure for table `damageproducts`
--

CREATE TABLE `damageproducts` (
  `id` int(11) NOT NULL,
  `product_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qty` double(11,2) NOT NULL,
  `date` varchar(20) NOT NULL,
  `admin_id` varchar(20) NOT NULL,
  `branch` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `draft_purchase_entry`
--

CREATE TABLE `draft_purchase_entry` (
  `id` int(10) NOT NULL,
  `invoice_no` varchar(15) NOT NULL,
  `product_id` varchar(15) NOT NULL,
  `sub_unit_id` int(10) DEFAULT NULL,
  `product_quantity` double DEFAULT NULL,
  `purchase_price` double DEFAULT NULL,
  `per_unit_cost` double DEFAULT NULL,
  `sale_price_unit` double(11,2) NOT NULL DEFAULT 0.00,
  `discount_amount` double DEFAULT NULL,
  `pdt_expiry_date` date DEFAULT NULL,
  `entry_date` date DEFAULT NULL,
  `branch_id` varchar(11) DEFAULT NULL,
  `admin_id` varchar(15) DEFAULT NULL,
  `status` int(2) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `draft_purchase_ledger`
--

CREATE TABLE `draft_purchase_ledger` (
  `id` int(10) NOT NULL,
  `invoice_no` varchar(15) NOT NULL,
  `invoice_date` varchar(30) DEFAULT NULL,
  `voucher_no` varchar(191) DEFAULT NULL,
  `voucher_date` varchar(20) DEFAULT NULL,
  `suplier_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total` double(11,2) NOT NULL DEFAULT 0.00,
  `paid` double(11,2) DEFAULT 0.00,
  `discount` double(11,2) DEFAULT 0.00,
  `transaction_type` varchar(50) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `entry_date` varchar(20) DEFAULT NULL,
  `admin_id` int(10) DEFAULT NULL,
  `branch_id` varchar(15) DEFAULT NULL,
  `status` varchar(15) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `draft_sales_entry`
--

CREATE TABLE `draft_sales_entry` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_no` varchar(15) DEFAULT NULL,
  `product_id` varchar(15) NOT NULL,
  `sub_unit_id` varchar(10) DEFAULT NULL,
  `product_quantity` double(11,2) NOT NULL,
  `product_purchase_price` double(11,2) DEFAULT NULL,
  `product_sales_price` double(11,2) NOT NULL,
  `product_discount_amount` varchar(191) NOT NULL,
  `return_quantity` double(11,2) NOT NULL DEFAULT 0.00,
  `entry_date` varchar(20) DEFAULT NULL,
  `branch_id` varchar(11) DEFAULT NULL,
  `note` varchar(191) DEFAULT NULL,
  `status` int(2) DEFAULT 0,
  `admin_id` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `draft_sales_ledger`
--

CREATE TABLE `draft_sales_ledger` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_no` varchar(15) NOT NULL,
  `invoice_date` varchar(50) DEFAULT NULL,
  `customer_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `total` double(11,2) DEFAULT 0.00,
  `final_discount` double(11,2) DEFAULT 0.00,
  `paid_amount` double(11,2) DEFAULT 0.00,
  `return_amount` double(11,2) DEFAULT 0.00,
  `vat` double(11,2) DEFAULT 0.00,
  `note` mediumtext DEFAULT NULL,
  `transaction_type` varchar(50) DEFAULT NULL,
  `entry_date` varchar(50) DEFAULT NULL,
  `branch_id` varchar(11) DEFAULT NULL,
  `status` int(2) DEFAULT 0,
  `admin_id` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `draft_sales_payment`
--

CREATE TABLE `draft_sales_payment` (
  `id` int(10) NOT NULL,
  `invoice_no` varchar(15) DEFAULT NULL,
  `entry_date` varchar(50) DEFAULT NULL,
  `payment_amount` double(11,2) DEFAULT 0.00,
  `return_amount` double(11,2) DEFAULT 0.00,
  `discount` double(11,2) DEFAULT 0.00,
  `customer_id` varchar(20) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `note` tinytext DEFAULT NULL,
  `branch_id` varchar(11) DEFAULT NULL,
  `status` int(2) DEFAULT 0,
  `admin_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `draft_supplier_payment`
--

CREATE TABLE `draft_supplier_payment` (
  `id` int(10) NOT NULL,
  `invoice_no` varchar(15) DEFAULT NULL,
  `payment_date` varchar(50) DEFAULT NULL,
  `suplier_id` varchar(20) DEFAULT NULL,
  `payment` double(11,2) DEFAULT 0.00,
  `discount` double(11,2) DEFAULT 0.00,
  `payment_type` varchar(50) DEFAULT NULL,
  `return_amount` double(11,2) DEFAULT 0.00,
  `entry_date` varchar(20) DEFAULT NULL,
  `status` int(2) DEFAULT 0,
  `admin_id` varchar(50) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `branch_id` varchar(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_info`
--

CREATE TABLE `employee_info` (
  `id` int(10) NOT NULL,
  `employee_name` varchar(255) DEFAULT NULL,
  `employee_phone` varchar(64) DEFAULT NULL,
  `employee_email` varchar(64) DEFAULT NULL,
  `employee_address` text DEFAULT NULL,
  `employee_nid` varchar(64) DEFAULT NULL,
  `employee_picture` varchar(255) DEFAULT NULL,
  `branch` varchar(15) DEFAULT NULL,
  `admin` varchar(15) DEFAULT NULL,
  `joining_date` varchar(64) DEFAULT NULL,
  `status` int(5) DEFAULT 1,
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `employee_info`
--

INSERT INTO `employee_info` (`id`, `employee_name`, `employee_phone`, `employee_email`, `employee_address`, `employee_nid`, `employee_picture`, `branch`, `admin`, `joining_date`, `status`, `create_date`, `update_date`) VALUES
(7, 'Test', '01811358605', NULL, 'Feni', NULL, NULL, '1', '1', '2022-12-20', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_salary_initialized`
--

CREATE TABLE `employee_salary_initialized` (
  `id` int(10) NOT NULL,
  `employee_id` varchar(10) DEFAULT NULL,
  `employee_salary` double(11,2) DEFAULT 0.00,
  `salary_status` int(5) DEFAULT 1,
  `date` varchar(20) DEFAULT NULL,
  `branch_id` varchar(15) DEFAULT NULL,
  `admin_id` varchar(15) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_salary_initialized`
--

INSERT INTO `employee_salary_initialized` (`id`, `employee_id`, `employee_salary`, `salary_status`, `date`, `branch_id`, `admin_id`, `create_date`, `update_date`) VALUES
(7, '7', 5000.00, 1, '2022-12-20', '1', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_salary_payment`
--

CREATE TABLE `employee_salary_payment` (
  `id` int(10) NOT NULL,
  `employee_id` varchar(10) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `month` varchar(50) DEFAULT NULL,
  `year` varchar(50) DEFAULT NULL,
  `transaction_type` varchar(255) DEFAULT NULL,
  `salary_deposit` double(11,2) DEFAULT NULL,
  `salary_withdraw` double(11,2) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `branch_id` varchar(10) DEFAULT NULL,
  `admin_id` varchar(10) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_salary_payment`
--

INSERT INTO `employee_salary_payment` (`id`, `employee_id`, `date`, `month`, `year`, `transaction_type`, `salary_deposit`, `salary_withdraw`, `note`, `branch_id`, `admin_id`, `create_date`, `update_date`) VALUES
(22, '7', '2022-12-20', '12', '2022', '', 5000.00, 0.00, '', '1', '1', NULL, NULL),
(23, '7', '2022-12-20', NULL, NULL, '54545', 0.00, 5000.00, 'test', '1', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expense_entry`
--

CREATE TABLE `expense_entry` (
  `id` varchar(20) NOT NULL,
  `sl` int(11) NOT NULL,
  `date` varchar(30) NOT NULL,
  `entry_date` varchar(20) NOT NULL,
  `expense_id` varchar(10) NOT NULL,
  `amount` double(11,2) NOT NULL,
  `note` text DEFAULT NULL,
  `admin` varchar(20) DEFAULT NULL,
  `branch` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `expense_entry`
--

INSERT INTO `expense_entry` (`id`, `sl`, `date`, `entry_date`, `expense_id`, `amount`, `note`, `admin`, `branch`) VALUES
('EXP-000001', 13, '07-08-2022', '2022-11-05', 'INE-000005', 459.00, NULL, '1', '1'),
('EXP-000002', 14, '07-08-2022', '2022-11-05', 'INE-000008', 600.00, 'BULV', '1', '1'),
('EXP-000003', 15, '08-08-2022', '2022-11-05', 'INE-000005', 20.00, NULL, '1', '1'),
('EXP-000004', 16, '09-08-2022', '2022-11-05', 'INE-000005', 145.00, NULL, '1', '1'),
('EXP-000005', 17, '09-08-2022', '2022-11-05', 'INE-000007', 630.00, NULL, '1', '1'),
('EXP-000006', 18, '10-08-2022', '2022-11-05', 'INE-000005', 292.00, NULL, '1', '1'),
('EXP-000007', 19, '11-08-2022', '2022-11-05', 'INE-000005', 166.00, NULL, '1', '1'),
('EXP-000008', 20, '11-08-2022', '2022-11-05', 'INE-000006', 50.00, NULL, '1', '1'),
('EXP-000009', 21, '13-08-2022', '2022-11-05', 'INE-000005', 120.00, NULL, '1', '1'),
('EXP-000010', 22, '14-08-2022', '2022-11-05', 'INE-000005', 135.00, NULL, '1', '1'),
('EXP-000011', 23, '15-08-2022', '2022-11-05', 'INE-000006', 230.00, NULL, '1', '1'),
('EXP-000012', 24, '15-08-2022', '2022-11-05', 'INE-000011', 600.00, 'RFL TULL', '1', '1'),
('EXP-000013', 25, '16-08-2022', '2022-11-05', 'INE-000005', 342.00, NULL, '1', '1'),
('EXP-000014', 26, '17-08-2022', '2022-11-05', 'INE-000005', 273.00, NULL, '1', '1'),
('EXP-000015', 27, '18-08-2022', '2022-11-05', 'INE-000005', 60.00, NULL, '1', '1'),
('EXP-000016', 28, '19-08-2022', '2022-11-05', 'INE-000005', 135.00, NULL, '1', '1'),
('EXP-000017', 29, '20-08-2022', '2022-11-05', 'INE-000005', 335.00, NULL, '1', '1'),
('EXP-000018', 30, '21-08-2022', '2022-11-05', 'INE-000005', 80.00, NULL, '1', '1'),
('EXP-000019', 31, '21-08-2022', '2022-11-05', 'INE-000006', 140.00, 'POLITHIN', '1', '1'),
('EXP-000020', 32, '22-08-2022', '2022-11-05', 'INE-000005', 130.00, NULL, '1', '1'),
('EXP-000021', 33, '23-08-2022', '2022-11-05', 'INE-000005', 235.00, NULL, '1', '1'),
('EXP-000022', 34, '24-08-2022', '2022-11-05', 'INE-000001', 177.00, NULL, '1', '1'),
('EXP-000023', 35, '25-08-2022', '2022-11-05', 'INE-000005', 35.00, NULL, '1', '1'),
('EXP-000024', 36, '26-08-2022', '2022-11-05', 'INE-000005', 176.00, NULL, '1', '1'),
('EXP-000025', 37, '27-08-2022', '2022-11-05', 'INE-000005', 73.00, NULL, '1', '1'),
('EXP-000026', 38, '27-08-2022', '2022-11-05', 'INE-000004', 17.00, NULL, '1', '1'),
('EXP-000027', 39, '28-08-2022', '2022-11-05', 'INE-000005', 85.00, NULL, '1', '1'),
('EXP-000028', 40, '28-08-2022', '2022-11-05', 'INE-000016', 200.00, 'ADVANCH SEYLARY', '1', '1'),
('EXP-000029', 41, '29-09-2022', '2022-11-05', 'INE-000005', 121.00, NULL, '1', '1'),
('EXP-000030', 42, '30-08-2022', '2022-11-05', 'INE-000005', 234.00, NULL, '1', '1'),
('EXP-000031', 43, '31-08-2022', '2022-11-05', 'INE-000005', 125.00, NULL, '1', '1'),
('EXP-000032', 44, '01-09-2022', '2022-11-05', 'INE-000006', 70.00, 'POLITHIN', '1', '1'),
('EXP-000033', 45, '01-09-2022', '2022-11-05', 'INE-000001', 225.00, NULL, '1', '1'),
('EXP-000034', 46, '02-09-2022', '2022-11-05', 'INE-000005', 25.00, NULL, '1', '1'),
('EXP-000035', 47, '03-09-2022', '2022-11-05', 'INE-000005', 95.00, NULL, '1', '1'),
('EXP-000036', 48, '03-09-2022', '2022-11-05', 'INE-000004', 14.00, NULL, '1', '1'),
('EXP-000037', 49, '04-09-2022', '2022-11-05', 'INE-000005', 115.00, NULL, '1', '1'),
('EXP-000038', 50, '05-09-2022', '2022-11-05', 'INE-000017', 200.00, NULL, '1', '1'),
('EXP-000039', 51, '05-09-2022', '2022-11-05', 'INE-000005', 120.00, NULL, '1', '1'),
('EXP-000040', 52, '05-09-2022', '2022-11-05', 'INE-000018', 500.00, NULL, '1', '1'),
('EXP-000041', 53, '05-09-2022', '2022-11-05', 'INE-000005', 89.00, NULL, '1', '1'),
('EXP-000042', 54, '06-09-2022', '2022-11-05', 'INE-000005', 111.00, NULL, '1', '1'),
('EXP-000043', 55, '07-09-2022', '2022-11-05', 'INE-000001', 190.00, NULL, '1', '1'),
('EXP-000044', 56, '08-09-2022', '2022-11-05', 'INE-000005', 30.00, NULL, '1', '1'),
('EXP-000045', 57, '10-09-2022', '2022-11-05', 'INE-000005', 115.00, NULL, '1', '1'),
('EXP-000046', 58, '11-09-2022', '2022-11-05', 'INE-000005', 115.00, NULL, '1', '1'),
('EXP-000047', 59, '12-09-2022', '2022-11-05', 'INE-000004', 8.00, NULL, '1', '1'),
('EXP-000048', 60, '12-09-2022', '2022-11-05', 'INE-000005', 30.00, NULL, '1', '1'),
('EXP-000049', 61, '13-09-2022', '2022-11-05', 'INE-000005', 30.00, NULL, '1', '1'),
('EXP-000050', 62, '13-09-2022', '2022-11-05', 'INE-000016', 100.00, NULL, '1', '1'),
('EXP-000051', 63, '14-09-2022', '2022-11-05', 'INE-000005', 135.00, NULL, '1', '1'),
('EXP-000052', 64, '14-09-2022', '2022-11-05', 'INE-000016', 50.00, NULL, '1', '1'),
('EXP-000053', 65, '15-09-2022', '2022-11-05', 'INE-000005', 60.00, NULL, '1', '1'),
('EXP-000054', 66, '15-09-2022', '2022-11-05', 'INE-000016', 450.00, NULL, '1', '1'),
('EXP-000055', 67, '16-09-2022', '2022-11-05', 'INE-000005', 190.00, NULL, '1', '1'),
('EXP-000056', 68, '16-09-2022', '2022-11-05', 'INE-000016', 100.00, NULL, '1', '1'),
('EXP-000057', 69, '17-09-2022', '2022-11-05', 'INE-000005', 370.00, NULL, '1', '1'),
('EXP-000058', 70, '18-09-2022', '2022-11-05', 'INE-000005', 327.00, NULL, '1', '1'),
('EXP-000059', 71, '18-09-2022', '2022-11-05', 'INE-000016', 500.00, NULL, '1', '1'),
('EXP-000060', 72, '19-09-2022', '2022-11-05', 'INE-000005', 85.00, NULL, '1', '1'),
('EXP-000061', 73, '20-09-2022', '2022-11-05', 'INE-000005', 106.00, NULL, '1', '1'),
('EXP-000062', 74, '21-09-2022', '2022-11-05', 'INE-000005', 231.00, NULL, '1', '1'),
('EXP-000063', 75, '21-09-2022', '2022-11-05', 'INE-000005', 181.00, NULL, '1', '1'),
('EXP-000064', 76, '22-09-2022', '2022-11-05', 'INE-000005', 171.00, NULL, '1', '1'),
('EXP-000065', 77, '23-09-2022', '2022-11-05', 'INE-000005', 75.00, NULL, '1', '1'),
('EXP-000066', 78, '24-09-2022', '2022-11-05', 'INE-000004', 14.00, NULL, '1', '1'),
('EXP-000067', 79, '24-09-2022', '2022-11-05', 'INE-000006', 70.00, 'GARU', '1', '1'),
('EXP-000068', 80, '24-09-2022', '2022-11-05', 'INE-000016', 500.00, NULL, '1', '1'),
('EXP-000069', 81, '24-09-2022', '2022-11-05', 'INE-000005', 300.00, NULL, '1', '1'),
('EXP-000070', 82, '24-09-2022', '2022-11-05', 'INE-000005', 20.00, NULL, '1', '1'),
('EXP-000071', 83, '25-09-2022', '2022-11-05', 'INE-000005', 753.00, NULL, '1', '1'),
('EXP-000072', 84, '25-09-2022', '2022-11-05', 'INE-000006', 50.00, NULL, '1', '1'),
('EXP-000073', 85, '27-09-2022', '2022-11-05', 'INE-000016', 9000.00, 'ADVANCH SEYLARY', '1', '1'),
('EXP-000074', 86, '01-10-2022', '2022-11-09', 'INE-000005', 155.00, NULL, '1', '1'),
('EXP-000075', 87, '01-10-2022', '2022-11-09', 'INE-000004', 20.00, NULL, '1', '1'),
('EXP-000076', 88, '02-10-2022', '2022-11-09', 'INE-000004', 22.00, NULL, '1', '1'),
('EXP-000077', 89, '03-10-2022', '2022-11-09', 'INE-000005', 650.00, NULL, '1', '1'),
('EXP-000078', 90, '03-10-2022', '2022-11-09', 'INE-000006', 455.00, NULL, '1', '1'),
('EXP-000079', 91, '04-10-2022', '2022-11-09', 'INE-000005', 221.00, NULL, '1', '1'),
('EXP-000080', 92, '05-10-2022', '2022-11-09', 'INE-000005', 233.00, NULL, '1', '1'),
('EXP-000081', 93, '05-10-2022', '2022-11-09', 'INE-000017', 200.00, NULL, '1', '1'),
('EXP-000082', 94, '06-10-2022', '2022-11-09', 'INE-000005', 50.00, NULL, '1', '1'),
('EXP-000083', 95, '06-10-2022', '2022-11-09', 'INE-000004', 30.00, NULL, '1', '1'),
('EXP-000084', 96, '07-10-2022', '2022-11-09', 'INE-000005', 102.00, NULL, '1', '1'),
('EXP-000085', 97, '07-10-2022', '2022-11-09', 'INE-000005', 429.00, NULL, '1', '1'),
('EXP-000086', 98, '08-10-2022', '2022-11-09', 'INE-000004', 10.00, NULL, '1', '1'),
('EXP-000087', 99, '09-11-2022', '2022-11-09', 'INE-000005', 195.00, NULL, '1', '1'),
('EXP-000088', 100, '10-10-2022', '2022-11-09', 'INE-000016', 500.00, NULL, '1', '1'),
('EXP-000089', 101, '11-10-2022', '2022-11-09', 'INE-000001', 288.00, NULL, '1', '1'),
('EXP-000090', 102, '11-10-2022', '2022-11-09', 'INE-000004', 10.00, NULL, '1', '1'),
('EXP-000091', 103, '11-10-2022', '2022-11-09', 'INE-000006', 250.00, NULL, '1', '1'),
('EXP-000092', 104, '12-10-2022', '2022-11-09', 'INE-000005', 311.00, NULL, '1', '1'),
('EXP-000093', 105, '12-10-2022', '2022-11-09', 'INE-000006', 80.00, NULL, '1', '1'),
('EXP-000094', 106, '14-10-2022', '2022-11-09', 'INE-000005', 182.00, NULL, '1', '1'),
('EXP-000095', 107, '14-10-2022', '2022-11-10', 'INE-000005', 182.00, NULL, '1', '1'),
('EXP-000096', 108, '17-10-2022', '2022-11-10', 'INE-000005', 218.00, NULL, '1', '1'),
('EXP-000097', 109, '17-10-2022', '2022-11-10', 'INE-000004', 20.00, NULL, '1', '1'),
('EXP-000098', 110, '18-10-2022', '2022-11-10', 'INE-000005', 90.00, NULL, '1', '1'),
('EXP-000099', 111, '18-10-2022', '2022-11-10', 'INE-000005', 35.00, NULL, '1', '1'),
('EXP-000100', 112, '19-10-2022', '2022-11-10', 'INE-000005', 181.00, NULL, '1', '1'),
('EXP-000101', 113, '19-10-2022', '2022-11-10', 'INE-000016', 2500.00, NULL, '1', '1'),
('EXP-000102', 114, '19-10-2022', '2022-11-10', 'INE-000001', 3000.00, NULL, '1', '1'),
('EXP-000103', 115, '20-10-2022', '2022-11-10', 'INE-000004', 20.00, NULL, '1', '1'),
('EXP-000104', 116, '20-10-2022', '2022-11-10', 'INE-000005', 90.00, NULL, '1', '1'),
('EXP-000105', 117, '21-10-2022', '2022-11-10', 'INE-000005', 407.00, NULL, '1', '1'),
('EXP-000106', 118, '21-10-2022', '2022-11-10', 'INE-000006', 126.00, NULL, '1', '1'),
('EXP-000107', 119, '22-10-2022', '2022-11-10', 'INE-000005', 505.00, NULL, '1', '1'),
('EXP-000108', 120, '23-10-2022', '2022-11-10', 'INE-000004', 15.00, NULL, '1', '1'),
('EXP-000109', 121, '23-10-2022', '2022-11-10', 'INE-000005', 62.00, NULL, '1', '1'),
('EXP-000110', 122, '24-10-2022', '2022-11-10', 'INE-000005', 24.00, NULL, '1', '1'),
('EXP-000111', 123, '24-10-2022', '2022-11-10', 'INE-000005', 35.00, NULL, '1', '1'),
('EXP-000112', 124, '25-10-2022', '2022-11-10', 'INE-000005', 85.00, NULL, '1', '1'),
('EXP-000113', 125, '25-10-2022', '2022-11-10', 'INE-000004', 5.00, NULL, '1', '1'),
('EXP-000114', 126, '26-10-2022', '2022-11-10', 'INE-000005', 196.00, NULL, '1', '1'),
('EXP-000115', 127, '26-10-2022', '2022-11-10', 'INE-000004', 20.00, NULL, '1', '1'),
('EXP-000116', 128, '27-10-2022', '2022-11-10', 'INE-000007', 60.00, NULL, '1', '1'),
('EXP-000117', 129, '28-10-2022', '2022-11-10', 'INE-000005', 309.00, NULL, '1', '1'),
('EXP-000118', 130, '28-10-2022', '2022-11-10', 'INE-000016', 700.00, NULL, '1', '1'),
('EXP-000119', 131, '29-10-2022', '2022-11-10', 'INE-000005', 100.00, NULL, '1', '1'),
('EXP-000120', 132, '29-10-2022', '2022-11-10', 'INE-000016', 1000.00, NULL, '1', '1'),
('EXP-000121', 133, '29-10-2022', '2022-11-10', 'INE-000004', 15.00, NULL, '1', '1'),
('EXP-000122', 134, '30-10-2022', '2022-11-10', 'INE-000005', 161.00, NULL, '1', '1'),
('EXP-000123', 135, '30-10-2022', '2022-11-10', 'INE-000004', 10.00, NULL, '1', '1'),
('EXP-000124', 136, '30-10-2022', '2022-11-10', 'INE-000007', 50.00, NULL, '1', '1'),
('EXP-000125', 137, '31-10-2022', '2022-11-10', 'INE-000005', 100.00, NULL, '1', '1'),
('EXP-000126', 138, '31-10-2022', '2022-11-10', 'INE-000002', 2300.00, NULL, '1', '1'),
('EXP-000127', 139, '01-11-2022', '2022-11-10', 'INE-000005', 100.00, NULL, '1', '1'),
('EXP-000128', 140, '01-11-2022', '2022-11-10', 'INE-000005', 45.00, NULL, '1', '1'),
('EXP-000129', 141, '02-11-2022', '2022-11-10', 'INE-000005', 190.00, NULL, '1', '1'),
('EXP-000130', 142, '02-11-2022', '2022-11-10', 'INE-000007', 50.00, NULL, '1', '1'),
('EXP-000131', 143, '03-11-2022', '2022-11-10', 'INE-000004', 15.00, NULL, '1', '1'),
('EXP-000132', 144, '03-11-2022', '2022-11-10', 'INE-000005', 50.00, NULL, '1', '1'),
('EXP-000133', 145, '04-11-2022', '2022-11-10', 'INE-000004', 12.00, NULL, '1', '1'),
('EXP-000134', 146, '04-11-2022', '2022-11-10', 'INE-000004', 60.00, NULL, '1', '1'),
('EXP-000135', 147, '05-11-2022', '2022-11-10', 'INE-000017', 200.00, NULL, '1', '1'),
('EXP-000136', 148, '05-11-2022', '2022-11-10', 'INE-000005', 40.00, NULL, '1', '1'),
('EXP-000137', 149, '05-11-2022', '2022-11-10', 'INE-000007', 50.00, NULL, '1', '1'),
('EXP-000138', 150, '06-11-2022', '2022-11-11', 'INE-000005', 400.00, NULL, '1', '1'),
('EXP-000139', 151, '06-11-2022', '2022-11-11', 'INE-000004', 10.00, NULL, '1', '1'),
('EXP-000140', 152, '07-11-2022', '2022-11-11', 'INE-000004', 5.00, NULL, '1', '1'),
('EXP-000141', 153, '07-11-2022', '2022-11-11', 'INE-000007', 50.00, NULL, '1', '1'),
('EXP-000142', 154, '08-11-2022', '2022-11-11', 'INE-000005', 215.00, NULL, '1', '1'),
('EXP-000143', 155, '09-11-2022', '2022-11-11', 'INE-000005', 272.00, NULL, '1', '1'),
('EXP-000144', 156, '10-11-2022', '2022-11-11', 'INE-000018', 1000.00, NULL, '1', '1'),
('EXP-000145', 157, '10-11-2022', '2022-11-11', 'INE-000005', 197.00, NULL, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income_entry`
--

CREATE TABLE `income_entry` (
  `id` varchar(20) NOT NULL,
  `sl` int(11) NOT NULL,
  `date` varchar(30) NOT NULL,
  `entry_date` varchar(20) NOT NULL,
  `income_id` varchar(10) NOT NULL,
  `amount` double(11,2) NOT NULL,
  `note` text DEFAULT NULL,
  `admin` varchar(20) DEFAULT NULL,
  `branch` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `income_entry`
--

INSERT INTO `income_entry` (`id`, `sl`, `date`, `entry_date`, `income_id`, `amount`, `note`, `admin`, `branch`) VALUES
('INC-000001', 11, '20-12-2022', '2022-12-20', 'INE-000013', 40.00, 'test', '1', '1'),
('INC-000002', 12, '20-12-2022', '2022-12-20', 'INE-000014', 60.00, 'test', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `income_expense_title`
--

CREATE TABLE `income_expense_title` (
  `id` varchar(20) NOT NULL,
  `sl` int(11) NOT NULL,
  `title` text NOT NULL,
  `details` text DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `branch` varchar(20) DEFAULT NULL,
  `admin` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `income_expense_title`
--

INSERT INTO `income_expense_title` (`id`, `sl`, `title`, `details`, `type`, `branch`, `admin`) VALUES
('INE-000001', 12, 'SHOP RENT', NULL, 'Expense', '1', '1'),
('INE-000002', 13, 'FEED CARRYING EXP', NULL, 'Expense', '1', '1'),
('INE-000003', 14, 'LABOR EXP', NULL, 'Expense', '1', '1'),
('INE-000004', 15, 'DONATION', NULL, 'Expense', '1', '1'),
('INE-000005', 16, 'ENTERTAINMENT', NULL, 'Expense', '1', '1'),
('INE-000006', 17, 'STATIONARY', NULL, 'Expense', '1', '1'),
('INE-000007', 18, 'CONVEYANCE', NULL, 'Expense', '1', '1'),
('INE-000008', 19, 'ELECTRIC & EQUIPMENTS', NULL, 'Expense', '1', '1'),
('INE-000009', 20, 'DECORATIONS', NULL, 'Expense', '1', '1'),
('INE-000010', 21, 'CAPITAL WITHDRAW', NULL, 'Expense', '1', '1'),
('INE-000011', 22, 'Furniture', NULL, 'Expense', '1', '1'),
('INE-000012', 23, 'Others EXP', NULL, 'Expense', '1', '1'),
('INE-000013', 24, 'OTHERS  INCOME', NULL, 'Income', '1', '1'),
('INE-000014', 25, 'SUPPLIER Commission', NULL, 'Income', '1', '1'),
('INE-000015', 26, 'CUSTOMER Commission Discounted', NULL, 'Expense', '1', '1'),
('INE-000016', 27, 'STAFF SALARY', NULL, 'Expense', '1', '1'),
('INE-000017', 28, 'NIGHT GAD', NULL, 'Expense', '1', '1'),
('INE-000018', 29, 'ELECTICITY', NULL, 'Expense', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `internalloanprovide`
--

CREATE TABLE `internalloanprovide` (
  `id` int(20) NOT NULL,
  `register_id` varchar(50) NOT NULL,
  `amount` double(11,2) NOT NULL,
  `date` varchar(50) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `internalloanprovide`
--

INSERT INTO `internalloanprovide` (`id`, `register_id`, `amount`, `date`, `branch`, `note`) VALUES
(4, '1', 500.00, '08-11-2022', '1', 'Bkash'),
(6, '1', 40.00, '27-11-2022', '1', 'TEST'),
(7, '4', 40.00, '05-12-2022', 'BRC-01', 'TEST');

-- --------------------------------------------------------

--
-- Table structure for table `internalloanreceived`
--

CREATE TABLE `internalloanreceived` (
  `id` int(20) NOT NULL,
  `register_id` varchar(50) NOT NULL,
  `amount` double(11,2) NOT NULL,
  `date` varchar(50) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `internalloanreceived`
--

INSERT INTO `internalloanreceived` (`id`, `register_id`, `amount`, `date`, `branch`, `note`) VALUES
(4, '4', 40.00, '05-12-2022', 'BRC-01', 'TEST');

-- --------------------------------------------------------

--
-- Table structure for table `internalloanregister`
--

CREATE TABLE `internalloanregister` (
  `id` int(50) NOT NULL,
  `name` varchar(55) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `branch` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `internalloanregister`
--

INSERT INTO `internalloanregister` (`id`, `name`, `phone`, `address`, `branch`) VALUES
(1, 'Shuvo', '01811358605', 'Feni', '1'),
(3, 'admin', '01811358602', 'Feni', '1'),
(4, 'shuvo', '01788283580', 'Feni', 'BRC-01');

-- --------------------------------------------------------

--
-- Table structure for table `librality`
--

CREATE TABLE `librality` (
  `id` varchar(20) NOT NULL,
  `sl` int(11) NOT NULL,
  `date` varchar(30) NOT NULL,
  `entry_date` varchar(20) NOT NULL,
  `expense_id` varchar(10) NOT NULL,
  `amount` double(11,2) NOT NULL,
  `note` text DEFAULT NULL,
  `admin` varchar(20) DEFAULT NULL,
  `branch` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `librality`
--

INSERT INTO `librality` (`id`, `sl`, `date`, `entry_date`, `expense_id`, `amount`, `note`, `admin`, `branch`) VALUES
('LIB-000001', 159, '15-12-2022', '2022-12-19', 'INE-000015', 200.00, 'test', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `loanprovide`
--

CREATE TABLE `loanprovide` (
  `id` int(20) NOT NULL,
  `register_id` varchar(50) NOT NULL,
  `amount` double(11,2) NOT NULL,
  `date` varchar(50) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loanprovide`
--

INSERT INTO `loanprovide` (`id`, `register_id`, `amount`, `date`, `branch`, `note`) VALUES
(4, '1', 500.00, '08-11-2022', '1', 'Bkash'),
(5, '3', 40.00, '26-11-2022', '1', 'TEST'),
(6, '4', 40.00, '05-12-2022', 'BRC-01', 'TEST');

-- --------------------------------------------------------

--
-- Table structure for table `loanreceived`
--

CREATE TABLE `loanreceived` (
  `id` int(20) NOT NULL,
  `register_id` varchar(50) NOT NULL,
  `amount` double(11,2) NOT NULL,
  `date` varchar(50) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loanreceived`
--

INSERT INTO `loanreceived` (`id`, `register_id`, `amount`, `date`, `branch`, `note`) VALUES
(3, '1', 40.00, '26-11-2022', '1', 'TEST'),
(4, '3', 40.00, '26-11-2022', '1', 'TEST'),
(5, '4', 40.00, '05-12-2022', 'BRC-01', 'TEST');

-- --------------------------------------------------------

--
-- Table structure for table `loanregister`
--

CREATE TABLE `loanregister` (
  `id` int(50) NOT NULL,
  `name` varchar(55) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `branch` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loanregister`
--

INSERT INTO `loanregister` (`id`, `name`, `phone`, `address`, `branch`) VALUES
(4, 'abc', 'abc', 'Feni', 'BRC-01');

-- --------------------------------------------------------

--
-- Table structure for table `measurement_subunit`
--

CREATE TABLE `measurement_subunit` (
  `id` varchar(10) NOT NULL,
  `sl` int(10) NOT NULL,
  `measurement_unit_id` varchar(10) NOT NULL,
  `sub_unit_name` varchar(64) DEFAULT NULL,
  `sub_unit_data` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `measurement_subunit`
--

INSERT INTO `measurement_subunit` (`id`, `sl`, `measurement_unit_id`, `sub_unit_name`, `sub_unit_data`) VALUES
('10', 4, '3', 'PAKET', 1),
('11', 5, '6', 'BANDEL', 1),
('13', 6, '5', 'COYEL', 1),
('19', 7, '7', 'Feet', 1),
('20', 8, '8', 'KG', 1),
('21', 9, '9', 'Pound', 1),
('22', 10, '10', 'Tola', 1),
('23', 11, '11', 'Liter', 1),
('24', 12, '12', 'Goj', 1),
('25', 13, '13', 'Set', 1),
('26', 14, '14', 'Meter', 1),
('27', 15, '15', 'Bag', 1),
('3', 1, '1', 'Piece', 1),
('5', 2, '2', 'DOZEN', 1),
('8', 3, '4', 'box', 1);

-- --------------------------------------------------------

--
-- Table structure for table `measurement_unit`
--

CREATE TABLE `measurement_unit` (
  `measurement_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `measurement_sl` int(11) NOT NULL,
  `measurement_unit` varchar(64) NOT NULL,
  `measurement_admin_id` varchar(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `measurement_unit`
--

INSERT INTO `measurement_unit` (`measurement_id`, `measurement_sl`, `measurement_unit`, `measurement_admin_id`, `created_at`, `updated_at`) VALUES
('1', 1, 'Piece', '1', '2018-01-31 20:42:31', NULL),
('10', 10, 'Tola', NULL, '2021-06-18 19:57:01', NULL),
('11', 11, 'Liter', NULL, '2021-06-20 21:07:26', NULL),
('12', 12, 'Goj', NULL, '2021-06-21 17:28:04', NULL),
('13', 13, 'Set', NULL, '2021-06-23 00:50:08', NULL),
('14', 14, 'Meter', NULL, '2021-06-25 23:59:18', NULL),
('15', 15, 'Bag', NULL, '2021-07-01 21:22:49', NULL),
('2', 2, 'Dozen', NULL, '2018-02-02 13:25:28', '2021-06-18 21:45:12'),
('3', 3, 'Packet', NULL, '2018-02-03 17:57:31', '2021-07-14 16:09:47'),
('4', 4, 'Box', NULL, '2018-02-03 18:07:53', '2021-07-14 13:43:37'),
('5', 5, 'Coil', '1', '2018-02-22 22:09:52', '2021-07-14 13:45:04'),
('6', 6, 'Bundle', NULL, '2018-05-02 13:06:20', '2021-07-16 21:33:40'),
('7', 7, 'Feet', '1', '2021-06-18 21:43:19', '2021-06-18 21:45:00'),
('8', 8, 'Kg', NULL, '2021-06-18 23:43:25', '2021-07-14 16:08:33'),
('9', 9, 'Pound', NULL, '2021-06-18 19:54:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2022_06_14_081249_create_admins_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pdt_brand`
--

CREATE TABLE `pdt_brand` (
  `brand_id` varchar(11) NOT NULL,
  `brand_sl` int(10) NOT NULL,
  `brand_name_en` varchar(64) DEFAULT NULL,
  `brand_name_bn` varchar(255) DEFAULT NULL,
  `brand_logo` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_banner` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_status` tinyint(1) DEFAULT 1,
  `brand_admin_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `pdt_brand`
--

INSERT INTO `pdt_brand` (`brand_id`, `brand_sl`, `brand_name_en`, `brand_name_bn`, `brand_logo`, `brand_banner`, `brand_status`, `brand_admin_id`, `created_at`, `updated_at`) VALUES
('BRN-000002', 430, 'ACME', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000003', 431, 'skf', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000004', 432, 'Renata', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000005', 433, 'opsonin', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000006', 434, 'EON', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000007', 435, 'ELANCO', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000008', 436, 'DREAM AGRO', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000009', 437, 'ACI', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000010', 438, 'NEWTEC', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000011', 439, 'AVON', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000012', 440, 'SUN AGRO', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000013', 441, 'TAKWA CHICKS', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000014', 442, 'TOP TEN CHICKS', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000016', 445, 'GAUSIA FEED & CHICKS', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000017', 446, 'DAIMOND CHICKS', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000018', 447, 'KAZI', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000019', 448, 'BOGURA CHICKS', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000020', 449, 'DOCTORS AGRO', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000021', 450, 'POPULAR', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000022', 451, 'NAVANA', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000023', 452, 'FHARMA&FARM', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000024', 453, 'HAMDARD', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000025', 454, 'ADVANCE', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000026', 455, 'TECHNO DRUGS', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000027', 456, 'SQUARE', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000028', 457, 'RAFIQUE MEDICINE', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000029', 458, 'AFTAB FEED&CHICKS', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000030', 459, 'ASTA FEED', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000031', 460, 'MADI VET', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000032', 461, 'TAKWA CHICKS', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000033', 462, 'NOVIVO', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000034', 463, 'ALAL POULTRY&FISH FEED', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000035', 464, 'VAIJOO&BROTHERS', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000036', 467, 'SKY TECH', NULL, NULL, NULL, 1, '1', NULL, NULL),
('BRN-000037', 468, 'GLOBE', NULL, NULL, NULL, 1, '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pdt_category`
--

CREATE TABLE `pdt_category` (
  `cat_id` varchar(11) NOT NULL,
  `cat_sl` int(10) NOT NULL,
  `cat_item_id` varchar(11) DEFAULT NULL,
  `cat_name_en` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_name_bn` varchar(255) DEFAULT NULL,
  `cat_image` varbinary(64) DEFAULT NULL,
  `cat_banner` varbinary(64) DEFAULT NULL,
  `cat_url` varchar(64) DEFAULT NULL,
  `cat_status` tinyint(1) DEFAULT 1,
  `cat_admin_id` varbinary(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `pdt_category`
--

INSERT INTO `pdt_category` (`cat_id`, `cat_sl`, `cat_item_id`, `cat_name_en`, `cat_name_bn`, `cat_image`, `cat_banner`, `cat_url`, `cat_status`, `cat_admin_id`, `created_at`, `updated_at`) VALUES
('CAT-000001', 2751, 'ITM-000001', 'FEED', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000002', 2752, 'ITM-000002', 'FEED', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000003', 2753, 'ITM-000003', 'FEED', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000004', 2754, 'ITM-000004', 'FEED', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000005', 2755, 'ITM-000005', 'FEED', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000006', 2756, 'ITM-000006', 'FEED', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000007', 2757, 'ITM-000007', 'FEED', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000008', 2758, 'ITM-000008', 'FEED', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000009', 2759, 'ITM-000009', 'FEED', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000010', 2760, 'ITM-000010', 'FEED', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-0000100', 2850, 'ITM-000101', 'CHICKS', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000011', 2761, 'ITM-0000100', 'CHICKS', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000012', 2762, 'ITM-000011', 'FEED', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000013', 2763, 'ITM-000012', 'FEED', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000014', 2764, 'ITM-000013', 'FEED', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000015', 2765, 'ITM-000014', 'FEED', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000016', 2766, 'ITM-000015', 'FEED', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000017', 2767, 'ITM-000016', 'CHICKS', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000018', 2768, 'ITM-000017', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000019', 2769, 'ITM-000018', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000020', 2770, 'ITM-000019', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000021', 2771, 'ITM-000021', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000022', 2772, 'ITM-000022', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000023', 2773, 'ITM-000023', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000024', 2774, 'ITM-000024', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000025', 2775, 'ITM-000025', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000026', 2776, 'ITM-000026', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000027', 2777, 'ITM-000027', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000028', 2778, 'ITM-000028', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000029', 2779, 'ITM-000029', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000030', 2780, 'ITM-000030', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000031', 2781, 'ITM-000031', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000032', 2782, 'ITM-000032', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000033', 2783, 'ITM-000033', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000034', 2784, 'ITM-000034', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000035', 2785, 'ITM-000035', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000036', 2786, 'ITM-000036', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000037', 2787, 'ITM-000037', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000038', 2788, 'ITM-000038', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000039', 2789, 'ITM-000039', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000040', 2790, 'ITM-000040', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000041', 2791, 'ITM-000041', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000042', 2792, 'ITM-000042', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000043', 2793, 'ITM-000043', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000044', 2794, 'ITM-000044', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000045', 2795, 'ITM-000045', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000046', 2796, 'ITM-000046', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000047', 2797, 'ITM-000047', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x33, NULL, NULL),
('CAT-000048', 2798, 'ITM-000048', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000049', 2799, 'ITM-000049', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000050', 2800, 'ITM-000050', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000051', 2801, 'ITM-000051', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000052', 2802, 'ITM-000052', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000053', 2803, 'ITM-000053', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000054', 2804, 'ITM-000054', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000055', 2805, 'ITM-000055', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000056', 2806, 'ITM-000056', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000057', 2807, 'ITM-000057', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000058', 2808, 'ITM-000058', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000059', 2809, 'ITM-000059', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000060', 2810, 'ITM-000060', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000061', 2811, 'ITM-000061', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000062', 2812, 'ITM-000062', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000063', 2813, 'ITM-000063', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000064', 2814, 'ITM-000064', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000065', 2815, 'ITM-000065', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000066', 2816, 'ITM-000066', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000067', 2817, 'ITM-000067', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000068', 2818, 'ITM-000068', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000069', 2819, 'ITM-000069', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000070', 2820, 'ITM-000070', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000071', 2821, 'ITM-000071', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000072', 2822, 'ITM-000072', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000073', 2823, 'ITM-000073', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000074', 2824, 'ITM-000074', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000075', 2825, 'ITM-000075', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000076', 2826, 'ITM-000076', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000077', 2827, 'ITM-000077', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000078', 2828, 'ITM-000078', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000079', 2829, 'ITM-000079', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000080', 2830, 'ITM-000080', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000081', 2831, 'ITM-000081', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000082', 2832, 'ITM-000082', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000083', 2833, 'ITM-000083', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000084', 2834, 'ITM-000084', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000085', 2835, 'ITM-000085', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000086', 2836, 'ITM-000086', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000087', 2837, 'ITM-000087', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000088', 2838, 'ITM-000088', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000089', 2839, 'ITM-000089', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000090', 2840, 'ITM-000090', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000091', 2841, 'ITM-000091', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000092', 2842, 'ITM-000092', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000093', 2843, 'ITM-000093', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000094', 2844, 'ITM-000094', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000095', 2845, 'ITM-000095', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000096', 2846, 'ITM-000096', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000097', 2847, 'ITM-000097', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000098', 2848, 'ITM-000098', 'CHICKS', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000099', 2849, 'ITM-000100', 'CHICKS', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000100', 2864, 'ITM-000001', 'FEED', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000101', 2865, 'ITM-000107', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000102', 2866, 'ITM-000108', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000103', 2867, 'ITM-000109', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000104', 2868, 'ITM-000110', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000105', 2869, 'ITM-000111', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000106', 2870, 'ITM-000112', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000107', 2871, 'ITM-000113', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000108', 2872, 'ITM-000114', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000109', 2873, 'ITM-000115', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000110', 2874, 'ITM-000116', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000111', 2875, 'ITM-000117', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000112', 2876, 'ITM-000118', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000113', 2877, 'ITM-000119', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000114', 2878, 'ITM-000120', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000115', 2879, 'ITM-000121', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000116', 2880, 'ITM-000122', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000117', 2881, 'ITM-000123', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000118', 2882, 'ITM-000124', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000119', 2883, 'ITM-000125', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000120', 2884, 'ITM-000126', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000121', 2885, 'ITM-000127', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000122', 2886, 'ITM-000128', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000123', 2887, 'ITM-000129', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000124', 2888, 'ITM-000130', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000125', 2889, 'ITM-000131', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000126', 2890, 'ITM-000132', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000127', 2891, 'ITM-000133', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000128', 2892, 'ITM-000134', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000129', 2893, 'ITM-000135', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000130', 2894, 'ITM-000136', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000131', 2895, 'ITM-000137', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000132', 2896, 'ITM-000138', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000133', 2897, 'ITM-000139', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000134', 2898, 'ITM-000140', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000135', 2899, 'ITM-000141', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000136', 2900, 'ITM-000142', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000137', 2901, 'ITM-000143', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000138', 2902, 'ITM-000144', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000139', 2903, 'ITM-000145', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000140', 2904, 'ITM-000146', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000141', 2905, 'ITM-000147', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000142', 2906, 'ITM-000148', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000143', 2907, 'ITM-000149', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000144', 2908, 'ITM-000150', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000145', 2909, 'ITM-000151', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000146', 2910, 'ITM-000152', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000147', 2911, 'ITM-000153', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000148', 2912, 'ITM-000154', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000149', 2913, 'ITM-000155', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000150', 2914, 'ITM-000156', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000151', 2915, 'ITM-000157', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000152', 2916, 'ITM-000158', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000153', 2917, 'ITM-000159', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000154', 2918, 'ITM-000160', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000155', 2919, 'ITM-000161', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000156', 2920, 'ITM-000162', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000157', 2921, 'ITM-000163', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000158', 2922, 'ITM-000164', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000159', 2923, 'ITM-000165', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000160', 2924, 'ITM-000166', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000161', 2925, 'ITM-000167', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000162', 2926, 'ITM-000168', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000163', 2927, 'ITM-000169', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000164', 2928, 'ITM-000170', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000165', 2929, 'ITM-000171', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000166', 2930, 'ITM-000172', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000167', 2931, 'ITM-000173', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000168', 2932, 'ITM-000174', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000169', 2933, 'ITM-000176', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000170', 2934, 'ITM-000177', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000171', 2935, 'ITM-000178', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000172', 2936, 'ITM-000179', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000173', 2937, 'ITM-000181', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000174', 2938, 'ITM-000182', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000175', 2939, 'ITM-000183', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000176', 2940, 'ITM-000184', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000177', 2941, 'ITM-000185', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000178', 2942, 'ITM-000186', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000179', 2943, 'ITM-000187', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000180', 2944, 'ITM-000188', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000181', 2945, 'ITM-000189', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000182', 2946, 'ITM-000190', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000183', 2947, 'ITM-000191', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000184', 2948, 'ITM-000192', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000185', 2949, 'ITM-000193', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000186', 2950, 'ITM-000194', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000187', 2951, 'ITM-000195', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000188', 2952, 'ITM-000196', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000189', 2953, 'ITM-000196', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000190', 2954, 'ITM-000197', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000191', 2955, 'ITM-000198', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000192', 2956, 'ITM-000199', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000193', 2957, 'ITM-000200', 'CATTLE MATERIALS', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000194', 2958, 'ITM-000201', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000195', 2959, 'ITM-000202', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000196', 2960, 'ITM-000203', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000197', 2961, 'ITM-000204', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000198', 2962, 'ITM-000205', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000199', 2963, 'ITM-000206', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000200', 2964, 'ITM-000207', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000201', 2965, 'ITM-000208', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000202', 2966, 'ITM-000209', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000203', 2967, 'ITM-000210', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000204', 2968, 'ITM-000211', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000205', 2969, 'ITM-000212', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000206', 2970, 'ITM-000213', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000207', 2971, 'ITM-000214', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000208', 2972, 'ITM-000215', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000209', 2973, 'ITM-000216', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000210', 2974, 'ITM-000217', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000211', 2975, 'ITM-000218', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000212', 2976, 'ITM-000219', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000213', 2977, 'ITM-000221', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000214', 2978, 'ITM-000222', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000215', 2979, 'ITM-000223', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000216', 2980, 'ITM-000224', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000217', 2981, 'ITM-000225', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000218', 2982, 'ITM-000226', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000219', 2983, 'ITM-000227', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000220', 2984, 'ITM-000228', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000221', 2985, 'ITM-000229', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000222', 2986, 'ITM-000230', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000223', 2987, 'ITM-000231', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000224', 2988, 'ITM-000232', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000225', 2989, 'ITM-000233', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000226', 2990, 'ITM-000234', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000227', 2991, 'ITM-000235', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000228', 2992, 'ITM-000236', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000229', 2993, 'ITM-000237', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000230', 2994, 'ITM-000238', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000231', 2995, 'ITM-000239', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000232', 2996, 'ITM-000240', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000233', 2997, 'ITM-000241', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000234', 2998, 'ITM-000242', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000235', 2999, 'ITM-000243', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000236', 3000, 'ITM-000244', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000237', 3001, 'ITM-000245', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000238', 3002, 'ITM-000246', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000239', 3003, 'ITM-000247', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000240', 3004, 'ITM-000248', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000241', 3005, 'ITM-000102', 'CHICKS', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000242', 3006, 'ITM-000103', 'CHICKS', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000243', 3007, 'ITM-000105', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000244', 3008, 'ITM-000106', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000245', 3009, 'ITM-000157', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000246', 3010, 'ITM-000241', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000247', 3011, 'ITM-000249', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000248', 3012, 'ITM-000250', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000249', 3013, 'ITM-000251', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000250', 3014, 'ITM-000252', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000251', 3015, 'ITM-000253', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000252', 3016, 'ITM-000255', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000253', 3017, 'ITM-000256', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000254', 3018, 'ITM-000096', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000255', 3019, 'ITM-000258', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000256', 3020, 'ITM-000259', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000257', 3021, 'ITM-000260', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000258', 3022, 'ITM-000261', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000259', 3023, 'ITM-000262', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000260', 3024, 'ITM-000263', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000261', 3025, 'ITM-000264', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000262', 3026, 'ITM-000265', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000263', 3027, 'ITM-000266', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000264', 3028, 'ITM-000267', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000265', 3029, 'ITM-000268', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000266', 3030, 'ITM-000269', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000267', 3031, 'ITM-000270', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000268', 3032, 'ITM-000271', 'FEED', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000269', 3033, 'ITM-000272', 'VACCINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000270', 3034, 'ITM-000273', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000271', 3035, 'ITM-000274', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000272', 3036, 'ITM-000275', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000273', 3037, 'ITM-000276', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x33, NULL, NULL),
('CAT-000274', 3038, 'ITM-000277', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x33, NULL, NULL),
('CAT-000275', 3039, 'ITM-000277', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x33, NULL, NULL),
('CAT-000276', 3040, 'ITM-000278', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x33, NULL, NULL),
('CAT-000277', 3041, 'ITM-000279', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x33, NULL, NULL),
('CAT-000278', 3042, 'ITM-000280', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x33, NULL, NULL),
('CAT-000279', 3043, 'ITM-000281', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x33, NULL, NULL),
('CAT-000280', 3044, 'ITM-000282', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x33, NULL, NULL),
('CAT-000281', 3045, 'ITM-000283', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x33, NULL, NULL),
('CAT-000282', 3046, 'ITM-000284', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x33, NULL, NULL),
('CAT-000283', 3047, 'ITM-000285', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x33, NULL, NULL),
('CAT-000284', 3048, 'ITM-000286', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x33, NULL, NULL),
('CAT-000285', 3049, 'ITM-000287', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x33, NULL, NULL),
('CAT-000286', 3050, 'ITM-000288', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x33, NULL, NULL),
('CAT-000287', 3051, 'ITM-000289', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x33, NULL, NULL),
('CAT-000288', 3052, 'ITM-000290', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000289', 3053, 'ITM-000291', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000290', 3054, 'ITM-000292', 'FEED', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000291', 3055, 'ITM-000293', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000292', 3056, 'ITM-000294', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000293', 3057, 'ITM-000295', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000294', 3058, 'ITM-000295', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000295', 3059, 'ITM-000296', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000296', 3060, 'ITM-000297', 'VACCINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000297', 3061, 'ITM-000298', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000298', 3062, 'ITM-000299', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000299', 3063, 'ITM-000300', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000300', 3064, 'ITM-000301', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000301', 3065, 'ITM-000302', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000302', 3066, 'ITM-000303', 'VACCINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000303', 3067, 'ITM-000304', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000304', 3068, 'ITM-000305', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000305', 3069, 'ITM-000306', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000306', 3070, 'ITM-000307', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000307', 3071, 'ITM-000308', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000308', 3072, 'ITM-000309', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000309', 3073, 'ITM-000310', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000310', 3074, 'ITM-000311', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000311', 3075, 'ITM-000312', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000312', 3076, 'ITM-000313', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000313', 3077, 'ITM-000314', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000314', 3078, 'ITM-000315', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000315', 3079, 'ITM-000316', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000316', 3080, 'ITM-000317', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000317', 3081, 'ITM-000318', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000318', 3082, 'ITM-000318', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000319', 3083, 'ITM-000319', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000320', 3084, 'ITM-000320', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000321', 3085, 'ITM-000321', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000322', 3086, 'ITM-000322', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000323', 3087, 'ITM-000323', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000324', 3088, 'ITM-000324', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000325', 3089, 'ITM-000325', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000326', 3090, 'ITM-000326', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000327', 3091, 'ITM-000327', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000328', 3092, 'ITM-000328', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000329', 3093, 'ITM-000329', 'CATTLE MEDICINE', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000330', 3094, 'ITM-000330', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000331', 3095, 'ITM-000331', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000332', 3096, 'ITM-000332', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000333', 3097, 'ITM-000333', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000334', 3098, 'ITM-000334', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000335', 3099, 'ITM-000335', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000336', 3100, 'ITM-000336', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL),
('CAT-000337', 3101, 'ITM-000337', 'Poultry medicine', NULL, NULL, NULL, NULL, 1, 0x31, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pdt_item`
--

CREATE TABLE `pdt_item` (
  `item_id` varchar(30) NOT NULL,
  `item_sl` int(11) NOT NULL,
  `item_name_en` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_name_bn` varchar(255) DEFAULT NULL,
  `item_image` varchar(64) DEFAULT NULL,
  `item_banner` varchar(64) DEFAULT NULL,
  `item_url` varchar(64) DEFAULT NULL,
  `item_status` tinyint(1) DEFAULT 1,
  `item_admin_id` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `pdt_item`
--

INSERT INTO `pdt_item` (`item_id`, `item_sl`, `item_name_en`, `item_name_bn`, `item_image`, `item_banner`, `item_url`, `item_status`, `item_admin_id`, `created_at`, `updated_at`) VALUES
('ITM-000001', 30, 'Broiler Starter', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000002', 31, 'Broiler Grower', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000003', 32, 'Broiler Finisher', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000004', 33, 'Layer Starter', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000005', 34, 'Layer Grower', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000006', 35, 'Layer Grower Pillet', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000007', 36, 'Layer Layer -1', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000008', 37, 'Layer Layer -2', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000009', 38, 'Layer Layer Pillet', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000010', 39, 'Sonali Starter', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-0000100', 129, 'Aftab Chicks', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000011', 40, 'Sonali Grower', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000012', 41, 'Cattle Feed', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000013', 42, 'Dairy Feed', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000014', 43, 'Economy Cattle Feed', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000015', 44, 'Economy Dairy Feed', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000016', 45, 'Gausia Chicks', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000017', 46, 'Anorexon DS Bolus', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000018', 47, 'Avinex Pow 100 gm', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000019', 48, 'Catophos Inj 100 ml', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000020', 49, 'Catophos Inj 100 ml', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000021', 50, 'Coxicure Pow 100 gm', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000022', 51, 'Doxivet Pow 100 gm', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000023', 52, 'Fevinil inj 10 ml', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000024', 53, 'Heparen Liq 500 ml', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000025', 54, 'Helmex 600 mg tab', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000026', 55, 'Lisovit 100 gm', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000027', 56, 'Micronid Pow 10 gm', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000028', 57, 'Nitronex inj 10 ml', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000029', 58, 'Renamycin tab 500 mg', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000030', 59, 'Rena Sel E 1000 ml', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000031', 60, 'Rena Sel E 100 ml', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000032', 61, 'Renacef Inj', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000033', 62, 'Renamox Tab', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000034', 63, 'Renamycin Pow 1000 gm', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000035', 64, 'Renamycin Pow 100 gm', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000036', 65, 'Renasol AD3E 100 ml', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000037', 66, 'Renavit DB 1 kg', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000038', 67, 'Rumenton Bolus', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000039', 68, 'Sulpha 3 Bolus', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000040', 69, 'Zerobloat 100 ml', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000041', 70, 'Rena PH 100 ml', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000042', 71, 'Vitamin AD3E 100 ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000043', 72, 'Hidex LiV-P 500ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000044', 73, 'AMOXYCILLIN-30%500 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000045', 74, 'NEW AMPROTECT20%500GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000046', 75, 'NEW GLUCOSE 500GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000047', 76, 'NEW ELECTROLYTE 1000GM', NULL, NULL, NULL, NULL, 1, '3', NULL, NULL),
('ITM-000048', 77, 'NEW VITAMINT K10GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000049', 78, 'NEW VITAMINT K100GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000050', 79, 'NEW CAL P PLUS ORAL1000ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000051', 80, 'NEW ZINC-SOL1000ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000052', 81, 'NEW PROVTIL25%100ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000053', 82, 'NEW PROVTIL25%500ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000054', 83, 'NEW DEX VET TAB', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000055', 84, 'NEO SALTEC VET70%500GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000056', 85, 'NUTEC VITAMIN C100 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000057', 86, 'NUTEC VITAMIN C500 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000058', 87, 'AMOXYCILLIN-30%100 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000059', 88, 'NEW TAMOL WSP100GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000060', 89, 'NEW AMPROTECT20%100GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000061', 90, 'NEW CONID VET100 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000062', 91, 'NEW CONID VET500 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000063', 92, 'NEW B1 B2 PLUS', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000064', 93, 'ENRO TEC VET20%100ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000065', 94, 'HYDRATE 500GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000066', 95, 'SENTILO SOL 200 (500)ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000067', 96, 'FLOSHOT SOL 20 (500)ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000068', 97, 'ORTHO CARE 1000ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000069', 98, 'NEPHROSOL 500ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000070', 99, 'ZERO TOX 1000ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000071', 100, 'COFNIX 500ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000072', 101, 'LINCOSTIN PLUS 100GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000073', 102, 'SUN LYSOCARE', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000074', 103, 'IMMUNE FLAVONE1000GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000075', 104, 'CIPROFLOX-B200', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000076', 105, 'ACILAC PLUS BOLUS', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000077', 106, 'ALQUERZIM 100GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000078', 107, 'COOD VET POWDER 20 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000079', 108, 'DD NIL 100GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000080', 109, 'FRA AC 34/5OOML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000081', 110, 'FRA AC 34/1OOML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000082', 111, 'FRA AC 12 LIQUID100ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000083', 112, 'GREENTIL LIQUID 100ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000084', 113, 'GP BIRDSYRUP1000 ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000085', 114, 'HAPAVITA INJ 100ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000086', 115, 'PICA SOL LIQUID 100 ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000087', 116, 'RUCHI PLUS POWDER 20 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000088', 117, 'RUCHI-MAX POWDER 20GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000089', 118, 'SUPERFLO-200 SOLUTION 100 ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000090', 119, 'FAR AC 12/100 POWDER', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000091', 120, 'FIXIN VET INJ10ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000092', 121, 'CIPROFLOX-10%500 ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000093', 122, 'DFN VET SOLUTION 100ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000094', 123, 'HEPATONIC 500 ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000095', 124, 'MASTI 24 POWDER100 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000096', 125, 'ORACAL VET 1LITER', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000097', 126, 'NUTRILAC', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000098', 127, 'Paragaon Chicks', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000100', 158, 'Kazi Chicks', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000101', 159, 'Top Ten Chicks', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000102', 160, 'Bogora Sonali Chicks', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000103', 161, 'Takwa Chicks', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000105', 163, 'CAPTOR 45%', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000106', 164, 'COSUMIX PLUS 20GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000107', 165, 'COSUMIX PLUS 100GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000108', 166, 'ESB 3 30%100GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000109', 167, 'G-PROMIN1000ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000110', 168, 'NUTRILAC200ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000111', 169, 'NUTRILAC 1000ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000112', 170, 'NUTRILIV PORTE 1000ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000113', 171, 'PROTEXIN CONCENTRATE', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000114', 172, 'RESPITE 500ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000115', 173, 'SANCAL -P 500GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000116', 174, 'TOXINEL PLUSE 200ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000117', 175, 'TOXINEL PLUSE 1L', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000118', 176, 'ENDEX TAB', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000119', 177, 'MARBO DS VET  100MG', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000120', 178, 'MILK VET 1KG', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000121', 179, 'OSE VET ORAL SOLUTION 100ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000122', 180, 'PIF R VET IV INJEC 10ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000123', 181, 'PIF R VET IV INJEC 30ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000124', 182, 'PK 5VET 100MG', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000125', 183, 'PROTIMIN 500 ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000126', 184, 'SALACGIL DS', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000127', 185, 'ORAL SALINE', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000128', 186, 'RENADEX TAB', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000129', 187, 'NItronex inj 30 ml', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000130', 188, 'HICOMOX 500 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000131', 189, 'LOXI KAM PLUS 10ML INJ', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000132', 190, 'RESTOLIV 100ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000133', 191, 'ASTA VET100ML INJ', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000134', 192, 'KETO-A VET10ML INJ', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000135', 193, 'KETO-A VET30ML INJ', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000136', 194, 'A-MECTIN PLUS 5ML INJ', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000137', 195, 'A-MECTIN PLUS 30ML INJ', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000138', 196, 'A-MECTIN VET 15 MLDROPS POUR', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000139', 197, 'BRONCHO VET', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000140', 198, 'DRESS GEL FR 50GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000141', 199, 'DRESS GEL FR 20GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000142', 200, 'BIOGUT VET 10 MG', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000143', 201, 'BABE CURE 2ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000144', 202, 'VITA D PLUS 100ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000145', 203, 'MAGVET PLUS500ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000146', 204, 'SALPHADIN', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000147', 205, 'MOXILIN VET', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000148', 206, 'CIPRO-A VET1GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000149', 207, 'FAST VET TAB2MG', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000150', 208, 'PHENADRYL VET', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000151', 209, 'DIRO VET 2MG', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000152', 210, 'DIRO VET 10GM POWDER', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000153', 211, 'TIMSEN 20 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000154', 212, 'RENACIN INJ 100 ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000155', 213, 'RENAMYCIN-100MG INJ', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000156', 214, 'New CaL P PLUS ORAL 5 Liter', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000157', 215, 'New ZINC-SOL 5 Liter', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000158', 216, 'RESPOFIT', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000159', 217, 'MEGAVIT WS', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000160', 218, 'POWER PH', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000161', 219, 'SURE AL 250 ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000162', 220, 'AROCAL VET 5LT', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000163', 221, 'RENASOL AD3E 100 INJ', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000164', 222, 'VITA D PLUS 500ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000165', 223, 'ZYMO VET20 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000166', 224, 'XILIAN VET WSP 100 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000167', 225, 'M0XILIN CV VET 10GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000168', 226, 'TYLVASIN VET 100 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000169', 227, 'RENAFEN ING 10ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000170', 228, 'A-MILK VET TAB', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000171', 229, 'AVAILA-4 500 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000172', 230, 'FLUMIXINE INJ 10ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000173', 231, 'IVECLORINJ 30ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000174', 232, 'TREMACID TAB', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000175', 233, 'TREMACID TAB', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000176', 234, 'CALCI-MAX', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000177', 235, 'FENAZOL TAB', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000178', 236, 'EDECURE VET2.0G', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000179', 237, 'TICOFON VET 10 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000180', 238, 'DEXTROSE DS 1000ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000181', 239, 'ERACEF 2G IM INJ', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000182', 240, 'HAZMI VET POWDER20GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000183', 241, 'FDT INJ100ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000184', 242, 'SHIFEN INJ10ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000185', 243, 'WOMAZOL 100ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000186', 244, 'INSEMIN 0,5L', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000187', 245, 'CAPSOLA 1000ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000188', 246, 'CAPSOLA 5000ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000189', 247, 'DIARLOCK VET 100 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000190', 248, 'NAVA DIGESTIVE25GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000191', 249, 'PROBOOST VET 500ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000192', 250, 'ZINC VET 1000ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000193', 251, 'CALBOOST GEL 300ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000194', 252, 'UTOREN  500ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000195', 253, 'ASCARZIN 10 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000196', 254, 'RUMITOP 10 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000197', 255, 'rumen-e 100 gm', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000198', 256, 'RECOFAST ENTRICUM 100GM FOW', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000199', 257, 'TYLO-PC INJ20ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000200', 258, 'RUBBER MET ACI', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000201', 259, 'AUGMENT VET TEB', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000202', 260, 'KEMTRACE OPTIMAX', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000203', 261, 'TRIZON VET .5GM ING', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000204', 262, 'TRIZON VET 1GM ING', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000205', 263, 'TRIZON VET 2GM ING', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000206', 264, 'MOXILIN CV DS', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000207', 265, 'XILIAN VET WSP 10 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000208', 266, 'CARMINA SYRAP', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000209', 267, 'ALKULI SYRAP', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000210', 268, 'FERTISOL VET TAB', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000211', 269, 'ROMA', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000212', 270, 'ANOX-D', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000213', 271, 'VIR KON', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000214', 272, 'AVAILA-4 100 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000215', 273, 'Lisovit 100 gm', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000216', 274, 'PROFEED 100GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000217', 275, 'RENA-KOL500ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000218', 276, 'RENAMOX INJ 1GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000219', 277, 'STREPTOPEN 2.5GMINJ', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000220', 278, 'STREPTOPEN 2.5GMINJ', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000221', 279, 'VITAPHOS 30ML ING', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000222', 280, 'AMIMOX INJ', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000223', 281, 'RENAMOX INJ 2GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000224', 282, 'PRONAPEN 40 LAC INJ', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000225', 283, 'AMOCLAV TAB', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000226', 284, 'AMOCLAV DS TAB', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000227', 285, 'DEXAVET INJ 10ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000228', 286, 'VARMIC ING 10ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000229', 287, 'AMFLOR VET INJ30 ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000230', 288, 'AMFLOR VET INJ10 ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000231', 289, 'BIPEN BET40LAC', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000232', 290, 'MASTI CARE PLUS 100 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000233', 291, 'MASTI CARE PLUS 500 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000234', 292, 'AMINOVITAL HIGH INJ 100ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000235', 293, 'AMINOVITAL HIGH INJ 20ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000236', 294, 'CALCIUM FORTE M INJ 500 ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000237', 295, 'CALCIUM FORTE M INJ 250 ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000238', 296, 'CAROSILINJ 100 ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000239', 297, 'RUMI PRO APPETIZER 200GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000240', 298, 'THAMPYRON INJ 50 ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000241', 299, 'RENAZURIL VET 100 ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000242', 300, 'EUROLAC GREEN', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000243', 301, 'ACUTRIN', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000244', 302, 'PRYCIN VET INJ10ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000245', 303, 'E VET WSP100 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000246', 304, 'DEXTROSE 5% 1000ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000247', 305, 'DEXTROSE DS 10%1000ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000248', 306, 'DEXTROSE N 1000ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000249', 308, 'MONSEL E', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000250', 309, 'NAVASOL VET 30ML INJ', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000251', 310, 'NAVAPRO PIUS', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000252', 311, 'RELPAIN VET', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000253', 312, 'NAVADEX', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000254', 313, 'Renamycin Pow 1000 gm', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000255', 314, 'LISOVIT 10GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000256', 315, 'ORAL SALINE', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000257', 316, 'ORACAL VET 1LITER', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000258', 317, 'GROW FAST', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000259', 318, 'ORACAL VET 5 LITER', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000260', 319, 'ZINC CARE 200ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000261', 320, 'AMINOVIT PLUS100ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000262', 321, 'AMINOVIT PLUS 50MLINJ', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000263', 322, 'AMINOVIT PLUS 500ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000264', 323, 'AMINOVIT 100ML INJ', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000265', 324, 'GENTA BAC INJ 100ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000266', 325, 'GENTA BAC INJ 10ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000267', 326, 'GENTA BAC INJ 50 ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000268', 327, 'SEL E TAB', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000269', 328, 'NEURO B INJ', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000270', 329, 'FUSID INJ', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000271', 330, 'BUSI MIX CATTEL FEED', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000272', 331, 'H 5', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000273', 332, 'KETO-A VET TAB', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000274', 333, 'VET SALINE', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000275', 334, 'VITALAMINO PORT', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000276', 335, 'BRONCHO VET 100 ml', NULL, NULL, NULL, NULL, 1, '3', NULL, NULL),
('ITM-000277', 336, 'ACMEZYME 100 GM', NULL, NULL, NULL, NULL, 1, '3', NULL, NULL),
('ITM-000278', 337, 'PHOSCAL DB', NULL, NULL, NULL, NULL, 1, '3', NULL, NULL),
('ITM-000279', 338, 'CALDIMAX INJ 100ML', NULL, NULL, NULL, NULL, 1, '3', NULL, NULL),
('ITM-000280', 339, 'ASTA VET10ML INJ', NULL, NULL, NULL, NULL, 1, '3', NULL, NULL),
('ITM-000281', 340, 'SKIN CARE', NULL, NULL, NULL, NULL, 1, '3', NULL, NULL),
('ITM-000282', 341, 'VITAMIX DB SUPAR 1KG', NULL, NULL, NULL, NULL, 1, '3', NULL, NULL),
('ITM-000283', 342, 'VITAMIX DB SUPAR 500GM', NULL, NULL, NULL, NULL, 1, '3', NULL, NULL),
('ITM-000284', 343, 'STOMA VET20GM PW', NULL, NULL, NULL, NULL, 1, '3', NULL, NULL),
('ITM-000285', 344, 'D3 50 PLUS', NULL, NULL, NULL, NULL, 1, '3', NULL, NULL),
('ITM-000286', 345, 'XENOREX', NULL, NULL, NULL, NULL, 1, '3', NULL, NULL),
('ITM-000287', 346, 'TRACID VET 10ML INJ', NULL, NULL, NULL, NULL, 1, '3', NULL, NULL),
('ITM-000288', 347, 'PHENADRYL VET 10MLINJ', NULL, NULL, NULL, NULL, 1, '3', NULL, NULL),
('ITM-000289', 348, 'PHENADRYL VET 30MLINJ', NULL, NULL, NULL, NULL, 1, '3', NULL, NULL),
('ITM-000290', 349, 'B COM VIT', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000291', 350, 'TYMPANIL 100ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000292', 351, 'BUSI GOLD CATTAL FEED', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000293', 352, 'GENTAREN INJ 100ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000294', 353, 'A MAX XTRA', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000295', 354, 'RUBBER MET HIGH', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000296', 355, 'Renasol AD3E 30ml INJ', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000297', 356, 'IB ND LIVE VAC', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000298', 357, 'MOXILIN VET 1GM INJ', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000299', 358, 'SP VET 2.5GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000300', 359, 'TIFUR VET 1GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000301', 360, 'TIFUR VET ,5GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000302', 361, 'TIFUR VET 0.25GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000303', 362, 'GAMBURO VAC', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000304', 363, 'ZIS VET 1LITAR', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000305', 364, 'BOOSTER', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000306', 365, 'NUTRI FLUVIR', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000307', 366, 'CIPROCIN VET INJ 50ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000308', 367, 'CIPROCIN VET INJ 10ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000309', 368, 'HAMECO PH 1 LITAR', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000310', 369, 'CM VET INJ100ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000311', 370, 'CM VET INJ10ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000312', 371, 'TRIVET', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000313', 372, 'AMPROL EP VET', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000314', 373, 'Fevinil inj 30 ml', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000315', 374, 'DETOX VET POW', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000316', 375, 'MASTI TUBE', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000317', 376, 'BOVI CARE 125 GM', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000318', 377, 'TYLO PC GOLD 100ML INJ', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000319', 378, 'RE FENCE', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000320', 379, 'DIADIN INJ 100 ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000321', 380, 'DIADIN INJ 30 ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000322', 381, 'V PLEX VET100ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000323', 382, 'ESPA VET', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000324', 383, 'RESTOLIV 500ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000325', 384, 'REVIT ADE100ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000326', 385, 'EXTRAMIN P500ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000327', 386, 'RUCHI FPRT 200ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000328', 387, 'HEPATO CARE BOLAS', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000329', 388, 'GROWTH FORMULA', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000330', 389, 'SOLVITEC E100ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000331', 390, 'SOLVITEC E500ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000332', 391, 'SOLVITEC E1000ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000333', 392, 'COCCILOCK 100ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000334', 393, 'COCCILOCK 500ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000335', 394, 'Hidex LiV-P 1000ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000336', 395, 'NEW CAL P PLUS POW500ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL),
('ITM-000337', 396, 'ENRO TEC VET20%500ML', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pdt_pdtdetails`
--

CREATE TABLE `pdt_pdtdetails` (
  `pd_pdt_id` varchar(15) NOT NULL,
  `pd_shipping_id` varchar(10) NOT NULL,
  `pd_dis_price` double(11,2) DEFAULT 0.00,
  `pd_dis_per` double(11,2) DEFAULT 0.00,
  `pd_current_price` double(11,2) NOT NULL DEFAULT 0.00,
  `pd_min_qunt` int(11) DEFAULT 0,
  `pd_seller_id` varchar(11) DEFAULT NULL,
  `pd_stock_status` tinyint(1) DEFAULT 1,
  `pd_home_item_show` tinyint(1) DEFAULT 1,
  `pd_copy_dis` double(11,2) NOT NULL DEFAULT 0.00,
  `pd_copy_per` double(11,2) NOT NULL DEFAULT 0.00,
  `pd_copy_current_price` double(11,2) NOT NULL DEFAULT 0.00,
  `pd_hot_deals` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pd_offer_id` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pd_processors` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pd_ram` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pd_display` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pd_view` int(255) DEFAULT 0,
  `pd_seo_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pd_meta_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pd_meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pd_mobile_spec` varbinary(255) DEFAULT NULL,
  `pd_conditions_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pdt_productinfo`
--

CREATE TABLE `pdt_productinfo` (
  `pdt_id` varchar(30) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `pdt_item_id` varchar(11) DEFAULT NULL,
  `pdt_cat_id` varchar(11) DEFAULT NULL,
  `pdt_subcat_id` varchar(11) DEFAULT NULL,
  `pdt_brand_id` varchar(11) NOT NULL,
  `pdt_name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pdt_name_bn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdt_measurement` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdt_purchase_price` double(11,2) DEFAULT 0.00,
  `pdt_sale_price` double(11,2) DEFAULT 0.00,
  `pdt_short_details` varchar(255) DEFAULT NULL,
  `pdt_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdt_condition` text DEFAULT NULL,
  `pdt_barcode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pdt_image` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdt_suspension` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdt_shelf_no` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdt_shortage` decimal(11,2) UNSIGNED DEFAULT 0.00,
  `pdt_over_stock` double(11,2) DEFAULT NULL,
  `pdt_order_qunt` double(11,2) DEFAULT NULL,
  `pdt_old_price` double(11,2) DEFAULT NULL,
  `pdt_admin_id` varchar(15) DEFAULT NULL,
  `pdt_status` tinyint(1) DEFAULT 1,
  `pdt_url` varchar(64) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `pdt_productinfo`
--

INSERT INTO `pdt_productinfo` (`pdt_id`, `barcode`, `pdt_item_id`, `pdt_cat_id`, `pdt_subcat_id`, `pdt_brand_id`, `pdt_name_en`, `pdt_name_bn`, `pdt_measurement`, `pdt_purchase_price`, `pdt_sale_price`, `pdt_short_details`, `pdt_details`, `pdt_condition`, `pdt_barcode`, `pdt_image`, `pdt_suspension`, `pdt_shelf_no`, `pdt_shortage`, `pdt_over_stock`, `pdt_order_qunt`, `pdt_old_price`, `pdt_admin_id`, `pdt_status`, `pdt_url`, `created_at`, `updated_at`) VALUES
('PDT-000001', 'PDT-000001', 'ITM-000001', 'CAT-000001', NULL, 'BRN-16', 'Broiler starter', NULL, '15', 2842.00, 0.00, NULL, NULL, NULL, 'PDT-000001', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000002', 'PDT-000002', 'ITM-000002', 'CAT-000002', NULL, 'BRN-16', 'Broiler Grower', NULL, '15', 2941.00, 0.00, NULL, NULL, NULL, 'PDT-000002', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000003', 'PDT-000003', 'ITM-000003', NULL, NULL, 'BRN-16', 'BROILER FINISHER', NULL, '15', 2931.00, 0.00, NULL, NULL, NULL, 'PDT-000003', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000004', 'PDT-000004', 'ITM-000004', 'CAT-000004', NULL, 'BRN-16', 'LAYER STATER', NULL, '15', 0.00, 0.00, NULL, NULL, NULL, 'PDT-000004', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000005', 'PDT-000005', 'ITM-000005', 'CAT-000005', NULL, 'BRN-16', 'LAYER GROWER', NULL, '15', 0.00, 0.00, NULL, NULL, NULL, 'PDT-000005', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000006', 'PDT-000006', 'ITM-000007', 'CAT-000007', NULL, 'BRN-16', 'LAYER LAYER -1', NULL, '15', 0.00, 0.00, NULL, NULL, NULL, 'PDT-000006', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000007', 'PDT-000007', 'ITM-000008', 'CAT-000008', NULL, 'BRN-16', 'LAYER LAYER -2', NULL, '15', 0.00, 0.00, NULL, NULL, NULL, 'PDT-000007', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000008', 'PDT-000008', 'ITM-000009', 'CAT-000009', NULL, 'BRN-16', 'LAYER LAYER PILET', NULL, '15', 0.00, 0.00, NULL, NULL, NULL, 'PDT-000008', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000009', 'PDT-000009', 'ITM-000011', 'CAT-000012', NULL, 'BRN-16', 'SONALI GROWER', NULL, '15', 2725.00, 0.00, NULL, NULL, NULL, 'PDT-000009', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000010', 'PDT-000010', 'ITM-0000100', 'CAT-000011', NULL, 'BRN-16', 'CHICKS', NULL, '1', 0.00, 0.00, NULL, NULL, NULL, 'PDT-000010', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000011', 'PDT-000011', 'ITM-000012', 'CAT-000013', NULL, 'BRN-16', 'CATTLE FEED', NULL, '15', 900.00, 1050.00, NULL, NULL, NULL, 'PDT-000011', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000012', 'PDT-000012', 'ITM-000013', 'CAT-000014', NULL, 'BRN-16', 'dairy feed', NULL, '15', 0.00, 0.00, NULL, NULL, NULL, 'PDT-000012', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000013', 'PDT-000013', 'ITM-000013', 'CAT-000014', NULL, 'BRN-16', 'dairy feed', NULL, '15', 0.00, 0.00, NULL, NULL, NULL, 'PDT-000013', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000014', 'PDT-000014', 'ITM-000014', 'CAT-000015', NULL, 'BRN-16', 'economy cattle feed', NULL, '15', 0.00, 0.00, NULL, NULL, NULL, 'PDT-000014', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000015', 'PDT-000015', 'ITM-000015', 'CAT-000016', NULL, 'BRN-16', 'economy dairy feed', NULL, '15', 0.00, 0.00, NULL, NULL, NULL, 'PDT-000015', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000016', 'PDT-000016', 'ITM-000016', 'CAT-000017', NULL, 'BRN-16', 'Gausia chicks', NULL, '1', 0.00, 0.00, NULL, NULL, NULL, 'PDT-000016', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000017', 'PDT-000017', 'ITM-000017', 'CAT-000018', NULL, 'BRN-04', 'Anorexon ds bolus', NULL, '1', 4.04, 5.00, NULL, NULL, NULL, 'PDT-000017', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000018', 'PDT-000018', 'ITM-000018', NULL, NULL, 'BRN-04', 'Avinex pow 100 gm', NULL, '1', 171.61, 188.00, NULL, NULL, NULL, 'PDT-000018', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000019', 'PDT-000019', 'ITM-000019', 'CAT-000020', NULL, 'BRN-04', 'Catophos inj 100 ml', NULL, '1', 365.62, 395.00, NULL, NULL, NULL, 'PDT-000019', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000020', 'PDT-000020', 'ITM-000021', 'CAT-000021', NULL, 'BRN-04', 'Coxicure pow 100 gm', NULL, '1', 155.61, 170.00, NULL, NULL, NULL, 'PDT-000020', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000021', 'PDT-000021', 'ITM-000022', NULL, NULL, 'BRN-04', 'Doxivet pow 100gm', NULL, '1', 127.80, 140.00, NULL, NULL, NULL, 'PDT-000021', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000022', 'PDT-000022', 'ITM-000023', 'CAT-000023', NULL, 'BRN-04', 'FEVINIL INJ 100 ML', NULL, '1', 87.52, 95.00, NULL, NULL, NULL, 'PDT-000022', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000023', 'PDT-000023', 'ITM-000024', 'CAT-000024', NULL, 'BRN-04', 'HEPAREN LIQ 500ML', NULL, '1', 208.93, 265.00, NULL, NULL, NULL, 'PDT-000023', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000024', 'PDT-000024', 'ITM-000025', 'CAT-000025', NULL, 'BRN-04', 'HELMEX 600 MG TAB', NULL, '1', 5.61, 7.00, NULL, NULL, NULL, 'PDT-000024', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000025', 'PDT-000025', 'ITM-000026', 'CAT-000026', NULL, 'BRN-04', 'LISOVIT 100 GM', NULL, '1', 408.92, 440.00, NULL, NULL, NULL, 'PDT-000025', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000026', 'PDT-000026', 'ITM-000027', 'CAT-000027', NULL, 'BRN-04', 'MICRONID POW 10GM', NULL, '1', 31.76, 35.00, NULL, NULL, NULL, 'PDT-000026', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000027', 'PDT-000027', 'ITM-000028', 'CAT-000028', NULL, 'BRN-04', 'NITRONEX 10ML', NULL, '1', 65.13, 80.00, NULL, NULL, NULL, 'PDT-000027', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000028', 'PDT-000028', 'ITM-000029', 'CAT-000029', NULL, 'BRN-04', 'RENAMYCIN TAB 500 MG', NULL, '1', 2.59, 3.00, NULL, NULL, NULL, 'PDT-000028', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000029', 'PDT-000029', 'ITM-000030', 'CAT-000026', NULL, 'BRN-04', 'RENA SEL E1000ML', NULL, '1', 664.77, 720.00, NULL, NULL, NULL, 'PDT-000029', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000030', 'PDT-000030', 'ITM-000031', 'CAT-000031', NULL, 'BRN-04', 'RENA SEL E 100ML', NULL, '1', 87.75, 100.00, NULL, NULL, NULL, 'PDT-000030', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000031', 'PDT-000031', 'ITM-000032', 'CAT-000032', NULL, 'BRN-04', 'RENACEF INJ', NULL, '1', 126.98, 140.00, NULL, NULL, NULL, 'PDT-000031', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000032', 'PDT-000032', 'ITM-000033', 'CAT-000033', NULL, 'BRN-04', 'RENAMOX TAB', NULL, '1', 5.56, 6.00, NULL, NULL, NULL, 'PDT-000032', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000033', 'PDT-000033', 'ITM-000034', 'CAT-000034', NULL, 'BRN-04', 'RENAMYCIN POW 1 KG', NULL, '1', 582.58, 630.00, NULL, NULL, NULL, 'PDT-000033', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000034', 'PDT-000034', 'ITM-000035', 'CAT-000035', NULL, 'BRN-04', 'RENAMYCIN POW 100GM', NULL, '1', 73.76, 80.00, NULL, NULL, NULL, 'PDT-000034', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000035', 'PDT-000035', 'ITM-000036', 'CAT-000036', NULL, 'BRN-04', 'RENASOL AD3E 100ML', NULL, '1', 128.52, 150.00, NULL, NULL, NULL, 'PDT-000035', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000036', 'PDT-000036', 'ITM-000037', 'CAT-000037', NULL, 'BRN-04', 'RENAVIT DB1KG', NULL, '1', 286.65, 310.00, NULL, NULL, NULL, 'PDT-000036', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000037', 'PDT-000037', 'ITM-000038', 'CAT-000038', NULL, 'BRN-04', 'RUMENTON BOLUS', NULL, '1', 8.58, 10.00, NULL, NULL, NULL, 'PDT-000037', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000038', 'PDT-000038', 'ITM-000039', 'CAT-000039', NULL, 'BRN-04', 'SULPHA 3 BOLUS', NULL, '1', 18.02, 20.00, NULL, NULL, NULL, 'PDT-000038', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '3', 1, NULL, NULL, NULL),
('PDT-000039', 'PDT-000039', 'ITM-000040', 'CAT-000040', NULL, 'BRN-04', 'ZERO BLOAT 100ML', NULL, '1', 60.06, 68.00, NULL, NULL, NULL, 'PDT-000039', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000040', 'PDT-000040', 'ITM-000041', 'CAT-000041', NULL, 'BRN-04', 'RENA PH 100 ML', NULL, '1', 69.30, 85.00, NULL, NULL, NULL, 'PDT-000040', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000042', 'PDT-000042', 'ITM-000042', 'CAT-000042', NULL, 'BRN-10', 'VTAMIN AD3E 100ML', NULL, '1', 192.53, 220.00, NULL, NULL, NULL, 'PDT-000042', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000043', 'PDT-000043', 'ITM-000043', 'CAT-000043', NULL, 'BRN-10', 'HIDEX LIV-P 500ML', NULL, '1', 116.78, 140.00, NULL, NULL, NULL, 'PDT-000043', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000044', 'PDT-000044', 'ITM-000044', 'CAT-000044', NULL, 'BRN-10', 'AMOXYCILLIN-30%500GM', NULL, '1', 806.27, 900.00, NULL, NULL, NULL, 'PDT-000044', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000045', 'PDT-000045', 'ITM-000045', 'CAT-000045', NULL, 'BRN-10', 'NEW AMPROTECT 20% 500gm', NULL, '1', 869.16, 950.00, NULL, NULL, NULL, 'PDT-000045', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000046', 'PDT-000046', 'ITM-000046', 'CAT-000046', NULL, 'BRN-10', 'NEW GLUCOSE 500GM', NULL, '1', 99.78, 120.00, NULL, NULL, NULL, 'PDT-000046', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000048', 'PDT-000048', 'ITM-000047', 'CAT-000047', NULL, 'BRN-10', 'NEW ELECTROLYTE1000GM', NULL, '1', 117.00, 140.00, NULL, NULL, NULL, 'PDT-000048', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000049', 'PDT-000049', 'ITM-000048', NULL, NULL, 'BRN-10', 'NEW VTAMINT K10GM', NULL, '1', 16.66, 20.00, NULL, NULL, NULL, 'PDT-000049', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000050', 'PDT-000050', 'ITM-000049', NULL, NULL, 'BRN-10', 'NEW VITAMINT K100GM', NULL, '1', 81.96, 100.00, NULL, NULL, NULL, 'PDT-000050', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000052', 'PDT-000052', 'ITM-000050', NULL, NULL, 'BRN-10', 'NEW CAL P PLUS ORAL1000ML', NULL, '1', 175.18, 220.00, NULL, NULL, NULL, 'PDT-000052', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000053', 'PDT-000053', 'ITM-000051', NULL, NULL, 'BRN-10', 'NEW ZINK-SOL 1000ML', NULL, '1', 179.67, 230.00, NULL, NULL, NULL, 'PDT-000053', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000054', 'PDT-000054', 'ITM-000052', NULL, NULL, 'BRN-10', 'NEW PROVTIL25%100ML', NULL, '1', 624.92, 710.00, NULL, NULL, NULL, 'PDT-000054', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000055', 'PDT-000055', 'ITM-000053', NULL, NULL, 'BRN-10', 'NEW PROVTIL 25%500ML', NULL, '1', 2812.17, 3100.00, NULL, NULL, NULL, 'PDT-000055', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000056', 'PDT-000056', 'ITM-000054', NULL, NULL, 'BRN-10', 'NEW DEXVET TAB', NULL, '1', 17.04, 20.00, NULL, NULL, NULL, 'PDT-000056', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000057', 'PDT-000057', 'ITM-000055', NULL, NULL, 'BRN-10', 'NEO SALTECVET 70%500MG', NULL, '1', 1296.78, 1500.00, NULL, NULL, NULL, 'PDT-000057', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000058', 'PDT-000058', 'ITM-000056', NULL, NULL, 'BRN-10', 'NUTEC VITAMINT C100GM', NULL, '1', 83.78, 100.00, NULL, NULL, NULL, 'PDT-000058', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000059', 'PDT-000059', 'ITM-000057', 'CAT-000057', NULL, 'BRN-10', 'NUTEC VITAMINT C500GM', NULL, '1', 340.00, 400.00, NULL, NULL, NULL, 'PDT-000059', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000060', 'PDT-000060', 'ITM-000058', NULL, NULL, 'BRN-10', 'AMOXYCILLIN-30%100GM', NULL, '1', 187.09, 200.00, NULL, NULL, NULL, 'PDT-000060', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000061', 'PDT-000061', 'ITM-000059', 'CAT-000059', NULL, 'BRN-10', 'NEW TAMOL WSP100GM', NULL, '1', 72.32, 80.00, NULL, NULL, NULL, 'PDT-000061', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000062', 'PDT-000062', 'ITM-000060', 'CAT-000060', NULL, 'BRN-10', 'NEW AMPROTECT 20%100GM', NULL, '1', 172.67, 195.00, NULL, NULL, NULL, 'PDT-000062', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000063', 'PDT-000063', 'ITM-000061', 'CAT-000061', NULL, 'BRN-10', 'NEW CONID VET100GM', NULL, '1', 279.74, 300.00, NULL, NULL, NULL, 'PDT-000063', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000064', 'PDT-000064', 'ITM-000062', 'CAT-000062', NULL, 'BRN-10', 'NEW CONID VET 500GM', NULL, '1', 1271.33, 1450.00, NULL, NULL, NULL, 'PDT-000064', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000065', 'PDT-000065', 'ITM-000063', 'CAT-000063', NULL, 'BRN-10', 'NEW B1 B2 PLUS', NULL, '1', 66.82, 85.00, NULL, NULL, NULL, 'PDT-000065', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000066', 'PDT-000066', 'ITM-000064', 'CAT-000064', NULL, 'BRN-10', 'ENROTEC VET20% 100ML', NULL, '1', 265.91, 310.00, NULL, NULL, NULL, 'PDT-000066', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000067', 'PDT-000067', 'ITM-000065', 'CAT-000065', NULL, 'BRN-11', 'HYDRAT 500GM', NULL, '1', 324.84, 350.00, NULL, NULL, NULL, 'PDT-000067', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000068', 'PDT-000068', 'ITM-000066', 'CAT-000066', NULL, 'BRN-11', 'SENTILO SOL 20(500)ML', NULL, '1', 3062.81, 3400.00, NULL, NULL, NULL, 'PDT-000068', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000069', 'PDT-000069', 'ITM-000067', 'CAT-000067', NULL, 'BRN-11', 'FLOSHOT SOL 20%500ML', NULL, '1', 3290.62, 3500.00, NULL, NULL, NULL, 'PDT-000069', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000070', 'PDT-000070', 'ITM-000068', 'CAT-000068', NULL, 'BRN-11', 'ORTHO CARE1000ML', NULL, '1', 909.00, 980.00, NULL, NULL, NULL, 'PDT-000070', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000071', 'PDT-000071', 'ITM-000069', 'CAT-000069', NULL, 'BRN-11', 'NEPHROSOL 500ML', NULL, '1', 787.50, 850.00, NULL, NULL, NULL, 'PDT-000071', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000072', 'PDT-000072', 'ITM-000070', 'CAT-000070', NULL, 'BRN-11', 'ZERO TOX 1000ML', NULL, '1', 630.00, 730.00, NULL, NULL, NULL, 'PDT-000072', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000073', 'PDT-000073', 'ITM-000071', 'CAT-000071', NULL, 'BRN-11', 'COFNIX 500ML', NULL, '1', 463.50, 530.00, NULL, NULL, NULL, 'PDT-000073', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000074', 'PDT-000074', 'ITM-000072', 'CAT-000072', NULL, 'BRN-12', 'LINCOSTIN PLUS100GM', NULL, '1', 1191.40, 1350.00, NULL, NULL, NULL, 'PDT-000074', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000075', 'PDT-000075', 'ITM-000073', 'CAT-000073', NULL, 'BRN-12', 'SUNLYSOCARE', NULL, '1', 383.15, 430.00, NULL, NULL, NULL, 'PDT-000075', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000076', 'PDT-000076', 'ITM-000074', 'CAT-000074', NULL, 'BRN-11', 'IMMUNE FLAVONE1000GM', NULL, '1', 810.00, 910.00, NULL, NULL, NULL, 'PDT-000076', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000077', 'PDT-000077', 'ITM-000075', 'CAT-000075', NULL, 'BRN-10', 'CIPROFLOX-B200', NULL, '1', 1506.82, 1630.00, NULL, NULL, NULL, 'PDT-000077', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000078', 'PDT-000078', 'ITM-000076', 'CAT-000076', NULL, 'BRN-09', 'ACILAC PLUS BOLUS', NULL, '1', 11.31, 15.00, NULL, NULL, NULL, 'PDT-000078', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000079', 'PDT-000079', 'ITM-000077', 'CAT-000077', NULL, 'BRN-09', 'ALQURZIM 100GM', NULL, '1', 241.18, 300.00, NULL, NULL, NULL, 'PDT-000079', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000080', 'PDT-000080', 'ITM-000078', 'CAT-000078', NULL, 'BRN-09', 'COOD VET POW20GM', NULL, '1', 20.49, 25.00, NULL, NULL, NULL, 'PDT-000080', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000081', 'PDT-000081', 'ITM-000079', 'CAT-000079', NULL, 'BRN-09', 'DD NIL100GM', NULL, '1', 44.70, 60.00, NULL, NULL, NULL, 'PDT-000081', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000082', 'PDT-000082', 'ITM-000080', 'CAT-000080', NULL, 'BRN-09', 'FRA AC34/500ML', NULL, '1', 637.88, 700.00, NULL, NULL, NULL, 'PDT-000082', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000083', 'PDT-000083', 'ITM-000081', 'CAT-000081', NULL, 'BRN-09', 'FRA AC34/100ML', NULL, '1', 137.00, 150.00, NULL, NULL, NULL, 'PDT-000083', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000084', 'PDT-000084', 'ITM-000082', 'CAT-000082', NULL, 'BRN-09', 'FRA AC 12LIQ 100ML', NULL, '1', 285.30, 320.00, NULL, NULL, NULL, 'PDT-000084', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000085', 'PDT-000085', 'ITM-000083', 'CAT-000083', NULL, 'BRN-09', 'GREENTIL LIQ100ML', NULL, '1', 635.91, 720.00, NULL, NULL, NULL, 'PDT-000085', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000086', 'PDT-000086', 'ITM-000084', 'CAT-000084', NULL, 'BRN-09', 'GP BIRDSSYRUP100ML', NULL, '1', 785.00, 880.00, NULL, NULL, NULL, 'PDT-000086', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000087', 'PDT-000087', 'ITM-000085', 'CAT-000085', NULL, 'BRN-09', 'HAPAVITA INJ 100ML', NULL, '1', 262.64, 290.00, NULL, NULL, NULL, 'PDT-000087', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000088', 'PDT-000088', 'ITM-000086', 'CAT-000086', NULL, 'BRN-09', 'PICASOL LIQ100ML', NULL, '1', 85.96, 100.00, NULL, NULL, NULL, 'PDT-000088', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000089', 'PDT-000089', 'ITM-000087', 'CAT-000087', NULL, 'BRN-09', 'RUCHI PLUS POW20GM', NULL, '1', 18.38, 22.00, NULL, NULL, NULL, 'PDT-000089', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000090', 'PDT-000090', 'ITM-000088', 'CAT-000088', NULL, 'BRN-09', 'RUCHI-MAX POW20GM', NULL, '1', 31.18, 35.00, NULL, NULL, NULL, 'PDT-000090', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000091', 'PDT-000091', 'ITM-000089', 'CAT-000089', NULL, 'BRN-09', 'SUPERFLO-200SOL100ML', NULL, '1', 697.14, 780.00, NULL, NULL, NULL, 'PDT-000091', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000092', 'PDT-000092', 'ITM-000090', 'CAT-000090', NULL, 'BRN-09', 'FAR C12/100POW', NULL, '1', 285.09, 315.00, NULL, NULL, NULL, 'PDT-000092', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000093', 'PDT-000093', 'ITM-000091', 'CAT-000091', NULL, 'BRN-09', 'FIXIN VET INJ 10ML', NULL, '1', 157.29, 180.00, NULL, NULL, NULL, 'PDT-000093', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000094', 'PDT-000094', 'ITM-000092', 'CAT-000092', NULL, 'BRN-03', 'CIPROFLOX-10%500ML', NULL, '1', 729.37, 800.00, NULL, NULL, NULL, 'PDT-000094', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000095', 'PDT-000095', 'ITM-000093', 'CAT-000093', NULL, 'BRN-03', 'DFN VET SULUTION100ML', NULL, '1', 584.97, 650.00, NULL, NULL, NULL, 'PDT-000095', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000096', 'PDT-000096', 'ITM-000094', 'CAT-000094', NULL, 'BRN-03', 'HEPATONIC500ML', NULL, '1', 291.67, 330.00, NULL, NULL, NULL, 'PDT-000096', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000097', 'PDT-000097', 'ITM-000095', 'CAT-000095', NULL, 'BRN-03', 'MASTI 24POW100GM', NULL, '1', 181.82, 200.00, NULL, NULL, NULL, 'PDT-000097', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000098', 'PDT-000098', 'ITM-000096', 'CAT-000096', NULL, 'BRN-03', '0RACAL VET 1LITAR', NULL, '1', 272.81, 285.00, NULL, NULL, NULL, 'PDT-000098', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000099', 'PDT-000099', 'ITM-000097', 'CAT-000097', NULL, 'BRN-07', 'NUTRILAC200ML', NULL, '1', 191.10, 215.00, NULL, NULL, NULL, 'PDT-000099', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000100', 'PDT-000100', 'ITM-000098', 'CAT-000098', NULL, 'BRN-29', 'CHICKS', NULL, '1', NULL, NULL, NULL, NULL, NULL, 'PDT-000100', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000101', 'PDT-000101', 'ITM-000100', 'CAT-000099', NULL, 'BRN-18', 'KAZI CHICKS', NULL, '1', NULL, NULL, NULL, NULL, NULL, 'PDT-000101', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000102', 'PDT-000102', 'ITM-000101', 'CAT-0000100', NULL, 'BRN-14', 'HYBRID CHICKS', NULL, '1', NULL, NULL, NULL, NULL, NULL, 'PDT-000102', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000103', 'PDT-000103', 'ITM-000102', 'CAT-000241', NULL, 'BRN-19', 'SONALI CHKIS', NULL, '1', 0.00, 0.00, NULL, NULL, NULL, 'PDT-000103', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000104', 'PDT-000104', 'ITM-000103', 'CAT-000242', NULL, 'BRN-13', 'TAKWA SONALI', NULL, '1', 0.00, 0.00, NULL, NULL, NULL, 'PDT-000104', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000105', 'PDT-000105', 'ITM-000105', 'CAT-000243', NULL, 'BRN-07', 'CAPTOR 45%', NULL, '1', 354.68, 385.00, NULL, NULL, NULL, 'PDT-000105', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000106', 'PDT-000106', 'ITM-000106', 'CAT-000244', NULL, 'BRN-07', 'COSUMIX PLUS 20GM', NULL, '1', 13.75, 15.00, NULL, NULL, NULL, 'PDT-000106', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000107', 'PDT-000107', 'ITM-000107', 'CAT-000101', NULL, 'BRN-07', 'COSUMIX PLUS 100', NULL, '1', 163.19, 170.00, NULL, NULL, NULL, 'PDT-000107', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000108', 'PDT-000108', 'ITM-000108', 'CAT-000102', NULL, 'BRN-07', 'ESB3/30%100GM', NULL, '1', 228.81, 250.00, NULL, NULL, NULL, 'PDT-000108', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000109', 'PDT-000109', 'ITM-000109', NULL, NULL, 'BRN-07', 'G-PROMIN 1000ML', NULL, '1', 683.06, 730.00, NULL, NULL, NULL, 'PDT-000109', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000110', 'PDT-000110', 'ITM-000111', 'CAT-000105', NULL, 'BRN-07', 'NUTRILAC1000ML', NULL, '1', 910.00, 950.00, NULL, NULL, NULL, 'PDT-000110', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000111', 'PDT-000111', 'ITM-000112', 'CAT-000106', NULL, 'BRN-07', 'NUTRILIV PORTE 1000ML', NULL, '1', 480.00, 510.00, NULL, NULL, NULL, 'PDT-000111', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000112', 'PDT-000112', 'ITM-000113', 'CAT-000107', NULL, 'BRN-07', 'PROTEXIN', NULL, '1', 313.60, 330.00, NULL, NULL, NULL, 'PDT-000112', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000113', 'PDT-000113', 'ITM-000114', 'CAT-000108', NULL, 'BRN-07', 'RESPITE500ML', NULL, '1', 931.00, 980.00, NULL, NULL, NULL, 'PDT-000113', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000114', 'PDT-000114', 'ITM-000115', 'CAT-000109', NULL, 'BRN-07', 'SANCAL-P 500GM', NULL, '1', 336.00, 360.00, NULL, NULL, NULL, 'PDT-000114', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000115', 'PDT-000115', 'ITM-000116', 'CAT-000110', NULL, 'BRN-07', 'TOXINIL PLUSE200ML', NULL, '1', 298.90, 215.00, NULL, NULL, NULL, 'PDT-000115', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000116', 'PDT-000116', 'ITM-000117', 'CAT-000111', NULL, 'BRN-07', 'TOXINEL PLUSE1000ML', NULL, '1', 1421.00, 1500.00, NULL, NULL, NULL, 'PDT-000116', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000117', 'PDT-000117', 'ITM-000118', 'CAT-000112', NULL, 'BRN-07', 'ENDEX TAB', NULL, '1', 20.89, 23.00, NULL, NULL, NULL, 'PDT-000117', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000118', 'PDT-000118', 'ITM-000119', 'CAT-000113', NULL, 'BRN-03', 'MARBO DS VET TAB', NULL, '1', 31.99, 35.00, NULL, NULL, NULL, 'PDT-000118', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000119', 'PDT-000119', 'ITM-000120', 'CAT-000114', NULL, 'BRN-03', 'MILKY VET1KG', NULL, '1', 336.36, 370.00, NULL, NULL, NULL, 'PDT-000119', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000120', 'PDT-000120', 'ITM-000121', 'CAT-000115', NULL, 'BRN-03', 'OSE VET100ML', NULL, '1', 181.82, 195.00, NULL, NULL, NULL, 'PDT-000120', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000121', 'PDT-000121', 'ITM-000122', 'CAT-000116', NULL, 'BRN-03', 'PIF RVET10MLINJ', NULL, '1', 162.39, 180.00, NULL, NULL, NULL, 'PDT-000121', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000122', 'PDT-000122', 'ITM-000123', 'CAT-000117', NULL, 'BRN-03', 'PIF R VET30MLINJ', NULL, '1', 405.96, 445.00, NULL, NULL, NULL, 'PDT-000122', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000123', 'PDT-000123', 'ITM-000124', 'CAT-000118', NULL, 'BRN-03', 'PK 5VET100MG', NULL, '1', 16.24, 19.00, NULL, NULL, NULL, 'PDT-000123', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000124', 'PDT-000124', 'ITM-000125', 'CAT-000119', NULL, 'BRN-03', 'PROTIMIN500ML', NULL, '1', 312.50, 375.00, NULL, NULL, NULL, 'PDT-000124', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000125', 'PDT-000125', 'ITM-000126', 'CAT-000120', NULL, 'BRN-03', 'SALACGIL DS', NULL, '1', 30.00, 35.00, NULL, NULL, NULL, 'PDT-000125', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000126', 'PDT-000126', 'ITM-000127', 'CAT-000121', NULL, 'BRN-03', 'VET SALINE', NULL, '1', 14.55, 17.00, NULL, NULL, NULL, 'PDT-000126', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000127', 'PDT-000127', 'ITM-000128', 'CAT-000122', NULL, 'BRN-04', 'RENADEX TAB', NULL, '1', 15.79, 18.00, NULL, NULL, NULL, 'PDT-000127', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000128', 'PDT-000128', 'ITM-000129', 'CAT-000123', NULL, 'BRN-04', 'NITRONEX INJ30ML', NULL, '1', 183.64, 200.00, NULL, NULL, NULL, 'PDT-000128', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000129', 'PDT-000129', 'ITM-000130', 'CAT-000124', NULL, 'BRN-05', 'HICOMOX 500GM', NULL, '1', 796.41, 860.00, NULL, NULL, NULL, 'PDT-000129', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000130', 'PDT-000130', 'ITM-000131', 'CAT-000125', NULL, 'BRN-05', 'LOXI KAM PLUS10ML INJ', NULL, '1', 81.72, 90.00, NULL, NULL, NULL, 'PDT-000130', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000131', 'PDT-000131', 'ITM-000132', 'CAT-000126', NULL, 'BRN-05', 'RESTOLIV 100ML', NULL, '1', 111.35, 130.00, NULL, NULL, NULL, 'PDT-000131', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000132', 'PDT-000132', 'ITM-000133', 'CAT-000127', NULL, 'BRN-02', 'ASTA VET100ML INJ', NULL, '1', 93.84, 105.00, NULL, NULL, NULL, 'PDT-000132', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000133', 'PDT-000133', 'ITM-000134', 'CAT-000128', NULL, 'BRN-02', 'KETO-AVET10ML INJ', NULL, '1', 73.06, 90.00, NULL, NULL, NULL, 'PDT-000133', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000134', 'PDT-000134', 'ITM-000135', 'CAT-000129', NULL, 'BRN-02', 'KETO AVET 30ML INJ', NULL, '1', 211.29, 250.00, NULL, NULL, NULL, 'PDT-000134', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000135', 'PDT-000135', 'ITM-000136', 'CAT-000130', NULL, 'BRN-02', 'A-MECTIN PLUS 5ML INJ', NULL, '1', 58.65, 70.00, NULL, NULL, NULL, 'PDT-000135', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000136', 'PDT-000136', 'ITM-000137', 'CAT-000131', NULL, 'BRN-02', 'A-MECTIN PLUS 30ML INJ', NULL, '1', 254.15, 285.00, NULL, NULL, NULL, 'PDT-000136', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000137', 'PDT-000137', 'ITM-000138', 'CAT-000132', NULL, 'BRN-02', 'A-MECTIN VET15 MLD POUR', NULL, '1', 36.02, 40.00, NULL, NULL, NULL, 'PDT-000137', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000138', 'PDT-000138', 'ITM-000139', 'CAT-000133', NULL, 'BRN-02', 'BRONCHO VET', NULL, '1', 206.36, 225.00, NULL, NULL, NULL, 'PDT-000138', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000139', 'PDT-000139', 'ITM-000140', 'CAT-000134', NULL, 'BRN-02', 'DRESS GEL FR50GM', NULL, '1', 114.03, 130.00, NULL, NULL, NULL, 'PDT-000139', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000140', 'PDT-000140', 'ITM-000141', 'CAT-000135', NULL, 'BRN-02', 'DRESS GEL FR20GM', NULL, '1', 52.91, 60.00, NULL, NULL, NULL, 'PDT-000140', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000141', 'PDT-000141', 'ITM-000142', 'CAT-000136', NULL, 'BRN-02', 'BIOGUT VET10GM', NULL, '1', 13.80, 15.00, NULL, NULL, NULL, 'PDT-000141', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000142', 'PDT-000142', 'ITM-000143', 'CAT-000137', NULL, 'BRN-02', 'BABE CURE 2ML', NULL, '1', 17.38, 20.00, NULL, NULL, NULL, 'PDT-000142', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000143', 'PDT-000143', 'ITM-000144', 'CAT-000138', NULL, 'BRN-02', 'VITA D PLUS100ML', NULL, '1', 63.09, 70.00, NULL, NULL, NULL, 'PDT-000143', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000144', 'PDT-000144', 'ITM-000145', 'CAT-000139', NULL, 'BRN-02', 'MAG VETPLUS 500ML', NULL, '1', 171.52, 185.00, NULL, NULL, NULL, 'PDT-000144', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000145', 'PDT-000145', 'ITM-000146', 'CAT-000140', NULL, 'BRN-02', 'SALPADIN', NULL, '1', 15.05, 17.00, NULL, NULL, NULL, 'PDT-000145', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000146', 'PDT-000146', 'ITM-000147', 'CAT-000141', NULL, 'BRN-02', 'MOXILIN VET', NULL, '1', 8.60, 10.00, NULL, NULL, NULL, 'PDT-000146', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000147', 'PDT-000147', 'ITM-000148', 'CAT-000142', NULL, 'BRN-02', 'CIPRO-AVET 1GM', NULL, '1', 17.20, 20.00, NULL, NULL, NULL, 'PDT-000147', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000148', 'PDT-000148', 'ITM-000149', 'CAT-000143', NULL, 'BRN-02', 'FAST VET TAB2MG', NULL, '1', 1.95, 2.20, NULL, NULL, NULL, 'PDT-000148', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000149', 'PDT-000149', 'ITM-000150', 'CAT-000144', NULL, 'BRN-02', 'PHENADRYL VET', NULL, '1', 3.43, 4.00, NULL, NULL, NULL, 'PDT-000149', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000150', 'PDT-000150', 'ITM-000151', 'CAT-000145', NULL, 'BRN-02', 'DIRO VET2GM', NULL, '1', 3.85, 4.00, NULL, NULL, NULL, 'PDT-000150', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000151', 'PDT-000151', 'ITM-000152', 'CAT-000146', NULL, 'BRN-02', 'DIRO VET10GM PWO', NULL, '1', 12.01, 14.00, NULL, NULL, NULL, 'PDT-000151', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000152', 'PDT-000152', 'ITM-000153', 'CAT-000147', NULL, 'BRN-06', 'TIMSEN 20GM', NULL, '1', 92.64, 105.00, NULL, NULL, NULL, 'PDT-000152', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000153', 'PDT-000153', 'ITM-000154', NULL, NULL, 'BRN-04', 'RENACIN INJ 100ML', NULL, '1', 75.51, 85.00, NULL, NULL, NULL, 'PDT-000153', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000154', 'PDT-000154', 'ITM-000155', 'CAT-000149', NULL, 'BRN-04', 'RENAMYCIN 100MG INJ', NULL, '1', 165.49, 185.00, NULL, NULL, NULL, 'PDT-000154', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000155', 'PDT-000155', 'ITM-000156', 'CAT-000150', NULL, 'BRN-10', 'NEW CAL P 5LITAR', NULL, '1', 703.12, 900.00, NULL, NULL, NULL, 'PDT-000155', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000156', 'PDT-000156', 'ITM-000157', 'CAT-000245', NULL, 'BRN-10', 'NEW ZINC 5LITAR', NULL, '1', 728.00, 900.00, NULL, NULL, NULL, 'PDT-000156', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000157', 'PDT-000157', 'ITM-000158', 'CAT-000152', NULL, 'BRN-33', 'RESPOFIT', NULL, '1', 190.00, 210.00, NULL, NULL, NULL, 'PDT-000157', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000158', 'PDT-000158', 'ITM-000159', 'CAT-000153', NULL, 'BRN-07', 'MEGAVIT WS', NULL, '1', 330.00, 350.00, NULL, NULL, NULL, 'PDT-000158', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000159', 'PDT-000159', 'ITM-000160', 'CAT-000154', NULL, 'BRN-08', 'PH', NULL, '1', 375.00, 410.00, NULL, NULL, NULL, 'PDT-000159', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000160', 'PDT-000160', 'ITM-000161', 'CAT-000155', NULL, 'BRN-20', 'SURE AI', NULL, '1', 168.18, 190.00, NULL, NULL, NULL, 'PDT-000160', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000161', 'PDT-000161', 'ITM-000162', 'CAT-000156', NULL, 'BRN-20', 'AROCAL VET 5LIT', NULL, '1', 950.00, 1100.00, NULL, NULL, NULL, 'PDT-000161', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000162', 'PDT-000162', 'ITM-000163', 'CAT-000157', NULL, 'BRN-04', 'RENASOL AD3E100ML INJ', NULL, '1', 807.88, 860.00, NULL, NULL, NULL, 'PDT-000162', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000163', 'PDT-000163', 'ITM-000164', 'CAT-000158', NULL, 'BRN-02', 'VITA D PLUS 500ML', NULL, '1', 291.00, 320.00, NULL, NULL, NULL, 'PDT-000163', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000164', 'PDT-000164', 'ITM-000165', 'CAT-000159', NULL, 'BRN-02', 'ZYMO VET20GM', NULL, '1', 10.14, 12.00, NULL, NULL, NULL, 'PDT-000164', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000165', 'PDT-000165', 'ITM-000166', 'CAT-000160', NULL, 'BRN-02', 'XILIAN VET 100GM', NULL, '1', 599.64, 690.00, NULL, NULL, NULL, 'PDT-000165', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000166', 'PDT-000166', 'ITM-000167', 'CAT-000161', NULL, 'BRN-02', 'MOXILIN CV 10GM', NULL, '1', 30.02, 35.00, NULL, NULL, NULL, 'PDT-000166', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000167', 'PDT-000167', 'ITM-000168', 'CAT-000162', NULL, 'BRN-02', 'TYLVASIN VET100GM', NULL, '1', 1143.42, 1285.00, NULL, NULL, NULL, 'PDT-000167', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000168', 'PDT-000168', 'ITM-000169', 'CAT-000163', NULL, 'BRN-04', 'RENAFEN 10MLINJ', NULL, '1', 94.00, 105.00, NULL, NULL, NULL, 'PDT-000168', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000169', 'PDT-000169', 'ITM-000170', 'CAT-000164', NULL, 'BRN-02', 'A-MILK VET TAB', NULL, '1', 8.39, 10.00, NULL, NULL, NULL, 'PDT-000169', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000170', 'PDT-000170', 'ITM-000171', 'CAT-000165', NULL, 'BRN-04', 'AVAILA 4 500GM', NULL, '1', 482.63, 525.00, NULL, NULL, NULL, 'PDT-000170', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000171', 'PDT-000171', 'ITM-000172', 'CAT-000166', NULL, 'BRN-04', 'FLUMXIN INJ10ML', NULL, '1', 171.62, 188.00, NULL, NULL, NULL, 'PDT-000171', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000172', 'PDT-000172', 'ITM-000173', 'CAT-000167', NULL, 'BRN-04', 'IVECLOR 30ML INJ', NULL, '1', 279.80, 300.00, NULL, NULL, NULL, 'PDT-000172', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000173', 'PDT-000173', 'ITM-000174', 'CAT-000168', NULL, 'BRN-04', 'TREMACID TAB', NULL, '1', 7.59, 8.00, NULL, NULL, NULL, 'PDT-000173', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000174', 'PDT-000174', 'ITM-000176', 'CAT-000169', NULL, 'BRN-09', 'CALCI-MAX', NULL, '1', 550.00, 590.00, NULL, NULL, NULL, 'PDT-000174', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000175', 'PDT-000175', 'ITM-000177', 'CAT-000170', NULL, 'BRN-02', 'FENAZOL TAB', NULL, '1', 4.94, 5.50, NULL, NULL, NULL, 'PDT-000175', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000176', 'PDT-000176', 'ITM-000178', 'CAT-000171', NULL, 'BRN-02', 'EDECURE VET', NULL, '1', 20.58, 22.50, NULL, NULL, NULL, 'PDT-000176', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000177', 'PDT-000177', 'ITM-000179', 'CAT-000172', NULL, 'BRN-02', 'TICOFON VET10GM', NULL, '1', 30.11, 33.00, NULL, NULL, NULL, 'PDT-000177', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000178', 'PDT-000178', 'ITM-000181', 'CAT-000173', NULL, 'BRN-21', 'ERACEF 2GM INJ', NULL, '1', 209.50, 232.00, NULL, NULL, NULL, 'PDT-000178', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000179', 'PDT-000179', 'ITM-000182', 'CAT-000174', NULL, 'BRN-21', 'HAZMI VET20GM POW', NULL, '1', 10.61, 14.00, NULL, NULL, NULL, 'PDT-000179', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000180', 'PDT-000180', 'ITM-000183', 'CAT-000175', NULL, 'BRN-23', 'FTD INJ100ML', NULL, '1', 596.16, 650.00, NULL, NULL, NULL, 'PDT-000180', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000181', 'PDT-000181', 'ITM-000184', 'CAT-000176', NULL, 'BRN-23', 'SHIFEN INJ 10ML', NULL, '1', 78.34, 90.00, NULL, NULL, NULL, 'PDT-000181', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000182', 'PDT-000182', 'ITM-000185', 'CAT-000177', NULL, 'BRN-23', 'WORMAZOL 100ML', NULL, '1', 268.80, 290.00, NULL, NULL, NULL, 'PDT-000182', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000183', 'PDT-000183', 'ITM-000186', 'CAT-000178', NULL, 'BRN-23', 'INSEMIN 0.5L', NULL, '1', 518.40, 570.00, NULL, NULL, NULL, 'PDT-000183', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000184', 'PDT-000184', 'ITM-000187', 'CAT-000179', NULL, 'BRN-22', 'CAPSOLA1000ML', NULL, '1', 218.18, 240.00, NULL, NULL, NULL, 'PDT-000184', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000185', 'PDT-000185', 'ITM-000188', 'CAT-000180', NULL, 'BRN-22', 'CAPSOLA 5LITAR', NULL, '1', 1113.60, 1210.00, NULL, NULL, NULL, 'PDT-000185', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000186', 'PDT-000186', 'ITM-000189', 'CAT-000181', NULL, 'BRN-22', 'DIARLOCK 100GM', NULL, '1', 107.52, 120.00, NULL, NULL, NULL, 'PDT-000186', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000187', 'PDT-000187', 'ITM-000190', 'CAT-000182', NULL, 'BRN-22', 'NAVA DIGESTIVE 25GM', NULL, '1', 35.52, 40.00, NULL, NULL, NULL, 'PDT-000187', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000188', 'PDT-000188', 'ITM-000191', 'CAT-000183', NULL, 'BRN-22', 'PROBOOST 500ML', NULL, '1', 417.16, 480.00, NULL, NULL, NULL, 'PDT-000188', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000189', 'PDT-000189', 'ITM-000192', 'CAT-000184', NULL, 'BRN-22', 'ZINC VET1000ML', NULL, '1', 172.40, 200.00, NULL, NULL, NULL, 'PDT-000189', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000190', 'PDT-000190', 'ITM-000193', 'CAT-000185', NULL, 'BRN-04', 'CALBOOST GEL300ML', NULL, '1', 165.75, 190.00, NULL, NULL, NULL, 'PDT-000190', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000191', 'PDT-000191', 'ITM-000194', 'CAT-000186', NULL, 'BRN-04', 'UTOREN 500ML', NULL, '1', 292.50, 335.00, NULL, NULL, NULL, 'PDT-000191', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000192', 'PDT-000192', 'ITM-000195', 'CAT-000187', NULL, 'BRN-23', 'ASCARZIN 10GM', NULL, '1', 13.20, 15.00, NULL, NULL, NULL, 'PDT-000192', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000193', 'PDT-000193', 'ITM-000196', 'CAT-000188', NULL, 'BRN-23', 'RUMITOP 10 GM', NULL, '1', 10.50, 12.00, NULL, NULL, NULL, 'PDT-000193', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000194', 'PDT-000194', 'ITM-000197', 'CAT-000190', NULL, 'BRN-04', 'RUMEN-E100GM', NULL, '1', 58.50, 65.00, NULL, NULL, NULL, 'PDT-000194', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000195', 'PDT-000195', 'ITM-000198', 'CAT-000191', NULL, 'BRN-09', 'RECOFAST ENTRICUM 100GM POW', NULL, '1', 249.42, 295.00, NULL, NULL, NULL, 'PDT-000195', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000196', 'PDT-000196', 'ITM-000199', 'CAT-000192', NULL, 'BRN-09', 'TYLO PC20ML INJ', NULL, '1', 232.26, 245.00, NULL, NULL, NULL, 'PDT-000196', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000197', 'PDT-000197', 'ITM-000200', 'CAT-000193', NULL, 'BRN-09', 'RUBBER MET', NULL, '1', 586.80, 530.00, NULL, NULL, NULL, 'PDT-000197', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000198', 'PDT-000198', 'ITM-000201', 'CAT-000194', NULL, 'BRN-03', 'AUGMENT VET TAB', NULL, '1', 26.29, 30.00, NULL, NULL, NULL, 'PDT-000198', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000199', 'PDT-000199', 'ITM-000202', 'CAT-000195', NULL, 'BRN-20', 'KEMTACE OPTIMIX', NULL, '1', 465.33, 500.00, NULL, NULL, NULL, 'PDT-000199', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000200', 'PDT-000200', 'ITM-000203', 'CAT-000196', NULL, 'BRN-02', 'TRIZON VET.5GM INJ', NULL, '1', 73.53, 90.00, NULL, NULL, NULL, 'PDT-000200', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000201', 'PDT-000201', 'ITM-000204', 'CAT-000197', NULL, 'BRN-02', 'TRIZON VET1GM INJ', NULL, '1', 111.46, 130.00, NULL, NULL, NULL, 'PDT-000201', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000202', 'PDT-000202', 'ITM-000205', 'CAT-000198', NULL, 'BRN-02', 'TRIZON VET 2GM INJ', NULL, '1', 206.36, 235.00, NULL, NULL, NULL, 'PDT-000202', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000203', 'PDT-000203', 'ITM-000206', 'CAT-000199', NULL, 'BRN-02', 'MOXILIN CV DS', NULL, '1', 28.31, 30.00, NULL, NULL, NULL, 'PDT-000203', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000204', 'PDT-000204', 'ITM-000207', 'CAT-000200', NULL, 'BRN-02', 'XILIAN VET 10 GM', NULL, '1', 72.77, 82.00, NULL, NULL, NULL, 'PDT-000204', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000205', 'PDT-000205', 'ITM-000208', 'CAT-000201', NULL, 'BRN-24', 'CARMINA SYRAP', NULL, '1', 120.00, 140.00, NULL, NULL, NULL, 'PDT-000205', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000206', 'PDT-000206', 'ITM-000209', 'CAT-000202', NULL, 'BRN-24', 'ALKULI SYRAP', NULL, '1', 74.77, 85.00, NULL, NULL, NULL, 'PDT-000206', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000207', 'PDT-000207', 'ITM-000210', 'CAT-000203', NULL, 'BRN-06', 'FERTISOL VET TAB', NULL, '1', 18.32, 20.00, NULL, NULL, NULL, 'PDT-000207', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000208', 'PDT-000208', 'ITM-000211', NULL, NULL, 'BRN-06', 'ROMA', NULL, '1', 85.95, 100.00, NULL, NULL, NULL, 'PDT-000208', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000209', 'PDT-000209', 'ITM-000212', 'CAT-000205', NULL, 'BRN-05', 'ANOX-D', NULL, '1', 242.50, 265.00, NULL, NULL, NULL, 'PDT-000209', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000210', 'PDT-000210', 'ITM-000213', 'CAT-000206', NULL, 'BRN-25', 'VIR KON 100GM', NULL, '1', 134.00, 150.00, NULL, NULL, NULL, 'PDT-000210', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000211', 'PDT-000211', 'ITM-000214', 'CAT-000207', NULL, 'BRN-04', 'AVAILA 4/100GM', NULL, '1', 94.97, 110.00, NULL, NULL, NULL, 'PDT-000211', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000212', 'PDT-000212', 'ITM-000215', 'CAT-000208', NULL, 'BRN-04', 'LISOVIT 100GM', NULL, '1', 408.92, 440.00, NULL, NULL, NULL, 'PDT-000212', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000213', 'PDT-000213', 'ITM-000216', 'CAT-000209', NULL, 'BRN-04', 'PROFEED 100GM', NULL, '1', 146.25, 160.00, NULL, NULL, NULL, 'PDT-000213', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000214', 'PDT-000214', 'ITM-000217', 'CAT-000210', NULL, 'BRN-04', 'RENA KOL 500ML', NULL, '1', 165.75, 185.00, NULL, NULL, NULL, 'PDT-000214', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000215', 'PDT-000215', 'ITM-000218', 'CAT-000211', NULL, 'BRN-04', 'RENAMOX INJ 1GM', NULL, '1', 63.82, 70.00, NULL, NULL, NULL, 'PDT-000215', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000216', 'PDT-000216', 'ITM-000219', 'CAT-000212', NULL, 'BRN-04', 'STREPTOPEN 2.5 INJ', NULL, '1', 64.68, 194.04, NULL, NULL, NULL, 'PDT-000216', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000217', 'PDT-000217', 'ITM-000221', 'CAT-000213', NULL, 'BRN-04', 'VITAPHOS 30ML INJ', NULL, '1', 118.95, 135.00, NULL, NULL, NULL, 'PDT-000217', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000218', 'PDT-000218', 'ITM-000222', 'CAT-000214', NULL, 'BRN-23', 'AMIMOX INJ', NULL, '1', 622.00, 660.00, NULL, NULL, NULL, 'PDT-000218', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000219', 'PDT-000219', 'ITM-000223', 'CAT-000215', NULL, 'BRN-04', 'RENAMOX 2GM INJ', NULL, '1', 86.24, 95.00, NULL, NULL, NULL, 'PDT-000219', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000220', 'PDT-000220', 'ITM-000224', 'CAT-000216', NULL, 'BRN-04', 'PRONAPEN 40LAC INJ', NULL, '1', 38.27, 42.00, NULL, NULL, NULL, 'PDT-000220', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000221', 'PDT-000221', 'ITM-000225', 'CAT-000217', NULL, 'BRN-26', 'AMOCLAV TAB', NULL, '1', 16.89, 18.00, NULL, NULL, NULL, 'PDT-000221', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000222', 'PDT-000222', 'ITM-000226', 'CAT-000218', NULL, 'BRN-26', 'AMOCLAV DS TAB', NULL, '1', 27.88, 30.00, NULL, NULL, NULL, 'PDT-000222', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000223', 'PDT-000223', 'ITM-000227', 'CAT-000219', NULL, 'BRN-26', 'DEXAVET INJ 10ML', NULL, '1', 27.28, 31.00, NULL, NULL, NULL, 'PDT-000223', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000224', 'PDT-000224', 'ITM-000228', 'CAT-000220', NULL, 'BRN-26', 'VARMIC 10ML INJ', NULL, '1', 98.09, 112.00, NULL, NULL, NULL, 'PDT-000224', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000225', 'PDT-000225', 'ITM-000229', 'CAT-000221', NULL, 'BRN-02', 'AMFLOR VET30ML INJ', NULL, '1', 484.53, 515.00, NULL, NULL, NULL, 'PDT-000225', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000226', 'PDT-000226', 'ITM-000230', 'CAT-000222', NULL, 'BRN-02', 'AMFLOR VET INJ10 ML', NULL, '1', 171.52, 190.00, NULL, NULL, NULL, 'PDT-000226', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000227', 'PDT-000227', 'ITM-000231', 'CAT-000223', NULL, 'BRN-27', 'BIPEN VET40LAC', NULL, '1', 55.20, 60.00, NULL, NULL, NULL, 'PDT-000227', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000228', 'PDT-000228', 'ITM-000232', 'CAT-000224', NULL, 'BRN-27', 'MASTI CARE PLUS 100GM', NULL, '1', 215.60, 235.00, NULL, NULL, NULL, 'PDT-000228', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000229', 'PDT-000229', 'ITM-000233', 'CAT-000225', NULL, 'BRN-27', 'MASTI CARE PLUS 500GM', NULL, '1', 940.80, 1050.00, NULL, NULL, NULL, 'PDT-000229', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `pdt_productinfo` (`pdt_id`, `barcode`, `pdt_item_id`, `pdt_cat_id`, `pdt_subcat_id`, `pdt_brand_id`, `pdt_name_en`, `pdt_name_bn`, `pdt_measurement`, `pdt_purchase_price`, `pdt_sale_price`, `pdt_short_details`, `pdt_details`, `pdt_condition`, `pdt_barcode`, `pdt_image`, `pdt_suspension`, `pdt_shelf_no`, `pdt_shortage`, `pdt_over_stock`, `pdt_order_qunt`, `pdt_old_price`, `pdt_admin_id`, `pdt_status`, `pdt_url`, `created_at`, `updated_at`) VALUES
('PDT-000230', 'PDT-000230', 'ITM-000234', 'CAT-000226', NULL, 'BRN-28', 'AMINOVITAL HIGH ING100ML', NULL, '1', 362.70, 390.00, NULL, NULL, NULL, 'PDT-000230', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000231', 'PDT-000231', 'ITM-000235', 'CAT-000227', NULL, 'BRN-28', 'AMINOVITAL HIGH INJ 20ML', NULL, '1', 102.30, 115.00, NULL, NULL, NULL, 'PDT-000231', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000232', 'PDT-000232', 'ITM-000236', 'CAT-000228', NULL, 'BRN-28', 'CALCIUM FORTE M500MLINJ', NULL, '1', 539.40, 600.00, NULL, NULL, NULL, 'PDT-000232', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000233', 'PDT-000233', 'ITM-000237', 'CAT-000229', NULL, 'BRN-28', 'CALCIUM FORTE M250ML INJ', NULL, '1', 320.85, 350.00, NULL, NULL, NULL, 'PDT-000233', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000234', 'PDT-000234', 'ITM-000238', 'CAT-000230', NULL, 'BRN-28', 'CAROSIL INJ100ML', NULL, '1', 599.85, 720.00, NULL, NULL, NULL, 'PDT-000234', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000235', 'PDT-000235', 'ITM-000239', NULL, NULL, 'BRN-28', 'RUMIPRO APPETIZER 200GM', NULL, '1', 405.82, 445.00, NULL, NULL, NULL, 'PDT-000235', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000236', 'PDT-000236', 'ITM-000240', NULL, NULL, 'BRN-28', 'THAMPYRON INJ50ML', NULL, '1', 242.80, 270.00, NULL, NULL, NULL, 'PDT-000236', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000238', 'PDT-000238', 'ITM-000242', 'CAT-000234', NULL, 'BRN-06', 'EUROLAC GREEN', NULL, '1', 320.00, 350.00, NULL, NULL, NULL, 'PDT-000238', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000239', 'PDT-000239', 'ITM-000243', 'CAT-000235', NULL, 'BRN-09', 'ACURTIN', NULL, '1', 485.00, 550.00, NULL, NULL, NULL, 'PDT-000239', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000240', 'PDT-000240', 'ITM-000244', 'CAT-000236', NULL, 'BRN-02', 'PRYCIN VET INJ 10ML', NULL, '1', 57.27, 65.00, NULL, NULL, NULL, 'PDT-000240', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000241', 'PDT-000241', 'ITM-000245', 'CAT-000237', NULL, 'BRN-02', 'E VET', NULL, '1', 77.94, 87.00, NULL, NULL, NULL, 'PDT-000241', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000242', 'PDT-000242', 'ITM-000246', 'CAT-000238', NULL, 'BRN-02', 'DEXTROSE 5% 1000ML', NULL, '1', 76.13, 85.00, NULL, NULL, NULL, 'PDT-000242', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000243', 'PDT-000243', 'ITM-000247', 'CAT-000239', NULL, 'BRN-02', 'DEXTROSE DS10% 1000ML', NULL, '1', 87.56, 97.00, NULL, NULL, NULL, 'PDT-000243', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000244', 'PDT-000244', 'ITM-000248', 'CAT-000240', NULL, 'BRN-02', 'DEXTROSE N 1000ML', NULL, '1', 83.75, 95.00, NULL, NULL, NULL, 'PDT-000244', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000245', 'PDT-000245', 'ITM-000249', 'CAT-000247', NULL, 'BRN-22', 'MONSEL E', NULL, '1', 100.00, 115.00, NULL, NULL, NULL, 'PDT-000245', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000246', 'PDT-000246', 'ITM-000250', 'CAT-000248', NULL, 'BRN-22', 'NAVASOL VET', NULL, '1', 132.00, 145.00, NULL, NULL, NULL, 'PDT-000246', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000247', 'PDT-000247', 'ITM-000251', 'CAT-000249', NULL, 'BRN-22', 'NAVAPRO PLUS', NULL, '1', 15.00, 18.00, NULL, NULL, NULL, 'PDT-000247', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000248', 'PDT-000248', 'ITM-000252', 'CAT-000250', NULL, 'BRN-22', 'RELPAIN VET', NULL, '1', 5.00, 7.00, NULL, NULL, NULL, 'PDT-000248', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000249', 'PDT-000249', 'ITM-000253', 'CAT-000251', NULL, 'BRN-22', 'NAVADEX', NULL, '1', 17.45, 20.00, NULL, NULL, NULL, 'PDT-000249', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000251', 'PDT-000251', 'ITM-000255', 'CAT-000252', NULL, 'BRN-04', 'LISOVIT 10GM', NULL, '1', 45.85, 50.00, NULL, NULL, NULL, 'PDT-000251', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000252', 'PDT-000252', 'ITM-000256', 'CAT-000253', NULL, 'BRN-03', '0RAL SALINE', NULL, '1', 14.55, 17.00, NULL, NULL, NULL, 'PDT-000252', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000253', 'PDT-000253', 'ITM-000096', 'CAT-000096', NULL, 'BRN-03', 'ORACAL VET 1LITER', NULL, '1', 272.81, 285.00, NULL, NULL, NULL, 'PDT-000253', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000254', 'PDT-000254', 'ITM-000258', 'CAT-000255', NULL, 'BRN-31', 'GROW FAST', NULL, '1', 309.00, 450.00, NULL, NULL, NULL, 'PDT-000254', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000255', 'PDT-000255', 'ITM-000011', 'CAT-000012', NULL, 'BRN-16', 'SONALI GROWER', NULL, '15', 2589.00, 0.00, NULL, NULL, NULL, 'PDT-000255', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000256', 'PDT-000256', 'ITM-000259', 'CAT-000256', NULL, 'BRN-03', 'ORACAL VET 5 LITER', NULL, '1', 1250.00, 1350.00, NULL, NULL, NULL, 'PDT-000256', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '3', 1, NULL, NULL, NULL),
('PDT-000257', 'PDT-000257', 'ITM-000260', 'CAT-000257', NULL, 'BRN-03', 'ZINC CARE 200ML', NULL, '1', 56.00, 70.00, NULL, NULL, NULL, 'PDT-000257', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000258', 'PDT-000258', 'ITM-000010', 'CAT-000010', NULL, 'BRN-16', 'sonali starter', NULL, '15', 2725.00, 0.00, NULL, NULL, NULL, 'PDT-000258', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000259', 'PDT-000259', 'ITM-000264', NULL, NULL, 'BRN-21', 'AMINOVIT PLUS 100ML INJ', NULL, '1', 250.93, 275.00, NULL, NULL, NULL, 'PDT-000259', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000260', 'PDT-000260', 'ITM-000262', 'CAT-000259', NULL, 'BRN-21', 'AMINOVIT PLUS 50ML INJ', NULL, '1', 129.12, 145.00, NULL, NULL, NULL, 'PDT-000260', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000261', 'PDT-000261', 'ITM-000263', 'CAT-000260', NULL, 'BRN-21', 'AMINOVIT PLUS 500ML', NULL, '1', 310.40, 370.00, NULL, NULL, NULL, 'PDT-000261', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000262', 'PDT-000262', 'ITM-000261', 'CAT-000258', NULL, 'BRN-21', 'AMINOVIT PLUS 100ML', NULL, '1', 77.60, 90.00, NULL, NULL, NULL, 'PDT-000262', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000263', 'PDT-000263', 'ITM-000265', 'CAT-000262', NULL, 'BRN-21', 'GENTA BAC INJ 100ML', NULL, '1', 335.74, 365.00, NULL, NULL, NULL, 'PDT-000263', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000264', 'PDT-000264', 'ITM-000266', 'CAT-000263', NULL, 'BRN-21', 'GENTA BAC INJ 10ML', NULL, '1', 38.73, 42.00, NULL, NULL, NULL, 'PDT-000264', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000265', 'PDT-000265', 'ITM-000267', 'CAT-000264', NULL, 'BRN-21', 'GENTA BAC INJ 50ML', NULL, '1', 172.16, 190.00, NULL, NULL, NULL, 'PDT-000265', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000266', 'PDT-000266', 'ITM-000268', 'CAT-000265', NULL, 'BRN-21', 'SEL E', NULL, '1', 9.21, 12.00, NULL, NULL, NULL, 'PDT-000266', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000267', 'PDT-000267', 'ITM-000269', 'CAT-000266', NULL, 'BRN-27', 'NEURO B INJ', NULL, '1', 21.87, 25.00, NULL, NULL, NULL, 'PDT-000267', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000268', 'PDT-000268', 'ITM-000270', 'CAT-000267', NULL, 'BRN-27', 'FUSID INJ', NULL, '1', 7.75, 9.00, NULL, NULL, NULL, 'PDT-000268', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000269', 'PDT-000269', 'ITM-000271', 'CAT-000268', NULL, 'BRN-34', 'BUSHI MIX CATTEL FEED', NULL, '15', 1175.00, 1310.00, NULL, NULL, NULL, 'PDT-000269', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000270', 'PDT-000270', 'ITM-000272', 'CAT-000269', NULL, 'BRN-25', 'H 5', NULL, '1', 2250.00, 2270.00, NULL, NULL, NULL, 'PDT-000270', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000271', 'PDT-000271', 'ITM-000273', 'CAT-000270', NULL, 'BRN-02', 'KETO AVET TAB', NULL, '1', 17.60, 20.00, NULL, NULL, NULL, 'PDT-000271', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000272', 'PDT-000272', 'ITM-000241', 'CAT-000246', NULL, 'BRN-04', 'RENAZURIL VET 100ML', NULL, '1', 360.01, 390.00, NULL, NULL, NULL, 'PDT-000272', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000273', 'PDT-000273', 'ITM-000127', 'CAT-000121', NULL, 'BRN-03', 'VET SALINE', NULL, '1', 14.55, 16.00, NULL, NULL, NULL, 'PDT-000273', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000274', 'PDT-000274', 'ITM-000275', 'CAT-000272', NULL, 'BRN-02', 'VITALAMINO FORTE', NULL, '1', 111.11, 135.00, NULL, NULL, NULL, 'PDT-000274', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000275', '5586', 'ITM-000276', 'CAT-000273', NULL, 'BRN-02', 'BRONCHO VET 100ML', NULL, '1', 26.45, 32.00, NULL, NULL, NULL, '5586', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '3', 1, NULL, NULL, NULL),
('PDT-000276', '7214', 'ITM-000277', 'CAT-000275', NULL, 'BRN-02', 'ACMEZYME 100GM', NULL, '1', 129.34, 150.00, NULL, NULL, NULL, '7214', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '3', 1, NULL, NULL, NULL),
('PDT-000277', '7794', 'ITM-000278', 'CAT-000276', NULL, 'BRN-05', 'PHOSCAL DB', NULL, '1', 103.18, 140.00, NULL, NULL, NULL, '7794', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '3', 1, NULL, NULL, NULL),
('PDT-000278', '5020', 'ITM-000279', 'CAT-000277', NULL, 'BRN-26', 'CALDIMAX INJ 100ML', NULL, '1', 219.91, 250.00, NULL, NULL, NULL, '5020', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '3', 1, NULL, NULL, NULL),
('PDT-000279', '6275', 'ITM-000280', 'CAT-000278', NULL, 'BRN-02', 'ASTA VET 10ML INJ', NULL, '1', 12.89, 15.00, NULL, NULL, NULL, '6275', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '3', 1, NULL, NULL, NULL),
('PDT-000280', '4668', 'ITM-000281', 'CAT-000279', NULL, 'BRN-09', 'SKIN CARE', NULL, '1', 665.00, 690.00, NULL, NULL, NULL, '4668', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '3', 1, NULL, NULL, NULL),
('PDT-000281', '5806', 'ITM-000282', 'CAT-000280', NULL, 'BRN-02', 'VITAMIX DB SUPAR 1KG', NULL, '1', 295.85, 350.00, NULL, NULL, NULL, '5806', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '3', 1, NULL, NULL, NULL),
('PDT-000282', '5490', 'ITM-000283', 'CAT-000281', NULL, 'BRN-02', 'VITAMIX DB SUPAR 500GM', NULL, '1', 169.75, 200.00, NULL, NULL, NULL, '5490', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '3', 1, NULL, NULL, NULL),
('PDT-000283', '6662', 'ITM-000284', 'CAT-000282', NULL, 'BRN-04', 'STOMA VET 20GM PW', NULL, '1', 8.91, 11.00, NULL, NULL, NULL, '6662', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '3', 1, NULL, NULL, NULL),
('PDT-000284', '7317', 'ITM-000047', 'CAT-000047', NULL, 'BRN-10', 'NEWLECTROLYTE 1KG', NULL, '1', 120.00, 140.00, NULL, NULL, NULL, '7317', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '3', 1, NULL, NULL, NULL),
('PDT-000285', '4242', 'ITM-000287', 'CAT-000285', NULL, 'BRN-02', 'TRACID VET 10ML INJ', NULL, '1', 43.00, 48.00, NULL, NULL, NULL, '4242', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '3', 1, NULL, NULL, NULL),
('PDT-000286', '9827', 'ITM-000288', 'CAT-000286', NULL, 'BRN-02', 'PHENADRYL VET 10MLINJ', NULL, '1', 12.89, 15.00, NULL, NULL, NULL, '9827', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '3', 1, NULL, NULL, NULL),
('PDT-000287', '1313', 'ITM-000289', 'CAT-000287', NULL, 'BRN-02', 'PHENADRYL VET 30MLINJ', NULL, '1', 34.44, 40.00, NULL, NULL, NULL, '1313', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '3', 1, NULL, NULL, NULL),
('PDT-000288', '4094', 'ITM-000290', 'CAT-000288', NULL, 'BRN-27', 'B COM VIT', NULL, '1', 349.86, 390.00, NULL, NULL, NULL, '4094', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000289', '8380', 'ITM-000285', 'CAT-000283', NULL, 'BRN-000035', 'D3 50 PLUS', NULL, '1', 490.00, 550.00, NULL, NULL, NULL, '8380', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000290', '4349', 'ITM-000286', 'CAT-000284', NULL, 'BRN-000035', 'XENOREX', NULL, '1', 382.20, 420.00, NULL, NULL, NULL, '4349', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000291', '5817', 'ITM-000291', 'CAT-000289', NULL, 'BRN-05', 'TYMPANIL 100ML', NULL, '1', 124.20, 145.00, NULL, NULL, NULL, '5817', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000292', '2264', 'ITM-000292', 'CAT-000290', NULL, 'BRN-29', 'BUSI GOLD CATTAL FEED', NULL, '15', 1269.00, 1350.00, NULL, NULL, NULL, '2264', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000293', '9919', 'ITM-000001', 'CAT-000001', NULL, 'BRN-29', 'Broiler starter', NULL, '15', 3085.80, 0.00, NULL, NULL, NULL, '9919', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000294', '7306', 'ITM-000293', 'CAT-000291', NULL, 'BRN-04', 'GENTAREN INJ 100ML', NULL, '1', 335.32, 355.00, NULL, NULL, NULL, '7306', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000295', '5904', 'ITM-000294', 'CAT-000292', NULL, 'BRN-23', 'A MAX XTRA', NULL, '1', 640.00, 700.00, NULL, NULL, NULL, '5904', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000296', '3672', 'ITM-000295', 'CAT-000293', NULL, 'BRN-27', 'RUBBER MET HIGH', NULL, '1', 860.00, 1080.00, NULL, NULL, NULL, '3672', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000297', '4071', 'ITM-000296', 'CAT-000295', NULL, 'BRN-04', 'RENASOL AD3E 30ML INJ', NULL, '1', 279.00, 310.00, NULL, NULL, NULL, '4071', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000298', '5898', 'ITM-000297', 'CAT-000296', NULL, 'BRN-07', 'IB ND LIVE VAC', NULL, '1', 370.00, 380.00, NULL, NULL, NULL, '5898', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000299', '5748', 'ITM-000298', 'CAT-000297', NULL, 'BRN-02', 'MOXILIN VET 1GM INJ', NULL, '1', 54.03, 65.00, NULL, NULL, NULL, '5748', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000300', '4991', 'ITM-000299', 'CAT-000298', NULL, 'BRN-02', 'SP VET 2.5GM', NULL, '1', 80.00, 90.00, NULL, NULL, NULL, '4991', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000301', '5320', 'ITM-000300', NULL, NULL, 'BRN-02', 'TIFUR VET1GM', NULL, '1', 428.79, 490.00, NULL, NULL, NULL, '5320', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000302', '2233', 'ITM-000301', 'CAT-000300', NULL, 'BRN-02', 'TIFUR VET.5GM', NULL, '1', 214.40, 240.00, NULL, NULL, NULL, '2233', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000303', '9486', 'ITM-000302', 'CAT-000301', NULL, 'BRN-02', 'TIFUR VET.25GM', NULL, '1', 111.49, 125.00, NULL, NULL, NULL, '9486', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000304', '6857', 'ITM-000303', 'CAT-000302', NULL, 'BRN-21', 'GAMBURO VAC', NULL, '1', 430.00, 450.00, NULL, NULL, NULL, '6857', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000305', '3108', 'ITM-000304', 'CAT-000303', NULL, 'BRN-02', 'ZIS VET 1LITAR', NULL, '1', 181.07, 220.00, NULL, NULL, NULL, '3108', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000306', '4016', 'ITM-000305', 'CAT-000304', NULL, 'BRN-09', 'BOOSTER', NULL, '1', 187.09, 235.00, NULL, NULL, NULL, '4016', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000307', '6792', 'ITM-000307', 'CAT-000306', NULL, 'BRN-27', 'CIPROCIN VET INJ 50 ML', NULL, '1', 126.25, 140.00, NULL, NULL, NULL, '6792', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000308', '8399', 'ITM-000308', 'CAT-000307', NULL, 'BRN-27', 'CIPROCIN VET INJ 10 ML', NULL, '1', 29.60, 35.00, NULL, NULL, NULL, '8399', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000309', '4909', 'ITM-000309', 'CAT-000308', NULL, 'BRN-27', 'HAMECO PH 1LITAR', NULL, '1', 770.00, 900.00, NULL, NULL, NULL, '4909', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000310', '1116', 'ITM-000306', 'CAT-000305', NULL, 'BRN-000036', 'NUTRI FLUVIR', NULL, '1', 1741.55, 2050.00, NULL, NULL, NULL, '1116', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000311', '8464', 'ITM-000310', 'CAT-000309', NULL, 'BRN-000037', 'CM VET INJ100ML', NULL, '1', 75.66, 85.00, NULL, NULL, NULL, '8464', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000312', '6751', 'ITM-000311', 'CAT-000310', NULL, 'BRN-000037', 'CM VET INJ10ML', NULL, '1', 8.20, 9.00, NULL, NULL, NULL, '6751', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000313', '8572', 'ITM-000312', 'CAT-000311', NULL, 'BRN-000037', 'TRIVET', NULL, '1', 2.80, 3.00, NULL, NULL, NULL, '8572', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000314', '5564', 'ITM-000313', 'CAT-000312', NULL, 'BRN-000003', 'AMPROL EP VET', NULL, '1', 26.40, 30.00, NULL, NULL, NULL, '5564', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000315', '3010', 'ITM-000314', NULL, NULL, 'BRN-000004', 'FEVINIL INJ30 ML', NULL, '1', 249.80, 270.00, NULL, NULL, NULL, '3010', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000316', '1236', 'ITM-000315', 'CAT-000314', NULL, 'BRN-000027', 'DETOX VET POW', NULL, '1', 156.00, 195.00, NULL, NULL, NULL, '1236', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000317', '8983', 'ITM-000316', 'CAT-000315', NULL, 'BRN-000028', 'MASTI TUBE', NULL, '1', 73.90, 95.00, NULL, NULL, NULL, '8983', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000318', '8926', 'ITM-000317', NULL, NULL, 'BRN-000002', 'BOVI CARE 125GM', NULL, '1', 164.90, 185.00, NULL, NULL, NULL, '8926', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000319', '1961', 'ITM-000318', 'CAT-000317', NULL, 'BRN-000009', 'TYLO PC GOLD 100 ML INJ', NULL, '1', 699.36, 800.00, NULL, NULL, NULL, '1961', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000320', '9937', 'ITM-000319', 'CAT-000319', NULL, 'BRN-000020', 'RE FENCE', NULL, '1', 1181.00, 1300.00, NULL, NULL, NULL, '9937', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000321', '3943', 'ITM-000320', 'CAT-000320', NULL, 'BRN-000004', 'DIADIN INJ100ML', NULL, '1', 103.14, 115.00, NULL, NULL, NULL, '3943', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000322', '7978', 'ITM-000321', 'CAT-000321', NULL, 'BRN-000004', 'DIADIN INJ30ML', NULL, '1', 31.23, 35.00, NULL, NULL, NULL, '7978', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000323', '2839', 'ITM-000322', 'CAT-000322', NULL, 'BRN-000002', 'V PLEX VET100ML', NULL, '1', 86.10, 95.00, NULL, NULL, NULL, '2839', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000324', '5119', 'ITM-000323', 'CAT-000323', NULL, 'BRN-000027', 'ESPA VET', NULL, '1', 44.00, 50.00, NULL, NULL, NULL, '5119', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000325', '2384', 'ITM-000324', 'CAT-000324', NULL, 'BRN-000005', 'RESTOLIV 500ML', NULL, '1', 485.00, 585.00, NULL, NULL, NULL, '2384', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000326', '4063', 'ITM-000325', 'CAT-000325', NULL, 'BRN-000005', 'REVIT ADE 100ML', NULL, '1', 20.00, 220.00, NULL, NULL, NULL, '4063', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000327', '9885', 'ITM-000326', 'CAT-000326', NULL, 'BRN-000011', 'EXTRAMIN P 500ML', NULL, '1', 306.00, 350.00, NULL, NULL, NULL, '9885', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000328', '4577', 'ITM-000327', 'CAT-000327', NULL, 'BRN-000011', 'RUCHI FORT 200ML', NULL, '1', 103.50, 125.00, NULL, NULL, NULL, '4577', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000329', '5490', 'ITM-000328', 'CAT-000328', NULL, 'BRN-000011', 'HEPATO CARE BOLAS', NULL, '1', 21.00, 27.00, NULL, NULL, NULL, '5490', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000330', '3278', 'ITM-000329', 'CAT-000329', NULL, 'BRN-000020', 'GROWTH FORMULA', NULL, '1', 386.00, 450.00, NULL, NULL, NULL, '3278', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000331', '1651', 'ITM-000330', 'CAT-000330', NULL, 'BRN-000010', 'SOLVITEC E 100ML', NULL, '1', 95.11, 125.00, NULL, NULL, NULL, '1651', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000332', '2547', 'ITM-000331', 'CAT-000331', NULL, 'BRN-000010', 'SOLVITEC E 500ML', NULL, '1', 462.22, 530.00, NULL, NULL, NULL, '2547', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000333', '2020', 'ITM-000332', 'CAT-000332', NULL, 'BRN-000010', 'S0LVITEC E 1000ML', NULL, '1', 822.22, 1000.00, NULL, NULL, NULL, '2020', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000334', '2759', 'ITM-000333', 'CAT-000333', NULL, 'BRN-000010', 'COCCILOC 100ML', NULL, '1', 351.11, 395.00, NULL, NULL, NULL, '2759', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000335', '4835', 'ITM-000334', 'CAT-000334', NULL, 'BRN-000010', 'COCCILOC 500ML', NULL, '1', 1573.00, 1780.00, NULL, NULL, NULL, '4835', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000336', '7356', 'ITM-000335', 'CAT-000335', NULL, 'BRN-000010', 'HIDEX LIV-P1000ML', NULL, '1', 222.22, 270.00, NULL, NULL, NULL, '7356', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000337', '2101', 'ITM-000336', 'CAT-000336', NULL, 'BRN-000010', 'NEW CAL P PLUS POW 500 GM', NULL, '1', 176.00, 200.00, NULL, NULL, NULL, '2101', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL),
('PDT-000338', '2638', 'ITM-000337', 'CAT-000337', NULL, 'BRN-000010', 'ENRO TEC VET20%500ML', NULL, '1', 1272.17, 1390.00, NULL, NULL, NULL, '2638', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pdt_subcategory`
--

CREATE TABLE `pdt_subcategory` (
  `subcat_id` varchar(11) NOT NULL,
  `subcat_sl` int(10) NOT NULL,
  `subcat_item_id` varchar(15) NOT NULL,
  `subcat_cat_id` varchar(15) DEFAULT NULL,
  `subcat_name_en` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subcat_name_bn` varchar(255) DEFAULT NULL,
  `subcat_image` varbinary(64) DEFAULT NULL,
  `subcat_banner` varbinary(64) DEFAULT NULL,
  `subcat_url` varchar(64) DEFAULT NULL,
  `subcat_status` tinyint(1) DEFAULT 1,
  `subcat_admin_id` varbinary(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_current`
--

CREATE TABLE `purchase_current` (
  `id` int(10) NOT NULL,
  `pdt_id` varchar(15) NOT NULL,
  `sub_unit_id` int(10) DEFAULT NULL,
  `purchase_quantity` double(11,2) NOT NULL,
  `purchase_price` double(11,2) NOT NULL,
  `discount_amount` double(11,2) NOT NULL,
  `per_unit_cost` double(11,2) NOT NULL,
  `sale_price_per_unit` double(11,2) NOT NULL,
  `pdt_expiry_date` date DEFAULT NULL,
  `session_id` varchar(191) NOT NULL,
  `admin_id` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_current`
--

INSERT INTO `purchase_current` (`id`, `pdt_id`, `sub_unit_id`, `purchase_quantity`, `purchase_price`, `discount_amount`, `per_unit_cost`, `sale_price_per_unit`, `pdt_expiry_date`, `session_id`, `admin_id`, `created_at`, `updated_at`) VALUES
(554, 'PDT-000189', 1, 1.00, 172.40, 0.00, 0.00, 200.00, NULL, '2Gq3Iz0aKgLKgApeqbyokLuVsCqjIiH36bxvdZ0e', '1', '2022-10-29 13:57:44', '2022-10-29 13:57:44'),
(571, 'PDT-000217', 1, 1.00, 118.95, 0.00, 0.00, 135.00, NULL, 'shqkQNE3XZHQdnYOMvlgCKCfGDLUQF4xp3flxD1Q', '1', '2022-11-06 13:27:58', '2022-11-06 13:27:58');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_entry`
--

CREATE TABLE `purchase_entry` (
  `id` int(10) NOT NULL,
  `invoice_no` varchar(15) NOT NULL,
  `product_id` varchar(15) NOT NULL,
  `sub_unit_id` int(10) DEFAULT NULL,
  `product_quantity` double DEFAULT NULL,
  `purchase_price` double DEFAULT NULL,
  `per_unit_cost` double DEFAULT NULL,
  `discount_amount` double DEFAULT NULL,
  `pdt_expiry_date` date DEFAULT NULL,
  `entry_date` date DEFAULT NULL,
  `branch_id` varchar(11) DEFAULT NULL,
  `admin_id` varchar(15) DEFAULT NULL,
  `status` int(2) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_entry`
--

INSERT INTO `purchase_entry` (`id`, `invoice_no`, `product_id`, `sub_unit_id`, `product_quantity`, `purchase_price`, `per_unit_cost`, `discount_amount`, `pdt_expiry_date`, `entry_date`, `branch_id`, `admin_id`, `status`, `created_at`, `updated_at`) VALUES
(88, 'PI-0000001', 'PDT-000017', 1, 42, 4.04, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 11:31:13', '2022-10-12 11:07:40'),
(89, 'PI-0000001', 'PDT-000018', 1, 10, 171.61, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 11:31:13', '2022-10-12 11:07:40'),
(90, 'PI-0000001', 'PDT-000019', 1, 5, 365.62, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 11:31:13', '2022-10-12 11:07:40'),
(91, 'PI-0000001', 'PDT-000020', 1, 11, 155.61, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 11:31:13', '2022-10-12 11:07:40'),
(92, 'PI-0000001', 'PDT-000021', 1, 18, 127.8, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 11:31:13', '2022-10-12 11:07:40'),
(93, 'PI-0000001', 'PDT-000022', 1, 6, 87.52, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 11:31:13', '2022-10-12 11:07:40'),
(94, 'PI-0000001', 'PDT-000023', 1, 15, 208.93, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 11:31:13', '2022-10-12 11:07:40'),
(95, 'PI-0000001', 'PDT-000024', 1, 24, 5.61, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 11:31:13', '2022-10-12 11:07:40'),
(96, 'PI-0000001', 'PDT-000025', 1, 10, 408.92, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 11:31:13', '2022-10-12 11:07:40'),
(97, 'PI-0000001', 'PDT-000026', 1, 110, 31.76, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 11:31:13', '2022-10-12 11:07:40'),
(98, 'PI-0000001', 'PDT-000027', 1, 11, 65.13, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 11:31:13', '2022-10-12 11:07:40'),
(99, 'PI-0000001', 'PDT-000128', 1, 5, 183.64, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 11:31:13', '2022-10-12 11:07:40'),
(100, 'PI-0000001', 'PDT-000028', 1, 220, 2.59, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 11:31:13', '2022-10-12 11:07:40'),
(101, 'PI-0000001', 'PDT-000029', 1, 11, 664.77, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 11:31:13', '2022-10-12 11:07:40'),
(102, 'PI-0000001', 'PDT-000030', 1, 5, 87.75, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 11:31:13', '2022-10-12 11:07:40'),
(103, 'PI-0000001', 'PDT-000031', 1, 5, 126.98, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 11:31:13', '2022-10-12 11:07:40'),
(104, 'PI-0000001', 'PDT-000032', 1, 40, 5.56, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 11:31:13', '2022-10-12 11:07:40'),
(105, 'PI-0000001', 'PDT-000033', 1, 10, 582.58, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 11:31:13', '2022-10-12 11:07:40'),
(107, 'PI-0000002', 'PDT-000153', 1, 3, 75.51, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(108, 'PI-0000002', 'PDT-000154', 1, 5, 165.49, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(109, 'PI-0000002', 'PDT-000035', 1, 11, 128.52, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(110, 'PI-0000002', 'PDT-000036', 1, 8, 286.65, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(111, 'PI-0000002', 'PDT-000037', 1, 20, 8.58, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(112, 'PI-0000002', 'PDT-000038', 1, 40, 18.02, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(113, 'PI-0000002', 'PDT-000039', 1, 3, 60.06, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(114, 'PI-0000002', 'PDT-000040', 1, 11, 69.3, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(115, 'PI-0000002', 'PDT-000162', 1, 3, 807.88, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(116, 'PI-0000002', 'PDT-000168', 1, 3, 94, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(117, 'PI-0000002', 'PDT-000170', 1, 3, 482.63, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(118, 'PI-0000002', 'PDT-000171', 1, 3, 171.62, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(119, 'PI-0000002', 'PDT-000172', 1, 3, 279.8, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(120, 'PI-0000002', 'PDT-000173', 1, 20, 7.59, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(121, 'PI-0000002', 'PDT-000024', 1, 24, 5.61, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(122, 'PI-0000002', 'PDT-000190', 1, 6, 165.75, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(123, 'PI-0000002', 'PDT-000191', 1, 2, 292.5, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(124, 'PI-0000002', 'PDT-000021', 1, 36, 127.8, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(125, 'PI-0000002', 'PDT-000018', 1, 10, 171.61, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(126, 'PI-0000002', 'PDT-000194', 1, 5, 58.5, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(127, 'PI-0000002', 'PDT-000211', 1, 10, 94.97, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(128, 'PI-0000002', 'PDT-000213', 1, 10, 146.25, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(129, 'PI-0000002', 'PDT-000214', 1, 2, 165.75, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(130, 'PI-0000002', 'PDT-000215', 1, 3, 63.82, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(131, 'PI-0000002', 'PDT-000219', 1, 3, 86.24, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(132, 'PI-0000002', 'PDT-000216', 1, 3, 64.68, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(133, 'PI-0000002', 'PDT-000217', 1, 3, 118.95, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(134, 'PI-0000002', 'PDT-000220', 1, 20, 38.27, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(135, 'PI-0000002', 'PDT-000023', 1, 35, 208.93, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(136, 'PI-0000003', 'PDT-000251', 1, 10, 45.85, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-01 19:25:18', '2022-10-12 11:07:40'),
(137, 'PI-0000004', 'PDT-000076', 1, 3, 810, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 04:56:01', '2022-10-12 11:07:40'),
(138, 'PI-0000004', 'PDT-000067', 1, 21, 324.84, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 04:56:01', '2022-10-12 11:07:40'),
(139, 'PI-0000004', 'PDT-000068', 1, 16, 3062.81, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 04:56:01', '2022-10-12 11:07:40'),
(140, 'PI-0000004', 'PDT-000069', 1, 16, 3290.62, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 04:56:01', '2022-10-12 11:07:40'),
(141, 'PI-0000004', 'PDT-000070', 1, 5, 909, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 04:56:01', '2022-10-12 11:07:40'),
(142, 'PI-0000004', 'PDT-000071', 1, 5, 787.5, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 04:56:01', '2022-10-12 11:07:40'),
(143, 'PI-0000004', 'PDT-000072', 1, 12, 630, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 04:56:01', '2022-10-12 11:07:40'),
(144, 'PI-0000004', 'PDT-000073', 1, 5, 463.5, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 04:56:01', '2022-10-12 11:07:40'),
(145, 'PI-0000005', 'PDT-000118', 1, 134, 31.99, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 05:15:03', '2022-10-12 11:07:40'),
(146, 'PI-0000005', 'PDT-000119', 1, 11, 336.36, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 05:15:03', '2022-10-12 11:07:40'),
(147, 'PI-0000005', 'PDT-000120', 1, 11, 181.82, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 05:15:03', '2022-10-12 11:07:40'),
(148, 'PI-0000005', 'PDT-000121', 1, 11, 162.39, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 05:15:03', '2022-10-12 11:07:40'),
(149, 'PI-0000005', 'PDT-000122', 1, 11, 405.96, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 05:15:03', '2022-10-12 11:07:40'),
(150, 'PI-0000005', 'PDT-000123', 1, 220, 16.24, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 05:15:03', '2022-10-12 11:07:40'),
(151, 'PI-0000005', 'PDT-000124', 1, 12, 312.5, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 05:15:03', '2022-10-12 11:07:40'),
(152, 'PI-0000005', 'PDT-000125', 1, 110, 30, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 05:15:03', '2022-10-12 11:07:40'),
(153, 'PI-0000005', 'PDT-000094', 1, 12, 729.37, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 05:15:03', '2022-10-12 11:07:40'),
(154, 'PI-0000005', 'PDT-000095', 1, 11, 584.97, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 05:15:03', '2022-10-12 11:07:40'),
(155, 'PI-0000005', 'PDT-000096', 1, 12, 291.67, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 05:15:03', '2022-10-12 11:07:40'),
(156, 'PI-0000005', 'PDT-000097', 1, 11, 181.82, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 05:15:03', '2022-10-12 11:07:40'),
(157, 'PI-0000005', 'PDT-000198', 1, 162, 26.29, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 05:15:03', '2022-10-12 11:07:40'),
(158, 'PI-0000006', 'PDT-000253', 1, 16, 272.81, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 05:30:01', '2022-10-12 11:07:40'),
(159, 'PI-0000006', 'PDT-000252', 1, 110, 14.55, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 05:30:01', '2022-10-12 11:07:40'),
(160, 'PI-0000006', 'PDT-000097', 1, 28, 178.57, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 05:30:01', '2022-10-12 11:07:40'),
(161, 'PI-0000007', 'PDT-000129', 1, 15, 796.41, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 15:07:46', '2022-10-12 11:07:41'),
(162, 'PI-0000007', 'PDT-000130', 1, 10, 81.72, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 15:07:46', '2022-10-12 11:07:41'),
(163, 'PI-0000007', 'PDT-000131', 1, 10, 111.35, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 15:07:46', '2022-10-12 11:07:41'),
(164, 'PI-0000007', 'PDT-000209', 1, 6, 242.5, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 15:07:46', '2022-10-12 11:07:41'),
(165, 'PI-0000008', 'PDT-000105', 1, 24, 354.68, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 15:35:56', '2022-10-12 11:07:41'),
(166, 'PI-0000008', 'PDT-000106', 1, 100, 13.75, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 15:35:56', '2022-10-12 11:07:41'),
(167, 'PI-0000008', 'PDT-000107', 1, 60, 163.19, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 15:35:56', '2022-10-12 11:07:41'),
(168, 'PI-0000008', 'PDT-000108', 1, 50, 228.81, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 15:35:56', '2022-10-12 11:07:41'),
(169, 'PI-0000008', 'PDT-000109', 1, 6, 683.06, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 15:35:56', '2022-10-12 11:07:41'),
(170, 'PI-0000008', 'PDT-000099', 1, 12, 191.1, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 15:35:56', '2022-10-12 11:07:41'),
(171, 'PI-0000008', 'PDT-000110', 1, 4, 910, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 15:35:56', '2022-10-12 11:07:41'),
(172, 'PI-0000008', 'PDT-000111', 1, 6, 480, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 15:35:56', '2022-10-12 11:07:41'),
(173, 'PI-0000008', 'PDT-000112', 1, 10, 313.6, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 15:35:56', '2022-10-12 11:07:41'),
(174, 'PI-0000008', 'PDT-000113', 1, 10, 931, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 15:35:56', '2022-10-12 11:07:41'),
(175, 'PI-0000008', 'PDT-000114', 1, 21, 336, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 15:35:56', '2022-10-12 11:07:41'),
(176, 'PI-0000008', 'PDT-000115', 1, 12, 298.9, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 15:35:56', '2022-10-12 11:07:41'),
(177, 'PI-0000008', 'PDT-000116', 1, 6, 1421, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 15:35:56', '2022-10-12 11:07:41'),
(178, 'PI-0000008', 'PDT-000117', 1, 120, 20.89, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 15:35:56', '2022-10-12 11:07:41'),
(179, 'PI-0000009', 'PDT-000107', 1, 37, 163.19, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 15:46:27', '2022-10-12 11:07:41'),
(180, 'PI-0000009', 'PDT-000110', 1, 1, 910, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 15:46:27', '2022-10-12 11:07:41'),
(181, 'PI-0000009', 'PDT-000159', 1, 5, 375, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 15:46:27', '2022-10-12 11:07:41'),
(182, 'PI-0000009', 'PDT-000044', 1, 1, 850, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 15:46:27', '2022-10-12 11:07:41'),
(183, 'PI-0000009', 'PDT-000064', 1, 8, 1241, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 15:46:27', '2022-10-12 11:07:41'),
(184, 'PI-0000010', 'PDT-000078', 1, 260, 11.31, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(185, 'PI-0000010', 'PDT-000079', 1, 11, 241.18, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(186, 'PI-0000010', 'PDT-000080', 1, 22, 20.49, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(187, 'PI-0000010', 'PDT-000081', 1, 57, 44.7, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(188, 'PI-0000010', 'PDT-000082', 1, 10, 637.88, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(189, 'PI-0000010', 'PDT-000083', 1, 6, 137, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(190, 'PI-0000010', 'PDT-000084', 1, 11, 285.3, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(191, 'PI-0000010', 'PDT-000085', 1, 9, 635.91, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(192, 'PI-0000010', 'PDT-000086', 1, 3, 785, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(193, 'PI-0000010', 'PDT-000087', 1, 10, 262.64, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(194, 'PI-0000010', 'PDT-000088', 1, 57, 85.96, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(195, 'PI-0000010', 'PDT-000089', 1, 32, 18.38, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(196, 'PI-0000010', 'PDT-000090', 1, 122, 31.18, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(197, 'PI-0000010', 'PDT-000091', 1, 8, 697.14, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(198, 'PI-0000010', 'PDT-000092', 1, 11, 285.09, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(199, 'PI-0000010', 'PDT-000093', 1, 11, 157.29, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(200, 'PI-0000010', 'PDT-000195', 1, 4, 249.42, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(201, 'PI-0000010', 'PDT-000196', 1, 5, 232.26, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(202, 'PI-0000010', 'PDT-000197', 1, 4, 586.8, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(203, 'PI-0000011', 'PDT-000174', 1, 6, 550, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-02 16:05:07', '2022-10-12 11:07:41'),
(204, 'PI-0000012', 'PDT-000077', 1, 11, 1506.82, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(205, 'PI-0000012', 'PDT-000043', 1, 12, 116.78, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(206, 'PI-0000012', 'PDT-000044', 1, 22, 806.27, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(207, 'PI-0000012', 'PDT-000045', 1, 10, 869.16, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(208, 'PI-0000012', 'PDT-000046', 1, 22, 99.78, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(209, 'PI-0000012', 'PDT-000048', 1, 5, 117, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(210, 'PI-0000012', 'PDT-000049', 1, 50, 16.66, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(211, 'PI-0000012', 'PDT-000050', 1, 11, 81.96, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(212, 'PI-0000012', 'PDT-000052', 1, 12, 175.18, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(213, 'PI-0000012', 'PDT-000053', 1, 12, 179.67, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(214, 'PI-0000012', 'PDT-000054', 1, 12, 624.92, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(215, 'PI-0000012', 'PDT-000055', 1, 3, 2812.17, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(216, 'PI-0000012', 'PDT-000056', 1, 100, 17.04, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(217, 'PI-0000012', 'PDT-000057', 1, 23, 1296.78, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(218, 'PI-0000012', 'PDT-000058', 1, 33, 83.78, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(219, 'PI-0000012', 'PDT-000059', 1, 16, 340, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(220, 'PI-0000012', 'PDT-000060', 1, 11, 187.09, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(221, 'PI-0000012', 'PDT-000061', 1, 40, 72.32, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(222, 'PI-0000012', 'PDT-000062', 1, 21, 172.67, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(223, 'PI-0000012', 'PDT-000063', 1, 11, 279.74, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(224, 'PI-0000012', 'PDT-000064', 1, 22, 1271.33, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(225, 'PI-0000012', 'PDT-000065', 1, 11, 66.82, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(226, 'PI-0000012', 'PDT-000066', 1, 24, 265.91, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(227, 'PI-0000012', 'PDT-000155', 1, 3, 703.12, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(228, 'PI-0000012', 'PDT-000156', 1, 2, 728, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(229, 'PI-0000013', 'PDT-000075', 1, 17, 383.15, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:17:01', '2022-10-12 11:07:42'),
(230, 'PI-0000013', 'PDT-000074', 1, 10, 1191.4, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:17:01', '2022-10-12 11:07:42'),
(231, 'PI-0000014', 'PDT-000180', 1, 2, 596.16, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:25:43', '2022-10-12 11:07:43'),
(232, 'PI-0000014', 'PDT-000181', 1, 11, 78.34, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:25:43', '2022-10-12 11:07:43'),
(233, 'PI-0000014', 'PDT-000182', 1, 10, 268.8, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:25:43', '2022-10-12 11:07:43'),
(234, 'PI-0000014', 'PDT-000183', 1, 2, 518.4, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:25:43', '2022-10-12 11:07:43'),
(235, 'PI-0000014', 'PDT-000192', 1, 20, 13.2, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:25:43', '2022-10-12 11:07:43'),
(236, 'PI-0000014', 'PDT-000193', 1, 10, 10.5, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:25:43', '2022-10-12 11:07:43'),
(237, 'PI-0000014', 'PDT-000218', 1, 3, 622, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:25:43', '2022-10-12 11:07:43'),
(238, 'PI-0000015', 'PDT-000042', 1, 24, 192.53, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:37:35', '2022-10-12 11:07:43'),
(239, 'PI-0000016', 'PDT-000160', 1, 11, 168.18, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:41:23', '2022-10-12 11:07:43'),
(240, 'PI-0000016', 'PDT-000161', 1, 10, 950, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:41:23', '2022-10-12 11:07:43'),
(241, 'PI-0000016', 'PDT-000199', 1, 3, 465.33, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:41:23', '2022-10-12 11:07:43'),
(242, 'PI-0000017', 'PDT-000184', 1, 11, 218.18, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:55:22', '2022-10-12 11:07:43'),
(243, 'PI-0000017', 'PDT-000185', 1, 2, 1113.6, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:55:22', '2022-10-12 11:07:43'),
(244, 'PI-0000017', 'PDT-000186', 1, 1, 107.52, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:55:22', '2022-10-12 11:07:43'),
(245, 'PI-0000017', 'PDT-000187', 1, 10, 35.52, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:55:22', '2022-10-12 11:07:43'),
(246, 'PI-0000017', 'PDT-000188', 1, 11, 417.16, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:55:22', '2022-10-12 11:07:43'),
(247, 'PI-0000017', 'PDT-000189', 1, 6, 172.4, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:55:22', '2022-10-12 11:07:43'),
(248, 'PI-0000018', 'PDT-000178', 1, 8, 209.5, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:58:09', '2022-10-12 11:07:43'),
(249, 'PI-0000018', 'PDT-000179', 1, 10, 10.61, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 06:58:09', '2022-10-12 11:07:43'),
(250, 'PI-0000019', 'PDT-000205', 1, 13, 120, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:00:26', '2022-10-12 11:07:43'),
(251, 'PI-0000019', 'PDT-000206', 1, 13, 74.77, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:00:26', '2022-10-12 11:07:43'),
(252, 'PI-0000020', 'PDT-000221', 1, 54, 16.89, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:03:29', '2022-10-12 11:07:44'),
(253, 'PI-0000020', 'PDT-000222', 1, 12, 27.88, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:03:29', '2022-10-12 11:07:44'),
(254, 'PI-0000020', 'PDT-000223', 1, 11, 27.28, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:03:29', '2022-10-12 11:07:44'),
(255, 'PI-0000020', 'PDT-000224', 1, 11, 98.09, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:03:29', '2022-10-12 11:07:44'),
(256, 'PI-0000021', 'PDT-000227', 1, 10, 55.2, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:05:51', '2022-10-12 11:07:44'),
(257, 'PI-0000021', 'PDT-000228', 1, 6, 215.6, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:05:51', '2022-10-12 11:07:44'),
(258, 'PI-0000021', 'PDT-000229', 1, 3, 940.8, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:05:51', '2022-10-12 11:07:44'),
(259, 'PI-0000022', 'PDT-000210', 1, 25, 134, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:10:09', '2022-10-12 11:07:44'),
(260, 'PI-0000023', 'PDT-000157', 1, 10, 190, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:11:48', '2022-10-12 11:07:44'),
(261, 'PI-0000024', 'PDT-000132', 1, 11, 93.84, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(262, 'PI-0000024', 'PDT-000133', 1, 65, 73.06, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(263, 'PI-0000024', 'PDT-000134', 1, 38, 211.29, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(264, 'PI-0000024', 'PDT-000135', 1, 11, 58.65, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(265, 'PI-0000024', 'PDT-000136', 1, 11, 254.15, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(266, 'PI-0000024', 'PDT-000137', 1, 7, 36.02, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(267, 'PI-0000024', 'PDT-000138', 1, 11, 206.36, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(268, 'PI-0000024', 'PDT-000139', 1, 11, 114.03, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(269, 'PI-0000024', 'PDT-000140', 1, 11, 52.91, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(270, 'PI-0000024', 'PDT-000141', 1, 360, 13.8, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(271, 'PI-0000024', 'PDT-000142', 1, 20, 17.38, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(272, 'PI-0000024', 'PDT-000143', 1, 5, 63.09, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(273, 'PI-0000024', 'PDT-000144', 1, 5, 171.52, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(274, 'PI-0000024', 'PDT-000145', 1, 100, 15.05, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(275, 'PI-0000024', 'PDT-000146', 1, 101, 8.6, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(276, 'PI-0000024', 'PDT-000147', 1, 100, 17.2, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(277, 'PI-0000024', 'PDT-000148', 1, 600, 1.95, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(278, 'PI-0000024', 'PDT-000149', 1, 200, 3.43, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(279, 'PI-0000024', 'PDT-000150', 1, 200, 3.85, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(280, 'PI-0000024', 'PDT-000151', 1, 20, 12.01, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(281, 'PI-0000024', 'PDT-000163', 1, 11, 264.55, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(282, 'PI-0000024', 'PDT-000164', 1, 110, 10.14, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(283, 'PI-0000024', 'PDT-000165', 1, 11, 599.64, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(284, 'PI-0000024', 'PDT-000166', 1, 20, 30.02, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(285, 'PI-0000024', 'PDT-000167', 1, 45, 1143.42, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(286, 'PI-0000024', 'PDT-000175', 1, 20, 4.94, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(287, 'PI-0000024', 'PDT-000176', 1, 40, 20.58, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(288, 'PI-0000024', 'PDT-000177', 1, 20, 30.11, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(289, 'PI-0000024', 'PDT-000242', 1, 1, 76.13, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(290, 'PI-0000024', 'PDT-000200', 1, 6, 73.53, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(291, 'PI-0000024', 'PDT-000201', 1, 8, 111.46, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(292, 'PI-0000024', 'PDT-000202', 1, 8, 206.36, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(293, 'PI-0000024', 'PDT-000203', 1, 40, 28.31, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(294, 'PI-0000024', 'PDT-000204', 1, 20, 72.77, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(295, 'PI-0000024', 'PDT-000225', 1, 3, 484.53, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(296, 'PI-0000024', 'PDT-000226', 1, 6, 171.52, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(297, 'PI-0000025', 'PDT-000152', 1, 50, 92.64, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:40:28', '2022-10-12 11:07:45'),
(298, 'PI-0000025', 'PDT-000207', 1, 220, 18.32, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:40:28', '2022-10-12 11:07:45'),
(299, 'PI-0000025', 'PDT-000208', 1, 20, 85.95, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:40:28', '2022-10-12 11:07:45'),
(300, 'PI-0000025', 'PDT-000238', 1, 2, 320, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 07:40:28', '2022-10-12 11:07:45'),
(301, 'PI-0000026', 'PDT-000230', 1, 2, 362.7, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 09:41:20', '2022-10-12 11:07:45'),
(302, 'PI-0000026', 'PDT-000231', 1, 2, 102.3, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 09:41:20', '2022-10-12 11:07:45'),
(303, 'PI-0000026', 'PDT-000232', 1, 2, 539.4, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 09:41:20', '2022-10-12 11:07:45'),
(304, 'PI-0000026', 'PDT-000233', 1, 2, 320.85, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 09:41:20', '2022-10-12 11:07:45'),
(305, 'PI-0000026', 'PDT-000234', 1, 5, 599.85, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 09:41:20', '2022-10-12 11:07:45'),
(306, 'PI-0000026', 'PDT-000235', 1, 11, 405.82, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 09:41:20', '2022-10-12 11:07:45'),
(307, 'PI-0000026', 'PDT-000236', 1, 2, 242.8, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 09:41:20', '2022-10-12 11:07:45'),
(308, 'PI-0000027', 'PDT-000245', 1, 3, 100, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 10:01:30', '2022-10-12 11:07:46'),
(309, 'PI-0000027', 'PDT-000246', 1, 3, 132, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 10:01:30', '2022-10-12 11:07:46'),
(310, 'PI-0000027', 'PDT-000247', 1, 40, 15, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 10:01:30', '2022-10-12 11:07:46'),
(311, 'PI-0000027', 'PDT-000249', 1, 8, 17.45, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 10:01:30', '2022-10-12 11:07:46'),
(312, 'PI-0000027', 'PDT-000248', 1, 8, 5, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 10:01:30', '2022-10-12 11:07:46'),
(313, 'PI-0000028', 'PDT-000240', 1, 11, 57.27, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 10:06:29', '2022-10-12 11:07:46'),
(314, 'PI-0000028', 'PDT-000241', 1, 5, 77.94, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 10:06:29', '2022-10-12 11:07:46'),
(315, 'PI-0000028', 'PDT-000242', 1, 5, 76.13, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 10:06:29', '2022-10-12 11:07:46'),
(316, 'PI-0000028', 'PDT-000243', 1, 5, 87.56, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 10:06:29', '2022-10-12 11:07:46'),
(317, 'PI-0000028', 'PDT-000244', 1, 5, 83.75, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 10:06:29', '2022-10-12 11:07:46'),
(318, 'PI-0000029', 'PDT-000059', 1, 17, 340, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 10:11:18', '2022-10-12 11:07:46'),
(319, 'PI-0000029', 'PDT-000064', 1, 11, 1271.33, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 10:11:18', '2022-10-12 11:07:46'),
(320, 'PI-0000029', 'PDT-000066', 1, 24, 265.91, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 10:11:18', '2022-10-12 11:07:46'),
(321, 'PI-0000030', 'PDT-000097', 1, 28, 178.57, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 10:13:38', '2022-10-12 11:07:46'),
(325, 'PI-0000031', 'PDT-000107', 1, 210, 161.87, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 10:40:09', '2022-10-12 11:07:46'),
(326, 'PI-0000031', 'PDT-000105', 1, 48, 354.68, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 10:40:09', '2022-10-12 11:07:46'),
(327, 'PI-0000031', 'PDT-000158', 1, 10, 311.15, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 10:40:09', '2022-10-12 11:07:46'),
(328, 'PI-0000032', 'PDT-000254', 1, 30, 309, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-03 11:04:26', '2022-10-12 11:07:47'),
(329, 'PI-0000033', 'PDT-000001', 15, 10, 2842, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-04 05:18:23', '2022-10-12 11:07:48'),
(330, 'PI-0000034', 'PDT-000001', 15, 10, 2842, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-04 05:19:37', '2022-10-12 11:07:48'),
(331, 'PI-0000035', 'PDT-000001', 15, 20, 2842, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-04 05:21:50', '2022-10-12 11:07:48'),
(332, 'PI-0000036', 'PDT-000009', 15, 10, 2725, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-04 07:30:35', '2022-10-12 11:07:48'),
(333, 'PI-0000037', 'PDT-000256', 1, 11, 1250, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-04 11:55:31', '2022-10-12 11:07:49'),
(334, 'PI-0000037', 'PDT-000257', 1, 8, 56, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-04 11:55:31', '2022-10-12 11:07:49'),
(336, 'PI-0000038', 'PDT-000001', 15, 2, 2842, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 05:11:01', '2022-10-12 11:07:49'),
(337, 'PI-0000038', 'PDT-000006', 15, 20, 0, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 05:11:01', '2022-10-12 11:07:49'),
(338, 'PI-0000038', 'PDT-000009', 15, 20, 2725, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 05:11:01', '2022-10-12 11:07:49'),
(339, 'PI-0000039', 'PDT-000001', 15, 2, 2842, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 05:12:11', '2022-10-12 11:07:49'),
(340, 'PI-0000040', 'PDT-000001', 15, 4, 2842, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 05:12:53', '2022-10-12 11:07:49'),
(341, 'PI-0000041', 'PDT-000014', 15, 2, 859, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 05:18:37', '2022-10-12 11:07:50'),
(342, 'PI-0000041', 'PDT-000258', 15, 20, 2589, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 05:18:37', '2022-10-12 11:07:50'),
(343, 'PI-0000042', 'PDT-000002', 15, 20, 2941, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 05:26:47', '2022-10-12 11:07:50'),
(344, 'PI-0000043', 'PDT-000009', 15, 3, 2725, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 05:50:15', '2022-10-12 11:07:50'),
(345, 'PI-0000043', 'PDT-000258', 15, 12, 2725, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 05:50:15', '2022-10-12 11:07:50'),
(346, 'PI-0000043', 'PDT-000006', 15, 10, 2502, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 05:50:15', '2022-10-12 11:07:50'),
(347, 'PI-0000044', 'PDT-000006', 15, 10, 2502, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 06:07:12', '2022-10-12 11:07:50'),
(348, 'PI-0000044', 'PDT-000003', 15, 6, 2931, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 06:07:12', '2022-10-12 11:07:50'),
(349, 'PI-0000045', 'PDT-000006', 15, 15, 2502, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 06:10:18', '2022-10-12 11:07:50'),
(350, 'PI-0000046', 'PDT-000006', 15, 120, 2502, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 06:12:23', '2022-10-12 11:07:50'),
(351, 'PI-0000046', 'PDT-000009', 15, 20, 2725, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 06:12:23', '2022-10-12 11:07:50'),
(352, 'PI-0000046', 'PDT-000258', 15, 10, 2725, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 06:12:23', '2022-10-12 11:07:50'),
(353, 'PI-0000047', 'PDT-000006', 15, 20, 2502, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 06:13:47', '2022-10-12 11:07:51'),
(354, 'PI-0000047', 'PDT-000009', 15, 25, 2725, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 06:13:47', '2022-10-12 11:07:51'),
(355, 'PI-0000048', 'PDT-000006', 15, 18, 2502, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 06:15:38', '2022-10-12 11:07:51'),
(356, 'PI-0000048', 'PDT-000258', 15, 5, 2725, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 06:15:38', '2022-10-12 11:07:51'),
(357, 'PI-0000049', 'PDT-000009', 15, 35, 2725, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 06:17:07', '2022-10-12 11:07:51'),
(358, 'PI-0000050', 'PDT-000006', 15, 42, 2502, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 06:18:08', '2022-10-12 11:07:51'),
(359, 'PI-0000051', 'PDT-000009', 15, 14, 2725, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 06:18:49', '2022-10-12 11:07:51'),
(360, 'PI-0000052', 'PDT-000001', 15, 5, 2842, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 06:20:54', '2022-10-12 11:07:51'),
(361, 'PI-0000052', 'PDT-000003', 15, 16, 2931, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 06:20:54', '2022-10-12 11:07:51'),
(362, 'PI-0000052', 'PDT-000006', 15, 40, 2502, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 06:20:54', '2022-10-12 11:07:51'),
(363, 'PI-0000053', 'PDT-000010', 1, 1000, 14, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 06:57:02', '2022-10-12 11:07:51'),
(364, 'PI-0000053', 'PDT-000003', 15, 10, 2931, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 06:57:02', '2022-10-12 11:07:51'),
(365, 'PI-0000053', 'PDT-000006', 15, 21, 2502, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 06:57:02', '2022-10-12 11:07:51'),
(366, 'PI-0000054', 'PDT-000001', 15, 10, 2842, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 06:57:56', '2022-10-12 11:07:52'),
(367, 'PI-0000055', 'PDT-000006', 15, 40, 2502, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 06:58:51', '2022-10-12 11:07:52'),
(368, 'PI-0000056', 'PDT-000010', 1, 1520, 18, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 06:59:59', '2022-10-12 11:07:52'),
(369, 'PI-0000057', 'PDT-000009', 15, 35, 2725, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:02:27', '2022-10-12 11:07:52'),
(370, 'PI-0000057', 'PDT-000001', 15, 7, 2842, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:02:27', '2022-10-12 11:07:52'),
(371, 'PI-0000057', 'PDT-000006', 15, 20, 0, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:02:27', '2022-10-12 11:07:52'),
(372, 'PI-0000057', 'PDT-000014', 15, 2, 921, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:02:27', '2022-10-12 11:07:52'),
(373, 'PI-0000057', 'PDT-000015', 15, 2, 921, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:02:27', '2022-10-12 11:07:52'),
(374, 'PI-0000058', 'PDT-000006', 15, 40, 2502, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:03:19', '2022-10-12 11:07:52'),
(375, 'PI-0000059', 'PDT-000002', 15, 10, 2941, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:04:29', '2022-10-12 11:07:52'),
(376, 'PI-0000059', 'PDT-000258', 15, 10, 2725, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:04:29', '2022-10-12 11:07:52'),
(377, 'PI-0000060', 'PDT-000001', 15, 3, 2842, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:05:42', '2022-10-12 11:07:53'),
(378, 'PI-0000060', 'PDT-000006', 15, 29, 2502, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:05:42', '2022-10-12 11:07:53'),
(379, 'PI-0000061', 'PDT-000006', 15, 40, 2502, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:08:31', '2022-10-12 11:07:53'),
(380, 'PI-0000061', 'PDT-000003', 15, 19, 2931, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:08:31', '2022-10-12 11:07:53'),
(381, 'PI-0000061', 'PDT-000012', 15, 4, 1023, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:08:31', '2022-10-12 11:07:53'),
(382, 'PI-0000062', 'PDT-000258', 15, 20, 2725, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:09:24', '2022-10-12 11:07:53'),
(383, 'PI-0000063', 'PDT-000006', 15, 20, 2502, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:10:28', '2022-10-12 11:07:53'),
(384, 'PI-0000064', 'PDT-000006', 15, 20, 2502, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:12:17', '2022-10-12 11:07:53'),
(385, 'PI-0000064', 'PDT-000258', 15, 20, 2725, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:12:17', '2022-10-12 11:07:53'),
(386, 'PI-0000064', 'PDT-000009', 15, 20, 2725, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:12:17', '2022-10-12 11:07:53'),
(387, 'PI-0000065', 'PDT-000006', 15, 40, 2573, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:13:54', '2022-10-12 11:07:54'),
(388, 'PI-0000065', 'PDT-000258', 15, 15, 2725, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:13:54', '2022-10-12 11:07:54'),
(389, 'PI-0000066', 'PDT-000009', 15, 15, 2725, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:14:38', '2022-10-12 11:07:54'),
(390, 'PI-0000067', 'PDT-000258', 15, 12, 2725, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:15:34', '2022-10-12 11:07:54'),
(391, 'PI-0000067', 'PDT-000009', 15, 16, 2725, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:15:34', '2022-10-12 11:07:54'),
(392, 'PI-0000068', 'PDT-000002', 15, 10, 2941, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:16:26', '2022-10-12 11:07:54'),
(393, 'PI-0000069', 'PDT-000001', 15, 10, 2842, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:17:08', '2022-10-12 11:07:54'),
(394, 'PI-0000070', 'PDT-000009', 15, 10, 2725, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:17:59', '2022-10-12 11:07:54'),
(395, 'PI-0000071', 'PDT-000009', 15, 20, 2725, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:19:10', '2022-10-12 11:07:54'),
(396, 'PI-0000072', 'PDT-000037', 1, 100, 8.62, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 07:26:37', '2022-10-12 11:07:55'),
(397, 'PI-0000073', 'PDT-000259', 1, 3, 250.93, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 13:04:15', '2022-10-12 11:07:55'),
(398, 'PI-0000073', 'PDT-000260', 1, 3, 129.12, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 13:04:15', '2022-10-12 11:07:55'),
(399, 'PI-0000073', 'PDT-000261', 1, 2, 310.4, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 13:04:15', '2022-10-12 11:07:55'),
(400, 'PI-0000073', 'PDT-000262', 1, 2, 77.6, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 13:04:15', '2022-10-12 11:07:55'),
(401, 'PI-0000073', 'PDT-000263', 1, 3, 335.74, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 13:04:15', '2022-10-12 11:07:55'),
(402, 'PI-0000073', 'PDT-000264', 1, 3, 38.73, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 13:04:15', '2022-10-12 11:07:55'),
(403, 'PI-0000073', 'PDT-000265', 1, 3, 172.16, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 13:04:15', '2022-10-12 11:07:55'),
(404, 'PI-0000073', 'PDT-000266', 1, 40, 9.21, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 13:04:15', '2022-10-12 11:07:55'),
(405, 'PI-0000074', 'PDT-000268', 1, 10, 7.75, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 13:06:48', '2022-10-12 11:07:55'),
(406, 'PI-0000074', 'PDT-000267', 1, 10, 21.87, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-05 13:06:48', '2022-10-12 11:07:55'),
(407, 'PI-0000075', 'PDT-000169', 1, 200, 8.39, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-08 04:40:16', '2022-10-12 11:07:55'),
(408, 'PI-0000076', 'PDT-000269', 15, 5, 1175, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-08 06:20:44', '2022-10-12 11:07:55'),
(409, 'PI-0000077', 'PDT-000270', 1, 6, 2250, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-08 06:50:35', '2022-10-12 11:07:56'),
(410, 'PI-0000078', 'PDT-000017', 1, 42, 4.04, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-08 07:12:39', '2022-10-12 11:07:56'),
(411, 'PI-0000079', 'PDT-000271', 1, 20, 17.6, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-09 04:57:48', '2022-10-12 11:07:56'),
(412, 'PI-0000080', 'PDT-000272', 1, 11, 360.01, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-09 05:12:47', '2022-10-12 11:07:56'),
(413, 'PI-0000081', 'PDT-000239', 1, 1, 485, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-09 05:18:05', '2022-10-12 11:07:56'),
(414, 'PI-0000082', 'PDT-000034', 1, 10, 73.76, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-09 05:39:26', '2022-10-12 11:07:57'),
(415, 'PI-0000083', 'PDT-000126', 1, 110, 14.55, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-09 11:38:46', '2022-10-12 11:07:57'),
(416, 'PI-0000084', 'PDT-000127', 1, 100, 15.79, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-09 11:44:17', '2022-10-12 11:07:57'),
(417, 'PI-0000085', 'PDT-000274', 1, 2, 111.11, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-09 12:11:34', '2022-10-12 11:07:57'),
(418, 'PI-0000086', 'PDT-000103', 1, 4570, 39, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-09 12:35:02', '2022-10-12 11:07:58'),
(419, 'PI-0000087', 'PDT-000079', 1, 10, 241.18, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-09 13:30:19', '2022-10-12 11:07:58'),
(420, 'PI-0000088', 'PDT-000270', 1, 6, 2250, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-09 13:49:08', '2022-10-12 11:07:58'),
(421, 'PI-0000089', 'PDT-000230', 1, 2, 362.7, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-11 05:22:49', '2022-10-12 11:07:58'),
(424, 'PI-0000091', 'PDT-000228', 1, 21, 233.33, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-18 15:08:08', '2022-10-26 09:07:23'),
(425, 'PI-0000092', 'PDT-000258', 15, 10, 2855, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-18 15:19:44', '2022-10-26 09:07:23'),
(426, 'PI-0000092', 'PDT-000009', 15, 30, 2855, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-18 15:19:44', '2022-10-26 09:07:23'),
(427, 'PI-0000092', 'PDT-000269', 15, 5, 1175, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-18 15:19:44', '2022-10-26 09:07:23'),
(428, 'PI-0000093', 'PDT-000197', 1, 5, 596.8, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-21 06:01:17', '2022-10-26 09:07:23'),
(430, 'PI-0000094', 'PDT-000270', 1, 6, 2250, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-21 14:59:41', '2022-10-26 09:07:23'),
(436, 'PI-0000095', 'PDT-000275', 1, 11, 26.45, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-22 07:43:39', '2022-10-26 09:07:23'),
(437, 'PI-0000095', 'PDT-000276', 1, 20, 129.34, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-22 07:43:39', '2022-10-26 09:07:23'),
(438, 'PI-0000095', 'PDT-000279', 1, 16, 12.89, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-22 07:43:39', '2022-10-26 09:07:23'),
(439, 'PI-0000096', 'PDT-000281', 1, 4, 295.85, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-22 07:46:07', '2022-10-26 09:07:23'),
(440, 'PI-0000096', 'PDT-000282', 1, 4, 169.75, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-22 07:46:07', '2022-10-26 09:07:23'),
(441, 'PI-0000097', 'PDT-000277', 1, 11, 103.18, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-22 07:47:51', '2022-10-26 09:07:23'),
(442, 'PI-0000098', 'PDT-000278', 1, 11, 219.91, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-22 07:49:33', '2022-10-26 09:07:23'),
(445, 'PI-0000099', 'PDT-000006', 15, 55, 2550, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-22 12:45:07', '2022-10-26 09:07:23'),
(446, 'PI-0000100', 'PDT-000006', 15, 193, 2625, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-22 12:46:27', '2022-10-26 09:07:23'),
(449, 'PI-0000102', 'PDT-000283', 1, 100, 8.91, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-22 15:55:56', '2022-10-26 09:07:23'),
(450, 'PI-0000103', 'PDT-000286', 1, 6, 12.89, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-26 07:13:01', '2022-10-26 09:07:23'),
(451, 'PI-0000103', 'PDT-000287', 1, 6, 34.44, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-26 07:13:01', '2022-10-26 09:07:23'),
(452, 'PI-0000103', 'PDT-000285', 1, 10, 43, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-26 07:13:01', '2022-10-26 09:07:23'),
(453, 'PI-0000104', 'PDT-000268', 1, 100, 7.75, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-27 11:18:37', '2022-10-27 11:18:37'),
(454, 'PI-0000105', 'PDT-000066', 1, 48, 265.89, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-27 11:22:55', '2022-10-27 11:22:55'),
(455, 'PI-0000106', 'PDT-000074', 1, 18, 1185.78, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-27 11:25:49', '2022-10-27 11:25:49'),
(456, 'PI-0000107', 'PDT-000288', 1, 4, 349.86, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-27 11:38:52', '2022-10-27 11:38:52'),
(457, 'PI-0000108', 'PDT-000289', 1, 11, 445.45, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-27 13:40:08', '2022-10-27 13:40:08'),
(458, 'PI-0000108', 'PDT-000290', 1, 11, 347.45, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-27 13:40:08', '2022-10-27 13:40:08'),
(459, 'PI-0000109', 'PDT-000103', 1, 4500, 39, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-27 14:23:32', '2022-10-27 14:23:32'),
(460, 'PI-0000110', 'PDT-000291', 1, 5, 124.2, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-28 11:04:29', '2022-10-28 11:04:29'),
(465, 'PI-0000111', 'PDT-000001', 15, 10, 3085.8, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-28 11:45:14', '2022-10-28 11:45:14'),
(466, 'PI-0000111', 'PDT-000258', 15, 40, 2785.43, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-28 11:45:14', '2022-10-28 11:45:14'),
(467, 'PI-0000111', 'PDT-000255', 15, 60, 2785.45, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-28 11:45:14', '2022-10-28 11:45:14'),
(468, 'PI-0000111', 'PDT-000292', 15, 5, 1199, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-28 11:45:14', '2022-10-28 11:45:14'),
(469, 'PI-0000112', 'PDT-000258', 15, 10, 2855, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-28 11:52:04', '2022-10-28 11:52:04'),
(470, 'PI-0000112', 'PDT-000009', 15, 30, 2855, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-28 11:52:04', '2022-10-28 11:52:04'),
(471, 'PI-0000112', 'PDT-000269', 15, 5, 1035, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-28 11:52:04', '2022-10-28 11:52:04'),
(473, 'PI-0000113', 'PDT-000006', 15, 55, 2550, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-28 11:56:52', '2022-10-28 11:56:52'),
(474, 'PI-0000114', 'PDT-000006', 15, 193, 2625, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-28 11:58:56', '2022-10-28 11:58:56'),
(475, 'PI-0000115', 'PDT-000016', 1, 800, 41, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-29 12:36:09', '2022-10-29 12:36:09'),
(476, 'PI-0000116', 'PDT-000294', 1, 3, 335.32, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-29 14:26:08', '2022-10-29 14:26:08'),
(477, 'PI-0000117', 'PDT-000193', 1, 20, 10.5, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-31 11:38:35', '2022-10-31 11:38:35'),
(478, 'PI-0000118', 'PDT-000295', 1, 1, 640, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-31 11:41:45', '2022-10-31 11:41:45'),
(479, 'PI-0000119', 'PDT-000103', 1, 4570, 39, 0, 0, NULL, NULL, '1', '1', 0, '2022-10-31 13:31:50', '2022-10-31 13:31:50'),
(480, 'PI-0000120', 'PDT-000296', 1, 20, 860, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-01 12:14:45', '2022-11-01 12:14:45'),
(481, 'PI-0000121', 'PDT-000017', 1, 168, 4.06, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-04 13:28:07', '2022-11-04 13:28:07'),
(482, 'PI-0000122', 'PDT-000297', 1, 5, 279.07, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-04 13:36:03', '2022-11-04 13:36:03'),
(483, 'PI-0000123', 'PDT-000261', 1, 11, 290.91, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-04 13:39:50', '2022-11-04 13:39:50'),
(484, 'PI-0000124', 'PDT-000001', 15, 10, 3054.9, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-04 13:46:17', '2022-11-04 13:46:17'),
(485, 'PI-0000124', 'PDT-000002', 15, 10, 3054.9, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-04 13:46:17', '2022-11-04 13:46:17'),
(486, 'PI-0000124', 'PDT-000009', 15, 30, 2757.1, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-04 13:46:17', '2022-11-04 13:46:17'),
(487, 'PI-0000125', 'PDT-000298', 1, 1, 370, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-05 14:02:17', '2022-11-05 14:02:17'),
(488, 'PI-0000126', 'PDT-000060', 1, 1, 187.09, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-05 14:05:32', '2022-11-05 14:05:32'),
(489, 'PI-0000127', 'PDT-000215', 1, 6, 63.82, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-05 14:14:11', '2022-11-05 14:14:11'),
(490, 'PI-0000128', 'PDT-000060', 1, 1, 187.09, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-05 14:15:17', '2022-11-05 14:15:17'),
(491, 'PI-0000129', 'PDT-000269', 15, 10, 1095, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-08 07:17:12', '2022-11-08 07:17:12'),
(492, 'PI-0000130', 'PDT-000232', 1, 5, 512.43, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-08 07:23:44', '2022-11-08 07:23:44'),
(493, 'PI-0000130', 'PDT-000234', 1, 10, 569.86, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-08 07:23:44', '2022-11-08 07:23:44'),
(494, 'PI-0000131', 'PDT-000034', 1, 20, 86.13, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-09 12:46:35', '2022-11-09 12:46:35'),
(495, 'PI-0000131', 'PDT-000217', 1, 5, 119.56, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-09 12:46:35', '2022-11-09 12:46:35'),
(496, 'PI-0000132', 'PDT-000299', 1, 10, 54.03, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-09 12:56:39', '2022-11-09 12:56:39'),
(497, 'PI-0000132', 'PDT-000146', 1, 220, 7.82, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-09 12:56:39', '2022-11-09 12:56:39'),
(498, 'PI-0000132', 'PDT-000300', 1, 3, 80, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-09 12:56:39', '2022-11-09 12:56:39'),
(499, 'PI-0000132', 'PDT-000301', 1, 3, 428.79, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-09 12:56:39', '2022-11-09 12:56:39'),
(500, 'PI-0000132', 'PDT-000302', 1, 3, 214.4, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-09 12:56:39', '2022-11-09 12:56:39'),
(501, 'PI-0000132', 'PDT-000303', 1, 3, 111.49, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-09 12:56:39', '2022-11-09 12:56:39'),
(502, 'PI-0000132', 'PDT-000177', 1, 50, 30.11, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-09 12:56:39', '2022-11-09 12:56:39'),
(503, 'PI-0000133', 'PDT-000258', 15, 19, 2845, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-10 12:03:43', '2022-11-10 12:03:43'),
(504, 'PI-0000133', 'PDT-000009', 15, 28, 2845, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-10 12:03:43', '2022-11-10 12:03:43'),
(505, 'PI-0000133', 'PDT-000269', 15, 19, 1095, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-10 12:03:43', '2022-11-10 12:03:43'),
(506, 'PI-0000133', 'PDT-000011', 15, 5, 900, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-10 12:03:43', '2022-11-10 12:03:43'),
(510, 'PI-0000134', 'PDT-000304', 1, 1, 430, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-12 10:59:53', '2022-11-12 10:59:53'),
(511, 'PI-0000135', 'PDT-000305', 1, 27, 181.07, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-13 07:22:42', '2022-11-13 07:22:42'),
(512, 'PI-0000135', 'PDT-000140', 1, 11, 52.91, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-13 07:22:42', '2022-11-13 07:22:42'),
(513, 'PI-0000135', 'PDT-000176', 1, 160, 18.01, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-13 07:22:42', '2022-11-13 07:22:42'),
(514, 'PI-0000135', 'PDT-000300', 1, 6, 80, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-13 07:22:42', '2022-11-13 07:22:42');
INSERT INTO `purchase_entry` (`id`, `invoice_no`, `product_id`, `sub_unit_id`, `product_quantity`, `purchase_price`, `per_unit_cost`, `discount_amount`, `pdt_expiry_date`, `entry_date`, `branch_id`, `admin_id`, `status`, `created_at`, `updated_at`) VALUES
(515, 'PI-0000135', 'PDT-000148', 1, 600, 1.95, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-13 07:22:42', '2022-11-13 07:22:42'),
(516, 'PI-0000135', 'PDT-000163', 1, 5, 291, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-13 07:22:42', '2022-11-13 07:22:42'),
(517, 'PI-0000136', 'PDT-000130', 1, 10, 81.72, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-14 12:53:26', '2022-11-14 12:53:26'),
(518, 'PI-0000137', 'PDT-000280', 1, 2, 665, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-15 12:16:47', '2022-11-15 12:16:47'),
(519, 'PI-0000138', 'PDT-000060', 1, 11, 187.09, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-15 12:26:39', '2022-11-15 12:26:39'),
(520, 'PI-0000138', 'PDT-000053', 1, 20, 168, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-15 12:26:39', '2022-11-15 12:26:39'),
(521, 'PI-0000138', 'PDT-000155', 1, 8, 703.12, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-15 12:26:39', '2022-11-15 12:26:39'),
(522, 'PI-0000139', 'PDT-000220', 1, 50, 38.41, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-15 12:29:04', '2022-11-15 12:29:04'),
(523, 'PI-0000140', 'PDT-000095', 1, 17, 570.14, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-15 12:42:13', '2022-11-15 12:42:13'),
(524, 'PI-0000140', 'PDT-000096', 1, 30, 291.67, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-15 12:42:13', '2022-11-15 12:42:13'),
(525, 'PI-0000141', 'PDT-000306', 1, 11, 187.09, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-18 12:23:01', '2022-11-18 12:23:01'),
(526, 'PI-0000142', 'PDT-000154', 1, 20, 166.1, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-20 06:22:21', '2022-11-20 06:22:21'),
(527, 'PI-0000143', 'PDT-000060', 1, 11, 187.09, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-20 06:33:07', '2022-11-20 06:33:07'),
(528, 'PI-0000144', 'PDT-000307', 1, 10, 126.29, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-22 06:06:24', '2022-11-22 06:06:24'),
(529, 'PI-0000144', 'PDT-000308', 1, 20, 29.6, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-22 06:06:24', '2022-11-22 06:06:24'),
(530, 'PI-0000144', 'PDT-000309', 1, 11, 771, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-22 06:06:24', '2022-11-22 06:06:24'),
(531, 'PI-0000144', 'PDT-000229', 1, 11, 971.09, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-22 06:06:24', '2022-11-22 06:06:24'),
(532, 'PI-0000145', 'PDT-000310', 1, 11, 1741.55, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-24 11:57:45', '2022-11-24 11:57:45'),
(533, 'PI-0000146', 'PDT-000311', 1, 10, 75.66, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-24 12:29:30', '2022-11-24 12:29:30'),
(534, 'PI-0000146', 'PDT-000312', 1, 50, 8.2, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-24 12:29:30', '2022-11-24 12:29:30'),
(535, 'PI-0000146', 'PDT-000313', 1, 20, 2.8, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-24 12:29:30', '2022-11-24 12:29:30'),
(536, 'PI-0000147', 'PDT-000314', 1, 20, 26.4, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-29 07:08:26', '2022-11-29 07:08:26'),
(537, 'PI-0000147', 'PDT-000095', 1, 17, 570.12, 0, 0, NULL, NULL, '1', '1', 0, '2022-11-29 07:08:26', '2022-11-29 07:08:26'),
(538, 'PI-0000148', 'PDT-000163', 1, 6, 291, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-07 06:33:13', '2022-12-07 06:33:13'),
(539, 'PI-0000149', 'PDT-000018', 1, 10, 171.61, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-07 06:44:30', '2022-12-07 06:44:30'),
(540, 'PI-0000149', 'PDT-000022', 1, 10, 87.52, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-07 06:44:30', '2022-12-07 06:44:30'),
(541, 'PI-0000149', 'PDT-000315', 1, 10, 249.8, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-07 06:44:30', '2022-12-07 06:44:30'),
(542, 'PI-0000150', 'PDT-000316', 1, 15, 156.4, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-07 06:51:02', '2022-12-07 06:51:02'),
(543, 'PI-0000151', 'PDT-000070', 1, 16, 852.19, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-07 06:58:56', '2022-12-07 06:58:56'),
(544, 'PI-0000151', 'PDT-000073', 1, 15, 434.53, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-07 06:58:56', '2022-12-07 06:58:56'),
(545, 'PI-0000151', 'PDT-000071', 1, 1, 855, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-07 06:58:56', '2022-12-07 06:58:56'),
(546, 'PI-0000152', 'PDT-000071', 1, 5, 855, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-07 07:01:46', '2022-12-07 07:01:46'),
(547, 'PI-0000153', 'PDT-000317', 1, 10, 73.9, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-08 12:25:14', '2022-12-08 12:25:14'),
(548, 'PI-0000154', 'PDT-000318', 1, 11, 149.9, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-08 12:33:46', '2022-12-08 12:33:46'),
(549, 'PI-0000154', 'PDT-000149', 1, 400, 3.43, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-08 12:33:46', '2022-12-08 12:33:46'),
(550, 'PI-0000154', 'PDT-000138', 1, 11, 206.36, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-08 12:33:46', '2022-12-08 12:33:46'),
(551, 'PI-0000155', 'PDT-000319', 1, 6, 699.36, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-08 12:47:10', '2022-12-08 12:47:10'),
(553, 'PI-0000156', 'PDT-000267', 1, 50, 21.77, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-08 14:07:47', '2022-12-08 14:07:47'),
(554, 'PI-0000157', 'PDT-000269', 15, 15, 1140, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-08 14:47:25', '2022-12-08 14:47:25'),
(555, 'PI-0000158', 'PDT-000320', 1, 10, 1181, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-11 13:03:33', '2022-12-11 13:03:33'),
(556, 'PI-0000159', 'PDT-000097', 1, 28, 178.57, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-13 13:25:43', '2022-12-13 13:25:43'),
(559, 'PI-0000160', 'PDT-000259', 1, 3, 257.51, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-15 11:18:05', '2022-12-15 11:18:05'),
(560, 'PI-0000160', 'PDT-000260', 1, 11, 120.46, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-15 11:18:05', '2022-12-15 11:18:05'),
(561, 'PI-0000161', 'PDT-000017', 1, 462, 3.9, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-23 11:01:25', '2022-12-23 11:01:25'),
(562, 'PI-0000161', 'PDT-000028', 1, 400, 2.59, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-23 11:01:25', '2022-12-23 11:01:25'),
(563, 'PI-0000161', 'PDT-000191', 1, 3, 292.5, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-23 11:01:25', '2022-12-23 11:01:25'),
(564, 'PI-0000161', 'PDT-000019', 1, 3, 367, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-23 11:01:25', '2022-12-23 11:01:25'),
(565, 'PI-0000162', 'PDT-000321', 1, 3, 103.14, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-23 11:11:40', '2022-12-23 11:11:40'),
(566, 'PI-0000162', 'PDT-000322', 1, 6, 31.23, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-23 11:11:40', '2022-12-23 11:11:40'),
(567, 'PI-0000163', 'PDT-000242', 1, 12, 76.13, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-23 11:18:34', '2022-12-23 11:18:34'),
(568, 'PI-0000163', 'PDT-000243', 1, 12, 87.56, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-23 11:18:34', '2022-12-23 11:18:34'),
(569, 'PI-0000163', 'PDT-000244', 1, 12, 83.75, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-23 11:18:34', '2022-12-23 11:18:34'),
(570, 'PI-0000163', 'PDT-000323', 1, 6, 86.1, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-23 11:18:34', '2022-12-23 11:18:34'),
(571, 'PI-0000164', 'PDT-000324', 1, 11, 40, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-23 11:22:27', '2022-12-23 11:22:27'),
(572, 'PI-0000165', 'PDT-000325', 1, 3, 485, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-23 11:46:34', '2022-12-23 11:46:34'),
(573, 'PI-0000165', 'PDT-000326', 1, 1, 200, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-23 11:46:34', '2022-12-23 11:46:34'),
(574, 'PI-0000165', 'PDT-000131', 1, 3, 111.35, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-23 11:46:34', '2022-12-23 11:46:34'),
(575, 'PI-0000166', 'PDT-000061', 1, 20, 72.32, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-28 06:31:58', '2022-12-28 06:31:58'),
(576, 'PI-0000166', 'PDT-000065', 1, 23, 66.82, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-28 06:31:58', '2022-12-28 06:31:58'),
(577, 'PI-0000166', 'PDT-000050', 1, 11, 81.96, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-28 06:31:58', '2022-12-28 06:31:58'),
(578, 'PI-0000167', 'PDT-000253', 1, 16, 272.81, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-30 11:47:58', '2022-12-30 11:47:58'),
(579, 'PI-0000167', 'PDT-000124', 1, 12, 312.5, 0, 0, NULL, NULL, '1', '1', 0, '2022-12-30 11:47:58', '2022-12-30 11:47:58'),
(580, 'PI-0000168', 'PDT-000072', 1, 8, 630, 0, 0, NULL, NULL, '1', '1', 0, '2023-01-01 07:02:34', '2023-01-01 07:02:34'),
(581, 'PI-0000168', 'PDT-000327', 1, 6, 306, 0, 0, NULL, NULL, '1', '1', 0, '2023-01-01 07:02:34', '2023-01-01 07:02:34'),
(582, 'PI-0000168', 'PDT-000328', 1, 10, 103.5, 0, 0, NULL, NULL, '1', '1', 0, '2023-01-01 07:02:34', '2023-01-01 07:02:34'),
(583, 'PI-0000168', 'PDT-000329', 1, 24, 21, 0, 0, NULL, NULL, '1', '1', 0, '2023-01-01 07:02:34', '2023-01-01 07:02:34'),
(584, 'PI-0000169', 'PDT-000132', 1, 11, 93.84, 0, 0, NULL, NULL, '1', '1', 0, '2023-01-01 11:00:32', '2023-01-01 11:00:32'),
(585, 'PI-0000169', 'PDT-000279', 1, 20, 13.72, 0, 0, NULL, NULL, '1', '1', 0, '2023-01-01 11:00:32', '2023-01-01 11:00:32'),
(586, 'PI-0000169', 'PDT-000164', 1, 110, 10.14, 0, 0, NULL, NULL, '1', '1', 0, '2023-01-01 11:00:32', '2023-01-01 11:00:32'),
(587, 'PI-0000169', 'PDT-000163', 1, 33, 264.55, 0, 0, NULL, NULL, '1', '1', 0, '2023-01-01 11:00:32', '2023-01-01 11:00:32'),
(588, 'PI-0000169', 'PDT-000241', 1, 10, 77.94, 0, 0, NULL, NULL, '1', '1', 0, '2023-01-01 11:00:32', '2023-01-01 11:00:32'),
(589, 'PI-0000170', 'PDT-000330', 1, 6, 386, 0, 0, NULL, NULL, '1', '1', 0, '2023-01-01 13:10:26', '2023-01-01 13:10:26'),
(590, 'PI-0000171', 'PDT-000331', 1, 9, 95.11, 0, 0, NULL, NULL, '1', '1', 0, '2023-01-01 14:20:11', '2023-01-01 14:20:11'),
(591, 'PI-0000171', 'PDT-000332', 1, 9, 462.22, 0, 0, NULL, NULL, '1', '1', 0, '2023-01-01 14:20:11', '2023-01-01 14:20:11'),
(592, 'PI-0000171', 'PDT-000333', 1, 9, 822.22, 0, 0, NULL, NULL, '1', '1', 0, '2023-01-01 14:20:11', '2023-01-01 14:20:11'),
(593, 'PI-0000171', 'PDT-000334', 1, 9, 351.11, 0, 0, NULL, NULL, '1', '1', 0, '2023-01-01 14:20:11', '2023-01-01 14:20:11'),
(594, 'PI-0000171', 'PDT-000335', 1, 9, 1573, 0, 0, NULL, NULL, '1', '1', 0, '2023-01-01 14:20:11', '2023-01-01 14:20:11'),
(595, 'PI-0000171', 'PDT-000336', 1, 9, 222.22, 0, 0, NULL, NULL, '1', '1', 0, '2023-01-01 14:20:11', '2023-01-01 14:20:11'),
(596, 'PI-0000171', 'PDT-000337', 1, 9, 176, 0, 0, NULL, NULL, '1', '1', 0, '2023-01-01 14:20:11', '2023-01-01 14:20:11'),
(597, 'PI-0000171', 'PDT-000338', 1, 12, 1272.17, 0, 0, NULL, NULL, '1', '1', 0, '2023-01-01 14:20:11', '2023-01-01 14:20:11'),
(598, 'PI-0000171', 'PDT-000066', 1, 24, 271.81, 0, 0, NULL, NULL, '1', '1', 0, '2023-01-01 14:20:11', '2023-01-01 14:20:11'),
(599, 'PI-0000171', 'PDT-000061', 1, 50, 72.82, 0, 0, NULL, NULL, '1', '1', 0, '2023-01-01 14:20:11', '2023-01-01 14:20:11'),
(600, 'PI-0000171', 'PDT-000156', 1, 8, 728, 0, 0, NULL, NULL, '1', '1', 0, '2023-01-01 14:20:11', '2023-01-01 14:20:11'),
(601, 'PI-0000171', 'PDT-000043', 1, 9, 124.44, 0, 0, NULL, NULL, '1', '1', 0, '2023-01-01 14:20:11', '2023-01-01 14:20:11');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_ledger`
--

CREATE TABLE `purchase_ledger` (
  `id` int(10) NOT NULL,
  `invoice_no` varchar(15) NOT NULL,
  `invoice_date` varchar(30) DEFAULT NULL,
  `voucher_no` varchar(191) DEFAULT NULL,
  `voucher_date` varchar(20) DEFAULT NULL,
  `suplier_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total` double(11,2) NOT NULL DEFAULT 0.00,
  `paid` double(11,2) DEFAULT 0.00,
  `discount` double(11,2) DEFAULT 0.00,
  `transaction_type` varchar(50) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `entry_date` varchar(20) DEFAULT NULL,
  `admin_id` varchar(15) DEFAULT NULL,
  `branch_id` varchar(15) DEFAULT NULL,
  `status` int(2) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_ledger`
--

INSERT INTO `purchase_ledger` (`id`, `invoice_no`, `invoice_date`, `voucher_no`, `voucher_date`, `suplier_id`, `total`, `paid`, `discount`, `transaction_type`, `comment`, `entry_date`, `admin_id`, `branch_id`, `status`, `created_at`, `updated_at`) VALUES
(42, 'PI-0000001', '2022-07-08', NULL, '2022-07-08', 'S-00002', 35741.25, 35741.25, 0.00, 'Cash', NULL, '2022-10-01', '1', '1', 0, '2022-10-01 11:31:13', '2022-10-24 05:43:27'),
(44, 'PI-0000002', '2022-08-07', NULL, '2022-08-07', 'S-00002', 32401.63, 32401.63, 0.00, 'Cash', NULL, '2022-10-02', '1', '1', 0, '2022-10-01 19:18:35', '2022-10-24 05:43:27'),
(45, 'PI-0000003', '2022-09-21', NULL, '2022-09-21', 'S-00002', 458.50, 458.85, 0.00, 'Cash', NULL, '2022-10-02', '1', '1', 0, '2022-10-01 19:25:18', '2022-10-24 05:43:27'),
(46, 'PI-0000004', '2022-08-07', NULL, '2022-08-07', 'S-00004', 129266.52, 0.00, 0.00, 'Cash', NULL, '2022-10-02', '1', '1', 0, '2022-10-02 04:56:01', '2022-10-24 05:43:27'),
(47, 'PI-0000005', '2022-08-16', NULL, '2022-08-16', 'S-00003', 51807.44, 51807.44, 0.00, 'Cash', NULL, '2022-10-02', '1', '1', 0, '2022-10-02 05:15:03', '2022-10-24 05:43:27'),
(48, 'PI-0000006', '2022-08-17', NULL, '2022-08-17', 'S-00003', 10965.42, 10965.42, 0.00, 'Cash', NULL, '2022-10-02', '1', '1', 0, '2022-10-02 05:30:01', '2022-10-24 05:43:27'),
(49, 'PI-0000007', '2022-10-02', NULL, '2022-10-02', 'S-00005', 15331.85, 15331.85, 0.00, 'Cash', NULL, '2022-10-02', '1', '1', 0, '2022-10-02 15:07:46', '2022-10-24 05:43:27'),
(50, 'PI-0000008', '2022-08-15', NULL, '2022-08-15', 'S-00007', 78152.38, 78152.38, 0.00, 'Cash', NULL, '2022-10-02', '1', '1', 0, '2022-10-02 15:35:56', '2022-10-24 05:43:27'),
(51, 'PI-0000009', '2022-08-14', NULL, '2022-08-14', 'S-00008', 19601.03, 19601.03, 0.00, 'Cash', NULL, '2022-10-02', '1', '1', 0, '2022-10-02 15:46:27', '2022-10-24 05:43:27'),
(52, 'PI-0000010', '2022-08-12', NULL, '2022-08-12', 'S-00009', 53877.27, 53877.27, 0.00, 'Cash', NULL, '2022-10-02', '1', '1', 0, '2022-10-02 16:02:54', '2022-10-24 05:43:27'),
(53, 'PI-0000011', '2022-09-05', NULL, '2022-09-05', 'S-00009', 3300.00, 3300.00, 0.00, 'Cash', NULL, '2022-10-02', '1', '1', 0, '2022-10-02 16:05:07', '2022-10-24 05:43:27'),
(54, 'PI-0000012', '2022-10-03', NULL, '2022-10-03', 'S-00010', 159154.55, 7000.00, 0.00, 'Cash', NULL, '2022-10-03', '1', '1', 0, '2022-10-03 06:14:04', '2022-10-24 05:43:27'),
(55, 'PI-0000013', '2022-08-08', NULL, '2022-08-08', 'S-00011', 18427.55, 0.00, 0.00, 'Cash', NULL, '2022-10-03', '1', '1', 0, '2022-10-03 06:17:01', '2022-10-24 05:43:27'),
(56, 'PI-0000014', '2022-09-07', NULL, '2022-09-07', 'S-00015', 8013.86, 8013.86, 0.00, 'Cash', NULL, '2022-10-03', '1', '1', 0, '2022-10-03 06:25:43', '2022-10-24 05:43:27'),
(57, 'PI-0000015', '2022-10-03', NULL, '2022-10-03', 'S-00010', 4620.72, 4620.72, 0.00, 'Cash', NULL, '2022-10-03', '1', '1', 0, '2022-10-03 06:37:35', '2022-10-24 05:43:27'),
(58, 'PI-0000016', '2022-10-03', NULL, '2022-10-03', 'S-00013', 12745.97, 12745.95, 0.00, 'Cash', NULL, '2022-10-03', '1', '1', 0, '2022-10-03 06:41:23', '2022-10-24 05:43:27'),
(59, 'PI-0000017', '2022-10-03', NULL, '2022-10-03', 'S-00016', 10713.06, 10713.06, 0.00, 'Cash', NULL, '2022-10-03', '1', '1', 0, '2022-10-03 06:55:22', '2022-10-24 05:43:27'),
(60, 'PI-0000018', '2022-09-07', NULL, '2022-09-07', 'S-00014', 1782.10, 1782.10, 0.00, 'Cash', NULL, '2022-10-03', '1', '1', 0, '2022-10-03 06:58:09', '2022-10-24 05:43:27'),
(61, 'PI-0000019', '2022-09-18', NULL, '2022-09-18', 'S-00017', 2532.01, 2532.01, 0.00, 'Cash', NULL, '2022-10-03', '1', '1', 0, '2022-10-03 07:00:26', '2022-10-24 05:43:27'),
(62, 'PI-0000020', '2022-09-22', NULL, '2022-09-22', 'S-00020', 2625.69, 2625.69, 0.00, 'Cash', NULL, '2022-10-03', '1', '1', 0, '2022-10-03 07:03:29', '2022-10-24 05:43:27'),
(63, 'PI-0000021', '2022-10-03', NULL, '2022-10-03', 'S-00021', 4668.00, 4668.00, 0.00, 'Cash', NULL, '2022-10-03', '1', '1', 0, '2022-10-03 07:05:51', '2022-10-24 05:43:27'),
(64, 'PI-0000022', '2022-10-03', NULL, '2022-10-03', 'S-00019', 3350.00, 3350.00, 0.00, 'Cash', NULL, '2022-10-03', '1', '1', 0, '2022-10-03 07:10:09', '2022-10-24 05:43:27'),
(65, 'PI-0000023', '2022-08-21', NULL, '2022-08-21', 'S-00012', 1900.00, 1900.00, 0.00, 'Cash', NULL, '2022-10-03', '1', '1', 0, '2022-10-03 07:11:48', '2022-10-24 05:43:27'),
(66, 'PI-0000024', '2022-08-16', NULL, '2022-08-16', 'S-00001', 107388.22, 107388.22, 0.00, 'Cash', NULL, '2022-10-03', '1', '1', 0, '2022-10-03 07:31:31', '2022-10-24 05:43:27'),
(67, 'PI-0000025', '2022-08-16', NULL, '2022-08-16', 'S-00006', 11021.40, 0.00, 0.00, 'Cash', NULL, '2022-10-03', '1', '1', 0, '2022-10-03 07:40:28', '2022-10-24 05:43:27'),
(68, 'PI-0000026', '2022-09-22', NULL, '2022-09-22', 'S-00022', 10599.37, 10599.37, 0.00, 'Cash', NULL, '2022-10-03', '1', '1', 0, '2022-10-03 09:41:20', '2022-10-24 05:43:27'),
(69, 'PI-0000027', '2022-09-22', NULL, '2022-09-22', 'S-00016', 1475.60, 1475.60, 0.00, 'Cash', NULL, '2022-10-03', '1', '1', 0, '2022-10-03 10:01:30', '2022-10-24 05:43:27'),
(70, 'PI-0000028', '2022-09-27', NULL, '2022-09-27', 'S-00001', 2256.87, 2256.87, 0.00, 'Cash', NULL, '2022-10-03', '1', '1', 0, '2022-10-03 10:06:29', '2022-10-24 05:43:27'),
(71, 'PI-0000029', '2022-09-29', NULL, '2022-09-29', 'S-00010', 26146.47, 26146.47, 0.00, 'Cash', NULL, '2022-10-03', '1', '1', 0, '2022-10-03 10:11:18', '2022-10-24 05:43:27'),
(72, 'PI-0000030', '2022-09-29', NULL, '2022-09-29', 'S-00003', 4999.96, 5000.00, 0.00, 'Cash', NULL, '2022-10-03', '1', '1', 0, '2022-10-03 10:13:38', '2022-10-24 05:43:27'),
(74, 'PI-0000031', '2022-09-26', NULL, '2022-09-26', 'S-00007', 54128.84, 54128.84, 0.00, 'Cash', NULL, '2022-10-03', '1', '1', 0, '2022-10-03 10:40:09', '2022-10-24 05:43:27'),
(75, 'PI-0000032', '2022-09-29', NULL, '2022-09-29', 'S-00024', 9270.00, 9270.00, 0.00, 'Cash', NULL, '2022-10-03', '1', '1', 0, '2022-10-03 11:04:26', '2022-10-24 05:43:27'),
(76, 'PI-0000033', '2022-05-29', NULL, '2022-05-29', 'S-00025', 28420.00, 30120.00, 0.00, 'Bank', NULL, '2022-10-04', '1', '1', 0, '2022-10-04 05:18:23', '2022-10-24 05:43:27'),
(77, 'PI-0000034', '2022-06-01', NULL, '2022-06-01', 'S-00025', 28420.00, 30120.00, 0.00, 'Bank', NULL, '2022-10-04', '1', '1', 0, '2022-10-04 05:19:37', '2022-10-24 05:43:27'),
(78, 'PI-0000035', '2022-06-02', NULL, '2022-06-02', 'S-00025', 56840.00, 0.00, 0.00, 'Cash', NULL, '2022-10-04', '1', '1', 0, '2022-10-04 05:21:50', '2022-10-24 05:43:27'),
(79, 'PI-0000036', '2022-06-02', NULL, '2022-06-02', 'S-00025', 27250.00, 87830.00, 0.00, 'Cash', NULL, '2022-10-04', '1', '1', 0, '2022-10-04 07:30:35', '2022-10-24 05:43:27'),
(80, 'PI-0000037', '2022-10-04', NULL, '2022-10-04', 'S-00003', 14198.00, 14198.00, 0.00, 'Cash', NULL, '2022-10-04', '1', '1', 0, '2022-10-04 11:55:31', '2022-10-24 05:43:27'),
(82, 'PI-0000038', '2022-06-08', NULL, '2022-06-08', 'S-00025', 60184.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 05:11:01', '2022-10-24 05:43:27'),
(83, 'PI-0000039', '2022-06-10', NULL, '2022-06-10', 'S-00025', 5684.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 05:12:11', '2022-10-24 05:43:27'),
(84, 'PI-0000040', '2022-06-12', NULL, '2022-06-12', 'S-00025', 11368.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 05:12:53', '2022-10-24 05:43:27'),
(85, 'PI-0000041', '2022-06-13', NULL, '2022-06-13', 'S-00025', 53498.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 05:18:37', '2022-10-24 05:43:27'),
(86, 'PI-0000042', '2022-06-16', NULL, '2022-06-16', 'S-00025', 58820.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 05:26:48', '2022-10-24 05:43:27'),
(87, 'PI-0000043', '2022-06-21', NULL, '2022-06-21', 'S-00025', 65895.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 05:50:15', '2022-10-24 05:43:27'),
(88, 'PI-0000044', '2022-06-26', NULL, '2022-06-26', 'S-00025', 42606.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 06:07:12', '2022-10-24 05:43:27'),
(89, 'PI-0000045', '2022-07-02', NULL, '2022-07-02', 'S-00025', 37530.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 06:10:18', '2022-10-24 05:43:27'),
(90, 'PI-0000046', '2022-07-04', NULL, '2022-07-04', 'S-00025', 381990.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 06:12:23', '2022-10-24 05:43:27'),
(91, 'PI-0000047', '2022-07-07', NULL, '2022-07-07', 'S-00025', 118165.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 06:13:47', '2022-10-24 05:43:27'),
(92, 'PI-0000048', '2022-07-16', NULL, '2022-07-16', 'S-00025', 58661.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 06:15:38', '2022-10-24 05:43:27'),
(93, 'PI-0000049', '2022-07-16', NULL, '2022-07-16', 'S-00025', 95375.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 06:17:07', '2022-10-24 05:43:27'),
(94, 'PI-0000050', '2022-07-20', NULL, '2022-07-20', 'S-00025', 105084.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 06:18:08', '2022-10-24 05:43:27'),
(95, 'PI-0000051', '2022-07-22', NULL, '2022-07-22', 'S-00025', 38150.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 06:18:49', '2022-10-24 05:43:27'),
(96, 'PI-0000052', '2022-07-25', NULL, '2022-07-25', 'S-00025', 161186.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 06:20:54', '2022-10-24 05:43:27'),
(97, 'PI-0000053', '2022-07-28', NULL, '2022-07-28', 'S-00025', 95852.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 06:57:02', '2022-10-24 05:43:27'),
(98, 'PI-0000054', '2022-07-31', NULL, '2022-07-31', 'S-00025', 28420.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 06:57:56', '2022-10-24 05:43:27'),
(99, 'PI-0000055', '2022-08-01', NULL, '2022-08-01', 'S-00025', 100080.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 06:58:51', '2022-10-24 05:43:27'),
(100, 'PI-0000056', '2022-08-04', NULL, '2022-08-04', 'S-00025', 27360.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 06:59:59', '2022-10-24 05:43:27'),
(101, 'PI-0000057', '2022-08-04', NULL, '2022-08-04', 'S-00025', 118953.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 07:02:27', '2022-10-24 05:43:27'),
(102, 'PI-0000058', '2022-08-07', NULL, '2022-08-07', 'S-00025', 100080.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 07:03:19', '2022-10-24 05:43:27'),
(103, 'PI-0000059', '2022-08-11', NULL, '2022-08-11', 'S-00025', 56660.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 07:04:29', '2022-10-24 05:43:27'),
(104, 'PI-0000060', '2022-08-13', NULL, '2022-08-13', 'S-00025', 81084.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 07:05:42', '2022-10-24 05:43:27'),
(105, 'PI-0000061', '2022-08-18', NULL, '2022-08-18', 'S-00025', 159861.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 07:08:31', '2022-10-24 05:43:27'),
(106, 'PI-0000062', '2022-08-20', NULL, '2022-08-20', 'S-00025', 54500.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 07:09:24', '2022-10-24 05:43:27'),
(107, 'PI-0000063', '2022-08-25', NULL, '2022-08-25', 'S-00025', 50040.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 07:10:28', '2022-10-24 05:43:27'),
(108, 'PI-0000064', '2022-08-28', NULL, '2022-08-28', 'S-00025', 159040.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 07:12:17', '2022-10-24 05:43:27'),
(109, 'PI-0000065', '2022-09-08', NULL, '2022-09-08', 'S-00025', 143795.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 07:13:54', '2022-10-24 05:43:27'),
(110, 'PI-0000066', '2022-09-11', NULL, '2022-09-11', 'S-00025', 40875.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 07:14:38', '2022-10-24 05:43:27'),
(111, 'PI-0000067', '2022-09-14', NULL, '2022-09-14', 'S-00025', 76300.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 07:15:34', '2022-10-24 05:43:27'),
(112, 'PI-0000068', '2022-09-20', NULL, '2022-09-20', 'S-00025', 29410.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 07:16:26', '2022-10-24 05:43:27'),
(113, 'PI-0000069', '2022-09-22', NULL, '2022-09-22', 'S-00025', 28420.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 07:17:08', '2022-10-24 05:43:27'),
(114, 'PI-0000070', '2022-10-02', NULL, '2022-10-02', 'S-00025', 27250.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 07:17:59', '2022-10-24 05:43:27'),
(115, 'PI-0000071', '2022-10-04', NULL, '2022-10-04', 'S-00025', 54500.00, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 07:19:10', '2022-10-24 05:43:27'),
(116, 'PI-0000072', '2022-10-05', NULL, '2022-10-05', 'S-00002', 862.00, 862.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 07:26:37', '2022-10-24 05:43:27'),
(117, 'PI-0000073', '2022-10-05', NULL, '2022-10-05', 'S-00014', 3924.44, 0.00, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 13:04:15', '2022-10-24 05:43:27'),
(118, 'PI-0000074', '2022-10-05', NULL, '2022-10-05', 'S-00021', 296.20, 296.20, 0.00, 'Cash', NULL, '2022-10-05', '1', '1', 0, '2022-10-05 13:06:48', '2022-10-24 05:43:27'),
(119, 'PI-0000075', '2022-10-08', NULL, '2022-10-08', 'S-00001', 1678.00, 0.00, 0.00, 'Cash', NULL, '2022-10-08', '1', '1', 0, '2022-10-08 04:40:16', '2022-10-24 05:43:27'),
(120, 'PI-0000076', '2022-10-04', NULL, '2022-10-04', 'S-00026', 5875.00, 5875.00, 0.00, 'Cash', NULL, '2022-10-08', '1', '1', 0, '2022-10-08 06:20:44', '2022-10-24 05:43:27'),
(121, 'PI-0000077', '2022-10-08', NULL, '2022-10-08', 'S-00019', 13500.00, 13500.00, 0.00, 'Cash', NULL, '2022-10-08', '1', '1', 0, '2022-10-08 06:50:35', '2022-10-24 05:43:27'),
(122, 'PI-0000078', '2022-08-07', NULL, '2022-08-07', 'S-00002', 169.68, 169.68, 0.00, 'Cash', NULL, '2022-10-08', '1', '1', 0, '2022-10-08 07:12:39', '2022-10-24 05:43:27'),
(123, 'PI-0000079', '2022-09-07', NULL, '2022-09-07', 'S-00001', 352.00, 352.00, 0.00, 'Cash', NULL, '2022-10-09', '1', '1', 0, '2022-10-09 04:57:48', '2022-10-24 05:43:27'),
(124, 'PI-0000080', '2022-09-07', NULL, '2022-09-07', 'S-00002', 3960.11, 3960.11, 0.00, 'Cash', NULL, '2022-10-09', '1', '1', 0, '2022-10-09 05:12:47', '2022-10-24 05:43:27'),
(125, 'PI-0000081', '2022-10-09', NULL, '2022-10-09', 'S-00009', 485.00, 485.00, 0.00, 'Cash', NULL, '2022-10-09', '1', '1', 0, '2022-10-09 05:18:05', '2022-10-24 05:43:27'),
(126, 'PI-0000082', '2022-09-09', NULL, '2022-09-09', 'S-00002', 737.60, 0.00, 0.00, 'Cash', NULL, '2022-10-09', '1', '1', 0, '2022-10-09 05:39:26', '2022-10-24 05:43:27'),
(127, 'PI-0000083', '2022-10-09', NULL, '2022-10-09', 'S-00003', 1600.50, 1600.50, 0.00, 'Cash', NULL, '2022-10-09', '1', '1', 0, '2022-10-09 11:38:47', '2022-10-24 05:43:27'),
(128, 'PI-0000084', '2022-10-09', NULL, '2022-10-09', 'S-00002', 1579.00, 1579.00, 0.00, 'Cash', NULL, '2022-10-09', '1', '1', 0, '2022-10-09 11:44:17', '2022-10-24 05:43:27'),
(129, 'PI-0000085', '2022-10-09', NULL, '2022-10-09', 'S-00001', 222.22, 222.22, 0.00, 'Cash', NULL, '2022-10-09', '1', '1', 0, '2022-10-09 12:11:34', '2022-10-24 05:43:27'),
(130, 'PI-0000086', '2022-10-09', NULL, '2022-10-09', 'S-00027', 178230.00, 178230.00, 0.00, 'Cash', NULL, '2022-10-09', '1', '1', 0, '2022-10-09 12:35:02', '2022-10-24 05:43:27'),
(131, 'PI-0000087', '2022-08-25', NULL, '2022-08-25', 'S-00009', 2411.80, 2411.80, 0.00, 'Cash', NULL, '2022-10-09', '1', '1', 0, '2022-10-09 13:30:19', '2022-10-24 05:43:27'),
(132, 'PI-0000088', '2022-10-09', NULL, '2022-10-09', 'S-00019', 13500.00, 0.00, 0.00, 'Cash', NULL, '2022-10-09', '1', '1', 0, '2022-10-09 13:49:08', '2022-10-24 05:43:27'),
(133, 'PI-0000089', '2022-09-22', NULL, '2022-09-22', 'S-00022', 725.40, 725.40, 0.00, 'Cash', NULL, '2022-10-11', '1', '1', 0, '2022-10-11 05:22:49', '2022-10-24 05:43:27'),
(136, 'PI-0000091', '2022-10-18', NULL, '2022-10-18', 'S-00021', 4899.93, 4900.00, 0.00, 'Cash', NULL, '2022-10-18', '1', '1', 0, '2022-10-18 15:08:08', '2022-10-26 09:05:41'),
(137, 'PI-0000092', '2022-10-18', NULL, '2022-10-18', 'S-00026', 120075.00, 120075.00, 0.00, 'Cash', NULL, '2022-10-18', '1', '1', 0, '2022-10-18 15:19:44', '2022-10-26 09:06:35'),
(138, 'PI-0000093', '2022-10-21', NULL, '2022-10-21', 'S-00009', 2984.00, 2984.00, 0.00, 'Cash', NULL, '2022-10-21', '1', '1', 0, '2022-10-21 06:01:17', '2022-10-26 09:06:35'),
(140, 'PI-0000094', '2022-10-08', NULL, '2022-10-08', 'S-00019', 13500.00, 13500.00, 0.00, 'Cash', NULL, '2022-10-21', '1', '1', 0, '2022-10-21 14:59:41', '2022-10-26 09:06:35'),
(143, 'PI-0000095', '2022-10-22', NULL, '2022-10-22', 'S-00001', 3083.99, 3083.99, 0.00, 'Cash', NULL, '2022-10-22', '1', '1', 0, '2022-10-22 07:43:39', '2022-10-26 09:06:35'),
(144, 'PI-0000096', '2022-10-18', NULL, '2022-10-18', 'S-00001', 1862.40, 1862.40, 0.00, 'Cash', NULL, '2022-10-22', '1', '1', 0, '2022-10-22 07:46:07', '2022-10-26 09:06:35'),
(145, 'PI-0000097', '2022-10-11', NULL, '2022-10-11', 'S-00005', 1134.98, 1134.98, 0.00, 'Cash', NULL, '2022-10-22', '1', '1', 0, '2022-10-22 07:47:51', '2022-10-26 09:06:35'),
(146, 'PI-0000098', '2022-10-12', NULL, '2022-10-12', 'S-00020', 2419.01, 2419.01, 0.00, 'Cash', NULL, '2022-10-22', '1', '1', 0, '2022-10-22 07:49:33', '2022-10-26 09:06:35'),
(149, 'PI-0000099', '2022-09-01', NULL, '2022-09-01', 'S-00008', 140250.00, 140250.00, 0.00, 'Cash', NULL, '2022-10-22', '1', '1', 0, '2022-10-22 12:45:07', '2022-10-26 09:06:35'),
(150, 'PI-0000100', '2022-09-12', NULL, '2022-09-12', 'S-00008', 506625.00, 506625.00, 0.00, 'Cash', NULL, '2022-10-22', '1', '1', 0, '2022-10-22 12:46:28', '2022-10-26 09:06:35'),
(153, 'PI-0000102', '2022-10-22', NULL, '2022-10-22', 'S-00002', 891.00, 891.00, 0.00, 'Cash', NULL, '2022-10-22', '1', '1', 0, '2022-10-22 15:55:56', '2022-10-26 09:06:35'),
(154, 'PI-0000103', '2022-10-26', NULL, '2022-10-26', 'S-00001', 713.98, 713.98, 0.00, 'Cash', NULL, '2022-10-26', '1', '1', 0, '2022-10-26 07:13:01', '2022-10-26 09:06:35'),
(155, 'PI-0000104', '2022-10-27', NULL, '2022-10-27', 'S-00021', 775.00, 775.00, 0.00, 'Cash', NULL, '2022-10-27', '1', '1', 0, '2022-10-27 11:18:37', '2022-10-27 11:18:37'),
(156, 'PI-0000105', '2022-10-27', NULL, '2022-10-27', 'S-00010', 12762.72, 0.00, 0.00, 'Cash', NULL, '2022-10-27', '1', '1', 0, '2022-10-27 11:22:55', '2022-10-27 11:22:55'),
(157, 'PI-0000106', '2022-10-27', NULL, '2022-10-27', 'S-00011', 21344.04, 0.00, 0.00, 'Cash', NULL, '2022-10-27', '1', '1', 0, '2022-10-27 11:25:49', '2022-10-27 11:25:49'),
(158, 'PI-0000107', '2022-10-27', NULL, '2022-10-27', 'S-00021', 1399.44, 1399.44, 0.00, 'Cash', NULL, '2022-10-27', '1', '1', 0, '2022-10-27 11:38:52', '2022-10-27 11:38:52'),
(159, 'PI-0000108', '2022-10-23', NULL, '2022-10-23', 'S-00028', 8721.90, 5500.00, 0.00, 'Cash', NULL, '2022-10-27', '1', '1', 0, '2022-10-27 13:40:08', '2022-10-27 13:40:08'),
(160, 'PI-0000109', '2022-10-12', NULL, '2022-10-12', 'S-00027', 175500.00, 175500.00, 0.00, 'Cash', NULL, '2022-10-27', '1', '1', 0, '2022-10-27 14:23:32', '2022-10-27 14:23:32'),
(161, 'PI-0000110', '2022-10-28', NULL, '2022-10-28', 'S-00005', 621.00, 621.00, 0.00, 'Cash', NULL, '2022-10-28', '1', '1', 0, '2022-10-28 11:04:29', '2022-10-28 11:04:29'),
(163, 'PI-0000111', '2022-10-16', NULL, '2022-10-16', 'S-00029', 315397.20, 315800.00, 0.00, 'Cash', NULL, '2022-10-28', '1', '1', 0, '2022-10-28 11:45:14', '2022-10-28 11:45:14'),
(164, 'PI-0000112', '2022-10-07', NULL, '2022-10-07', 'S-00026', 119375.00, 119375.00, 0.00, 'Cash', NULL, '2022-10-28', '1', '1', 0, '2022-10-28 11:52:04', '2022-10-28 11:52:04'),
(166, 'PI-0000113', '2022-09-01', NULL, '2022-09-01', 'S-00008', 140250.00, 140250.00, 0.00, 'Cash', NULL, '2022-10-28', '1', '1', 0, '2022-10-28 11:56:52', '2022-10-28 11:56:52'),
(167, 'PI-0000114', '2022-09-12', NULL, '2022-09-12', 'S-00008', 506625.00, 506625.00, 0.00, 'Cash', NULL, '2022-10-28', '1', '1', 0, '2022-10-28 11:58:56', '2022-10-28 11:58:56'),
(168, 'PI-0000115', '2022-10-29', NULL, '2022-10-29', 'S-00025', 32800.00, 32800.00, 0.00, 'Cash', NULL, '2022-10-29', '1', '1', 0, '2022-10-29 12:36:09', '2022-10-29 12:36:09'),
(169, 'PI-0000116', '2022-10-29', NULL, '2022-10-29', 'S-00002', 1005.96, 1005.96, 0.00, 'Cash', NULL, '2022-10-29', '1', '1', 0, '2022-10-29 14:26:08', '2022-10-29 14:26:08'),
(170, 'PI-0000117', '2022-10-31', NULL, '2022-10-31', 'S-00015', 210.00, 210.00, 0.00, 'Cash', NULL, '2022-10-31', '1', '1', 0, '2022-10-31 11:38:35', '2022-10-31 11:38:35'),
(171, 'PI-0000118', '2022-10-31', NULL, '2022-10-31', 'S-00015', 640.00, 640.00, 0.00, 'Cash', NULL, '2022-10-31', '1', '1', 0, '2022-10-31 11:41:45', '2022-10-31 11:41:45'),
(172, 'PI-0000119', '2022-10-31', NULL, '2022-10-31', 'S-00027', 178230.00, 178230.00, 0.00, 'Cash', NULL, '2022-10-31', '1', '1', 0, '2022-10-31 13:31:50', '2022-10-31 13:31:50'),
(173, 'PI-0000120', '2022-11-01', NULL, '2022-11-01', 'S-00021', 17200.00, 17200.00, 0.00, 'Cash', NULL, '2022-11-01', '1', '1', 0, '2022-11-01 12:14:45', '2022-11-01 12:14:45'),
(174, 'PI-0000121', '2022-11-04', NULL, '2022-11-04', 'S-00002', 682.08, 682.08, 0.00, 'Cash', NULL, '2022-11-04', '1', '1', 0, '2022-11-04 13:28:07', '2022-11-04 13:28:07'),
(175, 'PI-0000122', '2022-11-04', NULL, '2022-11-04', 'S-00002', 1395.35, 1395.35, 0.00, 'Cash', NULL, '2022-11-04', '1', '1', 0, '2022-11-04 13:36:03', '2022-11-04 13:36:03'),
(176, 'PI-0000123', '2022-11-04', NULL, '2022-11-04', 'S-00014', 3200.01, 3200.01, 0.00, 'Cash', NULL, '2022-11-04', '1', '1', 0, '2022-11-04 13:39:50', '2022-11-04 13:39:50'),
(177, 'PI-0000124', '2022-11-04', NULL, '2022-11-04', 'S-00029', 143811.00, 143000.00, 0.00, 'Cash', NULL, '2022-11-04', '1', '1', 0, '2022-11-04 13:46:17', '2022-11-04 13:46:17'),
(178, 'PI-0000125', '2022-11-05', NULL, '2022-11-05', 'S-00007', 370.00, 370.00, 0.00, 'Cash', NULL, '2022-11-05', '1', '1', 0, '2022-11-05 14:02:17', '2022-11-05 14:02:17'),
(179, 'PI-0000126', '2022-11-05', NULL, '2022-11-05', 'S-00009', 187.09, 187.09, 0.00, 'Cash', NULL, '2022-11-05', '1', '1', 0, '2022-11-05 14:05:32', '2022-11-05 14:05:32'),
(180, 'PI-0000127', '2022-11-05', NULL, '2022-11-05', 'S-00002', 382.92, 382.92, 0.00, 'Cash', NULL, '2022-11-05', '1', '1', 0, '2022-11-05 14:14:12', '2022-11-05 14:14:12'),
(181, 'PI-0000128', '2022-11-05', NULL, '2022-11-05', 'S-00009', 187.09, 187.09, 0.00, 'Cash', NULL, '2022-11-05', '1', '1', 0, '2022-11-05 14:15:17', '2022-11-05 14:15:17'),
(182, 'PI-0000129', '2022-11-08', NULL, '2022-11-08', 'S-00026', 10950.00, 8000.00, 0.00, 'Cash', NULL, '2022-11-08', '1', '1', 0, '2022-11-08 07:17:12', '2022-11-08 07:17:12'),
(183, 'PI-0000130', '2022-11-08', NULL, '2022-11-08', 'S-00022', 8260.75, 8260.75, 0.00, 'Cash', NULL, '2022-11-08', '1', '1', 0, '2022-11-08 07:23:44', '2022-11-08 07:23:44'),
(184, 'PI-0000131', '2022-11-09', NULL, '2022-11-09', 'S-00002', 2320.40, 2320.40, 0.00, 'Cash', NULL, '2022-11-09', '1', '1', 0, '2022-11-09 12:46:35', '2022-11-09 12:46:35'),
(185, 'PI-0000132', '2022-11-09', NULL, '2022-11-09', 'S-00001', 6270.24, 6270.24, 0.00, 'Cash', NULL, '2022-11-09', '1', '1', 0, '2022-11-09 12:56:39', '2022-11-09 12:56:39'),
(186, 'PI-0000133', '2022-11-10', NULL, '2022-11-10', 'S-00026', 159020.00, 0.00, 0.00, 'Cash', NULL, '2022-11-10', '1', '1', 0, '2022-11-10 12:03:43', '2022-11-10 12:03:43'),
(188, 'PI-0000134', '2022-11-12', NULL, '2022-11-12', 'S-00015', 430.00, 430.00, 0.00, 'Cash', NULL, '2022-11-12', '1', '1', 0, '2022-11-12 10:59:53', '2022-11-12 10:59:53'),
(189, 'PI-0000135', '2022-11-13', NULL, '2022-11-13', 'S-00001', 11457.50, 0.00, 0.00, 'Cash', NULL, '2022-11-13', '1', '1', 0, '2022-11-13 07:22:42', '2022-11-13 07:22:42'),
(190, 'PI-0000136', '2022-11-14', NULL, '2022-11-14', 'S-00018', 817.20, 817.20, 0.00, 'Cash', NULL, '2022-11-14', '1', '1', 0, '2022-11-14 12:53:26', '2022-11-14 12:53:26'),
(191, 'PI-0000137', '2022-11-15', NULL, '2022-11-15', 'S-00009', 1330.00, 1330.00, 0.00, 'Cash', NULL, '2022-11-15', '1', '1', 0, '2022-11-15 12:16:47', '2022-11-15 12:16:47'),
(192, 'PI-0000138', '2022-11-15', NULL, '2022-11-15', 'S-00010', 11042.95, 5000.00, 0.00, 'Cash', NULL, '2022-11-15', '1', '1', 0, '2022-11-15 12:26:39', '2022-11-15 12:26:39'),
(193, 'PI-0000139', '2022-11-15', NULL, '2022-11-15', 'S-00002', 1920.50, 1920.50, 0.00, 'Cash', NULL, '2022-11-15', '1', '1', 0, '2022-11-15 12:29:04', '2022-11-15 12:29:04'),
(194, 'PI-0000140', '2022-11-15', NULL, '2022-11-15', 'S-00003', 18442.48, 18442.48, 0.00, 'Cash', NULL, '2022-11-15', '1', '1', 0, '2022-11-15 12:42:13', '2022-11-15 12:42:13'),
(195, 'PI-0000141', '2022-11-18', NULL, '2022-11-18', 'S-00009', 2057.99, 2058.00, 0.00, 'Cash', NULL, '2022-11-18', '1', '1', 0, '2022-11-18 12:23:01', '2022-11-18 12:23:01'),
(196, 'PI-0000142', '2022-11-20', NULL, '2022-11-20', 'S-00002', 3322.00, 3322.00, 0.00, 'Cash', NULL, '2022-11-20', '1', '1', 0, '2022-11-20 06:22:21', '2022-11-20 06:22:21'),
(197, 'PI-0000143', '2022-11-20', NULL, '2022-11-20', 'S-00010', 2057.99, 10000.00, 0.00, 'Cash', NULL, '2022-11-20', '1', '1', 0, '2022-11-20 06:33:07', '2022-11-20 06:33:07'),
(198, 'PI-0000144', '2022-11-22', NULL, '2022-11-22', 'S-00021', 21017.89, 21017.89, 0.00, 'Cash', NULL, '2022-11-22', '1', '1', 0, '2022-11-22 06:06:24', '2022-11-22 06:06:24'),
(199, 'PI-0000145', '2022-11-24', NULL, '2022-11-24', 'S-00030', 19157.05, 19157.05, 0.00, 'Cash', NULL, '2022-11-24', '1', '1', 0, '2022-11-24 11:57:45', '2022-11-24 11:57:45'),
(200, 'PI-0000146', '2022-11-24', NULL, '2022-11-24', 'S-00032', 1222.60, 1222.60, 0.00, 'Cash', NULL, '2022-11-24', '1', '1', 0, '2022-11-24 12:29:30', '2022-11-24 12:29:30'),
(201, 'PI-0000147', '2022-11-29', NULL, '2022-11-29', 'S-00003', 10220.04, 10220.04, 0.00, 'Cash', NULL, '2022-11-29', '1', '1', 0, '2022-11-29 07:08:26', '2022-11-29 07:08:26'),
(202, 'PI-0000148', '2022-12-07', NULL, '2022-12-07', 'S-00001', 1746.00, 1746.00, 0.00, 'Cash', NULL, '2022-12-07', '1', '1', 0, '2022-12-07 06:33:13', '2022-12-07 06:33:13'),
(203, 'PI-0000149', '2022-12-07', NULL, '2022-12-07', 'S-00002', 5089.30, 5089.30, 0.00, 'Cash', NULL, '2022-12-07', '1', '1', 0, '2022-12-07 06:44:30', '2022-12-07 06:44:30'),
(204, 'PI-0000150', '2022-12-07', NULL, '2022-12-07', 'S-00021', 2346.00, 2346.00, 0.00, 'Cash', NULL, '2022-12-07', '1', '1', 0, '2022-12-07 06:51:02', '2022-12-07 06:51:02'),
(205, 'PI-0000151', '2022-12-07', NULL, '2022-12-07', 'S-00004', 21007.99, 20000.00, 0.00, 'Cash', NULL, '2022-12-07', '1', '1', 0, '2022-12-07 06:58:56', '2022-12-07 06:58:56'),
(206, 'PI-0000152', '2022-12-07', NULL, '2022-12-07', 'S-00004', 4275.00, 0.00, 0.00, 'Cash', NULL, '2022-12-07', '1', '1', 0, '2022-12-07 07:01:46', '2022-12-07 07:01:46'),
(207, 'PI-0000153', '2022-12-08', NULL, '2022-12-08', 'S-00022', 739.00, 739.00, 0.00, 'Cash', NULL, '2022-12-08', '1', '1', 0, '2022-12-08 12:25:14', '2022-12-08 12:25:14'),
(208, 'PI-0000154', '2022-12-08', NULL, '2022-12-08', 'S-00001', 5290.86, 5290.86, 0.00, 'Cash', NULL, '2022-12-08', '1', '1', 0, '2022-12-08 12:33:46', '2022-12-08 12:33:46'),
(209, 'PI-0000155', '2022-12-08', NULL, '2022-12-08', 'S-00009', 4196.16, 4196.16, 0.00, 'Cash', NULL, '2022-12-08', '1', '1', 0, '2022-12-08 12:47:10', '2022-12-08 12:47:10'),
(217, 'PI-0000156', '2022-11-02', NULL, '2022-11-02', 'S-00021', 1088.50, 1088.50, 0.00, 'Cash', NULL, '2022-12-08', '1', '1', 0, '2022-12-08 14:07:47', '2022-12-08 14:07:47'),
(218, 'PI-0000157', '2022-12-08', NULL, '2022-12-08', 'S-00026', 17100.00, 17100.00, 0.00, 'Cash', NULL, '2022-12-08', '1', '1', 0, '2022-12-08 14:47:25', '2022-12-08 14:47:25'),
(219, 'PI-0000158', '2022-12-11', NULL, '2022-12-11', 'S-00013', 11810.00, 11310.00, 0.00, 'Cash', NULL, '2022-12-11', '1', '1', 0, '2022-12-11 13:03:33', '2022-12-11 13:03:33'),
(220, 'PI-0000159', '2022-12-13', NULL, '2022-12-13', 'S-00003', 4999.96, 4999.96, 0.00, 'Cash', NULL, '2022-12-13', '1', '1', 0, '2022-12-13 13:25:43', '2022-12-13 13:25:43'),
(222, 'PI-0000160', '2022-12-15', NULL, '2022-12-15', 'S-00014', 2097.59, 2097.59, 0.00, 'Cash', NULL, '2022-12-15', '1', '1', 0, '2022-12-15 11:18:05', '2022-12-15 11:18:05'),
(223, 'PI-0000161', '2022-12-23', NULL, '2022-12-23', 'S-00002', 4816.30, 4816.30, 0.00, 'Cash', NULL, '2022-12-23', '1', '1', 0, '2022-12-23 11:01:25', '2022-12-23 11:01:25'),
(224, 'PI-0000162', '2022-12-23', NULL, '2022-12-23', 'S-00002', 496.80, 496.80, 0.00, 'Cash', NULL, '2022-12-23', '1', '1', 0, '2022-12-23 11:11:40', '2022-12-23 11:11:40'),
(225, 'PI-0000163', '2022-12-23', NULL, '2022-12-23', 'S-00001', 3485.88, 3485.88, 0.00, 'Cash', NULL, '2022-12-23', '1', '1', 0, '2022-12-23 11:18:34', '2022-12-23 11:18:34'),
(226, 'PI-0000164', '2022-12-23', NULL, '2022-12-23', 'S-00021', 440.00, 440.00, 0.00, 'Cash', NULL, '2022-12-23', '1', '1', 0, '2022-12-23 11:22:27', '2022-12-23 11:22:27'),
(227, 'PI-0000165', '2022-12-23', NULL, '2022-12-23', 'S-00005', 1989.05, 1989.05, 0.00, 'Cash', NULL, '2022-12-23', '1', '1', 0, '2022-12-23 11:46:34', '2022-12-23 11:46:34'),
(228, 'PI-0000166', '2022-12-28', NULL, '2022-12-28', 'S-00010', 3884.82, 0.00, 0.00, 'Cash', NULL, '2022-12-28', '1', '1', 0, '2022-12-28 06:31:58', '2022-12-28 06:31:58'),
(229, 'PI-0000167', '2022-12-30', NULL, '2022-12-30', 'S-00003', 8114.96, 8115.00, 0.00, 'Cash', NULL, '2022-12-30', '1', '1', 0, '2022-12-30 11:47:58', '2022-12-30 11:47:58'),
(230, 'PI-0000168', '2023-01-01', NULL, '2023-01-01', 'S-00004', 8415.00, 20000.00, 0.00, 'Cash', NULL, '2023-01-01', '1', '1', 0, '2023-01-01 07:02:34', '2023-01-01 07:02:34'),
(231, 'PI-0000169', '2023-01-01', NULL, '2023-01-01', 'S-00001', 11931.59, 0.00, 0.00, 'Cash', NULL, '2023-01-01', '1', '1', 0, '2023-01-01 11:00:32', '2023-01-01 11:00:32'),
(232, 'PI-0000170', '2023-01-01', NULL, '2023-01-01', 'S-00013', 2316.00, 2316.00, 0.00, 'Cash', NULL, '2023-01-01', '1', '1', 0, '2023-01-01 13:10:26', '2023-01-01 13:10:26'),
(233, 'PI-0000171', '2023-01-01', NULL, '2023-01-01', 'S-00010', 65691.36, 100000.00, 0.00, 'Cash', NULL, '2023-01-01', '1', '1', 0, '2023-01-01 14:20:11', '2023-01-01 14:20:11');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_sales_current`
--

CREATE TABLE `purchase_sales_current` (
  `id` int(10) UNSIGNED NOT NULL,
  `sub_unit_id` int(10) NOT NULL,
  `product_id` varchar(15) NOT NULL,
  `product_quantity` double(11,2) NOT NULL DEFAULT 0.00,
  `product_purchase_price` double(11,2) NOT NULL DEFAULT 0.00,
  `product_sales_price` double(11,2) NOT NULL DEFAULT 0.00,
  `product_discount_amount` double(11,2) NOT NULL DEFAULT 0.00,
  `note` varchar(191) DEFAULT NULL,
  `admin_id` varchar(11) DEFAULT NULL,
  `session_id` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_purchase_current`
--

CREATE TABLE `return_purchase_current` (
  `id` int(10) NOT NULL,
  `pdt_id` varchar(15) NOT NULL,
  `sub_unit_id` int(10) DEFAULT NULL,
  `purchase_quantity` double(11,2) NOT NULL,
  `purchase_price` double(11,2) DEFAULT 0.00,
  `discount_amount` double(11,2) NOT NULL,
  `per_unit_cost` double(11,2) NOT NULL,
  `sale_price_per_unit` double(11,2) NOT NULL,
  `pdt_expiry_date` date DEFAULT NULL,
  `session_id` varchar(191) NOT NULL,
  `admin_id` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `return_purchase_current`
--

INSERT INTO `return_purchase_current` (`id`, `pdt_id`, `sub_unit_id`, `purchase_quantity`, `purchase_price`, `discount_amount`, `per_unit_cost`, `sale_price_per_unit`, `pdt_expiry_date`, `session_id`, `admin_id`, `created_at`, `updated_at`) VALUES
(20, 'PDT-000003', 15, 1.00, 2931.00, 0.00, 0.00, 0.00, NULL, 'K4NYnuATOpBnBPF5IV0cTZFqpX4A5BLem5Td9ZC1', '1', '2022-12-19 17:20:58', '2022-12-19 17:20:58');

-- --------------------------------------------------------

--
-- Table structure for table `return_purchase_entry`
--

CREATE TABLE `return_purchase_entry` (
  `id` int(10) NOT NULL,
  `invoice_no` varchar(15) NOT NULL,
  `product_id` varchar(15) NOT NULL,
  `sub_unit_id` int(10) DEFAULT NULL,
  `product_quantity` double DEFAULT NULL,
  `purchase_price` double DEFAULT NULL,
  `per_unit_cost` double DEFAULT NULL,
  `discount_amount` double DEFAULT NULL,
  `pdt_expiry_date` date DEFAULT NULL,
  `entry_date` date DEFAULT NULL,
  `branch_id` varchar(11) DEFAULT NULL,
  `admin_id` varchar(15) DEFAULT NULL,
  `status` int(2) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `return_purchase_entry`
--

INSERT INTO `return_purchase_entry` (`id`, `invoice_no`, `product_id`, `sub_unit_id`, `product_quantity`, `purchase_price`, `per_unit_cost`, `discount_amount`, `pdt_expiry_date`, `entry_date`, `branch_id`, `admin_id`, `status`, `created_at`, `updated_at`) VALUES
(10, 'PR-000000001', 'PDT-000310', 1, 6, 1741.55, 0, 0, NULL, '2022-12-20', '1', '1', 0, '2022-12-08 13:02:10', '2022-12-20 08:57:09');

-- --------------------------------------------------------

--
-- Table structure for table `return_purchase_ledger`
--

CREATE TABLE `return_purchase_ledger` (
  `id` int(10) NOT NULL,
  `invoice_no` varchar(15) NOT NULL,
  `invoice_date` varchar(30) DEFAULT NULL,
  `voucher_no` varchar(191) DEFAULT NULL,
  `voucher_date` varchar(20) DEFAULT NULL,
  `suplier_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total` double(11,2) NOT NULL DEFAULT 0.00,
  `paid` double(11,2) DEFAULT 0.00,
  `discount` double(11,2) DEFAULT 0.00,
  `transaction_type` varchar(50) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `entry_date` varchar(20) DEFAULT NULL,
  `admin_id` varchar(15) DEFAULT NULL,
  `branch_id` varchar(15) DEFAULT NULL,
  `status` int(2) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `return_purchase_ledger`
--

INSERT INTO `return_purchase_ledger` (`id`, `invoice_no`, `invoice_date`, `voucher_no`, `voucher_date`, `suplier_id`, `total`, `paid`, `discount`, `transaction_type`, `comment`, `entry_date`, `admin_id`, `branch_id`, `status`, `created_at`, `updated_at`) VALUES
(7, 'PR-000000001', '2022-12-08', NULL, '2022-12-08', 'S-00030', 10449.30, 0.00, 0.00, NULL, NULL, '2022-12-08', '1', '1', 0, '2022-12-08 13:02:10', '2022-12-08 13:02:10');

-- --------------------------------------------------------

--
-- Table structure for table `sales_current`
--

CREATE TABLE `sales_current` (
  `id` int(10) UNSIGNED NOT NULL,
  `sub_unit_id` int(10) NOT NULL,
  `product_id` varchar(15) NOT NULL,
  `product_quantity` double(11,2) NOT NULL DEFAULT 0.00,
  `product_purchase_price` double(11,2) NOT NULL DEFAULT 0.00,
  `product_sales_price` double(11,2) NOT NULL DEFAULT 0.00,
  `product_discount_amount` double(11,2) NOT NULL DEFAULT 0.00,
  `note` varchar(191) DEFAULT NULL,
  `admin_id` varchar(11) DEFAULT NULL,
  `session_id` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_current`
--

INSERT INTO `sales_current` (`id`, `sub_unit_id`, `product_id`, `product_quantity`, `product_purchase_price`, `product_sales_price`, `product_discount_amount`, `note`, `admin_id`, `session_id`, `created_at`, `updated_at`) VALUES
(210, 15, 'PDT-000015', 2.00, 921.00, 1000.00, 0.00, NULL, '1', 'MqXPdNnXjgTxsPftNrTkRIwa3sJ69iPdx4UZSo6d', '2022-10-07 05:23:06', '2022-10-07 05:37:46'),
(547, 1, 'PDT-000211', 1.00, 94.97, 105.00, 0.00, NULL, '1', 'yAmBaWOBdNa5yTR5dZMjDPxFX9jcZEhdoA9HvAVE', '2022-10-09 04:49:45', '2022-10-09 04:49:55'),
(548, 1, 'PDT-000184', 1.00, 218.18, 250.00, 0.00, NULL, '1', 'yAmBaWOBdNa5yTR5dZMjDPxFX9jcZEhdoA9HvAVE', '2022-10-09 04:50:02', '2022-10-09 04:50:11'),
(557, 1, 'PDT-000026', 1.00, 31.76, 35.00, 0.00, NULL, '1', 'p5dsLvtI0Iv23h5IzHtWvQIJ9rEnIqMXUQnQSbgW', '2022-10-09 05:14:53', '2022-10-09 05:14:53'),
(558, 1, 'PDT-000081', 1.00, 44.70, 60.00, 0.00, NULL, '1', 'p5dsLvtI0Iv23h5IzHtWvQIJ9rEnIqMXUQnQSbgW', '2022-10-09 05:15:10', '2022-10-09 05:15:10'),
(672, 1, 'PDT-000075', 1.00, 383.15, 430.00, 0.00, NULL, '1', 'q6biIQXoNIlQXKFkCkYier5bZXrVTiwIMsypwZvH', '2022-10-09 13:19:59', '2022-10-09 13:19:59'),
(673, 1, 'PDT-000114', 1.00, 336.00, 360.00, 0.00, NULL, '1', 'q6biIQXoNIlQXKFkCkYier5bZXrVTiwIMsypwZvH', '2022-10-09 13:21:19', '2022-10-09 13:21:19'),
(674, 1, 'PDT-000110', 1.00, 910.00, 950.00, 0.00, NULL, '1', 'q6biIQXoNIlQXKFkCkYier5bZXrVTiwIMsypwZvH', '2022-10-09 13:21:58', '2022-10-09 13:21:58'),
(675, 1, 'PDT-000029', 1.00, 664.77, 720.00, 0.00, NULL, '1', 'q6biIQXoNIlQXKFkCkYier5bZXrVTiwIMsypwZvH', '2022-10-09 13:23:25', '2022-10-09 13:23:25'),
(676, 1, 'PDT-000057', 4.00, 1296.78, 1500.00, 0.00, NULL, '1', 'q6biIQXoNIlQXKFkCkYier5bZXrVTiwIMsypwZvH', '2022-10-09 13:24:41', '2022-10-09 13:24:55'),
(711, 1, 'PDT-000148', 12.00, 1.95, 2.20, 0.00, NULL, '1', '5Ww3U3YdyqkRaAxwM7WwC8x2CEZgEiCXg6hOEdHZ', '2022-10-11 06:22:53', '2022-10-11 06:23:08'),
(712, 1, 'PDT-000149', 6.00, 3.43, 4.00, 0.00, NULL, '1', '5Ww3U3YdyqkRaAxwM7WwC8x2CEZgEiCXg6hOEdHZ', '2022-10-11 06:23:42', '2022-10-11 06:23:51'),
(713, 1, 'PDT-000146', 6.00, 8.60, 10.00, 0.00, NULL, '1', '5Ww3U3YdyqkRaAxwM7WwC8x2CEZgEiCXg6hOEdHZ', '2022-10-11 06:24:01', '2022-10-11 06:24:10'),
(714, 1, 'PDT-000035', 1.00, 128.52, 150.00, 0.00, NULL, '1', '5Ww3U3YdyqkRaAxwM7WwC8x2CEZgEiCXg6hOEdHZ', '2022-10-11 06:24:25', '2022-10-11 06:24:25'),
(715, 1, 'PDT-000261', 1.00, 310.40, 370.00, 0.00, NULL, '1', '5Ww3U3YdyqkRaAxwM7WwC8x2CEZgEiCXg6hOEdHZ', '2022-10-11 06:25:10', '2022-10-11 06:25:10'),
(716, 1, 'PDT-000169', 28.00, 8.39, 10.00, 0.00, NULL, '1', '5Ww3U3YdyqkRaAxwM7WwC8x2CEZgEiCXg6hOEdHZ', '2022-10-11 06:25:31', '2022-10-11 06:25:46'),
(739, 1, 'PDT-000025', 1.00, 408.92, 440.00, 0.00, NULL, '1', 'H2ZN3uIsGkYPtsSGS5JLdhLGraa2E5MgAwm9G7PZ', '2022-10-14 12:49:58', '2022-10-14 12:49:58'),
(753, 1, 'PDT-000215', 4.00, 63.82, 70.00, 0.00, NULL, '1', 'YienWaCGuD2M4anzXZAn2yxK3zP91ncYpXL4bxPW', '2022-10-15 13:33:39', '2022-10-15 13:36:03'),
(754, 1, 'PDT-000149', 4.00, 3.43, 4.00, 0.00, NULL, '1', 'YienWaCGuD2M4anzXZAn2yxK3zP91ncYpXL4bxPW', '2022-10-15 13:36:09', '2022-10-15 13:36:15'),
(763, 15, 'PDT-000003', 3.00, 2931.00, 0.00, 0.00, NULL, '3', 'X5pnKbR7PGYUw3w8lpdp2XRFcG2Et61whjQUzvzp', '2022-10-18 13:35:45', '2022-10-18 13:36:45'),
(764, 15, 'PDT-000009', 2.00, 2725.00, 0.00, 0.00, NULL, '3', 'X5pnKbR7PGYUw3w8lpdp2XRFcG2Et61whjQUzvzp', '2022-10-18 13:35:48', '2023-01-04 04:07:00'),
(765, 15, 'PDT-000001', 2.00, 2842.00, 0.00, 0.00, NULL, '3', 'X5pnKbR7PGYUw3w8lpdp2XRFcG2Et61whjQUzvzp', '2022-10-18 13:36:42', '2022-10-18 13:38:00'),
(766, 15, 'PDT-000006', 1.00, 2573.00, 0.00, 0.00, NULL, '3', 'X5pnKbR7PGYUw3w8lpdp2XRFcG2Et61whjQUzvzp', '2022-10-18 13:38:01', '2022-10-18 13:38:01'),
(767, 1, 'PDT-000019', 1.00, 365.62, 395.00, 0.00, NULL, '3', 'M4uDCRGSKcokI1pzUQjqS4CKWwOT1utq32pe0bTe', '2022-10-18 14:27:59', '2022-10-18 14:27:59'),
(768, 1, 'PDT-000228', 1.00, 233.33, 235.00, 0.00, NULL, '3', 'xFYWo6pAH6UY6RTBtfBM4UE4k4Hi145lMjtdPyXp', '2022-10-18 15:05:59', '2022-10-18 15:05:59'),
(769, 1, 'PDT-000228', 1.00, 233.33, 260.00, 0.00, NULL, '3', 'LeaF4gN1lxCXwTLNtoFhWVPk3CzNI0ucOklOZYDE', '2022-10-18 15:08:26', '2022-10-18 15:08:26'),
(773, 1, 'PDT-000081', 2.00, 44.70, 60.00, 0.00, NULL, '3', 'zF8WRSamujHtOcomo8pHtA5d9nKkG1hIVkH4tZ8T', '2022-10-19 10:54:03', '2022-10-19 11:02:50'),
(774, 1, 'PDT-000150', 4.00, 3.85, 4.00, 0.00, NULL, '3', 'zF8WRSamujHtOcomo8pHtA5d9nKkG1hIVkH4tZ8T', '2022-10-19 10:57:19', '2022-10-19 11:02:58'),
(777, 1, 'PDT-000126', 2.00, 14.55, 17.00, 0.00, NULL, '3', 'zF8WRSamujHtOcomo8pHtA5d9nKkG1hIVkH4tZ8T', '2022-10-19 11:02:15', '2022-10-19 11:02:51'),
(783, 1, 'PDT-000164', 1.00, 10.14, 12.00, 0.00, NULL, '3', 'CMrRo0w240ptaQhP49OGUwzJfgNUdXQUFRuhDMSK', '2022-10-21 05:20:05', '2022-10-21 05:20:05'),
(784, 1, 'PDT-000117', 1.00, 20.89, 23.00, 0.00, NULL, '3', 'CMrRo0w240ptaQhP49OGUwzJfgNUdXQUFRuhDMSK', '2022-10-21 05:20:37', '2022-10-21 05:20:37'),
(785, 1, 'PDT-000130', 1.00, 81.72, 90.00, 0.00, NULL, '3', 'CMrRo0w240ptaQhP49OGUwzJfgNUdXQUFRuhDMSK', '2022-10-21 05:20:54', '2022-10-21 05:20:54'),
(786, 1, 'PDT-000197', 1.00, 586.80, 630.00, 0.00, NULL, '3', 'CMrRo0w240ptaQhP49OGUwzJfgNUdXQUFRuhDMSK', '2022-10-21 05:58:22', '2022-10-21 05:58:22'),
(787, 1, 'PDT-000193', 1.00, 10.50, 12.00, 0.00, NULL, '3', '9H7r0LtoWQuyHI7a0uB9hbFbD6g3UdXLqJkoVz1x', '2022-10-21 11:06:24', '2022-10-21 11:06:24'),
(788, 1, 'PDT-000141', 1.00, 13.80, 15.00, 0.00, NULL, '3', '9H7r0LtoWQuyHI7a0uB9hbFbD6g3UdXLqJkoVz1x', '2022-10-21 11:06:46', '2022-10-21 11:06:46'),
(789, 1, 'PDT-000093', 1.00, 157.29, 180.00, 0.00, NULL, '3', 'O6nOmV878cLu9ECFKtb3EsBqbqXwMAUhK8pjL9eC', '2022-10-21 12:21:43', '2022-10-21 12:21:43'),
(790, 1, 'PDT-000034', 1.00, 73.76, 80.00, 0.00, NULL, '3', 'O6nOmV878cLu9ECFKtb3EsBqbqXwMAUhK8pjL9eC', '2022-10-21 13:42:08', '2022-10-21 13:42:08'),
(791, 1, 'PDT-000033', 1.00, 582.58, 630.00, 0.00, NULL, '3', 'O6nOmV878cLu9ECFKtb3EsBqbqXwMAUhK8pjL9eC', '2022-10-21 13:44:44', '2022-10-21 13:44:44'),
(792, 1, 'PDT-000188', 1.00, 417.16, 480.00, 0.00, NULL, '3', 'RR0g3uhw3spVqYW3zRIFbKbn3SMniPeaybaUoFio', '2022-10-22 06:55:01', '2022-10-22 06:55:01'),
(801, 1, 'PDT-000189', 2.00, 172.40, 200.00, 0.00, NULL, '3', 'wVsu1zbABj8Vqz3v4IunnNwKN6gCIBxl3yKkHHvV', '2022-10-22 13:56:37', '2022-10-22 13:56:56'),
(837, 15, 'PDT-000001', 2.00, 2842.00, 3244.00, 0.00, NULL, '3', 'TkSrU6ApTojhIdLFSQAVp02EwZCtvUwyBuoOFsy2', '2022-10-26 06:40:01', '2022-10-26 06:43:57'),
(838, 1, 'PDT-000066', 2.00, 265.91, 310.00, 0.00, NULL, '3', 'TkSrU6ApTojhIdLFSQAVp02EwZCtvUwyBuoOFsy2', '2022-10-26 06:40:32', '2022-10-26 06:40:39'),
(839, 1, 'PDT-000065', 1.00, 66.82, 85.00, 0.00, NULL, '3', 'TkSrU6ApTojhIdLFSQAVp02EwZCtvUwyBuoOFsy2', '2022-10-26 06:40:49', '2022-10-26 06:40:49'),
(840, 1, 'PDT-000114', 1.00, 336.00, 360.00, 0.00, NULL, '3', 'TkSrU6ApTojhIdLFSQAVp02EwZCtvUwyBuoOFsy2', '2022-10-26 06:41:23', '2022-10-26 06:41:23'),
(841, 1, 'PDT-000035', 1.00, 128.52, 150.00, 0.00, NULL, '3', 'TkSrU6ApTojhIdLFSQAVp02EwZCtvUwyBuoOFsy2', '2022-10-26 06:43:07', '2022-10-26 06:43:07'),
(842, 1, 'PDT-000146', 6.00, 8.60, 10.00, 0.00, NULL, '1', 'aoAAaX7iqoopIfcrN0yob81f3WypVdLHKBHJeEIu', '2022-10-26 12:40:53', '2022-10-26 12:41:47'),
(843, 1, 'PDT-000149', 6.00, 3.43, 4.00, 0.00, NULL, '1', 'aoAAaX7iqoopIfcrN0yob81f3WypVdLHKBHJeEIu', '2022-10-26 12:41:27', '2022-10-26 12:41:35'),
(844, 1, 'PDT-000123', 3.00, 16.24, 19.00, 0.00, NULL, '1', 'aoAAaX7iqoopIfcrN0yob81f3WypVdLHKBHJeEIu', '2022-10-26 12:41:52', '2022-10-26 12:42:03'),
(846, 1, 'PDT-000257', 1.00, 56.00, 70.00, 0.00, NULL, '1', 'aoAAaX7iqoopIfcrN0yob81f3WypVdLHKBHJeEIu', '2022-10-26 12:46:12', '2022-10-26 12:46:12'),
(847, 1, 'PDT-000148', 2.00, 1.95, 2.20, 0.00, NULL, '1', 'Qpw8cXTDDGwbazFZCZDN6HnV9WUg0KhFRe3HhJO6', '2022-10-27 11:10:27', '2022-10-27 11:10:41'),
(848, 1, 'PDT-000126', 1.00, 14.55, 17.00, 0.00, NULL, '1', 'Qpw8cXTDDGwbazFZCZDN6HnV9WUg0KhFRe3HhJO6', '2022-10-27 11:11:18', '2022-10-27 11:11:18'),
(889, 15, 'PDT-000001', 1.00, 2842.00, 3245.00, 0.00, NULL, '1', 'Qucwfh9h4ZVcNkadJ5uX1jtaRlhFlaWNgG75zUDQ', '2022-10-27 14:15:56', '2022-10-27 14:16:14'),
(956, 1, 'PDT-000124', 2.00, 312.50, 375.00, 0.00, NULL, '1', 'NKKYQsSu7rQLyb9wcZNxVpxI1nU1CWHfD5TUtiWT', '2022-10-28 11:13:34', '2022-10-28 11:13:41'),
(1012, 1, 'PDT-000182', 1.00, 268.80, 290.00, 0.00, NULL, '1', 'SMu6DDQQT9QeFXdD1QV6N0Qp8pAeyQSLw3Leq6u5', '2022-10-28 13:45:17', '2022-10-28 13:45:17'),
(1013, 1, 'PDT-000111', 1.00, 480.00, 510.00, 0.00, NULL, '1', 'SMu6DDQQT9QeFXdD1QV6N0Qp8pAeyQSLw3Leq6u5', '2022-10-28 13:45:53', '2022-10-28 13:45:53'),
(1014, 1, 'PDT-000096', 1.00, 291.67, 330.00, 0.00, NULL, '1', 'SMu6DDQQT9QeFXdD1QV6N0Qp8pAeyQSLw3Leq6u5', '2022-10-28 13:46:09', '2022-10-28 13:46:09'),
(1069, 15, 'PDT-000001', 2.00, 3085.80, 3244.00, 0.00, NULL, '1', 'SdxBqGsQ3tdi2LKDI454B81irpfkFmPIN6UYw6Az', '2022-10-29 12:31:29', '2022-10-29 12:32:11'),
(1070, 1, 'PDT-000035', 1.00, 128.52, 150.00, 0.00, NULL, '1', 'SdxBqGsQ3tdi2LKDI454B81irpfkFmPIN6UYw6Az', '2022-10-29 12:32:23', '2022-10-29 12:32:23'),
(1071, 1, 'PDT-000065', 1.00, 66.82, 85.00, 0.00, NULL, '1', 'SdxBqGsQ3tdi2LKDI454B81irpfkFmPIN6UYw6Az', '2022-10-29 12:32:37', '2022-10-29 12:32:37'),
(1072, 1, 'PDT-000066', 2.00, 265.89, 310.00, 0.00, NULL, '1', 'SdxBqGsQ3tdi2LKDI454B81irpfkFmPIN6UYw6Az', '2022-10-29 12:32:49', '2022-10-29 12:32:58'),
(1073, 1, 'PDT-000114', 1.00, 336.00, 360.00, 0.00, NULL, '1', 'SdxBqGsQ3tdi2LKDI454B81irpfkFmPIN6UYw6Az', '2022-10-29 12:33:07', '2022-10-29 12:33:07'),
(1125, 15, 'PDT-000001', 2.00, 3085.80, 3417.00, 0.00, NULL, '1', '8AnSCXfJgM14HyDKzn0kdkcU4Wt5Qv9y54FYwMwP', '2022-10-31 13:27:03', '2022-10-31 13:27:44'),
(1167, 1, 'PDT-000162', 1.00, 807.88, 860.00, 0.00, NULL, '1', 'OjJafyUljeRV0jTCZJTjxbKI3gNqO6bOVSyw6ekX', '2022-11-02 07:02:50', '2022-11-02 07:02:50'),
(1205, 1, 'PDT-000189', 1.00, 172.40, 200.00, 0.00, NULL, '1', 'x3XHVWYodwMhnpuQfhZiKpiHmZwKvskGYFHt1C2j', '2022-11-04 13:15:34', '2022-11-04 13:15:34'),
(1206, 1, 'PDT-000234', 1.00, 599.85, 720.00, 0.00, NULL, '1', '4caq2qeyAYaEHUAglfvRU3UcJTdixlY8naWtbD22', '2022-11-04 14:15:37', '2022-11-04 14:15:37'),
(1214, 1, 'PDT-000019', 1.00, 365.62, 395.00, 0.00, NULL, '1', 'uq6FIq52mlwsdsVoZ4XMAVRlrK3a4zIt0eWQde17', '2022-11-05 06:52:43', '2022-11-05 06:52:43'),
(1231, 15, 'PDT-000006', 1.00, 2625.00, 6.00, 0.00, NULL, '1', 'uKK8jTyCMo4ladRw9ddaMgRWxRPjB6aLY91QilhO', '2022-11-06 07:07:22', '2022-11-06 07:07:29'),
(1232, 15, 'PDT-000003', 1.00, 2931.00, 5.00, 0.00, NULL, '1', 'uKK8jTyCMo4ladRw9ddaMgRWxRPjB6aLY91QilhO', '2022-11-06 07:07:25', '2022-11-06 07:07:29'),
(1270, 15, 'PDT-000001', 1.00, 3054.90, 50.00, 0.00, NULL, '1', '4ZjoaIlRKqLH5O9wwzseb9sQUfDN8PdOBFWRdwhX', '2022-11-08 11:45:23', '2022-11-08 11:45:30'),
(1310, 1, 'PDT-000049', 10.00, 16.66, 20.00, 0.00, NULL, '1', 'TBAoE4bOnxE3Qt9DiwM6Rd0x0wRCcW3QhbKuaNn8', '2022-11-11 03:45:26', '2022-11-11 03:48:58'),
(1339, 1, 'PDT-000038', 1.00, 18.02, 20.00, 0.00, NULL, '1', 's31j4LTWXEwublDuiEazNnbBfGwSiI0rwCyJiy4P', '2022-11-12 12:31:22', '2022-11-12 12:31:22'),
(1346, 1, 'PDT-000158', 1.00, 311.15, 340.00, 0.00, NULL, '1', 'QViRvpzgEWma0piWfPOoecIS7iz9UretfqzFw434', '2022-11-13 07:09:23', '2022-11-13 07:09:23'),
(1412, 15, 'PDT-000269', 1.00, 1095.00, 1250.00, 0.00, NULL, '1', 'XpylosqT2FgXCI9WKWdtk6nv75gEXAA2Tja7nzuo', '2022-11-18 13:42:47', '2022-11-18 13:42:47'),
(1426, 1, 'PDT-000188', 1.00, 417.16, 480.00, 0.00, NULL, '1', 'yjRakOAoX2afDUS1DP7nJJ9nEnxZLrtLWiWFWOCi', '2022-11-19 12:43:05', '2022-11-19 12:43:05'),
(1498, 1, 'PDT-000262', 1.00, 77.60, 90.00, 0.00, NULL, '1', 'NkiiLiC2JMjOL7d3UIOwciMtbiMjZdYsP5pNaTil', '2022-11-24 12:19:19', '2022-11-24 12:19:19'),
(1592, 15, 'PDT-000001', 1.00, 3054.90, 0.00, 0.00, NULL, '1', 'mC5fOHEs2NLVScVAN6DuXXxXxp52IsvhvFqxea9f', '2022-12-05 08:40:09', '2022-12-05 08:40:09'),
(1602, 1, 'PDT-000180', 1.00, 596.16, 650.00, 0.00, NULL, '1', 'wgtcZF8mvzjUruxf2qafls7H3MvrX8sDSHbgQURv', '2022-12-06 05:07:08', '2022-12-06 05:07:08'),
(1612, 1, 'PDT-000138', 1.00, 206.36, 225.00, 0.00, NULL, '1', 'GAVtuUiRMuZmKH3gKQMYdno1IvITbjRUoGGpXjji', '2022-12-07 06:10:25', '2022-12-07 06:10:25'),
(1616, 1, 'PDT-000310', 1.00, 1741.55, 2000.00, 0.00, NULL, '1', 'tSF83S9koZ0nU5Rt2QiCcLmNyJyatgm9XAuo6jLd', '2022-12-08 13:03:58', '2022-12-08 13:05:00'),
(1617, 1, 'PDT-000267', 21.00, 21.77, 25.00, 0.00, NULL, '1', 'UEgdlgRxP2GGl1rr8Eh26COVHC02u1vhGx1LN6pc', '2022-12-08 14:09:04', '2022-12-08 14:17:06'),
(1618, 1, 'PDT-000201', 4.00, 111.46, 130.00, 0.00, NULL, '1', 'ckZAun8ZWBbEWv4fo688M0f7y7ywUbkGCxEGOgqc', '2022-12-09 04:46:40', '2022-12-09 04:46:48'),
(1619, 1, 'PDT-000153', 1.00, 75.51, 85.00, 0.00, NULL, '1', 'ckZAun8ZWBbEWv4fo688M0f7y7ywUbkGCxEGOgqc', '2022-12-09 04:47:15', '2022-12-09 04:57:13'),
(1620, 1, 'PDT-000123', 5.00, 16.24, 19.00, 0.00, NULL, '1', 'ckZAun8ZWBbEWv4fo688M0f7y7ywUbkGCxEGOgqc', '2022-12-09 04:47:35', '2022-12-09 04:49:27'),
(1621, 1, 'PDT-000189', 1.00, 172.40, 200.00, 0.00, NULL, '1', 'ckZAun8ZWBbEWv4fo688M0f7y7ywUbkGCxEGOgqc', '2022-12-09 04:48:25', '2022-12-09 04:48:25'),
(1623, 1, 'PDT-000090', 1.00, 31.18, 35.00, 0.00, NULL, '1', 'ckZAun8ZWBbEWv4fo688M0f7y7ywUbkGCxEGOgqc', '2022-12-09 04:59:17', '2022-12-09 04:59:17'),
(1624, 15, 'PDT-000001', 1.00, 3054.90, 0.00, 0.00, NULL, '1', 'fNmJSlxW3kY6kRU0WVVy1hhjkiAWSojVH55AZcM2', '2022-12-09 11:17:37', '2022-12-09 11:17:37'),
(1626, 1, 'PDT-000146', 21.00, 7.82, 10.00, 0.00, NULL, '1', 'IQrXm71uYx3GWR1t1RxxD4Ff7Gqq2Mk5Sn6IJ61W', '2022-12-10 06:22:07', '2022-12-10 06:22:15'),
(1627, 1, 'PDT-000149', 5.00, 3.43, 4.00, 0.00, NULL, '1', 'IQrXm71uYx3GWR1t1RxxD4Ff7Gqq2Mk5Sn6IJ61W', '2022-12-10 06:22:22', '2022-12-10 06:22:26'),
(1628, 1, 'PDT-000125', 7.00, 30.00, 35.00, 0.00, NULL, '1', 'IQrXm71uYx3GWR1t1RxxD4Ff7Gqq2Mk5Sn6IJ61W', '2022-12-10 06:23:12', '2022-12-10 06:23:22'),
(1629, 1, 'PDT-000123', 3.00, 16.24, 19.00, 0.00, NULL, '1', 'IQrXm71uYx3GWR1t1RxxD4Ff7Gqq2Mk5Sn6IJ61W', '2022-12-10 06:31:17', '2022-12-10 06:32:07'),
(1638, 1, 'PDT-000069', 2.00, 3290.62, 3500.00, 0.00, NULL, '1', '4uRYgWkzKJxZ0p4E0gOqwUF5tkcuGH5Z99NwUfjJ', '2022-12-10 14:14:20', '2022-12-10 14:18:49'),
(1640, 1, 'PDT-000107', 10.00, 161.87, 170.00, 0.00, NULL, '1', '4uRYgWkzKJxZ0p4E0gOqwUF5tkcuGH5Z99NwUfjJ', '2022-12-10 14:15:49', '2022-12-10 14:15:59'),
(1642, 1, 'PDT-000093', 1.00, 157.29, 180.00, 0.00, NULL, '1', 'jeglX7S9MvYhk0heMK6yXFRXNuGmu9oqfgZwOqre', '2022-12-11 13:43:26', '2022-12-11 13:43:26'),
(1643, 1, 'PDT-000114', 1.00, 336.00, 360.00, 0.00, NULL, '1', '0icBGbBD5mN0VLuacA1EGADMCPBFT0KE4wrBzGpv', '2022-12-12 05:11:44', '2022-12-12 05:11:44'),
(1644, 1, 'PDT-000045', 1.00, 869.16, 950.00, 0.00, NULL, '1', '0icBGbBD5mN0VLuacA1EGADMCPBFT0KE4wrBzGpv', '2022-12-12 05:19:01', '2022-12-12 05:19:01'),
(1645, 1, 'PDT-000254', 1.00, 309.00, 450.00, 0.00, NULL, '1', '0icBGbBD5mN0VLuacA1EGADMCPBFT0KE4wrBzGpv', '2022-12-12 05:20:00', '2022-12-12 05:20:00'),
(1646, 1, 'PDT-000266', 1.00, 9.21, 12.00, 0.00, NULL, '1', '0icBGbBD5mN0VLuacA1EGADMCPBFT0KE4wrBzGpv', '2022-12-12 06:02:09', '2022-12-12 06:02:09'),
(1649, 1, 'PDT-000123', 6.00, 16.24, 19.00, 0.00, NULL, '1', 'CAM7Hs3OfKAeFLAeALrGkzleVlRUm5mfcluVnKYk', '2022-12-12 11:54:34', '2022-12-12 11:54:41'),
(1650, 1, 'PDT-000149', 3.00, 3.43, 4.00, 0.00, NULL, '1', 'CAM7Hs3OfKAeFLAeALrGkzleVlRUm5mfcluVnKYk', '2022-12-12 11:54:50', '2022-12-12 11:54:57'),
(1651, 1, 'PDT-000146', 9.00, 7.82, 10.00, 0.00, NULL, '1', 'CAM7Hs3OfKAeFLAeALrGkzleVlRUm5mfcluVnKYk', '2022-12-12 11:55:05', '2022-12-12 11:55:21'),
(1652, 1, 'PDT-000174', 1.00, 550.00, 590.00, 0.00, NULL, '1', 'CAM7Hs3OfKAeFLAeALrGkzleVlRUm5mfcluVnKYk', '2022-12-12 11:58:10', '2022-12-12 11:58:10'),
(1653, 1, 'PDT-000244', 1.00, 83.75, 95.00, 0.00, NULL, '1', 'CAM7Hs3OfKAeFLAeALrGkzleVlRUm5mfcluVnKYk', '2022-12-12 11:58:56', '2022-12-12 11:58:56'),
(1654, 1, 'PDT-000117', 1.00, 20.89, 23.00, 0.00, NULL, '1', 'CAM7Hs3OfKAeFLAeALrGkzleVlRUm5mfcluVnKYk', '2022-12-12 12:25:12', '2022-12-12 12:25:12'),
(1659, 1, 'PDT-000209', 1.00, 242.50, 265.00, 0.00, NULL, '1', 'ifTJozxG1aSn6Y4GfuX1tQXt8ej2Alyckz2xYdt4', '2022-12-13 06:16:43', '2022-12-13 06:16:43'),
(1660, 1, 'PDT-000241', 1.00, 77.94, 87.00, 0.00, NULL, '1', 'ifTJozxG1aSn6Y4GfuX1tQXt8ej2Alyckz2xYdt4', '2022-12-13 06:16:55', '2022-12-13 06:16:55'),
(1661, 1, 'PDT-000036', 1.00, 286.65, 310.00, 0.00, NULL, '1', 'ifTJozxG1aSn6Y4GfuX1tQXt8ej2Alyckz2xYdt4', '2022-12-13 06:21:34', '2022-12-13 06:21:34'),
(1662, 1, 'PDT-000191', 1.00, 292.50, 335.00, 0.00, NULL, '1', '2R4AUxfluyEqh7PWKs9TLQ15Qxi12w6KcZTM9SFJ', '2022-12-13 10:47:37', '2022-12-13 10:47:37'),
(1663, 1, 'PDT-000117', 1.00, 20.89, 23.00, 0.00, NULL, '1', 'FVSVR5GMPS1lRt8BRB68ey1n9TfxJj02BplJcvWv', '2022-12-14 06:23:55', '2022-12-14 06:23:55'),
(1664, 1, 'PDT-000261', 1.00, 290.91, 370.00, 0.00, NULL, '1', 'FVSVR5GMPS1lRt8BRB68ey1n9TfxJj02BplJcvWv', '2022-12-14 06:24:40', '2022-12-14 06:24:40'),
(1665, 1, 'PDT-000050', 1.00, 81.96, 100.00, 0.00, NULL, '1', 'oLpWQ4sqQXQng6ScxZQfLVvGeCv4RjypLeCsuWzp', '2022-12-14 06:57:02', '2022-12-14 06:57:02'),
(1666, 1, 'PDT-000032', 40.00, 5.56, 6.00, 0.00, NULL, '1', 'oLpWQ4sqQXQng6ScxZQfLVvGeCv4RjypLeCsuWzp', '2022-12-14 07:06:15', '2022-12-14 07:07:09'),
(1667, 1, 'PDT-000028', 40.00, 2.59, 3.00, 0.00, NULL, '1', 'oLpWQ4sqQXQng6ScxZQfLVvGeCv4RjypLeCsuWzp', '2022-12-14 07:08:21', '2022-12-14 07:08:31'),
(1668, 1, 'PDT-000161', 1.00, 950.00, 1100.00, 0.00, NULL, '1', 'xV8ZEccTE9sQxNO9MuVvKxPRG3Z02Qbzott3gkpu', '2022-12-14 12:28:28', '2022-12-14 12:28:28'),
(1669, 1, 'PDT-000235', 1.00, 405.82, 445.00, 0.00, NULL, '1', 'xV8ZEccTE9sQxNO9MuVvKxPRG3Z02Qbzott3gkpu', '2022-12-14 12:28:48', '2022-12-14 12:28:48'),
(1670, 1, 'PDT-000037', 40.00, 8.62, 10.00, 0.00, NULL, '1', 'xV8ZEccTE9sQxNO9MuVvKxPRG3Z02Qbzott3gkpu', '2022-12-14 12:29:09', '2022-12-14 12:30:56'),
(1671, 1, 'PDT-000017', 42.00, 4.06, 5.00, 0.00, NULL, '1', 'xV8ZEccTE9sQxNO9MuVvKxPRG3Z02Qbzott3gkpu', '2022-12-14 12:29:30', '2022-12-14 12:31:28'),
(1672, 1, 'PDT-000089', 11.00, 18.38, 22.00, 0.00, NULL, '1', 'xV8ZEccTE9sQxNO9MuVvKxPRG3Z02Qbzott3gkpu', '2022-12-14 12:30:11', '2022-12-14 12:31:08'),
(1673, 1, 'PDT-000314', 12.00, 26.40, 30.00, 0.00, NULL, '1', 'xV8ZEccTE9sQxNO9MuVvKxPRG3Z02Qbzott3gkpu', '2022-12-14 12:30:30', '2022-12-14 12:32:52'),
(1686, 1, 'PDT-000191', 1.00, 292.50, 320.00, 0.00, NULL, '1', 'K33ZlVCDNvdsLWCtuZlrOubyROqjqTM69QmPXqIb', '2022-12-16 14:08:57', '2022-12-16 14:13:58'),
(1687, 1, 'PDT-000028', 20.00, 2.59, 3.00, 0.00, NULL, '1', 'K33ZlVCDNvdsLWCtuZlrOubyROqjqTM69QmPXqIb', '2022-12-16 14:09:43', '2022-12-16 14:11:05'),
(1688, 1, 'PDT-000188', 1.00, 417.16, 480.00, 0.00, NULL, '1', 'K33ZlVCDNvdsLWCtuZlrOubyROqjqTM69QmPXqIb', '2022-12-16 14:13:43', '2022-12-16 14:13:43'),
(1689, 1, 'PDT-000306', 1.00, 187.09, 235.00, 0.00, NULL, '1', 'K33ZlVCDNvdsLWCtuZlrOubyROqjqTM69QmPXqIb', '2022-12-16 14:14:22', '2022-12-16 14:14:22'),
(1691, 1, 'PDT-000094', 1.00, 729.37, 800.00, 0.00, NULL, '1', 'w45bgJ3dz9SWgEMeNTqB1v6SzH1OmCurNadAVA6K', '2022-12-17 11:02:53', '2022-12-17 11:02:53'),
(1694, 1, 'PDT-000075', 1.00, 383.15, 430.00, 0.00, NULL, '1', 'GYTA0x4HTWxWJEgoZYJMSgbwyg4Fd8htvaGtGoYp', '2022-12-17 13:43:18', '2022-12-17 13:43:18'),
(1695, 1, 'PDT-000025', 1.00, 408.92, 440.00, 0.00, NULL, '1', 'GYTA0x4HTWxWJEgoZYJMSgbwyg4Fd8htvaGtGoYp', '2022-12-17 13:43:29', '2022-12-17 13:43:29'),
(1696, 1, 'PDT-000023', 1.00, 208.93, 265.00, 0.00, NULL, '1', 'Gq3BCn62KtzW0UHJyluE2sZCx3bsiE6kPbsTDnZK', '2022-12-17 17:45:03', '2022-12-17 17:45:03'),
(1697, 1, 'PDT-000045', 1.00, 869.16, 950.00, 0.00, NULL, '1', '0ee7SdYiE5vUejUF9a5jos6UezdlNzNPGahSA4OW', '2022-12-18 05:06:24', '2022-12-18 05:06:24'),
(1698, 1, 'PDT-000062', 1.00, 172.67, 195.00, 0.00, NULL, '1', '0ee7SdYiE5vUejUF9a5jos6UezdlNzNPGahSA4OW', '2022-12-18 05:06:38', '2022-12-18 05:06:38'),
(1699, 1, 'PDT-000033', 1.00, 582.58, 630.00, 0.00, NULL, '1', '0ee7SdYiE5vUejUF9a5jos6UezdlNzNPGahSA4OW', '2022-12-18 05:06:54', '2022-12-18 05:06:54'),
(1700, 1, 'PDT-000075', 1.00, 383.15, 430.00, 0.00, NULL, '1', '0ee7SdYiE5vUejUF9a5jos6UezdlNzNPGahSA4OW', '2022-12-18 05:12:46', '2022-12-18 05:12:46'),
(1701, 1, 'PDT-000127', 9.00, 15.79, 18.00, 0.00, NULL, '1', '0ee7SdYiE5vUejUF9a5jos6UezdlNzNPGahSA4OW', '2022-12-18 06:05:05', '2022-12-18 06:06:16'),
(1702, 1, 'PDT-000023', 1.00, 208.93, 265.00, 0.00, NULL, '1', '0ee7SdYiE5vUejUF9a5jos6UezdlNzNPGahSA4OW', '2022-12-18 06:08:25', '2022-12-18 06:08:25'),
(1703, 1, 'PDT-000043', 1.00, 116.78, 140.00, 0.00, NULL, '1', '0ee7SdYiE5vUejUF9a5jos6UezdlNzNPGahSA4OW', '2022-12-18 06:08:51', '2022-12-18 06:08:51'),
(1704, 1, 'PDT-000143', 1.00, 63.09, 70.00, 0.00, NULL, '1', '0ee7SdYiE5vUejUF9a5jos6UezdlNzNPGahSA4OW', '2022-12-18 06:12:01', '2022-12-18 06:12:01'),
(1705, 1, 'PDT-000163', 1.00, 291.00, 320.00, 0.00, NULL, '1', '0ee7SdYiE5vUejUF9a5jos6UezdlNzNPGahSA4OW', '2022-12-18 06:13:38', '2022-12-18 06:13:38'),
(1706, 1, 'PDT-000066', 1.00, 265.89, 310.00, 0.00, NULL, '1', 'iCn5o5UYvCjxjhOfXJZBfwvgHJZWtnSBHHWhKRE6', '2022-12-18 11:17:22', '2022-12-18 11:17:22'),
(1707, 1, 'PDT-000060', 1.00, 187.09, 200.00, 0.00, NULL, '1', 'iCn5o5UYvCjxjhOfXJZBfwvgHJZWtnSBHHWhKRE6', '2022-12-18 11:18:06', '2022-12-18 11:18:06'),
(1708, 1, 'PDT-000065', 1.00, 66.82, 85.00, 0.00, NULL, '1', 'iCn5o5UYvCjxjhOfXJZBfwvgHJZWtnSBHHWhKRE6', '2022-12-18 11:19:00', '2022-12-18 11:19:00'),
(1709, 1, 'PDT-000046', 1.00, 99.78, 120.00, 0.00, NULL, '1', 'iCn5o5UYvCjxjhOfXJZBfwvgHJZWtnSBHHWhKRE6', '2022-12-18 11:20:47', '2022-12-18 11:20:47'),
(1710, 1, 'PDT-000058', 1.00, 83.78, 100.00, 0.00, NULL, '1', 'iCn5o5UYvCjxjhOfXJZBfwvgHJZWtnSBHHWhKRE6', '2022-12-18 11:21:00', '2022-12-18 11:21:00'),
(1711, 1, 'PDT-000309', 1.00, 771.00, 900.00, 0.00, NULL, '1', 'iCn5o5UYvCjxjhOfXJZBfwvgHJZWtnSBHHWhKRE6', '2022-12-18 11:33:52', '2022-12-18 11:33:52'),
(1712, 1, 'PDT-000119', 1.00, 336.36, 370.00, 0.00, NULL, '1', 'Ju311H7172GvjyX2X2fMTN2KEcy8MWictRQ6ruJe', '2022-12-20 09:30:12', '2022-12-20 09:31:41'),
(1713, 1, 'PDT-000154', 1.00, 166.10, 185.00, 0.00, NULL, '1', 'Ju311H7172GvjyX2X2fMTN2KEcy8MWictRQ6ruJe', '2022-12-20 09:30:26', '2022-12-20 09:30:26'),
(1714, 1, 'PDT-000132', 1.00, 93.84, 105.00, 0.00, NULL, '1', 'Ju311H7172GvjyX2X2fMTN2KEcy8MWictRQ6ruJe', '2022-12-20 09:30:33', '2022-12-20 09:30:33'),
(1715, 1, 'PDT-000314', 4.00, 26.40, 30.00, 0.00, NULL, '1', 'Ju311H7172GvjyX2X2fMTN2KEcy8MWictRQ6ruJe', '2022-12-20 09:31:06', '2022-12-20 09:31:16'),
(1716, 1, 'PDT-000184', 1.00, 218.18, 240.00, 0.00, NULL, '1', 'v6XeG2geGPa8frs06wdLN3XMaVCasHUEvdv1sqmv', '2022-12-20 12:00:18', '2022-12-20 12:00:18'),
(1717, 1, 'PDT-000166', 1.00, 30.02, 35.00, 0.00, NULL, '1', 'sIwRsAW5R00hrbS4AtvKkSuAHYkV358I9AAHeQu8', '2022-12-21 04:47:32', '2022-12-21 04:47:32'),
(1718, 1, 'PDT-000219', 1.00, 86.24, 95.00, 0.00, NULL, '1', 'sIwRsAW5R00hrbS4AtvKkSuAHYkV358I9AAHeQu8', '2022-12-21 05:25:37', '2022-12-21 05:25:37'),
(1719, 1, 'PDT-000106', 1.00, 13.75, 15.00, 0.00, NULL, '1', 'qYi0urDUm9OMWMv5jeFSjh95HihhM3CannuVEGwH', '2022-12-21 11:20:17', '2022-12-21 11:20:17'),
(1720, 1, 'PDT-000026', 1.00, 31.76, 35.00, 0.00, NULL, '1', 'qYi0urDUm9OMWMv5jeFSjh95HihhM3CannuVEGwH', '2022-12-21 11:20:43', '2022-12-21 11:20:43'),
(1721, 1, 'PDT-000191', 1.00, 292.50, 335.00, 0.00, NULL, '1', 'qYi0urDUm9OMWMv5jeFSjh95HihhM3CannuVEGwH', '2022-12-21 13:06:46', '2022-12-21 13:06:46'),
(1722, 1, 'PDT-000309', 1.00, 771.00, 900.00, 0.00, NULL, '1', 'WTFskZAvLuh7TEUmdboa4Oyn8We4iXKhHG7yP1nt', '2022-12-22 05:42:01', '2022-12-22 05:42:01'),
(1723, 1, 'PDT-000020', 1.00, 155.61, 170.00, 0.00, NULL, '1', 'WTFskZAvLuh7TEUmdboa4Oyn8We4iXKhHG7yP1nt', '2022-12-22 05:42:20', '2022-12-22 05:42:20'),
(1724, 1, 'PDT-000261', 1.00, 290.91, 370.00, 0.00, NULL, '1', 'WTFskZAvLuh7TEUmdboa4Oyn8We4iXKhHG7yP1nt', '2022-12-22 05:58:01', '2022-12-22 05:58:01'),
(1725, 1, 'PDT-000233', 1.00, 320.85, 350.00, 0.00, NULL, '1', '6EMo2MzPnn8asd802lJsPeL7NaU9R7JtHsATv07M', '2022-12-23 05:56:48', '2022-12-23 05:56:48'),
(1726, 1, 'PDT-000063', 1.00, 279.74, 300.00, 0.00, NULL, '1', '6EMo2MzPnn8asd802lJsPeL7NaU9R7JtHsATv07M', '2022-12-23 06:01:51', '2022-12-23 06:01:51'),
(1728, 1, 'PDT-000129', 2.00, 796.41, 860.00, 0.00, NULL, '1', 'biguqlZDR2SBMYxDJVQl5SThU4KQeUes07KVdN3o', '2022-12-23 06:55:44', '2022-12-23 06:55:53'),
(1731, 1, 'PDT-000064', 2.00, 1271.33, 1450.00, 0.00, NULL, '1', 'biguqlZDR2SBMYxDJVQl5SThU4KQeUes07KVdN3o', '2022-12-23 07:00:58', '2022-12-23 07:04:01'),
(1732, 1, 'PDT-000157', 1.00, 190.00, 210.00, 0.00, NULL, '1', 'oI9YZ0mEvIx48Yo6oLvYAaETIIv0IIzlrgwBuQcm', '2022-12-23 10:35:30', '2022-12-23 10:35:30'),
(1734, 1, 'PDT-000040', 1.00, 69.30, 85.00, 0.00, NULL, '1', 'TO7Du7MNmL6ScX4wB81RSEwbXvyrmD4zuwDngmlZ', '2022-12-24 05:03:28', '2022-12-24 05:03:28'),
(1735, 1, 'PDT-000148', 60.00, 1.95, 2.20, 0.00, NULL, '1', 'TO7Du7MNmL6ScX4wB81RSEwbXvyrmD4zuwDngmlZ', '2022-12-24 05:03:40', '2022-12-24 05:04:09'),
(1736, 1, 'PDT-000064', 1.00, 1271.33, 1450.00, 0.00, NULL, '1', 'TO7Du7MNmL6ScX4wB81RSEwbXvyrmD4zuwDngmlZ', '2022-12-24 05:41:51', '2022-12-24 05:41:51'),
(1737, 1, 'PDT-000105', 5.00, 354.68, 385.00, 0.00, NULL, '1', 'TO7Du7MNmL6ScX4wB81RSEwbXvyrmD4zuwDngmlZ', '2022-12-24 05:42:17', '2022-12-24 05:42:35'),
(1738, 1, 'PDT-000066', 1.00, 265.89, 310.00, 0.00, NULL, '1', 'tdVdEhzIxatUfaRMf4rxvHKq0aoI0sjuYFyYh2BF', '2022-12-24 10:52:31', '2022-12-24 10:52:31'),
(1739, 1, 'PDT-000044', 1.00, 806.27, 900.00, 0.00, NULL, '1', 'tdVdEhzIxatUfaRMf4rxvHKq0aoI0sjuYFyYh2BF', '2022-12-24 10:53:01', '2022-12-24 10:53:01'),
(1740, 1, 'PDT-000309', 1.00, 771.00, 900.00, 0.00, NULL, '1', 'tdVdEhzIxatUfaRMf4rxvHKq0aoI0sjuYFyYh2BF', '2022-12-24 10:53:41', '2022-12-24 10:53:41'),
(1741, 1, 'PDT-000058', 1.00, 83.78, 100.00, 0.00, NULL, '1', 'tdVdEhzIxatUfaRMf4rxvHKq0aoI0sjuYFyYh2BF', '2022-12-24 10:54:02', '2022-12-24 10:54:02'),
(1742, 1, 'PDT-000065', 1.00, 66.82, 85.00, 0.00, NULL, '1', 'tdVdEhzIxatUfaRMf4rxvHKq0aoI0sjuYFyYh2BF', '2022-12-24 10:54:46', '2022-12-24 10:54:46'),
(1743, 1, 'PDT-000046', 1.00, 99.78, 120.00, 0.00, NULL, '1', 'tdVdEhzIxatUfaRMf4rxvHKq0aoI0sjuYFyYh2BF', '2022-12-24 10:55:22', '2022-12-24 10:55:22'),
(1744, 1, 'PDT-000094', 1.00, 729.37, 800.00, 0.00, NULL, '1', 'uPf6VF3Py4aOQ8YIvqsCXQx7nVLRTh4mKNxxJpmT', '2022-12-26 04:45:29', '2022-12-26 04:45:29'),
(1745, 1, 'PDT-000077', 1.00, 1506.82, 1630.00, 0.00, NULL, '1', 'uPf6VF3Py4aOQ8YIvqsCXQx7nVLRTh4mKNxxJpmT', '2022-12-26 04:45:46', '2022-12-26 04:45:46'),
(1746, 1, 'PDT-000044', 1.00, 806.27, 900.00, 0.00, NULL, '1', 'uPf6VF3Py4aOQ8YIvqsCXQx7nVLRTh4mKNxxJpmT', '2022-12-26 04:46:18', '2022-12-26 04:46:18'),
(1747, 1, 'PDT-000111', 1.00, 480.00, 510.00, 0.00, NULL, '1', 'uPf6VF3Py4aOQ8YIvqsCXQx7nVLRTh4mKNxxJpmT', '2022-12-26 06:15:48', '2022-12-26 06:15:48'),
(1748, 1, 'PDT-000018', 1.00, 171.61, 188.00, 0.00, NULL, '1', 'uPf6VF3Py4aOQ8YIvqsCXQx7nVLRTh4mKNxxJpmT', '2022-12-26 06:16:13', '2022-12-26 06:16:13'),
(1749, 1, 'PDT-000042', 1.00, 192.53, 220.00, 0.00, NULL, '1', 'uPf6VF3Py4aOQ8YIvqsCXQx7nVLRTh4mKNxxJpmT', '2022-12-26 06:17:02', '2022-12-26 06:17:02'),
(1750, 1, 'PDT-000114', 1.00, 336.00, 360.00, 0.00, NULL, '1', 'uPf6VF3Py4aOQ8YIvqsCXQx7nVLRTh4mKNxxJpmT', '2022-12-26 06:17:26', '2022-12-26 06:17:26'),
(1754, 1, 'PDT-000164', 1.00, 10.14, 12.00, 0.00, NULL, '1', 'SUZDnbc8SbQcSVTDY8yuk8hP3FYnORwJdC0c5Wkr', '2022-12-28 05:59:46', '2022-12-28 05:59:46'),
(1755, 1, 'PDT-000062', 1.00, 172.67, 195.00, 0.00, NULL, '1', 'utbHau87OwITZQoc2KotfsOLVtaN4r8Yud7RgEeT', '2022-12-28 13:52:24', '2022-12-28 13:52:24'),
(1764, 1, 'PDT-000243', 5.00, 87.56, 97.00, 0.00, NULL, '1', '99l9FFH8oyaJ4rP9ccvawFI8EIIWeRVIfAnniYmc', '2022-12-29 12:35:00', '2022-12-29 12:37:33'),
(1765, 1, 'PDT-000019', 1.00, 367.00, 395.00, 0.00, NULL, '1', '99l9FFH8oyaJ4rP9ccvawFI8EIIWeRVIfAnniYmc', '2022-12-29 12:36:53', '2022-12-29 12:36:53'),
(1766, 1, 'PDT-000323', 1.00, 86.10, 95.00, 0.00, NULL, '1', '99l9FFH8oyaJ4rP9ccvawFI8EIIWeRVIfAnniYmc', '2022-12-29 12:38:05', '2022-12-29 12:38:05'),
(1767, 1, 'PDT-000229', 1.00, 971.09, 1050.00, 0.00, NULL, '1', 'YF758LPMt4K7QcnJAqTZ3lB4m5nVrOU6ZtxuKMgK', '2022-12-30 10:40:13', '2022-12-30 10:40:13'),
(1768, 1, 'PDT-000191', 1.00, 292.50, 335.00, 0.00, NULL, '1', 'YF758LPMt4K7QcnJAqTZ3lB4m5nVrOU6ZtxuKMgK', '2022-12-30 10:40:28', '2022-12-30 10:40:28'),
(1769, 1, 'PDT-000315', 1.00, 249.80, 270.00, 0.00, NULL, '1', 'F3jhFc0OvWR3DdD5jsvFxcbm5WQFfECv7abYO7Zf', '2022-12-30 13:21:06', '2022-12-30 13:21:06'),
(1770, 1, 'PDT-000318', 1.00, 149.90, 185.00, 0.00, NULL, '1', 'F3jhFc0OvWR3DdD5jsvFxcbm5WQFfECv7abYO7Zf', '2022-12-30 13:32:17', '2022-12-30 13:32:17'),
(1771, 1, 'PDT-000291', 1.00, 124.20, 145.00, 0.00, NULL, '1', 'F3jhFc0OvWR3DdD5jsvFxcbm5WQFfECv7abYO7Zf', '2022-12-30 13:32:32', '2022-12-30 13:32:32'),
(1772, 1, 'PDT-000093', 1.00, 157.29, 180.00, 0.00, NULL, '1', 'F3jhFc0OvWR3DdD5jsvFxcbm5WQFfECv7abYO7Zf', '2022-12-30 13:32:40', '2022-12-30 13:32:40'),
(1773, 1, 'PDT-000191', 1.00, 292.50, 335.00, 0.00, NULL, '1', 'PrKJBN1FsLsNeThXsh4ONIgPa43R3QH5g5hV2AwM', '2022-12-31 10:27:43', '2022-12-31 10:27:43'),
(1775, 1, 'PDT-000230', 1.00, 257.51, 390.00, 0.00, NULL, '1', 'ErNmBQWo0VIioHwmmZaN9A5XFHb4wa6rQygGi3As', '2023-01-01 05:45:36', '2023-01-01 05:45:36'),
(1777, 1, 'PDT-000162', 1.00, 807.88, 860.00, 0.00, NULL, '1', 'ErNmBQWo0VIioHwmmZaN9A5XFHb4wa6rQygGi3As', '2023-01-01 05:47:07', '2023-01-01 05:47:07'),
(1778, 1, 'PDT-000316', 1.00, 156.40, 195.00, 0.00, NULL, '1', 'ErNmBQWo0VIioHwmmZaN9A5XFHb4wa6rQygGi3As', '2023-01-01 06:01:22', '2023-01-01 06:01:22'),
(1779, 1, 'PDT-000194', 1.00, 58.50, 65.00, 0.00, NULL, '1', 'ErNmBQWo0VIioHwmmZaN9A5XFHb4wa6rQygGi3As', '2023-01-01 06:07:52', '2023-01-01 06:07:52'),
(1780, 1, 'PDT-000035', 1.00, 128.52, 150.00, 0.00, NULL, '1', 'Nd3ytnIsYJrSODYlOojLhcM2pyQY1OlBr2ERVlMo', '2023-01-01 07:13:52', '2023-01-01 07:13:52'),
(1781, 1, 'PDT-000043', 1.00, 116.78, 140.00, 0.00, NULL, '1', 'Nd3ytnIsYJrSODYlOojLhcM2pyQY1OlBr2ERVlMo', '2023-01-01 07:14:13', '2023-01-01 07:14:13'),
(1792, 1, 'PDT-000150', 40.00, 3.85, 4.00, 0.00, NULL, '1', '8lFPKbIlbReKd9Aoxmy1JkQX02bk5wOmPQg4Y8jv', '2023-01-01 12:12:28', '2023-01-01 12:12:39'),
(1793, 1, 'PDT-000305', 1.00, 181.07, 220.00, 0.00, NULL, '1', 'JjXJNwbY45adblR5sRIQbJjL8b45QRpJg3w3Qyg5', '2023-01-01 12:43:28', '2023-01-01 12:43:28'),
(1794, 1, 'PDT-000199', 1.00, 465.33, 500.00, 0.00, NULL, '1', 'JjXJNwbY45adblR5sRIQbJjL8b45QRpJg3w3Qyg5', '2023-01-01 12:44:23', '2023-01-01 12:44:23'),
(1795, 1, 'PDT-000193', 10.00, 10.50, 12.00, 0.00, NULL, '1', 'JjXJNwbY45adblR5sRIQbJjL8b45QRpJg3w3Qyg5', '2023-01-01 12:44:33', '2023-01-01 12:44:41'),
(1796, 1, 'PDT-000325', 1.00, 485.00, 585.00, 0.00, NULL, '1', 'JjXJNwbY45adblR5sRIQbJjL8b45QRpJg3w3Qyg5', '2023-01-01 12:44:53', '2023-01-01 12:44:53'),
(1798, 1, 'PDT-000241', 1.00, 77.94, 87.00, 0.00, NULL, '1', 'mrxNAW1oVpPQwOL7Pirhb9u0sjsVTzzbnIXGqHhj', '2023-01-02 12:25:57', '2023-01-02 12:25:57'),
(1799, 1, 'PDT-000018', 1.00, 171.61, 188.00, 0.00, NULL, '1', 'FsF0VKyHdtBDfC76VUktpilWjyaqF9PJjBlRgwO6', '2023-01-02 13:55:57', '2023-01-02 13:55:57'),
(1801, 1, 'PDT-000334', 2.00, 351.11, 395.00, 0.00, NULL, '1', 'GUum8LcrvbJzAwgYCRZw04jgxYTP7v0mRkpGnW8C', '2023-01-03 11:26:59', '2023-01-03 11:27:41'),
(1803, 15, 'PDT-000009', 2.00, 2845.00, 0.00, 0.00, NULL, '1', '3sP3iB3YoCkVFAl81oly4outDwchFoFob4lfIoAc', '2023-01-04 04:06:58', '2023-01-04 04:07:00'),
(1804, 15, 'PDT-000011', 2.00, 900.00, 1050.00, 0.00, NULL, '1', '3sP3iB3YoCkVFAl81oly4outDwchFoFob4lfIoAc', '2023-01-04 04:07:01', '2023-01-04 04:09:18'),
(1806, 1, 'PDT-000169', 1.00, 8.39, 10.00, 0.00, NULL, '1', '9Tu53hcGKW1V7iFrZEJ9hYz5tLkru49DjacW16XA', '2023-01-04 12:19:29', '2023-01-04 12:19:29'),
(1807, 1, 'PDT-000256', 1.00, 1250.00, 1400.00, 0.00, NULL, '1', 'KJhEvDAP8YIvZe1I5MMjzEcNuerFpRcfQ4R9VQsa', '2023-01-05 05:32:13', '2023-01-05 05:32:13'),
(1808, 1, 'PDT-000119', 1.00, 336.36, 370.00, 0.00, NULL, '1', 'KJhEvDAP8YIvZe1I5MMjzEcNuerFpRcfQ4R9VQsa', '2023-01-05 05:32:33', '2023-01-05 05:32:33'),
(1809, 1, 'PDT-000294', 1.00, 335.32, 355.00, 0.00, NULL, '1', 'U8Jj7ovJrgXcXw8Gm7GYq4DRWrGCY2JGxqKroEAk', '2023-01-05 13:15:47', '2023-01-05 13:15:47'),
(1810, 1, 'PDT-000145', 20.00, 15.05, 17.00, 0.00, NULL, '1', 'U8Jj7ovJrgXcXw8Gm7GYq4DRWrGCY2JGxqKroEAk', '2023-01-05 13:16:00', '2023-01-05 13:16:18'),
(1811, 1, 'PDT-000132', 1.00, 93.84, 105.00, 0.00, NULL, '1', 'U8Jj7ovJrgXcXw8Gm7GYq4DRWrGCY2JGxqKroEAk', '2023-01-05 13:16:45', '2023-01-05 13:16:45');

-- --------------------------------------------------------

--
-- Table structure for table `sales_entry`
--

CREATE TABLE `sales_entry` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_no` varchar(15) DEFAULT NULL,
  `product_id` varchar(15) NOT NULL,
  `sub_unit_id` varchar(10) DEFAULT NULL,
  `product_quantity` double(11,2) NOT NULL,
  `product_purchase_price` double(11,2) DEFAULT NULL,
  `product_sales_price` double(11,2) NOT NULL,
  `product_discount_amount` varchar(191) NOT NULL,
  `return_quantity` double(11,2) NOT NULL DEFAULT 0.00,
  `entry_date` varchar(20) DEFAULT NULL,
  `branch_id` varchar(11) DEFAULT NULL,
  `note` varchar(191) DEFAULT NULL,
  `status` int(2) DEFAULT 0,
  `admin_id` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_entry`
--

INSERT INTO `sales_entry` (`id`, `invoice_no`, `product_id`, `sub_unit_id`, `product_quantity`, `product_purchase_price`, `product_sales_price`, `product_discount_amount`, `return_quantity`, `entry_date`, `branch_id`, `note`, `status`, `admin_id`, `created_at`, `updated_at`) VALUES
(6088, 'SI-0000001', 'PDT-000026', '1', 1.00, 31.76, 35.00, '0', 0.00, '2022-10-03', '1', NULL, 0, '1', '2022-10-03 13:19:37', '2022-10-12 11:15:30'),
(6089, 'SI-0000001', 'PDT-000106', '1', 1.00, 13.75, 15.00, '0', 0.00, '2022-10-03', '1', NULL, 0, '1', '2022-10-03 13:19:37', '2022-10-12 11:15:30'),
(6090, 'SI-0000002', 'PDT-000254', '1', 2.00, 309.00, 450.00, '0', 0.00, '2022-10-03', '1', NULL, 0, '1', '2022-10-03 13:23:30', '2022-10-12 11:15:30'),
(6091, 'SI-0000002', 'PDT-000043', '1', 2.00, 116.78, 140.00, '0', 0.00, '2022-10-03', '1', NULL, 0, '1', '2022-10-03 13:23:30', '2022-10-12 11:15:30'),
(6092, 'SI-0000002', 'PDT-000088', '1', 4.00, 85.96, 100.00, '0', 0.00, '2022-10-03', '1', NULL, 0, '1', '2022-10-03 13:23:30', '2022-10-12 11:15:30'),
(6093, 'SI-0000003', 'PDT-000054', '1', 3.00, 624.92, 710.00, '0', 0.00, '2022-10-03', '1', NULL, 0, '1', '2022-10-03 13:35:46', '2022-10-12 11:15:30'),
(6094, 'SI-0000003', 'PDT-000107', '1', 8.00, 161.87, 170.00, '0', 0.00, '2022-10-03', '1', NULL, 0, '1', '2022-10-03 13:35:47', '2022-10-12 11:15:30'),
(6095, 'SI-0000003', 'PDT-000088', '1', 8.00, 85.96, 100.00, '0', 0.00, '2022-10-03', '1', NULL, 0, '1', '2022-10-03 13:35:47', '2022-10-12 11:15:30'),
(6101, 'SI-0000004', 'PDT-000230', '1', 1.00, 362.70, 390.00, '0', 0.00, '2022-10-03', '1', NULL, 0, '1', '2022-10-03 13:55:45', '2022-10-12 11:15:30'),
(6102, 'SI-0000004', 'PDT-000217', '1', 1.00, 118.95, 135.00, '0', 0.00, '2022-10-03', '1', NULL, 0, '1', '2022-10-03 13:55:45', '2022-10-12 11:15:30'),
(6103, 'SI-0000004', 'PDT-000164', '1', 10.00, 10.14, 12.00, '0', 0.00, '2022-10-03', '1', NULL, 0, '1', '2022-10-03 13:55:45', '2022-10-12 11:15:30'),
(6104, 'SI-0000004', 'PDT-000242', '1', 1.00, 76.13, 85.00, '0', 0.00, '2022-10-03', '1', NULL, 0, '1', '2022-10-03 13:55:45', '2022-10-12 11:15:30'),
(6105, 'SI-0000004', 'PDT-000232', '1', 1.00, 539.40, 600.00, '0', 0.00, '2022-10-03', '1', NULL, 0, '1', '2022-10-03 13:55:45', '2022-10-12 11:15:30'),
(6106, 'SI-0000005', 'PDT-000030', '1', 2.00, 87.75, 100.00, '0', 0.00, '2022-10-04', '1', NULL, 0, '1', '2022-10-04 04:37:40', '2022-10-12 11:15:31'),
(6107, 'SI-0000005', 'PDT-000253', '1', 1.00, 272.81, 285.00, '0', 0.00, '2022-10-04', '1', NULL, 0, '1', '2022-10-04 04:37:40', '2022-10-12 11:15:31'),
(6108, 'SI-0000006', 'PDT-000149', '1', 4.00, 3.43, 4.00, '0', 0.00, '2022-10-04', '1', NULL, 0, '1', '2022-10-04 04:41:18', '2022-10-12 11:15:31'),
(6109, 'SI-0000006', 'PDT-000177', '1', 1.00, 30.11, 33.00, '0', 0.00, '2022-10-04', '1', NULL, 0, '1', '2022-10-04 04:41:18', '2022-10-12 11:15:31'),
(6110, 'SI-0000007', 'PDT-000079', '1', 5.00, 241.18, 250.00, '0', 0.00, '2022-10-04', '1', NULL, 0, '1', '2022-10-04 11:40:08', '2022-10-12 11:15:31'),
(6111, 'SI-0000007', 'PDT-000095', '1', 5.00, 584.97, 600.00, '0', 0.00, '2022-10-04', '1', NULL, 0, '1', '2022-10-04 11:40:08', '2022-10-12 11:15:31'),
(6112, 'SI-0000008', 'PDT-000124', '1', 1.00, 312.50, 375.00, '0', 0.00, '2022-10-04', '1', NULL, 0, '1', '2022-10-04 12:29:54', '2022-10-12 11:15:31'),
(6113, 'SI-0000008', 'PDT-000256', '1', 1.00, 1250.00, 1350.00, '0', 0.00, '2022-10-04', '1', NULL, 0, '1', '2022-10-04 12:29:54', '2022-10-12 11:15:31'),
(6114, 'SI-0000009', 'PDT-000248', '1', 4.00, 5.00, 7.00, '0', 0.00, '2022-10-04', '1', NULL, 0, '1', '2022-10-04 13:05:29', '2022-10-12 11:15:31'),
(6115, 'SI-0000009', 'PDT-000253', '1', 1.00, 272.81, 285.00, '0', 0.00, '2022-10-04', '1', NULL, 0, '1', '2022-10-04 13:05:29', '2022-10-12 11:15:31'),
(6116, 'SI-0000010', 'PDT-000028', '1', 2.00, 2.59, 3.00, '0', 0.00, '2022-10-05', '1', NULL, 0, '1', '2022-10-05 03:38:33', '2022-10-12 11:15:32'),
(6117, 'SI-0000011', 'PDT-000028', '1', 3.00, 2.59, 3.00, '0', 0.00, '2022-10-05', '1', NULL, 0, '1', '2022-10-05 03:46:58', '2022-10-12 11:15:32'),
(6118, 'SI-0000012', 'PDT-000111', '1', 1.00, 480.00, 510.00, '0', 0.00, '2022-10-05', '1', NULL, 0, '1', '2022-10-05 11:10:01', '2022-10-12 11:15:32'),
(6119, 'SI-0000013', 'PDT-000028', '1', 4.00, 2.59, 3.00, '0', 0.00, '2022-10-05', '1', NULL, 0, '1', '2022-10-05 11:59:37', '2022-10-12 11:15:32'),
(6120, 'SI-0000014', 'PDT-000229', '1', 1.00, 940.80, 1050.00, '0', 0.00, '2022-10-05', '1', NULL, 0, '1', '2022-10-05 12:46:48', '2022-10-12 11:15:32'),
(6121, 'SI-0000015', 'PDT-000023', '1', 1.00, 208.93, 265.00, '0', 0.00, '2022-10-06', '1', NULL, 0, '1', '2022-10-06 04:56:25', '2022-10-12 11:15:33'),
(6122, 'SI-0000016', 'PDT-000108', '1', 2.00, 228.81, 250.00, '0', 0.00, '2022-10-06', '1', NULL, 0, '1', '2022-10-06 05:04:09', '2022-10-12 11:15:33'),
(6123, 'SI-0000017', 'PDT-000225', '1', 1.00, 484.53, 515.00, '0', 0.00, '2022-10-06', '1', NULL, 0, '1', '2022-10-06 12:35:21', '2022-10-12 11:15:33'),
(6124, 'SI-0000018', 'PDT-000170', '1', 1.00, 482.63, 525.00, '0', 0.00, '2022-10-06', '1', NULL, 0, '1', '2022-10-06 12:46:23', '2022-10-12 11:15:33'),
(6125, 'SI-0000018', 'PDT-000189', '1', 1.00, 172.40, 200.00, '0', 0.00, '2022-10-06', '1', NULL, 0, '1', '2022-10-06 12:46:23', '2022-10-12 11:15:33'),
(6126, 'SI-0000018', 'PDT-000177', '1', 2.00, 30.11, 33.00, '0', 0.00, '2022-10-06', '1', NULL, 0, '1', '2022-10-06 12:46:23', '2022-10-12 11:15:33'),
(6127, 'SI-0000018', 'PDT-000140', '1', 1.00, 52.91, 60.00, '0', 0.00, '2022-10-06', '1', NULL, 0, '1', '2022-10-06 12:46:23', '2022-10-12 11:15:33'),
(6128, 'SI-0000019', 'PDT-000138', '1', 1.00, 206.36, 225.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 04:24:28', '2022-10-12 11:15:33'),
(6129, 'SI-0000020', 'PDT-000068', '1', 6.00, 3062.81, 3448.50, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:10:20', '2022-10-12 11:15:34'),
(6130, 'SI-0000020', 'PDT-000057', '1', 8.00, 1296.78, 1600.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:10:20', '2022-10-12 11:15:34'),
(6131, 'SI-0000020', 'PDT-000073', '1', 2.00, 463.50, 530.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:10:20', '2022-10-12 11:15:34'),
(6132, 'SI-0000020', 'PDT-000067', '1', 4.00, 324.84, 385.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:10:20', '2022-10-12 11:15:34'),
(6133, 'SI-0000021', 'PDT-000006', '15', 40.00, 2573.00, 2550.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:11:54', '2022-10-12 11:15:34'),
(6134, 'SI-0000022', 'PDT-000073', '1', 1.00, 463.50, 550.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:13:16', '2022-10-12 11:15:34'),
(6135, 'SI-0000023', 'PDT-000069', '1', 1.00, 3290.62, 3500.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:14:57', '2022-10-12 11:15:34'),
(6136, 'SI-0000023', 'PDT-000066', '1', 2.00, 265.91, 310.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:14:57', '2022-10-12 11:15:34'),
(6137, 'SI-0000024', 'PDT-000015', '15', 1.00, 921.00, 1100.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:17:13', '2022-10-12 11:15:34'),
(6138, 'SI-0000025', 'PDT-000021', '1', 6.00, 127.80, 150.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:18:29', '2022-10-12 11:15:34'),
(6139, 'SI-0000026', 'PDT-000068', '1', 6.00, 3062.81, 3400.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:19:34', '2022-10-12 11:15:35'),
(6140, 'SI-0000026', 'PDT-000072', '1', 1.00, 630.00, 730.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:19:34', '2022-10-12 11:15:35'),
(6141, 'SI-0000027', 'PDT-000056', '1', 1.00, 17.04, 20.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:21:15', '2022-10-12 11:15:35'),
(6142, 'SI-0000027', 'PDT-000043', '1', 1.00, 116.78, 140.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:21:15', '2022-10-12 11:15:35'),
(6143, 'SI-0000028', 'PDT-000052', '1', 1.00, 175.18, 220.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:22:21', '2022-10-12 11:15:35'),
(6144, 'SI-0000029', 'PDT-000014', '15', 1.00, 921.00, 1000.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:26:44', '2022-10-12 11:15:35'),
(6145, 'SI-0000030', 'PDT-000076', '1', 2.00, 810.00, 910.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:28:14', '2022-10-12 11:15:35'),
(6146, 'SI-0000031', 'PDT-000002', '15', 10.00, 2941.00, 3292.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:31:01', '2022-10-12 11:15:36'),
(6147, 'SI-0000032', 'PDT-000250', '1', 1.00, 582.58, 670.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:34:15', '2022-10-12 11:15:36'),
(6148, 'SI-0000032', 'PDT-000062', '1', 6.00, 172.67, 200.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:34:15', '2022-10-12 11:15:36'),
(6149, 'SI-0000033', 'PDT-000073', '1', 1.00, 463.50, 550.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:35:51', '2022-10-12 11:15:36'),
(6150, 'SI-0000034', 'PDT-000015', '15', 1.00, 921.00, 1100.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:37:56', '2022-10-12 11:15:36'),
(6151, 'SI-0000035', 'PDT-000029', '1', 1.00, 664.77, 780.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:39:12', '2022-10-12 11:15:37'),
(6152, 'SI-0000036', 'PDT-000006', '15', 29.00, 2573.00, 2650.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:41:58', '2022-10-12 11:15:37'),
(6153, 'SI-0000037', 'PDT-000001', '15', 3.00, 2842.00, 3111.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:43:01', '2022-10-12 11:15:37'),
(6154, 'SI-0000038', 'PDT-000024', '1', 1.00, 5.61, 10.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:43:53', '2022-10-12 11:15:37'),
(6155, 'SI-0000039', 'PDT-000052', '1', 1.00, 175.18, 230.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:44:51', '2022-10-12 11:15:38'),
(6156, 'SI-0000040', 'PDT-000038', '1', 2.00, 18.02, 21.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:46:10', '2022-10-12 11:15:39'),
(6157, 'SI-0000041', 'PDT-000028', '1', 20.00, 2.59, 3.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:47:39', '2022-10-12 11:15:39'),
(6158, 'SI-0000042', 'PDT-000026', '1', 1.00, 31.76, 40.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:48:18', '2022-10-12 11:15:40'),
(6159, 'SI-0000043', 'PDT-000090', '1', 1.00, 31.18, 40.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:48:55', '2022-10-12 11:15:40'),
(6160, 'SI-0000044', 'PDT-000055', '1', 1.00, 2812.17, 3200.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:50:37', '2022-10-12 11:15:41'),
(6161, 'SI-0000044', 'PDT-000107', '1', 17.00, 161.87, 170.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:50:37', '2022-10-12 11:15:41'),
(6162, 'SI-0000045', 'PDT-000024', '1', 1.00, 5.61, 10.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:51:23', '2022-10-12 11:15:41'),
(6163, 'SI-0000046', 'PDT-000053', '1', 2.00, 179.67, 220.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:52:23', '2022-10-12 11:15:41'),
(6164, 'SI-0000047', 'PDT-000064', '1', 2.00, 1271.33, 1400.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:54:29', '2022-10-12 11:15:41'),
(6165, 'SI-0000047', 'PDT-000067', '1', 1.00, 324.84, 360.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:54:29', '2022-10-12 11:15:41'),
(6166, 'SI-0000047', 'PDT-000061', '1', 2.00, 72.32, 80.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:54:29', '2022-10-12 11:15:41'),
(6167, 'SI-0000047', 'PDT-000152', '1', 1.00, 92.64, 100.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:54:29', '2022-10-12 11:15:41'),
(6168, 'SI-0000048', 'PDT-000032', '1', 10.00, 5.56, 6.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:56:33', '2022-10-12 11:15:41'),
(6169, 'SI-0000049', 'PDT-000123', '1', 8.00, 16.24, 20.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:58:24', '2022-10-12 11:15:41'),
(6170, 'SI-0000049', 'PDT-000149', '1', 4.00, 3.43, 5.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 05:58:24', '2022-10-12 11:15:41'),
(6171, 'SI-0000050', 'PDT-000069', '1', 3.00, 3290.62, 3350.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:01:37', '2022-10-12 11:15:42'),
(6172, 'SI-0000050', 'PDT-000107', '1', 60.00, 161.87, 165.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:01:37', '2022-10-12 11:15:42'),
(6173, 'SI-0000050', 'PDT-000116', '1', 1.00, 1421.00, 1500.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:01:37', '2022-10-12 11:15:42'),
(6174, 'SI-0000051', 'PDT-000024', '1', 2.00, 5.61, 10.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:02:51', '2022-10-12 11:15:42'),
(6175, 'SI-0000051', 'PDT-000030', '1', 1.00, 87.75, 100.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:02:51', '2022-10-12 11:15:42'),
(6176, 'SI-0000052', 'PDT-000067', '1', 2.00, 324.84, 350.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:03:47', '2022-10-12 11:15:42'),
(6177, 'SI-0000052', 'PDT-000058', '1', 2.00, 83.78, 100.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:03:47', '2022-10-12 11:15:42'),
(6178, 'SI-0000053', 'PDT-000066', '1', 5.00, 265.91, 310.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:05:54', '2022-10-12 11:15:42'),
(6179, 'SI-0000053', 'PDT-000046', '1', 2.00, 99.78, 120.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:05:54', '2022-10-12 11:15:42'),
(6180, 'SI-0000053', 'PDT-000059', '1', 2.00, 340.00, 400.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:05:54', '2022-10-12 11:15:42'),
(6181, 'SI-0000053', 'PDT-000044', '1', 1.00, 806.27, 900.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:05:54', '2022-10-12 11:15:42'),
(6182, 'SI-0000053', 'PDT-000065', '1', 2.00, 66.82, 85.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:05:54', '2022-10-12 11:15:42'),
(6183, 'SI-0000054', 'PDT-000037', '1', 4.00, 8.62, 10.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:06:33', '2022-10-12 11:15:42'),
(6184, 'SI-0000055', 'PDT-000002', '15', 22.00, 2941.00, 3292.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:07:33', '2022-10-12 11:15:42'),
(6185, 'SI-0000055', 'PDT-000059', '1', 1.00, 340.00, 400.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:07:33', '2022-10-12 11:15:42'),
(6186, 'SI-0000056', 'PDT-000006', '15', 80.00, 2573.00, 2650.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:08:47', '2022-10-12 11:15:43'),
(6187, 'SI-0000057', 'PDT-000152', '1', 5.00, 92.64, 100.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:10:56', '2022-10-12 11:15:43'),
(6188, 'SI-0000057', 'PDT-000067', '1', 2.00, 324.84, 350.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:10:56', '2022-10-12 11:15:43'),
(6189, 'SI-0000058', 'PDT-000028', '1', 8.00, 2.59, 3.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:11:47', '2022-10-12 11:15:43'),
(6190, 'SI-0000059', 'PDT-000088', '1', 10.00, 85.96, 100.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:12:30', '2022-10-12 11:15:43'),
(6191, 'SI-0000060', 'PDT-000155', '1', 1.00, 703.12, 850.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:13:21', '2022-10-12 11:15:43'),
(6192, 'SI-0000061', 'PDT-000014', '15', 1.00, 921.00, 1050.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:16:37', '2022-10-12 11:15:44'),
(6193, 'SI-0000061', 'PDT-000012', '15', 1.00, 1023.00, 1100.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:16:37', '2022-10-12 11:15:44'),
(6194, 'SI-0000062', 'PDT-000106', '1', 1.00, 13.75, 15.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:39:07', '2022-10-12 11:15:44'),
(6195, 'SI-0000062', 'PDT-000026', '1', 1.00, 31.76, 35.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:39:07', '2022-10-12 11:15:44'),
(6196, 'SI-0000063', 'PDT-000258', '15', 15.00, 2725.00, 3080.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:39:57', '2022-10-12 11:15:44'),
(6197, 'SI-0000064', 'PDT-000069', '1', 1.00, 3290.62, 3350.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:42:30', '2022-10-12 11:15:44'),
(6198, 'SI-0000064', 'PDT-000107', '1', 20.00, 161.87, 168.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:42:30', '2022-10-12 11:15:44'),
(6199, 'SI-0000065', 'PDT-000106', '1', 1.00, 13.75, 15.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:43:43', '2022-10-12 11:15:44'),
(6200, 'SI-0000065', 'PDT-000026', '1', 1.00, 31.76, 35.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:43:43', '2022-10-12 11:15:44'),
(6201, 'SI-0000066', 'PDT-000106', '1', 1.00, 13.75, 15.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:44:34', '2022-10-12 11:15:44'),
(6202, 'SI-0000066', 'PDT-000026', '1', 1.00, 31.76, 35.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:44:34', '2022-10-12 11:15:44'),
(6203, 'SI-0000067', 'PDT-000145', '1', 3.00, 15.05, 17.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:45:55', '2022-10-12 11:15:45'),
(6204, 'SI-0000067', 'PDT-000024', '1', 4.00, 5.61, 10.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:45:55', '2022-10-12 11:15:45'),
(6205, 'SI-0000068', 'PDT-000072', '1', 1.00, 630.00, 670.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:47:59', '2022-10-12 11:15:45'),
(6206, 'SI-0000068', 'PDT-000096', '1', 1.00, 291.67, 360.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:47:59', '2022-10-12 11:15:45'),
(6207, 'SI-0000068', 'PDT-000067', '1', 2.00, 324.84, 375.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:47:59', '2022-10-12 11:15:45'),
(6208, 'SI-0000069', 'PDT-000026', '1', 1.00, 31.76, 35.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:49:05', '2022-10-12 11:15:45'),
(6209, 'SI-0000069', 'PDT-000106', '1', 1.00, 13.75, 15.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:49:05', '2022-10-12 11:15:45'),
(6210, 'SI-0000070', 'PDT-000145', '1', 1.00, 15.05, 17.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:49:46', '2022-10-12 11:15:45'),
(6211, 'SI-0000071', 'PDT-000064', '1', 3.00, 1271.33, 1450.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:51:27', '2022-10-12 11:15:45'),
(6212, 'SI-0000071', 'PDT-000044', '1', 2.00, 806.27, 900.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:51:27', '2022-10-12 11:15:45'),
(6213, 'SI-0000071', 'PDT-000110', '1', 1.00, 910.00, 950.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:51:27', '2022-10-12 11:15:45'),
(6214, 'SI-0000071', 'PDT-000061', '1', 6.00, 72.32, 80.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:51:27', '2022-10-12 11:15:45'),
(6215, 'SI-0000071', 'PDT-000158', '1', 1.00, 311.15, 340.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:51:27', '2022-10-12 11:15:45'),
(6216, 'SI-0000072', 'PDT-000082', '1', 1.00, 637.88, 710.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:53:43', '2022-10-12 11:15:45'),
(6217, 'SI-0000072', 'PDT-000086', '1', 1.00, 785.00, 890.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 06:53:43', '2022-10-12 11:15:45'),
(6218, 'SI-0000073', 'PDT-000023', '1', 1.00, 208.93, 260.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 09:47:34', '2022-10-12 11:15:45'),
(6219, 'SI-0000073', 'PDT-000117', '1', 5.00, 20.89, 22.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 09:47:34', '2022-10-12 11:15:45'),
(6220, 'SI-0000074', 'PDT-000114', '1', 2.00, 336.00, 360.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 09:49:21', '2022-10-12 11:15:46'),
(6221, 'SI-0000075', 'PDT-000014', '15', 1.00, 921.00, 1200.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 09:54:18', '2022-10-12 11:15:46'),
(6222, 'SI-0000076', 'PDT-000157', '1', 1.00, 190.00, 215.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 09:57:04', '2022-10-12 11:15:46'),
(6223, 'SI-0000077', 'PDT-000006', '15', 20.00, 2573.00, 2650.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:03:22', '2022-10-12 11:15:46'),
(6224, 'SI-0000077', 'PDT-000018', '1', 7.00, 171.61, 188.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:03:22', '2022-10-12 11:15:46'),
(6225, 'SI-0000077', 'PDT-000043', '1', 1.00, 116.78, 140.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:03:22', '2022-10-12 11:15:46'),
(6226, 'SI-0000078', 'PDT-000110', '1', 1.00, 910.00, 980.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:06:40', '2022-10-12 11:15:47'),
(6227, 'SI-0000079', 'PDT-000067', '1', 2.00, 324.84, 350.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:09:42', '2022-10-12 11:15:47'),
(6228, 'SI-0000079', 'PDT-000059', '1', 2.00, 340.00, 370.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:09:42', '2022-10-12 11:15:47'),
(6229, 'SI-0000080', 'PDT-000095', '1', 2.00, 584.97, 650.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:11:52', '2022-10-12 11:15:47'),
(6230, 'SI-0000080', 'PDT-000084', '1', 4.00, 285.30, 320.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:11:52', '2022-10-12 11:15:47'),
(6231, 'SI-0000081', 'PDT-000026', '1', 1.00, 31.76, 35.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:13:23', '2022-10-12 11:15:47'),
(6232, 'SI-0000082', 'PDT-000080', '1', 1.00, 20.49, 30.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:16:15', '2022-10-12 11:15:47'),
(6233, 'SI-0000082', 'PDT-000024', '1', 2.00, 5.61, 10.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:16:15', '2022-10-12 11:15:47'),
(6234, 'SI-0000083', 'PDT-000148', '1', 1.00, 1.95, 3.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:17:26', '2022-10-12 11:15:48'),
(6235, 'SI-0000084', 'PDT-000002', '15', 1.00, 2941.00, 3292.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:20:30', '2022-10-12 11:15:48'),
(6236, 'SI-0000085', 'PDT-000164', '1', 2.00, 10.14, 13.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:23:02', '2022-10-12 11:15:48'),
(6237, 'SI-0000085', 'PDT-000148', '1', 8.00, 1.95, 3.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:23:02', '2022-10-12 11:15:48'),
(6238, 'SI-0000086', 'PDT-000164', '1', 3.00, 10.14, 13.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:27:41', '2022-10-12 11:15:48'),
(6239, 'SI-0000086', 'PDT-000149', '1', 3.00, 3.43, 4.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:27:41', '2022-10-12 11:15:48'),
(6240, 'SI-0000087', 'PDT-000119', '1', 1.00, 336.36, 390.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:29:01', '2022-10-12 11:15:48'),
(6241, 'SI-0000088', 'PDT-000023', '1', 1.00, 208.93, 260.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:32:12', '2022-10-12 11:15:48'),
(6242, 'SI-0000088', 'PDT-000117', '1', 3.00, 20.89, 25.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:32:12', '2022-10-12 11:15:48'),
(6243, 'SI-0000088', 'PDT-000149', '1', 2.00, 3.43, 5.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:32:12', '2022-10-12 11:15:48'),
(6244, 'SI-0000089', 'PDT-000009', '15', 30.00, 2725.00, 2895.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:34:55', '2022-10-12 11:15:49'),
(6245, 'SI-0000090', 'PDT-000117', '1', 2.00, 20.89, 25.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:37:18', '2022-10-12 11:15:49'),
(6246, 'SI-0000090', 'PDT-000164', '1', 2.00, 10.14, 13.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:37:18', '2022-10-12 11:15:49'),
(6247, 'SI-0000091', 'PDT-000061', '1', 4.00, 72.32, 80.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:40:23', '2022-10-12 11:15:49'),
(6248, 'SI-0000091', 'PDT-000069', '1', 1.00, 3290.62, 3500.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:40:23', '2022-10-12 11:15:49'),
(6249, 'SI-0000091', 'PDT-000075', '1', 2.00, 383.15, 430.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:40:23', '2022-10-12 11:15:49'),
(6250, 'SI-0000091', 'PDT-000107', '1', 10.00, 161.87, 170.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:40:23', '2022-10-12 11:15:49'),
(6251, 'SI-0000092', 'PDT-000006', '15', 20.00, 2573.00, 2650.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:43:04', '2022-10-12 11:15:49'),
(6252, 'SI-0000092', 'PDT-000072', '1', 1.00, 630.00, 730.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:43:04', '2022-10-12 11:15:49'),
(6253, 'SI-0000092', 'PDT-000158', '1', 2.00, 311.15, 340.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:43:04', '2022-10-12 11:15:49'),
(6254, 'SI-0000093', 'PDT-000097', '1', 1.00, 178.57, 210.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:46:02', '2022-10-12 11:15:49'),
(6255, 'SI-0000093', 'PDT-000164', '1', 3.00, 10.14, 13.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:46:02', '2022-10-12 11:15:49'),
(6256, 'SI-0000094', 'PDT-000097', '1', 1.00, 178.57, 210.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:50:04', '2022-10-12 11:15:49'),
(6257, 'SI-0000094', 'PDT-000123', '1', 4.00, 16.24, 18.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:50:04', '2022-10-12 11:15:49'),
(6258, 'SI-0000094', 'PDT-000146', '1', 4.00, 8.60, 10.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:50:04', '2022-10-12 11:15:49'),
(6259, 'SI-0000095', 'PDT-000097', '1', 1.00, 178.57, 220.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:51:10', '2022-10-12 11:15:49'),
(6260, 'SI-0000096', 'PDT-000059', '1', 2.00, 340.00, 370.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:53:28', '2022-10-12 11:15:49'),
(6261, 'SI-0000096', 'PDT-000067', '1', 2.00, 324.84, 375.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:53:28', '2022-10-12 11:15:49'),
(6262, 'SI-0000097', 'PDT-000035', '1', 1.00, 128.52, 220.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 10:57:14', '2022-10-12 11:15:50'),
(6263, 'SI-0000098', 'PDT-000198', '1', 5.00, 26.29, 35.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 11:01:24', '2022-10-12 11:15:50'),
(6264, 'SI-0000098', 'PDT-000123', '1', 5.00, 16.24, 18.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 11:01:24', '2022-10-12 11:15:50'),
(6265, 'SI-0000098', 'PDT-000149', '1', 5.00, 3.43, 5.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 11:01:24', '2022-10-12 11:15:50'),
(6266, 'SI-0000098', 'PDT-000053', '1', 1.00, 179.67, 210.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 11:01:24', '2022-10-12 11:15:50'),
(6267, 'SI-0000099', 'PDT-000253', '1', 1.00, 272.81, 295.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 11:02:53', '2022-10-12 11:15:51'),
(6268, 'SI-0000100', 'PDT-000139', '1', 1.00, 114.03, 130.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 11:05:39', '2022-10-12 11:15:51'),
(6269, 'SI-0000100', 'PDT-000152', '1', 1.00, 92.64, 100.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 11:05:39', '2022-10-12 11:15:51'),
(6270, 'SI-0000101', 'PDT-000155', '1', 1.00, 703.12, 870.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 11:56:29', '2022-10-12 11:15:51'),
(6271, 'SI-0000102', 'PDT-000050', '1', 2.00, 81.96, 100.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 11:59:20', '2022-10-12 11:15:51'),
(6272, 'SI-0000102', 'PDT-000061', '1', 6.00, 72.32, 80.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 11:59:20', '2022-10-12 11:15:51'),
(6273, 'SI-0000102', 'PDT-000250', '1', 1.00, 582.58, 630.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 11:59:20', '2022-10-12 11:15:51'),
(6274, 'SI-0000102', 'PDT-000059', '1', 2.00, 340.00, 400.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 11:59:20', '2022-10-12 11:15:51'),
(6275, 'SI-0000103', 'PDT-000088', '1', 12.00, 85.96, 100.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 12:00:29', '2022-10-12 11:15:52'),
(6276, 'SI-0000104', 'PDT-000117', '1', 2.00, 20.89, 25.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 12:03:09', '2022-10-12 11:15:52'),
(6277, 'SI-0000104', 'PDT-000024', '1', 1.00, 5.61, 10.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 12:03:09', '2022-10-12 11:15:52'),
(6278, 'SI-0000105', 'PDT-000024', '1', 1.00, 5.61, 10.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 12:04:53', '2022-10-12 11:15:52'),
(6279, 'SI-0000106', 'PDT-000096', '1', 1.00, 291.67, 410.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 12:06:36', '2022-10-12 11:15:52'),
(6280, 'SI-0000107', 'PDT-000026', '1', 1.00, 31.76, 35.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 12:20:32', '2022-10-12 11:15:52'),
(6281, 'SI-0000107', 'PDT-000106', '1', 1.00, 13.75, 15.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 12:20:32', '2022-10-12 11:15:52'),
(6282, 'SI-0000108', 'PDT-000242', '1', 2.00, 76.13, 85.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 13:27:20', '2022-10-12 11:15:52'),
(6283, 'SI-0000108', 'PDT-000228', '1', 2.00, 215.60, 235.00, '0', 0.00, '2022-10-07', '1', NULL, 0, '1', '2022-10-07 13:27:20', '2022-10-12 11:15:52'),
(6284, 'SI-0000109', 'PDT-000144', '1', 2.00, 171.52, 185.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 05:17:37', '2022-10-12 11:15:53'),
(6285, 'SI-0000109', 'PDT-000235', '1', 1.00, 405.82, 445.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 05:17:37', '2022-10-12 11:15:53'),
(6286, 'SI-0000109', 'PDT-000197', '1', 2.00, 586.80, 630.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 05:17:37', '2022-10-12 11:15:53'),
(6287, 'SI-0000110', 'PDT-000139', '1', 1.00, 114.03, 130.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 05:21:39', '2022-10-12 11:15:53'),
(6288, 'SI-0000110', 'PDT-000177', '1', 2.00, 30.11, 33.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 05:21:39', '2022-10-12 11:15:53'),
(6289, 'SI-0000111', 'PDT-000251', '1', 1.00, 45.85, 50.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 05:28:46', '2022-10-12 11:15:53'),
(6290, 'SI-0000112', 'PDT-000035', '1', 1.00, 128.52, 150.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 05:45:35', '2022-10-12 11:15:54'),
(6291, 'SI-0000113', 'PDT-000169', '1', 2.00, 8.39, 10.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 06:27:31', '2022-10-12 11:15:54'),
(6292, 'SI-0000114', 'PDT-000164', '1', 10.00, 10.14, 12.50, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 06:29:36', '2022-10-12 11:15:54'),
(6293, 'SI-0000114', 'PDT-000169', '1', 2.00, 8.39, 10.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 06:29:36', '2022-10-12 11:15:54'),
(6294, 'SI-0000115', 'PDT-000117', '1', 5.00, 20.89, 25.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 06:32:35', '2022-10-12 11:15:54'),
(6295, 'SI-0000116', 'PDT-000030', '1', 1.00, 87.75, 95.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 06:46:08', '2022-10-12 11:15:54'),
(6296, 'SI-0000116', 'PDT-000169', '1', 2.00, 8.39, 10.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 06:46:08', '2022-10-12 11:15:54'),
(6297, 'SI-0000117', 'PDT-000270', '1', 6.00, 2250.00, 2270.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 06:52:20', '2022-10-12 11:15:55'),
(6298, 'SI-0000118', 'PDT-000018', '1', 3.00, 171.61, 188.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 06:53:42', '2022-10-12 11:15:55'),
(6299, 'SI-0000118', 'PDT-000043', '1', 2.00, 116.78, 140.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 06:53:42', '2022-10-12 11:15:55'),
(6300, 'SI-0000118', 'PDT-000086', '1', 1.00, 785.00, 880.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 06:53:42', '2022-10-12 11:15:55'),
(6301, 'SI-0000119', 'PDT-000169', '1', 4.00, 8.39, 10.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 06:54:41', '2022-10-12 11:15:55'),
(6302, 'SI-0000120', 'PDT-000117', '1', 3.00, 20.89, 23.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 06:55:52', '2022-10-12 11:15:55'),
(6303, 'SI-0000120', 'PDT-000024', '1', 2.00, 5.61, 7.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 06:55:52', '2022-10-12 11:15:55'),
(6304, 'SI-0000120', 'PDT-000056', '1', 1.00, 17.04, 20.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 06:55:52', '2022-10-12 11:15:55'),
(6305, 'SI-0000121', 'PDT-000023', '1', 2.00, 208.93, 275.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 06:57:35', '2022-10-12 11:15:55'),
(6306, 'SI-0000122', 'PDT-000166', '1', 2.00, 30.02, 35.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 06:58:39', '2022-10-12 11:15:55'),
(6307, 'SI-0000123', 'PDT-000138', '1', 1.00, 206.36, 225.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 07:02:04', '2022-10-12 11:15:56'),
(6308, 'SI-0000123', 'PDT-000026', '1', 3.00, 31.76, 35.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 07:02:04', '2022-10-12 11:15:56'),
(6309, 'SI-0000123', 'PDT-000169', '1', 2.00, 8.39, 10.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 07:02:04', '2022-10-12 11:15:56'),
(6310, 'SI-0000124', 'PDT-000021', '1', 14.00, 127.80, 150.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 07:03:02', '2022-10-12 11:15:56'),
(6311, 'SI-0000125', 'PDT-000064', '1', 2.00, 1271.33, 1450.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 07:07:12', '2022-10-12 11:15:56'),
(6312, 'SI-0000125', 'PDT-000044', '1', 1.00, 806.27, 900.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 07:07:12', '2022-10-12 11:15:56'),
(6313, 'SI-0000125', 'PDT-000060', '1', 1.00, 187.09, 200.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 07:07:12', '2022-10-12 11:15:56'),
(6314, 'SI-0000125', 'PDT-000061', '1', 2.00, 72.32, 80.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 07:07:12', '2022-10-12 11:15:56'),
(6315, 'SI-0000125', 'PDT-000148', '1', 120.00, 1.95, 2.20, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 07:07:12', '2022-10-12 11:15:56'),
(6316, 'SI-0000125', 'PDT-000050', '1', 2.00, 81.96, 100.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 07:07:12', '2022-10-12 11:15:56'),
(6317, 'SI-0000125', 'PDT-000059', '1', 2.00, 340.00, 400.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 07:07:12', '2022-10-12 11:15:56'),
(6318, 'SI-0000125', 'PDT-000110', '1', 1.00, 910.00, 950.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 07:07:12', '2022-10-12 11:15:56'),
(6319, 'SI-0000126', 'PDT-000253', '1', 2.00, 272.81, 290.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 07:10:17', '2022-10-12 11:15:56'),
(6320, 'SI-0000126', 'PDT-000131', '1', 2.00, 111.35, 150.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 07:10:17', '2022-10-12 11:15:56'),
(6321, 'SI-0000126', 'PDT-000056', '1', 4.00, 17.04, 20.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 07:10:17', '2022-10-12 11:15:56'),
(6322, 'SI-0000127', 'PDT-000017', '1', 2.00, 4.04, 5.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 07:14:40', '2022-10-12 11:15:56'),
(6323, 'SI-0000128', 'PDT-000258', '15', 10.00, 2725.00, 3080.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 07:25:11', '2022-10-12 11:15:57'),
(6324, 'SI-0000129', 'PDT-000258', '15', 5.00, 2725.00, 3080.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 07:26:28', '2022-10-12 11:15:57'),
(6325, 'SI-0000130', 'PDT-000258', '15', 15.00, 2725.00, 2950.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:16:13', '2022-10-12 11:15:57'),
(6326, 'SI-0000131', 'PDT-000006', '15', 40.00, 2573.00, 2725.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:18:55', '2022-10-12 11:15:57'),
(6327, 'SI-0000132', 'PDT-000021', '1', 16.00, 127.80, 150.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:20:45', '2022-10-12 11:15:57'),
(6328, 'SI-0000133', 'PDT-000038', '1', 8.00, 18.02, 21.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:24:24', '2022-10-12 11:15:57'),
(6329, 'SI-0000133', 'PDT-000151', '1', 6.00, 12.01, 14.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:24:24', '2022-10-12 11:15:57'),
(6330, 'SI-0000134', 'PDT-000059', '1', 2.00, 340.00, 375.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:28:00', '2022-10-12 11:15:58'),
(6331, 'SI-0000134', 'PDT-000067', '1', 1.00, 324.84, 360.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:28:00', '2022-10-12 11:15:58'),
(6332, 'SI-0000135', 'PDT-000006', '15', 40.00, 2573.00, 2650.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:30:19', '2022-10-12 11:15:58'),
(6333, 'SI-0000136', 'PDT-000006', '15', 20.00, 2573.00, 2650.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:32:09', '2022-10-12 11:15:58'),
(6334, 'SI-0000137', 'PDT-000194', '1', 2.00, 58.50, 80.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:36:15', '2022-10-12 11:15:58'),
(6335, 'SI-0000137', 'PDT-000037', '1', 6.00, 8.62, 10.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:36:15', '2022-10-12 11:15:58'),
(6336, 'SI-0000137', 'PDT-000053', '1', 1.00, 179.67, 230.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:36:15', '2022-10-12 11:15:58'),
(6337, 'SI-0000137', 'PDT-000125', '1', 6.00, 30.00, 39.50, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:36:15', '2022-10-12 11:15:58'),
(6338, 'SI-0000138', 'PDT-000192', '1', 1.00, 13.20, 15.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:37:48', '2022-10-12 11:15:58'),
(6339, 'SI-0000139', 'PDT-000194', '1', 1.00, 58.50, 80.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:41:03', '2022-10-12 11:15:58'),
(6340, 'SI-0000139', 'PDT-000148', '1', 4.00, 1.95, 3.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:41:03', '2022-10-12 11:15:58'),
(6341, 'SI-0000140', 'PDT-000026', '1', 1.00, 31.76, 35.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:42:09', '2022-10-12 11:15:59'),
(6342, 'SI-0000140', 'PDT-000106', '1', 1.00, 13.75, 15.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:42:09', '2022-10-12 11:15:59'),
(6343, 'SI-0000141', 'PDT-000185', '1', 1.00, 1113.60, 1330.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:48:06', '2022-10-12 11:15:59'),
(6344, 'SI-0000141', 'PDT-000169', '1', 20.00, 8.39, 9.50, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:48:06', '2022-10-12 11:15:59'),
(6345, 'SI-0000142', 'PDT-000169', '1', 6.00, 8.39, 9.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:49:27', '2022-10-12 11:15:59'),
(6346, 'SI-0000143', 'PDT-000146', '1', 6.00, 8.60, 9.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:51:06', '2022-10-12 11:15:59'),
(6347, 'SI-0000144', 'PDT-000010', '1', 3300.00, 18.00, 18.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:57:39', '2022-10-12 11:16:00'),
(6348, 'SI-0000144', 'PDT-000066', '1', 4.00, 265.91, 285.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:57:39', '2022-10-12 11:16:00'),
(6349, 'SI-0000144', 'PDT-000129', '1', 1.00, 796.41, 860.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:57:39', '2022-10-12 11:16:00'),
(6350, 'SI-0000144', 'PDT-000065', '1', 1.00, 66.82, 75.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:57:39', '2022-10-12 11:16:00'),
(6351, 'SI-0000144', 'PDT-000059', '1', 1.00, 340.00, 370.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:57:39', '2022-10-12 11:16:00'),
(6352, 'SI-0000145', 'PDT-000009', '15', 15.00, 2725.00, 3213.87, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 10:59:43', '2022-10-12 11:19:39'),
(6353, 'SI-0000146', 'PDT-000258', '15', 12.00, 2725.00, 3013.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:01:28', '2022-10-12 11:19:40'),
(6354, 'SI-0000147', 'PDT-000064', '1', 6.00, 1271.33, 1350.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:07:52', '2022-10-12 11:19:40'),
(6355, 'SI-0000147', 'PDT-000044', '1', 7.00, 806.27, 728.57, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:07:52', '2022-10-12 11:19:40'),
(6356, 'SI-0000147', 'PDT-000060', '1', 5.00, 187.09, 200.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:07:52', '2022-10-12 11:19:40'),
(6357, 'SI-0000147', 'PDT-000116', '1', 1.00, 1421.00, 1500.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:07:52', '2022-10-12 11:19:40'),
(6358, 'SI-0000148', 'PDT-000026', '1', 3.00, 31.76, 35.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:09:36', '2022-10-12 11:19:40'),
(6359, 'SI-0000148', 'PDT-000106', '1', 3.00, 13.75, 15.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:09:36', '2022-10-12 11:19:40'),
(6360, 'SI-0000148', 'PDT-000177', '1', 1.00, 30.11, 35.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:09:36', '2022-10-12 11:19:40'),
(6361, 'SI-0000149', 'PDT-000105', '1', 17.00, 354.68, 370.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:11:12', '2022-10-12 11:19:40'),
(6362, 'SI-0000150', 'PDT-000006', '15', 35.00, 2573.00, 2675.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:13:34', '2022-10-12 11:19:40'),
(6363, 'SI-0000150', 'PDT-000188', '1', 3.00, 417.16, 480.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:13:34', '2022-10-12 11:19:40'),
(6364, 'SI-0000151', 'PDT-000150', '1', 6.00, 3.85, 4.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:15:21', '2022-10-12 11:19:40'),
(6365, 'SI-0000151', 'PDT-000081', '1', 4.00, 44.70, 60.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:15:21', '2022-10-12 11:19:40'),
(6366, 'SI-0000152', 'PDT-000026', '1', 1.00, 31.76, 35.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:20:38', '2022-10-12 11:19:41'),
(6367, 'SI-0000152', 'PDT-000106', '1', 1.00, 13.75, 15.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:20:38', '2022-10-12 11:19:41'),
(6368, 'SI-0000152', 'PDT-000191', '1', 1.00, 292.50, 340.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:20:38', '2022-10-12 11:19:41'),
(6369, 'SI-0000152', 'PDT-000189', '1', 1.00, 172.40, 200.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:20:38', '2022-10-12 11:19:41'),
(6370, 'SI-0000152', 'PDT-000169', '1', 2.00, 8.39, 10.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:20:38', '2022-10-12 11:19:41'),
(6371, 'SI-0000152', 'PDT-000166', '1', 1.00, 30.02, 35.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:20:38', '2022-10-12 11:19:41'),
(6372, 'SI-0000153', 'PDT-000160', '1', 1.00, 168.18, 190.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:23:58', '2022-10-12 11:19:41'),
(6373, 'SI-0000153', 'PDT-000039', '1', 1.00, 60.06, 65.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:23:58', '2022-10-12 11:19:41'),
(6374, 'SI-0000153', 'PDT-000035', '1', 1.00, 128.52, 150.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:23:58', '2022-10-12 11:19:41'),
(6375, 'SI-0000154', 'PDT-000097', '1', 1.00, 178.57, 190.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:25:48', '2022-10-12 11:19:41'),
(6376, 'SI-0000154', 'PDT-000243', '1', 1.00, 87.56, 92.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:25:48', '2022-10-12 11:19:41'),
(6377, 'SI-0000155', 'PDT-000113', '1', 1.00, 931.00, 1050.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:27:21', '2022-10-12 11:19:41'),
(6378, 'SI-0000156', 'PDT-000151', '1', 2.00, 12.01, 14.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:29:50', '2022-10-12 11:19:41'),
(6379, 'SI-0000156', 'PDT-000038', '1', 4.00, 18.02, 21.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:29:50', '2022-10-12 11:19:41'),
(6380, 'SI-0000157', 'PDT-000097', '1', 2.00, 178.57, 195.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:32:14', '2022-10-12 11:19:41'),
(6381, 'SI-0000157', 'PDT-000028', '1', 2.00, 2.59, 3.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:32:14', '2022-10-12 11:19:41'),
(6382, 'SI-0000157', 'PDT-000149', '1', 2.00, 3.43, 5.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:32:14', '2022-10-12 11:19:41'),
(6383, 'SI-0000158', 'PDT-000064', '1', 6.00, 1271.33, 1350.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:34:12', '2022-10-12 11:19:41'),
(6384, 'SI-0000159', 'PDT-000138', '1', 1.00, 206.36, 240.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:36:01', '2022-10-12 11:19:42'),
(6385, 'SI-0000159', 'PDT-000097', '1', 2.00, 178.57, 190.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:36:01', '2022-10-12 11:19:42'),
(6386, 'SI-0000160', 'PDT-000163', '1', 1.00, 264.55, 300.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:37:05', '2022-10-12 11:19:42'),
(6387, 'SI-0000161', 'PDT-000253', '1', 1.00, 272.81, 290.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:38:13', '2022-10-12 11:19:42'),
(6388, 'SI-0000162', 'PDT-000028', '1', 3.00, 2.59, 3.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:39:48', '2022-10-12 11:19:42'),
(6389, 'SI-0000162', 'PDT-000056', '1', 2.00, 17.04, 19.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:39:48', '2022-10-12 11:19:42'),
(6390, 'SI-0000163', 'PDT-000026', '1', 1.00, 31.76, 35.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:40:50', '2022-10-12 11:19:42'),
(6391, 'SI-0000163', 'PDT-000106', '1', 1.00, 13.75, 15.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:40:50', '2022-10-12 11:19:42'),
(6392, 'SI-0000164', 'PDT-000061', '1', 5.00, 72.32, 80.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:42:14', '2022-10-12 11:19:43'),
(6393, 'SI-0000164', 'PDT-000050', '1', 1.00, 81.96, 100.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:42:14', '2022-10-12 11:19:43'),
(6394, 'SI-0000165', 'PDT-000208', '1', 2.00, 85.95, 100.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:43:49', '2022-10-12 11:19:43'),
(6395, 'SI-0000166', 'PDT-000253', '1', 1.00, 272.81, 290.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:46:36', '2022-10-12 11:19:43'),
(6396, 'SI-0000166', 'PDT-000026', '1', 1.00, 31.76, 35.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:46:36', '2022-10-12 11:19:43'),
(6397, 'SI-0000166', 'PDT-000106', '1', 2.00, 13.75, 15.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:46:36', '2022-10-12 11:19:43'),
(6398, 'SI-0000166', 'PDT-000164', '1', 2.00, 10.14, 12.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:46:36', '2022-10-12 11:19:43'),
(6399, 'SI-0000167', 'PDT-000002', '15', 10.00, 2941.00, 3292.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:48:30', '2022-10-12 11:19:43'),
(6400, 'SI-0000167', 'PDT-000208', '1', 2.00, 85.95, 100.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:48:30', '2022-10-12 11:19:43'),
(6401, 'SI-0000168', 'PDT-000250', '1', 1.00, 582.58, 630.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:49:39', '2022-10-12 11:19:43'),
(6402, 'SI-0000169', 'PDT-000198', '1', 4.00, 26.29, 29.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:51:40', '2022-10-12 11:19:43'),
(6403, 'SI-0000169', 'PDT-000149', '1', 4.00, 3.43, 5.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:51:40', '2022-10-12 11:19:43'),
(6404, 'SI-0000169', 'PDT-000189', '1', 1.00, 172.40, 200.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:51:40', '2022-10-12 11:19:43'),
(6405, 'SI-0000170', 'PDT-000023', '1', 1.00, 208.93, 280.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:56:08', '2022-10-12 11:19:43'),
(6406, 'SI-0000170', 'PDT-000169', '1', 2.00, 8.39, 10.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:56:08', '2022-10-12 11:19:43'),
(6407, 'SI-0000170', 'PDT-000097', '1', 1.00, 178.57, 220.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:56:08', '2022-10-12 11:19:43'),
(6408, 'SI-0000170', 'PDT-000177', '1', 1.00, 30.11, 33.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 11:56:08', '2022-10-12 11:19:43'),
(6409, 'SI-0000171', 'PDT-000006', '15', 20.00, 2573.00, 2675.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 12:25:22', '2022-10-12 11:19:44'),
(6410, 'SI-0000172', 'PDT-000026', '1', 1.00, 31.76, 35.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 12:26:55', '2022-10-12 11:19:44'),
(6411, 'SI-0000172', 'PDT-000106', '1', 1.00, 13.75, 15.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 12:26:55', '2022-10-12 11:19:44'),
(6412, 'SI-0000173', 'PDT-000067', '1', 2.00, 324.84, 370.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 12:28:31', '2022-10-12 11:19:44'),
(6413, 'SI-0000173', 'PDT-000059', '1', 2.00, 340.00, 375.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 12:28:31', '2022-10-12 11:19:44'),
(6414, 'SI-0000174', 'PDT-000009', '15', 14.00, 2725.00, 3013.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 12:31:22', '2022-10-12 11:19:44'),
(6415, 'SI-0000175', 'PDT-000009', '15', 6.00, 2725.00, 3013.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 12:33:03', '2022-10-12 11:19:44'),
(6416, 'SI-0000175', 'PDT-000045', '1', 1.00, 869.16, 950.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 12:33:03', '2022-10-12 11:19:44'),
(6417, 'SI-0000176', 'PDT-000188', '1', 3.00, 417.16, 550.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 12:38:13', '2022-10-12 11:19:44'),
(6418, 'SI-0000177', 'PDT-000026', '1', 2.00, 31.76, 35.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 12:39:32', '2022-10-12 11:19:44'),
(6419, 'SI-0000177', 'PDT-000106', '1', 2.00, 13.75, 15.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 12:39:32', '2022-10-12 11:19:44'),
(6420, 'SI-0000178', 'PDT-000026', '1', 2.00, 31.76, 35.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 12:41:32', '2022-10-12 11:19:45'),
(6421, 'SI-0000178', 'PDT-000106', '1', 2.00, 13.75, 15.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 12:41:32', '2022-10-12 11:19:45'),
(6422, 'SI-0000179', 'PDT-000172', '1', 2.00, 279.80, 280.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 12:43:00', '2022-10-12 11:19:45');
INSERT INTO `sales_entry` (`id`, `invoice_no`, `product_id`, `sub_unit_id`, `product_quantity`, `product_purchase_price`, `product_sales_price`, `product_discount_amount`, `return_quantity`, `entry_date`, `branch_id`, `note`, `status`, `admin_id`, `created_at`, `updated_at`) VALUES
(6423, 'SI-0000180', 'PDT-000125', '1', 7.00, 30.00, 39.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 12:44:49', '2022-10-12 11:19:45'),
(6424, 'SI-0000180', 'PDT-000096', '1', 1.00, 291.67, 420.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 12:44:49', '2022-10-12 11:19:45'),
(6425, 'SI-0000181', 'PDT-000099', '1', 1.00, 191.10, 220.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 12:46:37', '2022-10-12 11:19:45'),
(6426, 'SI-0000182', 'PDT-000154', '1', 1.00, 165.49, 175.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 12:47:47', '2022-10-12 11:19:45'),
(6427, 'SI-0000183', 'PDT-000226', '1', 1.00, 171.52, 195.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 12:50:10', '2022-10-12 11:19:45'),
(6428, 'SI-0000184', 'PDT-000163', '1', 1.00, 264.55, 290.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 12:51:24', '2022-10-12 11:19:46'),
(6429, 'SI-0000185', 'PDT-000099', '1', 3.00, 191.10, 215.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 13:06:35', '2022-10-12 11:19:46'),
(6430, 'SI-0000185', 'PDT-000079', '1', 4.00, 241.18, 300.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 13:06:35', '2022-10-12 11:19:46'),
(6431, 'SI-0000186', 'PDT-000159', '1', 1.00, 375.00, 410.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 13:15:02', '2022-10-12 11:19:46'),
(6432, 'SI-0000186', 'PDT-000208', '1', 2.00, 85.95, 100.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 13:15:02', '2022-10-12 11:19:46'),
(6433, 'SI-0000187', 'PDT-000208', '1', 5.00, 85.95, 100.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 13:16:01', '2022-10-12 11:19:46'),
(6434, 'SI-0000188', 'PDT-000208', '1', 2.00, 85.95, 100.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 13:18:51', '2022-10-12 11:19:46'),
(6435, 'SI-0000189', 'PDT-000052', '1', 1.00, 175.18, 220.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 13:21:00', '2022-10-12 11:19:47'),
(6436, 'SI-0000190', 'PDT-000023', '1', 1.00, 208.93, 260.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 13:22:08', '2022-10-12 11:19:47'),
(6437, 'SI-0000191', 'PDT-000124', '1', 1.00, 312.50, 430.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 13:23:37', '2022-10-12 11:19:47'),
(6438, 'SI-0000192', 'PDT-000097', '1', 1.00, 178.57, 200.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 13:24:47', '2022-10-12 11:19:47'),
(6439, 'SI-0000193', 'PDT-000114', '1', 4.00, 336.00, 390.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 13:33:29', '2022-10-12 11:19:47'),
(6440, 'SI-0000193', 'PDT-000116', '1', 2.00, 1421.00, 1600.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 13:33:29', '2022-10-12 11:19:47'),
(6441, 'SI-0000193', 'PDT-000159', '1', 2.00, 375.00, 480.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 13:33:29', '2022-10-12 11:19:47'),
(6442, 'SI-0000193', 'PDT-000029', '1', 2.00, 664.77, 840.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 13:33:29', '2022-10-12 11:19:47'),
(6443, 'SI-0000193', 'PDT-000189', '1', 5.00, 172.40, 210.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 13:33:29', '2022-10-12 11:19:47'),
(6444, 'SI-0000193', 'PDT-000109', '1', 2.00, 683.06, 750.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 13:33:29', '2022-10-12 11:19:47'),
(6445, 'SI-0000193', 'PDT-000096', '1', 4.00, 291.67, 450.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 13:33:29', '2022-10-12 11:19:47'),
(6446, 'SI-0000194', 'PDT-000146', '1', 4.00, 8.60, 10.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 13:39:53', '2022-10-12 11:19:48'),
(6447, 'SI-0000195', 'PDT-000161', '1', 1.00, 950.00, 1100.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 14:04:07', '2022-10-12 11:19:48'),
(6448, 'SI-0000196', 'PDT-000177', '1', 1.00, 30.11, 33.00, '0', 0.00, '2022-10-08', '1', NULL, 0, '1', '2022-10-08 14:07:34', '2022-10-12 11:19:48'),
(6449, 'SI-0000197', 'PDT-000059', '1', 2.00, 340.00, 400.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 04:38:15', '2022-10-12 11:19:48'),
(6450, 'SI-0000197', 'PDT-000067', '1', 1.00, 324.84, 350.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 04:38:15', '2022-10-12 11:19:48'),
(6451, 'SI-0000198', 'PDT-000211', '1', 1.00, 94.97, 110.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 04:59:17', '2022-10-12 11:19:48'),
(6452, 'SI-0000198', 'PDT-000184', '1', 1.00, 218.18, 240.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 04:59:17', '2022-10-12 11:19:48'),
(6453, 'SI-0000198', 'PDT-000271', '1', 1.00, 17.60, 20.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 04:59:17', '2022-10-12 11:19:48'),
(6454, 'SI-0000199', 'PDT-000170', '1', 1.00, 482.63, 530.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:02:14', '2022-10-12 11:19:48'),
(6455, 'SI-0000199', 'PDT-000228', '1', 1.00, 215.60, 230.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:02:14', '2022-10-12 11:19:48'),
(6456, 'SI-0000199', 'PDT-000124', '1', 1.00, 312.50, 440.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:02:14', '2022-10-12 11:19:48'),
(6457, 'SI-0000200', 'PDT-000272', '1', 7.00, 360.01, 390.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:14:27', '2022-10-12 11:19:49'),
(6458, 'SI-0000200', 'PDT-000108', '1', 20.00, 228.81, 250.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:14:27', '2022-10-12 11:19:49'),
(6459, 'SI-0000201', 'PDT-000239', '1', 1.00, 485.00, 550.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:18:37', '2022-10-12 11:19:49'),
(6460, 'SI-0000202', 'PDT-000197', '1', 1.00, 586.80, 630.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:19:27', '2022-10-12 11:19:49'),
(6461, 'SI-0000203', 'PDT-000099', '1', 1.00, 191.10, 215.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:20:41', '2022-10-12 11:19:49'),
(6462, 'SI-0000203', 'PDT-000258', '15', 10.00, 2725.00, 3142.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:20:41', '2022-10-12 11:19:49'),
(6463, 'SI-0000204', 'PDT-000009', '15', 21.00, 2725.00, 3080.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:21:57', '2022-10-12 11:19:49'),
(6464, 'SI-0000205', 'PDT-000009', '15', 22.00, 2725.00, 3080.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:23:54', '2022-10-12 11:19:49'),
(6465, 'SI-0000206', 'PDT-000258', '15', 10.00, 2725.00, 3080.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:25:19', '2022-10-12 11:19:49'),
(6466, 'SI-0000207', 'PDT-000248', '1', 2.00, 5.00, 7.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:37:38', '2022-10-12 11:19:50'),
(6467, 'SI-0000208', 'PDT-000034', '1', 4.00, 73.76, 80.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:45:44', '2022-10-12 11:19:50'),
(6468, 'SI-0000208', 'PDT-000090', '1', 3.00, 31.18, 35.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:45:44', '2022-10-12 11:19:50'),
(6469, 'SI-0000208', 'PDT-000223', '1', 2.00, 27.28, 31.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:45:44', '2022-10-12 11:19:50'),
(6470, 'SI-0000208', 'PDT-000006', '15', 1.00, 2573.00, 0.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:45:44', '2022-10-12 11:19:50'),
(6471, 'SI-0000208', 'PDT-000192', '1', 1.00, 13.20, 15.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:45:44', '2022-10-12 11:19:50'),
(6472, 'SI-0000208', 'PDT-000042', '1', 1.00, 192.53, 220.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:45:44', '2022-10-12 11:19:50'),
(6473, 'SI-0000208', 'PDT-000245', '1', 1.00, 100.00, 115.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:45:44', '2022-10-12 11:19:50'),
(6474, 'SI-0000208', 'PDT-000123', '1', 10.00, 16.24, 19.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:45:44', '2022-10-12 11:19:50'),
(6475, 'SI-0000208', 'PDT-000176', '1', 5.00, 20.58, 22.50, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:45:44', '2022-10-12 11:19:50'),
(6476, 'SI-0000208', 'PDT-000149', '1', 4.00, 3.43, 4.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:45:44', '2022-10-12 11:19:50'),
(6477, 'SI-0000208', 'PDT-000053', '1', 1.00, 179.67, 230.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:45:44', '2022-10-12 11:19:50'),
(6478, 'SI-0000209', 'PDT-000111', '1', 1.00, 480.00, 510.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:48:17', '2022-10-12 11:19:50'),
(6479, 'SI-0000209', 'PDT-000163', '1', 1.00, 264.55, 300.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:48:17', '2022-10-12 11:19:50'),
(6480, 'SI-0000210', 'PDT-000188', '1', 1.00, 417.16, 480.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:52:13', '2022-10-12 11:19:50'),
(6481, 'SI-0000210', 'PDT-000070', '1', 1.00, 909.00, 980.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 05:52:13', '2022-10-12 11:19:50'),
(6482, 'SI-0000211', 'PDT-000131', '1', 1.00, 111.35, 130.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 06:26:15', '2022-10-12 11:19:50'),
(6483, 'SI-0000211', 'PDT-000071', '1', 1.00, 787.50, 850.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 06:26:15', '2022-10-12 11:19:50'),
(6484, 'SI-0000211', 'PDT-000117', '1', 2.00, 20.89, 23.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 06:26:15', '2022-10-12 11:19:50'),
(6485, 'SI-0000212', 'PDT-000071', '1', 1.00, 787.50, 850.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:06:43', '2022-10-12 11:19:50'),
(6486, 'SI-0000213', 'PDT-000026', '1', 1.00, 31.76, 35.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:08:19', '2022-10-12 11:19:50'),
(6487, 'SI-0000213', 'PDT-000106', '1', 1.00, 13.75, 15.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:08:19', '2022-10-12 11:19:50'),
(6488, 'SI-0000213', 'PDT-000161', '1', 1.00, 950.00, 1100.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:08:19', '2022-10-12 11:19:50'),
(6489, 'SI-0000214', 'PDT-000161', '1', 1.00, 950.00, 1100.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:10:17', '2022-10-12 11:19:51'),
(6490, 'SI-0000214', 'PDT-000120', '1', 1.00, 181.82, 195.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:10:17', '2022-10-12 11:19:51'),
(6491, 'SI-0000214', 'PDT-000117', '1', 3.00, 20.89, 23.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:10:17', '2022-10-12 11:19:51'),
(6492, 'SI-0000214', 'PDT-000253', '1', 1.00, 272.81, 285.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:10:17', '2022-10-12 11:19:51'),
(6493, 'SI-0000215', 'PDT-000230', '1', 1.00, 362.70, 390.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:12:26', '2022-10-12 11:19:51'),
(6494, 'SI-0000215', 'PDT-000217', '1', 1.00, 118.95, 135.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:12:26', '2022-10-12 11:19:51'),
(6495, 'SI-0000215', 'PDT-000164', '1', 10.00, 10.14, 12.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:12:26', '2022-10-12 11:19:51'),
(6496, 'SI-0000215', 'PDT-000242', '1', 1.00, 76.13, 85.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:12:26', '2022-10-12 11:19:51'),
(6497, 'SI-0000215', 'PDT-000232', '1', 1.00, 539.40, 600.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:12:26', '2022-10-12 11:19:51'),
(6498, 'SI-0000216', 'PDT-000088', '1', 1.00, 85.96, 100.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:14:40', '2022-10-12 11:19:51'),
(6499, 'SI-0000216', 'PDT-000028', '1', 8.00, 2.59, 3.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:14:40', '2022-10-12 11:19:51'),
(6500, 'SI-0000216', 'PDT-000036', '1', 1.00, 286.65, 310.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:14:40', '2022-10-12 11:19:51'),
(6501, 'SI-0000216', 'PDT-000149', '1', 4.00, 3.43, 4.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:14:40', '2022-10-12 11:19:51'),
(6502, 'SI-0000216', 'PDT-000177', '1', 1.00, 30.11, 33.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:14:40', '2022-10-12 11:19:51'),
(6503, 'SI-0000217', 'PDT-000009', '15', 10.00, 2725.00, 3013.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:15:57', '2022-10-12 11:19:51'),
(6504, 'SI-0000217', 'PDT-000018', '1', 4.00, 171.61, 188.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:15:57', '2022-10-12 11:19:51'),
(6505, 'SI-0000218', 'PDT-000123', '1', 10.00, 16.24, 19.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:18:45', '2022-10-12 11:19:51'),
(6506, 'SI-0000218', 'PDT-000198', '1', 10.00, 26.29, 30.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:18:45', '2022-10-12 11:19:51'),
(6507, 'SI-0000218', 'PDT-000140', '1', 1.00, 52.91, 60.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:18:45', '2022-10-12 11:19:51'),
(6508, 'SI-0000218', 'PDT-000149', '1', 10.00, 3.43, 4.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:18:45', '2022-10-12 11:19:51'),
(6509, 'SI-0000218', 'PDT-000090', '1', 5.00, 31.18, 35.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:18:45', '2022-10-12 11:19:51'),
(6510, 'SI-0000219', 'PDT-000254', '1', 3.00, 309.00, 450.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:20:21', '2022-10-12 11:19:51'),
(6511, 'SI-0000219', 'PDT-000043', '1', 2.00, 116.78, 140.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:20:21', '2022-10-12 11:19:51'),
(6512, 'SI-0000219', 'PDT-000088', '1', 4.00, 85.96, 100.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:20:21', '2022-10-12 11:19:51'),
(6513, 'SI-0000220', 'PDT-000088', '1', 8.00, 85.96, 100.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:21:36', '2022-10-12 11:19:52'),
(6514, 'SI-0000220', 'PDT-000107', '1', 8.00, 161.87, 170.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:21:36', '2022-10-12 11:19:52'),
(6515, 'SI-0000220', 'PDT-000054', '1', 3.00, 624.92, 710.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:21:36', '2022-10-12 11:19:52'),
(6516, 'SI-0000221', 'PDT-000161', '1', 1.00, 950.00, 1100.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:22:06', '2022-10-12 11:19:52'),
(6517, 'SI-0000222', 'PDT-000149', '1', 4.00, 3.43, 4.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:25:47', '2022-10-12 11:19:52'),
(6518, 'SI-0000222', 'PDT-000177', '1', 1.00, 30.11, 33.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:25:47', '2022-10-12 11:19:52'),
(6519, 'SI-0000222', 'PDT-000026', '1', 1.00, 31.76, 35.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:25:47', '2022-10-12 11:19:52'),
(6520, 'SI-0000222', 'PDT-000106', '1', 1.00, 13.75, 15.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:25:47', '2022-10-12 11:19:52'),
(6521, 'SI-0000222', 'PDT-000038', '1', 2.00, 18.02, 20.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:25:47', '2022-10-12 11:19:52'),
(6522, 'SI-0000222', 'PDT-000037', '1', 10.00, 8.62, 10.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:25:47', '2022-10-12 11:19:52'),
(6523, 'SI-0000222', 'PDT-000029', '1', 2.00, 664.77, 720.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:25:47', '2022-10-12 11:19:52'),
(6524, 'SI-0000222', 'PDT-000253', '1', 1.00, 272.81, 285.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:25:47', '2022-10-12 11:19:52'),
(6525, 'SI-0000223', 'PDT-000079', '1', 5.00, 241.18, 250.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:27:38', '2022-10-12 11:19:52'),
(6526, 'SI-0000223', 'PDT-000095', '1', 5.00, 584.97, 600.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:27:38', '2022-10-12 11:19:52'),
(6527, 'SI-0000224', 'PDT-000081', '1', 4.00, 44.70, 60.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:29:35', '2022-10-12 11:19:53'),
(6528, 'SI-0000224', 'PDT-000053', '1', 1.00, 179.67, 230.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:29:35', '2022-10-12 11:19:53'),
(6529, 'SI-0000225', 'PDT-000126', '1', 10.00, 14.55, 17.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:39:31', '2022-10-12 11:19:53'),
(6530, 'SI-0000225', 'PDT-000184', '1', 1.00, 218.18, 240.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 11:39:31', '2022-10-12 11:19:53'),
(6531, 'SI-0000226', 'PDT-000127', '1', 3.00, 15.79, 18.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 12:29:06', '2022-10-12 11:19:53'),
(6532, 'SI-0000226', 'PDT-000131', '1', 2.00, 111.35, 120.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 12:29:06', '2022-10-12 11:19:53'),
(6533, 'SI-0000227', 'PDT-000103', '1', 3000.00, 39.00, 41.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 12:38:23', '2022-10-12 11:19:53'),
(6534, 'SI-0000227', 'PDT-000066', '1', 5.00, 265.91, 310.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 12:38:23', '2022-10-12 11:19:53'),
(6535, 'SI-0000227', 'PDT-000046', '1', 2.00, 99.78, 120.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 12:38:23', '2022-10-12 11:19:53'),
(6536, 'SI-0000227', 'PDT-000059', '1', 1.00, 340.00, 400.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 12:38:23', '2022-10-12 11:19:53'),
(6537, 'SI-0000227', 'PDT-000065', '1', 1.00, 66.82, 85.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 12:38:23', '2022-10-12 11:19:53'),
(6538, 'SI-0000227', 'PDT-000075', '1', 1.00, 383.15, 430.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 12:38:23', '2022-10-12 11:19:53'),
(6539, 'SI-0000227', 'PDT-000099', '1', 1.00, 191.10, 215.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 12:38:23', '2022-10-12 11:19:53'),
(6540, 'SI-0000227', 'PDT-000060', '1', 4.00, 187.09, 200.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 12:38:23', '2022-10-12 11:19:53'),
(6549, 'SI-0000229', 'PDT-000127', '1', 4.00, 15.79, 25.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 12:47:14', '2022-10-12 11:19:53'),
(6550, 'SI-0000229', 'PDT-000096', '1', 1.00, 291.67, 420.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 12:47:14', '2022-10-12 11:19:53'),
(6551, 'SI-0000230', 'PDT-000228', '1', 1.00, 215.60, 235.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 12:49:31', '2022-10-12 11:19:53'),
(6552, 'SI-0000230', 'PDT-000148', '1', 60.00, 1.95, 2.08, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 12:49:31', '2022-10-12 11:19:53'),
(6553, 'SI-0000231', 'PDT-000009', '15', 20.00, 2725.00, 3080.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 12:51:21', '2022-10-12 11:19:53'),
(6554, 'SI-0000232', 'PDT-000269', '15', 1.00, 1175.00, 1230.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 12:52:21', '2022-10-12 11:19:54'),
(6555, 'SI-0000233', 'PDT-000006', '15', 1.00, 2573.00, 2700.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 12:53:24', '2022-10-12 11:19:54'),
(6556, 'SI-0000234', 'PDT-000269', '15', 1.00, 1175.00, 1250.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 12:54:06', '2022-10-12 11:19:54'),
(6557, 'SI-0000235', 'PDT-000228', '1', 1.00, 215.60, 235.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 12:56:31', '2022-10-12 11:19:54'),
(6558, 'SI-0000236', 'PDT-000229', '1', 1.00, 940.80, 1000.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 12:59:37', '2022-10-12 11:19:54'),
(6559, 'SI-0000237', 'PDT-000088', '1', 12.00, 85.96, 100.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 13:04:02', '2022-10-12 11:19:55'),
(6560, 'SI-0000237', 'PDT-000059', '1', 1.00, 340.00, 400.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 13:04:02', '2022-10-12 11:19:55'),
(6561, 'SI-0000237', 'PDT-000053', '1', 2.00, 179.67, 230.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 13:04:02', '2022-10-12 11:19:55'),
(6562, 'SI-0000238', 'PDT-000225', '1', 1.00, 484.53, 515.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 13:08:14', '2022-10-12 11:19:55'),
(6563, 'SI-0000239', 'PDT-000009', '15', 30.00, 2725.00, 3080.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 13:10:34', '2022-10-12 11:19:55'),
(6564, 'SI-0000240', 'PDT-000258', '15', 10.00, 2725.00, 3080.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 13:11:40', '2022-10-12 11:19:55'),
(6574, 'SI-0000242', 'PDT-000270', '1', 2.00, 2250.00, 2270.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 13:50:15', '2022-10-12 11:19:55'),
(6575, 'SI-0000243', 'PDT-000270', '1', 4.00, 2250.00, 2270.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 13:51:58', '2022-10-12 11:19:56'),
(6576, 'SI-0000244', 'PDT-000024', '1', 1.00, 5.61, 7.00, '0', 0.00, '2022-10-09', '1', NULL, 0, '1', '2022-10-09 14:01:33', '2022-10-12 11:19:56'),
(6577, 'SI-0000245', 'PDT-000228', '1', 2.00, 215.60, 235.00, '0', 0.00, '2022-10-10', '1', NULL, 0, '1', '2022-10-10 04:35:28', '2022-10-12 11:19:56'),
(6578, 'SI-0000245', 'PDT-000242', '1', 2.00, 76.13, 85.00, '0', 0.00, '2022-10-10', '1', NULL, 0, '1', '2022-10-10 04:35:28', '2022-10-12 11:19:56'),
(6579, 'SI-0000246', 'PDT-000192', '1', 1.00, 13.20, 15.00, '0', 0.00, '2022-10-10', '1', NULL, 0, '1', '2022-10-10 11:29:14', '2022-10-12 11:19:56'),
(6580, 'SI-0000246', 'PDT-000028', '1', 8.00, 2.59, 3.00, '0', 0.00, '2022-10-10', '1', NULL, 0, '1', '2022-10-10 11:29:14', '2022-10-12 11:19:56'),
(6591, 'SI-0000247', 'PDT-000230', '1', 1.00, 362.70, 380.00, '0', 0.00, '2022-10-11', '1', NULL, 0, '1', '2022-10-11 05:27:30', '2022-10-12 11:19:56'),
(6592, 'SI-0000247', 'PDT-000128', '1', 1.00, 183.64, 195.00, '0', 0.00, '2022-10-11', '1', NULL, 0, '1', '2022-10-11 05:27:30', '2022-10-12 11:19:56'),
(6593, 'SI-0000247', 'PDT-000136', '1', 1.00, 254.15, 265.00, '0', 0.00, '2022-10-11', '1', NULL, 0, '1', '2022-10-11 05:27:30', '2022-10-12 11:19:56'),
(6595, 'SI-0000249', 'PDT-000176', '1', 4.00, 20.58, 22.50, '0', 0.00, '2022-10-12', '1', NULL, 0, '1', '2022-10-12 13:24:24', '2022-10-12 13:24:24'),
(6596, 'SI-0000250', 'PDT-000127', '1', 1.00, 15.79, 18.00, '0', 0.00, '2022-10-12', '1', NULL, 0, '1', '2022-10-12 13:59:01', '2022-10-12 13:59:01'),
(6597, 'SI-0000251', 'PDT-000149', '1', 5.00, 3.43, 4.00, '0', 0.00, '2022-10-13', '1', NULL, 0, '1', '2022-10-13 05:17:15', '2022-10-13 05:17:15'),
(6598, 'SI-0000251', 'PDT-000123', '1', 5.00, 16.24, 19.00, '0', 0.00, '2022-10-13', '1', NULL, 0, '1', '2022-10-13 05:17:15', '2022-10-13 05:17:15'),
(6599, 'SI-0000252', 'PDT-000149', '1', 4.00, 3.43, 4.00, '0', 0.00, '2022-10-13', '1', NULL, 0, '1', '2022-10-13 11:16:26', '2022-10-13 11:16:26'),
(6600, 'SI-0000253', 'PDT-000147', '1', 3.00, 17.20, 20.00, '0', 0.00, '2022-10-13', '1', NULL, 0, '1', '2022-10-13 12:20:13', '2022-10-13 12:20:13'),
(6601, 'SI-0000253', 'PDT-000150', '1', 3.00, 3.85, 4.00, '0', 0.00, '2022-10-13', '1', NULL, 0, '1', '2022-10-13 12:20:13', '2022-10-13 12:20:13'),
(6602, 'SI-0000254', 'PDT-000169', '1', 2.00, 8.39, 10.00, '0', 0.00, '2022-10-13', '1', NULL, 0, '1', '2022-10-13 13:46:38', '2022-10-13 13:46:38'),
(6603, 'SI-0000255', 'PDT-000235', '1', 1.00, 405.82, 410.00, '0', 0.00, '2022-10-13', '1', NULL, 0, '1', '2022-10-13 14:18:45', '2022-10-13 14:18:45'),
(6604, 'SI-0000256', 'PDT-000164', '1', 10.00, 10.14, 12.00, '0', 0.00, '2022-10-14', '1', NULL, 0, '1', '2022-10-14 04:08:54', '2022-10-14 04:08:54'),
(6605, 'SI-0000257', 'PDT-000169', '1', 2.00, 8.39, 10.00, '0', 0.00, '2022-10-14', '1', NULL, 0, '1', '2022-10-14 04:12:35', '2022-10-14 04:12:35'),
(6606, 'SI-0000258', 'PDT-000026', '1', 1.00, 31.76, 35.00, '0', 0.00, '2022-10-14', '1', NULL, 0, '1', '2022-10-14 11:39:13', '2022-10-14 11:39:13'),
(6607, 'SI-0000258', 'PDT-000106', '1', 1.00, 13.75, 15.00, '0', 0.00, '2022-10-14', '1', NULL, 0, '1', '2022-10-14 11:39:13', '2022-10-14 11:39:13'),
(6608, 'SI-0000259', 'PDT-000032', '1', 5.00, 5.56, 6.00, '0', 0.00, '2022-10-14', '1', NULL, 0, '1', '2022-10-14 12:42:46', '2022-10-14 12:42:46'),
(6609, 'SI-0000259', 'PDT-000149', '1', 5.00, 3.43, 4.00, '0', 0.00, '2022-10-14', '1', NULL, 0, '1', '2022-10-14 12:42:46', '2022-10-14 12:42:46'),
(6610, 'SI-0000259', 'PDT-000123', '1', 5.00, 16.24, 19.00, '0', 0.00, '2022-10-14', '1', NULL, 0, '1', '2022-10-14 12:42:46', '2022-10-14 12:42:46'),
(6611, 'SI-0000259', 'PDT-000176', '1', 2.00, 20.58, 22.50, '0', 0.00, '2022-10-14', '1', NULL, 0, '1', '2022-10-14 12:42:46', '2022-10-14 12:42:46'),
(6612, 'SI-0000259', 'PDT-000053', '1', 1.00, 179.67, 230.00, '0', 0.00, '2022-10-14', '1', NULL, 0, '1', '2022-10-14 12:42:46', '2022-10-14 12:42:46'),
(6613, 'SI-0000260', 'PDT-000259', '1', 1.00, 250.93, 255.00, '0', 0.00, '2022-10-15', '1', NULL, 0, '1', '2022-10-15 03:55:54', '2022-10-15 03:55:54'),
(6614, 'SI-0000260', 'PDT-000234', '1', 1.00, 599.85, 620.00, '0', 0.00, '2022-10-15', '1', NULL, 0, '1', '2022-10-15 03:55:54', '2022-10-15 03:55:54'),
(6615, 'SI-0000261', 'PDT-000137', '1', 1.00, 36.02, 40.00, '0', 0.00, '2022-10-15', '1', NULL, 0, '1', '2022-10-15 06:24:50', '2022-10-15 06:24:50'),
(6616, 'SI-0000261', 'PDT-000127', '1', 2.00, 15.79, 18.00, '0', 0.00, '2022-10-15', '1', NULL, 0, '1', '2022-10-15 06:24:50', '2022-10-15 06:24:50'),
(6617, 'SI-0000262', 'PDT-000161', '1', 1.00, 950.00, 1100.00, '0', 0.00, '2022-10-15', '1', NULL, 0, '1', '2022-10-15 12:43:07', '2022-10-15 12:43:07'),
(6618, 'SI-0000262', 'PDT-000117', '1', 4.00, 20.89, 23.00, '0', 0.00, '2022-10-15', '1', NULL, 0, '1', '2022-10-15 12:43:07', '2022-10-15 12:43:07'),
(6619, 'SI-0000262', 'PDT-000023', '1', 1.00, 208.93, 265.00, '0', 0.00, '2022-10-15', '1', NULL, 0, '1', '2022-10-15 12:43:07', '2022-10-15 12:43:07'),
(6620, 'SI-0000263', 'PDT-000163', '1', 1.00, 264.55, 287.00, '0', 0.00, '2022-10-15', '1', NULL, 0, '1', '2022-10-15 12:51:05', '2022-10-15 12:51:05'),
(6621, 'SI-0000264', 'PDT-000235', '1', 1.00, 405.82, 410.00, '0', 0.00, '2022-10-15', '1', NULL, 0, '1', '2022-10-15 14:10:57', '2022-10-15 14:10:57'),
(6622, 'SI-0000265', 'PDT-000177', '1', 1.00, 30.11, 33.00, '0', 0.00, '2022-10-16', '1', NULL, 0, '1', '2022-10-16 04:57:42', '2022-10-16 04:57:42'),
(6623, 'SI-0000266', 'PDT-000024', '1', 1.00, 5.61, 7.00, '0', 0.00, '2022-10-16', '1', NULL, 0, '1', '2022-10-16 05:23:07', '2022-10-16 05:23:07'),
(6624, 'SI-0000266', 'PDT-000090', '1', 1.00, 31.18, 35.00, '0', 0.00, '2022-10-16', '1', NULL, 0, '1', '2022-10-16 05:23:07', '2022-10-16 05:23:07'),
(6625, 'SI-0000266', 'PDT-000127', '1', 1.00, 15.79, 18.00, '0', 0.00, '2022-10-16', '1', NULL, 0, '1', '2022-10-16 05:23:07', '2022-10-16 05:23:07'),
(6627, 'SI-0000267', 'PDT-000269', '15', 1.00, 1175.00, 1250.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 13:25:01', '2022-10-26 09:08:39'),
(6628, 'SI-0000268', 'PDT-000111', '1', 1.00, 480.00, 510.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 13:25:57', '2022-10-26 09:08:39'),
(6629, 'SI-0000269', 'PDT-000028', '1', 5.00, 2.59, 3.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 13:30:49', '2022-10-26 09:08:39'),
(6630, 'SI-0000270', 'PDT-000023', '1', 1.00, 208.93, 265.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 13:39:21', '2022-10-26 09:08:39'),
(6631, 'SI-0000271', 'PDT-000108', '1', 2.00, 228.81, 250.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 13:40:11', '2022-10-26 09:08:39'),
(6632, 'SI-0000272', 'PDT-000140', '1', 1.00, 52.91, 60.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 13:44:29', '2022-10-26 09:08:39'),
(6633, 'SI-0000272', 'PDT-000170', '1', 1.00, 482.63, 525.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 13:44:29', '2022-10-26 09:08:39'),
(6634, 'SI-0000272', 'PDT-000177', '1', 2.00, 30.11, 33.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 13:44:29', '2022-10-26 09:08:39'),
(6635, 'SI-0000273', 'PDT-000189', '1', 1.00, 172.40, 200.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 14:00:19', '2022-10-26 09:08:39'),
(6636, 'SI-0000274', 'PDT-000144', '1', 2.00, 171.52, 185.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 14:11:37', '2022-10-26 09:08:39'),
(6637, 'SI-0000274', 'PDT-000197', '1', 2.00, 596.80, 530.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 14:11:37', '2022-10-26 09:08:39'),
(6638, 'SI-0000274', 'PDT-000235', '1', 1.00, 405.82, 445.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 14:11:37', '2022-10-26 09:08:39'),
(6639, 'SI-0000274', 'PDT-000269', '15', 1.00, 1175.00, 1250.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 14:11:37', '2022-10-26 09:08:39'),
(6640, 'SI-0000274', 'PDT-000139', '1', 1.00, 114.03, 130.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 14:11:37', '2022-10-26 09:08:39'),
(6641, 'SI-0000274', 'PDT-000177', '1', 2.00, 30.11, 33.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 14:11:37', '2022-10-26 09:08:39'),
(6642, 'SI-0000275', 'PDT-000251', '1', 1.00, 45.85, 50.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 14:22:31', '2022-10-26 09:08:39'),
(6643, 'SI-0000277', 'PDT-000035', '1', 1.00, 128.52, 150.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 14:23:18', '2022-10-26 09:08:39'),
(6644, 'SI-0000278', 'PDT-000099', '1', 3.00, 191.10, 215.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 14:25:06', '2022-10-26 09:08:39'),
(6645, 'SI-0000278', 'PDT-000079', '1', 4.00, 241.18, 300.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 14:25:06', '2022-10-26 09:08:39'),
(6646, 'SI-0000278', 'PDT-000159', '1', 1.00, 375.00, 410.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 14:25:06', '2022-10-26 09:08:39'),
(6647, 'SI-0000278', 'PDT-000208', '1', 2.00, 85.95, 100.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 14:25:06', '2022-10-26 09:08:39'),
(6649, 'SI-0000279', 'PDT-000146', '1', 4.00, 8.60, 10.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 14:33:57', '2022-10-26 09:08:39'),
(6650, 'SI-0000280', 'PDT-000001', '15', 2.00, 2842.00, 3417.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 15:43:58', '2022-10-26 09:08:39'),
(6651, 'SI-0000280', 'PDT-000103', '1', 1570.00, 39.00, 41.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 15:43:58', '2022-10-26 09:08:39'),
(6652, 'SI-0000280', 'PDT-000066', '1', 2.00, 265.91, 310.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 15:43:58', '2022-10-26 09:08:39'),
(6653, 'SI-0000280', 'PDT-000046', '1', 1.00, 99.78, 130.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 15:43:58', '2022-10-26 09:08:39'),
(6654, 'SI-0000280', 'PDT-000058', '1', 2.00, 83.78, 125.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 15:43:58', '2022-10-26 09:08:39'),
(6655, 'SI-0000280', 'PDT-000065', '1', 1.00, 66.82, 95.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 15:43:58', '2022-10-26 09:08:39'),
(6656, 'SI-0000280', 'PDT-000075', '1', 1.00, 383.15, 410.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 15:43:58', '2022-10-26 09:08:39'),
(6657, 'SI-0000280', 'PDT-000060', '1', 2.00, 187.09, 240.00, '0', 0.00, '2022-10-22', '1', NULL, 0, '1', '2022-10-22 15:43:58', '2022-10-26 09:08:39'),
(6658, 'SI-0000281', 'PDT-000270', '1', 2.00, 2250.00, 2270.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 13:08:40', '2022-10-27 13:08:40'),
(6659, 'SI-0000281', 'PDT-000079', '1', 2.00, 241.18, 300.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 13:08:40', '2022-10-27 13:08:40'),
(6660, 'SI-0000281', 'PDT-000075', '1', 1.00, 383.15, 430.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 13:08:40', '2022-10-27 13:08:40'),
(6661, 'SI-0000281', 'PDT-000110', '1', 1.00, 910.00, 950.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 13:08:40', '2022-10-27 13:08:40'),
(6662, 'SI-0000281', 'PDT-000114', '1', 1.00, 336.00, 360.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 13:08:40', '2022-10-27 13:08:40'),
(6663, 'SI-0000281', 'PDT-000158', '1', 1.00, 311.15, 340.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 13:08:40', '2022-10-27 13:08:40'),
(6664, 'SI-0000281', 'PDT-000057', '1', 2.00, 1296.78, 1500.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 13:08:40', '2022-10-27 13:08:40'),
(6665, 'SI-0000281', 'PDT-000044', '1', 1.00, 806.27, 900.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 13:08:40', '2022-10-27 13:08:40'),
(6666, 'SI-0000281', 'PDT-000254', '1', 1.00, 309.00, 450.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 13:08:40', '2022-10-27 13:08:40'),
(6667, 'SI-0000281', 'PDT-000029', '1', 1.00, 664.77, 720.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 13:08:40', '2022-10-27 13:08:40'),
(6668, 'SI-0000282', 'PDT-000270', '1', 4.00, 2250.00, 2270.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 13:10:10', '2022-10-27 13:10:10'),
(6670, 'SI-0000284', 'PDT-000192', '1', 1.00, 13.20, 15.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 13:19:21', '2022-10-27 13:19:21'),
(6671, 'SI-0000284', 'PDT-000028', '1', 8.00, 2.59, 3.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 13:19:21', '2022-10-27 13:19:21'),
(6672, 'SI-0000285', 'PDT-000024', '1', 1.00, 5.61, 7.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 13:20:57', '2022-10-27 13:20:57'),
(6673, 'SI-0000286', 'PDT-000223', '1', 2.00, 27.28, 31.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 13:43:07', '2022-10-27 13:43:07'),
(6674, 'SI-0000286', 'PDT-000267', '1', 10.00, 21.87, 25.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 13:43:07', '2022-10-27 13:43:07'),
(6675, 'SI-0000286', 'PDT-000148', '1', 60.00, 1.95, 2.20, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 13:43:07', '2022-10-27 13:43:07'),
(6676, 'SI-0000287', 'PDT-000029', '1', 1.00, 664.77, 720.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 13:43:53', '2022-10-27 13:43:53'),
(6677, 'SI-0000288', 'PDT-000148', '1', 12.00, 1.95, 2.20, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 13:48:57', '2022-10-27 13:48:57'),
(6678, 'SI-0000288', 'PDT-000149', '1', 6.00, 3.43, 4.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 13:48:57', '2022-10-27 13:48:57'),
(6679, 'SI-0000288', 'PDT-000146', '1', 6.00, 8.60, 10.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 13:48:57', '2022-10-27 13:48:57'),
(6680, 'SI-0000288', 'PDT-000035', '1', 1.00, 128.52, 150.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 13:48:57', '2022-10-27 13:48:57'),
(6681, 'SI-0000288', 'PDT-000261', '1', 1.00, 310.40, 370.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 13:48:57', '2022-10-27 13:48:57'),
(6682, 'SI-0000288', 'PDT-000169', '1', 28.00, 8.39, 10.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 13:48:57', '2022-10-27 13:48:57'),
(6683, 'SI-0000289', 'PDT-000230', '1', 1.00, 362.70, 380.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:00:51', '2022-10-27 14:00:51'),
(6684, 'SI-0000289', 'PDT-000128', '1', 1.00, 183.64, 195.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:00:51', '2022-10-27 14:00:51'),
(6685, 'SI-0000289', 'PDT-000136', '1', 1.00, 254.15, 265.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:00:51', '2022-10-27 14:00:51'),
(6686, 'SI-0000290', 'PDT-000006', '15', 1.00, 2625.00, 2700.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:06:52', '2022-10-27 14:06:52'),
(6687, 'SI-0000291', 'PDT-000023', '1', 2.00, 208.93, 265.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:08:14', '2022-10-27 14:08:14'),
(6688, 'SI-0000291', 'PDT-000261', '1', 1.00, 310.40, 370.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:08:14', '2022-10-27 14:08:14'),
(6689, 'SI-0000292', 'PDT-000097', '1', 2.00, 178.57, 200.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:12:53', '2022-10-27 14:12:53'),
(6690, 'SI-0000293', 'PDT-000117', '1', 3.00, 20.89, 23.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:14:04', '2022-10-27 14:14:04'),
(6691, 'SI-0000294', 'PDT-000123', '1', 5.00, 16.24, 19.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:15:29', '2022-10-27 14:15:29'),
(6692, 'SI-0000294', 'PDT-000198', '1', 5.00, 26.29, 30.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:15:29', '2022-10-27 14:15:29'),
(6693, 'SI-0000294', 'PDT-000149', '1', 5.00, 3.43, 4.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:15:29', '2022-10-27 14:15:29'),
(6694, 'SI-0000294', 'PDT-000139', '1', 1.00, 114.03, 130.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:15:29', '2022-10-27 14:15:29'),
(6695, 'SI-0000295', 'PDT-000001', '15', 1.00, 2842.00, 3245.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:27:23', '2022-10-27 14:27:23'),
(6696, 'SI-0000295', 'PDT-000103', '1', 4500.00, 39.00, 40.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:27:23', '2022-10-27 14:27:23'),
(6697, 'SI-0000295', 'PDT-000066', '1', 5.00, 265.89, 310.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:27:23', '2022-10-27 14:27:23'),
(6698, 'SI-0000295', 'PDT-000075', '1', 2.00, 383.15, 430.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:27:23', '2022-10-27 14:27:23'),
(6699, 'SI-0000295', 'PDT-000099', '1', 1.00, 191.10, 215.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:27:23', '2022-10-27 14:27:23'),
(6700, 'SI-0000295', 'PDT-000046', '1', 1.00, 99.78, 120.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:27:23', '2022-10-27 14:27:23'),
(6701, 'SI-0000295', 'PDT-000058', '1', 5.00, 83.78, 100.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:27:23', '2022-10-27 14:27:23'),
(6702, 'SI-0000295', 'PDT-000158', '1', 1.00, 311.15, 340.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:27:23', '2022-10-27 14:27:23'),
(6703, 'SI-0000295', 'PDT-000065', '1', 1.00, 66.82, 85.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:27:23', '2022-10-27 14:27:23'),
(6704, 'SI-0000295', 'PDT-000129', '1', 1.00, 796.41, 860.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:27:23', '2022-10-27 14:27:23'),
(6705, 'SI-0000296', 'PDT-000001', '15', 4.00, 2842.00, 3537.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:28:35', '2022-10-27 14:28:35'),
(6706, 'SI-0000297', 'PDT-000176', '1', 4.00, 20.58, 22.50, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:29:28', '2022-10-27 14:29:28'),
(6707, 'SI-0000298', 'PDT-000127', '1', 1.00, 15.79, 18.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:30:17', '2022-10-27 14:30:17'),
(6708, 'SI-0000299', 'PDT-000149', '1', 5.00, 3.43, 4.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:31:10', '2022-10-27 14:31:10'),
(6709, 'SI-0000299', 'PDT-000123', '1', 5.00, 16.24, 19.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:31:10', '2022-10-27 14:31:10'),
(6710, 'SI-0000300', 'PDT-000150', '1', 3.00, 3.85, 4.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:33:35', '2022-10-27 14:33:35'),
(6711, 'SI-0000300', 'PDT-000147', '1', 3.00, 17.20, 20.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:33:35', '2022-10-27 14:33:35'),
(6712, 'SI-0000300', 'PDT-000149', '1', 4.00, 3.43, 4.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:33:35', '2022-10-27 14:33:35'),
(6713, 'SI-0000300', 'PDT-000169', '1', 2.00, 8.39, 10.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:33:35', '2022-10-27 14:33:35'),
(6714, 'SI-0000300', 'PDT-000235', '1', 1.00, 405.82, 410.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:33:35', '2022-10-27 14:33:35'),
(6715, 'SI-0000301', 'PDT-000164', '1', 10.00, 10.14, 12.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:35:05', '2022-10-27 14:35:05'),
(6716, 'SI-0000301', 'PDT-000169', '1', 1.00, 8.39, 10.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:35:05', '2022-10-27 14:35:05'),
(6717, 'SI-0000301', 'PDT-000148', '1', 1.00, 1.95, 2.20, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:35:05', '2022-10-27 14:35:05'),
(6718, 'SI-0000301', 'PDT-000026', '1', 1.00, 31.76, 35.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:35:05', '2022-10-27 14:35:05'),
(6719, 'SI-0000301', 'PDT-000106', '1', 1.00, 13.75, 15.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:35:05', '2022-10-27 14:35:05'),
(6720, 'SI-0000302', 'PDT-000032', '1', 5.00, 5.56, 6.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:36:51', '2022-10-27 14:36:51'),
(6721, 'SI-0000302', 'PDT-000149', '1', 4.00, 3.43, 4.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:36:51', '2022-10-27 14:36:51'),
(6722, 'SI-0000302', 'PDT-000123', '1', 5.00, 16.24, 19.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:36:51', '2022-10-27 14:36:51'),
(6723, 'SI-0000302', 'PDT-000176', '1', 2.00, 20.58, 22.50, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:36:51', '2022-10-27 14:36:51'),
(6724, 'SI-0000302', 'PDT-000053', '1', 1.00, 179.67, 230.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:36:51', '2022-10-27 14:36:51'),
(6725, 'SI-0000303', 'PDT-000259', '1', 1.00, 250.93, 255.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:40:34', '2022-10-27 14:40:34'),
(6726, 'SI-0000303', 'PDT-000234', '1', 1.00, 599.85, 620.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:40:34', '2022-10-27 14:40:34'),
(6727, 'SI-0000304', 'PDT-000161', '1', 1.00, 950.00, 1100.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:41:14', '2022-10-27 14:41:14'),
(6728, 'SI-0000305', 'PDT-000117', '1', 3.00, 20.89, 23.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:42:23', '2022-10-27 14:42:23'),
(6729, 'SI-0000305', 'PDT-000023', '1', 1.00, 208.93, 265.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:42:23', '2022-10-27 14:42:23'),
(6730, 'SI-0000305', 'PDT-000163', '1', 1.00, 264.55, 287.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:42:23', '2022-10-27 14:42:23'),
(6731, 'SI-0000306', 'PDT-000215', '1', 4.00, 63.82, 70.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:49:22', '2022-10-27 14:49:22'),
(6732, 'SI-0000306', 'PDT-000149', '1', 4.00, 3.43, 4.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:49:22', '2022-10-27 14:49:22'),
(6733, 'SI-0000306', 'PDT-000279', '1', 2.00, 12.89, 15.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:49:22', '2022-10-27 14:49:22'),
(6734, 'SI-0000306', 'PDT-000038', '1', 2.00, 18.02, 20.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:49:22', '2022-10-27 14:49:22'),
(6735, 'SI-0000307', 'PDT-000277', '1', 1.00, 103.18, 115.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:51:07', '2022-10-27 14:51:07'),
(6736, 'SI-0000308', 'PDT-000006', '15', 1.00, 2625.00, 2700.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:52:17', '2022-10-27 14:52:17'),
(6737, 'SI-0000309', 'PDT-000235', '1', 1.00, 405.82, 420.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:53:21', '2022-10-27 14:53:21'),
(6738, 'SI-0000310', 'PDT-000078', '1', 20.00, 11.31, 15.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:54:24', '2022-10-27 14:54:24'),
(6739, 'SI-0000311', 'PDT-000009', '15', 30.00, 2855.00, 2932.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:56:36', '2022-10-27 14:56:36'),
(6740, 'SI-0000311', 'PDT-000258', '15', 5.00, 2855.00, 2942.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:56:36', '2022-10-27 14:56:36'),
(6741, 'SI-0000312', 'PDT-000001', '15', 5.00, 2842.00, 3242.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:59:18', '2022-10-27 14:59:18'),
(6742, 'SI-0000312', 'PDT-000258', '15', 31.00, 2855.00, 2942.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 14:59:18', '2022-10-27 14:59:18'),
(6743, 'SI-0000313', 'PDT-000258', '15', 4.00, 2855.00, 3100.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 15:03:04', '2022-10-27 15:03:04'),
(6744, 'SI-0000313', 'PDT-000009', '15', 30.00, 2855.00, 3100.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 15:03:04', '2022-10-27 15:03:04'),
(6745, 'SI-0000314', 'PDT-000123', '1', 5.00, 16.24, 19.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 15:04:08', '2022-10-27 15:04:08'),
(6746, 'SI-0000314', 'PDT-000149', '1', 5.00, 3.43, 4.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 15:04:08', '2022-10-27 15:04:08'),
(6747, 'SI-0000315', 'PDT-000074', '1', 9.00, 1185.78, 1350.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 15:06:22', '2022-10-27 15:06:22'),
(6748, 'SI-0000315', 'PDT-000105', '1', 36.00, 354.68, 385.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 15:06:22', '2022-10-27 15:06:22'),
(6749, 'SI-0000316', 'PDT-000026', '1', 1.00, 31.76, 35.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 15:06:55', '2022-10-27 15:06:55'),
(6750, 'SI-0000317', 'PDT-000146', '1', 5.00, 8.60, 10.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 15:08:00', '2022-10-27 15:08:00'),
(6751, 'SI-0000317', 'PDT-000149', '1', 5.00, 3.43, 4.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 15:08:00', '2022-10-27 15:08:00'),
(6752, 'SI-0000317', 'PDT-000148', '1', 5.00, 1.95, 2.20, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 15:08:00', '2022-10-27 15:08:00'),
(6753, 'SI-0000318', 'PDT-000119', '1', 1.00, 336.36, 370.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 15:09:30', '2022-10-27 15:09:30'),
(6754, 'SI-0000318', 'PDT-000269', '15', 1.00, 1175.00, 1350.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 15:09:30', '2022-10-27 15:09:30'),
(6755, 'SI-0000319', 'PDT-000254', '1', 8.00, 309.00, 450.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 15:10:15', '2022-10-27 15:10:15'),
(6756, 'SI-0000320', 'PDT-000254', '1', 4.00, 309.00, 450.00, '0', 0.00, '2022-10-27', '1', NULL, 0, '1', '2022-10-27 15:10:57', '2022-10-27 15:10:57'),
(6757, 'SI-0000321', 'PDT-000142', '1', 3.00, 17.38, 20.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 11:12:44', '2022-10-28 11:12:44'),
(6758, 'SI-0000321', 'PDT-000279', '1', 1.00, 12.89, 15.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 11:12:44', '2022-10-28 11:12:44'),
(6759, 'SI-0000322', 'PDT-000124', '1', 2.00, 312.50, 375.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:05:16', '2022-10-28 12:05:16'),
(6760, 'SI-0000322', 'PDT-000292', '15', 2.00, 1199.00, 1300.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:05:16', '2022-10-28 12:05:16'),
(6761, 'SI-0000322', 'PDT-000269', '15', 1.00, 1035.00, 1250.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:05:16', '2022-10-28 12:05:16'),
(6762, 'SI-0000323', 'PDT-000197', '1', 1.00, 596.80, 630.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:07:47', '2022-10-28 12:07:47'),
(6763, 'SI-0000323', 'PDT-000138', '1', 1.00, 206.36, 225.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:07:47', '2022-10-28 12:07:47'),
(6764, 'SI-0000324', 'PDT-000026', '1', 1.00, 31.76, 35.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:26:26', '2022-10-28 12:26:26'),
(6765, 'SI-0000324', 'PDT-000038', '1', 4.00, 18.02, 20.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:26:26', '2022-10-28 12:26:26'),
(6766, 'SI-0000324', 'PDT-000150', '1', 4.00, 3.85, 4.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:26:26', '2022-10-28 12:26:26'),
(6767, 'SI-0000325', 'PDT-000148', '1', 4.00, 1.95, 2.20, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:27:49', '2022-10-28 12:27:49'),
(6768, 'SI-0000326', 'PDT-000019', '1', 1.00, 365.62, 395.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:29:15', '2022-10-28 12:29:15'),
(6769, 'SI-0000327', 'PDT-000228', '1', 3.00, 233.33, 255.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:30:48', '2022-10-28 12:30:48'),
(6770, 'SI-0000328', 'PDT-000026', '1', 2.00, 31.76, 35.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:32:54', '2022-10-28 12:32:54'),
(6771, 'SI-0000328', 'PDT-000106', '1', 2.00, 13.75, 15.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:32:54', '2022-10-28 12:32:54'),
(6772, 'SI-0000328', 'PDT-000028', '1', 4.00, 2.59, 3.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:32:54', '2022-10-28 12:32:54'),
(6773, 'SI-0000329', 'PDT-000035', '1', 1.00, 128.52, 150.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:33:51', '2022-10-28 12:33:51'),
(6774, 'SI-0000330', 'PDT-000036', '1', 1.00, 286.65, 310.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:35:17', '2022-10-28 12:35:17'),
(6775, 'SI-0000331', 'PDT-000090', '1', 5.00, 31.18, 35.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:36:43', '2022-10-28 12:36:43'),
(6776, 'SI-0000331', 'PDT-000131', '1', 1.00, 111.35, 130.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:36:43', '2022-10-28 12:36:43'),
(6777, 'SI-0000332', 'PDT-000089', '1', 5.00, 18.38, 22.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:38:58', '2022-10-28 12:38:58'),
(6778, 'SI-0000332', 'PDT-000123', '1', 5.00, 16.24, 19.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:38:58', '2022-10-28 12:38:58'),
(6779, 'SI-0000332', 'PDT-000176', '1', 3.00, 20.58, 22.50, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:38:58', '2022-10-28 12:38:58'),
(6780, 'SI-0000332', 'PDT-000032', '1', 3.00, 5.56, 6.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:38:58', '2022-10-28 12:38:58'),
(6781, 'SI-0000333', 'PDT-000177', '1', 1.00, 30.11, 33.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:40:36', '2022-10-28 12:40:36'),
(6782, 'SI-0000333', 'PDT-000200', '1', 3.00, 73.53, 90.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:40:36', '2022-10-28 12:40:36'),
(6783, 'SI-0000333', 'PDT-000279', '1', 1.00, 12.89, 15.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:40:36', '2022-10-28 12:40:36');
INSERT INTO `sales_entry` (`id`, `invoice_no`, `product_id`, `sub_unit_id`, `product_quantity`, `product_purchase_price`, `product_sales_price`, `product_discount_amount`, `return_quantity`, `entry_date`, `branch_id`, `note`, `status`, `admin_id`, `created_at`, `updated_at`) VALUES
(6784, 'SI-0000334', 'PDT-000081', '1', 2.00, 44.70, 60.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:55:45', '2022-10-28 12:55:45'),
(6785, 'SI-0000334', 'PDT-000150', '1', 4.00, 3.85, 4.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:55:45', '2022-10-28 12:55:45'),
(6786, 'SI-0000334', 'PDT-000126', '1', 3.00, 14.55, 17.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:55:45', '2022-10-28 12:55:45'),
(6787, 'SI-0000335', 'PDT-000126', '1', 10.00, 14.55, 17.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:57:09', '2022-10-28 12:57:09'),
(6788, 'SI-0000336', 'PDT-000124', '1', 1.00, 312.50, 375.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:58:53', '2022-10-28 12:58:53'),
(6789, 'SI-0000336', 'PDT-000126', '1', 2.00, 14.55, 17.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 12:58:53', '2022-10-28 12:58:53'),
(6790, 'SI-0000337', 'PDT-000097', '1', 2.00, 178.57, 195.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 13:01:41', '2022-10-28 13:01:41'),
(6791, 'SI-0000338', 'PDT-000193', '1', 10.00, 10.50, 12.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 13:26:50', '2022-10-28 13:26:50'),
(6792, 'SI-0000338', 'PDT-000141', '1', 10.00, 13.80, 15.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 13:26:50', '2022-10-28 13:26:50'),
(6793, 'SI-0000338', 'PDT-000288', '1', 1.00, 349.86, 390.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 13:26:50', '2022-10-28 13:26:50'),
(6794, 'SI-0000339', 'PDT-000192', '1', 1.00, 13.20, 15.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 13:27:54', '2022-10-28 13:27:54'),
(6795, 'SI-0000339', 'PDT-000026', '1', 1.00, 31.76, 35.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 13:27:54', '2022-10-28 13:27:54'),
(6796, 'SI-0000340', 'PDT-000034', '1', 1.00, 73.76, 80.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 13:29:22', '2022-10-28 13:29:22'),
(6797, 'SI-0000341', 'PDT-000006', '15', 1.00, 2625.00, 2700.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 13:31:09', '2022-10-28 13:31:09'),
(6798, 'SI-0000342', 'PDT-000127', '1', 2.00, 15.79, 18.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 13:33:05', '2022-10-28 13:33:05'),
(6799, 'SI-0000342', 'PDT-000024', '1', 1.00, 5.61, 7.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 13:33:05', '2022-10-28 13:33:05'),
(6800, 'SI-0000343', 'PDT-000163', '1', 2.00, 264.55, 287.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 13:34:11', '2022-10-28 13:34:11'),
(6801, 'SI-0000344', 'PDT-000026', '1', 2.00, 31.76, 35.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 13:35:17', '2022-10-28 13:35:17'),
(6802, 'SI-0000344', 'PDT-000106', '1', 1.00, 13.75, 15.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 13:35:17', '2022-10-28 13:35:17'),
(6803, 'SI-0000345', 'PDT-000034', '1', 1.00, 73.76, 80.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 13:36:32', '2022-10-28 13:36:32'),
(6804, 'SI-0000346', 'PDT-000188', '1', 1.00, 417.16, 460.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 13:38:52', '2022-10-28 13:38:52'),
(6805, 'SI-0000346', 'PDT-000276', '1', 9.00, 129.34, 140.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 13:38:52', '2022-10-28 13:38:52'),
(6806, 'SI-0000347', 'PDT-000208', '1', 3.00, 85.95, 100.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 13:39:36', '2022-10-28 13:39:36'),
(6807, 'SI-0000348', 'PDT-000283', '1', 20.00, 8.91, 11.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 13:41:18', '2022-10-28 13:41:18'),
(6808, 'SI-0000348', 'PDT-000288', '1', 1.00, 349.86, 380.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 13:41:18', '2022-10-28 13:41:18'),
(6814, 'SI-0000350', 'PDT-000130', '1', 2.00, 81.72, 90.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 14:03:15', '2022-10-28 14:03:15'),
(6815, 'SI-0000351', 'PDT-000119', '1', 1.00, 336.36, 370.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 14:04:06', '2022-10-28 14:04:06'),
(6816, 'SI-0000352', 'PDT-000292', '15', 1.00, 1199.00, 1350.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 14:05:35', '2022-10-28 14:05:35'),
(6817, 'SI-0000353', 'PDT-000028', '1', 4.00, 2.59, 3.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 14:06:52', '2022-10-28 14:06:52'),
(6818, 'SI-0000353', 'PDT-000148', '1', 12.00, 1.95, 2.20, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 14:06:52', '2022-10-28 14:06:52'),
(6819, 'SI-0000354', 'PDT-000272', '1', 3.00, 360.01, 390.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 14:09:17', '2022-10-28 14:09:17'),
(6820, 'SI-0000354', 'PDT-000108', '1', 7.00, 228.81, 250.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 14:09:17', '2022-10-28 14:09:17'),
(6821, 'SI-0000354', 'PDT-000107', '1', 10.00, 161.87, 170.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 14:09:17', '2022-10-28 14:09:17'),
(6822, 'SI-0000355', 'PDT-000026', '1', 1.00, 31.76, 35.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 14:10:09', '2022-10-28 14:10:09'),
(6823, 'SI-0000355', 'PDT-000106', '1', 1.00, 13.75, 15.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 14:10:09', '2022-10-28 14:10:09'),
(6824, 'SI-0000356', 'PDT-000064', '1', 3.00, 1271.33, 1450.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 14:20:30', '2022-10-28 14:20:30'),
(6825, 'SI-0000356', 'PDT-000074', '1', 3.00, 1185.78, 1350.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 14:20:30', '2022-10-28 14:20:30'),
(6826, 'SI-0000356', 'PDT-000182', '1', 5.00, 268.80, 290.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 14:20:30', '2022-10-28 14:20:30'),
(6827, 'SI-0000356', 'PDT-000111', '1', 2.00, 480.00, 510.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 14:20:30', '2022-10-28 14:20:30'),
(6828, 'SI-0000356', 'PDT-000096', '1', 1.00, 291.67, 330.00, '0', 0.00, '2022-10-28', '1', NULL, 0, '1', '2022-10-28 14:20:30', '2022-10-28 14:20:30'),
(6829, 'SI-0000357', 'PDT-000123', '1', 6.00, 16.24, 19.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 04:47:11', '2022-10-29 04:47:11'),
(6830, 'SI-0000357', 'PDT-000176', '1', 6.00, 20.58, 22.50, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 04:47:11', '2022-10-29 04:47:11'),
(6831, 'SI-0000357', 'PDT-000149', '1', 10.00, 3.43, 4.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 04:47:11', '2022-10-29 04:47:11'),
(6832, 'SI-0000357', 'PDT-000279', '1', 3.00, 12.89, 15.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 04:47:11', '2022-10-29 04:47:11'),
(6833, 'SI-0000357', 'PDT-000220', '1', 3.00, 38.27, 42.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 04:47:11', '2022-10-29 04:47:11'),
(6834, 'SI-0000357', 'PDT-000154', '1', 1.00, 165.49, 185.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 04:47:11', '2022-10-29 04:47:11'),
(6835, 'SI-0000358', 'PDT-000220', '1', 5.00, 38.27, 42.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 04:50:43', '2022-10-29 04:50:43'),
(6836, 'SI-0000359', 'PDT-000146', '1', 6.00, 8.60, 10.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 11:38:55', '2022-10-29 11:38:55'),
(6837, 'SI-0000359', 'PDT-000149', '1', 12.00, 3.43, 4.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 11:38:55', '2022-10-29 11:38:55'),
(6838, 'SI-0000359', 'PDT-000053', '1', 1.00, 179.67, 230.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 11:38:55', '2022-10-29 11:38:55'),
(6839, 'SI-0000360', 'PDT-000119', '1', 1.00, 336.36, 370.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 11:46:10', '2022-10-29 11:46:10'),
(6840, 'SI-0000361', 'PDT-000033', '1', 1.00, 582.58, 630.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:15:59', '2022-10-29 12:15:59'),
(6841, 'SI-0000361', 'PDT-000061', '1', 5.00, 72.32, 80.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:15:59', '2022-10-29 12:15:59'),
(6842, 'SI-0000361', 'PDT-000138', '1', 2.00, 206.36, 225.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:15:59', '2022-10-29 12:15:59'),
(6843, 'SI-0000361', 'PDT-000156', '1', 1.00, 728.00, 900.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:15:59', '2022-10-29 12:15:59'),
(6844, 'SI-0000362', 'PDT-000177', '1', 1.00, 30.11, 33.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:16:58', '2022-10-29 12:16:58'),
(6848, 'SI-0000363', 'PDT-000269', '15', 1.00, 1035.00, 1250.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:20:52', '2022-10-29 12:20:52'),
(6849, 'SI-0000363', 'PDT-000292', '15', 1.00, 1199.00, 1350.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:20:52', '2022-10-29 12:20:52'),
(6850, 'SI-0000363', 'PDT-000177', '1', 1.00, 30.11, 33.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:20:52', '2022-10-29 12:20:52'),
(6851, 'SI-0000364', 'PDT-000114', '1', 2.00, 336.00, 360.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:24:28', '2022-10-29 12:24:28'),
(6852, 'SI-0000364', 'PDT-000048', '1', 1.00, 117.00, 140.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:24:28', '2022-10-29 12:24:28'),
(6853, 'SI-0000364', 'PDT-000188', '1', 1.00, 417.16, 480.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:24:28', '2022-10-29 12:24:28'),
(6854, 'SI-0000365', 'PDT-000026', '1', 2.00, 31.76, 35.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:25:32', '2022-10-29 12:25:32'),
(6855, 'SI-0000365', 'PDT-000106', '1', 2.00, 13.75, 15.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:25:32', '2022-10-29 12:25:32'),
(6856, 'SI-0000366', 'PDT-000140', '1', 1.00, 52.91, 60.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:26:22', '2022-10-29 12:26:22'),
(6857, 'SI-0000367', 'PDT-000016', '1', 800.00, 41.00, 44.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:39:06', '2022-10-29 12:39:06'),
(6858, 'SI-0000367', 'PDT-000001', '15', 2.00, 3085.80, 3244.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:39:06', '2022-10-29 12:39:06'),
(6859, 'SI-0000367', 'PDT-000035', '1', 1.00, 128.52, 150.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:39:06', '2022-10-29 12:39:06'),
(6860, 'SI-0000367', 'PDT-000065', '1', 1.00, 66.82, 85.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:39:06', '2022-10-29 12:39:06'),
(6861, 'SI-0000367', 'PDT-000066', '1', 2.00, 265.89, 310.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:39:06', '2022-10-29 12:39:06'),
(6862, 'SI-0000367', 'PDT-000114', '1', 1.00, 336.00, 360.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:39:06', '2022-10-29 12:39:06'),
(6863, 'SI-0000368', 'PDT-000257', '1', 1.00, 56.00, 70.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:41:26', '2022-10-29 12:41:26'),
(6864, 'SI-0000368', 'PDT-000123', '1', 3.00, 16.24, 19.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:41:26', '2022-10-29 12:41:26'),
(6865, 'SI-0000368', 'PDT-000149', '1', 6.00, 3.43, 4.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:41:26', '2022-10-29 12:41:26'),
(6866, 'SI-0000368', 'PDT-000146', '1', 6.00, 8.60, 10.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:41:26', '2022-10-29 12:41:26'),
(6867, 'SI-0000369', 'PDT-000117', '1', 3.00, 20.89, 23.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 12:51:30', '2022-10-29 12:51:30'),
(6868, 'SI-0000370', 'PDT-000281', '1', 1.00, 295.85, 350.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 13:44:02', '2022-10-29 13:44:02'),
(6869, 'SI-0000371', 'PDT-000074', '1', 1.00, 1185.78, 1350.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 13:46:53', '2022-10-29 13:46:53'),
(6870, 'SI-0000371', 'PDT-000105', '1', 5.00, 354.68, 370.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 13:46:53', '2022-10-29 13:46:53'),
(6871, 'SI-0000372', 'PDT-000006', '15', 1.00, 2625.00, 2700.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 13:48:01', '2022-10-29 13:48:01'),
(6872, 'SI-0000373', 'PDT-000039', '1', 1.00, 60.06, 60.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 13:49:23', '2022-10-29 13:49:23'),
(6873, 'SI-0000374', 'PDT-000148', '1', 2.00, 1.95, 2.20, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 13:51:02', '2022-10-29 13:51:02'),
(6874, 'SI-0000374', 'PDT-000126', '1', 1.00, 14.55, 17.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 13:51:02', '2022-10-29 13:51:02'),
(6875, 'SI-0000375', 'PDT-000269', '15', 1.00, 1035.00, 1250.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 13:52:14', '2022-10-29 13:52:14'),
(6876, 'SI-0000376', 'PDT-000245', '1', 1.00, 100.00, 115.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 13:53:21', '2022-10-29 13:53:21'),
(6877, 'SI-0000377', 'PDT-000253', '1', 1.00, 272.81, 285.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 13:56:32', '2022-10-29 13:56:32'),
(6878, 'SI-0000378', 'PDT-000117', '1', 3.00, 20.89, 23.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 14:31:16', '2022-10-29 14:31:16'),
(6879, 'SI-0000379', 'PDT-000074', '1', 1.00, 1185.78, 1350.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 14:32:46', '2022-10-29 14:32:46'),
(6880, 'SI-0000379', 'PDT-000105', '1', 1.00, 354.68, 385.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 14:32:46', '2022-10-29 14:32:46'),
(6881, 'SI-0000381', 'PDT-000023', '1', 1.00, 208.93, 265.00, '0', 0.00, '2022-10-29', '1', NULL, 0, '1', '2022-10-29 14:33:56', '2022-10-29 14:33:56'),
(6882, 'SI-0000382', 'PDT-000026', '1', 2.00, 31.76, 35.00, '0', 0.00, '2022-10-30', '1', NULL, 0, '1', '2022-10-30 05:16:35', '2022-10-30 05:16:35'),
(6883, 'SI-0000382', 'PDT-000106', '1', 2.00, 13.75, 15.00, '0', 0.00, '2022-10-30', '1', NULL, 0, '1', '2022-10-30 05:16:35', '2022-10-30 05:16:35'),
(6884, 'SI-0000383', 'PDT-000017', '1', 36.00, 4.04, 5.00, '0', 0.00, '2022-10-30', '1', NULL, 0, '1', '2022-10-30 12:49:31', '2022-10-30 12:49:31'),
(6885, 'SI-0000383', 'PDT-000209', '1', 1.00, 242.50, 265.00, '0', 0.00, '2022-10-30', '1', NULL, 0, '1', '2022-10-30 12:49:31', '2022-10-30 12:49:31'),
(6886, 'SI-0000383', 'PDT-000241', '1', 1.00, 77.94, 87.00, '0', 0.00, '2022-10-30', '1', NULL, 0, '1', '2022-10-30 12:49:31', '2022-10-30 12:49:31'),
(6887, 'SI-0000384', 'PDT-000269', '15', 1.00, 1035.00, 1250.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 04:35:53', '2022-10-31 04:35:53'),
(6888, 'SI-0000385', 'PDT-000035', '1', 1.00, 128.52, 150.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 04:58:52', '2022-10-31 04:58:52'),
(6889, 'SI-0000386', 'PDT-000154', '1', 1.00, 165.49, 180.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 07:02:28', '2022-10-31 07:02:28'),
(6890, 'SI-0000386', 'PDT-000132', '1', 1.00, 93.84, 100.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 07:02:28', '2022-10-31 07:02:28'),
(6891, 'SI-0000387', 'PDT-000182', '1', 1.00, 268.80, 290.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 10:27:37', '2022-10-31 10:27:37'),
(6892, 'SI-0000387', 'PDT-000026', '1', 5.00, 31.76, 35.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 10:27:37', '2022-10-31 10:27:37'),
(6893, 'SI-0000387', 'PDT-000035', '1', 1.00, 128.52, 150.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 10:27:37', '2022-10-31 10:27:37'),
(6894, 'SI-0000387', 'PDT-000114', '1', 1.00, 336.00, 360.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 10:27:37', '2022-10-31 10:27:37'),
(6895, 'SI-0000387', 'PDT-000138', '1', 1.00, 206.36, 225.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 10:27:37', '2022-10-31 10:27:37'),
(6896, 'SI-0000387', 'PDT-000028', '1', 40.00, 2.59, 3.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 10:27:37', '2022-10-31 10:27:37'),
(6897, 'SI-0000388', 'PDT-000022', '1', 4.00, 87.52, 95.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 11:21:53', '2022-10-31 11:21:53'),
(6898, 'SI-0000388', 'PDT-000132', '1', 1.00, 93.84, 105.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 11:21:53', '2022-10-31 11:21:53'),
(6899, 'SI-0000388', 'PDT-000160', '1', 1.00, 168.18, 190.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 11:21:53', '2022-10-31 11:21:53'),
(6900, 'SI-0000389', 'PDT-000006', '15', 1.00, 2625.00, 2700.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 12:50:19', '2022-10-31 12:50:19'),
(6902, 'SI-0000390', 'PDT-000001', '15', 2.00, 3085.80, 3417.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 13:36:16', '2022-10-31 13:36:16'),
(6903, 'SI-0000390', 'PDT-000103', '1', 1570.00, 39.00, 41.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 13:36:16', '2022-10-31 13:36:16'),
(6904, 'SI-0000390', 'PDT-000066', '1', 2.00, 265.89, 310.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 13:36:16', '2022-10-31 13:36:16'),
(6905, 'SI-0000390', 'PDT-000046', '1', 1.00, 99.78, 120.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 13:36:16', '2022-10-31 13:36:16'),
(6906, 'SI-0000390', 'PDT-000058', '1', 2.00, 83.78, 100.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 13:36:16', '2022-10-31 13:36:16'),
(6907, 'SI-0000390', 'PDT-000065', '1', 1.00, 66.82, 85.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 13:36:16', '2022-10-31 13:36:16'),
(6908, 'SI-0000390', 'PDT-000075', '1', 1.00, 383.15, 430.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 13:36:16', '2022-10-31 13:36:16'),
(6909, 'SI-0000391', 'PDT-000077', '1', 3.00, 1506.82, 1630.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 14:29:01', '2022-10-31 14:29:01'),
(6910, 'SI-0000391', 'PDT-000159', '1', 1.00, 375.00, 410.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 14:29:01', '2022-10-31 14:29:01'),
(6911, 'SI-0000391', 'PDT-000071', '1', 1.00, 787.50, 850.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 14:29:01', '2022-10-31 14:29:01'),
(6912, 'SI-0000392', 'PDT-000196', '1', 1.00, 232.26, 245.00, '0', 0.00, '2022-10-31', '1', NULL, 0, '1', '2022-10-31 15:08:59', '2022-10-31 15:08:59'),
(6913, 'SI-0000394', 'PDT-000140', '1', 1.00, 52.91, 60.00, '0', 0.00, '2022-11-01', '1', NULL, 0, '1', '2022-11-01 04:49:52', '2022-11-01 04:49:52'),
(6914, 'SI-0000394', 'PDT-000146', '1', 6.00, 8.60, 10.00, '0', 0.00, '2022-11-01', '1', NULL, 0, '1', '2022-11-01 04:49:53', '2022-11-01 04:49:53'),
(6915, 'SI-0000394', 'PDT-000149', '1', 6.00, 3.43, 4.00, '0', 0.00, '2022-11-01', '1', NULL, 0, '1', '2022-11-01 04:49:53', '2022-11-01 04:49:53'),
(6916, 'SI-0000395', 'PDT-000031', '1', 1.00, 126.98, 140.00, '0', 0.00, '2022-11-01', '1', NULL, 0, '1', '2022-11-01 12:00:30', '2022-11-01 12:00:30'),
(6917, 'SI-0000396', 'PDT-000026', '1', 2.00, 31.76, 35.00, '0', 0.00, '2022-11-01', '1', NULL, 0, '1', '2022-11-01 12:17:29', '2022-11-01 12:17:29'),
(6918, 'SI-0000396', 'PDT-000106', '1', 2.00, 13.75, 15.00, '0', 0.00, '2022-11-01', '1', NULL, 0, '1', '2022-11-01 12:17:29', '2022-11-01 12:17:29'),
(6919, 'SI-0000397', 'PDT-000166', '1', 2.00, 30.02, 35.00, '0', 0.00, '2022-11-01', '1', NULL, 0, '1', '2022-11-01 12:18:49', '2022-11-01 12:18:49'),
(6920, 'SI-0000398', 'PDT-000018', '1', 3.00, 171.61, 188.00, '0', 0.00, '2022-11-01', '1', NULL, 0, '1', '2022-11-01 12:44:04', '2022-11-01 12:44:04'),
(6921, 'SI-0000398', 'PDT-000023', '1', 1.00, 208.93, 265.00, '0', 0.00, '2022-11-01', '1', NULL, 0, '1', '2022-11-01 12:44:04', '2022-11-01 12:44:04'),
(6922, 'SI-0000399', 'PDT-000136', '1', 1.00, 254.15, 285.00, '0', 0.00, '2022-11-01', '1', NULL, 0, '1', '2022-11-01 14:14:21', '2022-11-01 14:14:21'),
(6923, 'SI-0000399', 'PDT-000123', '1', 20.00, 16.24, 19.00, '0', 0.00, '2022-11-01', '1', NULL, 0, '1', '2022-11-01 14:14:21', '2022-11-01 14:14:21'),
(6924, 'SI-0000400', 'PDT-000146', '1', 20.00, 8.60, 9.00, '0', 0.00, '2022-11-01', '1', NULL, 0, '1', '2022-11-01 14:18:54', '2022-11-01 14:18:54'),
(6925, 'SI-0000400', 'PDT-000140', '1', 3.00, 52.91, 60.00, '0', 0.00, '2022-11-01', '1', NULL, 0, '1', '2022-11-01 14:18:54', '2022-11-01 14:18:54'),
(6926, 'SI-0000401', 'PDT-000275', '1', 1.00, 26.45, 32.00, '0', 0.00, '2022-11-01', '1', NULL, 0, '1', '2022-11-01 14:26:22', '2022-11-01 14:26:22'),
(6927, 'SI-0000402', 'PDT-000021', '1', 2.00, 127.80, 140.00, '0', 0.00, '2022-11-02', '1', NULL, 0, '1', '2022-11-02 03:21:42', '2022-11-02 03:21:42'),
(6928, 'SI-0000402', 'PDT-000157', '1', 1.00, 190.00, 210.00, '0', 0.00, '2022-11-02', '1', NULL, 0, '1', '2022-11-02 03:21:42', '2022-11-02 03:21:42'),
(6931, 'SI-0000403', 'PDT-000150', '1', 40.00, 3.85, 4.00, '0', 0.00, '2022-11-02', '1', NULL, 0, '1', '2022-11-02 05:24:35', '2022-11-02 05:24:35'),
(6932, 'SI-0000403', 'PDT-000174', '1', 1.00, 550.00, 590.00, '0', 0.00, '2022-11-02', '1', NULL, 0, '1', '2022-11-02 05:24:35', '2022-11-02 05:24:35'),
(6933, 'SI-0000404', 'PDT-000176', '1', 6.00, 20.58, 22.50, '0', 0.00, '2022-11-02', '1', NULL, 0, '1', '2022-11-02 06:17:56', '2022-11-02 06:17:56'),
(6934, 'SI-0000404', 'PDT-000123', '1', 6.00, 16.24, 19.00, '0', 0.00, '2022-11-02', '1', NULL, 0, '1', '2022-11-02 06:17:56', '2022-11-02 06:17:56'),
(6935, 'SI-0000404', 'PDT-000132', '1', 1.00, 93.84, 105.00, '0', 0.00, '2022-11-02', '1', NULL, 0, '1', '2022-11-02 06:17:56', '2022-11-02 06:17:56'),
(6936, 'SI-0000404', 'PDT-000149', '1', 1.00, 3.43, 4.00, '0', 0.00, '2022-11-02', '1', NULL, 0, '1', '2022-11-02 06:17:56', '2022-11-02 06:17:56'),
(6937, 'SI-0000405', 'PDT-000071', '1', 1.00, 787.50, 850.00, '0', 0.00, '2022-11-02', '1', NULL, 0, '1', '2022-11-02 10:47:54', '2022-11-02 10:47:54'),
(6938, 'SI-0000406', 'PDT-000177', '1', 1.00, 30.11, 33.00, '0', 0.00, '2022-11-03', '1', NULL, 0, '1', '2022-11-03 04:09:36', '2022-11-03 04:09:36'),
(6939, 'SI-0000407', 'PDT-000006', '15', 1.00, 2625.00, 2700.00, '0', 0.00, '2022-11-03', '1', NULL, 0, '1', '2022-11-03 04:10:32', '2022-11-03 04:10:32'),
(6941, 'SI-0000409', 'PDT-000066', '1', 5.00, 265.89, 310.00, '0', 0.00, '2022-11-03', '1', NULL, 0, '1', '2022-11-03 04:16:37', '2022-11-03 04:16:37'),
(6942, 'SI-0000409', 'PDT-000075', '1', 2.00, 383.15, 430.00, '0', 0.00, '2022-11-03', '1', NULL, 0, '1', '2022-11-03 04:16:37', '2022-11-03 04:16:37'),
(6943, 'SI-0000409', 'PDT-000099', '1', 1.00, 191.10, 215.00, '0', 0.00, '2022-11-03', '1', NULL, 0, '1', '2022-11-03 04:16:37', '2022-11-03 04:16:37'),
(6944, 'SI-0000409', 'PDT-000046', '1', 1.00, 99.78, 120.00, '0', 0.00, '2022-11-03', '1', NULL, 0, '1', '2022-11-03 04:16:37', '2022-11-03 04:16:37'),
(6945, 'SI-0000409', 'PDT-000058', '1', 5.00, 83.78, 100.00, '0', 0.00, '2022-11-03', '1', NULL, 0, '1', '2022-11-03 04:16:37', '2022-11-03 04:16:37'),
(6946, 'SI-0000409', 'PDT-000158', '1', 1.00, 311.15, 340.00, '0', 0.00, '2022-11-03', '1', NULL, 0, '1', '2022-11-03 04:16:37', '2022-11-03 04:16:37'),
(6947, 'SI-0000409', 'PDT-000129', '1', 1.00, 796.41, 860.00, '0', 0.00, '2022-11-03', '1', NULL, 0, '1', '2022-11-03 04:16:37', '2022-11-03 04:16:37'),
(6948, 'SI-0000409', 'PDT-000065', '1', 1.00, 66.82, 85.00, '0', 0.00, '2022-11-03', '1', NULL, 0, '1', '2022-11-03 04:16:37', '2022-11-03 04:16:37'),
(6949, 'SI-0000410', 'PDT-000269', '15', 1.00, 1035.00, 1250.00, '0', 0.00, '2022-11-03', '1', NULL, 0, '1', '2022-11-03 04:26:37', '2022-11-03 04:26:37'),
(6950, 'SI-0000411', 'PDT-000220', '1', 1.00, 38.27, 42.00, '0', 0.00, '2022-11-03', '1', NULL, 0, '1', '2022-11-03 04:59:53', '2022-11-03 04:59:53'),
(6951, 'SI-0000412', 'PDT-000220', '1', 5.00, 38.27, 42.00, '0', 0.00, '2022-11-03', '1', NULL, 0, '1', '2022-11-03 05:04:12', '2022-11-03 05:04:12'),
(6952, 'SI-0000413', 'PDT-000037', '1', 6.00, 8.62, 10.00, '0', 0.00, '2022-11-03', '1', NULL, 0, '1', '2022-11-03 05:17:59', '2022-11-03 05:17:59'),
(6953, 'SI-0000413', 'PDT-000124', '1', 1.00, 312.50, 375.00, '0', 0.00, '2022-11-03', '1', NULL, 0, '1', '2022-11-03 05:17:59', '2022-11-03 05:17:59'),
(6954, 'SI-0000414', 'PDT-000123', '1', 6.00, 16.24, 19.00, '0', 0.00, '2022-11-03', '1', NULL, 0, '1', '2022-11-03 12:20:38', '2022-11-03 12:20:38'),
(6955, 'SI-0000415', 'PDT-000253', '1', 1.00, 272.81, 285.00, '0', 0.00, '2022-11-03', '1', NULL, 0, '1', '2022-11-03 12:46:46', '2022-11-03 12:46:46'),
(6956, 'SI-0000415', 'PDT-000209', '1', 1.00, 242.50, 265.00, '0', 0.00, '2022-11-03', '1', NULL, 0, '1', '2022-11-03 12:46:46', '2022-11-03 12:46:46'),
(6957, 'SI-0000416', 'PDT-000269', '15', 1.00, 1035.00, 1250.00, '0', 0.00, '2022-11-03', '1', NULL, 0, '1', '2022-11-03 13:31:38', '2022-11-03 13:31:38'),
(6958, 'SI-0000416', 'PDT-000124', '1', 1.00, 312.50, 375.00, '0', 0.00, '2022-11-03', '1', NULL, 0, '1', '2022-11-03 13:31:38', '2022-11-03 13:31:38'),
(6959, 'SI-0000417', 'PDT-000136', '1', 2.00, 254.15, 285.00, '0', 0.00, '2022-11-03', '1', NULL, 0, '1', '2022-11-03 13:37:25', '2022-11-03 13:37:25'),
(6960, 'SI-0000418', 'PDT-000136', '1', 1.00, 254.15, 285.00, '0', 0.00, '2022-11-03', '1', NULL, 0, '1', '2022-11-03 13:52:32', '2022-11-03 13:52:32'),
(6961, 'SI-0000418', 'PDT-000024', '1', 5.00, 5.61, 7.00, '0', 0.00, '2022-11-03', '1', NULL, 0, '1', '2022-11-03 13:52:32', '2022-11-03 13:52:32'),
(6962, 'SI-0000419', 'PDT-000023', '1', 2.00, 208.93, 265.00, '0', 0.00, '2022-11-04', '1', NULL, 0, '1', '2022-11-04 04:58:38', '2022-11-04 04:58:38'),
(6963, 'SI-0000419', 'PDT-000253', '1', 1.00, 272.81, 285.00, '0', 0.00, '2022-11-04', '1', NULL, 0, '1', '2022-11-04 04:58:38', '2022-11-04 04:58:38'),
(6964, 'SI-0000420', 'PDT-000269', '15', 1.00, 1035.00, 1250.00, '0', 0.00, '2022-11-04', '1', NULL, 0, '1', '2022-11-04 05:05:25', '2022-11-04 05:05:25'),
(6965, 'SI-0000421', 'PDT-000123', '1', 6.00, 16.24, 19.00, '0', 0.00, '2022-11-04', '1', NULL, 0, '1', '2022-11-04 11:55:33', '2022-11-04 11:55:33'),
(6966, 'SI-0000421', 'PDT-000149', '1', 6.00, 3.43, 4.00, '0', 0.00, '2022-11-04', '1', NULL, 0, '1', '2022-11-04 11:55:33', '2022-11-04 11:55:33'),
(6967, 'SI-0000421', 'PDT-000176', '1', 4.00, 20.58, 22.50, '0', 0.00, '2022-11-04', '1', NULL, 0, '1', '2022-11-04 11:55:33', '2022-11-04 11:55:33'),
(6968, 'SI-0000422', 'PDT-000197', '1', 1.00, 596.80, 630.00, '0', 0.00, '2022-11-04', '1', NULL, 0, '1', '2022-11-04 12:01:42', '2022-11-04 12:01:42'),
(6969, 'SI-0000423', 'PDT-000148', '1', 16.00, 1.95, 2.20, '0', 0.00, '2022-11-04', '1', NULL, 0, '1', '2022-11-04 14:48:26', '2022-11-04 14:48:26'),
(6970, 'SI-0000423', 'PDT-000149', '1', 4.00, 3.43, 4.00, '0', 0.00, '2022-11-04', '1', NULL, 0, '1', '2022-11-04 14:48:26', '2022-11-04 14:48:26'),
(6971, 'SI-0000424', 'PDT-000093', '1', 1.00, 157.29, 180.00, '0', 0.00, '2022-11-05', '1', NULL, 0, '1', '2022-11-05 04:43:50', '2022-11-05 04:43:50'),
(6972, 'SI-0000425', 'PDT-000266', '1', 8.00, 9.21, 12.00, '0', 0.00, '2022-11-05', '1', NULL, 0, '1', '2022-11-05 05:45:39', '2022-11-05 05:45:39'),
(6973, 'SI-0000426', 'PDT-000255', '15', 30.00, 2785.45, 2932.00, '0', 0.00, '2022-11-05', '1', NULL, 0, '1', '2022-11-05 13:41:35', '2022-11-05 13:41:35'),
(6974, 'SI-0000426', 'PDT-000018', '1', 3.00, 171.61, 188.00, '0', 0.00, '2022-11-05', '1', NULL, 0, '1', '2022-11-05 13:41:35', '2022-11-05 13:41:35'),
(6975, 'SI-0000426', 'PDT-000023', '1', 1.00, 208.93, 265.00, '0', 0.00, '2022-11-05', '1', NULL, 0, '1', '2022-11-05 13:41:35', '2022-11-05 13:41:35'),
(6976, 'SI-0000427', 'PDT-000001', '15', 10.00, 3054.90, 3244.00, '0', 0.00, '2022-11-05', '1', NULL, 0, '1', '2022-11-05 13:44:40', '2022-11-05 13:44:40'),
(6977, 'SI-0000428', 'PDT-000298', '1', 1.00, 370.00, 380.00, '0', 0.00, '2022-11-05', '1', NULL, 0, '1', '2022-11-05 14:02:59', '2022-11-05 14:02:59'),
(6978, 'SI-0000429', 'PDT-000060', '1', 1.00, 187.09, 200.00, '0', 0.00, '2022-11-05', '1', NULL, 0, '1', '2022-11-05 14:16:02', '2022-11-05 14:16:02'),
(6979, 'SI-0000430', 'PDT-000125', '1', 10.00, 30.00, 35.00, '0', 0.00, '2022-11-05', '1', NULL, 0, '1', '2022-11-05 14:21:50', '2022-11-05 14:21:50'),
(6980, 'SI-0000430', 'PDT-000189', '1', 1.00, 172.40, 230.00, '0', 0.00, '2022-11-05', '1', NULL, 0, '1', '2022-11-05 14:21:50', '2022-11-05 14:21:50'),
(6981, 'SI-0000430', 'PDT-000209', '1', 1.00, 242.50, 280.00, '0', 0.00, '2022-11-05', '1', NULL, 0, '1', '2022-11-05 14:21:50', '2022-11-05 14:21:50'),
(6982, 'SI-0000430', 'PDT-000127', '1', 4.00, 15.79, 20.00, '0', 0.00, '2022-11-05', '1', NULL, 0, '1', '2022-11-05 14:21:50', '2022-11-05 14:21:50'),
(6983, 'SI-0000430', 'PDT-000023', '1', 1.00, 208.93, 265.00, '0', 0.00, '2022-11-05', '1', NULL, 0, '1', '2022-11-05 14:21:50', '2022-11-05 14:21:50'),
(6984, 'SI-0000431', 'PDT-000132', '1', 1.00, 93.84, 105.00, '0', 0.00, '2022-11-06', '1', NULL, 0, '1', '2022-11-06 04:33:22', '2022-11-06 04:33:22'),
(6985, 'SI-0000431', 'PDT-000154', '1', 1.00, 165.49, 185.00, '0', 0.00, '2022-11-06', '1', NULL, 0, '1', '2022-11-06 04:33:22', '2022-11-06 04:33:22'),
(6986, 'SI-0000432', 'PDT-000297', '1', 1.00, 279.07, 310.00, '0', 0.00, '2022-11-06', '1', NULL, 0, '1', '2022-11-06 04:35:36', '2022-11-06 04:35:36'),
(6987, 'SI-0000433', 'PDT-000020', '1', 5.00, 155.61, 170.00, '0', 0.00, '2022-11-06', '1', NULL, 0, '1', '2022-11-06 13:18:23', '2022-11-06 13:18:23'),
(6988, 'SI-0000433', 'PDT-000157', '1', 1.00, 190.00, 210.00, '0', 0.00, '2022-11-06', '1', NULL, 0, '1', '2022-11-06 13:18:23', '2022-11-06 13:18:23'),
(6989, 'SI-0000434', 'PDT-000244', '1', 1.00, 83.75, 85.00, '0', 0.00, '2022-11-06', '1', NULL, 0, '1', '2022-11-06 13:21:53', '2022-11-06 13:21:53'),
(6990, 'SI-0000435', 'PDT-000034', '1', 4.00, 73.76, 80.00, '0', 0.00, '2022-11-06', '1', NULL, 0, '1', '2022-11-06 13:23:45', '2022-11-06 13:23:45'),
(6991, 'SI-0000435', 'PDT-000148', '1', 60.00, 1.95, 2.20, '0', 0.00, '2022-11-06', '1', NULL, 0, '1', '2022-11-06 13:23:45', '2022-11-06 13:23:45'),
(6992, 'SI-0000436', 'PDT-000146', '1', 20.00, 8.60, 9.00, '0', 0.00, '2022-11-07', '1', NULL, 0, '1', '2022-11-07 10:43:55', '2022-11-07 10:43:55'),
(6993, 'SI-0000436', 'PDT-000140', '1', 3.00, 52.91, 60.00, '0', 0.00, '2022-11-07', '1', NULL, 0, '1', '2022-11-07 10:43:55', '2022-11-07 10:43:55'),
(6994, 'SI-0000437', 'PDT-000149', '1', 12.00, 3.43, 4.00, '0', 0.00, '2022-11-07', '1', NULL, 0, '1', '2022-11-07 12:57:56', '2022-11-07 12:57:56'),
(6995, 'SI-0000437', 'PDT-000146', '1', 6.00, 8.60, 10.00, '0', 0.00, '2022-11-07', '1', NULL, 0, '1', '2022-11-07 12:57:56', '2022-11-07 12:57:56'),
(6996, 'SI-0000438', 'PDT-000148', '1', 4.00, 1.95, 2.20, '0', 0.00, '2022-11-07', '1', NULL, 0, '1', '2022-11-07 13:00:28', '2022-11-07 13:00:28'),
(6997, 'SI-0000439', 'PDT-000163', '1', 2.00, 264.55, 280.00, '0', 0.00, '2022-11-07', '1', NULL, 0, '1', '2022-11-07 14:02:40', '2022-11-07 14:02:40'),
(6998, 'SI-0000439', 'PDT-000023', '1', 1.00, 208.93, 240.00, '0', 0.00, '2022-11-07', '1', NULL, 0, '1', '2022-11-07 14:02:41', '2022-11-07 14:02:41'),
(6999, 'SI-0000439', 'PDT-000256', '1', 1.00, 1250.00, 1350.00, '0', 0.00, '2022-11-07', '1', NULL, 0, '1', '2022-11-07 14:02:41', '2022-11-07 14:02:41'),
(7000, 'SI-0000440', 'PDT-000146', '1', 11.00, 8.60, 10.00, '0', 0.00, '2022-11-07', '1', NULL, 0, '1', '2022-11-07 14:04:42', '2022-11-07 14:04:42'),
(7001, 'SI-0000440', 'PDT-000148', '1', 60.00, 1.95, 2.20, '0', 0.00, '2022-11-07', '1', NULL, 0, '1', '2022-11-07 14:04:42', '2022-11-07 14:04:42'),
(7002, 'SI-0000441', 'PDT-000138', '1', 2.00, 206.36, 225.00, '0', 0.00, '2022-11-07', '1', NULL, 0, '1', '2022-11-07 14:16:07', '2022-11-07 14:16:07'),
(7003, 'SI-0000441', 'PDT-000234', '1', 5.00, 599.85, 720.00, '0', 0.00, '2022-11-07', '1', NULL, 0, '1', '2022-11-07 14:16:07', '2022-11-07 14:16:07'),
(7004, 'SI-0000441', 'PDT-000269', '15', 1.00, 1035.00, 1250.00, '0', 0.00, '2022-11-07', '1', NULL, 0, '1', '2022-11-07 14:16:07', '2022-11-07 14:16:07'),
(7005, 'SI-0000442', 'PDT-000031', '1', 1.00, 126.98, 140.00, '0', 0.00, '2022-11-07', '1', NULL, 0, '1', '2022-11-07 14:21:12', '2022-11-07 14:21:12'),
(7006, 'SI-0000442', 'PDT-000279', '1', 1.00, 12.89, 15.00, '0', 0.00, '2022-11-07', '1', NULL, 0, '1', '2022-11-07 14:21:12', '2022-11-07 14:21:12'),
(7007, 'SI-0000443', 'PDT-000149', '1', 6.00, 3.43, 4.00, '0', 0.00, '2022-11-07', '1', NULL, 0, '1', '2022-11-07 14:29:55', '2022-11-07 14:29:55'),
(7008, 'SI-0000444', 'PDT-000114', '1', 2.00, 336.00, 360.00, '0', 0.00, '2022-11-08', '1', NULL, 0, '1', '2022-11-08 04:48:56', '2022-11-08 04:48:56'),
(7009, 'SI-0000445', 'PDT-000269', '15', 2.00, 1035.00, 1250.00, '0', 0.00, '2022-11-08', '1', NULL, 0, '1', '2022-11-08 05:25:20', '2022-11-08 05:25:20'),
(7010, 'SI-0000446', 'PDT-000155', '1', 1.00, 703.12, 900.00, '0', 0.00, '2022-11-08', '1', NULL, 0, '1', '2022-11-08 07:29:16', '2022-11-08 07:29:16'),
(7011, 'SI-0000446', 'PDT-000029', '1', 1.00, 664.77, 720.00, '0', 0.00, '2022-11-08', '1', NULL, 0, '1', '2022-11-08 07:29:16', '2022-11-08 07:29:16'),
(7012, 'SI-0000447', 'PDT-000269', '15', 1.00, 1095.00, 1250.00, '0', 0.00, '2022-11-08', '1', NULL, 0, '1', '2022-11-08 07:34:58', '2022-11-08 07:34:58'),
(7013, 'SI-0000448', 'PDT-000269', '15', 1.00, 1095.00, 1250.00, '0', 0.00, '2022-11-08', '1', NULL, 0, '1', '2022-11-08 07:37:21', '2022-11-08 07:37:21'),
(7014, 'SI-0000449', 'PDT-000192', '1', 1.00, 13.20, 15.00, '0', 0.00, '2022-11-09', '1', NULL, 0, '1', '2022-11-09 04:30:27', '2022-11-09 04:30:27'),
(7015, 'SI-0000450', 'PDT-000269', '15', 1.00, 1095.00, 1250.00, '0', 0.00, '2022-11-09', '1', NULL, 0, '1', '2022-11-09 06:38:17', '2022-11-09 06:38:17'),
(7016, 'SI-0000450', 'PDT-000296', '1', 3.00, 860.00, 1030.00, '0', 0.00, '2022-11-09', '1', NULL, 0, '1', '2022-11-09 06:38:17', '2022-11-09 06:38:17'),
(7017, 'SI-0000450', 'PDT-000163', '1', 1.00, 264.55, 287.00, '0', 0.00, '2022-11-09', '1', NULL, 0, '1', '2022-11-09 06:38:17', '2022-11-09 06:38:17'),
(7018, 'SI-0000451', 'PDT-000148', '1', 4.00, 1.95, 2.20, '0', 0.00, '2022-11-09', '1', NULL, 0, '1', '2022-11-09 06:58:30', '2022-11-09 06:58:30'),
(7019, 'SI-0000452', 'PDT-000096', '1', 1.00, 291.67, 330.00, '0', 0.00, '2022-11-09', '1', NULL, 0, '1', '2022-11-09 12:47:41', '2022-11-09 12:47:41'),
(7020, 'SI-0000453', 'PDT-000300', '1', 3.00, 80.00, 90.00, '0', 0.00, '2022-11-09', '1', NULL, 0, '1', '2022-11-09 12:59:56', '2022-11-09 12:59:56'),
(7021, 'SI-0000453', 'PDT-000286', '1', 2.00, 12.89, 15.00, '0', 0.00, '2022-11-09', '1', NULL, 0, '1', '2022-11-09 12:59:56', '2022-11-09 12:59:56'),
(7022, 'SI-0000453', 'PDT-000130', '1', 2.00, 81.72, 90.00, '0', 0.00, '2022-11-09', '1', NULL, 0, '1', '2022-11-09 12:59:56', '2022-11-09 12:59:56'),
(7023, 'SI-0000453', 'PDT-000177', '1', 2.00, 30.11, 33.00, '0', 0.00, '2022-11-09', '1', NULL, 0, '1', '2022-11-09 12:59:56', '2022-11-09 12:59:56'),
(7024, 'SI-0000453', 'PDT-000034', '1', 1.00, 86.13, 95.00, '0', 0.00, '2022-11-09', '1', NULL, 0, '1', '2022-11-09 12:59:56', '2022-11-09 12:59:56'),
(7025, 'SI-0000453', 'PDT-000053', '1', 1.00, 179.67, 230.00, '0', 0.00, '2022-11-09', '1', NULL, 0, '1', '2022-11-09 12:59:56', '2022-11-09 12:59:56'),
(7026, 'SI-0000454', 'PDT-000215', '1', 1.00, 63.82, 70.00, '0', 0.00, '2022-11-09', '1', NULL, 0, '1', '2022-11-09 13:22:36', '2022-11-09 13:22:36'),
(7027, 'SI-0000455', 'PDT-000050', '1', 1.00, 81.96, 100.00, '0', 0.00, '2022-11-10', '1', NULL, 0, '1', '2022-11-10 03:37:50', '2022-11-10 03:37:50'),
(7028, 'SI-0000455', 'PDT-000108', '1', 1.00, 228.81, 250.00, '0', 0.00, '2022-11-10', '1', NULL, 0, '1', '2022-11-10 03:37:50', '2022-11-10 03:37:50'),
(7029, 'SI-0000456', 'PDT-000198', '1', 6.00, 26.29, 30.00, '0', 0.00, '2022-11-10', '1', NULL, 0, '1', '2022-11-10 03:52:38', '2022-11-10 03:52:38'),
(7030, 'SI-0000456', 'PDT-000123', '1', 7.00, 16.24, 19.00, '0', 0.00, '2022-11-10', '1', NULL, 0, '1', '2022-11-10 03:52:38', '2022-11-10 03:52:38'),
(7031, 'SI-0000456', 'PDT-000149', '1', 3.00, 3.43, 4.00, '0', 0.00, '2022-11-10', '1', NULL, 0, '1', '2022-11-10 03:52:38', '2022-11-10 03:52:38'),
(7032, 'SI-0000456', 'PDT-000125', '1', 3.00, 30.00, 35.00, '0', 0.00, '2022-11-10', '1', NULL, 0, '1', '2022-11-10 03:52:38', '2022-11-10 03:52:38'),
(7033, 'SI-0000456', 'PDT-000127', '1', 3.00, 15.79, 18.00, '0', 0.00, '2022-11-10', '1', NULL, 0, '1', '2022-11-10 03:52:38', '2022-11-10 03:52:38'),
(7034, 'SI-0000456', 'PDT-000023', '1', 1.00, 208.93, 265.00, '0', 0.00, '2022-11-10', '1', NULL, 0, '1', '2022-11-10 03:52:38', '2022-11-10 03:52:38'),
(7035, 'SI-0000457', 'PDT-000148', '1', 8.00, 1.95, 2.20, '0', 0.00, '2022-11-10', '1', NULL, 0, '1', '2022-11-10 04:25:54', '2022-11-10 04:25:54'),
(7036, 'SI-0000458', 'PDT-000269', '15', 1.00, 1095.00, 1250.00, '0', 0.00, '2022-11-10', '1', NULL, 0, '1', '2022-11-10 04:28:43', '2022-11-10 04:28:43'),
(7037, 'SI-0000459', 'PDT-000141', '1', 12.00, 13.80, 15.00, '0', 0.00, '2022-11-10', '1', NULL, 0, '1', '2022-11-10 04:35:58', '2022-11-10 04:35:58'),
(7038, 'SI-0000459', 'PDT-000217', '1', 1.00, 119.56, 135.00, '0', 0.00, '2022-11-10', '1', NULL, 0, '1', '2022-11-10 04:35:58', '2022-11-10 04:35:58'),
(7039, 'SI-0000460', 'PDT-000148', '1', 60.00, 1.95, 2.20, '0', 0.00, '2022-11-10', '1', NULL, 0, '1', '2022-11-10 04:38:19', '2022-11-10 04:38:19'),
(7040, 'SI-0000461', 'PDT-000081', '1', 3.00, 44.70, 60.00, '0', 0.00, '2022-11-10', '1', NULL, 0, '1', '2022-11-10 04:50:11', '2022-11-10 04:50:11'),
(7042, 'SI-0000462', 'PDT-000069', '1', 1.00, 3290.62, 3500.00, '0', 0.00, '2022-11-10', '1', NULL, 0, '1', '2022-11-10 06:28:58', '2022-11-10 06:28:58'),
(7043, 'SI-0000462', 'PDT-000092', '1', 5.00, 285.09, 315.00, '0', 0.00, '2022-11-10', '1', NULL, 0, '1', '2022-11-10 06:28:58', '2022-11-10 06:28:58'),
(7044, 'SI-0000463', 'PDT-000089', '1', 15.00, 18.38, 21.00, '0', 0.00, '2022-11-10', '1', NULL, 0, '1', '2022-11-10 08:03:53', '2022-11-10 08:03:53'),
(7045, 'SI-0000463', 'PDT-000127', '1', 5.00, 15.79, 18.00, '0', 0.00, '2022-11-10', '1', NULL, 0, '1', '2022-11-10 08:03:53', '2022-11-10 08:03:53'),
(7046, 'SI-0000464', 'PDT-000108', '1', 20.00, 228.81, 250.00, '0', 0.00, '2022-11-10', '1', NULL, 0, '1', '2022-11-10 13:42:56', '2022-11-10 13:42:56'),
(7047, 'SI-0000464', 'PDT-000057', '1', 2.00, 1296.78, 1500.00, '0', 0.00, '2022-11-10', '1', NULL, 0, '1', '2022-11-10 13:42:56', '2022-11-10 13:42:56'),
(7048, 'SI-0000465', 'PDT-000229', '1', 1.00, 940.80, 1050.00, '0', 0.00, '2022-11-10', '1', NULL, 0, '1', '2022-11-10 14:20:23', '2022-11-10 14:20:23'),
(7049, 'SI-0000465', 'PDT-000130', '1', 1.00, 81.72, 90.00, '0', 0.00, '2022-11-10', '1', NULL, 0, '1', '2022-11-10 14:20:23', '2022-11-10 14:20:23'),
(7050, 'SI-0000466', 'PDT-000049', '1', 1.00, 16.66, 20.00, '0', 0.00, '2022-11-11', '1', NULL, 0, '1', '2022-11-11 05:31:22', '2022-11-11 05:31:22'),
(7051, 'SI-0000467', 'PDT-000049', '1', 10.00, 16.66, 20.00, '0', 0.00, '2022-11-11', '1', NULL, 0, '1', '2022-11-11 10:17:08', '2022-11-11 10:17:08'),
(7052, 'SI-0000467', 'PDT-000002', '15', 8.00, 3054.90, 3244.00, '0', 0.00, '2022-11-11', '1', NULL, 0, '1', '2022-11-11 10:17:08', '2022-11-11 10:17:08'),
(7053, 'SI-0000468', 'PDT-000121', '1', 1.00, 162.39, 180.00, '0', 0.00, '2022-11-11', '1', NULL, 0, '1', '2022-11-11 13:31:37', '2022-11-11 13:31:37'),
(7054, 'SI-0000468', 'PDT-000130', '1', 1.00, 81.72, 90.00, '0', 0.00, '2022-11-11', '1', NULL, 0, '1', '2022-11-11 13:31:37', '2022-11-11 13:31:37'),
(7056, 'SI-0000469', 'PDT-000210', '1', 3.00, 134.00, 150.00, '0', 0.00, '2022-11-11', '1', NULL, 0, '1', '2022-11-11 14:35:56', '2022-11-11 14:35:56'),
(7057, 'SI-0000470', 'PDT-000177', '1', 1.00, 30.11, 33.00, '0', 0.00, '2022-11-12', '1', NULL, 0, '1', '2022-11-12 04:19:14', '2022-11-12 04:19:14'),
(7058, 'SI-0000471', 'PDT-000060', '1', 1.00, 187.09, 200.00, '0', 0.00, '2022-11-12', '1', NULL, 0, '1', '2022-11-12 04:27:06', '2022-11-12 04:27:06'),
(7059, 'SI-0000472', 'PDT-000198', '1', 7.00, 26.29, 30.00, '0', 0.00, '2022-11-12', '1', NULL, 0, '1', '2022-11-12 05:52:31', '2022-11-12 05:52:31'),
(7060, 'SI-0000472', 'PDT-000123', '1', 7.00, 16.24, 19.00, '0', 0.00, '2022-11-12', '1', NULL, 0, '1', '2022-11-12 05:52:31', '2022-11-12 05:52:31'),
(7061, 'SI-0000472', 'PDT-000149', '1', 7.00, 3.43, 4.00, '0', 0.00, '2022-11-12', '1', NULL, 0, '1', '2022-11-12 05:52:31', '2022-11-12 05:52:31'),
(7062, 'SI-0000472', 'PDT-000125', '1', 3.00, 30.00, 35.00, '0', 0.00, '2022-11-12', '1', NULL, 0, '1', '2022-11-12 05:52:31', '2022-11-12 05:52:31'),
(7063, 'SI-0000472', 'PDT-000177', '1', 1.00, 30.11, 33.00, '0', 0.00, '2022-11-12', '1', NULL, 0, '1', '2022-11-12 05:52:31', '2022-11-12 05:52:31'),
(7064, 'SI-0000473', 'PDT-000253', '1', 1.00, 272.81, 285.00, '0', 0.00, '2022-11-12', '1', NULL, 0, '1', '2022-11-12 10:54:50', '2022-11-12 10:54:50'),
(7065, 'SI-0000473', 'PDT-000131', '1', 1.00, 111.35, 130.00, '0', 0.00, '2022-11-12', '1', NULL, 0, '1', '2022-11-12 10:54:50', '2022-11-12 10:54:50'),
(7066, 'SI-0000473', 'PDT-000024', '1', 2.00, 5.61, 7.00, '0', 0.00, '2022-11-12', '1', NULL, 0, '1', '2022-11-12 10:54:50', '2022-11-12 10:54:50'),
(7067, 'SI-0000474', 'PDT-000304', '1', 1.00, 430.00, 450.00, '0', 0.00, '2022-11-12', '1', NULL, 0, '1', '2022-11-12 11:00:54', '2022-11-12 11:00:54'),
(7071, 'SI-0000475', 'PDT-000163', '1', 2.00, 264.55, 287.00, '0', 0.00, '2022-11-12', '1', NULL, 0, '1', '2022-11-12 11:36:43', '2022-11-12 11:36:43'),
(7072, 'SI-0000475', 'PDT-000070', '1', 2.00, 909.00, 980.00, '0', 0.00, '2022-11-12', '1', NULL, 0, '1', '2022-11-12 11:36:43', '2022-11-12 11:36:43'),
(7073, 'SI-0000475', 'PDT-000042', '1', 3.00, 192.53, 215.00, '0', 0.00, '2022-11-12', '1', NULL, 0, '1', '2022-11-12 11:36:43', '2022-11-12 11:36:43'),
(7074, 'SI-0000476', 'PDT-000132', '1', 1.00, 93.84, 105.00, '0', 0.00, '2022-11-12', '1', NULL, 0, '1', '2022-11-12 12:37:10', '2022-11-12 12:37:10'),
(7075, 'SI-0000477', 'PDT-000137', '1', 1.00, 36.02, 40.00, '0', 0.00, '2022-11-12', '1', NULL, 0, '1', '2022-11-12 12:40:18', '2022-11-12 12:40:18'),
(7076, 'SI-0000478', 'PDT-000166', '1', 1.00, 30.02, 35.00, '0', 0.00, '2022-11-12', '1', NULL, 0, '1', '2022-11-12 14:10:45', '2022-11-12 14:10:45'),
(7077, 'SI-0000479', 'PDT-000275', '1', 2.00, 26.45, 32.00, '0', 0.00, '2022-11-12', '1', NULL, 0, '1', '2022-11-12 14:11:57', '2022-11-12 14:11:57'),
(7078, 'SI-0000480', 'PDT-000163', '1', 2.00, 291.00, 320.00, '0', 0.00, '2022-11-13', '1', NULL, 0, '1', '2022-11-13 07:27:52', '2022-11-13 07:27:52'),
(7079, 'SI-0000480', 'PDT-000158', '1', 6.00, 311.15, 340.00, '0', 0.00, '2022-11-13', '1', NULL, 0, '1', '2022-11-13 07:27:52', '2022-11-13 07:27:52'),
(7080, 'SI-0000480', 'PDT-000155', '1', 1.00, 703.15, 900.00, '0', 0.00, '2022-11-13', '1', NULL, 0, '1', '2022-11-13 07:27:52', '2022-11-13 07:27:52'),
(7081, 'SI-0000481', 'PDT-000091', '1', 4.00, 697.14, 780.00, '0', 0.00, '2022-11-13', '1', NULL, 0, '1', '2022-11-13 11:36:41', '2022-11-13 11:36:41'),
(7082, 'SI-0000481', 'PDT-000107', '1', 10.00, 161.87, 170.00, '0', 0.00, '2022-11-13', '1', NULL, 0, '1', '2022-11-13 11:36:41', '2022-11-13 11:36:41'),
(7083, 'SI-0000481', 'PDT-000152', '1', 8.00, 92.64, 105.00, '0', 0.00, '2022-11-13', '1', NULL, 0, '1', '2022-11-13 11:36:41', '2022-11-13 11:36:41'),
(7084, 'SI-0000482', 'PDT-000269', '15', 1.00, 1095.00, 1300.00, '0', 0.00, '2022-11-13', '1', NULL, 0, '1', '2022-11-13 11:38:25', '2022-11-13 11:38:25'),
(7085, 'SI-0000483', 'PDT-000166', '1', 1.00, 30.02, 35.00, '0', 0.00, '2022-11-13', '1', NULL, 0, '1', '2022-11-13 11:39:08', '2022-11-13 11:39:08'),
(7086, 'SI-0000484', 'PDT-000097', '1', 1.00, 178.57, 200.00, '0', 0.00, '2022-11-13', '1', NULL, 0, '1', '2022-11-13 11:40:14', '2022-11-13 11:40:14'),
(7087, 'SI-0000485', 'PDT-000053', '1', 1.00, 179.67, 230.00, '0', 0.00, '2022-11-13', '1', NULL, 0, '1', '2022-11-13 11:41:48', '2022-11-13 11:41:48'),
(7088, 'SI-0000486', 'PDT-000123', '1', 3.00, 16.24, 19.00, '0', 0.00, '2022-11-13', '1', NULL, 0, '1', '2022-11-13 11:42:30', '2022-11-13 11:42:30'),
(7102, 'SI-0000487', 'PDT-000253', '1', 1.00, 272.81, 285.00, '0', 0.00, '2022-11-13', '1', NULL, 0, '1', '2022-11-13 13:20:27', '2022-11-13 13:20:27'),
(7103, 'SI-0000488', 'PDT-000097', '1', 1.00, 178.57, 200.00, '0', 0.00, '2022-11-14', '1', NULL, 0, '1', '2022-11-14 04:52:48', '2022-11-14 04:52:48'),
(7104, 'SI-0000489', 'PDT-000177', '1', 1.00, 30.11, 33.00, '0', 0.00, '2022-11-14', '1', NULL, 0, '1', '2022-11-14 10:42:45', '2022-11-14 10:42:45'),
(7105, 'SI-0000490', 'PDT-000127', '1', 2.00, 15.79, 18.00, '0', 0.00, '2022-11-14', '1', NULL, 0, '1', '2022-11-14 12:18:15', '2022-11-14 12:18:15'),
(7106, 'SI-0000491', 'PDT-000208', '1', 6.00, 85.95, 100.00, '0', 0.00, '2022-11-14', '1', NULL, 0, '1', '2022-11-14 12:19:59', '2022-11-14 12:19:59'),
(7107, 'SI-0000492', 'PDT-000050', '1', 2.00, 81.96, 100.00, '0', 0.00, '2022-11-14', '1', NULL, 0, '1', '2022-11-14 14:05:18', '2022-11-14 14:05:18'),
(7108, 'SI-0000493', 'PDT-000006', '15', 1.00, 2625.00, 2800.00, '0', 0.00, '2022-11-14', '1', NULL, 0, '1', '2022-11-14 14:09:15', '2022-11-14 14:09:15'),
(7109, 'SI-0000494', 'PDT-000150', '1', 4.00, 3.85, 4.00, '0', 0.00, '2022-11-15', '1', NULL, 0, '1', '2022-11-15 06:31:39', '2022-11-15 06:31:39'),
(7110, 'SI-0000494', 'PDT-000126', '1', 2.00, 14.55, 17.00, '0', 0.00, '2022-11-15', '1', NULL, 0, '1', '2022-11-15 06:31:39', '2022-11-15 06:31:39'),
(7111, 'SI-0000495', 'PDT-000243', '1', 1.00, 87.56, 97.00, '0', 0.00, '2022-11-15', '1', NULL, 0, '1', '2022-11-15 12:57:44', '2022-11-15 12:57:44'),
(7112, 'SI-0000496', 'PDT-000148', '1', 4.00, 1.95, 2.20, '0', 0.00, '2022-11-16', '1', NULL, 0, '1', '2022-11-16 03:54:08', '2022-11-16 03:54:08'),
(7113, 'SI-0000497', 'PDT-000023', '1', 1.00, 208.93, 265.00, '0', 0.00, '2022-11-16', '1', NULL, 0, '1', '2022-11-16 03:57:42', '2022-11-16 03:57:42'),
(7114, 'SI-0000497', 'PDT-000090', '1', 2.00, 31.18, 35.00, '0', 0.00, '2022-11-16', '1', NULL, 0, '1', '2022-11-16 03:57:42', '2022-11-16 03:57:42'),
(7115, 'SI-0000498', 'PDT-000181', '1', 3.00, 78.34, 85.00, '0', 0.00, '2022-11-16', '1', NULL, 0, '1', '2022-11-16 04:32:40', '2022-11-16 04:32:40'),
(7116, 'SI-0000499', 'PDT-000117', '1', 5.00, 20.89, 23.00, '0', 0.00, '2022-11-16', '1', NULL, 0, '1', '2022-11-16 05:05:58', '2022-11-16 05:05:58'),
(7117, 'SI-0000500', 'PDT-000093', '1', 1.00, 157.29, 180.00, '0', 0.00, '2022-11-16', '1', NULL, 0, '1', '2022-11-16 11:12:21', '2022-11-16 11:12:21'),
(7118, 'SI-0000500', 'PDT-000279', '1', 1.00, 12.89, 15.00, '0', 0.00, '2022-11-16', '1', NULL, 0, '1', '2022-11-16 11:12:21', '2022-11-16 11:12:21'),
(7119, 'SI-0000501', 'PDT-000001', '15', 2.00, 3054.90, 3344.00, '0', 0.00, '2022-11-16', '1', NULL, 0, '1', '2022-11-16 13:06:35', '2022-11-16 13:06:35'),
(7120, 'SI-0000502', 'PDT-000026', '1', 1.00, 31.76, 35.00, '0', 0.00, '2022-11-17', '1', NULL, 0, '1', '2022-11-17 04:14:49', '2022-11-17 04:14:49'),
(7121, 'SI-0000502', 'PDT-000106', '1', 1.00, 13.75, 15.00, '0', 0.00, '2022-11-17', '1', NULL, 0, '1', '2022-11-17 04:14:49', '2022-11-17 04:14:49'),
(7122, 'SI-0000503', 'PDT-000154', '1', 1.00, 165.49, 185.00, '0', 0.00, '2022-11-17', '1', NULL, 0, '1', '2022-11-17 04:49:26', '2022-11-17 04:49:26'),
(7123, 'SI-0000503', 'PDT-000132', '1', 1.00, 93.84, 105.00, '0', 0.00, '2022-11-17', '1', NULL, 0, '1', '2022-11-17 04:49:26', '2022-11-17 04:49:26'),
(7124, 'SI-0000503', 'PDT-000150', '1', 40.00, 3.85, 4.00, '0', 0.00, '2022-11-17', '1', NULL, 0, '1', '2022-11-17 04:49:26', '2022-11-17 04:49:26'),
(7125, 'SI-0000503', 'PDT-000048', '1', 1.00, 117.00, 140.00, '0', 0.00, '2022-11-17', '1', NULL, 0, '1', '2022-11-17 04:49:26', '2022-11-17 04:49:26'),
(7126, 'SI-0000503', 'PDT-000081', '1', 2.00, 44.70, 60.00, '0', 0.00, '2022-11-17', '1', NULL, 0, '1', '2022-11-17 04:49:26', '2022-11-17 04:49:26'),
(7127, 'SI-0000503', 'PDT-000096', '1', 1.00, 291.67, 330.00, '0', 0.00, '2022-11-17', '1', NULL, 0, '1', '2022-11-17 04:49:26', '2022-11-17 04:49:26'),
(7128, 'SI-0000504', 'PDT-000095', '1', 6.00, 570.14, 650.00, '0', 0.00, '2022-11-17', '1', NULL, 0, '1', '2022-11-17 05:24:18', '2022-11-17 05:24:18'),
(7129, 'SI-0000504', 'PDT-000029', '1', 1.00, 664.77, 720.00, '0', 0.00, '2022-11-17', '1', NULL, 0, '1', '2022-11-17 05:24:18', '2022-11-17 05:24:18'),
(7130, 'SI-0000505', 'PDT-000028', '1', 4.00, 2.59, 3.00, '0', 0.00, '2022-11-17', '1', NULL, 0, '1', '2022-11-17 06:24:24', '2022-11-17 06:24:24'),
(7131, 'SI-0000506', 'PDT-000061', '1', 5.00, 72.32, 80.00, '0', 0.00, '2022-11-17', '1', NULL, 0, '1', '2022-11-17 10:29:41', '2022-11-17 10:29:41'),
(7132, 'SI-0000506', 'PDT-000033', '1', 1.00, 582.58, 630.00, '0', 0.00, '2022-11-17', '1', NULL, 0, '1', '2022-11-17 10:29:41', '2022-11-17 10:29:41'),
(7133, 'SI-0000507', 'PDT-000117', '1', 3.00, 20.89, 23.00, '0', 0.00, '2022-11-17', '1', NULL, 0, '1', '2022-11-17 12:26:43', '2022-11-17 12:26:43'),
(7136, 'SI-0000508', 'PDT-000163', '1', 1.00, 291.00, 300.00, '0', 0.00, '2022-11-18', '1', NULL, 0, '1', '2022-11-18 12:18:46', '2022-11-18 12:18:46'),
(7137, 'SI-0000508', 'PDT-000097', '1', 3.00, 178.57, 200.00, '0', 0.00, '2022-11-18', '1', NULL, 0, '1', '2022-11-18 12:18:46', '2022-11-18 12:18:46'),
(7138, 'SI-0000509', 'PDT-000095', '1', 10.00, 570.14, 650.00, '0', 0.00, '2022-11-18', '1', NULL, 0, '1', '2022-11-18 12:47:33', '2022-11-18 12:47:33'),
(7139, 'SI-0000510', 'PDT-000269', '15', 2.00, 1095.00, 1300.00, '0', 0.00, '2022-11-18', '1', NULL, 0, '1', '2022-11-18 12:51:18', '2022-11-18 12:51:18'),
(7140, 'SI-0000511', 'PDT-000150', '1', 8.00, 3.85, 4.00, '0', 0.00, '2022-11-18', '1', NULL, 0, '1', '2022-11-18 13:08:40', '2022-11-18 13:08:40'),
(7141, 'SI-0000511', 'PDT-000147', '1', 6.00, 17.20, 20.00, '0', 0.00, '2022-11-18', '1', NULL, 0, '1', '2022-11-18 13:08:40', '2022-11-18 13:08:40'),
(7142, 'SI-0000512', 'PDT-000269', '15', 1.00, 1095.00, 1300.00, '0', 0.00, '2022-11-18', '1', NULL, 0, '1', '2022-11-18 13:36:35', '2022-11-18 13:36:35'),
(7146, 'SI-0000513', 'PDT-000232', '1', 2.00, 512.43, 600.00, '0', 0.00, '2022-11-18', '1', NULL, 0, '1', '2022-11-18 14:10:47', '2022-11-18 14:10:47'),
(7147, 'SI-0000513', 'PDT-000259', '1', 2.00, 250.93, 275.00, '0', 0.00, '2022-11-18', '1', NULL, 0, '1', '2022-11-18 14:10:47', '2022-11-18 14:10:47'),
(7148, 'SI-0000513', 'PDT-000243', '1', 3.00, 87.56, 85.00, '0', 0.00, '2022-11-18', '1', NULL, 0, '1', '2022-11-18 14:10:47', '2022-11-18 14:10:47');
INSERT INTO `sales_entry` (`id`, `invoice_no`, `product_id`, `sub_unit_id`, `product_quantity`, `product_purchase_price`, `product_sales_price`, `product_discount_amount`, `return_quantity`, `entry_date`, `branch_id`, `note`, `status`, `admin_id`, `created_at`, `updated_at`) VALUES
(7149, 'SI-0000514', 'PDT-000106', '1', 1.00, 13.75, 15.00, '0', 0.00, '2022-11-19', '1', NULL, 0, '1', '2022-11-19 04:25:39', '2022-11-19 04:25:39'),
(7150, 'SI-0000515', 'PDT-000220', '1', 2.00, 38.41, 42.00, '0', 0.00, '2022-11-19', '1', NULL, 0, '1', '2022-11-19 05:16:23', '2022-11-19 05:16:23'),
(7151, 'SI-0000516', 'PDT-000220', '1', 2.00, 38.41, 42.00, '0', 0.00, '2022-11-19', '1', NULL, 0, '1', '2022-11-19 05:17:39', '2022-11-19 05:17:39'),
(7152, 'SI-0000517', 'PDT-000192', '1', 2.00, 13.20, 15.00, '0', 0.00, '2022-11-19', '1', NULL, 0, '1', '2022-11-19 12:03:49', '2022-11-19 12:03:49'),
(7153, 'SI-0000518', 'PDT-000006', '15', 1.00, 2625.00, 2800.00, '0', 0.00, '2022-11-19', '1', NULL, 0, '1', '2022-11-19 13:41:39', '2022-11-19 13:41:39'),
(7154, 'SI-0000519', 'PDT-000011', '15', 1.00, 900.00, 1050.00, '0', 0.00, '2022-11-20', '1', NULL, 0, '1', '2022-11-20 03:43:17', '2022-11-20 03:43:17'),
(7155, 'SI-0000520', 'PDT-000269', '15', 1.00, 1095.00, 1300.00, '0', 0.00, '2022-11-20', '1', NULL, 0, '1', '2022-11-20 04:43:47', '2022-11-20 04:43:47'),
(7156, 'SI-0000521', 'PDT-000123', '1', 4.00, 16.24, 19.00, '0', 0.00, '2022-11-20', '1', NULL, 0, '1', '2022-11-20 04:45:17', '2022-11-20 04:45:17'),
(7157, 'SI-0000521', 'PDT-000149', '1', 4.00, 3.43, 4.00, '0', 0.00, '2022-11-20', '1', NULL, 0, '1', '2022-11-20 04:45:17', '2022-11-20 04:45:17'),
(7158, 'SI-0000521', 'PDT-000176', '1', 4.00, 18.01, 22.50, '0', 0.00, '2022-11-20', '1', NULL, 0, '1', '2022-11-20 04:45:17', '2022-11-20 04:45:17'),
(7159, 'SI-0000522', 'PDT-000127', '1', 1.00, 15.79, 18.00, '0', 0.00, '2022-11-20', '1', NULL, 0, '1', '2022-11-20 10:12:49', '2022-11-20 10:12:49'),
(7160, 'SI-0000522', 'PDT-000028', '1', 7.00, 2.59, 3.00, '0', 0.00, '2022-11-20', '1', NULL, 0, '1', '2022-11-20 10:12:49', '2022-11-20 10:12:49'),
(7161, 'SI-0000523', 'PDT-000063', '1', 1.00, 279.74, 300.00, '0', 0.00, '2022-11-20', '1', NULL, 0, '1', '2022-11-20 10:35:24', '2022-11-20 10:35:24'),
(7162, 'SI-0000524', 'PDT-000279', '1', 2.00, 12.89, 15.00, '0', 0.00, '2022-11-20', '1', NULL, 0, '1', '2022-11-20 10:48:13', '2022-11-20 10:48:13'),
(7163, 'SI-0000524', 'PDT-000022', '1', 2.00, 87.52, 95.00, '0', 0.00, '2022-11-20', '1', NULL, 0, '1', '2022-11-20 10:48:13', '2022-11-20 10:48:13'),
(7164, 'SI-0000524', 'PDT-000147', '1', 7.00, 17.20, 20.00, '0', 0.00, '2022-11-20', '1', NULL, 0, '1', '2022-11-20 10:48:13', '2022-11-20 10:48:13'),
(7165, 'SI-0000524', 'PDT-000150', '1', 7.00, 3.85, 4.00, '0', 0.00, '2022-11-20', '1', NULL, 0, '1', '2022-11-20 10:48:13', '2022-11-20 10:48:13'),
(7166, 'SI-0000525', 'PDT-000028', '1', 4.00, 2.59, 3.00, '0', 0.00, '2022-11-20', '1', NULL, 0, '1', '2022-11-20 10:56:28', '2022-11-20 10:56:28'),
(7167, 'SI-0000526', 'PDT-000122', '1', 1.00, 405.96, 445.00, '0', 0.00, '2022-11-20', '1', NULL, 0, '1', '2022-11-20 12:27:34', '2022-11-20 12:27:34'),
(7168, 'SI-0000526', 'PDT-000097', '1', 2.00, 178.57, 200.00, '0', 0.00, '2022-11-20', '1', NULL, 0, '1', '2022-11-20 12:27:34', '2022-11-20 12:27:34'),
(7169, 'SI-0000527', 'PDT-000081', '1', 1.00, 44.70, 60.00, '0', 0.00, '2022-11-20', '1', NULL, 0, '1', '2022-11-20 12:30:10', '2022-11-20 12:30:10'),
(7170, 'SI-0000528', 'PDT-000036', '1', 1.00, 286.65, 310.00, '0', 0.00, '2022-11-20', '1', NULL, 0, '1', '2022-11-20 12:36:51', '2022-11-20 12:36:51'),
(7171, 'SI-0000528', 'PDT-000306', '1', 1.00, 187.09, 235.00, '0', 0.00, '2022-11-20', '1', NULL, 0, '1', '2022-11-20 12:36:51', '2022-11-20 12:36:51'),
(7172, 'SI-0000529', 'PDT-000097', '1', 1.00, 178.57, 200.00, '0', 0.00, '2022-11-20', '1', NULL, 0, '1', '2022-11-20 13:08:48', '2022-11-20 13:08:48'),
(7173, 'SI-0000530', 'PDT-000199', '1', 1.00, 465.33, 500.00, '0', 0.00, '2022-11-20', '1', NULL, 0, '1', '2022-11-20 13:12:00', '2022-11-20 13:12:00'),
(7174, 'SI-0000530', 'PDT-000269', '15', 1.00, 1095.00, 1310.00, '0', 0.00, '2022-11-20', '1', NULL, 0, '1', '2022-11-20 13:12:00', '2022-11-20 13:12:00'),
(7175, 'SI-0000531', 'PDT-000028', '1', 14.00, 2.59, 3.00, '0', 0.00, '2022-11-21', '1', NULL, 0, '1', '2022-11-21 04:33:52', '2022-11-21 04:33:52'),
(7176, 'SI-0000531', 'PDT-000149', '1', 7.00, 3.43, 4.00, '0', 0.00, '2022-11-21', '1', NULL, 0, '1', '2022-11-21 04:33:52', '2022-11-21 04:33:52'),
(7177, 'SI-0000531', 'PDT-000123', '1', 7.00, 16.24, 19.00, '0', 0.00, '2022-11-21', '1', NULL, 0, '1', '2022-11-21 04:33:52', '2022-11-21 04:33:52'),
(7178, 'SI-0000531', 'PDT-000125', '1', 7.00, 30.00, 35.00, '0', 0.00, '2022-11-21', '1', NULL, 0, '1', '2022-11-21 04:33:52', '2022-11-21 04:33:52'),
(7179, 'SI-0000531', 'PDT-000140', '1', 1.00, 52.91, 60.00, '0', 0.00, '2022-11-21', '1', NULL, 0, '1', '2022-11-21 04:33:52', '2022-11-21 04:33:52'),
(7180, 'SI-0000532', 'PDT-000215', '1', 2.00, 63.82, 70.00, '0', 0.00, '2022-11-21', '1', NULL, 0, '1', '2022-11-21 12:15:20', '2022-11-21 12:15:20'),
(7181, 'SI-0000532', 'PDT-000279', '1', 2.00, 12.89, 15.00, '0', 0.00, '2022-11-21', '1', NULL, 0, '1', '2022-11-21 12:15:20', '2022-11-21 12:15:20'),
(7182, 'SI-0000532', 'PDT-000123', '1', 4.00, 16.24, 19.00, '0', 0.00, '2022-11-21', '1', NULL, 0, '1', '2022-11-21 12:15:20', '2022-11-21 12:15:20'),
(7183, 'SI-0000533', 'PDT-000096', '1', 1.00, 291.67, 330.00, '0', 0.00, '2022-11-21', '1', NULL, 0, '1', '2022-11-21 12:29:03', '2022-11-21 12:29:03'),
(7184, 'SI-0000534', 'PDT-000097', '1', 1.00, 178.57, 200.00, '0', 0.00, '2022-11-21', '1', NULL, 0, '1', '2022-11-21 12:30:56', '2022-11-21 12:30:56'),
(7185, 'SI-0000535', 'PDT-000026', '1', 1.00, 31.76, 35.00, '0', 0.00, '2022-11-21', '1', NULL, 0, '1', '2022-11-21 12:32:01', '2022-11-21 12:32:01'),
(7186, 'SI-0000535', 'PDT-000106', '1', 1.00, 13.75, 15.00, '0', 0.00, '2022-11-21', '1', NULL, 0, '1', '2022-11-21 12:32:01', '2022-11-21 12:32:01'),
(7187, 'SI-0000536', 'PDT-000148', '1', 60.00, 1.95, 2.20, '0', 0.00, '2022-11-21', '1', NULL, 0, '1', '2022-11-21 12:33:40', '2022-11-21 12:33:40'),
(7188, 'SI-0000536', 'PDT-000034', '1', 2.00, 86.13, 95.00, '0', 0.00, '2022-11-21', '1', NULL, 0, '1', '2022-11-21 12:33:40', '2022-11-21 12:33:40'),
(7189, 'SI-0000536', 'PDT-000063', '1', 1.00, 279.74, 300.00, '0', 0.00, '2022-11-21', '1', NULL, 0, '1', '2022-11-21 12:33:40', '2022-11-21 12:33:40'),
(7190, 'SI-0000537', 'PDT-000305', '1', 2.00, 181.07, 220.00, '0', 0.00, '2022-11-21', '1', NULL, 0, '1', '2022-11-21 12:38:53', '2022-11-21 12:38:53'),
(7191, 'SI-0000538', 'PDT-000114', '1', 1.00, 336.00, 360.00, '0', 0.00, '2022-11-21', '1', NULL, 0, '1', '2022-11-21 12:57:06', '2022-11-21 12:57:06'),
(7192, 'SI-0000538', 'PDT-000029', '1', 1.00, 664.77, 720.00, '0', 0.00, '2022-11-21', '1', NULL, 0, '1', '2022-11-21 12:57:06', '2022-11-21 12:57:06'),
(7193, 'SI-0000539', 'PDT-000288', '1', 1.00, 349.86, 390.00, '0', 0.00, '2022-11-21', '1', NULL, 0, '1', '2022-11-21 13:03:58', '2022-11-21 13:03:58'),
(7194, 'SI-0000540', 'PDT-000097', '1', 1.00, 178.57, 200.00, '0', 0.00, '2022-11-22', '1', NULL, 0, '1', '2022-11-22 03:41:01', '2022-11-22 03:41:01'),
(7195, 'SI-0000541', 'PDT-000028', '1', 3.00, 2.59, 3.00, '0', 0.00, '2022-11-22', '1', NULL, 0, '1', '2022-11-22 03:42:57', '2022-11-22 03:42:57'),
(7196, 'SI-0000542', 'PDT-000177', '1', 1.00, 30.11, 33.00, '0', 0.00, '2022-11-22', '1', NULL, 0, '1', '2022-11-22 03:44:37', '2022-11-22 03:44:37'),
(7197, 'SI-0000543', 'PDT-000097', '1', 1.00, 178.57, 200.00, '0', 0.00, '2022-11-22', '1', NULL, 0, '1', '2022-11-22 04:04:27', '2022-11-22 04:04:27'),
(7198, 'SI-0000544', 'PDT-000117', '1', 5.00, 20.89, 23.00, '0', 0.00, '2022-11-22', '1', NULL, 0, '1', '2022-11-22 04:25:49', '2022-11-22 04:25:49'),
(7199, 'SI-0000544', 'PDT-000136', '1', 1.00, 254.15, 285.00, '0', 0.00, '2022-11-22', '1', NULL, 0, '1', '2022-11-22 04:25:49', '2022-11-22 04:25:49'),
(7200, 'SI-0000545', 'PDT-000037', '1', 4.00, 8.62, 10.00, '0', 0.00, '2022-11-22', '1', NULL, 0, '1', '2022-11-22 10:48:57', '2022-11-22 10:48:57'),
(7201, 'SI-0000545', 'PDT-000150', '1', 4.00, 3.85, 4.00, '0', 0.00, '2022-11-22', '1', NULL, 0, '1', '2022-11-22 10:48:58', '2022-11-22 10:48:58'),
(7202, 'SI-0000546', 'PDT-000177', '1', 1.00, 30.11, 33.00, '0', 0.00, '2022-11-22', '1', NULL, 0, '1', '2022-11-22 12:59:04', '2022-11-22 12:59:04'),
(7203, 'SI-0000547', 'PDT-000118', '1', 5.00, 31.99, 35.00, '0', 0.00, '2022-11-22', '1', NULL, 0, '1', '2022-11-22 14:04:19', '2022-11-22 14:04:19'),
(7204, 'SI-0000547', 'PDT-000305', '1', 1.00, 181.07, 220.00, '0', 0.00, '2022-11-22', '1', NULL, 0, '1', '2022-11-22 14:04:19', '2022-11-22 14:04:19'),
(7205, 'SI-0000548', 'PDT-000097', '1', 1.00, 178.57, 200.00, '0', 0.00, '2022-11-22', '1', NULL, 0, '1', '2022-11-22 14:24:45', '2022-11-22 14:24:45'),
(7206, 'SI-0000549', 'PDT-000148', '1', 8.00, 1.95, 2.20, '0', 0.00, '2022-11-23', '1', NULL, 0, '1', '2022-11-23 04:16:23', '2022-11-23 04:16:23'),
(7207, 'SI-0000550', 'PDT-000232', '1', 1.00, 512.43, 600.00, '0', 0.00, '2022-11-23', '1', NULL, 0, '1', '2022-11-23 04:56:50', '2022-11-23 04:56:50'),
(7208, 'SI-0000550', 'PDT-000019', '1', 1.00, 365.62, 395.00, '0', 0.00, '2022-11-23', '1', NULL, 0, '1', '2022-11-23 04:56:50', '2022-11-23 04:56:50'),
(7209, 'SI-0000550', 'PDT-000260', '1', 2.00, 129.12, 145.00, '0', 0.00, '2022-11-23', '1', NULL, 0, '1', '2022-11-23 04:56:50', '2022-11-23 04:56:50'),
(7210, 'SI-0000551', 'PDT-000097', '1', 1.00, 178.57, 200.00, '0', 0.00, '2022-11-24', '1', NULL, 0, '1', '2022-11-24 05:03:59', '2022-11-24 05:03:59'),
(7211, 'SI-0000552', 'PDT-000096', '1', 1.00, 291.67, 330.00, '0', 0.00, '2022-11-24', '1', NULL, 0, '1', '2022-11-24 06:24:01', '2022-11-24 06:24:01'),
(7212, 'SI-0000552', 'PDT-000125', '1', 7.00, 30.00, 35.00, '0', 0.00, '2022-11-24', '1', NULL, 0, '1', '2022-11-24 06:24:01', '2022-11-24 06:24:01'),
(7213, 'SI-0000552', 'PDT-000127', '1', 2.00, 15.79, 18.00, '0', 0.00, '2022-11-24', '1', NULL, 0, '1', '2022-11-24 06:24:01', '2022-11-24 06:24:01'),
(7214, 'SI-0000553', 'PDT-000176', '1', 4.00, 18.01, 22.50, '0', 0.00, '2022-11-24', '1', NULL, 0, '1', '2022-11-24 06:51:59', '2022-11-24 06:51:59'),
(7215, 'SI-0000553', 'PDT-000149', '1', 4.00, 3.43, 4.00, '0', 0.00, '2022-11-24', '1', NULL, 0, '1', '2022-11-24 06:51:59', '2022-11-24 06:51:59'),
(7216, 'SI-0000553', 'PDT-000123', '1', 4.00, 16.24, 19.00, '0', 0.00, '2022-11-24', '1', NULL, 0, '1', '2022-11-24 06:51:59', '2022-11-24 06:51:59'),
(7217, 'SI-0000554', 'PDT-000131', '1', 1.00, 111.35, 130.00, '0', 0.00, '2022-11-24', '1', NULL, 0, '1', '2022-11-24 10:56:28', '2022-11-24 10:56:28'),
(7218, 'SI-0000555', 'PDT-000127', '1', 2.00, 15.79, 18.00, '0', 0.00, '2022-11-24', '1', NULL, 0, '1', '2022-11-24 11:48:20', '2022-11-24 11:48:20'),
(7219, 'SI-0000555', 'PDT-000024', '1', 1.00, 5.61, 7.00, '0', 0.00, '2022-11-24', '1', NULL, 0, '1', '2022-11-24 11:48:20', '2022-11-24 11:48:20'),
(7220, 'SI-0000556', 'PDT-000177', '1', 1.00, 30.11, 33.00, '0', 0.00, '2022-11-24', '1', NULL, 0, '1', '2022-11-24 13:05:00', '2022-11-24 13:05:00'),
(7221, 'SI-0000557', 'PDT-000132', '1', 1.00, 93.84, 100.00, '0', 0.00, '2022-11-24', '1', NULL, 0, '1', '2022-11-24 13:07:58', '2022-11-24 13:07:58'),
(7222, 'SI-0000558', 'PDT-000196', '1', 2.00, 232.26, 240.00, '0', 0.00, '2022-11-25', '1', NULL, 0, '1', '2022-11-25 05:01:14', '2022-11-25 05:01:14'),
(7223, 'SI-0000559', 'PDT-000164', '1', 10.00, 10.14, 12.00, '0', 0.00, '2022-11-25', '1', NULL, 0, '1', '2022-11-25 12:37:07', '2022-11-25 12:37:07'),
(7224, 'SI-0000560', 'PDT-000150', '1', 4.00, 3.85, 4.00, '0', 0.00, '2022-11-25', '1', NULL, 0, '1', '2022-11-25 13:57:39', '2022-11-25 13:57:39'),
(7225, 'SI-0000561', 'PDT-000097', '1', 4.00, 178.57, 200.00, '0', 0.00, '2022-11-26', '1', NULL, 0, '1', '2022-11-26 03:46:38', '2022-11-26 03:46:38'),
(7226, 'SI-0000562', 'PDT-000269', '15', 1.00, 1095.00, 1310.00, '0', 0.00, '2022-11-27', '1', NULL, 0, '1', '2022-11-27 13:50:04', '2022-11-27 13:50:04'),
(7227, 'SI-0000563', 'PDT-000034', '1', 2.00, 86.13, 95.00, '0', 0.00, '2022-11-28', '1', NULL, 0, '1', '2022-11-28 11:19:57', '2022-11-28 11:19:57'),
(7228, 'SI-0000564', 'PDT-000163', '1', 1.00, 291.00, 320.00, '0', 0.00, '2022-11-28', '1', NULL, 0, '1', '2022-11-28 12:30:28', '2022-11-28 12:30:28'),
(7229, 'SI-0000564', 'PDT-000253', '1', 1.00, 272.81, 285.00, '0', 0.00, '2022-11-28', '1', NULL, 0, '1', '2022-11-28 12:30:28', '2022-11-28 12:30:28'),
(7230, 'SI-0000564', 'PDT-000019', '1', 1.00, 365.62, 395.00, '0', 0.00, '2022-11-28', '1', NULL, 0, '1', '2022-11-28 12:30:28', '2022-11-28 12:30:28'),
(7231, 'SI-0000564', 'PDT-000149', '1', 4.00, 3.43, 4.00, '0', 0.00, '2022-11-28', '1', NULL, 0, '1', '2022-11-28 12:30:28', '2022-11-28 12:30:28'),
(7232, 'SI-0000565', 'PDT-000225', '1', 1.00, 484.53, 515.00, '0', 0.00, '2022-11-28', '1', NULL, 0, '1', '2022-11-28 12:54:28', '2022-11-28 12:54:28'),
(7233, 'SI-0000566', 'PDT-000127', '1', 2.00, 15.79, 18.00, '0', 0.00, '2022-11-28', '1', NULL, 0, '1', '2022-11-28 14:37:11', '2022-11-28 14:37:11'),
(7234, 'SI-0000567', 'PDT-000143', '1', 1.00, 63.09, 70.00, '0', 0.00, '2022-11-28', '1', NULL, 0, '1', '2022-11-28 15:13:28', '2022-11-28 15:13:28'),
(7235, 'SI-0000568', 'PDT-000026', '1', 5.00, 31.76, 35.00, '0', 0.00, '2022-11-29', '1', NULL, 0, '1', '2022-11-29 04:13:49', '2022-11-29 04:13:49'),
(7236, 'SI-0000568', 'PDT-000060', '1', 1.00, 187.09, 200.00, '0', 0.00, '2022-11-29', '1', NULL, 0, '1', '2022-11-29 04:13:49', '2022-11-29 04:13:49'),
(7237, 'SI-0000568', 'PDT-000114', '1', 1.00, 336.00, 360.00, '0', 0.00, '2022-11-29', '1', NULL, 0, '1', '2022-11-29 04:13:49', '2022-11-29 04:13:49'),
(7238, 'SI-0000569', 'PDT-000166', '1', 3.00, 30.02, 35.00, '0', 0.00, '2022-11-29', '1', NULL, 0, '1', '2022-11-29 04:36:27', '2022-11-29 04:36:27'),
(7239, 'SI-0000570', 'PDT-000269', '15', 1.00, 1095.00, 1310.00, '0', 0.00, '2022-11-29', '1', NULL, 0, '1', '2022-11-29 10:55:05', '2022-11-29 10:55:05'),
(7240, 'SI-0000571', 'PDT-000064', '1', 2.00, 1271.33, 1450.00, '0', 0.00, '2022-11-29', '1', NULL, 0, '1', '2022-11-29 12:11:44', '2022-11-29 12:11:44'),
(7241, 'SI-0000572', 'PDT-000037', '1', 20.00, 8.62, 10.00, '0', 0.00, '2022-11-29', '1', NULL, 0, '1', '2022-11-29 13:29:04', '2022-11-29 13:29:04'),
(7242, 'SI-0000572', 'PDT-000144', '1', 2.00, 171.52, 185.00, '0', 0.00, '2022-11-29', '1', NULL, 0, '1', '2022-11-29 13:29:04', '2022-11-29 13:29:04'),
(7243, 'SI-0000572', 'PDT-000164', '1', 10.00, 10.14, 12.00, '0', 0.00, '2022-11-29', '1', NULL, 0, '1', '2022-11-29 13:29:04', '2022-11-29 13:29:04'),
(7244, 'SI-0000573', 'PDT-000154', '1', 1.00, 166.10, 185.00, '0', 0.00, '2022-11-30', '1', NULL, 0, '1', '2022-11-30 04:41:46', '2022-11-30 04:41:46'),
(7245, 'SI-0000573', 'PDT-000279', '1', 1.00, 12.89, 15.00, '0', 0.00, '2022-11-30', '1', NULL, 0, '1', '2022-11-30 04:41:46', '2022-11-30 04:41:46'),
(7246, 'SI-0000574', 'PDT-000026', '1', 1.00, 31.76, 35.00, '0', 0.00, '2022-11-30', '1', NULL, 0, '1', '2022-11-30 10:56:27', '2022-11-30 10:56:27'),
(7247, 'SI-0000574', 'PDT-000106', '1', 1.00, 13.75, 15.00, '0', 0.00, '2022-11-30', '1', NULL, 0, '1', '2022-11-30 10:56:27', '2022-11-30 10:56:27'),
(7248, 'SI-0000575', 'PDT-000148', '1', 16.00, 1.95, 2.20, '0', 0.00, '2022-11-30', '1', NULL, 0, '1', '2022-11-30 11:43:06', '2022-11-30 11:43:06'),
(7249, 'SI-0000576', 'PDT-000034', '1', 2.00, 86.13, 95.00, '0', 0.00, '2022-11-30', '1', NULL, 0, '1', '2022-11-30 13:08:24', '2022-11-30 13:08:24'),
(7250, 'SI-0000577', 'PDT-000269', '15', 1.00, 1095.00, 1310.00, '0', 0.00, '2022-12-01', '1', NULL, 0, '1', '2022-12-01 04:46:57', '2022-12-01 04:46:57'),
(7251, 'SI-0000578', 'PDT-000174', '1', 1.00, 550.00, 590.00, '0', 0.00, '2022-12-01', '1', NULL, 0, '1', '2022-12-01 06:11:13', '2022-12-01 06:11:13'),
(7252, 'SI-0000578', 'PDT-000019', '1', 1.00, 365.62, 395.00, '0', 0.00, '2022-12-01', '1', NULL, 0, '1', '2022-12-01 06:11:13', '2022-12-01 06:11:13'),
(7253, 'SI-0000578', 'PDT-000181', '1', 3.00, 78.34, 90.00, '0', 0.00, '2022-12-01', '1', NULL, 0, '1', '2022-12-01 06:11:13', '2022-12-01 06:11:13'),
(7254, 'SI-0000578', 'PDT-000177', '1', 2.00, 30.11, 33.00, '0', 0.00, '2022-12-01', '1', NULL, 0, '1', '2022-12-01 06:11:13', '2022-12-01 06:11:13'),
(7255, 'SI-0000579', 'PDT-000011', '15', 1.00, 900.00, 1100.00, '0', 0.00, '2022-12-01', '1', NULL, 0, '1', '2022-12-01 06:19:31', '2022-12-01 06:19:31'),
(7256, 'SI-0000579', 'PDT-000124', '1', 1.00, 312.50, 375.00, '0', 0.00, '2022-12-01', '1', NULL, 0, '1', '2022-12-01 06:19:31', '2022-12-01 06:19:31'),
(7257, 'SI-0000580', 'PDT-000229', '1', 1.00, 971.09, 1050.00, '0', 0.00, '2022-12-01', '1', NULL, 0, '1', '2022-12-01 12:52:25', '2022-12-01 12:52:25'),
(7258, 'SI-0000581', 'PDT-000269', '15', 1.00, 1095.00, 1300.00, '0', 0.00, '2022-12-02', '1', NULL, 0, '1', '2022-12-02 12:19:39', '2022-12-02 12:19:39'),
(7259, 'SI-0000582', 'PDT-000097', '1', 1.00, 178.57, 200.00, '0', 0.00, '2022-12-02', '1', NULL, 0, '1', '2022-12-02 12:20:22', '2022-12-02 12:20:22'),
(7260, 'SI-0000583', 'PDT-000034', '1', 4.00, 86.13, 95.00, '0', 0.00, '2022-12-02', '1', NULL, 0, '1', '2022-12-02 12:50:56', '2022-12-02 12:50:56'),
(7261, 'SI-0000583', 'PDT-000182', '1', 1.00, 268.80, 290.00, '0', 0.00, '2022-12-02', '1', NULL, 0, '1', '2022-12-02 12:50:56', '2022-12-02 12:50:56'),
(7262, 'SI-0000583', 'PDT-000275', '1', 1.00, 26.45, 32.00, '0', 0.00, '2022-12-02', '1', NULL, 0, '1', '2022-12-02 12:50:56', '2022-12-02 12:50:56'),
(7263, 'SI-0000583', 'PDT-000157', '1', 1.00, 190.00, 210.00, '0', 0.00, '2022-12-02', '1', NULL, 0, '1', '2022-12-02 12:50:56', '2022-12-02 12:50:56'),
(7264, 'SI-0000584', 'PDT-000033', '1', 1.00, 582.58, 630.00, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 10:54:19', '2022-12-03 10:54:19'),
(7265, 'SI-0000584', 'PDT-000050', '1', 2.00, 81.96, 100.00, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 10:54:19', '2022-12-03 10:54:19'),
(7266, 'SI-0000584', 'PDT-000061', '1', 4.00, 72.32, 80.00, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 10:54:19', '2022-12-03 10:54:19'),
(7267, 'SI-0000584', 'PDT-000254', '1', 4.00, 309.00, 450.00, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 10:54:19', '2022-12-03 10:54:19'),
(7268, 'SI-0000585', 'PDT-000269', '15', 8.00, 1095.00, 1280.00, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 10:57:30', '2022-12-03 10:57:30'),
(7269, 'SI-0000586', 'PDT-000166', '1', 1.00, 30.02, 35.00, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 10:58:47', '2022-12-03 10:58:47'),
(7270, 'SI-0000586', 'PDT-000106', '1', 1.00, 13.75, 15.00, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 10:58:47', '2022-12-03 10:58:47'),
(7271, 'SI-0000587', 'PDT-000220', '1', 2.00, 38.41, 42.00, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 11:05:06', '2022-12-03 11:05:06'),
(7272, 'SI-0000587', 'PDT-000154', '1', 1.00, 166.10, 185.00, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 11:05:06', '2022-12-03 11:05:06'),
(7273, 'SI-0000587', 'PDT-000132', '1', 1.00, 93.84, 105.00, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 11:05:06', '2022-12-03 11:05:06'),
(7274, 'SI-0000588', 'PDT-000066', '1', 5.00, 265.89, 310.00, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 13:20:54', '2022-12-03 13:20:54'),
(7275, 'SI-0000588', 'PDT-000046', '1', 2.00, 99.78, 120.00, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 13:20:54', '2022-12-03 13:20:54'),
(7276, 'SI-0000588', 'PDT-000059', '1', 1.00, 340.00, 400.00, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 13:20:54', '2022-12-03 13:20:54'),
(7277, 'SI-0000588', 'PDT-000065', '1', 1.00, 66.82, 85.00, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 13:20:54', '2022-12-03 13:20:54'),
(7278, 'SI-0000588', 'PDT-000099', '1', 1.00, 191.10, 215.00, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 13:20:54', '2022-12-03 13:20:54'),
(7279, 'SI-0000588', 'PDT-000060', '1', 4.00, 187.09, 200.00, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 13:20:54', '2022-12-03 13:20:54'),
(7280, 'SI-0000588', 'PDT-000075', '1', 1.00, 383.15, 430.00, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 13:20:54', '2022-12-03 13:20:54'),
(7281, 'SI-0000589', 'PDT-000123', '1', 6.00, 16.24, 19.00, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 13:34:46', '2022-12-03 13:34:46'),
(7282, 'SI-0000589', 'PDT-000305', '1', 1.00, 181.07, 220.00, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 13:34:46', '2022-12-03 13:34:46'),
(7283, 'SI-0000589', 'PDT-000149', '1', 6.00, 3.43, 4.00, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 13:34:46', '2022-12-03 13:34:46'),
(7286, 'SI-0000590', 'PDT-000299', '1', 6.00, 54.03, 65.00, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 13:49:22', '2022-12-03 13:49:22'),
(7287, 'SI-0000590', 'PDT-000287', '1', 1.00, 34.44, 40.00, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 13:49:22', '2022-12-03 13:49:22'),
(7288, 'SI-0000591', 'PDT-000082', '1', 1.00, 637.88, 700.00, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 14:10:56', '2022-12-03 14:10:56'),
(7289, 'SI-0000591', 'PDT-000138', '1', 1.00, 206.36, 225.00, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 14:10:56', '2022-12-03 14:10:56'),
(7290, 'SI-0000591', 'PDT-000148', '1', 60.00, 1.95, 2.20, '0', 0.00, '2022-12-03', '1', NULL, 0, '1', '2022-12-03 14:10:56', '2022-12-03 14:10:56'),
(7291, 'SI-0000592', 'PDT-000026', '1', 2.00, 31.76, 35.00, '0', 0.00, '2022-12-04', '1', NULL, 0, '1', '2022-12-04 04:53:35', '2022-12-04 04:53:35'),
(7292, 'SI-0000592', 'PDT-000106', '1', 2.00, 13.75, 15.00, '0', 0.00, '2022-12-04', '1', NULL, 0, '1', '2022-12-04 04:53:35', '2022-12-04 04:53:35'),
(7293, 'SI-0000593', 'PDT-000066', '1', 2.00, 265.89, 310.00, '0', 0.00, '2022-12-04', '1', NULL, 0, '1', '2022-12-04 07:13:52', '2022-12-04 07:13:52'),
(7294, 'SI-0000593', 'PDT-000060', '1', 2.00, 187.09, 200.00, '0', 0.00, '2022-12-04', '1', NULL, 0, '1', '2022-12-04 07:13:52', '2022-12-04 07:13:52'),
(7295, 'SI-0000593', 'PDT-000052', '1', 1.00, 175.18, 220.00, '0', 0.00, '2022-12-04', '1', NULL, 0, '1', '2022-12-04 07:13:52', '2022-12-04 07:13:52'),
(7296, 'SI-0000593', 'PDT-000058', '1', 1.00, 83.78, 100.00, '0', 0.00, '2022-12-04', '1', NULL, 0, '1', '2022-12-04 07:13:52', '2022-12-04 07:13:52'),
(7297, 'SI-0000593', 'PDT-000042', '1', 2.00, 192.53, 220.00, '0', 0.00, '2022-12-04', '1', NULL, 0, '1', '2022-12-04 07:13:52', '2022-12-04 07:13:52'),
(7298, 'SI-0000594', 'PDT-000097', '1', 2.00, 178.57, 200.00, '0', 0.00, '2022-12-05', '1', NULL, 0, '1', '2022-12-05 10:33:11', '2022-12-05 10:33:11'),
(7299, 'SI-0000594', 'PDT-000081', '1', 2.00, 44.70, 60.00, '0', 0.00, '2022-12-05', '1', NULL, 0, '1', '2022-12-05 10:33:11', '2022-12-05 10:33:11'),
(7300, 'SI-0000595', 'PDT-000118', '1', 4.00, 31.99, 35.00, '0', 0.00, '2022-12-05', '1', NULL, 0, '1', '2022-12-05 10:34:51', '2022-12-05 10:34:51'),
(7301, 'SI-0000596', 'PDT-000131', '1', 1.00, 111.35, 130.00, '0', 0.00, '2022-12-05', '1', NULL, 0, '1', '2022-12-05 10:35:39', '2022-12-05 10:35:39'),
(7302, 'SI-0000597', 'PDT-000177', '1', 2.00, 30.11, 33.00, '0', 0.00, '2022-12-05', '1', NULL, 0, '1', '2022-12-05 10:36:25', '2022-12-05 10:36:25'),
(7303, 'SI-0000598', 'PDT-000164', '1', 2.00, 10.14, 12.00, '0', 0.00, '2022-12-05', '1', NULL, 0, '1', '2022-12-05 10:37:53', '2022-12-05 10:37:53'),
(7304, 'SI-0000598', 'PDT-000090', '1', 2.00, 31.18, 35.00, '0', 0.00, '2022-12-05', '1', NULL, 0, '1', '2022-12-05 10:37:53', '2022-12-05 10:37:53'),
(7305, 'SI-0000599', 'PDT-000182', '1', 2.00, 268.80, 290.00, '0', 0.00, '2022-12-05', '1', NULL, 0, '1', '2022-12-05 10:38:57', '2022-12-05 10:38:57'),
(7306, 'SI-0000600', 'PDT-000109', '1', 4.00, 683.06, 715.00, '0', 0.00, '2022-12-05', '1', NULL, 0, '1', '2022-12-05 12:17:06', '2022-12-05 12:17:06'),
(7309, 'SI-0000602', 'PDT-000026', '1', 2.00, 31.76, 35.00, '0', 0.00, '2022-12-06', '1', NULL, 0, '1', '2022-12-06 12:11:47', '2022-12-06 12:11:47'),
(7310, 'SI-0000602', 'PDT-000106', '1', 2.00, 13.75, 15.00, '0', 0.00, '2022-12-06', '1', NULL, 0, '1', '2022-12-06 12:11:47', '2022-12-06 12:11:47'),
(7311, 'SI-0000603', 'PDT-000026', '1', 1.00, 31.76, 35.00, '0', 0.00, '2022-12-06', '1', NULL, 0, '1', '2022-12-06 13:02:33', '2022-12-06 13:02:33'),
(7312, 'SI-0000603', 'PDT-000106', '1', 1.00, 13.75, 15.00, '0', 0.00, '2022-12-06', '1', NULL, 0, '1', '2022-12-06 13:02:33', '2022-12-06 13:02:33'),
(7313, 'SI-0000604', 'PDT-000180', '1', 1.00, 596.16, 650.00, '0', 0.00, '2022-12-06', '1', NULL, 0, '1', '2022-12-06 13:09:38', '2022-12-06 13:09:38'),
(7314, 'SI-0000605', 'PDT-000174', '1', 1.00, 550.00, 580.00, '0', 0.00, '2022-12-07', '1', NULL, 0, '1', '2022-12-07 04:35:33', '2022-12-07 04:35:33'),
(7315, 'SI-0000606', 'PDT-000024', '1', 1.00, 5.61, 7.00, '0', 0.00, '2022-12-07', '1', NULL, 0, '1', '2022-12-07 04:37:09', '2022-12-07 04:37:09'),
(7316, 'SI-0000607', 'PDT-000018', '1', 2.00, 171.61, 188.00, '0', 0.00, '2022-12-07', '1', NULL, 0, '1', '2022-12-07 12:56:03', '2022-12-07 12:56:03'),
(7317, 'SI-0000607', 'PDT-000023', '1', 1.00, 208.93, 265.00, '0', 0.00, '2022-12-07', '1', NULL, 0, '1', '2022-12-07 12:56:03', '2022-12-07 12:56:03'),
(7318, 'SI-0000607', 'PDT-000072', '1', 1.00, 630.00, 730.00, '0', 0.00, '2022-12-07', '1', NULL, 0, '1', '2022-12-07 12:56:03', '2022-12-07 12:56:03'),
(7322, 'SI-0000611', 'PDT-000310', '1', 1.00, 1741.55, 2000.00, '0', 0.00, '2022-12-08', '1', NULL, 0, '1', '2022-12-08 13:06:52', '2022-12-08 13:06:52'),
(7332, 'SI-0000612', 'PDT-000267', '1', 6.00, 21.77, 25.00, '0', 0.00, '2022-12-08', '1', NULL, 0, '1', '2022-12-08 14:09:25', '2022-12-08 14:09:25'),
(7339, 'SI-0000616', 'PDT-000201', '1', 4.00, 111.46, 130.00, '0', 0.00, '2022-12-09', '1', NULL, 0, '1', '2022-12-09 04:57:35', '2022-12-09 04:57:35'),
(7340, 'SI-0000616', 'PDT-000153', '1', 1.00, 75.51, 85.00, '0', 0.00, '2022-12-09', '1', NULL, 0, '1', '2022-12-09 04:57:35', '2022-12-09 04:57:35'),
(7341, 'SI-0000616', 'PDT-000123', '1', 5.00, 16.24, 19.00, '0', 0.00, '2022-12-09', '1', NULL, 0, '1', '2022-12-09 04:57:35', '2022-12-09 04:57:35'),
(7342, 'SI-0000616', 'PDT-000189', '1', 1.00, 172.40, 200.00, '0', 0.00, '2022-12-09', '1', NULL, 0, '1', '2022-12-09 04:57:35', '2022-12-09 04:57:35'),
(7453, 'SI-0000617', 'PDT-000146', '1', 21.00, 7.82, 10.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 06:35:15', '2022-12-10 06:35:15'),
(7454, 'SI-0000617', 'PDT-000149', '1', 5.00, 3.43, 4.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 06:35:15', '2022-12-10 06:35:15'),
(7455, 'SI-0000617', 'PDT-000125', '1', 7.00, 30.00, 35.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 06:35:15', '2022-12-10 06:35:15'),
(7456, 'SI-0000617', 'PDT-000123', '1', 3.00, 16.24, 19.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 06:35:15', '2022-12-10 06:35:15'),
(7457, 'SI-0000618', 'PDT-000146', '1', 21.00, 7.82, 10.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 06:35:20', '2022-12-10 06:35:20'),
(7458, 'SI-0000618', 'PDT-000149', '1', 5.00, 3.43, 4.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 06:35:20', '2022-12-10 06:35:20'),
(7459, 'SI-0000618', 'PDT-000125', '1', 7.00, 30.00, 35.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 06:35:20', '2022-12-10 06:35:20'),
(7460, 'SI-0000618', 'PDT-000123', '1', 3.00, 16.24, 19.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 06:35:20', '2022-12-10 06:35:20'),
(7461, 'SI-0000619', 'PDT-000146', '1', 21.00, 7.82, 10.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 06:35:23', '2022-12-10 06:35:23'),
(7462, 'SI-0000619', 'PDT-000149', '1', 5.00, 3.43, 4.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 06:35:23', '2022-12-10 06:35:23'),
(7463, 'SI-0000619', 'PDT-000125', '1', 7.00, 30.00, 35.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 06:35:23', '2022-12-10 06:35:23'),
(7464, 'SI-0000619', 'PDT-000123', '1', 3.00, 16.24, 19.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 06:35:23', '2022-12-10 06:35:23'),
(7465, 'SI-0000620', 'PDT-000146', '1', 21.00, 7.82, 10.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 06:35:23', '2022-12-10 06:35:23'),
(7466, 'SI-0000620', 'PDT-000149', '1', 5.00, 3.43, 4.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 06:35:23', '2022-12-10 06:35:23'),
(7467, 'SI-0000620', 'PDT-000125', '1', 7.00, 30.00, 35.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 06:35:23', '2022-12-10 06:35:23'),
(7468, 'SI-0000620', 'PDT-000123', '1', 3.00, 16.24, 19.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 06:35:23', '2022-12-10 06:35:23'),
(7469, 'SI-0000621', 'PDT-000146', '1', 21.00, 7.82, 10.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 06:35:23', '2022-12-10 06:35:23'),
(7470, 'SI-0000621', 'PDT-000149', '1', 5.00, 3.43, 4.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 06:35:23', '2022-12-10 06:35:23'),
(7471, 'SI-0000621', 'PDT-000125', '1', 7.00, 30.00, 35.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 06:35:23', '2022-12-10 06:35:23'),
(7472, 'SI-0000621', 'PDT-000123', '1', 3.00, 16.24, 19.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 06:35:24', '2022-12-10 06:35:24'),
(7473, 'SI-0000622', 'PDT-000146', '1', 21.00, 7.82, 10.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 06:35:24', '2022-12-10 06:35:24'),
(7474, 'SI-0000622', 'PDT-000149', '1', 5.00, 3.43, 4.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 06:35:24', '2022-12-10 06:35:24'),
(7475, 'SI-0000622', 'PDT-000125', '1', 7.00, 30.00, 35.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 06:35:24', '2022-12-10 06:35:24'),
(7476, 'SI-0000622', 'PDT-000123', '1', 3.00, 16.24, 19.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 06:35:24', '2022-12-10 06:35:24'),
(7477, 'SI-0000623', 'PDT-000125', '1', 6.00, 30.00, 35.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 10:50:28', '2022-12-10 10:50:28'),
(7478, 'SI-0000623', 'PDT-000189', '1', 1.00, 172.40, 200.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 10:50:28', '2022-12-10 10:50:28'),
(7479, 'SI-0000623', 'PDT-000148', '1', 4.00, 1.95, 2.20, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 10:50:28', '2022-12-10 10:50:28'),
(7480, 'SI-0000624', 'PDT-000125', '1', 6.00, 30.00, 35.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 10:50:29', '2022-12-10 10:50:29'),
(7481, 'SI-0000624', 'PDT-000189', '1', 1.00, 172.40, 200.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 10:50:29', '2022-12-10 10:50:29'),
(7482, 'SI-0000624', 'PDT-000148', '1', 4.00, 1.95, 2.20, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 10:50:29', '2022-12-10 10:50:29'),
(7483, 'SI-0000625', 'PDT-000125', '1', 6.00, 30.00, 35.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 10:50:30', '2022-12-10 10:50:30'),
(7484, 'SI-0000625', 'PDT-000189', '1', 1.00, 172.40, 200.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 10:50:30', '2022-12-10 10:50:30'),
(7485, 'SI-0000625', 'PDT-000148', '1', 4.00, 1.95, 2.20, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 10:50:30', '2022-12-10 10:50:30'),
(7486, 'SI-0000626', 'PDT-000125', '1', 6.00, 30.00, 35.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 10:50:30', '2022-12-10 10:50:30'),
(7487, 'SI-0000626', 'PDT-000189', '1', 1.00, 172.40, 200.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 10:50:30', '2022-12-10 10:50:30'),
(7488, 'SI-0000626', 'PDT-000148', '1', 4.00, 1.95, 2.20, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 10:50:30', '2022-12-10 10:50:30'),
(7489, 'SI-0000627', 'PDT-000125', '1', 6.00, 30.00, 35.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 10:50:30', '2022-12-10 10:50:30'),
(7490, 'SI-0000627', 'PDT-000189', '1', 1.00, 172.40, 200.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 10:50:30', '2022-12-10 10:50:30'),
(7491, 'SI-0000627', 'PDT-000148', '1', 4.00, 1.95, 2.20, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 10:50:30', '2022-12-10 10:50:30'),
(7492, 'SI-0000628', 'PDT-000125', '1', 6.00, 30.00, 35.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 10:50:36', '2022-12-10 10:50:36'),
(7493, 'SI-0000628', 'PDT-000189', '1', 1.00, 172.40, 200.00, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 10:50:36', '2022-12-10 10:50:36'),
(7494, 'SI-0000628', 'PDT-000148', '1', 4.00, 1.95, 2.20, '0', 0.00, '2022-12-10', '1', NULL, 0, '1', '2022-12-10 10:50:36', '2022-12-10 10:50:36'),
(7495, 'SI-0000629', 'PDT-000161', '1', 1.00, 950.00, 1100.00, '0', 0.00, '2022-12-14', '1', NULL, 0, '1', '2022-12-14 12:36:19', '2022-12-14 12:36:19'),
(7496, 'SI-0000629', 'PDT-000235', '1', 1.00, 405.82, 445.00, '0', 0.00, '2022-12-14', '1', NULL, 0, '1', '2022-12-14 12:36:19', '2022-12-14 12:36:19'),
(7497, 'SI-0000629', 'PDT-000037', '1', 40.00, 8.62, 10.00, '0', 0.00, '2022-12-14', '1', NULL, 0, '1', '2022-12-14 12:36:19', '2022-12-14 12:36:19'),
(7498, 'SI-0000629', 'PDT-000017', '1', 42.00, 4.06, 5.00, '0', 0.00, '2022-12-14', '1', NULL, 0, '1', '2022-12-14 12:36:19', '2022-12-14 12:36:19'),
(7499, 'SI-0000629', 'PDT-000089', '1', 11.00, 18.38, 22.00, '0', 0.00, '2022-12-14', '1', NULL, 0, '1', '2022-12-14 12:36:19', '2022-12-14 12:36:19'),
(7500, 'SI-0000629', 'PDT-000314', '1', 12.00, 26.40, 30.00, '0', 0.00, '2022-12-14', '1', NULL, 0, '1', '2022-12-14 12:36:19', '2022-12-14 12:36:19'),
(7507, 'SI-0000630', 'PDT-000107', '1', 6.00, 161.87, 170.00, '0', 0.00, '2023-01-01', '1', NULL, 0, '1', '2023-01-01 12:12:01', '2023-01-01 12:12:01'),
(7508, 'SI-0000630', 'PDT-000062', '1', 3.00, 172.67, 195.00, '0', 0.00, '2023-01-01', '1', NULL, 0, '1', '2023-01-01 12:12:01', '2023-01-01 12:12:01'),
(7509, 'SI-0000630', 'PDT-000033', '1', 1.00, 582.58, 630.00, '0', 0.00, '2023-01-01', '1', NULL, 0, '1', '2023-01-01 12:12:01', '2023-01-01 12:12:01'),
(7510, 'SI-0000630', 'PDT-000053', '1', 1.00, 168.00, 230.00, '0', 0.00, '2023-01-01', '1', NULL, 0, '1', '2023-01-01 12:12:01', '2023-01-01 12:12:01'),
(7511, 'SI-0000630', 'PDT-000150', '1', 1.00, 3.85, 4.00, '0', 0.00, '2023-01-01', '1', NULL, 0, '1', '2023-01-01 12:12:01', '2023-01-01 12:12:01');

-- --------------------------------------------------------

--
-- Table structure for table `sales_ledger`
--

CREATE TABLE `sales_ledger` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_no` varchar(15) NOT NULL,
  `invoice_date` varchar(50) NOT NULL,
  `customer_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `total` double(11,2) NOT NULL DEFAULT 0.00,
  `final_discount` double(11,2) NOT NULL DEFAULT 0.00,
  `paid_amount` double(11,2) NOT NULL DEFAULT 0.00,
  `return_amount` double(11,2) NOT NULL DEFAULT 0.00,
  `vat` double(11,2) NOT NULL DEFAULT 0.00,
  `note` mediumtext DEFAULT NULL,
  `transaction_type` varchar(50) DEFAULT NULL,
  `entry_date` varchar(50) DEFAULT NULL,
  `branch_id` varchar(11) DEFAULT NULL,
  `status` int(2) DEFAULT 0,
  `admin_id` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_ledger`
--

INSERT INTO `sales_ledger` (`id`, `invoice_no`, `invoice_date`, `customer_id`, `total`, `final_discount`, `paid_amount`, `return_amount`, `vat`, `note`, `transaction_type`, `entry_date`, `branch_id`, `status`, `admin_id`, `created_at`, `updated_at`) VALUES
(2042, 'SI-0000001', '2022-03-10', 'C-00002', 50.00, 0.00, 50.00, 0.00, 0.00, NULL, 'Cash', '2022-10-03', '1', 0, 1, '2022-10-03 13:19:37', '2022-10-24 05:26:49'),
(2043, 'SI-0000002', '2022-03-10', 'C-00010', 1580.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-03', '1', 0, 1, '2022-10-03 13:23:30', '2022-10-24 05:26:49'),
(2044, 'SI-0000003', '2022-03-10', 'C-00012', 4290.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-03', '1', 0, 1, '2022-10-03 13:35:47', '2022-10-24 05:26:49'),
(2046, 'SI-0000004', '2022-03-10', 'C-00018', 1330.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-03', '1', 0, 1, '2022-10-03 13:55:45', '2022-10-24 05:26:49'),
(2047, 'SI-0000005', '2022-04-10', 'C-00002', 485.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-04', '1', 0, 1, '2022-10-04 04:37:40', '2022-10-24 05:26:49'),
(2048, 'SI-0000006', '2022-04-10', 'C-00002', 49.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-04', '1', 0, 1, '2022-10-04 04:41:18', '2022-10-24 05:26:49'),
(2049, 'SI-0000007', '2022-04-10', 'C-00002', 4250.00, 0.00, 4250.00, 0.00, 0.00, NULL, 'Cash', '2022-10-04', '1', 0, 1, '2022-10-04 11:40:08', '2022-10-24 05:26:49'),
(2050, 'SI-0000008', '2022-04-10', 'C-00002', 1725.00, 0.00, 1725.00, 0.00, 0.00, NULL, 'Cash', '2022-10-04', '1', 0, 1, '2022-10-04 12:29:54', '2022-10-24 05:26:49'),
(2051, 'SI-0000009', '2022-04-10', 'C-00002', 313.00, 0.00, 313.00, 0.00, 0.00, NULL, 'Cash', '2022-10-04', '1', 0, 1, '2022-10-04 13:05:29', '2022-10-24 05:26:49'),
(2052, 'SI-0000010', '2022-05-10', 'C-00002', 6.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-05', '1', 0, 1, '2022-10-05 03:38:33', '2022-10-24 05:26:49'),
(2053, 'SI-0000011', '2022-05-10', 'C-00002', 9.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-05', '1', 0, 1, '2022-10-05 03:46:58', '2022-10-24 05:26:49'),
(2054, 'SI-0000012', '2022-05-10', 'C-00002', 510.00, 0.00, 510.00, 0.00, 0.00, NULL, 'Cash', '2022-10-05', '1', 0, 1, '2022-10-05 11:10:01', '2022-10-24 05:26:49'),
(2055, 'SI-0000013', '2022-05-10', 'C-00002', 12.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-05', '1', 0, 1, '2022-10-05 11:59:37', '2022-10-24 05:26:49'),
(2056, 'SI-0000014', '2022-05-10', 'C-00018', 1050.00, 50.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-05', '1', 0, 1, '2022-10-05 12:46:48', '2022-10-24 05:26:49'),
(2057, 'SI-0000015', '2022-06-10', 'C-00002', 265.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-06', '1', 0, 1, '2022-10-06 04:56:25', '2022-10-24 05:26:49'),
(2058, 'SI-0000016', '2022-06-10', 'C-00002', 500.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-06', '1', 0, 1, '2022-10-06 05:04:09', '2022-10-24 05:26:49'),
(2059, 'SI-0000017', '2022-06-10', 'C-00002', 515.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-06', '1', 0, 1, '2022-10-06 12:35:21', '2022-10-24 05:26:49'),
(2060, 'SI-0000018', '2022-06-10', 'C-00002', 851.00, 0.00, 500.00, 0.00, 0.00, NULL, 'Cash', '2022-10-06', '1', 0, 1, '2022-10-06 12:46:23', '2022-10-24 05:26:49'),
(2061, 'SI-0000019', '2022-07-10', 'C-00002', 225.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 04:24:28', '2022-10-24 05:26:49'),
(2062, 'SI-0000020', '2022-08-07', 'C-00006', 36091.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:10:20', '2022-10-24 05:26:49'),
(2063, 'SI-0000021', '2022-08-07', 'C-00009', 102000.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:11:54', '2022-10-24 05:26:49'),
(2064, 'SI-0000022', '2022-08-07', 'C-00007', 550.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:13:16', '2022-10-24 05:26:49'),
(2065, 'SI-0000023', '2022-08-08', 'C-00008', 4120.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:14:57', '2022-10-24 05:26:49'),
(2066, 'SI-0000024', '2022-08-09', 'C-00015', 1100.00, 0.00, 1000.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:17:13', '2022-10-24 05:26:49'),
(2067, 'SI-0000025', '2022-08-09', 'C-00007', 900.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:18:29', '2022-10-24 05:26:49'),
(2068, 'SI-0000026', '2022-08-07', 'C-00009', 21130.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:19:34', '2022-10-24 05:26:49'),
(2069, 'SI-0000027', '2022-08-10', 'C-00002', 160.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:21:15', '2022-10-24 05:26:49'),
(2070, 'SI-0000028', '2022-08-10', 'C-00011', 220.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:22:21', '2022-10-24 05:26:49'),
(2071, 'SI-0000029', '2022-08-10', 'C-00009', 1000.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:26:44', '2022-10-24 05:26:49'),
(2072, 'SI-0000030', '2022-08-11', 'C-00009', 1820.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:28:14', '2022-10-24 05:26:49'),
(2073, 'SI-0000031', '2022-08-11', 'C-00007', 32920.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:31:01', '2022-10-24 05:26:49'),
(2074, 'SI-0000032', '2022-08-12', 'C-00005', 1870.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:34:15', '2022-10-24 05:26:49'),
(2075, 'SI-0000033', '2022-08-12', 'C-00005', 550.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:35:51', '2022-10-24 05:26:49'),
(2076, 'SI-0000034', '2022-08-12', 'C-00002', 1100.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:37:56', '2022-10-24 05:26:49'),
(2077, 'SI-0000035', '2022-08-13', 'C-00014', 780.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:39:12', '2022-10-24 05:26:49'),
(2078, 'SI-0000036', '2022-08-13', 'C-00009', 76850.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:41:58', '2022-10-24 05:26:49'),
(2079, 'SI-0000037', '2022-08-13', 'C-00010', 9333.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:43:02', '2022-10-24 05:26:49'),
(2080, 'SI-0000038', '2022-08-13', 'C-00002', 10.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:43:53', '2022-10-24 05:26:49'),
(2081, 'SI-0000039', '2022-08-13', 'C-00002', 230.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:44:51', '2022-10-24 05:26:49'),
(2082, 'SI-0000040', '2022-08-14', 'C-00002', 42.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:46:10', '2022-10-24 05:26:49'),
(2083, 'SI-0000041', '2022-08-14', 'C-00002', 60.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:47:39', '2022-10-24 05:26:49'),
(2084, 'SI-0000042', '2022-08-14', 'C-00002', 40.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:48:18', '2022-10-24 05:26:49'),
(2085, 'SI-0000043', '2022-08-14', 'C-00002', 40.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:48:55', '2022-10-24 05:26:49'),
(2086, 'SI-0000044', '2022-08-14', 'C-00007', 6090.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:50:37', '2022-10-24 05:26:49'),
(2087, 'SI-0000045', '2022-08-15', 'C-00002', 10.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:51:23', '2022-10-24 05:26:49'),
(2088, 'SI-0000046', '2022-08-16', 'C-00014', 440.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:52:23', '2022-10-24 05:26:49'),
(2089, 'SI-0000047', '2022-08-16', 'C-00007', 3420.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:54:29', '2022-10-24 05:26:49'),
(2090, 'SI-0000048', '2022-08-17', 'C-00002', 60.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:56:33', '2022-10-24 05:26:49'),
(2091, 'SI-0000049', '2022-08-17', 'C-00002', 180.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 05:58:24', '2022-10-24 05:26:49'),
(2092, 'SI-0000050', '2022-08-17', 'C-00006', 21450.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 06:01:37', '2022-10-24 05:26:49'),
(2093, 'SI-0000051', '2022-08-17', 'C-00002', 120.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 06:02:51', '2022-10-24 05:26:49'),
(2094, 'SI-0000052', '2022-08-17', 'C-00009', 900.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 06:03:47', '2022-10-24 05:26:49'),
(2095, 'SI-0000053', '2022-08-18', 'C-00010', 3660.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 06:05:54', '2022-10-24 05:26:49'),
(2096, 'SI-0000054', '2022-08-18', 'C-00002', 40.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 06:06:33', '2022-10-24 05:26:49'),
(2097, 'SI-0000055', '2022-08-18', 'C-00007', 72824.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 06:07:33', '2022-10-24 05:26:49'),
(2098, 'SI-0000056', '2022-08-19', 'C-00009', 212000.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 06:08:47', '2022-10-24 05:26:49'),
(2099, 'SI-0000057', '2022-08-19', 'C-00013', 1200.00, 0.00, 1200.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 06:10:56', '2022-10-24 05:26:49'),
(2100, 'SI-0000058', '2022-08-19', 'C-00002', 24.00, 0.00, 24.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 06:11:47', '2022-10-24 05:26:49'),
(2101, 'SI-0000059', '2022-08-19', 'C-00008', 1000.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 06:12:30', '2022-10-24 05:26:49'),
(2102, 'SI-0000060', '2022-08-19', 'C-00015', 850.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 06:13:21', '2022-10-24 05:26:49'),
(2103, 'SI-0000061', '2022-08-20', 'C-00002', 2150.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 06:16:37', '2022-10-24 05:26:49'),
(2104, 'SI-0000062', '2022-08-20', 'C-00002', 50.00, 0.00, 50.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 06:39:07', '2022-10-24 05:26:49'),
(2105, 'SI-0000063', '2022-08-20', 'C-00008', 46200.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 06:39:57', '2022-10-24 05:26:49'),
(2106, 'SI-0000064', '2022-08-20', 'C-00006', 6710.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 06:42:30', '2022-10-24 05:26:49'),
(2107, 'SI-0000065', '2022-08-20', 'C-00002', 50.00, 0.00, 50.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 06:43:43', '2022-10-24 05:26:49'),
(2108, 'SI-0000066', '2022-08-21', 'C-00002', 50.00, 0.00, 50.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 06:44:34', '2022-10-24 05:26:49'),
(2109, 'SI-0000067', '2022-08-21', 'C-00002', 91.00, 0.00, 90.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 06:45:55', '2022-10-24 05:26:49'),
(2110, 'SI-0000068', '2022-07-10', 'C-00014', 1780.00, 0.00, 1500.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 06:47:59', '2022-10-24 05:26:49'),
(2111, 'SI-0000069', '2022-08-22', 'C-00002', 50.00, 0.00, 50.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 06:49:05', '2022-10-24 05:26:49'),
(2112, 'SI-0000070', '2022-08-22', 'C-00002', 17.00, 1.00, 16.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 06:49:46', '2022-10-24 05:26:49'),
(2113, 'SI-0000071', '2022-08-23', 'C-00008', 7920.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 06:51:27', '2022-10-24 05:26:49'),
(2114, 'SI-0000072', '2022-08-23', 'C-00007', 1600.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 06:53:43', '2022-10-24 05:26:49'),
(2115, 'SI-0000073', '2022-08-23', 'C-00015', 370.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 09:47:34', '2022-10-24 05:26:49'),
(2116, 'SI-0000074', '2022-07-10', 'C-00014', 720.00, 0.00, 700.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 09:49:21', '2022-10-24 05:26:49'),
(2117, 'SI-0000075', '2022-08-24', 'C-00002', 1200.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 09:54:18', '2022-10-24 05:26:49'),
(2118, 'SI-0000076', '2022-08-24', 'C-00007', 215.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 09:57:04', '2022-10-24 05:26:49'),
(2119, 'SI-0000077', '2022-08-25', 'C-00009', 54456.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 10:03:22', '2022-10-24 05:26:49'),
(2120, 'SI-0000078', '2022-08-25', 'C-00010', 980.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 10:06:40', '2022-10-24 05:26:49'),
(2121, 'SI-0000079', '2022-08-25', 'C-00013', 1440.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 10:09:42', '2022-10-24 05:26:49'),
(2122, 'SI-0000080', '2022-08-26', 'C-00007', 2580.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 10:11:52', '2022-10-24 05:26:49'),
(2123, 'SI-0000081', '2022-08-26', 'C-00002', 35.00, 0.00, 35.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 10:13:23', '2022-10-24 05:26:49'),
(2124, 'SI-0000082', '2022-08-26', 'C-00002', 50.00, 0.00, 50.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 10:16:15', '2022-10-24 05:26:49'),
(2125, 'SI-0000083', '2022-08-26', 'C-00002', 3.00, 0.00, 3.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 10:17:26', '2022-10-24 05:26:49'),
(2126, 'SI-0000084', '2022-08-27', 'C-00007', 3292.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 10:20:30', '2022-10-24 05:26:49'),
(2127, 'SI-0000085', '2022-08-27', 'C-00002', 50.00, 0.00, 50.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 10:23:02', '2022-10-24 05:26:49'),
(2128, 'SI-0000086', '2022-08-27', 'C-00002', 51.00, 1.00, 50.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 10:27:41', '2022-10-24 05:26:49'),
(2129, 'SI-0000087', '2022-08-27', 'C-00002', 390.00, 0.00, 390.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 10:29:01', '2022-10-24 05:26:49'),
(2130, 'SI-0000088', '2022-08-28', 'C-00002', 345.00, 0.00, 345.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 10:32:12', '2022-10-24 05:26:49'),
(2131, 'SI-0000089', '2022-08-28', 'C-00008', 86850.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 10:34:55', '2022-10-24 05:26:49'),
(2132, 'SI-0000090', '2022-08-28', 'C-00002', 76.00, 0.00, 76.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 10:37:18', '2022-10-24 05:26:49'),
(2133, 'SI-0000091', '2022-08-28', 'C-00010', 6380.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 10:40:23', '2022-10-24 05:26:49'),
(2134, 'SI-0000092', '2022-08-29', 'C-00009', 54410.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 10:43:04', '2022-10-24 05:26:49'),
(2135, 'SI-0000093', '2022-08-30', 'C-00002', 249.00, 0.00, 249.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 10:46:02', '2022-10-24 05:26:49'),
(2136, 'SI-0000094', '2022-08-31', 'C-00015', 322.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 10:50:05', '2022-10-24 05:26:49'),
(2137, 'SI-0000095', '2022-08-31', 'C-00002', 220.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 10:51:10', '2022-10-24 05:26:49'),
(2138, 'SI-0000096', '2022-08-31', 'C-00014', 1490.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 10:53:28', '2022-10-24 05:26:49'),
(2139, 'SI-0000097', '2022-08-31', 'C-00002', 220.00, 0.00, 220.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 10:57:14', '2022-10-24 05:26:49'),
(2140, 'SI-0000098', '2022-08-31', 'C-00002', 500.00, 0.00, 500.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 11:01:24', '2022-10-24 05:26:49'),
(2141, 'SI-0000099', '2022-08-31', 'C-00002', 295.00, 0.00, 295.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 11:02:53', '2022-10-24 05:26:49'),
(2142, 'SI-0000100', '2022-08-31', 'C-00002', 230.00, 0.00, 230.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 11:05:39', '2022-10-24 05:26:49'),
(2143, 'SI-0000101', '2022-09-01', 'C-00002', 870.00, 0.00, 870.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 11:56:29', '2022-10-24 05:26:49'),
(2144, 'SI-0000102', '2022-09-01', 'C-00008', 2110.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 11:59:20', '2022-10-24 05:26:49'),
(2145, 'SI-0000103', '2022-09-01', 'C-00010', 1200.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 12:00:29', '2022-10-24 05:26:49'),
(2146, 'SI-0000104', '2022-09-01', 'C-00002', 60.00, 0.00, 60.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 12:03:09', '2022-10-24 05:26:49'),
(2147, 'SI-0000105', '2022-09-02', 'C-00002', 10.00, 0.00, 10.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 12:04:53', '2022-10-24 05:26:49'),
(2148, 'SI-0000106', '2022-09-02', 'C-00002', 410.00, 0.00, 410.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 12:06:36', '2022-10-24 05:26:49'),
(2149, 'SI-0000107', '2022-07-10', 'C-00002', 50.00, 0.00, 50.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 12:20:32', '2022-10-24 05:26:49'),
(2150, 'SI-0000108', '2022-09-03', 'C-00018', 640.00, 0.00, 2000.00, 0.00, 0.00, NULL, 'Cash', '2022-10-07', '1', 0, 1, '2022-10-07 13:27:20', '2022-10-24 05:26:49'),
(2151, 'SI-0000109', '2022-08-10', 'C-00020', 2075.00, 0.00, 1000.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 05:17:37', '2022-10-24 05:26:49'),
(2152, 'SI-0000110', '2022-08-10', 'C-00002', 196.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 05:21:39', '2022-10-24 05:26:49'),
(2153, 'SI-0000111', '2022-08-10', 'C-00002', 50.00, 0.00, 50.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 05:28:46', '2022-10-24 05:26:49'),
(2154, 'SI-0000112', '2022-08-10', 'C-00002', 150.00, 0.00, 150.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 05:45:35', '2022-10-24 05:26:49'),
(2155, 'SI-0000113', '2022-09-05', 'C-00015', 20.00, 0.00, 20.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 06:27:31', '2022-10-24 05:26:49'),
(2156, 'SI-0000114', '2022-09-05', 'C-00002', 145.00, 0.00, 145.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 06:29:36', '2022-10-24 05:26:49'),
(2157, 'SI-0000115', '2022-09-06', 'C-00002', 125.00, 0.00, 125.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 06:32:35', '2022-10-24 05:26:49'),
(2158, 'SI-0000116', '2022-09-03', 'C-00015', 115.00, 0.00, 115.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 06:46:08', '2022-10-24 05:26:49'),
(2159, 'SI-0000117', '2022-09-05', 'C-00014', 13620.00, 0.00, 15000.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 06:52:20', '2022-10-24 05:26:49'),
(2160, 'SI-0000118', '2022-09-06', 'C-00008', 1724.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 06:53:42', '2022-10-24 05:26:49'),
(2161, 'SI-0000119', '2022-09-07', 'C-00015', 40.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 06:54:41', '2022-10-24 05:26:49'),
(2162, 'SI-0000120', '2022-09-06', 'C-00002', 103.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 06:55:52', '2022-10-24 05:26:49'),
(2163, 'SI-0000121', '2022-09-07', 'C-00002', 550.00, 0.00, 550.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 06:57:35', '2022-10-24 05:26:49'),
(2164, 'SI-0000122', '2022-09-07', 'C-00011', 70.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 06:58:39', '2022-10-24 05:26:49'),
(2165, 'SI-0000123', '2022-09-08', 'C-00002', 350.00, 0.00, 350.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 07:02:04', '2022-10-24 05:26:49'),
(2166, 'SI-0000124', '2022-09-10', 'C-00006', 2100.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 07:03:02', '2022-10-24 05:26:49'),
(2167, 'SI-0000125', '2022-09-10', 'C-00010', 6374.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 07:07:12', '2022-10-24 05:26:49'),
(2168, 'SI-0000126', '2022-09-10', 'C-00015', 960.00, 40.00, 920.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 07:10:17', '2022-10-24 05:26:49'),
(2169, 'SI-0000127', '2022-09-08', 'C-00002', 10.00, 0.00, 10.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 07:14:40', '2022-10-24 05:26:49'),
(2170, 'SI-0000128', '2022-08-11', 'C-00008', 30800.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 07:25:11', '2022-10-24 05:26:49'),
(2171, 'SI-0000129', '2022-08-20', 'C-00010', 15400.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 07:26:28', '2022-10-24 05:26:49'),
(2172, 'SI-0000130', '2022-10-08', 'C-00010', 44250.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 10:16:13', '2022-10-24 05:26:49'),
(2173, 'SI-0000131', '2022-10-08', 'C-00009', 109000.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 10:18:55', '2022-10-24 05:26:49'),
(2174, 'SI-0000132', '2022-10-11', 'C-00006', 2400.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 10:20:45', '2022-10-24 05:26:49'),
(2175, 'SI-0000133', '2022-10-11', 'C-00002', 252.00, 0.00, 252.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 10:24:24', '2022-10-24 05:26:49'),
(2176, 'SI-0000134', '2022-09-11', 'C-00014', 1110.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 10:28:00', '2022-10-24 05:26:49'),
(2177, 'SI-0000135', '2022-08-01', 'C-00009', 106000.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 10:30:19', '2022-10-24 05:26:49'),
(2178, 'SI-0000136', '2022-08-30', 'C-00009', 53000.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 10:32:09', '2022-10-24 05:26:49'),
(2179, 'SI-0000137', '2022-09-12', 'C-00002', 687.00, 0.00, 687.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 10:36:15', '2022-10-24 05:26:49'),
(2180, 'SI-0000138', '2022-09-12', 'C-00002', 15.00, 0.00, 15.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 10:37:48', '2022-10-24 05:26:49'),
(2181, 'SI-0000139', '2022-09-13', 'C-00002', 92.00, 0.00, 92.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 10:41:03', '2022-10-24 05:26:49'),
(2182, 'SI-0000140', '2022-09-13', 'C-00002', 50.00, 0.00, 50.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 10:42:09', '2022-10-24 05:26:49'),
(2183, 'SI-0000141', '2022-09-14', 'C-00002', 1520.00, 20.00, 1500.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 10:48:06', '2022-10-24 05:26:49'),
(2184, 'SI-0000142', '2022-09-14', 'C-00002', 54.00, 0.00, 54.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 10:49:27', '2022-10-24 05:26:49'),
(2185, 'SI-0000143', '2022-09-14', 'C-00002', 54.00, 0.00, 54.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 10:51:06', '2022-10-24 05:26:49'),
(2186, 'SI-0000144', '2022-09-14', 'C-00016', 61845.00, 0.00, 60500.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 10:57:39', '2022-10-24 05:26:49'),
(2187, 'SI-0000145', '2022-09-09', 'C-00008', 48208.05, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 10:59:43', '2022-10-24 05:26:49'),
(2188, 'SI-0000146', '2022-09-14', 'C-00010', 36156.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:01:28', '2022-10-24 05:26:49'),
(2189, 'SI-0000147', '2022-09-14', 'C-00006', 15699.99, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:07:52', '2022-10-24 05:26:49'),
(2190, 'SI-0000148', '2022-09-14', 'C-00011', 185.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:09:36', '2022-10-24 05:26:49'),
(2191, 'SI-0000149', '2022-09-15', 'C-00006', 6290.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:11:12', '2022-10-24 05:26:49'),
(2192, 'SI-0000150', '2022-09-15', 'C-00009', 95065.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:13:34', '2022-10-24 05:26:49'),
(2193, 'SI-0000151', '2022-09-15', 'C-00011', 264.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:15:21', '2022-10-24 05:26:49'),
(2194, 'SI-0000152', '2022-09-16', 'C-00002', 645.00, 0.00, 645.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:20:38', '2022-10-24 05:26:49'),
(2195, 'SI-0000153', '2022-09-16', 'C-00015', 405.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:23:58', '2022-10-24 05:26:49'),
(2196, 'SI-0000154', '2022-09-16', 'C-00002', 282.00, 0.00, 282.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:25:48', '2022-10-24 05:26:49'),
(2197, 'SI-0000155', '2022-09-16', 'C-00006', 1050.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:27:21', '2022-10-24 05:26:49'),
(2198, 'SI-0000156', '2022-09-17', 'C-00002', 112.00, 0.00, 112.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:29:50', '2022-10-24 05:26:49'),
(2199, 'SI-0000157', '2022-09-17', 'C-00002', 406.00, 0.00, 406.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:32:14', '2022-10-24 05:26:49'),
(2200, 'SI-0000158', '2022-09-17', 'C-00006', 8100.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:34:12', '2022-10-24 05:26:49'),
(2201, 'SI-0000159', '2022-09-18', 'C-00002', 620.00, 0.00, 620.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:36:01', '2022-10-24 05:26:49'),
(2202, 'SI-0000160', '2022-09-18', 'C-00002', 300.00, 0.00, 300.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:37:05', '2022-10-24 05:26:49'),
(2203, 'SI-0000161', '2022-09-18', 'C-00015', 290.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:38:13', '2022-10-24 05:26:49'),
(2204, 'SI-0000162', '2022-09-18', 'C-00002', 47.00, 0.00, 47.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:39:48', '2022-10-24 05:26:49'),
(2205, 'SI-0000163', '2022-09-19', 'C-00002', 50.00, 0.00, 50.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:40:50', '2022-10-24 05:26:49'),
(2206, 'SI-0000164', '2022-09-19', 'C-00010', 500.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:42:14', '2022-10-24 05:26:49'),
(2207, 'SI-0000165', '2022-09-20', 'C-00002', 200.00, 0.00, 200.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:43:49', '2022-10-24 05:26:49'),
(2208, 'SI-0000166', '2022-09-20', 'C-00002', 379.00, 0.00, 379.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:46:36', '2022-10-24 05:26:49'),
(2209, 'SI-0000167', '2022-09-20', 'C-00010', 33120.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:48:30', '2022-10-24 05:26:49'),
(2210, 'SI-0000168', '2022-09-20', 'C-00010', 630.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:49:39', '2022-10-24 05:26:49'),
(2211, 'SI-0000169', '2022-09-20', 'C-00002', 336.00, 0.00, 336.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:51:40', '2022-10-24 05:26:49'),
(2212, 'SI-0000170', '2022-09-21', 'C-00002', 553.00, 0.00, 553.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 11:56:08', '2022-10-24 05:26:49'),
(2213, 'SI-0000171', '2022-09-17', 'C-00009', 53500.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 12:25:22', '2022-10-24 05:26:49'),
(2214, 'SI-0000172', '2022-09-22', 'C-00002', 50.00, 0.00, 50.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 12:26:55', '2022-10-24 05:26:49'),
(2215, 'SI-0000173', '2022-09-22', 'C-00014', 1490.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 12:28:31', '2022-10-24 05:26:49'),
(2216, 'SI-0000174', '2022-09-22', 'C-00008', 42182.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 12:31:22', '2022-10-24 05:26:49'),
(2217, 'SI-0000175', '2022-09-22', 'C-00002', 19028.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 12:33:03', '2022-10-24 05:26:49'),
(2218, 'SI-0000176', '2022-09-22', 'C-00006', 1650.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 12:38:13', '2022-10-24 05:26:49'),
(2219, 'SI-0000177', '2022-09-23', 'C-00002', 100.00, 0.00, 100.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 12:39:32', '2022-10-24 05:26:49'),
(2220, 'SI-0000178', '2022-09-24', 'C-00002', 100.00, 0.00, 100.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 12:41:32', '2022-10-24 05:26:49'),
(2221, 'SI-0000179', '2022-09-24', 'C-00002', 560.00, 0.00, 560.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 12:43:00', '2022-10-24 05:26:49'),
(2222, 'SI-0000180', '2022-09-24', 'C-00002', 693.00, 0.00, 693.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 12:44:49', '2022-10-24 05:26:49'),
(2223, 'SI-0000181', '2022-09-24', 'C-00002', 220.00, 0.00, 220.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 12:46:37', '2022-10-24 05:26:49'),
(2224, 'SI-0000182', '2022-09-24', 'C-00002', 175.00, 0.00, 175.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 12:47:47', '2022-10-24 05:26:49'),
(2225, 'SI-0000183', '2022-09-24', 'C-00002', 195.00, 0.00, 195.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 12:50:10', '2022-10-24 05:26:49'),
(2226, 'SI-0000184', '2022-09-24', 'C-00015', 290.00, 0.00, 290.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 12:51:24', '2022-10-24 05:26:49'),
(2227, 'SI-0000185', '2022-08-10', 'C-00010', 1845.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 13:06:35', '2022-10-24 05:26:49'),
(2228, 'SI-0000186', '2022-08-10', 'C-00010', 610.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 13:15:02', '2022-10-24 05:26:49'),
(2229, 'SI-0000187', '2022-08-10', 'C-00002', 500.00, 0.00, 500.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 13:16:01', '2022-10-24 05:26:49'),
(2230, 'SI-0000188', '2022-08-10', 'C-00011', 200.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 13:18:51', '2022-10-24 05:26:49'),
(2231, 'SI-0000189', '2022-09-25', 'C-00015', 220.00, 0.00, 220.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 13:21:00', '2022-10-24 05:26:49'),
(2232, 'SI-0000190', '2022-09-25', 'C-00002', 260.00, 0.00, 260.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 13:22:08', '2022-10-24 05:26:49'),
(2233, 'SI-0000191', '2022-09-25', 'C-00002', 430.00, 0.00, 430.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 13:23:37', '2022-10-24 05:26:49'),
(2234, 'SI-0000192', '2022-09-26', 'C-00002', 200.00, 0.00, 200.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 13:24:47', '2022-10-24 05:26:49'),
(2235, 'SI-0000193', '2022-09-27', 'C-00002', 11750.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 13:33:29', '2022-10-24 05:26:49'),
(2236, 'SI-0000194', '2022-08-10', 'C-00002', 40.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 13:39:53', '2022-10-24 05:26:49'),
(2237, 'SI-0000195', '2022-08-10', 'C-00015', 1100.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 14:04:07', '2022-10-24 05:26:49'),
(2238, 'SI-0000196', '2022-08-10', 'C-00002', 33.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-08', '1', 0, 1, '2022-10-08 14:07:34', '2022-10-24 05:26:49'),
(2239, 'SI-0000197', '2022-09-10', 'C-00014', 1150.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 04:38:15', '2022-10-24 05:26:49'),
(2240, 'SI-0000198', '2022-09-27', 'C-00002', 370.00, 0.00, 370.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 04:59:17', '2022-10-24 05:26:49'),
(2241, 'SI-0000199', '2022-09-10', 'C-00002', 1200.00, 0.00, 1200.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 05:02:14', '2022-10-24 05:26:49'),
(2242, 'SI-0000200', '2022-09-10', 'C-00010', 7730.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 05:14:27', '2022-10-24 05:26:49'),
(2243, 'SI-0000201', '2022-09-28', 'C-00002', 550.00, 0.00, 550.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 05:18:37', '2022-10-24 05:26:49'),
(2244, 'SI-0000202', '2022-09-28', 'C-00015', 630.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 05:19:27', '2022-10-24 05:26:49'),
(2245, 'SI-0000203', '2022-09-28', 'C-00007', 31635.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 05:20:41', '2022-10-24 05:26:49'),
(2246, 'SI-0000204', '2022-09-28', 'C-00010', 64680.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 05:21:57', '2022-10-24 05:26:49'),
(2247, 'SI-0000205', '2022-09-28', 'C-00008', 67760.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 05:23:54', '2022-10-24 05:26:49'),
(2248, 'SI-0000206', '2022-09-28', 'C-00012', 30800.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 05:25:19', '2022-10-24 05:26:49'),
(2249, 'SI-0000207', '2022-09-10', 'C-00002', 14.00, 0.00, 14.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 05:37:38', '2022-10-24 05:26:49'),
(2250, 'SI-0000208', '2022-09-29', 'C-00002', 1385.50, 0.00, 1385.50, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 05:45:44', '2022-10-24 05:26:49'),
(2251, 'SI-0000209', '2022-09-10', 'C-00017', 810.00, 0.00, 500.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 05:48:17', '2022-10-24 05:26:49'),
(2252, 'SI-0000210', '2022-09-10', 'C-00002', 1460.00, 0.00, 1490.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 05:52:13', '2022-10-24 05:26:49'),
(2253, 'SI-0000211', '2022-10-01', 'C-00002', 1026.00, 0.00, 1026.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 06:26:15', '2022-10-24 05:26:49'),
(2254, 'SI-0000212', '2022-10-02', 'C-00002', 850.00, 0.00, 850.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 11:06:43', '2022-10-24 05:26:49'),
(2255, 'SI-0000213', '2022-10-02', 'C-00002', 1150.00, 0.00, 1150.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 11:08:19', '2022-10-24 05:26:49'),
(2256, 'SI-0000214', '2022-10-03', 'C-00002', 1649.00, 0.00, 1649.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 11:10:17', '2022-10-24 05:26:49'),
(2257, 'SI-0000215', '2022-10-03', 'C-00018', 1330.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 11:12:26', '2022-10-24 05:26:49'),
(2258, 'SI-0000216', '2022-10-03', 'C-00002', 483.00, 0.00, 483.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 11:14:40', '2022-10-24 05:26:49'),
(2259, 'SI-0000217', '2022-10-03', 'C-00010', 30882.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 11:15:57', '2022-10-24 05:26:49'),
(2260, 'SI-0000218', '2022-10-03', 'C-00002', 765.00, 0.00, 765.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 11:18:45', '2022-10-24 05:26:49'),
(2261, 'SI-0000219', '2022-10-03', 'C-00010', 2030.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 11:20:21', '2022-10-24 05:26:49'),
(2262, 'SI-0000220', '2022-09-10', 'C-00012', 4290.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 11:21:36', '2022-10-24 05:26:49'),
(2263, 'SI-0000221', '2022-09-10', 'C-00011', 1100.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 11:22:06', '2022-10-24 05:26:49'),
(2264, 'SI-0000222', '2022-10-04', 'C-00002', 1964.00, 0.00, 1964.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 11:25:47', '2022-10-24 05:26:49'),
(2265, 'SI-0000223', '2022-09-10', 'C-00002', 4250.00, 0.00, 4250.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 11:27:39', '2022-10-24 05:26:49'),
(2266, 'SI-0000224', '2022-09-14', 'C-00011', 470.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 11:29:35', '2022-10-24 05:26:49'),
(2267, 'SI-0000225', '2022-09-10', 'C-00011', 410.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 11:39:31', '2022-10-24 05:26:49'),
(2268, 'SI-0000226', '2022-09-21', 'C-00002', 294.00, 0.00, 294.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 12:29:06', '2022-10-24 05:26:49'),
(2269, 'SI-0000227', '2022-09-10', 'C-00012', 126720.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 12:38:23', '2022-10-24 05:26:49'),
(2271, 'SI-0000229', '2022-09-25', 'C-00002', 520.00, 10.00, 510.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 12:47:14', '2022-10-24 05:26:49'),
(2272, 'SI-0000230', '2022-10-04', 'C-00018', 359.80, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 12:49:31', '2022-10-24 05:26:49'),
(2273, 'SI-0000231', '2022-10-04', 'C-00010', 61600.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 12:51:21', '2022-10-24 05:26:49'),
(2274, 'SI-0000232', '2022-10-05', 'C-00015', 1230.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 12:52:21', '2022-10-24 05:26:49'),
(2275, 'SI-0000233', '2022-10-05', 'C-00002', 2700.00, 0.00, 2700.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 12:53:24', '2022-10-24 05:26:49'),
(2276, 'SI-0000234', '2022-09-10', 'C-00002', 1250.00, 0.00, 1250.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 12:54:06', '2022-10-24 05:26:49'),
(2277, 'SI-0000235', '2022-09-10', 'C-00018', 235.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 12:56:31', '2022-10-24 05:26:49'),
(2278, 'SI-0000236', '2022-10-05', 'C-00018', 1000.00, 0.00, 1000.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 12:59:37', '2022-10-24 05:26:49'),
(2279, 'SI-0000237', '2022-10-05', 'C-00010', 2060.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 13:04:02', '2022-10-24 05:26:49'),
(2280, 'SI-0000238', '2022-10-06', 'C-00018', 515.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 13:08:14', '2022-10-24 05:26:49'),
(2281, 'SI-0000239', '2022-10-07', 'C-00010', 92400.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 13:10:34', '2022-10-24 05:26:49'),
(2282, 'SI-0000240', '2022-10-07', 'C-00012', 30800.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 13:11:40', '2022-10-24 05:26:49'),
(2284, 'SI-0000242', '2022-09-10', 'C-00007', 4540.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 13:50:15', '2022-10-24 05:26:49'),
(2285, 'SI-0000243', '2022-09-10', 'C-00012', 9080.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 13:51:58', '2022-10-24 05:26:49'),
(2286, 'SI-0000244', '2022-09-10', 'C-00002', 7.00, 0.00, 7.00, 0.00, 0.00, NULL, 'Cash', '2022-10-09', '1', 0, 1, '2022-10-09 14:01:33', '2022-10-24 05:26:49'),
(2287, 'SI-0000245', '2022-10-07', 'C-00018', 640.00, 0.00, 2000.00, 0.00, 0.00, NULL, 'Cash', '2022-10-10', '1', 0, 1, '2022-10-10 04:35:28', '2022-10-24 05:26:49'),
(2288, 'SI-0000246', '2022-10-10', 'C-00002', 39.00, 0.00, 39.00, 0.00, 0.00, NULL, 'Cash', '2022-10-10', '1', 0, 1, '2022-10-10 11:29:14', '2022-10-24 05:26:49'),
(2292, 'SI-0000247', '2022-10-11', 'C-00001', 840.00, 0.00, 840.00, 0.00, 0.00, NULL, 'Cash', '2022-10-11', '1', 0, 1, '2022-10-11 05:27:30', '2022-10-24 05:26:49'),
(2294, 'SI-0000249', '2022-10-12', 'C-00002', 90.00, 0.00, 90.00, 0.00, 0.00, NULL, 'Cash', '2022-10-12', '1', 0, 1, '2022-10-12 13:24:24', '2022-10-24 05:26:49'),
(2295, 'SI-0000250', '2022-10-12', 'C-00002', 18.00, 0.00, 18.00, 0.00, 0.00, NULL, 'Cash', '2022-10-12', '1', 0, 1, '2022-10-12 13:59:02', '2022-10-24 05:26:49'),
(2296, 'SI-0000251', '2022-10-13', 'C-00020', 115.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-13', '1', 0, 1, '2022-10-13 05:17:15', '2022-10-24 05:26:49'),
(2297, 'SI-0000252', '2022-10-13', 'C-00002', 16.00, 0.00, 16.00, 0.00, 0.00, NULL, 'Cash', '2022-10-13', '1', 0, 1, '2022-10-13 11:16:26', '2022-10-24 05:26:49'),
(2298, 'SI-0000253', '2022-10-13', 'C-00002', 72.00, 0.00, 72.00, 0.00, 0.00, NULL, 'Cash', '2022-10-13', '1', 0, 1, '2022-10-13 12:20:13', '2022-10-24 05:26:49'),
(2299, 'SI-0000254', '2022-10-13', 'C-00015', 20.00, 0.00, 20.00, 0.00, 0.00, NULL, 'Cash', '2022-10-13', '1', 0, 1, '2022-10-13 13:46:38', '2022-10-24 05:26:49'),
(2300, 'SI-0000255', '2022-10-13', 'C-00001', 410.00, 0.00, 410.00, 0.00, 0.00, NULL, 'Cash', '2022-10-13', '1', 0, 1, '2022-10-13 14:18:45', '2022-10-24 05:26:49'),
(2301, 'SI-0000256', '2022-10-14', 'C-00002', 120.00, 0.00, 120.00, 0.00, 0.00, NULL, 'Cash', '2022-10-14', '1', 0, 1, '2022-10-14 04:08:54', '2022-10-24 05:26:49'),
(2302, 'SI-0000257', '2022-10-14', 'C-00015', 20.00, 0.00, 20.00, 0.00, 0.00, NULL, 'Cash', '2022-10-14', '1', 0, 1, '2022-10-14 04:12:35', '2022-10-24 05:26:49'),
(2303, 'SI-0000258', '2022-10-14', 'C-00002', 50.00, 0.00, 50.00, 0.00, 0.00, NULL, 'Cash', '2022-10-14', '1', 0, 1, '2022-10-14 11:39:13', '2022-10-24 05:26:49'),
(2304, 'SI-0000259', '2022-10-14', 'C-00002', 420.00, 0.00, 420.00, 0.00, 0.00, NULL, 'Cash', '2022-10-14', '1', 0, 1, '2022-10-14 12:42:46', '2022-10-24 05:26:49'),
(2305, 'SI-0000260', '2022-10-15', 'C-00002', 875.00, 0.00, 875.00, 0.00, 0.00, NULL, 'Cash', '2022-10-15', '1', 0, 1, '2022-10-15 03:55:54', '2022-10-24 05:26:49'),
(2306, 'SI-0000261', '2022-10-15', 'C-00002', 76.00, 0.00, 76.00, 0.00, 0.00, NULL, 'Cash', '2022-10-15', '1', 0, 1, '2022-10-15 06:24:50', '2022-10-24 05:26:49'),
(2307, 'SI-0000262', '2022-10-15', 'C-00002', 1457.00, 7.00, 1450.00, 0.00, 0.00, NULL, 'Cash', '2022-10-15', '1', 0, 1, '2022-10-15 12:43:07', '2022-10-24 05:26:49'),
(2308, 'SI-0000263', '2022-10-15', 'C-00002', 287.00, 0.00, 287.00, 0.00, 0.00, NULL, 'Cash', '2022-10-15', '1', 0, 1, '2022-10-15 12:51:05', '2022-10-24 05:26:49'),
(2309, 'SI-0000264', '2022-10-15', 'C-00002', 410.00, 0.00, 410.00, 0.00, 0.00, NULL, 'Cash', '2022-10-15', '1', 0, 1, '2022-10-15 14:10:57', '2022-10-24 05:26:49'),
(2310, 'SI-0000265', '2022-10-16', 'C-00002', 33.00, 0.00, 33.00, 0.00, 0.00, NULL, 'Cash', '2022-10-16', '1', 0, 1, '2022-10-16 04:57:42', '2022-10-24 05:26:49'),
(2311, 'SI-0000266', '2022-10-16', 'C-00002', 60.00, 0.00, 60.00, 0.00, 0.00, NULL, 'Cash', '2022-10-16', '1', 0, 1, '2022-10-16 05:23:07', '2022-10-24 05:26:49'),
(2313, 'SI-0000267', '2022-10-05', 'C-00002', 1250.00, 0.00, 1250.00, 0.00, 0.00, NULL, 'Cash', '2022-10-22', '1', 0, 1, '2022-10-22 13:25:01', '2022-10-26 09:09:10'),
(2314, 'SI-0000268', '2022-10-05', 'C-00002', 510.00, 0.00, 510.00, 0.00, 0.00, NULL, 'Cash', '2022-10-22', '1', 0, 1, '2022-10-22 13:25:57', '2022-10-26 09:09:10'),
(2315, 'SI-0000269', '2022-10-05', 'C-00002', 15.00, 0.00, 15.00, 0.00, 0.00, NULL, 'Cash', '2022-10-22', '1', 0, 1, '2022-10-22 13:30:49', '2022-10-26 09:09:10'),
(2316, 'SI-0000270', '2022-10-06', 'C-00002', 265.00, 0.00, 265.00, 0.00, 0.00, NULL, 'Cash', '2022-10-22', '1', 0, 1, '2022-10-22 13:39:21', '2022-10-26 09:09:10'),
(2317, 'SI-0000271', '2022-10-06', 'C-00002', 500.00, 0.00, 500.00, 0.00, 0.00, NULL, 'Cash', '2022-10-22', '1', 0, 1, '2022-10-22 13:40:11', '2022-10-26 09:09:10'),
(2318, 'SI-0000272', '2022-10-06', 'C-00002', 651.00, 0.00, 651.00, 0.00, 0.00, NULL, 'Cash', '2022-10-22', '1', 0, 1, '2022-10-22 13:44:29', '2022-10-26 09:09:10'),
(2319, 'SI-0000273', '2022-10-06', 'C-00002', 200.00, 0.00, 200.00, 0.00, 0.00, NULL, 'Cash', '2022-10-22', '1', 0, 1, '2022-10-22 14:00:19', '2022-10-26 09:09:10'),
(2320, 'SI-0000274', '2022-10-08', 'C-00020', 3321.00, 0.00, 1000.00, 0.00, 0.00, NULL, 'Cash', '2022-10-22', '1', 0, 1, '2022-10-22 14:11:37', '2022-10-26 09:09:10'),
(2321, 'SI-0000275', '2022-10-08', 'C-00002', 50.00, 0.00, 50.00, 0.00, 0.00, NULL, 'Cash', '2022-10-22', '1', 0, 1, '2022-10-22 14:22:31', '2022-10-26 09:09:10'),
(2323, 'SI-0000277', '2022-10-08', 'C-00002', 150.00, 0.00, 150.00, 0.00, 0.00, NULL, 'Cash', '2022-10-22', '1', 0, 1, '2022-10-22 14:23:18', '2022-10-26 09:09:10'),
(2324, 'SI-0000278', '2022-10-08', 'C-00010', 2355.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-22', '1', 0, 1, '2022-10-22 14:25:06', '2022-10-26 09:09:10'),
(2326, 'SI-0000279', '2022-10-08', 'C-00002', 40.00, 0.00, 40.00, 0.00, 0.00, NULL, 'Cash', '2022-10-22', '1', 0, 1, '2022-10-22 14:33:57', '2022-10-26 09:09:10'),
(2327, 'SI-0000280', '2022-09-21', 'C-00001', 73189.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-22', '1', 0, 1, '2022-10-22 15:43:58', '2022-10-26 09:09:10'),
(2328, 'SI-0000281', '2022-10-09', 'C-00007', 12290.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 13:08:40', '2022-10-27 13:08:40'),
(2329, 'SI-0000282', '2022-10-09', 'C-00012', 9080.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 13:10:10', '2022-10-27 13:10:10'),
(2331, 'SI-0000284', '2022-10-10', 'C-00002', 39.00, 0.00, 39.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 13:19:21', '2022-10-27 13:19:21'),
(2332, 'SI-0000285', '2022-10-10', 'C-00002', 7.00, 0.00, 7.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 13:20:57', '2022-10-27 13:20:57'),
(2333, 'SI-0000286', '2022-10-10', 'C-00018', 444.00, 22.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 13:43:07', '2022-10-27 13:43:07'),
(2334, 'SI-0000287', '2022-10-10', 'C-00006', 720.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 13:43:53', '2022-10-27 13:43:53'),
(2335, 'SI-0000288', '2022-10-11', 'C-00022', 910.40, 0.00, 910.40, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 13:48:57', '2022-10-27 13:48:57'),
(2336, 'SI-0000289', '2022-10-11', 'C-00001', 840.00, 0.00, 840.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 14:00:51', '2022-10-27 14:00:51'),
(2337, 'SI-0000290', '2022-10-11', 'C-00023', 2700.00, 0.00, 2000.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 14:06:52', '2022-10-27 14:06:52'),
(2338, 'SI-0000291', '2022-10-11', 'C-00002', 900.00, 10.00, 890.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 14:08:14', '2022-10-27 14:08:14'),
(2339, 'SI-0000292', '2022-10-11', 'C-00018', 400.00, 20.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 14:12:53', '2022-10-27 14:12:53'),
(2340, 'SI-0000293', '2022-10-12', 'C-00002', 69.00, 0.00, 69.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 14:14:04', '2022-10-27 14:14:04'),
(2341, 'SI-0000294', '2022-10-12', 'C-00002', 395.00, 0.00, 350.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 14:15:29', '2022-10-27 14:15:29'),
(2342, 'SI-0000295', '2022-10-12', 'C-00008', 187775.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 14:27:23', '2022-10-27 14:27:23'),
(2343, 'SI-0000296', '2022-10-12', 'C-00007', 14148.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 14:28:35', '2022-10-27 14:28:35'),
(2344, 'SI-0000297', '2022-10-12', 'C-00002', 90.00, 0.00, 90.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 14:29:28', '2022-10-27 14:29:28'),
(2345, 'SI-0000298', '2022-10-12', 'C-00002', 18.00, 0.00, 18.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 14:30:17', '2022-10-27 14:30:17'),
(2346, 'SI-0000299', '2022-10-13', 'C-00020', 115.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 14:31:10', '2022-10-27 14:31:10'),
(2347, 'SI-0000300', '2022-10-13', 'C-00002', 518.00, 0.00, 518.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 14:33:35', '2022-10-27 14:33:35'),
(2348, 'SI-0000301', '2022-10-14', 'C-00002', 182.20, 0.00, 182.20, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 14:35:05', '2022-10-27 14:35:05'),
(2349, 'SI-0000302', '2022-10-14', 'C-00002', 416.00, 0.00, 420.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 14:36:51', '2022-10-27 14:36:51'),
(2350, 'SI-0000303', '2022-10-15', 'C-00024', 875.00, 0.00, 875.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 14:40:34', '2022-10-27 14:40:34'),
(2351, 'SI-0000304', '2022-10-15', 'C-00002', 1100.00, 0.00, 1100.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 14:41:14', '2022-10-27 14:41:14'),
(2352, 'SI-0000305', '2022-10-15', 'C-00002', 621.00, 0.00, 621.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 14:42:23', '2022-10-27 14:42:23'),
(2353, 'SI-0000306', '2022-10-15', 'C-00022', 366.00, 0.00, 736.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 14:49:22', '2022-10-27 14:49:22'),
(2354, 'SI-0000307', '2022-10-16', 'C-00001', 115.00, 0.00, 115.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 14:51:07', '2022-10-27 14:51:07'),
(2355, 'SI-0000308', '2022-10-16', 'C-00023', 2700.00, 0.00, 2700.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 14:52:17', '2022-10-27 14:52:17'),
(2356, 'SI-0000309', '2022-10-16', 'C-00002', 420.00, 0.00, 420.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 14:53:21', '2022-10-27 14:53:21');
INSERT INTO `sales_ledger` (`id`, `invoice_no`, `invoice_date`, `customer_id`, `total`, `final_discount`, `paid_amount`, `return_amount`, `vat`, `note`, `transaction_type`, `entry_date`, `branch_id`, `status`, `admin_id`, `created_at`, `updated_at`) VALUES
(2357, 'SI-0000310', '2022-10-16', 'C-00015', 300.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 14:54:24', '2022-10-27 14:54:24'),
(2358, 'SI-0000311', '2022-10-17', 'C-00012', 102670.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 14:56:36', '2022-10-27 14:56:36'),
(2359, 'SI-0000312', '2022-10-17', 'C-00008', 107412.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 14:59:18', '2022-10-27 14:59:18'),
(2360, 'SI-0000313', '2022-10-17', 'C-00007', 105400.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 15:03:04', '2022-10-27 15:03:04'),
(2361, 'SI-0000314', '2022-10-17', 'C-00020', 115.00, 0.00, 115.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 15:04:08', '2022-10-27 15:04:08'),
(2362, 'SI-0000315', '2022-10-17', 'C-00009', 26010.00, 0.00, 26010.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 15:06:22', '2022-10-27 15:06:22'),
(2363, 'SI-0000316', '2022-10-17', 'C-00002', 35.00, 0.00, 35.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 15:06:55', '2022-10-27 15:06:55'),
(2364, 'SI-0000317', '2022-10-17', 'C-00002', 81.00, 0.00, 81.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 15:08:00', '2022-10-27 15:08:00'),
(2365, 'SI-0000318', '2022-10-17', 'C-00011', 1720.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 15:09:30', '2022-10-27 15:09:30'),
(2366, 'SI-0000319', '2022-10-17', 'C-00012', 3600.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 15:10:15', '2022-10-27 15:10:15'),
(2367, 'SI-0000320', '2022-10-17', 'C-00007', 1800.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-27', '1', 0, 1, '2022-10-27 15:10:57', '2022-10-27 15:10:57'),
(2368, 'SI-0000321', '2022-10-18', 'C-00022', 75.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 11:12:44', '2022-10-28 11:12:44'),
(2369, 'SI-0000322', '2022-10-18', 'C-00025', 4600.00, 0.00, 4600.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 12:05:16', '2022-10-28 12:05:16'),
(2370, 'SI-0000323', '2022-10-18', 'C-00020', 855.00, 0.00, 850.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 12:07:47', '2022-10-28 12:07:47'),
(2371, 'SI-0000324', '2022-10-18', 'C-00002', 131.00, 0.00, 131.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 12:26:26', '2022-10-28 12:26:26'),
(2372, 'SI-0000325', '2022-10-18', 'C-00001', 8.80, 0.00, 8.80, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 12:27:49', '2022-10-28 12:27:49'),
(2373, 'SI-0000326', '2022-10-18', 'C-00022', 395.00, 0.00, 395.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 12:29:15', '2022-10-28 12:29:15'),
(2374, 'SI-0000327', '2022-10-18', 'C-00018', 765.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 12:30:48', '2022-10-28 12:30:48'),
(2375, 'SI-0000328', '2022-10-19', 'C-00002', 112.00, 2.00, 110.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 12:32:54', '2022-10-28 12:32:54'),
(2376, 'SI-0000329', '2022-10-19', 'C-00002', 150.00, 0.00, 150.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 12:33:51', '2022-10-28 12:33:51'),
(2377, 'SI-0000330', '2022-10-19', 'C-00002', 310.00, 0.00, 310.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 12:35:17', '2022-10-28 12:35:17'),
(2378, 'SI-0000331', '2022-10-19', 'C-00002', 305.00, 0.00, 305.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 12:36:43', '2022-10-28 12:36:43'),
(2379, 'SI-0000332', '2022-10-19', 'C-00002', 290.50, 0.50, 290.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 12:38:58', '2022-10-28 12:38:58'),
(2380, 'SI-0000333', '2022-10-19', 'C-00002', 318.00, 0.00, 318.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 12:40:36', '2022-10-28 12:40:36'),
(2381, 'SI-0000334', '2022-10-19', 'C-00002', 187.00, 0.00, 187.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 12:55:45', '2022-10-28 12:55:45'),
(2382, 'SI-0000335', '2022-10-19', 'C-00001', 170.00, 0.00, 170.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 12:57:09', '2022-10-28 12:57:09'),
(2383, 'SI-0000336', '2022-10-20', 'C-00002', 409.00, 0.00, 409.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 12:58:53', '2022-10-28 12:58:53'),
(2384, 'SI-0000337', '2022-10-21', 'C-00025', 390.00, 0.00, 390.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 13:01:41', '2022-10-28 13:01:41'),
(2385, 'SI-0000338', '2022-10-21', 'C-00022', 660.00, 10.00, 650.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 13:26:50', '2022-10-28 13:26:50'),
(2386, 'SI-0000339', '2022-10-22', 'C-00002', 50.00, 0.00, 50.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 13:27:54', '2022-10-28 13:27:54'),
(2387, 'SI-0000340', '2022-10-21', 'C-00002', 80.00, 0.00, 80.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 13:29:22', '2022-10-28 13:29:22'),
(2388, 'SI-0000341', '2022-10-21', 'C-00023', 2700.00, 0.00, 2700.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 13:31:09', '2022-10-28 13:31:09'),
(2389, 'SI-0000342', '2022-10-21', 'C-00002', 43.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 13:33:05', '2022-10-28 13:33:05'),
(2390, 'SI-0000343', '2022-10-22', 'C-00002', 574.00, 0.00, 574.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 13:34:11', '2022-10-28 13:34:11'),
(2391, 'SI-0000344', '2022-10-22', 'C-00001', 85.00, 0.00, 85.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 13:35:17', '2022-10-28 13:35:17'),
(2392, 'SI-0000345', '2022-10-22', 'C-00002', 80.00, 0.00, 80.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 13:36:32', '2022-10-28 13:36:32'),
(2393, 'SI-0000346', '2022-10-22', 'C-00002', 1720.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 13:38:52', '2022-10-28 13:38:52'),
(2394, 'SI-0000347', '2022-10-22', 'C-00006', 300.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 13:39:36', '2022-10-28 13:39:36'),
(2395, 'SI-0000348', '2022-10-22', 'C-00022', 600.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 13:41:18', '2022-10-28 13:41:18'),
(2397, 'SI-0000350', '2022-10-22', 'C-00018', 180.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 14:03:15', '2022-10-28 14:03:15'),
(2398, 'SI-0000351', '2022-10-23', 'C-00002', 370.00, 0.00, 370.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 14:04:06', '2022-10-28 14:04:06'),
(2399, 'SI-0000352', '2022-10-23', 'C-00015', 1350.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 14:05:35', '2022-10-28 14:05:35'),
(2400, 'SI-0000353', '2022-10-23', 'C-00002', 38.40, 0.00, 38.40, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 14:06:52', '2022-10-28 14:06:52'),
(2401, 'SI-0000354', '2022-10-23', 'C-00007', 4620.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 14:09:17', '2022-10-28 14:09:17'),
(2402, 'SI-0000355', '2022-10-24', 'C-00002', 50.00, 0.00, 50.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 14:10:09', '2022-10-28 14:10:09'),
(2403, 'SI-0000356', '2022-10-28', 'C-00006', 11200.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-28', '1', 0, 1, '2022-10-28 14:20:30', '2022-10-28 14:20:30'),
(2404, 'SI-0000357', '2022-10-29', 'C-00002', 645.00, 0.00, 645.00, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 04:47:11', '2022-10-29 04:47:11'),
(2405, 'SI-0000358', '2022-10-29', 'C-00001', 210.00, 10.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 04:50:43', '2022-10-29 04:50:43'),
(2406, 'SI-0000359', '2022-10-29', 'C-00001', 338.00, 3.00, 335.00, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 11:38:55', '2022-10-29 11:38:55'),
(2407, 'SI-0000360', '2022-10-29', 'C-00002', 370.00, 0.00, 370.00, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 11:46:10', '2022-10-29 11:46:10'),
(2408, 'SI-0000361', '2022-10-25', 'C-00012', 2380.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 12:15:59', '2022-10-29 12:15:59'),
(2409, 'SI-0000362', '2022-10-25', 'C-00002', 33.00, 0.00, 33.00, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 12:16:58', '2022-10-29 12:16:58'),
(2411, 'SI-0000363', '2022-10-26', 'C-00002', 2633.00, 0.00, 2633.00, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 12:20:52', '2022-10-29 12:20:52'),
(2412, 'SI-0000364', '2022-10-26', 'C-00014', 1340.00, 0.00, 1000.00, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 12:24:28', '2022-10-29 12:24:28'),
(2413, 'SI-0000365', '2022-10-26', 'C-00002', 100.00, 0.00, 100.00, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 12:25:32', '2022-10-29 12:25:32'),
(2414, 'SI-0000366', '2022-10-26', 'C-00002', 60.00, 0.00, 60.00, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 12:26:22', '2022-10-29 12:26:22'),
(2415, 'SI-0000367', '2022-10-26', 'C-00026', 42903.00, 0.00, 42903.00, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 12:39:06', '2022-10-29 12:39:06'),
(2416, 'SI-0000368', '2022-10-26', 'C-00002', 211.00, 0.00, 211.00, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 12:41:26', '2022-10-29 12:41:26'),
(2417, 'SI-0000369', '2022-10-29', 'C-00002', 69.00, 0.00, 69.00, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 12:51:30', '2022-10-29 12:51:30'),
(2418, 'SI-0000370', '2022-10-26', 'C-00002', 350.00, 0.00, 350.00, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 13:44:02', '2022-10-29 13:44:02'),
(2419, 'SI-0000371', '2022-10-26', 'C-00007', 3200.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 13:46:53', '2022-10-29 13:46:53'),
(2420, 'SI-0000372', '2022-10-26', 'C-00023', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 13:48:01', '2022-10-29 13:48:01'),
(2421, 'SI-0000373', '2022-10-26', 'C-00002', 60.00, 0.00, 60.00, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 13:49:23', '2022-10-29 13:49:23'),
(2422, 'SI-0000374', '2022-10-27', 'C-00002', 21.40, 0.00, 21.40, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 13:51:02', '2022-10-29 13:51:02'),
(2423, 'SI-0000375', '2022-10-28', 'C-00002', 1250.00, 0.00, 1250.00, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 13:52:14', '2022-10-29 13:52:14'),
(2424, 'SI-0000376', '2022-10-28', 'C-00023', 115.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 13:53:21', '2022-10-29 13:53:21'),
(2425, 'SI-0000377', '2022-10-29', 'C-00022', 285.00, 0.00, 285.00, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 13:56:32', '2022-10-29 13:56:32'),
(2426, 'SI-0000378', '2022-10-29', 'C-00011', 69.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 14:31:16', '2022-10-29 14:31:16'),
(2427, 'SI-0000379', '2022-10-29', 'C-00007', 1735.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 14:32:46', '2022-10-29 14:32:46'),
(2428, 'SI-0000380', '2022-10-29', 'C-00007', 1735.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 14:32:55', '2022-10-29 14:32:55'),
(2429, 'SI-0000381', '2022-10-29', 'C-00011', 265.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-29', '1', 0, 1, '2022-10-29 14:33:56', '2022-10-29 14:33:56'),
(2430, 'SI-0000382', '2022-10-30', 'C-00002', 100.00, 0.00, 100.00, 0.00, 0.00, NULL, 'Cash', '2022-10-30', '1', 0, 1, '2022-10-30 05:16:35', '2022-10-30 05:16:35'),
(2431, 'SI-0000383', '2022-10-30', 'C-00022', 532.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-30', '1', 0, 1, '2022-10-30 12:49:31', '2022-10-30 12:49:31'),
(2432, 'SI-0000384', '2022-10-31', 'C-00020', 1250.00, 0.00, 1250.00, 0.00, 0.00, NULL, 'Cash', '2022-10-31', '1', 0, 1, '2022-10-31 04:35:53', '2022-10-31 04:35:53'),
(2433, 'SI-0000385', '2022-10-31', 'C-00026', 150.00, 0.00, 150.00, 0.00, 0.00, NULL, 'Cash', '2022-10-31', '1', 0, 1, '2022-10-31 04:58:52', '2022-10-31 04:58:52'),
(2434, 'SI-0000386', '2022-10-31', 'C-00001', 280.00, 0.00, 280.00, 0.00, 0.00, NULL, 'Cash', '2022-10-31', '1', 0, 1, '2022-10-31 07:02:28', '2022-10-31 07:02:28'),
(2435, 'SI-0000387', '2022-10-31', 'C-00002', 1320.00, 0.00, 1320.00, 0.00, 0.00, NULL, 'Cash', '2022-10-31', '1', 0, 1, '2022-10-31 10:27:37', '2022-10-31 10:27:37'),
(2436, 'SI-0000388', '2022-10-31', 'C-00002', 675.00, 25.00, 650.00, 0.00, 0.00, NULL, 'Cash', '2022-10-31', '1', 0, 1, '2022-10-31 11:21:53', '2022-10-31 11:21:53'),
(2437, 'SI-0000389', '2022-10-31', 'C-00023', 2700.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-31', '1', 0, 1, '2022-10-31 12:50:19', '2022-10-31 12:50:19'),
(2439, 'SI-0000390', '2022-09-21', 'C-00007', 72659.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-31', '1', 0, 1, '2022-10-31 13:36:16', '2022-10-31 13:36:16'),
(2440, 'SI-0000391', '2022-10-31', 'C-00007', 6150.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-10-31', '1', 0, 1, '2022-10-31 14:29:01', '2022-10-31 14:29:01'),
(2441, 'SI-0000392', '2022-10-31', 'C-00002', 245.00, 5.00, 240.00, 0.00, 0.00, NULL, 'Cash', '2022-10-31', '1', 0, 1, '2022-10-31 15:08:59', '2022-10-31 15:08:59'),
(2442, 'SI-0000393', '2022-10-31', 'C-00002', 245.00, 5.00, 240.00, 0.00, 0.00, NULL, 'Cash', '2022-10-31', '1', 0, 1, '2022-10-31 15:08:59', '2022-10-31 15:08:59'),
(2443, 'SI-0000394', '2022-11-01', 'C-00022', 144.00, 0.00, 144.00, 0.00, 0.00, NULL, 'Cash', '2022-11-01', '1', 0, 1, '2022-11-01 04:49:53', '2022-11-01 04:49:53'),
(2444, 'SI-0000395', '2022-11-01', 'C-00002', 140.00, 5.00, 135.00, 0.00, 0.00, NULL, 'Cash', '2022-11-01', '1', 0, 1, '2022-11-01 12:00:30', '2022-11-01 12:00:30'),
(2445, 'SI-0000396', '2022-11-01', 'C-00002', 100.00, 0.00, 100.00, 0.00, 0.00, NULL, 'Cash', '2022-11-01', '1', 0, 1, '2022-11-01 12:17:29', '2022-11-01 12:17:29'),
(2446, 'SI-0000397', '2022-11-01', 'C-00002', 70.00, 0.00, 70.00, 0.00, 0.00, NULL, 'Cash', '2022-11-01', '1', 0, 1, '2022-11-01 12:18:49', '2022-11-01 12:18:49'),
(2447, 'SI-0000398', '2022-11-01', 'C-00012', 829.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-01', '1', 0, 1, '2022-11-01 12:44:04', '2022-11-01 12:44:04'),
(2448, 'SI-0000399', '2022-11-01', 'C-00002', 665.00, 0.00, 665.00, 0.00, 0.00, NULL, 'Cash', '2022-11-01', '1', 0, 1, '2022-11-01 14:14:21', '2022-11-01 14:14:21'),
(2449, 'SI-0000400', '2022-11-01', 'C-00001', 360.00, 0.00, 360.00, 0.00, 0.00, NULL, 'Cash', '2022-11-01', '1', 0, 1, '2022-11-01 14:18:54', '2022-11-01 14:18:54'),
(2450, 'SI-0000401', '2022-11-01', 'C-00015', 32.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-01', '1', 0, 1, '2022-11-01 14:26:22', '2022-11-01 14:26:22'),
(2451, 'SI-0000402', '2022-11-02', 'C-00026', 490.00, 0.00, 490.00, 0.00, 0.00, NULL, 'Cash', '2022-11-02', '1', 0, 1, '2022-11-02 03:21:42', '2022-11-02 03:21:42'),
(2453, 'SI-0000403', '2022-11-02', 'C-00002', 750.00, 0.00, 750.00, 0.00, 0.00, NULL, 'Cash', '2022-11-02', '1', 0, 1, '2022-11-02 05:24:35', '2022-11-02 05:24:35'),
(2454, 'SI-0000404', '2022-11-02', 'C-00001', 358.00, 0.00, 358.00, 0.00, 0.00, NULL, 'Cash', '2022-11-02', '1', 0, 1, '2022-11-02 06:17:56', '2022-11-02 06:17:56'),
(2455, 'SI-0000405', '2022-11-02', 'C-00026', 850.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-02', '1', 0, 1, '2022-11-02 10:47:54', '2022-11-02 10:47:54'),
(2456, 'SI-0000406', '2022-11-02', 'C-00002', 33.00, 0.00, 33.00, 0.00, 0.00, NULL, 'Cash', '2022-11-03', '1', 0, 1, '2022-11-03 04:09:36', '2022-11-03 04:09:36'),
(2457, 'SI-0000407', '2022-11-02', 'C-00002', 2700.00, 0.00, 2700.00, 0.00, 0.00, NULL, 'Cash', '2022-11-03', '1', 0, 1, '2022-11-03 04:10:32', '2022-11-03 04:10:32'),
(2459, 'SI-0000409', '2022-11-02', 'C-00010', 4530.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-03', '1', 0, 1, '2022-11-03 04:16:37', '2022-11-03 04:16:37'),
(2460, 'SI-0000410', '2022-11-03', 'C-00002', 1250.00, 10.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-03', '1', 0, 1, '2022-11-03 04:26:37', '2022-11-03 04:26:37'),
(2461, 'SI-0000411', '2022-11-03', 'C-00002', 42.00, 0.00, 42.00, 0.00, 0.00, NULL, 'Cash', '2022-11-03', '1', 0, 1, '2022-11-03 04:59:53', '2022-11-03 04:59:53'),
(2462, 'SI-0000412', '2022-11-03', 'C-00001', 210.00, 10.00, 200.00, 0.00, 0.00, NULL, 'Cash', '2022-11-03', '1', 0, 1, '2022-11-03 05:04:12', '2022-11-03 05:04:12'),
(2463, 'SI-0000413', '2022-11-03', 'C-00002', 435.00, 0.00, 435.00, 0.00, 0.00, NULL, 'Cash', '2022-11-03', '1', 0, 1, '2022-11-03 05:17:59', '2022-11-03 05:17:59'),
(2464, 'SI-0000414', '2022-11-03', 'C-00002', 114.00, 0.00, 100.00, 0.00, 0.00, NULL, 'Cash', '2022-11-03', '1', 0, 1, '2022-11-03 12:20:38', '2022-11-03 12:20:38'),
(2465, 'SI-0000415', '2022-11-03', 'C-00002', 550.00, 0.00, 550.00, 0.00, 0.00, NULL, 'Cash', '2022-11-03', '1', 0, 1, '2022-11-03 12:46:46', '2022-11-03 12:46:46'),
(2466, 'SI-0000416', '2022-11-03', 'C-00025', 1625.00, 0.00, 1625.00, 0.00, 0.00, NULL, 'Cash', '2022-11-03', '1', 0, 1, '2022-11-03 13:31:38', '2022-11-03 13:31:38'),
(2467, 'SI-0000417', '2022-11-02', 'C-00002', 570.00, 10.00, 560.00, 0.00, 0.00, NULL, 'Cash', '2022-11-03', '1', 0, 1, '2022-11-03 13:37:25', '2022-11-03 13:37:25'),
(2468, 'SI-0000418', '2022-11-03', 'C-00002', 320.00, 0.00, 320.00, 0.00, 0.00, NULL, 'Cash', '2022-11-03', '1', 0, 1, '2022-11-03 13:52:32', '2022-11-03 13:52:32'),
(2469, 'SI-0000419', '2022-11-04', 'C-00002', 815.00, 0.00, 815.00, 0.00, 0.00, NULL, 'Cash', '2022-11-04', '1', 0, 1, '2022-11-04 04:58:38', '2022-11-04 04:58:38'),
(2470, 'SI-0000420', '2022-11-04', 'C-00002', 1250.00, 0.00, 1250.00, 0.00, 0.00, NULL, 'Cash', '2022-11-04', '1', 0, 1, '2022-11-04 05:05:25', '2022-11-04 05:05:25'),
(2471, 'SI-0000421', '2022-11-04', 'C-00002', 228.00, 0.00, 228.00, 0.00, 0.00, NULL, 'Cash', '2022-11-04', '1', 0, 1, '2022-11-04 11:55:33', '2022-11-04 11:55:33'),
(2472, 'SI-0000422', '2022-11-04', 'C-00002', 630.00, 0.00, 630.00, 0.00, 0.00, NULL, 'Cash', '2022-11-04', '1', 0, 1, '2022-11-04 12:01:42', '2022-11-04 12:01:42'),
(2473, 'SI-0000423', '2022-11-04', 'C-00002', 51.20, 0.00, 51.20, 0.00, 0.00, NULL, 'Cash', '2022-11-04', '1', 0, 1, '2022-11-04 14:48:26', '2022-11-04 14:48:26'),
(2474, 'SI-0000424', '2022-11-05', 'C-00011', 180.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-05', '1', 0, 1, '2022-11-05 04:43:50', '2022-11-05 04:43:50'),
(2475, 'SI-0000425', '2022-11-05', 'C-00020', 96.00, 0.00, 96.00, 0.00, 0.00, NULL, 'Cash', '2022-11-05', '1', 0, 1, '2022-11-05 05:45:39', '2022-11-05 05:45:39'),
(2476, 'SI-0000426', '2022-11-05', 'C-00012', 88789.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-05', '1', 0, 1, '2022-11-05 13:41:35', '2022-11-05 13:41:35'),
(2477, 'SI-0000427', '2022-11-05', 'C-00026', 32440.00, 0.00, 40000.00, 0.00, 0.00, NULL, 'Cash', '2022-11-05', '1', 0, 1, '2022-11-05 13:44:40', '2022-11-05 13:44:40'),
(2478, 'SI-0000428', '2022-11-05', 'C-00026', 380.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-05', '1', 0, 1, '2022-11-05 14:02:59', '2022-11-05 14:02:59'),
(2479, 'SI-0000429', '2022-11-05', 'C-00026', 200.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-05', '1', 0, 1, '2022-11-05 14:16:02', '2022-11-05 14:16:02'),
(2480, 'SI-0000430', '2022-11-05', 'C-00002', 1205.00, 5.00, 1200.00, 0.00, 0.00, NULL, 'Cash', '2022-11-05', '1', 0, 1, '2022-11-05 14:21:50', '2022-11-05 14:21:50'),
(2481, 'SI-0000431', '2022-11-06', 'C-00002', 290.00, 5.00, 285.00, 0.00, 0.00, NULL, 'Cash', '2022-11-06', '1', 0, 1, '2022-11-06 04:33:22', '2022-11-06 04:33:22'),
(2482, 'SI-0000432', '2022-11-06', 'C-00002', 310.00, 10.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-06', '1', 0, 1, '2022-11-06 04:35:36', '2022-11-06 04:35:36'),
(2483, 'SI-0000433', '2022-11-06', 'C-00007', 1060.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-06', '1', 0, 1, '2022-11-06 13:18:23', '2022-11-06 13:18:23'),
(2484, 'SI-0000434', '2022-11-06', 'C-00018', 85.00, 0.00, 2000.00, 0.00, 0.00, NULL, 'Cash', '2022-11-06', '1', 0, 1, '2022-11-06 13:21:53', '2022-11-06 13:21:53'),
(2485, 'SI-0000435', '2022-11-06', 'C-00026', 452.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-06', '1', 0, 1, '2022-11-06 13:23:45', '2022-11-06 13:23:45'),
(2486, 'SI-0000436', '2022-11-07', 'C-00002', 360.00, 0.00, 360.00, 0.00, 0.00, NULL, 'Cash', '2022-11-07', '1', 0, 1, '2022-11-07 10:43:55', '2022-11-07 10:43:55'),
(2487, 'SI-0000437', '2022-11-07', 'C-00002', 108.00, 0.00, 108.00, 0.00, 0.00, NULL, 'Cash', '2022-11-07', '1', 0, 1, '2022-11-07 12:57:56', '2022-11-07 12:57:56'),
(2488, 'SI-0000438', '2022-11-07', 'C-00002', 8.80, 0.00, 8.80, 0.00, 0.00, NULL, 'Cash', '2022-11-07', '1', 0, 1, '2022-11-07 13:00:28', '2022-11-07 13:00:28'),
(2489, 'SI-0000439', '2022-11-07', 'C-00002', 2150.00, 0.00, 2150.00, 0.00, 0.00, NULL, 'Cash', '2022-11-07', '1', 0, 1, '2022-11-07 14:02:41', '2022-11-07 14:02:41'),
(2490, 'SI-0000440', '2022-11-07', 'C-00018', 242.00, 2.00, 240.00, 0.00, 0.00, NULL, 'Cash', '2022-11-07', '1', 0, 1, '2022-11-07 14:04:42', '2022-11-07 14:04:42'),
(2491, 'SI-0000441', '2022-11-07', 'C-00009', 5300.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-07', '1', 0, 1, '2022-11-07 14:16:07', '2022-11-07 14:16:07'),
(2492, 'SI-0000442', '2022-11-07', 'C-00011', 155.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-07', '1', 0, 1, '2022-11-07 14:21:12', '2022-11-07 14:21:12'),
(2493, 'SI-0000443', '2022-11-07', 'C-00002', 24.00, 0.00, 24.00, 0.00, 0.00, NULL, 'Cash', '2022-11-07', '1', 0, 1, '2022-11-07 14:29:55', '2022-11-07 14:29:55'),
(2494, 'SI-0000444', '2022-11-08', 'C-00002', 720.00, 10.00, 710.00, 0.00, 0.00, NULL, 'Cash', '2022-11-08', '1', 0, 1, '2022-11-08 04:48:56', '2022-11-08 04:48:56'),
(2495, 'SI-0000445', '2022-11-08', 'C-00002', 2500.00, 0.00, 2500.00, 0.00, 0.00, NULL, 'Cash', '2022-11-08', '1', 0, 1, '2022-11-08 05:25:20', '2022-11-08 05:25:20'),
(2496, 'SI-0000446', '2022-11-08', 'C-00013', 1620.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-08', '1', 0, 1, '2022-11-08 07:29:16', '2022-11-08 07:29:16'),
(2497, 'SI-0000447', '2022-11-08', 'C-00015', 1250.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-08', '1', 0, 1, '2022-11-08 07:34:58', '2022-11-08 07:34:58'),
(2498, 'SI-0000448', '2022-11-08', 'C-00015', 1250.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-08', '1', 0, 1, '2022-11-08 07:37:21', '2022-11-08 07:37:21'),
(2499, 'SI-0000449', '2022-11-09', 'C-00002', 15.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-09', '1', 0, 1, '2022-11-09 04:30:27', '2022-11-09 04:30:27'),
(2500, 'SI-0000450', '2022-11-09', 'C-00025', 4627.00, 0.00, 4627.00, 0.00, 0.00, NULL, 'Cash', '2022-11-09', '1', 0, 1, '2022-11-09 06:38:17', '2022-11-09 06:38:17'),
(2501, 'SI-0000451', '2022-11-09', 'C-00002', 8.80, 0.00, 8.80, 0.00, 0.00, NULL, 'Cash', '2022-11-09', '1', 0, 1, '2022-11-09 06:58:30', '2022-11-09 06:58:30'),
(2502, 'SI-0000452', '2022-11-09', 'C-00002', 330.00, 0.00, 330.00, 0.00, 0.00, NULL, 'Cash', '2022-11-09', '1', 0, 1, '2022-11-09 12:47:41', '2022-11-09 12:47:41'),
(2503, 'SI-0000453', '2022-11-09', 'C-00022', 871.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-09', '1', 0, 1, '2022-11-09 12:59:56', '2022-11-09 12:59:56'),
(2504, 'SI-0000454', '2022-11-09', 'C-00011', 70.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-09', '1', 0, 1, '2022-11-09 13:22:36', '2022-11-09 13:22:36'),
(2505, 'SI-0000455', '2022-11-10', 'C-00026', 350.00, 0.00, 350.00, 0.00, 0.00, NULL, 'Cash', '2022-11-10', '1', 0, 1, '2022-11-10 03:37:50', '2022-11-10 03:37:50'),
(2506, 'SI-0000456', '2022-11-10', 'C-00002', 749.00, 0.00, 749.00, 0.00, 0.00, NULL, 'Cash', '2022-11-10', '1', 0, 1, '2022-11-10 03:52:38', '2022-11-10 03:52:38'),
(2507, 'SI-0000457', '2022-11-10', 'C-00002', 17.60, 0.00, 17.60, 0.00, 0.00, NULL, 'Cash', '2022-11-10', '1', 0, 1, '2022-11-10 04:25:54', '2022-11-10 04:25:54'),
(2508, 'SI-0000458', '2022-11-10', 'C-00002', 1250.00, 0.00, 1250.00, 0.00, 0.00, NULL, 'Cash', '2022-11-10', '1', 0, 1, '2022-11-10 04:28:43', '2022-11-10 04:28:43'),
(2509, 'SI-0000459', '2022-11-10', 'C-00002', 315.00, 0.00, 315.00, 0.00, 0.00, NULL, 'Cash', '2022-11-10', '1', 0, 1, '2022-11-10 04:35:58', '2022-11-10 04:35:58'),
(2510, 'SI-0000460', '2022-11-10', 'C-00002', 132.00, 2.00, 130.00, 0.00, 0.00, NULL, 'Cash', '2022-11-10', '1', 0, 1, '2022-11-10 04:38:19', '2022-11-10 04:38:19'),
(2511, 'SI-0000461', '2022-11-10', 'C-00002', 180.00, 0.00, 180.00, 0.00, 0.00, NULL, 'Cash', '2022-11-10', '1', 0, 1, '2022-11-10 04:50:11', '2022-11-10 04:50:11'),
(2513, 'SI-0000462', '2022-11-10', 'C-00007', 5075.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-10', '1', 0, 1, '2022-11-10 06:28:58', '2022-11-10 06:28:58'),
(2514, 'SI-0000463', '2022-11-10', 'C-00002', 405.00, 0.00, 405.00, 0.00, 0.00, NULL, 'Cash', '2022-11-10', '1', 0, 1, '2022-11-10 08:03:53', '2022-11-10 08:03:53'),
(2515, 'SI-0000464', '2022-11-10', 'C-00008', 8000.00, 0.00, 8000.00, 0.00, 0.00, NULL, 'Cash', '2022-11-10', '1', 0, 1, '2022-11-10 13:42:56', '2022-11-10 13:42:56'),
(2516, 'SI-0000465', '2022-11-10', 'C-00002', 1140.00, 0.00, 1000.00, 0.00, 0.00, NULL, 'Cash', '2022-11-10', '1', 0, 1, '2022-11-10 14:20:23', '2022-11-10 14:20:23'),
(2517, 'SI-0000466', '2022-11-11', 'C-00002', 20.00, 0.00, 20.00, 0.00, 0.00, NULL, 'Cash', '2022-11-11', '1', 0, 1, '2022-11-11 05:31:22', '2022-11-11 05:31:22'),
(2518, 'SI-0000467', '2022-11-11', 'C-00026', 26152.00, 0.00, 11000.00, 0.00, 0.00, NULL, 'Cash', '2022-11-11', '1', 0, 1, '2022-11-11 10:17:08', '2022-11-11 10:17:08'),
(2519, 'SI-0000468', '2022-11-11', 'C-00027', 270.00, 0.00, 270.00, 0.00, 0.00, NULL, 'Cash', '2022-11-11', '1', 0, 1, '2022-11-11 13:31:37', '2022-11-11 13:31:37'),
(2521, 'SI-0000469', '2022-11-11', 'C-00013', 450.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-11', '1', 0, 1, '2022-11-11 14:35:56', '2022-11-11 14:35:56'),
(2522, 'SI-0000470', '2022-11-12', 'C-00002', 33.00, 0.00, 33.00, 0.00, 0.00, NULL, 'Cash', '2022-11-12', '1', 0, 1, '2022-11-12 04:19:14', '2022-11-12 04:19:14'),
(2523, 'SI-0000471', '2022-11-12', 'C-00002', 200.00, 0.00, 200.00, 0.00, 0.00, NULL, 'Cash', '2022-11-12', '1', 0, 1, '2022-11-12 04:27:06', '2022-11-12 04:27:06'),
(2524, 'SI-0000472', '2022-11-12', 'C-00002', 509.00, 0.00, 509.00, 0.00, 0.00, NULL, 'Cash', '2022-11-12', '1', 0, 1, '2022-11-12 05:52:31', '2022-11-12 05:52:31'),
(2525, 'SI-0000473', '2022-11-12', 'C-00015', 429.00, 0.00, 429.00, 0.00, 0.00, NULL, 'Cash', '2022-11-12', '1', 0, 1, '2022-11-12 10:54:50', '2022-11-12 10:54:50'),
(2526, 'SI-0000474', '2022-11-12', 'C-00026', 450.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-12', '1', 0, 1, '2022-11-12 11:00:54', '2022-11-12 11:00:54'),
(2528, 'SI-0000475', '2022-11-12', 'C-00016', 3179.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-12', '1', 0, 1, '2022-11-12 11:36:43', '2022-11-12 11:36:43'),
(2529, 'SI-0000476', '2022-11-12', 'C-00018', 105.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-12', '1', 0, 1, '2022-11-12 12:37:10', '2022-11-12 12:37:10'),
(2530, 'SI-0000477', '2022-11-12', 'C-00002', 40.00, 0.00, 40.00, 0.00, 0.00, NULL, 'Cash', '2022-11-12', '1', 0, 1, '2022-11-12 12:40:18', '2022-11-12 12:40:18'),
(2531, 'SI-0000478', '2022-11-12', 'C-00015', 35.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-12', '1', 0, 1, '2022-11-12 14:10:45', '2022-11-12 14:10:45'),
(2532, 'SI-0000479', '2022-11-12', 'C-00007', 64.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-12', '1', 0, 1, '2022-11-12 14:11:57', '2022-11-12 14:11:57'),
(2533, 'SI-0000480', '2022-11-13', 'C-00016', 3580.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-13', '1', 0, 1, '2022-11-13 07:27:52', '2022-11-13 07:27:52'),
(2534, 'SI-0000481', '2022-11-13', 'C-00010', 5660.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-13', '1', 0, 1, '2022-11-13 11:36:41', '2022-11-13 11:36:41'),
(2535, 'SI-0000482', '2022-11-13', 'C-00002', 1300.00, 0.00, 1300.00, 0.00, 0.00, NULL, 'Cash', '2022-11-13', '1', 0, 1, '2022-11-13 11:38:25', '2022-11-13 11:38:25'),
(2536, 'SI-0000483', '2022-11-13', 'C-00002', 35.00, 0.00, 35.00, 0.00, 0.00, NULL, 'Cash', '2022-11-13', '1', 0, 1, '2022-11-13 11:39:08', '2022-11-13 11:39:08'),
(2537, 'SI-0000484', '2022-11-13', 'C-00002', 200.00, 0.00, 200.00, 0.00, 0.00, NULL, 'Cash', '2022-11-13', '1', 0, 1, '2022-11-13 11:40:14', '2022-11-13 11:40:14'),
(2538, 'SI-0000485', '2022-11-13', 'C-00002', 230.00, 10.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-13', '1', 0, 1, '2022-11-13 11:41:48', '2022-11-13 11:41:48'),
(2539, 'SI-0000486', '2022-11-13', 'C-00002', 57.00, 0.00, 57.00, 0.00, 0.00, NULL, 'Cash', '2022-11-13', '1', 0, 1, '2022-11-13 11:42:30', '2022-11-13 11:42:30'),
(2541, 'SI-0000487', '2022-11-13', 'C-00002', 285.00, 0.00, 285.00, 0.00, 0.00, NULL, 'Cash', '2022-11-13', '1', 0, 1, '2022-11-13 13:20:27', '2022-11-13 13:20:27'),
(2542, 'SI-0000488', '2022-11-14', 'C-00002', 200.00, 0.00, 200.00, 0.00, 0.00, NULL, 'Cash', '2022-11-14', '1', 0, 1, '2022-11-14 04:52:48', '2022-11-14 04:52:48'),
(2543, 'SI-0000489', '2022-11-14', 'C-00002', 33.00, 0.00, 33.00, 0.00, 0.00, NULL, 'Cash', '2022-11-14', '1', 0, 1, '2022-11-14 10:42:45', '2022-11-14 10:42:45'),
(2544, 'SI-0000490', '2022-11-14', 'C-00002', 36.00, 0.00, 35.00, 0.00, 0.00, NULL, 'Cash', '2022-11-14', '1', 0, 1, '2022-11-14 12:18:15', '2022-11-14 12:18:15'),
(2545, 'SI-0000491', '2022-11-14', 'C-00006', 600.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-14', '1', 0, 1, '2022-11-14 12:19:59', '2022-11-14 12:19:59'),
(2546, 'SI-0000492', '2022-11-14', 'C-00008', 200.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-14', '1', 0, 1, '2022-11-14 14:05:18', '2022-11-14 14:05:18'),
(2547, 'SI-0000493', '2022-11-14', 'C-00023', 2800.00, 0.00, 3000.00, 0.00, 0.00, NULL, 'Cash', '2022-11-14', '1', 0, 1, '2022-11-14 14:09:15', '2022-11-14 14:09:15'),
(2548, 'SI-0000494', '2022-11-15', 'C-00002', 50.00, 0.00, 50.00, 0.00, 0.00, NULL, 'Cash', '2022-11-15', '1', 0, 1, '2022-11-15 06:31:39', '2022-11-15 06:31:39'),
(2549, 'SI-0000495', '2022-11-15', 'C-00018', 97.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-15', '1', 0, 1, '2022-11-15 12:57:44', '2022-11-15 12:57:44'),
(2550, 'SI-0000496', '2022-11-16', 'C-00002', 8.80, 0.00, 8.80, 0.00, 0.00, NULL, 'Cash', '2022-11-16', '1', 0, 1, '2022-11-16 03:54:08', '2022-11-16 03:54:08'),
(2551, 'SI-0000497', '2022-11-16', 'C-00002', 335.00, 0.00, 335.00, 0.00, 0.00, NULL, 'Cash', '2022-11-16', '1', 0, 1, '2022-11-16 03:57:42', '2022-11-16 03:57:42'),
(2552, 'SI-0000498', '2022-11-16', 'C-00002', 255.00, 0.00, 255.00, 0.00, 0.00, NULL, 'Cash', '2022-11-16', '1', 0, 1, '2022-11-16 04:32:40', '2022-11-16 04:32:40'),
(2553, 'SI-0000499', '2022-11-16', 'C-00002', 115.00, 0.00, 115.00, 0.00, 0.00, NULL, 'Cash', '2022-11-16', '1', 0, 1, '2022-11-16 05:05:58', '2022-11-16 05:05:58'),
(2554, 'SI-0000500', '2022-11-16', 'C-00002', 195.00, 0.00, 195.00, 0.00, 0.00, NULL, 'Cash', '2022-11-16', '1', 0, 1, '2022-11-16 11:12:21', '2022-11-16 11:12:21'),
(2555, 'SI-0000501', '2022-11-16', 'C-00026', 6688.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-16', '1', 0, 1, '2022-11-16 13:06:35', '2022-11-16 13:06:35'),
(2556, 'SI-0000502', '2022-11-16', 'C-00015', 50.00, 0.00, 50.00, 0.00, 0.00, NULL, 'Cash', '2022-11-17', '1', 0, 1, '2022-11-17 04:14:49', '2022-11-17 04:14:49'),
(2557, 'SI-0000503', '2022-11-17', 'C-00002', 1040.00, 0.00, 1040.00, 0.00, 0.00, NULL, 'Cash', '2022-11-17', '1', 0, 1, '2022-11-17 04:49:26', '2022-11-17 04:49:26'),
(2558, 'SI-0000504', '2022-11-17', 'C-00006', 4620.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-17', '1', 0, 1, '2022-11-17 05:24:18', '2022-11-17 05:24:18'),
(2559, 'SI-0000505', '2022-11-17', 'C-00002', 12.00, 0.00, 12.00, 0.00, 0.00, NULL, 'Cash', '2022-11-17', '1', 0, 1, '2022-11-17 06:24:24', '2022-11-17 06:24:24'),
(2560, 'SI-0000506', '2022-11-17', 'C-00008', 1030.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-17', '1', 0, 1, '2022-11-17 10:29:41', '2022-11-17 10:29:41'),
(2561, 'SI-0000507', '2022-11-17', 'C-00002', 69.00, 0.00, 69.00, 0.00, 0.00, NULL, 'Cash', '2022-11-17', '1', 0, 1, '2022-11-17 12:26:43', '2022-11-17 12:26:43'),
(2563, 'SI-0000508', '2022-11-18', 'C-00001', 900.00, 0.00, 900.00, 0.00, 0.00, NULL, 'Cash', '2022-11-18', '1', 0, 1, '2022-11-18 12:18:46', '2022-11-18 12:18:46'),
(2564, 'SI-0000509', '2022-11-18', 'C-00006', 6500.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-18', '1', 0, 1, '2022-11-18 12:47:33', '2022-11-18 12:47:33'),
(2565, 'SI-0000510', '2022-11-18', 'C-00001', 2600.00, 0.00, 2600.00, 0.00, 0.00, NULL, 'Cash', '2022-11-18', '1', 0, 1, '2022-11-18 12:51:18', '2022-11-18 12:51:18'),
(2566, 'SI-0000511', '2022-11-18', 'C-00002', 152.00, 0.00, 152.00, 0.00, 0.00, NULL, 'Cash', '2022-11-18', '1', 0, 1, '2022-11-18 13:08:40', '2022-11-18 13:08:40'),
(2567, 'SI-0000512', '2022-11-18', 'C-00001', 1300.00, 0.00, 1300.00, 0.00, 0.00, NULL, 'Cash', '2022-11-18', '1', 0, 1, '2022-11-18 13:36:35', '2022-11-18 13:36:35'),
(2569, 'SI-0000513', '2022-11-18', 'C-00028', 2005.00, 5.00, 2000.00, 0.00, 0.00, NULL, 'Cash', '2022-11-18', '1', 0, 1, '2022-11-18 14:10:47', '2022-11-18 14:10:47'),
(2570, 'SI-0000514', '2022-11-19', 'C-00002', 15.00, 0.00, 15.00, 0.00, 0.00, NULL, 'Cash', '2022-11-19', '1', 0, 1, '2022-11-19 04:25:39', '2022-11-19 04:25:39'),
(2571, 'SI-0000515', '2022-11-19', 'C-00002', 84.00, 0.00, 84.00, 0.00, 0.00, NULL, 'Cash', '2022-11-19', '1', 0, 1, '2022-11-19 05:16:23', '2022-11-19 05:16:23'),
(2572, 'SI-0000516', '2022-11-19', 'C-00002', 84.00, 0.00, 84.00, 0.00, 0.00, NULL, 'Cash', '2022-11-19', '1', 0, 1, '2022-11-19 05:17:39', '2022-11-19 05:17:39'),
(2573, 'SI-0000517', '2022-11-19', 'C-00002', 30.00, 0.00, 30.00, 0.00, 0.00, NULL, 'Cash', '2022-11-19', '1', 0, 1, '2022-11-19 12:03:49', '2022-11-19 12:03:49'),
(2574, 'SI-0000518', '2022-11-19', 'C-00023', 2800.00, 0.00, 2800.00, 0.00, 0.00, NULL, 'Cash', '2022-11-19', '1', 0, 1, '2022-11-19 13:41:39', '2022-11-19 13:41:39'),
(2575, 'SI-0000519', '2022-11-20', 'C-00002', 1050.00, 10.00, 1040.00, 0.00, 0.00, NULL, 'Cash', '2022-11-20', '1', 0, 1, '2022-11-20 03:43:17', '2022-11-20 03:43:17'),
(2576, 'SI-0000520', '2022-11-20', 'C-00002', 1300.00, 0.00, 1300.00, 0.00, 0.00, NULL, 'Cash', '2022-11-20', '1', 0, 1, '2022-11-20 04:43:47', '2022-11-20 04:43:47'),
(2577, 'SI-0000521', '2022-11-20', 'C-00001', 182.00, 2.00, 180.00, 0.00, 0.00, NULL, 'Cash', '2022-11-20', '1', 0, 1, '2022-11-20 04:45:17', '2022-11-20 04:45:17'),
(2578, 'SI-0000522', '2022-11-20', 'C-00002', 39.00, 0.00, 39.00, 0.00, 0.00, NULL, 'Cash', '2022-11-20', '1', 0, 1, '2022-11-20 10:12:49', '2022-11-20 10:12:49'),
(2579, 'SI-0000523', '2022-11-20', 'C-00026', 300.00, 0.00, 300.00, 0.00, 0.00, NULL, 'Cash', '2022-11-20', '1', 0, 1, '2022-11-20 10:35:24', '2022-11-20 10:35:24'),
(2580, 'SI-0000524', '2022-11-20', 'C-00002', 388.00, 0.00, 388.00, 0.00, 0.00, NULL, 'Cash', '2022-11-20', '1', 0, 1, '2022-11-20 10:48:13', '2022-11-20 10:48:13'),
(2581, 'SI-0000525', '2022-11-20', 'C-00002', 12.00, 0.00, 12.00, 0.00, 0.00, NULL, 'Cash', '2022-11-20', '1', 0, 1, '2022-11-20 10:56:28', '2022-11-20 10:56:28'),
(2582, 'SI-0000526', '2022-11-20', 'C-00018', 845.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-20', '1', 0, 1, '2022-11-20 12:27:34', '2022-11-20 12:27:34'),
(2583, 'SI-0000527', '2022-11-20', 'C-00018', 60.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-20', '1', 0, 1, '2022-11-20 12:30:10', '2022-11-20 12:30:10'),
(2584, 'SI-0000528', '2022-11-20', 'C-00002', 545.00, 0.00, 545.00, 0.00, 0.00, NULL, 'Cash', '2022-11-20', '1', 0, 1, '2022-11-20 12:36:51', '2022-11-20 12:36:51'),
(2585, 'SI-0000529', '2022-11-20', 'C-00002', 200.00, 0.00, 200.00, 0.00, 0.00, NULL, 'Cash', '2022-11-20', '1', 0, 1, '2022-11-20 13:08:48', '2022-11-20 13:08:48'),
(2586, 'SI-0000530', '2022-11-20', 'C-00020', 1810.00, 10.00, 1800.00, 0.00, 0.00, NULL, 'Cash', '2022-11-20', '1', 0, 1, '2022-11-20 13:12:00', '2022-11-20 13:12:00'),
(2587, 'SI-0000531', '2022-11-21', 'C-00002', 508.00, 0.00, 508.00, 0.00, 0.00, NULL, 'Cash', '2022-11-21', '1', 0, 1, '2022-11-21 04:33:52', '2022-11-21 04:33:52'),
(2588, 'SI-0000532', '2022-11-21', 'C-00002', 246.00, 1.00, 246.00, 0.00, 0.00, NULL, 'Cash', '2022-11-21', '1', 0, 1, '2022-11-21 12:15:20', '2022-11-21 12:15:20'),
(2589, 'SI-0000533', '2022-11-21', 'C-00008', 330.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-21', '1', 0, 1, '2022-11-21 12:29:03', '2022-11-21 12:29:03'),
(2590, 'SI-0000534', '2022-11-21', 'C-00002', 200.00, 0.00, 200.00, 0.00, 0.00, NULL, 'Cash', '2022-11-21', '1', 0, 1, '2022-11-21 12:30:56', '2022-11-21 12:30:56'),
(2591, 'SI-0000535', '2022-11-21', 'C-00002', 50.00, 0.00, 50.00, 0.00, 0.00, NULL, 'Cash', '2022-11-21', '1', 0, 1, '2022-11-21 12:32:01', '2022-11-21 12:32:01'),
(2592, 'SI-0000536', '2022-11-21', 'C-00026', 622.00, 0.00, 430.00, 0.00, 0.00, NULL, 'Cash', '2022-11-21', '1', 0, 1, '2022-11-21 12:33:40', '2022-11-21 12:33:40'),
(2593, 'SI-0000537', '2022-11-21', 'C-00010', 440.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-21', '1', 0, 1, '2022-11-21 12:38:53', '2022-11-21 12:38:53'),
(2594, 'SI-0000538', '2022-11-21', 'C-00013', 1080.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-21', '1', 0, 1, '2022-11-21 12:57:06', '2022-11-21 12:57:06'),
(2595, 'SI-0000539', '2022-11-21', 'C-00013', 390.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-21', '1', 0, 1, '2022-11-21 13:03:58', '2022-11-21 13:03:58'),
(2596, 'SI-0000540', '2022-11-22', 'C-00002', 200.00, 0.00, 200.00, 0.00, 0.00, NULL, 'Cash', '2022-11-22', '1', 0, 1, '2022-11-22 03:41:01', '2022-11-22 03:41:01'),
(2597, 'SI-0000541', '2022-11-22', 'C-00002', 9.00, 0.00, 9.00, 0.00, 0.00, NULL, 'Cash', '2022-11-22', '1', 0, 1, '2022-11-22 03:42:57', '2022-11-22 03:42:57'),
(2598, 'SI-0000542', '2022-11-22', 'C-00002', 33.00, 0.00, 33.00, 0.00, 0.00, NULL, 'Cash', '2022-11-22', '1', 0, 1, '2022-11-22 03:44:37', '2022-11-22 03:44:37'),
(2599, 'SI-0000543', '2022-11-22', 'C-00002', 200.00, 0.00, 200.00, 0.00, 0.00, NULL, 'Cash', '2022-11-22', '1', 0, 1, '2022-11-22 04:04:27', '2022-11-22 04:04:27'),
(2600, 'SI-0000544', '2022-11-22', 'C-00002', 400.00, 0.00, 400.00, 0.00, 0.00, NULL, 'Cash', '2022-11-22', '1', 0, 1, '2022-11-22 04:25:49', '2022-11-22 04:25:49'),
(2601, 'SI-0000545', '2022-11-22', 'C-00002', 56.00, 0.00, 56.00, 0.00, 0.00, NULL, 'Cash', '2022-11-22', '1', 0, 1, '2022-11-22 10:48:58', '2022-11-22 10:48:58'),
(2602, 'SI-0000546', '2022-11-22', 'C-00002', 33.00, 0.00, 33.00, 0.00, 0.00, NULL, 'Cash', '2022-11-22', '1', 0, 1, '2022-11-22 12:59:04', '2022-11-22 12:59:04'),
(2603, 'SI-0000547', '2022-11-22', 'C-00022', 395.00, 0.00, 395.00, 0.00, 0.00, NULL, 'Cash', '2022-11-22', '1', 0, 1, '2022-11-22 14:04:19', '2022-11-22 14:04:19'),
(2604, 'SI-0000548', '2022-11-22', 'C-00002', 200.00, 0.00, 200.00, 0.00, 0.00, NULL, 'Cash', '2022-11-22', '1', 0, 1, '2022-11-22 14:24:45', '2022-11-22 14:24:45'),
(2605, 'SI-0000549', '2022-11-23', 'C-00002', 17.60, 0.00, 17.60, 0.00, 0.00, NULL, 'Cash', '2022-11-23', '1', 0, 1, '2022-11-23 04:16:23', '2022-11-23 04:16:23'),
(2607, 'SI-0000550', '2022-11-23', 'C-00018', 1285.00, 0.00, 2000.00, 0.00, 0.00, NULL, 'Cash', '2022-11-23', '1', 0, 1, '2022-11-23 04:56:50', '2022-11-23 04:56:50'),
(2608, 'SI-0000551', '2022-11-24', 'C-00002', 200.00, 0.00, 200.00, 0.00, 0.00, NULL, 'Cash', '2022-11-24', '1', 0, 1, '2022-11-24 05:03:59', '2022-11-24 05:03:59'),
(2609, 'SI-0000552', '2022-11-24', 'C-00002', 611.00, 0.00, 611.00, 0.00, 0.00, NULL, 'Cash', '2022-11-24', '1', 0, 1, '2022-11-24 06:24:01', '2022-11-24 06:24:01'),
(2610, 'SI-0000553', '2022-11-24', 'C-00001', 182.00, 2.00, 180.00, 0.00, 0.00, NULL, 'Cash', '2022-11-24', '1', 0, 1, '2022-11-24 06:51:59', '2022-11-24 06:51:59'),
(2611, 'SI-0000554', '2022-11-24', 'C-00002', 130.00, 0.00, 130.00, 0.00, 0.00, NULL, 'Cash', '2022-11-24', '1', 0, 1, '2022-11-24 10:56:28', '2022-11-24 10:56:28'),
(2612, 'SI-0000555', '2022-11-24', 'C-00002', 43.00, 0.00, 43.00, 0.00, 0.00, NULL, 'Cash', '2022-11-24', '1', 0, 1, '2022-11-24 11:48:20', '2022-11-24 11:48:20'),
(2613, 'SI-0000556', '2022-11-24', 'C-00022', 33.00, 0.00, 33.00, 0.00, 0.00, NULL, 'Cash', '2022-11-24', '1', 0, 1, '2022-11-24 13:05:01', '2022-11-24 13:05:01'),
(2614, 'SI-0000557', '2022-11-24', 'C-00018', 100.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-24', '1', 0, 1, '2022-11-24 13:07:58', '2022-11-24 13:07:58'),
(2615, 'SI-0000558', '2022-11-25', 'C-00002', 480.00, 0.00, 480.00, 0.00, 0.00, NULL, 'Cash', '2022-11-25', '1', 0, 1, '2022-11-25 05:01:14', '2022-11-25 05:01:14'),
(2616, 'SI-0000559', '2022-11-25', 'C-00002', 120.00, 0.00, 120.00, 0.00, 0.00, NULL, 'Cash', '2022-11-25', '1', 0, 1, '2022-11-25 12:37:07', '2022-11-25 12:37:07'),
(2617, 'SI-0000560', '2022-11-25', 'C-00002', 16.00, 0.00, 16.00, 0.00, 0.00, NULL, 'Cash', '2022-11-25', '1', 0, 1, '2022-11-25 13:57:39', '2022-11-25 13:57:39'),
(2618, 'SI-0000561', '2022-11-26', 'C-00029', 800.00, 0.00, 800.00, 0.00, 0.00, NULL, 'Cash', '2022-11-26', '1', 0, 1, '2022-11-26 03:46:38', '2022-11-26 03:46:38'),
(2619, 'SI-0000562', '2022-11-27', 'C-00002', 1310.00, 0.00, 1310.00, 0.00, 0.00, NULL, 'Cash', '2022-11-27', '1', 0, 1, '2022-11-27 13:50:04', '2022-11-27 13:50:04'),
(2620, 'SI-0000563', '2022-11-28', 'C-00002', 190.00, 0.00, 190.00, 0.00, 0.00, NULL, 'Cash', '2022-11-28', '1', 0, 1, '2022-11-28 11:19:57', '2022-11-28 11:19:57'),
(2621, 'SI-0000564', '2022-11-28', 'C-00002', 1016.00, 0.00, 1016.00, 0.00, 0.00, NULL, 'Cash', '2022-11-28', '1', 0, 1, '2022-11-28 12:30:28', '2022-11-28 12:30:28'),
(2622, 'SI-0000565', '2022-11-28', 'C-00018', 515.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-28', '1', 0, 1, '2022-11-28 12:54:28', '2022-11-28 12:54:28'),
(2623, 'SI-0000566', '2022-11-28', 'C-00002', 36.00, 0.00, 36.00, 0.00, 0.00, NULL, 'Cash', '2022-11-28', '1', 0, 1, '2022-11-28 14:37:11', '2022-11-28 14:37:11'),
(2624, 'SI-0000567', '2022-11-28', 'C-00002', 70.00, 0.00, 70.00, 0.00, 0.00, NULL, 'Cash', '2022-11-28', '1', 0, 1, '2022-11-28 15:13:28', '2022-11-28 15:13:28'),
(2625, 'SI-0000568', '2022-11-29', 'C-00002', 735.00, 0.00, 735.00, 0.00, 0.00, NULL, 'Cash', '2022-11-29', '1', 0, 1, '2022-11-29 04:13:49', '2022-11-29 04:13:49'),
(2626, 'SI-0000569', '2022-11-25', 'C-00011', 105.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-29', '1', 0, 1, '2022-11-29 04:36:27', '2022-11-29 04:36:27'),
(2627, 'SI-0000570', '2022-11-29', 'C-00002', 1310.00, 0.00, 1310.00, 0.00, 0.00, NULL, 'Cash', '2022-11-29', '1', 0, 1, '2022-11-29 10:55:05', '2022-11-29 10:55:05'),
(2628, 'SI-0000571', '2022-11-29', 'C-00016', 2900.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-29', '1', 0, 1, '2022-11-29 12:11:44', '2022-11-29 12:11:44'),
(2629, 'SI-0000572', '2022-11-29', 'C-00028', 690.00, 10.00, 680.00, 0.00, 0.00, NULL, 'Cash', '2022-11-29', '1', 0, 1, '2022-11-29 13:29:04', '2022-11-29 13:29:04'),
(2630, 'SI-0000573', '2022-11-30', 'C-00002', 200.00, 0.00, 200.00, 0.00, 0.00, NULL, 'Cash', '2022-11-30', '1', 0, 1, '2022-11-30 04:41:46', '2022-11-30 04:41:46'),
(2631, 'SI-0000574', '2022-11-30', 'C-00002', 50.00, 0.00, 50.00, 0.00, 0.00, NULL, 'Cash', '2022-11-30', '1', 0, 1, '2022-11-30 10:56:27', '2022-11-30 10:56:27'),
(2632, 'SI-0000575', '2022-11-30', 'C-00002', 35.20, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-11-30', '1', 0, 1, '2022-11-30 11:43:06', '2022-11-30 11:43:06'),
(2633, 'SI-0000576', '2022-11-30', 'C-00002', 190.00, 0.00, 190.00, 0.00, 0.00, NULL, 'Cash', '2022-11-30', '1', 0, 1, '2022-11-30 13:08:24', '2022-11-30 13:08:24'),
(2634, 'SI-0000577', '2022-11-30', 'C-00011', 1310.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-12-01', '1', 0, 1, '2022-12-01 04:46:57', '2022-12-01 04:46:57'),
(2635, 'SI-0000578', '2022-12-01', 'C-00002', 1321.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-12-01', '1', 0, 1, '2022-12-01 06:11:13', '2022-12-01 06:11:13'),
(2636, 'SI-0000579', '2022-12-01', 'C-00002', 1475.00, 5.00, 1470.00, 0.00, 0.00, NULL, 'Cash', '2022-12-01', '1', 0, 1, '2022-12-01 06:19:31', '2022-12-01 06:19:31'),
(2637, 'SI-0000580', '2022-12-01', 'C-00018', 1050.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-12-01', '1', 0, 1, '2022-12-01 12:52:25', '2022-12-01 12:52:25'),
(2638, 'SI-0000581', '2022-12-02', 'C-00020', 1300.00, 0.00, 1300.00, 0.00, 0.00, NULL, 'Cash', '2022-12-02', '1', 0, 1, '2022-12-02 12:19:39', '2022-12-02 12:19:39'),
(2639, 'SI-0000582', '2022-12-02', 'C-00029', 200.00, 0.00, 200.00, 0.00, 0.00, NULL, 'Cash', '2022-12-02', '1', 0, 1, '2022-12-02 12:20:22', '2022-12-02 12:20:22'),
(2640, 'SI-0000583', '2022-12-02', 'C-00002', 912.00, 2.00, 910.00, 0.00, 0.00, NULL, 'Cash', '2022-12-02', '1', 0, 1, '2022-12-02 12:50:56', '2022-12-02 12:50:56'),
(2641, 'SI-0000584', '2022-12-02', 'C-00010', 2950.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-12-03', '1', 0, 1, '2022-12-03 10:54:19', '2022-12-03 10:54:19'),
(2642, 'SI-0000585', '2022-12-03', 'C-00002', 10240.00, 20.00, 10220.00, 0.00, 0.00, NULL, 'Cash', '2022-12-03', '1', 0, 1, '2022-12-03 10:57:30', '2022-12-03 10:57:30'),
(2643, 'SI-0000586', '2022-12-03', 'C-00002', 50.00, 0.00, 50.00, 0.00, 0.00, NULL, 'Cash', '2022-12-03', '1', 0, 1, '2022-12-03 10:58:47', '2022-12-03 10:58:47'),
(2644, 'SI-0000587', '2022-12-03', 'C-00001', 374.00, 4.00, 370.00, 0.00, 0.00, NULL, 'Cash', '2022-12-03', '1', 0, 1, '2022-12-03 11:05:06', '2022-12-03 11:05:06'),
(2645, 'SI-0000588', '2022-12-03', 'C-00012', 3720.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-12-03', '1', 0, 1, '2022-12-03 13:20:54', '2022-12-03 13:20:54'),
(2646, 'SI-0000589', '2022-12-03', 'C-00002', 358.00, 0.00, 358.00, 0.00, 0.00, NULL, 'Cash', '2022-12-03', '1', 0, 1, '2022-12-03 13:34:46', '2022-12-03 13:34:46'),
(2648, 'SI-0000590', '2022-12-03', 'C-00002', 430.00, 0.00, 430.00, 0.00, 0.00, NULL, 'Cash', '2022-12-03', '1', 0, 1, '2022-12-03 13:49:22', '2022-12-03 13:49:22'),
(2649, 'SI-0000591', '2022-12-03', 'C-00002', 1057.00, 7.00, 1050.00, 0.00, 0.00, NULL, 'Cash', '2022-12-03', '1', 0, 1, '2022-12-03 14:10:56', '2022-12-03 14:10:56'),
(2650, 'SI-0000592', '2022-12-04', 'C-00002', 100.00, 0.00, 100.00, 0.00, 0.00, NULL, 'Cash', '2022-12-04', '1', 0, 1, '2022-12-04 04:53:35', '2022-12-04 04:53:35'),
(2651, 'SI-0000593', '2022-12-04', 'C-00026', 1780.00, 0.00, 1780.00, 0.00, 0.00, NULL, 'Cash', '2022-12-04', '1', 0, 1, '2022-12-04 07:13:52', '2022-12-04 07:13:52'),
(2652, 'SI-0000594', '2022-12-04', 'C-00002', 520.00, 0.00, 500.00, 0.00, 0.00, NULL, 'Cash', '2022-12-05', '1', 0, 1, '2022-12-05 10:33:11', '2022-12-05 10:33:11'),
(2653, 'SI-0000595', '2022-12-05', 'C-00002', 140.00, 0.00, 140.00, 0.00, 0.00, NULL, 'Cash', '2022-12-05', '1', 0, 1, '2022-12-05 10:34:51', '2022-12-05 10:34:51'),
(2654, 'SI-0000596', '2022-12-05', 'C-00002', 130.00, 0.00, 130.00, 0.00, 0.00, NULL, 'Cash', '2022-12-05', '1', 0, 1, '2022-12-05 10:35:39', '2022-12-05 10:35:39'),
(2655, 'SI-0000597', '2022-12-05', 'C-00001', 66.00, 0.00, 66.00, 0.00, 0.00, NULL, 'Cash', '2022-12-05', '1', 0, 1, '2022-12-05 10:36:25', '2022-12-05 10:36:25'),
(2656, 'SI-0000598', '2022-12-05', 'C-00002', 94.00, 0.00, 94.00, 0.00, 0.00, NULL, 'Cash', '2022-12-05', '1', 0, 1, '2022-12-05 10:37:53', '2022-12-05 10:37:53'),
(2657, 'SI-0000599', '2022-12-05', 'C-00002', 580.00, 20.00, 450.00, 0.00, 0.00, NULL, 'Cash', '2022-12-05', '1', 0, 1, '2022-12-05 10:38:57', '2022-12-05 10:38:57'),
(2658, 'SI-0000600', '2022-12-05', 'C-00001', 2860.00, 0.00, 2860.00, 0.00, 0.00, NULL, 'Cash', '2022-12-05', '1', 0, 1, '2022-12-05 12:17:06', '2022-12-05 12:17:06'),
(2660, 'SI-0000602', '2022-12-06', 'C-00002', 100.00, 0.00, 100.00, 0.00, 0.00, NULL, 'Cash', '2022-12-06', '1', 0, 1, '2022-12-06 12:11:47', '2022-12-06 12:11:47'),
(2661, 'SI-0000603', '2022-12-06', 'C-00002', 50.00, 0.00, 50.00, 0.00, 0.00, NULL, 'Cash', '2022-12-06', '1', 0, 1, '2022-12-06 13:02:33', '2022-12-06 13:02:33'),
(2662, 'SI-0000604', '2022-12-06', 'C-00002', 650.00, 0.00, 650.00, 0.00, 0.00, NULL, 'Cash', '2022-12-06', '1', 0, 1, '2022-12-06 13:09:38', '2022-12-06 13:09:38'),
(2663, 'SI-0000605', '2022-12-07', 'C-00027', 580.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-12-07', '1', 0, 1, '2022-12-07 04:35:33', '2022-12-07 04:35:33'),
(2664, 'SI-0000606', '2022-12-07', 'C-00002', 7.00, 0.00, 7.00, 0.00, 0.00, NULL, 'Cash', '2022-12-07', '1', 0, 1, '2022-12-07 04:37:09', '2022-12-07 04:37:09'),
(2665, 'SI-0000607', '2022-12-07', 'C-00010', 1371.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-12-07', '1', 0, 1, '2022-12-07 12:56:03', '2022-12-07 12:56:03'),
(2669, 'SI-0000611', '2022-12-08', 'C-00014', 2000.00, 0.00, 1500.00, 0.00, 0.00, NULL, 'Cash', '2022-12-08', '1', 0, 1, '2022-12-08 13:06:52', '2022-12-08 13:06:52'),
(2679, 'SI-0000612', '2022-12-08', 'C-00002', 150.00, 0.00, 150.00, 0.00, 0.00, NULL, 'Cash', '2022-12-08', '1', 0, 1, '2022-12-08 14:09:25', '2022-12-08 14:09:25'),
(2683, 'SI-0000616', '2022-12-09', 'C-00002', 900.00, 0.00, 900.00, 0.00, 0.00, NULL, 'Cash', '2022-12-09', '1', 0, 1, '2022-12-09 04:57:35', '2022-12-09 04:57:35'),
(2707, 'SI-0000617', '2022-12-10', 'C-00001', 532.00, 0.00, 532.00, 0.00, 0.00, NULL, 'Cash', '2022-12-10', '1', 0, 1, '2022-12-10 06:35:15', '2022-12-10 06:35:15'),
(2708, 'SI-0000618', '2022-12-10', 'C-00001', 532.00, 0.00, 532.00, 0.00, 0.00, NULL, 'Cash', '2022-12-10', '1', 0, 1, '2022-12-10 06:35:20', '2022-12-10 06:35:20'),
(2709, 'SI-0000619', '2022-12-10', 'C-00001', 532.00, 0.00, 532.00, 0.00, 0.00, NULL, 'Cash', '2022-12-10', '1', 0, 1, '2022-12-10 06:35:23', '2022-12-10 06:35:23'),
(2710, 'SI-0000620', '2022-12-10', 'C-00001', 532.00, 0.00, 532.00, 0.00, 0.00, NULL, 'Cash', '2022-12-10', '1', 0, 1, '2022-12-10 06:35:23', '2022-12-10 06:35:23'),
(2711, 'SI-0000621', '2022-12-10', 'C-00001', 532.00, 0.00, 532.00, 0.00, 0.00, NULL, 'Cash', '2022-12-10', '1', 0, 1, '2022-12-10 06:35:24', '2022-12-10 06:35:24'),
(2712, 'SI-0000622', '2022-12-10', 'C-00001', 532.00, 0.00, 532.00, 0.00, 0.00, NULL, 'Cash', '2022-12-10', '1', 0, 1, '2022-12-10 06:35:24', '2022-12-10 06:35:24');
INSERT INTO `sales_ledger` (`id`, `invoice_no`, `invoice_date`, `customer_id`, `total`, `final_discount`, `paid_amount`, `return_amount`, `vat`, `note`, `transaction_type`, `entry_date`, `branch_id`, `status`, `admin_id`, `created_at`, `updated_at`) VALUES
(2713, 'SI-0000623', '2022-12-10', 'C-00002', 418.80, 0.00, 418.80, 0.00, 0.00, NULL, 'Cash', '2022-12-10', '1', 0, 1, '2022-12-10 10:50:28', '2022-12-10 10:50:28'),
(2714, 'SI-0000624', '2022-12-10', 'C-00002', 418.80, 0.00, 418.80, 0.00, 0.00, NULL, 'Cash', '2022-12-10', '1', 0, 1, '2022-12-10 10:50:29', '2022-12-10 10:50:29'),
(2715, 'SI-0000625', '2022-12-10', 'C-00002', 418.80, 0.00, 418.80, 0.00, 0.00, NULL, 'Cash', '2022-12-10', '1', 0, 1, '2022-12-10 10:50:30', '2022-12-10 10:50:30'),
(2716, 'SI-0000626', '2022-12-10', 'C-00002', 418.80, 0.00, 418.80, 0.00, 0.00, NULL, 'Cash', '2022-12-10', '1', 0, 1, '2022-12-10 10:50:30', '2022-12-10 10:50:30'),
(2717, 'SI-0000627', '2022-12-10', 'C-00002', 418.80, 0.00, 418.80, 0.00, 0.00, NULL, 'Cash', '2022-12-10', '1', 0, 1, '2022-12-10 10:50:30', '2022-12-10 10:50:30'),
(2718, 'SI-0000628', '2022-12-10', 'C-00002', 418.80, 0.00, 418.80, 0.00, 0.00, NULL, 'Cash', '2022-12-10', '1', 0, 1, '2022-12-10 10:50:36', '2022-12-10 10:50:36'),
(2719, 'SI-0000629', '2022-12-14', 'C-00028', 2757.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2022-12-14', '1', 0, 1, '2022-12-14 12:36:19', '2022-12-14 12:36:19'),
(2721, 'SI-0000630', '2023-01-01', 'C-00001', 2469.00, 0.00, 0.00, 0.00, 0.00, NULL, 'Cash', '2023-01-01', '1', 0, 1, '2023-01-01 12:12:01', '2023-01-01 12:12:01');

-- --------------------------------------------------------

--
-- Table structure for table `sales_payment`
--

CREATE TABLE `sales_payment` (
  `id` int(10) NOT NULL,
  `invoice_no` varchar(15) DEFAULT NULL,
  `entry_date` varchar(50) DEFAULT NULL,
  `payment_amount` double(11,2) DEFAULT 0.00,
  `return_amount` double(11,2) DEFAULT 0.00,
  `returnpaid` double(11,2) DEFAULT 0.00,
  `discount` double(11,2) DEFAULT 0.00,
  `previous_due` double(11,2) DEFAULT 0.00,
  `customer_id` varchar(20) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `note` tinytext DEFAULT NULL,
  `branch_id` varchar(11) DEFAULT NULL,
  `status` int(2) DEFAULT 0,
  `admin_id` int(11) DEFAULT NULL,
  `transaction_type` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sales_payment`
--

INSERT INTO `sales_payment` (`id`, `invoice_no`, `entry_date`, `payment_amount`, `return_amount`, `returnpaid`, `discount`, `previous_due`, `customer_id`, `payment_type`, `note`, `branch_id`, `status`, `admin_id`, `transaction_type`, `created_at`, `updated_at`) VALUES
(2122, 'SI-0000001', '2022-10-03', 50.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-03 13:19:37', '2022-10-24 05:26:49'),
(2123, 'SI-0000002', '2022-10-03', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-03 13:23:30', '2022-10-24 05:26:49'),
(2124, 'SI-0000003', '2022-10-03', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00012', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-03 13:35:47', '2022-10-24 05:26:49'),
(2126, 'SI-0000004', '2022-10-03', 0.00, 0.00, 0.00, 0.00, 1000.00, 'C-00018', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-03 13:55:45', '2022-10-24 05:26:49'),
(2127, 'SI-0000005', '2022-10-04', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-04 04:37:40', '2022-10-24 05:26:49'),
(2128, 'SI-0000006', '2022-10-04', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-04 04:41:18', '2022-10-24 05:26:49'),
(2129, 'SI-0000007', '2022-10-04', 4250.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-04 11:40:08', '2022-10-24 05:26:49'),
(2130, 'SI-0000008', '2022-10-04', 1725.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-04 12:29:54', '2022-10-24 05:26:49'),
(2131, 'SI-0000009', '2022-10-04', 313.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-04 13:05:29', '2022-10-24 05:26:49'),
(2132, 'SI-0000010', '2022-10-05', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-05 03:38:33', '2022-10-24 05:26:49'),
(2133, 'SI-0000011', '2022-10-05', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-05 03:46:58', '2022-10-24 05:26:49'),
(2134, 'SI-0000012', '2022-10-05', 510.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-05 11:10:01', '2022-10-24 05:26:49'),
(2135, 'SI-0000013', '2022-10-05', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-05 11:59:37', '2022-10-24 05:26:49'),
(2136, 'SI-0000014', '2022-10-05', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00018', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-05 12:46:48', '2022-10-24 05:26:49'),
(2137, 'SI-0000015', '2022-10-06', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-06 04:56:25', '2022-10-24 05:26:49'),
(2138, 'SI-0000016', '2022-10-06', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-06 05:04:09', '2022-10-24 05:26:49'),
(2139, 'SI-0000017', '2022-10-06', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-06 12:35:21', '2022-10-24 05:26:49'),
(2140, 'SI-0000018', '2022-10-06', 500.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-06 12:46:23', '2022-10-24 05:26:49'),
(2141, 'SI-0000019', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 04:24:28', '2022-10-24 05:26:49'),
(2142, 'SI-0000020', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00006', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:10:20', '2022-10-24 05:26:49'),
(2143, 'SI-0000021', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00009', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:11:54', '2022-10-24 05:26:49'),
(2144, 'SI-0000022', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:13:16', '2022-10-24 05:26:49'),
(2145, 'SI-0000023', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00008', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:14:57', '2022-10-24 05:26:49'),
(2146, 'SI-0000024', '2022-10-07', 1000.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:17:13', '2022-10-24 05:26:49'),
(2147, 'SI-0000025', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:18:29', '2022-10-24 05:26:49'),
(2148, 'SI-0000026', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00009', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:19:34', '2022-10-24 05:26:49'),
(2149, 'SI-0000027', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:21:15', '2022-10-24 05:26:49'),
(2150, 'SI-0000028', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00011', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:22:21', '2022-10-24 05:26:49'),
(2151, 'SI-0000029', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00009', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:26:44', '2022-10-24 05:26:49'),
(2152, 'SI-0000030', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00009', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:28:14', '2022-10-24 05:26:49'),
(2153, 'SI-0000031', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:31:01', '2022-10-24 05:26:49'),
(2154, 'SI-0000032', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00005', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:34:15', '2022-10-24 05:26:49'),
(2155, 'SI-0000033', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00005', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:35:51', '2022-10-24 05:26:49'),
(2156, 'SI-0000034', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:37:56', '2022-10-24 05:26:49'),
(2157, 'SI-0000035', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00014', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:39:12', '2022-10-24 05:26:49'),
(2158, 'SI-0000036', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00009', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:41:58', '2022-10-24 05:26:49'),
(2159, 'SI-0000037', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:43:02', '2022-10-24 05:26:49'),
(2160, 'SI-0000038', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:43:53', '2022-10-24 05:26:49'),
(2161, 'SI-0000039', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:44:51', '2022-10-24 05:26:49'),
(2162, 'SI-0000040', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:46:10', '2022-10-24 05:26:49'),
(2163, 'SI-0000041', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:47:39', '2022-10-24 05:26:49'),
(2164, 'SI-0000042', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:48:18', '2022-10-24 05:26:49'),
(2165, 'SI-0000043', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:48:55', '2022-10-24 05:26:49'),
(2166, 'SI-0000044', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:50:37', '2022-10-24 05:26:49'),
(2167, 'SI-0000045', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:51:23', '2022-10-24 05:26:49'),
(2168, 'SI-0000046', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00014', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:52:23', '2022-10-24 05:26:49'),
(2169, 'SI-0000047', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:54:29', '2022-10-24 05:26:49'),
(2170, 'SI-0000048', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:56:33', '2022-10-24 05:26:49'),
(2171, 'SI-0000049', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 05:58:24', '2022-10-24 05:26:49'),
(2172, 'SI-0000050', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00006', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 06:01:37', '2022-10-24 05:26:49'),
(2173, 'SI-0000051', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 06:02:51', '2022-10-24 05:26:49'),
(2174, 'SI-0000052', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00009', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 06:03:47', '2022-10-24 05:26:49'),
(2175, 'SI-0000053', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 06:05:54', '2022-10-24 05:26:49'),
(2176, 'SI-0000054', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 06:06:33', '2022-10-24 05:26:49'),
(2177, 'SI-0000055', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 06:07:33', '2022-10-24 05:26:49'),
(2178, 'SI-0000056', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00009', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 06:08:47', '2022-10-24 05:26:49'),
(2179, 'SI-0000057', '2022-10-07', 1200.00, 0.00, 0.00, 0.00, 0.00, 'C-00013', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 06:10:56', '2022-10-24 05:26:49'),
(2180, 'SI-0000058', '2022-10-07', 24.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 06:11:47', '2022-10-24 05:26:49'),
(2181, 'SI-0000059', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00008', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 06:12:30', '2022-10-24 05:26:49'),
(2182, 'SI-0000060', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 06:13:21', '2022-10-24 05:26:49'),
(2183, 'SI-0000061', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 06:16:37', '2022-10-24 05:26:49'),
(2184, 'SI-0000062', '2022-10-07', 50.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 06:39:07', '2022-10-24 05:26:49'),
(2185, 'SI-0000063', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00008', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 06:39:57', '2022-10-24 05:26:49'),
(2186, 'SI-0000064', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00006', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 06:42:30', '2022-10-24 05:26:49'),
(2187, 'SI-0000065', '2022-10-07', 50.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 06:43:43', '2022-10-24 05:26:49'),
(2188, 'SI-0000066', '2022-10-07', 50.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 06:44:34', '2022-10-24 05:26:49'),
(2189, 'SI-0000067', '2022-10-07', 90.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 06:45:55', '2022-10-24 05:26:49'),
(2190, 'SI-0000068', '2022-10-07', 1500.00, 0.00, 0.00, 0.00, 0.00, 'C-00014', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 06:47:59', '2022-10-24 05:26:49'),
(2191, 'SI-0000069', '2022-10-07', 50.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 06:49:05', '2022-10-24 05:26:49'),
(2192, 'SI-0000070', '2022-10-07', 16.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 06:49:46', '2022-10-24 05:26:49'),
(2193, 'SI-0000071', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00008', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 06:51:27', '2022-10-24 05:26:49'),
(2194, 'SI-0000072', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 06:53:43', '2022-10-24 05:26:49'),
(2195, 'SI-0000073', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 09:47:34', '2022-10-24 05:26:49'),
(2196, 'SI-0000074', '2022-10-07', 700.00, 0.00, 0.00, 0.00, 0.00, 'C-00014', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 09:49:21', '2022-10-24 05:26:49'),
(2197, 'SI-0000075', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 09:54:18', '2022-10-24 05:26:49'),
(2198, 'SI-0000076', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 09:57:04', '2022-10-24 05:26:49'),
(2199, 'SI-0000077', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00009', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 10:03:22', '2022-10-24 05:26:49'),
(2200, 'SI-0000078', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 10:06:40', '2022-10-24 05:26:49'),
(2201, 'SI-0000079', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00013', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 10:09:42', '2022-10-24 05:26:49'),
(2202, 'SI-0000080', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 10:11:52', '2022-10-24 05:26:49'),
(2203, 'SI-0000081', '2022-10-07', 35.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 10:13:23', '2022-10-24 05:26:49'),
(2204, 'SI-0000082', '2022-10-07', 50.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 10:16:15', '2022-10-24 05:26:49'),
(2205, 'SI-0000083', '2022-10-07', 3.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 10:17:26', '2022-10-24 05:26:49'),
(2206, 'SI-0000084', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 10:20:30', '2022-10-24 05:26:49'),
(2207, 'SI-0000085', '2022-10-07', 50.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 10:23:02', '2022-10-24 05:26:49'),
(2208, 'SI-0000086', '2022-10-07', 50.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 10:27:41', '2022-10-24 05:26:49'),
(2209, 'SI-0000087', '2022-10-07', 390.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 10:29:01', '2022-10-24 05:26:49'),
(2210, 'SI-0000088', '2022-10-07', 345.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 10:32:12', '2022-10-24 05:26:49'),
(2211, 'SI-0000089', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00008', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 10:34:55', '2022-10-24 05:26:49'),
(2212, 'SI-0000090', '2022-10-07', 76.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 10:37:18', '2022-10-24 05:26:49'),
(2213, 'SI-0000091', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 10:40:23', '2022-10-24 05:26:49'),
(2214, 'SI-0000092', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00009', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 10:43:04', '2022-10-24 05:26:49'),
(2215, 'SI-0000093', '2022-10-07', 249.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 10:46:02', '2022-10-24 05:26:49'),
(2216, 'SI-0000094', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 10:50:05', '2022-10-24 05:26:49'),
(2217, 'SI-0000095', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 10:51:10', '2022-10-24 05:26:49'),
(2218, 'SI-0000096', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00014', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 10:53:28', '2022-10-24 05:26:49'),
(2219, 'SI-0000097', '2022-10-07', 220.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 10:57:14', '2022-10-24 05:26:49'),
(2220, 'SI-0000098', '2022-10-07', 500.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 11:01:24', '2022-10-24 05:26:49'),
(2221, 'SI-0000099', '2022-10-07', 295.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 11:02:53', '2022-10-24 05:26:49'),
(2222, 'SI-0000100', '2022-10-07', 230.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 11:05:39', '2022-10-24 05:26:49'),
(2223, 'SI-0000101', '2022-10-07', 870.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 11:56:29', '2022-10-24 05:26:49'),
(2224, 'SI-0000102', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00008', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 11:59:20', '2022-10-24 05:26:49'),
(2225, 'SI-0000103', '2022-10-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 12:00:29', '2022-10-24 05:26:49'),
(2226, 'SI-0000104', '2022-10-07', 60.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 12:03:09', '2022-10-24 05:26:49'),
(2227, 'SI-0000105', '2022-10-07', 10.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 12:04:53', '2022-10-24 05:26:49'),
(2228, 'SI-0000106', '2022-10-07', 410.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 12:06:36', '2022-10-24 05:26:49'),
(2229, 'SI-0000107', '2022-10-07', 50.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 12:20:32', '2022-10-24 05:26:49'),
(2230, 'SI-0000108', '2022-10-07', 2000.00, 0.00, 0.00, 0.00, 0.00, 'C-00018', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-07 13:27:20', '2022-10-24 05:26:49'),
(2231, 'SI-0000109', '2022-10-08', 1000.00, 0.00, 0.00, 0.00, 0.00, 'C-00020', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 05:17:37', '2022-10-24 05:26:49'),
(2232, 'SI-0000110', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 05:21:39', '2022-10-24 05:26:49'),
(2233, 'SI-0000111', '2022-10-08', 50.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 05:28:46', '2022-10-24 05:26:49'),
(2234, 'SI-0000112', '2022-10-08', 150.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 05:45:35', '2022-10-24 05:26:49'),
(2235, 'SI-0000113', '2022-10-08', 20.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 06:27:31', '2022-10-24 05:26:49'),
(2236, 'SI-0000114', '2022-10-08', 145.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 06:29:36', '2022-10-24 05:26:49'),
(2237, 'SI-0000115', '2022-10-08', 125.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 06:32:35', '2022-10-24 05:26:49'),
(2238, 'SI-0000116', '2022-10-08', 115.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 06:46:08', '2022-10-24 05:26:49'),
(2239, 'SI-0000117', '2022-10-08', 15000.00, 0.00, 0.00, 0.00, 0.00, 'C-00014', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 06:52:20', '2022-10-24 05:26:49'),
(2240, 'SI-0000118', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00008', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 06:53:42', '2022-10-24 05:26:49'),
(2241, 'SI-0000119', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 06:54:41', '2022-10-24 05:26:49'),
(2242, 'SI-0000120', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 06:55:52', '2022-10-24 05:26:49'),
(2243, 'SI-0000121', '2022-10-08', 550.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 06:57:35', '2022-10-24 05:26:49'),
(2244, 'SI-0000122', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00011', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 06:58:39', '2022-10-24 05:26:49'),
(2245, 'SI-0000123', '2022-10-08', 350.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 07:02:04', '2022-10-24 05:26:49'),
(2246, 'SI-0000124', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00006', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 07:03:02', '2022-10-24 05:26:49'),
(2247, 'SI-0000125', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 07:07:12', '2022-10-24 05:26:49'),
(2248, 'SI-0000126', '2022-10-08', 920.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 07:10:17', '2022-10-24 05:26:49'),
(2249, 'SI-0000127', '2022-10-08', 10.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 07:14:40', '2022-10-24 05:26:49'),
(2250, 'SI-0000128', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00008', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 07:25:11', '2022-10-24 05:26:49'),
(2251, 'SI-0000129', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 07:26:28', '2022-10-24 05:26:49'),
(2252, 'SI-0000130', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 10:16:13', '2022-10-24 05:26:49'),
(2253, 'SI-0000131', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00009', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 10:18:55', '2022-10-24 05:26:49'),
(2254, 'SI-0000132', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00006', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 10:20:45', '2022-10-24 05:26:49'),
(2255, 'SI-0000133', '2022-10-08', 252.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 10:24:24', '2022-10-24 05:26:49'),
(2256, 'SI-0000134', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00014', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 10:28:00', '2022-10-24 05:26:49'),
(2257, 'SI-0000135', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00009', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 10:30:19', '2022-10-24 05:26:49'),
(2258, 'SI-0000136', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00009', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 10:32:09', '2022-10-24 05:26:49'),
(2259, 'SI-0000137', '2022-10-08', 687.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 10:36:15', '2022-10-24 05:26:49'),
(2260, 'SI-0000138', '2022-10-08', 15.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 10:37:48', '2022-10-24 05:26:49'),
(2261, 'SI-0000139', '2022-10-08', 92.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 10:41:03', '2022-10-24 05:26:49'),
(2262, 'SI-0000140', '2022-10-08', 50.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 10:42:09', '2022-10-24 05:26:49'),
(2263, 'SI-0000141', '2022-10-08', 1500.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 10:48:06', '2022-10-24 05:26:49'),
(2264, 'SI-0000142', '2022-10-08', 54.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 10:49:27', '2022-10-24 05:26:49'),
(2265, 'SI-0000143', '2022-10-08', 54.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 10:51:06', '2022-10-24 05:26:49'),
(2266, 'SINV-144', '2022-10-08', 60500.00, 0.00, 0.00, 0.00, 0.00, 'C-00016', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 10:57:39', '2022-10-24 05:26:49'),
(2267, 'SI-0000145', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00008', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 10:59:43', '2022-10-24 05:26:49'),
(2268, 'SI-0000146', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:01:28', '2022-10-24 05:26:49'),
(2269, 'SI-0000147', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00006', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:07:52', '2022-10-24 05:26:49'),
(2270, 'SI-0000148', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00011', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:09:36', '2022-10-24 05:26:49'),
(2271, 'SI-0000149', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00006', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:11:12', '2022-10-24 05:26:49'),
(2272, 'SI-0000150', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00009', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:13:34', '2022-10-24 05:26:49'),
(2273, 'SI-0000151', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00011', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:15:21', '2022-10-24 05:26:49'),
(2274, 'SI-0000152', '2022-10-08', 645.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:20:38', '2022-10-24 05:26:49'),
(2275, 'SI-0000153', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:23:58', '2022-10-24 05:26:49'),
(2276, 'SI-0000154', '2022-10-08', 282.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:25:48', '2022-10-24 05:26:49'),
(2277, 'SI-0000155', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00006', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:27:21', '2022-10-24 05:26:49'),
(2278, 'SI-0000156', '2022-10-08', 112.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:29:50', '2022-10-24 05:26:49'),
(2279, 'SI-0000157', '2022-10-08', 406.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:32:14', '2022-10-24 05:26:49'),
(2280, 'SI-0000158', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00006', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:34:12', '2022-10-24 05:26:49'),
(2281, 'SI-0000159', '2022-10-08', 620.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:36:01', '2022-10-24 05:26:49'),
(2282, 'SI-0000160', '2022-10-08', 300.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:37:05', '2022-10-24 05:26:49'),
(2283, 'SI-0000161', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:38:13', '2022-10-24 05:26:49'),
(2284, 'SI-0000162', '2022-10-08', 47.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:39:48', '2022-10-24 05:26:49'),
(2285, 'SI-0000163', '2022-10-08', 50.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:40:50', '2022-10-24 05:26:49'),
(2286, 'SI-0000164', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:42:14', '2022-10-24 05:26:49'),
(2287, 'SI-0000165', '2022-10-08', 200.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:43:49', '2022-10-24 05:26:49'),
(2288, 'SI-0000166', '2022-10-08', 379.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:46:36', '2022-10-24 05:26:49'),
(2289, 'SI-0000167', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:48:30', '2022-10-24 05:26:49'),
(2290, 'SI-0000168', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:49:39', '2022-10-24 05:26:49'),
(2291, 'SI-0000169', '2022-10-08', 336.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:51:40', '2022-10-24 05:26:49'),
(2292, 'SI-0000170', '2022-10-08', 553.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 11:56:08', '2022-10-24 05:26:49'),
(2293, 'SI-0000171', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00009', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 12:25:22', '2022-10-24 05:26:49'),
(2294, 'SI-0000172', '2022-10-08', 50.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 12:26:55', '2022-10-24 05:26:49'),
(2295, 'SI-0000173', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00014', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 12:28:31', '2022-10-24 05:26:49'),
(2296, 'SI-0000174', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00008', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 12:31:22', '2022-10-24 05:26:49'),
(2297, 'SI-0000175', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 12:33:03', '2022-10-24 05:26:49'),
(2298, 'SI-0000176', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00006', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 12:38:13', '2022-10-24 05:26:49'),
(2299, 'SI-0000177', '2022-10-08', 100.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 12:39:32', '2022-10-24 05:26:49'),
(2300, 'SI-0000178', '2022-10-08', 100.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 12:41:32', '2022-10-24 05:26:49'),
(2301, 'SI-0000179', '2022-10-08', 560.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 12:43:00', '2022-10-24 05:26:49'),
(2302, 'SI-0000180', '2022-10-08', 693.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 12:44:49', '2022-10-24 05:26:49'),
(2303, 'SI-0000181', '2022-10-08', 220.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 12:46:37', '2022-10-24 05:26:49'),
(2304, 'SI-0000182', '2022-10-08', 175.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 12:47:47', '2022-10-24 05:26:49'),
(2305, 'SI-0000183', '2022-10-08', 195.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 12:50:10', '2022-10-24 05:26:49'),
(2306, 'SI-0000184', '2022-10-08', 290.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 12:51:24', '2022-10-24 05:26:49'),
(2307, 'SI-0000185', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 13:06:35', '2022-10-24 05:26:49'),
(2308, 'SI-0000186', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 13:15:02', '2022-10-24 05:26:49'),
(2309, 'SI-0000187', '2022-10-08', 500.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 13:16:01', '2022-10-24 05:26:49'),
(2310, 'SI-0000188', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00011', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 13:18:51', '2022-10-24 05:26:49'),
(2311, 'SI-0000189', '2022-10-08', 220.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 13:21:00', '2022-10-24 05:26:49'),
(2312, 'SI-0000190', '2022-10-08', 260.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 13:22:08', '2022-10-24 05:26:49'),
(2313, 'SI-0000191', '2022-10-08', 430.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 13:23:37', '2022-10-24 05:26:49'),
(2314, 'SI-0000192', '2022-10-08', 200.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 13:24:47', '2022-10-24 05:26:49'),
(2315, 'SI-0000193', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 13:33:29', '2022-10-24 05:26:49'),
(2316, 'SI-0000194', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 13:39:53', '2022-10-24 05:26:49'),
(2317, 'SI-0000195', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 14:04:07', '2022-10-24 05:26:49'),
(2318, 'SI-0000196', '2022-10-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-08 14:07:34', '2022-10-24 05:26:49'),
(2319, 'SI-0000197', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00014', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 04:38:15', '2022-10-24 05:26:49'),
(2320, 'SI-0000198', '2022-10-09', 370.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 04:59:17', '2022-10-24 05:26:49'),
(2321, 'SI-0000199', '2022-10-09', 1200.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 05:02:14', '2022-10-24 05:26:49'),
(2322, 'SI-0000200', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 05:14:27', '2022-10-24 05:26:49'),
(2323, 'SI-0000201', '2022-10-09', 550.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 05:18:37', '2022-10-24 05:26:49'),
(2324, 'SI-0000202', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 05:19:27', '2022-10-24 05:26:49'),
(2325, 'SI-0000203', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 05:20:41', '2022-10-24 05:26:49'),
(2326, 'SI-0000204', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 05:21:57', '2022-10-24 05:26:49'),
(2327, 'SI-0000205', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00008', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 05:23:54', '2022-10-24 05:26:49'),
(2328, 'SI-0000206', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00012', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 05:25:19', '2022-10-24 05:26:49'),
(2329, 'SI-0000207', '2022-10-09', 14.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 05:37:38', '2022-10-24 05:26:49'),
(2330, 'SI-0000208', '2022-10-09', 1385.50, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 05:45:44', '2022-10-24 05:26:49'),
(2331, 'SI-0000209', '2022-10-09', 500.00, 0.00, 0.00, 0.00, 0.00, 'C-00017', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 05:48:17', '2022-10-24 05:26:49'),
(2332, 'SI-0000210', '2022-10-09', 1490.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 05:52:13', '2022-10-24 05:26:49'),
(2333, 'SI-0000211', '2022-10-09', 1026.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 06:26:15', '2022-10-24 05:26:49'),
(2334, 'SI-0000212', '2022-10-09', 850.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 11:06:43', '2022-10-24 05:26:49'),
(2335, 'SI-0000213', '2022-10-09', 1150.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 11:08:19', '2022-10-24 05:26:49'),
(2336, 'SI-0000214', '2022-10-09', 1649.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 11:10:17', '2022-10-24 05:26:49'),
(2337, 'SI-0000215', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00018', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 11:12:26', '2022-10-24 05:26:49'),
(2338, 'SI-0000216', '2022-10-09', 483.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 11:14:40', '2022-10-24 05:26:49'),
(2339, 'SI-0000217', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 11:15:57', '2022-10-24 05:26:49'),
(2340, 'SI-0000218', '2022-10-09', 765.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 11:18:45', '2022-10-24 05:26:49'),
(2341, 'SI-0000219', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 11:20:21', '2022-10-24 05:26:49'),
(2342, 'SI-0000220', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00012', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 11:21:37', '2022-10-24 05:26:49'),
(2343, 'SI-0000221', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00011', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 11:22:06', '2022-10-24 05:26:49'),
(2344, 'SI-0000222', '2022-10-09', 1964.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 11:25:47', '2022-10-24 05:26:49'),
(2345, 'SI-0000223', '2022-10-09', 4250.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 11:27:39', '2022-10-24 05:26:49'),
(2346, 'SI-0000224', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00011', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 11:29:35', '2022-10-24 05:26:49'),
(2347, 'SI-0000225', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00011', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 11:39:31', '2022-10-24 05:26:49'),
(2348, 'SI-0000226', '2022-10-09', 294.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 12:29:06', '2022-10-24 05:26:49'),
(2349, 'SI-0000227', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00012', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 12:38:23', '2022-10-24 05:26:49'),
(2351, 'SI-0000229', '2022-10-09', 510.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 12:47:14', '2022-10-24 05:26:49'),
(2352, 'SI-0000230', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00018', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 12:49:31', '2022-10-24 05:26:49'),
(2353, 'SI-0000231', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 12:51:21', '2022-10-24 05:26:49'),
(2354, 'SI-0000232', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 12:52:21', '2022-10-24 05:26:49'),
(2355, 'SI-0000233', '2022-10-09', 2700.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 12:53:24', '2022-10-24 05:26:49'),
(2356, 'SI-0000234', '2022-10-09', 1250.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 12:54:06', '2022-10-24 05:26:49'),
(2357, 'SI-0000235', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00018', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 12:56:31', '2022-10-24 05:26:49'),
(2358, 'SI-0000236', '2022-10-09', 1000.00, 0.00, 0.00, 0.00, 0.00, 'C-00018', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 12:59:37', '2022-10-24 05:26:49'),
(2359, 'SI-0000237', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 13:04:02', '2022-10-24 05:26:49'),
(2360, 'SI-0000238', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00018', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 13:08:14', '2022-10-24 05:26:49'),
(2361, 'SI-0000239', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 13:10:34', '2022-10-24 05:26:49'),
(2362, 'SI-0000240', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00012', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 13:11:40', '2022-10-24 05:26:49'),
(2364, 'SI-0000242', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 13:50:15', '2022-10-24 05:26:49'),
(2365, 'SI-0000243', '2022-10-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00012', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 13:51:58', '2022-10-24 05:26:49'),
(2366, 'SI-0000244', '2022-10-09', 7.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-09 14:01:33', '2022-10-24 05:26:49'),
(2367, 'SI-0000245', '2022-10-10', 2000.00, 0.00, 0.00, 0.00, 0.00, 'C-00018', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-10 04:35:28', '2022-10-24 05:26:49'),
(2368, 'SI-0000246', '2022-10-10', 39.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-10 11:29:14', '2022-10-24 05:26:49'),
(2372, 'SI-0000247', '2022-10-11', 840.00, 0.00, 0.00, 0.00, 0.00, 'C-00001', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-11 05:27:30', '2022-10-24 05:26:49'),
(2374, 'SI-0000249', '2022-10-12', 90.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-12 13:24:24', '2022-10-24 05:26:49'),
(2375, 'SI-0000250', '2022-10-12', 18.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-12 13:59:02', '2022-10-24 05:26:49'),
(2376, 'SI-0000251', '2022-10-13', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00020', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-13 05:17:15', '2022-10-24 05:26:49'),
(2377, 'SI-0000252', '2022-10-13', 16.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-13 11:16:26', '2022-10-24 05:26:49'),
(2378, 'SI-0000253', '2022-10-13', 72.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-13 12:20:13', '2022-10-24 05:26:49'),
(2379, 'SI-0000254', '2022-10-13', 20.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-13 13:46:38', '2022-10-24 05:26:49'),
(2380, 'SI-0000255', '2022-10-13', 410.00, 0.00, 0.00, 0.00, 0.00, 'C-00001', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-13 14:18:45', '2022-10-24 05:26:49'),
(2381, 'SI-0000256', '2022-10-14', 120.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-14 04:08:54', '2022-10-24 05:26:49'),
(2382, 'SI-0000257', '2022-10-14', 20.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-14 04:12:35', '2022-10-24 05:26:49'),
(2383, 'SI-0000258', '2022-10-14', 50.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-14 11:39:13', '2022-10-24 05:26:49'),
(2384, 'SI-0000259', '2022-10-14', 420.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-14 12:42:47', '2022-10-24 05:26:49'),
(2385, 'SI-0000260', '2022-10-15', 875.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-15 03:55:54', '2022-10-24 05:26:49'),
(2386, 'SI-0000261', '2022-10-15', 76.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-15 06:24:50', '2022-10-24 05:26:49'),
(2387, 'SI-0000262', '2022-10-15', 1450.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-15 12:43:07', '2022-10-24 05:26:49'),
(2388, 'SI-0000263', '2022-10-15', 287.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-15 12:51:05', '2022-10-24 05:26:49'),
(2389, 'SI-0000264', '2022-10-15', 410.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-15 14:10:57', '2022-10-24 05:26:49'),
(2390, 'SI-0000265', '2022-10-16', 33.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-16 04:57:42', '2022-10-24 05:26:49'),
(2391, 'SI-0000266', '2022-10-16', 60.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-16 05:23:07', '2022-10-24 05:26:49'),
(2393, NULL, '2022-09-11', 15000.00, 0.00, 0.00, NULL, 0.00, 'C-00006', 'Cash', NULL, '1', 0, 1, 'DueCollection', '2022-10-18 13:06:39', '2022-11-06 06:18:26'),
(2394, NULL, '2022-09-27', 50000.00, 0.00, 0.00, NULL, 0.00, 'C-00006', 'Cash', NULL, '1', 0, 1, 'DueCollection', '2022-10-18 13:06:46', '2022-11-06 06:18:30'),
(2395, 'SI-0000267', '2022-10-22', 1250.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-22 13:25:01', '2022-10-26 09:09:34'),
(2396, 'SI-0000268', '2022-10-22', 510.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-22 13:25:57', '2022-10-26 09:09:34'),
(2397, 'SI-0000269', '2022-10-22', 15.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-22 13:30:49', '2022-10-26 09:09:34'),
(2398, 'SI-0000270', '2022-10-22', 265.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-22 13:39:21', '2022-10-26 09:09:34'),
(2399, 'SI-0000271', '2022-10-22', 500.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-22 13:40:11', '2022-10-26 09:09:34'),
(2400, 'SI-0000272', '2022-10-22', 651.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-22 13:44:29', '2022-10-26 09:09:34'),
(2401, 'SI-0000273', '2022-10-22', 200.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-22 14:00:19', '2022-10-26 09:09:34'),
(2402, 'SI-0000274', '2022-10-22', 1000.00, 0.00, 0.00, 0.00, 0.00, 'C-00020', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-22 14:11:37', '2022-10-26 09:09:34'),
(2403, 'SI-0000275', '2022-10-22', 50.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-22 14:22:31', '2022-10-26 09:09:34'),
(2405, 'SI-0000277', '2022-10-22', 150.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-22 14:23:18', '2022-10-26 09:09:34'),
(2406, 'SI-0000278', '2022-10-22', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-22 14:25:06', '2022-10-26 09:09:34'),
(2408, 'SI-0000279', '2022-10-22', 40.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-22 14:33:57', '2022-10-26 09:09:34'),
(2409, 'SI-0000280', '2022-10-22', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00001', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-22 15:43:58', '2022-10-26 09:09:34'),
(2410, 'SI-0000281', '2022-10-27', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 13:08:40', '2022-10-27 13:08:40'),
(2411, 'SI-0000282', '2022-10-27', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00012', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 13:10:10', '2022-10-27 13:10:10'),
(2413, 'SI-0000284', '2022-10-27', 39.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 13:19:21', '2022-10-27 13:19:21'),
(2414, 'SI-0000285', '2022-10-27', 7.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 13:20:57', '2022-10-27 13:20:57'),
(2415, 'SI-0000286', '2022-10-27', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00018', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 13:43:07', '2022-10-27 13:43:07'),
(2416, 'SI-0000287', '2022-10-27', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00006', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 13:43:53', '2022-10-27 13:43:53'),
(2417, 'SI-0000288', '2022-10-27', 910.40, 0.00, 0.00, 0.00, 0.00, 'C-00022', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 13:48:57', '2022-10-27 13:48:57'),
(2418, 'SI-0000289', '2022-10-27', 840.00, 0.00, 0.00, 0.00, 0.00, 'C-00001', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 14:00:51', '2022-10-27 14:00:51'),
(2419, 'SI-0000290', '2022-10-27', 2000.00, 0.00, 0.00, 0.00, 0.00, 'C-00023', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 14:06:52', '2022-10-27 14:06:52'),
(2420, 'SI-0000291', '2022-10-27', 890.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 14:08:14', '2022-10-27 14:08:14'),
(2421, 'SI-0000292', '2022-10-27', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00018', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 14:12:53', '2022-10-27 14:12:53'),
(2422, 'SI-0000293', '2022-10-27', 69.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 14:14:04', '2022-10-27 14:14:04'),
(2423, 'SI-0000294', '2022-10-27', 350.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 14:15:29', '2022-10-27 14:15:29'),
(2424, 'SI-0000295', '2022-10-27', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00008', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 14:27:23', '2022-10-27 14:27:23'),
(2425, 'SI-0000296', '2022-10-27', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 14:28:35', '2022-10-27 14:28:35'),
(2426, 'SI-0000297', '2022-10-27', 90.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 14:29:28', '2022-10-27 14:29:28'),
(2427, 'SI-0000298', '2022-10-27', 18.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 14:30:17', '2022-10-27 14:30:17'),
(2428, 'SI-0000299', '2022-10-27', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00020', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 14:31:10', '2022-10-27 14:31:10'),
(2429, 'SI-0000300', '2022-10-27', 518.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 14:33:35', '2022-10-27 14:33:35'),
(2430, 'SI-0000301', '2022-10-27', 182.20, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 14:35:05', '2022-10-27 14:35:05'),
(2431, 'SI-0000302', '2022-10-27', 420.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 14:36:51', '2022-10-27 14:36:51'),
(2432, 'SI-0000303', '2022-10-27', 875.00, 0.00, 0.00, 0.00, 0.00, 'C-00024', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 14:40:34', '2022-10-27 14:40:34'),
(2433, 'SI-0000304', '2022-10-27', 1100.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 14:41:14', '2022-10-27 14:41:14'),
(2434, 'SI-0000305', '2022-10-27', 621.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 14:42:23', '2022-10-27 14:42:23'),
(2435, 'SI-0000306', '2022-10-27', 736.00, 0.00, 0.00, 0.00, 0.00, 'C-00022', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 14:49:22', '2022-10-27 14:49:22'),
(2436, 'SI-0000307', '2022-10-27', 115.00, 0.00, 0.00, 0.00, 0.00, 'C-00001', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 14:51:07', '2022-10-27 14:51:07'),
(2437, 'SI-0000308', '2022-10-27', 2700.00, 0.00, 0.00, 0.00, 0.00, 'C-00023', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 14:52:17', '2022-10-27 14:52:17');
INSERT INTO `sales_payment` (`id`, `invoice_no`, `entry_date`, `payment_amount`, `return_amount`, `returnpaid`, `discount`, `previous_due`, `customer_id`, `payment_type`, `note`, `branch_id`, `status`, `admin_id`, `transaction_type`, `created_at`, `updated_at`) VALUES
(2438, 'SI-0000309', '2022-10-27', 420.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 14:53:21', '2022-10-27 14:53:21'),
(2439, 'SI-0000310', '2022-10-27', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 14:54:24', '2022-10-27 14:54:24'),
(2440, 'SI-0000311', '2022-10-27', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00012', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 14:56:36', '2022-10-27 14:56:36'),
(2441, 'SI-0000312', '2022-10-27', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00008', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 14:59:18', '2022-10-27 14:59:18'),
(2442, 'SI-0000313', '2022-10-27', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 15:03:04', '2022-10-27 15:03:04'),
(2443, 'SI-0000314', '2022-10-27', 115.00, 0.00, 0.00, 0.00, 0.00, 'C-00020', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 15:04:08', '2022-10-27 15:04:08'),
(2444, 'SI-0000315', '2022-10-27', 26010.00, 0.00, 0.00, 0.00, 0.00, 'C-00009', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 15:06:22', '2022-10-27 15:06:22'),
(2445, 'SI-0000316', '2022-10-27', 35.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 15:06:55', '2022-10-27 15:06:55'),
(2446, 'SI-0000317', '2022-10-27', 81.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 15:08:00', '2022-10-27 15:08:00'),
(2447, 'SI-0000318', '2022-10-27', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00011', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 15:09:30', '2022-10-27 15:09:30'),
(2448, 'SI-0000319', '2022-10-27', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00012', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 15:10:15', '2022-10-27 15:10:15'),
(2449, 'SI-0000320', '2022-10-27', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-27 15:10:57', '2022-10-27 15:10:57'),
(2450, 'SI-0000321', '2022-10-28', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00022', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 11:12:44', '2022-10-28 11:12:44'),
(2451, 'SI-0000322', '2022-10-28', 4600.00, 0.00, 0.00, 0.00, 0.00, 'C-00025', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 12:05:16', '2022-10-28 12:05:16'),
(2452, 'SI-0000323', '2022-10-28', 850.00, 0.00, 0.00, 0.00, 0.00, 'C-00020', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 12:07:47', '2022-10-28 12:07:47'),
(2453, 'SI-0000324', '2022-10-28', 131.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 12:26:26', '2022-10-28 12:26:26'),
(2454, 'SI-0000325', '2022-10-28', 8.80, 0.00, 0.00, 0.00, 0.00, 'C-00001', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 12:27:49', '2022-10-28 12:27:49'),
(2455, 'SI-0000326', '2022-10-28', 395.00, 0.00, 0.00, 0.00, 0.00, 'C-00022', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 12:29:15', '2022-10-28 12:29:15'),
(2456, 'SI-0000327', '2022-10-28', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00018', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 12:30:48', '2022-10-28 12:30:48'),
(2457, 'SI-0000328', '2022-10-28', 110.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 12:32:54', '2022-10-28 12:32:54'),
(2458, 'SI-0000329', '2022-10-28', 150.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 12:33:51', '2022-10-28 12:33:51'),
(2459, 'SI-0000330', '2022-10-28', 310.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 12:35:17', '2022-10-28 12:35:17'),
(2460, 'SI-0000331', '2022-10-28', 305.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 12:36:43', '2022-10-28 12:36:43'),
(2461, 'SI-0000332', '2022-10-28', 290.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 12:38:58', '2022-10-28 12:38:58'),
(2462, 'SI-0000333', '2022-10-28', 318.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 12:40:36', '2022-10-28 12:40:36'),
(2463, 'SI-0000334', '2022-10-28', 187.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 12:55:45', '2022-10-28 12:55:45'),
(2464, 'SI-0000335', '2022-10-28', 170.00, 0.00, 0.00, 0.00, 0.00, 'C-00001', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 12:57:09', '2022-10-28 12:57:09'),
(2465, 'SI-0000336', '2022-10-28', 409.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 12:58:53', '2022-10-28 12:58:53'),
(2466, 'SI-0000337', '2022-10-28', 390.00, 0.00, 0.00, 0.00, 0.00, 'C-00025', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 13:01:41', '2022-10-28 13:01:41'),
(2467, 'SI-0000338', '2022-10-28', 650.00, 0.00, 0.00, 0.00, 0.00, 'C-00022', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 13:26:50', '2022-10-28 13:26:50'),
(2468, 'SI-0000339', '2022-10-28', 50.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 13:27:54', '2022-10-28 13:27:54'),
(2469, 'SI-0000340', '2022-10-28', 80.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 13:29:22', '2022-10-28 13:29:22'),
(2470, 'SI-0000341', '2022-10-28', 2700.00, 0.00, 0.00, 0.00, 0.00, 'C-00023', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 13:31:09', '2022-10-28 13:31:09'),
(2471, 'SI-0000342', '2022-10-28', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 13:33:05', '2022-10-28 13:33:05'),
(2472, 'SI-0000343', '2022-10-28', 574.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 13:34:11', '2022-10-28 13:34:11'),
(2473, 'SI-0000344', '2022-10-28', 85.00, 0.00, 0.00, 0.00, 0.00, 'C-00001', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 13:35:17', '2022-10-28 13:35:17'),
(2474, 'SI-0000345', '2022-10-28', 80.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 13:36:32', '2022-10-28 13:36:32'),
(2475, 'SI-0000346', '2022-10-28', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 13:38:52', '2022-10-28 13:38:52'),
(2476, 'SI-0000347', '2022-10-28', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00006', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 13:39:36', '2022-10-28 13:39:36'),
(2477, 'SI-0000348', '2022-10-28', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00022', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 13:41:18', '2022-10-28 13:41:18'),
(2479, 'SI-0000350', '2022-10-28', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00018', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 14:03:15', '2022-10-28 14:03:15'),
(2480, 'SI-0000351', '2022-10-28', 370.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 14:04:06', '2022-10-28 14:04:06'),
(2481, 'SI-0000352', '2022-10-28', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 14:05:35', '2022-10-28 14:05:35'),
(2482, 'SI-0000353', '2022-10-28', 38.40, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 14:06:52', '2022-10-28 14:06:52'),
(2483, 'SI-0000354', '2022-10-28', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 14:09:17', '2022-10-28 14:09:17'),
(2484, 'SI-0000355', '2022-10-28', 50.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 14:10:09', '2022-10-28 14:10:09'),
(2485, 'SI-0000356', '2022-10-28', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00006', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-28 14:20:30', '2022-10-28 14:20:30'),
(2486, 'SI-0000357', '2022-10-29', 645.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 04:47:11', '2022-10-29 04:47:11'),
(2487, 'SI-0000358', '2022-10-29', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00001', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 04:50:43', '2022-10-29 04:50:43'),
(2488, 'SI-0000359', '2022-10-29', 335.00, 0.00, 0.00, 0.00, 0.00, 'C-00001', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 11:38:55', '2022-10-29 11:38:55'),
(2489, 'SI-0000360', '2022-10-29', 370.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 11:46:10', '2022-10-29 11:46:10'),
(2490, 'SI-0000361', '2022-10-29', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00012', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 12:15:59', '2022-10-29 12:15:59'),
(2491, 'SI-0000362', '2022-10-29', 33.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 12:16:58', '2022-10-29 12:16:58'),
(2493, 'SI-0000363', '2022-10-29', 2633.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 12:20:52', '2022-10-29 12:20:52'),
(2494, 'SI-0000364', '2022-10-29', 1000.00, 0.00, 0.00, 0.00, 0.00, 'C-00014', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 12:24:28', '2022-10-29 12:24:28'),
(2495, 'SI-0000365', '2022-10-29', 100.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 12:25:32', '2022-10-29 12:25:32'),
(2496, 'SI-0000366', '2022-10-29', 60.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 12:26:22', '2022-10-29 12:26:22'),
(2497, 'SI-0000367', '2022-10-29', 42903.00, 0.00, 0.00, 0.00, 0.00, 'C-00026', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 12:39:06', '2022-10-29 12:39:06'),
(2498, 'SI-0000368', '2022-10-29', 211.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 12:41:26', '2022-10-29 12:41:26'),
(2499, 'SI-0000369', '2022-10-29', 69.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 12:51:30', '2022-10-29 12:51:30'),
(2500, 'SI-0000370', '2022-10-29', 350.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 13:44:02', '2022-10-29 13:44:02'),
(2501, 'SI-0000371', '2022-10-29', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 13:46:53', '2022-10-29 13:46:53'),
(2502, 'SI-0000372', '2022-10-29', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00023', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 13:48:01', '2022-10-29 13:48:01'),
(2503, 'SI-0000373', '2022-10-29', 60.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 13:49:23', '2022-10-29 13:49:23'),
(2504, 'SI-0000374', '2022-10-29', 21.40, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 13:51:02', '2022-10-29 13:51:02'),
(2505, 'SI-0000375', '2022-10-29', 1250.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 13:52:14', '2022-10-29 13:52:14'),
(2506, 'SI-0000376', '2022-10-29', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00023', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 13:53:21', '2022-10-29 13:53:21'),
(2507, 'SI-0000377', '2022-10-29', 285.00, 0.00, 0.00, 0.00, 0.00, 'C-00022', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 13:56:32', '2022-10-29 13:56:32'),
(2508, 'SI-0000378', '2022-10-29', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00011', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 14:31:16', '2022-10-29 14:31:16'),
(2509, 'SI-0000379', '2022-10-29', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 14:32:46', '2022-10-29 14:32:46'),
(2510, 'SI-0000380', '2022-10-29', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 14:32:55', '2022-10-29 14:32:55'),
(2511, 'SI-0000381', '2022-10-29', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00011', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-29 14:33:56', '2022-10-29 14:33:56'),
(2512, 'SI-0000382', '2022-10-30', 100.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-30 05:16:35', '2022-10-30 05:16:35'),
(2513, 'SI-0000383', '2022-10-30', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00022', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-30 12:49:31', '2022-10-30 12:49:31'),
(2514, 'SI-0000384', '2022-10-31', 1250.00, 0.00, 0.00, 0.00, 0.00, 'C-00020', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-31 04:35:53', '2022-10-31 04:35:53'),
(2515, 'SI-0000385', '2022-10-31', 150.00, 0.00, 0.00, 0.00, 0.00, 'C-00026', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-31 04:58:52', '2022-10-31 04:58:52'),
(2516, 'SI-0000386', '2022-10-31', 280.00, 0.00, 0.00, 0.00, 0.00, 'C-00001', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-31 07:02:28', '2022-10-31 07:02:28'),
(2517, 'SI-0000387', '2022-10-31', 1320.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-31 10:27:37', '2022-10-31 10:27:37'),
(2518, 'SI-0000388', '2022-10-31', 650.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-31 11:21:53', '2022-10-31 11:21:53'),
(2519, NULL, '2022-08-07', 70000.00, 0.00, 0.00, NULL, 0.00, 'C-00009', 'Cash', NULL, '1', 0, 1, 'DueCollection', '2022-10-31 12:40:01', '2022-11-06 06:18:45'),
(2520, 'SI-0000389', '2022-10-31', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00023', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-31 12:50:19', '2022-10-31 12:50:19'),
(2522, 'SI-0000390', '2022-10-31', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-31 13:36:16', '2022-10-31 13:36:16'),
(2523, 'SI-0000391', '2022-10-31', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-31 14:29:01', '2022-10-31 14:29:01'),
(2524, 'SI-0000392', '2022-10-31', 240.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-31 15:08:59', '2022-10-31 15:08:59'),
(2525, 'SI-0000393', '2022-10-31', 240.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-10-31 15:08:59', '2022-10-31 15:08:59'),
(2526, 'SI-0000394', '2022-11-01', 144.00, 0.00, 0.00, 0.00, 0.00, 'C-00022', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-01 04:49:53', '2022-11-01 04:49:53'),
(2527, 'SI-0000395', '2022-11-01', 135.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-01 12:00:30', '2022-11-01 12:00:30'),
(2528, 'SI-0000396', '2022-11-01', 100.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-01 12:17:29', '2022-11-01 12:17:29'),
(2529, 'SI-0000397', '2022-11-01', 70.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-01 12:18:49', '2022-11-01 12:18:49'),
(2530, 'SI-0000398', '2022-11-01', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00012', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-01 12:44:04', '2022-11-01 12:44:04'),
(2531, 'SI-0000399', '2022-11-01', 665.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-01 14:14:21', '2022-11-01 14:14:21'),
(2532, 'SI-0000400', '2022-11-01', 360.00, 0.00, 0.00, 0.00, 0.00, 'C-00001', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-01 14:18:54', '2022-11-01 14:18:54'),
(2533, 'SI-0000401', '2022-11-01', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-01 14:26:22', '2022-11-01 14:26:22'),
(2534, 'SI-0000402', '2022-11-02', 490.00, 0.00, 0.00, 0.00, 0.00, 'C-00026', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-02 03:21:42', '2022-11-02 03:21:42'),
(2536, 'SI-0000403', '2022-11-02', 750.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-02 05:24:35', '2022-11-02 05:24:35'),
(2537, 'SI-0000404', '2022-11-02', 358.00, 0.00, 0.00, 0.00, 0.00, 'C-00001', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-02 06:17:56', '2022-11-02 06:17:56'),
(2538, 'SI-0000405', '2022-11-02', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00026', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-02 10:47:54', '2022-11-02 10:47:54'),
(2539, 'SI-0000406', '2022-11-03', 33.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-03 04:09:36', '2022-11-03 04:09:36'),
(2540, 'SI-0000407', '2022-11-03', 2700.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-03 04:10:32', '2022-11-03 04:10:32'),
(2542, 'SI-0000409', '2022-11-03', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-03 04:16:37', '2022-11-03 04:16:37'),
(2543, 'SI-0000410', '2022-11-03', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-03 04:26:37', '2022-11-03 04:26:37'),
(2544, 'SI-0000411', '2022-11-03', 42.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-03 04:59:53', '2022-11-03 04:59:53'),
(2545, 'SI-0000412', '2022-11-03', 200.00, 0.00, 0.00, 0.00, 0.00, 'C-00001', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-03 05:04:12', '2022-11-03 05:04:12'),
(2546, 'SI-0000413', '2022-11-03', 435.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-03 05:17:59', '2022-11-03 05:17:59'),
(2547, 'SI-0000414', '2022-11-03', 100.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-03 12:20:38', '2022-11-03 12:20:38'),
(2548, 'SI-0000415', '2022-11-03', 550.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-03 12:46:46', '2022-11-03 12:46:46'),
(2549, 'SI-0000416', '2022-11-03', 1625.00, 0.00, 0.00, 0.00, 0.00, 'C-00025', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-03 13:31:38', '2022-11-03 13:31:38'),
(2550, 'SI-0000417', '2022-11-03', 560.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-03 13:37:25', '2022-11-03 13:37:25'),
(2551, 'SI-0000418', '2022-11-03', 320.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-03 13:52:32', '2022-11-03 13:52:32'),
(2552, 'SI-0000419', '2022-11-04', 815.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-04 04:58:38', '2022-11-04 04:58:38'),
(2553, 'SI-0000420', '2022-11-04', 1250.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-04 05:05:25', '2022-11-04 05:05:25'),
(2554, 'SI-0000421', '2022-11-04', 228.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-04 11:55:33', '2022-11-04 11:55:33'),
(2555, 'SI-0000422', '2022-11-04', 630.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-04 12:01:42', '2022-11-04 12:01:42'),
(2556, 'SI-0000423', '2022-11-04', 51.20, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-04 14:48:26', '2022-11-04 14:48:26'),
(2557, 'SI-0000424', '2022-11-05', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00011', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-05 04:43:50', '2022-11-05 04:43:50'),
(2558, 'SI-0000425', '2022-11-05', 96.00, 0.00, 0.00, 0.00, 0.00, 'C-00020', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-05 05:45:39', '2022-11-05 05:45:39'),
(2559, 'SI-0000426', '2022-11-05', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00012', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-05 13:41:35', '2022-11-05 13:41:35'),
(2560, 'SI-0000427', '2022-11-05', 40000.00, 0.00, 0.00, 0.00, 0.00, 'C-00026', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-05 13:44:40', '2022-11-05 13:44:40'),
(2561, 'SI-0000428', '2022-11-05', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00026', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-05 14:02:59', '2022-11-05 14:02:59'),
(2562, 'SI-0000429', '2022-11-05', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00026', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-05 14:16:02', '2022-11-05 14:16:02'),
(2563, 'SI-0000430', '2022-11-05', 1200.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-05 14:21:50', '2022-11-05 14:21:50'),
(2564, 'SI-0000431', '2022-11-06', 285.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-06 04:33:22', '2022-11-06 04:33:22'),
(2565, 'SI-0000432', '2022-11-06', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-06 04:35:36', '2022-11-06 04:35:36'),
(2567, 'SI-0000433', '2022-11-06', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-06 13:18:23', '2022-11-06 13:18:23'),
(2568, 'SI-0000434', '2022-11-06', 2000.00, 0.00, 0.00, 0.00, 0.00, 'C-00018', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-06 13:21:53', '2022-11-06 13:21:53'),
(2569, 'SI-0000435', '2022-11-06', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00026', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-06 13:23:45', '2022-11-06 13:23:45'),
(2570, 'SI-0000436', '2022-11-07', 360.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-07 10:43:55', '2022-11-07 10:43:55'),
(2571, 'SI-0000437', '2022-11-07', 108.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-07 12:57:56', '2022-11-07 12:57:56'),
(2572, 'SI-0000438', '2022-11-07', 8.80, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-07 13:00:28', '2022-11-07 13:00:28'),
(2573, 'SI-0000439', '2022-11-07', 2150.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-07 14:02:41', '2022-11-07 14:02:41'),
(2574, 'SI-0000440', '2022-11-07', 240.00, 0.00, 0.00, 0.00, 0.00, 'C-00018', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-07 14:04:42', '2022-11-07 14:04:42'),
(2575, 'SI-0000441', '2022-11-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00009', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-07 14:16:07', '2022-11-07 14:16:07'),
(2576, 'SI-0000442', '2022-11-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00011', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-07 14:21:12', '2022-11-07 14:21:12'),
(2577, 'SI-0000443', '2022-11-07', 24.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-07 14:29:55', '2022-11-07 14:29:55'),
(2578, 'SI-0000444', '2022-11-08', 710.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-08 04:48:56', '2022-11-08 04:48:56'),
(2579, 'SI-0000445', '2022-11-08', 2500.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-08 05:25:20', '2022-11-08 05:25:20'),
(2580, NULL, '2022-10-31', 129639.00, 0.00, 0.00, NULL, 0.00, 'C-00007', 'Cash', 'due FISILA', '1', 0, 1, NULL, '2022-11-08 06:54:36', '2022-11-08 06:54:36'),
(2581, 'SI-0000446', '2022-11-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00013', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-08 07:29:16', '2022-11-08 07:29:16'),
(2582, 'SI-0000447', '2022-11-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-08 07:34:58', '2022-11-08 07:34:58'),
(2583, 'SI-0000448', '2022-11-08', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-08 07:37:21', '2022-11-08 07:37:21'),
(2584, 'SI-0000449', '2022-11-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-09 04:30:27', '2022-11-09 04:30:27'),
(2585, 'SI-0000450', '2022-11-09', 4627.00, 0.00, 0.00, 0.00, 0.00, 'C-00025', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-09 06:38:17', '2022-11-09 06:38:17'),
(2586, 'SI-0000451', '2022-11-09', 8.80, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-09 06:58:30', '2022-11-09 06:58:30'),
(2587, 'SI-0000452', '2022-11-09', 330.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-09 12:47:41', '2022-11-09 12:47:41'),
(2588, 'SI-0000453', '2022-11-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00022', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-09 12:59:56', '2022-11-09 12:59:56'),
(2589, 'SI-0000454', '2022-11-09', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00011', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-09 13:22:36', '2022-11-09 13:22:36'),
(2590, 'SI-0000455', '2022-11-10', 350.00, 0.00, 0.00, 0.00, 0.00, 'C-00026', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-10 03:37:50', '2022-11-10 03:37:50'),
(2591, 'SI-0000456', '2022-11-10', 749.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-10 03:52:38', '2022-11-10 03:52:38'),
(2592, 'SI-0000457', '2022-11-10', 17.60, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-10 04:25:54', '2022-11-10 04:25:54'),
(2593, 'SI-0000458', '2022-11-10', 1250.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-10 04:28:43', '2022-11-10 04:28:43'),
(2594, 'SI-0000459', '2022-11-10', 315.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-10 04:35:58', '2022-11-10 04:35:58'),
(2595, 'SI-0000460', '2022-11-10', 130.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-10 04:38:19', '2022-11-10 04:38:19'),
(2596, 'SI-0000461', '2022-11-10', 180.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-10 04:50:11', '2022-11-10 04:50:11'),
(2598, 'SI-0000462', '2022-11-10', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-10 06:28:58', '2022-11-10 06:28:58'),
(2599, 'SI-0000463', '2022-11-10', 405.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-10 08:03:53', '2022-11-10 08:03:53'),
(2600, 'SI-0000464', '2022-11-10', 8000.00, 0.00, 0.00, 0.00, 0.00, 'C-00008', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-10 13:42:56', '2022-11-10 13:42:56'),
(2601, 'SI-0000465', '2022-11-10', 1000.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-10 14:20:23', '2022-11-10 14:20:23'),
(2602, 'SI-0000466', '2022-11-11', 20.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-11 05:31:22', '2022-11-11 05:31:22'),
(2603, 'SI-0000467', '2022-11-11', 11000.00, 0.00, 0.00, 0.00, 0.00, 'C-00026', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-11 10:17:08', '2022-11-11 10:17:08'),
(2604, 'SI-0000468', '2022-11-11', 270.00, 0.00, 0.00, 0.00, 0.00, 'C-00027', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-11 13:31:37', '2022-11-11 13:31:37'),
(2606, 'SI-0000469', '2022-11-11', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00013', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-11 14:35:56', '2022-11-11 14:35:56'),
(2607, 'SI-0000470', '2022-11-12', 33.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-12 04:19:14', '2022-11-12 04:19:14'),
(2608, 'SI-0000471', '2022-11-12', 200.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-12 04:27:06', '2022-11-12 04:27:06'),
(2609, 'SI-0000472', '2022-11-12', 509.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-12 05:52:31', '2022-11-12 05:52:31'),
(2610, 'SI-0000473', '2022-11-12', 429.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-12 10:54:50', '2022-11-12 10:54:50'),
(2611, 'SI-0000474', '2022-11-12', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00026', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-12 11:00:54', '2022-11-12 11:00:54'),
(2613, 'SI-0000475', '2022-11-12', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00016', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-12 11:36:43', '2022-11-12 11:36:43'),
(2614, 'SI-0000476', '2022-11-12', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00018', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-12 12:37:10', '2022-11-12 12:37:10'),
(2615, 'SI-0000477', '2022-11-12', 40.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-12 12:40:18', '2022-11-12 12:40:18'),
(2616, 'SI-0000478', '2022-11-12', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-12 14:10:45', '2022-11-12 14:10:45'),
(2617, 'SI-0000479', '2022-11-12', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00007', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-12 14:11:57', '2022-11-12 14:11:57'),
(2618, 'SI-0000480', '2022-11-13', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00016', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-13 07:27:52', '2022-11-13 07:27:52'),
(2619, 'SI-0000481', '2022-11-13', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-13 11:36:41', '2022-11-13 11:36:41'),
(2620, 'SI-0000482', '2022-11-13', 1300.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-13 11:38:25', '2022-11-13 11:38:25'),
(2621, 'SI-0000483', '2022-11-13', 35.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-13 11:39:08', '2022-11-13 11:39:08'),
(2622, 'SI-0000484', '2022-11-13', 200.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-13 11:40:14', '2022-11-13 11:40:14'),
(2623, 'SI-0000485', '2022-11-13', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-13 11:41:48', '2022-11-13 11:41:48'),
(2624, 'SI-0000486', '2022-11-13', 57.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-13 11:42:30', '2022-11-13 11:42:30'),
(2626, 'SI-0000487', '2022-11-13', 285.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-13 13:20:27', '2022-11-13 13:20:27'),
(2627, 'SI-0000488', '2022-11-14', 200.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-14 04:52:48', '2022-11-14 04:52:48'),
(2628, 'SI-0000489', '2022-11-14', 33.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-14 10:42:45', '2022-11-14 10:42:45'),
(2629, 'SI-0000490', '2022-11-14', 35.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-14 12:18:15', '2022-11-14 12:18:15'),
(2630, 'SI-0000491', '2022-11-14', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00006', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-14 12:19:59', '2022-11-14 12:19:59'),
(2631, 'SI-0000492', '2022-11-14', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00008', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-14 14:05:18', '2022-11-14 14:05:18'),
(2632, 'SI-0000493', '2022-11-14', 3000.00, 0.00, 0.00, 0.00, 0.00, 'C-00023', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-14 14:09:15', '2022-11-14 14:09:15'),
(2633, 'SI-0000494', '2022-11-15', 50.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-15 06:31:39', '2022-11-15 06:31:39'),
(2634, 'SR-000000001', '2022-11-15', 0.00, 349.00, 0.00, 0.00, 0.00, 'C-00022', NULL, NULL, '1', 0, 1, NULL, '2022-11-15 12:14:01', '2022-11-15 12:14:01'),
(2635, 'SI-0000495', '2022-11-15', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00018', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-15 12:57:44', '2022-11-15 12:57:44'),
(2636, 'SI-0000496', '2022-11-16', 8.80, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-16 03:54:08', '2022-11-16 03:54:08'),
(2637, 'SI-0000497', '2022-11-16', 335.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-16 03:57:42', '2022-11-16 03:57:42'),
(2638, 'SI-0000498', '2022-11-16', 255.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-16 04:32:40', '2022-11-16 04:32:40'),
(2639, 'SI-0000499', '2022-11-16', 115.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-16 05:05:58', '2022-11-16 05:05:58'),
(2640, 'SI-0000500', '2022-11-16', 195.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-16 11:12:21', '2022-11-16 11:12:21'),
(2641, 'SI-0000501', '2022-11-16', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00026', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-16 13:06:35', '2022-11-16 13:06:35'),
(2642, 'SI-0000502', '2022-11-17', 50.00, 0.00, 0.00, 0.00, 0.00, 'C-00015', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-17 04:14:49', '2022-11-17 04:14:49'),
(2643, 'SI-0000503', '2022-11-17', 1040.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-17 04:49:26', '2022-11-17 04:49:26'),
(2644, 'SI-0000504', '2022-11-17', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00006', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-17 05:24:18', '2022-11-17 05:24:18'),
(2645, 'SI-0000505', '2022-11-17', 12.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-17 06:24:24', '2022-11-17 06:24:24'),
(2646, 'SI-0000506', '2022-11-17', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00008', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-17 10:29:41', '2022-11-17 10:29:41'),
(2647, 'SI-0000507', '2022-11-17', 69.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-17 12:26:43', '2022-11-17 12:26:43'),
(2649, 'SI-0000508', '2022-11-18', 900.00, 0.00, 0.00, 0.00, 0.00, 'C-00001', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-18 12:18:46', '2022-11-18 12:18:46'),
(2650, 'SI-0000509', '2022-11-18', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00006', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-18 12:47:33', '2022-11-18 12:47:33'),
(2651, 'SI-0000510', '2022-11-18', 2600.00, 0.00, 0.00, 0.00, 0.00, 'C-00001', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-18 12:51:18', '2022-11-18 12:51:18'),
(2652, 'SI-0000511', '2022-11-18', 152.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-18 13:08:40', '2022-11-18 13:08:40'),
(2653, 'SI-0000512', '2022-11-18', 1300.00, 0.00, 0.00, 0.00, 0.00, 'C-00001', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-18 13:36:35', '2022-11-18 13:36:35'),
(2655, 'SI-0000513', '2022-11-18', 2000.00, 0.00, 0.00, 0.00, 0.00, 'C-00028', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-18 14:10:47', '2022-11-18 14:10:47'),
(2656, 'SI-0000514', '2022-11-19', 15.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-19 04:25:39', '2022-11-19 04:25:39'),
(2657, 'SI-0000515', '2022-11-19', 84.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-19 05:16:23', '2022-11-19 05:16:23'),
(2658, 'SI-0000516', '2022-11-19', 84.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-19 05:17:39', '2022-11-19 05:17:39'),
(2659, 'SI-0000517', '2022-11-19', 30.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-19 12:03:49', '2022-11-19 12:03:49'),
(2660, 'SI-0000518', '2022-11-19', 2800.00, 0.00, 0.00, 0.00, 0.00, 'C-00023', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-19 13:41:39', '2022-11-19 13:41:39'),
(2661, 'SI-0000519', '2022-11-20', 1040.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-20 03:43:17', '2022-11-20 03:43:17'),
(2662, 'SI-0000520', '2022-11-20', 1300.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-20 04:43:47', '2022-11-20 04:43:47'),
(2663, 'SI-0000521', '2022-11-20', 180.00, 0.00, 0.00, 0.00, 0.00, 'C-00001', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-20 04:45:17', '2022-11-20 04:45:17'),
(2664, 'SI-0000522', '2022-11-20', 39.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-20 10:12:49', '2022-11-20 10:12:49'),
(2665, 'SI-0000523', '2022-11-20', 300.00, 0.00, 0.00, 0.00, 0.00, 'C-00026', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-20 10:35:24', '2022-11-20 10:35:24'),
(2666, 'SI-0000524', '2022-11-20', 388.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-20 10:48:13', '2022-11-20 10:48:13'),
(2667, 'SI-0000525', '2022-11-20', 12.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-20 10:56:28', '2022-11-20 10:56:28'),
(2668, 'SI-0000526', '2022-11-20', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00018', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-20 12:27:34', '2022-11-20 12:27:34'),
(2669, 'SI-0000527', '2022-11-20', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00018', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-20 12:30:10', '2022-11-20 12:30:10'),
(2670, 'SI-0000528', '2022-11-20', 545.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-20 12:36:51', '2022-11-20 12:36:51'),
(2671, 'SI-0000529', '2022-11-20', 200.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-20 13:08:48', '2022-11-20 13:08:48'),
(2672, 'SI-0000530', '2022-11-20', 1800.00, 0.00, 0.00, 0.00, 0.00, 'C-00020', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-20 13:12:00', '2022-11-20 13:12:00'),
(2673, 'SI-0000531', '2022-11-21', 508.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-21 04:33:52', '2022-11-21 04:33:52'),
(2674, 'SI-0000532', '2022-11-21', 246.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-21 12:15:20', '2022-11-21 12:15:20'),
(2675, 'SI-0000533', '2022-11-21', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00008', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-21 12:29:03', '2022-11-21 12:29:03'),
(2676, 'SI-0000534', '2022-11-21', 200.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-21 12:30:56', '2022-11-21 12:30:56'),
(2677, 'SI-0000535', '2022-11-21', 50.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-21 12:32:01', '2022-11-21 12:32:01'),
(2678, 'SI-0000536', '2022-11-21', 430.00, 0.00, 0.00, 0.00, 0.00, 'C-00026', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-21 12:33:40', '2022-11-21 12:33:40'),
(2679, 'SI-0000537', '2022-11-21', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-21 12:38:53', '2022-11-21 12:38:53'),
(2680, 'SI-0000538', '2022-11-21', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00013', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-21 12:57:06', '2022-11-21 12:57:06'),
(2681, 'SI-0000539', '2022-11-21', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00013', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-21 13:03:58', '2022-11-21 13:03:58'),
(2682, 'SI-0000540', '2022-11-22', 200.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-22 03:41:01', '2022-11-22 03:41:01'),
(2683, 'SI-0000541', '2022-11-22', 9.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-22 03:42:57', '2022-11-22 03:42:57'),
(2684, 'SI-0000542', '2022-11-22', 33.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-22 03:44:37', '2022-11-22 03:44:37'),
(2685, 'SI-0000543', '2022-11-22', 200.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-22 04:04:27', '2022-11-22 04:04:27'),
(2686, 'SI-0000544', '2022-11-22', 400.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-22 04:25:49', '2022-11-22 04:25:49'),
(2687, 'SI-0000545', '2022-11-22', 56.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-22 10:48:58', '2022-11-22 10:48:58'),
(2688, 'SI-0000546', '2022-11-22', 33.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-22 12:59:04', '2022-11-22 12:59:04'),
(2689, 'SI-0000547', '2022-11-22', 395.00, 0.00, 0.00, 0.00, 0.00, 'C-00022', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-22 14:04:19', '2022-11-22 14:04:19'),
(2690, 'SI-0000548', '2022-11-22', 200.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-22 14:24:45', '2022-11-22 14:24:45'),
(2691, 'SI-0000549', '2022-11-23', 17.60, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-23 04:16:23', '2022-11-23 04:16:23'),
(2693, 'SI-0000550', '2022-11-23', 2000.00, 0.00, 0.00, 0.00, 0.00, 'C-00018', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-23 04:56:50', '2022-11-23 04:56:50'),
(2694, 'SI-0000551', '2022-11-24', 200.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-24 05:03:59', '2022-11-24 05:03:59'),
(2695, 'SI-0000552', '2022-11-24', 611.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-24 06:24:01', '2022-11-24 06:24:01'),
(2696, 'SI-0000553', '2022-11-24', 180.00, 0.00, 0.00, 0.00, 0.00, 'C-00001', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-24 06:51:59', '2022-11-24 06:51:59'),
(2697, 'SI-0000554', '2022-11-24', 130.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-24 10:56:28', '2022-11-24 10:56:28'),
(2698, 'SI-0000555', '2022-11-24', 43.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-24 11:48:20', '2022-11-24 11:48:20'),
(2699, 'SI-0000556', '2022-11-24', 33.00, 0.00, 0.00, 0.00, 0.00, 'C-00022', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-24 13:05:01', '2022-11-24 13:05:01'),
(2700, 'SI-0000557', '2022-11-24', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00018', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-24 13:07:58', '2022-11-24 13:07:58'),
(2701, 'SI-0000558', '2022-11-25', 480.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-25 05:01:14', '2022-11-25 05:01:14'),
(2702, 'SI-0000559', '2022-11-25', 120.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-25 12:37:07', '2022-11-25 12:37:07'),
(2703, 'SI-0000560', '2022-11-25', 16.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-25 13:57:39', '2022-11-25 13:57:39'),
(2704, 'SI-0000561', '2022-11-26', 800.00, 0.00, 0.00, 0.00, 0.00, 'C-00029', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-26 03:46:38', '2022-11-26 03:46:38'),
(2705, 'SI-0000562', '2022-11-27', 1310.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-27 13:50:04', '2022-11-27 13:50:04'),
(2706, 'SI-0000563', '2022-11-28', 190.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-28 11:19:57', '2022-11-28 11:19:57'),
(2707, 'SI-0000564', '2022-11-28', 1016.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-28 12:30:28', '2022-11-28 12:30:28'),
(2708, 'SI-0000565', '2022-11-28', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00018', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-28 12:54:28', '2022-11-28 12:54:28'),
(2709, 'SI-0000566', '2022-11-28', 36.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-28 14:37:11', '2022-11-28 14:37:11'),
(2710, 'SI-0000567', '2022-11-28', 70.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-28 15:13:28', '2022-11-28 15:13:28'),
(2711, 'SI-0000568', '2022-11-29', 735.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-29 04:13:49', '2022-11-29 04:13:49'),
(2712, 'SI-0000569', '2022-11-29', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00011', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-29 04:36:27', '2022-11-29 04:36:27'),
(2713, 'SI-0000570', '2022-11-29', 1310.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-29 10:55:05', '2022-11-29 10:55:05'),
(2714, 'SI-0000571', '2022-11-29', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00016', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-29 12:11:44', '2022-11-29 12:11:44'),
(2715, 'SI-0000572', '2022-11-29', 680.00, 0.00, 0.00, 0.00, 0.00, 'C-00028', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-29 13:29:04', '2022-11-29 13:29:04'),
(2716, 'SI-0000573', '2022-11-30', 200.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-30 04:41:46', '2022-11-30 04:41:46'),
(2717, 'SI-0000574', '2022-11-30', 50.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-30 10:56:27', '2022-11-30 10:56:27'),
(2718, 'SI-0000575', '2022-11-30', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-30 11:43:06', '2022-11-30 11:43:06'),
(2719, 'SI-0000576', '2022-11-30', 190.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-11-30 13:08:24', '2022-11-30 13:08:24'),
(2720, 'SI-0000577', '2022-12-01', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00011', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-01 04:46:57', '2022-12-01 04:46:57'),
(2721, 'SI-0000578', '2022-12-01', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-01 06:11:13', '2022-12-01 06:11:13'),
(2722, 'SI-0000579', '2022-12-01', 1470.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-01 06:19:31', '2022-12-01 06:19:31'),
(2723, 'SI-0000580', '2022-12-01', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00018', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-01 12:52:25', '2022-12-01 12:52:25'),
(2724, 'SI-0000581', '2022-12-02', 1300.00, 0.00, 0.00, 0.00, 0.00, 'C-00020', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-02 12:19:39', '2022-12-02 12:19:39'),
(2725, 'SI-0000582', '2022-12-02', 200.00, 0.00, 0.00, 0.00, 0.00, 'C-00029', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-02 12:20:22', '2022-12-02 12:20:22'),
(2726, 'SI-0000583', '2022-12-02', 910.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-02 12:50:56', '2022-12-02 12:50:56'),
(2727, 'SI-0000584', '2022-12-03', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-03 10:54:19', '2022-12-03 10:54:19'),
(2728, 'SI-0000585', '2022-12-03', 10220.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-03 10:57:30', '2022-12-03 10:57:30'),
(2729, 'SI-0000586', '2022-12-03', 50.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-03 10:58:47', '2022-12-03 10:58:47'),
(2730, 'SI-0000587', '2022-12-03', 370.00, 0.00, 0.00, 0.00, 0.00, 'C-00001', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-03 11:05:06', '2022-12-03 11:05:06'),
(2731, 'SI-0000588', '2022-12-03', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00012', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-03 13:20:54', '2022-12-03 13:20:54'),
(2732, 'SI-0000589', '2022-12-03', 358.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-03 13:34:46', '2022-12-03 13:34:46'),
(2734, 'SI-0000590', '2022-12-03', 430.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-03 13:49:22', '2022-12-03 13:49:22'),
(2735, 'SI-0000591', '2022-12-03', 1050.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-03 14:10:56', '2022-12-03 14:10:56'),
(2736, 'SI-0000592', '2022-12-04', 100.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-04 04:53:35', '2022-12-04 04:53:35'),
(2737, 'SI-0000593', '2022-12-04', 1780.00, 0.00, 0.00, 0.00, 0.00, 'C-00026', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-04 07:13:52', '2022-12-04 07:13:52'),
(2738, 'SI-0000594', '2022-12-05', 500.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-05 10:33:11', '2022-12-05 10:33:11'),
(2739, 'SI-0000595', '2022-12-05', 140.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-05 10:34:51', '2022-12-05 10:34:51'),
(2740, 'SI-0000596', '2022-12-05', 130.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-05 10:35:39', '2022-12-05 10:35:39'),
(2741, 'SI-0000597', '2022-12-05', 66.00, 0.00, 0.00, 0.00, 0.00, 'C-00001', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-05 10:36:25', '2022-12-05 10:36:25'),
(2742, 'SI-0000598', '2022-12-05', 94.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-05 10:37:53', '2022-12-05 10:37:53'),
(2743, 'SI-0000599', '2022-12-05', 450.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-05 10:38:57', '2022-12-05 10:38:57'),
(2744, 'SI-0000600', '2022-12-05', 2860.00, 0.00, 0.00, 0.00, 0.00, 'C-00001', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-05 12:17:06', '2022-12-05 12:17:06'),
(2746, 'SI-0000602', '2022-12-06', 100.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-06 12:11:47', '2022-12-06 12:11:47'),
(2747, 'SI-0000603', '2022-12-06', 50.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-06 13:02:33', '2022-12-06 13:02:33'),
(2748, 'SI-0000604', '2022-12-06', 650.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-06 13:09:38', '2022-12-06 13:09:38'),
(2749, 'SI-0000605', '2022-12-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00027', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-07 04:35:33', '2022-12-07 04:35:33'),
(2750, 'SI-0000606', '2022-12-07', 7.00, 0.00, 0.00, 0.00, 0.00, 'C-00002', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-07 04:37:09', '2022-12-07 04:37:09'),
(2751, 'SI-0000607', '2022-12-07', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00010', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2022-12-07 12:56:03', '2022-12-07 12:56:03'),
(2752, 'SI-0000630', '2023-01-01', 0.00, 0.00, 0.00, 0.00, 0.00, 'C-00001', 'Cash', 'firstpayment', '1', 0, 1, NULL, '2023-01-01 12:12:01', '2023-01-01 12:12:01');

-- --------------------------------------------------------

--
-- Table structure for table `sales_return_current`
--

CREATE TABLE `sales_return_current` (
  `id` int(10) UNSIGNED NOT NULL,
  `sub_unit_id` int(10) NOT NULL,
  `product_id` varchar(15) NOT NULL,
  `product_quantity` double(11,2) NOT NULL DEFAULT 0.00,
  `product_sales_price` double(11,2) NOT NULL DEFAULT 0.00,
  `product_discount_amount` double(11,2) NOT NULL DEFAULT 0.00,
  `note` varchar(191) DEFAULT NULL,
  `branch_id` varchar(15) DEFAULT NULL,
  `admin_id` varchar(11) DEFAULT NULL,
  `session_id` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_return_current`
--

INSERT INTO `sales_return_current` (`id`, `sub_unit_id`, `product_id`, `product_quantity`, `product_sales_price`, `product_discount_amount`, `note`, `branch_id`, `admin_id`, `session_id`, `created_at`, `updated_at`) VALUES
(152, 15, 'PDT-000004', 18.00, 7.00, 0.00, NULL, '1', '1', 'sOKqNEpvRyAx0HCVmNj3Rl3XvKeFBitoUQOaiI0M', '2022-12-08 05:48:51', '2022-12-08 05:49:25'),
(153, 15, 'PDT-000003', 10.00, 6.00, 0.00, NULL, '1', '1', 'sOKqNEpvRyAx0HCVmNj3Rl3XvKeFBitoUQOaiI0M', '2022-12-08 05:48:54', '2022-12-08 05:49:22'),
(154, 15, 'PDT-000013', 16.00, 8.00, 0.00, NULL, '1', '1', 'sOKqNEpvRyAx0HCVmNj3Rl3XvKeFBitoUQOaiI0M', '2022-12-08 05:48:58', '2022-12-08 05:49:33'),
(157, 15, 'PDT-000001', 1.00, 0.00, 0.00, NULL, '1', '1', 'RbmsnTt6C7bwYuhxtATahHyjsQAjlbjincJb6EIi', '2022-12-10 14:01:32', '2022-12-10 14:01:32'),
(158, 15, 'PDT-000004', 1.00, 0.00, 0.00, NULL, '1', '1', 'RbmsnTt6C7bwYuhxtATahHyjsQAjlbjincJb6EIi', '2022-12-10 14:01:33', '2022-12-10 14:01:33');

-- --------------------------------------------------------

--
-- Table structure for table `sales_return_entry`
--

CREATE TABLE `sales_return_entry` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_no` varchar(15) DEFAULT NULL,
  `customer_id` varchar(15) DEFAULT NULL,
  `product_id` varchar(15) NOT NULL,
  `sub_unit_id` varchar(10) DEFAULT NULL,
  `return_quantity` double(11,2) NOT NULL,
  `product_return_price` double(11,2) NOT NULL,
  `return_discount_amount` varchar(191) NOT NULL,
  `entry_date` varchar(20) DEFAULT NULL,
  `branch_id` varchar(11) DEFAULT NULL,
  `note` varchar(191) DEFAULT NULL,
  `status` int(2) DEFAULT 0,
  `admin_id` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_return_entry`
--

INSERT INTO `sales_return_entry` (`id`, `invoice_no`, `customer_id`, `product_id`, `sub_unit_id`, `return_quantity`, `product_return_price`, `return_discount_amount`, `entry_date`, `branch_id`, `note`, `status`, `admin_id`, `created_at`, `updated_at`) VALUES
(6064, 'SR-000000001', NULL, 'PDT-000241', '1', 1.00, 87.00, '0', '2022-11-15', '1', NULL, 0, '1', '2022-11-15 12:14:01', '2022-11-15 12:14:01'),
(6065, 'SR-000000001', NULL, 'PDT-000209', '1', 1.00, 265.00, '0', '2022-11-15', '1', NULL, 0, '1', '2022-11-15 12:14:01', '2022-11-15 12:14:01');

-- --------------------------------------------------------

--
-- Table structure for table `sales_return_ledger`
--

CREATE TABLE `sales_return_ledger` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_no` varchar(15) NOT NULL,
  `invoice_date` varchar(50) DEFAULT NULL,
  `customer_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` double(11,2) DEFAULT 0.00,
  `final_discount` double(11,2) DEFAULT 0.00,
  `note` mediumtext DEFAULT NULL,
  `transaction_type` varchar(50) DEFAULT NULL,
  `entry_date` varchar(50) DEFAULT NULL,
  `branch_id` varchar(11) DEFAULT NULL,
  `status` int(2) DEFAULT 0,
  `admin_id` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_return_ledger`
--

INSERT INTO `sales_return_ledger` (`id`, `invoice_no`, `invoice_date`, `customer_id`, `total_amount`, `final_discount`, `note`, `transaction_type`, `entry_date`, `branch_id`, `status`, `admin_id`, `created_at`, `updated_at`) VALUES
(2030, 'SR-000000001', '2022-11-15', 'C-00022', 352.00, 0.00, NULL, NULL, '2022-11-15', '1', 0, 1, '2022-11-15 12:14:01', '2022-11-15 12:14:01');

-- --------------------------------------------------------

--
-- Table structure for table `stock_products`
--

CREATE TABLE `stock_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `invoice_no` varchar(11) DEFAULT NULL,
  `quantity` double(11,2) NOT NULL,
  `sales_qty` double(11,2) NOT NULL DEFAULT 0.00,
  `purchase_price` double(11,2) NOT NULL,
  `purchase_price_withcost` double(11,2) DEFAULT NULL,
  `sale_price` double(11,2) NOT NULL,
  `old_and_new_purchase_price_average` double(11,2) DEFAULT NULL,
  `pdt_expiry_date` date DEFAULT NULL,
  `branch_id` varchar(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_products`
--

INSERT INTO `stock_products` (`id`, `product_id`, `invoice_no`, `quantity`, `sales_qty`, `purchase_price`, `purchase_price_withcost`, `sale_price`, `old_and_new_purchase_price_average`, `pdt_expiry_date`, `branch_id`, `created_at`, `updated_at`) VALUES
(42, 'PDT-000018', 'PI-0000001', 30.00, 22.00, 171.61, 171.61, 188.00, NULL, NULL, '1', '2022-10-01 11:31:13', '2022-12-07 12:56:03'),
(43, 'PDT-000019', 'PI-0000001', 8.00, 4.00, 367.00, 367.00, 395.00, NULL, NULL, '1', '2022-10-01 11:31:13', '2022-12-23 11:01:25'),
(44, 'PDT-000020', 'PI-0000001', 11.00, 5.00, 155.61, 155.61, 170.00, NULL, NULL, '1', '2022-10-01 11:31:13', '2022-11-06 13:18:23'),
(45, 'PDT-000021', 'PI-0000001', 54.00, 38.00, 127.80, 127.80, 140.00, NULL, NULL, '1', '2022-10-01 11:31:13', '2022-11-02 03:21:42'),
(46, 'PDT-000022', 'PI-0000001', 16.00, 6.00, 87.52, 87.52, 95.00, NULL, NULL, '1', '2022-10-01 11:31:13', '2022-12-07 06:44:30'),
(47, 'PDT-000023', 'PI-0000001', 50.00, 22.00, 208.93, 208.93, 265.00, NULL, NULL, '1', '2022-10-01 11:31:13', '2022-12-07 12:56:03'),
(48, 'PDT-000024', 'PI-0000001', 48.00, 27.00, 5.61, 5.61, 7.00, NULL, NULL, '1', '2022-10-01 11:31:13', '2022-12-07 04:37:09'),
(49, 'PDT-000025', 'PI-0000001', 10.00, 0.00, 408.92, 408.92, 440.00, NULL, NULL, '1', '2022-10-01 11:31:13', '2022-10-12 11:07:40'),
(50, 'PDT-000026', 'PI-0000001', 110.00, 59.00, 31.76, 31.76, 35.00, NULL, NULL, '1', '2022-10-01 11:31:13', '2022-12-06 13:09:03'),
(51, 'PDT-000027', 'PI-0000001', 11.00, 0.00, 65.13, 65.13, 80.00, NULL, NULL, '1', '2022-10-01 11:31:13', '2022-10-12 11:07:40'),
(52, 'PDT-000128', 'PI-0000001', 5.00, 2.00, 183.64, 183.64, 97.00, NULL, NULL, '1', '2022-10-01 11:31:13', '2022-10-27 14:00:51'),
(53, 'PDT-000028', 'PI-0000001', 620.00, 151.00, 2.59, 2.59, 3.00, NULL, NULL, '1', '2022-10-01 11:31:13', '2022-12-23 11:01:25'),
(54, 'PDT-000029', 'PI-0000001', 11.00, 10.00, 664.77, 664.77, 720.00, NULL, NULL, '1', '2022-10-01 11:31:13', '2022-11-21 12:57:06'),
(55, 'PDT-000030', 'PI-0000001', 5.00, 4.00, 87.75, 87.75, 100.00, NULL, NULL, '1', '2022-10-01 11:31:13', '2022-10-12 11:07:40'),
(56, 'PDT-000031', 'PI-0000001', 5.00, 2.00, 126.98, 126.98, 140.00, NULL, NULL, '1', '2022-10-01 11:31:13', '2022-11-07 14:21:12'),
(57, 'PDT-000032', 'PI-0000001', 40.00, 23.00, 5.56, 5.56, 6.00, NULL, NULL, '1', '2022-10-01 11:31:13', '2022-10-28 12:38:58'),
(58, 'PDT-000033', 'PI-0000001', 10.00, 4.00, 582.58, 582.58, 630.00, NULL, NULL, '1', '2022-10-01 11:31:13', '2023-01-01 12:12:01'),
(60, 'PDT-000153', 'PI-0000002', 3.00, 1.00, 75.51, 75.51, 85.00, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-12-10 06:29:41'),
(61, 'PDT-000154', 'PI-0000002', 25.00, 7.00, 166.10, 166.10, 185.00, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-12-03 11:05:06'),
(62, 'PDT-000035', 'PI-0000002', 11.00, 9.00, 128.52, 128.52, 150.00, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-10-31 10:27:37'),
(63, 'PDT-000036', 'PI-0000002', 8.00, 3.00, 286.65, 286.65, 310.00, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-11-20 12:36:51'),
(64, 'PDT-000037', 'PI-0000002', 120.00, 90.00, 8.62, 8.62, 10.00, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-12-14 12:36:51'),
(65, 'PDT-000038', 'PI-0000002', 40.00, 22.00, 18.02, 18.02, 20.00, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-10-28 12:26:26'),
(66, 'PDT-000039', 'PI-0000002', 3.00, 2.00, 60.06, 60.06, 68.00, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-10-29 13:49:23'),
(67, 'PDT-000040', 'PI-0000002', 11.00, 0.00, 69.30, 69.30, 85.00, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(68, 'PDT-000162', 'PI-0000002', 3.00, 0.00, 807.88, 807.88, 860.00, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(69, 'PDT-000168', 'PI-0000002', 3.00, 0.00, 94.00, 94.00, 105.00, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(70, 'PDT-000170', 'PI-0000002', 3.00, 3.00, 482.63, 482.63, 525.00, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-10-22 13:44:29'),
(71, 'PDT-000171', 'PI-0000002', 3.00, 0.00, 171.62, 171.62, 188.00, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(72, 'PDT-000172', 'PI-0000002', 3.00, 2.00, 279.80, 279.80, 300.00, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(73, 'PDT-000173', 'PI-0000002', 20.00, 0.00, 7.59, 7.59, 8.00, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(74, 'PDT-000190', 'PI-0000002', 6.00, 0.00, 165.75, 165.75, 190.00, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(75, 'PDT-000191', 'PI-0000002', 5.00, 1.00, 292.50, 292.50, 335.00, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-12-23 11:01:25'),
(76, 'PDT-000194', 'PI-0000002', 5.00, 3.00, 58.50, 58.50, 65.00, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(77, 'PDT-000211', 'PI-0000002', 10.00, 1.00, 94.97, 94.97, 110.00, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(78, 'PDT-000213', 'PI-0000002', 10.00, 0.00, 146.25, 146.25, 160.00, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(79, 'PDT-000214', 'PI-0000002', 2.00, 0.00, 165.75, 165.75, 185.00, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(80, 'PDT-000215', 'PI-0000002', 9.00, 7.00, 63.82, 63.82, 70.00, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-11-21 12:15:20'),
(81, 'PDT-000219', 'PI-0000002', 3.00, 0.00, 86.24, 86.24, 95.00, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(82, 'PDT-000216', 'PI-0000002', 3.00, 0.00, 64.68, 64.68, 194.04, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-10-12 11:07:40'),
(83, 'PDT-000217', 'PI-0000002', 8.00, 3.00, 119.56, 119.56, 135.00, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-11-10 04:35:58'),
(84, 'PDT-000220', 'PI-0000002', 70.00, 20.00, 38.41, 38.41, 42.00, NULL, NULL, '1', '2022-10-01 19:18:35', '2022-12-03 11:05:06'),
(85, 'PDT-000251', 'PI-0000003', 10.00, 2.00, 45.85, 45.85, 50.00, NULL, NULL, '1', '2022-10-01 19:25:18', '2022-10-22 14:22:31'),
(86, 'PDT-000076', 'PI-0000004', 3.00, 2.00, 810.00, 810.00, 910.00, NULL, NULL, '1', '2022-10-02 04:56:01', '2022-10-12 11:07:40'),
(87, 'PDT-000067', 'PI-0000004', 21.00, 19.00, 324.84, 324.84, 350.00, NULL, NULL, '1', '2022-10-02 04:56:01', '2022-10-12 11:07:40'),
(88, 'PDT-000068', 'PI-0000004', 16.00, 12.00, 3062.81, 3062.81, 3400.00, NULL, NULL, '1', '2022-10-02 04:56:01', '2022-10-12 11:07:40'),
(89, 'PDT-000069', 'PI-0000004', 16.00, 7.00, 3290.62, 3290.62, 3500.00, NULL, NULL, '1', '2022-10-02 04:56:01', '2022-11-10 06:28:58'),
(90, 'PDT-000070', 'PI-0000004', 21.00, 3.00, 852.19, 852.19, 980.00, NULL, NULL, '1', '2022-10-02 04:56:01', '2022-12-07 06:58:56'),
(91, 'PDT-000071', 'PI-0000004', 11.00, 4.00, 855.00, 855.00, 850.00, NULL, NULL, '1', '2022-10-02 04:56:01', '2022-12-07 07:01:46'),
(92, 'PDT-000072', 'PI-0000004', 20.00, 4.00, 630.00, 630.00, 730.00, NULL, NULL, '1', '2022-10-02 04:56:01', '2023-01-01 07:02:34'),
(93, 'PDT-000073', 'PI-0000004', 20.00, 4.00, 434.53, 434.53, 530.00, NULL, NULL, '1', '2022-10-02 04:56:01', '2022-12-07 06:58:56'),
(94, 'PDT-000118', 'PI-0000005', 134.00, 9.00, 31.99, 31.99, 35.00, NULL, NULL, '1', '2022-10-02 05:15:03', '2022-12-05 10:34:51'),
(95, 'PDT-000119', 'PI-0000005', 11.00, 4.00, 336.36, 336.36, 370.00, NULL, NULL, '1', '2022-10-02 05:15:03', '2022-10-29 11:46:10'),
(96, 'PDT-000120', 'PI-0000005', 11.00, 1.00, 181.82, 181.82, 195.00, NULL, NULL, '1', '2022-10-02 05:15:03', '2022-10-12 11:07:40'),
(97, 'PDT-000121', 'PI-0000005', 11.00, 1.00, 162.39, 162.39, 180.00, NULL, NULL, '1', '2022-10-02 05:15:03', '2022-11-11 13:31:37'),
(98, 'PDT-000122', 'PI-0000005', 11.00, 1.00, 405.96, 405.96, 445.00, NULL, NULL, '1', '2022-10-02 05:15:03', '2022-11-20 12:27:34'),
(99, 'PDT-000123', 'PI-0000005', 220.00, 184.00, 16.24, 16.24, 19.00, NULL, NULL, '1', '2022-10-02 05:15:03', '2022-12-10 06:35:24'),
(100, 'PDT-000124', 'PI-0000005', 24.00, 9.00, 312.50, 312.50, 375.00, NULL, NULL, '1', '2022-10-02 05:15:03', '2022-12-30 11:47:58'),
(101, 'PDT-000125', 'PI-0000005', 110.00, 121.00, 30.00, 30.00, 35.00, NULL, NULL, '1', '2022-10-02 05:15:03', '2022-12-10 10:50:36'),
(102, 'PDT-000094', 'PI-0000005', 12.00, 0.00, 729.37, 729.37, 800.00, NULL, NULL, '1', '2022-10-02 05:15:03', '2022-10-12 11:07:40'),
(103, 'PDT-000095', 'PI-0000005', 45.00, 28.00, 570.12, 570.12, 650.00, NULL, NULL, '1', '2022-10-02 05:15:03', '2022-11-29 07:08:26'),
(104, 'PDT-000096', 'PI-0000005', 42.00, 13.00, 291.67, 291.67, 330.00, NULL, NULL, '1', '2022-10-02 05:15:03', '2022-11-24 06:24:01'),
(105, 'PDT-000097', 'PI-0000005', 95.00, 34.00, 178.57, 178.57, 200.00, NULL, NULL, '1', '2022-10-02 05:15:03', '2022-12-13 13:25:43'),
(106, 'PDT-000198', 'PI-0000005', 162.00, 37.00, 26.29, 26.29, 30.00, NULL, NULL, '1', '2022-10-02 05:15:03', '2022-11-12 05:52:31'),
(107, 'PDT-000253', 'PI-0000006', 32.00, 15.00, 272.81, 272.81, 285.00, NULL, NULL, '1', '2022-10-02 05:30:01', '2022-12-30 11:47:58'),
(108, 'PDT-000252', 'PI-0000006', 110.00, 0.00, 14.55, 14.55, 17.00, NULL, NULL, '1', '2022-10-02 05:30:01', '2022-10-12 11:07:41'),
(109, 'PDT-000129', 'PI-0000007', 15.00, 3.00, 796.41, 796.41, 860.00, NULL, NULL, '1', '2022-10-02 15:07:46', '2022-11-03 04:16:37'),
(110, 'PDT-000130', 'PI-0000007', 20.00, 6.00, 81.72, 81.72, 90.00, NULL, NULL, '1', '2022-10-02 15:07:46', '2022-11-14 12:53:26'),
(111, 'PDT-000131', 'PI-0000007', 13.00, 9.00, 111.35, 111.35, 130.00, NULL, NULL, '1', '2022-10-02 15:07:46', '2022-12-23 11:46:34'),
(112, 'PDT-000209', 'PI-0000007', 6.00, 3.00, 242.50, 242.50, 265.00, NULL, NULL, '1', '2022-10-02 15:07:46', '2022-11-05 14:21:50'),
(113, 'PDT-000105', 'PI-0000008', 120.00, 59.00, 354.68, 354.68, 385.00, NULL, NULL, '1', '2022-10-02 15:35:56', '2022-10-29 14:32:46'),
(114, 'PDT-000106', 'PI-0000008', 100.00, 43.00, 13.75, 13.75, 15.00, NULL, NULL, '1', '2022-10-02 15:35:56', '2022-12-06 13:09:03'),
(115, 'PDT-000107', 'PI-0000008', 517.00, 149.00, 161.87, 161.87, 170.00, NULL, NULL, '1', '2022-10-02 15:35:56', '2023-01-01 12:12:01'),
(116, 'PDT-000108', 'PI-0000008', 50.00, 52.00, 228.81, 228.81, 250.00, NULL, NULL, '1', '2022-10-02 15:35:56', '2022-11-10 13:42:56'),
(117, 'PDT-000109', 'PI-0000008', 6.00, 6.00, 683.06, 683.06, 730.00, NULL, NULL, '1', '2022-10-02 15:35:56', '2022-12-05 12:17:06'),
(118, 'PDT-000099', 'PI-0000008', 12.00, 12.00, 191.10, 191.10, 215.00, NULL, NULL, '1', '2022-10-02 15:35:56', '2022-12-03 13:20:54'),
(119, 'PDT-000110', 'PI-0000008', 5.00, 4.00, 910.00, 910.00, 950.00, NULL, NULL, '1', '2022-10-02 15:35:56', '2022-10-31 13:13:42'),
(120, 'PDT-000111', 'PI-0000008', 6.00, 5.00, 480.00, 480.00, 510.00, NULL, NULL, '1', '2022-10-02 15:35:56', '2022-10-28 14:20:30'),
(121, 'PDT-000112', 'PI-0000008', 10.00, 0.00, 313.60, 313.60, 330.00, NULL, NULL, '1', '2022-10-02 15:35:56', '2022-10-12 11:07:41'),
(122, 'PDT-000113', 'PI-0000008', 10.00, 1.00, 931.00, 931.00, 980.00, NULL, NULL, '1', '2022-10-02 15:35:56', '2022-10-12 11:07:41'),
(123, 'PDT-000114', 'PI-0000008', 21.00, 15.00, 336.00, 336.00, 360.00, NULL, NULL, '1', '2022-10-02 15:35:56', '2022-11-29 04:13:49'),
(124, 'PDT-000115', 'PI-0000008', 12.00, 0.00, 298.90, 298.90, 215.00, NULL, NULL, '1', '2022-10-02 15:35:56', '2022-10-12 11:07:41'),
(125, 'PDT-000116', 'PI-0000008', 6.00, 4.00, 1421.00, 1421.00, 1500.00, NULL, NULL, '1', '2022-10-02 15:35:56', '2022-10-12 11:07:41'),
(126, 'PDT-000117', 'PI-0000008', 120.00, 54.00, 20.89, 20.89, 23.00, NULL, NULL, '1', '2022-10-02 15:35:56', '2022-11-22 04:25:49'),
(127, 'PDT-000159', 'PI-0000009', 5.00, 5.00, 375.00, 375.00, 410.00, NULL, NULL, '1', '2022-10-02 15:46:27', '2022-10-31 14:29:01'),
(128, 'PDT-000044', 'PI-0000009', 23.00, 12.00, 806.27, 806.27, 900.00, NULL, NULL, '1', '2022-10-02 15:46:27', '2022-10-31 13:13:42'),
(129, 'PDT-000064', 'PI-0000009', 41.00, 24.00, 1271.33, 1271.33, 1450.00, NULL, NULL, '1', '2022-10-02 15:46:27', '2022-11-29 12:11:44'),
(130, 'PDT-000078', 'PI-0000010', 260.00, 20.00, 11.31, 11.31, 15.00, NULL, NULL, '1', '2022-10-02 16:02:54', '2022-10-27 14:54:24'),
(131, 'PDT-000079', 'PI-0000010', 21.00, 20.00, 241.18, 241.18, 300.00, NULL, NULL, '1', '2022-10-02 16:02:54', '2022-10-31 13:13:42'),
(132, 'PDT-000080', 'PI-0000010', 22.00, 1.00, 20.49, 20.49, 25.00, NULL, NULL, '1', '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(133, 'PDT-000081', 'PI-0000010', 57.00, 18.00, 44.70, 44.70, 60.00, NULL, NULL, '1', '2022-10-02 16:02:54', '2022-12-05 10:33:11'),
(134, 'PDT-000082', 'PI-0000010', 10.00, 2.00, 637.88, 637.88, 700.00, NULL, NULL, '1', '2022-10-02 16:02:54', '2022-12-03 14:10:56'),
(135, 'PDT-000083', 'PI-0000010', 6.00, 0.00, 137.00, 137.00, 150.00, NULL, NULL, '1', '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(136, 'PDT-000084', 'PI-0000010', 11.00, 4.00, 285.30, 285.30, 320.00, NULL, NULL, '1', '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(137, 'PDT-000085', 'PI-0000010', 9.00, 0.00, 635.91, 635.91, 720.00, NULL, NULL, '1', '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(138, 'PDT-000086', 'PI-0000010', 3.00, 2.00, 785.00, 785.00, 880.00, NULL, NULL, '1', '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(139, 'PDT-000087', 'PI-0000010', 10.00, 0.00, 262.64, 262.64, 290.00, NULL, NULL, '1', '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(140, 'PDT-000088', 'PI-0000010', 57.00, 59.00, 85.96, 85.96, 100.00, NULL, NULL, '1', '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(141, 'PDT-000089', 'PI-0000010', 32.00, 31.00, 18.38, 18.38, 22.00, NULL, NULL, '1', '2022-10-02 16:02:54', '2022-12-14 12:36:51'),
(142, 'PDT-000090', 'PI-0000010', 122.00, 19.00, 31.18, 31.18, 35.00, NULL, NULL, '1', '2022-10-02 16:02:54', '2022-12-10 06:29:41'),
(143, 'PDT-000091', 'PI-0000010', 8.00, 4.00, 697.14, 697.14, 780.00, NULL, NULL, '1', '2022-10-02 16:02:54', '2022-11-13 11:36:41'),
(144, 'PDT-000092', 'PI-0000010', 11.00, 5.00, 285.09, 285.09, 315.00, NULL, NULL, '1', '2022-10-02 16:02:54', '2022-11-10 06:28:58'),
(145, 'PDT-000093', 'PI-0000010', 11.00, 2.00, 157.29, 157.29, 180.00, NULL, NULL, '1', '2022-10-02 16:02:54', '2022-11-16 11:12:21'),
(146, 'PDT-000195', 'PI-0000010', 4.00, 0.00, 249.42, 249.42, 295.00, NULL, NULL, '1', '2022-10-02 16:02:54', '2022-10-12 11:07:41'),
(147, 'PDT-000196', 'PI-0000010', 5.00, 3.00, 232.26, 232.26, 245.00, NULL, NULL, '1', '2022-10-02 16:02:54', '2022-11-25 05:01:14'),
(148, 'PDT-000197', 'PI-0000010', 9.00, 7.00, 596.80, 596.80, 530.00, NULL, NULL, '1', '2022-10-02 16:02:54', '2022-11-04 12:01:42'),
(149, 'PDT-000174', 'PI-0000011', 6.00, 3.00, 550.00, 550.00, 590.00, NULL, NULL, '1', '2022-10-02 16:05:07', '2022-12-07 04:35:33'),
(150, 'PDT-000077', 'PI-0000012', 11.00, 3.00, 1506.82, 1506.82, 1630.00, NULL, NULL, '1', '2022-10-03 06:14:04', '2022-10-31 14:29:01'),
(151, 'PDT-000043', 'PI-0000012', 21.00, 8.00, 124.44, 124.44, 140.00, NULL, NULL, '1', '2022-10-03 06:14:04', '2023-01-01 14:20:11'),
(152, 'PDT-000045', 'PI-0000012', 10.00, 1.00, 869.16, 869.16, 950.00, NULL, NULL, '1', '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(153, 'PDT-000046', 'PI-0000012', 22.00, 10.00, 99.78, 99.78, 120.00, NULL, NULL, '1', '2022-10-03 06:14:04', '2022-12-03 13:20:54'),
(154, 'PDT-000048', 'PI-0000012', 5.00, 2.00, 117.00, 117.00, 140.00, NULL, NULL, '1', '2022-10-03 06:14:04', '2022-11-17 04:49:26'),
(155, 'PDT-000049', 'PI-0000012', 50.00, 11.00, 16.66, 16.66, 20.00, NULL, NULL, '1', '2022-10-03 06:14:04', '2022-11-11 10:17:08'),
(156, 'PDT-000050', 'PI-0000012', 22.00, 10.00, 81.96, 81.96, 100.00, NULL, NULL, '1', '2022-10-03 06:14:04', '2022-12-28 06:31:58'),
(157, 'PDT-000052', 'PI-0000012', 12.00, 4.00, 175.18, 175.18, 220.00, NULL, NULL, '1', '2022-10-03 06:14:04', '2022-12-04 07:13:52'),
(158, 'PDT-000053', 'PI-0000012', 52.00, 14.00, 168.00, 168.00, 230.00, NULL, NULL, '1', '2022-10-03 06:14:04', '2023-01-01 12:12:01'),
(159, 'PDT-000054', 'PI-0000012', 12.00, 6.00, 624.92, 624.92, 710.00, NULL, NULL, '1', '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(160, 'PDT-000055', 'PI-0000012', 3.00, 1.00, 2812.17, 2812.17, 3100.00, NULL, NULL, '1', '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(161, 'PDT-000056', 'PI-0000012', 100.00, 8.00, 17.04, 17.04, 20.00, NULL, NULL, '1', '2022-10-03 06:14:04', '2022-10-12 11:07:42'),
(162, 'PDT-000057', 'PI-0000012', 23.00, 12.00, 1296.78, 1296.78, 1500.00, NULL, NULL, '1', '2022-10-03 06:14:04', '2022-11-10 13:42:56'),
(163, 'PDT-000058', 'PI-0000012', 33.00, 17.00, 83.78, 83.78, 100.00, NULL, NULL, '1', '2022-10-03 06:14:04', '2022-12-04 07:13:52'),
(164, 'PDT-000059', 'PI-0000012', 33.00, 21.00, 340.00, 340.00, 400.00, NULL, NULL, '1', '2022-10-03 06:14:04', '2022-12-03 13:20:54'),
(165, 'PDT-000060', 'PI-0000012', 46.00, 21.00, 187.09, 187.09, 200.00, NULL, NULL, '1', '2022-10-03 06:14:04', '2022-12-04 07:13:52'),
(166, 'PDT-000061', 'PI-0000012', 110.00, 39.00, 72.82, 72.82, 80.00, NULL, NULL, '1', '2022-10-03 06:14:04', '2023-01-01 14:20:11'),
(167, 'PDT-000062', 'PI-0000012', 21.00, 9.00, 172.67, 172.67, 195.00, NULL, NULL, '1', '2022-10-03 06:14:04', '2023-01-01 12:12:01'),
(168, 'PDT-000063', 'PI-0000012', 11.00, 2.00, 279.74, 279.74, 300.00, NULL, NULL, '1', '2022-10-03 06:14:04', '2022-11-21 12:33:40'),
(169, 'PDT-000065', 'PI-0000012', 34.00, 10.00, 66.82, 66.82, 85.00, NULL, NULL, '1', '2022-10-03 06:14:04', '2022-12-28 06:31:58'),
(170, 'PDT-000066', 'PI-0000012', 126.00, 39.00, 271.81, 271.81, 310.00, NULL, NULL, '1', '2022-10-03 06:14:04', '2023-01-01 14:20:11'),
(171, 'PDT-000155', 'PI-0000012', 19.00, 4.00, 703.12, 703.12, 900.00, NULL, NULL, '1', '2022-10-03 06:14:04', '2022-11-15 12:26:39'),
(172, 'PDT-000156', 'PI-0000012', 10.00, 1.00, 728.00, 728.00, 900.00, NULL, NULL, '1', '2022-10-03 06:14:04', '2023-01-01 14:20:11'),
(173, 'PDT-000075', 'PI-0000013', 17.00, 11.00, 383.15, 383.15, 430.00, NULL, NULL, '1', '2022-10-03 06:17:01', '2022-12-03 13:20:54'),
(174, 'PDT-000074', 'PI-0000013', 28.00, 14.00, 1185.78, 1185.78, 1350.00, NULL, NULL, '1', '2022-10-03 06:17:01', '2022-10-29 14:32:46'),
(175, 'PDT-000180', 'PI-0000014', 2.00, 1.00, 596.16, 596.16, 650.00, NULL, NULL, '1', '2022-10-03 06:25:43', '2022-12-06 13:09:38'),
(176, 'PDT-000181', 'PI-0000014', 11.00, 6.00, 78.34, 78.34, 90.00, NULL, NULL, '1', '2022-10-03 06:25:43', '2022-12-01 06:11:13'),
(177, 'PDT-000182', 'PI-0000014', 10.00, 9.00, 268.80, 268.80, 290.00, NULL, NULL, '1', '2022-10-03 06:25:43', '2022-12-05 10:38:57'),
(178, 'PDT-000183', 'PI-0000014', 2.00, 0.00, 518.40, 518.40, 570.00, NULL, NULL, '1', '2022-10-03 06:25:43', '2022-10-12 11:07:43'),
(179, 'PDT-000192', 'PI-0000014', 20.00, 8.00, 13.20, 13.20, 15.00, NULL, NULL, '1', '2022-10-03 06:25:43', '2022-11-19 12:03:49'),
(180, 'PDT-000193', 'PI-0000014', 30.00, 10.00, 10.50, 10.50, 12.00, NULL, NULL, '1', '2022-10-03 06:25:43', '2022-10-31 11:38:35'),
(181, 'PDT-000218', 'PI-0000014', 3.00, 0.00, 622.00, 622.00, 660.00, NULL, NULL, '1', '2022-10-03 06:25:43', '2022-10-12 11:07:43'),
(182, 'PDT-000042', 'PI-0000015', 24.00, 6.00, 192.53, 192.53, 220.00, NULL, NULL, '1', '2022-10-03 06:37:35', '2022-12-04 07:13:52'),
(183, 'PDT-000160', 'PI-0000016', 11.00, 2.00, 168.18, 168.18, 190.00, NULL, NULL, '1', '2022-10-03 06:41:23', '2022-10-31 11:21:53'),
(184, 'PDT-000161', 'PI-0000016', 10.00, 7.00, 950.00, 950.00, 1100.00, NULL, NULL, '1', '2022-10-03 06:41:23', '2022-12-14 12:36:51'),
(185, 'PDT-000199', 'PI-0000016', 3.00, 1.00, 465.33, 465.33, 500.00, NULL, NULL, '1', '2022-10-03 06:41:23', '2022-11-20 13:12:00'),
(186, 'PDT-000184', 'PI-0000017', 11.00, 2.00, 218.18, 218.18, 240.00, NULL, NULL, '1', '2022-10-03 06:55:22', '2022-10-12 11:07:43'),
(187, 'PDT-000185', 'PI-0000017', 2.00, 1.00, 1113.60, 1113.60, 1210.00, NULL, NULL, '1', '2022-10-03 06:55:22', '2022-10-12 11:07:43'),
(188, 'PDT-000186', 'PI-0000017', 1.00, 0.00, 107.52, 107.52, 120.00, NULL, NULL, '1', '2022-10-03 06:55:22', '2022-10-12 11:07:43'),
(189, 'PDT-000187', 'PI-0000017', 10.00, 0.00, 35.52, 35.52, 40.00, NULL, NULL, '1', '2022-10-03 06:55:22', '2022-10-12 11:07:43'),
(190, 'PDT-000188', 'PI-0000017', 11.00, 9.00, 417.16, 417.16, 480.00, NULL, NULL, '1', '2022-10-03 06:55:22', '2022-10-29 12:24:28'),
(191, 'PDT-000189', 'PI-0000017', 18.00, 17.00, 172.40, 172.40, 200.00, NULL, NULL, '1', '2022-10-03 06:55:22', '2022-12-10 10:50:36'),
(192, 'PDT-000178', 'PI-0000018', 8.00, 0.00, 209.50, 209.50, 232.00, NULL, NULL, '1', '2022-10-03 06:58:09', '2022-10-12 11:07:43'),
(193, 'PDT-000179', 'PI-0000018', 10.00, 0.00, 10.61, 10.61, 14.00, NULL, NULL, '1', '2022-10-03 06:58:09', '2022-10-12 11:07:43'),
(194, 'PDT-000205', 'PI-0000019', 13.00, 0.00, 120.00, 120.00, 140.00, NULL, NULL, '1', '2022-10-03 07:00:26', '2022-10-12 11:07:44'),
(195, 'PDT-000206', 'PI-0000019', 13.00, 0.00, 74.77, 74.77, 85.00, NULL, NULL, '1', '2022-10-03 07:00:26', '2022-10-12 11:07:44'),
(196, 'PDT-000221', 'PI-0000020', 54.00, 0.00, 16.89, 16.89, 18.00, NULL, NULL, '1', '2022-10-03 07:03:29', '2022-10-12 11:07:44'),
(197, 'PDT-000222', 'PI-0000020', 12.00, 0.00, 27.88, 27.88, 30.00, NULL, NULL, '1', '2022-10-03 07:03:29', '2022-10-12 11:07:44'),
(198, 'PDT-000223', 'PI-0000020', 11.00, 4.00, 27.28, 27.28, 31.00, NULL, NULL, '1', '2022-10-03 07:03:29', '2022-10-27 13:43:07'),
(199, 'PDT-000224', 'PI-0000020', 11.00, 0.00, 98.09, 98.09, 112.00, NULL, NULL, '1', '2022-10-03 07:03:29', '2022-10-12 11:07:44'),
(200, 'PDT-000227', 'PI-0000021', 10.00, 0.00, 55.20, 55.20, 60.00, NULL, NULL, '1', '2022-10-03 07:05:51', '2022-10-12 11:07:44'),
(201, 'PDT-000228', 'PI-0000021', 48.00, 10.00, 233.33, 233.33, 260.00, NULL, NULL, '1', '2022-10-03 07:05:51', '2022-10-28 12:30:48'),
(202, 'PDT-000229', 'PI-0000021', 14.00, 4.00, 971.09, 971.09, 1050.00, NULL, NULL, '1', '2022-10-03 07:05:51', '2022-12-01 12:52:25'),
(203, 'PDT-000210', 'PI-0000022', 25.00, 3.00, 134.00, 134.00, 150.00, NULL, NULL, '1', '2022-10-03 07:10:09', '2022-11-11 14:35:56'),
(204, 'PDT-000157', 'PI-0000023', 10.00, 4.00, 190.00, 190.00, 210.00, NULL, NULL, '1', '2022-10-03 07:11:48', '2022-12-02 12:50:56'),
(205, 'PDT-000132', 'PI-0000024', 22.00, 8.00, 93.84, 93.84, 105.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2023-01-01 11:00:32'),
(206, 'PDT-000133', 'PI-0000024', 65.00, 0.00, 73.06, 73.06, 90.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(207, 'PDT-000134', 'PI-0000024', 38.00, 0.00, 211.29, 211.29, 250.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(208, 'PDT-000135', 'PI-0000024', 11.00, 0.00, 58.65, 58.65, 70.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(209, 'PDT-000136', 'PI-0000024', 11.00, 7.00, 254.15, 254.15, 285.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-11-22 04:25:49'),
(210, 'PDT-000137', 'PI-0000024', 7.00, 2.00, 36.02, 36.02, 40.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-11-12 12:40:18'),
(211, 'PDT-000138', 'PI-0000024', 22.00, 10.00, 206.36, 206.36, 225.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-12-08 12:33:46'),
(212, 'PDT-000139', 'PI-0000024', 11.00, 4.00, 114.03, 114.03, 130.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-10-27 14:15:29'),
(213, 'PDT-000140', 'PI-0000024', 22.00, 12.00, 52.91, 52.91, 60.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-11-21 04:33:52'),
(214, 'PDT-000141', 'PI-0000024', 360.00, 22.00, 13.80, 13.80, 15.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-11-10 04:35:58'),
(215, 'PDT-000142', 'PI-0000024', 20.00, 3.00, 17.38, 17.38, 20.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-10-28 11:12:44'),
(216, 'PDT-000143', 'PI-0000024', 5.00, 1.00, 63.09, 63.09, 70.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-11-28 15:13:28'),
(217, 'PDT-000144', 'PI-0000024', 5.00, 6.00, 171.52, 171.52, 185.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-11-29 13:29:04'),
(218, 'PDT-000145', 'PI-0000024', 100.00, 4.00, 15.05, 15.05, 17.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(219, 'PDT-000146', 'PI-0000024', 321.00, 230.00, 7.82, 7.82, 10.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-12-10 06:35:24'),
(220, 'PDT-000147', 'PI-0000024', 100.00, 19.00, 17.20, 17.20, 20.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-11-20 10:48:13'),
(221, 'PDT-000148', 'PI-0000024', 1200.00, 673.00, 1.95, 1.95, 2.20, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-12-10 10:50:36'),
(222, 'PDT-000149', 'PI-0000024', 600.00, 226.00, 3.43, 3.43, 4.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-12-10 06:35:24'),
(223, 'PDT-000150', 'PI-0000024', 200.00, 128.00, 3.85, 3.85, 4.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2023-01-01 12:12:01'),
(224, 'PDT-000151', 'PI-0000024', 20.00, 8.00, 12.01, 12.01, 14.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(225, 'PDT-000163', 'PI-0000024', 55.00, 16.00, 264.55, 264.55, 320.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2023-01-01 11:00:32'),
(226, 'PDT-000164', 'PI-0000024', 220.00, 84.00, 10.14, 10.14, 12.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2023-01-01 11:00:32'),
(227, 'PDT-000165', 'PI-0000024', 11.00, 0.00, 599.64, 599.64, 690.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(228, 'PDT-000166', 'PI-0000024', 20.00, 11.00, 30.02, 30.02, 35.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-12-03 10:58:47'),
(229, 'PDT-000167', 'PI-0000024', 45.00, 0.00, 1143.42, 1143.42, 1285.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(230, 'PDT-000175', 'PI-0000024', 20.00, 0.00, 4.94, 4.94, 5.50, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(231, 'PDT-000176', 'PI-0000024', 200.00, 44.00, 18.01, 18.01, 22.50, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-11-24 06:51:59'),
(232, 'PDT-000177', 'PI-0000024', 70.00, 31.00, 30.11, 30.11, 33.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-12-05 10:36:25'),
(233, 'PDT-000242', 'PI-0000024', 18.00, 6.00, 76.13, 76.13, 85.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-12-23 11:18:34'),
(234, 'PDT-000200', 'PI-0000024', 6.00, 3.00, 73.53, 73.53, 90.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-10-28 12:40:36'),
(235, 'PDT-000201', 'PI-0000024', 8.00, 4.00, 111.46, 111.46, 130.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-12-10 06:29:41'),
(236, 'PDT-000202', 'PI-0000024', 8.00, 0.00, 206.36, 206.36, 235.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(237, 'PDT-000203', 'PI-0000024', 40.00, 0.00, 28.31, 28.31, 30.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(238, 'PDT-000204', 'PI-0000024', 20.00, 0.00, 72.77, 72.77, 82.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(239, 'PDT-000225', 'PI-0000024', 3.00, 3.00, 484.53, 484.53, 515.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-11-28 12:54:28'),
(240, 'PDT-000226', 'PI-0000024', 6.00, 1.00, 171.52, 171.52, 190.00, NULL, NULL, '1', '2022-10-03 07:31:31', '2022-10-12 11:07:45'),
(241, 'PDT-000152', 'PI-0000025', 50.00, 15.00, 92.64, 92.64, 105.00, NULL, NULL, '1', '2022-10-03 07:40:28', '2022-11-13 11:36:41'),
(242, 'PDT-000207', 'PI-0000025', 220.00, 0.00, 18.32, 18.32, 20.00, NULL, NULL, '1', '2022-10-03 07:40:28', '2022-10-12 11:07:45'),
(243, 'PDT-000208', 'PI-0000025', 20.00, 24.00, 85.95, 85.95, 100.00, NULL, NULL, '1', '2022-10-03 07:40:28', '2022-11-14 12:19:59'),
(244, 'PDT-000238', 'PI-0000025', 2.00, 0.00, 320.00, 320.00, 350.00, NULL, NULL, '1', '2022-10-03 07:40:28', '2022-10-12 11:07:45'),
(245, 'PDT-000230', 'PI-0000026', 7.00, 4.00, 257.51, 257.51, 390.00, NULL, NULL, '1', '2022-10-03 09:41:20', '2022-12-15 11:14:32'),
(246, 'PDT-000231', 'PI-0000026', 2.00, 0.00, 102.30, 102.30, 115.00, NULL, NULL, '1', '2022-10-03 09:41:20', '2022-10-12 11:07:46'),
(247, 'PDT-000232', 'PI-0000026', 7.00, 5.00, 512.43, 512.43, 600.00, NULL, NULL, '1', '2022-10-03 09:41:20', '2022-11-23 04:56:50'),
(248, 'PDT-000233', 'PI-0000026', 2.00, 0.00, 320.85, 320.85, 350.00, NULL, NULL, '1', '2022-10-03 09:41:20', '2022-10-12 11:07:46'),
(249, 'PDT-000234', 'PI-0000026', 15.00, 7.00, 569.86, 569.86, 720.00, NULL, NULL, '1', '2022-10-03 09:41:20', '2022-11-08 07:23:44'),
(250, 'PDT-000235', 'PI-0000026', 11.00, 7.00, 405.82, 405.82, 445.00, NULL, NULL, '1', '2022-10-03 09:41:20', '2022-12-14 12:36:51'),
(251, 'PDT-000236', 'PI-0000026', 2.00, 0.00, 242.80, 242.80, 270.00, NULL, NULL, '1', '2022-10-03 09:41:20', '2022-10-12 11:07:46'),
(252, 'PDT-000245', 'PI-0000027', 3.00, 2.00, 100.00, 100.00, 115.00, NULL, NULL, '1', '2022-10-03 10:01:30', '2022-10-31 12:57:30'),
(253, 'PDT-000246', 'PI-0000027', 3.00, 0.00, 132.00, 132.00, 145.00, NULL, NULL, '1', '2022-10-03 10:01:30', '2022-10-12 11:07:46'),
(254, 'PDT-000247', 'PI-0000027', 40.00, 0.00, 15.00, 15.00, 18.00, NULL, NULL, '1', '2022-10-03 10:01:30', '2022-10-12 11:07:46'),
(255, 'PDT-000249', 'PI-0000027', 8.00, 0.00, 17.45, 17.45, 20.00, NULL, NULL, '1', '2022-10-03 10:01:30', '2022-10-12 11:07:46'),
(256, 'PDT-000248', 'PI-0000027', 8.00, 6.00, 5.00, 5.00, 7.00, NULL, NULL, '1', '2022-10-03 10:01:30', '2022-10-12 11:07:46'),
(257, 'PDT-000240', 'PI-0000028', 11.00, 0.00, 57.27, 57.27, 65.00, NULL, NULL, '1', '2022-10-03 10:06:29', '2022-10-12 11:07:46'),
(258, 'PDT-000241', 'PI-0000028', 15.00, 1.00, 77.94, 77.94, 87.00, NULL, NULL, '1', '2022-10-03 10:06:29', '2023-01-01 11:00:32'),
(259, 'PDT-000243', 'PI-0000028', 17.00, 5.00, 87.56, 87.56, 97.00, NULL, NULL, '1', '2022-10-03 10:06:29', '2022-12-23 11:18:34'),
(260, 'PDT-000244', 'PI-0000028', 17.00, 1.00, 83.75, 83.75, 95.00, NULL, NULL, '1', '2022-10-03 10:06:29', '2022-12-23 11:18:34'),
(262, 'PDT-000158', 'PI-0000031', 10.00, 12.00, 311.15, 311.15, 340.00, NULL, NULL, '1', '2022-10-03 10:40:09', '2022-11-13 07:27:52'),
(263, 'PDT-000254', 'PI-0000032', 30.00, 22.00, 309.00, 309.00, 450.00, NULL, NULL, '1', '2022-10-03 11:04:26', '2022-12-03 10:54:19'),
(264, 'PDT-000001', 'PI-0000033', 114.00, 31.00, 3054.90, 3054.90, 0.00, NULL, NULL, '1', '2022-10-04 05:18:23', '2022-11-16 13:06:35'),
(265, 'PDT-000009', 'PI-0000036', 431.00, 228.00, 2845.00, 2845.00, 0.00, NULL, NULL, '1', '2022-10-04 07:30:35', '2022-11-10 12:03:43'),
(266, 'PDT-000256', 'PI-0000037', 11.00, 2.00, 1250.00, 1250.00, 1400.00, NULL, NULL, '1', '2022-10-04 11:55:31', '2022-11-07 14:02:41'),
(267, 'PDT-000257', 'PI-0000037', 8.00, 1.00, 56.00, 56.00, 70.00, NULL, NULL, '1', '2022-10-04 11:55:31', '2022-10-29 12:41:26'),
(268, 'PDT-000006', 'PI-0000038', 1226.00, 354.00, 2625.00, 2625.00, 0.00, NULL, NULL, '1', '2022-10-05 05:11:01', '2022-11-19 13:41:39'),
(269, 'PDT-000014', 'PI-0000041', 4.00, 3.00, 921.00, 921.00, 0.00, NULL, NULL, '1', '2022-10-05 05:18:37', '2022-10-12 11:07:50'),
(270, 'PDT-000258', 'PI-0000041', 243.00, 127.00, 2845.00, 2845.00, 0.00, NULL, NULL, '1', '2022-10-05 05:18:37', '2022-11-10 12:03:43'),
(271, 'PDT-000002', 'PI-0000042', 51.00, 51.00, 3054.90, 3054.90, 0.00, NULL, NULL, '1', '2022-10-05 05:26:47', '2022-11-11 10:17:08'),
(272, 'PDT-000003', 'PI-0000044', 53.00, 0.00, 2931.00, 2931.00, 0.00, NULL, NULL, '1', '2022-10-05 06:07:12', '2022-10-22 06:26:37'),
(273, 'PDT-000010', 'PI-0000053', 2520.00, 3300.00, 18.00, 18.00, 0.00, NULL, NULL, '1', '2022-10-05 06:57:02', '2022-10-12 11:07:52'),
(274, 'PDT-000015', 'PI-0000057', 2.00, 2.00, 921.00, 921.00, 0.00, NULL, NULL, '1', '2022-10-05 07:02:27', '2022-10-12 11:07:52'),
(275, 'PDT-000012', 'PI-0000061', 4.00, 1.00, 1023.00, 1023.00, 0.00, NULL, NULL, '1', '2022-10-05 07:08:31', '2022-10-12 11:07:53'),
(276, 'PDT-000259', 'PI-0000073', 6.00, 4.00, 257.51, 257.51, 275.00, NULL, NULL, '1', '2022-10-05 13:04:15', '2022-12-15 11:18:05'),
(277, 'PDT-000260', 'PI-0000073', 25.00, 2.00, 120.46, 120.46, 145.00, NULL, NULL, '1', '2022-10-05 13:04:15', '2022-12-15 11:18:05'),
(278, 'PDT-000261', 'PI-0000073', 13.00, 2.00, 290.91, 290.91, 370.00, NULL, NULL, '1', '2022-10-05 13:04:15', '2022-11-04 13:39:50'),
(279, 'PDT-000262', 'PI-0000073', 2.00, 0.00, 77.60, 77.60, 90.00, NULL, NULL, '1', '2022-10-05 13:04:15', '2022-10-12 11:07:55'),
(280, 'PDT-000263', 'PI-0000073', 3.00, 0.00, 335.74, 335.74, 365.00, NULL, NULL, '1', '2022-10-05 13:04:15', '2022-10-12 11:07:55'),
(281, 'PDT-000264', 'PI-0000073', 3.00, 0.00, 38.73, 38.73, 42.00, NULL, NULL, '1', '2022-10-05 13:04:15', '2022-10-12 11:07:55'),
(282, 'PDT-000265', 'PI-0000073', 3.00, 0.00, 172.16, 172.16, 190.00, NULL, NULL, '1', '2022-10-05 13:04:15', '2022-10-12 11:07:55'),
(283, 'PDT-000266', 'PI-0000073', 40.00, 8.00, 9.21, 9.21, 12.00, NULL, NULL, '1', '2022-10-05 13:04:15', '2022-11-05 05:45:39'),
(284, 'PDT-000268', 'PI-0000074', 110.00, 0.00, 7.75, 7.75, 9.00, NULL, NULL, '1', '2022-10-05 13:06:48', '2022-10-27 11:18:37'),
(285, 'PDT-000267', 'PI-0000074', 61.00, 16.00, 21.77, 21.77, 25.00, NULL, NULL, '1', '2022-10-05 13:06:48', '2022-12-10 06:25:51'),
(286, 'PDT-000169', 'PI-0000075', 200.00, 77.00, 8.39, 8.39, 10.00, NULL, NULL, '1', '2022-10-08 04:40:16', '2022-10-27 14:35:05'),
(287, 'PDT-000269', 'PI-0000076', 59.00, 37.00, 1140.00, 1140.00, 1310.00, NULL, NULL, '1', '2022-10-08 06:20:44', '2022-12-08 14:47:25'),
(288, 'PDT-000270', 'PI-0000077', 19.00, 18.00, 2250.00, 2250.00, 2270.00, NULL, NULL, '1', '2022-10-08 06:50:35', '2022-10-27 13:10:10'),
(289, 'PDT-000017', 'PI-0000078', 672.00, 80.00, 3.90, 3.90, 5.00, NULL, NULL, '1', '2022-10-08 07:12:39', '2022-12-23 11:01:25'),
(290, 'PDT-000271', 'PI-0000079', 20.00, 1.00, 17.60, 17.60, 20.00, NULL, NULL, '1', '2022-10-09 04:57:48', '2022-10-12 11:07:56'),
(291, 'PDT-000272', 'PI-0000080', 11.00, 10.00, 360.01, 360.01, 390.00, NULL, NULL, '1', '2022-10-09 05:12:47', '2022-10-28 14:09:17'),
(292, 'PDT-000239', 'PI-0000081', 1.00, 1.00, 485.00, 485.00, 550.00, NULL, NULL, '1', '2022-10-09 05:18:05', '2022-10-12 11:07:57'),
(293, 'PDT-000034', 'PI-0000082', 30.00, 21.00, 86.13, 86.13, 95.00, NULL, NULL, '1', '2022-10-09 05:39:26', '2022-12-02 12:50:56'),
(294, 'PDT-000126', 'PI-0000083', 110.00, 28.00, 14.55, 14.55, 17.00, NULL, NULL, '1', '2022-10-09 11:38:47', '2022-11-15 06:31:39'),
(295, 'PDT-000127', 'PI-0000084', 100.00, 35.00, 15.79, 15.79, 18.00, NULL, NULL, '1', '2022-10-09 11:44:17', '2022-11-28 14:37:11'),
(296, 'PDT-000274', 'PI-0000085', 2.00, 0.00, 111.11, 111.11, 135.00, NULL, NULL, '1', '2022-10-09 12:11:34', '2022-10-12 11:07:58'),
(297, 'PDT-000103', 'PI-0000086', 13640.00, 10640.00, 39.00, 39.00, 0.00, NULL, NULL, '1', '2022-10-09 12:35:02', '2022-10-31 13:36:16'),
(299, 'PDT-000275', 'PI-0000095', 11.00, 4.00, 26.45, 26.45, 32.00, NULL, NULL, '1', '2022-10-22 07:43:39', '2022-12-02 12:50:56'),
(300, 'PDT-000276', 'PI-0000095', 20.00, 9.00, 129.34, 129.34, 150.00, NULL, NULL, '1', '2022-10-22 07:43:39', '2022-10-28 13:38:52'),
(301, 'PDT-000279', 'PI-0000095', 36.00, 14.00, 13.72, 13.72, 15.00, NULL, NULL, '1', '2022-10-22 07:43:39', '2023-01-01 11:00:32'),
(302, 'PDT-000281', 'PI-0000096', 4.00, 1.00, 295.85, 295.85, 350.00, NULL, NULL, '1', '2022-10-22 07:46:07', '2022-10-29 13:44:02'),
(303, 'PDT-000282', 'PI-0000096', 4.00, 0.00, 169.75, 169.75, 200.00, NULL, NULL, '1', '2022-10-22 07:46:07', '2022-10-22 07:46:07'),
(304, 'PDT-000277', 'PI-0000097', 11.00, 1.00, 103.18, 103.18, 140.00, NULL, NULL, '1', '2022-10-22 07:47:51', '2022-10-27 14:51:07'),
(305, 'PDT-000278', 'PI-0000098', 11.00, 0.00, 219.91, 219.91, 250.00, NULL, NULL, '1', '2022-10-22 07:49:33', '2022-10-22 07:49:33'),
(306, 'PDT-000283', 'PI-0000102', 100.00, 20.00, 8.91, 8.91, 11.00, NULL, NULL, '1', '2022-10-22 15:55:56', '2022-10-28 13:41:18'),
(307, 'PDT-000286', 'PI-0000103', 6.00, 2.00, 12.89, 12.89, 15.00, NULL, NULL, '1', '2022-10-26 07:13:01', '2022-11-09 12:59:56'),
(308, 'PDT-000287', 'PI-0000103', 6.00, 1.00, 34.44, 34.44, 40.00, NULL, NULL, '1', '2022-10-26 07:13:01', '2022-12-03 13:49:22'),
(309, 'PDT-000285', 'PI-0000103', 10.00, 0.00, 43.00, 43.00, 48.00, NULL, NULL, '1', '2022-10-26 07:13:01', '2022-10-26 07:13:01'),
(310, 'PDT-000288', 'PI-0000107', 4.00, 3.00, 349.86, 349.86, 390.00, NULL, NULL, '1', '2022-10-27 11:38:52', '2022-11-21 13:03:58'),
(311, 'PDT-000289', 'PI-0000108', 11.00, 0.00, 445.45, 445.45, 550.00, NULL, NULL, '1', '2022-10-27 13:40:08', '2022-10-27 13:40:08'),
(312, 'PDT-000290', 'PI-0000108', 11.00, 0.00, 347.45, 347.45, 420.00, NULL, NULL, '1', '2022-10-27 13:40:08', '2022-10-27 13:40:08'),
(313, 'PDT-000291', 'PI-0000110', 5.00, 0.00, 124.20, 124.20, 145.00, NULL, NULL, '1', '2022-10-28 11:04:29', '2022-10-28 11:04:29'),
(315, 'PDT-000255', 'PI-0000111', 60.00, 30.00, 2785.45, 2785.45, 0.00, NULL, NULL, '1', '2022-10-28 11:45:14', '2022-11-05 13:41:35'),
(316, 'PDT-000292', 'PI-0000111', 5.00, 4.00, 1199.00, 1199.00, 1350.00, NULL, NULL, '1', '2022-10-28 11:45:14', '2022-10-29 12:20:52'),
(317, 'PDT-000016', 'PI-0000115', 800.00, 800.00, 41.00, 41.00, 0.00, NULL, NULL, '1', '2022-10-29 12:36:09', '2022-10-29 12:39:06'),
(318, 'PDT-000294', 'PI-0000116', 3.00, 0.00, 335.32, 335.32, 355.00, NULL, NULL, '1', '2022-10-29 14:26:08', '2022-10-29 14:26:08'),
(319, 'PDT-000295', 'PI-0000118', 1.00, 0.00, 640.00, 640.00, 700.00, NULL, NULL, '1', '2022-10-31 11:41:45', '2022-10-31 11:41:45'),
(320, 'PDT-000296', 'PI-0000120', 20.00, 3.00, 860.00, 860.00, 1080.00, NULL, NULL, '1', '2022-11-01 12:14:45', '2022-11-09 06:38:17'),
(321, 'PDT-000297', 'PI-0000122', 5.00, 1.00, 279.07, 279.07, 310.00, NULL, NULL, '1', '2022-11-04 13:36:03', '2022-11-06 04:35:36'),
(322, 'PDT-000298', 'PI-0000125', 1.00, 1.00, 370.00, 370.00, 380.00, NULL, NULL, '1', '2022-11-05 14:02:17', '2022-11-05 14:02:59'),
(323, 'PDT-000299', 'PI-0000132', 10.00, 6.00, 54.03, 54.03, 65.00, NULL, NULL, '1', '2022-11-09 12:56:39', '2022-12-03 13:49:22'),
(324, 'PDT-000300', 'PI-0000132', 9.00, 3.00, 80.00, 80.00, 90.00, NULL, NULL, '1', '2022-11-09 12:56:39', '2022-11-13 07:22:42'),
(325, 'PDT-000301', 'PI-0000132', 3.00, 0.00, 428.79, 428.79, 490.00, NULL, NULL, '1', '2022-11-09 12:56:39', '2022-11-09 12:56:39'),
(326, 'PDT-000302', 'PI-0000132', 3.00, 0.00, 214.40, 214.40, 240.00, NULL, NULL, '1', '2022-11-09 12:56:39', '2022-11-09 12:56:39'),
(327, 'PDT-000303', 'PI-0000132', 3.00, 0.00, 111.49, 111.49, 125.00, NULL, NULL, '1', '2022-11-09 12:56:39', '2022-11-09 12:56:39'),
(328, 'PDT-000011', 'PI-0000133', 5.00, 2.00, 900.00, 900.00, 1050.00, NULL, NULL, '1', '2022-11-10 12:03:43', '2022-12-01 06:19:31'),
(329, 'PDT-000304', 'PI-0000134', 1.00, 1.00, 430.00, 430.00, 450.00, NULL, NULL, '1', '2022-11-12 10:59:53', '2022-11-12 11:00:54'),
(330, 'PDT-000305', 'PI-0000135', 27.00, 4.00, 181.07, 181.07, 220.00, NULL, NULL, '1', '2022-11-13 07:22:42', '2022-12-03 13:34:46'),
(331, 'PDT-000280', 'PI-0000137', 2.00, 0.00, 665.00, 665.00, 690.00, NULL, NULL, '1', '2022-11-15 12:16:47', '2022-11-15 12:16:47'),
(332, 'PDT-000306', 'PI-0000141', 11.00, 1.00, 187.09, 187.09, 235.00, NULL, NULL, '1', '2022-11-18 12:23:01', '2022-11-20 12:36:51'),
(333, 'PDT-000307', 'PI-0000144', 10.00, 0.00, 126.29, 126.29, 140.00, NULL, NULL, '1', '2022-11-22 06:06:24', '2022-11-22 06:06:24'),
(334, 'PDT-000308', 'PI-0000144', 20.00, 0.00, 29.60, 29.60, 35.00, NULL, NULL, '1', '2022-11-22 06:06:24', '2022-11-22 06:06:24'),
(335, 'PDT-000309', 'PI-0000144', 11.00, 0.00, 771.00, 771.00, 900.00, NULL, NULL, '1', '2022-11-22 06:06:24', '2022-11-22 06:06:24'),
(336, 'PDT-000310', 'PI-0000145', 11.00, 0.00, 1741.55, 1741.55, 2050.00, NULL, NULL, '1', '2022-11-24 11:57:45', '2022-12-08 13:12:47'),
(337, 'PDT-000311', 'PI-0000146', 10.00, 0.00, 75.66, 75.66, 85.00, NULL, NULL, '1', '2022-11-24 12:29:30', '2022-11-24 12:29:30'),
(338, 'PDT-000312', 'PI-0000146', 50.00, 0.00, 8.20, 8.20, 9.00, NULL, NULL, '1', '2022-11-24 12:29:30', '2022-11-24 12:29:30'),
(339, 'PDT-000313', 'PI-0000146', 20.00, 0.00, 2.80, 2.80, 3.00, NULL, NULL, '1', '2022-11-24 12:29:30', '2022-11-24 12:29:30'),
(340, 'PDT-000314', 'PI-0000147', 20.00, 12.00, 26.40, 26.40, 30.00, NULL, NULL, '1', '2022-11-29 07:08:26', '2022-12-14 12:36:51'),
(341, 'PDT-000315', 'PI-0000149', 10.00, 0.00, 249.80, 249.80, 270.00, NULL, NULL, '1', '2022-12-07 06:44:30', '2022-12-07 06:44:30'),
(342, 'PDT-000316', 'PI-0000150', 15.00, 0.00, 156.40, 156.40, 195.00, NULL, NULL, '1', '2022-12-07 06:51:02', '2022-12-07 06:51:02'),
(343, 'PDT-000317', 'PI-0000153', 10.00, 0.00, 73.90, 73.90, 95.00, NULL, NULL, '1', '2022-12-08 12:25:14', '2022-12-08 12:25:14'),
(344, 'PDT-000318', 'PI-0000154', 11.00, 0.00, 149.90, 149.90, 185.00, NULL, NULL, '1', '2022-12-08 12:33:46', '2022-12-08 12:33:46'),
(345, 'PDT-000319', 'PI-0000155', 6.00, 0.00, 699.36, 699.36, 800.00, NULL, NULL, '1', '2022-12-08 12:47:10', '2022-12-08 12:47:10'),
(346, 'PDT-000320', 'PI-0000158', 10.00, 0.00, 1181.00, 1181.00, 1300.00, NULL, NULL, '1', '2022-12-11 13:03:33', '2022-12-11 13:03:33'),
(347, 'PDT-000321', 'PI-0000162', 3.00, 0.00, 103.14, 103.14, 115.00, NULL, NULL, '1', '2022-12-23 11:11:40', '2022-12-23 11:11:40'),
(348, 'PDT-000322', 'PI-0000162', 6.00, 0.00, 31.23, 31.23, 35.00, NULL, NULL, '1', '2022-12-23 11:11:40', '2022-12-23 11:11:40'),
(349, 'PDT-000323', 'PI-0000163', 6.00, 0.00, 86.10, 86.10, 95.00, NULL, NULL, '1', '2022-12-23 11:18:34', '2022-12-23 11:18:34'),
(350, 'PDT-000324', 'PI-0000164', 11.00, 0.00, 40.00, 40.00, 50.00, NULL, NULL, '1', '2022-12-23 11:22:27', '2022-12-23 11:22:27'),
(351, 'PDT-000325', 'PI-0000165', 3.00, 0.00, 485.00, 485.00, 585.00, NULL, NULL, '1', '2022-12-23 11:46:34', '2022-12-23 11:46:34'),
(352, 'PDT-000326', 'PI-0000165', 1.00, 0.00, 200.00, 200.00, 220.00, NULL, NULL, '1', '2022-12-23 11:46:34', '2022-12-23 11:46:34'),
(353, 'PDT-000327', 'PI-0000168', 6.00, 0.00, 306.00, 306.00, 350.00, NULL, NULL, '1', '2023-01-01 07:02:34', '2023-01-01 07:02:34'),
(354, 'PDT-000328', 'PI-0000168', 10.00, 0.00, 103.50, 103.50, 125.00, NULL, NULL, '1', '2023-01-01 07:02:34', '2023-01-01 07:02:34'),
(355, 'PDT-000329', 'PI-0000168', 24.00, 0.00, 21.00, 21.00, 27.00, NULL, NULL, '1', '2023-01-01 07:02:34', '2023-01-01 07:02:34'),
(356, 'PDT-000330', 'PI-0000170', 6.00, 0.00, 386.00, 386.00, 450.00, NULL, NULL, '1', '2023-01-01 13:10:26', '2023-01-01 13:10:26'),
(357, 'PDT-000331', 'PI-0000171', 9.00, 0.00, 95.11, 95.11, 125.00, NULL, NULL, '1', '2023-01-01 14:20:11', '2023-01-01 14:20:11'),
(358, 'PDT-000332', 'PI-0000171', 9.00, 0.00, 462.22, 462.22, 530.00, NULL, NULL, '1', '2023-01-01 14:20:11', '2023-01-01 14:20:11'),
(359, 'PDT-000333', 'PI-0000171', 9.00, 0.00, 822.22, 822.22, 1000.00, NULL, NULL, '1', '2023-01-01 14:20:11', '2023-01-01 14:20:11'),
(360, 'PDT-000334', 'PI-0000171', 9.00, 0.00, 351.11, 351.11, 395.00, NULL, NULL, '1', '2023-01-01 14:20:11', '2023-01-01 14:20:11'),
(361, 'PDT-000335', 'PI-0000171', 9.00, 0.00, 1573.00, 1573.00, 1780.00, NULL, NULL, '1', '2023-01-01 14:20:11', '2023-01-01 14:20:11'),
(362, 'PDT-000336', 'PI-0000171', 9.00, 0.00, 222.22, 222.22, 270.00, NULL, NULL, '1', '2023-01-01 14:20:11', '2023-01-01 14:20:11'),
(363, 'PDT-000337', 'PI-0000171', 9.00, 0.00, 176.00, 176.00, 200.00, NULL, NULL, '1', '2023-01-01 14:20:11', '2023-01-01 14:20:11'),
(364, 'PDT-000338', 'PI-0000171', 12.00, 0.00, 1272.17, 1272.17, 1390.00, NULL, NULL, '1', '2023-01-01 14:20:11', '2023-01-01 14:20:11');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_info`
--

CREATE TABLE `supplier_info` (
  `supplier_id` varchar(15) NOT NULL,
  `supplier_branch_id` varchar(15) DEFAULT NULL,
  `supplier_sl` int(10) NOT NULL,
  `supplier_name_en` varchar(255) DEFAULT NULL,
  `supplier_name_bn` varchar(255) DEFAULT NULL,
  `supplier_phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_email` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_company_phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_company_address` text DEFAULT NULL,
  `supplier_admin_id` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `supplier_info`
--

INSERT INTO `supplier_info` (`supplier_id`, `supplier_branch_id`, `supplier_sl`, `supplier_name_en`, `supplier_name_bn`, `supplier_phone`, `supplier_address`, `supplier_email`, `supplier_company_name`, `supplier_company_phone`, `supplier_company_address`, `supplier_admin_id`, `created_at`, `updated_at`) VALUES
('S-00001', '1', 65, 'Nasir(Acme)', NULL, '01755584324', 'SONAGAZI', NULL, 'ACME', NULL, NULL, '1', '2022-09-26 11:49:08', '2022-09-26 11:49:08'),
('S-00002', '1', 67, 'RASED RENATA', NULL, '01847128169', 'RASED SONAGAZI', NULL, 'RENATA', NULL, NULL, '1', '2022-09-26 18:09:18', '2022-09-26 18:09:18'),
('S-00003', '1', 68, 'AL AMIN SKF', NULL, '01704120126', 'DAK BANGLA', NULL, 'SKF', NULL, NULL, '1', '2022-09-26 18:13:46', '2022-09-26 18:13:46'),
('S-00004', '1', 69, 'REZAUL AVON', NULL, '01730040547', 'FENI', NULL, 'AVON', NULL, NULL, '1', '2022-09-26 18:15:19', '2022-09-26 18:15:19'),
('S-00005', '1', 70, 'MIZANUR OPSONIN', NULL, '01838044764', 'SONAGAZI', NULL, '0PSONIN', NULL, NULL, '1', '2022-09-26 18:16:45', '2022-09-26 18:16:45'),
('S-00006', '1', 71, 'RIZBI EON', NULL, '01755521839', 'FENI', NULL, 'EON', NULL, NULL, '1', '2022-09-26 18:18:07', '2022-09-26 18:18:07'),
('S-00007', '1', 72, 'DR.ASIK', NULL, '01713241716', 'FENI', NULL, 'ELANCO', NULL, NULL, '1', '2022-09-26 18:19:17', '2022-09-26 18:19:17'),
('S-00008', '1', 73, 'SARIF DREAM', NULL, '01842002292', 'SAFAR PUR', NULL, 'DREAM AGRO', NULL, NULL, '1', '2022-09-26 18:21:59', '2022-09-26 18:21:59'),
('S-00009', '1', 74, 'ALOMGIR ACI', NULL, '01743591646', 'SONAGAZI', NULL, 'ACI', NULL, NULL, '1', '2022-09-26 18:23:27', '2022-09-26 18:23:27'),
('S-00010', '1', 75, 'FORHAD NEWTEC', NULL, '01762625642', 'FENI', NULL, 'NEWTEC', NULL, NULL, '1', '2022-09-26 18:25:37', '2022-09-26 18:25:37'),
('S-00011', '1', 76, 'BILLAL SUN AGRO', NULL, '01952013386', 'FENI', NULL, 'SUN AGRO', NULL, NULL, '1', '2022-09-26 18:27:58', '2022-09-26 18:27:58'),
('S-00012', '1', 77, 'SOHAG NOVIVO', NULL, '01716790228', 'FENI', NULL, 'NOVIVO', NULL, NULL, '1', '2022-09-26 18:29:54', '2022-09-26 18:29:54'),
('S-00013', '1', 78, 'DOCTORS', NULL, NULL, 'FENI', NULL, 'DOCTORS AGRO', NULL, NULL, '1', '2022-09-26 18:31:32', '2022-09-26 18:31:32'),
('S-00014', '1', 79, 'SALAUDDIN', NULL, '01686988099', 'FENI', NULL, 'POPULAR', NULL, NULL, '1', '2022-09-26 18:34:06', '2022-09-26 18:34:06'),
('S-00015', '1', 80, 'FARME', NULL, '0196889555', 'FENI', NULL, 'FHARMA&FARM', NULL, NULL, '1', '2022-09-26 18:35:53', '2022-09-26 18:35:53'),
('S-00016', '1', 81, 'NOR', NULL, '01321129931', 'FENI', NULL, 'NAVANA', NULL, NULL, '1', '2022-09-26 18:36:54', '2022-09-26 18:36:54'),
('S-00017', '1', 82, 'HAMID', NULL, '01321140762', 'DAK BANGLA', NULL, 'HAMDARD', NULL, NULL, '1', '2022-09-26 18:38:24', '2022-09-26 18:38:24'),
('S-00018', '1', 83, 'MIZAN OPSO', NULL, '01838044764', 'DAK BANGLA', NULL, 'OPSONIN', NULL, NULL, '1', '2022-09-26 18:40:17', '2022-09-26 18:40:17'),
('S-00019', '1', 84, 'SAZZAD', NULL, '01874865850', 'FENI', NULL, 'ADVANCE', NULL, NULL, '1', '2022-09-26 18:41:36', '2022-09-26 18:41:36'),
('S-00020', '1', 85, 'TAC', NULL, '01739466530', 'COMILLA', NULL, 'TECHNO DRUGS', NULL, NULL, '1', '2022-09-26 18:43:04', '2022-09-26 18:43:04'),
('S-00021', '1', 86, 'OBAIDUL', NULL, NULL, 'SONAGAZI', NULL, 'SQUARE', NULL, NULL, '1', '2022-09-26 18:43:55', '2022-09-26 18:43:55'),
('S-00022', '1', 87, 'SAHIN', NULL, '01776731466', 'COMILLA', NULL, 'RAFIQ MADICINE', NULL, NULL, '1', '2022-09-26 18:45:25', '2022-09-26 18:45:25'),
('S-00023', '1', 88, 'SOHAG', NULL, '01716790228', NULL, NULL, 'NOVIVO', NULL, NULL, '1', '2022-10-01 05:04:49', '2022-10-01 05:04:49'),
('S-00024', '1', 89, 'ONLINE', NULL, '01844051859', 'DHAKA', NULL, 'MADI AGRO', NULL, NULL, '1', '2022-10-03 11:02:52', '2022-10-03 11:02:52'),
('S-00025', '1', 90, 'younus/mahmud', NULL, '01844005511', NULL, NULL, 'GAUSIA FEED&CIHKIS', NULL, NULL, '1', '2022-10-04 05:15:55', '2022-10-04 05:15:55'),
('S-00026', '1', 91, 'MR MASUD', NULL, '01930283121', NULL, NULL, 'ALAL POULTRY&FISH FEED', NULL, NULL, '1', '2022-10-08 06:01:58', '2022-10-08 06:01:58'),
('S-00027', '1', 92, 'TOP TEN', NULL, '01819666380', NULL, NULL, 'TOP TEN HATCARY', NULL, NULL, '1', '2022-10-09 12:32:34', '2022-10-09 12:32:34'),
('S-00028', '1', 94, 'MITHUN', NULL, '01676049146', 'COMILLA', NULL, 'VAIJOO& BROTHERS', NULL, NULL, '1', '2022-10-26 06:11:32', '2022-10-26 06:11:32'),
('S-00029', '1', 95, 'TANIM', NULL, '01709638110', 'FENI', NULL, 'AFTAB', NULL, NULL, '1', '2022-10-28 11:19:51', '2022-10-28 11:19:51'),
('S-00030', '1', 96, 'SUMON', NULL, '01832873177', 'SONAGAZI', NULL, 'SKY TECH', NULL, NULL, '1', '2022-11-22 04:50:50', '2022-11-22 04:50:50'),
('S-00031', '1', 97, 'RUMON', NULL, '01715629224', 'FENI', NULL, 'ASTHA', NULL, NULL, '1', '2022-11-22 04:58:34', '2022-11-22 04:58:34'),
('S-00032', '1', 98, 'ANWAR', NULL, '01813714760', 'SONAGAZI', NULL, 'GLOBE', NULL, NULL, '1', '2022-11-24 12:06:41', '2022-11-24 12:06:41');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_payment`
--

CREATE TABLE `supplier_payment` (
  `id` int(10) NOT NULL,
  `invoice_no` varchar(15) DEFAULT NULL,
  `payment_date` varchar(50) DEFAULT NULL,
  `suplier_id` varchar(20) DEFAULT NULL,
  `payment` double(11,2) DEFAULT 0.00,
  `payment_type` varchar(50) DEFAULT NULL,
  `return_amount` double(11,2) DEFAULT 0.00,
  `returnpaid` double(11,2) DEFAULT 0.00,
  `discount` double(11,2) DEFAULT 0.00,
  `previous_due` double(11,2) DEFAULT 0.00,
  `entry_date` varchar(20) DEFAULT NULL,
  `admin_id` varchar(50) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `branch_id` varchar(11) DEFAULT NULL,
  `transaction_type` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `supplier_payment`
--

INSERT INTO `supplier_payment` (`id`, `invoice_no`, `payment_date`, `suplier_id`, `payment`, `payment_type`, `return_amount`, `returnpaid`, `discount`, `previous_due`, `entry_date`, `admin_id`, `comment`, `branch_id`, `transaction_type`, `created_at`, `updated_at`) VALUES
(66, 'PI-0000001', '2022-07-08', 'S-00002', 35741.25, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-01', '1', 'firstpayment', '1', NULL, '2022-10-01 11:31:13', '2022-10-24 05:43:27'),
(68, 'PI-0000002', '2022-08-07', 'S-00002', 32401.63, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-02', '1', 'firstpayment', '1', NULL, '2022-10-01 19:18:35', '2022-10-24 05:43:27'),
(69, 'PI-0000003', '2022-09-21', 'S-00002', 458.85, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-02', '1', 'firstpayment', '1', NULL, '2022-10-01 19:25:18', '2022-10-24 05:43:27'),
(70, 'PI-0000004', '2022-08-07', 'S-00004', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-02', '1', 'firstpayment', '1', NULL, '2022-10-02 04:56:01', '2022-10-24 05:43:27'),
(71, 'PI-0000005', '2022-08-16', 'S-00003', 51807.44, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-02', '1', 'firstpayment', '1', NULL, '2022-10-02 05:15:03', '2022-10-24 05:43:27'),
(72, 'PI-0000006', '2022-08-17', 'S-00003', 10965.42, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-02', '1', 'firstpayment', '1', NULL, '2022-10-02 05:30:01', '2022-10-24 05:43:27'),
(73, 'PI-0000007', '2022-10-02', 'S-00005', 15331.85, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-02', '1', 'firstpayment', '1', NULL, '2022-10-02 15:07:46', '2022-10-24 05:43:27'),
(74, 'PI-0000008', '2022-08-15', 'S-00007', 78152.38, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-02', '1', 'firstpayment', '1', NULL, '2022-10-02 15:35:56', '2022-10-24 05:43:27'),
(75, 'PI-0000009', '2022-08-14', 'S-00008', 19601.03, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-02', '1', 'firstpayment', '1', NULL, '2022-10-02 15:46:27', '2022-10-24 05:43:27'),
(76, 'PI-0000010', '2022-08-12', 'S-00009', 53877.27, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-02', '1', 'firstpayment', '1', NULL, '2022-10-02 16:02:54', '2022-10-24 05:43:27'),
(77, 'PI-0000011', '2022-09-05', 'S-00009', 3300.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-02', '1', 'firstpayment', '1', NULL, '2022-10-02 16:05:07', '2022-10-24 05:43:27'),
(78, 'PI-0000012', '2022-10-03', 'S-00010', 7000.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-03', '1', 'firstpayment', '1', NULL, '2022-10-03 06:14:04', '2022-10-24 05:43:27'),
(79, 'PI-0000013', '2022-08-08', 'S-00011', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-03', '1', 'firstpayment', '1', NULL, '2022-10-03 06:17:01', '2022-10-24 05:43:27'),
(80, 'PI-0000014', '2022-09-07', 'S-00015', 8013.86, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-03', '1', 'firstpayment', '1', NULL, '2022-10-03 06:25:43', '2022-10-24 05:43:27'),
(81, 'PI-0000015', '2022-10-03', 'S-00010', 4620.72, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-03', '1', 'firstpayment', '1', NULL, '2022-10-03 06:37:35', '2022-10-24 05:43:27'),
(82, 'PI-0000016', '2022-10-03', 'S-00013', 12745.95, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-03', '1', 'firstpayment', '1', NULL, '2022-10-03 06:41:23', '2022-10-24 05:43:27'),
(83, 'PI-0000017', '2022-10-03', 'S-00016', 10713.06, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-03', '1', 'firstpayment', '1', NULL, '2022-10-03 06:55:22', '2022-10-24 05:43:27'),
(84, 'PI-0000018', '2022-09-07', 'S-00014', 1782.10, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-03', '1', 'firstpayment', '1', NULL, '2022-10-03 06:58:09', '2022-10-24 05:43:27'),
(85, 'PI-0000019', '2022-09-18', 'S-00017', 2532.01, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-03', '1', 'firstpayment', '1', NULL, '2022-10-03 07:00:26', '2022-10-24 05:43:27'),
(86, 'PI-0000020', '2022-09-22', 'S-00020', 2625.69, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-03', '1', 'firstpayment', '1', NULL, '2022-10-03 07:03:29', '2022-10-24 05:43:27'),
(87, 'PI-0000021', '2022-10-03', 'S-00021', 4668.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-03', '1', 'firstpayment', '1', NULL, '2022-10-03 07:05:51', '2022-10-24 05:43:27'),
(88, 'PI-0000022', '2022-10-03', 'S-00019', 3350.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-03', '1', 'firstpayment', '1', NULL, '2022-10-03 07:10:09', '2022-10-24 05:43:27'),
(89, 'PI-0000023', '2022-08-21', 'S-00012', 1900.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-03', '1', 'firstpayment', '1', NULL, '2022-10-03 07:11:48', '2022-10-24 05:43:27'),
(90, 'PI-0000024', '2022-08-16', 'S-00001', 107388.22, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-03', '1', 'firstpayment', '1', NULL, '2022-10-03 07:31:31', '2022-10-24 05:43:27'),
(91, 'PI-0000025', '2022-08-16', 'S-00006', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-03', '1', 'firstpayment', '1', NULL, '2022-10-03 07:40:28', '2022-10-24 05:43:27'),
(92, 'PI-0000026', '2022-09-22', 'S-00022', 10599.37, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-03', '1', 'firstpayment', '1', NULL, '2022-10-03 09:41:20', '2022-10-24 05:43:27'),
(93, 'PI-0000027', '2022-09-22', 'S-00016', 1475.60, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-03', '1', 'firstpayment', '1', NULL, '2022-10-03 10:01:30', '2022-10-24 05:43:27'),
(94, 'PI-0000028', '2022-09-27', 'S-00001', 2256.87, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-03', '1', 'firstpayment', '1', NULL, '2022-10-03 10:06:29', '2022-10-24 05:43:27'),
(95, 'PI-0000029', '2022-09-29', 'S-00010', 26146.47, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-03', '1', 'firstpayment', '1', NULL, '2022-10-03 10:11:18', '2022-10-24 05:43:27'),
(96, 'PI-0000030', '2022-09-29', 'S-00003', 5000.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-03', '1', 'firstpayment', '1', NULL, '2022-10-03 10:13:38', '2022-10-24 05:43:27'),
(98, 'PI-0000031', '2022-09-26', 'S-00007', 54128.84, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-03', '1', 'firstpayment', '1', NULL, '2022-10-03 10:40:09', '2022-10-24 05:43:27'),
(99, 'PI-0000032', '2022-09-29', 'S-00024', 9270.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-03', '1', 'firstpayment', '1', NULL, '2022-10-03 11:04:26', '2022-10-24 05:43:27'),
(100, NULL, '2022-10-03', 'S-00006', 11021.40, 'Cash', 0.00, 0.00, NULL, 0.00, '2022-10-03', '1', NULL, '1', 'DuePaid', '2022-10-03 12:23:27', '2022-11-06 06:20:23'),
(101, NULL, '2022-10-03', 'S-00013', 0.02, 'Cash', 0.00, 0.00, NULL, 0.00, '2022-10-03', '1', NULL, '1', 'DuePaid', '2022-10-03 12:32:41', '2022-11-06 06:20:28'),
(102, 'PI-0000033', '2022-05-29', 'S-00025', 30120.00, 'Bank', 0.00, 0.00, 0.00, 0.00, '2022-10-04', '1', 'firstpayment', '1', NULL, '2022-10-04 05:18:23', '2022-10-24 05:43:27'),
(103, 'PI-0000034', '2022-06-01', 'S-00025', 30120.00, 'Bank', 0.00, 0.00, 0.00, 0.00, '2022-10-04', '1', 'firstpayment', '1', NULL, '2022-10-04 05:19:37', '2022-10-24 05:43:27'),
(104, 'PI-0000035', '2022-06-02', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-04', '1', 'firstpayment', '1', NULL, '2022-10-04 05:21:50', '2022-10-24 05:43:27'),
(105, 'PI-0000036', '2022-06-02', 'S-00025', 87830.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-04', '1', 'firstpayment', '1', NULL, '2022-10-04 07:30:35', '2022-10-24 05:43:27'),
(106, 'PI-0000037', '2022-10-04', 'S-00003', 14198.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-04', '1', 'firstpayment', '1', NULL, '2022-10-04 11:55:31', '2022-10-24 05:43:27'),
(108, 'PI-0000038', '2022-06-08', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 05:11:01', '2022-10-24 05:43:27'),
(109, 'PI-0000039', '2022-06-10', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 05:12:11', '2022-10-24 05:43:27'),
(110, 'PI-0000040', '2022-06-12', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 05:12:53', '2022-10-24 05:43:27'),
(111, 'PI-0000041', '2022-06-13', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 05:18:37', '2022-10-24 05:43:27'),
(112, 'PI-0000042', '2022-06-16', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 05:26:48', '2022-10-24 05:43:27'),
(113, 'PI-0000043', '2022-06-21', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 05:50:15', '2022-10-24 05:43:27'),
(114, 'PI-0000044', '2022-06-26', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 06:07:12', '2022-10-24 05:43:27'),
(115, 'PI-0000045', '2022-07-02', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 06:10:18', '2022-10-24 05:43:27'),
(116, 'PI-0000046', '2022-07-04', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 06:12:23', '2022-10-24 05:43:27'),
(117, 'PI-0000047', '2022-07-07', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 06:13:47', '2022-10-24 05:43:27'),
(118, 'PI-0000048', '2022-07-16', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 06:15:38', '2022-10-24 05:43:27'),
(119, 'PI-0000049', '2022-07-16', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 06:17:07', '2022-10-24 05:43:27'),
(120, 'PI-0000050', '2022-07-20', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 06:18:08', '2022-10-24 05:43:27'),
(121, 'PI-0000051', '2022-07-22', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 06:18:49', '2022-10-24 05:43:27'),
(122, 'PI-0000052', '2022-07-25', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 06:20:54', '2022-10-24 05:43:27'),
(123, 'PI-0000053', '2022-07-28', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 06:57:02', '2022-10-24 05:43:27'),
(124, 'PI-0000054', '2022-07-31', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 06:57:56', '2022-10-24 05:43:27'),
(125, 'PI-0000055', '2022-08-01', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 06:58:51', '2022-10-24 05:43:27'),
(126, 'PI-0000056', '2022-08-04', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 06:59:59', '2022-10-24 05:43:27'),
(127, 'PI-0000057', '2022-08-04', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 07:02:27', '2022-10-24 05:43:27'),
(128, 'PI-0000058', '2022-08-07', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 07:03:19', '2022-10-24 05:43:27'),
(129, 'PI-0000059', '2022-08-11', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 07:04:29', '2022-10-24 05:43:27'),
(130, 'PI-0000060', '2022-08-13', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 07:05:42', '2022-10-24 05:43:27'),
(131, 'PI-0000061', '2022-08-18', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 07:08:31', '2022-10-24 05:43:27'),
(132, 'PI-0000062', '2022-08-20', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 07:09:24', '2022-10-24 05:43:27'),
(133, 'PI-0000063', '2022-08-25', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 07:10:28', '2022-10-24 05:43:27'),
(134, 'PI-0000064', '2022-08-28', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 07:12:17', '2022-10-24 05:43:27'),
(135, 'PI-0000065', '2022-09-08', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 07:13:54', '2022-10-24 05:43:27'),
(136, 'PI-0000066', '2022-09-11', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 07:14:39', '2022-10-24 05:43:27'),
(137, 'PI-0000067', '2022-09-14', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 07:15:34', '2022-10-24 05:43:27'),
(138, 'PI-0000068', '2022-09-20', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 07:16:26', '2022-10-24 05:43:27'),
(139, 'PI-0000069', '2022-09-22', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 07:17:08', '2022-10-24 05:43:27'),
(140, 'PI-0000070', '2022-10-02', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 07:17:59', '2022-10-24 05:43:27'),
(141, 'PI-0000071', '2022-10-04', 'S-00025', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 07:19:10', '2022-10-24 05:43:27'),
(142, 'PI-0000072', '2022-10-05', 'S-00002', 862.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 07:26:37', '2022-10-24 05:43:27'),
(143, 'PI-0000073', '2022-10-05', 'S-00014', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 13:04:15', '2022-10-24 05:43:27'),
(144, 'PI-0000074', '2022-10-05', 'S-00021', 296.20, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-05', '1', 'firstpayment', '1', NULL, '2022-10-05 13:06:48', '2022-10-24 05:43:27'),
(145, 'PI-0000075', '2022-10-08', 'S-00001', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-08', '1', 'firstpayment', '1', NULL, '2022-10-08 04:40:16', '2022-10-24 05:43:27'),
(146, 'PI-0000076', '2022-10-04', 'S-00026', 5875.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-08', '1', 'firstpayment', '1', NULL, '2022-10-08 06:20:44', '2022-10-24 05:43:27'),
(147, 'PI-0000077', '2022-10-08', 'S-00019', 13500.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-08', '1', 'firstpayment', '1', NULL, '2022-10-08 06:50:35', '2022-10-24 05:43:27'),
(148, 'PI-0000078', '2022-08-07', 'S-00002', 169.68, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-08', '1', 'firstpayment', '1', NULL, '2022-10-08 07:12:39', '2022-10-24 05:43:27'),
(149, 'PI-0000079', '2022-09-07', 'S-00001', 352.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-09', '1', 'firstpayment', '1', NULL, '2022-10-09 04:57:48', '2022-10-24 05:43:27'),
(150, 'PI-0000080', '2022-09-07', 'S-00002', 3960.11, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-09', '1', 'firstpayment', '1', NULL, '2022-10-09 05:12:47', '2022-10-24 05:43:27'),
(151, 'PI-0000081', '2022-10-09', 'S-00009', 485.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-09', '1', 'firstpayment', '1', NULL, '2022-10-09 05:18:05', '2022-10-24 05:43:27'),
(152, 'PI-0000082', '2022-09-09', 'S-00002', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-09', '1', 'firstpayment', '1', NULL, '2022-10-09 05:39:26', '2022-10-24 05:43:27'),
(153, 'PI-0000083', '2022-10-09', 'S-00003', 1600.50, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-09', '1', 'firstpayment', '1', NULL, '2022-10-09 11:38:47', '2022-10-24 05:43:27'),
(154, 'PI-0000084', '2022-10-09', 'S-00002', 1579.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-09', '1', 'firstpayment', '1', NULL, '2022-10-09 11:44:17', '2022-10-24 05:43:27'),
(155, 'PI-0000085', '2022-10-09', 'S-00001', 222.22, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-09', '1', 'firstpayment', '1', NULL, '2022-10-09 12:11:34', '2022-10-24 05:43:27'),
(156, 'PI-0000086', '2022-10-09', 'S-00027', 178230.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-09', '1', 'firstpayment', '1', NULL, '2022-10-09 12:35:02', '2022-10-24 05:43:27'),
(157, 'PI-0000087', '2022-08-25', 'S-00009', 2411.80, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-09', '1', 'firstpayment', '1', NULL, '2022-10-09 13:30:19', '2022-10-24 05:43:27'),
(158, 'PI-0000088', '2022-10-09', 'S-00019', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-09', '1', 'firstpayment', '1', NULL, '2022-10-09 13:49:08', '2022-10-24 05:43:27'),
(159, NULL, '2022-10-04', 'S-00001', 1678.00, 'Cash', 0.00, 0.00, NULL, 0.00, '2022-10-10', '1', NULL, '1', 'DuePaid', '2022-10-10 13:48:29', '2022-11-06 06:20:35'),
(160, NULL, '2022-10-04', 'S-00002', 737.25, 'Cash', 0.00, 0.00, NULL, 0.00, '2022-10-10', '1', NULL, '1', 'DuePaid', '2022-10-10 13:50:20', '2022-11-06 06:20:39'),
(161, 'PI-0000089', '2022-09-22', 'S-00022', 725.40, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-11', '1', 'firstpayment', '1', NULL, '2022-10-11 05:22:49', '2022-10-24 05:43:27'),
(164, 'PI-0000091', '2022-10-18', 'S-00021', 4900.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-18', '1', 'firstpayment', '1', NULL, '2022-10-18 15:08:08', '2022-10-26 09:07:56'),
(165, 'PI-0000092', '2022-10-18', 'S-00026', 120075.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-18', '1', 'firstpayment', '1', NULL, '2022-10-18 15:19:44', '2022-10-26 09:07:56'),
(166, 'PI-0000093', '2022-10-21', 'S-00009', 2984.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-21', '1', 'firstpayment', '1', NULL, '2022-10-21 06:01:17', '2022-10-26 09:07:56'),
(168, 'PI-0000094', '2022-10-08', 'S-00019', 13500.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-21', '1', 'firstpayment', '1', NULL, '2022-10-21 14:59:41', '2022-10-26 09:07:56'),
(171, 'PI-0000095', '2022-10-22', 'S-00001', 3083.99, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-22', '1', 'firstpayment', '1', NULL, '2022-10-22 07:43:39', '2022-10-26 09:07:56'),
(172, 'PI-0000096', '2022-10-18', 'S-00001', 1862.40, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-22', '1', 'firstpayment', '1', NULL, '2022-10-22 07:46:07', '2022-10-26 09:07:56'),
(173, 'PI-0000097', '2022-10-11', 'S-00005', 1134.98, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-22', '1', 'firstpayment', '1', NULL, '2022-10-22 07:47:51', '2022-10-26 09:07:56'),
(174, 'PI-0000098', '2022-10-12', 'S-00020', 2419.01, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-22', '1', 'firstpayment', '1', NULL, '2022-10-22 07:49:33', '2022-10-26 09:07:56'),
(177, 'PI-0000099', '2022-09-01', 'S-00008', 140250.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-22', '1', 'firstpayment', '1', NULL, '2022-10-22 12:45:07', '2022-10-26 09:07:56'),
(178, 'PI-0000100', '2022-09-12', 'S-00008', 506625.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-22', '1', 'firstpayment', '1', NULL, '2022-10-22 12:46:28', '2022-10-26 09:07:56'),
(181, 'PI-0000102', '2022-10-22', 'S-00002', 891.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-22', '1', 'firstpayment', '1', NULL, '2022-10-22 15:55:56', '2022-10-26 09:07:56'),
(182, 'PI-0000103', '2022-10-26', 'S-00001', 713.98, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-26', '1', 'firstpayment', '1', NULL, '2022-10-26 07:13:01', '2022-10-26 09:07:56'),
(183, 'PI-0000104', '2022-10-27', 'S-00021', 775.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-27', '1', 'firstpayment', '1', NULL, '2022-10-27 11:18:37', '2022-10-27 11:18:37'),
(184, 'PI-0000105', '2022-10-27', 'S-00010', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-27', '1', 'firstpayment', '1', NULL, '2022-10-27 11:22:55', '2022-10-27 11:22:55'),
(185, 'PI-0000106', '2022-10-27', 'S-00011', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-27', '1', 'firstpayment', '1', NULL, '2022-10-27 11:25:49', '2022-10-27 11:25:49'),
(186, 'PI-0000107', '2022-10-27', 'S-00021', 1399.44, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-27', '1', 'firstpayment', '1', NULL, '2022-10-27 11:38:52', '2022-10-27 11:38:52'),
(187, 'PI-0000108', '2022-10-23', 'S-00028', 5500.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-27', '1', 'firstpayment', '1', NULL, '2022-10-27 13:40:08', '2022-10-27 13:40:08'),
(188, 'PI-0000109', '2022-10-12', 'S-00027', 175500.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-27', '1', 'firstpayment', '1', NULL, '2022-10-27 14:23:32', '2022-10-27 14:23:32'),
(189, 'PI-0000110', '2022-10-28', 'S-00005', 621.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-28', '1', 'firstpayment', '1', NULL, '2022-10-28 11:04:29', '2022-10-28 11:04:29'),
(191, 'PI-0000111', '2022-10-16', 'S-00029', 315800.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-28', '1', 'firstpayment', '1', NULL, '2022-10-28 11:45:14', '2022-10-28 11:45:14'),
(192, 'PI-0000112', '2022-10-07', 'S-00026', 119375.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-28', '1', 'firstpayment', '1', NULL, '2022-10-28 11:52:04', '2022-10-28 11:52:04'),
(194, 'PI-0000113', '2022-09-01', 'S-00008', 140250.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-28', '1', 'firstpayment', '1', NULL, '2022-10-28 11:56:52', '2022-10-28 11:56:52'),
(195, 'PI-0000114', '2022-09-12', 'S-00008', 506625.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-28', '1', 'firstpayment', '1', NULL, '2022-10-28 11:58:56', '2022-10-28 11:58:56'),
(196, 'PI-0000115', '2022-10-29', 'S-00025', 32800.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-29', '1', 'firstpayment', '1', NULL, '2022-10-29 12:36:09', '2022-10-29 12:36:09'),
(197, 'PI-0000116', '2022-10-29', 'S-00002', 1005.96, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-29', '1', 'firstpayment', '1', NULL, '2022-10-29 14:26:08', '2022-10-29 14:26:08'),
(198, 'PI-0000117', '2022-10-31', 'S-00015', 210.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-31', '1', 'firstpayment', '1', NULL, '2022-10-31 11:38:35', '2022-10-31 11:38:35'),
(199, 'PI-0000118', '2022-10-31', 'S-00015', 640.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-31', '1', 'firstpayment', '1', NULL, '2022-10-31 11:41:45', '2022-10-31 11:41:45'),
(200, 'PI-0000119', '2022-10-31', 'S-00027', 178230.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-10-31', '1', 'firstpayment', '1', NULL, '2022-10-31 13:31:50', '2022-10-31 13:31:50'),
(201, 'PI-0000120', '2022-11-01', 'S-00021', 17200.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-01', '1', 'firstpayment', '1', NULL, '2022-11-01 12:14:45', '2022-11-01 12:14:45'),
(202, 'PI-0000121', '2022-11-04', 'S-00002', 682.08, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-04', '1', 'firstpayment', '1', NULL, '2022-11-04 13:28:07', '2022-11-04 13:28:07'),
(203, 'PI-0000122', '2022-11-04', 'S-00002', 1395.35, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-04', '1', 'firstpayment', '1', NULL, '2022-11-04 13:36:03', '2022-11-04 13:36:03'),
(204, 'PI-0000123', '2022-11-04', 'S-00014', 3200.01, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-04', '1', 'firstpayment', '1', NULL, '2022-11-04 13:39:50', '2022-11-04 13:39:50'),
(205, 'PI-0000124', '2022-11-04', 'S-00029', 143000.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-04', '1', 'firstpayment', '1', NULL, '2022-11-04 13:46:17', '2022-11-04 13:46:17'),
(206, NULL, '2022-11-05', 'S-00001', 100.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-05', '1', 'Test Entry', '1', NULL, '2022-11-05 07:13:30', '2022-11-05 07:13:30'),
(207, 'PI-0000125', '2022-11-05', 'S-00007', 370.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-05', '1', 'firstpayment', '1', NULL, '2022-11-05 14:02:17', '2022-11-05 14:02:17'),
(208, 'PI-0000126', '2022-11-05', 'S-00009', 187.09, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-05', '1', 'firstpayment', '1', NULL, '2022-11-05 14:05:32', '2022-11-05 14:05:32'),
(209, 'PI-0000127', '2022-11-05', 'S-00002', 382.92, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-05', '1', 'firstpayment', '1', NULL, '2022-11-05 14:14:12', '2022-11-05 14:14:12'),
(210, 'PI-0000128', '2022-11-05', 'S-00009', 187.09, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-05', '1', 'firstpayment', '1', NULL, '2022-11-05 14:15:17', '2022-11-05 14:15:17'),
(212, 'PI-0000129', '2022-11-08', 'S-00026', 8000.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-08', '1', 'firstpayment', '1', NULL, '2022-11-08 07:17:12', '2022-11-08 07:17:12'),
(213, 'PI-0000130', '2022-11-08', 'S-00022', 8260.75, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-08', '1', 'firstpayment', '1', NULL, '2022-11-08 07:23:44', '2022-11-08 07:23:44'),
(214, NULL, '2022-10-06', 'S-00004', 40000.00, 'Cash', 0.00, 0.00, NULL, 0.00, '2022-11-09', '1', 'BRACK BANK NPSB', '1', 'DuePaid', '2022-11-09 05:30:12', '2022-11-09 05:30:12'),
(215, NULL, '2022-10-06', 'S-00010', 35000.00, 'Cash', 0.00, 0.00, NULL, 0.00, '2022-11-09', '1', 'BRACK BANK NPSB', '1', 'DuePaid', '2022-11-09 05:31:12', '2022-11-09 05:31:12'),
(216, 'PI-0000131', '2022-11-09', 'S-00002', 2320.40, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-09', '1', 'firstpayment', '1', NULL, '2022-11-09 12:46:35', '2022-11-09 12:46:35'),
(217, 'PI-0000132', '2022-11-09', 'S-00001', 6270.24, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-09', '1', 'firstpayment', '1', NULL, '2022-11-09 12:56:39', '2022-11-09 12:56:39'),
(218, 'PI-0000133', '2022-11-10', 'S-00026', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-10', '1', 'firstpayment', '1', NULL, '2022-11-10 12:03:43', '2022-11-10 12:03:43'),
(220, 'PI-0000134', '2022-11-12', 'S-00015', 430.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-12', '1', 'firstpayment', '1', NULL, '2022-11-12 10:59:53', '2022-11-12 10:59:53'),
(221, 'PI-0000135', '2022-11-13', 'S-00001', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-13', '1', 'firstpayment', '1', NULL, '2022-11-13 07:22:42', '2022-11-13 07:22:42'),
(222, 'PI-0000136', '2022-11-14', 'S-00018', 817.20, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-14', '1', 'firstpayment', '1', NULL, '2022-11-14 12:53:26', '2022-11-14 12:53:26'),
(223, 'PI-0000137', '2022-11-15', 'S-00009', 1330.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-15', '1', 'firstpayment', '1', NULL, '2022-11-15 12:16:47', '2022-11-15 12:16:47'),
(224, 'PI-0000138', '2022-11-15', 'S-00010', 5000.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-15', '1', 'firstpayment', '1', NULL, '2022-11-15 12:26:39', '2022-11-15 12:26:39'),
(225, 'PI-0000139', '2022-11-15', 'S-00002', 1920.50, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-15', '1', 'firstpayment', '1', NULL, '2022-11-15 12:29:04', '2022-11-15 12:29:04'),
(226, 'PI-0000140', '2022-11-15', 'S-00003', 18442.48, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-15', '1', 'firstpayment', '1', NULL, '2022-11-15 12:42:13', '2022-11-15 12:42:13'),
(227, 'PI-0000141', '2022-11-18', 'S-00009', 2058.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-18', '1', 'firstpayment', '1', NULL, '2022-11-18 12:23:01', '2022-11-18 12:23:01'),
(228, 'PI-0000142', '2022-11-20', 'S-00002', 3322.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-20', '1', 'firstpayment', '1', NULL, '2022-11-20 06:22:21', '2022-11-20 06:22:21'),
(229, 'PI-0000143', '2022-11-20', 'S-00010', 10000.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-20', '1', 'firstpayment', '1', NULL, '2022-11-20 06:33:07', '2022-11-20 06:33:07'),
(230, 'PI-0000144', '2022-11-22', 'S-00021', 21017.89, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-22', '1', 'firstpayment', '1', NULL, '2022-11-22 06:06:24', '2022-11-22 06:06:24'),
(231, 'PI-0000145', '2022-11-24', 'S-00030', 19157.05, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-24', '1', 'firstpayment', '1', NULL, '2022-11-24 11:57:45', '2022-11-24 11:57:45'),
(232, 'PI-0000146', '2022-11-24', 'S-00032', 1222.60, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-24', '1', 'firstpayment', '1', NULL, '2022-11-24 12:29:30', '2022-11-24 12:29:30'),
(233, 'PI-0000147', '2022-11-29', 'S-00003', 10220.04, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-11-29', '1', 'firstpayment', '1', NULL, '2022-11-29 07:08:26', '2022-11-29 07:08:26'),
(234, 'PI-0000148', '2022-12-07', 'S-00001', 1746.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-12-07', '1', 'firstpayment', '1', NULL, '2022-12-07 06:33:13', '2022-12-07 06:33:13'),
(235, 'PI-0000149', '2022-12-07', 'S-00002', 5089.30, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-12-07', '1', 'firstpayment', '1', NULL, '2022-12-07 06:44:30', '2022-12-07 06:44:30'),
(236, 'PI-0000150', '2022-12-07', 'S-00021', 2346.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-12-07', '1', 'firstpayment', '1', NULL, '2022-12-07 06:51:02', '2022-12-07 06:51:02'),
(237, 'PI-0000151', '2022-12-07', 'S-00004', 20000.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-12-07', '1', 'firstpayment', '1', NULL, '2022-12-07 06:58:56', '2022-12-07 06:58:56'),
(238, 'PI-0000152', '2022-12-07', 'S-00004', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-12-07', '1', 'firstpayment', '1', NULL, '2022-12-07 07:01:46', '2022-12-07 07:01:46'),
(239, 'PI-0000153', '2022-12-08', 'S-00022', 739.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-12-08', '1', 'firstpayment', '1', NULL, '2022-12-08 12:25:14', '2022-12-08 12:25:14'),
(240, 'PI-0000154', '2022-12-08', 'S-00001', 5290.86, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-12-08', '1', 'firstpayment', '1', NULL, '2022-12-08 12:33:46', '2022-12-08 12:33:46'),
(241, 'PI-0000155', '2022-12-08', 'S-00009', 4196.16, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-12-08', '1', 'firstpayment', '1', NULL, '2022-12-08 12:47:10', '2022-12-08 12:47:10'),
(248, 'PR-000000001', '2022-12-08', 'S-00030', 0.00, NULL, 10449.30, 0.00, 0.00, 0.00, '2022-12-08', '1', 'ReturnAmount', '1', NULL, '2022-12-08 13:02:10', '2022-12-08 13:02:10'),
(250, 'PI-0000156', '2022-11-02', 'S-00021', 1088.50, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-12-08', '1', 'firstpayment', '1', NULL, '2022-12-08 14:07:47', '2022-12-08 14:07:47'),
(251, 'PI-0000157', '2022-12-08', 'S-00026', 17100.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-12-08', '1', 'firstpayment', '1', NULL, '2022-12-08 14:47:25', '2022-12-08 14:47:25'),
(252, 'PI-0000158', '2022-12-11', 'S-00013', 11310.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-12-11', '1', 'firstpayment', '1', NULL, '2022-12-11 13:03:33', '2022-12-11 13:03:33'),
(253, 'PI-0000159', '2022-12-13', 'S-00003', 4999.96, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-12-13', '1', 'firstpayment', '1', NULL, '2022-12-13 13:25:43', '2022-12-13 13:25:43'),
(255, 'PI-0000160', '2022-12-15', 'S-00014', 2097.59, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-12-15', '1', 'firstpayment', '1', NULL, '2022-12-15 11:18:05', '2022-12-15 11:18:05'),
(256, 'PI-0000161', '2022-12-23', 'S-00002', 4816.30, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-12-23', '1', 'firstpayment', '1', NULL, '2022-12-23 11:01:25', '2022-12-23 11:01:25'),
(257, 'PI-0000162', '2022-12-23', 'S-00002', 496.80, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-12-23', '1', 'firstpayment', '1', NULL, '2022-12-23 11:11:40', '2022-12-23 11:11:40'),
(258, 'PI-0000163', '2022-12-23', 'S-00001', 3485.88, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-12-23', '1', 'firstpayment', '1', NULL, '2022-12-23 11:18:34', '2022-12-23 11:18:34'),
(259, 'PI-0000164', '2022-12-23', 'S-00021', 440.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-12-23', '1', 'firstpayment', '1', NULL, '2022-12-23 11:22:27', '2022-12-23 11:22:27'),
(260, 'PI-0000165', '2022-12-23', 'S-00005', 1989.05, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-12-23', '1', 'firstpayment', '1', NULL, '2022-12-23 11:46:34', '2022-12-23 11:46:34'),
(261, 'PI-0000166', '2022-12-28', 'S-00010', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-12-28', '1', 'firstpayment', '1', NULL, '2022-12-28 06:31:58', '2022-12-28 06:31:58'),
(262, 'PI-0000167', '2022-12-30', 'S-00003', 8115.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2022-12-30', '1', 'firstpayment', '1', NULL, '2022-12-30 11:47:58', '2022-12-30 11:47:58'),
(263, 'PI-0000168', '2023-01-01', 'S-00004', 20000.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2023-01-01', '1', 'firstpayment', '1', NULL, '2023-01-01 07:02:34', '2023-01-01 07:02:34'),
(264, 'PI-0000169', '2023-01-01', 'S-00001', 0.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2023-01-01', '1', 'firstpayment', '1', NULL, '2023-01-01 11:00:32', '2023-01-01 11:00:32'),
(265, 'PI-0000170', '2023-01-01', 'S-00013', 2316.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2023-01-01', '1', 'firstpayment', '1', NULL, '2023-01-01 13:10:26', '2023-01-01 13:10:26'),
(266, 'PI-0000171', '2023-01-01', 'S-00010', 100000.00, 'Cash', 0.00, 0.00, 0.00, 0.00, '2023-01-01', '1', 'firstpayment', '1', NULL, '2023-01-01 14:20:11', '2023-01-01 14:20:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `asset_categoreys`
--
ALTER TABLE `asset_categoreys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asset_categoreys_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `asset_depreciations`
--
ALTER TABLE `asset_depreciations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asset_expenses`
--
ALTER TABLE `asset_expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asset_expenses_branch_id_foreign` (`branch_id`),
  ADD KEY `asset_expenses_asset_title_id_foreign` (`asset_title_id`),
  ADD KEY `asset_expenses_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `bank_information`
--
ALTER TABLE `bank_information`
  ADD PRIMARY KEY (`account_number`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `bank_transaction`
--
ALTER TABLE `bank_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_key1` (`account_id`);

--
-- Indexes for table `branch_info`
--
ALTER TABLE `branch_info`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `branch_sl` (`branch_sl`),
  ADD KEY `fkkey2` (`company_id`);

--
-- Indexes for table `cash_close`
--
ALTER TABLE `cash_close`
  ADD PRIMARY KEY (`id`,`cash_date`);

--
-- Indexes for table `cash_close_expense`
--
ALTER TABLE `cash_close_expense`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cash_date` (`cash_date`);

--
-- Indexes for table `cash_close_income`
--
ALTER TABLE `cash_close_income`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cash_date` (`cash_date`);

--
-- Indexes for table `company_info`
--
ALTER TABLE `company_info`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `customer_info`
--
ALTER TABLE `customer_info`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `customer_sl` (`customer_sl`);

--
-- Indexes for table `damageproducts`
--
ALTER TABLE `damageproducts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `draft_purchase_entry`
--
ALTER TABLE `draft_purchase_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_entry_product_id_foreign` (`product_id`);

--
-- Indexes for table `draft_purchase_ledger`
--
ALTER TABLE `draft_purchase_ledger`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_1` (`suplier_id`);

--
-- Indexes for table `draft_sales_entry`
--
ALTER TABLE `draft_sales_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `draft_sales_ledger`
--
ALTER TABLE `draft_sales_ledger`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_11` (`customer_id`);

--
-- Indexes for table `draft_sales_payment`
--
ALTER TABLE `draft_sales_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `draft_supplier_payment`
--
ALTER TABLE `draft_supplier_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_info`
--
ALTER TABLE `employee_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_salary_initialized`
--
ALTER TABLE `employee_salary_initialized`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_salary_payment`
--
ALTER TABLE `employee_salary_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_entry`
--
ALTER TABLE `expense_entry`
  ADD PRIMARY KEY (`sl`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income_entry`
--
ALTER TABLE `income_entry`
  ADD PRIMARY KEY (`sl`);

--
-- Indexes for table `income_expense_title`
--
ALTER TABLE `income_expense_title`
  ADD PRIMARY KEY (`sl`);

--
-- Indexes for table `internalloanprovide`
--
ALTER TABLE `internalloanprovide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `internalloanreceived`
--
ALTER TABLE `internalloanreceived`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `internalloanregister`
--
ALTER TABLE `internalloanregister`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `librality`
--
ALTER TABLE `librality`
  ADD PRIMARY KEY (`sl`);

--
-- Indexes for table `loanprovide`
--
ALTER TABLE `loanprovide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loanreceived`
--
ALTER TABLE `loanreceived`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loanregister`
--
ALTER TABLE `loanregister`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `measurement_subunit`
--
ALTER TABLE `measurement_subunit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sl` (`sl`),
  ADD KEY `fk` (`measurement_unit_id`);

--
-- Indexes for table `measurement_unit`
--
ALTER TABLE `measurement_unit`
  ADD PRIMARY KEY (`measurement_id`),
  ADD KEY `measurement_sl` (`measurement_sl`);

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
-- Indexes for table `pdt_brand`
--
ALTER TABLE `pdt_brand`
  ADD PRIMARY KEY (`brand_id`),
  ADD KEY `brand_sl` (`brand_sl`);

--
-- Indexes for table `pdt_category`
--
ALTER TABLE `pdt_category`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `product_category_item_id_foreign` (`cat_item_id`),
  ADD KEY `cat_sl` (`cat_sl`);

--
-- Indexes for table `pdt_item`
--
ALTER TABLE `pdt_item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `item_sl` (`item_sl`);

--
-- Indexes for table `pdt_pdtdetails`
--
ALTER TABLE `pdt_pdtdetails`
  ADD PRIMARY KEY (`pd_pdt_id`),
  ADD KEY `FK_product_productinfo_shipping_classes` (`pd_shipping_id`);

--
-- Indexes for table `pdt_productinfo`
--
ALTER TABLE `pdt_productinfo`
  ADD PRIMARY KEY (`pdt_id`),
  ADD KEY `product_productinfo_item_id_foreign` (`pdt_item_id`),
  ADD KEY `product_productinfo_category_id_foreign` (`pdt_cat_id`),
  ADD KEY `fk_key3` (`pdt_brand_id`),
  ADD KEY `fk4` (`pdt_subcat_id`);

--
-- Indexes for table `pdt_subcategory`
--
ALTER TABLE `pdt_subcategory`
  ADD PRIMARY KEY (`subcat_id`),
  ADD KEY `product_category_item_id_foreign` (`subcat_item_id`),
  ADD KEY `cat_sl` (`subcat_sl`);

--
-- Indexes for table `purchase_current`
--
ALTER TABLE `purchase_current`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_currentpurchase_product_id_foreign` (`pdt_id`);

--
-- Indexes for table `purchase_entry`
--
ALTER TABLE `purchase_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_entry_product_id_foreign` (`product_id`);

--
-- Indexes for table `purchase_ledger`
--
ALTER TABLE `purchase_ledger`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_1` (`suplier_id`);

--
-- Indexes for table `purchase_sales_current`
--
ALTER TABLE `purchase_sales_current`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_purchase_current`
--
ALTER TABLE `return_purchase_current`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_purchase_currentpurchase_product_id_foreign` (`pdt_id`);

--
-- Indexes for table `return_purchase_entry`
--
ALTER TABLE `return_purchase_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_purchase_entry_product_id_foreign` (`product_id`);

--
-- Indexes for table `return_purchase_ledger`
--
ALTER TABLE `return_purchase_ledger`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_1` (`suplier_id`);

--
-- Indexes for table `sales_current`
--
ALTER TABLE `sales_current`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_entry`
--
ALTER TABLE `sales_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_ledger`
--
ALTER TABLE `sales_ledger`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_11` (`customer_id`);

--
-- Indexes for table `sales_payment`
--
ALTER TABLE `sales_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_return_current`
--
ALTER TABLE `sales_return_current`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_return_entry`
--
ALTER TABLE `sales_return_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_return_ledger`
--
ALTER TABLE `sales_return_ledger`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_11` (`customer_id`);

--
-- Indexes for table `stock_products`
--
ALTER TABLE `stock_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index` (`product_id`,`branch_id`);

--
-- Indexes for table `supplier_info`
--
ALTER TABLE `supplier_info`
  ADD PRIMARY KEY (`supplier_id`),
  ADD KEY `supplier_sl` (`supplier_sl`),
  ADD KEY `fkkey1` (`supplier_branch_id`);

--
-- Indexes for table `supplier_payment`
--
ALTER TABLE `supplier_payment`
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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `asset_categoreys`
--
ALTER TABLE `asset_categoreys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `asset_depreciations`
--
ALTER TABLE `asset_depreciations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `asset_expenses`
--
ALTER TABLE `asset_expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bank_information`
--
ALTER TABLE `bank_information`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `bank_transaction`
--
ALTER TABLE `bank_transaction`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `branch_info`
--
ALTER TABLE `branch_info`
  MODIFY `branch_sl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cash_close`
--
ALTER TABLE `cash_close`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cash_close_expense`
--
ALTER TABLE `cash_close_expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cash_close_income`
--
ALTER TABLE `cash_close_income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `customer_info`
--
ALTER TABLE `customer_info`
  MODIFY `customer_sl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `damageproducts`
--
ALTER TABLE `damageproducts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `draft_purchase_entry`
--
ALTER TABLE `draft_purchase_entry`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `draft_purchase_ledger`
--
ALTER TABLE `draft_purchase_ledger`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `draft_sales_entry`
--
ALTER TABLE `draft_sales_entry`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6070;

--
-- AUTO_INCREMENT for table `draft_sales_ledger`
--
ALTER TABLE `draft_sales_ledger`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2038;

--
-- AUTO_INCREMENT for table `draft_sales_payment`
--
ALTER TABLE `draft_sales_payment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2117;

--
-- AUTO_INCREMENT for table `draft_supplier_payment`
--
ALTER TABLE `draft_supplier_payment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `employee_info`
--
ALTER TABLE `employee_info`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employee_salary_initialized`
--
ALTER TABLE `employee_salary_initialized`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employee_salary_payment`
--
ALTER TABLE `employee_salary_payment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `expense_entry`
--
ALTER TABLE `expense_entry`
  MODIFY `sl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `income_entry`
--
ALTER TABLE `income_entry`
  MODIFY `sl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `income_expense_title`
--
ALTER TABLE `income_expense_title`
  MODIFY `sl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `internalloanprovide`
--
ALTER TABLE `internalloanprovide`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `internalloanreceived`
--
ALTER TABLE `internalloanreceived`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `internalloanregister`
--
ALTER TABLE `internalloanregister`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `librality`
--
ALTER TABLE `librality`
  MODIFY `sl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `loanprovide`
--
ALTER TABLE `loanprovide`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `loanreceived`
--
ALTER TABLE `loanreceived`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `loanregister`
--
ALTER TABLE `loanregister`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pdt_brand`
--
ALTER TABLE `pdt_brand`
  MODIFY `brand_sl` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=469;

--
-- AUTO_INCREMENT for table `pdt_category`
--
ALTER TABLE `pdt_category`
  MODIFY `cat_sl` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3102;

--
-- AUTO_INCREMENT for table `pdt_item`
--
ALTER TABLE `pdt_item`
  MODIFY `item_sl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=397;

--
-- AUTO_INCREMENT for table `pdt_subcategory`
--
ALTER TABLE `pdt_subcategory`
  MODIFY `subcat_sl` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2724;

--
-- AUTO_INCREMENT for table `purchase_current`
--
ALTER TABLE `purchase_current`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=688;

--
-- AUTO_INCREMENT for table `purchase_entry`
--
ALTER TABLE `purchase_entry`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=602;

--
-- AUTO_INCREMENT for table `purchase_ledger`
--
ALTER TABLE `purchase_ledger`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT for table `purchase_sales_current`
--
ALTER TABLE `purchase_sales_current`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `return_purchase_current`
--
ALTER TABLE `return_purchase_current`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `return_purchase_entry`
--
ALTER TABLE `return_purchase_entry`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `return_purchase_ledger`
--
ALTER TABLE `return_purchase_ledger`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sales_current`
--
ALTER TABLE `sales_current`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1812;

--
-- AUTO_INCREMENT for table `sales_entry`
--
ALTER TABLE `sales_entry`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7512;

--
-- AUTO_INCREMENT for table `sales_ledger`
--
ALTER TABLE `sales_ledger`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2722;

--
-- AUTO_INCREMENT for table `sales_payment`
--
ALTER TABLE `sales_payment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2753;

--
-- AUTO_INCREMENT for table `sales_return_current`
--
ALTER TABLE `sales_return_current`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `sales_return_entry`
--
ALTER TABLE `sales_return_entry`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6066;

--
-- AUTO_INCREMENT for table `sales_return_ledger`
--
ALTER TABLE `sales_return_ledger`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2031;

--
-- AUTO_INCREMENT for table `stock_products`
--
ALTER TABLE `stock_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=365;

--
-- AUTO_INCREMENT for table `supplier_info`
--
ALTER TABLE `supplier_info`
  MODIFY `supplier_sl` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `supplier_payment`
--
ALTER TABLE `supplier_payment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `asset_depreciations`
--
ALTER TABLE `asset_depreciations`
  ADD CONSTRAINT `asset_depreciations_asset_title_id_foreign` FOREIGN KEY (`asset_title_id`) REFERENCES `asset_categoreys` (`id`);

--
-- Constraints for table `branch_info`
--
ALTER TABLE `branch_info`
  ADD CONSTRAINT `fkkey2` FOREIGN KEY (`company_id`) REFERENCES `company_info` (`company_id`);

--
-- Constraints for table `measurement_subunit`
--
ALTER TABLE `measurement_subunit`
  ADD CONSTRAINT `fk` FOREIGN KEY (`measurement_unit_id`) REFERENCES `measurement_unit` (`measurement_id`);

--
-- Constraints for table `pdt_category`
--
ALTER TABLE `pdt_category`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`cat_item_id`) REFERENCES `pdt_item` (`item_id`);

--
-- Constraints for table `pdt_pdtdetails`
--
ALTER TABLE `pdt_pdtdetails`
  ADD CONSTRAINT `fk_key` FOREIGN KEY (`pd_pdt_id`) REFERENCES `pdt_productinfo` (`pdt_id`);

--
-- Constraints for table `pdt_productinfo`
--
ALTER TABLE `pdt_productinfo`
  ADD CONSTRAINT `fk15` FOREIGN KEY (`pdt_item_id`) REFERENCES `pdt_item` (`item_id`),
  ADD CONSTRAINT `fk6` FOREIGN KEY (`pdt_cat_id`) REFERENCES `pdt_category` (`cat_id`),
  ADD CONSTRAINT `fk7` FOREIGN KEY (`pdt_brand_id`) REFERENCES `pdt_brand` (`brand_id`),
  ADD CONSTRAINT `fk78` FOREIGN KEY (`pdt_subcat_id`) REFERENCES `pdt_subcategory` (`subcat_id`);

--
-- Constraints for table `sales_ledger`
--
ALTER TABLE `sales_ledger`
  ADD CONSTRAINT `fk_11` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`);

--
-- Constraints for table `supplier_info`
--
ALTER TABLE `supplier_info`
  ADD CONSTRAINT `fkkey1` FOREIGN KEY (`supplier_branch_id`) REFERENCES `branch_info` (`branch_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
