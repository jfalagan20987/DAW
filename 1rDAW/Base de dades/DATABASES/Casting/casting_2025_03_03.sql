-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-03-2025 a las 13:09:35
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `casting`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `casting_insert` (IN `var_character_id` INT, IN `var_movie_id` INT, IN `var_casting_date` TIMESTAMP)   BEGIN
	-- Declare variables
	DECLARE var_height INT;
	DECLARE var_weight INT;
	DECLARE var_race VARCHAR(50);
	DECLARE var_expected_salary DECIMAL(2,1);
	DECLARE var_actor_id INT;
	DECLARE var_skill_compatibility INT;
	
	-- Get info from the character
	SELECT character_height, character_weight, character_race INTO var_height, var_weight, var_race
	FROM characters
	WHERE character_id = var_character_id;
	
	-- Get salary
	SELECT actor_id, COALESCE(AVG(agreed_salary),0) INTO var_actor_id, var_expected_salary
	FROM acting
	WHERE actor_id = var_actor_id;
	
	-- Get skill_compatibility
	SELECT skill_compatibility INTO var_skill_compatibility
	FROM casting_view
	WHERE movie_id = var_movie_id AND character_id = var_expected_salary AND actor_id = var_actor_id;
    
	-- Insert into casting table
	INSERT INTO casting2(movie_id, character_id, actor_id, casting_date, expected_salary, skill_compatibility)
	SELECT var_movie_id, var_character_id, actor_id, var_casting_date, var_expected_salary, var_skill_compatibility
	FROM actors
	WHERE actor_height BETWEEN var_height-5 AND var_height+5
	AND actor_weight BETWEEN var_weight-10 AND var_weight+10
	AND actor_race = var_race;
	
END$$

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

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `age` (`var_birthdate` DATE) RETURNS INT(11) DETERMINISTIC BEGIN
	DECLARE var_age INT;
    
    SET var_age = TIMESTAMPDIFF(YEAR, var_birthdate, CURRENT_DATE);
    RETURN(var_age);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acting`
--

CREATE TABLE `acting` (
  `movie_id` int(11) NOT NULL,
  `character_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL,
  `agreed_salary` decimal(2,1) DEFAULT NULL,
  `inserted_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `acting`
--

INSERT INTO `acting` (`movie_id`, `character_id`, `actor_id`, `agreed_salary`, `inserted_on`) VALUES
(1, 1, 4, 2.5, '2025-02-25 16:03:43'),
(2, 2, 10, 1.7, '2025-02-25 16:03:46'),
(2, 3, 11, 2.5, '2025-02-25 17:33:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actors`
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
-- Volcado de datos para la tabla `actors`
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
-- Estructura de tabla para la tabla `actors_languages`
--

CREATE TABLE `actors_languages` (
  `actor_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `actors_languages`
--

INSERT INTO `actors_languages` (`actor_id`, `language_id`) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(2, 4),
(3, 1),
(3, 5),
(4, 1),
(4, 3),
(4, 5),
(5, 1),
(5, 3),
(5, 4),
(6, 2),
(6, 4),
(6, 5),
(7, 1),
(7, 2),
(7, 5),
(8, 2),
(8, 4),
(8, 5),
(9, 1),
(9, 2),
(9, 3),
(9, 5),
(10, 2),
(10, 3),
(10, 4),
(11, 1),
(11, 3),
(11, 4),
(12, 1),
(12, 2),
(12, 3),
(13, 2),
(13, 4),
(13, 5),
(14, 1),
(14, 2),
(14, 3),
(15, 1),
(15, 2),
(15, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actors_skills`
--

CREATE TABLE `actors_skills` (
  `actor_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `actors_skills`
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
-- Estructura de tabla para la tabla `casting`
--

CREATE TABLE `casting` (
  `movie_id` int(11) NOT NULL,
  `character_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL,
  `casting_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `casting_position` int(11) DEFAULT NULL,
  `is_hired` tinyint(1) DEFAULT NULL,
  `agreed_salary` decimal(2,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `casting`
--

INSERT INTO `casting` (`movie_id`, `character_id`, `actor_id`, `casting_date`, `casting_position`, `is_hired`, `agreed_salary`) VALUES
(1, 1, 4, '2025-02-25 16:03:43', 1, 1, 2.5),
(2, 2, 10, '2025-02-25 16:03:46', 1, 1, 1.7),
(2, 2, 13, '2025-02-24 14:58:40', 2, 0, 1.6),
(2, 3, 1, '2025-02-25 17:28:20', 4, 0, 1.5),
(2, 3, 3, '2025-02-25 17:28:23', 5, 0, 1.2),
(2, 3, 9, '2025-02-25 17:28:26', 6, 0, 1.7),
(2, 3, 11, '2025-02-25 17:33:54', 1, 1, 2.5),
(2, 3, 12, '2025-02-25 17:28:13', 2, 0, 1.9),
(2, 3, 15, '2025-02-25 17:28:17', 3, 0, 1.9),
(2, 4, 1, '2025-02-05 18:05:53', NULL, NULL, NULL),
(2, 4, 3, '2025-02-05 18:05:53', NULL, NULL, NULL),
(2, 4, 5, '2025-02-05 18:05:53', NULL, NULL, NULL),
(2, 4, 9, '2025-02-05 18:05:53', NULL, NULL, NULL),
(2, 4, 11, '2025-02-05 18:05:53', NULL, NULL, NULL),
(2, 4, 12, '2025-02-05 18:05:53', NULL, NULL, NULL),
(2, 4, 15, '2025-02-05 18:05:53', NULL, NULL, NULL),
(2, 5, 10, '2025-02-05 18:06:08', NULL, NULL, NULL),
(2, 5, 13, '2025-02-05 18:06:08', NULL, NULL, NULL);

--
-- Disparadores `casting`
--
DELIMITER $$
CREATE TRIGGER `up_tr_hired` AFTER UPDATE ON `casting` FOR EACH ROW BEGIN
	IF OLD.is_hired = 0 AND NEW.is_hired = 1 THEN
    	  INSERT INTO acting (movie_id, character_id, actor_id, agreed_salary)
          VALUES (NEW.movie_id, NEW.character_id, NEW.actor_id, NEW.agreed_salary);
        ELSEIF OLD.is_hired = 1 AND NEW.is_hired = 0 THEN
          DELETE FROM acting
          WHERE movie_id = NEW.movie_id AND character_id = NEW.character_id AND actor_id = NEW.actor_id;
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casting2`
--

CREATE TABLE `casting2` (
  `movie_id` int(11) NOT NULL,
  `character_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL,
  `casting_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `expected_salary` decimal(2,1) DEFAULT NULL,
  `agreed_salary` decimal(2,1) DEFAULT NULL,
  `skill_compatibility` int(11) DEFAULT NULL,
  `language_compatibility` int(11) DEFAULT NULL,
  `casting_order` int(11) DEFAULT NULL,
  `is_hired` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `casting2`
--

INSERT INTO `casting2` (`movie_id`, `character_id`, `actor_id`, `casting_date`, `expected_salary`, `agreed_salary`, `skill_compatibility`, `language_compatibility`, `casting_order`, `is_hired`) VALUES
(1, 1, 4, '2025-03-03 11:48:24', 0.0, NULL, NULL, NULL, NULL, NULL),
(2, 2, 10, '2025-03-03 11:48:46', 0.0, NULL, NULL, NULL, NULL, NULL),
(2, 2, 13, '2025-03-03 11:48:46', 0.0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `casting_view`
-- (Véase abajo para la vista actual)
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
-- Estructura Stand-in para la vista `casting_view_2`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `casting_view_2` (
`movie_id` int(11)
,`character_id` int(11)
,`actor_id` int(11)
,`casting_position` int(11)
,`is_hired` tinyint(1)
,`agreed_salary` decimal(2,1)
,`expected_salary` decimal(3,1)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `characters`
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
-- Volcado de datos para la tabla `characters`
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
-- Estructura de tabla para la tabla `characters_languages`
--

CREATE TABLE `characters_languages` (
  `character_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `characters_languages`
--

INSERT INTO `characters_languages` (`character_id`, `language_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 4),
(2, 5),
(3, 1),
(3, 2),
(3, 4),
(4, 1),
(4, 3),
(4, 5),
(5, 1),
(5, 2),
(5, 4),
(6, 1),
(6, 3),
(6, 5),
(7, 1),
(7, 3),
(7, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `characters_skills`
--

CREATE TABLE `characters_skills` (
  `character_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `characters_skills`
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
-- Estructura de tabla para la tabla `languages`
--

CREATE TABLE `languages` (
  `language_id` int(11) NOT NULL,
  `language_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `languages`
--

INSERT INTO `languages` (`language_id`, `language_name`) VALUES
(1, 'English'),
(2, 'Spanish'),
(3, 'French'),
(4, 'German'),
(5, 'Portuguese');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movies`
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
-- Volcado de datos para la tabla `movies`
--

INSERT INTO `movies` (`movie_id`, `title`, `director`, `genre`, `budget`, `release_year`) VALUES
(1, 'Gran Torino', 'Clint Eastwood', 'drama', 33000000, 2008),
(2, 'The Lord of the Rings: The Fellowship of the Ring', 'Peter Jackson', 'adventure,drama', 93000000, 2001);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `skills`
--

CREATE TABLE `skills` (
  `skill_id` int(11) NOT NULL,
  `skill_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `skills`
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
-- Estructura Stand-in para la vista `skills_view`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `skills_view` (
`character_id` int(11)
,`skill_id` int(11)
,`actor_id` int(11)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `casting_view`
--
DROP TABLE IF EXISTS `casting_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `casting_view`  AS SELECT `c`.`movie_id` AS `movie_id`, `c`.`character_id` AS `character_id`, `c`.`actor_id` AS `actor_id`, `c`.`casting_date` AS `casting_date`, `c`.`casting_position` AS `casting_position`, `c`.`is_hired` AS `is_hired`, (select count(`characters_skills`.`skill_id`) from `characters_skills` where `characters_skills`.`character_id` = `c`.`character_id`) AS `character_skills`, (select count(`ask`.`skill_id`) from (`actors_skills` `ask` join `characters_skills` `csk` on(`ask`.`skill_id` = `csk`.`skill_id`)) where `ask`.`actor_id` = `c`.`actor_id` and `csk`.`character_id` = `c`.`character_id`) AS `actor_skills`, round((select count(`ask`.`skill_id`) from (`actors_skills` `ask` join `characters_skills` `csk` on(`ask`.`skill_id` = `csk`.`skill_id`)) where `ask`.`actor_id` = `c`.`actor_id` and `csk`.`character_id` = `c`.`character_id`) / (select count(`characters_skills`.`skill_id`) from `characters_skills` where `characters_skills`.`character_id` = `c`.`character_id`) * 100,0) AS `skill_compatibility` FROM `casting` AS `c` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `casting_view_2`
--
DROP TABLE IF EXISTS `casting_view_2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `casting_view_2`  AS SELECT `movie_id` AS `movie_id`, `character_id` AS `character_id`, `actor_id` AS `actor_id`, `casting_position` AS `casting_position`, `is_hired` AS `is_hired`, `agreed_salary` AS `agreed_salary`, (select round(avg(`acting`.`agreed_salary`),1) from `acting` where `acting`.`actor_id` = `acting`.`actor_id` and year(`acting`.`inserted_on`) >= year(curdate()) - 3) AS `expected_salary` FROM `casting` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `skills_view`
--
DROP TABLE IF EXISTS `skills_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `skills_view`  AS SELECT `csk`.`character_id` AS `character_id`, `ask`.`skill_id` AS `skill_id`, `ask`.`actor_id` AS `actor_id` FROM (`actors_skills` `ask` join `characters_skills` `csk` on(`ask`.`skill_id` = `csk`.`skill_id`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acting`
--
ALTER TABLE `acting`
  ADD PRIMARY KEY (`movie_id`,`character_id`,`actor_id`),
  ADD KEY `character_id` (`character_id`),
  ADD KEY `actor_id` (`actor_id`);

--
-- Indices de la tabla `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`actor_id`);

--
-- Indices de la tabla `actors_languages`
--
ALTER TABLE `actors_languages`
  ADD PRIMARY KEY (`actor_id`,`language_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indices de la tabla `actors_skills`
--
ALTER TABLE `actors_skills`
  ADD PRIMARY KEY (`actor_id`,`skill_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indices de la tabla `casting`
--
ALTER TABLE `casting`
  ADD PRIMARY KEY (`movie_id`,`character_id`,`actor_id`);

--
-- Indices de la tabla `casting2`
--
ALTER TABLE `casting2`
  ADD PRIMARY KEY (`movie_id`,`character_id`,`actor_id`),
  ADD KEY `character_id` (`character_id`),
  ADD KEY `actor_id` (`actor_id`);

--
-- Indices de la tabla `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`character_id`);

--
-- Indices de la tabla `characters_languages`
--
ALTER TABLE `characters_languages`
  ADD PRIMARY KEY (`character_id`,`language_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indices de la tabla `characters_skills`
--
ALTER TABLE `characters_skills`
  ADD PRIMARY KEY (`character_id`,`skill_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indices de la tabla `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`language_id`);

--
-- Indices de la tabla `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indices de la tabla `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`skill_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actors`
--
ALTER TABLE `actors`
  MODIFY `actor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `characters`
--
ALTER TABLE `characters`
  MODIFY `character_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `languages`
--
ALTER TABLE `languages`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `movies`
--
ALTER TABLE `movies`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `skills`
--
ALTER TABLE `skills`
  MODIFY `skill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acting`
--
ALTER TABLE `acting`
  ADD CONSTRAINT `acting_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  ADD CONSTRAINT `acting_ibfk_2` FOREIGN KEY (`character_id`) REFERENCES `characters` (`character_id`),
  ADD CONSTRAINT `acting_ibfk_3` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`actor_id`);

--
-- Filtros para la tabla `actors_languages`
--
ALTER TABLE `actors_languages`
  ADD CONSTRAINT `actors_languages_ibfk_1` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`actor_id`),
  ADD CONSTRAINT `actors_languages_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`);

--
-- Filtros para la tabla `actors_skills`
--
ALTER TABLE `actors_skills`
  ADD CONSTRAINT `actors_skills_ibfk_1` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`actor_id`),
  ADD CONSTRAINT `actors_skills_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`);

--
-- Filtros para la tabla `casting2`
--
ALTER TABLE `casting2`
  ADD CONSTRAINT `casting2_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  ADD CONSTRAINT `casting2_ibfk_2` FOREIGN KEY (`character_id`) REFERENCES `characters` (`character_id`),
  ADD CONSTRAINT `casting2_ibfk_3` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`actor_id`);

--
-- Filtros para la tabla `characters_languages`
--
ALTER TABLE `characters_languages`
  ADD CONSTRAINT `characters_languages_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `characters` (`character_id`),
  ADD CONSTRAINT `characters_languages_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`);

--
-- Filtros para la tabla `characters_skills`
--
ALTER TABLE `characters_skills`
  ADD CONSTRAINT `characters_skills_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `characters` (`character_id`),
  ADD CONSTRAINT `characters_skills_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
