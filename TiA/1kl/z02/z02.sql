-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 25 Sty 2021, 09:41
-- Wersja serwera: 10.4.14-MariaDB
-- Wersja PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `z02`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki`
--

CREATE TABLE `ksiazki` (
  `Id_ksiazki` int(11) NOT NULL,
  `autor` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `wydawnictwo` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `rok_wydania` year(4) NOT NULL,
  `liczba_stron` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `ksiazki`
--

INSERT INTO `ksiazki` (`Id_ksiazki`, `autor`, `wydawnictwo`, `rok_wydania`, `liczba_stron`) VALUES
(1, 'Jerzy Grębosz', 'Helion', 2018, 1000),
(2, 'Filip Szumowski', 'brak', 2020, 320),
(3, 'Brandon Mull', 'WAB', 2020, 320);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczniowie`
--

CREATE TABLE `uczniowie` (
  `id_ucznia` int(11) NOT NULL,
  `nazwisko` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `imie` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `klasa` varchar(8) COLLATE utf8_polish_ci NOT NULL,
  `telefon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `uczniowie`
--

INSERT INTO `uczniowie` (`id_ucznia`, `nazwisko`, `imie`, `klasa`, `telefon`) VALUES
(1, 'Szumowski', 'Filip', '1td', 111111111),
(2, 'Walczak', 'Natan', '1td', 22222222),
(3, 'Nowak', 'Jan', '2tc', 333333333);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wypozyczenia`
--

CREATE TABLE `wypozyczenia` (
  `id_ksiazki` int(11) NOT NULL,
  `id_wypozyczajacego` int(11) NOT NULL,
  `data_wypozyczenia` datetime NOT NULL,
  `data_zwrotu` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `wypozyczenia`
--

INSERT INTO `wypozyczenia` (`id_ksiazki`, `id_wypozyczajacego`, `data_wypozyczenia`, `data_zwrotu`) VALUES
(3, 3, '2021-01-05 09:35:13', '2021-01-28 09:35:13'),
(2, 1, '2021-01-14 09:35:26', '2021-01-29 09:35:26'),
(3, 1, '2021-01-25 09:35:26', '2021-01-30 09:35:26'),
(3, 3, '2021-01-25 09:36:03', '2021-01-29 09:36:03'),
(3, 2, '2021-01-27 09:36:03', '2021-01-29 09:36:03'),
(3, 2, '2021-01-27 09:36:03', '2021-01-30 09:36:03'),
(3, 2, '2021-01-25 09:39:49', '2021-01-28 09:39:49'),
(1, 1, '2021-01-26 09:39:49', '2021-01-28 09:39:49'),
(3, 1, '2021-01-25 09:40:20', '2021-01-30 09:40:20'),
(3, 2, '2021-01-25 09:40:20', '2021-01-29 09:40:20'),
(2, 2, '2021-01-26 09:40:20', '2021-01-30 09:40:20');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`Id_ksiazki`);

--
-- Indeksy dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD PRIMARY KEY (`id_ucznia`);

--
-- Indeksy dla tabeli `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  ADD KEY `ksiazki` (`id_ksiazki`),
  ADD KEY `wypozyczajacy` (`id_wypozyczajacego`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  MODIFY `Id_ksiazki` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  MODIFY `id_ucznia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  ADD CONSTRAINT `ksiazki` FOREIGN KEY (`id_ksiazki`) REFERENCES `ksiazki` (`Id_ksiazki`),
  ADD CONSTRAINT `wypozyczajacy` FOREIGN KEY (`id_wypozyczajacego`) REFERENCES `uczniowie` (`id_ucznia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
