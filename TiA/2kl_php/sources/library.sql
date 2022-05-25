-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2022 at 11:28 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--
CREATE DATABASE IF NOT EXISTS `library` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE `library`;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL,
  `author` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL,
  `release_date` year(4) NOT NULL,
  `pages_number` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `release_date`, `pages_number`) VALUES
(1, 'Mroczna wyspa', 'Brandon ZBIA', 2000, 532),
(2, 'Programowanie basics', 'Filip Szumowski', 2022, 1024),
(3, 'Programowanie1', 'Filszu', 2022, 578),
(4, 'Programowanie2', 'Filszu', 2022, 555),
(5, 'Programowanie3', 'Filszu', 2022, 665),
(6, 'Programowanie4', 'Filszu', 2022, 660);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `action_id`, `time`) VALUES
(1, 2, '2022-05-12 19:04:56'),
(2, 2, '2022-05-12 19:05:10'),
(3, 1, '2022-05-12 19:08:59'),
(4, 2, '2022-05-12 19:09:25'),
(5, 2, '2022-05-12 19:09:26'),
(6, 2, '2022-05-12 19:09:27'),
(7, 1, '2022-05-12 19:09:37'),
(8, 1, '2022-05-12 19:09:37'),
(9, 2, '2022-05-12 19:09:56'),
(10, 2, '2022-05-12 19:09:58'),
(11, 2, '2022-05-12 19:09:58'),
(12, 1, '2022-05-12 19:10:15'),
(13, 1, '2022-05-12 19:10:16'),
(14, 1, '2022-05-12 19:10:16'),
(15, 2, '2022-05-12 19:10:21'),
(16, 2, '2022-05-12 19:10:23'),
(17, 2, '2022-05-12 19:10:25'),
(18, 1, '2022-05-12 19:10:41'),
(19, 1, '2022-05-12 19:10:41'),
(20, 1, '2022-05-12 19:10:41'),
(21, 2, '2022-05-12 19:10:48'),
(22, 1, '2022-05-12 19:48:26'),
(23, 2, '2022-05-12 19:48:33'),
(24, 2, '2022-05-12 19:48:34'),
(25, 2, '2022-05-12 19:48:35'),
(26, 2, '2022-05-12 19:48:36'),
(27, 2, '2022-05-12 19:48:38'),
(28, 1, '2022-05-12 19:49:34'),
(29, 1, '2022-05-12 19:49:47');

-- --------------------------------------------------------

--
-- Table structure for table `rental`
--

CREATE TABLE `rental` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `borrow_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `return_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `rental`
--

INSERT INTO `rental` (`id`, `student_id`, `book_id`, `borrow_date`, `return_date`) VALUES
(80, 1, 4, '2022-05-12 19:49:34', '2022-10-11 00:00:00'),
(81, 1, 6, '2022-05-12 19:49:47', '2022-10-11 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `class` char(5) COLLATE utf8mb4_polish_ci NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL,
  `surname` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `class`, `name`, `surname`) VALUES
(1, '2td', 'alex', 'pie4d'),
(2, '1td', 'Filip', 'Ziolo'),
(3, '76ta', 'Antek ', 'Pronias');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rental`
--
ALTER TABLE `rental`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `rental`
--
ALTER TABLE `rental`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rental`
--
ALTER TABLE `rental`
  ADD CONSTRAINT `rental_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `rental_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `books` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
