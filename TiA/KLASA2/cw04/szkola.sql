-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2022 at 09:57 PM
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
-- Database: `szkola`
--
CREATE DATABASE IF NOT EXISTS `szkola` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE `szkola`;

-- --------------------------------------------------------

--
-- Table structure for table `oceny`
--

CREATE TABLE `oceny` (
  `id_oceny` int(11) NOT NULL,
  `id_ucznia` int(11) NOT NULL,
  `id_przedmiotu` int(11) NOT NULL,
  `ocena` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `oceny`
--

INSERT INTO `oceny` (`id_oceny`, `id_ucznia`, `id_przedmiotu`, `ocena`) VALUES
(1, 1, 5, 1),
(2, 5, 3, 2),
(3, 1, 5, 1),
(4, 2, 2, 5),
(5, 2, 4, 6),
(6, 4, 2, 3),
(7, 3, 3, 2),
(8, 4, 4, 3),
(9, 2, 2, 4),
(10, 1, 4, 5),
(11, 4, 3, 6),
(12, 1, 3, 1),
(13, 1, 3, 1),
(14, 4, 3, 2),
(15, 4, 3, 6),
(16, 3, 4, 6),
(17, 3, 1, 3),
(18, 5, 4, 4),
(19, 5, 2, 4),
(20, 4, 1, 4),
(21, 1, 2, 5),
(22, 2, 3, 5),
(23, 4, 2, 5),
(24, 2, 3, 5),
(25, 3, 4, 5),
(26, 6, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `przedmiot`
--

CREATE TABLE `przedmiot` (
  `id_przedmiotu` int(11) NOT NULL,
  `nazwa_przedmiotu` varchar(100) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `przedmiot`
--

INSERT INTO `przedmiot` (`id_przedmiotu`, `nazwa_przedmiotu`) VALUES
(1, ' matematyka'),
(2, 'fizyka'),
(3, 'chemia'),
(4, 'geografia'),
(5, 'biologia');

-- --------------------------------------------------------

--
-- Table structure for table `uczen`
--

CREATE TABLE `uczen` (
  `id_ucznia` int(11) NOT NULL,
  `imie` varchar(25) COLLATE utf8mb4_polish_ci NOT NULL,
  `nazwisko` varchar(40) COLLATE utf8mb4_polish_ci NOT NULL,
  `data_urodzenia` date NOT NULL,
  `miejsce_ur` varchar(120) COLLATE utf8mb4_polish_ci NOT NULL,
  `plec` char(3) COLLATE utf8mb4_polish_ci NOT NULL,
  `klasa` varchar(5) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `uczen`
--

INSERT INTO `uczen` (`id_ucznia`, `imie`, `nazwisko`, `data_urodzenia`, `miejsce_ur`, `plec`, `klasa`) VALUES
(1, 'Alex', 'Pier', '2021-10-01', 'Zielona Góra', 'm', '1d'),
(2, 'IrWYD', 'Wydra', '2021-10-05', 'Honululu', 'm', '2c'),
(3, 'Mark', 'DarkW', '0000-00-00', 'Zielona Góra', 'm', '2c'),
(4, 'Kacp', 'Oci', '2021-10-05', 'Zielona Góra', 'm', '1t'),
(5, 'Arleta', 'Zielona', '2021-10-13', 'Zielona Góra 13', 'k', '4d'),
(6, 'Pweweł', 'NowakA', '2021-10-11', 'zg', 'k', '1d');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oceny`
--
ALTER TABLE `oceny`
  ADD PRIMARY KEY (`id_oceny`),
  ADD KEY `id_przedmiotu` (`id_przedmiotu`),
  ADD KEY `id_ucznia` (`id_ucznia`);

--
-- Indexes for table `przedmiot`
--
ALTER TABLE `przedmiot`
  ADD PRIMARY KEY (`id_przedmiotu`);

--
-- Indexes for table `uczen`
--
ALTER TABLE `uczen`
  ADD PRIMARY KEY (`id_ucznia`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oceny`
--
ALTER TABLE `oceny`
  MODIFY `id_oceny` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `przedmiot`
--
ALTER TABLE `przedmiot`
  MODIFY `id_przedmiotu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `uczen`
--
ALTER TABLE `uczen`
  MODIFY `id_ucznia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `oceny`
--
ALTER TABLE `oceny`
  ADD CONSTRAINT `oceny_ibfk_1` FOREIGN KEY (`id_przedmiotu`) REFERENCES `przedmiot` (`id_przedmiotu`),
  ADD CONSTRAINT `oceny_ibfk_2` FOREIGN KEY (`id_ucznia`) REFERENCES `uczen` (`id_ucznia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
