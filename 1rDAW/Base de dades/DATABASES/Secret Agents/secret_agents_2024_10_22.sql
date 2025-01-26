-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2024 at 07:40 PM
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
-- Database: `secret_agents`
--

-- --------------------------------------------------------

--
-- Table structure for table `secret_user`
--

CREATE TABLE `secret_user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `code_name` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `organization` varchar(100) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `knows_kung_fu` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `secret_user`
--

INSERT INTO `secret_user` (`user_id`, `first_name`, `last_name`, `code_name`, `country`, `organization`, `salary`, `knows_kung_fu`) VALUES
(1, 'Draymond', 'Green', 'DG23', 'United States', 'GSW', 152460, 0),
(2, 'Andrei', 'Kirilenko', 'AK47', 'Russia', 'UTA', 163680, 0),
(3, 'Dwyane', 'Wade', 'Flash', 'United States', 'MIA', 225000, 1),
(4, 'Marc', 'Gasol', 'Big Marc', 'Spain', 'MEM', 171600, 0),
(5, 'Russell', 'Westbrook', 'Brodie', 'United States', 'DEN', 110000, 0),
(6, 'Kevin', 'Garnett', 'Big Ticket', 'United States', 'BOS', 266640, 1),
(7, 'Stephen', 'Curry', 'Chef', 'United States', 'GSW', 270000, 1),
(8, 'Dillon', 'Brooks', 'DBrooks', 'Canada', 'HOU', 110000, 0),
(9, 'Luguentz', 'Dort', 'Bisonte Dort', 'Canada', 'OKC', 245000, 1),
(10, 'Paul', 'Pierce', 'The Truth', 'United States', 'BOS', 179520, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `secret_user`
--
ALTER TABLE `secret_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `secret_user`
--
ALTER TABLE `secret_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
