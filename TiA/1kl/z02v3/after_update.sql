-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2021 at 01:00 PM
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
-- Database: `z02`
--
CREATE DATABASE IF NOT EXISTS `z02` DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci;
USE `z02`;

-- --------------------------------------------------------

--
-- Table structure for table `ksiazki`
--

DROP TABLE IF EXISTS `ksiazki`;
CREATE TABLE `ksiazki` (
  `Id_ksiazki` int(11) NOT NULL,
  `autor` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `wydawnictwo` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `rok_wydania` year(4) NOT NULL,
  `liczba_stron` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `ksiazki`
--

INSERT INTO `ksiazki` (`Id_ksiazki`, `autor`, `wydawnictwo`, `rok_wydania`, `liczba_stron`) VALUES
(1, 'Jerzy Grębosz', 'Helion', 2018, 1000),
(2, 'Filip Szumowski', 'brak', 2020, 320),
(3, 'Brandon Mull', 'WAB', 2020, 320);

-- --------------------------------------------------------

--
-- Table structure for table `uczniowie`
--

DROP TABLE IF EXISTS `uczniowie`;
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

-- --------------------------------------------------------

--
-- Table structure for table `wypozyczenia`
--

DROP TABLE IF EXISTS `wypozyczenia`;
CREATE TABLE `wypozyczenia` (
  `id_wyp` int(11) NOT NULL,
  `id_ksiazki` int(11) NOT NULL,
  `id_wypozyczajacego` int(11) NOT NULL,
  `data_wypozyczenia` datetime NOT NULL,
  `data_zwrotu` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `wypozyczenia`
--

INSERT INTO `wypozyczenia` (`id_wyp`, `id_ksiazki`, `id_wypozyczajacego`, `data_wypozyczenia`, `data_zwrotu`) VALUES
(1, 3, 3, '2021-01-05 09:35:13', '2021-01-28 09:35:13'),
(2, 2, 1, '2021-01-14 09:35:26', '2021-01-29 09:35:26'),
(3, 3, 1, '2021-01-25 09:35:26', '2021-01-30 09:35:26'),
(4, 3, 3, '2021-01-25 09:36:03', '2021-01-29 09:36:03'),
(5, 3, 2, '2021-01-27 09:36:03', '2021-01-29 09:36:03'),
(6, 3, 2, '2021-01-27 09:36:03', '2021-01-30 09:36:03'),
(7, 3, 2, '2021-01-25 09:39:49', '2021-01-28 09:39:49'),
(8, 1, 1, '2021-01-26 09:39:49', '2021-01-28 09:39:49'),
(9, 3, 1, '2021-01-25 09:40:20', '2021-01-30 09:40:20'),
(10, 3, 2, '2021-01-25 09:40:20', '2021-01-29 09:40:20'),
(11, 2, 2, '2021-01-26 09:40:20', '2021-01-30 09:40:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`Id_ksiazki`);

--
-- Indexes for table `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD PRIMARY KEY (`id_ucznia`);

--
-- Indexes for table `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  ADD PRIMARY KEY (`id_wyp`),
  ADD KEY `ksiazki` (`id_ksiazki`),
  ADD KEY `wypozyczajacy` (`id_wypozyczajacego`);

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
-- AUTO_INCREMENT for table `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  MODIFY `id_wyp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  ADD CONSTRAINT `ksiazki` FOREIGN KEY (`id_ksiazki`) REFERENCES `ksiazki` (`Id_ksiazki`),
  ADD CONSTRAINT `wypozyczajacy` FOREIGN KEY (`id_wypozyczajacego`) REFERENCES `uczniowie` (`id_ucznia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
