-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2025 at 06:41 PM
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
-- Database: `rentacar`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addReservation` ()   BEGIN
	-- Declare variables
	DECLARE var_customer_id INT;
	DECLARE var_car_id INT;
	DECLARE var_date_in DATE;
	DECLARE var_date_out DATE;
	DECLARE var_price_per_day INT;
	
	-- Get dates
	SET var_date_in = SUBDATE('2025-12-31', INTERVAL (FLOOR(1+RAND()*400)) DAY);
	SET var_date_out = DATE_ADD(var_date_in, INTERVAL (FLOOR(RAND()*7+1)) DAY);
	
	-- Get random customer
	SELECT customer_id INTO var_customer_id
	FROM customers
	ORDER BY RAND()
	LIMIT 1;
	
	-- Get an available car
	SELECT car_id INTO var_car_id
	FROM cars
	WHERE car_id NOT IN (SELECT car_id
						FROM reservations
						WHERE date_in <= var_date_out
						AND date_out >= var_date_in)
	ORDER BY RAND()
	LIMIT 1;
	
	-- Get price
	SELECT price_per_day INTO var_price_per_day
	FROM cars
	WHERE car_id = var_car_id;
	
	-- Generate the reservation
        IF var_car_id IS NOT NULL THEN
	   INSERT INTO reservations (customer_id, car_id, date_in, date_out, price_per_day)
	   VALUES (var_customer_id, var_car_id, var_date_in, var_date_out, var_price_per_day);
        END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `available_cars` (IN `var_date_in` DATE, IN `var_date_out` DATE)   BEGIN
    SELECT car_class, COUNT(car_id) AS available_cars
    FROM cars
    WHERE car_id NOT IN (SELECT car_id
                         FROM reservations
                         WHERE date_in <= var_date_out
                          AND date_out >= var_date_in)
    GROUP BY car_class;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `total_price` (`var_date_out` DATE, `var_date_in` DATE, `var_price_per_day` INT) RETURNS INT(11) DETERMINISTIC BEGIN
	DECLARE var_total_price INT;
    
    SET var_total_price = (DATEDIFF(var_date_out, var_date_in)+1)*var_price_per_day;
    
    RETURN(var_total_price);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL,
  `model` varchar(100) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  `plate` varchar(100) NOT NULL,
  `seats` int(11) NOT NULL,
  `doors` int(11) NOT NULL,
  `fuel` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `itv` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `price_per_day` int(11) NOT NULL,
  `car_class` enum('economy','business','luxury','superlux') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `model`, `brand`, `color`, `plate`, `seats`, `doors`, `fuel`, `location`, `itv`, `state`, `price_per_day`, `car_class`) VALUES
(1, 'Auris', 'Toyota', 'blue', '3412LJM', 5, 5, 'Diesel', 'Airport', 'Yes', 'Good', 80, 'economy'),
(2, 'Corsa', 'Opel', 'red', '4131LBN', 5, 5, 'Gasoline', 'Airport', 'Yes', 'Good', 80, 'economy'),
(3, 'Panda', 'Fiat', 'blue', '8021HRZ', 5, 5, 'Gasoline', 'Airport', 'Yes', 'Good', 80, 'economy'),
(4, 'Cupra', 'Nissan', 'white', '5621JDR', 5, 5, 'Diesel', 'Airport', 'Yes', 'Good', 100, 'business'),
(5, 'Auris', 'Toyota', 'black', '8921TYN', 5, 5, 'Diesel', 'Airport', 'Yes', 'Good', 80, 'economy'),
(6, 'Cupra', 'Nissan', 'grey', '5872RTX', 5, 5, 'Diesel', 'Airport', 'Yes', 'Good', 100, 'business'),
(7, 'A3 Sportback', 'Audi', 'black', '8931DRS', 5, 5, 'Diesel', 'Airport', 'Yes', 'Good', 400, 'superlux'),
(8, 'Q3', 'Audi', 'beige', '4783TVC', 5, 5, 'Diesel', 'Airport', 'Yes', 'Good', 100, 'business'),
(9, 'Serie 4 Cabrio', 'BMW', 'blue', '7725LKS', 4, 3, 'Diesel', 'Aiport', 'Yes', 'Good', 100, 'business'),
(10, 'Vito', 'Mercedes', 'white', '4789GTX', 9, 5, 'Diesel', 'Airport', 'Yes', 'Good', 200, 'luxury'),
(11, 'Corsa', 'Opel', 'yellow', '7623HJK', 5, 5, 'Gasoline', 'Airport', 'Yes', 'Good', 80, 'economy'),
(12, 'Panda', 'Fiat', 'white', '9934TRM', 5, 5, 'Gasoline', 'Airport', 'Yes', 'Good', 80, 'economy');

-- --------------------------------------------------------

--
-- Stand-in structure for view `cars_days_rented_view`
-- (See below for the actual view)
--
CREATE TABLE `cars_days_rented_view` (
`car_id` int(11)
,`car_name` varchar(201)
,`plate` varchar(100)
,`car_class` enum('economy','business','luxury','superlux')
,`price_per_day` int(11)
,`total_days` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cars_total_income_view`
-- (See below for the actual view)
--
CREATE TABLE `cars_total_income_view` (
`car_id` int(11)
,`car_name` varchar(201)
,`plate` varchar(100)
,`car_class` enum('economy','business','luxury','superlux')
,`price_per_day` int(11)
,`total_income` decimal(32,0)
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
  `driver_license` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `forename`, `surname`, `nif`, `driver_license`, `address`, `email`, `phone`) VALUES
(1, 'Jon', 'Eidson', '21212458F', '35271113', 'Paseo Moreras 15', 'jon@gmail.com', '+34 613121415'),
(2, 'John', 'Smith', '31321131G', '41342211', 'Carrer Forn 12', 'john@gmail.com', '+34 611215162'),
(3, 'Alex', 'Caruso', '42365432D', '84563274', 'Address 1', 'acaruso@gmail.com', '+34 658744496'),
(4, 'Isaiah', 'Hartenstein', '84475662G', '99651147', 'Address 2', 'ihart@gmail.com', '+34 632147856'),
(5, 'Chet', 'Holmgren', '87432243T', '33417776', 'Address 3', 'chet@gmail.com', '+34 687221158'),
(6, 'Aaron', 'Wiggins', '41515648B', '44117655', 'Tulsa St, 5', 'awiggs@gmail.com', '+34 611859754'),
(7, 'Isaiah', 'Joe', '51248869X', '31119655', 'Brick Town, 17', 'izai@gmail.com', '+34 655200788'),
(8, 'Shai', 'Gilgeous-Alexander', '55217748S', '51189005', 'Aura Street, 2', 'sga@gmail.com', '+34 699578410'),
(9, 'Luguentz', 'Dort', '55289677L', '31145789', 'Lockdown Avenue, 4', 'lubeast@gmail.com', '+34 611098862'),
(10, 'Jalen', 'Williams', '41213377W', '93311578', 'New Address, 34', 'jdub@gmail.com', '+34 601227399');

-- --------------------------------------------------------

--
-- Stand-in structure for view `quarter_total_income_view`
-- (See below for the actual view)
--
CREATE TABLE `quarter_total_income_view` (
`year` int(4)
,`quarter` int(1)
,`total_income` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `date_in` date NOT NULL,
  `date_out` date NOT NULL,
  `price_per_day` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`reservation_id`, `customer_id`, `car_id`, `date_in`, `date_out`, `price_per_day`) VALUES
(1, 1, 1, '2024-10-01', '2024-10-07', 80),
(2, 1, 1, '2024-11-05', '2024-11-15', 80),
(3, 1, 1, '2024-12-23', '2024-12-28', 100),
(4, 2, 2, '2024-11-01', '2024-11-10', 75),
(5, 3, 4, '2024-10-07', '2024-10-14', 85),
(6, 4, 2, '2024-10-12', '2024-10-15', 75),
(7, 2, 4, '2024-12-21', '2024-12-26', 105),
(8, 3, 1, '2024-12-30', '2025-01-07', 100),
(9, 4, 5, '2025-01-08', '2025-01-15', 80),
(10, 1, 6, '2025-04-03', '2025-04-16', 85),
(11, 8, 7, '2026-10-21', '2026-10-29', 90),
(12, 10, 8, '2024-10-17', '2024-10-24', 90),
(13, 6, 10, '2024-11-01', '2024-11-12', 100),
(14, 5, 9, '2024-11-15', '2024-11-17', 110),
(15, 7, 3, '2024-12-21', '2025-02-20', 90),
(16, 9, 10, '2025-03-01', '2025-03-09', 100),
(17, 3, 11, '1990-01-01', '2999-12-31', 75),
(18, 2, 12, '2024-12-02', '2024-12-07', 80),
(19, 8, 2, '2024-04-14', '2024-04-17', 80),
(20, 10, 2, '2024-07-13', '2024-07-18', 80),
(21, 9, 12, '2024-09-27', '2024-10-04', 80),
(22, 3, 4, '2024-09-05', '2024-09-08', 100),
(23, 5, 5, '2024-05-27', '2024-05-29', 80),
(24, 3, 9, '2024-09-18', '2024-09-22', 100),
(25, 6, 2, '2024-10-02', '2024-10-08', 80),
(26, 6, 3, '2024-05-02', '2024-05-09', 80),
(27, 4, 8, '2024-11-10', '2024-11-14', 100),
(28, 2, 6, '2024-06-24', '2024-07-01', 100),
(29, 1, 8, '2024-08-07', '2024-08-14', 100),
(30, 10, 8, '2024-12-21', '2024-12-23', 100),
(31, 8, 4, '2024-10-20', '2024-10-22', 100),
(32, 10, 4, '2024-04-24', '2024-04-28', 100),
(33, 10, 3, '2025-02-26', '2025-03-01', 80),
(34, 1, 6, '2024-06-17', '2024-06-23', 100),
(35, 9, 7, '2024-06-08', '2024-06-13', 400),
(36, 1, 8, '2024-03-15', '2024-03-20', 100),
(37, 2, 7, '2024-03-23', '2024-03-27', 400),
(38, 2, 6, '2024-07-29', '2024-07-30', 100),
(39, 1, 12, '2024-04-26', '2024-04-27', 80),
(40, 2, 3, '2024-05-19', '2024-05-26', 80),
(41, 3, 6, '2024-05-12', '2024-05-18', 100),
(42, 7, 9, '2025-03-05', '2025-03-09', 100),
(43, 3, 6, '2024-12-05', '2024-12-07', 100),
(44, 2, 10, '2024-07-14', '2024-07-17', 200),
(45, 2, 10, '2024-05-23', '2024-05-26', 200),
(46, 7, 10, '2024-11-13', '2024-11-17', 200),
(47, 10, 8, '2024-05-22', '2024-05-23', 100),
(48, 6, 10, '2024-12-14', '2024-12-19', 200),
(49, 9, 3, '2024-10-29', '2024-11-03', 80),
(50, 8, 3, '2024-09-07', '2024-09-14', 80),
(51, 8, 1, '2024-05-12', '2024-05-16', 80),
(52, 6, 2, '2024-04-09', '2024-04-10', 80),
(53, 2, 1, '2024-04-25', '2024-04-28', 80),
(54, 5, 5, '2025-02-27', '2025-03-06', 80),
(55, 2, 2, '2024-06-01', '2024-06-05', 80),
(56, 1, 12, '2024-03-17', '2024-03-21', 80),
(57, 4, 6, '2024-02-29', '2024-03-06', 100),
(58, 9, 9, '2024-04-26', '2024-05-01', 100),
(59, 6, 3, '2024-07-08', '2024-07-13', 80),
(60, 2, 1, '2025-01-19', '2025-01-25', 80),
(61, 3, 6, '2025-03-08', '2025-03-12', 100),
(62, 8, 8, '2025-11-20', '2025-11-24', 100),
(63, 1, 12, '2025-12-08', '2025-12-14', 80),
(64, 6, 1, '2025-02-06', '2025-02-09', 80),
(65, 7, 3, '2025-04-21', '2025-04-22', 80),
(66, 8, 1, '2025-02-11', '2025-02-12', 80),
(67, 9, 5, '2025-09-02', '2025-09-09', 80),
(68, 1, 2, '2025-11-17', '2025-11-18', 80),
(69, 10, 6, '2025-12-15', '2025-12-17', 100),
(70, 5, 8, '2025-06-19', '2025-06-26', 100),
(71, 3, 5, '2025-11-05', '2025-11-09', 80),
(72, 8, 3, '2025-02-24', '2025-02-25', 80),
(73, 5, 2, '2025-03-09', '2025-03-10', 80),
(74, 7, 7, '2025-07-02', '2025-07-03', 400),
(75, 9, 7, '2025-08-05', '2025-08-08', 400),
(76, 7, 7, '2025-02-10', '2025-02-11', 400),
(77, 5, 8, '2025-11-13', '2025-11-14', 100),
(78, 4, 12, '2025-09-20', '2025-09-27', 80),
(79, 8, 2, '2024-12-20', '2024-12-26', 80),
(80, 7, 9, '2025-08-13', '2025-08-14', 100),
(81, 7, 6, '2025-06-21', '2025-06-26', 100),
(82, 4, 2, '2025-02-20', '2025-02-22', 80),
(83, 4, 6, '2025-01-11', '2025-01-16', 100),
(84, 1, 1, '2025-06-25', '2025-06-26', 80),
(85, 4, 2, '2025-12-13', '2025-12-16', 80),
(86, 3, 7, '2025-09-27', '2025-10-02', 400),
(87, 6, 7, '2025-03-25', '2025-03-26', 400),
(88, 10, 8, '2025-02-01', '2025-02-06', 100),
(89, 7, 6, '2025-06-14', '2025-06-20', 100),
(90, 2, 2, '2024-11-27', '2024-11-28', 80),
(91, 10, 3, '2024-12-08', '2024-12-15', 80),
(92, 4, 9, '2025-07-23', '2025-07-26', 100),
(93, 4, 3, '2025-06-07', '2025-06-10', 80),
(94, 7, 5, '2025-02-22', '2025-02-24', 80),
(95, 5, 12, '2025-01-14', '2025-01-15', 80),
(96, 1, 4, '2025-12-28', '2026-01-02', 100),
(97, 8, 2, '2025-10-05', '2025-10-11', 80),
(98, 1, 3, '2025-03-20', '2025-03-25', 80),
(99, 4, 6, '2025-03-18', '2025-03-23', 100),
(100, 2, 1, '2025-07-10', '2025-07-14', 80),
(101, 3, 9, '2025-02-06', '2025-02-07', 100),
(102, 10, 10, '2024-12-27', '2024-12-29', 200),
(103, 5, 4, '2025-09-09', '2025-09-10', 100),
(104, 9, 7, '2025-08-09', '2025-08-14', 400),
(105, 4, 10, '2025-12-25', '2026-01-01', 200),
(106, 8, 8, '2025-07-23', '2025-07-26', 100),
(107, 7, 3, '2025-08-05', '2025-08-08', 80),
(108, 8, 10, '2025-12-09', '2025-12-15', 200),
(109, 2, 12, '2025-05-16', '2025-05-20', 80),
(110, 8, 2, '2025-11-25', '2025-12-01', 80),
(111, 3, 3, '2025-11-03', '2025-11-08', 80),
(112, 2, 8, '2025-10-10', '2025-10-14', 100),
(113, 5, 6, '2025-10-04', '2025-10-06', 100),
(114, 7, 6, '2025-08-24', '2025-08-28', 100),
(115, 7, 5, '2025-06-22', '2025-06-27', 80),
(116, 10, 2, '2025-06-15', '2025-06-20', 80),
(117, 8, 6, '2025-07-02', '2025-07-04', 100),
(118, 4, 4, '2025-10-17', '2025-10-24', 100),
(119, 7, 8, '2024-12-05', '2024-12-07', 100),
(120, 3, 4, '2025-03-15', '2025-03-17', 100),
(121, 3, 5, '2025-11-16', '2025-11-22', 80),
(122, 6, 4, '2025-02-20', '2025-02-22', 100),
(123, 3, 6, '2024-11-30', '2024-12-01', 100),
(124, 2, 3, '2025-12-29', '2026-01-01', 80),
(125, 1, 3, '2025-07-01', '2025-07-04', 80),
(126, 2, 2, '2025-04-05', '2025-04-12', 80),
(127, 6, 6, '2025-07-19', '2025-07-24', 100),
(128, 7, 12, '2025-07-09', '2025-07-14', 80),
(129, 9, 1, '2025-08-12', '2025-08-15', 80),
(130, 2, 8, '2025-01-24', '2025-01-26', 100),
(131, 10, 9, '2025-08-09', '2025-08-10', 100),
(132, 3, 9, '2025-01-23', '2025-01-30', 100),
(133, 2, 3, '2025-07-24', '2025-07-28', 80),
(134, 2, 5, '2025-10-31', '2025-11-02', 80),
(135, 7, 1, '2025-01-10', '2025-01-13', 80),
(136, 7, 1, '2025-10-19', '2025-10-22', 80),
(137, 7, 1, '2025-09-15', '2025-09-17', 80),
(138, 5, 2, '2025-07-19', '2025-07-22', 80),
(139, 2, 7, '2024-12-03', '2024-12-09', 400),
(140, 8, 12, '2025-07-19', '2025-07-24', 80),
(141, 10, 3, '2025-11-21', '2025-11-27', 80),
(142, 4, 6, '2025-08-31', '2025-09-02', 100),
(143, 10, 6, '2025-08-01', '2025-08-08', 100),
(144, 3, 7, '2024-12-30', '2025-01-05', 400),
(145, 7, 8, '2025-04-22', '2025-04-25', 100),
(146, 3, 4, '2024-11-30', '2024-12-01', 100),
(147, 10, 6, '2025-06-28', '2025-06-29', 100),
(148, 1, 3, '2025-08-31', '2025-09-03', 80),
(149, 4, 9, '2025-08-21', '2025-08-23', 100),
(150, 9, 12, '2025-08-07', '2025-08-14', 80);

-- --------------------------------------------------------

--
-- Stand-in structure for view `reservations_per_customer_view`
-- (See below for the actual view)
--
CREATE TABLE `reservations_per_customer_view` (
`customer_id` int(11)
,`customer_name` varchar(201)
,`total_reservations` bigint(21)
,`total_income` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `reservations_view`
-- (See below for the actual view)
--
CREATE TABLE `reservations_view` (
`reservation_id` int(11)
,`customer_id` int(11)
,`car_id` int(11)
,`date_in` date
,`date_out` date
,`price_per_day` int(11)
,`total_days` int(8)
,`total_price` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `reservations_view_specialoffers`
-- (See below for the actual view)
--
CREATE TABLE `reservations_view_specialoffers` (
`car_id` int(11)
,`free_date_in` date
,`free_date_out` date
,`price_per_day` int(11)
,`days_until_free_date_in` int(7)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `year_total_income_view`
-- (See below for the actual view)
--
CREATE TABLE `year_total_income_view` (
`year` int(4)
,`total_income` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Structure for view `cars_days_rented_view`
--
DROP TABLE IF EXISTS `cars_days_rented_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cars_days_rented_view`  AS SELECT `c`.`car_id` AS `car_id`, concat(`c`.`brand`,' ',`c`.`model`) AS `car_name`, `c`.`plate` AS `plate`, `c`.`car_class` AS `car_class`, `c`.`price_per_day` AS `price_per_day`, sum(`r`.`total_days`) AS `total_days` FROM (`cars` `c` join `reservations_view` `r` on(`c`.`car_id` = `r`.`car_id`)) GROUP BY `c`.`car_id` ORDER BY sum(`r`.`total_days`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `cars_total_income_view`
--
DROP TABLE IF EXISTS `cars_total_income_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cars_total_income_view`  AS SELECT `c`.`car_id` AS `car_id`, concat(`c`.`brand`,' ',`c`.`model`) AS `car_name`, `c`.`plate` AS `plate`, `c`.`car_class` AS `car_class`, `c`.`price_per_day` AS `price_per_day`, sum(`r`.`total_price`) AS `total_income` FROM (`cars` `c` join `reservations_view` `r` on(`c`.`car_id` = `r`.`car_id`)) GROUP BY `c`.`car_id` ORDER BY sum(`r`.`total_price`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `quarter_total_income_view`
--
DROP TABLE IF EXISTS `quarter_total_income_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `quarter_total_income_view`  AS SELECT year(`reservations_view`.`date_in`) AS `year`, quarter(`reservations_view`.`date_in`) AS `quarter`, sum(`reservations_view`.`total_price`) AS `total_income` FROM `reservations_view` GROUP BY year(`reservations_view`.`date_in`), quarter(`reservations_view`.`date_in`) ORDER BY year(`reservations_view`.`date_in`) DESC, quarter(`reservations_view`.`date_in`) ASC ;

-- --------------------------------------------------------

--
-- Structure for view `reservations_per_customer_view`
--
DROP TABLE IF EXISTS `reservations_per_customer_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reservations_per_customer_view`  AS SELECT `c`.`customer_id` AS `customer_id`, concat(`c`.`forename`,' ',ucase(`c`.`surname`)) AS `customer_name`, count(`r`.`reservation_id`) AS `total_reservations`, sum(`r`.`total_price`) AS `total_income` FROM (`customers` `c` join `reservations_view` `r` on(`c`.`customer_id` = `r`.`customer_id`)) GROUP BY `c`.`customer_id` ORDER BY count(`r`.`reservation_id`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `reservations_view`
--
DROP TABLE IF EXISTS `reservations_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reservations_view`  AS SELECT `reservations`.`reservation_id` AS `reservation_id`, `reservations`.`customer_id` AS `customer_id`, `reservations`.`car_id` AS `car_id`, `reservations`.`date_in` AS `date_in`, `reservations`.`date_out` AS `date_out`, `reservations`.`price_per_day` AS `price_per_day`, to_days(`reservations`.`date_out`) - to_days(`reservations`.`date_in`) + 1 AS `total_days`, `total_price`(`reservations`.`date_out`,`reservations`.`date_in`,`reservations`.`price_per_day`) AS `total_price` FROM `reservations` ;

-- --------------------------------------------------------

--
-- Structure for view `reservations_view_specialoffers`
--
DROP TABLE IF EXISTS `reservations_view_specialoffers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reservations_view_specialoffers`  AS SELECT `r`.`car_id` AS `car_id`, `r`.`date_out` AS `free_date_in`, (select `re`.`date_in` from `reservations` `re` where `re`.`car_id` = `r`.`car_id` and `re`.`date_in` > `r`.`date_out` order by `re`.`date_in` limit 1) AS `free_date_out`, (select `c`.`price_per_day` from `cars` `c` where `c`.`car_id` = `r`.`car_id`) AS `price_per_day`, (select to_days(`free_date_in`) - to_days(curdate()) from `reservations` where to_days(`free_date_in`) - to_days(curdate()) > 0 limit 1) AS `days_until_free_date_in` FROM `reservations` AS `r` WHERE `r`.`date_out` > curdate() ORDER BY `r`.`car_id` ASC, `r`.`date_out` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `year_total_income_view`
--
DROP TABLE IF EXISTS `year_total_income_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `year_total_income_view`  AS SELECT year(`reservations_view`.`date_in`) AS `year`, sum(`reservations_view`.`total_price`) AS `total_income` FROM `reservations_view` GROUP BY year(`reservations_view`.`date_in`) ORDER BY year(`reservations_view`.`date_in`) DESC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fkey_cars_car_id` (`car_id`),
  ADD KEY `fkey_costumers_customer_id` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `fkey_cars_car_id` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`),
  ADD CONSTRAINT `fkey_costumers_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `rentacarEvent` ON SCHEDULE EVERY 5 MINUTE STARTS '2025-03-18 18:14:16' ENDS '2025-04-04 18:14:16' ON COMPLETION PRESERVE ENABLE DO CALL addReservation()$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
