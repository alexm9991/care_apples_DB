-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-09-2023 a las 17:52:50
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `location` varchar(30) NOT NULL,
  `address` varchar(55) NOT NULL,
  `latitude` double NOT NULL,
  `length` double NOT NULL,
  `municipalities_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `apples`
--

INSERT INTO `apples` (`id`, `code`, `name`, `location`, `address`, `latitude`, `length`, `municipalities_id`, `created_at`, `updated_at`) VALUES
(1, 123, 'Manzana 1', 'Comuna 1', 'Cra # 1 n1 - 1', 80, -20, 3, '2023-09-28 17:57:41', '2023-09-28 17:57:41'),
(2, 456, 'Manzana 2', 'Comuna 2', 'Cra # 2 n2 - 2', 56, -23, 5, '2023-09-28 17:58:17', '2023-09-28 17:58:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `horary` time NOT NULL,
  `women_id` bigint(20) UNSIGNED NOT NULL,
  `apples_id` bigint(20) UNSIGNED NOT NULL,
  `status_bookings_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `establishments`
--

CREATE TABLE `establishments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `manager` varchar(45) NOT NULL,
  `address` varchar(55) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `establishments`
--

INSERT INTO `establishments` (`id`, `code`, `name`, `manager`, `address`, `created_at`, `updated_at`) VALUES
(1, 123, 'Salomia', 'Jose Alvarez', 'Cra 52 # 4', '2023-09-28 18:31:12', '2023-09-28 18:40:35'),
(3, 456, 'Pondaje', 'Gerardo', 'Cra 56 #89', '2023-09-28 18:40:53', '2023-09-28 18:40:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `identification_types`
--

CREATE TABLE `identification_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `identification_types`
--

INSERT INTO `identification_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Cédula', '2023-09-28 04:51:44', '2023-09-28 04:51:44'),
(2, 'Tarjeta de identidad', '2023-09-28 04:51:44', '2023-09-28 04:51:44'),
(3, 'Cédula de extranjeria', '2023-09-28 04:51:44', '2023-09-28 04:51:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_09_27_033413_create_municipalities_table', 1),
(6, '2023_09_27_054532_create_apples_table', 1),
(7, '2023_09_27_125613_create_service__types_table', 1),
(8, '2023_09_27_130206_create_service__categories_table', 1),
(9, '2023_09_27_141009_create_service__type__category_table', 1),
(10, '2023_09_27_154404_create_identification_types_table', 1),
(11, '2023_09_27_162137_create_status_bookings_table', 1),
(12, '2023_09_27_163236_create_services_table', 1),
(13, '2023_09_27_165935_create_women_table', 1),
(14, '2023_09_27_170209_create_establishments_table', 1),
(15, '2023_09_27_194610_create_services_establishments_table', 1),
(16, '2023_09_27_202651_create_bookings_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipalities`
--

CREATE TABLE `municipalities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `municipalities`
--

INSERT INTO `municipalities` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Buenaventura', '2023-09-28 17:45:47', '2023-09-28 17:46:39'),
(3, 'Bogotá', '2023-09-28 17:45:53', '2023-09-28 17:46:32'),
(4, 'Medellin', '2023-09-28 17:47:03', '2023-09-28 17:47:03'),
(5, 'Barranquilla', '2023-09-28 17:47:11', '2023-09-28 17:47:11'),
(12, 'Cali', '2023-09-28 19:51:30', '2023-09-28 19:51:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` longtext NOT NULL,
  `service_categories_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `services`
--

INSERT INTO `services` (`id`, `code`, `name`, `description`, `service_categories_id`, `created_at`, `updated_at`) VALUES
(2, 123, 'Colegio', 'Colegio infantil', 2, NULL, NULL),
(3, 456, 'Universidad', 'Universidad Publica', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `services_establishments`
--

CREATE TABLE `services_establishments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `services_id` bigint(20) UNSIGNED NOT NULL,
  `establishments_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service__categories`
--

CREATE TABLE `service__categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `service__categories`
--

INSERT INTO `service__categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Salud', '2023-09-28 17:56:04', '2023-09-28 17:56:04'),
(2, 'Educación', '2023-09-28 17:56:09', '2023-09-28 17:56:09'),
(3, 'Tecnología', '2023-09-28 17:56:19', '2023-09-28 17:56:19'),
(4, 'Servicios Generales', '2023-09-28 17:56:25', '2023-09-28 17:56:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service__types`
--

CREATE TABLE `service__types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `service__types`
--

INSERT INTO `service__types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Publico', '2023-09-28 17:48:17', '2023-09-28 17:48:17'),
(2, 'Mixto', '2023-09-28 17:48:22', '2023-09-28 17:48:22'),
(3, 'Privado', '2023-09-28 17:55:22', '2023-09-28 17:55:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service__type__category`
--

CREATE TABLE `service__type__category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_type_id` bigint(20) UNSIGNED NOT NULL,
  `service_category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_bookings`
--

CREATE TABLE `status_bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `status_bookings`
--

INSERT INTO `status_bookings` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Pendiente', '2023-09-28 04:51:44', '2023-09-28 04:51:44'),
(2, 'Aceptado', '2023-09-28 04:51:44', '2023-09-28 04:51:44'),
(3, 'Rechazado', '2023-09-28 04:51:44', '2023-09-28 04:51:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `rol` varchar(8) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `rol`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'pepita', 'p@gmail.com', NULL, 'Admin', '$2y$10$zQDLmMx97VbQyTyhsUyQLeKB4B/SGW5Bgf.LT5Y2MVAy1QB6RFx22', NULL, '2023-09-28 04:51:45', '2023-09-28 04:51:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `women`
--

CREATE TABLE `women` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `identification_type_id` bigint(20) UNSIGNED NOT NULL,
  `services_id` bigint(20) UNSIGNED NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `identification_number` varchar(255) NOT NULL,
  `name` varchar(25) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `phone_number` varchar(11) NOT NULL,
  `city` varchar(45) NOT NULL,
  `address` varchar(55) NOT NULL,
  `occupation` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `apples`
--
ALTER TABLE `apples`
  ADD PRIMARY KEY (`id`),
  ADD KEY `apples_municipalities_id_foreign` (`municipalities_id`);

--
-- Indices de la tabla `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_women_id_foreign` (`women_id`),
  ADD KEY `bookings_apples_id_foreign` (`apples_id`),
  ADD KEY `bookings_status_bookings_id_foreign` (`status_bookings_id`);

--
-- Indices de la tabla `establishments`
--
ALTER TABLE `establishments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `identification_types`
--
ALTER TABLE `identification_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `municipalities`
--
ALTER TABLE `municipalities`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_service_categories_id_foreign` (`service_categories_id`);

--
-- Indices de la tabla `services_establishments`
--
ALTER TABLE `services_establishments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_establishments_services_id_foreign` (`services_id`),
  ADD KEY `services_establishments_establishments_id_foreign` (`establishments_id`);

--
-- Indices de la tabla `service__categories`
--
ALTER TABLE `service__categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `service__types`
--
ALTER TABLE `service__types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `service__type__category`
--
ALTER TABLE `service__type__category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service__type__category_service_type_id_foreign` (`service_type_id`),
  ADD KEY `service__type__category_service_category_id_foreign` (`service_category_id`);

--
-- Indices de la tabla `status_bookings`
--
ALTER TABLE `status_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `women`
--
ALTER TABLE `women`
  ADD PRIMARY KEY (`id`),
  ADD KEY `women_identification_type_id_foreign` (`identification_type_id`),
  ADD KEY `women_services_id_foreign` (`services_id`),
  ADD KEY `women_users_id_foreign` (`users_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `apples`
--
ALTER TABLE `apples`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `establishments`
--
ALTER TABLE `establishments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `identification_types`
--
ALTER TABLE `identification_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `municipalities`
--
ALTER TABLE `municipalities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `services_establishments`
--
ALTER TABLE `services_establishments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `service__categories`
--
ALTER TABLE `service__categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `service__types`
--
ALTER TABLE `service__types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `service__type__category`
--
ALTER TABLE `service__type__category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `status_bookings`
--
ALTER TABLE `status_bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `women`
--
ALTER TABLE `women`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `apples`
--
ALTER TABLE `apples`
  ADD CONSTRAINT `apples_municipalities_id_foreign` FOREIGN KEY (`municipalities_id`) REFERENCES `municipalities` (`id`);

--
-- Filtros para la tabla `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_apples_id_foreign` FOREIGN KEY (`apples_id`) REFERENCES `apples` (`id`),
  ADD CONSTRAINT `bookings_status_bookings_id_foreign` FOREIGN KEY (`status_bookings_id`) REFERENCES `status_bookings` (`id`),
  ADD CONSTRAINT `bookings_women_id_foreign` FOREIGN KEY (`women_id`) REFERENCES `women` (`id`);

--
-- Filtros para la tabla `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_service_categories_id_foreign` FOREIGN KEY (`service_categories_id`) REFERENCES `service__categories` (`id`);

--
-- Filtros para la tabla `services_establishments`
--
ALTER TABLE `services_establishments`
  ADD CONSTRAINT `services_establishments_establishments_id_foreign` FOREIGN KEY (`establishments_id`) REFERENCES `establishments` (`id`),
  ADD CONSTRAINT `services_establishments_services_id_foreign` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`);

--
-- Filtros para la tabla `service__type__category`
--
ALTER TABLE `service__type__category`
  ADD CONSTRAINT `service__type__category_service_category_id_foreign` FOREIGN KEY (`service_category_id`) REFERENCES `service__categories` (`id`),
  ADD CONSTRAINT `service__type__category_service_type_id_foreign` FOREIGN KEY (`service_type_id`) REFERENCES `service__types` (`id`);

--
-- Filtros para la tabla `women`
--
ALTER TABLE `women`
  ADD CONSTRAINT `women_identification_type_id_foreign` FOREIGN KEY (`identification_type_id`) REFERENCES `identification_types` (`id`),
  ADD CONSTRAINT `women_services_id_foreign` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `women_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
