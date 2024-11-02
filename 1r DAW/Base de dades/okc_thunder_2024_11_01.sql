-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-11-2024 a las 12:08:18
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
-- Base de datos: `okc_thunder`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `players`
--

CREATE TABLE `players` (
  `player_id` int(11) NOT NULL,
  `surname` varchar(100) DEFAULT NULL,
  `forename` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `height` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `number` varchar(100) DEFAULT NULL,
  `draft_pick` varchar(100) DEFAULT NULL,
  `years_in_nba` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `players`
--

INSERT INTO `players` (`player_id`, `surname`, `forename`, `age`, `height`, `weight`, `position`, `number`, `draft_pick`, `years_in_nba`) VALUES
(1, 'Caruso', 'Alex', 30, 1.96, 84, 'Guard', '#9', 'Undrafted', 8),
(2, 'Dieng', 'Ousmane', 21, 2.06, 83, 'Forward', '#13', '11th (1st Round), 2022', 3),
(3, 'Dort', 'Luguentz', 25, 1.93, 99, 'Guard', '#5', 'Undrafted', 6),
(4, 'Ducas', 'Alex', 23, 2.01, 99, 'Guard', '#88', 'Undrafted', 1),
(5, 'Flagler', 'Adam', 24, 1.91, 81, 'Guard', '#14', 'Undrafted', 2),
(6, 'Gilgeous-Alexander', 'Shai', 26, 1.98, 88, 'Guard', '#2', '11th (1st Round), 2018', 7),
(7, 'Hartenstein', 'Isaiah', 26, 2.13, 113, 'Center', '#55', '43rd (2nd Round), 2017', 7),
(8, 'Holmgren', 'Chet', 22, 2.16, 94, 'Center', '#7', '2nd (1st Round), 2022', 2),
(9, 'Joe', 'Isaiah', 25, 1.91, 74, 'Guard', '#11', '49th (2nd Round), 2020', 5),
(10, 'Jones', 'Dillon', 23, 1.96, 106, 'Forward', '#3', '26th (1st Round), 2024', 1),
(11, 'Leons', 'Malevy', 25, 2.06, 92, 'Forward', '#17', 'Undrafted', 1),
(12, 'Mitchell', 'Ajay', 22, 1.96, 86, 'Guard', '#25', '38th (2nd Round), 2024', 1),
(13, 'Topic', 'Nikola', 19, 1.98, 90, 'Guard', '#44', '12th (1st Round), 2024', 0),
(14, 'Wallace', 'Cason', 20, 1.91, 88, 'Guard', '#22', '10th (1st Round), 2023', 2),
(15, 'Wiggins', 'Aaron', 25, 1.96, 86, 'Forward', '#21', '55th (2nd Round), 2021', 4),
(16, 'Williams', 'Jalen', 23, 1.96, 95, 'Forward', '#8', '12th (1st Round), 2022', 3),
(17, 'Williams', 'Jaylin', 22, 2.06, 108, 'Center', '#6', '34th (2nd Round), 2022', 3),
(18, 'Williams', 'Kenrich', 29, 1.98, 95, 'Forward', '#34', 'Undrafted', 7);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`player_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `players`
--
ALTER TABLE `players`
  MODIFY `player_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
