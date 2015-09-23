-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas wygenerowania: 03 Paź 2013, 16:55
-- Wersja serwera: 5.5.32-0ubuntu0.13.04.1
-- Wersja PHP: 5.4.9-4ubuntu2.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `shadow`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE IF NOT EXISTS `uzytkownicy` (
  `id_uzytkownika` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(24) COLLATE utf8_polish_ci NOT NULL,
  `haslo` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `rola` varchar(12) COLLATE utf8_polish_ci NOT NULL,
  `imie` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `nazwisko` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `telefon` varchar(9) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id_uzytkownika`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=4 ;

--
-- Zrzut danych tabeli `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`id_uzytkownika`, `login`, `haslo`, `rola`, `imie`, `nazwisko`, `telefon`) VALUES
(1, 'admin', '098f6bcd4621d373cade4e832627b4f6', 'ROLE_ADMIN', 'Marcin', 'Kobierowski', '88'),
(2, 'test', '098f6bcd4621d373cade4e832627b4f6', 'ROLE_USER', 'Jan', 'Kowalski', '88'),
(3, 'kierownik', 'f746d33b44b95ad215a4b303eb3cc5f2', 'ROLE_MANAGER', 'Tomasz', 'Kowal', '882');

-- --------------------------------------------------------

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
