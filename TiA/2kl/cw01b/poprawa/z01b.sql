-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 08 Gru 2021, 13:02
-- Wersja serwera: 10.4.17-MariaDB
-- Wersja PHP: 8.0.2

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
CREATE DATABASE IF NOT EXISTS `z01b` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE `z01b`;

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
  `isbn` char(17) COLLATE utf8mb4_polish_ci NOT NULL,
  `autor` varchar(64) COLLATE utf8mb4_polish_ci NOT NULL,
  `tutul` varchar(64) COLLATE utf8mb4_polish_ci NOT NULL,
  `cena` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `ksiazki`
--

INSERT INTO `ksiazki` (`isbn`, `autor`, `tutul`, `cena`) VALUES
('0-1033-6254-1', 'Filip Szumowski', 'Poznaj PHP. Kurs od podstaw', '59.99'),
('0-4413-5153-0', 'Jerzy Grębosz\r\n', 'Opus magnum c++', '124.99'),
('0-5525-8995-5-874', 'Szumowski Filip', 'OPUS MAGNUM FILIPs', '542.99'),
('978-83-01-000', 'Filip Szumowski', 'Mroczny świat', '34.99');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki_zamowione`
--

CREATE TABLE `ksiazki_zamowione` (
  `id_zamowienia` int(11) NOT NULL,
  `isbn` char(13) COLLATE utf8mb4_polish_ci NOT NULL,
  `ilosc` tinyint(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `ksiazki_zamowione`
--

INSERT INTO `ksiazki_zamowione` (`id_zamowienia`, `isbn`, `ilosc`) VALUES
(1, '978-83-01-000', 5),
(2, '978-83-01-000', 3),
(3, '0-4413-5153-0', 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `recenzje_ksiazek`
--

CREATE TABLE `recenzje_ksiazek` (
  `id` int(11) NOT NULL,
  `isbn` char(13) COLLATE utf8mb4_polish_ci NOT NULL,
  `recenzja` text COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `recenzje_ksiazek`
--

INSERT INTO `recenzje_ksiazek` (`id`, `isbn`, `recenzja`) VALUES
(1, '978-83-01-000', 'very goooooooooood\r\n👍😉'),
(2, '0-1033-6254-1', 'super!'),
(3, '0-4413-5153-0', 'I love it. ❤❤'),
(4, '978-83-01-000', ':)');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `id_zamowienia` int(11) NOT NULL,
  `klient_id` int(11) NOT NULL,
  `wartosc` decimal(9,2) UNSIGNED ZEROFILL NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `zamowienia`
--

INSERT INTO `zamowienia` (`id_zamowienia`, `klient_id`, `wartosc`, `data`) VALUES
(1, 1, '0002099.00', '2021-02-01'),
(2, 2, '0002105.00', '2021-02-15'),
(3, 1, '0002290.00', '2021-02-15');

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
-- Indeksy dla tabeli `ksiazki_zamowione`
--
ALTER TABLE `ksiazki_zamowione`
  ADD PRIMARY KEY (`id_zamowienia`),
  ADD KEY `isbn` (`isbn`);

--
-- Indeksy dla tabeli `recenzje_ksiazek`
--
ALTER TABLE `recenzje_ksiazek`
  ADD PRIMARY KEY (`id`),
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
-- AUTO_INCREMENT dla tabeli `recenzje_ksiazek`
--
ALTER TABLE `recenzje_ksiazek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `id_zamowienia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `ksiazki_zamowione`
--
ALTER TABLE `ksiazki_zamowione`
  ADD CONSTRAINT `ksiazki_zamowione_ibfk_1` FOREIGN KEY (`id_zamowienia`) REFERENCES `zamowienia` (`id_zamowienia`),
  ADD CONSTRAINT `ksiazki_zamowione_ibfk_2` FOREIGN KEY (`isbn`) REFERENCES `ksiazki` (`isbn`);

--
-- Ograniczenia dla tabeli `recenzje_ksiazek`
--
ALTER TABLE `recenzje_ksiazek`
  ADD CONSTRAINT `recenzje_ksiazek_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `ksiazki` (`isbn`);

--
-- Ograniczenia dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD CONSTRAINT `zamowienia_ibfk_1` FOREIGN KEY (`klient_id`) REFERENCES `klienci` (`id_klienta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
