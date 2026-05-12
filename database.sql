CREATE DATABASE IF NOT EXISTS pt_sanita_akses_nusantara;

USE pt_sanita_akses_nusantara;

-- Tabel images: menyimpan semua aset gambar (logo, people, dll)
CREATE TABLE IF NOT EXISTS images (
  id_image INT AUTO_INCREMENT PRIMARY KEY,
  file_name VARCHAR(255) NOT NULL,
  category VARCHAR(50) NOT NULL,
  path VARCHAR(255) NOT NULL,
  type VARCHAR(50) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel clients: data klien/partner perusahaan
CREATE TABLE IF NOT EXISTS clients (
  id_client INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel our_team: data anggota tim, FK ke images untuk foto profil
CREATE TABLE IF NOT EXISTS our_team (
  id_team INT AUTO_INCREMENT PRIMARY KEY,
  member_id VARCHAR(50) NOT NULL UNIQUE,
  name VARCHAR(100) NOT NULL,
  short_name VARCHAR(50) NOT NULL,
  role VARCHAR(100) NOT NULL,
  quote TEXT NOT NULL,
  bio TEXT NOT NULL,
  id_image INT NOT NULL,
  theme ENUM('navy', 'gold') NOT NULL DEFAULT 'navy',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_team_image FOREIGN KEY (id_image) REFERENCES images(id_image)
    ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Tabel core_business: data layanan utama bisnis
CREATE TABLE IF NOT EXISTS core_business (
  id VARCHAR(50) PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  icon VARCHAR(50) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel core_business_items: list item per core business
CREATE TABLE IF NOT EXISTS core_business_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  business_id VARCHAR(50) NOT NULL,
  item_name VARCHAR(255) NOT NULL,
  CONSTRAINT fk_business_item FOREIGN KEY (business_id) REFERENCES core_business(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabel approach_steps: tahapan pendekatan kerja
CREATE TABLE IF NOT EXISTS approach_steps (
  step INT PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- Seed data: clients
-- =============================================
INSERT INTO clients (name) VALUES 
('HOTEL'), 
('RESTAURANT'), 
('CATERING'), 
('HOSPITAL'), 
('CORPORATE'), 
('INDUSTRY'),
('PT. PERTAMINA'),
('PT. PLN (PERSERO)'),
('KEMENTERIAN KESEHATAN'),
('PT. UNILEVER INDONESIA'),
('PT. INDOFOOD'),
('RS. SILOAM'),
('ASTRA INTERNATIONAL');

-- =============================================
-- Seed data: our_team (FK ke images NON TRANSPARENT people)
-- =============================================
INSERT INTO our_team (member_id, name, short_name, role, quote, bio, id_image, theme) VALUES
('fradiya', 'Fradiya Daffa P.', 'Fradiya', 'Komisaris',
 'Menjaga visi jangka panjang perusahaan dengan integritas dan inovasi berkelanjutan.',
 'Berkomitmen untuk mengarahkan PT. Sanita Akses Nusantara menjadi pemimpin pasar dalam penyediaan logistik dan peralatan industrial dengan standar kualitas tak tertandingi.',
 8, 'navy'),

('sandi', 'Sandi Irawan', 'Sandi', 'Direktur',
 'Komitmen kami adalah memberikan standar kualitas dan keamanan tertinggi dalam setiap pengadaan operasional klien.',
 'Dengan pengalaman ekstensif di industri ini, Sandi memastikan setiap strategi perusahaan tereksekusi dengan sempurna untuk mencapai tingkat kepuasan klien yang optimal.',
 9, 'gold'),

('wahyuning', 'Wahyuning Yuanita S.', 'Yuanita', 'General Manager',
 'Efisiensi operasional dan pengembangan SDM adalah fondasi utama kami dalam melayani klien.',
 'Yuanita mengawasi seluruh aktivitas operasional harian, memastikan komunikasi lintas departemen berjalan lancar dan semua prosedur perusahaan dipatuhi secara ketat.',
 10, 'navy'),

('darus', 'Darus Salam', 'Darus', 'Kepala Produksi',
 'Kualitas produk akhir bergantung pada ketelitian setiap tahapan dan integritas dalam proses produksi.',
 'Darus memimpin tim produksi untuk selalu menjaga standar keamanan dan kualitas sesuai HACCP dan ISO, secara konsisten menghasilkan output fabrikasi unggulan.',
 7, 'gold');
