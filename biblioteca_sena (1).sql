-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2026 a las 03:34:09
-- Versión del servidor: 10.11.16-MariaDB
-- Versión de PHP: 8.3.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca_sena`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_biblioteca`
--

CREATE TABLE `tb_biblioteca` (
  `id_biblioteca` int(11) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `turno` enum('Mañana','Tarde','Noche') NOT NULL,
  `correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_biblioteca`
--

INSERT INTO `tb_biblioteca` (`id_biblioteca`, `nombre_completo`, `turno`, `correo`) VALUES
(1, 'Ana María Martínez', 'Mañana', 'ammartinez@sena.edu.co'),
(2, 'Pedro Pablo García', 'Tarde', 'ppgarcia@sena.edu.co'),
(3, 'Luisa Fernanda Torres', 'Noche', 'lftorres@sena.edu.co'),
(4, 'Carlos Alberto Silva', 'Mañana', 'casilva@sena.edu.co'),
(5, 'Marta Lucía Rojas', 'Tarde', 'mlrojas@sena.edu.co'),
(6, 'Jorge Enrique Ortiz', 'Noche', 'jeortiz@sena.edu.co'),
(7, 'Sandra Milena Beltrán', 'Mañana', 'smbeltran@sena.edu.co'),
(8, 'Diego Armando Pérez', 'Tarde', 'daperez@sena.edu.co'),
(9, 'Helena Beatriz Mora', 'Mañana', 'hbmora@sena.edu.co'),
(10, 'Ricardo José Sánchez', 'Noche', 'rjsanchez@sena.edu.co');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_categorias`
--

CREATE TABLE `tb_categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(50) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `prestamo_ubi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_categorias`
--

INSERT INTO `tb_categorias` (`id_categoria`, `nombre_categoria`, `descripcion`, `prestamo_ubi`) VALUES
(1, 'Bases de Datos', 'Diseño relacional, SQL y administración de BD', 'Pasillo A - Estante 1'),
(2, 'Programación', 'Lenguajes de programación, algoritmos y lógica', 'Pasillo A - Estante 2'),
(3, 'Redes y Telecomunicaciones', 'Infraestructura de red, protocolos y seguridad', 'Pasillo B - Estante 1'),
(4, 'Literatura Universal', 'Novelas clásicas y contemporáneas', 'Pasillo C - Estante 1'),
(5, 'Matemáticas Aplicadas', 'Cálculo, álgebra lineal y estadística', 'Pasillo B - Estante 2'),
(6, 'Ingeniería de Software', 'Metodologías ágiles, análisis y diseño', 'Pasillo A - Estante 3'),
(7, 'Sistemas Operativos', 'Administración Linux, Windows Server y arquitectura', 'Pasillo B - Estante 3'),
(8, 'Seguridad Informática', 'Ciberseguridad, criptografía y auditoría', 'Pasillo A - Estante 4'),
(9, 'Emprendimiento y Gestión', 'Administración de proyectos y planes de negocio', 'Pasillo D - Estante 1'),
(10, 'Inglés Técnico', 'Gramática y vocabulario técnico para tecnología', 'Pasillo D - Estante 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_libros`
--

CREATE TABLE `tb_libros` (
  `id_libro` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `editorial` varchar(80) DEFAULT NULL,
  `ejemplares` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_libros`
--

INSERT INTO `tb_libros` (`id_libro`, `id_categoria`, `titulo`, `autor`, `editorial`, `ejemplares`) VALUES
(1, 1, 'Fundamentos de Bases de Datos', 'Abraham Silberschatz', 'McGraw-Hill', 4),
(2, 1, 'Introducción a los Sistemas de Bases de Datos', 'C.J. Date', 'Pearson', 3),
(3, 2, 'Clean Code', 'Robert C. Martin', 'Prentice Hall', 5),
(4, 2, 'Python Crash Course', 'Eric Matthes', 'Anaya Multimedia', 3),
(5, 3, 'Redes de Computadoras', 'Andrew S. Tanenbaum', 'Pearson', 2),
(6, 4, 'Cien Años de Soledad', 'Gabriel García Márquez', 'Debolsillo', 6),
(7, 5, 'Cálculo de una Variable', 'James Stewart', 'Cengage', 4),
(8, 6, 'Ingeniería de Software', 'Ian Sommerville', 'Pearson', 3),
(9, 7, 'Sistemas Operativos Modernos', 'Andrew S. Tanenbaum', 'Pearson', 2),
(10, 8, 'Hacking Ético y Ciberseguridad', 'Carlos Tori', 'Marcombo', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_multas_biblioteca`
--

CREATE TABLE `tb_multas_biblioteca` (
  `id_multa` int(11) NOT NULL,
  `id_prestamo` int(11) NOT NULL,
  `motivo` varchar(200) NOT NULL,
  `valor_multa` float NOT NULL DEFAULT 0,
  `estado` enum('Pendiente','Pagada') NOT NULL DEFAULT 'Pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_multas_biblioteca`
--

INSERT INTO `tb_multas_biblioteca` (`id_multa`, `id_prestamo`, `motivo`, `valor_multa`, `estado`) VALUES
(1, 2, 'Entrega con 2 días de retraso', 4000, 'Pagada'),
(2, 3, 'Préstamo vencido sin devolución (7 días)', 14000, 'Pendiente'),
(3, 5, 'Entrega tardía de novela literaria', 2000, 'Pendiente'),
(4, 1, 'Rayones leves en contraportada', 3000, 'Pagada'),
(5, 4, 'Separador extraviado', 1500, 'Pagada'),
(6, 3, 'Notificación de mora administrativa', 5000, 'Pendiente'),
(7, 5, 'Recargo por incumplimiento de fecha', 3500, 'Pendiente'),
(8, 2, 'Mora acumulada fin de semana', 2000, 'Pagada'),
(9, 3, 'Bloqueo preventivo por retraso mayor a 5 días', 6000, 'Pendiente'),
(10, 5, 'Segunda notificación de retraso', 2500, 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_prestamo_libros`
--

CREATE TABLE `tb_prestamo_libros` (
  `id_prestamo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_biblioteca` int(11) NOT NULL,
  `id_libro` int(11) NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `fecha_hora_entrega` datetime NOT NULL,
  `fecha_hora_devolucion` datetime DEFAULT NULL,
  `estado` enum('Activo','Devuelto','Vencido') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_prestamo_libros`
--

INSERT INTO `tb_prestamo_libros` (`id_prestamo`, `id_usuario`, `id_biblioteca`, `id_libro`, `fecha_prestamo`, `fecha_hora_entrega`, `fecha_hora_devolucion`, `estado`) VALUES
(1, 1, 1, 1, '2026-11-10', '2026-11-10 08:30:00', '2026-11-14 10:00:00', 'Devuelto'),
(2, 2, 2, 3, '2026-11-11', '2026-11-11 14:15:00', '2026-11-18 16:00:00', 'Devuelto'),
(3, 3, 1, 2, '2026-11-12', '2026-11-12 09:00:00', NULL, 'Vencido'),
(4, 4, 3, 4, '2026-11-15', '2026-11-15 18:20:00', '2026-11-20 19:00:00', 'Devuelto'),
(5, 5, 2, 6, '2026-11-18', '2026-11-18 15:00:00', NULL, 'Vencido'),
(6, 6, 1, 5, '2026-11-19', '2026-11-19 10:10:00', NULL, 'Activo'),
(7, 7, 4, 8, '2026-11-20', '2026-11-20 11:00:00', NULL, 'Activo'),
(8, 8, 5, 7, '2026-11-21', '2026-11-21 16:30:00', NULL, 'Activo'),
(9, 9, 2, 9, '2026-11-22', '2026-11-22 14:45:00', NULL, 'Activo'),
(10, 10, 1, 10, '2026-11-23', '2026-11-23 09:30:00', NULL, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `id_usuario` int(11) NOT NULL,
  `documento` varchar(20) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `tipo_usuario` enum('Aprendiz','Instructor','Administrativo') NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_usuario`
--

INSERT INTO `tb_usuario` (`id_usuario`, `documento`, `nombre_completo`, `tipo_usuario`, `correo`, `telefono`) VALUES
(1, '1001234501', 'Cristian Colorado', 'Aprendiz', 'ccolorado@sena.edu.co', '3101112233'),
(2, '1001234502', 'Felipe Méndez', 'Aprendiz', 'fmendez@sena.edu.co', '3112223344'),
(3, '1001234503', 'Julián Reyes', 'Aprendiz', 'jreyes@sena.edu.co', '3123334455'),
(4, '1001234504', 'Daniela Rodríguez', 'Aprendiz', 'drodriguez@sena.edu.co', '3134445566'),
(5, '1001234505', 'Juan Vargas', 'Aprendiz', 'jvargas@sena.edu.co', '3145556677'),
(6, '79123456', 'Oscar Ramírez', 'Instructor', 'oramirez@sena.edu.co', '3156667788'),
(7, '52987654', 'María Fernanda Gómez', 'Instructor', 'mfgomez@sena.edu.co', '3167778899'),
(8, '1001234508', 'Laura Sofía Castro', 'Aprendiz', 'lscastro@sena.edu.co', '3178889900'),
(9, '1001234509', 'Andrés Felipe Díaz', 'Aprendiz', 'afdiaz@sena.edu.co', '3189990011'),
(10, '51456789', 'Claudia Patricia Ruiz', 'Administrativo', 'cpruiz@sena.edu.co', '3190001122');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_biblioteca`
--
ALTER TABLE `tb_biblioteca`
  ADD PRIMARY KEY (`id_biblioteca`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `tb_categorias`
--
ALTER TABLE `tb_categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nombre_categoria` (`nombre_categoria`);

--
-- Indices de la tabla `tb_libros`
--
ALTER TABLE `tb_libros`
  ADD PRIMARY KEY (`id_libro`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `tb_multas_biblioteca`
--
ALTER TABLE `tb_multas_biblioteca`
  ADD PRIMARY KEY (`id_multa`),
  ADD KEY `id_prestamo` (`id_prestamo`);

--
-- Indices de la tabla `tb_prestamo_libros`
--
ALTER TABLE `tb_prestamo_libros`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_biblioteca` (`id_biblioteca`),
  ADD KEY `id_libro` (`id_libro`);

--
-- Indices de la tabla `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `documento` (`documento`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_biblioteca`
--
ALTER TABLE `tb_biblioteca`
  MODIFY `id_biblioteca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tb_categorias`
--
ALTER TABLE `tb_categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tb_libros`
--
ALTER TABLE `tb_libros`
  MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tb_multas_biblioteca`
--
ALTER TABLE `tb_multas_biblioteca`
  MODIFY `id_multa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tb_prestamo_libros`
--
ALTER TABLE `tb_prestamo_libros`
  MODIFY `id_prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_libros`
--
ALTER TABLE `tb_libros`
  ADD CONSTRAINT `tb_libros_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `tb_categorias` (`id_categoria`);

--
-- Filtros para la tabla `tb_multas_biblioteca`
--
ALTER TABLE `tb_multas_biblioteca`
  ADD CONSTRAINT `tb_multas_biblioteca_ibfk_1` FOREIGN KEY (`id_prestamo`) REFERENCES `tb_prestamo_libros` (`id_prestamo`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tb_prestamo_libros`
--
ALTER TABLE `tb_prestamo_libros`
  ADD CONSTRAINT `tb_prestamo_libros_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`),
  ADD CONSTRAINT `tb_prestamo_libros_ibfk_2` FOREIGN KEY (`id_biblioteca`) REFERENCES `tb_biblioteca` (`id_biblioteca`),
  ADD CONSTRAINT `tb_prestamo_libros_ibfk_3` FOREIGN KEY (`id_libro`) REFERENCES `tb_libros` (`id_libro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
