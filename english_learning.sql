-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Bulan Mei 2022 pada 10.44
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.11

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
  `id` int(255) NOT NULL,
  `tugas_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `is_kumpul` int(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `file_tugas`
--

CREATE TABLE `file_tugas` (
  `id` int(255) NOT NULL,
  `tugas_id` int(255) DEFAULT NULL,
  `data_tugas_id` int(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `ext` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `file_tugas`
--

INSERT INTO `file_tugas` (`id`, `tugas_id`, `data_tugas_id`, `name`, `ext`) VALUES
(2, NULL, 1, 'absen-kelas.png', 'png'),
(3, 2, NULL, 'logo.jpeg', 'jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hubungi`
--

CREATE TABLE `hubungi` (
  `id` int(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pesan` text NOT NULL,
  `ip_address` int(100) NOT NULL,
  `user_agent` varchar(100) NOT NULL,
  `created_at` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar_tugas`
--

CREATE TABLE `komentar_tugas` (
  `id` int(255) NOT NULL,
  `tugas_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `komentar` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_aktivitas`
--

CREATE TABLE `log_aktivitas` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `url` varchar(100) NOT NULL,
  `text` varchar(100) NOT NULL,
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
(8, 4, '/aplikasi/siswa/detail-tugas/3', 'TUGAS Bahasa Inggris! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list', 0, '2022-05-20 15:25:48', '2022-05-20 15:25:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tugas`
--

CREATE TABLE `tugas` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `mapel` varchar(100) NOT NULL,
  `judul` text NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `ditugaskan` int(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tugas`
--

INSERT INTO `tugas` (`id`, `user_id`, `mapel`, `judul`, `kategori`, `deskripsi`, `icon`, `ditugaskan`, `created_at`, `updated_at`) VALUES
(2, 5, 'Bahasa Inggris', 'Voluptatem irure et ', 'Quas perspiciatis i', 'Sit incidunt repreh', NULL, 1, '2022-05-20 14:47:02', '2022-05-20 14:47:02'),
(3, 5, 'Bahasa Inggris', 'Distinctio Laborios', 'Ut est qui aliquip s', 'Qui natus fugiat ips', NULL, 0, '2022-05-20 15:25:45', '2022-05-20 15:25:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `cookie` varchar(100) NOT NULL,
  `role_id` int(100) NOT NULL,
  `mapel_id` int(100) NOT NULL,
  `is_active` int(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama_lengkap`, `slug`, `alamat`, `foto`, `email`, `password`, `cookie`, `role_id`, `mapel_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'admin', 'default.jpg', 'admin@gmail.com', '$2y$10$XepCb1terekH0ZGzkjFqcuB9s5fHot5M3iH1X9F7Wb69cR4lZ8Bym', '73e46191910d94b3407fd3ccd1ebd1067fb327f63120314887744da95cdd3439', 1, 0, 1, '2022-05-21 08:43:20', '2020-12-18 07:22:22'),
(5, 'Rido Ananda', 'rido-ananda', 'jalan marelan 1 pasar 4 barat', 'default.jpg', 'ridoananda@gmail.com', '$2y$10$XepCb1terekH0ZGzkjFqcuB9s5fHot5M3iH1X9F7Wb69cR4lZ8Bym', 'c2c25c8d5819f481f15ea43ca0dffbc218577a6f7b2d3f451cb8751ffcf4193f', 2, 0, 1, '2022-05-21 08:43:24', '2022-05-20 09:25:41'),
(4, 'Rido Ananda', 'rido-ananda', 'jalan marelan 1 pasar 4 barat', 'default.jpg', 'ridoananda123@gmail.com', '$2y$10$XepCb1terekH0ZGzkjFqcuB9s5fHot5M3iH1X9F7Wb69cR4lZ8Bym', 'f27123f210ea2c0a340f20ce06e4e9d91d1d4561d1c12ebe8d6dc8759565e5f6', 3, 2, 1, '2022-05-21 08:43:28', '2022-05-20 07:58:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(100) NOT NULL,
  `role_id` int(100) NOT NULL,
  `menu_id` int(100) NOT NULL
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
  `id` int(255) NOT NULL,
  `user_role` int(100) NOT NULL,
  `mapel` varchar(100) DEFAULT NULL,
  `kelas` varchar(100) DEFAULT NULL,
  `jurusan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_mapel`
--

INSERT INTO `user_mapel` (`id`, `user_role`, `mapel`, `kelas`, `jurusan`) VALUES
(2, 3, NULL, 'XII', 'SMA'),
(3, 2, 'Bahasa Inggris', NULL, NULL),
(4, 3, NULL, 'XI', 'SMA'),
(5, 3, NULL, 'X', 'SMA'),
(6, 3, NULL, 'X', 'TKJ-1'),
(7, 3, NULL, 'X', 'TKJ-2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(100) NOT NULL,
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
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Guru'),
(3, 'Siswa'),
(4, 'Tata Usaha');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(255) NOT NULL,
  `menu_id` int(255) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Dashboard', 'admin', 'fas fa-fw fa-tachometer-alt', 1),
(2, 4, 'Menu Management', 'menu', 'fas fa-fw fa-folder', 1),
(3, 4, 'Sub Menu Management', 'menu/submenu', 'far fa-fw fa-folder-open', 1),
(4, 1, 'Role', 'admin/role', 'fas fa-fw fa-user-tie', 1),
(5, 2, 'Halaman Utama', 'guru', 'fas fa-fw fa-home', 1),
(6, 2, 'Tugas Kelas', 'guru/tugas', 'fas fa-fw fa-clipboard-list', 1),
(8, 3, 'Halaman Utama', 'siswa', 'fas fa-fw fa-home', 1),
(9, 3, 'Forum Tugas', 'siswa/forum-tugas', 'fas fa-fw fa-comments', 1),
(10, 6, 'Profil Saya', 'profil', 'fas fa-fw fa-user', 1),
(11, 6, 'Edit Profil', 'profil/edit', 'fas fa-fw fa-user-edit', 1),
(12, 6, 'Ubah Password', 'profil/ubah-password', 'fas fa-fw fa-user-lock', 1),
(13, 6, 'Log Aktivitas', 'profil/log-aktivitas', 'fas fa-fw fa-user-clock', 1),
(14, 3, 'Absen Kelas', 'siswa/absen', 'fas fa-fw fa-calendar-check', 0),
(15, 2, 'Absen Kelas', 'guru/absen', 'fas fa-fw fa-calendar-check', 0),
(16, 1, 'User Mapel', 'admin/mapel', 'fas fa-fw fa-user-graduate', 1),
(17, 5, 'Guru', 'data', 'fas fa-fw fa-user-graduate', 1),
(18, 5, 'Siswa', 'data/siswa', 'fas fa-fw fa-user', 1),
(19, 2, 'Artikel', 'guru/artikel', 'far fa-fw fa-list-alt', 0),
(21, 5, 'Artikel', 'data/artikel', 'far fa-fw fa-list-alt', 0),
(22, 1, 'Laporan', 'admin/laporan', 'fas fa-exclamation fa-fw', 1),
(23, 1, 'Hubungi', 'admin/hubungi', 'fas fa-fw fa-phone', 1);

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
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `file_tugas`
--
ALTER TABLE `file_tugas`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `hubungi`
--
ALTER TABLE `hubungi`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `komentar_tugas`
--
ALTER TABLE `komentar_tugas`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tugas`
--
ALTER TABLE `tugas`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `user_mapel`
--
ALTER TABLE `user_mapel`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
