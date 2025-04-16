-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2025 at 04:18 PM
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

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `casting_traits` (IN `var_character_id` INT, IN `var_movie_id` INT, IN `var_casting_date` TIMESTAMP)   BEGIN
	-- Declare variables
	DECLARE var_height INT;
	DECLARE var_weight INT;
	DECLARE var_race VARCHAR(50);
	
	-- Get info from the character
	SELECT character_height, character_weight, character_race INTO var_height, var_weight, var_race
	FROM characters
	WHERE character_id = var_character_id;
    
        -- Insert into casting table
        INSERT INTO casting(movie_id, character_id, actor_id, casting_date)
        SELECT var_movie_id, var_character_id, actor_id, var_casting_date
        FROM actors
        WHERE actor_height BETWEEN var_height-5 AND var_height+5
		AND actor_weight BETWEEN var_weight-10 AND var_weight+10
		AND actor_race = var_race;
END$$

DELIMITER ;

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
  `actor_height` int(11) DEFAULT NULL,
  `actor_weight` int(11) DEFAULT NULL,
  `actor_hair_color` varchar(100) DEFAULT NULL,
  `actor_race` enum('black','caucasian','asian') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `actors`
--

INSERT INTO `actors` (`actor_id`, `forename`, `surname`, `actor_gender`, `birthdate`, `actor_height`, `actor_weight`, `actor_hair_color`, `actor_race`) VALUES
(1, 'Robert', 'De Niro', 'male', '1943-08-17', 178, 75, 'grey', 'caucasian'),
(2, 'Denzel', 'Washington', 'male', '1954-12-28', 183, 86, 'black', 'black'),
(3, 'Leonardo', 'DiCaprio', 'male', '1974-11-11', 175, 78, 'blonde', 'caucasian'),
(4, 'Clint', 'Eastwood', 'male', '1930-05-31', 193, 97, 'grey', 'caucasian'),
(5, 'Tom', 'Hanks', 'male', '1956-07-09', 183, 76, 'black', 'caucasian'),
(6, 'Cate', 'Blanchett', 'female', '1969-05-14', 174, 58, 'blonde', 'caucasian'),
(7, 'Kate', 'Winslet', 'female', '1975-10-05', 169, 57, 'blonde', 'caucasian'),
(8, 'Viola', 'Davis', 'female', '1965-08-11', 165, 52, 'black', 'black'),
(9, 'Johnny', 'Depp', 'male', '1963-06-09', 178, 76, 'brown', 'caucasian'),
(10, 'Elijah', 'Wood', 'male', '1981-01-28', 168, 68, 'brown', 'caucasian'),
(11, 'Ian', 'McKellen', 'male', '1939-05-25', 180, 82, 'grey', 'caucasian'),
(12, 'Viggo', 'Mortensen', 'male', '1958-10-20', 180, 85, 'brown', 'caucasian'),
(13, 'Sean', 'Astin', 'male', '1971-02-25', 168, 68, 'brown', 'caucasian'),
(14, 'Liv', 'Tyler', 'female', '1977-07-01', 177, 60, 'black', 'caucasian'),
(15, 'Orlando', 'Bloom', 'male', '1977-01-13', 180, 81, 'black', 'caucasian');

-- --------------------------------------------------------

--
-- Table structure for table `casting`
--

CREATE TABLE `casting` (
  `movie_id` int(11) NOT NULL,
  `character_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL,
  `casting_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `casting_position` int(11) DEFAULT NULL,
  `is_hired` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `casting`
--

INSERT INTO `casting` (`movie_id`, `character_id`, `actor_id`, `casting_date`, `casting_position`, `is_hired`) VALUES
(1, 1, 4, '2025-02-03 15:00:19', 1, 1),
(2, 2, 10, '2025-02-03 15:00:33', 1, 1),
(2, 2, 13, '2025-02-03 15:00:36', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `character_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `importance` enum('principal','secondary') DEFAULT NULL,
  `character_gender` enum('female','male','non-binary') DEFAULT NULL,
  `character_height` int(11) DEFAULT NULL,
  `character_weight` int(11) DEFAULT NULL,
  `character_hair_color` varchar(100) DEFAULT NULL,
  `character_race` enum('black','caucasian','asian') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`character_id`, `name`, `importance`, `character_gender`, `character_height`, `character_weight`, `character_hair_color`, `character_race`) VALUES
(1, 'Walt Kowalski', 'principal', 'male', 193, 97, 'grey', 'caucasian'),
(2, 'Frodo Baggins', 'principal', 'male', 168, 68, 'brown', 'caucasian'),
(3, 'Gandalf', 'secondary', 'male', 180, 82, 'grey', 'caucasian'),
(4, 'Aragorn', 'principal', 'male', 180, 85, 'brown', 'caucasian'),
(5, 'Samwise Gamgee', 'secondary', 'male', 168, 68, 'brown', 'caucasian'),
(6, 'Arwen', 'secondary', 'female', 177, 60, 'black', 'caucasian'),
(7, 'Legolas', 'secondary', 'male', 180, 81, 'blonde', 'caucasian');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `language_id` int(11) NOT NULL,
  `language_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'Gran Torino', 'Clint Eastwood', 'drama', 33000000, 2008),
(2, 'The Lord of the Rings: The Fellowship of the Ring', 'Peter Jackson', 'adventure,drama', 93000000, 2001);

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `skill_id` int(11) NOT NULL,
  `skill_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`language_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`skill_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actors`
--
ALTER TABLE `actors`
  MODIFY `actor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `character_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `skill_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
