-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Bulan Mei 2026 pada 09.50
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pt_sanita_akses_nusantara`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `approach_steps`
--

CREATE TABLE `approach_steps` (
  `step` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `approach_steps`
--

INSERT INTO `approach_steps` (`step`, `title`, `description`, `created_at`) VALUES
(1, 'Understanding Needs', 'Kami memulai setiap proyek dengan memahami kebutuhan klien secara menyeluruh melalui diskusi, survei lapangan, dan analisis teknis agar solusi yang diberikan tepat sasaran.', '2026-05-12 07:02:25'),
(2, 'Planning & Design', 'Setiap solusi dirancang secara detail berdasarkan kebutuhan operasional klien, dengan mempertimbangkan efisiensi, keamanan, dan keberlanjutan sistem.', '2026-05-12 07:02:25'),
(3, 'Execution', 'Proyek dilaksanakan oleh tim profesional yang berpengalaman dengan standar kerja tinggi, tepat waktu, dan sesuai spesifikasi yang disepakati.', '2026-05-12 07:02:25'),
(4, 'Quality Control', 'Setiap proses pekerjaan melalui tahap pengecekan kualitas untuk memastikan hasil akhir sesuai standar perusahaan dan harapan klien.', '2026-05-12 07:02:25'),
(5, 'Maintenance & Support', 'Kami memberikan layanan purna jual berupa maintenance dan support untuk memastikan sistem tetap berjalan optimal dan berkelanjutan.', '2026-05-12 07:02:25'),
(6, 'Continuous Improvement', 'Kami terus melakukan evaluasi dan inovasi agar layanan dan solusi yang diberikan selalu relevan dengan perkembangan kebutuhan industri.', '2026-05-12 07:02:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `clients`
--

INSERT INTO `clients` (`id_client`, `name`, `created_at`) VALUES
(1, 'HOTEL', '2026-05-12 00:45:28'),
(2, 'RESTAURANT', '2026-05-12 00:45:28'),
(3, 'CATERING', '2026-05-12 00:45:28'),
(4, 'HOSPITAL', '2026-05-12 00:45:28'),
(5, 'CORPORATE', '2026-05-12 00:45:28'),
(6, 'INDUSTRY', '2026-05-12 00:45:28'),
(7, 'PT. PERTAMINA', '2026-05-12 00:45:28'),
(8, 'PT. PLN (PERSERO)', '2026-05-12 00:45:28'),
(9, 'KEMENTERIAN KESEHATAN', '2026-05-12 00:45:28'),
(10, 'PT. UNILEVER INDONESIA', '2026-05-12 00:45:28'),
(11, 'PT. INDOFOOD', '2026-05-12 00:45:28'),
(12, 'RS. SILOAM', '2026-05-12 00:45:28'),
(13, 'ASTRA INTERNATIONAL', '2026-05-12 00:45:28'),
(14, 'HOTEL', '2026-05-12 07:02:24'),
(15, 'RESTAURANT', '2026-05-12 07:02:24'),
(16, 'CATERING', '2026-05-12 07:02:24'),
(17, 'HOSPITAL', '2026-05-12 07:02:24'),
(18, 'CORPORATE', '2026-05-12 07:02:24'),
(19, 'INDUSTRY', '2026-05-12 07:02:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `core_business`
--

CREATE TABLE `core_business` (
  `id` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `icon` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `core_business`
--

INSERT INTO `core_business` (`id`, `title`, `description`, `icon`, `created_at`) VALUES
('distribution', 'Distribution & Logistics', 'Layanan distribusi barang dan kebutuhan operasional secara tepat waktu dan terorganisir.', 'Truck', '2026-05-12 07:02:25'),
('kitchen-equipment', 'Kitchen Equipment Supply', 'Penyediaan perlengkapan dan peralatan dapur untuk kebutuhan usaha dan operasional.', 'Utensils', '2026-05-12 07:02:24'),
('operational', 'Operational & Facility Support', 'Penyediaan kebutuhan penunjang operasional usaha secara profesional dan efisien.', 'Settings', '2026-05-12 07:02:25'),
('procurement', 'Procurement & General Trading', 'Pengadaan berbagai kebutuhan barang dan perlengkapan usaha secara efektif dan terpercaya.', 'ShoppingCart', '2026-05-12 07:02:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `core_business_items`
--

CREATE TABLE `core_business_items` (
  `id` int(11) NOT NULL,
  `business_id` varchar(50) NOT NULL,
  `item_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `core_business_items`
--

INSERT INTO `core_business_items` (`id`, `business_id`, `item_name`) VALUES
(1, 'kitchen-equipment', 'Peralatan dapur stainless'),
(2, 'kitchen-equipment', 'Cooking equipment'),
(3, 'kitchen-equipment', 'Kitchen utensils'),
(4, 'kitchen-equipment', 'Storage & serving equipment'),
(5, 'procurement', 'General supply'),
(6, 'procurement', 'Operational equipment'),
(7, 'procurement', 'Business procurement'),
(8, 'procurement', 'Commercial supplies'),
(9, 'distribution', 'Pengiriman barang'),
(10, 'distribution', 'Distribusi operasional'),
(11, 'distribution', 'Logistic support'),
(12, 'distribution', 'Supply distribution'),
(13, 'operational', 'Operational support'),
(14, 'operational', 'Facility equipment'),
(15, 'operational', 'Supporting supplies'),
(16, 'operational', 'Business operational needs');

-- --------------------------------------------------------

--
-- Struktur dari tabel `images`
--

CREATE TABLE `images` (
  `id_image` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `category` varchar(50) NOT NULL,
  `path` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `images`
--

INSERT INTO `images` (`id_image`, `file_name`, `category`, `path`, `type`, `created_at`) VALUES
(1, '(NON TRANSPARENT) FULL LOGO PT. SANITA AKSES NUSANTARA.png', 'logo', '/assets/logo/(NON TRANSPARENT) FULL LOGO PT. SANITA AKSES NUSANTARA.png', 'non-transparant', '2026-05-12 07:11:26'),
(2, '(NON TRANSPARENT) LOGO GAMBAR PT. SANITA AKSES NUSANTARA.png', 'logo', '/assets/logo/(NON TRANSPARENT) LOGO GAMBAR PT. SANITA AKSES NUSANTARA.png', 'non-transparant', '2026-05-12 07:11:26'),
(3, '(NON TRANSPARENT) LOGO TEKS PT. SANITA AKSES NUSANTARA.png', 'logo', '/assets/logo/(NON TRANSPARENT) LOGO TEKS PT. SANITA AKSES NUSANTARA.png', 'non-transparant', '2026-05-12 07:11:26'),
(4, '(TRANSPARENT) FULL LOGO PT. SANITA AKSES NUSANTARA.png', 'logo', '/assets/logo/(TRANSPARENT) FULL LOGO PT. SANITA AKSES NUSANTARA.png', 'transparant', '2026-05-12 07:11:26'),
(5, '(TRANSPARENT) LOGO GAMBAR PT. SANITA AKSES NUSANTARA.png', 'logo', '/assets/logo/(TRANSPARENT) LOGO GAMBAR PT. SANITA AKSES NUSANTARA.png', 'transparant', '2026-05-12 07:11:26'),
(6, '(TRANSPARENT) LOGO TEKS PT. SANITA AKSES NUSANTARA.png', 'logo', '/assets/logo/(TRANSPARENT) LOGO TEKS PT. SANITA AKSES NUSANTARA.png', 'transparant', '2026-05-12 07:11:26'),
(7, '(NON TRANSPARENT) Darus_Salam-KEPALA-PRODUKSI.png', 'people', '/assets/people/(NON TRANSPARENT) Darus_Salam-KEPALA-PRODUKSI.png', 'non-transparant', '2026-05-12 07:11:26'),
(8, '(NON TRANSPARENT) Fradiya_Daffa_Pangestu-KOMISARIS.png', 'people', '/assets/people/(NON TRANSPARENT) Fradiya_Daffa_Pangestu-KOMISARIS.png', 'non-transparant', '2026-05-12 07:11:26'),
(9, '(NON TRANSPARENT) Sandi_Irawan-DIREKTUR.png', 'people', '/assets/people/(NON TRANSPARENT) Sandi_Irawan-DIREKTUR.png', 'non-transparant', '2026-05-12 07:11:26'),
(10, '(NON TRANSPARENT) Wahyuning_Yuanita_S-GENERAL-MANAGER.png', 'people', '/assets/people/(NON TRANSPARENT) Wahyuning_Yuanita_S-GENERAL-MANAGER.png', 'non-transparant', '2026-05-12 07:11:26'),
(11, '(TRANSPARENT) Darus_Salam-KEPALA-PRODUKSI.png', 'people', '/assets/people/(TRANSPARENT) Darus_Salam-KEPALA-PRODUKSI.png', 'transparant', '2026-05-12 07:11:26'),
(12, '(TRANSPARENT) Fradiya_Daffa_Pangestu-KOMISARIS.png', 'people', '/assets/people/(TRANSPARENT) Fradiya_Daffa_Pangestu-KOMISARIS.png', 'transparant', '2026-05-12 07:11:26'),
(13, '(TRANSPARENT) Sandi_Irawan-DIREKTUR.png', 'people', '/assets/people/(TRANSPARENT) Sandi_Irawan-DIREKTUR.png', 'transparant', '2026-05-12 07:11:26'),
(14, '(TRANSPARENT) Wahyuning_Yuanita_S-GENERAL-MANAGER.png', 'people', '/assets/people/(TRANSPARENT) Wahyuning_Yuanita_S-GENERAL-MANAGER.png', 'transparant', '2026-05-12 07:11:26'),
(15, 'Axial Fan Blower.JPG.jpeg', 'catalog', '/assets/catalog/Axial Fan Blower.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(16, 'Chiller.JPG.jpeg', 'catalog', '/assets/catalog/Chiller.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(17, 'Coffe & Tea Maker.JPG.jpeg', 'catalog', '/assets/catalog/Coffe & Tea Maker.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(18, 'Coffe Machine.JPG.jpeg', 'catalog', '/assets/catalog/Coffe Machine.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(19, 'Deep Fryer.JPG.jpeg', 'catalog', '/assets/catalog/Deep Fryer.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(20, 'Food Tray Line.JPG.jpeg', 'catalog', '/assets/catalog/Food Tray Line.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(21, 'Food Warmer.JPG.jpeg', 'catalog', '/assets/catalog/Food Warmer.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(22, 'Freezer.JPG.jpeg', 'catalog', '/assets/catalog/Freezer.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(23, 'Grease Trap Kap.500 Li.JPG.jpeg', 'catalog', '/assets/catalog/Grease Trap Kap.500 Li.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(24, 'IPAL Portable .JPG.jpeg', 'catalog', '/assets/catalog/IPAL Portable .JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(25, 'Kabinet.JPG.jpeg', 'catalog', '/assets/catalog/Kabinet.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(26, 'Kitchen SinkWastafel.JPG.jpeg', 'catalog', '/assets/catalog/Kitchen SinkWastafel.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(27, 'Kompor Gas 1 Tunggu.JPG.jpeg', 'catalog', '/assets/catalog/Kompor Gas 1 Tunggu.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(28, 'Kompor Induksi.JPG.jpeg', 'catalog', '/assets/catalog/Kompor Induksi.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(29, 'Kuali Range.JPG.jpeg', 'catalog', '/assets/catalog/Kuali Range.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(30, 'Loker.JPG.jpeg', 'catalog', '/assets/catalog/Loker.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(31, 'Loyang Oven.JPG.jpeg', 'catalog', '/assets/catalog/Loyang Oven.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(32, 'Mesin Ceplok Telor.JPG.jpeg', 'catalog', '/assets/catalog/Mesin Ceplok Telor.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(33, 'Mesin Cuci Beras.JPG.jpeg', 'catalog', '/assets/catalog/Mesin Cuci Beras.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(34, 'Mesin Cuci Ompreng.JPG.jpeg', 'catalog', '/assets/catalog/Mesin Cuci Ompreng.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(35, 'Mesin Pemotong Sayur.JPG.jpeg', 'catalog', '/assets/catalog/Mesin Pemotong Sayur.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(36, 'Microwave.JPG.jpeg', 'catalog', '/assets/catalog/Microwave.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(37, 'Ompreng.JPG.jpeg', 'catalog', '/assets/catalog/Ompreng.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(38, 'Oven Ayam.JPG.jpeg', 'catalog', '/assets/catalog/Oven Ayam.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(39, 'Panci Kukus.JPG.jpeg', 'catalog', '/assets/catalog/Panci Kukus.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(40, 'Panci Mie.JPG.jpeg', 'catalog', '/assets/catalog/Panci Mie.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(41, 'Panggangan Gas.JPG.jpeg', 'catalog', '/assets/catalog/Panggangan Gas.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(42, 'Penggiling Daging.JPG.jpeg', 'catalog', '/assets/catalog/Penggiling Daging.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(43, 'Proofer Roti.JPG.jpeg', 'catalog', '/assets/catalog/Proofer Roti.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(44, 'Proofer.JPG.jpeg', 'catalog', '/assets/catalog/Proofer.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(45, 'Rak Susun Stainless.JPG.jpeg', 'catalog', '/assets/catalog/Rak Susun Stainless.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(46, 'Rak Troli 2 Susun.JPG.jpeg', 'catalog', '/assets/catalog/Rak Troli 2 Susun.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(47, 'Rak Troli 3 Susun.JPG.jpeg', 'catalog', '/assets/catalog/Rak Troli 3 Susun.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(48, 'Rak Troly 2 Susun.JPG.jpeg', 'catalog', '/assets/catalog/Rak Troly 2 Susun.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(49, 'Rice Steamer.JPG.jpeg', 'catalog', '/assets/catalog/Rice Steamer.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(50, 'Set Alat Masak.JPG.jpeg', 'catalog', '/assets/catalog/Set Alat Masak.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(51, 'Showcase.JPG.jpeg', 'catalog', '/assets/catalog/Showcase.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(52, 'Showcasee.JPG.jpeg', 'catalog', '/assets/catalog/Showcasee.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(53, 'Spiral Mixer.JPG.jpeg', 'catalog', '/assets/catalog/Spiral Mixer.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26'),
(54, 'Wastafel 3 Lubang.JPG.jpeg', 'catalog', '/assets/catalog/Wastafel 3 Lubang.JPG.jpeg', 'non-transparant', '2026-05-12 07:11:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `our_team`
--

CREATE TABLE `our_team` (
  `id_team` int(11) NOT NULL,
  `member_id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `short_name` varchar(50) NOT NULL,
  `role` varchar(100) NOT NULL,
  `quote` text NOT NULL,
  `bio` text NOT NULL,
  `id_image` int(11) NOT NULL,
  `theme` enum('navy','gold') NOT NULL DEFAULT 'navy',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `our_team`
--

INSERT INTO `our_team` (`id_team`, `member_id`, `name`, `short_name`, `role`, `quote`, `bio`, `id_image`, `theme`, `created_at`) VALUES
(1, 'fradiya', 'Fradiya Daffa P.', 'Fradiya', 'Komisaris', 'Menjaga visi jangka panjang perusahaan dengan integritas dan inovasi berkelanjutan.', 'Berkomitmen untuk mengarahkan PT. Sanita Akses Nusantara menjadi pemimpin pasar dalam penyediaan logistik dan peralatan industrial dengan standar kualitas tak tertandingi.', 8, 'navy', '2026-05-12 00:19:23'),
(2, 'sandi', 'Sandi Irawan', 'Sandi', 'Direktur', 'Komitmen kami adalah memberikan standar kualitas dan keamanan tertinggi dalam setiap pengadaan operasional klien.', 'Dengan pengalaman ekstensif di industri ini, Sandi memastikan setiap strategi perusahaan tereksekusi dengan sempurna untuk mencapai tingkat kepuasan klien yang optimal.', 9, 'gold', '2026-05-12 00:19:23'),
(3, 'wahyuning', 'Wahyuning Yuanita S.', 'Yuanita', 'General Manager', 'Efisiensi operasional dan pengembangan SDM adalah fondasi utama kami dalam melayani klien.', 'Yuanita mengawasi seluruh aktivitas operasional harian, memastikan komunikasi lintas departemen berjalan lancar dan semua prosedur perusahaan dipatuhi secara ketat.', 10, 'navy', '2026-05-12 00:19:23'),
(4, 'darus', 'Darus Salam', 'Darus', 'Kepala Produksi', 'Kualitas produk akhir bergantung pada ketelitian setiap tahapan dan integritas dalam proses produksi.', 'Darus memimpin tim produksi untuk selalu menjaga standar keamanan dan kualitas sesuai HACCP dan ISO, secara konsisten menghasilkan output fabrikasi unggulan.', 7, 'gold', '2026-05-12 00:19:23');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `approach_steps`
--
ALTER TABLE `approach_steps`
  ADD PRIMARY KEY (`step`);

--
-- Indeks untuk tabel `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Indeks untuk tabel `core_business`
--
ALTER TABLE `core_business`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `core_business_items`
--
ALTER TABLE `core_business_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_business_item` (`business_id`);

--
-- Indeks untuk tabel `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id_image`);

--
-- Indeks untuk tabel `our_team`
--
ALTER TABLE `our_team`
  ADD PRIMARY KEY (`id_team`),
  ADD UNIQUE KEY `member_id` (`member_id`),
  ADD KEY `fk_team_image` (`id_image`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `core_business_items`
--
ALTER TABLE `core_business_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `images`
--
ALTER TABLE `images`
  MODIFY `id_image` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT untuk tabel `our_team`
--
ALTER TABLE `our_team`
  MODIFY `id_team` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `core_business_items`
--
ALTER TABLE `core_business_items`
  ADD CONSTRAINT `fk_business_item` FOREIGN KEY (`business_id`) REFERENCES `core_business` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `our_team`
--
ALTER TABLE `our_team`
  ADD CONSTRAINT `fk_team_image` FOREIGN KEY (`id_image`) REFERENCES `images` (`id_image`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
