-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Agu 2023 pada 02.38
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pmbstmik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `administrasi`
--

CREATE TABLE `administrasi` (
  `id_administrasi` int(11) NOT NULL,
  `id_identitas_siswa` int(11) NOT NULL,
  `harga` int(16) NOT NULL,
  `status` enum('Lunas','Belum Lunas') NOT NULL,
  `tgl_buat` datetime NOT NULL,
  `tgl_ubah` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `administrasi`
--

INSERT INTO `administrasi` (`id_administrasi`, `id_identitas_siswa`, `harga`, `status`, `tgl_buat`, `tgl_ubah`) VALUES
(5, 1, 2000000, 'Lunas', '2020-09-17 09:48:12', '2023-08-08 09:12:50'),
(6, 5, 2000000, 'Lunas', '2023-08-08 11:06:31', '2023-08-08 09:06:31');

--
-- Trigger `administrasi`
--
DELIMITER $$
CREATE TRIGGER `HapusAdministrasi` AFTER DELETE ON `administrasi` FOR EACH ROW BEGIN
  UPDATE identitas_siswa SET status_administrasi = 0 
  WHERE Id_Identitas_Siswa = OLD.id_identitas_siswa; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TambahAdministrasi` AFTER INSERT ON `administrasi` FOR EACH ROW BEGIN
  UPDATE identitas_siswa SET status_administrasi = 1 
  WHERE Id_Identitas_Siswa = NEW.id_identitas_siswa;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `identitas_siswa`
--

CREATE TABLE `identitas_siswa` (
  `Id_Identitas_Siswa` int(11) NOT NULL,
  `NISN` varchar(15) NOT NULL,
  `No_KK` varchar(20) NOT NULL,
  `NIK` varchar(16) NOT NULL,
  `Nama_Panggilan` text NOT NULL,
  `Nama_Peserta_Didik` text NOT NULL,
  `Tempat_Lahir` varchar(30) NOT NULL,
  `Tanggal_Lahir` date NOT NULL,
  `Jenis_Kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `Agama` varchar(9) NOT NULL,
  `Gol_Darah` varchar(5) NOT NULL,
  `Tinggi_Badan` varchar(4) NOT NULL,
  `Berat_Badan` varchar(3) NOT NULL,
  `Suku` varchar(10) NOT NULL,
  `Bahasa` varchar(12) NOT NULL,
  `Kewarganegaraan` varchar(10) NOT NULL,
  `Status_Anak` varchar(12) NOT NULL,
  `Anak_Ke` int(2) NOT NULL,
  `Jml_Saudara` int(2) NOT NULL,
  `Jenis_Tinggal` varchar(17) NOT NULL,
  `Alamat_Tinggal` text NOT NULL,
  `Provinsi_Tinggal` varchar(30) NOT NULL,
  `Kab_Kota_Tinggal` varchar(30) NOT NULL,
  `Kec_Tinggal` varchar(30) NOT NULL,
  `Kelurahan_Tinggal` varchar(30) NOT NULL,
  `Kode_POS` varchar(6) NOT NULL,
  `Jarak_Ke_Sekolah` varchar(5) NOT NULL,
  `Riwayat_Penyakit` text NOT NULL,
  `status_ortu` tinyint(1) NOT NULL,
  `status_administrasi` tinyint(1) NOT NULL,
  `tgl_buat` datetime NOT NULL,
  `tgl_ubah` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `identitas_siswa`
--

INSERT INTO `identitas_siswa` (`Id_Identitas_Siswa`, `NISN`, `No_KK`, `NIK`, `Nama_Panggilan`, `Nama_Peserta_Didik`, `Tempat_Lahir`, `Tanggal_Lahir`, `Jenis_Kelamin`, `Agama`, `Gol_Darah`, `Tinggi_Badan`, `Berat_Badan`, `Suku`, `Bahasa`, `Kewarganegaraan`, `Status_Anak`, `Anak_Ke`, `Jml_Saudara`, `Jenis_Tinggal`, `Alamat_Tinggal`, `Provinsi_Tinggal`, `Kab_Kota_Tinggal`, `Kec_Tinggal`, `Kelurahan_Tinggal`, `Kode_POS`, `Jarak_Ke_Sekolah`, `Riwayat_Penyakit`, `status_ortu`, `status_administrasi`, `tgl_buat`, `tgl_ubah`) VALUES
(1, '0987654321', '0001999901666444', '0001999901666444', 'Putri', 'Putri Narila', 'Sukabumi', '2002-07-06', 'Perempuan', 'Islam', 'A', '100', '50', 'Jawa', 'Indonesia', 'Indonesia', 'Jawa', 1, 3, 'Orang Tua', 'Lembur situ', 'Jawa Barat', 'Sukabumi', 'Lembur Situ', 'Lembur Situ', '43193', '20', 'Tidak Ada', 0, 1, '0000-00-00 00:00:00', '2023-08-08 09:11:55'),
(5, '1234567890', '1234567890098765', '1234567890098765', 'eri', 'Eri Maulana', 'Sukabumi', '2001-05-11', 'Laki-Laki', 'islam', 'o', '155', '40', 'sunda', 'Indonesia | ', 'WNI', 'sunda', 3, 2, 'Rumah Orang Tua', 'Kp. Pamoyanan 006/001', 'jawa barat', 'kab. sukabumi', 'kec. cireunghas', 'bencoy', '43193', '5', 'tidak ada', 1, 1, '0000-00-00 00:00:00', '2023-08-12 14:13:42'),
(6, '1111111111', '1111111111111111', '1111111111111111', 'xxx', 'xxx', 'xxx', '1111-11-11', 'Laki-Laki', 'xxx', 'xxx', '111', '111', 'xxx', 'xxx', 'xxx', 'xxx', 1, 1, 'xxx', 'xxx', 'xxx', 'xxx', 'xxx', 'xxx', '1111', '11111', 'xxx', 0, 0, '2023-08-10 05:45:43', '2023-08-10 03:45:43'),
(8, '2222222222', '2222222222222222', '2222222222222222', 'zzz', 'zzz', 'zzz', '2222-02-22', 'Perempuan', 'zzz', 'zzz', '222', '222', 'zzz', 'zzz', 'zzz', 'zzz', 2, 2, 'zzz', 'zzz', 'zzz', 'zzz', 'zzz', 'zzz', '222', '222', 'zzz', 1, 0, '2023-08-12 16:27:55', '2023-08-12 14:31:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orang_tua_wali`
--

CREATE TABLE `orang_tua_wali` (
  `Id_Orang_Tua_Wali` int(11) NOT NULL,
  `Id_Identitas_Siswa` int(11) NOT NULL,
  `Nama_Ayah` varchar(30) NOT NULL,
  `Status_Ayah` varchar(10) NOT NULL,
  `Tgl_Lahir_Ayah` date NOT NULL,
  `Telepon_Ayah` varchar(14) NOT NULL,
  `Pendidikan_Terakhir_Ayah` varchar(20) NOT NULL,
  `Pekerjaan_Ayah` varchar(30) NOT NULL,
  `Penghasilan_Ayah` varchar(10) NOT NULL,
  `Alamat_Ayah` varchar(165) NOT NULL,
  `Nama_Ibu` varchar(30) NOT NULL,
  `Status_Ibu` varchar(10) NOT NULL,
  `Tgl_Lahir_Ibu` date NOT NULL,
  `Telepon_Ibu` varchar(14) NOT NULL,
  `Pendidikan_Terakhir_Ibu` varchar(20) NOT NULL,
  `Pekerjaan_Ibu` varchar(30) NOT NULL,
  `Penghasilan_Ibu` varchar(10) NOT NULL,
  `Alamat_Ibu` varchar(165) NOT NULL,
  `Nama_Wali` varchar(30) NOT NULL,
  `Status_Wali` varchar(10) NOT NULL,
  `Tgl_Lahir_Wali` date NOT NULL,
  `Telepon_Wali` varchar(14) NOT NULL,
  `Pendidikan_Terakhir_Wali` varchar(20) NOT NULL,
  `Pekerjaan_Wali` varchar(30) NOT NULL,
  `Penghasilan_Wali` varchar(10) NOT NULL,
  `Alamat_Wali` varchar(165) NOT NULL,
  `tgl_buat` datetime NOT NULL,
  `tgl_ubah` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `orang_tua_wali`
--

INSERT INTO `orang_tua_wali` (`Id_Orang_Tua_Wali`, `Id_Identitas_Siswa`, `Nama_Ayah`, `Status_Ayah`, `Tgl_Lahir_Ayah`, `Telepon_Ayah`, `Pendidikan_Terakhir_Ayah`, `Pekerjaan_Ayah`, `Penghasilan_Ayah`, `Alamat_Ayah`, `Nama_Ibu`, `Status_Ibu`, `Tgl_Lahir_Ibu`, `Telepon_Ibu`, `Pendidikan_Terakhir_Ibu`, `Pekerjaan_Ibu`, `Penghasilan_Ibu`, `Alamat_Ibu`, `Nama_Wali`, `Status_Wali`, `Tgl_Lahir_Wali`, `Telepon_Wali`, `Pendidikan_Terakhir_Wali`, `Pekerjaan_Wali`, `Penghasilan_Wali`, `Alamat_Wali`, `tgl_buat`, `tgl_ubah`) VALUES
(5, 5, 'xxx', 'xxx', '1111-11-11', '1111111111111', 'xxx', 'xxx', '11111111', 'xxx', 'xxx', 'xxx', '1111-11-11', '111111111', 'xxx', 'xxx', '111111111', 'xxx', 'xxx', 'xxx', '1111-11-11', '111111111', 'xxx', 'xxx', '111111111', 'xxx', '2023-08-12 16:13:42', '2023-08-12 14:13:42'),
(6, 8, 'zzz', 'zzz', '2222-02-22', '222222222', 'zzz', 'zzz', '22222222', 'zzz', 'zzz', 'zzz', '2222-02-22', '2222222222', 'zzz', 'zzz', '2222222222', 'zzz', 'zzz', 'zzz', '2222-02-22', '2222222222', 'zzz', 'zzz', '2222222222', 'zzzz', '2023-08-12 16:31:37', '2023-08-12 14:31:37');

--
-- Trigger `orang_tua_wali`
--
DELIMITER $$
CREATE TRIGGER `HapusOrangTuaWali` AFTER DELETE ON `orang_tua_wali` FOR EACH ROW BEGIN
  UPDATE identitas_siswa SET status_ortu = 0 
  WHERE Id_Identitas_Siswa = OLD.Id_Identitas_Siswa;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TambahOrangTuaWali` AFTER INSERT ON `orang_tua_wali` FOR EACH ROW BEGIN
  UPDATE identitas_siswa SET status_ortu = 1 
  WHERE Id_Identitas_Siswa = NEW.Id_Identitas_Siswa;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` char(45) NOT NULL,
  `username` char(65) NOT NULL,
  `password` char(125) NOT NULL,
  `hak` enum('admin','pegawai') NOT NULL,
  `status` enum('aktif','tidak aktif') NOT NULL,
  `tgl_buat` datetime NOT NULL,
  `tgl_ubah` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`, `hak`, `status`, `tgl_buat`, `tgl_ubah`) VALUES
(7, 'eri', 'eri', 'eri', 'admin', 'aktif', '2023-08-08 10:52:53', '2023-08-08 08:53:13'),
(9, 'maulanaa', 'maulanaa', 'maulanaa', 'pegawai', 'aktif', '2023-08-08 11:05:42', '2023-08-08 09:05:42');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `administrasi`
--
ALTER TABLE `administrasi`
  ADD PRIMARY KEY (`id_administrasi`),
  ADD KEY `id_identitas_siswa` (`id_identitas_siswa`);

--
-- Indeks untuk tabel `identitas_siswa`
--
ALTER TABLE `identitas_siswa`
  ADD PRIMARY KEY (`Id_Identitas_Siswa`),
  ADD UNIQUE KEY `NISN` (`NISN`),
  ADD UNIQUE KEY `NIK` (`NIK`);

--
-- Indeks untuk tabel `orang_tua_wali`
--
ALTER TABLE `orang_tua_wali`
  ADD PRIMARY KEY (`Id_Orang_Tua_Wali`),
  ADD KEY `Id_Identitas_Siswa` (`Id_Identitas_Siswa`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `administrasi`
--
ALTER TABLE `administrasi`
  MODIFY `id_administrasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `identitas_siswa`
--
ALTER TABLE `identitas_siswa`
  MODIFY `Id_Identitas_Siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `orang_tua_wali`
--
ALTER TABLE `orang_tua_wali`
  MODIFY `Id_Orang_Tua_Wali` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `administrasi`
--
ALTER TABLE `administrasi`
  ADD CONSTRAINT `administrasi_ibfk_1` FOREIGN KEY (`id_identitas_siswa`) REFERENCES `identitas_siswa` (`Id_Identitas_Siswa`);

--
-- Ketidakleluasaan untuk tabel `orang_tua_wali`
--
ALTER TABLE `orang_tua_wali`
  ADD CONSTRAINT `orang_tua_wali_ibfk_1` FOREIGN KEY (`Id_Identitas_Siswa`) REFERENCES `identitas_siswa` (`Id_Identitas_Siswa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
