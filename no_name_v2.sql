-- MySQL dump 10.13  Distrib 8.3.0, for macos12.6 (arm64)
--
-- Host: 127.0.0.1    Database: no_name
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id_account` int NOT NULL AUTO_INCREMENT,
  `hoTen` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dob` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `userName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `passWord` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `soDienThoai` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `diaChi` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id_account`),
  UNIQUE KEY `userName` (`userName`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `soDienThoai` (`soDienThoai`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'Nguyễn Công Minh','2000-07-07',_binary '','CongMinh77','e10adc3949ba59abbe56e057f20f883e','congminh.se7en@gmail.com','0949389572','Hà Nội','2021-06-14 00:00:00','2021-06-27 20:49:19'),(5,'Cong Minh','2024-05-16',NULL,'cmse7en','e10adc3949ba59abbe56e057f20f883e','cong.minh7.7.2000@gmail.com','0886182681','Thôn 4 Liên Hiệp Phúc Thọ Hà Nội','2024-05-19 09:49:12','2024-05-19 09:49:12'),(6,'Minh','2023-12-14',NULL,'test','202cb962ac59075b964b07152d234b70','minh@gmail.com','0987654321','Ha noi','2024-05-19 16:08:21','2024-05-19 16:25:13');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_role`
--

DROP TABLE IF EXISTS `account_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_role` (
  `id_account` int NOT NULL,
  `id_role` int NOT NULL,
  PRIMARY KEY (`id_account`,`id_role`),
  KEY `fk_role` (`id_role`),
  CONSTRAINT `fk_account_role` FOREIGN KEY (`id_account`) REFERENCES `account` (`id_account`),
  CONSTRAINT `fk_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_role`
--

LOCK TABLES `account_role` WRITE;
/*!40000 ALTER TABLE `account_role` DISABLE KEYS */;
INSERT INTO `account_role` VALUES (1,1),(5,1),(6,2);
/*!40000 ALTER TABLE `account_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `title_cate` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Laptop','2021-05-20 22:04:35','2021-05-20 22:04:35'),(2,'Máy tính','2021-05-20 22:04:35','2021-06-18 20:43:57'),(3,'Linh kiện','2021-05-20 22:04:35','2021-06-16 09:45:03'),(6,'Sản phẩm mới','2021-06-26 21:17:07','2021-06-26 21:17:12'),(7,'Bán chạy','2021-06-26 21:17:20','2021-06-26 21:17:20'),(8,'Giảm giá','2021-06-26 21:17:33','2021-06-27 09:32:11');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_account`
--

DROP TABLE IF EXISTS `order_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_account` (
  `id_order_account` int NOT NULL AUTO_INCREMENT,
  `id_account` int NOT NULL,
  `order_date` datetime NOT NULL,
  `recipient_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `receiver_address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_order_account`),
  KEY `fk_order_account` (`id_account`),
  CONSTRAINT `fk_order_account` FOREIGN KEY (`id_account`) REFERENCES `account` (`id_account`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_account`
--

LOCK TABLES `order_account` WRITE;
/*!40000 ALTER TABLE `order_account` DISABLE KEYS */;
INSERT INTO `order_account` VALUES (19,1,'2021-06-29 12:36:41','Công Minh','0949389572','Liên Hiệp, Phúc THọ, Hà Nội','');
/*!40000 ALTER TABLE `order_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id_order_detail` int NOT NULL AUTO_INCREMENT,
  `id_order_account` int NOT NULL,
  `id_product` int NOT NULL,
  `amount` int NOT NULL,
  `status` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_order_detail`),
  KEY `fk_order_account_detail` (`id_order_account`),
  KEY `fk_order_product_detail` (`id_product`),
  CONSTRAINT `fk_order_account_detail` FOREIGN KEY (`id_order_account`) REFERENCES `order_account` (`id_order_account`),
  CONSTRAINT `fk_order_product_detail` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (59,19,4,1,''),(60,19,4,1,''),(61,19,3,1,''),(62,19,4,1,''),(63,19,3,1,''),(64,19,1,4,''),(65,19,4,2,''),(66,19,1,4,''),(67,19,4,2,'');
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id_product` int NOT NULL AUTO_INCREMENT,
  `tenSanPham` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `thumnail` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `id_category` int NOT NULL,
  `discount` smallint DEFAULT '0',
  `created_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `moTaSanPham` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_product`),
  KEY `fk_category` (`id_category`),
  CONSTRAINT `fk_category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Macbook Pro 2020 MWP72SA/A (Silver)','Macbook-Pro-2020-MWP72SAA-Silver-1-2-600x600.jpg',46590000,1,0,'2021-06-13 22:12:23','2021-06-17 20:46:36','Màn hình Retina 13.3 inch mang đến góc nhìn rộng;\r\nTích hợp công nghệ màn hình IPS chống chói hiệu quả;\r\nCông nghệ màn hình True Tone hiển thị màu sắc chuẩn xác;\r\nCPU Intel core i5 thế hệ 10 xử thông tin trong thời gian ngắn;\r\nTouch ID đăng nhập bằng dấu vân tay, bảo mật tuyệt đối;\r\nSử dụng bộ vi xử lý đồ họa cao cấp Intel Iris Plus Graphics;\r\nỔ cứng SSD 512GB cho khả năng tải phần mềm nhanh chóng;\r\nTrang bị 4 cổng USB cho khả năng truyền thông tin tối đa.'),(3,'Acer Nitro 5','acer_nitro_5.png',28000000,1,0,'2021-06-16 13:22:16','2021-06-27 15:45:47','CPU	AMD: Ryzen 5 5600H 3.3GHz up to 4.2GHz 16MB;\r\nRAM: 8GB DDR4 3200MHz (2x SO-DIMM socket, up to 32GB SDRAM);\r\nỔ cứng: 512GB SSD M.2 PCIE (Còn trống 1 khe SSD M.2 PCIE và 1 khe 2.5\" SATA);\r\nCard đồ họa: NVIDIA GeForce GTX 1650 4GB GDDR6;\r\nMàn hình: 15.6\" FHD (1920 x 1080) IPS, 144Hz, Acer ComfyViewTM LED-backlit TFT LCD.'),(4,'Laptop Asus Zenbook UX434FLC-A6143T','1-130-1-600x600.jpg',24599000,1,0,'2021-06-18 18:25:06','2021-06-18 18:25:06','Hãng sản xuất: ASUS;\r\nTình trạng: mới 100%;\r\nBảo hành: 24 tháng;\r\nMô hình: UX434FLC-A6143T;\r\nMàu sắc: Royal Blue;\r\nBộ xử lý: Intel Core i5-10210U 1.6GHz up to 4.2GHz 6MB;\r\nRam: 8GB LPDDR3 2133MHz (Onboard);\r\nVGA: NVIDIA® GeForce® MX250 2GB GDDR5;\r\nỔ cứng: 512GB SSD M.2 PCIE G3X2.'),(5,'Apple Mac mini 2020','Máy-tính-đồng-bộ-Apple-Mac-mini-MXNG2SAA_2-600x600.jpg',29999000,2,0,'2021-06-18 21:21:06','2021-06-18 21:21:06','Hãng sản xuất: Apple;\r\nChủng loại: Mac Mini;\r\nPart Number: MXNG2SA/A;\r\nBộ vi xử lý: Intel Core i5 3.0Ghz / Turbo boost upto 4.6Ghz/9MB cache;\r\nBộ nhớ trong: 8GB DDR4 2666Mhz;\r\nVGA: Intel UHD 630;\r\nỔ cứng: 512GB SSD;\r\nỔ quang: No;\r\nGiao tiếp mạng: Gigabit;\r\nGiao tiếp không dây:  802.11ac , Bluetooth 5.0;\r\nCổng giao tiếp: 2 x USB 3.0,1 x LAN(RJ45),4 x ThunderBolt 3 (USB type C),1 x HDMI 2.0;\r\nCân nặng: 1.3kg;\r\nHệ điều hành: Mac OS X;\r\nBảo hành: 12 tháng.'),(6,'Máy tính Intel NUC 11 RNUC11PHKi7CAA2','1.1-6-600x600.jpg',32000000,2,0,'2021-06-22 17:36:48','2021-06-22 17:36:48','Bộ vi xử lý: Intel® Core™ i7-1165G7 Processor (12M Cache, up to 4.70 GHz);\r\nBộ nhớ: 2x 8GB DDR4-3200 RAM;\r\nCard đồ họa: VGA onboard Intel® Iris® Xe Graphics and Nvidia Geforce RTX 2060;\r\nỔ cứng: Intel Optane Memory H10 (32GB + 512GB) Solid State Storage;\r\nGiao tiếp mạng: Gigabit LAN + Wifi;\r\nCổng giao tiếp: 3x front (2x Type-A, 1x Type-C) and 5x rear USB 3.1 (4x Type-A, 1x Type-C); 2x USB 2.0 via internal headers;\r\nKiểu dáng: Case siêu nhỏ;\r\nHệ điều hành: Dos;\r\nBảo hành: 36 tháng.');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id_role` int NOT NULL AUTO_INCREMENT,
  `name_role` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'Khách'),(3,'Nhân viên');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id_stock` int NOT NULL AUTO_INCREMENT,
  `id_product` int NOT NULL,
  `amount` int NOT NULL,
  `action` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `report` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_stock`),
  KEY `fk_stock` (`id_product`),
  CONSTRAINT `fk_stock` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (2,4,10,'Nhập hàng','2021-06-19 10:18:30','2021-06-19 10:21:08','Hàng xịn mới về'),(3,3,15,'Nhập hàng','2021-06-19 09:35:30','2021-06-19 10:29:04','Máy tính hot'),(4,4,10,'Nhập hàng','2021-06-19 10:23:09','2021-06-19 10:23:09','Mới nhập'),(5,1,100,'Nhập hàng','2021-06-19 10:28:28','2021-06-19 10:28:28',''),(6,4,100,'Nhập hàng','2021-06-19 10:42:12','2021-06-19 10:42:12','thêm hàng mới'),(7,5,10,'Nhập hàng','2021-06-19 10:44:48','2021-06-19 10:44:48','Máy đắt nhập ít'),(8,4,10,'Xuất hàng','2021-06-19 10:47:42','2021-06-19 10:47:42','thanh lý sản phẩm gấp'),(10,3,5,'Xuất hàng','2021-06-26 22:47:35','2021-06-26 22:47:35','Khách mua');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-19 16:59:27
