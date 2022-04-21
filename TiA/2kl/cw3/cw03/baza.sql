-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 12 Sty 2022, 12:07
-- Wersja serwera: 10.4.19-MariaDB
-- Wersja PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `cw03`
--
CREATE DATABASE IF NOT EXISTS `cw03` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE `cw03`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki`
--

CREATE TABLE `ksiazki` (
  `Id_ksiazki` int(11) NOT NULL,
  `Autor` varchar(120) COLLATE utf8mb4_polish_ci NOT NULL,
  `Wydawnictwo` varchar(120) COLLATE utf8mb4_polish_ci NOT NULL,
  `Rok_wydania` year(4) NOT NULL,
  `Liczba_stron` int(5) NOT NULL,
  `Id_wypozycajacego` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `ksiazki`
--

INSERT INTO `ksiazki` (`Id_ksiazki`, `Autor`, `Wydawnictwo`, `Rok_wydania`, `Liczba_stron`, `Id_wypozycajacego`) VALUES
(1, 'Filip Szu', 'FilipLand', 2015, 127, 5),
(3, 'Elektron Filip', 'ojek', 2137, 1252, 7),
(4, 'Filip Zeus', 'Symfonia', 2020, 50255, 4),
(5, 'Filip && Filip', 'ojek', 2120, 1252, 7),
(6, 'Szumowski Filip', 'Opus magnum', 2000, 998, 3),
(7, 'Filip - Filszu', 'YT masters wydawnictwo', 2030, 254, 5),
(8, 'Karol i Filip', 'magnificent', 1998, 998, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczniowie`
--

CREATE TABLE `uczniowie` (
  `Id_ucznia` int(11) NOT NULL,
  `Nazwisko` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL,
  `Imie` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL,
  `Klasa` char(3) COLLATE utf8mb4_polish_ci NOT NULL,
  `Telefon` char(15) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `uczniowie`
--

INSERT INTO `uczniowie` (`Id_ucznia`, `Nazwisko`, `Imie`, `Klasa`, `Telefon`) VALUES
(1, 'Szumowski', 'Filip', '2td', '+48111111111'),
(2, 'Wilk', 'Nataniel', '2td', '048121212121'),
(3, 'szton', 'Tomson', '2td', '111114111'),
(4, 'Szaplica', 'Pawle', '2td', '22545455445'),
(5, 'IRwydowski', 'Irwyd', '2td', '666666666'),
(6, 'Playete', 'alexeds', '2td', '000000000'),
(7, 'Zugeszums', 'Mark', '2td', '888888888');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`Id_ksiazki`),
  ADD KEY `Id_wypozycajacego` (`Id_wypozycajacego`);

--
-- Indeksy dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD PRIMARY KEY (`Id_ucznia`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  MODIFY `Id_ksiazki` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  MODIFY `Id_ucznia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD CONSTRAINT `ksiazki_ibfk_1` FOREIGN KEY (`Id_wypozycajacego`) REFERENCES `uczniowie` (`Id_ucznia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
