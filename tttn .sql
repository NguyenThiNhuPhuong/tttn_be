-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 17, 2022 lúc 08:44 AM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `tttn`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `active`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(7, 'Áo thun', 1, '2022-09-10 14:06:51', '2022-09-13 16:07:35', 16, 24),
(8, 'Chân Váy', 1, '2022-09-10 14:08:28', '2022-09-10 14:08:28', 6, 19),
(9, 'Mũ lưỡi trai', 1, '2022-09-10 14:08:47', '2022-09-12 03:12:13', 18, 24),
(10, 'Hoodie', 1, '2022-09-10 14:29:26', '2022-09-10 14:29:26', 20, 15),
(11, 'Áo khoát', 1, '2022-09-11 16:50:57', '2022-09-17 05:42:49', 24, 24);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `feedback`
--

INSERT INTO `feedback` (`id`, `user_id`, `email`, `content`, `created_at`, `update_at`) VALUES
(6, 13, 'thao@gmail.com', 'xin chào', '2022-08-25 16:40:44', '2022-08-25 16:40:44'),
(7, 13, 'thao@gmail.com', 'xinchao', '2022-08-25 16:43:21', '2022-08-25 16:43:21'),
(8, 13, 'hihi@gmail.com', 'xin chao', '2022-08-25 16:51:10', '2022-08-25 16:51:10'),
(9, 13, 'dd@gmail.com', 'xin chao', '2022-08-25 16:52:07', '2022-08-25 16:52:07'),
(10, 13, 'nhu@gmail.com', 'hyhy', '2022-08-29 14:29:20', '2022-08-29 14:29:20'),
(11, 23, 'nguyenly@gmail.com', 'Nguyễn Ly xin chao aaaaaaaaaaaaaaaaaaaaaaaaaaa', '2022-08-29 14:47:19', '2022-08-29 14:47:19'),
(12, 23, 'nguyenly@gmail.com', 'Nguyễn Ly xin chao aaaaaaaaaaaaaaaaaaaaaaaaaaa uuuuuuuuuuuuuuuu', '2022-08-29 15:07:51', '2022-08-29 15:07:51'),
(13, 23, 'h@gmail.com', 'r', '2022-08-29 15:10:05', '2022-08-29 15:10:05'),
(14, 23, 'fgthy@gmail.com', 'phuong nha', '2022-08-29 15:12:34', '2022-08-29 15:12:34'),
(15, 24, 'hihi@gmail.com', 'xin chào', '2022-09-08 09:15:46', '2022-09-08 09:15:46'),
(16, 24, 'mn@gmail.com', 'huhuhu', '2022-09-08 09:17:37', '2022-09-08 09:17:37'),
(17, 24, 'ngan@gmail.com', 'haha', '2022-09-08 09:47:02', '2022-09-08 09:47:02'),
(18, 24, 'ngan@gmail.com', 'huhuhuhuuh', '2022-09-08 17:20:44', '2022-09-08 17:20:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_07_29_084048_table_category', 1),
(7, '2022_08_02_081507_table_product', 2),
(8, '2022_08_02_084127_table_user_type', 3),
(10, '2022_08_02_084347_update_table_user', 4),
(11, '2022_08_02_091316_table_discount', 5),
(12, '2022_08_02_092718_table_province', 6),
(13, '2022_08_02_092949_table_district', 7),
(14, '2022_08_02_093443_update_table_district', 8),
(15, '2022_08_02_093749_table_ward', 9),
(16, '2022_08_02_095152_table_order_status', 10),
(17, '2022_08_02_095603_table_order', 11),
(19, '2022_08_04_071004_table_order_detail', 12),
(20, '2022_08_04_075332_table_feedback', 12),
(21, '2022_08_19_133158_table_product_image', 13),
(22, '2022_09_04_165258_table_slider', 14),
(24, '2022_09_05_025741_update_table_user_2', 15);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ordercode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_product` int(11) NOT NULL,
  `price_ship` int(11) NOT NULL DEFAULT 30000,
  `price_all` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderstatus_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `note` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `ordercode`, `user_id`, `fullname`, `phone`, `email`, `price_product`, `price_ship`, `price_all`, `address`, `orderstatus_id`, `note`, `created_at`, `updated_at`) VALUES
(6, 'ĐH0743366332', NULL, 'Ngọc Anh', '0707583174', 'ngocanh@gmail.com', 810000, 30000, 840000, 'BÌnh Phước', 3, 'Giao nhanh nha shop', '2022-09-10 07:36:43', '2022-09-14 12:59:58'),
(7, 'ĐH0204407934', 24, 'Nguyễn Huỳnh Kim Ngân', '0707583174', 'nguyenthinhuphuong242@gmail.com', 308000, 30000, 338000, 'xóm 2, Thuận Hiệp, Bình Thuận, Tây Sơn, Bình Định', 1, NULL, '2022-09-17 02:40:04', '2022-09-17 02:40:04'),
(8, 'ĐH0507355853', 38, 'Phan Ngoc Anh', '0707583174', 'phanngocanh@gmail.com', 300000, 30000, 330000, 'Bình Phước', 2, NULL, '2022-09-17 05:35:07', '2022-09-17 05:37:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `num` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `price_sale` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `num`, `price`, `price_sale`) VALUES
(5, 6, 33, 2, 300000, NULL),
(6, 6, 31, 1, 210000, NULL),
(7, 7, 29, 1, 188000, 158000),
(8, 7, 30, 1, 200000, 150000),
(9, 8, 30, 2, 200000, 150000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_status`
--

CREATE TABLE `order_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_status`
--

INSERT INTO `order_status` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Chờ xác nhận', '2022-09-09 11:27:40', '2022-09-09 11:27:40'),
(2, 'Đã xác nhận ', '2022-09-14 17:08:55', '2022-09-14 17:08:55'),
(3, 'Đang giao ', '2022-09-14 17:08:55', '2022-09-14 17:08:55'),
(4, 'Đã giao', '2022-09-16 09:11:23', '2022-09-16 09:11:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `price_sale` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `num_buy` int(11) NOT NULL DEFAULT 0,
  `active` int(11) NOT NULL DEFAULT 1,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `category_id`, `content`, `price`, `price_sale`, `num`, `num_buy`, `active`, `image`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(29, 'Áo ACUTE COLOR TEE', 7, ' Chính sách đổi trả Outerity.\r\n– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.\r\n- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.\r\n– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng\r\n– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.', 188000, 158000, 19, 1, 1, 'https://product.hstatic.net/200000312481/product/upload_fe2085f1a0904ab1a5ef4da714d942bf_master.jpg', '2022-09-10 14:10:31', '2022-09-17 02:40:05', 20, 14),
(30, 'BABE TEE COLLECTION Ver 3.0', 7, ' Chính sách đổi trả Outerity.\r\n– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.\r\n- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.\r\n– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng\r\n– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.', 200000, 150000, 17, 3, 1, 'https://product.hstatic.net/200000312481/product/82e0e6a27c78bc26e569_921da0a1b7ca4fadab1b39347286e2ee_master.jpg', '2022-09-10 14:14:37', '2022-09-17 05:35:07', 2, 29),
(31, 'Bazic Tee v2.0', 7, ' Chính sách đổi trả Outerity.\r\n– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.\r\n- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.\r\n– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng\r\n– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.', 210000, 180000, 19, 1, 1, 'https://product.hstatic.net/200000312481/product/upload_f39139b85e474e9db0bd440f8dc01881_master.jpg', '2022-09-10 14:17:39', '2022-09-10 07:36:43', 29, 17),
(32, 'Basic Tee Ver 2.0 - Green', 7, ' Chính sách đổi trả Outerity.\r\n– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.\r\n- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.\r\n– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng\r\n– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.', 175000, 155000, 20, 0, 1, 'https://product.hstatic.net/200000312481/product/1_6715beb1330345b2bea7be453183e086_master.png', '2022-09-10 14:26:36', '2022-09-10 14:26:36', 4, 20),
(33, 'Hoodie Zip Signature', 10, ' Chính sách đổi trả Outerity.\r\n– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.\r\n- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.\r\n– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng\r\n– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.', 300000, 275000, 8, 2, 1, 'https://product.hstatic.net/200000312481/product/upload_eb47efee7b764439919807c3276c67c2_master.jpg', '2022-09-10 14:30:32', '2022-09-10 07:36:43', 21, 17),
(34, 'Bazic Tee v2.0 / Cream Color', 7, 'Nếu chưa biết lựa size bạn có thể inbox để được chúng mình tư vấn.\r\n\r\n🔹 Chính sách đổi trả Outerity.\r\n– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.\r\n- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.\r\n– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng\r\n– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.', 159000, 149000, 10, 0, 1, 'https://product.hstatic.net/200000312481/product/upload_d23d697f3ed541cbb15ab88333ff6a4a_master.jpg', '2022-09-12 16:59:51', '2022-09-12 16:59:51', 1, 22),
(35, 'BREAK LOGO TEE/ White', 7, 'Nếu chưa biết lựa size bạn có thể inbox để được chúng mình tư vấn.\r\n\r\n🔹 Chính sách đổi trả Outerity.\r\n– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.\r\n- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.\r\n– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng\r\n– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.', 285000, 0, 10, 0, 1, 'https://product.hstatic.net/200000312481/product/z3571507162701_0d9660a0cae2ccc649f359deb0557b8a_4a449ffd3bb742c79613a9dfd24ae503_master.jpg', '2022-09-12 17:05:17', '2022-09-12 17:05:17', 18, 19),
(36, 'Bazic Hoodie Black Color', 10, 'Nếu chưa biết lựa size bạn có thể inbox để được chúng mình tư vấn.\r\n\r\n🔹 Chính sách đổi trả Outerity.\r\n– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.\r\n- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.\r\n– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng\r\n– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.', 385000, 295000, 10, 0, 1, 'https://product.hstatic.net/200000312481/product/upload_fcc282b9ca5342a9b1832258b0dee0c3_master.jpg', '2022-09-12 17:05:17', '2022-09-12 17:05:17', 18, 19),
(37, '\r\nBazic Tee DodgerBlue Color', 7, 'Nếu chưa biết lựa size bạn có thể inbox để được chúng mình tư vấn.\r\n\r\n🔹 Chính sách đổi trả Outerity.\r\n– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.\r\n- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.\r\n– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng\r\n– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.', 185000, 155000, 10, 0, 1, 'https://product.hstatic.net/200000312481/product/upload_d7084b856a494e5aa7b9b98194efe9bf_master.jpg', '2022-09-12 17:05:17', '2022-09-12 17:05:17', 18, 19),
(38, '\r\nHoodie Zip Snow White', 10, ' Chính sách đổi trả Outerity.\r\n– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.\r\n- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.\r\n– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng\r\n– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.', 200000, 150000, 20, 0, 1, 'https://product.hstatic.net/200000312481/product/upload_cd2b5e83e79c4b2facf8949af3170f44_master.jpg', '2022-09-10 14:14:37', '2022-09-10 14:14:37', 2, 29),
(39, 'MINIMALIST TEE v3.0 Black Color', 7, 'Nếu chưa biết lựa size bạn có thể inbox để được chúng mình tư vấn.\r\n\r\n🔹 Chính sách đổi trả Outerity.\r\n– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.\r\n- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.\r\n– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng\r\n– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.', 285000, 195000, 10, 0, 1, 'https://product.hstatic.net/200000312481/product/ort.b_101_sau_e412a333f91e406fa04ec1843e0001d1_master.jpg', '2022-09-12 17:05:17', '2022-09-12 17:05:17', 18, 19),
(40, 'BabyFont Tee - White Color', 7, ' Chính sách đổi trả Outerity.\r\n– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.\r\n- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.\r\n– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng\r\n– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.', 200000, 145000, 20, 0, 1, 'https://product.hstatic.net/200000312481/product/upload_61027ef21559468e9dc2ad0236347574_master.jpg', '2022-09-10 14:14:37', '2022-09-10 14:14:37', 2, 29),
(41, 'Error Déign Nỉ Chân Cua', 10, ' Chính sách đổi trả Outerity.\r\n– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.\r\n- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.\r\n– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng\r\n– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.', 320000, 225000, 10, 0, 1, 'https://product.hstatic.net/200000312481/product/upload_d3bbf02a3dc74875b856ec6cc2292fb3_master.jpg', '2022-09-10 14:30:32', '2022-09-10 07:36:43', 21, 17),
(43, 'Quang Linh', 8, 'dfụhuhyhuhy', 200000, NULL, 20, 0, 1, 'https://dulichkhatvongviet.com/wp-content/uploads/2014/07/sapa.jpg', '2022-09-17 02:50:06', '2022-09-17 02:50:06', 24, 24),
(44, 'huhuhu', 8, 'huhuhuhu', 1500000, NULL, 20, 0, 1, 'https://giaytrecon.com/wp-content/uploads/2021/03/dep-balenciaga-pool-slide-trang.jpg', '2022-09-17 02:54:53', '2022-09-17 02:54:53', 24, 24);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_image`
--

CREATE TABLE `product_image` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_image`
--

INSERT INTO `product_image` (`id`, `product_id`, `image`, `created_at`, `update_at`) VALUES
(5, 29, 'https://product.hstatic.net/200000312481/product/55724f5e-1efe-4d8e-b5df-7c1436632860_a8733370f138420eaa7af6e83fd56f1a_master.jpeg', '2022-09-10 14:12:17', '2022-09-10 14:12:17'),
(6, 29, 'https://product.hstatic.net/200000312481/product/24b72891-0062-47aa-a103-81df4c42a017_b8db23e4a0bd42f19c333dbe6d4517de_compact.jpeg', '2022-09-10 14:12:45', '2022-09-10 14:12:45'),
(7, 29, 'https://product.hstatic.net/200000312481/product/34875c17-e7c0-40e1-99b0-d2b93bd2fe4b_9f5ebe80864e4208a605f8ad0d2c6555_master.jpeg', '2022-09-10 14:12:45', '2022-09-10 14:12:45'),
(8, 30, 'https://product.hstatic.net/200000312481/product/dsc05985_ae57eca8c96e4286b5a4e89ec2802f8c_master.png', '2022-09-10 14:16:04', '2022-09-10 14:16:04'),
(9, 30, 'https://product.hstatic.net/200000312481/product/dsc05973_6a76c062d4ca452bbbfa5b1bab83ef4b_master.png', '2022-09-10 14:16:04', '2022-09-10 14:16:04'),
(10, 30, 'https://product.hstatic.net/200000312481/product/dsc05981_e840905ca1fa454db8caff13c1b3a3ef_master.png', '2022-09-10 14:16:04', '2022-09-10 14:16:04'),
(11, 31, 'https://product.hstatic.net/200000312481/product/upload_47e46375ca8443989e39881a7775624c_master.jpg', '2022-09-10 14:22:56', '2022-09-10 14:22:56'),
(12, 31, 'https://product.hstatic.net/200000312481/product/upload_2c43d9a7a1bb41ae9e1e584bb9185d1f_compact.jpg', '2022-09-10 14:22:56', '2022-09-10 14:22:56'),
(13, 31, 'https://product.hstatic.net/200000312481/product/upload_389210765f204899b7509b2e27536541_master.jpg', '2022-09-10 14:22:56', '2022-09-10 14:22:56'),
(14, 32, 'https://product.hstatic.net/200000312481/product/4_607ee7d05f174ff7841f761bb628e8a4_master.png', '2022-09-10 14:27:57', '2022-09-10 14:27:57'),
(15, 32, 'https://product.hstatic.net/200000312481/product/2_72138395192a4407923a60ab31a54005_master.png', '2022-09-10 14:27:57', '2022-09-10 14:27:57'),
(16, 32, 'https://product.hstatic.net/200000312481/product/5_cfabb3c11f6e4e45a1d7ece7e2dd3d28_master.png', '2022-09-10 14:27:57', '2022-09-10 14:27:57'),
(17, 32, 'https://product.hstatic.net/200000312481/product/3_1d8fb737f6184f7f9677ee978af42320_master.png', '2022-09-10 14:27:57', '2022-09-10 14:27:57'),
(18, 33, 'https://product.hstatic.net/200000312481/product/upload_e280b572aa2342d8988388c6b863b21b_master.jpg', '2022-09-10 14:31:48', '2022-09-10 14:31:48'),
(19, 33, 'https://product.hstatic.net/200000312481/product/upload_1c93afeb61be441fac48cc841e9ffa96_master.jpg', '2022-09-10 14:31:48', '2022-09-10 14:31:48'),
(20, 33, 'https://product.hstatic.net/200000312481/product/upload_4a7f02718845472aaec74cccb2321861_master.jpg', '2022-09-10 14:31:48', '2022-09-10 14:31:48'),
(21, 33, 'https://product.hstatic.net/200000312481/product/upload_174095d3ca644a82ae9c9a4134ad0859_master.jpg', '2022-09-10 14:31:48', '2022-09-10 14:31:48'),
(22, 34, 'https://product.hstatic.net/200000312481/product/upload_12efa6dbc4114ff3b1b0f0466cbcc552_compact.jpg', '2022-09-12 17:01:49', '2022-09-12 17:01:49'),
(23, 34, 'https://product.hstatic.net/200000312481/product/upload_093cfc42a3684b879fadd189609841e3_compact.jpg', '2022-09-12 17:01:49', '2022-09-12 17:01:49'),
(24, 34, 'https://product.hstatic.net/200000312481/product/upload_bd7bbcb2dab7449dacb69e0e6ac4bfbb_compact.jpg', '2022-09-12 17:01:49', '2022-09-12 17:01:49'),
(25, 34, 'https://product.hstatic.net/200000312481/product/upload_1cce36f2c97c4d28b515c5d0f4822014_compact.jpg', '2022-09-12 17:01:49', '2022-09-12 17:01:49'),
(26, 34, 'https://product.hstatic.net/200000312481/product/upload_d23d697f3ed541cbb15ab88333ff6a4a_compact.jpg', '2022-09-12 17:01:49', '2022-09-12 17:01:49'),
(27, 35, 'https://product.hstatic.net/200000312481/product/z3571507352638_f7b0be84718385280e57c2aea6fda1f9_95c794e4a33741fcb23912753c4baab5_compact.jpg', '2022-09-12 17:08:12', '2022-09-12 17:08:12'),
(28, 35, 'https://product.hstatic.net/200000312481/product/z3571507394392_2b3b4f893e02e9fa1ba44d3678b26c7f_175ccc39016c4e7499e5267becb65aff_compact.jpg', '2022-09-12 17:08:12', '2022-09-12 17:08:12'),
(29, 35, 'https://product.hstatic.net/200000312481/product/z3571507202577_cdec0bea43601bcbfd31a4cbd1ef0ce5_5d6129d969144671a1ea722321324412_compact.jpg', '2022-09-12 17:08:12', '2022-09-12 17:08:12'),
(30, 35, 'https://product.hstatic.net/200000312481/product/z3571507162701_0d9660a0cae2ccc649f359deb0557b8a_4a449ffd3bb742c79613a9dfd24ae503_master.jpg', '2022-09-12 17:08:12', '2022-09-12 17:08:12'),
(31, 36, 'https://product.hstatic.net/200000312481/product/upload_57e7255b8a8c473d8302b4f176af3efc_master.jpg', '2022-09-12 17:13:52', '2022-09-12 17:13:52'),
(32, 36, 'https://product.hstatic.net/200000312481/product/upload_8641af25dda147e6b41f8d551260bd81_master.jpg', '2022-09-12 17:13:52', '2022-09-12 17:13:52'),
(33, 36, 'https://product.hstatic.net/200000312481/product/upload_11e1d471b7064be89370def4d2992ff2_compact.jpg', '2022-09-12 17:13:52', '2022-09-12 17:13:52'),
(34, 36, 'https://product.hstatic.net/200000312481/product/upload_fcc282b9ca5342a9b1832258b0dee0c3_master.jpg', '2022-09-12 17:13:52', '2022-09-12 17:13:52'),
(35, 37, 'https://product.hstatic.net/200000312481/product/upload_7d9245b94cd141e5b3d8747d850c12f7_compact.jpg', '2022-09-12 17:18:29', '2022-09-12 17:18:29'),
(36, 37, 'https://product.hstatic.net/200000312481/product/upload_532598ad2a2f45d9a61c842580d1d94a_compact.jpg', '2022-09-12 17:18:29', '2022-09-12 17:18:29'),
(37, 37, 'https://product.hstatic.net/200000312481/product/upload_49068f16cd094edf82d741c1db29846c_compact.jpg', '2022-09-12 17:18:29', '2022-09-12 17:18:29'),
(38, 37, 'https://product.hstatic.net/200000312481/product/upload_d7084b856a494e5aa7b9b98194efe9bf_master.jpg', '2022-09-12 17:18:29', '2022-09-12 17:18:29'),
(39, 38, 'https://product.hstatic.net/200000312481/product/upload_0d96a2457f8941a9ba23c64e2ccf61f0_compact.jpg', '2022-09-12 17:26:36', '2022-09-12 17:26:36'),
(40, 38, 'https://product.hstatic.net/200000312481/product/upload_d60bee78bf2540cbb5069a0a5ce856c4_compact.jpg', '2022-09-12 17:26:36', '2022-09-12 17:26:36'),
(41, 38, 'https://product.hstatic.net/200000312481/product/upload_c24d222c23f64c00b0c1470551fe074f_compact.jpg', '2022-09-12 17:26:36', '2022-09-12 17:26:36'),
(42, 38, 'https://product.hstatic.net/200000312481/product/upload_cd2b5e83e79c4b2facf8949af3170f44_master.jpg', '2022-09-12 17:26:36', '2022-09-12 17:26:36'),
(43, 39, 'https://product.hstatic.net/200000312481/product/1__9__9e1bca21193f41fda1a00681afc76b06_master.jpg', '2022-09-12 17:30:42', '2022-09-12 17:30:42'),
(44, 39, 'https://product.hstatic.net/200000312481/product/4__8__b77de01b43994b6ca90ffe164a4354e4_master.jpg', '2022-09-12 17:30:42', '2022-09-12 17:30:42'),
(45, 39, 'https://product.hstatic.net/200000312481/product/ort.b_101_fb10048ece424db786fb52f66d8d2ccb_master.jpg', '2022-09-12 17:30:42', '2022-09-12 17:30:42'),
(46, 39, 'https://product.hstatic.net/200000312481/product/ort.b_101_sau_e412a333f91e406fa04ec1843e0001d1_master.jpg', '2022-09-12 17:30:42', '2022-09-12 17:30:42'),
(47, 40, 'https://product.hstatic.net/200000312481/product/upload_769c5d2c274f4b30b3941a5fbb1c0bc5_master.jpg', '2022-09-12 17:47:46', '2022-09-12 17:47:46'),
(48, 40, 'https://product.hstatic.net/200000312481/product/upload_a648839c116b48578e1c9ca60f79af1e_master.jpg', '2022-09-12 17:47:46', '2022-09-12 17:47:46'),
(49, 40, 'https://product.hstatic.net/200000312481/product/upload_a9d386ad60174fccb908cf923b81171c_compact.jpg', '2022-09-12 17:47:46', '2022-09-12 17:47:46'),
(50, 40, 'https://product.hstatic.net/200000312481/product/upload_61027ef21559468e9dc2ad0236347574_master.jpg', '2022-09-12 17:47:46', '2022-09-12 17:47:46'),
(51, 41, 'https://product.hstatic.net/200000312481/product/upload_2c901025df6541a7a6ad787b2a2d7e83_master.jpg', '2022-09-12 18:08:25', '2022-09-12 18:08:25'),
(52, 41, 'https://product.hstatic.net/200000312481/product/upload_d3bbf02a3dc74875b856ec6cc2292fb3_master.jpg', '2022-09-12 18:08:25', '2022-09-12 18:08:25'),
(53, 41, 'https://product.hstatic.net/200000312481/product/upload_2c901025df6541a7a6ad787b2a2d7e83_master.jpg', '2022-09-12 18:08:25', '2022-09-12 18:08:25'),
(54, 43, 'https://dulichkhatvongviet.com/wp-content/uploads/2014/07/sapa.jpg', '2022-09-17 09:50:06', '2022-09-17 09:50:06'),
(55, 43, 'https://dulichkhatvongviet.com/wp-content/uploads/2014/07/sapa.jpg', '2022-09-17 09:50:06', '2022-09-17 09:50:06'),
(56, 43, 'https://dulichkhatvongviet.com/wp-content/uploads/2014/07/sapa.jpg', '2022-09-17 09:50:06', '2022-09-17 09:50:06'),
(57, 43, 'https://dulichkhatvongviet.com/wp-content/uploads/2014/07/sapa.jpg', '2022-09-17 09:50:06', '2022-09-17 09:50:06'),
(58, 44, 'https://giaytrecon.com/wp-content/uploads/2021/03/dep-balenciaga-pool-slide-trang.jpg', '2022-09-17 09:54:53', '2022-09-17 09:54:53'),
(59, 44, 'https://giaytrecon.com/wp-content/uploads/2021/03/dep-balenciaga-pool-slide-trang.jpg', '2022-09-17 09:54:53', '2022-09-17 09:54:53'),
(60, 44, 'https://giaytrecon.com/wp-content/uploads/2021/03/dep-balenciaga-pool-slide-trang.jpg', '2022-09-17 09:54:53', '2022-09-17 09:54:53'),
(61, 44, 'https://giaytrecon.com/wp-content/uploads/2021/03/dep-balenciaga-pool-slide-trang.jpg', '2022-09-17 09:54:53', '2022-09-17 09:54:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slider`
--

CREATE TABLE `slider` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `slider`
--

INSERT INTO `slider` (`id`, `name`, `link`, `image`, `active`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Outerity background 1', NULL, 'https://file.hstatic.net/200000312481/file/dsc05692_39baebe1403c487581b4cd9a39354736.jpg', 1, '2022-09-04 18:02:24', '2022-09-04 18:02:24', 13, 13),
(2, 'Outerity background 2', NULL, 'https://cf.shopee.vn/file/bd5439e0be1fd1cd99eec3a7261277b6', 1, '2022-09-04 18:02:59', '2022-09-04 18:02:59', 13, 13),
(7, 'Outerity background 3', NULL, 'https://cf.shopee.vn/file/e8d08b05236907be1545aa015510043a', 1, '2022-09-13 16:02:12', '2022-09-13 16:56:28', 24, 24);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `type_id` bigint(20) UNSIGNED NOT NULL DEFAULT 2,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `avatar`, `name`, `email`, `email_verified_at`, `password`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`, `type_id`, `google_id`, `fb_id`, `created_by`, `updated_by`) VALUES
(1, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'Phan Thị Ngọc', 'phuong@gmail.com', NULL, '$2y$10$9MY3B2xmCYDpujf6K0Xr3.4qtPMBgbTPcYMSpafjbbzYj4ynqkVGy', '', '', NULL, '2022-08-06 08:40:27', '2022-09-14 02:39:02', 1, NULL, NULL, 1, 1),
(2, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'han', 'han@gmail.com', NULL, '$2y$10$pz/U86SG5PGMA6H1Ln8A5uf/t7fNYoIfGptSuIigua95cB20KxuGy', '', '', NULL, '2022-08-08 01:20:37', '2022-08-08 01:20:37', 1, NULL, NULL, 1, 1),
(4, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'han', 'huhuh@gmail.com', NULL, '$2y$10$ZSHkZ3gpt4gp7r0Gp91tvOBlMy4qpo9jHRxgPWbyPbKO9HL9kvheq', '', '', NULL, '2022-08-08 01:24:18', '2022-08-08 01:24:18', 1, NULL, NULL, 1, 1),
(5, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'thao', 'thao@gmail.com', NULL, '$2y$10$6QlWpAebscJWQQHSgGr8o.JBXErpySdaNUCrHvRDL49FS5gXKNX66', '', '', NULL, '2022-08-08 01:26:25', '2022-08-08 01:26:25', 1, NULL, NULL, 1, 1),
(6, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'thao', 'thuy@gmail.com', NULL, '$2y$10$.sJrz1tUztg8M3e1Ac1Lgu5Tu0OOtg1eDyjz.rGDFnGz5tGqUW9CW', '', '', NULL, '2022-08-08 01:27:41', '2022-08-08 01:27:41', 1, NULL, NULL, 1, 1),
(8, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'thao', 'ha@gmail.com', NULL, '$2y$10$5ioR5XfdAOSYLy9jUfF.JO8xTVhTbK8lCRRDu6/WJq9/6a3vtLhTK', '', '', NULL, '2022-08-08 01:28:25', '2022-08-08 01:28:25', 1, NULL, NULL, 1, 1),
(9, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'nhu binh', 'nhubinh@gmail.com', NULL, '$2y$10$k/f79j31sTdfSY8y5h93luHJVO22igRG6KZr9/N319Vz5h7mTOG8.', '', '', NULL, '2022-08-08 01:37:54', '2022-08-08 01:37:54', 1, NULL, NULL, 1, 1),
(11, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'nhu binh', 'ô@gmail.com', NULL, '$2y$10$NwKmA/lgbkpXqcOxV6hw6OviHwLDfFBWD05oF2trQWYC1Zoerj9Qy', '', '', NULL, '2022-08-08 01:47:28', '2022-08-08 01:47:28', 1, NULL, NULL, 1, 1),
(13, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'Nguyễn Văn Hân', 'nguyenvanhan@gmail.com', NULL, '$2y$10$Yw5O4Zxjq2WJ43MI5yDV0uTrsKvH2qc9A91A1/K50CJhIhezVh7Si', '', '', NULL, '2022-08-15 02:09:17', '2022-08-15 02:09:17', 2, NULL, NULL, 1, 1),
(14, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'Nguyễn Minh Tiến', 'nguyenminhtien@gmail.com', NULL, '$2y$10$qNJiUZBkl4UJQ4q1fYAOJeVoTuDbrM4BUcb8Cs72nDdXmpcfXINjm', '', '', NULL, '2022-08-15 02:10:49', '2022-08-15 02:10:49', 2, NULL, NULL, 1, 1),
(15, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'Nguyễn Minh Thiện', 'nguyenminhthien@gmail.com', NULL, '$2y$10$kUGBMsVVa79SEa.NEYDKA.cC3KhXWgLwk0XxD1GWo9NDAPxqo1TTG', '', '', NULL, '2022-08-18 00:56:23', '2022-08-18 00:56:23', 2, NULL, NULL, 1, 1),
(16, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'Nguyễn Ly', 'nguyenly@gmail.com', NULL, '$2y$10$I/J0wCK4EbQP5VmyNS6olu5WCTmJOM3nwwagiUNCqXCjmjap.w44i', '', '', NULL, '2022-08-18 02:03:32', '2022-08-18 02:03:32', 2, NULL, NULL, NULL, NULL),
(17, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'nguyenthinhubinh', 'nguyenthinhubinh@gmail.com', NULL, '$2y$10$FIdhY2uM9rDDa3N.UJTlXuxp0/GYhnPzc/Gl2UDc1XFD00GZjdVM.', '', '', NULL, '2022-08-18 02:10:32', '2022-08-18 02:10:32', 2, NULL, NULL, NULL, NULL),
(18, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'nguyenthinhubinh', 'nguyenthinhuhan@gmail.com', NULL, '$2y$10$C87r9H6WuFJhq9tMUlJ3LuMXee1dYdQCvv91V6jNS21tgJhsNzkNC', '', '', NULL, '2022-08-18 02:19:30', '2022-08-18 02:19:30', 2, NULL, NULL, NULL, NULL),
(19, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'Nguyễn Thị Ngọc Hân', 'ngochan@gmail.com', NULL, '$2y$10$0HHMm8BxjbZcWFTVQ1HRheQ7CT5w5vYTexueoWNLIMlCx0YrJfheC', '', '', NULL, '2022-08-18 02:37:44', '2022-08-18 02:37:44', 2, NULL, NULL, NULL, NULL),
(20, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'Nguyễn Thị Mai Anh', 'maianh@gmail.com', NULL, '$2y$10$hX0toYAJEBZLSOjN/DJzMusfwkQJDVbd9sxmWCrh3IANMt/XdqD3u', '', '', NULL, '2022-08-18 02:40:20', '2022-08-18 02:40:20', 2, NULL, NULL, NULL, NULL),
(21, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'Nguyễn Văn Hậu', 'nguyenvanhau@gmail.com', NULL, '$2y$10$TCDffezeJpUv/83OqXwHlunHTX9uIHKWPmv65ibNV0sXCBM76fH1u', '', '', NULL, '2022-08-18 02:43:07', '2022-08-18 02:43:07', 2, NULL, NULL, NULL, NULL),
(22, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'hau', 'nguyenhau@gmail.com', NULL, '$2y$10$RdFTEYrmJZQ2e9i.iyayfeAwM31cUWbElhDuxYqmQhlleZfIPyZRS', '', '', NULL, '2022-08-18 02:54:54', '2022-08-18 02:54:54', 2, NULL, NULL, NULL, NULL),
(23, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'Lan Nhi', 'lannhi@gmail.com', NULL, '$2y$10$B6esQ0RmT2yDxjbl/f.aQeAGBN.u/OzVMK8U5xEqKAcembKmpY16K', '', '', NULL, '2022-08-29 00:21:14', '2022-08-29 00:21:14', 2, NULL, NULL, NULL, NULL),
(24, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'Nguyễn Huỳnh Kim Ngân', 'ngan@gmail.com', NULL, '$2y$10$jhdaru40w.WSsIaGKEniIuBj/Sd29Pkw0J3Q5wts3pQQ/hpJY5R36', '', '', NULL, '2022-09-06 00:01:16', '2022-09-06 00:01:16', 1, NULL, NULL, NULL, NULL),
(25, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'Minh Ly', 'kimhoa@gmail.com', NULL, '$2y$10$LHurU3iWZpCVbmEtZOCiFez5ozP4Fnv1oJhfXbMCYUPd00OUPppem', '', '', NULL, '2022-09-06 07:34:40', '2022-09-06 07:34:40', 1, NULL, NULL, NULL, NULL),
(26, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'Minh lý', 'minhly@gmail.com', NULL, '$2y$10$VCb.alB0uS/mGxdXNKo.h.N3g10./9M/KWQyc8r0dN.gzSqVSQHUu', '', '', NULL, '2022-09-06 07:37:20', '2022-09-06 07:37:20', 1, NULL, NULL, NULL, NULL),
(27, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'ngọc anh', 'ngocanh@gmail.com', NULL, '$2y$10$EQxK9kp3O6.RLLvlZC9E.../V/NTHYTLHPUvtvlS7wScqt3E2727q', '', '', NULL, '2022-09-09 10:07:46', '2022-09-09 10:07:46', 1, NULL, NULL, NULL, NULL),
(28, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'ngọc anh hihi', 'ngocanh145@gmail.com', NULL, '$2y$10$JYpyyqPOQui6TZ4IEaZG2.ApcSF7mkMwmJwZjs1qrOIhtHC7.kqES', '', '', NULL, '2022-09-09 10:25:46', '2022-09-09 10:25:46', 1, NULL, NULL, NULL, NULL),
(29, 'https://khoinguonsangtao.vn/wp-content/uploads/2022/05/anh-avatar-dep-ngau-hinh-dai-dien.jpg', 'Phan Thị Ngọc', 'nguyenthinhuphu2@gmail.com', NULL, '$2y$10$7uWMT6xxYwsyz2hGCd8vXeSifVV24nx8Gj9SAe5dZozVVFPekNfLy', '0707583174', '3332/3/27 tổ 33 khu phố 2,phường tân chánh hiệp ,quận 12, TP HCM', NULL, '2022-09-09 10:30:29', '2022-09-09 18:06:14', 1, NULL, NULL, NULL, NULL),
(30, 'https://haycafe.vn/wp-content/uploads/2021/11/Anh-avatar-dep-chat-lam-hinh-dai-dien.jpg', 'Như Bình', 'nhubinh123456@gmail.com', NULL, '$2y$10$..QuXCTCNXiLHzLxJ8sB8e5KfLcfvJH0a8NIjayyggHDcRm/xdINm', '0899930273', 'xóm 2, Thuận Hiệp, Bình Thuận, Tây Sơn, Bình Định', NULL, '2022-09-11 08:52:05', '2022-09-11 08:52:05', 2, NULL, NULL, NULL, 24),
(31, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'hhhhjijijiji', 'nguyenthinhuphuong@gmail.com', NULL, '$2y$10$OCJKh84b0VsUSGADa6Tr1uyJPh7F0IaWiUs4O4NyeXXaQOOFi1Gq6', '0768654333', 'Bình định', NULL, '2022-09-12 06:56:05', '2022-09-16 11:19:42', 2, NULL, NULL, NULL, 24),
(32, 'https://images.pexels.com/photos/2651796/pexels-photo-2651796.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'Outerity', 'phuongphuong@gmail.com', NULL, '$2y$10$OpsoZDAv75gUmnwk8hQzk.wuyeVSrOzBDMWgiyLeJOJb8LD1/xV.u', '0899930274', 'tphcm', NULL, '2022-09-14 02:54:24', '2022-09-16 11:29:10', 2, NULL, NULL, NULL, 24),
(33, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'Nguyễn Như Phượng', 'nguyennhuphuong@gmail.com', NULL, '$2y$10$vZhxyB7NQ2B5hmRQiLclF.vPp/2VY4sqtEgIW6pE206L2bzvZWyfC', '0707583174', 'xóm 2, Thuận Hiệp, Bình Thuận, Tây Sơn, Bình Định', NULL, '2022-09-16 09:59:07', '2022-09-16 09:59:07', 2, NULL, NULL, NULL, NULL),
(34, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png	', 'Nguyễn Thị Như Phượng', 'nguyennhuphuong120@gmail.com', NULL, '$2y$10$vd0cmX68NSQ1iiZygKUbS.y/nZCJqchoj.zoXWALgt8.Gj22azCeO', '0707583174', 'xóm 2, TPHCM', NULL, '2022-09-16 10:04:51', '2022-09-16 10:04:51', 1, NULL, NULL, NULL, NULL),
(35, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png	', 'nhuphuong123', 'nguyenthinhuphuong242@gmail.com', NULL, '$2y$10$yxmjpkA1ObRWuhIz5ZHi1Oj.qFVc/l6I165dEJHXQL1demMMxw5kC', '0707583174', 'jhuy', NULL, '2022-09-16 10:08:48', '2022-09-16 10:08:48', 2, NULL, NULL, NULL, NULL),
(36, 'https://png.pngtree.com/png-clipart/20190904/original/pngtree-cartoon-staff-png-image_4481046.jpg', '1951120126', 'nguyennhuphuong11111@gmail.com', NULL, '$2y$10$a0ivVGhADi5ftudU5UZsfuc4vj/kwzQK03N0BksB4/YHi6uKKGQP.', '0707583174', 'xóm 2, Thuận hiệp,', NULL, '2022-09-16 10:22:23', '2022-09-16 10:22:23', 1, NULL, NULL, 24, NULL),
(37, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'nhu phuong', 'nguyenphuong120@gmail.com', NULL, '$2y$10$/pfq3aVenbQ1Qdm/VVCOeuhz3QCiHW5wxBg.ZF3oGW2ugdLbDKajG', '0707583174', 'xóm 2, Thuận Hiệp, Bình Thuận, Tây Sơn, Bình Định', NULL, '2022-09-16 21:24:41', '2022-09-16 21:24:41', 2, NULL, NULL, NULL, NULL),
(38, 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png', 'Phan Ngoc', 'phanngocanh@gmail.com', NULL, '$2y$10$qKvO/HSHqOIdH6RvUrgD9Or8cCH4cR.mO7LQWvikwdmnjrY3Q9WRK', '0707583174', 'Bình Phước, TPHCM', NULL, '2022-09-16 22:25:05', '2022-09-16 23:33:09', 2, NULL, NULL, NULL, NULL),
(39, 'https://i.pinimg.com/736x/47/2b/61/472b61d49bb2c847bb7e0665497af47e.jpg', 'Nguyễn Thị', 'nguyenth242@gmail.com', NULL, '$2y$10$kVJLCNIbV/C0MTl7bPpDwO/IeW2NC9qaMvsHGJdr6YUhHczQKLxfG', '0707583133', 'xóm 4, Thuận Hạnh', NULL, '2022-09-16 22:38:10', '2022-09-16 22:41:49', 2, NULL, NULL, 24, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_type`
--

CREATE TABLE `user_type` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_type`
--

INSERT INTO `user_type` (`id`, `name`, `created_at`, `update_at`) VALUES
(1, 'admin', '2022-08-06 15:38:38', '2022-08-06 15:38:38'),
(2, 'customer', '2022-08-15 16:09:11', '2022-08-15 16:09:11');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name_unique` (`name`),
  ADD KEY `category_created_by_foreign` (`created_by`),
  ADD KEY `category_updated_by_foreign` (`updated_by`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedback_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_ordercode_unique` (`ordercode`),
  ADD KEY `order_orderstatus_id_foreign` (`orderstatus_id`),
  ADD KEY `order_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_detail_order_id_foreign` (`order_id`),
  ADD KEY `order_detail_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_created_by_foreign` (`created_by`),
  ADD KEY `product_updated_by_foreign` (`updated_by`),
  ADD KEY `product_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_image_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slider_created_by_foreign` (`created_by`),
  ADD KEY `slider_updated_by_foreign` (`updated_by`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_created_by_foreign` (`created_by`),
  ADD KEY `users_updated_by_foreign` (`updated_by`),
  ADD KEY `users_type_id_foreign` (`type_id`);

--
-- Chỉ mục cho bảng `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT cho bảng `slider`
--
ALTER TABLE `slider`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `category_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_orderstatus_id_foreign` FOREIGN KEY (`orderstatus_id`) REFERENCES `order_status` (`id`),
  ADD CONSTRAINT `order_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `order_detail_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `product_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `product_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `product_image_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `slider`
--
ALTER TABLE `slider`
  ADD CONSTRAINT `slider_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `slider_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `user_type` (`id`),
  ADD CONSTRAINT `users_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
