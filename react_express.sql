-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 14 Feb 2023 pada 17.37
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `react_express`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `Brands`
--

CREATE TABLE `Brands` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `Brands`
--

INSERT INTO `Brands` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Apple', '2023-02-10 18:59:38', '2023-02-10 18:59:38'),
(2, 'Samsung', '2023-02-10 18:59:38', '2023-02-10 18:59:38'),
(3, 'Asus', '2023-02-10 18:59:38', '2023-02-10 18:59:38'),
(4, 'Lenovo', '2023-02-10 18:59:38', '2023-02-10 18:59:38'),
(5, 'Oppo', '2023-02-10 18:59:38', '2023-02-10 18:59:38'),
(6, 'Xiomi', '2023-02-10 18:59:38', '2023-02-10 18:59:38'),
(7, 'HP', '2023-02-10 18:59:38', '2023-02-10 18:59:38'),
(8, 'MSI', '2023-02-10 18:59:38', '2023-02-10 18:59:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `Categories`
--

CREATE TABLE `Categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `Categories`
--

INSERT INTO `Categories` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Smartphone', '2023-02-10 18:59:38', '2023-02-10 18:59:38'),
(2, 'Laptop', '2023-02-10 18:59:38', '2023-02-10 18:59:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `Products`
--

CREATE TABLE `Products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `brandId` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `Products`
--

INSERT INTO `Products` (`id`, `name`, `brandId`, `categoryId`, `price`, `image`, `url`, `createdAt`, `updatedAt`) VALUES
(24, 'tes', 4, 2, 400, 'public/images/1676223815350acceptbid.png', 'http://localhost:5000/images/1676223815350acceptbid.png', '2023-02-12 17:43:35', '2023-02-12 17:43:35'),
(25, 'tes', 4, 2, 400, 'public/images/1676223833067bidproject.png', 'http://localhost:5000/images/1676223833067bidproject.png', '2023-02-12 17:43:53', '2023-02-12 17:43:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `SequelizeMeta`
--

CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `SequelizeMeta`
--

INSERT INTO `SequelizeMeta` (`name`) VALUES
('20230210182522-create-user.js'),
('20230210182534-create-brand.js'),
('20230210182547-create-category.js'),
('20230210182558-create-product.js');

-- --------------------------------------------------------

--
-- Struktur dari tabel `Users`
--

CREATE TABLE `Users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `Brands`
--
ALTER TABLE `Brands`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brandId` (`brandId`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indeks untuk tabel `SequelizeMeta`
--
ALTER TABLE `SequelizeMeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `Brands`
--
ALTER TABLE `Brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `Categories`
--
ALTER TABLE `Categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `Products`
--
ALTER TABLE `Products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `Products`
--
ALTER TABLE `Products`
  ADD CONSTRAINT `Products_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`),
  ADD CONSTRAINT `Products_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `Categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
