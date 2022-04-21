

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


--
-- Baza danych: `cw01c`
--
CREATE DATABASE IF NOT EXISTS `cw01c` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE `cw01c`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nauczyciele`
--

CREATE TABLE `nauczyciele` (
  `NauczycielID` int(11) NOT NULL,
  `NazwiskoImie` varchar(150) COLLATE utf8mb4_polish_ci NOT NULL,
  `Wyksztalcenie` varchar(150) COLLATE utf8mb4_polish_ci NOT NULL,
  `StazPracy` tinyint(4) NOT NULL,
  `Telefon` char(25) COLLATE utf8mb4_polish_ci NOT NULL,
  `Mail` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `nauczyciele`
--

INSERT INTO `nauczyciele` (`NauczycielID`, `NazwiskoImie`, `Wyksztalcenie`, `StazPracy`, `Telefon`, `Mail`) VALUES
(1, 'Renata Prońko', 'magister', 20, '+48-777 777-777', 'rPr@zseis.pl'),
(2, 'John DOE', 'magister', 21, '+48 888-888-888', 'rPrsss@zseis.pl'),
(3, 'Beata Kozidrak', 'magister', 5, '48 333-333-333', 'fdf@zseis.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ocenadefinicje`
--

CREATE TABLE `ocenadefinicje` (
  `OcenaDefID` int(11) NOT NULL,
  `NazwaPelna` varchar(30) COLLATE utf8mb4_polish_ci NOT NULL,
  `NazwaSkrot` varchar(6) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `ocenadefinicje`
--

INSERT INTO `ocenadefinicje` (`OcenaDefID`, `NazwaPelna`, `NazwaSkrot`) VALUES
(1, 'sprawdzian', 'spr'),
(2, 'kartkówka', 'kart'),
(3, 'zadanie', 'zd'),
(4, 'karta pracy', 'kp');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oceny`
--

CREATE TABLE `oceny` (
  `OcenaID` int(11) NOT NULL,
  `UczenID` int(11) NOT NULL,
  `PrzedmiotID` int(11) NOT NULL,
  `NauczycielID` int(11) NOT NULL,
  `OcenaDefID` int(11) NOT NULL,
  `Data` date NOT NULL,
  `Godzina` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `oceny`
--

INSERT INTO `oceny` (`OcenaID`, `UczenID`, `PrzedmiotID`, `NauczycielID`, `OcenaDefID`, `Data`, `Godzina`) VALUES
(5, 1, 1, 1, 2, '2021-05-19', '65:17:24'),
(6, 1, 2, 2, 2, '2021-05-05', '09:17:45'),
(7, 2, 2, 1, 3, '2021-05-11', '10:18:25');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przedmioty`
--

CREATE TABLE `przedmioty` (
  `PrzedmiotID` int(11) NOT NULL,
  `NazwaPelna` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL,
  `NazwaSkrot` varchar(5) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `przedmioty`
--

INSERT INTO `przedmioty` (`PrzedmiotID`, `NazwaPelna`, `NazwaSkrot`) VALUES
(1, 'Język Polski ', 'JP'),
(2, 'Matematyka', 'mat'),
(3, 'Fizyka', 'fiz');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczniowie`
--

CREATE TABLE `uczniowie` (
  `UczenID` int(11) NOT NULL,
  `NazwiskoImie` varchar(120) COLLATE utf8mb4_polish_ci NOT NULL,
  `DataUr` date NOT NULL,
  `Kod` varchar(15) COLLATE utf8mb4_polish_ci NOT NULL,
  `MiejsceUr` varchar(300) COLLATE utf8mb4_polish_ci NOT NULL,
  `Miejscowosc` varchar(300) COLLATE utf8mb4_polish_ci NOT NULL,
  `UlicaNr` varchar(150) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `uczniowie`
--

INSERT INTO `uczniowie` (`UczenID`, `NazwiskoImie`, `DataUr`, `Kod`, `MiejsceUr`, `Miejscowosc`, `UlicaNr`) VALUES
(1, 'Jan Nowak', '2021-03-01', '65-551', 'Zielona', 'Góra', 'Wiśniowa 1'),
(2, 'Paweł Kała', '2021-03-02', '65-001', 'łąka', 'Zielona Góra', 'niebieska 6'),
(3, 'Monika Szara', '2021-03-16', '65-007', 'Jelenia Góra', 'Jelenia Góra', 'zielona 33');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `nauczyciele`
--
ALTER TABLE `nauczyciele`
  ADD PRIMARY KEY (`NauczycielID`);

--
-- Indeksy dla tabeli `ocenadefinicje`
--
ALTER TABLE `ocenadefinicje`
  ADD PRIMARY KEY (`OcenaDefID`);

--
-- Indeksy dla tabeli `oceny`
--
ALTER TABLE `oceny`
  ADD PRIMARY KEY (`OcenaID`),
  ADD KEY `Uczen_id` (`UczenID`),
  ADD KEY `przedmiot_id` (`PrzedmiotID`),
  ADD KEY `nauczyciel_id` (`NauczycielID`),
  ADD KEY `ocena_def_id` (`OcenaDefID`);

--
-- Indeksy dla tabeli `przedmioty`
--
ALTER TABLE `przedmioty`
  ADD PRIMARY KEY (`PrzedmiotID`);

--
-- Indeksy dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD PRIMARY KEY (`UczenID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `nauczyciele`
--
ALTER TABLE `nauczyciele`
  MODIFY `NauczycielID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `ocenadefinicje`
--
ALTER TABLE `ocenadefinicje`
  MODIFY `OcenaDefID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `oceny`
--
ALTER TABLE `oceny`
  MODIFY `OcenaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `przedmioty`
--
ALTER TABLE `przedmioty`
  MODIFY `PrzedmiotID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  MODIFY `UczenID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `oceny`
--
ALTER TABLE `oceny`
  ADD CONSTRAINT `oceny_ibfk_1` FOREIGN KEY (`UczenID`) REFERENCES `uczniowie` (`UczenID`),
  ADD CONSTRAINT `oceny_ibfk_2` FOREIGN KEY (`NauczycielID`) REFERENCES `nauczyciele` (`NauczycielID`),
  ADD CONSTRAINT `oceny_ibfk_3` FOREIGN KEY (`PrzedmiotID`) REFERENCES `przedmioty` (`PrzedmiotID`),
  ADD CONSTRAINT `oceny_ibfk_4` FOREIGN KEY (`OcenaDefID`) REFERENCES `ocenadefinicje` (`OcenaDefID`);


--
-- Metadane
--
USE `phpmyadmin`;

--
-- Metadane dla tabeli nauczyciele
--

--
-- Metadane dla tabeli ocenadefinicje
--

--
-- Metadane dla tabeli oceny
--

--
-- Metadane dla tabeli przedmioty
--

--
-- Metadane dla tabeli uczniowie
--

--
-- Metadane dla Bazy danych cw01c
--
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
