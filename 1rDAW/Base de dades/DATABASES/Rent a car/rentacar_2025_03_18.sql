-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2025 at 06:39 PM
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
	SET var_date_in = SUBDATE(CURRENT_DATE, INTERVAL (FLOOR(1+RAND()*400)) DAY);
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
	INSERT INTO reservations (customer_id, car_id, date_in, date_out, price_per_day)
	VALUES (var_customer_id, var_car_id, var_date_in, var_date_out, var_price_per_day);
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
(20, 10, 2, '2024-07-13', '2024-07-18', 80);

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
-- Structure for view `reservations_view`
--
DROP TABLE IF EXISTS `reservations_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reservations_view`  AS SELECT `reservations`.`reservation_id` AS `reservation_id`, `reservations`.`customer_id` AS `customer_id`, `reservations`.`car_id` AS `car_id`, `reservations`.`date_in` AS `date_in`, `reservations`.`date_out` AS `date_out`, `reservations`.`price_per_day` AS `price_per_day`, to_days(`reservations`.`date_out`) - to_days(`reservations`.`date_in`) + 1 AS `total_days`, `total_price`(`reservations`.`date_out`,`reservations`.`date_in`,`reservations`.`price_per_day`) AS `total_price` FROM `reservations` ;

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
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
CREATE DEFINER=`root`@`localhost` EVENT `rentacarEvent` ON SCHEDULE EVERY 15 MINUTE STARTS '2025-03-18 18:14:16' ENDS '2025-04-04 18:14:16' ON COMPLETION PRESERVE ENABLE DO CALL addReservation()$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
