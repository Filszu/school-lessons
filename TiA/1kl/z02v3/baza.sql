-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2021 at 01:12 PM
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
-- Database: `z01`
--
CREATE DATABASE IF NOT EXISTS `z01` DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci;
USE `z01`;

-- --------------------------------------------------------

--
-- Table structure for table `ksiazki`
--

CREATE TABLE `ksiazki` (
  `Id_ksiazki` int(11) NOT NULL,
  `autor` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `wydawnictwo` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `rok_wydania` year(4) NOT NULL,
  `liczba_stron` int(11) NOT NULL,
  `id_wypozyczajacego` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `ksiazki`
--

INSERT INTO `ksiazki` (`Id_ksiazki`, `autor`, `wydawnictwo`, `rok_wydania`, `liczba_stron`, `id_wypozyczajacego`) VALUES
(1, 'Jerzy Grębosz', 'Helion', 2018, 1000, NULL),
(2, 'Filip Szumowski', 'brak', 2020, 320, NULL),
(3, 'Brandon Mull', 'WAB', 2020, 320, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `uczniowie`
--

CREATE TABLE `uczniowie` (
  `id_ucznia` int(11) NOT NULL,
  `nazwisko` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `imie` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `klasa` varchar(8) COLLATE utf8_polish_ci NOT NULL,
  `telefon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `uczniowie`
--

INSERT INTO `uczniowie` (`id_ucznia`, `nazwisko`, `imie`, `klasa`, `telefon`) VALUES
(1, 'Szumowski', 'Filip', '1td', 111111111),
(2, 'Walczak', 'Natan', '1td', 22222222),
(3, 'Nowak', 'Jan', '2tc', 333333333);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`Id_ksiazki`),
  ADD KEY `ksiazki` (`id_wypozyczajacego`);

--
-- Indexes for table `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD PRIMARY KEY (`id_ucznia`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ksiazki`
--
ALTER TABLE `ksiazki`
  MODIFY `Id_ksiazki` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `uczniowie`
--
ALTER TABLE `uczniowie`
  MODIFY `id_ucznia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD CONSTRAINT `ksiazki` FOREIGN KEY (`id_wypozyczajacego`) REFERENCES `uczniowie` (`id_ucznia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
