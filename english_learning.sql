-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Des 2022 pada 03.46
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
-- Database: `english_learning`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_tugas`
--

CREATE TABLE `data_tugas` (
  `id` int(11) NOT NULL,
  `tugas_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `is_kumpul` int(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `data_tugas`
--

INSERT INTO `data_tugas` (`id`, `tugas_id`, `user_id`, `deskripsi`, `is_kumpul`, `created_at`, `updated_at`) VALUES
(3, 5, 4, '', 1, '2022-05-25 10:43:37', '2022-05-25 10:43:37'),
(5, 8, 4, 'asdasd', 1, '2022-05-25 14:19:26', '2022-05-25 14:19:26'),
(6, 8, 8, 'ini tugas nya bu', 1, '2022-11-20 15:03:47', '2022-11-20 15:03:47'),
(10, 18, 12, 'Sudah dikerjakan bu tugas nya', 1, '2022-12-08 03:42:01', '2022-12-08 03:42:01'),
(11, 20, 4, 'asdsadf', 1, '2022-12-14 06:20:28', '2022-12-14 06:20:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `file_tugas`
--

CREATE TABLE `file_tugas` (
  `id` int(11) NOT NULL,
  `tugas_id` int(11) DEFAULT NULL,
  `data_tugas_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `ext` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `file_tugas`
--

INSERT INTO `file_tugas` (`id`, `tugas_id`, `data_tugas_id`, `name`, `ext`) VALUES
(2, NULL, 1, 'absen-kelas.png', 'png'),
(5, NULL, 2, '2.PNG', 'png'),
(6, NULL, 3, '2.PNG', 'png'),
(7, NULL, 4, 'BAB 4_3.pdf', 'pdf'),
(8, NULL, 5, '1.PNG', 'png'),
(9, 10, NULL, '2202.13953.pdf', 'pdf'),
(11, NULL, 6, '12.pdf', 'pdf'),
(13, 13, NULL, 'rog1.jpg', 'jpg'),
(14, 13, NULL, 'rog2.jpg', 'jpg'),
(15, 13, NULL, 'rog3.jpg', 'jpg'),
(16, 13, NULL, 'rog4.png', 'png'),
(21, NULL, 7, 'iPhone_13_Pro_Max_PDP_Position-1A_Color_Gold__ID-scaled.jpg', 'jpg'),
(24, NULL, 8, '1.jpeg', 'jpeg'),
(25, NULL, 8, '2.jpeg', 'jpeg'),
(26, NULL, 8, '3.jpeg', 'jpeg'),
(29, NULL, 9, 'Kunci Jawaban US MTK SMP K13 (Websiteedukasi.com).docx', 'docx'),
(30, 17, NULL, 'DAFTAR PUSTAKA.pdf', 'pdf'),
(31, 18, NULL, 'RANGKUMAN UMA SEKARAN 2016_083_Tiara Nur Amelia.pdf', 'pdf'),
(32, NULL, 10, 'CV_Ahmad Ardiansyah_ATS friendly.pdf', 'pdf'),
(33, 19, NULL, 'Analysis_of_E-Service_Quality_on_Website_E-Commerc.pdf', 'pdf'),
(34, NULL, 11, 'code2.png', 'png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hubungi`
--

CREATE TABLE `hubungi` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pesan` text NOT NULL,
  `ip_address` int(100) NOT NULL,
  `user_agent` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hubungi`
--

INSERT INTO `hubungi` (`id`, `nama_lengkap`, `email`, `pesan`, `ip_address`, `user_agent`, `created_at`) VALUES
(1, 'ardiansyah', 'ramadh@gmail.com', 'kamu terbaik banget dah', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '0000-00-00 00:00:00'),
(2, 'Lokasiii', 'ardibahdim1@gmail.com', 'asdasdasdasdasdasdas', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar_tugas`
--

CREATE TABLE `komentar_tugas` (
  `id` int(11) NOT NULL,
  `tugas_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `komentar` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `komentar_tugas`
--

INSERT INTO `komentar_tugas` (`id`, `tugas_id`, `user_id`, `komentar`, `created_at`, `updated_at`) VALUES
(8, 18, 6, 'Kerjakan dengan baik ya nak', '2022-12-08 03:43:41', '2022-12-08 03:43:41'),
(9, 18, 12, 'baik bu akan saya kerjakan dengan baik', '2022-12-08 03:44:17', '2022-12-08 03:44:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan`
--

CREATE TABLE `laporan` (
  `id` int(8) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_lapor_id` int(11) NOT NULL,
  `alasan` text NOT NULL,
  `created_at` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `laporan`
--

INSERT INTO `laporan` (`id`, `user_id`, `user_lapor_id`, `alasan`, `created_at`) VALUES
(0, 6, 8, 'Berkata tidak sopan, ini gabener nih', 1670428402);

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_aktivitas`
--

CREATE TABLE `log_aktivitas` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip_address` text NOT NULL,
  `user_agent` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `log_aktivitas`
--

INSERT INTO `log_aktivitas` (`id`, `user_id`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES
(1, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-20 07:50:13', '2022-05-20 07:50:13'),
(2, 4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-20 07:59:21', '2022-05-20 07:59:21'),
(3, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-20 09:12:18', '2022-05-20 09:12:18'),
(4, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-20 09:19:37', '2022-05-20 09:19:37'),
(5, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-20 09:22:30', '2022-05-20 09:22:30'),
(36, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36 Edg/101.0.1210.53', '2022-05-27 03:44:24', '2022-05-27 03:44:24'),
(7, 4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-20 09:41:22', '2022-05-20 09:41:22'),
(9, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-20 11:10:32', '2022-05-20 11:10:32'),
(35, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-27 03:44:14', '2022-05-27 03:44:14'),
(34, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-25 17:17:23', '2022-05-25 17:17:23'),
(33, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-25 17:11:46', '2022-05-25 17:11:46'),
(13, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-25 09:06:06', '2022-05-25 09:06:06'),
(14, 4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-25 09:11:58', '2022-05-25 09:11:58'),
(32, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-25 14:43:02', '2022-05-25 14:43:02'),
(16, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-25 09:57:56', '2022-05-25 09:57:56'),
(17, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-25 09:59:16', '2022-05-25 09:59:16'),
(18, 4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36 Edg/101.0.1210.53', '2022-05-25 10:00:23', '2022-05-25 10:00:23'),
(19, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-25 10:01:53', '2022-05-25 10:01:53'),
(31, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36 Edg/101.0.1210.53', '2022-05-25 14:01:48', '2022-05-25 14:01:48'),
(21, 4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-25 10:26:14', '2022-05-25 10:26:14'),
(30, 4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-25 13:53:38', '2022-05-25 13:53:38'),
(23, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-25 10:30:07', '2022-05-25 10:30:07'),
(24, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-25 10:32:08', '2022-05-25 10:32:08'),
(25, 4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-25 10:43:19', '2022-05-25 10:43:19'),
(29, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-25 13:53:13', '2022-05-25 13:53:13'),
(27, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-25 11:50:51', '2022-05-25 11:50:51'),
(28, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-25 13:16:46', '2022-05-25 13:16:46'),
(37, 8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36 Edg/101.0.1210.53', '2022-05-27 03:45:33', '2022-05-27 03:45:33'),
(38, 4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-27 03:47:50', '2022-05-27 03:47:50'),
(39, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-27 03:54:11', '2022-05-27 03:54:11'),
(40, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', '2022-06-25 06:32:03', '2022-06-25 06:32:03'),
(41, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', '2022-06-25 06:33:02', '2022-06-25 06:33:02'),
(42, 8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', '2022-06-25 06:34:04', '2022-06-25 06:34:04'),
(43, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', '2022-06-25 07:51:06', '2022-06-25 07:51:06'),
(44, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', '2022-06-25 07:51:13', '2022-06-25 07:51:13'),
(45, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', '2022-10-03 07:17:11', '2022-10-03 07:17:11'),
(46, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', '2022-10-03 07:41:12', '2022-10-03 07:41:12'),
(47, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', '2022-10-03 07:49:56', '2022-10-03 07:49:56'),
(48, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', '2022-10-03 08:28:26', '2022-10-03 08:28:26'),
(49, 8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', '2022-10-03 08:28:36', '2022-10-03 08:28:36'),
(50, 8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', '2022-10-03 22:27:27', '2022-10-03 22:27:27'),
(51, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', '2022-10-03 22:28:06', '2022-10-03 22:28:06'),
(52, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-14 14:13:17', '2022-11-14 14:13:17'),
(53, 8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-14 14:56:34', '2022-11-14 14:56:34'),
(54, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-14 15:17:06', '2022-11-14 15:17:06'),
(55, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-20 08:39:31', '2022-11-20 08:39:31'),
(56, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-20 08:39:44', '2022-11-20 08:39:44'),
(57, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-20 13:20:35', '2022-11-20 13:20:35'),
(58, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-20 13:55:57', '2022-11-20 13:55:57'),
(59, 8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-20 13:56:25', '2022-11-20 13:56:25'),
(60, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-20 13:56:40', '2022-11-20 13:56:40'),
(61, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-20 14:09:26', '2022-11-20 14:09:26'),
(62, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-20 14:36:22', '2022-11-20 14:36:22'),
(63, 8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-20 14:39:14', '2022-11-20 14:39:14'),
(64, 8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.52', '2022-11-20 14:53:56', '2022-11-20 14:53:56'),
(65, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.52', '2022-11-20 14:54:21', '2022-11-20 14:54:21'),
(66, 8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-21 13:56:46', '2022-11-21 13:56:46'),
(67, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.52', '2022-11-21 14:20:57', '2022-11-21 14:20:57'),
(68, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-21 17:49:59', '2022-11-21 17:49:59'),
(69, 8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-21 17:55:12', '2022-11-21 17:55:12'),
(70, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-21 17:57:07', '2022-11-21 17:57:07'),
(71, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-06 14:58:47', '2022-12-06 14:58:47'),
(72, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.62', '2022-12-06 14:59:40', '2022-12-06 14:59:40'),
(73, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.62', '2022-12-06 15:07:34', '2022-12-06 15:07:34'),
(74, 8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-06 15:17:39', '2022-12-06 15:17:39'),
(75, 8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-07 13:12:34', '2022-12-07 13:12:34'),
(76, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-07 14:02:19', '2022-12-07 14:02:19'),
(77, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-07 14:10:20', '2022-12-07 14:10:20'),
(78, 8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.42', '2022-12-07 14:10:27', '2022-12-07 14:10:27'),
(79, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.42', '2022-12-07 14:21:11', '2022-12-07 14:21:11'),
(80, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-07 14:27:20', '2022-12-07 14:27:20'),
(81, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.42', '2022-12-07 14:29:41', '2022-12-07 14:29:41'),
(82, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.42', '2022-12-07 14:43:01', '2022-12-07 14:43:01'),
(83, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-07 15:47:22', '2022-12-07 15:47:22'),
(84, 8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.42', '2022-12-07 15:52:21', '2022-12-07 15:52:21'),
(85, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-07 15:53:43', '2022-12-07 15:53:43'),
(86, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-07 15:58:03', '2022-12-07 15:58:03'),
(87, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-07 15:59:09', '2022-12-07 15:59:09'),
(88, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-07 16:01:50', '2022-12-07 16:01:50'),
(89, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-07 16:19:09', '2022-12-07 16:19:09'),
(90, 11, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.42', '2022-12-07 16:20:25', '2022-12-07 16:20:25'),
(91, 11, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.42', '2022-12-07 16:22:53', '2022-12-07 16:22:53'),
(92, 11, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.42', '2022-12-08 01:41:46', '2022-12-08 01:41:46'),
(93, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-08 01:42:03', '2022-12-08 01:42:03'),
(94, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-08 01:43:33', '2022-12-08 01:43:33'),
(95, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.42', '2022-12-08 03:29:17', '2022-12-08 03:29:17'),
(96, 12, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-08 03:29:55', '2022-12-08 03:29:55'),
(97, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.42', '2022-12-08 03:30:28', '2022-12-08 03:30:28'),
(98, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.42', '2022-12-08 03:39:05', '2022-12-08 03:39:05'),
(99, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.42', '2022-12-08 03:53:18', '2022-12-08 03:53:18'),
(100, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.42', '2022-12-08 04:07:13', '2022-12-08 04:07:13'),
(101, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-08 04:14:19', '2022-12-08 04:14:19'),
(102, 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-08 04:26:40', '2022-12-08 04:26:40'),
(103, 8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.42', '2022-12-08 04:27:32', '2022-12-08 04:27:32'),
(104, 4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:108.0) Gecko/20100101 Firefox/108.0', '2022-12-14 03:20:39', '2022-12-14 03:20:39'),
(105, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:108.0) Gecko/20100101 Firefox/108.0', '2022-12-14 03:23:34', '2022-12-14 03:23:34'),
(106, 4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:108.0) Gecko/20100101 Firefox/108.0', '2022-12-14 03:29:05', '2022-12-14 03:29:05'),
(107, 4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:108.0) Gecko/20100101 Firefox/108.0', '2022-12-14 03:36:31', '2022-12-14 03:36:31'),
(108, 13, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:108.0) Gecko/20100101 Firefox/108.0', '2022-12-14 03:38:56', '2022-12-14 03:38:56'),
(109, 13, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:108.0) Gecko/20100101 Firefox/108.0', '2022-12-14 03:39:32', '2022-12-14 03:39:32'),
(110, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:108.0) Gecko/20100101 Firefox/108.0', '2022-12-14 04:06:42', '2022-12-14 04:06:42'),
(111, 14, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:108.0) Gecko/20100101 Firefox/108.0', '2022-12-14 05:26:05', '2022-12-14 05:26:05'),
(112, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:108.0) Gecko/20100101 Firefox/108.0', '2022-12-14 05:27:57', '2022-12-14 05:27:57'),
(113, 14, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:108.0) Gecko/20100101 Firefox/108.0', '2022-12-14 05:31:36', '2022-12-14 05:31:36'),
(114, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:108.0) Gecko/20100101 Firefox/108.0', '2022-12-14 05:36:45', '2022-12-14 05:36:45'),
(115, 14, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:108.0) Gecko/20100101 Firefox/108.0', '2022-12-14 05:37:52', '2022-12-14 05:37:52'),
(116, 14, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:108.0) Gecko/20100101 Firefox/108.0', '2022-12-15 15:56:19', '2022-12-15 15:56:19'),
(117, 14, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:108.0) Gecko/20100101 Firefox/108.0', '2022-12-16 01:23:08', '2022-12-16 01:23:08'),
(118, 13, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:108.0) Gecko/20100101 Firefox/108.0', '2022-12-16 02:25:55', '2022-12-16 02:25:55'),
(119, 4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:108.0) Gecko/20100101 Firefox/108.0', '2022-12-16 02:26:07', '2022-12-16 02:26:07'),
(120, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:108.0) Gecko/20100101 Firefox/108.0', '2022-12-16 02:31:29', '2022-12-16 02:31:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `text` text NOT NULL,
  `icon` varchar(100) NOT NULL,
  `is_cek` int(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `notifikasi`
--

INSERT INTO `notifikasi` (`id`, `user_id`, `url`, `text`, `icon`, `is_cek`, `created_at`, `updated_at`) VALUES
(7, 4, '/aplikasi/siswa/detail-tugas/2', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-05-20 14:47:04', '2022-05-20 14:47:04'),
(8, 4, '/aplikasi/siswa/detail-tugas/3', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-05-20 15:25:48', '2022-05-20 15:25:48'),
(9, 4, '/aplikasi/siswa/detail-tugas/4', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 1, '2022-05-25 09:59:44', '2022-05-25 10:00:28'),
(10, 1, '/aplikasi/data/ubah-siswa/7', 'ardi ramadhan Telah mendaftarkan diri, Silahkan KONFIRMASI SEKARANG!!!', 'fa-user-plus', 1, '2022-05-25 10:01:39', '2022-05-25 17:17:44'),
(13, 4, '/aplikasi/siswa/detail-tugas/5', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-05-25 10:33:47', '2022-05-25 10:33:47'),
(14, 4, '/aplikasi/siswa/detail-tugas/6', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-05-25 10:33:50', '2022-05-25 10:33:50'),
(16, 4, '/aplikasi/siswa/detail-tugas/7', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-05-25 14:02:07', '2022-05-25 14:02:07'),
(18, 4, '/aplikasi/siswa/detail-tugas/8', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-05-25 14:16:24', '2022-05-25 14:16:24'),
(20, 1, '/aplikasi/data/ubah-siswa/8', 'ardi kosasih Telah mendaftarkan diri, Silahkan KONFIRMASI SEKARANG!!!', 'fa-user-plus', 1, '2022-05-27 03:44:14', '2022-05-27 03:44:35'),
(22, 4, '/aplikasi/siswa/detail-tugas/4', 'ardi kosasih mengomentari tugas Ardi Ramadhan.', 'fa-comments', 0, '2022-05-27 03:46:06', '2022-05-27 03:46:06'),
(26, 4, '/aplikasi/siswa/detail-tugas/9', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-06-25 07:52:13', '2022-06-25 07:52:13'),
(27, 1, '/aplikasi/admin/hubungi', 'ardiansyah Mengirim pesan kepada kamu', 'fas fa-phone', 1, '2022-11-20 08:39:24', '2022-11-20 08:40:24'),
(28, 1, '/aplikasi/data/ubah-siswa/9', 'marcelino una Telah mendaftarkan diri, Silahkan KONFIRMASI SEKARANG!!!', 'fa-user-plus', 1, '2022-11-20 14:07:04', '2022-11-20 14:36:39'),
(30, 4, '/aplikasi/siswa/detail-tugas/10', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-11-20 14:55:26', '2022-11-20 14:55:26'),
(31, 9, '/aplikasi/siswa/detail-tugas/10', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-11-20 14:55:27', '2022-11-20 14:55:27'),
(33, 4, '/aplikasi/siswa/detail-tugas/11', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-11-20 14:55:30', '2022-11-20 14:55:30'),
(34, 9, '/aplikasi/siswa/detail-tugas/11', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-11-20 14:55:31', '2022-11-20 14:55:31'),
(37, 4, '/aplikasi/siswa/detail-tugas/12', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-06 15:19:35', '2022-12-06 15:19:35'),
(38, 9, '/aplikasi/siswa/detail-tugas/12', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-06 15:19:36', '2022-12-06 15:19:36'),
(39, 8, '/aplikasi/siswa/detail-tugas/13', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-06 15:29:34', '2022-12-06 15:29:34'),
(40, 4, '/aplikasi/siswa/detail-tugas/13', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-06 15:29:35', '2022-12-06 15:29:35'),
(41, 9, '/aplikasi/siswa/detail-tugas/13', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-06 15:29:35', '2022-12-06 15:29:35'),
(42, 8, '/aplikasi/siswa/detail-tugas/14', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-06 15:29:37', '2022-12-06 15:29:37'),
(43, 4, '/aplikasi/siswa/detail-tugas/14', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-06 15:29:38', '2022-12-06 15:29:38'),
(44, 9, '/aplikasi/siswa/detail-tugas/14', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-06 15:29:39', '2022-12-06 15:29:39'),
(45, 6, '/aplikasi/guru/data-tugas-siswa/8/12', 'ardi kosasih mengumpulkan tugas pelajaran! cek disini sekarang.', 'fa-clipboard-list', 0, '2022-12-06 15:48:03', '2022-12-06 15:48:03'),
(46, 8, '/aplikasi/siswa/detail-tugas/15', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-07 14:12:31', '2022-12-07 14:12:31'),
(47, 4, '/aplikasi/siswa/detail-tugas/15', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-07 14:12:32', '2022-12-07 14:12:32'),
(48, 9, '/aplikasi/siswa/detail-tugas/15', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-07 14:12:33', '2022-12-07 14:12:33'),
(49, 6, '/aplikasi/guru/data-tugas-siswa/8/15', 'ardi kosasih mengumpulkan tugas pelajaran! cek disini sekarang.', 'fa-clipboard-list', 0, '2022-12-07 14:13:32', '2022-12-07 14:13:32'),
(50, 1, '/aplikasi/admin/hubungi', 'Lokasiii Mengirim pesan kepada kamu', 'fas fa-phone', 1, '2022-12-07 14:22:49', '2022-12-07 14:27:28'),
(51, 1, '/aplikasi/admin/laporan', 'ardi kosasih Melaporkan Sesuatu, Cek Sekarang!!!', 'fa-exclamation', 1, '2022-12-07 15:53:22', '2022-12-07 15:57:49'),
(52, 8, '/aplikasi/siswa/detail-tugas/16', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-07 16:04:52', '2022-12-07 16:04:52'),
(53, 4, '/aplikasi/siswa/detail-tugas/16', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-07 16:04:52', '2022-12-07 16:04:52'),
(54, 9, '/aplikasi/siswa/detail-tugas/16', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-07 16:04:53', '2022-12-07 16:04:53'),
(55, 6, '/aplikasi/guru/data-tugas-siswa/8/16', 'ardi kosasih mengumpulkan tugas pelajaran! cek disini sekarang.', 'fa-clipboard-list', 0, '2022-12-07 16:09:19', '2022-12-07 16:09:19'),
(56, 8, '/aplikasi/siswa/detail-tugas/17', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-07 16:17:13', '2022-12-07 16:17:13'),
(57, 4, '/aplikasi/siswa/detail-tugas/17', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-07 16:17:14', '2022-12-07 16:17:14'),
(58, 9, '/aplikasi/siswa/detail-tugas/17', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-07 16:17:15', '2022-12-07 16:17:15'),
(59, 1, '/aplikasi/data/ubah-siswa/11', 'Achmad  Telah mendaftarkan diri, Silahkan KONFIRMASI SEKARANG!!!', 'fa-user-plus', 1, '2022-12-07 16:18:42', '2022-12-07 16:19:33'),
(60, 1, '/aplikasi/data/ubah-siswa/12', 'Ahmad Ardiansyah Telah mendaftarkan diri, Silahkan KONFIRMASI SEKARANG!!!', 'fa-user-plus', 1, '2022-12-08 03:28:56', '2022-12-08 03:29:25'),
(61, 8, '/aplikasi/siswa/detail-tugas/18', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-08 03:40:52', '2022-12-08 03:40:52'),
(62, 4, '/aplikasi/siswa/detail-tugas/18', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-08 03:40:52', '2022-12-08 03:40:52'),
(63, 9, '/aplikasi/siswa/detail-tugas/18', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-08 03:40:53', '2022-12-08 03:40:53'),
(64, 11, '/aplikasi/siswa/detail-tugas/18', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-08 03:40:54', '2022-12-08 03:40:54'),
(65, 12, '/aplikasi/siswa/detail-tugas/18', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-08 03:40:55', '2022-12-08 03:40:55'),
(66, 6, '/aplikasi/guru/data-tugas-siswa/12/18', 'Ahmad Ardiansyah mengumpulkan tugas pelajaran! cek disini sekarang.', 'fa-clipboard-list', 0, '2022-12-08 03:42:01', '2022-12-08 03:42:01'),
(67, 6, '/aplikasi/guru/detail-tugas/18', 'Ahmad Ardiansyah mengomentari tugas kamu.', 'fa-comments', 0, '2022-12-08 03:44:17', '2022-12-08 03:44:17'),
(68, 8, '/aplikasi/siswa/detail-tugas/19', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-08 03:51:12', '2022-12-08 03:51:12'),
(69, 4, '/aplikasi/siswa/detail-tugas/19', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-08 03:51:13', '2022-12-08 03:51:13'),
(70, 9, '/aplikasi/siswa/detail-tugas/19', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-08 03:51:14', '2022-12-08 03:51:14'),
(71, 11, '/aplikasi/siswa/detail-tugas/19', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-08 03:51:14', '2022-12-08 03:51:14'),
(72, 12, '/aplikasi/siswa/detail-tugas/19', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-08 03:51:15', '2022-12-08 03:51:15'),
(73, 8, '/aplikasi/siswa/detail-tugas/20', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-14 05:35:17', '2022-12-14 05:35:17'),
(74, 4, '/aplikasi/siswa/detail-tugas/20', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-14 05:35:18', '2022-12-14 05:35:18'),
(75, 9, '/aplikasi/siswa/detail-tugas/20', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-14 05:35:19', '2022-12-14 05:35:19'),
(76, 11, '/aplikasi/siswa/detail-tugas/20', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-14 05:35:20', '2022-12-14 05:35:20'),
(77, 12, '/aplikasi/siswa/detail-tugas/20', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-14 05:35:20', '2022-12-14 05:35:20'),
(78, 14, '/aplikasi/guru/data-tugas-siswa/4/20', 'Rido Ananda mengumpulkan tugas pelajaran! cek disini sekarang.', 'fa-clipboard-list', 0, '2022-12-14 06:20:28', '2022-12-14 06:20:28'),
(79, 8, '/aplikasi/siswa/detail-tugas/21', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-16 02:12:50', '2022-12-16 02:12:50'),
(80, 4, '/aplikasi/siswa/detail-tugas/21', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-16 02:12:50', '2022-12-16 02:12:50'),
(81, 9, '/aplikasi/siswa/detail-tugas/21', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-16 02:12:50', '2022-12-16 02:12:50'),
(82, 11, '/aplikasi/siswa/detail-tugas/21', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-16 02:12:50', '2022-12-16 02:12:50'),
(83, 12, '/aplikasi/siswa/detail-tugas/21', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-16 02:12:50', '2022-12-16 02:12:50'),
(84, 8, '/aplikasi/siswa/detail-tugas/22', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-16 02:17:06', '2022-12-16 02:17:06'),
(85, 4, '/aplikasi/siswa/detail-tugas/22', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-16 02:17:06', '2022-12-16 02:17:06'),
(86, 9, '/aplikasi/siswa/detail-tugas/22', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-16 02:17:06', '2022-12-16 02:17:06'),
(87, 11, '/aplikasi/siswa/detail-tugas/22', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-16 02:17:06', '2022-12-16 02:17:06'),
(88, 12, '/aplikasi/siswa/detail-tugas/22', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-12-16 02:17:06', '2022-12-16 02:17:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tugas`
--

CREATE TABLE `tugas` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mapel` varchar(100) NOT NULL,
  `judul` text NOT NULL,
  `deskripsi` text NOT NULL,
  `ditugaskan` int(1) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'tugas',
  `deadline_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tugas`
--

INSERT INTO `tugas` (`id`, `user_id`, `mapel`, `judul`, `deskripsi`, `ditugaskan`, `type`, `deadline_at`, `created_at`, `updated_at`) VALUES
(5, 6, 'Bahasa Inggris', '1', '1212', 1, 'tugas', '2022-12-14 05:45:29', '2022-05-25 10:33:44', '2022-05-25 10:33:44'),
(8, 6, 'Bahasa Inggris', 'asdasd', 'mengubah tugas', 1, 'tugas', '2022-12-14 05:45:29', '2022-05-25 14:16:21', '2022-11-20 14:27:58'),
(10, 6, 'Bahasa Inggris', 'MATERI SPEAKING', 'berisi materi speaking', 0, 'tugas', '2022-12-14 05:45:29', '2022-11-20 14:55:24', '2022-11-20 14:55:24'),
(13, 6, 'Bahasa Inggris', 'Writing', 'catatan tentang writing', 0, 'tugas', '2022-12-14 05:45:29', '2022-12-06 15:29:33', '2022-12-06 15:29:33'),
(17, 6, 'Bahasa Inggris', 'Justification and Definition', 'Deskripsikan Justification dan definition', 1, 'tugas', '2022-12-14 05:45:29', '2022-12-07 16:17:11', '2022-12-07 16:17:11'),
(18, 6, 'Bahasa Inggris', 'Learning Past Tenste', 'Pelajari dan gunakan ', 1, 'tugas', '2022-12-14 05:45:29', '2022-12-08 03:40:50', '2022-12-08 03:41:28'),
(19, 6, 'Bahasa Inggris', 'Test Naik Tingkat', 'Test ini akan menentukan Apakah siswa akan naik tingkat atau tidak', 1, 'tugas', '2022-12-14 05:45:29', '2022-12-08 03:51:10', '2022-12-08 03:51:10'),
(20, 14, 'Bahasa Inggris', 'Create conversation', 'Create conversation of your version write them as word document', 1, 'tugas', '2022-12-14 05:45:29', '2022-12-14 05:35:15', '2022-12-14 06:20:45'),
(22, 14, 'Bahasa Inggris', 'Optio et sit quo re', 'asasd', 0, 'konten-pembelajaran', '0000-00-00 00:00:00', '2022-12-16 02:17:06', '2022-12-16 02:24:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `foto` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(20) NOT NULL DEFAULT 'Beginner',
  `cookie` varchar(100) NOT NULL,
  `role_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama_lengkap`, `slug`, `alamat`, `foto`, `email`, `password`, `level`, `cookie`, `role_id`, `mapel_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'Jalan Muara Karang no.30A', '1670423810_84e9eedfefd1578cae45.jpg', 'admin@gmail.com', '$2y$10$XepCb1terekH0ZGzkjFqcuB9s5fHot5M3iH1X9F7Wb69cR4lZ8Bym', 'Beginner', '73e46191910d94b3407fd3ccd1ebd1067fb327f63120314887744da95cdd3439', 1, 0, 1, '2022-12-07 14:37:08', '2022-12-07 14:37:08'),
(8, 'ardi kosasih', 'ardi-kosasih', 'Jalan Taruna jaya no.20a', '1670422621_ed52004b8cd726f06604.jpg', 'ardisyhr@gmail.com', '$2y$10$MQkbzL8gKGH67DIaLGrW.ORnP0KMioJuiyFcXUqIhsQbrn3EW5Xaa', 'Beginner', 'a1e95ad54bf89c4fef5a1b5cd03097ec573b3bab387659bf8aed9395d4decd31', 3, 0, 1, '2022-12-07 14:17:01', '2022-12-07 14:17:01'),
(4, 'Rido Ananda', 'rido-ananda', 'jalan marelan 1 pasar 4 barat', 'default.jpg', 'ridoananda123@gmail.com', '$2y$10$.OHSkbSpVzNW1plibGA1Uutq0GJjOQIpO5ELcfQQSDHBK24VReRzu', 'Beginner', 'f27123f210ea2c0a340f20ce06e4e9d91d1d4561d1c12ebe8d6dc8759565e5f6', 3, 2, 1, '2022-05-25 14:38:28', '2022-05-25 14:38:28'),
(6, 'Ardi Ramadhan', 'ardi-ramadhan', 'Jalan taruna no20 muara kama1', 'default.jpg', 'ardibahdim4@gmail.com', '$2y$10$3mkU0L2P7qj5kdvKyXuMZ.C00TMPYl7AmCwvuN9aUtZOBsKsBIIvi', 'Beginner', '1a9f867bd0d6fbfd239f5247fa7821b59ff543f305433b6919ea66cf1bb23144', 2, 3, 1, '2022-12-14 05:21:10', '2022-12-14 05:21:10'),
(9, 'marcelino una', 'marcelino-una', 'jalan ketapang 3 no.20', 'default.jpg', 'marcelinouna@gmail.com', '$2y$10$5GG9q6pl2h769wx/B45jfemKV5UBUZe6Q82BCoiHcPYsCs1MMJAca', 'Beginner', 'aa741ec195047b03f3bde502f6d31f84aad1a7473c9b010b78741ee8622794e4', 3, 0, 1, '2022-11-20 14:36:58', '2022-11-20 14:36:58'),
(10, 'Kosasih ', 'kosasih', 'Jalan Kerikil 2 no.20A', 'default.jpg', 'ardibahdim2@gmail.com', '$2y$10$/nb3uOVGDgroCNEgbMG20.uiOWbZw0uD1ueWILhc/Hu4pbIj9dXbG', 'Beginner', 'a1f7c815c4e790b2a2e168f4da2d53ad5c1bc76c5cfb678f4203aeddf28b7572', 2, 3, 1, '2022-12-07 14:37:46', '2022-12-07 14:37:46'),
(11, 'Achmad ', 'achmad', 'Jalan Depok No.20A Jakarta Selatan', 'default.jpg', 'achmad@upnvj.ac.id', '$2y$10$9s1oiBW0s9AKuiHoxbey0O4cBRxym50CUgj/2/fykFoSMYCB34Ghi', 'Beginner', '205e52c112334638c66352932752bfed5c2ad3e80e316261b548948f4e035c10', 3, 0, 1, '2022-12-07 16:20:51', '2022-12-07 16:20:51'),
(12, 'Ahmad Ardiansyah', 'ahmad-ardiansyah', 'Jalan Taruna Jaya no.20A', 'default.jpg', 'ardibahdim44@gmail.com', '$2y$10$Tt119TkkLNntWGnWDPW5VO750Ac5Zl3PNo6335XE0.7eUFQjO3GG.', 'Beginner', '0b7ea7998a0ad08dcc65917288588a73163446796a758eee4f50ca9c50ce44af', 3, 0, 1, '2022-12-08 03:29:41', '2022-12-08 03:29:41'),
(13, 'Rido Ananda', 'rido-ananda', 'jalan marelan 1 pasar 4 barat', 'default.jpg', 'ridoananda@gmail.com', '$2y$10$.OHSkbSpVzNW1plibGA1Uutq0GJjOQIpO5ELcfQQSDHBK24VReRzu', 'Beginner', 'f27123f210ea2c0a340f20ce06e4e9d91d1d4561d1c12ebe8d6dc8759565e5f6', 2, 2, 1, '2022-12-14 03:39:17', '2022-05-25 14:38:28'),
(14, 'Yaumil', 'yaumil', 'Medan', 'default.jpg', 'yaumil@gmail.com', '$2y$10$p9sCaadX9t2stgaNXJ8Lt.rSQOqlP.pf2fl0fkuB6v58flnsFBRtS', 'Intermediate', 'd07196cb6b628447fa430f9d7506caeb5ccf9c01e75cb77dda19d2e2b9f1295a', 2, 3, 1, '2022-12-14 05:36:57', '2022-12-14 05:36:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(2, 2, 2),
(3, 3, 3),
(5, 1, 1),
(6, 1, 4),
(7, 1, 5),
(10, 1, 6),
(11, 3, 6),
(12, 2, 6),
(13, 1, 7),
(14, 2, 7),
(15, 3, 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_mapel`
--

CREATE TABLE `user_mapel` (
  `id` int(11) NOT NULL,
  `user_role` int(11) NOT NULL,
  `mapel` varchar(100) DEFAULT NULL,
  `kelas` text DEFAULT NULL,
  `jurusan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_mapel`
--

INSERT INTO `user_mapel` (`id`, `user_role`, `mapel`, `kelas`, `jurusan`) VALUES
(3, 2, 'Bahasa Inggris', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'Guru'),
(3, 'Siswa'),
(4, 'Menu'),
(5, 'Data'),
(6, 'Profil');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Guru'),
(3, 'Siswa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Panduan', 'admin', 'fas fa-fw fa-tachometer-alt', 1),
(2, 4, 'Menu Management', 'menu', 'fas fa-fw fa-folder', 1),
(3, 4, 'Sub Menu Management', 'menu/submenu', 'far fa-fw fa-folder-open', 1),
(4, 1, 'Role', 'admin/role', 'fas fa-fw fa-user-tie', 1),
(5, 2, 'Halaman Utama', 'guru', 'fas fa-fw fa-home', 1),
(6, 2, 'Tugas', 'guru/tugas', 'fas fa-fw fa-clipboard-list', 1),
(8, 3, 'Halaman Utama', 'siswa', 'fas fa-fw fa-home', 1),
(9, 3, 'Tugas', 'siswa/forum-tugas', 'fas fa-tasks', 1),
(10, 6, 'Profil Saya', 'profil', 'fas fa-fw fa-user', 1),
(11, 6, 'Edit Profil', 'profil/edit', 'fas fa-fw fa-user-edit', 1),
(12, 6, 'Ubah Password', 'profil/ubah-password', 'fas fa-fw fa-user-lock', 1),
(13, 6, 'Log Aktivitas', 'profil/log-aktivitas', 'fas fa-fw fa-user-clock', 1),
(16, 1, 'User Mapel', 'admin/mapel', 'fas fa-fw fa-user-graduate', 0),
(17, 5, 'Guru', 'data', 'fas fa-fw fa-user-graduate', 1),
(18, 5, 'Siswa', 'data/siswa', 'fas fa-fw fa-user', 1),
(22, 1, 'Laporan', 'admin/laporan', 'fas fa-exclamation fa-fw', 1),
(23, 1, 'Hubungi', 'admin/hubungi', 'fas fa-fw fa-phone', 0),
(24, 3, 'Konten Pembelajaran', 'siswa/forum-konten-pembelajaran', 'fas fa-fw fa-book', 1),
(25, 2, 'Konten Pembelajaran', 'guru/konten-pembelajaran', 'fas fa-fw fa-book', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_tugas`
--
ALTER TABLE `data_tugas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `file_tugas`
--
ALTER TABLE `file_tugas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `hubungi`
--
ALTER TABLE `hubungi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `komentar_tugas`
--
ALTER TABLE `komentar_tugas`
  ADD PRIMARY KEY (`id`,`tugas_id`);

--
-- Indeks untuk tabel `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_mapel`
--
ALTER TABLE `user_mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `data_tugas`
--
ALTER TABLE `data_tugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `file_tugas`
--
ALTER TABLE `file_tugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `hubungi`
--
ALTER TABLE `hubungi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `komentar_tugas`
--
ALTER TABLE `komentar_tugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT untuk tabel `tugas`
--
ALTER TABLE `tugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `user_mapel`
--
ALTER TABLE `user_mapel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
