-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 09, 2024 at 04:03 AM
-- Server version: 5.7.37
-- PHP Version: 8.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `idcategoria` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`idcategoria`, `nombre`, `descripcion`) VALUES
(2, 'Electrónica', 'Productos electrónicos y gadgets');

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `idcliente` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`idcliente`, `nombre`, `correo`, `direccion`, `telefono`) VALUES
(2, 'Juan Pérez actualizado', 'asdasdasdasd', 'Calle Nueva 456', '987654321');

-- --------------------------------------------------------

--
-- Table structure for table `ordenes`
--

CREATE TABLE `ordenes` (
  `idordenes` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `productos` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `idproducto` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idcliente`);

--
-- Indexes for table `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`idordenes`),
  ADD KEY `idcliente` (`idcliente`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `idcategoria` (`idcategoria`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `idordenes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ordenes`
--
ALTER TABLE `ordenes`
  ADD CONSTRAINT `idcliente` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `idcategoria` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
