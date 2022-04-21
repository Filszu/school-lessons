-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 13 Paź 2021, 12:43
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
-- Baza danych: `szkola`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klasa`
--

CREATE TABLE `klasa` (
  `id_klasy` int(11) NOT NULL,
  `nazwa` varchar(4) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `klasa`
--

INSERT INTO `klasa` (`id_klasy`, `nazwa`) VALUES
(1, '1TD'),
(2, '2TD'),
(3, '3TD');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nauczyciel`
--

CREATE TABLE `nauczyciel` (
  `id` int(11) NOT NULL,
  `imie` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(32) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `nauczyciel`
--

INSERT INTO `nauczyciel` (`id`, `imie`, `nazwisko`) VALUES
(1, 'Krystian', 'Wyszyński'),
(2, 'Maciek', 'Składanowski');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oceny`
--

CREATE TABLE `oceny` (
  `id_oceny` int(11) NOT NULL,
  `id_nauczyciel` int(11) NOT NULL,
  `id_przedmiot` int(11) NOT NULL,
  `id_ucznia` int(11) NOT NULL,
  `ocena` varchar(2) COLLATE utf8mb4_polish_ci NOT NULL,
  `data` datetime NOT NULL,
  `opis` varchar(250) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przedmiot`
--

CREATE TABLE `przedmiot` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL,
  `id_nauczyciela` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `przedmiot`
--

INSERT INTO `przedmiot` (`id`, `nazwa`, `id_nauczyciela`) VALUES
(1, 'matematyka', 1),
(2, 'fizyka', 1),
(3, 'chemia', 2),
(4, 'geografia', 2),
(5, 'biologia', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczen`
--

CREATE TABLE `uczen` (
  `id` int(11) NOT NULL,
  `imie` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL,
  `nazwisko` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL,
  `nr` tinyint(50) NOT NULL,
  `id_klasy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `uczen`
--

INSERT INTO `uczen` (`id`, `imie`, `nazwisko`, `nr`, `id_klasy`) VALUES
(1, 'Wojtek', 'Wilgucki', 2, 1),
(2, 'Adam', 'Majkowski', 2, 2),
(3, 'Wiktoria', 'Krupko', 5, 3),
(4, 'Nikola', 'Rogala', 2, 3),
(5, 'Oliwia', 'Stelmaszuk', 4, 1);

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
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `oceny`
--
ALTER TABLE `oceny`
  ADD PRIMARY KEY (`id_oceny`),
  ADD KEY `id_ucznia` (`id_ucznia`),
  ADD KEY `id_przedmiotu` (`id_przedmiot`),
  ADD KEY `id_nauczyciel` (`id_nauczyciel`);

--
-- Indeksy dla tabeli `przedmiot`
--
ALTER TABLE `przedmiot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_nauczyciela` (`id_nauczyciela`);

--
-- Indeksy dla tabeli `uczen`
--
ALTER TABLE `uczen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_klasy` (`id_klasy`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `klasa`
--
ALTER TABLE `klasa`
  MODIFY `id_klasy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `nauczyciel`
--
ALTER TABLE `nauczyciel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `oceny`
--
ALTER TABLE `oceny`
  MODIFY `id_oceny` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT dla tabeli `przedmiot`
--
ALTER TABLE `przedmiot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `uczen`
--
ALTER TABLE `uczen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `oceny`
--
ALTER TABLE `oceny`
  ADD CONSTRAINT `oceny_ibfk_1` FOREIGN KEY (`id_przedmiot`) REFERENCES `przedmiot` (`id`),
  ADD CONSTRAINT `oceny_ibfk_2` FOREIGN KEY (`id_ucznia`) REFERENCES `uczen` (`id`),
  ADD CONSTRAINT `oceny_ibfk_3` FOREIGN KEY (`id_nauczyciel`) REFERENCES `nauczyciel` (`id`);

--
-- Ograniczenia dla tabeli `przedmiot`
--
ALTER TABLE `przedmiot`
  ADD CONSTRAINT `przedmiot_ibfk_1` FOREIGN KEY (`id_nauczyciela`) REFERENCES `nauczyciel` (`id`);

--
-- Ograniczenia dla tabeli `uczen`
--
ALTER TABLE `uczen`
  ADD CONSTRAINT `uczen_ibfk_1` FOREIGN KEY (`id_klasy`) REFERENCES `klasa` (`id_klasy`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
