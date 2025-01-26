-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-12-2024 a las 20:14:42
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `online_shop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addresses`
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
-- Volcado de datos para la tabla `addresses`
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
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL,
  `parent_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
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
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `forename` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `nif` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`customer_id`, `forename`, `surname`, `nif`, `email`, `phone`) VALUES
(1, 'Jon', 'Eidson', '21212458F', 'jon@gmail.com', '+34 613121415'),
(2, 'John', 'Smith', '31321131G', 'john@gmail.com', '+34 611215162'),
(3, 'Alex', 'Caruso', '42365432D', 'acaruso@gmail.com', '+34 658744496'),
(4, 'Isaiah', 'Hartenstein', '84475662G', 'ihart@gmail.com', '+34 632147856'),
(5, 'Chet', 'Holmgren', '87432243T', 'chet@gmail.com', '+34 687221158'),
(6, 'Aaron', 'Wiggins', '41515648B', 'awiggs@gmail.com', '+34 611859754'),
(7, 'Isaiah', 'Joe', '51248869X', 'izai@gmail.com', '+34 655200788'),
(8, 'Shai', 'Gilgeous-Alexander', '55217748S', 'sga@gmail.com', '+34 699578410'),
(9, 'Luguentz', 'Dort', '55289677L', 'lubeast@gmail.com', '+34 611098862'),
(10, 'Jalen', 'Williams', '41213377W', 'jdub@gmail.com', '+34 601227399');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `customer_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `default_address` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `customer_addresses`
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
-- Estructura de tabla para la tabla `customer_payments`
--

CREATE TABLE `customer_payments` (
  `customer_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `customer_payments`
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
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `order_number` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `placed_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`order_number`, `customer_id`, `product_id`, `quantity`, `unit_price`, `placed_on`) VALUES
(1, 1, 10, 1, 1089.00, '2024-12-11 18:59:21'),
(2, 1, 15, 2, 28.99, '2024-12-11 18:59:21'),
(3, 2, 20, 5, 19.99, '2024-12-11 18:59:21'),
(4, 3, 25, 3, 20.00, '2024-12-11 18:59:21'),
(5, 4, 1, 1, 450.00, '2024-12-11 18:59:21'),
(6, 7, 6, 1, 44.99, '2024-12-11 18:59:21'),
(7, 7, 17, 1, 50.00, '2024-12-11 18:59:21'),
(8, 7, 18, 1, 20.00, '2024-12-11 18:59:21'),
(9, 8, 8, 1, 124.99, '2024-12-11 18:59:21'),
(10, 9, 2, 1, 380.00, '2024-12-11 18:59:21'),
(11, 9, 16, 2, 99.99, '2024-12-11 18:59:21'),
(12, 10, 10, 4, 56.99, '2024-12-11 18:59:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parent_categories`
--

CREATE TABLE `parent_categories` (
  `parent_category_id` int(11) NOT NULL,
  `parent_category_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `parent_categories`
--

INSERT INTO `parent_categories` (`parent_category_id`, `parent_category_name`) VALUES
(1, 'Main'),
(2, 'PC'),
(3, 'Smartphones'),
(4, 'Consoles');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `payment_method` enum('Credit card','Paypal','Bizum') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `payments`
--

INSERT INTO `payments` (`payment_id`, `payment_method`) VALUES
(1, 'Credit card'),
(2, 'Paypal'),
(3, 'Bizum');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `parent_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
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
-- Estructura de tabla para la tabla `products_categories`
--

CREATE TABLE `products_categories` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products_categories`
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
-- Estructura de tabla para la tabla `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `inserted_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `shopping_cart`
--

INSERT INTO `shopping_cart` (`customer_id`, `product_id`, `quantity`, `inserted_on`) VALUES
(1, 10, 1, '2024-12-11 18:50:33'),
(1, 15, 2, '2024-12-11 18:53:12'),
(2, 20, 5, '2024-12-11 18:53:12'),
(3, 25, 3, '2024-12-11 18:53:12'),
(4, 1, 1, '2024-12-11 18:53:12'),
(4, 2, 1, '2024-12-11 18:53:12'),
(7, 6, 1, '2024-12-11 18:53:12'),
(7, 17, 2, '2024-12-11 18:53:12'),
(7, 18, 1, '2024-12-11 18:53:12'),
(8, 3, 1, '2024-12-11 18:53:12'),
(8, 4, 1, '2024-12-11 18:53:12'),
(8, 8, 1, '2024-12-11 18:53:12'),
(9, 2, 1, '2024-12-11 18:53:12'),
(9, 16, 2, '2024-12-11 18:53:12'),
(10, 10, 4, '2024-12-11 18:53:12');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_category_id` (`parent_category_id`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indices de la tabla `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`customer_id`,`address_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indices de la tabla `customer_payments`
--
ALTER TABLE `customer_payments`
  ADD PRIMARY KEY (`customer_id`,`payment_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_number`,`customer_id`,`product_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `parent_categories`
--
ALTER TABLE `parent_categories`
  ADD PRIMARY KEY (`parent_category_id`);

--
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `parent_category_id` (`parent_category_id`);

--
-- Indices de la tabla `products_categories`
--
ALTER TABLE `products_categories`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indices de la tabla `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`customer_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `addresses`
--
ALTER TABLE `addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `order_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `parent_categories`
--
ALTER TABLE `parent_categories`
  MODIFY `parent_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Filtros para la tabla `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_category_id`) REFERENCES `parent_categories` (`parent_category_id`);

--
-- Filtros para la tabla `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD CONSTRAINT `customer_addresses_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `customer_addresses_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`);

--
-- Filtros para la tabla `customer_payments`
--
ALTER TABLE `customer_payments`
  ADD CONSTRAINT `customer_payments_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `customer_payments_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`);

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`parent_category_id`) REFERENCES `parent_categories` (`parent_category_id`);

--
-- Filtros para la tabla `products_categories`
--
ALTER TABLE `products_categories`
  ADD CONSTRAINT `products_categories_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `products_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Filtros para la tabla `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD CONSTRAINT `shopping_cart_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `shopping_cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
