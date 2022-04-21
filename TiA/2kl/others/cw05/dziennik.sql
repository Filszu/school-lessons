-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 13 Paź 2021, 12:47
-- Wersja serwera: 10.1.36-MariaDB
-- Wersja PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `dziennik`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klasa`
--

CREATE TABLE `klasa` (
  `id_klasy` int(2) NOT NULL,
  `nazwa` varchar(20) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `klasa`
--

INSERT INTO `klasa` (`id_klasy`, `nazwa`) VALUES
(1, '2Td'),
(2, '2Tc');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nauczyciel`
--

CREATE TABLE `nauczyciel` (
  `id_nauczyciela` int(5) NOT NULL,
  `imie` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(24) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `nauczyciel`
--

INSERT INTO `nauczyciel` (`id_nauczyciela`, `imie`, `nazwisko`) VALUES
(1, 'Jacek', 'Prońko'),
(2, 'Piotr', 'Skaźiński');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oceny`
--

CREATE TABLE `oceny` (
  `id_oceny` int(5) NOT NULL,
  `id_nauczyciela` int(5) NOT NULL,
  `id_przedmiotu` int(2) NOT NULL,
  `id_ucznia` int(5) NOT NULL,
  `ocena` char(2) COLLATE utf8_polish_ci NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `opis` varchar(100) COLLATE utf8_polish_ci NOT NULL DEFAULT 'kartkówka'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `oceny`
--

INSERT INTO `oceny` (`id_oceny`, `id_nauczyciela`, `id_przedmiotu`, `id_ucznia`, `ocena`, `data`, `opis`) VALUES
(1, 1, 2, 3, '1', '2021-10-13 10:43:12', 'spr'),
(2, 2, 3, 3, '2', '2021-10-13 10:43:12', 'kart'),
(3, 1, 3, 3, '3', '2021-10-13 10:43:12', 'spr'),
(4, 1, 5, 3, '4', '2021-10-13 10:43:12', 'kart'),
(5, 2, 4, 3, '5', '2021-10-13 10:43:12', 'spr'),
(6, 2, 2, 2, '6', '2021-10-13 10:43:12', 'kart'),
(7, 2, 3, 2, '1', '2021-10-13 10:43:12', 'spr'),
(8, 2, 1, 2, '2', '2021-10-13 10:43:12', 'kart'),
(9, 1, 5, 2, '3', '2021-10-13 10:43:12', 'spr'),
(10, 2, 4, 2, '4', '2021-10-13 10:43:12', 'kart'),
(11, 2, 2, 4, '5', '2021-10-13 10:43:12', 'spr'),
(12, 2, 3, 4, '6', '2021-10-13 10:43:12', 'kart'),
(13, 2, 1, 4, '1', '2021-10-13 10:43:12', 'spr'),
(14, 1, 5, 4, '2', '2021-10-13 10:43:12', 'kart'),
(15, 1, 4, 4, '3', '2021-10-13 10:43:12', 'spr'),
(16, 2, 2, 1, '4', '2021-10-13 10:43:12', 'kart'),
(17, 1, 3, 1, '5', '2021-10-13 10:43:12', 'spr'),
(18, 1, 1, 1, '6', '2021-10-13 10:43:12', 'kart'),
(19, 1, 5, 1, '1', '2021-10-13 10:43:12', 'spr'),
(20, 1, 4, 1, '2', '2021-10-13 10:43:12', 'kart'),
(21, 2, 2, 5, '3', '2021-10-13 10:43:12', 'spr'),
(22, 2, 3, 5, '4', '2021-10-13 10:43:12', 'kart'),
(23, 1, 1, 5, '5', '2021-10-13 10:43:12', 'spr'),
(24, 1, 5, 5, '6', '2021-10-13 10:43:12', 'kart'),
(25, 1, 4, 5, '1', '2021-10-13 10:43:12', 'spr');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przedmiot`
--

CREATE TABLE `przedmiot` (
  `id_przedmiotu` int(2) NOT NULL,
  `nazwa` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `id_nauczyciela` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `przedmiot`
--

INSERT INTO `przedmiot` (`id_przedmiotu`, `nazwa`, `id_nauczyciela`) VALUES
(1, 'biologia', 1),
(2, 'chemia', 1),
(3, 'Niemiecki', 2),
(4, 'WOS', 2),
(5, 'matematyka', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczen`
--

CREATE TABLE `uczen` (
  `id_ucznia` int(5) NOT NULL,
  `imie` varchar(15) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(24) COLLATE utf8_polish_ci NOT NULL,
  `nr` int(2) NOT NULL,
  `id_klasy` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `uczen`
--

INSERT INTO `uczen` (`id_ucznia`, `imie`, `nazwisko`, `nr`, `id_klasy`) VALUES
(1, 'Marek', 'Szumski', 12, 2),
(2, 'Paweł', 'Pietryka', 13, 2),
(3, 'Wiktoria', 'Krupko', 16, 1),
(4, 'Maciej', 'Sztkowski', 15, 1),
(5, 'Piotrk', 'Wydra', 16, 2);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klasa`
--
ALTER TABLE `klasa`
  ADD PRIMARY KEY (`id_klasy`);

--
-- Indeksy dla tabeli `nauczyciel`
--
ALTER TABLE `nauczyciel`
  ADD PRIMARY KEY (`id_nauczyciela`);

--
-- Indeksy dla tabeli `oceny`
--
ALTER TABLE `oceny`
  ADD PRIMARY KEY (`id_oceny`),
  ADD KEY `id_przedmiotu` (`id_przedmiotu`),
  ADD KEY `id_ucznia` (`id_ucznia`),
  ADD KEY `id_nauczyciela` (`id_nauczyciela`);

--
-- Indeksy dla tabeli `przedmiot`
--
ALTER TABLE `przedmiot`
  ADD PRIMARY KEY (`id_przedmiotu`),
  ADD KEY `id_nauczyciela` (`id_nauczyciela`);

--
-- Indeksy dla tabeli `uczen`
--
ALTER TABLE `uczen`
  ADD PRIMARY KEY (`id_ucznia`),
  ADD KEY `id_klasy` (`id_klasy`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `klasa`
--
ALTER TABLE `klasa`
  MODIFY `id_klasy` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `nauczyciel`
--
ALTER TABLE `nauczyciel`
  MODIFY `id_nauczyciela` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `oceny`
--
ALTER TABLE `oceny`
  MODIFY `id_oceny` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT dla tabeli `przedmiot`
--
ALTER TABLE `przedmiot`
  MODIFY `id_przedmiotu` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `uczen`
--
ALTER TABLE `uczen`
  MODIFY `id_ucznia` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `oceny`
--
ALTER TABLE `oceny`
  ADD CONSTRAINT `oceny_ibfk_2` FOREIGN KEY (`id_przedmiotu`) REFERENCES `przedmiot` (`id_przedmiotu`),
  ADD CONSTRAINT `oceny_ibfk_3` FOREIGN KEY (`id_ucznia`) REFERENCES `uczen` (`id_ucznia`),
  ADD CONSTRAINT `oceny_ibfk_4` FOREIGN KEY (`id_nauczyciela`) REFERENCES `nauczyciel` (`id_nauczyciela`);

--
-- Ograniczenia dla tabeli `przedmiot`
--
ALTER TABLE `przedmiot`
  ADD CONSTRAINT `przedmiot_ibfk_1` FOREIGN KEY (`id_nauczyciela`) REFERENCES `nauczyciel` (`id_nauczyciela`);

--
-- Ograniczenia dla tabeli `uczen`
--
ALTER TABLE `uczen`
  ADD CONSTRAINT `uczen_ibfk_1` FOREIGN KEY (`id_klasy`) REFERENCES `klasa` (`id_klasy`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
