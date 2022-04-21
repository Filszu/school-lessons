-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 15 Lut 2021, 09:27
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
-- Baza danych: `z01b`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `id_klienta` int(11) NOT NULL,
  `nazwisko_imie` varchar(64) COLLATE utf8mb4_polish_ci NOT NULL,
  `adres` varchar(64) COLLATE utf8mb4_polish_ci NOT NULL,
  `miejscowosc` varchar(64) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`id_klienta`, `nazwisko_imie`, `adres`, `miejscowosc`) VALUES
(1, 'Jan nowak', 'Wiśniowa', 'Zielona Góra'),
(2, 'Zbiax Zbiax', 'zielona', 'Poznań'),
(3, 'Ida bbbbzyk', 'Słowackiego', 'Kraków');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki`
--

CREATE TABLE `ksiazki` (
  `isbn` varchar(64) COLLATE utf8mb4_polish_ci NOT NULL,
  `autor` varchar(64) COLLATE utf8mb4_polish_ci NOT NULL,
  `tutul` varchar(64) COLLATE utf8mb4_polish_ci NOT NULL,
  `cena` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `ksiazki`
--

INSERT INTO `ksiazki` (`isbn`, `autor`, `tutul`, `cena`) VALUES
('0-1033-6254-1', 'Filip Szumowski', 'Poznaj PHP. Kurs od podstaw', 59.99),
('0-4413-5153-0', 'Jerzy Grębosz\r\n', 'Opus magnum c++', 124.99),
('978-83-01-00000-1.', 'Filip Szumowski', 'Mroczny świat', 34.99);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki_recenzje`
--

CREATE TABLE `ksiazki_recenzje` (
  `isbn` varchar(64) COLLATE utf8mb4_polish_ci NOT NULL,
  `recenzja` text COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `ksiazki_recenzje`
--

INSERT INTO `ksiazki_recenzje` (`isbn`, `recenzja`) VALUES
('978-83-01-00000-1.', 'very goooooooooood\r\n👍😉'),
('0-1033-6254-1', 'super!'),
('0-4413-5153-0', 'I love it. ❤❤');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki_zamowione`
--

CREATE TABLE `ksiazki_zamowione` (
  `id_zamowienia` int(11) NOT NULL,
  `isbn` varchar(64) COLLATE utf8mb4_polish_ci NOT NULL,
  `ilosc` tinyint(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `ksiazki_zamowione`
--

INSERT INTO `ksiazki_zamowione` (`id_zamowienia`, `isbn`, `ilosc`) VALUES
(1, '978-83-01-00000-1.', 5),
(2, '978-83-01-00000-1.', 3),
(3, '0-4413-5153-0', 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `id_zamowienia` int(11) NOT NULL,
  `klient_id` int(11) NOT NULL,
  `wartosc` float NOT NULL,
  `data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `zamowienia`
--

INSERT INTO `zamowienia` (`id_zamowienia`, `klient_id`, `wartosc`, `data`) VALUES
(1, 1, 56.98, '2021-02-01 08:59:36'),
(2, 2, 105.2, '2021-02-15 09:25:37'),
(3, 1, 89.99, '2021-02-15 09:25:37');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id_klienta`);

--
-- Indeksy dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`isbn`);

--
-- Indeksy dla tabeli `ksiazki_recenzje`
--
ALTER TABLE `ksiazki_recenzje`
  ADD KEY `isbn` (`isbn`);

--
-- Indeksy dla tabeli `ksiazki_zamowione`
--
ALTER TABLE `ksiazki_zamowione`
  ADD PRIMARY KEY (`id_zamowienia`),
  ADD KEY `isbn` (`isbn`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`id_zamowienia`),
  ADD KEY `klient_id` (`klient_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id_klienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `id_zamowienia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `ksiazki_recenzje`
--
ALTER TABLE `ksiazki_recenzje`
  ADD CONSTRAINT `ksiazki_recenzje_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `ksiazki` (`isbn`);

--
-- Ograniczenia dla tabeli `ksiazki_zamowione`
--
ALTER TABLE `ksiazki_zamowione`
  ADD CONSTRAINT `ksiazki_zamowione_ibfk_1` FOREIGN KEY (`id_zamowienia`) REFERENCES `zamowienia` (`id_zamowienia`),
  ADD CONSTRAINT `ksiazki_zamowione_ibfk_2` FOREIGN KEY (`isbn`) REFERENCES `ksiazki` (`isbn`);

--
-- Ograniczenia dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD CONSTRAINT `zamowienia_ibfk_1` FOREIGN KEY (`klient_id`) REFERENCES `klienci` (`id_klienta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
