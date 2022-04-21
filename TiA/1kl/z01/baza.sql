-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2021 at 09:04 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

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
CREATE DATABASE IF NOT EXISTS `z01` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE `z01`;

-- --------------------------------------------------------

--
-- Table structure for table `ksiazki`
--

CREATE TABLE `ksiazki` (
  `Id_ksiazki` int(11) NOT NULL,
  `Autor` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `Wydawnictwo` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `Rok_wydania` year(4) NOT NULL,
  `Liczba_stron` int(11) NOT NULL,
  `Id_wypozyczajacego` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `ksiazki`
--

INSERT INTO `ksiazki` (`Id_ksiazki`, `Autor`, `Wydawnictwo`, `Rok_wydania`, `Liczba_stron`, `Id_wypozyczajacego`) VALUES
(1, 'Jerzy Grębosz', 'Helion', 2018, 1000, 4),
(2, 'Filip Szumowski', 'brak', 2020, 320, 2),
(3, 'Brandon Mull', 'WAB', 2020, 320, 4),
(4, 'John Doe', 'WB', 2020, 20, 2);

-- --------------------------------------------------------

--
-- Table structure for table `uczniowie`
--

CREATE TABLE `uczniowie` (
  `Id_ucznia` int(11) NOT NULL,
  `Nazwisko` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `Imie` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `Klasa` varchar(8) COLLATE utf8_polish_ci NOT NULL,
  `Telefon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `uczniowie`
--

INSERT INTO `uczniowie` (`Id_ucznia`, `Nazwisko`, `Imie`, `Klasa`, `Telefon`) VALUES
(1, 'Szumowski', 'Filip', '1td', 111111111),
(2, 'Walczak', 'Natan', '1td', 22222222),
(3, 'Nowak', 'Jan', '2tc', 333333333),
(4, 'PAWEŁ', 'Simon', '1th', 111111111);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`Id_ksiazki`),
  ADD KEY `ksiazki` (`Id_wypozyczajacego`);

--
-- Indexes for table `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD PRIMARY KEY (`Id_ucznia`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ksiazki`
--
ALTER TABLE `ksiazki`
  MODIFY `Id_ksiazki` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `uczniowie`
--
ALTER TABLE `uczniowie`
  MODIFY `Id_ucznia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD CONSTRAINT `ksiazki` FOREIGN KEY (`Id_wypozyczajacego`) REFERENCES `uczniowie` (`Id_ucznia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
