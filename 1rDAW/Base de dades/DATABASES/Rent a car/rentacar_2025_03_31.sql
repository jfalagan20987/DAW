-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2025 at 03:34 PM
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
CREATE DEFINER=`root`@`localhost` FUNCTION `specialDiscount` (`var_days_until_free_date` INT) RETURNS INT(11) DETERMINISTIC BEGIN
	-- Variables
	DECLARE var_discount INT;
	
	-- else if
	IF var_days_until_free_date <= 2 AND var_days_until_free_date > 0 THEN
		SET var_discount = 40;
	ELSEIF var_days_until_free_date <= 5 AND var_days_until_free_date > 2 THEN 
		SET var_discount = 30;
	ELSEIF var_days_until_free_date <= 10 AND var_days_until_free_date > 5 THEN
		SET var_discount = 20;
	ELSE SET var_discount = 10;
	END IF;
	RETURN (var_discount);
END$$

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
(150, 9, 12, '2025-08-07', '2025-08-14', 80),
(151, 4, 4, '2025-11-25', '2025-12-01', 100),
(152, 4, 9, '2025-03-31', '2025-04-05', 100),
(153, 3, 1, '2024-12-11', '2024-12-17', 80),
(154, 5, 6, '2024-12-25', '2024-12-30', 100),
(155, 6, 9, '2025-07-01', '2025-07-06', 100),
(156, 3, 7, '2025-10-08', '2025-10-09', 400),
(157, 7, 2, '2025-07-24', '2025-07-25', 80),
(158, 10, 2, '2025-02-09', '2025-02-12', 80),
(159, 5, 1, '2025-05-20', '2025-05-23', 80),
(160, 3, 3, '2024-12-06', '2024-12-07', 80),
(161, 6, 9, '2025-05-09', '2025-05-11', 100),
(162, 3, 10, '2025-03-14', '2025-03-18', 200),
(163, 7, 2, '2025-05-10', '2025-05-17', 80),
(164, 9, 4, '2025-07-02', '2025-07-08', 100),
(165, 7, 5, '2025-10-06', '2025-10-09', 80),
(166, 6, 5, '2025-07-18', '2025-07-25', 80),
(167, 8, 9, '2025-11-06', '2025-11-10', 100),
(168, 8, 2, '2025-12-25', '2026-01-01', 80),
(169, 8, 5, '2025-08-15', '2025-08-16', 80),
(170, 6, 2, '2025-07-30', '2025-08-03', 80),
(171, 8, 10, '2025-05-07', '2025-05-09', 200),
(172, 6, 4, '2025-06-04', '2025-06-06', 100),
(173, 7, 3, '2025-05-26', '2025-06-02', 80),
(174, 9, 8, '2025-01-19', '2025-01-22', 100),
(175, 7, 12, '2025-07-28', '2025-08-02', 80),
(176, 2, 8, '2025-12-07', '2025-12-12', 100),
(177, 10, 1, '2025-01-31', '2025-02-04', 80),
(178, 10, 10, '2025-03-25', '2025-03-27', 200),
(179, 3, 1, '2025-03-22', '2025-03-24', 80),
(180, 7, 5, '2024-12-20', '2024-12-27', 80),
(181, 5, 10, '2025-09-29', '2025-10-02', 200),
(182, 4, 4, '2025-12-11', '2025-12-12', 100),
(183, 9, 2, '2025-01-31', '2025-02-06', 80),
(184, 4, 10, '2025-11-18', '2025-11-23', 200),
(185, 2, 4, '2025-03-08', '2025-03-14', 100),
(186, 1, 2, '2025-11-21', '2025-11-22', 80),
(187, 10, 4, '2024-12-06', '2024-12-12', 100),
(188, 2, 7, '2025-09-11', '2025-09-16', 400),
(189, 4, 6, '2025-10-26', '2025-10-29', 100),
(190, 4, 2, '2025-03-24', '2025-03-31', 80),
(191, 8, 5, '2025-03-16', '2025-03-18', 80),
(192, 1, 3, '2025-10-03', '2025-10-06', 80),
(193, 2, 5, '2025-01-30', '2025-02-06', 80),
(194, 4, 2, '2025-08-27', '2025-08-31', 80),
(195, 7, 4, '2025-10-03', '2025-10-06', 100),
(196, 10, 12, '2025-05-26', '2025-06-01', 80),
(197, 7, 9, '2025-02-26', '2025-03-02', 100),
(198, 5, 5, '2025-03-23', '2025-03-28', 80),
(199, 6, 3, '2025-04-11', '2025-04-15', 80),
(200, 9, 6, '2025-01-01', '2025-01-02', 100),
(201, 1, 12, '2025-07-05', '2025-07-06', 80),
(202, 7, 12, '2025-01-22', '2025-01-26', 80),
(203, 7, 5, '2025-08-08', '2025-08-12', 80),
(204, 8, 7, '2024-12-26', '2024-12-29', 400),
(205, 2, 12, '2025-08-17', '2025-08-24', 80),
(206, 5, 8, '2025-12-23', '2025-12-29', 100),
(207, 8, 10, '2024-11-29', '2024-12-06', 200),
(208, 9, 5, '2025-05-22', '2025-05-26', 80),
(209, 1, 5, '2025-12-03', '2025-12-07', 80),
(210, 7, 12, '2025-05-08', '2025-05-15', 80),
(211, 9, 10, '2025-02-13', '2025-02-16', 200),
(212, 8, 4, '2025-03-19', '2025-03-26', 100),
(213, 10, 12, '2025-11-13', '2025-11-17', 80),
(214, 5, 5, '2024-12-10', '2024-12-11', 80),
(215, 2, 10, '2025-10-11', '2025-10-13', 200),
(216, 6, 1, '2025-07-06', '2025-07-07', 80),
(217, 3, 7, '2025-07-25', '2025-07-30', 400),
(218, 4, 4, '2025-08-10', '2025-08-15', 100),
(219, 10, 12, '2025-09-01', '2025-09-05', 80),
(220, 4, 4, '2025-02-12', '2025-02-17', 100),
(221, 6, 1, '2025-12-27', '2026-01-02', 80),
(222, 7, 10, '2025-09-09', '2025-09-14', 200),
(223, 3, 7, '2025-12-23', '2025-12-27', 400),
(224, 2, 1, '2025-04-20', '2025-04-23', 80),
(225, 9, 5, '2025-02-14', '2025-02-20', 80),
(226, 7, 10, '2025-02-20', '2025-02-24', 200),
(227, 2, 12, '2025-10-02', '2025-10-09', 80),
(228, 1, 12, '2025-06-22', '2025-06-28', 80),
(229, 2, 3, '2025-07-12', '2025-07-18', 80),
(230, 10, 8, '2025-07-17', '2025-07-21', 100),
(231, 2, 4, '2025-06-14', '2025-06-20', 100),
(232, 6, 8, '2024-12-16', '2024-12-20', 100),
(233, 9, 7, '2024-12-14', '2024-12-20', 400),
(234, 6, 10, '2025-04-25', '2025-04-26', 200),
(235, 7, 2, '2024-12-07', '2024-12-08', 80),
(236, 9, 4, '2025-07-17', '2025-07-24', 100),
(237, 1, 10, '2024-12-31', '2025-01-04', 200),
(238, 2, 2, '2025-05-21', '2025-05-24', 80),
(239, 9, 6, '2024-12-21', '2024-12-23', 100),
(240, 5, 12, '2025-03-18', '2025-03-24', 80),
(241, 5, 3, '2025-06-17', '2025-06-18', 80),
(242, 9, 9, '2024-11-26', '2024-12-01', 100),
(243, 4, 6, '2025-09-29', '2025-10-01', 100),
(244, 8, 7, '2025-06-16', '2025-06-17', 400),
(245, 7, 8, '2025-04-19', '2025-04-21', 100),
(246, 3, 12, '2025-04-12', '2025-04-19', 80),
(247, 3, 5, '2024-12-12', '2024-12-16', 80),
(248, 3, 5, '2025-06-02', '2025-06-05', 80),
(249, 10, 4, '2025-06-25', '2025-06-29', 100),
(250, 9, 9, '2025-02-11', '2025-02-17', 100),
(251, 7, 5, '2025-08-03', '2025-08-07', 80),
(252, 6, 9, '2025-09-28', '2025-10-05', 100),
(253, 10, 8, '2025-03-05', '2025-03-12', 100),
(254, 6, 2, '2025-02-28', '2025-03-03', 80),
(255, 4, 1, '2025-07-23', '2025-07-30', 80),
(256, 5, 9, '2025-10-10', '2025-10-16', 100),
(257, 10, 6, '2025-09-13', '2025-09-19', 100),
(258, 2, 2, '2025-07-04', '2025-07-09', 80),
(259, 10, 10, '2025-11-05', '2025-11-07', 200),
(260, 7, 7, '2025-11-12', '2025-11-19', 400),
(261, 3, 12, '2025-09-12', '2025-09-18', 80),
(262, 4, 8, '2025-03-21', '2025-03-23', 100),
(263, 3, 3, '2025-07-06', '2025-07-09', 80),
(264, 8, 8, '2025-02-20', '2025-02-26', 100),
(265, 7, 1, '2025-09-02', '2025-09-07', 80),
(266, 5, 8, '2025-01-27', '2025-01-28', 100),
(267, 1, 5, '2025-04-24', '2025-04-29', 80),
(268, 5, 10, '2025-04-08', '2025-04-14', 200),
(269, 1, 7, '2025-10-18', '2025-10-23', 400),
(270, 8, 5, '2025-04-22', '2025-04-23', 80),
(271, 1, 10, '2025-08-30', '2025-09-01', 200),
(272, 9, 10, '2025-08-13', '2025-08-18', 200),
(273, 5, 9, '2025-06-01', '2025-06-05', 100),
(274, 1, 3, '2025-08-26', '2025-08-27', 80),
(275, 1, 7, '2025-03-27', '2025-04-01', 400),
(276, 5, 1, '2025-09-28', '2025-10-05', 80),
(277, 10, 6, '2025-02-20', '2025-02-24', 100),
(278, 9, 9, '2024-12-24', '2024-12-29', 100),
(279, 1, 3, '2024-11-27', '2024-11-30', 80),
(280, 2, 8, '2024-12-30', '2025-01-02', 100),
(281, 1, 2, '2025-05-28', '2025-06-03', 80),
(282, 7, 1, '2025-12-09', '2025-12-11', 80),
(283, 5, 10, '2025-07-09', '2025-07-11', 200),
(284, 5, 7, '2025-02-22', '2025-02-28', 400),
(285, 6, 2, '2025-09-05', '2025-09-10', 80),
(286, 6, 3, '2025-08-10', '2025-08-14', 80),
(287, 8, 2, '2025-03-19', '2025-03-21', 80),
(288, 10, 1, '2025-10-06', '2025-10-11', 80),
(289, 3, 2, '2025-04-25', '2025-04-26', 80),
(290, 9, 5, '2025-06-17', '2025-06-18', 80),
(291, 9, 7, '2025-04-15', '2025-04-19', 400),
(292, 10, 3, '2025-06-20', '2025-06-27', 80),
(293, 8, 3, '2025-10-23', '2025-10-26', 80),
(294, 7, 6, '2025-11-16', '2025-11-23', 100),
(295, 9, 2, '2025-01-12', '2025-01-19', 80),
(296, 1, 7, '2025-06-21', '2025-06-26', 400),
(297, 4, 6, '2025-10-19', '2025-10-22', 100),
(298, 10, 3, '2025-12-09', '2025-12-12', 80),
(299, 1, 8, '2025-08-26', '2025-09-02', 100),
(300, 9, 9, '2025-12-25', '2025-12-27', 100),
(301, 4, 9, '2025-03-22', '2025-03-25', 100),
(302, 7, 7, '2025-11-25', '2025-12-01', 400),
(303, 10, 4, '2025-01-02', '2025-01-09', 100),
(304, 2, 2, '2025-01-22', '2025-01-23', 80),
(305, 8, 8, '2025-10-28', '2025-11-02', 100),
(306, 6, 9, '2025-02-08', '2025-02-09', 100),
(307, 6, 9, '2025-10-18', '2025-10-20', 100),
(308, 9, 2, '2025-12-08', '2025-12-09', 80),
(309, 2, 7, '2025-07-04', '2025-07-07', 400),
(310, 1, 12, '2025-07-02', '2025-07-03', 80),
(311, 6, 1, '2025-06-07', '2025-06-13', 80),
(312, 4, 6, '2025-05-20', '2025-05-26', 100),
(313, 1, 10, '2025-06-26', '2025-07-03', 200),
(314, 4, 3, '2025-04-02', '2025-04-06', 80),
(315, 6, 5, '2025-07-05', '2025-07-06', 80),
(316, 7, 4, '2025-02-25', '2025-03-04', 100),
(317, 1, 1, '2025-11-14', '2025-11-21', 80),
(318, 5, 10, '2025-01-24', '2025-01-25', 200),
(319, 6, 9, '2025-06-15', '2025-06-21', 100),
(320, 2, 12, '2025-06-03', '2025-06-04', 80),
(321, 8, 7, '2025-03-15', '2025-03-21', 400),
(322, 3, 1, '2025-04-14', '2025-04-19', 80),
(323, 10, 7, '2025-04-09', '2025-04-13', 400),
(324, 2, 6, '2024-12-14', '2024-12-19', 100),
(325, 3, 4, '2025-09-27', '2025-10-02', 100),
(326, 6, 1, '2024-12-03', '2024-12-08', 80),
(327, 1, 4, '2025-11-05', '2025-11-09', 100),
(328, 8, 12, '2025-01-19', '2025-01-20', 80),
(329, 9, 3, '2025-07-20', '2025-07-21', 80),
(330, 6, 3, '2025-06-14', '2025-06-15', 80),
(331, 10, 4, '2025-01-22', '2025-01-23', 100),
(332, 7, 10, '2025-06-18', '2025-06-24', 200),
(333, 6, 8, '2025-09-16', '2025-09-20', 100),
(334, 3, 7, '2025-02-16', '2025-02-20', 400),
(335, 3, 2, '2025-11-05', '2025-11-09', 80),
(336, 2, 4, '2025-08-17', '2025-08-22', 100),
(337, 5, 9, '2024-12-09', '2024-12-13', 100),
(338, 6, 4, '2025-11-10', '2025-11-17', 100),
(339, 10, 2, '2025-08-13', '2025-08-18', 80),
(340, 3, 5, '2024-11-28', '2024-12-05', 80),
(341, 10, 7, '2025-05-26', '2025-06-02', 400),
(342, 7, 1, '2025-08-04', '2025-08-10', 80),
(343, 6, 7, '2025-01-30', '2025-02-01', 400),
(344, 8, 4, '2025-03-27', '2025-03-30', 100),
(345, 9, 5, '2025-05-08', '2025-05-13', 80),
(346, 9, 1, '2025-06-15', '2025-06-21', 80),
(347, 8, 3, '2025-08-22', '2025-08-25', 80),
(348, 9, 10, '2025-08-06', '2025-08-12', 200),
(349, 3, 12, '2025-04-09', '2025-04-11', 80),
(350, 7, 9, '2025-05-21', '2025-05-22', 100),
(351, 6, 1, '2025-03-29', '2025-04-04', 80),
(352, 3, 5, '2025-07-02', '2025-07-03', 80),
(353, 5, 4, '2025-12-13', '2025-12-16', 100),
(354, 8, 2, '2025-09-15', '2025-09-16', 80),
(355, 9, 9, '2025-12-18', '2025-12-24', 100),
(356, 6, 5, '2025-01-19', '2025-01-25', 80),
(357, 9, 1, '2025-03-13', '2025-03-19', 80),
(358, 9, 5, '2025-05-14', '2025-05-17', 80),
(359, 9, 8, '2025-08-07', '2025-08-14', 100),
(360, 10, 12, '2025-11-22', '2025-11-28', 80),
(361, 8, 6, '2025-01-23', '2025-01-27', 100),
(362, 7, 8, '2025-05-06', '2025-05-13', 100),
(363, 4, 7, '2025-08-15', '2025-08-21', 400),
(364, 5, 10, '2025-11-09', '2025-11-16', 200),
(365, 3, 10, '2025-09-25', '2025-09-28', 200),
(366, 8, 1, '2025-08-24', '2025-08-26', 80),
(367, 4, 6, '2025-01-29', '2025-02-02', 100),
(368, 3, 12, '2025-10-12', '2025-10-18', 80),
(369, 8, 9, '2024-12-05', '2024-12-07', 100),
(370, 5, 3, '2025-07-30', '2025-08-01', 80),
(371, 4, 9, '2025-02-03', '2025-02-04', 100),
(372, 8, 8, '2025-09-09', '2025-09-10', 100),
(373, 8, 2, '2024-12-27', '2024-12-30', 80),
(374, 5, 5, '2025-08-24', '2025-08-30', 80),
(375, 1, 9, '2025-11-24', '2025-11-26', 100),
(376, 9, 8, '2025-04-17', '2025-04-18', 100),
(377, 9, 4, '2025-01-24', '2025-01-31', 100),
(378, 6, 6, '2025-11-07', '2025-11-12', 100),
(379, 8, 7, '2025-07-14', '2025-07-18', 400),
(380, 4, 6, '2025-07-07', '2025-07-13', 100),
(381, 6, 9, '2025-11-13', '2025-11-20', 100),
(382, 8, 7, '2025-08-29', '2025-09-03', 400),
(383, 4, 8, '2025-11-16', '2025-11-19', 100),
(384, 4, 7, '2025-12-28', '2025-12-30', 400),
(385, 4, 7, '2025-12-14', '2025-12-15', 400),
(386, 8, 10, '2025-01-07', '2025-01-14', 200),
(387, 10, 10, '2025-08-25', '2025-08-27', 200);

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
-- Stand-in structure for view `specialoffers_view`
-- (See below for the actual view)
--
CREATE TABLE `specialoffers_view` (
`car_id` int(11)
,`free_date_in` date
,`free_date_out` date
,`price_per_day` int(11)
,`days_until_free_date_in` int(7)
,`discount` int(11)
,`special_offer_price` decimal(22,0)
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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reservations_view_specialoffers`  AS SELECT `r`.`car_id` AS `car_id`, `r`.`date_out`+ interval 1 day AS `free_date_in`, (select `re`.`date_in` - interval 1 day from `reservations` `re` where `re`.`car_id` = `r`.`car_id` and `re`.`date_in` > `r`.`date_out` order by `re`.`date_in` limit 1) AS `free_date_out`, (select `c`.`price_per_day` from `cars` `c` where `c`.`car_id` = `r`.`car_id`) AS `price_per_day`, (select to_days(`free_date_in`) - to_days(curdate()) from `reservations` where to_days(`free_date_in`) - to_days(curdate()) > 0 limit 1) AS `days_until_free_date_in` FROM `reservations` AS `r` WHERE `r`.`date_out` + interval 1 day > curdate() ORDER BY `r`.`car_id` ASC, `r`.`date_out`+ interval 1 AS `day` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `specialoffers_view`
--
DROP TABLE IF EXISTS `specialoffers_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `specialoffers_view`  AS SELECT `reservations_view_specialoffers`.`car_id` AS `car_id`, `reservations_view_specialoffers`.`free_date_in` AS `free_date_in`, `reservations_view_specialoffers`.`free_date_out` AS `free_date_out`, `reservations_view_specialoffers`.`price_per_day` AS `price_per_day`, `reservations_view_specialoffers`.`days_until_free_date_in` AS `days_until_free_date_in`, `specialDiscount`(`reservations_view_specialoffers`.`days_until_free_date_in`) AS `discount`, floor(`reservations_view_specialoffers`.`price_per_day` - `reservations_view_specialoffers`.`price_per_day` * `specialDiscount`(`reservations_view_specialoffers`.`days_until_free_date_in`) / 100) AS `special_offer_price` FROM `reservations_view_specialoffers` WHERE `reservations_view_specialoffers`.`days_until_free_date_in` <= 15 ;

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
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=388;

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
