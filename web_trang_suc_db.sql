-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 23, 2026 lúc 06:17 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `web_trang_suc_db`
--


--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `imageUrl` text NOT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `imageUrl`, `subtitle`, `title`, `description`, `isActive`) VALUES
(1, 'https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?w=1600&q=80', 'Bộ sưu tập mới 2026', 'Tinh Hoa Trang Sức Việt', 'Nơi hội tụ những kiệt tác từ bàn tay nghệ nhân lành nghề —\nSang trọng, tinh tế, vĩnh cửu\n', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) NOT NULL,
  `userId` char(36) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `userId`, `createdAt`) VALUES
(4, 'admin-uuid-001', '2026-04-18 15:49:46'),
(5, 'd7662f9f-f41b-4ec0-8cbc-21018e5018fa', '2026-04-20 08:41:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) NOT NULL,
  `cartId` bigint(20) NOT NULL,
  `productId` bigint(20) NOT NULL,
  `variantId` bigint(20) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `size` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart_items`
--

INSERT INTO `cart_items` (`id`, `cartId`, `productId`, `variantId`, `quantity`, `size`) VALUES
(28, 5, 4, 401, 1, NULL),
(29, 4, 1, 601, 1, NULL),
(30, 4, 1, 1, 1, NULL),
(31, 4, 15, 27, 1, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `imageUrl` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `slug`, `name`, `imageUrl`, `description`, `createdAt`) VALUES
(1, 'necklace', 'Dây Chuyền', 'https://th.bing.com/th/id/R.43c8732d49a631675fcd2e81a1071c9f?rik=Psk4WKL%2f7d2Kjw&riu=http%3a%2f%2fimg.ltwebstatic.com%2fimages3_spmp%2f2023%2f08%2f19%2fd5%2f16924187712a18d0c0f978cbffe30bc40384a5de43_thumbnail_600x.jpg&ehk=j%2fPbcUHmWyuy%2f01nuwtsmc5sLuUTzTKE2bk8dwP5%2fSs%3d&risl=&pid=ImgRaw&r=0', 'Những mẫu dây chuyền tinh tế, tôn vinh vẻ đẹp vùng cổ.', '2026-04-16 19:05:28'),
(2, 'ring', 'Nhẫn', 'https://i.etsystatic.com/5306257/r/il/fc30e9/1449851507/il_1080xN.1449851507_cx2t.jpg', 'Biểu tượng của tình yêu và sự cam kết vĩnh cửu.', '2026-04-16 19:05:28'),
(3, 'bracelet', 'Lắc Tay', 'https://i.pinimg.com/736x/4c/5d/3d/4c5d3d16528b170ea79e97e402dcdf9e.jpg', 'Điểm nhấn sang trọng cho đôi tay phái đẹp.', '2026-04-16 19:05:28'),
(4, 'earring', 'Bông Tai', 'https://dygtyjqp7pi0m.cloudfront.net/i/70710/55563408_1.jpg?v=8DD43253DF277F0', 'Lấp lánh và rạng rỡ, làm nổi bật khuôn mặt.', '2026-04-16 19:05:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `favorites`
--

CREATE TABLE `favorites` (
  `userId` char(36) NOT NULL,
  `productId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `materials`
--

CREATE TABLE `materials` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `materials`
--

INSERT INTO `materials` (`id`, `slug`, `name`) VALUES
(1, 'gold', 'Vàng'),
(2, 'silver', 'Bạc'),
(3, 'platinum', 'Vàng giả'),
(4, 'diamond', 'Kim Cương');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` varchar(50) NOT NULL COMMENT 'Mã đơn dạng ORD-XXXX',
  `userId` char(36) DEFAULT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `address` text NOT NULL,
  `apartment` varchar(255) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `postalCode` varchar(20) DEFAULT NULL,
  `shippingMethod` varchar(50) NOT NULL,
  `shippingFee` decimal(15,2) DEFAULT 0.00,
  `paymentMethod` varchar(50) NOT NULL,
  `paymentStatus` varchar(50) DEFAULT 'unpaid',
  `orderStatus` varchar(50) DEFAULT 'pending',
  `discountCode` varchar(50) DEFAULT NULL,
  `discountAmount` decimal(15,2) DEFAULT 0.00,
  `totalAmount` decimal(15,2) NOT NULL,
  `estimatedDelivery` timestamp NULL DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `paidAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `userId`, `firstName`, `lastName`, `email`, `phone`, `company`, `address`, `apartment`, `city`, `country`, `postalCode`, `shippingMethod`, `shippingFee`, `paymentMethod`, `paymentStatus`, `orderStatus`, `discountCode`, `discountAmount`, `totalAmount`, `estimatedDelivery`, `createdAt`, `paidAt`) VALUES
('ORD-5423', 'd7662f9f-f41b-4ec0-8cbc-21018e5018fa', '', '', 'tranvankhoand1983@gmail.com', '', NULL, '', NULL, '', '', NULL, 'free', 0.00, '', 'unpaid', 'pending', NULL, 0.00, 0.00, NULL, '2026-04-20 08:44:16', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) NOT NULL,
  `orderId` varchar(50) NOT NULL,
  `productId` bigint(20) NOT NULL,
  `variantId` bigint(20) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `size` varchar(50) DEFAULT NULL,
  `priceAtPurchase` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `materialId` int(11) DEFAULT NULL,
  `price` decimal(15,2) NOT NULL,
  `originalPrice` decimal(15,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `originStory` text DEFAULT NULL,
  `stockQuantity` int(11) DEFAULT 0,
  `rating` decimal(3,2) DEFAULT 0.00,
  `reviewCount` int(11) DEFAULT 0,
  `isNew` tinyint(1) DEFAULT 0,
  `isSale` tinyint(1) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `sku`, `name`, `categoryId`, `materialId`, `price`, `originalPrice`, `description`, `originStory`, `stockQuantity`, `rating`, `reviewCount`, `isNew`, `isSale`, `createdAt`) VALUES
(1, 'VEL-T1-RING', 'Velmora T1 Narrow Ring', 2, 2, 149000.00, 189000.00, '{\"brand\":\"VELMORA Luxury\",\"material\":\"Bạc S925 mạ Rhodium\",\"stone\":\"Cubic Zirconia AAA\",\"weight\":\"2.1 chỉ\",\"style\":\"Hiện đại\",\"description\":\"Biểu tượng chữ V huyền thoại đại diện cho sức mạnh và sự tự tin cá nhân.\"}', '', 0, 4.90, 12, 0, 1, '2026-04-16 19:05:29'),
(2, 'VEL-KNOT-RING', 'Velmora Knot Ring', 2, 2, 169000.00, 219000.00, '{\"brand\":\"VELMORA Luxury\",\"material\":\"Bạc S925 mạ Platinum\",\"stone\":\"Không đá\",\"weight\":\"1.8 chỉ\",\"style\":\"Thanh lịch\",\"description\":\"Thiết kế nút thắt đặc trưng của dòng Velmora Knot tượng trưng cho sự gắn kết.\"}', '', 40, 4.80, 8, 1, 1, '2026-04-16 19:05:29'),
(3, 'VEL-FORGE-WIDE', 'Velmora Forge Wide Ring', 2, 2, 219000.00, 259000.00, '{\"brand\":\"VELMORA Luxury\",\"material\":\"Bạc S925 Antique\",\"stone\":\"Kim cương Lab\",\"weight\":\"2.5 chỉ\",\"style\":\"Cá tính\",\"description\":\"Mẫu nhẫn mắt xích bản rộng mang phong cách Industrial độc đáo.\"}', '', 30, 4.70, 5, 1, 0, '2026-04-16 19:05:29'),
(4, 'VEL-VIC-RING', 'Velmora Victoria Ring', 2, 4, 199000.00, 249000.00, '{\"brand\":\"VELMORA Luxury\",\"material\":\"Bạc S925 mạ Platin\",\"stone\":\"Marquise cut Lab Diamond\",\"weight\":\"2.0 chỉ\",\"style\":\"Lộng lẫy\",\"description\":\"Cụm hoa Victoria lấp lánh như những vì sao đêm rực rỡ.\"}', '', 25, 4.90, 14, 1, 1, '2026-04-16 19:05:29'),
(5, 'VEL-SMILE-NK', 'Velmora Smile Necklace', 1, 2, 269000.00, 299000.00, '{\"brand\":\"VELMORA Luxury\",\"material\":\"Bạc S925 mạ Vàng trắng\",\"stone\":\"Zirconia tấm\",\"weight\":\"1.4 chỉ\",\"style\":\"Trẻ trung\",\"description\":\"Mặt dây chuyền nụ cười huyền thoại mang lại vẻ rạng rỡ và lạc quan.\"}', '', 60, 4.90, 42, 0, 1, '2026-04-16 19:05:29'),
(6, 'VEL-HARD-NK', 'Velmora HardWear Pendant', 1, 2, 289000.00, 329000.00, '{\"brand\":\"VELMORA Luxury\",\"material\":\"Bạc S925\",\"stone\":\"None\",\"weight\":\"3.0 chỉ\",\"style\":\"Phố thị\",\"description\":\"Sự kết hợp giữa mắt xích công nghiệp và nét nữ tính sang trọng.\"}', '', 20, 4.80, 9, 1, 0, '2026-04-16 19:05:29'),
(7, 'VEL-SOL-EAR', 'Velmora Solitaire Studs', 4, 4, 159000.00, 199000.00, '{\"brand\":\"VELMORA Luxury\",\"material\":\"Bạc S925 mạ Bạch kim\",\"stone\":\"Kim cương Lab 0.1ct\",\"weight\":\"0.5 chỉ\",\"style\":\"Cổ điển\",\"description\":\"Bông tai một viên đá tối giản, tối ưu hoá sự phản chiếu ánh sáng.\"}', '', 15, 5.00, 61, 1, 1, '2026-04-16 19:05:29'),
(8, 'VEL-KNOT-BAN', 'Velmora Knot Wire Bangle', 3, 2, 295000.00, 359000.00, '{\"brand\":\"VELMORA Luxury\",\"material\":\"Bạc S925 mạ Vàng hồng\",\"stone\":\"Zirconia tinh khiết\",\"weight\":\"4.2 chỉ\",\"style\":\"Sang trọng\",\"description\":\"Vòng tay Wire Bangle với điểm nhấn nút thắt quấn đôi cực kỳ tinh xảo.\"}', '', 10, 4.90, 22, 1, 1, '2026-04-16 19:05:29'),
(9, 'VEL-LOCK-RING', 'Velmora Lock Ring', 2, 2, 189000.00, 219000.00, '{\"brand\":\"VELMORA Luxury\",\"material\":\"Bạc S925 mạ Rhodium\",\"stone\":\"None\",\"weight\":\"1.6 chỉ\",\"style\":\"Bình đẳng\",\"description\":\"Mẫu nhẫn lấy cảm hứng từ ổ khoá, mang thông điệp đoàn kết và bảo vệ.\"}', '', 35, 4.70, 7, 1, 1, '2026-04-16 19:05:29'),
(10, 'VEL-SMILE-RG', 'Velmora Smile Wire Ring', 2, 2, 139000.00, 169000.00, '{\"brand\":\"VELMORA Luxury\",\"material\":\"Bạc S925\",\"stone\":\"Kim cương Lab nhỏ\",\"weight\":\"1.1 chỉ\",\"style\":\"Năng động\",\"description\":\"Nụ cười trên ngón tay bạn - thiết kế thanh mảnh, dễ phối đồ.\"}', '', 45, 4.80, 19, 0, 1, '2026-04-16 19:05:29'),
(11, 'VEL-KEY-PDT', 'Velmora Victoria Key Pendant', 1, 4, 289000.00, 339000.00, '{\"brand\":\"VELMORA Luxury\",\"material\":\"Bạc S925 mạ Platin\",\"stone\":\"Lab Diamond Marquise\",\"weight\":\"2.3 chỉ\",\"style\":\"Quyền quý\",\"description\":\"Chìa khoá mở ra những cơ hội mới. Biểu tượng của sự độc lập và lộng lẫy.\"}', '', 20, 4.90, 15, 1, 1, '2026-04-16 19:05:29'),
(12, 'VEL-ATLAS-BAN', 'Velmora Atlas X Bangle', 3, 2, 300000.00, 0.00, '{\"brand\":\"VELMORA Luxury\",\"material\":\"Bạc S925 mạ Vàng 18K\",\"stone\":\"None\",\"weight\":\"4.5 chỉ\",\"style\":\"Cổ điển\",\"description\":\"Ký tự La Mã tượng trưng cho thời gian vĩnh cửu. Thiết kế bản rộng đầy quyền năng.\"}', '', 0, 4.80, 26, 1, 0, '2026-04-16 19:05:29'),
(13, 'VEL-RTT-NK', 'Return to VELMORA Heart', 1, 2, 179000.00, 219000.00, '{\"brand\":\"VELMORA Luxury\",\"material\":\"Bạc S925\",\"stone\":\"Enamel Blue\",\"weight\":\"1.6 chỉ\",\"style\":\"Biểu tượng\",\"description\":\"Thiết kế kinh điển với tag trái tim mang phong cách riêng của Velmora.\"}', '', 55, 5.00, 142, 0, 1, '2026-04-16 19:05:29'),
(14, 'VEL-PAPER-EAR', 'Velmora Paper Flowers Earrings', 4, 4, 259000.00, 299000.00, '{\"brand\":\"VELMORA Luxury\",\"material\":\"Bạc S925\",\"stone\":\"Fire Opal Lab\",\"weight\":\"0.9 chỉ\",\"style\":\"Nghệ thuật\",\"description\":\"Sự chuyển động của những cánh hoa giấy trong gió, đính đá sang trọng.\"}', '', 0, 4.70, 11, 1, 1, '2026-04-16 19:05:29'),
(15, 'VEL-HARD-BR', 'Velmora HardWear Link Bangle', 3, 2, 269000.00, 319000.00, '{\"brand\":\"VELMORA Luxury\",\"material\":\"Bạc S925 mạ Rhodium\",\"stone\":\"None\",\"weight\":\"3.8 chỉ\",\"style\":\"Phá cách\",\"description\":\"Những mắt xích táo bạo mang hơi thở của thời đại mới.\"}', '', 25, 4.80, 33, 1, 1, '2026-04-16 19:05:29'),
(17, 'VEL-SIGN-ER', 'Velmora Signature Studs', 4, 2, 129000.00, 159000.00, '{\"brand\":\"VELMORA Luxury\",\"material\":\"Bạc S925 bóng\",\"stone\":\"None\",\"weight\":\"0.4 chỉ\",\"style\":\"Tối giản\",\"description\":\"Dành cho những người yêu thích sự đơn giản nhưng tinh tế đến từng chi tiết.\"}', '', 0, 4.60, 54, 0, 1, '2026-04-16 19:05:29'),
(18, 'VEL-OLIVE-RG', 'Olive Leaf Velmora Edition', 2, 2, 199000.00, 239000.00, '{\"brand\":\"VELMORA Luxury\",\"material\":\"Bạc S925\",\"stone\":\"Amethyst Lab\",\"weight\":\"1.7 chỉ\",\"style\":\"Thiên nhiên\",\"description\":\"Nhành ô liu tượng trưng cho hoà bình và sự phục hồi. Thiết kế đầy chất thơ.\"}', '', 30, 4.85, 21, 1, 1, '2026-04-16 19:05:29'),
(19, 'VEL-VIC-NK', 'Velmora Victoria Mixed Cluster', 1, 4, 299000.00, 389000.00, '{\"brand\":\"VELMORA Luxury\",\"material\":\"Bạc S925 mạ Platin\",\"stone\":\"Diamond Lab Mixed Cut\",\"weight\":\"3.1 chỉ\",\"style\":\"Đẳng cấp\",\"description\":\"Sự kết hợp của nhiều kiểu cắt đá tạo nên độ bắt sáng đa chiều rực rỡ.\"}', '', 8, 5.00, 17, 1, 0, '2026-04-16 19:05:29'),
(20, 'VEL-HAR-RING', 'Velmora Harmony Ring Band', 2, 2, 149000.00, 179000.00, '{\"brand\":\"VELMORA Luxury\",\"material\":\"Bạc S925 mạ Rhodium\",\"stone\":\"Zirconia tấm\",\"weight\":\"1.2 chỉ\",\"style\":\"Lãng mạn\",\"description\":\"Nhẫn Harmony với đường cong ôm trọn viên đá, tượng trưng cho sự hoà quyện tình yêu.\"}', '', 50, 4.90, 65, 1, 1, '2026-04-16 19:05:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) NOT NULL,
  `productId` bigint(20) NOT NULL,
  `url` text NOT NULL,
  `isMain` tinyint(1) DEFAULT 0,
  `displayOrder` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id`, `productId`, `url`, `isMain`, `displayOrder`) VALUES
(5, 2, 'https://media.tiffany.com/is/image/tco/70153238_RG_ALT3X1?hei=615&wid=615&fmt=webp', 1, 1),
(6, 2, 'https://media.tiffany.com/is/image/tco/70153238_RG_SIO2X1?hei=1300&wid=1300&fmt=webp', 0, 2),
(7, 3, 'https://media.tiffany.com/is/image/tco/73903920_RG_MAIN1X1?hei=628&wid=628&fmt=webp', 1, 1),
(8, 3, 'https://media.tiffany.com/is/image/tco/73903920_RG_SIO2X1?hei=1300&wid=1300&fmt=webp', 0, 2),
(9, 3, 'https://media.tiffany.com/is/image/tco/73903920_RG_SIO2X2?hei=615&wid=615&fmt=webp', 0, 3),
(10, 3, 'https://media.tiffany.com/is/image/tco/73903920_RG_ALT3X1?hei=615&wid=615&fmt=webp', 0, 4),
(11, 4, 'https://media.tiffany.com/is/image/tco/60004097_RG_MAIN1X1?hei=2000&wid=2000&fmt=webp', 1, 1),
(12, 4, 'https://media.tiffany.com/is/image/tco/60004097_RG_SIO2X1?hei=2000&wid=2000&fmt=webp', 0, 2),
(13, 5, 'https://media.tiffany.com/is/image/tco/67544412_RG_MAIN1X1?hei=628&wid=628&fmt=webp', 1, 1),
(14, 5, 'https://media.tiffany.com/is/image/tco/67544412_RG_SIO2X1?hei=1300&wid=1300&fmt=webp', 0, 2),
(15, 5, 'https://media.tiffany.com/is/image/tco/67544412_RG_ALT3X1?hei=615&wid=615&fmt=webp', 0, 3),
(16, 5, 'https://media.tiffany.com/is/image/tco/67544412_RG_ALT3X2?hei=615&wid=615&fmt=webp', 0, 4),
(17, 6, 'https://media.tiffany.com/is/image/tco/60022674_PDT_MAIN1X1?hei=628&wid=628&fmt=webp', 1, 1),
(18, 6, 'https://media.tiffany.com/is/image/tco/60022674_PDT_SIO2X1?hei=1300&wid=1300&fmt=webp', 0, 2),
(19, 6, 'https://media.tiffany.com/is/image/tco/60022674_PDT_ALT3X1?hei=615&wid=615&fmt=webp', 0, 3),
(20, 6, 'https://media.tiffany.com/is/image/tco/60022674_PDT_ALT3X2?hei=615&wid=615&fmt=webp', 0, 4),
(21, 7, 'https://media.tiffany.com/is/image/tco/60090615_ER_MAIN1X1?hei=628&wid=628&fmt=webp', 1, 1),
(22, 7, 'https://media.tiffany.com/is/image/tco/60090615_ER_SIO2X1?hei=1300&wid=1300&fmt=webp', 0, 2),
(23, 8, 'https://media.tiffany.com/is/image/tco/69526012_BLT_MAIN1X1?hei=628&wid=628&fmt=webp', 1, 1),
(24, 8, 'https://media.tiffany.com/is/image/tco/69526012_BLT_SIO2X1?hei=1300&wid=1300&fmt=webp', 0, 2),
(25, 8, 'https://media.tiffany.com/is/image/tco/69526012_BLT_SIO2X2?hei=615&wid=615&fmt=webp', 0, 3),
(26, 8, 'https://media.tiffany.com/is/image/tco/69526012_BLT_ALT3X1?hei=615&wid=615&fmt=webp', 0, 4),
(27, 8, 'https://media.tiffany.com/is/image/tco/69526012_BLT_ALT3X3?hei=1300&wid=1300&fmt=webp', 0, 5),
(28, 9, 'https://media.tiffany.com/is/image/tco/72149513_RG_ALT3X1?hei=615&wid=615&fmt=webp', 1, 1),
(29, 9, 'https://media.tiffany.com/is/image/tco/72149513_RG_SIO2X1?hei=1300&wid=1300&fmt=webp', 0, 2),
(30, 11, 'https://media.tiffany.com/is/image/tco/74627234_PDT_MAIN1X1?hei=2000&wid=2000&fmt=webp', 1, 1),
(31, 11, 'https://media.tiffany.com/is/image/tco/74627234_PDT_SIO2X1?hei=1300&wid=1300&fmt=webp', 0, 2),
(32, 11, 'https://media.tiffany.com/is/image/tco/74627234_PDT_ALT3X1?hei=615&wid=615&fmt=webp', 0, 3),
(33, 11, 'https://media.tiffany.com/is/image/tco/74627234_PDT_ALT3X3?hei=1300&wid=1300&fmt=webp', 0, 4),
(34, 13, 'https://media.tiffany.com/is/image/tco/60018402_PDT_MAIN1X1?hei=628&wid=628&fmt=webp', 1, 1),
(35, 13, 'https://media.tiffany.com/is/image/tco/60018402_PDT_SIO2X1?hei=1300&wid=1300&fmt=webp', 0, 2),
(36, 20, 'https://media.tiffany.com/is/image/tco/72149513_RG_ALT3X1?hei=615&wid=615&fmt=webp', 1, 1),
(37, 20, 'https://media.tiffany.com/is/image/tco/72149513_RG_SIO2X1?hei=2000&wid=2000&fmt=webp', 0, 2),
(38, 20, 'https://media.tiffany.com/is/image/tco/60147091_RG_MAIN1X1?hei=282&wid=282&fmt=webp', 0, 3),
(39, 20, 'https://media.tiffany.com/is/image/tco/72149513_RG_ALT3X2?hei=615&wid=615&fmt=webp', 0, 4),
(40, 10, 'https://media.tiffany.com/is/image/tco/72149513_RG_ALT3X2?hei=615&wid=615&fmt=webp', 1, 1),
(41, 10, 'https://media.tiffany.com/is/image/tco/72149513_RG_SIO2X1?hei=1300&wid=1300&fmt=webp', 0, 2),
(46, 15, 'https://media.tiffany.com/is/image/tco/60153083_BLT_MAIN1X1?hei=628&wid=628&fmt=webp', 1, 1),
(47, 15, 'https://media.tiffany.com/is/image/tco/60153083_BLT_SIO2X1?hei=1300&wid=1300&fmt=webp', 0, 2),
(50, 18, 'https://media.tiffany.com/is/image/tco/60132211_ER_MAIN1X1?hei=628&wid=628&fmt=webp', 1, 1),
(51, 18, 'https://media.tiffany.com/is/image/tco/60132211_ER_SIO2X1?hei=1300&wid=1300&fmt=webp', 0, 2),
(52, 19, 'https://media.tiffany.com/is/image/tco/60022674_PDT_MAIN1X1?hei=628&wid=628&fmt=webp', 1, 1),
(53, 19, 'https://media.tiffany.com/is/image/tco/60022674_PDT_SIO2X1?hei=1300&wid=1300&fmt=webp', 0, 2),
(56, 17, 'https://media.tiffany.com/is/image/tco/40304914_ER_MAIN1X1?hei=628&wid=628&fmt=webp', 0, 0),
(59, 14, 'https://media.tiffany.com/is/image/tco/66912167_ER_MAIN1X1?hei=628&wid=628&fmt=webp', 0, 0),
(61, 12, 'https://media.tiffany.com/is/image/tco/60149788_BLT_MAIN1X1?hei=628&wid=628&fmt=webp', 0, 0),
(62, 1, 'https://media.tiffany.com/is/image/tco/72149513_RG_ALT3X1?hei=615&wid=615&fmt=webp', 0, 0);

