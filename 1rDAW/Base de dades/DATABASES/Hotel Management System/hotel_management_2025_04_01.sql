-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2025 at 07:41 PM
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
-- Database: `hotel_management`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `randomReservationInsert` ()   BEGIN
	-- Variables needed
	DECLARE var_customer_id INT;
	DECLARE var_room_number INT;
	DECLARE var_check_in DATE;
	DECLARE var_check_out DATE;
	DECLARE var_price_per_night INT;
	
	-- Get dates
	SET var_check_in = SUBDATE(CURRENT_DATE, INTERVAL (FLOOR(1+RAND()*400)) DAY);
	SET var_check_out = DATE_ADD(var_check_in, INTERVAL (FLOOR(RAND()*7+1)) DAY);
	
	-- Get random customer
	SELECT customer_id INTO var_customer_id
	FROM customers
	ORDER BY RAND()
	LIMIT 1;
	
	-- Get an available room
	SELECT room_number INTO var_room_number
	FROM rooms
	WHERE room_number NOT IN (SELECT room_number
						FROM reservations
						WHERE check_in <= var_check_out
						AND check_out >= var_check_in)
	ORDER BY RAND()
	LIMIT 1;
	
	-- Get room price
	SELECT price INTO var_price_per_night
	FROM room_types
	WHERE type_id = (SELECT room_type
					FROM rooms
					WHERE room_number = var_room_number);
					
	INSERT INTO reservations(customer_id, room_number, check_in, check_out, price_per_night)
	VALUES(var_customer_id, var_room_number, var_check_in, var_check_out, var_price_per_night);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `forename` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `nif` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `forename`, `surname`, `nif`, `address`, `email`, `phone_number`) VALUES
(1, 'Jon', 'Eidson', '21212458F', 'Paseo Moreras 15', 'jon@gmail.com', '+34 613121415'),
(2, 'John', 'Smith', '31321131G', 'Carrer Forn 12', 'john@gmail.com', '+34 611215162'),
(3, 'Alex', 'Caruso', '42365432D', 'Address 1', 'acaruso@gmail.com', '+34 658744496'),
(4, 'Isaiah', 'Hartenstein', '84475662G', 'Address 2', 'ihart@gmail.com', '+34 632147856'),
(5, 'Chet', 'Holmgren', '87432243T', 'Address 3', 'chet@gmail.com', '+34 687221158'),
(6, 'Aaron', 'Wiggins', '41515648B', 'Tulsa St, 5', 'awiggs@gmail.com', '+34 611859754'),
(7, 'Isaiah', 'Joe', '51248869X', 'Brick Town, 17', 'izai@gmail.com', '+34 655200788'),
(8, 'Shai', 'Gilgeous-Alexander', '55217748S', 'Aura Street, 2', 'sga@gmail.com', '+34 699578410'),
(9, 'Luguentz', 'Dort', '55289677L', 'Lockdown Avenue, 4', 'lubeast@gmail.com', '+34 611098862'),
(10, 'Jalen', 'Williams', '41213377W', 'New Address, 34', 'jdub@gmail.com', '+34 601227399'),
(11, 'Kenrich', 'Williams', '41236789H', 'Hustle Street, 34', 'kenny@gmail.com', '+34 678954123'),
(12, 'Cason', 'Wallace', '41512057B', 'Caso Street, 22', 'cwallace@gmail.com', '+34 647895855'),
(13, 'Jaylin', 'Williams', '47202589W', 'Sunrise Avenue, 6', 'jwill@gmail.com', '+34 698001232'),
(14, 'Nikola', 'Topic', '41789456T', 'Talent Avenue, 44', 'topicthunder@gmail.com', '+34 600125587');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `room_number` int(11) DEFAULT NULL,
  `check_in` date DEFAULT NULL,
  `check_out` date DEFAULT NULL,
  `price_per_night` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`reservation_id`, `customer_id`, `room_number`, `check_in`, `check_out`, `price_per_night`) VALUES
(1, 10, 309, '2024-10-17', '2024-10-22', 120),
(2, 5, 207, '2024-08-31', '2024-09-01', 70),
(3, 10, 210, '2025-01-30', '2025-02-05', 120),
(4, 6, 103, '2024-08-20', '2024-08-22', 70),
(5, 2, 402, '2025-02-15', '2025-02-21', 120),
(6, 2, 209, '2024-12-13', '2024-12-15', 90),
(7, 8, 302, '2024-11-03', '2024-11-06', 60),
(8, 4, 308, '2024-05-19', '2024-05-24', 120),
(9, 3, 208, '2025-03-02', '2025-03-07', 90),
(10, 10, 202, '2024-05-23', '2024-05-28', 60),
(11, 5, 402, '2025-03-30', '2025-04-04', 120),
(12, 6, 308, '2024-02-26', '2024-02-29', 120),
(13, 7, 208, '2024-12-04', '2024-12-05', 90),
(14, 1, 401, '2024-05-19', '2024-05-24', 120),
(15, 3, 206, '2024-10-24', '2024-10-28', 70),
(16, 9, 302, '2024-03-29', '2024-04-04', 60),
(17, 10, 307, '2024-06-13', '2024-06-16', 90),
(18, 2, 304, '2025-01-09', '2025-01-11', 90),
(19, 9, 301, '2025-02-01', '2025-02-08', 60),
(20, 1, 109, '2024-10-04', '2024-10-08', 90),
(21, 5, 205, '2025-02-16', '2025-02-22', 60),
(22, 5, 206, '2024-09-03', '2024-09-09', 70),
(23, 5, 309, '2025-02-09', '2025-02-16', 120),
(24, 1, 305, '2024-05-20', '2024-05-25', 90),
(25, 1, 204, '2024-04-29', '2024-05-06', 60),
(26, 1, 301, '2024-06-06', '2024-06-08', 60),
(27, 9, 403, '2024-09-06', '2024-09-07', 120),
(28, 2, 301, '2025-01-20', '2025-01-21', 60),
(29, 9, 106, '2025-01-04', '2025-01-11', 60),
(30, 2, 103, '2024-06-28', '2024-06-29', 70),
(31, 8, 103, '2025-02-09', '2025-02-12', 70),
(32, 10, 206, '2024-04-17', '2024-04-18', 70),
(33, 9, 204, '2024-12-02', '2024-12-05', 60),
(34, 1, 305, '2024-10-15', '2024-10-22', 90),
(35, 8, 302, '2024-05-08', '2024-05-14', 60),
(36, 7, 108, '2025-01-31', '2025-02-05', 90),
(37, 7, 303, '2024-08-01', '2024-08-04', 60),
(38, 7, 204, '2024-04-02', '2024-04-04', 60),
(39, 10, 102, '2024-05-19', '2024-05-24', 60),
(40, 8, 303, '2025-01-29', '2025-02-04', 60),
(41, 7, 202, '2024-06-17', '2024-06-24', 60),
(42, 1, 305, '2024-10-04', '2024-10-08', 90),
(43, 7, 209, '2024-10-23', '2024-10-24', 90),
(44, 10, 207, '2024-03-17', '2024-03-24', 70),
(45, 3, 207, '2025-01-25', '2025-01-31', 70),
(46, 1, 306, '2024-12-03', '2024-12-08', 90),
(47, 5, 107, '2024-11-28', '2024-12-05', 60),
(48, 7, 204, '2024-03-08', '2024-03-15', 60),
(49, 2, 309, '2024-07-18', '2024-07-21', 120),
(50, 3, 205, '2024-05-23', '2024-05-28', 60),
(51, 5, 203, '2025-02-12', '2025-02-18', 70),
(52, 2, 201, '2024-07-24', '2024-07-26', 60),
(53, 10, 202, '2024-06-10', '2024-06-12', 60),
(54, 12, 204, '2024-07-01', '2024-07-05', 60),
(55, 14, 306, '2024-04-28', '2024-04-30', 90),
(56, 10, 203, '2024-12-18', '2024-12-25', 70),
(57, 1, 105, '2024-08-22', '2024-08-28', 70);

-- --------------------------------------------------------

--
-- Stand-in structure for view `reservations_view`
-- (See below for the actual view)
--
CREATE TABLE `reservations_view` (
`reservation_id` int(11)
,`customer_id` int(11)
,`room_number` int(11)
,`check_in` date
,`check_out` date
,`total_nights` int(7)
,`price_per_night` int(11)
,`total_price` bigint(17)
);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_number` int(11) NOT NULL,
  `floor_number` int(11) DEFAULT NULL,
  `room_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_number`, `floor_number`, `room_type`) VALUES
(101, 1, 1),
(102, 1, 2),
(103, 1, 1),
(104, 1, 1),
(105, 1, 1),
(106, 1, 2),
(107, 1, 2),
(108, 1, 3),
(109, 1, 3),
(110, 1, 3),
(201, 2, 2),
(202, 2, 2),
(203, 2, 1),
(204, 2, 2),
(205, 2, 2),
(206, 2, 1),
(207, 2, 1),
(208, 2, 3),
(209, 2, 3),
(210, 2, 4),
(301, 3, 2),
(302, 3, 2),
(303, 3, 2),
(304, 3, 3),
(305, 3, 3),
(306, 3, 3),
(307, 3, 3),
(308, 3, 4),
(309, 3, 4),
(310, 3, 4),
(401, 4, 4),
(402, 4, 4),
(403, 4, 4),
(404, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `room_types`
--

CREATE TABLE `room_types` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_types`
--

INSERT INTO `room_types` (`type_id`, `type_name`, `price`) VALUES
(1, 'standard', 70),
(2, 'single', 60),
(3, 'deluxe', 90),
(4, 'suite', 120);

-- --------------------------------------------------------

--
-- Structure for view `reservations_view`
--
DROP TABLE IF EXISTS `reservations_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reservations_view`  AS SELECT `reservations`.`reservation_id` AS `reservation_id`, `reservations`.`customer_id` AS `customer_id`, `reservations`.`room_number` AS `room_number`, `reservations`.`check_in` AS `check_in`, `reservations`.`check_out` AS `check_out`, to_days(`reservations`.`check_out`) - to_days(`reservations`.`check_in`) AS `total_nights`, `reservations`.`price_per_night` AS `price_per_night`, `reservations`.`price_per_night`* (to_days(`reservations`.`check_out`) - to_days(`reservations`.`check_in`)) AS `total_price` FROM `reservations` ;

--
-- Indexes for dumped tables
--

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
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `room_number` (`room_number`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_number`),
  ADD KEY `room_type` (`room_type`);

--
-- Indexes for table `room_types`
--
ALTER TABLE `room_types`
  ADD PRIMARY KEY (`type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `room_types`
--
ALTER TABLE `room_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`room_number`) REFERENCES `rooms` (`room_number`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`room_type`) REFERENCES `room_types` (`type_id`);

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `reservationsEvent` ON SCHEDULE EVERY 1 MINUTE STARTS '2025-04-01 18:54:17' ENDS '2025-04-03 18:54:17' ON COMPLETION PRESERVE ENABLE DO CALL randomReservationInsert()$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
