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
-- Database: `social_network`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitter_user`
--

CREATE TABLE `chitter_user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `encrypted_password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date_joined` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chitter_user`
--

INSERT INTO `chitter_user` (`user_id`, `username`, `encrypted_password`, `email`, `date_joined`) VALUES
(1, 'jfalagan', 'fujrj6l3lllf', 'jfalagan20987@iesjoanramis.org', '2024-10-16'),
(2, 'usuario123', '778rhdyye', 'usuario123@gmail.com', '2024-10-16'),
(3, 'usuario_UTF8', 'charsetmeta', 'utf8@gmail.com', '2024-10-16'),
(4, 'example_user', '333jmjfkdfksk', 'example_user@gmail.com', '2024-10-16'),
(5, 'example234', 'kkrird986', 'example234@gmail.com', '2024-10-16'),
(6, 'mj23', '6rings23', 'mjordan@gmail.com', '2008-05-12'),
(7, 'magicJ', '32showtime', 'mjohnson@gmail.com', '2008-06-28'),
(8, 'DAmaradona', 'd10s', 'dmaradona@gmail.com', '2008-07-14'),
(9, 'mAli', 'turmmm2323', 'mali@gmail.com', '2009-05-08'),
(10, 'ilDoctore', '93italia', 'vrossi@gmail.com', '2009-05-30'),
(11, 't-woods', '333utmm', 'twoods@gmail.com', '2009-06-02'),
(12, 'mphelps', 'maxgolds', 'michaelp@gmail.com', '2009-07-18'),
(13, 'esmith', 'jjfik6kj', 'esmith@gmail.com', '2009-07-18'),
(14, 'pele10', '578585jn4', 'orei@gmail.com', '2009-10-04'),
(15, 'gbest', 'jfjfji5kkmd', 'gbest@gmail.com', '2009-11-23'),
(16, 'distefano', 'lasaeta10', 'saetarubia@gmail.com', '2009-11-23'),
(17, 'ronnie10', '5k5jkkk', 'ronaldinho@gmail.com', '2009-12-31'),
(18, 'cr7', 'siuuuu123', 'cronaldo7@gmail.com', '2010-01-02'),
(19, 'leoMessi', 'd1000s', 'lmessi@gmail.com', '2010-01-02'),
(20, 'jcruyff', '14bdo', 'jcruyff14@gmail.com', '2010-02-24'),
(21, 'zizou5', 'zzzjrii', 'zzidane@gmail.com', '2010-02-26'),
(22, 'mplatini', '1099mrm', 'mplatini@gmail.com', '2010-03-11'),
(23, 'pguardiola', '123jjuu', 'pepguardiola@gmail.com', '2010-03-12'),
(24, 'CLMenotti', 'kuuarg123', 'clmenotti@gmail.com', '2010-03-25'),
(25, 'dforlan5', 'jjuti559sk', 'dforlan@gmail.com', '2010-03-27'),
(26, 'enzofrancescoli', 'uuu993j', 'efrancescoli@gmail.com', '2010-04-01'),
(27, 'izamorano', 'iurjnjj', 'izamorano@gmail.com', '2010-04-03'),
(28, 'franzbeck', 'kaiser345', 'fbeckenbauer@gmail.com', '2010-04-10'),
(29, 'ronaldo9', 'ofenomeno911', 'ronnienazario@gmail.com', '2010-04-11'),
(30, 'siralexf', 'ijnf77', 'alexferguson@gmail.com', '2010-04-15'),
(31, 'jorgev', 'filo9594ds', 'jorgeval@gmail.com', '2010-04-16'),
(32, 'daniialves', '1322kkkff', 'danialves@gmail.com', '2010-04-27'),
(33, 'csbilardo', '18fiks9', 'bilardo@gmail.com', '2010-05-06'),
(34, 'msalas', 'ikiuiudlk4', 'marcelosalas@gmail.com', '2010-05-08'),
(35, 'mklose', 'bestscorer123', 'mklose@gmail.com', '2010-05-09'),
(36, 'ddzajic', 'iii2999393k', 'ddzajic@gmail.com', '2010-05-13'),
(37, 'savicevic', '88djuffjkioo', 'savicevic@gmail.com', '2010-05-19'),
(38, 'bebeto10', 'jdjubraius', 'bebeto@gmail.com', '2010-05-20'),
(39, 'djalminha', 'deoojrjk22', 'djalminha@gmail.com', '2010-05-22'),
(40, 'brobson', 'gbruutn677', 'bobbyrob@gmail.com', '2010-05-23'),
(41, 'lsuarez', '77utjuj', 'luissuarez@gmail.com', '2010-05-30');

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `follower_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`follower_id`, `user_id`) VALUES
(1, 2),
(1, 3),
(1, 6),
(2, 1),
(2, 4),
(3, 1),
(5, 2),
(7, 6),
(10, 6);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_text` varchar(500) DEFAULT NULL,
  `posted_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `user_id`, `post_text`, `posted_on`) VALUES
(1, 1, 'Hello World!', '2024-10-16 19:17:57'),
(2, 1, '¡Hola Mundo!', '2024-10-17 13:27:14'),
(3, 2, 'No sé qué poner', '2024-10-17 13:27:14'),
(4, 3, 'Hola qué tal?', '2024-10-17 13:30:08'),
(5, 4, 'Esto es un texto de ejemplo', '2024-10-17 13:30:08'),
(6, 5, 'TODO EN MAYÚSCULAS', '2024-10-17 13:30:08'),
(7, 6, 'Detesté cada minuto de entrenamiento, pero me dije: No renuncies, sufre ahora y vive el resto de tu vida como un campeón', '2024-10-22 15:48:37'),
(8, 7, 'No te preguntes qué pueden hacer tus compañeros por ti, pregúntate qué puedes hacer tú por tus compañeros', '2024-10-22 15:48:37'),
(9, 6, 'He fallado una y otra vez en mi vida, por eso he conseguido el éxito', '2024-10-22 15:48:37'),
(10, 8, 'El fútbol es el deporte más lindo y sano que existe en el mundo. Eso no le quepa la menor duda a nadie. Porque se equivoque uno no tiene que pagar el fútbol. Yo me equivoqué y pagué. La pelota no se mancha.', '2024-10-22 15:48:37'),
(11, 11, 'No importa lo bueno que seas, lo emocionante es que puedes ser todavía mejor', '2024-10-22 15:48:37'),
(12, 9, 'Los campeones no se hacen en los gimnasios. Los campeones están hechos de algo que tienen muy adentro de ellos: el deseo, un sueño y una visión.', '2024-10-22 15:48:37'),
(13, 12, 'No se le puede poner límite a algo, cuanto más sueñes más lejos llegarás.', '2024-10-22 15:48:37'),
(14, 14, 'Cuando los demás se iban de juerga después de entrenar, yo seguía golpeando a la pelota', '2024-10-22 15:48:37'),
(15, 10, 'Si crees que eres el mejor ya no puedes mejorar, si quieres ser el mejor siempre debes hacerlo.', '2024-10-22 15:48:37'),
(16, 13, 'Ganar es algo que se construye con cada entrenamiento y con cada vez que sueño.', '2024-10-22 15:48:37'),
(17, 8, 'Estoy arrepentido del 99% de todo lo que hice en mi vida, pero el 1% que es el fútbol salva el resto.', '2024-10-22 15:48:37'),
(18, 8, 'Si yo no hubiera hecho todas esas cosas malas, Pelé no llegaba ni a segundo en la lista mundial.', '2024-10-22 15:48:37'),
(19, 14, 'Cuanto más difícil, mayor es la sensación de victoria', '2024-10-22 15:48:37'),
(20, 8, 'Yo me equivoqué y pagué, pero el balón no se mancha', '2024-10-22 15:48:37'),
(21, 8, 'Lo único que quiero es que mi viejo no trabaje más', '2024-10-22 15:48:37'),
(22, 8, 'Desde que me acuerdo, tengo una pelota en los pies', '2024-10-22 15:48:37'),
(23, 16, 'No sé si estoy enamorado de Zidane, pero yo veo que todo lo que hace con el balón es perfecto', '2024-10-22 15:48:37'),
(24, 14, 'Marcar con penalti es una manera muy cobarde de golear', '2024-10-22 15:48:37'),
(25, 14, 'Brasil come, duerme y bebe fútbol. ¡Vive el fútbol!', '2024-10-22 15:48:37'),
(26, 17, 'Mi mayor ídolo es mi hermano. Él es un ejemplo de padre, de hermano y de jugador', '2024-10-22 15:48:37'),
(27, 18, 'Vuestro odio me hace imparable', '2024-10-22 15:48:37'),
(28, 19, 'Hay que aprender el oficio para ser el mejor, no vale sólo con el talento', '2024-10-22 15:48:37'),
(29, 16, 'Marcar un gol es como hacer el amor', '2024-10-22 15:48:37'),
(30, 16, 'Ningún jugador es tan bueno como todos juntos', '2024-10-22 15:48:37'),
(31, 15, 'Si hubiera nacido feo, ustedes no habrían oído hablar de Pelé', '2024-10-22 15:48:37'),
(32, 16, 'Ser segundo es ser el primero de los últimos. No vale de nada hacer 200 goles si quedas segundo', '2024-10-22 15:48:37'),
(33, 15, 'Mi mayor meta es que mi padre pensara que fui el mejor, y lo piensa', '2024-10-22 15:48:37'),
(34, 17, 'La música es mi segunda pasión. Creo que si no fuera jugador me dedicaría a la música', '2024-10-22 15:48:37'),
(35, 18, 'Hay que aprender el oficio para ser el mejor, no vale sólo con el talento', '2024-10-22 15:48:37'),
(36, 16, 'Jugamos como nunca y perdimos como siempre', '2024-10-22 15:48:37'),
(37, 19, 'Sólo quiero ganar, no marcar muchos goles', '2024-10-22 15:48:37'),
(38, 20, 'Es asqueroso comparar a Messi y a Maradona. La gente que lo vio a Diego disfrutó y la que vio a Leo también', '2024-10-22 15:48:37'),
(39, 20, 'Jugar al fútbol es muy sencillo, pero jugar un fútbol sencillo es la cosa más difícil que hay', '2024-10-22 15:48:37'),
(40, 16, 'Un partido sin goles es como un domingo sin sol', '2024-10-22 15:48:37'),
(41, 16, 'Puskas manejaba mejor el balón con la pierna izquierda que yo con la mano', '2024-10-22 15:48:37'),
(42, 16, 'Tengo 86 años, pero el corazón joven', '2024-10-22 15:48:37'),
(43, 19, 'No me gusta perder a nada, siempre trato de ganar', '2024-10-22 15:48:37'),
(44, 17, 'Aprendo hasta de los niños en la playa; quizá porque mi fútbol es algo infantil, me divierto como un niño', '2024-10-22 15:48:37'),
(45, 17, 'Yo hablo en el campo, y en el Bernabéu he hecho cosas bellísimas', '2024-10-22 15:48:37'),
(46, 16, 'La pelota está hecha de cuero, el cuero viene de la vaca, la vaca come pasto, así que hay que echar la pelota al pasto', '2024-10-22 15:48:37'),
(47, 16, 'Se juega mejor con once, y si es con doce, mejor', '2024-10-22 15:48:37'),
(48, 16, 'Las finales no se juegan, se ganan', '2024-10-22 15:48:37'),
(49, 20, 'El fútbol siempre debe ser un espectáculo', '2024-10-22 15:48:37'),
(50, 19, 'Algo me permite aguantar los golpes y seguir luchando', '2024-10-22 15:48:37'),
(51, 21, 'Si no tienes suerte y gente que te ayude en el camino, nunca llegarás a ser el mejor', '2024-10-22 15:48:37'),
(52, 17, 'Seguramente sea feo, pero tengo encanto', '2024-10-22 15:48:37'),
(53, 20, 'En mi equipo, los delanteros solo deben correr 15 metros, a no ser que sean estúpidos o estén durmiendo', '2024-10-22 15:48:37'),
(54, 17, 'Nací siendo un don nadie, y nadie será como yo', '2024-10-22 15:48:37'),
(55, 17, 'Tras el trabajo me gusta divertirme. Y las discotecas están para eso, al diablo con los moralista', '2024-10-22 15:48:37'),
(56, 20, 'Si marcas un gol más que tu oponente, ganas', '2024-10-22 15:48:37'),
(57, 17, 'Salí de Brasil dispuesto a crecer como jugador y como hombre. Quería aprender de todo, conocerlo todo. Así que cada día que pasa aprendo algo nuevo', '2024-10-22 15:48:37'),
(58, 19, '¿Querían las tres? ¡Acá están las tres!', '2024-10-22 15:48:37'),
(59, 23, 'Ciudadanos de Catalunya, ¡ya la tenemos aquí!', '2024-10-22 15:48:37'),
(60, 23, 'Lo que te hace crecer es la derrota, el error', '2024-10-22 15:48:37'),
(61, 23, 'Si nos levantamos bien temprano y curramos, somos un país imparable', '2024-10-22 15:48:37'),
(62, 20, 'Si no puedes ganar, asegúrate de no perder', '2024-10-22 15:48:37'),
(63, 21, 'Prefiero ser un buen ejemplo para los niños a ser una estrella', '2024-10-22 15:48:37'),
(64, 22, 'Lo que Zidane hace con una pelota, Maradona lo hace con una naranja', '2024-10-22 15:48:37'),
(65, 23, 'Si perdemos seremos los mejores, si ganamos seremos eternos', '2024-10-22 15:48:37'),
(66, 20, 'Si tú tienes el balón, el rival no la tiene', '2024-10-22 15:48:37'),
(67, 19, 'El día que no disfrute en el campo, voy a dejar el fútbol', '2024-10-22 15:48:37'),
(68, 23, 'El secreto de un buen equipo está en el orden, que todos sepan lo que hay que hacer', '2024-10-22 15:48:37'),
(69, 21, 'Puedes ser todo lo virtuoso que quieras, pero no eres nadie sin tu equipo', '2024-10-22 15:48:37'),
(70, 20, 'No soy creyente. En España, los 22 jugadores se santiguan antes de salir al campo. Si resultara bien, siempre sería empate', '2024-10-22 15:48:37'),
(71, 20, 'El mejor jugador del mundo no existe, porque hay diferentes posiciones… Es muy difícil decir quién es el mejor. Hoy, el más espectacular es Messi y el mejor es Xavi', '2024-10-22 15:48:37'),
(72, 20, 'Los italianos no pueden ganarte, pero sí puedes perder frente a ellos', '2024-10-22 15:48:37'),
(73, 23, 'La gran suerte que uno puede tener es hacer lo que le gusta. Dar con eso es la esencia de todo', '2024-10-22 15:48:37'),
(74, 22, 'Los equipos de fútbol son una manera de ser', '2024-10-22 15:48:37'),
(75, 24, 'La diferencia entre Messi y Haaland es que Erling necesita el equipo y Messi tiene la habilidad de hacerlo por sí solo', '2024-10-22 15:48:37'),
(76, 22, 'El fútbol está hecho de errores, porque el partido perfecto es 0-0', '2024-10-22 15:48:37'),
(77, 23, 'No pido nada especial a los jugadores. Sólo que hagan lo que saben y sean atrevidos. Sin atrevimiento, no se sacan adelante los partidos importantes', '2024-10-22 15:48:37'),
(78, 23, 'El talento depende de la inspiración, pero el esfuerzo depende de cada uno', '2024-10-22 15:48:37'),
(79, 24, 'El 90% de los jugadores actuales no sabe jugar al fútbol entendiendo por tal un juego colectivo', '2024-10-22 15:48:37'),
(80, 25, 'Con el alma y el corazón se puede ganar un partido', '2024-10-22 15:48:37'),
(81, 23, 'Tranquilos, ya veréis como algún día Messi hará un gol de cabeza. Y será un buen gol', '2024-10-22 15:48:37'),
(82, 23, 'La diferencia entre Messi y Haaland es que Erling necesita el equipo y Messi tiene la habilidad de hacerlo por sí solo', '2024-10-22 15:48:37'),
(83, 26, 'El fútbol no tiene lógica, solo hay que jugarlo', '2024-10-22 15:48:37'),
(84, 27, 'En el fútbol, como en la vida, hay que aprender de las derrotas', '2024-10-22 15:48:37'),
(85, 28, 'El fútbol es un deporte sencillo; ve al balón, hazlo rápido y sé eficaz', '2024-10-22 15:48:37'),
(86, 29, 'Si metes goles eres el más grande, si no, eres un gordo', '2024-10-22 15:48:37'),
(87, 28, 'Cruyff era mejor que yo, pero yo fui campeón del mundo', '2024-10-22 15:48:37'),
(88, 30, 'Si un futbolista se cree por encima del entrenador: adiós', '2024-10-22 15:48:37'),
(89, 31, 'Tratar bien al balón es tratar bien al aficionado', '2024-10-22 15:48:37'),
(90, 31, 'El fútbol es la cosa más importante de las cosas menos importantes', '2024-10-22 15:48:37'),
(91, 32, 'Como profesional busco acumular números y que luego los historiadores me pongan en el lugar que quieran', '2024-10-22 15:48:37'),
(92, 31, 'Encontrar para todo fracaso un chivo expiatorio: el secreto para ganar dinero con el fútbol, sin jugar al fútbol', '2024-10-22 15:48:37'),
(93, 32, 'Jugar en el Barça de Guardiola era mejor que el sexo', '2024-10-22 15:48:37'),
(94, 31, 'Juega como un ángel de barrios bajos, corre tras todo lo que se mueve, se desmarca hasta de sí mismo, pone cara de pocos amigos y solo descansa cuando ve cumplido su inmodesto objetivo : ganar el partido. Es Raúl', '2024-10-22 15:48:37'),
(95, 33, 'Ganar no es lo más importante, es lo único. Ser segundo no vale. ¿Vos sabes quién pisó América después de Colón? Yo no', '2024-10-22 15:48:37'),
(96, 31, 'El fútbol es un estado de ánimo', '2024-10-22 15:48:37'),
(97, 34, 'La garra es lo que diferencia a los campeones', '2024-10-22 15:48:37'),
(98, 33, '¿Qué me importa si el partido es más feo o más lindo? ¿A quién le importa? Lo que quiero es ganar', '2024-10-22 15:48:37'),
(99, 35, 'El éxito no es casualidad, es trabajo duro y disciplina', '2024-10-22 15:48:37'),
(100, 33, 'Jugar bien es ganar', '2024-10-22 15:48:37'),
(101, 36, 'El fútbol es poesía en movimiento, pero debe ser fuerte y decidido', '2024-10-22 15:48:37'),
(102, 37, 'En el fútbol, como en la vida, no todo es ganar, sino cómo juegas', '2024-10-22 15:48:37'),
(103, 38, 'El fútbol es alegría y debe jugarse con el corazón', '2024-10-22 15:48:37'),
(104, 39, 'La técnica no es todo, pero hace que el fútbol sea más hermoso', '2024-10-22 15:48:37'),
(105, 40, 'No los subestimamos. Simplemente eran mucho mejores de lo que pensábamos', '2024-10-22 15:48:37'),
(106, 41, 'En algunos partidos lo pienso e intento estar más tranquilo, pero no hay manera. Cuanto más tranquilo estoy, más incómodo me siento', '2024-10-22 15:48:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chitter_user`
--
ALTER TABLE `chitter_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`follower_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chitter_user`
--
ALTER TABLE `chitter_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `followers_ibfk_1` FOREIGN KEY (`follower_id`) REFERENCES `chitter_user` (`user_id`),
  ADD CONSTRAINT `followers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `chitter_user` (`user_id`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `chitter_user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
