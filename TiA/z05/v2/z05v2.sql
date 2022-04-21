-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2021 at 03:29 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `z05v2`
--
CREATE DATABASE IF NOT EXISTS `z05v2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE `z05v2`;

-- --------------------------------------------------------

--
-- Table structure for table `studenci`
--

CREATE TABLE `studenci` (
  `id_studenta` int(7) NOT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `imie` varchar(30) DEFAULT NULL,
  `kraj` varchar(100) NOT NULL DEFAULT 'Polska'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `studenci`
--

INSERT INTO `studenci` (`id_studenta`, `nazwisko`, `imie`, `kraj`) VALUES
(1, 'Nowak', 'Jan', 'Polska'),
(2, 'Szumowski', 'Filip', 'Polska'),
(3, 'Skrzypiec', 'Adam', 'Polska'),
(4, 'Martynowicz', 'Kasia', 'Polska');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `studenci`
--
ALTER TABLE `studenci`
  ADD PRIMARY KEY (`id_studenta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `studenci`
--
ALTER TABLE `studenci`
  MODIFY `id_studenta` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
