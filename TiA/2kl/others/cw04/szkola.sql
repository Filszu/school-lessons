-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 12 Paź 2021, 18:33
-- Wersja serwera: 10.4.21-MariaDB
-- Wersja PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `szkola`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oceny`
--

CREATE TABLE `oceny` (
  `id_oceny` int(11) NOT NULL,
  `id_ucznia` int(11) NOT NULL,
  `id_przedmiotu` int(11) NOT NULL,
  `ocena` varchar(2) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `oceny`
--

INSERT INTO `oceny` (`id_oceny`, `id_ucznia`, `id_przedmiotu`, `ocena`) VALUES
(1, 1, 1, '2'),
(2, 1, 5, '2'),
(3, 1, 3, '2'),
(4, 1, 2, '2'),
(5, 1, 4, '2'),
(6, 3, 5, '3'),
(7, 3, 3, '3'),
(8, 3, 2, '3'),
(9, 3, 4, '3'),
(10, 3, 1, '3'),
(11, 4, 5, '4'),
(12, 4, 3, '4'),
(13, 4, 2, '4'),
(14, 4, 4, '4'),
(15, 4, 1, '4'),
(16, 5, 5, '5'),
(17, 5, 3, '5'),
(18, 5, 2, '5'),
(19, 5, 4, '5'),
(20, 5, 1, '5'),
(21, 2, 5, '6'),
(22, 2, 3, '6'),
(23, 2, 2, '6'),
(24, 2, 4, '6'),
(25, 2, 1, '6'),
(31, 1, 1, '2'),
(32, 1, 5, '2'),
(33, 1, 3, '2'),
(34, 1, 2, '2'),
(35, 1, 4, '2'),
(36, 3, 5, '3'),
(37, 3, 3, '3'),
(38, 3, 2, '3'),
(39, 3, 4, '3'),
(40, 3, 1, '3'),
(41, 4, 5, '4'),
(42, 4, 3, '4'),
(43, 4, 2, '4'),
(44, 4, 4, '4'),
(45, 4, 1, '4'),
(46, 5, 5, '5'),
(47, 5, 3, '5'),
(48, 5, 2, '5'),
(49, 5, 4, '5'),
(50, 5, 1, '5'),
(51, 2, 5, '6'),
(52, 2, 3, '6'),
(53, 2, 2, '6'),
(54, 2, 4, '6'),
(55, 2, 1, '6');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przedmiot`
--

CREATE TABLE `przedmiot` (
  `id_przedmiotu` int(11) NOT NULL,
  `nazwa_przedmiotu` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `przedmiot`
--

INSERT INTO `przedmiot` (`id_przedmiotu`, `nazwa_przedmiotu`) VALUES
(1, 'matematyka'),
(2, 'fizyka'),
(3, 'chemia'),
(4, 'geografia'),
(5, 'biologia');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczen`
--

CREATE TABLE `uczen` (
  `id_ucznia` int(11) NOT NULL,
  `imie` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL,
  `nazwisko` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL,
  `data_urodzenia` date NOT NULL,
  `miejsce_ur` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  `plec` varchar(16) COLLATE utf8mb4_polish_ci NOT NULL,
  `klasa` varchar(16) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `uczen`
--

INSERT INTO `uczen` (`id_ucznia`, `imie`, `nazwisko`, `data_urodzenia`, `miejsce_ur`, `plec`, `klasa`) VALUES
(1, 'Paweł', 'Śminiak', '2005-07-12', 'Gajec', 'chłopak', '2td'),
(2, 'Piotr', 'Purker', '2004-01-21', 'Rzepin', 'chłopak', '3td'),
(3, 'Tomek', 'Nowak', '2005-02-30', 'Zielona Góra', 'dziewczyna', '2tg'),
(4, 'Kamila', 'Rek', '2005-03-21', 'Słubice', 'dziewczyna', '2te'),
(5, 'Kasia', 'Pietkowskaa', '2005-09-23', 'Warszawa', 'dziewczyna', '2th');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `oceny`
--
ALTER TABLE `oceny`
  ADD PRIMARY KEY (`id_oceny`),
  ADD KEY `id_ucznia` (`id_ucznia`),
  ADD KEY `id_przedmiotu` (`id_przedmiotu`);

--
-- Indeksy dla tabeli `przedmiot`
--

ALTER TABLE `przedmiot`
  ADD PRIMARY KEY (`id_przedmiotu`);

--
-- Indeksy dla tabeli `uczen`
--

ALTER TABLE `uczen`
  ADD PRIMARY KEY (`id_ucznia`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `oceny`
--
ALTER TABLE `oceny`
  MODIFY `id_oceny` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT dla tabeli `przedmiot`
--
ALTER TABLE `przedmiot`
  MODIFY `id_przedmiotu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `uczen`
--

ALTER TABLE `uczen`
  MODIFY `id_ucznia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `oceny`
--
ALTER TABLE `oceny`
  ADD CONSTRAINT `oceny_ibfk_1` FOREIGN KEY (`id_przedmiotu`) REFERENCES `przedmiot` (`id_przedmiotu`),
  ADD CONSTRAINT `oceny_ibfk_2` FOREIGN KEY (`id_ucznia`) REFERENCES `uczen` (`id_ucznia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
