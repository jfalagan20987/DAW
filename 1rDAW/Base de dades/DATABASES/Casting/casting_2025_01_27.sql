-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2025 at 04:21 PM
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
-- Database: `casting`
--

-- --------------------------------------------------------

--
-- Table structure for table `actors`
--

CREATE TABLE `actors` (
  `actor_id` int(11) NOT NULL,
  `forename` varchar(100) DEFAULT NULL,
  `surname` varchar(100) DEFAULT NULL,
  `actor_gender` enum('female','male','non-binary') DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `actor_height` decimal(3,2) DEFAULT NULL,
  `actor_weight` decimal(4,1) DEFAULT NULL,
  `actor_hair_color` varchar(100) DEFAULT NULL,
  `actor_race` enum('black','caucasian','asian') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `actors`
--

INSERT INTO `actors` (`actor_id`, `forename`, `surname`, `actor_gender`, `birthdate`, `actor_height`, `actor_weight`, `actor_hair_color`, `actor_race`) VALUES
(1, 'Robert', 'De Niro', 'male', '1943-08-17', 1.77, 75.0, 'grey', 'caucasian'),
(2, 'Denzel', 'Washington', 'male', '1954-12-28', 1.85, 86.0, 'black', 'black'),
(3, 'Leonardo', 'DiCaprio', 'male', '1974-11-11', 1.83, 78.0, 'blonde', 'caucasian'),
(4, 'Clint', 'Eastwood', 'male', '1930-05-31', 1.93, 97.0, 'grey', 'caucasian');

-- --------------------------------------------------------

--
-- Table structure for table `casting`
--

CREATE TABLE `casting` (
  `movie_id` int(11) NOT NULL,
  `character_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL,
  `casting_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `agreed_salary` int(11) DEFAULT NULL,
  `casting_position` int(11) DEFAULT NULL,
  `is_hired` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `casting`
--

INSERT INTO `casting` (`movie_id`, `character_id`, `actor_id`, `casting_date`, `agreed_salary`, `casting_position`, `is_hired`) VALUES
(1, 1, 4, '2007-08-27 13:58:09', 1000000, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `character_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `importance` enum('principal','secondary') DEFAULT NULL,
  `character_gender` enum('female','male','non-binary') DEFAULT NULL,
  `character_height` decimal(3,2) DEFAULT NULL,
  `character_weight` decimal(4,1) DEFAULT NULL,
  `character_hair_color` varchar(100) DEFAULT NULL,
  `character_race` enum('black','caucasian','asian') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`character_id`, `name`, `importance`, `character_gender`, `character_height`, `character_weight`, `character_hair_color`, `character_race`) VALUES
(1, 'Walt Kowalski', 'principal', 'male', 1.93, 97.0, 'grey', 'caucasian');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movie_id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `director` varchar(100) DEFAULT NULL,
  `genre` set('horror','sci-fi','adventure','romantic','comedy','drama','action') DEFAULT NULL,
  `budget` int(11) DEFAULT NULL,
  `release_year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movie_id`, `title`, `director`, `genre`, `budget`, `release_year`) VALUES
(1, 'Gran Torino', 'Clint Eastwood', 'drama', 33000000, 2008);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`actor_id`);

--
-- Indexes for table `casting`
--
ALTER TABLE `casting`
  ADD PRIMARY KEY (`movie_id`,`character_id`,`actor_id`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`character_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actors`
--
ALTER TABLE `actors`
  MODIFY `actor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `character_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
