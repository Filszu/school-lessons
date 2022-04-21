


CREATE DATABASE IF NOT EXISTS `firma` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE `firma`;



CREATE TABLE `dostawcy` (
  `id_dostawcy` int(11) NOT NULL,
  `adres` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL,
  `telefon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;



CREATE TABLE `magazyn` (
  `id_towaru` int(11) NOT NULL,
  `liczba_sztuk` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;


CREATE TABLE `towary` (
  `id_towaru` int(11) NOT NULL,
  `id_dostawcy` int(11) NOT NULL,
  `nazwa` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL,
  `cena` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;



