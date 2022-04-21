-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2021 at 08:50 AM
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
-- Database: `z01c`
--

-- --------------------------------------------------------

--
-- Table structure for table `nauczyciele`
--

CREATE TABLE `nauczyciele` (
  `NauczycielID` int(11) NOT NULL,
  `Nazwisko_Imie` varchar(150) COLLATE utf8mb4_polish_ci NOT NULL,
  `Wyksztalcenie` text COLLATE utf8mb4_polish_ci NOT NULL,
  `StazPracy` tinyint(4) NOT NULL,
  `Telefon` varchar(25) COLLATE utf8mb4_polish_ci NOT NULL,
  `Mail` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `nauczyciele`
--

INSERT INTO `nauczyciele` (`NauczycielID`, `Nazwisko_Imie`, `Wyksztalcenie`, `StazPracy`, `Telefon`, `Mail`) VALUES
(1, 'Renata Prońko', 'magister', 20, '+48-777 777-777', 'rPr@zseis.pl'),
(2, 'John DOE', 'magister', 21, '+48 888-888-888', 'rPrsss@zseis.pl'),
(3, 'Beata Kozidrak', 'magister', 5, '48 333-333-333', 'fdf@zseis.com');

-- --------------------------------------------------------

--
-- Table structure for table `oceny`
--

CREATE TABLE `oceny` (
  `OcenaId` int(11) NOT NULL,
  `Uczen_id` int(11) NOT NULL,
  `przedmiot_id` int(11) NOT NULL,
  `nauczyciel_id` int(11) NOT NULL,
  `ocena_def_id` int(11) NOT NULL,
  `data` date NOT NULL,
  `godzina` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `oceny`
--

INSERT INTO `oceny` (`OcenaId`, `Uczen_id`, `przedmiot_id`, `nauczyciel_id`, `ocena_def_id`, `data`, `godzina`) VALUES
(1, 1, 3, 2, 2, '2021-03-31', '08:30:00'),
(2, 1, 2, 3, 4, '2021-03-17', '10:00:00'),
(3, 2, 2, 1, 3, '2021-03-24', '09:00:00'),
(4, 2, 3, 2, 2, '2021-03-31', '08:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `oceny_dfn`
--

CREATE TABLE `oceny_dfn` (
  `Ocena_def_id` int(11) NOT NULL,
  `NazwaPelna` varchar(30) COLLATE utf8mb4_polish_ci NOT NULL,
  `nazwa_skrot` varchar(6) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `oceny_dfn`
--

INSERT INTO `oceny_dfn` (`Ocena_def_id`, `NazwaPelna`, `nazwa_skrot`) VALUES
(1, 'sprawdzian', 'spr'),
(2, 'kartkówka', 'kart'),
(3, 'zadanie', 'zd'),
(4, 'karta pracy', 'kp');

-- --------------------------------------------------------

--
-- Table structure for table `przedmioty`
--

CREATE TABLE `przedmioty` (
  `przedmiot_Id` int(11) NOT NULL,
  `pelna_nazwa` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL,
  `nazwa_skrot` varchar(5) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `przedmioty`
--

INSERT INTO `przedmioty` (`przedmiot_Id`, `pelna_nazwa`, `nazwa_skrot`) VALUES
(1, 'Język Polski ', 'JP'),
(2, 'Matematyka', 'mat'),
(3, 'Fizyka', 'fiz');

-- --------------------------------------------------------

--
-- Table structure for table `uczniowie`
--

CREATE TABLE `uczniowie` (
  `Uczeń ID` int(11) NOT NULL,
  `NazwiskoImie` varchar(120) COLLATE utf8mb4_polish_ci NOT NULL,
  `DataUr` datetime NOT NULL,
  `KOD` varchar(15) COLLATE utf8mb4_polish_ci NOT NULL,
  `MiejsceUr` varchar(300) COLLATE utf8mb4_polish_ci NOT NULL,
  `Miejscowość` varchar(300) COLLATE utf8mb4_polish_ci NOT NULL,
  `UlicaNr` varchar(150) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `uczniowie`
--

INSERT INTO `uczniowie` (`Uczeń ID`, `NazwiskoImie`, `DataUr`, `KOD`, `MiejsceUr`, `Miejscowość`, `UlicaNr`) VALUES
(1, 'Jan Nowak', '2021-03-01 08:41:23', '65-551', 'Zielona', 'Góra', 'Wiśniowa 1'),
(2, 'Paweł Kała', '2021-03-02 08:41:23', '65-001', 'łąka', 'Zielona Góra', 'niebieska 6'),
(3, 'Monika Szara', '2021-03-16 08:43:21', '65-007', 'Jelenia Góra', 'Jelenia Góra', 'zielona 33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nauczyciele`
--
ALTER TABLE `nauczyciele`
  ADD PRIMARY KEY (`NauczycielID`);

--
-- Indexes for table `oceny`
--
ALTER TABLE `oceny`
  ADD PRIMARY KEY (`OcenaId`),
  ADD KEY `Uczen_id` (`Uczen_id`),
  ADD KEY `przedmiot_id` (`przedmiot_id`),
  ADD KEY `nauczyciel_id` (`nauczyciel_id`),
  ADD KEY `ocena_def_id` (`ocena_def_id`);

--
-- Indexes for table `oceny_dfn`
--
ALTER TABLE `oceny_dfn`
  ADD PRIMARY KEY (`Ocena_def_id`);

--
-- Indexes for table `przedmioty`
--
ALTER TABLE `przedmioty`
  ADD PRIMARY KEY (`przedmiot_Id`);

--
-- Indexes for table `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD PRIMARY KEY (`Uczeń ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nauczyciele`
--
ALTER TABLE `nauczyciele`
  MODIFY `NauczycielID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oceny`
--
ALTER TABLE `oceny`
  MODIFY `OcenaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oceny_dfn`
--
ALTER TABLE `oceny_dfn`
  MODIFY `Ocena_def_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `przedmioty`
--
ALTER TABLE `przedmioty`
  MODIFY `przedmiot_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `uczniowie`
--
ALTER TABLE `uczniowie`
  MODIFY `Uczeń ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `oceny`
--
ALTER TABLE `oceny`
  ADD CONSTRAINT `oceny_ibfk_1` FOREIGN KEY (`Uczen_id`) REFERENCES `uczniowie` (`Uczeń ID`),
  ADD CONSTRAINT `oceny_ibfk_2` FOREIGN KEY (`przedmiot_id`) REFERENCES `przedmioty` (`przedmiot_Id`),
  ADD CONSTRAINT `oceny_ibfk_3` FOREIGN KEY (`nauczyciel_id`) REFERENCES `nauczyciele` (`NauczycielID`),
  ADD CONSTRAINT `oceny_ibfk_4` FOREIGN KEY (`ocena_def_id`) REFERENCES `oceny_dfn` (`Ocena_def_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
