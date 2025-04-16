-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2025 at 06:12 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_shop`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addToCart` ()   BEGIN
	-- Declare variables
	DECLARE var_customer_id INT;
	DECLARE var_product_id INT;
	DECLARE var_quantity INT;
	DECLARE var_check INT;

	-- Get data
	SET var_customer_id = (SELECT customer_id FROM customers
							ORDER BY RAND()
							LIMIT 1);
							
	SET var_product_id = (SELECT product_id FROM products
							ORDER BY RAND()
							LIMIT 1);

	SET var_quantity =  FLOOR(RAND()*10+1);
	
        -- Insert data
	INSERT INTO shopping_cart(customer_id, product_id, quantity)
	VALUES(var_customer_id, var_product_id, var_quantity)
	ON DUPLICATE KEY
	UPDATE quantity = quantity + VALUES(quantity);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `placeOrder` ()   BEGIN
	-- Declare variables
	DECLARE var_customer_id INT;
        DECLARE var_order_number INT;
        DECLARE var_payment_id INT;
        DECLARE var_address_id INT;
	
	-- Select random customer
	SELECT customer_id INTO var_customer_id
	FROM shopping_cart
	ORDER BY RAND()
	LIMIT 1;

       -- Generate order number
       SET var_order_number = FLOOR(100000 + RAND() * 999999);
       SET var_payment_id = getPaymentId(var_customer_id);
       SET var_address_id = getAddressId(var_customer_id);
	
	-- Place order
	INSERT INTO orders (order_number, customer_id, product_id, quantity, unit_price, payment_id, address_id)
	SELECT var_order_number, var_customer_id, product_id, quantity, unit_price, var_payment_id, var_address_id
        FROM shopping_cart_view
        WHERE customer_id = var_customer_id;
	
	-- Remove rows from shopping_cart
	DELETE FROM shopping_cart
        WHERE customer_id = var_customer_id;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `age` (`birthdate` DATE) RETURNS INT(11)  RETURN TIMESTAMPDIFF(YEAR, birthdate, CURRENT_DATE)$$

CREATE DEFINER=`root`@`localhost` FUNCTION `customer_level` (`var_total_spent` DECIMAL(42,2)) RETURNS VARCHAR(20) CHARSET utf8mb4 COLLATE utf8mb4_general_ci DETERMINISTIC BEGIN
	DECLARE var_customer_level VARCHAR(20);
    
    IF var_total_spent >= 1000 THEN
    	SET var_customer_level = 'SILVER';
	ELSE SET var_customer_level = 'BASIC';
    END IF;
    RETURN (var_customer_level);
    
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `getAddressId` (`var_customer_id` INT) RETURNS INT(11) DETERMINISTIC BEGIN
	DECLARE var_address_id INT;
	
	SELECT address_id INTO var_address_id
	FROM customer_addresses
	WHERE customer_id = var_customer_id
	ORDER BY RAND()
	LIMIT 1;
	
	RETURN (var_address_id);
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `getPaymentId` (`var_customer_id` INT) RETURNS INT(11) DETERMINISTIC BEGIN
	DECLARE var_payment_id INT;
	
	SELECT payment_id INTO var_payment_id
	FROM customer_payments
	WHERE customer_id = var_customer_id
	ORDER BY RAND()
	LIMIT 1;
	
	RETURN (var_payment_id);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `direction` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `zip_code` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`address_id`, `customer_id`, `direction`, `location`, `country`, `zip_code`) VALUES
(1, 1, 'Paseo Moreras, 15', 'Maó', 'Spain', '07702'),
(2, 1, 'Main Street, 3', 'London', 'United Kingdom', 'S234 A51'),
(3, 2, 'Carrer Nou, 21', 'Fornells', 'Spain', '07736'),
(4, 2, 'Royal Avenue, 13', 'Manchester', 'United Kingdom', 'A345 T27'),
(5, 3, 'Brick Town, 9', 'Oklahoma City', 'United States', '7748OK'),
(6, 4, 'Liberty City, 71', 'New York', 'United States', '1547PR'),
(7, 4, 'Thunder Avenue, 55', 'Oklahoma City', 'United States', '7748OK'),
(8, 4, 'Kartofeln Street, 1', 'Koln', 'Germany', 'S2345'),
(9, 5, 'Cheddar Avenue, 7', 'Minnesota', 'United States', '8425MN'),
(10, 6, 'Saviors, 21', 'Oklahoma City', 'United States', '7747OK'),
(11, 7, 'Calle Mayor, 11', 'Albacete', 'Spain', '96653'),
(12, 8, 'MVP Avenue, 2', 'Las Vegas', 'United States', '0469LV'),
(13, 8, 'Brick Town, 7', 'Oklahoma City', 'United States', '7748OK'),
(14, 9, 'Dorture Chamber, 5', 'Tulsa', 'United States', '7704OK'),
(15, 10, 'Brick Town, 8', 'Oklahoma City', 'United States', '7748OK');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL,
  `parent_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `parent_category_id`) VALUES
(1, 'Gaming', 4),
(2, 'PSN', 4),
(3, 'Xbox', 4),
(4, 'Steam', 2),
(5, 'Epic Games', 2),
(6, 'Keyboards', 2),
(7, 'Mouses', 2),
(8, 'Monitors', 2),
(9, 'Android', 3),
(10, 'iPhone', 3),
(11, 'Smart Watches', 3);

-- --------------------------------------------------------

--
-- Stand-in structure for view `categories_view`
-- (See below for the actual view)
--
CREATE TABLE `categories_view` (
`category_id` int(11)
,`parent_category_id` int(11)
,`category_name` varchar(100)
,`parent_category_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `forename` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `nif` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `birthdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `forename`, `surname`, `nif`, `email`, `phone`, `birthdate`) VALUES
(1, 'Jon', 'Eidson', '21212458F', 'jon@gmail.com', '+34 613121415', '1997-06-19'),
(2, 'John', 'Smith', '31321131G', 'john@gmail.com', '+34 611215162', '2000-11-12'),
(3, 'Alex', 'Caruso', '42365432D', 'acaruso@gmail.com', '+34 658744496', '1994-10-30'),
(4, 'Isaiah', 'Hartenstein', '84475662G', 'ihart@gmail.com', '+34 632147856', '1999-05-06'),
(5, 'Chet', 'Holmgren', '87432243T', 'chet@gmail.com', '+34 687221158', '1969-01-14'),
(6, 'Aaron', 'Wiggins', '41515648B', 'awiggs@gmail.com', '+34 611859754', '2004-02-29'),
(7, 'Isaiah', 'Joe', '51248869X', 'izai@gmail.com', '+34 655200788', '2004-03-21'),
(8, 'Shai', 'Gilgeous-Alexander', '55217748S', 'sga@gmail.com', '+34 699578410', '1998-09-16'),
(9, 'Luguentz', 'Dort', '55289677L', 'lubeast@gmail.com', '+34 611098862', '2004-08-30'),
(10, 'Jalen', 'Williams', '41213377W', 'jdub@gmail.com', '+34 601227399', '2008-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `customer_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `default_address` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_addresses`
--

INSERT INTO `customer_addresses` (`customer_id`, `address_id`, `default_address`) VALUES
(1, 1, 0),
(1, 2, 1),
(2, 3, 0),
(2, 4, 1),
(3, 5, 1),
(4, 6, 0),
(4, 7, 1),
(4, 8, 0),
(5, 9, 1),
(6, 10, 1),
(7, 11, 1),
(8, 12, 0),
(8, 13, 1),
(9, 14, 1),
(10, 15, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `customer_level_view`
-- (See below for the actual view)
--
CREATE TABLE `customer_level_view` (
);

-- --------------------------------------------------------

--
-- Table structure for table `customer_payments`
--

CREATE TABLE `customer_payments` (
  `customer_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_payments`
--

INSERT INTO `customer_payments` (`customer_id`, `payment_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 2),
(4, 1),
(4, 2),
(4, 3),
(5, 1),
(6, 1),
(7, 2),
(7, 3),
(8, 3),
(9, 1),
(10, 1),
(10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_number` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `placed_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_number`, `customer_id`, `product_id`, `quantity`, `unit_price`, `placed_on`, `payment_id`, `address_id`) VALUES
(100592, 7, 18, 1, 20.00, '2025-03-13 16:54:42', 3, 11),
(100592, 7, 19, 7, 7.99, '2025-03-13 16:54:42', 3, 11),
(105929, 7, 3, 1, 76.99, '2025-03-13 16:54:42', 3, 11),
(105929, 7, 17, 2, 50.00, '2025-03-13 16:54:42', 3, 11),
(265799, 10, 1, 3, 450.00, '2025-03-13 16:48:03', 1, 15),
(265799, 10, 4, 1, 56.99, '2025-03-13 16:48:03', 1, 15),
(265799, 10, 5, 2, 16.99, '2025-03-13 16:48:03', 1, 15),
(265799, 10, 6, 16, 44.99, '2025-03-13 16:48:03', 1, 15),
(265799, 10, 8, 9, 124.99, '2025-03-13 16:48:03', 1, 15),
(265799, 10, 12, 7, 50.00, '2025-03-13 16:48:03', 1, 15),
(265799, 10, 15, 9, 28.99, '2025-03-13 16:48:03', 1, 15),
(265799, 10, 25, 4, 20.00, '2025-03-13 16:48:03', 1, 15),
(329673, 9, 4, 2, 56.99, '2025-03-13 17:08:41', 1, 14),
(329673, 9, 5, 1, 16.99, '2025-03-13 17:08:41', 1, 14),
(329673, 9, 6, 19, 44.99, '2025-03-13 17:08:41', 1, 14),
(329673, 9, 7, 10, 15.99, '2025-03-13 17:08:41', 1, 14),
(329673, 9, 9, 5, 99.70, '2025-03-13 17:08:41', 1, 14),
(329673, 9, 11, 6, 274.98, '2025-03-13 17:08:41', 1, 14),
(329673, 9, 16, 2, 99.99, '2025-03-13 17:08:41', 1, 14),
(329673, 9, 17, 3, 50.00, '2025-03-13 17:08:41', 1, 14),
(329673, 9, 18, 7, 20.00, '2025-03-13 17:08:41', 1, 14),
(329673, 9, 21, 3, 80.00, '2025-03-13 17:08:41', 1, 14),
(329673, 9, 24, 3, 50.00, '2025-03-13 17:08:41', 1, 14),
(407756, 2, 8, 3, 124.99, '2025-03-13 17:00:53', 1, 4),
(407756, 2, 9, 10, 99.70, '2025-03-13 17:00:53', 1, 4),
(407756, 2, 11, 1, 274.98, '2025-03-13 17:00:53', 1, 4),
(407756, 2, 12, 7, 50.00, '2025-03-13 17:00:53', 1, 4),
(407756, 2, 13, 8, 20.00, '2025-03-13 17:00:53', 1, 4),
(407756, 2, 20, 5, 19.99, '2025-03-13 17:00:53', 1, 4),
(407756, 2, 23, 3, 20.00, '2025-03-13 17:00:53', 1, 4),
(514519, 3, 4, 6, 56.99, '2025-03-13 16:58:46', 2, 5),
(514519, 3, 7, 4, 15.99, '2025-03-13 16:58:46', 2, 5),
(514519, 3, 13, 1, 20.00, '2025-03-13 16:58:46', 2, 5),
(514519, 3, 19, 9, 7.99, '2025-03-13 16:58:46', 2, 5),
(514519, 3, 20, 4, 19.99, '2025-03-13 16:58:46', 2, 5),
(514519, 3, 25, 3, 20.00, '2025-03-13 16:58:46', 2, 5),
(526336, 8, 3, 1, 76.99, '2025-03-13 16:48:36', 3, 13),
(526336, 8, 4, 1, 56.99, '2025-03-13 16:48:36', 3, 13),
(526336, 8, 8, 1, 124.99, '2025-03-13 16:48:36', 3, 13),
(526336, 8, 9, 7, 99.70, '2025-03-13 16:48:36', 3, 13),
(526336, 8, 10, 19, 1089.00, '2025-03-13 16:48:36', 3, 13),
(943083, 5, 22, 1, 50.00, '2025-03-13 16:54:57', 1, 9),
(943083, 5, 24, 8, 50.00, '2025-03-13 16:54:57', 1, 9),
(999331, 4, 1, 1, 450.00, '2025-03-13 16:55:52', 3, 8),
(999331, 4, 2, 1, 380.00, '2025-03-13 16:55:52', 3, 8);

-- --------------------------------------------------------

--
-- Stand-in structure for view `orders_view`
-- (See below for the actual view)
--
CREATE TABLE `orders_view` (
`order_number` int(11)
,`customer_id` int(11)
,`product_id` int(11)
,`product_name` varchar(100)
,`quantity` int(11)
,`unit_price` decimal(10,2)
,`subtotal` decimal(20,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `parent_categories`
--

CREATE TABLE `parent_categories` (
  `parent_category_id` int(11) NOT NULL,
  `parent_category_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parent_categories`
--

INSERT INTO `parent_categories` (`parent_category_id`, `parent_category_name`) VALUES
(1, 'Main'),
(2, 'PC'),
(3, 'Smartphones'),
(4, 'Consoles');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `payment_method` enum('Credit card','Paypal','Bizum') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `payment_method`) VALUES
(1, 'Credit card'),
(2, 'Paypal'),
(3, 'Bizum');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `parent_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `unit_price`, `parent_category_id`) VALUES
(1, 'PlayStation 5', 450.00, 4),
(2, 'Xbox One', 380.00, 4),
(3, 'Steelseries Apex 3 - Gaming Keyboard', 76.99, 2),
(4, 'Forgeon Clutch - Gaming Keyboard)', 56.99, 2),
(5, 'Essential RetroWave Keyboard', 16.99, 2),
(6, 'Logitech G203 - Gaming Mouse', 44.99, 2),
(7, 'Tempest X14 Warden - Gaming Mouse', 15.99, 2),
(8, 'Alurin CoreVision 24 FHD 23.8\"', 124.99, 2),
(9, 'MSI PRO MP225 21.5\"', 99.70, 2),
(10, 'Apple iPhone 16 256GB', 1089.00, 3),
(11, 'Xiaomi Redmi Note 13 Pro 512GB', 274.98, 3),
(12, 'PSN Gift Card 50€', 50.00, 4),
(13, 'PSN Gift Card 20€', 20.00, 4),
(14, 'PS Plus 1 Month', 10.00, 4),
(15, 'PS Plus 3 Months', 28.99, 4),
(16, 'PS Plus 1 Year', 99.99, 4),
(17, 'Xbox Gift Card 50€', 50.00, 4),
(18, 'Xbox Gift Card 20€', 20.00, 4),
(19, 'Game Pass 1 Month', 7.99, 4),
(20, 'Game Pass 3 Months', 19.99, 4),
(21, 'Game Pass 1 Year', 80.00, 4),
(22, 'Steam Gift Card 50€', 50.00, 2),
(23, 'Steam Gift Card 20€', 20.00, 2),
(24, 'Epic Store Gift Card 50€', 50.00, 2),
(25, 'Epic Store Gift Card 20€', 20.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `products_categories`
--

CREATE TABLE `products_categories` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_categories`
--

INSERT INTO `products_categories` (`product_id`, `category_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 1),
(3, 6),
(4, 1),
(4, 6),
(5, 6),
(6, 1),
(6, 7),
(7, 1),
(7, 7),
(8, 1),
(8, 8),
(9, 1),
(9, 8),
(10, 10),
(11, 9),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
(15, 2),
(16, 1),
(16, 2),
(17, 1),
(17, 3),
(18, 1),
(18, 3),
(19, 1),
(19, 3),
(20, 1),
(20, 3),
(21, 1),
(21, 3),
(22, 1),
(22, 4),
(23, 1),
(23, 4),
(24, 1),
(24, 5),
(25, 1),
(25, 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `products_view`
-- (See below for the actual view)
--
CREATE TABLE `products_view` (
`product_id` int(11)
,`product_name` varchar(100)
,`unit_price` decimal(10,2)
,`parent_category_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `inserted_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shopping_cart`
--

INSERT INTO `shopping_cart` (`customer_id`, `product_id`, `quantity`, `inserted_on`) VALUES
(1, 2, 4, '2025-03-11 18:42:17'),
(1, 3, 1, '2025-03-13 16:56:58'),
(1, 4, 7, '2025-03-13 16:56:58'),
(1, 5, 10, '2025-03-13 16:56:58'),
(1, 7, 10, '2025-03-13 16:56:58'),
(1, 9, 10, '2025-03-13 16:56:58'),
(1, 11, 8, '2025-03-13 16:56:58'),
(1, 15, 2, '2024-12-11 18:53:12'),
(1, 19, 1, '2025-03-13 16:56:58'),
(1, 21, 8, '2025-03-13 16:56:58'),
(1, 23, 4, '2025-03-13 16:56:58'),
(4, 9, 7, '2025-03-13 16:56:58'),
(4, 13, 8, '2025-03-13 16:56:58'),
(4, 14, 10, '2025-03-13 16:56:58'),
(4, 18, 8, '2025-03-13 16:56:58'),
(5, 14, 9, '2025-03-13 16:56:58'),
(5, 16, 11, '2025-03-13 16:56:58'),
(5, 20, 4, '2025-03-13 16:56:58'),
(6, 16, 5, '2025-03-13 16:56:58'),
(6, 17, 3, '2025-03-13 16:56:58'),
(6, 18, 16, '2025-03-13 16:56:58'),
(6, 24, 8, '2025-03-13 16:56:58'),
(7, 2, 3, '2025-03-13 16:56:58'),
(7, 3, 10, '2025-03-13 16:56:58'),
(7, 6, 10, '2025-03-13 16:56:58'),
(7, 8, 4, '2025-03-13 16:56:58'),
(7, 13, 1, '2025-03-13 16:56:58'),
(8, 1, 4, '2025-03-13 16:56:58'),
(8, 4, 6, '2025-03-13 16:56:58'),
(8, 6, 10, '2025-03-13 16:56:58'),
(8, 10, 17, '2025-03-13 16:56:58'),
(8, 22, 3, '2025-03-13 16:56:58'),
(8, 23, 9, '2025-03-13 16:56:58'),
(10, 3, 9, '2025-03-13 16:56:58'),
(10, 9, 10, '2025-03-13 16:56:58'),
(10, 10, 3, '2025-03-13 16:56:58'),
(10, 13, 4, '2025-03-13 16:56:58'),
(10, 14, 1, '2025-03-13 16:56:58'),
(10, 15, 3, '2025-03-13 16:56:58'),
(10, 19, 7, '2025-03-13 16:56:58'),
(10, 22, 5, '2025-03-13 16:56:58');

-- --------------------------------------------------------

--
-- Stand-in structure for view `shopping_cart_view`
-- (See below for the actual view)
--
CREATE TABLE `shopping_cart_view` (
`customer_id` int(11)
,`product_id` int(11)
,`product_name` varchar(100)
,`quantity` int(11)
,`unit_price` decimal(10,2)
,`subtotal` decimal(20,2)
);

-- --------------------------------------------------------

--
-- Structure for view `categories_view`
--
DROP TABLE IF EXISTS `categories_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `categories_view`  AS SELECT `c`.`category_id` AS `category_id`, `p`.`parent_category_id` AS `parent_category_id`, `c`.`category_name` AS `category_name`, `p`.`parent_category_name` AS `parent_category_name` FROM (`categories` `c` join `parent_categories` `p` on(`c`.`parent_category_id` = `p`.`parent_category_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `customer_level_view`
--
DROP TABLE IF EXISTS `customer_level_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customer_level_view`  AS SELECT `total_spent_customers_view`.`customer_id` AS `customer_id`, `total_spent_customers_view`.`forename` AS `forename`, `total_spent_customers_view`.`surname` AS `surname`, `total_spent_customers_view`.`total_spent` AS `total_spent`, `customer_level`(`total_spent_customers_view`.`total_spent`) AS `level` FROM `total_spent_customers_view` ORDER BY `total_spent_customers_view`.`customer_id` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `orders_view`
--
DROP TABLE IF EXISTS `orders_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orders_view`  AS SELECT `o`.`order_number` AS `order_number`, `o`.`customer_id` AS `customer_id`, `o`.`product_id` AS `product_id`, `p`.`product_name` AS `product_name`, `o`.`quantity` AS `quantity`, `o`.`unit_price` AS `unit_price`, `o`.`quantity`* `o`.`unit_price` AS `subtotal` FROM (`orders` `o` join `products` `p` on(`o`.`product_id` = `p`.`product_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `products_view`
--
DROP TABLE IF EXISTS `products_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `products_view`  AS SELECT `pr`.`product_id` AS `product_id`, `pr`.`product_name` AS `product_name`, `pr`.`unit_price` AS `unit_price`, `pa`.`parent_category_name` AS `parent_category_name` FROM (`products` `pr` join `parent_categories` `pa` on(`pr`.`parent_category_id` = `pa`.`parent_category_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `shopping_cart_view`
--
DROP TABLE IF EXISTS `shopping_cart_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `shopping_cart_view`  AS SELECT `s`.`customer_id` AS `customer_id`, `s`.`product_id` AS `product_id`, `p`.`product_name` AS `product_name`, `s`.`quantity` AS `quantity`, `p`.`unit_price` AS `unit_price`, `s`.`quantity`* `p`.`unit_price` AS `subtotal` FROM (`shopping_cart` `s` join `products` `p` on(`s`.`product_id` = `p`.`product_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_category_id` (`parent_category_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`customer_id`,`address_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `customer_payments`
--
ALTER TABLE `customer_payments`
  ADD PRIMARY KEY (`customer_id`,`payment_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_number`,`customer_id`,`product_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `parent_categories`
--
ALTER TABLE `parent_categories`
  ADD PRIMARY KEY (`parent_category_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `parent_category_id` (`parent_category_id`);

--
-- Indexes for table `products_categories`
--
ALTER TABLE `products_categories`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`customer_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `parent_categories`
--
ALTER TABLE `parent_categories`
  MODIFY `parent_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_category_id`) REFERENCES `parent_categories` (`parent_category_id`);

--
-- Constraints for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD CONSTRAINT `customer_addresses_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `customer_addresses_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`);

--
-- Constraints for table `customer_payments`
--
ALTER TABLE `customer_payments`
  ADD CONSTRAINT `customer_payments_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `customer_payments_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`parent_category_id`) REFERENCES `parent_categories` (`parent_category_id`);

--
-- Constraints for table `products_categories`
--
ALTER TABLE `products_categories`
  ADD CONSTRAINT `products_categories_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `products_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD CONSTRAINT `shopping_cart_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `shopping_cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
