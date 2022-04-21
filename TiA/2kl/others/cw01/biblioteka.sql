-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 12 Paź 2021, 12:48
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
-- Baza danych: `biblioteka`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `autorzy`
--

CREATE TABLE `autorzy` (
  `aid` int(11) NOT NULL,
  `imie` tinytext DEFAULT NULL,
  `nazwisko` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `autorzy`
--

INSERT INTO `autorzy` (`aid`, `imie`, `nazwisko`) VALUES
(1, 'Paweł', 'Skrzypek'),
(2, 'Antek', 'Nowak'),
(3, 'Michał', 'Koń'),
(4, 'Paweł', 'Szpalik');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategorie`
--

CREATE TABLE `kategorie` (
  `kid` int(11) NOT NULL,
  `nazwa` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `kategorie`
--

INSERT INTO `kategorie` (`kid`, `nazwa`) VALUES
(1, 'PHP'),
(2, 'MySQL'),
(3, 'Bez kategorii');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki`
--

CREATE TABLE `ksiazki` (
  `id` int(11) NOT NULL,
  `tytul` tinytext DEFAULT NULL,
  `autor` int(11) DEFAULT NULL,
  `kategoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `ksiazki`
--

INSERT INTO `ksiazki` (`id`, `tytul`, `autor`, `kategoria`) VALUES
(1, 'PHP Samouczek', 3, 1),
(2, 'MySql Samouczek', 3, 2),
(3, 'PHP Praktyczne rozwiazania', 1, 1),
(4, 'MYSQL Przewodnik programisty', 2, 2),
(5, 'Klasa 3(a/b)', 4, 3);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `autorzy`
--
ALTER TABLE `autorzy`
  ADD PRIMARY KEY (`aid`);

--
-- Indeksy dla tabeli `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`kid`);

--
-- Indeksy dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `autorzy`
--
ALTER TABLE `autorzy`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `kid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

