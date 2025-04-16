-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2025 at 07:33 PM
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
-- Table structure for table `actors_skills`
--

CREATE TABLE `actors_skills` (
  `actor_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `actors_skills`
--

INSERT INTO `actors_skills` (`actor_id`, `skill_id`) VALUES
(1, 2),
(1, 4),
(1, 5),
(1, 7),
(2, 3),
(2, 5),
(2, 6),
(3, 1),
(3, 2),
(3, 6),
(4, 2),
(4, 6),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(5, 7),
(6, 4),
(6, 6),
(6, 7),
(7, 2),
(7, 4),
(7, 6),
(7, 7),
(8, 1),
(8, 3),
(8, 5),
(8, 6),
(9, 3),
(9, 4),
(9, 6),
(10, 5),
(10, 6),
(10, 7),
(11, 1),
(11, 5),
(12, 1),
(12, 4),
(12, 5),
(13, 5),
(13, 6),
(13, 7),
(14, 1),
(14, 6),
(14, 7),
(15, 1),
(15, 2),
(15, 3),
(15, 4),
(15, 5);

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
(2, 2, 13, '2025-02-03 15:00:36', 2, 0),
(2, 3, 1, '2025-02-05 18:05:21', NULL, NULL),
(2, 3, 3, '2025-02-05 18:05:21', NULL, NULL),
(2, 3, 5, '2025-02-05 18:05:21', NULL, NULL),
(2, 3, 9, '2025-02-05 18:05:21', NULL, NULL),
(2, 3, 11, '2025-02-05 18:05:21', NULL, NULL),
(2, 3, 12, '2025-02-05 18:05:21', NULL, NULL),
(2, 3, 15, '2025-02-05 18:05:21', NULL, NULL),
(2, 4, 1, '2025-02-05 18:05:53', NULL, NULL),
(2, 4, 3, '2025-02-05 18:05:53', NULL, NULL),
(2, 4, 5, '2025-02-05 18:05:53', NULL, NULL),
(2, 4, 9, '2025-02-05 18:05:53', NULL, NULL),
(2, 4, 11, '2025-02-05 18:05:53', NULL, NULL),
(2, 4, 12, '2025-02-05 18:05:53', NULL, NULL),
(2, 4, 15, '2025-02-05 18:05:53', NULL, NULL),
(2, 5, 10, '2025-02-05 18:06:08', NULL, NULL),
(2, 5, 13, '2025-02-05 18:06:08', NULL, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `casting_view`
-- (See below for the actual view)
--
CREATE TABLE `casting_view` (
`movie_id` int(11)
,`character_id` int(11)
,`actor_id` int(11)
,`casting_date` timestamp
,`casting_position` int(11)
,`is_hired` tinyint(1)
,`character_skills` bigint(21)
,`actor_skills` bigint(21)
,`skill_compatibility` decimal(24,0)
);

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
-- Table structure for table `characters_skills`
--

CREATE TABLE `characters_skills` (
  `character_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `characters_skills`
--

INSERT INTO `characters_skills` (`character_id`, `skill_id`) VALUES
(1, 2),
(2, 5),
(2, 6),
(2, 7),
(3, 5),
(4, 1),
(4, 4),
(4, 5),
(5, 5),
(5, 6),
(5, 7),
(6, 1),
(6, 5),
(6, 6),
(6, 7),
(7, 1),
(7, 5);

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
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`skill_id`, `skill_name`) VALUES
(1, 'martial_arts'),
(2, 'drive_car'),
(3, 'drive_motorbike'),
(4, 'swimming'),
(5, 'climbing'),
(6, 'dancing'),
(7, 'singing'),
(8, 'test null');

-- --------------------------------------------------------

--
-- Stand-in structure for view `skills_view`
-- (See below for the actual view)
--
CREATE TABLE `skills_view` (
`character_id` int(11)
,`skill_id` int(11)
,`actor_id` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `casting_view`
--
DROP TABLE IF EXISTS `casting_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `casting_view`  AS SELECT `c`.`movie_id` AS `movie_id`, `c`.`character_id` AS `character_id`, `c`.`actor_id` AS `actor_id`, `c`.`casting_date` AS `casting_date`, `c`.`casting_position` AS `casting_position`, `c`.`is_hired` AS `is_hired`, (select count(`characters_skills`.`skill_id`) from `characters_skills` where `characters_skills`.`character_id` = `c`.`character_id`) AS `character_skills`, (select count(`ask`.`skill_id`) from (`actors_skills` `ask` join `characters_skills` `csk` on(`ask`.`skill_id` = `csk`.`skill_id`)) where `ask`.`actor_id` = `c`.`actor_id` and `csk`.`character_id` = `c`.`character_id`) AS `actor_skills`, round((select count(`ask`.`skill_id`) from (`actors_skills` `ask` join `characters_skills` `csk` on(`ask`.`skill_id` = `csk`.`skill_id`)) where `ask`.`actor_id` = `c`.`actor_id` and `csk`.`character_id` = `c`.`character_id`) / (select count(`characters_skills`.`skill_id`) from `characters_skills` where `characters_skills`.`character_id` = `c`.`character_id`) * 100,0) AS `skill_compatibility` FROM `casting` AS `c` ;

-- --------------------------------------------------------

--
-- Structure for view `skills_view`
--
DROP TABLE IF EXISTS `skills_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `skills_view`  AS SELECT `csk`.`character_id` AS `character_id`, `ask`.`skill_id` AS `skill_id`, `ask`.`actor_id` AS `actor_id` FROM (`actors_skills` `ask` join `characters_skills` `csk` on(`ask`.`skill_id` = `csk`.`skill_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`actor_id`);

--
-- Indexes for table `actors_skills`
--
ALTER TABLE `actors_skills`
  ADD PRIMARY KEY (`actor_id`,`skill_id`),
  ADD KEY `skill_id` (`skill_id`);

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
-- Indexes for table `characters_skills`
--
ALTER TABLE `characters_skills`
  ADD PRIMARY KEY (`character_id`,`skill_id`),
  ADD KEY `skill_id` (`skill_id`);

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
  MODIFY `skill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actors_skills`
--
ALTER TABLE `actors_skills`
  ADD CONSTRAINT `actors_skills_ibfk_1` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`actor_id`),
  ADD CONSTRAINT `actors_skills_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`);

--
-- Constraints for table `characters_skills`
--
ALTER TABLE `characters_skills`
  ADD CONSTRAINT `characters_skills_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `characters` (`character_id`),
  ADD CONSTRAINT `characters_skills_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
