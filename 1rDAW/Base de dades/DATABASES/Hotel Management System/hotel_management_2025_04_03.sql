-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2025 at 04:17 PM
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
(57, 1, 105, '2024-08-22', '2024-08-28', 70),
(58, 11, 303, '2025-02-28', '2025-03-04', 60),
(59, 9, 308, '2024-03-20', '2024-03-26', 120),
(60, 9, 206, '2024-12-15', '2024-12-22', 70),
(61, 8, 105, '2024-07-17', '2024-07-20', 70),
(62, 4, 205, '2024-07-04', '2024-07-08', 60),
(63, 7, 309, '2024-08-06', '2024-08-11', 120),
(64, 1, 306, '2025-02-18', '2025-02-19', 90),
(65, 8, 105, '2025-02-09', '2025-02-11', 70),
(66, 5, 108, '2024-06-11', '2024-06-13', 90),
(67, 2, 207, '2024-05-31', '2024-06-05', 70),
(68, 7, 208, '2024-09-13', '2024-09-15', 90),
(69, 6, 101, '2024-05-23', '2024-05-30', 70),
(70, 1, 310, '2024-08-16', '2024-08-20', 120),
(71, 2, 109, '2024-07-13', '2024-07-20', 90),
(72, 12, 209, '2025-03-17', '2025-03-23', 90),
(73, 4, 106, '2024-06-27', '2024-06-28', 60),
(74, 12, 106, '2024-04-30', '2024-05-07', 60),
(75, 8, 207, '2024-04-12', '2024-04-19', 70),
(76, 2, 109, '2025-02-02', '2025-02-04', 90),
(77, 8, 101, '2024-08-29', '2024-09-01', 70),
(78, 10, 204, '2024-06-15', '2024-06-17', 60),
(79, 13, 301, '2024-06-17', '2024-06-22', 60),
(80, 13, 109, '2024-04-14', '2024-04-19', 90),
(81, 1, 102, '2025-02-06', '2025-02-11', 60),
(82, 11, 307, '2024-09-10', '2024-09-14', 90),
(83, 5, 105, '2024-08-03', '2024-08-07', 70),
(84, 12, 103, '2024-03-09', '2024-03-13', 70),
(85, 5, 308, '2025-02-25', '2025-03-03', 120),
(86, 11, 401, '2024-05-25', '2024-06-01', 120),
(87, 3, 402, '2024-04-26', '2024-04-28', 120),
(88, 4, 205, '2024-10-28', '2024-10-30', 60),
(89, 5, 404, '2024-04-21', '2024-04-25', 120),
(90, 3, 201, '2025-03-22', '2025-03-24', 60),
(91, 1, 307, '2024-06-20', '2024-06-25', 90),
(92, 4, 306, '2024-03-13', '2024-03-17', 90),
(93, 7, 106, '2025-02-07', '2025-02-09', 60),
(94, 8, 105, '2024-12-18', '2024-12-22', 70),
(95, 9, 202, '2024-08-18', '2024-08-19', 60),
(96, 4, 302, '2025-01-21', '2025-01-28', 60),
(97, 13, 208, '2024-07-14', '2024-07-16', 90),
(98, 3, 401, '2025-01-05', '2025-01-06', 120),
(99, 5, 207, '2024-08-10', '2024-08-15', 70),
(100, 5, 302, '2024-08-27', '2024-08-31', 60),
(101, 10, 302, '2024-10-06', '2024-10-08', 60),
(102, 7, 203, '2025-03-10', '2025-03-16', 70),
(103, 11, 402, '2024-10-15', '2024-10-18', 120),
(104, 8, 204, '2024-10-18', '2024-10-21', 60),
(105, 9, 102, '2024-07-28', '2024-08-01', 60),
(106, 5, 304, '2024-06-14', '2024-06-19', 90),
(107, 14, 401, '2024-12-19', '2024-12-26', 120),
(108, 10, 207, '2024-11-17', '2024-11-23', 70),
(109, 13, 403, '2024-08-02', '2024-08-04', 120),
(110, 13, 403, '2024-07-01', '2024-07-02', 120),
(111, 9, 309, '2024-12-19', '2024-12-23', 120),
(112, 14, 305, '2024-06-21', '2024-06-22', 90),
(113, 1, 303, '2024-12-24', '2024-12-26', 60),
(114, 12, 308, '2024-08-16', '2024-08-19', 120),
(115, 3, 102, '2024-06-18', '2024-06-21', 60),
(116, 11, 108, '2024-12-05', '2024-12-08', 90),
(117, 3, 306, '2024-05-25', '2024-05-28', 90),
(118, 11, 310, '2024-09-20', '2024-09-27', 120),
(119, 12, 107, '2024-08-22', '2024-08-24', 60),
(120, 14, 304, '2024-05-15', '2024-05-19', 90),
(121, 13, 306, '2025-02-25', '2025-03-03', 90),
(122, 10, 305, '2024-09-10', '2024-09-11', 90),
(123, 13, 204, '2024-09-01', '2024-09-08', 60),
(124, 11, 205, '2024-04-15', '2024-04-21', 60),
(125, 2, 208, '2024-09-30', '2024-10-03', 90),
(126, 5, 201, '2024-03-03', '2024-03-04', 60),
(127, 5, 101, '2024-07-12', '2024-07-15', 70),
(128, 7, 206, '2024-05-15', '2024-05-21', 70),
(129, 12, 207, '2024-09-08', '2024-09-12', 70),
(130, 3, 106, '2025-03-05', '2025-03-07', 60),
(131, 11, 102, '2025-03-21', '2025-03-25', 60),
(132, 6, 303, '2024-10-21', '2024-10-27', 60),
(133, 7, 302, '2024-10-18', '2024-10-23', 60),
(134, 6, 404, '2024-11-23', '2024-11-27', 120),
(135, 7, 108, '2024-04-27', '2024-05-01', 90),
(136, 3, 304, '2024-06-07', '2024-06-13', 90),
(137, 3, 205, '2024-07-11', '2024-07-14', 60),
(138, 14, 110, '2024-08-30', '2024-09-04', 90),
(139, 11, 108, '2025-01-24', '2025-01-30', 90),
(140, 3, 201, '2024-06-20', '2024-06-22', 60),
(141, 7, 304, '2024-09-02', '2024-09-03', 90),
(142, 11, 102, '2024-03-09', '2024-03-10', 60),
(143, 2, 208, '2024-06-05', '2024-06-09', 90),
(144, 9, 207, '2024-11-29', '2024-12-04', 70),
(145, 5, 302, '2024-06-02', '2024-06-07', 60),
(146, 13, 205, '2024-11-14', '2024-11-20', 60),
(147, 4, 203, '2024-03-26', '2024-03-29', 70),
(148, 8, 105, '2025-03-04', '2025-03-11', 70),
(149, 12, 210, '2025-03-15', '2025-03-19', 120),
(150, 10, 301, '2024-09-24', '2024-10-01', 60),
(151, 1, 310, '2024-06-21', '2024-06-26', 120),
(152, 12, 204, '2024-08-03', '2024-08-07', 60),
(153, 7, 301, '2024-04-18', '2024-04-24', 60),
(154, 9, 306, '2024-07-13', '2024-07-15', 90),
(155, 11, 202, '2025-02-04', '2025-02-06', 60),
(156, 4, 302, '2025-01-10', '2025-01-14', 60),
(157, 5, 103, '2025-03-03', '2025-03-08', 70),
(158, 11, 202, '2025-01-03', '2025-01-09', 60),
(159, 5, 206, '2025-01-21', '2025-01-26', 70),
(160, 3, 108, '2024-04-04', '2024-04-06', 90),
(161, 14, 310, '2024-11-14', '2024-11-15', 120),
(162, 12, 101, '2024-10-15', '2024-10-19', 70),
(163, 11, 308, '2024-04-20', '2024-04-26', 120),
(164, 8, 208, '2025-01-10', '2025-01-17', 90),
(165, 4, 302, '2025-02-28', '2025-03-04', 60),
(166, 10, 107, '2024-11-18', '2024-11-22', 60),
(167, 4, 107, '2024-09-06', '2024-09-12', 60),
(168, 6, 104, '2025-01-31', '2025-02-02', 70),
(169, 3, 308, '2024-10-09', '2024-10-16', 120),
(170, 1, 104, '2024-04-28', '2024-05-04', 70),
(171, 14, 108, '2025-01-10', '2025-01-14', 90),
(172, 12, 201, '2024-03-14', '2024-03-16', 60),
(173, 4, 207, '2024-07-09', '2024-07-13', 70),
(174, 13, 304, '2025-01-23', '2025-01-28', 90),
(175, 5, 205, '2024-09-05', '2024-09-06', 60),
(176, 6, 203, '2024-08-15', '2024-08-19', 70),
(177, 13, 204, '2024-05-24', '2024-05-28', 60),
(178, 5, 304, '2024-07-07', '2024-07-11', 90),
(179, 13, 304, '2024-03-26', '2024-03-29', 90),
(180, 5, 106, '2024-07-16', '2024-07-21', 60),
(181, 6, 105, '2024-03-25', '2024-03-26', 70),
(182, 4, 308, '2025-01-13', '2025-01-17', 120),
(183, 5, 108, '2024-07-08', '2024-07-15', 90),
(184, 6, 201, '2024-11-28', '2024-11-30', 60),
(185, 13, 108, '2024-03-07', '2024-03-09', 90),
(186, 10, 210, '2024-10-11', '2024-10-16', 120),
(187, 4, 310, '2024-05-10', '2024-05-13', 120),
(188, 10, 109, '2024-09-23', '2024-09-28', 90),
(189, 8, 104, '2025-02-07', '2025-02-12', 70),
(190, 3, 206, '2024-04-04', '2024-04-11', 70),
(191, 4, 306, '2024-08-03', '2024-08-08', 90),
(192, 9, 402, '2024-05-23', '2024-05-27', 120),
(193, 3, 107, '2024-08-11', '2024-08-12', 60),
(194, 6, 107, '2024-02-29', '2024-03-01', 60),
(195, 2, 402, '2024-12-06', '2024-12-07', 120),
(196, 13, 304, '2024-03-18', '2024-03-20', 90),
(197, 7, 101, '2024-11-09', '2024-11-12', 70),
(198, 12, 106, '2024-10-13', '2024-10-17', 60),
(199, 1, 208, '2024-04-13', '2024-04-14', 90),
(200, 10, 102, '2024-07-20', '2024-07-23', 60),
(201, 10, 104, '2024-04-02', '2024-04-04', 70),
(202, 11, 108, '2024-03-25', '2024-03-26', 90),
(203, 1, 310, '2025-03-07', '2025-03-12', 120),
(204, 2, 402, '2024-08-22', '2024-08-24', 120),
(205, 11, 106, '2024-08-03', '2024-08-08', 60),
(206, 8, 208, '2024-07-11', '2024-07-13', 90);

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
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_name` varchar(50) DEFAULT NULL,
  `service_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_name`, `service_price`) VALUES
(1, 'breakfast', 20),
(2, 'restaurant', 40),
(3, 'spa', 30),
(4, 'gym', 40),
(5, 'excursion', 50),
(6, 'cooking class', 30),
(7, 'bar', 30),
(8, 'swimming pool', 20);

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
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

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
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `room_types`
--
ALTER TABLE `room_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
