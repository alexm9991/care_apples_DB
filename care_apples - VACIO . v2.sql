-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-09-2023 a las 21:53:05
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `care_apples`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apples`
--

CREATE TABLE `apples` (
  `id` int(11) NOT NULL,
  `code` int(3) NOT NULL,
  `name` varchar(30) NOT NULL,
  `location` varchar(30) NOT NULL,
  `address` varchar(55) NOT NULL,
  `coordinates` geometry NOT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp(),
  `municipalities_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `horary` time NOT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp(),
  `women_id` int(11) NOT NULL,
  `apples_id` int(11) NOT NULL,
  `status_bookings_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `establishments`
--

CREATE TABLE `establishments` (
  `id` int(11) NOT NULL,
  `code` int(3) NOT NULL,
  `name` varchar(30) NOT NULL,
  `manager` varchar(45) NOT NULL,
  `address` varchar(55) NOT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp(),
  `services_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `identification_type`
--

CREATE TABLE `identification_type` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipalities`
--

CREATE TABLE `municipalities` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `code` int(3) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` longtext NOT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp(),
  `service_categories_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `services_apple`
--

CREATE TABLE `services_apple` (
  `id` int(11) NOT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp(),
  `services_id` int(11) NOT NULL,
  `apples_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service_categories`
--

CREATE TABLE `service_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service_type`
--

CREATE TABLE `service_type` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service_type_category`
--

CREATE TABLE `service_type_category` (
  `id` int(11) NOT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp(),
  `service_categories_id` int(11) NOT NULL,
  `service_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_bookings`
--

CREATE TABLE `status_bookings` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(20) NOT NULL,
  `role` varchar(8) NOT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `women`
--

CREATE TABLE `women` (
  `id` int(11) NOT NULL,
  `identification_type_id` int(11) NOT NULL,
  `identification_number` varchar(12) NOT NULL,
  `name` varchar(25) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `phone_number` varchar(11) NOT NULL,
  `city` varchar(45) NOT NULL,
  `address` varchar(55) NOT NULL,
  `occupation` varchar(45) NOT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp(),
  `services_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `apples`
--
ALTER TABLE `apples`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_apples_municipalities1_idx` (`municipalities_id`);

--
-- Indices de la tabla `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bookings_women1_idx` (`women_id`),
  ADD KEY `fk_bookings_apples1_idx` (`apples_id`),
  ADD KEY `fk_bookings_status_bookings1_idx` (`status_bookings_id`);

--
-- Indices de la tabla `establishments`
--
ALTER TABLE `establishments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_establishments_services1_idx` (`services_id`);

--
-- Indices de la tabla `identification_type`
--
ALTER TABLE `identification_type`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `municipalities`
--
ALTER TABLE `municipalities`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_services_service_categories1_idx` (`service_categories_id`);

--
-- Indices de la tabla `services_apple`
--
ALTER TABLE `services_apple`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_services_apple_services1_idx` (`services_id`),
  ADD KEY `fk_services_apple_apples1_idx` (`apples_id`);

--
-- Indices de la tabla `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `service_type`
--
ALTER TABLE `service_type`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `service_type_category`
--
ALTER TABLE `service_type_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_service_type_category_service_categories1_idx` (`service_categories_id`),
  ADD KEY `fk_service_type_category_service_type1_idx` (`service_type_id`);

--
-- Indices de la tabla `status_bookings`
--
ALTER TABLE `status_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `women`
--
ALTER TABLE `women`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_women_services1_idx` (`services_id`),
  ADD KEY `fk_women_identification_type1_idx` (`identification_type_id`),
  ADD KEY `fk_women_users1_idx` (`users_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `apples`
--
ALTER TABLE `apples`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `establishments`
--
ALTER TABLE `establishments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `identification_type`
--
ALTER TABLE `identification_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `municipalities`
--
ALTER TABLE `municipalities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `services_apple`
--
ALTER TABLE `services_apple`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `service_type`
--
ALTER TABLE `service_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `service_type_category`
--
ALTER TABLE `service_type_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `status_bookings`
--
ALTER TABLE `status_bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `women`
--
ALTER TABLE `women`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `apples`
--
ALTER TABLE `apples`
  ADD CONSTRAINT `fk_apples_municipalities1` FOREIGN KEY (`municipalities_id`) REFERENCES `municipalities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `fk_bookings_apples1` FOREIGN KEY (`apples_id`) REFERENCES `apples` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bookings_status_bookings1` FOREIGN KEY (`status_bookings_id`) REFERENCES `status_bookings` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bookings_women1` FOREIGN KEY (`women_id`) REFERENCES `women` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `establishments`
--
ALTER TABLE `establishments`
  ADD CONSTRAINT `fk_establishments_services1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `fk_services_service_categories1` FOREIGN KEY (`service_categories_id`) REFERENCES `service_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `services_apple`
--
ALTER TABLE `services_apple`
  ADD CONSTRAINT `fk_services_apple_apples1` FOREIGN KEY (`apples_id`) REFERENCES `apples` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_services_apple_services1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `service_type_category`
--
ALTER TABLE `service_type_category`
  ADD CONSTRAINT `fk_service_type_category_service_categories1` FOREIGN KEY (`service_categories_id`) REFERENCES `service_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_service_type_category_service_type1` FOREIGN KEY (`service_type_id`) REFERENCES `service_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `women`
--
ALTER TABLE `women`
  ADD CONSTRAINT `fk_women_identification_type1` FOREIGN KEY (`identification_type_id`) REFERENCES `identification_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_women_services1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_women_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
