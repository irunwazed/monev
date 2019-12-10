-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2019 at 03:43 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_eplaining_monev`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_bidang`
--

CREATE TABLE `tb_bidang` (
  `tb_urusan_kode` int(11) NOT NULL,
  `tb_bidang_kode` int(11) NOT NULL,
  `tb_bidang_nama` varchar(250) DEFAULT NULL,
  `tb_fungsi_kode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_bidang`
--

INSERT INTO `tb_bidang` (`tb_urusan_kode`, `tb_bidang_kode`, `tb_bidang_nama`, `tb_fungsi_kode`) VALUES
(1, 1, 'Pendidikan', 10),
(1, 2, 'Kesehatan', 7),
(1, 3, 'Pekerjaan Umum dan Penataan Ruang', 6),
(1, 4, 'Perumahan Rakyat dan Kawasan Pemukiman', 6),
(1, 5, 'Ketentraman dan Ketertiban Umum serta Perlindungan Masyarakat', 3),
(1, 6, 'Sosial', 11),
(2, 1, 'Tenaga Kerja', 4),
(2, 5, 'Lingkungan Hidup', 5),
(2, 6, 'Administrasi Kependudukan dan Capil', 11),
(2, 7, 'Pemberdayaan Masyarakat Desa', 4),
(2, 9, 'Perhubungan', 4),
(2, 10, 'Komunikasi dan Informatika', 1),
(2, 11, 'Koperasi, Usaha Kecil dan Menengah', 4),
(2, 12, 'Penanaman Modal', 4),
(2, 13, 'Kepemudaan dan Olah Raga', 10),
(2, 17, 'Perpustakaan', 10),
(3, 1, 'Kelautan dan Perikanan', 4),
(3, 3, 'Pertanian', 4),
(3, 6, 'Perdagangan', 4),
(4, 1, 'Penunjang Administrasi Pemerintahan', 1),
(4, 2, 'Penunjang Pengawasan', 1),
(4, 3, 'Penunjang Perencanaan', 1),
(4, 4, 'Penunjang Keuangan ', 1),
(4, 5, 'Penunjang Kepegawaian', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_dapil`
--

CREATE TABLE `tb_dapil` (
  `tb_dapil_kode` int(11) NOT NULL,
  `tb_dapil_nama` varchar(45) DEFAULT NULL,
  `tb_dapil_tahun` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_deskel`
--

CREATE TABLE `tb_deskel` (
  `tb_provinsi_kode` int(11) NOT NULL,
  `tb_kabupaten_kode` int(11) NOT NULL,
  `tb_kecamatan_kode` int(11) NOT NULL,
  `tb_deskel_kode` int(11) NOT NULL,
  `tb_deskel_level` tinyint(4) NOT NULL COMMENT '1. kel\n2. desa\n',
  `tb_deskel_nama` varchar(105) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_dewan`
--

CREATE TABLE `tb_dewan` (
  `tb_dapil_kode` int(11) NOT NULL,
  `tb_dewan_kode` int(11) NOT NULL,
  `tb_dewan_nama` varchar(45) DEFAULT NULL,
  `tb_dewan_tahun` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_fungsi`
--

CREATE TABLE `tb_fungsi` (
  `tb_fungsi_kode` int(11) NOT NULL,
  `tb_fungsi_nama` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_fungsi`
--

INSERT INTO `tb_fungsi` (`tb_fungsi_kode`, `tb_fungsi_nama`) VALUES
(1, 'Pelayanan Umum'),
(2, 'Pertahanan'),
(3, 'Ketertiban dan Keamanan'),
(4, 'Ekonomi'),
(5, 'Lingkungan Hidup'),
(6, 'Perumahan dan Fasilitas Umum'),
(7, 'Kesehatan'),
(8, 'Pariwisata dan Budaya'),
(9, 'Agama'),
(10, 'Pendidikan'),
(11, 'Perlindungan Sosial');

-- --------------------------------------------------------

--
-- Table structure for table `tb_indikator`
--

CREATE TABLE `tb_indikator` (
  `id_tb_indikator` int(11) NOT NULL,
  `tb_indikator_nama` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_indikator`
--

INSERT INTO `tb_indikator` (`id_tb_indikator`, `tb_indikator_nama`) VALUES
(1, 'Ekonomi'),
(2, 'Infrastruktur'),
(3, 'Sosial Budaya');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kabupaten`
--

CREATE TABLE `tb_kabupaten` (
  `tb_provinsi_kode` int(11) NOT NULL,
  `tb_kabupaten_kode` int(11) NOT NULL,
  `tb_kabupaten_nama` varchar(105) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori_laporan`
--

CREATE TABLE `tb_kategori_laporan` (
  `id_tb_kategori_laporan` int(11) NOT NULL,
  `tb_urusan_kode` int(11) NOT NULL,
  `tb_bidang_kode` int(11) NOT NULL,
  `tb_unit_kode` int(11) NOT NULL,
  `tb_sub_unit_kode` int(11) NOT NULL,
  `tb_kategori_laporan_nama` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kecamatan`
--

CREATE TABLE `tb_kecamatan` (
  `tb_provinsi_kode` int(11) NOT NULL,
  `tb_kabupaten_kode` int(11) NOT NULL,
  `tb_kecamatan_kode` int(11) NOT NULL,
  `tb_kecamatan_nama` varchar(105) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kegiatan`
--

CREATE TABLE `tb_kegiatan` (
  `tb_urusan_kode` int(11) NOT NULL,
  `tb_bidang_kode` int(11) NOT NULL,
  `tb_program_kode` int(11) NOT NULL,
  `tb_kegiatan_kode` int(11) NOT NULL,
  `tb_kegiatan_nama` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kegiatan`
--

INSERT INTO `tb_kegiatan` (`tb_urusan_kode`, `tb_bidang_kode`, `tb_program_kode`, `tb_kegiatan_kode`, `tb_kegiatan_nama`) VALUES
(1, 1, 1, 1, 'Penyediaan jasa surat penyurat');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kriteria_bobot`
--

CREATE TABLE `tb_kriteria_bobot` (
  `id_tb_kriteria_bobot` int(11) NOT NULL,
  `id_tb_kriteria_pembobotan` int(11) NOT NULL,
  `tb_kriteria_bobot_level` int(11) NOT NULL,
  `tb_kriteria_bobot_range` varchar(45) DEFAULT NULL,
  `tb_kriteria_bobot_skor` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kriteria_pembobotan`
--

CREATE TABLE `tb_kriteria_pembobotan` (
  `id_tb_kriteria_pembobotan` int(11) NOT NULL,
  `tb_kriteria_pembobotan_nama` varchar(150) DEFAULT NULL,
  `tb_kriteria_pembobotan_bobot` double DEFAULT NULL,
  `tb_kriteria_pembobotan_ket` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_laporan`
--

CREATE TABLE `tb_laporan` (
  `id_tb_laporan` int(11) NOT NULL,
  `id_tb_laporan_user` int(11) NOT NULL,
  `id_tb_kategori_laporan` int(11) NOT NULL,
  `tb_laporan_foto` varchar(150) DEFAULT NULL,
  `tb_laporan_deskripsi` varchar(250) DEFAULT NULL,
  `tb_laporan_lat` float DEFAULT NULL,
  `tb_laporan_lng` float DEFAULT NULL,
  `tb_laporan_lokasi` varchar(250) DEFAULT NULL,
  `tb_laporan_date_time` datetime DEFAULT NULL,
  `tb_laporan_tahap` tinyint(4) DEFAULT NULL,
  `tb_laporan_jenis` tinyint(4) DEFAULT NULL,
  `tb_laporan_rating` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_laporan_dukung`
--

CREATE TABLE `tb_laporan_dukung` (
  `id_tb_laporan_dukung` int(11) NOT NULL,
  `id_tb_laporan` int(11) NOT NULL,
  `id_tb_laporan_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_laporan_komentar`
--

CREATE TABLE `tb_laporan_komentar` (
  `id_tb_laporan_komentar` int(11) NOT NULL,
  `id_tb_laporan` int(11) NOT NULL,
  `id_tb_laporan_user` int(11) NOT NULL,
  `tb_laporan_komentar_komentar` varchar(250) DEFAULT NULL,
  `tb_laporan_komentar_lat` float DEFAULT NULL,
  `tb_laporan_komentar_lng` float DEFAULT NULL,
  `tb_laporan_komentar_lokasi` varchar(250) DEFAULT NULL,
  `tb_laporan_komentar_date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_laporan_user`
--

CREATE TABLE `tb_laporan_user` (
  `id_tb_laporan_user` int(11) NOT NULL,
  `id_tb_user` int(11) NOT NULL,
  `tb_laporan_user_rating` int(11) DEFAULT NULL,
  `tb_laporan_user_display` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_misi_agenda_nawa`
--

CREATE TABLE `tb_misi_agenda_nawa` (
  `id_tb_misi_agenda_nawa` int(11) NOT NULL,
  `tb_misi_agenda_nawa_nama` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_misi_prov`
--

CREATE TABLE `tb_misi_prov` (
  `id_tb_misi_prov` int(11) NOT NULL,
  `tb_misi_prov_nama` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_misi_rpjmd_lama`
--

CREATE TABLE `tb_misi_rpjmd_lama` (
  `id_tb_misi_rpjmd_lama` int(11) NOT NULL,
  `tb_misi_rpjmd_lama_nama` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_misi_rpjmn`
--

CREATE TABLE `tb_misi_rpjmn` (
  `id_tb_misi_rpjmn` int(11) NOT NULL,
  `tb_misi_rpjmn_nama` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_misi_sdgs`
--

CREATE TABLE `tb_misi_sdgs` (
  `id_tb_misi_sdgs` int(11) NOT NULL,
  `tb_misi_sdgs_nama` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_monev_lra`
--

CREATE TABLE `tb_monev_lra` (
  `id_tb_monev_lra` int(11) NOT NULL,
  `tb_urusan_kode` int(11) NOT NULL,
  `tb_bidang_kode` int(11) NOT NULL,
  `tb_unit_kode` int(11) NOT NULL,
  `tb_sub_unit_kode` int(11) NOT NULL,
  `tb_monev_lra_tahun` int(11) DEFAULT NULL,
  `tb_rekening1_kode` int(11) NOT NULL,
  `tb_rekening2_kode` int(11) NOT NULL,
  `tb_rekening3_kode` int(11) NOT NULL,
  `tb_rekening4_kode` int(11) NOT NULL,
  `tb_rekening5_kode` int(11) NOT NULL,
  `program_kode` int(11) NOT NULL,
  `kegiatan_kode` int(11) NOT NULL,
  `tb_monev_lra_ket` varchar(45) DEFAULT NULL,
  `tb_monev_lra_anggaran` double DEFAULT NULL,
  `tb_monev_lra_realisasi` double DEFAULT NULL,
  `tb_monev_lra_fisik` text,
  `tb_monev_lra_pelaksana` text,
  `tb_monev_lra_sumber_dana` text,
  `tb_monev_lra_lokasi` text,
  `tb_monev_lra_jenis` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_monev_lra`
--

INSERT INTO `tb_monev_lra` (`id_tb_monev_lra`, `tb_urusan_kode`, `tb_bidang_kode`, `tb_unit_kode`, `tb_sub_unit_kode`, `tb_monev_lra_tahun`, `tb_rekening1_kode`, `tb_rekening2_kode`, `tb_rekening3_kode`, `tb_rekening4_kode`, `tb_rekening5_kode`, `program_kode`, `kegiatan_kode`, `tb_monev_lra_ket`, `tb_monev_lra_anggaran`, `tb_monev_lra_realisasi`, `tb_monev_lra_fisik`, `tb_monev_lra_pelaksana`, `tb_monev_lra_sumber_dana`, `tb_monev_lra_lokasi`, `tb_monev_lra_jenis`) VALUES
(1, 1, 1, 1, 1, 2019, 5, 0, 0, 0, 0, 0, 0, 'BELANJA', 205239953612, 131877158850, '', '', '', '', NULL),
(2, 1, 1, 1, 1, 2019, 5, 1, 0, 0, 0, 0, 0, 'BELANJA TIDAK LANGSUNG', 132910680272, 89886489633, '', '', '', '', NULL),
(3, 1, 1, 1, 1, 2019, 5, 1, 1, 0, 0, 0, 0, 'Belanja Pegawai', 132910680272, 89886489633, '', '', '', '', NULL),
(4, 1, 1, 1, 1, 2019, 5, 1, 1, 1, 0, 0, 0, 'Belanja Gaji dan Tunjangan', 130241543247, 88281370092, '', '', '', '', NULL),
(5, 1, 1, 1, 1, 2019, 5, 1, 1, 1, 1, 0, 0, 'Gaji Pokok PNS/Uang Representasi', 71874811400, 54948395220, '', '', '', '', NULL),
(6, 1, 1, 1, 1, 2019, 5, 1, 1, 1, 2, 0, 0, 'Tunjangan Keluarga', 7105650086, 5442824082, '', '', '', '', NULL),
(7, 1, 1, 1, 1, 2019, 5, 1, 1, 1, 3, 0, 0, 'Tunjangan Jabatan', 279949025, 223666000, '', '', '', '', NULL),
(8, 1, 1, 1, 1, 2019, 5, 1, 1, 1, 4, 0, 0, 'Tunjangan Fungsional', 5692136600, 4355966000, '', '', '', '', NULL),
(9, 1, 1, 1, 1, 2019, 5, 1, 1, 1, 5, 0, 0, 'Tunjangan Umum', 993610400, 761101000, '', '', '', '', NULL),
(10, 1, 1, 1, 1, 2019, 5, 1, 1, 1, 6, 0, 0, 'Tunjangan Beras', 3851004109, 2806347420, '', '', '', '', NULL),
(11, 1, 1, 1, 1, 2019, 5, 1, 1, 1, 7, 0, 0, 'Tunjangan PPh/Tunjangan Khusus', 264419857, 243375471, '', '', '', '', NULL),
(12, 1, 1, 1, 1, 2019, 5, 1, 1, 1, 8, 0, 0, 'Pembulatan Gaji', 1086267, 826372, '', '', '', '', NULL),
(13, 1, 1, 1, 1, 2019, 5, 1, 1, 1, 9, 0, 0, 'Iuran BPJS Kesehatan', 2031943912, 1482897902, '', '', '', '', NULL),
(14, 1, 1, 1, 1, 2019, 5, 1, 1, 1, 22, 0, 0, 'Tunjangan Penghasilan Guru PNSD', 37555589520, 17584603700, '', '', '', '', NULL),
(15, 1, 1, 1, 1, 2019, 5, 1, 1, 1, 23, 0, 0, 'Iuran Jaminan Kecelakaan Kerja dan Jaminan Ke', 591342071, 431366925, '', '', '', '', NULL),
(16, 1, 1, 1, 1, 2019, 5, 1, 1, 2, 0, 0, 0, 'Belanja Tambahan Penghasilan PNS', 2669137025, 1605119541, '', '', '', '', NULL),
(17, 1, 1, 1, 1, 2019, 5, 1, 1, 2, 1, 0, 0, 'Tambahan Penghasilan Berdasarkan Beban Kerja', 2669137025, 1605119541, '', '', '', '', NULL),
(18, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 0, 0, 'BELANJA LANGSUNG', 72329273340, 41990669217, '', '', '', '', NULL),
(19, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 1, 0, 'Program Pelayanan Administrasi Perkantoran', 1919245436, 1282161250, '', '', '', '', NULL),
(20, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 1, 3, 'Penyediaan jasa peralatan dan perlengkapan ka', 182250000, 182250000, '', '', '', '', NULL),
(21, 1, 1, 1, 1, 2019, 5, 2, 1, 0, 0, 1, 3, 'Belanja Pegawai', 182250000, 182250000, '', '', '', '', NULL),
(22, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 0, 1, 3, 'Honorarium Non PNS', 182250000, 182250000, '', '', '', '', NULL),
(23, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 2, 1, 3, 'Honorarium Staf Teknis/Administrasi Kegiatan', 182250000, 182250000, '', '', '', '', NULL),
(24, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 1, 7, 'Penyediaan jasa administrasi keuangan', 729799476, 486532928, '', '', '', '', NULL),
(25, 1, 1, 1, 1, 2019, 5, 2, 1, 0, 0, 1, 7, 'Belanja Pegawai', 729799476, 486532928, '', '', '', '', NULL),
(26, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 0, 1, 7, 'Honorarium Non PNS', 729799476, 486532928, '', '', '', '', NULL),
(27, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 1, 1, 7, 'Honorarium Tenaga Ahli/Instruktur/Narasumber', 0, 0, '', '', '', '', NULL),
(28, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 2, 1, 7, 'Honorarium Staf Teknis/Administrasi Kegiatan', 729799476, 486532928, '', '', '', '', NULL),
(29, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 1, 13, 'Penyediaan peralatan dan perlengkapan kantor', 287453080, 190979883, '', '', '', '', NULL),
(30, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 1, 13, 'Belanja Barang dan Jasa', 213493080, 137019883, '', '', '', '', NULL),
(31, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 0, 1, 13, 'Belanja Bahan Pakai Habis', 146398580, 98172355, '', '', '', '', NULL),
(32, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 1, 1, 13, 'Belanja Alat Tulis Kantor', 115287580, 77926913, '', '', '', '', NULL),
(33, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 4, 1, 13, 'Belanja Perangko, Materai Dan Benda Pos Lainn', 12150000, 7476000, '', '', '', '', NULL),
(34, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 5, 1, 13, 'Belanja Peralatan Kebersihan Dan Bahan Pember', 18961000, 12769442, '', '', '', '', NULL),
(35, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 0, 1, 13, 'Belanja Bahan/Material', 17500000, 8400000, '', '', '', '', NULL),
(36, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 12, 1, 13, 'Belanja bahan spanduk dan umbul-umbul', 17500000, 8400000, '', '', '', '', NULL),
(37, 1, 1, 1, 1, 2019, 5, 2, 2, 3, 0, 1, 13, 'Belanja Jasa Kantor', 15900000, 6283278, '', '', '', '', NULL),
(38, 1, 1, 1, 1, 2019, 5, 2, 2, 3, 3, 1, 13, 'Belanja Listrik', 15000000, 5833278, '', '', '', '', NULL),
(39, 1, 1, 1, 1, 2019, 5, 2, 2, 3, 25, 1, 13, 'Belanja Jasa Kebersihan', 900000, 450000, '', '', '', '', NULL),
(40, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 1, 13, 'Belanja Cetak dan Penggandaan', 33694500, 24164250, '', '', '', '', NULL),
(41, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 1, 1, 13, 'Belanja Cetak', 7500000, 3425000, '', '', '', '', NULL),
(42, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 1, 13, 'Belanja Penggandaan', 26194500, 20739250, '', '', '', '', NULL),
(43, 1, 1, 1, 1, 2019, 5, 2, 3, 0, 0, 1, 13, 'Belanja Modal', 73960000, 53960000, '', '', '', '', NULL),
(44, 1, 1, 1, 1, 2019, 5, 2, 3, 24, 0, 1, 13, 'Belanja Modal Peralatan dan Mesin - Pengadaan', 0, 0, '', '', '', '', NULL),
(45, 1, 1, 1, 1, 2019, 5, 2, 3, 24, 1, 1, 13, 'Belanja Modal Peralatan dan Mesin - Pengadaan', 0, 0, '', '', '', '', NULL),
(46, 1, 1, 1, 1, 2019, 5, 2, 3, 28, 0, 1, 13, 'Belanja Modal Peralatan dan Mesin - Pengadaan', 0, 0, '', '', '', '', NULL),
(47, 1, 1, 1, 1, 2019, 5, 2, 3, 28, 1, 1, 13, 'Belanja Modal Peralatan dan Mesin - Pengadaan', 0, 0, '', '', '', '', NULL),
(48, 1, 1, 1, 1, 2019, 5, 2, 3, 28, 4, 1, 13, 'Belanja Modal Peralatan dan Mesin - Pengadaan', 0, 0, '', '', '', '', NULL),
(49, 1, 1, 1, 1, 2019, 5, 2, 3, 29, 0, 1, 13, 'Belanja Modal Peralatan dan Mesin - Pengadaan', 20000000, 0, '', '', '', '', NULL),
(50, 1, 1, 1, 1, 2019, 5, 2, 3, 29, 2, 1, 13, 'Belanja Modal Peralatan dan Mesin - Pengadaan', 20000000, 0, '', '', '', '', NULL),
(51, 1, 1, 1, 1, 2019, 5, 2, 3, 29, 5, 1, 13, 'Belanja Modal Peralatan dan Mesin - Pengadaan', 0, 0, '', '', '', '', NULL),
(52, 1, 1, 1, 1, 2019, 5, 2, 3, 31, 0, 1, 13, 'Belanja Modal Peralatan dan Mesin - Pengadaan', 53960000, 53960000, '', '', '', '', NULL),
(53, 1, 1, 1, 1, 2019, 5, 2, 3, 31, 2, 1, 13, 'Belanja Modal Peralatan dan Mesin - Pengadaan', 53960000, 53960000, '', '', '', '', NULL),
(54, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 1, 17, 'Penyediaan makanan dan minuman', 40000000, 15285000, '', '', '', '', NULL),
(55, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 1, 17, 'Belanja Barang dan Jasa', 40000000, 15285000, '', '', '', '', NULL),
(56, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 1, 17, 'Belanja Makanan dan  Minuman', 40000000, 15285000, '', '', '', '', NULL),
(57, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 2, 1, 17, 'Belanja Makanan Dan Minuman Rapat', 40000000, 15285000, '', '', '', '', NULL),
(58, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 1, 18, 'Rapat-rapat koordinasi dan konsultasi ke luar', 679742880, 407113439, '', '', '', '', NULL),
(59, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 1, 18, 'Belanja Barang dan Jasa', 679742880, 407113439, '', '', '', '', NULL),
(60, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 1, 18, 'Belanja Perjalanan Dinas', 679742880, 407113439, '', '', '', '', NULL),
(61, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 1, 1, 18, 'Belanja Perjalanan Dinas Dalam Daerah', 51236250, 21540000, '', '', '', '', NULL),
(62, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 2, 1, 18, 'Belanja Perjalanan Dinas Luar Daerah', 628506630, 385573439, '', '', '', '', NULL),
(63, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 2, 0, 'Program Peningkatan Sarana dan Prasarana Apar', 2117114500, 2005664250, '', '', '', '', NULL),
(64, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 2, 3, 'Pembangunan gedung kantor', 576784500, 576510000, '', '', '', '', NULL),
(65, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 2, 3, 'Belanja Barang dan Jasa', 89780000, 89780000, '', '', '', '', NULL),
(66, 1, 1, 1, 1, 2019, 5, 2, 2, 20, 0, 2, 3, 'Belanja Pemeliharaan', 89780000, 89780000, '', '', '', '', NULL),
(67, 1, 1, 1, 1, 2019, 5, 2, 2, 20, 5, 2, 3, 'Belanja Pemeliharan Gedung dan Bangunan', 89780000, 89780000, '', '', '', '', NULL),
(68, 1, 1, 1, 1, 2019, 5, 2, 3, 0, 0, 2, 3, 'Belanja Modal', 487004500, 486730000, '', '', '', '', NULL),
(69, 1, 1, 1, 1, 2019, 5, 2, 3, 49, 0, 2, 3, 'Belanja Modal Gedung dan Bangunan - Pengadaan', 99780000, 99780000, '', '', '', '', NULL),
(70, 1, 1, 1, 1, 2019, 5, 2, 3, 49, 1, 2, 3, 'Belanja Modal Gedung dan Bangunan - Pengadaan', 99780000, 99780000, '', '', '', '', NULL),
(71, 1, 1, 1, 1, 2019, 5, 2, 3, 56, 0, 2, 3, 'Belanja Modal Gedung dan Bangunan - Pengadaan', 387224500, 386950000, '', '', '', '', NULL),
(72, 1, 1, 1, 1, 2019, 5, 2, 3, 56, 1, 2, 3, 'Belanja Modal Gedung dan Bangunan - Pengadaan', 387224500, 386950000, '', '', '', '', NULL),
(73, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 2, 5, 'pengadaan Kendaraan dinas/operasional', 1488650000, 1392650000, '', '', '', '', NULL),
(74, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 2, 5, 'Belanja Barang dan Jasa', 223000000, 127000000, '', '', '', '', NULL),
(75, 1, 1, 1, 1, 2019, 5, 2, 2, 8, 0, 2, 5, 'Belanja Sewa Sarana Mobilitas', 223000000, 127000000, '', '', '', '', NULL),
(76, 1, 1, 1, 1, 2019, 5, 2, 2, 8, 1, 2, 5, 'Belanja Sewa Sarana Mobilitas Darat', 223000000, 127000000, '', '', '', '', NULL),
(77, 1, 1, 1, 1, 2019, 5, 2, 3, 0, 0, 2, 5, 'Belanja Modal', 1265650000, 1265650000, '', '', '', '', NULL),
(78, 1, 1, 1, 1, 2019, 5, 2, 3, 17, 0, 2, 5, 'Belanja Modal Peralatan dan Mesin - Pengadaan', 1265650000, 1265650000, '', '', '', '', NULL),
(79, 1, 1, 1, 1, 2019, 5, 2, 3, 17, 5, 2, 5, 'Belanja Modal Peralatan dan Mesin - Pengadaan', 1265650000, 1265650000, '', '', '', '', NULL),
(80, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 2, 22, 'Pemeliharaan rutin/berkala gedung kantor', 25000000, 25000000, '', '', '', '', NULL),
(81, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 2, 22, 'Belanja Barang dan Jasa', 25000000, 25000000, '', '', '', '', NULL),
(82, 1, 1, 1, 1, 2019, 5, 2, 2, 20, 0, 2, 22, 'Belanja Pemeliharaan', 25000000, 25000000, '', '', '', '', NULL),
(83, 1, 1, 1, 1, 2019, 5, 2, 2, 20, 5, 2, 22, 'Belanja Pemeliharan Gedung dan Bangunan', 25000000, 25000000, '', '', '', '', NULL),
(84, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 2, 24, 'Pemeliharaan rutin/berkala kendaraan dinas/op', 16680000, 6504250, '', '', '', '', NULL),
(85, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 2, 24, 'Belanja Barang dan Jasa', 16680000, 6504250, '', '', '', '', NULL),
(86, 1, 1, 1, 1, 2019, 5, 2, 2, 20, 0, 2, 24, 'Belanja Pemeliharaan', 16680000, 6504250, '', '', '', '', NULL),
(87, 1, 1, 1, 1, 2019, 5, 2, 2, 20, 4, 2, 24, 'Belanja Pemeliharan Peralatan dan Mesin', 16680000, 6504250, '', '', '', '', NULL),
(88, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 2, 28, 'Pemeliharaan rutin/berkala peralatan gedung k', 10000000, 5000000, '', '', '', '', NULL),
(89, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 2, 28, 'Belanja Barang dan Jasa', 10000000, 5000000, '', '', '', '', NULL),
(90, 1, 1, 1, 1, 2019, 5, 2, 2, 20, 0, 2, 28, 'Belanja Pemeliharaan', 10000000, 5000000, '', '', '', '', NULL),
(91, 1, 1, 1, 1, 2019, 5, 2, 2, 20, 4, 2, 28, 'Belanja Pemeliharan Peralatan dan Mesin', 10000000, 5000000, '', '', '', '', NULL),
(92, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 5, 0, 'Program Peningkatan Kapasitas Sumber Daya Apa', 351640000, 252414812, '', '', '', '', NULL),
(93, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 5, 1, 'Pendidikan dan pelatihan formal', 351640000, 252414812, '', '', '', '', NULL),
(94, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 5, 1, 'Belanja Barang dan Jasa', 351640000, 252414812, '', '', '', '', NULL),
(95, 1, 1, 1, 1, 2019, 5, 2, 2, 17, 0, 5, 1, 'Belanja kursus, pelatihan, sosialisasi dan bi', 351640000, 252414812, '', '', '', '', NULL),
(96, 1, 1, 1, 1, 2019, 5, 2, 2, 17, 1, 5, 1, 'Belanja Kursus-Kursus Singkat/Pelatihan', 154500000, 124000000, '', '', '', '', NULL),
(97, 1, 1, 1, 1, 2019, 5, 2, 2, 17, 3, 5, 1, 'Belanja Bimbingan Teknis', 197140000, 128414812, '', '', '', '', NULL),
(98, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 6, 0, 'Program peningkatan pengembangan sistem pelap', 5000000, 0, '', '', '', '', NULL),
(99, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 6, 1, 'Penyusunan laporan capaian kinerja dan ikhtis', 5000000, 0, '', '', '', '', NULL),
(100, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 6, 1, 'Belanja Barang dan Jasa', 5000000, 0, '', '', '', '', NULL),
(101, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 6, 1, 'Belanja Cetak dan Penggandaan', 2550000, 0, '', '', '', '', NULL),
(102, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 1, 6, 1, 'Belanja Cetak', 1875000, 0, '', '', '', '', NULL),
(103, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 6, 1, 'Belanja Penggandaan', 675000, 0, '', '', '', '', NULL),
(104, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 6, 1, 'Belanja Makanan dan  Minuman', 2450000, 0, '', '', '', '', NULL),
(105, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 2, 6, 1, 'Belanja Makanan Dan Minuman Rapat', 2450000, 0, '', '', '', '', NULL),
(106, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 15, 0, 'Program Pendidikan Anak Usia Dini', 5453012000, 2504348218, '', '', '', '', NULL),
(107, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 15, 1, 'Pembangunan gedung sekolah', 649725000, 199725000, '', '', '', '', NULL),
(108, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 15, 1, 'Belanja Barang dan Jasa', 50000000, 0, '', '', '', '', NULL),
(109, 1, 1, 1, 1, 2019, 5, 2, 2, 21, 0, 15, 1, 'Belanja Jasa Konsultansi', 50000000, 0, '', '', '', '', NULL),
(110, 1, 1, 1, 1, 2019, 5, 2, 2, 21, 2, 15, 1, 'Belanja Jasa Konsultansi Perencanaan', 50000000, 0, '', '', '', '', NULL),
(111, 1, 1, 1, 1, 2019, 5, 2, 3, 0, 0, 15, 1, 'Belanja Modal', 599725000, 199725000, '', '', '', '', NULL),
(112, 1, 1, 1, 1, 2019, 5, 2, 3, 28, 0, 15, 1, 'Belanja Modal Peralatan dan Mesin - Pengadaan', 0, 0, '', '', '', '', NULL),
(113, 1, 1, 1, 1, 2019, 5, 2, 3, 28, 1, 15, 1, 'Belanja Modal Peralatan dan Mesin - Pengadaan', 0, 0, '', '', '', '', NULL),
(114, 1, 1, 1, 1, 2019, 5, 2, 3, 37, 0, 15, 1, 'Belanja Modal Peralatan dan Mesin - Pengadaan', 200000000, 0, '', '', '', '', NULL),
(115, 1, 1, 1, 1, 2019, 5, 2, 3, 37, 13, 15, 1, 'Belanja Modal Peralatan dan Mesin - Pengadaan', 200000000, 0, '', '', '', '', NULL),
(116, 1, 1, 1, 1, 2019, 5, 2, 3, 49, 0, 15, 1, 'Belanja Modal Gedung dan Bangunan - Pengadaan', 200000000, 0, '', '', '', '', NULL),
(117, 1, 1, 1, 1, 2019, 5, 2, 3, 49, 10, 15, 1, 'Belanja Modal Gedung dan Bangunan - Pengadaan', 200000000, 0, '', '', '', '', NULL),
(118, 1, 1, 1, 1, 2019, 5, 2, 3, 56, 0, 15, 1, 'Belanja Modal Gedung dan Bangunan - Pengadaan', 199725000, 199725000, '', '', '', '', NULL),
(119, 1, 1, 1, 1, 2019, 5, 2, 3, 56, 1, 15, 1, 'Belanja Modal Gedung dan Bangunan - Pengadaan', 199725000, 199725000, '', '', '', '', NULL),
(120, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 15, 57, 'Pelatihan kompetensi tenaga pendidik', 73020000, 73020000, '', '', '', '', NULL),
(121, 1, 1, 1, 1, 2019, 5, 2, 1, 0, 0, 15, 57, 'Belanja Pegawai', 4550000, 4550000, '', '', '', '', NULL),
(122, 1, 1, 1, 1, 2019, 5, 2, 1, 3, 0, 15, 57, 'Uang Lembur', 4550000, 4550000, '', '', '', '', NULL),
(123, 1, 1, 1, 1, 2019, 5, 2, 1, 3, 2, 15, 57, 'Uang Lembur Non PNS', 4550000, 4550000, '', '', '', '', NULL),
(124, 1, 1, 1, 1, 2019, 5, 2, 1, 6, 0, 15, 57, 'Belanja Honorarium Non Pegawai', 0, 0, '', '', '', '', NULL),
(125, 1, 1, 1, 1, 2019, 5, 2, 1, 6, 1, 15, 57, 'Honorarium Tenaga Ahli/Narasumber/Instruktur', 0, 0, '', '', '', '', NULL),
(126, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 15, 57, 'Belanja Barang dan Jasa', 68470000, 68470000, '', '', '', '', NULL),
(127, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 0, 15, 57, 'Belanja Bahan Pakai Habis', 3634500, 3634500, '', '', '', '', NULL),
(128, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 1, 15, 57, 'Belanja Alat Tulis Kantor', 3634500, 3634500, '', '', '', '', NULL),
(129, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 0, 15, 57, 'Belanja Bahan/Material', 350000, 350000, '', '', '', '', NULL),
(130, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 12, 15, 57, 'Belanja bahan spanduk dan umbul-umbul', 350000, 350000, '', '', '', '', NULL),
(131, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 15, 57, 'Belanja Cetak dan Penggandaan', 2575500, 2575500, '', '', '', '', NULL),
(132, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 1, 15, 57, 'Belanja Cetak', 1050000, 1050000, '', '', '', '', NULL),
(133, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 15, 57, 'Belanja Penggandaan', 1525500, 1525500, '', '', '', '', NULL),
(134, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 0, 15, 57, 'Belanja Sewa Rumah/Gedung/Gudang/Parkir', 1000000, 1000000, '', '', '', '', NULL),
(135, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 3, 15, 57, 'Belanja Sewa Ruang Rapat/Pertemuan', 1000000, 1000000, '', '', '', '', NULL),
(136, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 15, 57, 'Belanja Makanan dan  Minuman', 4560000, 4560000, '', '', '', '', NULL),
(137, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 4, 15, 57, 'Belanja makanan dan minuman pelatihan', 4560000, 4560000, '', '', '', '', NULL),
(138, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 15, 57, 'Belanja Perjalanan Dinas', 17100000, 17100000, '', '', '', '', NULL),
(139, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 2, 15, 57, 'Belanja Perjalanan Dinas Luar Daerah', 17100000, 17100000, '', '', '', '', NULL),
(140, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 0, 15, 57, 'Belanja Transportasi dan Akomodasi', 39250000, 39250000, '', '', '', '', NULL),
(141, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 1, 15, 57, 'Belanja Transportasi dan Akomodasi', 39250000, 39250000, '', '', '', '', NULL),
(142, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 15, 62, 'Pengembangan kurikulum, bahan ajar dan model ', 90000000, 88000000, '', '', '', '', NULL),
(143, 1, 1, 1, 1, 2019, 5, 2, 1, 0, 0, 15, 62, 'Belanja Pegawai', 10300000, 10300000, '', '', '', '', NULL),
(144, 1, 1, 1, 1, 2019, 5, 2, 1, 1, 0, 15, 62, 'Honorarium PNS', 10300000, 10300000, '', '', '', '', NULL),
(145, 1, 1, 1, 1, 2019, 5, 2, 1, 1, 3, 15, 62, 'Honorarium Tenaga Ahli/Instruktur/Narasumber', 10300000, 10300000, '', '', '', '', NULL),
(146, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 15, 62, 'Belanja Barang dan Jasa', 79700000, 77700000, '', '', '', '', NULL),
(147, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 0, 15, 62, 'Belanja Bahan Pakai Habis', 2073500, 2073500, '', '', '', '', NULL),
(148, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 1, 15, 62, 'Belanja Alat Tulis Kantor', 2073500, 2073500, '', '', '', '', NULL),
(149, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 15, 62, 'Belanja Cetak dan Penggandaan', 12561500, 12561500, '', '', '', '', NULL),
(150, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 1, 15, 62, 'Belanja Cetak', 1824000, 1824000, '', '', '', '', NULL),
(151, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 15, 62, 'Belanja Penggandaan', 10737500, 10737500, '', '', '', '', NULL),
(152, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 0, 15, 62, 'Belanja Sewa Rumah/Gedung/Gudang/Parkir', 3000000, 3000000, '', '', '', '', NULL),
(153, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 3, 15, 62, 'Belanja Sewa Ruang Rapat/Pertemuan', 3000000, 3000000, '', '', '', '', NULL),
(154, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 0, 15, 62, 'Belanja Sewa Perlengkapan dan Peralatan Kanto', 350000, 350000, '', '', '', '', NULL),
(155, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 8, 15, 62, 'Belanja Sewa Dekorasi', 350000, 350000, '', '', '', '', NULL),
(156, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 15, 62, 'Belanja Makanan dan  Minuman', 11880000, 11880000, '', '', '', '', NULL),
(157, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 2, 15, 62, 'Belanja Makanan Dan Minuman Rapat', 11880000, 11880000, '', '', '', '', NULL),
(158, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 15, 62, 'Belanja Perjalanan Dinas', 21000000, 20800000, '', '', '', '', NULL),
(159, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 2, 15, 62, 'Belanja Perjalanan Dinas Luar Daerah', 21000000, 20800000, '', '', '', '', NULL),
(160, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 0, 15, 62, 'Belanja Transportasi dan Akomodasi', 28835000, 27035000, '', '', '', '', NULL),
(161, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 1, 15, 62, 'Belanja Transportasi dan Akomodasi', 28835000, 27035000, '', '', '', '', NULL),
(162, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 15, 67, 'Bantuan Biaya Pendidikan (BBP) PAUDNI', 4206938500, 1929938500, '', '', '', '', NULL),
(163, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 15, 67, 'Belanja Barang dan Jasa', 4206938500, 1929938500, '', '', '', '', NULL),
(164, 1, 1, 1, 1, 2019, 5, 2, 2, 17, 0, 15, 67, 'Belanja kursus, pelatihan, sosialisasi dan bi', 135788500, 135788500, '', '', '', '', NULL),
(165, 1, 1, 1, 1, 2019, 5, 2, 2, 17, 2, 15, 67, 'Belanja Sosialisasi', 135788500, 135788500, '', '', '', '', NULL),
(166, 1, 1, 1, 1, 2019, 5, 2, 2, 22, 0, 15, 67, 'Belanja Barang Dana BOS', 4071150000, 1794150000, '', '', '', '', NULL),
(167, 1, 1, 1, 1, 2019, 5, 2, 2, 22, 2, 15, 67, 'Belanja Barang Dana BOP', 4071150000, 1794150000, '', '', '', '', NULL),
(168, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 15, 69, 'Pengembangan Gebyar PAUD', 103400000, 33400000, '', '', '', '', NULL),
(169, 1, 1, 1, 1, 2019, 5, 2, 1, 0, 0, 15, 69, 'Belanja Pegawai', 2250000, 0, '', '', '', '', NULL),
(170, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 0, 15, 69, 'Honorarium Non PNS', 2250000, 0, '', '', '', '', NULL),
(171, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 1, 15, 69, 'Honorarium Tenaga Ahli/Instruktur/Narasumber', 2250000, 0, '', '', '', '', NULL),
(172, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 15, 69, 'Belanja Barang dan Jasa', 101150000, 33400000, '', '', '', '', NULL),
(173, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 0, 15, 69, 'Belanja Bahan Pakai Habis', 19850000, 0, '', '', '', '', NULL),
(174, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 1, 15, 69, 'Belanja Alat Tulis Kantor', 18350000, 0, '', '', '', '', NULL),
(175, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 12, 15, 69, 'Belanja Dokumentasi', 1500000, 0, '', '', '', '', NULL),
(176, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 0, 15, 69, 'Belanja Bahan/Material', 6950000, 0, '', '', '', '', NULL),
(177, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 8, 15, 69, 'Belanja Bahan Hadiah Perlombaan', 6250000, 0, '', '', '', '', NULL),
(178, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 12, 15, 69, 'Belanja bahan spanduk dan umbul-umbul', 700000, 0, '', '', '', '', NULL),
(179, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 15, 69, 'Belanja Cetak dan Penggandaan', 1750000, 0, '', '', '', '', NULL),
(180, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 1, 15, 69, 'Belanja Cetak', 1250000, 0, '', '', '', '', NULL),
(181, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 15, 69, 'Belanja Penggandaan', 500000, 0, '', '', '', '', NULL),
(182, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 0, 15, 69, 'Belanja Sewa Perlengkapan dan Peralatan Kanto', 2200000, 0, '', '', '', '', NULL),
(183, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 5, 15, 69, 'Belanja Sewa Tenda', 700000, 0, '', '', '', '', NULL),
(184, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 7, 15, 69, 'Belanja Sewa Sound System', 1000000, 0, '', '', '', '', NULL),
(185, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 8, 15, 69, 'Belanja Sewa Dekorasi', 500000, 0, '', '', '', '', NULL),
(186, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 15, 69, 'Belanja Makanan dan  Minuman', 27000000, 0, '', '', '', '', NULL),
(187, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 4, 15, 69, 'Belanja makanan dan minuman pelatihan', 27000000, 0, '', '', '', '', NULL),
(188, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 15, 69, 'Belanja Perjalanan Dinas', 33400000, 33400000, '', '', '', '', NULL),
(189, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 1, 15, 69, 'Belanja Perjalanan Dinas Dalam Daerah', 16380000, 16380000, '', '', '', '', NULL),
(190, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 2, 15, 69, 'Belanja Perjalanan Dinas Luar Daerah', 17020000, 17020000, '', '', '', '', NULL),
(191, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 0, 15, 69, 'Belanja Transportasi dan Akomodasi', 10000000, 0, '', '', '', '', NULL),
(192, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 1, 15, 69, 'Belanja Transportasi dan Akomodasi', 10000000, 0, '', '', '', '', NULL),
(193, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 15, 70, 'Apresiasi Bunda PAUD', 75000000, 0, '', '', '', '', NULL),
(194, 1, 1, 1, 1, 2019, 5, 2, 1, 0, 0, 15, 70, 'Belanja Pegawai', 8200000, 0, '', '', '', '', NULL),
(195, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 0, 15, 70, 'Honorarium Non PNS', 8200000, 0, '', '', '', '', NULL),
(196, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 1, 15, 70, 'Honorarium Tenaga Ahli/Instruktur/Narasumber', 8200000, 0, '', '', '', '', NULL),
(197, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 15, 70, 'Belanja Barang dan Jasa', 66800000, 0, '', '', '', '', NULL),
(198, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 0, 15, 70, 'Belanja Bahan Pakai Habis', 3558000, 0, '', '', '', '', NULL),
(199, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 1, 15, 70, 'Belanja Alat Tulis Kantor', 3558000, 0, '', '', '', '', NULL),
(200, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 0, 15, 70, 'Belanja Bahan/Material', 700000, 0, '', '', '', '', NULL),
(201, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 12, 15, 70, 'Belanja bahan spanduk dan umbul-umbul', 700000, 0, '', '', '', '', NULL),
(202, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 15, 70, 'Belanja Cetak dan Penggandaan', 875000, 0, '', '', '', '', NULL),
(203, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 1, 15, 70, 'Belanja Cetak', 700000, 0, '', '', '', '', NULL),
(204, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 15, 70, 'Belanja Penggandaan', 175000, 0, '', '', '', '', NULL),
(205, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 0, 15, 70, 'Belanja Sewa Rumah/Gedung/Gudang/Parkir', 1500000, 0, '', '', '', '', NULL),
(206, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 3, 15, 70, 'Belanja Sewa Ruang Rapat/Pertemuan', 1500000, 0, '', '', '', '', NULL),
(207, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 15, 70, 'Belanja Makanan dan  Minuman', 5200000, 0, '', '', '', '', NULL),
(208, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 4, 15, 70, 'Belanja makanan dan minuman pelatihan', 5200000, 0, '', '', '', '', NULL),
(209, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 15, 70, 'Belanja Perjalanan Dinas', 20472000, 0, '', '', '', '', NULL),
(210, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 2, 15, 70, 'Belanja Perjalanan Dinas Luar Daerah', 20472000, 0, '', '', '', '', NULL),
(211, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 0, 15, 70, 'Belanja Transportasi dan Akomodasi', 34495000, 0, '', '', '', '', NULL),
(212, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 1, 15, 70, 'Belanja Transportasi dan Akomodasi', 34495000, 0, '', '', '', '', NULL),
(213, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 15, 71, 'Sosialisasi Penggunaan Biaya Operasional Peny', 200000000, 180264718, '', '', '', '', NULL),
(214, 1, 1, 1, 1, 2019, 5, 2, 1, 0, 0, 15, 71, 'Belanja Pegawai', 11300000, 11300000, '', '', '', '', NULL),
(215, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 0, 15, 71, 'Honorarium Non PNS', 11300000, 11300000, '', '', '', '', NULL),
(216, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 1, 15, 71, 'Honorarium Tenaga Ahli/Instruktur/Narasumber', 11300000, 11300000, '', '', '', '', NULL),
(217, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 15, 71, 'Belanja Barang dan Jasa', 188700000, 168964718, '', '', '', '', NULL),
(218, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 0, 15, 71, 'Belanja Bahan Pakai Habis', 6294500, 6294500, '', '', '', '', NULL),
(219, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 1, 15, 71, 'Belanja Alat Tulis Kantor', 6294500, 6294500, '', '', '', '', NULL),
(220, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 0, 15, 71, 'Belanja Bahan/Material', 700000, 700000, '', '', '', '', NULL),
(221, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 12, 15, 71, 'Belanja bahan spanduk dan umbul-umbul', 700000, 700000, '', '', '', '', NULL),
(222, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 15, 71, 'Belanja Cetak dan Penggandaan', 37165500, 37165500, '', '', '', '', NULL),
(223, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 15, 71, 'Belanja Penggandaan', 37165500, 37165500, '', '', '', '', NULL),
(224, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 0, 15, 71, 'Belanja Sewa Rumah/Gedung/Gudang/Parkir', 6000000, 6000000, '', '', '', '', NULL),
(225, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 2, 15, 71, 'Belanja Sewa Gedung/Kantor/Tempat', 6000000, 6000000, '', '', '', '', NULL),
(226, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 15, 71, 'Belanja Makanan dan  Minuman', 32500000, 32500000, '', '', '', '', NULL),
(227, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 4, 15, 71, 'Belanja makanan dan minuman pelatihan', 32500000, 32500000, '', '', '', '', NULL),
(228, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 15, 71, 'Belanja Perjalanan Dinas', 48440000, 28704718, '', '', '', '', NULL),
(229, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 1, 15, 71, 'Belanja Perjalanan Dinas Dalam Daerah', 16190000, 0, '', '', '', '', NULL),
(230, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 2, 15, 71, 'Belanja Perjalanan Dinas Luar Daerah', 32250000, 28704718, '', '', '', '', NULL),
(231, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 0, 15, 71, 'Belanja Transportasi dan Akomodasi', 57600000, 57600000, '', '', '', '', NULL),
(232, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 1, 15, 71, 'Belanja Transportasi dan Akomodasi', 57600000, 57600000, '', '', '', '', NULL),
(233, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 15, 72, 'Sosialisasi Akreditasi PAUD dan PNF', 54928500, 0, '', '', '', '', NULL),
(234, 1, 1, 1, 1, 2019, 5, 2, 1, 0, 0, 15, 72, 'Belanja Pegawai', 3800000, 0, '', '', '', '', NULL),
(235, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 0, 15, 72, 'Honorarium Non PNS', 3800000, 0, '', '', '', '', NULL),
(236, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 1, 15, 72, 'Honorarium Tenaga Ahli/Instruktur/Narasumber', 3800000, 0, '', '', '', '', NULL),
(237, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 15, 72, 'Belanja Barang dan Jasa', 51128500, 0, '', '', '', '', NULL),
(238, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 0, 15, 72, 'Belanja Bahan Pakai Habis', 4126500, 0, '', '', '', '', NULL),
(239, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 1, 15, 72, 'Belanja Alat Tulis Kantor', 4126500, 0, '', '', '', '', NULL),
(240, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 0, 15, 72, 'Belanja Bahan/Material', 350000, 0, '', '', '', '', NULL),
(241, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 12, 15, 72, 'Belanja bahan spanduk dan umbul-umbul', 350000, 0, '', '', '', '', NULL),
(242, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 15, 72, 'Belanja Cetak dan Penggandaan', 917000, 0, '', '', '', '', NULL),
(243, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 15, 72, 'Belanja Penggandaan', 917000, 0, '', '', '', '', NULL),
(244, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 0, 15, 72, 'Belanja Sewa Rumah/Gedung/Gudang/Parkir', 1000000, 0, '', '', '', '', NULL),
(245, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 2, 15, 72, 'Belanja Sewa Gedung/Kantor/Tempat', 1000000, 0, '', '', '', '', NULL),
(246, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 0, 15, 72, 'Belanja Sewa Perlengkapan dan Peralatan Kanto', 3500000, 0, '', '', '', '', NULL),
(247, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 8, 15, 72, 'Belanja Sewa Dekorasi', 3500000, 0, '', '', '', '', NULL),
(248, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 15, 72, 'Belanja Makanan dan  Minuman', 9200000, 0, '', '', '', '', NULL),
(249, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 4, 15, 72, 'Belanja makanan dan minuman pelatihan', 9200000, 0, '', '', '', '', NULL),
(250, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 0, 15, 72, 'Belanja Transportasi dan Akomodasi', 32035000, 0, '', '', '', '', NULL),
(251, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 1, 15, 72, 'Belanja Transportasi dan Akomodasi', 32035000, 0, '', '', '', '', NULL),
(255, 1, 1, 1, 1, 2019, 5, 2, 2, 3, 0, 15, 1, 'Belanja Jasa Kantor', 50000000, 14991000, '', '', '', '', NULL),
(256, 1, 1, 1, 1, 2019, 5, 2, 2, 3, 26, 15, 1, 'Belanja Jasa Pembuatan Film', 50000000, 14991000, '', '', '', '', NULL),
(259, 1, 1, 1, 1, 2019, 5, 2, 3, 49, 20, 15, 1, 'Belanja Modal Gedung dan Bangunan - Pengadaan', 0, 0, '', '', '', '', NULL),
(260, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 15, 4, 'Pemantauan dan evaluasi pelaksanaan program p', 51450000, 0, '', '', '', '', NULL),
(261, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 15, 4, 'Belanja Barang dan Jasa', 51450000, 0, '', '', '', '', NULL),
(262, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 0, 15, 4, 'Belanja Bahan Pakai Habis', 1279000, 0, '', '', '', '', NULL),
(263, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 4, 15, 4, 'Belanja Perangko, Materai Dan Benda Pos Lainn', 279000, 0, '', '', '', '', NULL),
(264, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 12, 15, 4, 'Belanja Dokumentasi', 1000000, 0, '', '', '', '', NULL),
(265, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 15, 4, 'Belanja Cetak dan Penggandaan', 464100, 0, '', '', '', '', NULL),
(266, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 15, 4, 'Belanja Penggandaan', 464100, 0, '', '', '', '', NULL),
(267, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 15, 4, 'Belanja Perjalanan Dinas', 49706900, 0, '', '', '', '', NULL),
(268, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 1, 15, 4, 'Belanja Perjalanan Dinas Dalam Daerah', 49706900, 0, '', '', '', '', NULL),
(269, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 15, 7, 'Fasilitasi Penyelenggaraan Karnaval Budaya', 296863750, 19117400, '', '', '', '', NULL),
(270, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 15, 7, 'Belanja Barang dan Jasa', 296863750, 19117400, '', '', '', '', NULL),
(271, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 0, 15, 7, 'Belanja Bahan Pakai Habis', 2500000, 0, '', '', '', '', NULL),
(272, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 1, 15, 7, 'Belanja Alat Tulis Kantor', 0, 0, '', '', '', '', NULL),
(273, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 12, 15, 7, 'Belanja Dokumentasi', 2500000, 0, '', '', '', '', NULL),
(274, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 0, 15, 7, 'Belanja Bahan/Material', 61000000, 0, '', '', '', '', NULL),
(275, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 4, 15, 7, 'Belanja Bahan Obat-Obatan', 1000000, 0, '', '', '', '', NULL),
(276, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 7, 15, 7, 'Belanja bahan pameran', 60000000, 0, '', '', '', '', NULL),
(277, 1, 1, 1, 1, 2019, 5, 2, 2, 3, 0, 15, 7, 'Belanja Jasa Kantor', 43000000, 0, '', '', '', '', NULL),
(278, 1, 1, 1, 1, 2019, 5, 2, 2, 3, 21, 15, 7, 'Belanja jasa narasumber/tenaga ahli', 43000000, 0, '', '', '', '', NULL),
(279, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 15, 7, 'Belanja Cetak dan Penggandaan', 759750, 0, '', '', '', '', NULL),
(280, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 15, 7, 'Belanja Penggandaan', 759750, 0, '', '', '', '', NULL),
(281, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 0, 15, 7, 'Belanja Sewa Perlengkapan dan Peralatan Kanto', 8750000, 0, '', '', '', '', NULL),
(282, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 8, 15, 7, 'Belanja Sewa Dekorasi', 8750000, 0, '', '', '', '', NULL),
(283, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 15, 7, 'Belanja Makanan dan  Minuman', 36750000, 0, '', '', '', '', NULL),
(284, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 1, 15, 7, 'Belanja Makanan Dan Minuman Harian Pegawai', 36750000, 0, '', '', '', '', NULL),
(285, 1, 1, 1, 1, 2019, 5, 2, 2, 13, 0, 15, 7, 'Belanja Pakaian Kerja', 28750000, 0, '', '', '', '', NULL),
(286, 1, 1, 1, 1, 2019, 5, 2, 2, 13, 1, 15, 7, 'Belanja Pakaian Kerja Lapangan', 28750000, 0, '', '', '', '', NULL),
(287, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 15, 7, 'Belanja Perjalanan Dinas', 115354000, 19117400, '', '', '', '', NULL),
(288, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 2, 15, 7, 'Belanja Perjalanan Dinas Luar Daerah', 115354000, 19117400, '', '', '', '', NULL),
(289, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 15, 8, 'Pembangunan Replika Rumah Raja Bungku', 179864000, 0, '', '', '', '', NULL),
(290, 1, 1, 1, 1, 2019, 5, 2, 3, 0, 0, 15, 8, 'Belanja Modal', 179864000, 0, '', '', '', '', NULL),
(291, 1, 1, 1, 1, 2019, 5, 2, 3, 56, 0, 15, 8, 'Belanja Modal Gedung dan Bangunan - Pengadaan', 179864000, 0, '', '', '', '', NULL),
(292, 1, 1, 1, 1, 2019, 5, 2, 3, 56, 1, 15, 8, 'Belanja Modal Gedung dan Bangunan - Pengadaan', 179864000, 0, '', '', '', '', NULL),
(293, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 15, 9, 'Pengadaan Baju Adat', 139935000, 64935000, '', '', '', '', NULL),
(294, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 15, 9, 'Belanja Barang dan Jasa', 139935000, 64935000, '', '', '', '', NULL),
(295, 1, 1, 1, 1, 2019, 5, 2, 2, 14, 0, 15, 9, 'Belanja Pakaian khusus dan hari-hari tertentu', 139935000, 64935000, '', '', '', '', NULL),
(296, 1, 1, 1, 1, 2019, 5, 2, 2, 14, 5, 15, 9, 'Belanja Pakaian Tertentu', 139935000, 64935000, '', '', '', '', NULL),
(297, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 16, 0, 'Program Wajib Belajar Pendidikan Dasar Sembil', 31372352236, 16430530322, '', '', '', '', NULL),
(298, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 16, 1, 'Pembangunan gedung sekolah', 11675592336, 6945013200, '', '', '', '', NULL),
(299, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 16, 1, 'Belanja Barang dan Jasa', 1252363054, 1151813000, '', '', '', '', NULL),
(300, 1, 1, 1, 1, 2019, 5, 2, 2, 20, 0, 16, 1, 'Belanja Pemeliharaan', 587928054, 587378000, '', '', '', '', NULL),
(301, 1, 1, 1, 1, 2019, 5, 2, 2, 20, 5, 16, 1, 'Belanja Pemeliharan Gedung dan Bangunan', 587928054, 587378000, '', '', '', '', NULL),
(302, 1, 1, 1, 1, 2019, 5, 2, 2, 21, 0, 16, 1, 'Belanja Jasa Konsultansi', 469675000, 369675000, '', '', '', '', NULL),
(303, 1, 1, 1, 1, 2019, 5, 2, 2, 21, 3, 16, 1, 'Belanja Jasa Konsultansi Pengawasan', 369675000, 369675000, '', '', '', '', NULL),
(304, 1, 1, 1, 1, 2019, 5, 2, 2, 21, 15, 16, 1, 'Belanja Jasa Konsultansi', 100000000, 0, '', '', '', '', NULL),
(305, 1, 1, 1, 1, 2019, 5, 2, 2, 23, 0, 16, 1, 'Belanja Barang Untuk Diserahkan kepada Masyar', 194760000, 194760000, '', '', '', '', NULL),
(306, 1, 1, 1, 1, 2019, 5, 2, 2, 23, 2, 16, 1, 'Belanja Barang Yang Akan Diserahkan Kepada Pi', 194760000, 194760000, '', '', '', '', NULL),
(307, 1, 1, 1, 1, 2019, 5, 2, 3, 0, 0, 16, 1, 'Belanja Modal', 10423229282, 5793200200, '', '', '', '', NULL),
(308, 1, 1, 1, 1, 2019, 5, 2, 3, 49, 0, 16, 1, 'Belanja Modal Gedung dan Bangunan - Pengadaan', 6840004082, 2436824000, '', '', '', '', NULL),
(309, 1, 1, 1, 1, 2019, 5, 2, 3, 49, 10, 16, 1, 'Belanja Modal Gedung dan Bangunan - Pengadaan', 6794467000, 2391452000, '', '', '', '', NULL),
(310, 1, 1, 1, 1, 2019, 5, 2, 3, 49, 11, 16, 1, 'Belanja Modal Gedung dan Bangunan - Pengadaan', 45537082, 45372000, '', '', '', '', NULL),
(311, 1, 1, 1, 1, 2019, 5, 2, 3, 56, 0, 16, 1, 'Belanja Modal Gedung dan Bangunan - Pengadaan', 2341992000, 2115143000, '', '', '', '', NULL),
(312, 1, 1, 1, 1, 2019, 5, 2, 3, 56, 1, 16, 1, 'Belanja Modal Gedung dan Bangunan - Pengadaan', 2341992000, 2115143000, '', '', '', '', NULL),
(313, 1, 1, 1, 1, 2019, 5, 2, 3, 67, 0, 16, 1, 'Belanja Modal Jalan, Irigasi dan Jaringan - P', 199587000, 199587000, '', '', '', '', NULL),
(314, 1, 1, 1, 1, 2019, 5, 2, 3, 67, 3, 16, 1, 'Belanja Modal Jalan, Irigasi dan Jaringan - P', 199587000, 199587000, '', '', '', '', NULL),
(315, 1, 1, 1, 1, 2019, 5, 2, 3, 82, 0, 16, 1, 'Belanja Modal Aset Tetap Lainnya - Pengadaan ', 1041646200, 1041646200, '', '', '', '', NULL),
(316, 1, 1, 1, 1, 2019, 5, 2, 3, 82, 1, 16, 1, 'Belanja Modal Aset Tetap Lainnya - Pengadaan ', 1041646200, 1041646200, '', '', '', '', NULL),
(317, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 16, 19, 'Pengadaan mebeluer sekolah', 1712242204, 1307476000, '', '', '', '', NULL),
(318, 1, 1, 1, 1, 2019, 5, 2, 3, 0, 0, 16, 19, 'Belanja Modal', 1712242204, 1307476000, '', '', '', '', NULL),
(319, 1, 1, 1, 1, 2019, 5, 2, 3, 28, 0, 16, 19, 'Belanja Modal Peralatan dan Mesin - Pengadaan', 1712242204, 1307476000, '', '', '', '', NULL),
(320, 1, 1, 1, 1, 2019, 5, 2, 3, 28, 1, 16, 19, 'Belanja Modal Peralatan dan Mesin - Pengadaan', 1712242204, 1307476000, '', '', '', '', NULL),
(321, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 16, 68, 'Penyelenggaraan Paket B Setara SMP', 17740000, 0, '', '', '', '', NULL),
(322, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 16, 68, 'Belanja Barang dan Jasa', 17740000, 0, '', '', '', '', NULL),
(323, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 16, 68, 'Belanja Perjalanan Dinas', 17740000, 0, '', '', '', '', NULL),
(324, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 1, 16, 68, 'Belanja Perjalanan Dinas Dalam Daerah', 9840000, 0, '', '', '', '', NULL),
(325, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 2, 16, 68, 'Belanja Perjalanan Dinas Luar Daerah', 7900000, 0, '', '', '', '', NULL),
(326, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 16, 70, 'Pembinaaan minat, bakat, dan kreativitas sisw', 162760400, 162760400, '', '', '', '', NULL),
(327, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 16, 70, 'Belanja Barang dan Jasa', 162760400, 162760400, '', '', '', '', NULL),
(328, 1, 1, 1, 1, 2019, 5, 2, 2, 3, 0, 16, 70, 'Belanja Jasa Kantor', 0, 0, '', '', '', '', NULL),
(329, 1, 1, 1, 1, 2019, 5, 2, 2, 3, 26, 16, 70, 'Belanja Jasa Pembuatan Film', 0, 0, '', '', '', '', NULL),
(330, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 16, 70, 'Belanja Perjalanan Dinas', 162760400, 162760400, '', '', '', '', NULL),
(331, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 2, 16, 70, 'Belanja Perjalanan Dinas Luar Daerah', 162760400, 162760400, '', '', '', '', NULL),
(332, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 16, 78, 'Monitoring, evaluasi dan pelaporan', 31770000, 0, '', '', '', '', NULL),
(333, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 16, 78, 'Belanja Barang dan Jasa', 31770000, 0, '', '', '', '', NULL),
(334, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 16, 78, 'Belanja Perjalanan Dinas', 31770000, 0, '', '', '', '', NULL),
(335, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 1, 16, 78, 'Belanja Perjalanan Dinas Dalam Daerah', 31770000, 0, '', '', '', '', NULL),
(336, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 16, 80, 'Operasional BOS dan BSM', 269542980, 158272000, '', '', '', '', NULL),
(337, 1, 1, 1, 1, 2019, 5, 2, 1, 0, 0, 16, 80, 'Belanja Pegawai', 49600000, 35200000, '', '', '', '', NULL),
(338, 1, 1, 1, 1, 2019, 5, 2, 1, 1, 0, 16, 80, 'Honorarium PNS', 29600000, 15200000, '', '', '', '', NULL),
(339, 1, 1, 1, 1, 2019, 5, 2, 1, 1, 3, 16, 80, 'Honorarium Tenaga Ahli/Instruktur/Narasumber', 29600000, 15200000, '', '', '', '', NULL),
(340, 1, 1, 1, 1, 2019, 5, 2, 1, 4, 0, 16, 80, 'Honorarium Pengelola Dana BOS', 20000000, 20000000, '', '', '', '', NULL),
(341, 1, 1, 1, 1, 2019, 5, 2, 1, 4, 1, 16, 80, 'Honorarium Pengelola Dana BOS', 20000000, 20000000, '', '', '', '', NULL),
(342, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 16, 80, 'Belanja Barang dan Jasa', 219942980, 123072000, '', '', '', '', NULL),
(343, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 0, 16, 80, 'Belanja Bahan/Material', 1400000, 700000, '', '', '', '', NULL),
(344, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 12, 16, 80, 'Belanja bahan spanduk dan umbul-umbul', 1400000, 700000, '', '', '', '', NULL),
(345, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 16, 80, 'Belanja Cetak dan Penggandaan', 4338000, 4338000, '', '', '', '', NULL),
(346, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 16, 80, 'Belanja Penggandaan', 4338000, 4338000, '', '', '', '', NULL),
(347, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 0, 16, 80, 'Belanja Sewa Rumah/Gedung/Gudang/Parkir', 8192000, 3132000, '', '', '', '', NULL),
(348, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 3, 16, 80, 'Belanja Sewa Ruang Rapat/Pertemuan', 8192000, 3132000, '', '', '', '', NULL),
(349, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 16, 80, 'Belanja Makanan dan  Minuman', 26450000, 26450000, '', '', '', '', NULL),
(350, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 4, 16, 80, 'Belanja makanan dan minuman pelatihan', 26450000, 26450000, '', '', '', '', NULL),
(351, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 16, 80, 'Belanja Perjalanan Dinas', 179562980, 88452000, '', '', '', '', NULL),
(352, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 1, 16, 80, 'Belanja Perjalanan Dinas Dalam Daerah', 67021500, 26600000, '', '', '', '', NULL),
(353, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 2, 16, 80, 'Belanja Perjalanan Dinas Luar Daerah', 112541480, 61852000, '', '', '', '', NULL),
(354, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 16, 82, 'Pembinaan Minat, Bakat dan Kretifitas Siswa', 450000000, 387759000, '', '', '', '', NULL),
(355, 1, 1, 1, 1, 2019, 5, 2, 1, 0, 0, 16, 82, 'Belanja Pegawai', 63000000, 63000000, '', '', '', '', NULL),
(356, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 0, 16, 82, 'Honorarium Non PNS', 63000000, 63000000, '', '', '', '', NULL),
(357, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 1, 16, 82, 'Honorarium Tenaga Ahli/Instruktur/Narasumber', 63000000, 63000000, '', '', '', '', NULL),
(358, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 16, 82, 'Belanja Barang dan Jasa', 387000000, 324759000, '', '', '', '', NULL),
(359, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 0, 16, 82, 'Belanja Bahan/Material', 60900000, 47400000, '', '', '', '', NULL),
(360, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 8, 16, 82, 'Belanja Bahan Hadiah Perlombaan', 60900000, 47400000, '', '', '', '', NULL),
(361, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 16, 82, 'Belanja Cetak dan Penggandaan', 8500000, 8500000, '', '', '', '', NULL),
(362, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 1, 16, 82, 'Belanja Cetak', 8500000, 8500000, '', '', '', '', NULL),
(363, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 0, 16, 82, 'Belanja Sewa Rumah/Gedung/Gudang/Parkir', 5000000, 5000000, '', '', '', '', NULL),
(364, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 3, 16, 82, 'Belanja Sewa Ruang Rapat/Pertemuan', 5000000, 5000000, '', '', '', '', NULL),
(365, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 0, 16, 82, 'Belanja Sewa Perlengkapan dan Peralatan Kanto', 14500000, 14500000, '', '', '', '', NULL),
(366, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 8, 16, 82, 'Belanja Sewa Dekorasi', 14500000, 14500000, '', '', '', '', NULL),
(367, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 16, 82, 'Belanja Makanan dan  Minuman', 113600000, 113600000, '', '', '', '', NULL),
(368, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 1, 16, 82, 'Belanja Makanan Dan Minuman Harian Pegawai', 113600000, 113600000, '', '', '', '', NULL),
(369, 1, 1, 1, 1, 2019, 5, 2, 2, 14, 0, 16, 82, 'Belanja Pakaian khusus dan hari-hari tertentu', 61670000, 47320000, '', '', '', '', NULL),
(370, 1, 1, 1, 1, 2019, 5, 2, 2, 14, 4, 16, 82, 'Belanja Pakaian Olahraga', 61670000, 47320000, '', '', '', '', NULL),
(371, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 16, 82, 'Belanja Perjalanan Dinas', 122830000, 88439000, '', '', '', '', NULL),
(372, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 1, 16, 82, 'Belanja Perjalanan Dinas Dalam Daerah', 20900000, 20900000, '', '', '', '', NULL),
(373, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 2, 16, 82, 'Belanja Perjalanan Dinas Luar Daerah', 101930000, 67539000, '', '', '', '', NULL),
(374, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 16, 93, 'Pembangunan Gedung Sekolah (DAK )', 14073417596, 4489963172, '', '', '', '', NULL),
(375, 1, 1, 1, 1, 2019, 5, 2, 1, 0, 0, 16, 93, 'Belanja Pegawai', 457525999, 244930560, '', '', '', '', NULL),
(376, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 0, 16, 93, 'Honorarium Non PNS', 355750099, 227680560, '', '', '', '', NULL),
(377, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 1, 16, 93, 'Honorarium Tenaga Ahli/Instruktur/Narasumber', 355750099, 227680560, '', '', '', '', NULL),
(378, 1, 1, 1, 1, 2019, 5, 2, 1, 7, 0, 16, 93, 'Honorarium Tim/Kepanitiaan', 101775900, 17250000, '', '', '', '', NULL),
(379, 1, 1, 1, 1, 2019, 5, 2, 1, 7, 1, 16, 93, ' Honorarium Tim/Kepanitiaan', 101775900, 17250000, '', '', '', '', NULL),
(380, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 16, 93, 'Belanja Barang dan Jasa', 256797101, 107930000, '', '', '', '', NULL),
(381, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 0, 16, 93, 'Belanja Bahan Pakai Habis', 2630000, 2630000, '', '', '', '', NULL),
(382, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 1, 16, 93, 'Belanja Alat Tulis Kantor', 2630000, 2630000, '', '', '', '', NULL),
(383, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 16, 93, 'Belanja Cetak dan Penggandaan', 5917101, 5900000, '', '', '', '', NULL),
(384, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 16, 93, 'Belanja Penggandaan', 5917101, 5900000, '', '', '', '', NULL),
(385, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 16, 93, 'Belanja Makanan dan  Minuman', 9750000, 7200000, '', '', '', '', NULL),
(386, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 4, 16, 93, 'Belanja makanan dan minuman pelatihan', 9750000, 7200000, '', '', '', '', NULL),
(387, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 16, 93, 'Belanja Perjalanan Dinas', 217680000, 76820000, '', '', '', '', NULL),
(388, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 1, 16, 93, 'Belanja Perjalanan Dinas Dalam Daerah', 217680000, 76820000, '', '', '', '', NULL),
(389, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 0, 16, 93, 'Belanja Transportasi dan Akomodasi', 20820000, 15380000, '', '', '', '', NULL),
(390, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 1, 16, 93, 'Belanja Transportasi dan Akomodasi', 20820000, 15380000, '', '', '', '', NULL),
(391, 1, 1, 1, 1, 2019, 5, 2, 3, 0, 0, 16, 93, 'Belanja Modal', 13359094496, 4137102612, '', '', '', '', NULL),
(392, 1, 1, 1, 1, 2019, 5, 2, 3, 49, 0, 16, 93, 'Belanja Modal Gedung dan Bangunan - Pengadaan', 8567647168, 2967533551, '', '', '', '', NULL),
(393, 1, 1, 1, 1, 2019, 5, 2, 3, 49, 10, 16, 93, 'Belanja Modal Gedung dan Bangunan - Pengadaan', 8567647168, 2967533551, '', '', '', '', NULL),
(394, 1, 1, 1, 1, 2019, 5, 2, 3, 50, 0, 16, 93, 'Belanja Modal Gedung dan Bangunan - Pengadaan', 1791447328, 1169569061, '', '', '', '', NULL),
(395, 1, 1, 1, 1, 2019, 5, 2, 3, 50, 3, 16, 93, 'Belanja Modal Gedung dan Bangunan - Pengadaan', 1791447328, 1169569061, '', '', '', '', NULL),
(396, 1, 1, 1, 1, 2019, 5, 2, 3, 82, 0, 16, 93, 'Belanja Modal Aset Tetap Lainnya - Pengadaan ', 3000000000, 0, '', '', '', '', NULL),
(397, 1, 1, 1, 1, 2019, 5, 2, 3, 82, 1, 16, 93, 'Belanja Modal Aset Tetap Lainnya - Pengadaan ', 3000000000, 0, '', '', '', '', NULL),
(398, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 16, 107, 'Pengadaan Server', 2979286720, 2979286550, '', '', '', '', NULL),
(399, 1, 1, 1, 1, 2019, 5, 2, 3, 0, 0, 16, 107, 'Belanja Modal', 2979286720, 2979286550, '', '', '', '', NULL),
(400, 1, 1, 1, 1, 2019, 5, 2, 3, 29, 0, 16, 107, 'Belanja Modal Peralatan dan Mesin - Pengadaan', 2979286720, 2979286550, '', '', '', '', NULL),
(401, 1, 1, 1, 1, 2019, 5, 2, 3, 29, 1, 16, 107, 'Belanja Modal Peralatan dan Mesin - Pengadaan', 2979286720, 2979286550, '', '', '', '', NULL),
(402, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 17, 0, 'Program Pengelolaan Keragaman Budaya', 599646250, 98164750, '', '', '', '', NULL),
(403, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 17, 1, 'Pengembangan kesenian dan kebudayaan daerah', 440031250, 0, '', '', '', '', NULL),
(404, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 17, 1, 'Belanja Barang dan Jasa', 440031250, 0, '', '', '', '', NULL),
(405, 1, 1, 1, 1, 2019, 5, 2, 2, 23, 0, 17, 1, 'Belanja Barang Untuk Diserahkan kepada Masyar', 440031250, 0, '', '', '', '', NULL),
(406, 1, 1, 1, 1, 2019, 5, 2, 2, 23, 1, 17, 1, 'Belanja Barang Yang Akan Diserahkan Kepada Ma', 440031250, 0, '', '', '', '', NULL),
(407, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 17, 11, 'Penjemputan Tamu Secara Adat', 159615000, 98164750, '', '', '', '', NULL),
(408, 1, 1, 1, 1, 2019, 5, 2, 1, 0, 0, 17, 11, 'Belanja Pegawai', 93450000, 55050000, '', '', '', '', NULL),
(409, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 0, 17, 11, 'Honorarium Non PNS', 93450000, 55050000, '', '', '', '', NULL),
(410, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 1, 17, 11, 'Honorarium Tenaga Ahli/Instruktur/Narasumber', 93450000, 55050000, '', '', '', '', NULL),
(411, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 17, 11, 'Belanja Barang dan Jasa', 66165000, 43114750, '', '', '', '', NULL),
(412, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 0, 17, 11, 'Belanja Bahan Pakai Habis', 4260000, 2150000, '', '', '', '', NULL),
(413, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 1, 17, 11, 'Belanja Alat Tulis Kantor', 360000, 0, '', '', '', '', NULL),
(414, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 12, 17, 11, 'Belanja Dokumentasi', 3900000, 2150000, '', '', '', '', NULL),
(415, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 17, 11, 'Belanja Cetak dan Penggandaan', 3240000, 1299750, '', '', '', '', NULL),
(416, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 17, 11, 'Belanja Penggandaan', 3240000, 1299750, '', '', '', '', NULL),
(417, 1, 1, 1, 1, 2019, 5, 2, 2, 8, 0, 17, 11, 'Belanja Sewa Sarana Mobilitas', 7500000, 4000000, '', '', '', '', NULL),
(418, 1, 1, 1, 1, 2019, 5, 2, 2, 8, 1, 17, 11, 'Belanja Sewa Sarana Mobilitas Darat', 7500000, 4000000, '', '', '', '', NULL);
INSERT INTO `tb_monev_lra` (`id_tb_monev_lra`, `tb_urusan_kode`, `tb_bidang_kode`, `tb_unit_kode`, `tb_sub_unit_kode`, `tb_monev_lra_tahun`, `tb_rekening1_kode`, `tb_rekening2_kode`, `tb_rekening3_kode`, `tb_rekening4_kode`, `tb_rekening5_kode`, `program_kode`, `kegiatan_kode`, `tb_monev_lra_ket`, `tb_monev_lra_anggaran`, `tb_monev_lra_realisasi`, `tb_monev_lra_fisik`, `tb_monev_lra_pelaksana`, `tb_monev_lra_sumber_dana`, `tb_monev_lra_lokasi`, `tb_monev_lra_jenis`) VALUES
(419, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 0, 17, 11, 'Belanja Sewa Perlengkapan dan Peralatan Kanto', 28125000, 19875000, '', '', '', '', NULL),
(420, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 8, 17, 11, 'Belanja Sewa Dekorasi', 28125000, 19875000, '', '', '', '', NULL),
(421, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 17, 11, 'Belanja Makanan dan  Minuman', 23040000, 15790000, '', '', '', '', NULL),
(422, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 1, 17, 11, 'Belanja Makanan Dan Minuman Harian Pegawai', 14500000, 7250000, '', '', '', '', NULL),
(423, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 3, 17, 11, 'Belanja Makanan Dan Minuman Tamu', 8540000, 8540000, '', '', '', '', NULL),
(424, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 18, 0, 'Program Pendidikan Non Formal', 802412750, 477362750, '', '', '', '', NULL),
(425, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 18, 2, 'Pemberian bantuan operasional pendidikan non ', 649800000, 324750000, '', '', '', '', NULL),
(426, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 18, 2, 'Belanja Barang dan Jasa', 649800000, 324750000, '', '', '', '', NULL),
(427, 1, 1, 1, 1, 2019, 5, 2, 2, 30, 0, 18, 2, 'Belanja Operasional', 649800000, 324750000, '', '', '', '', NULL),
(428, 1, 1, 1, 1, 2019, 5, 2, 2, 30, 7, 18, 2, 'Belanja Operasional Penyenggaraan Pendidikan', 649800000, 324750000, '', '', '', '', NULL),
(429, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 18, 4, 'Pengembangan pendidikan keaksaraan', 0, 0, '', '', '', '', NULL),
(430, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 18, 4, 'Belanja Barang dan Jasa', 0, 0, '', '', '', '', NULL),
(431, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 18, 4, 'Belanja Perjalanan Dinas', 0, 0, '', '', '', '', NULL),
(432, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 1, 18, 4, 'Belanja Perjalanan Dinas Dalam Daerah', 0, 0, '', '', '', '', NULL),
(433, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 2, 18, 4, 'Belanja Perjalanan Dinas Luar Daerah', 0, 0, '', '', '', '', NULL),
(434, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 18, 9, 'Pengembangan kurikulum, bahan ajar dan model ', 77612750, 77612750, '', '', '', '', NULL),
(435, 1, 1, 1, 1, 2019, 5, 2, 1, 0, 0, 18, 9, 'Belanja Pegawai', 11650000, 11650000, '', '', '', '', NULL),
(436, 1, 1, 1, 1, 2019, 5, 2, 1, 1, 0, 18, 9, 'Honorarium PNS', 4750000, 4750000, '', '', '', '', NULL),
(437, 1, 1, 1, 1, 2019, 5, 2, 1, 1, 1, 18, 9, 'Honorarium Panitia Pelaksana Kegiatan', 4750000, 4750000, '', '', '', '', NULL),
(438, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 0, 18, 9, 'Honorarium Non PNS', 6900000, 6900000, '', '', '', '', NULL),
(439, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 1, 18, 9, 'Honorarium Tenaga Ahli/Instruktur/Narasumber', 6900000, 6900000, '', '', '', '', NULL),
(440, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 18, 9, 'Belanja Barang dan Jasa', 65962750, 65962750, '', '', '', '', NULL),
(441, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 0, 18, 9, 'Belanja Bahan Pakai Habis', 2120250, 2120250, '', '', '', '', NULL),
(442, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 1, 18, 9, 'Belanja Alat Tulis Kantor', 2120250, 2120250, '', '', '', '', NULL),
(443, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 18, 9, 'Belanja Cetak dan Penggandaan', 3742500, 3742500, '', '', '', '', NULL),
(444, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 1, 18, 9, 'Belanja Cetak', 2935000, 2935000, '', '', '', '', NULL),
(445, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 18, 9, 'Belanja Penggandaan', 807500, 807500, '', '', '', '', NULL),
(446, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 0, 18, 9, 'Belanja Sewa Rumah/Gedung/Gudang/Parkir', 2000000, 2000000, '', '', '', '', NULL),
(447, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 3, 18, 9, 'Belanja Sewa Ruang Rapat/Pertemuan', 2000000, 2000000, '', '', '', '', NULL),
(448, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 0, 18, 9, 'Belanja Sewa Perlengkapan dan Peralatan Kanto', 350000, 350000, '', '', '', '', NULL),
(449, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 8, 18, 9, 'Belanja Sewa Dekorasi', 350000, 350000, '', '', '', '', NULL),
(450, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 18, 9, 'Belanja Makanan dan  Minuman', 16200000, 16200000, '', '', '', '', NULL),
(451, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 2, 18, 9, 'Belanja Makanan Dan Minuman Rapat', 16200000, 16200000, '', '', '', '', NULL),
(452, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 18, 9, 'Belanja Perjalanan Dinas', 41550000, 41550000, '', '', '', '', NULL),
(453, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 1, 18, 9, 'Belanja Perjalanan Dinas Dalam Daerah', 35500000, 35500000, '', '', '', '', NULL),
(454, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 2, 18, 9, 'Belanja Perjalanan Dinas Luar Daerah', 6050000, 6050000, '', '', '', '', NULL),
(455, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 18, 14, 'Apresiasi Bunda PAUD', 75000000, 75000000, '', '', '', '', NULL),
(456, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 18, 14, 'Belanja Barang dan Jasa', 75000000, 75000000, '', '', '', '', NULL),
(457, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 18, 14, 'Belanja Perjalanan Dinas', 75000000, 75000000, '', '', '', '', NULL),
(458, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 1, 18, 14, 'Belanja Perjalanan Dinas Dalam Daerah', 31550000, 31550000, '', '', '', '', NULL),
(459, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 2, 18, 14, 'Belanja Perjalanan Dinas Luar Daerah', 43450000, 43450000, '', '', '', '', NULL),
(460, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 18, 15, 'Hari Aksara Internasional', 0, 0, '', '', '', '', NULL),
(461, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 18, 15, 'Belanja Barang dan Jasa', 0, 0, '', '', '', '', NULL),
(462, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 18, 15, 'Belanja Perjalanan Dinas', 0, 0, '', '', '', '', NULL),
(463, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 2, 18, 15, 'Belanja Perjalanan Dinas Luar Daerah', 0, 0, '', '', '', '', NULL),
(464, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 19, 0, 'Program Pendidikan Luar Biasa', 179522000, 79450000, '', '', '', '', NULL),
(465, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 19, 60, 'Opersional Sekolah Luar Biasa', 179522000, 79450000, '', '', '', '', NULL),
(466, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 19, 60, 'Belanja Barang dan Jasa', 179522000, 79450000, '', '', '', '', NULL),
(467, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 0, 19, 60, 'Belanja Bahan/Material', 179522000, 79450000, '', '', '', '', NULL),
(468, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 13, 19, 60, 'Belanja Bahan lainnya', 179522000, 79450000, '', '', '', '', NULL),
(469, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 20, 0, 'Program Peningkatan Mutu Pendidik dan Tenaga ', 25873460180, 17028405800, '', '', '', '', NULL),
(470, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 20, 1, 'Pelaksanaan Sertifikasi pendidik', 236175000, 48177400, '', '', '', '', NULL),
(471, 1, 1, 1, 1, 2019, 5, 2, 1, 0, 0, 20, 1, 'Belanja Pegawai', 5800000, 5800000, '', '', '', '', NULL),
(472, 1, 1, 1, 1, 2019, 5, 2, 1, 1, 0, 20, 1, 'Honorarium PNS', 5800000, 5800000, '', '', '', '', NULL),
(473, 1, 1, 1, 1, 2019, 5, 2, 1, 1, 3, 20, 1, 'Honorarium Tenaga Ahli/Instruktur/Narasumber', 5800000, 5800000, '', '', '', '', NULL),
(474, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 20, 1, 'Belanja Barang dan Jasa', 230375000, 42377400, '', '', '', '', NULL),
(475, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 0, 20, 1, 'Belanja Bahan Pakai Habis', 2510000, 0, '', '', '', '', NULL),
(476, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 1, 20, 1, 'Belanja Alat Tulis Kantor', 2510000, 0, '', '', '', '', NULL),
(477, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 0, 20, 1, 'Belanja Bahan/Material', 0, 0, '', '', '', '', NULL),
(478, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 12, 20, 1, 'Belanja bahan spanduk dan umbul-umbul', 0, 0, '', '', '', '', NULL),
(479, 1, 1, 1, 1, 2019, 5, 2, 2, 3, 0, 20, 1, 'Belanja Jasa Kantor', 8100000, 0, '', '', '', '', NULL),
(480, 1, 1, 1, 1, 2019, 5, 2, 2, 3, 21, 20, 1, 'Belanja jasa narasumber/tenaga ahli', 8100000, 0, '', '', '', '', NULL),
(481, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 20, 1, 'Belanja Cetak dan Penggandaan', 870000, 870000, '', '', '', '', NULL),
(482, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 20, 1, 'Belanja Penggandaan', 870000, 870000, '', '', '', '', NULL),
(483, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 0, 20, 1, 'Belanja Sewa Rumah/Gedung/Gudang/Parkir', 1000000, 1000000, '', '', '', '', NULL),
(484, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 2, 20, 1, 'Belanja Sewa Gedung/Kantor/Tempat', 0, 0, '', '', '', '', NULL),
(485, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 3, 20, 1, 'Belanja Sewa Ruang Rapat/Pertemuan', 1000000, 1000000, '', '', '', '', NULL),
(486, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 20, 1, 'Belanja Makanan dan  Minuman', 10660000, 9880000, '', '', '', '', NULL),
(487, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 2, 20, 1, 'Belanja Makanan Dan Minuman Rapat', 780000, 0, '', '', '', '', NULL),
(488, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 4, 20, 1, 'Belanja makanan dan minuman pelatihan', 9880000, 9880000, '', '', '', '', NULL),
(489, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 20, 1, 'Belanja Perjalanan Dinas', 54535000, 27927400, '', '', '', '', NULL),
(490, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 2, 20, 1, 'Belanja Perjalanan Dinas Luar Daerah', 54535000, 27927400, '', '', '', '', NULL),
(491, 1, 1, 1, 1, 2019, 5, 2, 2, 17, 0, 20, 1, 'Belanja kursus, pelatihan, sosialisasi dan bi', 150000000, 0, '', '', '', '', NULL),
(492, 1, 1, 1, 1, 2019, 5, 2, 2, 17, 1, 20, 1, 'Belanja Kursus-Kursus Singkat/Pelatihan', 150000000, 0, '', '', '', '', NULL),
(493, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 0, 20, 1, 'Belanja Transportasi dan Akomodasi', 2700000, 2700000, '', '', '', '', NULL),
(494, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 1, 20, 1, 'Belanja Transportasi dan Akomodasi', 2700000, 2700000, '', '', '', '', NULL),
(495, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 20, 3, 'pelatihan bagi pendidik untuk memenuhi standa', 0, 0, '', '', '', '', NULL),
(496, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 20, 3, 'Belanja Barang dan Jasa', 0, 0, '', '', '', '', NULL),
(497, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 0, 20, 3, 'Belanja Bahan Pakai Habis', 0, 0, '', '', '', '', NULL),
(498, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 1, 20, 3, 'Belanja Alat Tulis Kantor', 0, 0, '', '', '', '', NULL),
(499, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 12, 20, 3, 'Belanja Dokumentasi', 0, 0, '', '', '', '', NULL),
(500, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 0, 20, 3, 'Belanja Bahan/Material', 0, 0, '', '', '', '', NULL),
(501, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 12, 20, 3, 'Belanja bahan spanduk dan umbul-umbul', 0, 0, '', '', '', '', NULL),
(502, 1, 1, 1, 1, 2019, 5, 2, 2, 3, 0, 20, 3, 'Belanja Jasa Kantor', 0, 0, '', '', '', '', NULL),
(503, 1, 1, 1, 1, 2019, 5, 2, 2, 3, 21, 20, 3, 'Belanja jasa narasumber/tenaga ahli', 0, 0, '', '', '', '', NULL),
(504, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 20, 3, 'Belanja Cetak dan Penggandaan', 0, 0, '', '', '', '', NULL),
(505, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 1, 20, 3, 'Belanja Cetak', 0, 0, '', '', '', '', NULL),
(506, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 20, 3, 'Belanja Penggandaan', 0, 0, '', '', '', '', NULL),
(507, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 0, 20, 3, 'Belanja Sewa Rumah/Gedung/Gudang/Parkir', 0, 0, '', '', '', '', NULL),
(508, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 2, 20, 3, 'Belanja Sewa Gedung/Kantor/Tempat', 0, 0, '', '', '', '', NULL),
(509, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 0, 20, 3, 'Belanja Sewa Perlengkapan dan Peralatan Kanto', 0, 0, '', '', '', '', NULL),
(510, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 7, 20, 3, 'Belanja Sewa Sound System', 0, 0, '', '', '', '', NULL),
(511, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 8, 20, 3, 'Belanja Sewa Dekorasi', 0, 0, '', '', '', '', NULL),
(512, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 20, 3, 'Belanja Makanan dan  Minuman', 0, 0, '', '', '', '', NULL),
(513, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 4, 20, 3, 'Belanja makanan dan minuman pelatihan', 0, 0, '', '', '', '', NULL),
(514, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 20, 3, 'Belanja Perjalanan Dinas', 0, 0, '', '', '', '', NULL),
(515, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 2, 20, 3, 'Belanja Perjalanan Dinas Luar Daerah', 0, 0, '', '', '', '', NULL),
(516, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 0, 20, 3, 'Belanja Transportasi dan Akomodasi', 0, 0, '', '', '', '', NULL),
(517, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 1, 20, 3, 'Belanja Transportasi dan Akomodasi', 0, 0, '', '', '', '', NULL),
(518, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 20, 13, 'Guru Honor Daerah', 24742262000, 16859182000, '', '', '', '', NULL),
(519, 1, 1, 1, 1, 2019, 5, 2, 1, 0, 0, 20, 13, 'Belanja Pegawai', 24428400000, 16649900000, '', '', '', '', NULL),
(520, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 0, 20, 13, 'Honorarium Non PNS', 24428400000, 16649900000, '', '', '', '', NULL),
(521, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 8, 20, 13, 'Honorarium Guru Kontrak Daerah', 24428400000, 16649900000, '', '', '', '', NULL),
(522, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 20, 13, 'Belanja Barang dan Jasa', 313862000, 209282000, '', '', '', '', NULL),
(523, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 0, 20, 13, 'Belanja Bahan Pakai Habis', 15468000, 15445000, '', '', '', '', NULL),
(524, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 1, 20, 13, 'Belanja Alat Tulis Kantor', 15468000, 15445000, '', '', '', '', NULL),
(525, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 20, 13, 'Belanja Cetak dan Penggandaan', 9083000, 7500000, '', '', '', '', NULL),
(526, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 20, 13, 'Belanja Penggandaan', 9083000, 7500000, '', '', '', '', NULL),
(527, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 20, 13, 'Belanja Makanan dan  Minuman', 158000000, 147745000, '', '', '', '', NULL),
(528, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 2, 20, 13, 'Belanja Makanan Dan Minuman Rapat', 158000000, 147745000, '', '', '', '', NULL),
(529, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 20, 13, 'Belanja Perjalanan Dinas', 131311000, 38592000, '', '', '', '', NULL),
(530, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 1, 20, 13, 'Belanja Perjalanan Dinas Dalam Daerah', 112994000, 20675000, '', '', '', '', NULL),
(531, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 2, 20, 13, 'Belanja Perjalanan Dinas Luar Daerah', 18317000, 17917000, '', '', '', '', NULL),
(532, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 20, 14, 'Peningkatan Mutu Kepala Sekolah', 270957500, 0, '', '', '', '', NULL),
(533, 1, 1, 1, 1, 2019, 5, 2, 1, 0, 0, 20, 14, 'Belanja Pegawai', 63900000, 0, '', '', '', '', NULL),
(534, 1, 1, 1, 1, 2019, 5, 2, 1, 1, 0, 20, 14, 'Honorarium PNS', 63900000, 0, '', '', '', '', NULL),
(535, 1, 1, 1, 1, 2019, 5, 2, 1, 1, 3, 20, 14, 'Honorarium Tenaga Ahli/Instruktur/Narasumber', 63900000, 0, '', '', '', '', NULL),
(536, 1, 1, 1, 1, 2019, 5, 2, 1, 7, 0, 20, 14, 'Honorarium Tim/Kepanitiaan', 0, 0, '', '', '', '', NULL),
(537, 1, 1, 1, 1, 2019, 5, 2, 1, 7, 1, 20, 14, ' Honorarium Tim/Kepanitiaan', 0, 0, '', '', '', '', NULL),
(538, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 20, 14, 'Belanja Barang dan Jasa', 207057500, 0, '', '', '', '', NULL),
(539, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 0, 20, 14, 'Belanja Bahan Pakai Habis', 28095000, 0, '', '', '', '', NULL),
(540, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 1, 20, 14, 'Belanja Alat Tulis Kantor', 27595000, 0, '', '', '', '', NULL),
(541, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 12, 20, 14, 'Belanja Dokumentasi', 500000, 0, '', '', '', '', NULL),
(542, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 20, 14, 'Belanja Cetak dan Penggandaan', 19052500, 0, '', '', '', '', NULL),
(543, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 1, 20, 14, 'Belanja Cetak', 2500000, 0, '', '', '', '', NULL),
(544, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 20, 14, 'Belanja Penggandaan', 16552500, 0, '', '', '', '', NULL),
(545, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 0, 20, 14, 'Belanja Sewa Rumah/Gedung/Gudang/Parkir', 5000000, 0, '', '', '', '', NULL),
(546, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 2, 20, 14, 'Belanja Sewa Gedung/Kantor/Tempat', 5000000, 0, '', '', '', '', NULL),
(547, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 0, 20, 14, 'Belanja Sewa Perlengkapan dan Peralatan Kanto', 2500000, 0, '', '', '', '', NULL),
(548, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 7, 20, 14, 'Belanja Sewa Sound System', 2500000, 0, '', '', '', '', NULL),
(549, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 20, 14, 'Belanja Makanan dan  Minuman', 114310000, 0, '', '', '', '', NULL),
(550, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 4, 20, 14, 'Belanja makanan dan minuman pelatihan', 114310000, 0, '', '', '', '', NULL),
(551, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 20, 14, 'Belanja Perjalanan Dinas', 0, 0, '', '', '', '', NULL),
(552, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 2, 20, 14, 'Belanja Perjalanan Dinas Luar Daerah', 0, 0, '', '', '', '', NULL),
(553, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 0, 20, 14, 'Belanja Transportasi dan Akomodasi', 38100000, 0, '', '', '', '', NULL),
(554, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 1, 20, 14, 'Belanja Transportasi dan Akomodasi', 38100000, 0, '', '', '', '', NULL),
(555, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 20, 15, 'Operasional Peningkatan Pelayanan Mutu Pendid', 201993680, 121046400, '', '', '', '', NULL),
(556, 1, 1, 1, 1, 2019, 5, 2, 1, 0, 0, 20, 15, 'Belanja Pegawai', 35720000, 35720000, '', '', '', '', NULL),
(557, 1, 1, 1, 1, 2019, 5, 2, 1, 7, 0, 20, 15, 'Honorarium Tim/Kepanitiaan', 35720000, 35720000, '', '', '', '', NULL),
(558, 1, 1, 1, 1, 2019, 5, 2, 1, 7, 1, 20, 15, ' Honorarium Tim/Kepanitiaan', 35720000, 35720000, '', '', '', '', NULL),
(559, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 20, 15, 'Belanja Barang dan Jasa', 166273680, 85326400, '', '', '', '', NULL),
(560, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 0, 20, 15, 'Belanja Bahan Pakai Habis', 12490000, 0, '', '', '', '', NULL),
(561, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 1, 20, 15, 'Belanja Alat Tulis Kantor', 12490000, 0, '', '', '', '', NULL),
(562, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 20, 15, 'Belanja Cetak dan Penggandaan', 3250000, 0, '', '', '', '', NULL),
(563, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 20, 15, 'Belanja Penggandaan', 3250000, 0, '', '', '', '', NULL),
(564, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 20, 15, 'Belanja Makanan dan  Minuman', 5000000, 0, '', '', '', '', NULL),
(565, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 2, 20, 15, 'Belanja Makanan Dan Minuman Rapat', 5000000, 0, '', '', '', '', NULL),
(566, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 20, 15, 'Belanja Perjalanan Dinas', 145533680, 85326400, '', '', '', '', NULL),
(567, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 1, 20, 15, 'Belanja Perjalanan Dinas Dalam Daerah', 19000000, 19000000, '', '', '', '', NULL),
(568, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 2, 20, 15, 'Belanja Perjalanan Dinas Luar Daerah', 126533680, 66326400, '', '', '', '', NULL),
(569, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 20, 17, 'Pelatihan Bagi Pendidik Untuk Memenuhi Standa', 0, 0, '', '', '', '', NULL),
(570, 1, 1, 1, 1, 2019, 5, 2, 1, 0, 0, 20, 17, 'Belanja Pegawai', 0, 0, '', '', '', '', NULL),
(571, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 0, 20, 17, 'Honorarium Non PNS', 0, 0, '', '', '', '', NULL),
(572, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 1, 20, 17, 'Honorarium Tenaga Ahli/Instruktur/Narasumber', 0, 0, '', '', '', '', NULL),
(573, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 20, 17, 'Belanja Barang dan Jasa', 0, 0, '', '', '', '', NULL),
(574, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 0, 20, 17, 'Belanja Bahan Pakai Habis', 0, 0, '', '', '', '', NULL),
(575, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 1, 20, 17, 'Belanja Alat Tulis Kantor', 0, 0, '', '', '', '', NULL),
(576, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 20, 17, 'Belanja Cetak dan Penggandaan', 0, 0, '', '', '', '', NULL),
(577, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 1, 20, 17, 'Belanja Cetak', 0, 0, '', '', '', '', NULL),
(578, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 20, 17, 'Belanja Penggandaan', 0, 0, '', '', '', '', NULL),
(579, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 0, 20, 17, 'Belanja Sewa Rumah/Gedung/Gudang/Parkir', 0, 0, '', '', '', '', NULL),
(580, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 3, 20, 17, 'Belanja Sewa Ruang Rapat/Pertemuan', 0, 0, '', '', '', '', NULL),
(581, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 0, 20, 17, 'Belanja Sewa Perlengkapan dan Peralatan Kanto', 0, 0, '', '', '', '', NULL),
(582, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 8, 20, 17, 'Belanja Sewa Dekorasi', 0, 0, '', '', '', '', NULL),
(583, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 20, 17, 'Belanja Makanan dan  Minuman', 0, 0, '', '', '', '', NULL),
(584, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 2, 20, 17, 'Belanja Makanan Dan Minuman Rapat', 0, 0, '', '', '', '', NULL),
(585, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 0, 20, 17, 'Belanja Transportasi dan Akomodasi', 0, 0, '', '', '', '', NULL),
(586, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 1, 20, 17, 'Belanja Transportasi dan Akomodasi', 0, 0, '', '', '', '', NULL),
(587, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 20, 19, 'Pembelajaran Berbasis IT', 264000000, 0, '', '', '', '', NULL),
(588, 1, 1, 1, 1, 2019, 5, 2, 1, 0, 0, 20, 19, 'Belanja Pegawai', 12000000, 0, '', '', '', '', NULL),
(589, 1, 1, 1, 1, 2019, 5, 2, 1, 1, 0, 20, 19, 'Honorarium PNS', 12000000, 0, '', '', '', '', NULL),
(590, 1, 1, 1, 1, 2019, 5, 2, 1, 1, 1, 20, 19, 'Honorarium Panitia Pelaksana Kegiatan', 12000000, 0, '', '', '', '', NULL),
(591, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 20, 19, 'Belanja Barang dan Jasa', 252000000, 0, '', '', '', '', NULL),
(592, 1, 1, 1, 1, 2019, 5, 2, 2, 3, 0, 20, 19, 'Belanja Jasa Kantor', 230000000, 0, '', '', '', '', NULL),
(593, 1, 1, 1, 1, 2019, 5, 2, 2, 3, 6, 20, 19, 'Belanja Kawat/Faksimili/Internet/Intranet/TV ', 230000000, 0, '', '', '', '', NULL),
(594, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 20, 19, 'Belanja Makanan dan  Minuman', 22000000, 0, '', '', '', '', NULL),
(595, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 2, 20, 19, 'Belanja Makanan Dan Minuman Rapat', 22000000, 0, '', '', '', '', NULL),
(596, 1, 1, 1, 1, 2019, 5, 2, 3, 0, 0, 20, 19, 'Belanja Modal', 0, 0, '', '', '', '', NULL),
(597, 1, 1, 1, 1, 2019, 5, 2, 3, 29, 0, 20, 19, 'Belanja Modal Peralatan dan Mesin - Pengadaan', 0, 0, '', '', '', '', NULL),
(598, 1, 1, 1, 1, 2019, 5, 2, 3, 29, 6, 20, 19, 'Belanja Modal Peralatan dan Mesin - Pengadaan', 0, 0, '', '', '', '', NULL),
(599, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 20, 20, 'Rapat Kerja Kepala Sekolah', 158072000, 0, '', '', '', '', NULL),
(600, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 20, 20, 'Belanja Barang dan Jasa', 158072000, 0, '', '', '', '', NULL),
(601, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 0, 20, 20, 'Belanja Bahan Pakai Habis', 8000000, 0, '', '', '', '', NULL),
(602, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 1, 20, 20, 'Belanja Alat Tulis Kantor', 8000000, 0, '', '', '', '', NULL),
(603, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 0, 20, 20, 'Belanja Bahan/Material', 1750000, 0, '', '', '', '', NULL),
(604, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 12, 20, 20, 'Belanja bahan spanduk dan umbul-umbul', 1750000, 0, '', '', '', '', NULL),
(605, 1, 1, 1, 1, 2019, 5, 2, 2, 3, 0, 20, 20, 'Belanja Jasa Kantor', 12300000, 0, '', '', '', '', NULL),
(606, 1, 1, 1, 1, 2019, 5, 2, 2, 3, 21, 20, 20, 'Belanja jasa narasumber/tenaga ahli', 12300000, 0, '', '', '', '', NULL),
(607, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 20, 20, 'Belanja Cetak dan Penggandaan', 2697000, 0, '', '', '', '', NULL),
(608, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 20, 20, 'Belanja Penggandaan', 2697000, 0, '', '', '', '', NULL),
(609, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 0, 20, 20, 'Belanja Sewa Rumah/Gedung/Gudang/Parkir', 5000000, 0, '', '', '', '', NULL),
(610, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 2, 20, 20, 'Belanja Sewa Gedung/Kantor/Tempat', 5000000, 0, '', '', '', '', NULL),
(611, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 0, 20, 20, 'Belanja Sewa Perlengkapan dan Peralatan Kanto', 2000000, 0, '', '', '', '', NULL),
(612, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 7, 20, 20, 'Belanja Sewa Sound System', 2000000, 0, '', '', '', '', NULL),
(613, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 20, 20, 'Belanja Makanan dan  Minuman', 28275000, 0, '', '', '', '', NULL),
(614, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 2, 20, 20, 'Belanja Makanan Dan Minuman Rapat', 28275000, 0, '', '', '', '', NULL),
(615, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 0, 20, 20, 'Belanja Transportasi dan Akomodasi', 98050000, 0, '', '', '', '', NULL),
(616, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 1, 20, 20, 'Belanja Transportasi dan Akomodasi', 98050000, 0, '', '', '', '', NULL),
(617, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 22, 0, 'Program Manajemen Pelayanan Pendidikan', 2201858950, 1587374915, '', '', '', '', NULL),
(618, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 22, 9, 'Monitoring, evaluasi dan pelaporan', 340731500, 245004700, '', '', '', '', NULL),
(619, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 22, 9, 'Belanja Barang dan Jasa', 340731500, 245004700, '', '', '', '', NULL),
(620, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 22, 9, 'Belanja Cetak dan Penggandaan', 1839500, 1839500, '', '', '', '', NULL),
(621, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 22, 9, 'Belanja Penggandaan', 1839500, 1839500, '', '', '', '', NULL),
(622, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 22, 9, 'Belanja Makanan dan  Minuman', 5325000, 5250000, '', '', '', '', NULL),
(623, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 2, 22, 9, 'Belanja Makanan Dan Minuman Rapat', 5325000, 5250000, '', '', '', '', NULL),
(624, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 22, 9, 'Belanja Perjalanan Dinas', 333567000, 237915200, '', '', '', '', NULL),
(625, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 1, 22, 9, 'Belanja Perjalanan Dinas Dalam Daerah', 329197000, 233545200, '', '', '', '', NULL),
(626, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 2, 22, 9, 'Belanja Perjalanan Dinas Luar Daerah', 4370000, 4370000, '', '', '', '', NULL),
(627, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 22, 10, 'Operasional Sekolah', 979174450, 852665215, '', '', '', '', NULL),
(628, 1, 1, 1, 1, 2019, 5, 2, 1, 0, 0, 22, 10, 'Belanja Pegawai', 206348150, 141177150, '', '', '', '', NULL),
(629, 1, 1, 1, 1, 2019, 5, 2, 1, 1, 0, 22, 10, 'Honorarium PNS', 206348150, 141177150, '', '', '', '', NULL),
(630, 1, 1, 1, 1, 2019, 5, 2, 1, 1, 1, 22, 10, 'Honorarium Panitia Pelaksana Kegiatan', 206348150, 141177150, '', '', '', '', NULL),
(631, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 22, 10, 'Belanja Barang dan Jasa', 772826300, 711488065, '', '', '', '', NULL),
(632, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 0, 22, 10, 'Belanja Bahan Pakai Habis', 975300, 975300, '', '', '', '', NULL),
(633, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 1, 22, 10, 'Belanja Alat Tulis Kantor', 975300, 975300, '', '', '', '', NULL),
(634, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 0, 22, 10, 'Belanja Bahan/Material', 1400000, 0, '', '', '', '', NULL),
(635, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 12, 22, 10, 'Belanja bahan spanduk dan umbul-umbul', 1400000, 0, '', '', '', '', NULL),
(636, 1, 1, 1, 1, 2019, 5, 2, 2, 3, 0, 22, 10, 'Belanja Jasa Kantor', 218400000, 31200000, '', '', '', '', NULL),
(637, 1, 1, 1, 1, 2019, 5, 2, 2, 3, 21, 22, 10, 'Belanja jasa narasumber/tenaga ahli', 218400000, 31200000, '', '', '', '', NULL),
(638, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 22, 10, 'Belanja Cetak dan Penggandaan', 226409000, 521067565, '', '', '', '', NULL),
(639, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 1, 22, 10, 'Belanja Cetak', 15909000, 15909000, '', '', '', '', NULL),
(640, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 22, 10, 'Belanja Penggandaan', 210500000, 505158565, '', '', '', '', NULL),
(641, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 0, 22, 10, 'Belanja Sewa Rumah/Gedung/Gudang/Parkir', 8000000, 2000000, '', '', '', '', NULL),
(642, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 2, 22, 10, 'Belanja Sewa Gedung/Kantor/Tempat', 8000000, 2000000, '', '', '', '', NULL),
(643, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 22, 10, 'Belanja Makanan dan  Minuman', 49900000, 17950000, '', '', '', '', NULL),
(644, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 2, 22, 10, 'Belanja Makanan Dan Minuman Rapat', 49900000, 17950000, '', '', '', '', NULL),
(645, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 22, 10, 'Belanja Perjalanan Dinas', 200892000, 138295200, '', '', '', '', NULL),
(646, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 1, 22, 10, 'Belanja Perjalanan Dinas Dalam Daerah', 84762000, 84495000, '', '', '', '', NULL),
(647, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 2, 22, 10, 'Belanja Perjalanan Dinas Luar Daerah', 116130000, 53800200, '', '', '', '', NULL),
(648, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 0, 22, 10, 'Belanja Transportasi dan Akomodasi', 66850000, 0, '', '', '', '', NULL),
(649, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 1, 22, 10, 'Belanja Transportasi dan Akomodasi', 66850000, 0, '', '', '', '', NULL),
(650, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 22, 11, 'Penyusunan Profil Kependidikan', 274638000, 38500000, '', '', '', '', NULL),
(651, 1, 1, 1, 1, 2019, 5, 2, 1, 0, 0, 22, 11, 'Belanja Pegawai', 15300000, 9500000, '', '', '', '', NULL),
(652, 1, 1, 1, 1, 2019, 5, 2, 1, 1, 0, 22, 11, 'Honorarium PNS', 15300000, 9500000, '', '', '', '', NULL),
(653, 1, 1, 1, 1, 2019, 5, 2, 1, 1, 1, 22, 11, 'Honorarium Panitia Pelaksana Kegiatan', 9500000, 9500000, '', '', '', '', NULL),
(654, 1, 1, 1, 1, 2019, 5, 2, 1, 1, 3, 22, 11, 'Honorarium Tenaga Ahli/Instruktur/Narasumber', 5800000, 0, '', '', '', '', NULL),
(655, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 22, 11, 'Belanja Barang dan Jasa', 259338000, 29000000, '', '', '', '', NULL),
(656, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 0, 22, 11, 'Belanja Bahan/Material', 350000, 0, '', '', '', '', NULL),
(657, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 12, 22, 11, 'Belanja bahan spanduk dan umbul-umbul', 350000, 0, '', '', '', '', NULL),
(658, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 22, 11, 'Belanja Cetak dan Penggandaan', 56758000, 6500000, '', '', '', '', NULL),
(659, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 22, 11, 'Belanja Penggandaan', 56758000, 6500000, '', '', '', '', NULL),
(660, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 0, 22, 11, 'Belanja Sewa Rumah/Gedung/Gudang/Parkir', 3000000, 0, '', '', '', '', NULL),
(661, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 2, 22, 11, 'Belanja Sewa Gedung/Kantor/Tempat', 3000000, 0, '', '', '', '', NULL),
(662, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 22, 11, 'Belanja Makanan dan  Minuman', 11000000, 0, '', '', '', '', NULL),
(663, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 2, 22, 11, 'Belanja Makanan Dan Minuman Rapat', 11000000, 0, '', '', '', '', NULL),
(664, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 22, 11, 'Belanja Perjalanan Dinas', 126030000, 22500000, '', '', '', '', NULL),
(665, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 1, 22, 11, 'Belanja Perjalanan Dinas Dalam Daerah', 28180000, 0, '', '', '', '', NULL),
(666, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 2, 22, 11, 'Belanja Perjalanan Dinas Luar Daerah', 97850000, 22500000, '', '', '', '', NULL),
(667, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 0, 22, 11, 'Belanja Transportasi dan Akomodasi', 62200000, 0, '', '', '', '', NULL),
(668, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 1, 22, 11, 'Belanja Transportasi dan Akomodasi', 62200000, 0, '', '', '', '', NULL),
(669, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 22, 12, 'Penyediaan Operasional UPTD dan SKB', 485625000, 329515000, '', '', '', '', NULL),
(670, 1, 1, 1, 1, 2019, 5, 2, 1, 0, 0, 22, 12, 'Belanja Pegawai', 288050000, 250030000, '', '', '', '', NULL),
(671, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 0, 22, 12, 'Honorarium Non PNS', 24300000, 24300000, '', '', '', '', NULL),
(672, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 2, 22, 12, 'Honorarium Staf Teknis/Administrasi Kegiatan', 24300000, 24300000, '', '', '', '', NULL),
(673, 1, 1, 1, 1, 2019, 5, 2, 1, 7, 0, 22, 12, 'Honorarium Tim/Kepanitiaan', 263750000, 225730000, '', '', '', '', NULL),
(674, 1, 1, 1, 1, 2019, 5, 2, 1, 7, 1, 22, 12, ' Honorarium Tim/Kepanitiaan', 263750000, 225730000, '', '', '', '', NULL),
(675, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 22, 12, 'Belanja Barang dan Jasa', 197575000, 79485000, '', '', '', '', NULL),
(676, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 0, 22, 12, 'Belanja Bahan Pakai Habis', 5077500, 0, '', '', '', '', NULL),
(677, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 1, 22, 12, 'Belanja Alat Tulis Kantor', 5077500, 0, '', '', '', '', NULL),
(678, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 0, 22, 12, 'Belanja Bahan/Material', 2795000, 800000, '', '', '', '', NULL),
(679, 1, 1, 1, 1, 2019, 5, 2, 2, 2, 12, 22, 12, 'Belanja bahan spanduk dan umbul-umbul', 2795000, 800000, '', '', '', '', NULL),
(680, 1, 1, 1, 1, 2019, 5, 2, 2, 3, 0, 22, 12, 'Belanja Jasa Kantor', 7200000, 0, '', '', '', '', NULL),
(681, 1, 1, 1, 1, 2019, 5, 2, 2, 3, 21, 22, 12, 'Belanja jasa narasumber/tenaga ahli', 7200000, 0, '', '', '', '', NULL),
(682, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 0, 22, 12, 'Belanja Sewa Rumah/Gedung/Gudang/Parkir', 12550000, 10550000, '', '', '', '', NULL),
(683, 1, 1, 1, 1, 2019, 5, 2, 2, 7, 2, 22, 12, 'Belanja Sewa Gedung/Kantor/Tempat', 12550000, 10550000, '', '', '', '', NULL),
(684, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 0, 22, 12, 'Belanja Sewa Perlengkapan dan Peralatan Kanto', 3662500, 1500000, '', '', '', '', NULL),
(685, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 1, 22, 12, 'Belanja Sewa Meja Kursi', 1162500, 0, '', '', '', '', NULL),
(686, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 7, 22, 12, 'Belanja Sewa Sound System', 1500000, 1500000, '', '', '', '', NULL),
(687, 1, 1, 1, 1, 2019, 5, 2, 2, 10, 8, 22, 12, 'Belanja Sewa Dekorasi', 1000000, 0, '', '', '', '', NULL),
(688, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 0, 22, 12, 'Belanja Makanan dan  Minuman', 78865000, 12500000, '', '', '', '', NULL),
(689, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 2, 22, 12, 'Belanja Makanan Dan Minuman Rapat', 66365000, 0, '', '', '', '', NULL),
(690, 1, 1, 1, 1, 2019, 5, 2, 2, 11, 3, 22, 12, 'Belanja Makanan Dan Minuman Tamu', 12500000, 12500000, '', '', '', '', NULL),
(691, 1, 1, 1, 1, 2019, 5, 2, 2, 14, 0, 22, 12, 'Belanja Pakaian khusus dan hari-hari tertentu', 11400000, 0, '', '', '', '', NULL),
(692, 1, 1, 1, 1, 2019, 5, 2, 2, 14, 5, 22, 12, 'Belanja Pakaian Tertentu', 11400000, 0, '', '', '', '', NULL),
(693, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 22, 12, 'Belanja Perjalanan Dinas', 45225000, 27135000, '', '', '', '', NULL),
(694, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 1, 22, 12, 'Belanja Perjalanan Dinas Dalam Daerah', 45225000, 27135000, '', '', '', '', NULL),
(695, 1, 1, 1, 1, 2019, 5, 2, 2, 20, 0, 22, 12, 'Belanja Pemeliharaan', 27000000, 27000000, '', '', '', '', NULL),
(696, 1, 1, 1, 1, 2019, 5, 2, 2, 20, 5, 22, 12, 'Belanja Pemeliharan Gedung dan Bangunan', 27000000, 27000000, '', '', '', '', NULL),
(697, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 0, 22, 12, 'Belanja Transportasi dan Akomodasi', 3800000, 0, '', '', '', '', NULL),
(698, 1, 1, 1, 1, 2019, 5, 2, 2, 29, 1, 22, 12, 'Belanja Transportasi dan Akomodasi', 3800000, 0, '', '', '', '', NULL),
(699, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 22, 14, 'Biaya Operasional Pendataan Siswa Putus Sekol', 46690000, 46690000, '', '', '', '', NULL),
(700, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 22, 14, 'Belanja Barang dan Jasa', 46690000, 46690000, '', '', '', '', NULL),
(701, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 22, 14, 'Belanja Perjalanan Dinas', 46690000, 46690000, '', '', '', '', NULL),
(702, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 1, 22, 14, 'Belanja Perjalanan Dinas Dalam Daerah', 46690000, 46690000, '', '', '', '', NULL),
(703, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 22, 15, 'Publikasi dan Sosialisai Program Pembangunan ', 75000000, 75000000, '', '', '', '', NULL),
(704, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 22, 15, 'Belanja Barang dan Jasa', 75000000, 75000000, '', '', '', '', NULL),
(705, 1, 1, 1, 1, 2019, 5, 2, 2, 17, 0, 22, 15, 'Belanja kursus, pelatihan, sosialisasi dan bi', 0, 0, '', '', '', '', NULL),
(706, 1, 1, 1, 1, 2019, 5, 2, 2, 17, 2, 22, 15, 'Belanja Sosialisasi', 0, 0, '', '', '', '', NULL),
(707, 1, 1, 1, 1, 2019, 5, 2, 2, 30, 0, 22, 15, 'Belanja Operasional', 75000000, 75000000, '', '', '', '', NULL),
(708, 1, 1, 1, 1, 2019, 5, 2, 2, 30, 7, 22, 15, 'Belanja Operasional Penyenggaraan Pendidikan', 50000000, 50000000, '', '', '', '', NULL),
(709, 1, 1, 1, 1, 2019, 5, 2, 2, 30, 8, 22, 15, 'Belanja Operasional Akreditasi Puskesmas', 25000000, 25000000, '', '', '', '', NULL),
(710, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 26, 0, 'Program Pendidikan Formal dan Informal', 735896288, 145748750, '', '', '', '', NULL),
(711, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 26, 1, 'Penyediaan Operasional SKB', 52901288, 0, '', '', '', '', NULL),
(712, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 26, 1, 'Belanja Barang dan Jasa', 52901288, 0, '', '', '', '', NULL),
(713, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 0, 26, 1, 'Belanja Bahan Pakai Habis', 3508788, 0, '', '', '', '', NULL),
(714, 1, 1, 1, 1, 2019, 5, 2, 2, 1, 1, 26, 1, 'Belanja Alat Tulis Kantor', 3508788, 0, '', '', '', '', NULL),
(715, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 0, 26, 1, 'Belanja Cetak dan Penggandaan', 1262500, 0, '', '', '', '', NULL),
(716, 1, 1, 1, 1, 2019, 5, 2, 2, 6, 2, 26, 1, 'Belanja Penggandaan', 1262500, 0, '', '', '', '', NULL),
(717, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 26, 1, 'Belanja Perjalanan Dinas', 48130000, 0, '', '', '', '', NULL),
(718, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 1, 26, 1, 'Belanja Perjalanan Dinas Dalam Daerah', 32930000, 0, '', '', '', '', NULL),
(719, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 2, 26, 1, 'Belanja Perjalanan Dinas Luar Daerah', 15200000, 0, '', '', '', '', NULL),
(720, 1, 1, 1, 1, 2019, 5, 2, 0, 0, 0, 26, 2, 'Penyediaan Sarana dan Prasarana Belajar SKB (', 682995000, 145748750, '', '', '', '', NULL),
(721, 1, 1, 1, 1, 2019, 5, 2, 1, 0, 0, 26, 2, 'Belanja Pegawai', 22500000, 0, '', '', '', '', NULL),
(722, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 0, 26, 2, 'Honorarium Non PNS', 15000000, 0, '', '', '', '', NULL),
(723, 1, 1, 1, 1, 2019, 5, 2, 1, 2, 1, 26, 2, 'Honorarium Tenaga Ahli/Instruktur/Narasumber', 15000000, 0, '', '', '', '', NULL),
(724, 1, 1, 1, 1, 2019, 5, 2, 1, 7, 0, 26, 2, 'Honorarium Tim/Kepanitiaan', 7500000, 0, '', '', '', '', NULL),
(725, 1, 1, 1, 1, 2019, 5, 2, 1, 7, 1, 26, 2, ' Honorarium Tim/Kepanitiaan', 7500000, 0, '', '', '', '', NULL),
(726, 1, 1, 1, 1, 2019, 5, 2, 2, 0, 0, 26, 2, 'Belanja Barang dan Jasa', 7500000, 0, '', '', '', '', NULL),
(727, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 0, 26, 2, 'Belanja Perjalanan Dinas', 7500000, 0, '', '', '', '', NULL),
(728, 1, 1, 1, 1, 2019, 5, 2, 2, 15, 1, 26, 2, 'Belanja Perjalanan Dinas Dalam Daerah', 7500000, 0, '', '', '', '', NULL),
(729, 1, 1, 1, 1, 2019, 5, 2, 3, 0, 0, 26, 2, 'Belanja Modal', 652995000, 145748750, '', '', '', '', NULL),
(730, 1, 1, 1, 1, 2019, 5, 2, 3, 37, 0, 26, 2, 'Belanja Modal Peralatan dan Mesin - Pengadaan', 20000000, 0, '', '', '', '', NULL),
(731, 1, 1, 1, 1, 2019, 5, 2, 3, 37, 13, 26, 2, 'Belanja Modal Peralatan dan Mesin - Pengadaan', 20000000, 0, '', '', '', '', NULL),
(732, 1, 1, 1, 1, 2019, 5, 2, 3, 49, 0, 26, 2, 'Belanja Modal Gedung dan Bangunan - Pengadaan', 622995000, 145748750, '', '', '', '', NULL),
(733, 1, 1, 1, 1, 2019, 5, 2, 3, 49, 10, 26, 2, 'Belanja Modal Gedung dan Bangunan - Pengadaan', 622995000, 145748750, '', '', '', '', NULL),
(734, 1, 1, 1, 1, 2019, 5, 2, 3, 82, 0, 26, 2, 'Belanja Modal Aset Tetap Lainnya - Pengadaan ', 10000000, 0, '', '', '', '', NULL),
(735, 1, 1, 1, 1, 2019, 5, 2, 3, 82, 1, 26, 2, 'Belanja Modal Aset Tetap Lainnya - Pengadaan ', 10000000, 0, '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_monev_triwulan`
--

CREATE TABLE `tb_monev_triwulan` (
  `id_tb_monev_triwulan` int(11) NOT NULL,
  `tb_urusan_kode` int(11) NOT NULL,
  `tb_bidang_kode` int(11) NOT NULL,
  `tb_unit_kode` int(11) NOT NULL,
  `tb_sub_unit_kode` int(11) NOT NULL,
  `id_tb_rpjmd` int(11) DEFAULT NULL,
  `tb_rpjmd_misi_kode` int(11) DEFAULT NULL,
  `tb_rpjmd_tujuan_kode` int(11) DEFAULT NULL,
  `tb_rpjmd_sasaran_kode` int(11) DEFAULT NULL,
  `tb_rpjmd_program_kode` int(11) DEFAULT NULL,
  `tb_rpjmd_kegiatan_kode` int(11) DEFAULT NULL,
  `tb_monev_triwulan_tahun` int(11) DEFAULT NULL,
  `tb_monev_triwulan_indikator` text,
  `tb_monev_triwulan_target1` double DEFAULT NULL,
  `tb_monev_triwulan_rupiah1` double DEFAULT NULL,
  `tb_monev_triwulan_target2` double DEFAULT NULL,
  `tb_monev_triwulan_rupiah2` double DEFAULT NULL,
  `tb_monev_triwulan_target3` double DEFAULT NULL,
  `tb_monev_triwulan_rupiah3` double DEFAULT NULL,
  `tb_monev_triwulan_target4` double DEFAULT NULL,
  `tb_monev_triwulan_rupiah4` double DEFAULT NULL,
  `id_tb_satuan` int(11) DEFAULT NULL,
  `tb_monev_triwulan_satuan` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_monev_triwulan`
--

INSERT INTO `tb_monev_triwulan` (`id_tb_monev_triwulan`, `tb_urusan_kode`, `tb_bidang_kode`, `tb_unit_kode`, `tb_sub_unit_kode`, `id_tb_rpjmd`, `tb_rpjmd_misi_kode`, `tb_rpjmd_tujuan_kode`, `tb_rpjmd_sasaran_kode`, `tb_rpjmd_program_kode`, `tb_rpjmd_kegiatan_kode`, `tb_monev_triwulan_tahun`, `tb_monev_triwulan_indikator`, `tb_monev_triwulan_target1`, `tb_monev_triwulan_rupiah1`, `tb_monev_triwulan_target2`, `tb_monev_triwulan_rupiah2`, `tb_monev_triwulan_target3`, `tb_monev_triwulan_rupiah3`, `tb_monev_triwulan_target4`, `tb_monev_triwulan_rupiah4`, `id_tb_satuan`, `tb_monev_triwulan_satuan`) VALUES
(5, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 1, NULL, NULL, 1000000, 77, 1000000, 55, 1000000, 100, 1000000, NULL, NULL),
(6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, 100, 1000000, 100, 1000000, 100, 1000000, 100, 1000000, NULL, NULL),
(7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, NULL, 100, 1000000, 100, 1000000, 100, 1000000, 100, 1000000, NULL, NULL),
(8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, NULL, 100, 1000000, 100, 1000000, 100, 1000000, 100, 1000000, NULL, NULL),
(9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, NULL, 100, 1000000, 100, 1000000, 100, 1000000, 100, 1000000, NULL, NULL),
(10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, NULL, 100, 1000000, 100, 1000000, 100, 1000000, 100, 1000000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_musrenbang_grub`
--

CREATE TABLE `tb_musrenbang_grub` (
  `id_tb_musrenbang_grub` int(11) NOT NULL,
  `tb_musrenbang_grub_tahun` int(11) DEFAULT NULL,
  `tb_musrenbang_grub_user_kel` varchar(20) DEFAULT NULL,
  `tb_musrenbang_grub_user_kec` varchar(20) DEFAULT NULL,
  `tb_musrenbang_grub_user_pokir` int(11) DEFAULT NULL,
  `tb_musrenbang_grub_tgl_input` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_musrenbang_kec`
--

CREATE TABLE `tb_musrenbang_kec` (
  `id_tb_musrenbang_kec` int(11) NOT NULL,
  `id_tb_musrenbang_grub` int(11) NOT NULL,
  `tb_musrenbang_kec_nama` text,
  `tb_musrenbang_kec_alasan` text,
  `tb_musrenbang_kec_lokasi` varchar(100) DEFAULT NULL,
  `tb_musrenbang_kec_volume` double DEFAULT NULL,
  `id_tb_satuan` int(11) NOT NULL,
  `id_tb_indikator` int(11) NOT NULL,
  `tb_musrenbang_kec_pagu` double DEFAULT NULL,
  `tb_musrenbang_kec_pengusul` varchar(50) DEFAULT NULL,
  `tb_musrenbang_kec_manfaat` varchar(100) DEFAULT NULL,
  `tb_musrenbang_kec_file_foto` text,
  `tb_musrenbang_kec_file_ba` text,
  `tb_musrenbang_kec_file_usulan` text,
  `tb_musrenbang_kec_tgl_input` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tb_musrenbang_kec_asal` int(11) DEFAULT NULL,
  `tb_musrenbang_kec_skor_keterdesakan` double DEFAULT NULL,
  `tb_musrenbang_kec_skor_pertumbuhan` double DEFAULT NULL,
  `tb_musrenbang_kec_skor_potensi` double DEFAULT NULL,
  `tb_musrenbang_kec_skor_kemiskinan` double DEFAULT NULL,
  `tb_musrenbang_kec_skor_manfaat` double DEFAULT NULL,
  `tb_musrenbang_kec_skor_partisipasi` double DEFAULT NULL,
  `tb_musrenbang_kec_skor_pelaksanaan` double DEFAULT NULL,
  `tb_musrenbang_kec_skor_dokumen` double DEFAULT NULL,
  `tb_musrenbang_kec_skor_total` double DEFAULT NULL,
  `tb_urusan_kode` int(11) DEFAULT NULL,
  `tb_bidang_kode` int(11) DEFAULT NULL,
  `tb_unit_kode` int(11) DEFAULT NULL,
  `tb_sub_unit_kode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_musrenbang_kel`
--

CREATE TABLE `tb_musrenbang_kel` (
  `id_tb_musrenbang_kel` int(11) NOT NULL,
  `id_tb_musrenbang_grub` int(11) NOT NULL,
  `id_tb_musrenbang_grup` int(11) DEFAULT NULL,
  `tb_musrenbang_kel_nama` text,
  `tb_musrenbang_kel_alasan` text,
  `tb_musrenbang_kel_lokasi` varchar(100) DEFAULT NULL,
  `tb_musrenbang_kel_volume` double DEFAULT NULL,
  `id_tb_satuan` int(11) NOT NULL,
  `id_tb_indikator` int(11) NOT NULL,
  `tb_musrenbang_kel_pagu` double DEFAULT NULL,
  `tb_musrenbang_kel_pengusul` varchar(50) DEFAULT NULL,
  `tb_musrenbang_kel_manfaat` varchar(100) DEFAULT NULL,
  `tb_musrenbang_kel_file_foto` text,
  `tb_musrenbang_kel_file_ba` text,
  `tb_musrenbang_kel_file_usulan` text,
  `tb_musrenbang_kel_tgl_input` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tb_musrenbang_kel_asal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_musrenbang_opd`
--

CREATE TABLE `tb_musrenbang_opd` (
  `id_tb_musrenbang_opd` int(11) NOT NULL,
  `id_tb_musrenbang_grub` int(11) NOT NULL,
  `tb_musrenbang_opd_nama` text,
  `tb_musrenbang_opd_alasan` text,
  `tb_musrenbang_opd_lokasi` varchar(100) DEFAULT NULL,
  `tb_musrenbang_opd_volume` double DEFAULT NULL,
  `id_tb_satuan` int(11) NOT NULL,
  `id_tb_indikator` int(11) NOT NULL,
  `tb_musrenbang_opd_pagu` double DEFAULT NULL,
  `tb_musrenbang_opd_pengusul` varchar(50) DEFAULT NULL,
  `tb_musrenbang_opd_manfaat` varchar(100) DEFAULT NULL,
  `tb_musrenbang_opd_file_foto` text,
  `tb_musrenbang_opd_file_ba` text,
  `tb_musrenbang_opd_file_usulan` text,
  `tb_musrenbang_opd_tgl_input` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tb_musrenbang_opd_asal` int(11) DEFAULT NULL,
  `tb_musrenbang_opd_skor_keterdesakan` double DEFAULT NULL,
  `tb_musrenbang_opd_skor_pertumbuhan` double DEFAULT NULL,
  `tb_musrenbang_opd_skor_potensi` double DEFAULT NULL,
  `tb_musrenbang_opd_skor_kemiskinan` double DEFAULT NULL,
  `tb_musrenbang_opd_skor_manfaat` double DEFAULT NULL,
  `tb_musrenbang_opd_skor_partisipasi` double DEFAULT NULL,
  `tb_musrenbang_opd_skor_pelaksanaan` double DEFAULT NULL,
  `tb_musrenbang_opd_skor_dokumen` double DEFAULT NULL,
  `tb_musrenbang_opd_skor_total` double DEFAULT NULL,
  `tb_urusan_kode` int(11) NOT NULL,
  `tb_bidang_kode` int(11) NOT NULL,
  `tb_unit_kode` int(11) NOT NULL,
  `tb_sub_unit_kode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_musrenbang_pokir`
--

CREATE TABLE `tb_musrenbang_pokir` (
  `id_tb_musrenbang_pokir` int(11) NOT NULL,
  `id_tb_musrenbang_grub` int(11) NOT NULL,
  `tb_musrenbang_pokir_nama` text,
  `tb_musrenbang_pokir_alasan` text,
  `tb_musrenbang_pokir_lokasi` varchar(100) DEFAULT NULL,
  `tb_musrenbang_pokir_volume` double DEFAULT NULL,
  `id_tb_satuan` int(11) NOT NULL,
  `id_tb_indikator` int(11) NOT NULL,
  `tb_musrenbang_pokir_pagu` double DEFAULT NULL,
  `tb_musrenbang_pokir_pengusul` varchar(50) DEFAULT NULL,
  `tb_musrenbang_pokir_manfaat` varchar(100) DEFAULT NULL,
  `tb_musrenbang_pokir_file_foto` text,
  `tb_musrenbang_pokir_file_ba` text,
  `tb_musrenbang_pokir_file_usulan` text,
  `tb_musrenbang_pokir_tgl_input` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tb_musrenbang_pokir_asal` int(11) DEFAULT NULL,
  `tb_musrenbang_pokir_skor_keterdesakan` double DEFAULT NULL,
  `tb_musrenbang_pokir_skor_pertumbuhan` double DEFAULT NULL,
  `tb_musrenbang_pokir_skor_potensi` double DEFAULT NULL,
  `tb_musrenbang_pokir_skor_kemiskinan` double DEFAULT NULL,
  `tb_musrenbang_pokir_skor_manfaat` double DEFAULT NULL,
  `tb_musrenbang_pokir_skor_partisipasi` double DEFAULT NULL,
  `tb_musrenbang_pokir_skor_pelaksanaan` double DEFAULT NULL,
  `tb_musrenbang_pokir_skor_dokumen` double DEFAULT NULL,
  `tb_musrenbang_kec_skor_total` double DEFAULT NULL,
  `tb_urusan_kode` int(11) NOT NULL,
  `tb_bidang_kode` int(11) NOT NULL,
  `tb_unit_kode` int(11) NOT NULL,
  `tb_sub_unit_kode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_program`
--

CREATE TABLE `tb_program` (
  `tb_urusan_kode` int(11) NOT NULL,
  `tb_bidang_kode` int(11) NOT NULL,
  `tb_program_kode` int(11) NOT NULL,
  `tb_program_nama` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_program`
--

INSERT INTO `tb_program` (`tb_urusan_kode`, `tb_bidang_kode`, `tb_program_kode`, `tb_program_nama`) VALUES
(1, 1, 1, 'Program Pelayanan Administrasi Perkantoran');

-- --------------------------------------------------------

--
-- Table structure for table `tb_provinsi`
--

CREATE TABLE `tb_provinsi` (
  `tb_provinsi_kode` int(11) NOT NULL,
  `tb_provinsi_nama` varchar(105) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rekening1`
--

CREATE TABLE `tb_rekening1` (
  `tb_rekening1_kode` int(11) NOT NULL,
  `tb_rekening1_nama` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rekening2`
--

CREATE TABLE `tb_rekening2` (
  `tb_rekening1_kode` int(11) NOT NULL,
  `tb_rekening2_kode` int(11) NOT NULL,
  `tb_rekening2_nama` varchar(105) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rekening3`
--

CREATE TABLE `tb_rekening3` (
  `tb_rekening1_kode` int(11) NOT NULL,
  `tb_rekening2_kode` int(11) NOT NULL,
  `tb_rekening3_kode` int(11) NOT NULL,
  `tb_rekening3_nama` varchar(55) DEFAULT NULL,
  `tb_rekening3_saldo` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rekening4`
--

CREATE TABLE `tb_rekening4` (
  `tb_rekening1_kode` int(11) NOT NULL,
  `tb_rekening2_kode` int(11) NOT NULL,
  `tb_rekening3_kode` int(11) NOT NULL,
  `tb_rekening4_kode` int(11) NOT NULL,
  `tb_rekening4_nama` varchar(105) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rekening5`
--

CREATE TABLE `tb_rekening5` (
  `tb_rekening1_kode` int(11) NOT NULL,
  `tb_rekening2_kode` int(11) NOT NULL,
  `tb_rekening3_kode` int(11) NOT NULL,
  `tb_rekening4_kode` int(11) NOT NULL,
  `tb_rekening5_kode` int(11) NOT NULL,
  `tb_rekening5_nama` varchar(105) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_renstra_kegiatan`
--

CREATE TABLE `tb_renstra_kegiatan` (
  `id_tb_rpjmd` int(11) NOT NULL,
  `tb_rpjmd_misi_kode` int(11) NOT NULL,
  `tb_rpjmd_tujuan_kode` int(11) NOT NULL,
  `tb_rpjmd_sasaran_kode` int(11) NOT NULL,
  `tb_rpjmd_program_kode` int(11) NOT NULL,
  `tb_renstra_kegiatan_kode` int(11) NOT NULL,
  `tb_bidang_kode` int(11) NOT NULL,
  `tb_urusan_kode` int(11) NOT NULL,
  `tb_unit_kode` int(11) NOT NULL,
  `tb_sub_unit_kode` int(11) NOT NULL,
  `tb_renstra_kegiatan_nama` text,
  `tb_renstra_kegiatan_indikator` text,
  `tb_renstra_kegiatan_awal` double DEFAULT NULL,
  `tb_renstra_kegiatan_target1` double DEFAULT NULL,
  `tb_renstra_kegiatan_anggaran1` double DEFAULT NULL,
  `tb_renstra_kegiatan_target2` double DEFAULT NULL,
  `tb_renstra_kegiatan_anggaran2` double DEFAULT NULL,
  `tb_renstra_kegiatan_target3` double DEFAULT NULL,
  `tb_renstra_kegiatan_anggaran3` double DEFAULT NULL,
  `tb_renstra_kegiatan_target4` double DEFAULT NULL,
  `tb_renstra_kegiatan_anggaran4` double DEFAULT NULL,
  `tb_renstra_kegiatan_target5` double DEFAULT NULL,
  `tb_renstra_kegiatan_anggaran5` double DEFAULT NULL,
  `tb_renstra_kegiatan_lokasi` text,
  `tb_renstra_kegiatan_verifikasi` text,
  `id_tb_satuan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_renstra_kegiatan`
--

INSERT INTO `tb_renstra_kegiatan` (`id_tb_rpjmd`, `tb_rpjmd_misi_kode`, `tb_rpjmd_tujuan_kode`, `tb_rpjmd_sasaran_kode`, `tb_rpjmd_program_kode`, `tb_renstra_kegiatan_kode`, `tb_bidang_kode`, `tb_urusan_kode`, `tb_unit_kode`, `tb_sub_unit_kode`, `tb_renstra_kegiatan_nama`, `tb_renstra_kegiatan_indikator`, `tb_renstra_kegiatan_awal`, `tb_renstra_kegiatan_target1`, `tb_renstra_kegiatan_anggaran1`, `tb_renstra_kegiatan_target2`, `tb_renstra_kegiatan_anggaran2`, `tb_renstra_kegiatan_target3`, `tb_renstra_kegiatan_anggaran3`, `tb_renstra_kegiatan_target4`, `tb_renstra_kegiatan_anggaran4`, `tb_renstra_kegiatan_target5`, `tb_renstra_kegiatan_anggaran5`, `tb_renstra_kegiatan_lokasi`, `tb_renstra_kegiatan_verifikasi`, `id_tb_satuan`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'kegiatan 1.1.1.1.1', 'kegiatan 1.1.1.1.1', 60, 100, 200000000, 100, 200000000, 100, 200000000, 100, 200000000, 100, 200000000, '', NULL, 1),
(1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 'kegiatan 1.1.1.1.2', 'kegiatan 1.1.1.1.2', 60, 100, 200000000, 100, 200000000, 100, 200000000, 100, 200000000, 100, 200000000, '', NULL, 1),
(1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 'kegiatan 1.1.1.1.3', 'kegiatan 1.1.1.1.3', 60, 100, 200000000, 100, 200000000, 100, 200000000, 100, 200000000, 100, 200000000, '', NULL, 1),
(1, 1, 1, 1, 1, 4, 1, 1, 1, 1, 'kegiatan 1.1.1.1.4', 'kegiatan 1.1.1.1.4', 60, 100, 200000000, 100, 200000000, 100, 200000000, 100, 200000000, 100, 200000000, '', NULL, 1),
(1, 1, 1, 1, 1, 5, 1, 1, 1, 1, 'kegiatan 1.1.1.1.5', 'kegiatan 1.1.1.1.5', 60, 100, 200000000, 100, 200000000, 100, 200000000, 100, 200000000, 100, 200000000, '', NULL, 1),
(1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 'kegiatan 1.1.1.2.1', 'kegiatan 1.1.1.2.1', 60, 100, 250000000, 100, 250000000, 100, 250000000, 100, 250000000, 100, 250000000, '', NULL, 1),
(1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 'kegiatan 1.1.1.2.2', 'kegiatan 1.1.1.2.2', 60, 100, 250000000, 100, 250000000, 100, 250000000, 100, 250000000, 100, 250000000, '', NULL, 1),
(1, 1, 1, 1, 2, 3, 1, 1, 1, 1, 'kegiatan 1.1.1.2.3', 'kegiatan 1.1.1.2.3', 60, 100, 250000000, 100, 250000000, 100, 250000000, 100, 250000000, 100, 250000000, '', NULL, 1),
(1, 1, 1, 1, 2, 4, 1, 1, 1, 1, 'kegiatan 1.1.1.2.4', 'kegiatan 1.1.1.2.4', 60, 100, 250000000, 100, 250000000, 100, 250000000, 100, 250000000, 100, 250000000, '', NULL, 1),
(1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 'kegiatan 1.1.2.1.1', 'kegiatan 1.1.2.1.1', 60, 100, 200000000, 100, 200000000, 100, 200000000, 100, 200000000, 100, 200000000, '', NULL, 1),
(1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 'kegiatan 1.1.2.1.2', 'kegiatan 1.1.2.1.2', 60, 100, 200000000, 100, 200000000, 100, 200000000, 100, 200000000, 100, 200000000, '', NULL, 1),
(1, 1, 1, 2, 1, 3, 1, 1, 1, 1, 'kegiatan 1.1.2.1.3', 'kegiatan 1.1.2.1.3', 60, 100, 200000000, 100, 200000000, 100, 200000000, 100, 200000000, 100, 200000000, '', NULL, 1),
(1, 1, 1, 2, 1, 4, 1, 1, 1, 1, 'kegiatan 1.1.2.1.4', 'kegiatan 1.1.2.1.4', 60, 100, 200000000, 100, 200000000, 100, 200000000, 100, 200000000, 100, 200000000, '', NULL, 1),
(1, 1, 1, 2, 1, 5, 1, 1, 1, 1, 'kegiatan 1.1.2.1.5', 'kegiatan 1.1.2.1.5', 60, 100, 200000000, 100, 200000000, 100, 200000000, 100, 200000000, 100, 200000000, '', NULL, 1),
(1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 'kegiatan 1.2.1.1.1', 'kegiatan 1.2.1.1.1', 60, 100, 250000000, 100, 250000000, 100, 250000000, 100, 250000000, 100, 250000000, '', NULL, 1),
(1, 1, 2, 1, 1, 2, 1, 1, 1, 1, 'kegiatan 1.2.1.1.2', 'kegiatan 1.2.1.1.2', 60, 100, 250000000, 100, 250000000, 100, 250000000, 100, 250000000, 100, 250000000, '', NULL, 1),
(1, 1, 2, 1, 1, 3, 1, 1, 1, 1, 'kegiatan 1.2.1.1.3', 'kegiatan 1.2.1.1.3', 60, 100, 250000000, 100, 250000000, 100, 250000000, 100, 250000000, 100, 250000000, '', NULL, 1),
(1, 1, 2, 1, 1, 4, 1, 1, 1, 1, 'kegiatan 1.2.1.1.4', 'kegiatan 1.2.1.1.4', 60, 100, 250000000, 100, 250000000, 100, 250000000, 100, 250000000, 100, 250000000, '', NULL, 1),
(1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 'kegiatan 2.1.1.1.1', 'kegiatan 2.1.1.1.1', 60, 100, 100000000, 100, 100000000, 100, 100000000, 100, 100000000, 100, 100000000, '', NULL, 1),
(1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 'kegiatan 2.1.1.1.2', 'kegiatan 2.1.1.1.2', 60, 100, 100000000, 100, 100000000, 100, 100000000, 100, 100000000, 100, 100000000, '', NULL, 1),
(1, 2, 1, 1, 1, 3, 1, 1, 1, 1, 'kegiatan 2.1.1.1.3', 'kegiatan 2.1.1.1.3', 60, 100, 100000000, 100, 100000000, 100, 100000000, 100, 100000000, 100, 100000000, '', NULL, 1),
(1, 2, 1, 1, 1, 4, 1, 1, 1, 1, 'kegiatan 2.1.1.1.4', 'kegiatan 2.1.1.1.4', 60, 100, 100000000, 100, 100000000, 100, 100000000, 100, 100000000, 100, 100000000, '', NULL, 1),
(1, 2, 1, 1, 1, 5, 1, 1, 1, 1, 'kegiatan 2.1.1.1.5', 'kegiatan 2.1.1.1.5', 60, 100, 100000000, 100, 100000000, 100, 100000000, 100, 100000000, 100, 100000000, '', NULL, 1),
(1, 2, 1, 1, 1, 6, 1, 1, 1, 1, 'kegiatan 2.1.1.1.6', 'kegiatan 2.1.1.1.6', 60, 100, 100000000, 100, 100000000, 100, 100000000, 100, 100000000, 100, 100000000, '', NULL, 1),
(1, 2, 1, 1, 1, 7, 1, 1, 1, 1, 'kegiatan 2.1.1.1.7', 'kegiatan 2.1.1.1.7', 60, 100, 100000000, 100, 100000000, 100, 100000000, 100, 100000000, 100, 100000000, '', NULL, 1),
(1, 2, 1, 1, 1, 8, 1, 1, 1, 1, 'kegiatan 2.1.1.1.8', 'kegiatan 2.1.1.1.8', 60, 100, 100000000, 100, 100000000, 100, 100000000, 100, 100000000, 100, 100000000, '', NULL, 1),
(1, 2, 1, 1, 1, 9, 1, 1, 1, 1, 'kegiatan 2.1.1.1.9', 'kegiatan 2.1.1.1.9', 60, 100, 100000000, 100, 100000000, 100, 100000000, 100, 100000000, 100, 100000000, '', NULL, 1),
(1, 2, 1, 1, 1, 10, 1, 1, 1, 1, 'kegiatan 2.1.1.1.10', 'kegiatan 2.1.1.1.10', 60, 100, 100000000, 100, 100000000, 100, 100000000, 100, 100000000, 100, 100000000, '', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_rpjmd`
--

CREATE TABLE `tb_rpjmd` (
  `id_tb_rpjmd` int(11) NOT NULL,
  `tb_rpjmd_visi` text,
  `tb_rpjmd_tahun` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rpjmd`
--

INSERT INTO `tb_rpjmd` (`id_tb_rpjmd`, `tb_rpjmd_visi`, `tb_rpjmd_tahun`) VALUES
(1, 'Terwujudnya Masyarakat Morowali yang Sejahtera Bersama', 2019);

-- --------------------------------------------------------

--
-- Table structure for table `tb_rpjmd_akar_masalah`
--

CREATE TABLE `tb_rpjmd_akar_masalah` (
  `id_tb_rpjmd_akar_masalah` int(11) NOT NULL,
  `tb_rpjmd_akar_masalah_pokok` text,
  `tb_rpjmd_akar_masalah_nama` text,
  `tb_rpjmd_akar_masalah_akar` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rpjmd_indikator`
--

CREATE TABLE `tb_rpjmd_indikator` (
  `id_tb_rpjmd` int(11) NOT NULL,
  `tb_rpjmd_misi_kode` int(11) NOT NULL,
  `tb_rpjmd_tujuan_kode` int(11) NOT NULL,
  `tb_rpjmd_sasaran_kode` int(11) NOT NULL,
  `tb_rpjmd_indikator_kode` int(11) NOT NULL,
  `tb_rpjmd_indikator_nama` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rpjmd_kebijakan`
--

CREATE TABLE `tb_rpjmd_kebijakan` (
  `id_tb_rpjmd` int(11) NOT NULL,
  `tb_rpjmd_misi_kode` int(11) NOT NULL,
  `tb_rpjmd_tujuan_kode` int(11) NOT NULL,
  `tb_rpjmd_sasaran_kode` int(11) NOT NULL,
  `tb_rpjmd_kebijakan_kode` int(11) NOT NULL,
  `tb_rpjmd_kebijakan_nama` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rpjmd_misi`
--

CREATE TABLE `tb_rpjmd_misi` (
  `id_tb_rpjmd` int(11) NOT NULL,
  `tb_rpjmd_misi_kode` int(11) NOT NULL,
  `tb_rpjmd_misi_nama` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rpjmd_misi`
--

INSERT INTO `tb_rpjmd_misi` (`id_tb_rpjmd`, `tb_rpjmd_misi_kode`, `tb_rpjmd_misi_nama`) VALUES
(1, 1, 'misi 1'),
(1, 2, 'misi 2');

-- --------------------------------------------------------

--
-- Table structure for table `tb_rpjmd_opd`
--

CREATE TABLE `tb_rpjmd_opd` (
  `id_tb_rpjmd` int(11) NOT NULL,
  `tb_rpjmd_misi_kode` int(11) NOT NULL,
  `tb_rpjmd_tujuan_kode` int(11) NOT NULL,
  `tb_rpjmd_sasaran_kode` int(11) NOT NULL,
  `tb_rpjmd_program_kode` int(11) NOT NULL,
  `tb_urusan_kode` int(11) NOT NULL,
  `tb_bidang_kode` int(11) NOT NULL,
  `tb_unit_kode` int(11) NOT NULL,
  `tb_sub_unit_kode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rpjmd_opd`
--

INSERT INTO `tb_rpjmd_opd` (`id_tb_rpjmd`, `tb_rpjmd_misi_kode`, `tb_rpjmd_tujuan_kode`, `tb_rpjmd_sasaran_kode`, `tb_rpjmd_program_kode`, `tb_urusan_kode`, `tb_bidang_kode`, `tb_unit_kode`, `tb_sub_unit_kode`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 1),
(1, 1, 1, 1, 2, 1, 1, 1, 1),
(1, 1, 1, 2, 1, 1, 1, 1, 1),
(1, 1, 2, 1, 1, 1, 1, 1, 1),
(1, 2, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_rpjmd_program`
--

CREATE TABLE `tb_rpjmd_program` (
  `id_tb_rpjmd` int(11) NOT NULL,
  `tb_rpjmd_misi_kode` int(11) NOT NULL,
  `tb_rpjmd_tujuan_kode` int(11) NOT NULL,
  `tb_rpjmd_sasaran_kode` int(11) NOT NULL,
  `tb_rpjmd_program_kode` int(11) NOT NULL,
  `tb_rpjmd_program_nama` text,
  `tb_rpjmd_program_pagu_ket` text,
  `tb_rpjmd_program_pagu_th1` double DEFAULT NULL,
  `tb_rpjmd_program_pagu_th2` double DEFAULT NULL,
  `tb_rpjmd_program_pagu_th3` double DEFAULT NULL,
  `tb_rpjmd_program_pagu_th4` double DEFAULT NULL,
  `tb_rpjmd_program_pagu_th5` double DEFAULT NULL,
  `id_tb_satuan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rpjmd_program`
--

INSERT INTO `tb_rpjmd_program` (`id_tb_rpjmd`, `tb_rpjmd_misi_kode`, `tb_rpjmd_tujuan_kode`, `tb_rpjmd_sasaran_kode`, `tb_rpjmd_program_kode`, `tb_rpjmd_program_nama`, `tb_rpjmd_program_pagu_ket`, `tb_rpjmd_program_pagu_th1`, `tb_rpjmd_program_pagu_th2`, `tb_rpjmd_program_pagu_th3`, `tb_rpjmd_program_pagu_th4`, `tb_rpjmd_program_pagu_th5`, `id_tb_satuan`) VALUES
(1, 1, 1, 1, 1, 'program 1.1.1.1', NULL, 1000000000, 1000000000, 1000000000, 1000000000, 1000000000, 1),
(1, 1, 1, 1, 2, 'program 1.1.1.2', NULL, 1000000000, 1000000000, 1000000000, 1000000000, 1000000000, 1),
(1, 1, 1, 2, 1, 'program 1.1.2.1', NULL, 1000000000, 1000000000, 1000000000, 1000000000, 1000000000, 1),
(1, 1, 2, 1, 1, 'program 1.2.1.1', NULL, 1000000000, 1000000000, 1000000000, 1000000000, 1000000000, 1),
(1, 2, 1, 1, 1, 'program 2.1.1.1', NULL, 1000000000, 1000000000, 1000000000, 1000000000, 1000000000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_rpjmd_program_indikator`
--

CREATE TABLE `tb_rpjmd_program_indikator` (
  `id_tb_rpjmd` int(11) NOT NULL,
  `tb_rpjmd_misi_kode` int(11) NOT NULL,
  `tb_rpjmd_tujuan_kode` int(11) NOT NULL,
  `tb_rpjmd_sasaran_kode` int(11) NOT NULL,
  `tb_rpjmd_program_kode` int(11) NOT NULL,
  `tb_rpjmd_program_indikator_kode` int(11) NOT NULL,
  `tb_rpjmd_program_indikator_ukur` text,
  `tb_rpjmd_program_indikator_jenis` tinyint(4) DEFAULT NULL COMMENT '1. POSITIF\n2. NEGATIF',
  `tb_rpjmd_program_indikator_indikator` tinyint(4) DEFAULT NULL COMMENT '1. INCREMENT\n2. ABSOLUTE\n3. KOMULATIF',
  `tb_rpjmd_program_indikator_target_th1` double DEFAULT NULL,
  `tb_rpjmd_program_indikator_target_th2` double DEFAULT NULL,
  `tb_rpjmd_program_indikator_target_th3` double DEFAULT NULL,
  `tb_rpjmd_program_indikator_target_th4` double DEFAULT NULL,
  `tb_rpjmd_program_indikator_target_th5` double DEFAULT NULL,
  `tb_rpjmd_program_indikator_awal` double DEFAULT NULL,
  `tb_rpjmd_program_indikator_ket` text,
  `id_tb_satuan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rpjmd_program_indikator`
--

INSERT INTO `tb_rpjmd_program_indikator` (`id_tb_rpjmd`, `tb_rpjmd_misi_kode`, `tb_rpjmd_tujuan_kode`, `tb_rpjmd_sasaran_kode`, `tb_rpjmd_program_kode`, `tb_rpjmd_program_indikator_kode`, `tb_rpjmd_program_indikator_ukur`, `tb_rpjmd_program_indikator_jenis`, `tb_rpjmd_program_indikator_indikator`, `tb_rpjmd_program_indikator_target_th1`, `tb_rpjmd_program_indikator_target_th2`, `tb_rpjmd_program_indikator_target_th3`, `tb_rpjmd_program_indikator_target_th4`, `tb_rpjmd_program_indikator_target_th5`, `tb_rpjmd_program_indikator_awal`, `tb_rpjmd_program_indikator_ket`, `id_tb_satuan`) VALUES
(1, 1, 1, 1, 1, 1, NULL, NULL, NULL, 100, 100, 100, 100, 100, NULL, 'program 1.1.1.1', 1),
(1, 1, 1, 1, 2, 1, NULL, NULL, NULL, 100, 100, 100, 100, 100, NULL, 'program 1.1.1.2', 1),
(1, 1, 1, 2, 1, 1, NULL, NULL, NULL, 100, 100, 100, 100, 100, NULL, 'program 1.1.2.1', 1),
(1, 1, 2, 1, 1, 1, NULL, NULL, NULL, 100, 100, 100, 100, 100, NULL, 'program 1.2.1.1', 1),
(1, 2, 1, 1, 1, 1, NULL, NULL, NULL, 100, 100, 100, 100, 100, NULL, 'program 2.1.1.1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_rpjmd_sasaran`
--

CREATE TABLE `tb_rpjmd_sasaran` (
  `id_tb_rpjmd` int(11) NOT NULL,
  `tb_rpjmd_misi_kode` int(11) NOT NULL,
  `tb_rpjmd_tujuan_kode` int(11) NOT NULL,
  `tb_rpjmd_sasaran_kode` int(11) NOT NULL,
  `tb_rpjmd_sasaran_nama` text,
  `tb_rpjmd_sasaran_indikator` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rpjmd_sasaran`
--

INSERT INTO `tb_rpjmd_sasaran` (`id_tb_rpjmd`, `tb_rpjmd_misi_kode`, `tb_rpjmd_tujuan_kode`, `tb_rpjmd_sasaran_kode`, `tb_rpjmd_sasaran_nama`, `tb_rpjmd_sasaran_indikator`) VALUES
(1, 1, 1, 1, 'sasarana 1.1.1', 'indikator 1.1.1'),
(1, 1, 1, 2, 'sasarana 1.1.2', 'indikator 1.1.2'),
(1, 1, 2, 1, 'sasarana 1.2.1', 'indikator 1.2.1'),
(1, 2, 1, 1, 'sasarana 2.1.1', 'indikator 2.1.1');

-- --------------------------------------------------------

--
-- Table structure for table `tb_rpjmd_strategi`
--

CREATE TABLE `tb_rpjmd_strategi` (
  `id_tb_rpjmd` int(11) NOT NULL,
  `tb_rpjmd_misi_kode` int(11) NOT NULL,
  `tb_rpjmd_tujuan_kode` int(11) NOT NULL,
  `tb_rpjmd_sasaran_kode` int(11) NOT NULL,
  `tb_rpjmd_strategi_kode` int(11) NOT NULL,
  `tb_rpjmd_strategi_nama` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rpjmd_tujuan`
--

CREATE TABLE `tb_rpjmd_tujuan` (
  `id_tb_rpjmd` int(11) NOT NULL,
  `tb_rpjmd_misi_kode` int(11) NOT NULL,
  `tb_rpjmd_tujuan_kode` int(11) NOT NULL,
  `tb_rpjmd_tujuan_nama` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rpjmd_tujuan`
--

INSERT INTO `tb_rpjmd_tujuan` (`id_tb_rpjmd`, `tb_rpjmd_misi_kode`, `tb_rpjmd_tujuan_kode`, `tb_rpjmd_tujuan_nama`) VALUES
(1, 1, 1, 'tujuan 1.1'),
(1, 1, 2, 'tujuan 1.2'),
(1, 2, 1, 'tujuan 2.1');

-- --------------------------------------------------------

--
-- Table structure for table `tb_rpjmd_visi_penjelasan`
--

CREATE TABLE `tb_rpjmd_visi_penjelasan` (
  `id_tb_rpjmd` int(11) NOT NULL,
  `id_tb_rpjmd_visi_penjelasan` int(11) NOT NULL,
  `tb_rpjmd_visi_penjelasan_pokok` varchar(45) DEFAULT NULL,
  `tb_rpjmd_visi_penjelasan_nama` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rpjmd_visi_penjelasan`
--

INSERT INTO `tb_rpjmd_visi_penjelasan` (`id_tb_rpjmd`, `id_tb_rpjmd_visi_penjelasan`, `tb_rpjmd_visi_penjelasan_pokok`, `tb_rpjmd_visi_penjelasan_nama`) VALUES
(1, 1, 'Sejahtera', 'Gambaran masyarakat Kabupaten Morowali yang terpenuhi kebutuhan dasar meliputi: Sandang, pangan, papan dan memperoleh pelayanan dasar pendidikan dan kesehatan secara layak serta terbukanya kesempatan kerja yang luas dan menyerap tenaga kerja dengan penghasilan yang memadai.'),
(1, 2, 'Bersama', 'Dimaknai sebagai suatu kondisi masyarakat yang memiliki kesetaraan dalam hak dan kewajiban sebagai warga negara untuk memanfaatkan segala potensi dan sumber daya yang dimiliki daerahdalam mendukung peningkatan kesejahteraan serta menikmati hasil-hasil pembangunan.');

-- --------------------------------------------------------

--
-- Table structure for table `tb_satuan`
--

CREATE TABLE `tb_satuan` (
  `id_tb_satuan` int(11) NOT NULL,
  `tb_satuan_nama` varchar(45) DEFAULT NULL,
  `tb_satuan_ket` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_satuan`
--

INSERT INTO `tb_satuan` (`id_tb_satuan`, `tb_satuan_nama`, `tb_satuan_ket`) VALUES
(1, '%', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_sub_unit`
--

CREATE TABLE `tb_sub_unit` (
  `tb_urusan_kode` int(11) NOT NULL,
  `tb_bidang_kode` int(11) NOT NULL,
  `tb_unit_kode` int(11) NOT NULL,
  `tb_sub_unit_kode` int(11) NOT NULL,
  `tb_sub_unit_nama` varchar(105) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_sub_unit`
--

INSERT INTO `tb_sub_unit` (`tb_urusan_kode`, `tb_bidang_kode`, `tb_unit_kode`, `tb_sub_unit_kode`, `tb_sub_unit_nama`) VALUES
(1, 1, 1, 1, 'Dinas Pendidikan Dan Kebudayaan'),
(1, 2, 1, 1, 'Dinas Kesehatan, Pengendalian Penduduk dan Keluarga Berencana'),
(1, 3, 1, 1, 'Dinas Pekerjaan Umum dan Penataan Ruang '),
(1, 4, 1, 1, 'Dinas Perumahan, Kawasan Pemukiman dan Pertanahan'),
(1, 5, 1, 1, 'Badan Kesatuan Bangsa dan Politik Daerah'),
(1, 5, 2, 1, 'Satuan Polisi Pamong Praja'),
(1, 6, 1, 1, 'Dinas Sosial'),
(1, 6, 2, 1, 'Badan Koordinasi Penanggulangan Bencana Daerah'),
(2, 1, 1, 1, 'Dinas Tenaga Kerja Dan Transmigrasi Daerah'),
(2, 5, 1, 1, 'Dinas Lingkungan Hidup Daerah'),
(2, 6, 1, 1, 'Dinas Kependudukan dan Pencatatan Sipil Daerah'),
(2, 7, 1, 1, 'Dinas Pemberdayaan Masyarakat, Desa,Pemberdayaan Perempuan dan Perlindungan Anak'),
(2, 9, 1, 1, 'Dinas Perhubungan Daerah'),
(2, 10, 1, 1, 'Dinas Komunikasi dan Informatika'),
(2, 11, 1, 1, 'Dinas Koperasi, Usaha Kecil, dan Menengah'),
(2, 12, 1, 1, 'Dinas Penanaman Modal dan Pelayanan Terpadu Satu Pintu'),
(2, 13, 1, 1, 'Dinas Pemuda, Olahraga dan Pariwisata Daerah'),
(2, 17, 1, 1, 'Dinas Perpustakaan Daerah'),
(3, 1, 1, 1, 'Dinas Perikanan Daerah'),
(3, 3, 1, 1, 'Dinas Pertanian Dan Ketahanan Pangan'),
(3, 6, 1, 1, 'Dinas Perdagangan Dan Perindustrian'),
(4, 1, 1, 1, 'Dewan Perwakilan Rakyat Daerah'),
(4, 1, 2, 1, 'Kepala Daerah Dan Wakil Kepala Daerah'),
(4, 1, 3, 1, 'Bagian Umum Dan Protokoler'),
(4, 1, 3, 2, 'Bagian Hukum Dan Perundang-Undangan'),
(4, 1, 3, 3, 'Bagian Kesejahteraan Rakyat Dan Kemasyarakatan'),
(4, 1, 3, 4, 'Bagian Perekonomian'),
(4, 1, 3, 5, 'Bagian Organisasi dan Tata Laksana'),
(4, 1, 3, 6, 'Bagian Pembangunan Dan LPSE'),
(4, 1, 3, 7, 'Bagian Unit Layanan Pengadaan'),
(4, 1, 3, 8, 'Bagian Administrasi Sumber Daya Alam'),
(4, 1, 3, 9, 'Bagian Administrasi Pemerintahan Umum'),
(4, 1, 4, 1, 'Sekretariat DPRD'),
(4, 1, 9, 1, 'Kecamatan Menui Kepulauan'),
(4, 1, 10, 1, 'Kecamatan Bungku Selatan'),
(4, 1, 11, 1, 'Kecamatan Bungku Tengah'),
(4, 1, 12, 1, 'Kecamatan Bungku Barat'),
(4, 1, 13, 1, 'Kecamatan Bahodopi'),
(4, 1, 14, 1, 'Kecamatan Bumi Raya'),
(4, 1, 15, 1, 'Kecamatan Wita Ponda'),
(4, 1, 16, 1, 'Kecamatan Bungku Timur'),
(4, 1, 17, 1, 'Kecamatan Bungku Pesisir'),
(4, 2, 1, 1, 'Inspektorat Daerah'),
(4, 3, 1, 1, 'Badan Perencanaan, Penelitian, dan Pengembangan Daerah'),
(4, 4, 5, 1, 'Badan Pengelola Keuangan dan Aset Daerah'),
(4, 4, 6, 1, 'Badan Pengelola Pendapatan Daerah'),
(4, 5, 6, 1, 'Badan Kepegawaian Daerah dan Pengembangan Sumber Daya Manusia');

-- --------------------------------------------------------

--
-- Table structure for table `tb_unit`
--

CREATE TABLE `tb_unit` (
  `tb_urusan_kode` int(11) NOT NULL,
  `tb_bidang_kode` int(11) NOT NULL,
  `tb_unit_kode` int(11) NOT NULL,
  `tb_unit_nama` varchar(105) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_unit`
--

INSERT INTO `tb_unit` (`tb_urusan_kode`, `tb_bidang_kode`, `tb_unit_kode`, `tb_unit_nama`) VALUES
(1, 1, 1, 'Dinas Pendidikan Dan Kebudayaan'),
(1, 2, 1, 'Dinas Kesehatan, Pengendalian Penduduk dan Keluarga Berencana'),
(1, 3, 1, 'Dinas Pekerjaan Umum dan Penataan Ruang '),
(1, 4, 1, 'Dinas Perumahan, Kawasan Pemukiman dan Pertanahan'),
(1, 5, 1, 'Badan Kesatuan Bangsa dan Politik Daerah'),
(1, 5, 2, 'Satuan Polisi Pamong Praja'),
(1, 6, 1, 'Dinas Sosial'),
(1, 6, 2, 'Badan Koordinasi Penanggulangan Bencana Daerah'),
(2, 1, 1, 'Dinas Tenaga Kerja Dan Transmigrasi Daerah'),
(2, 5, 1, 'Dinas Lingkungan Hidup Daerah'),
(2, 6, 1, 'Dinas Kependudukan dan Pencatatan Sipil Daerah'),
(2, 7, 1, 'Dinas Pemberdayaan Masyarakat, Desa,Pemberdayaan Perempuan dan Perlindungan Anak'),
(2, 9, 1, 'Dinas Perhubungan Daerah'),
(2, 10, 1, 'Dinas Komunikasi dan Informatika'),
(2, 11, 1, 'Dinas Koperasi, Usaha Kecil, dan Menengah'),
(2, 12, 1, 'Dinas Penanaman Modal dan Pelayanan Terpadu Satu Pintu'),
(2, 13, 1, 'Dinas Pemuda, Olahraga dan Pariwisata Daerah'),
(2, 17, 1, 'Dinas Perpustakaan Daerah'),
(3, 1, 1, 'Dinas Perikanan Daerah'),
(3, 3, 1, 'Dinas Pertanian Dan Ketahanan Pangan'),
(3, 6, 1, 'Dinas Perdagangan Dan Perindustrian'),
(4, 1, 1, 'Dewan Perwakilan Rakyat Daerah'),
(4, 1, 2, 'Kepala Daerah Dan Wakil Kepala Daerah'),
(4, 1, 3, 'Sekretariat Daerah'),
(4, 1, 4, 'Sekretariat DPRD'),
(4, 1, 9, 'Kecamatan Menui Kepulauan'),
(4, 1, 10, 'Kecamatan Bungku Selatan'),
(4, 1, 11, 'Kecamatan Bungku Tengah'),
(4, 1, 12, 'Kecamatan Bungku Barat'),
(4, 1, 13, 'Kecamatan Bahodopi'),
(4, 1, 14, 'Kecamatan Bumi Raya'),
(4, 1, 15, 'Kecamatan Wita Ponda'),
(4, 1, 16, 'Kecamatan Bungku Timur'),
(4, 1, 17, 'Kecamatan Bungku Pesisir'),
(4, 2, 1, 'Inspektorat Daerah'),
(4, 3, 1, 'Badan Perencanaan, Penelitian, dan Pengembangan Daerah'),
(4, 4, 5, 'Badan Pengelola Keuangan dan Aset Daerah'),
(4, 4, 6, 'Badan Pengelola Pendapatan Daerah'),
(4, 5, 6, 'Badan Kepegawaian Daerah dan Pengembangan Sumber Daya Manusia');

-- --------------------------------------------------------

--
-- Table structure for table `tb_urusan`
--

CREATE TABLE `tb_urusan` (
  `tb_urusan_kode` int(11) NOT NULL,
  `tb_urusan_nama` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_urusan`
--

INSERT INTO `tb_urusan` (`tb_urusan_kode`, `tb_urusan_nama`) VALUES
(1, 'Urusan Wajib Pelayanan Dasar'),
(2, 'Urusan Wajib Bukan Pelayanan Dasar'),
(3, 'Urusan Pilihan'),
(4, 'Urusan Pemerintahan Fungsi Penunjang');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_tb_user` int(11) NOT NULL,
  `tb_user_username` varchar(45) DEFAULT NULL,
  `tb_user_password` text,
  `tb_user_hp` varchar(20) DEFAULT NULL,
  `tb_user_akun` tinyint(4) DEFAULT NULL COMMENT '(1) referensi\n(2) userlevel\n(3) rpjmd\n(4) renstra\n(5) rkpd\n(6) renja\n(7) emonev\n(8) elakip\n(9) aduan publik\n(10) emusrenbang',
  `tb_user_level` tinyint(4) DEFAULT NULL,
  `tb_user_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_tb_user`, `tb_user_username`, `tb_user_password`, `tb_user_hp`, `tb_user_akun`, `tb_user_level`, `tb_user_date`) VALUES
(1, 'admin', '$2y$13$ZtzUVhoI/bLqKmpetdHWW.ozUXArLlGrHbX7uCa68du.WSGZX8SQS', '085756733113', 3, 1, NULL),
(2, 'userlevel', '$2y$13$ZtzUVhoI/bLqKmpetdHWW.ozUXArLlGrHbX7uCa68du.WSGZX8SQS', NULL, 2, 1, NULL),
(3, 'monev', '$2y$10$4R.BSOgVydMc.JJLG.0KKuKD9uuBFQt75X/DYOGGD24OAhAgRbMwq', '123456', 7, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_bappeda`
--

CREATE TABLE `tb_user_bappeda` (
  `id_tb_user_bappeda` int(11) NOT NULL,
  `id_tb_user` int(11) NOT NULL,
  `tb_urusan_kode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_dapil`
--

CREATE TABLE `tb_user_dapil` (
  `id_tb_user_dapil` int(11) NOT NULL,
  `tb_dapil_kode` int(11) NOT NULL,
  `tb_dewan_kode` int(11) NOT NULL,
  `id_tb_user` int(11) NOT NULL,
  `tb_user_dapil_nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_lokasi`
--

CREATE TABLE `tb_user_lokasi` (
  `id_tb_user_kelompok` int(11) NOT NULL,
  `id_tb_user` int(11) NOT NULL,
  `tb_provinsi_kode` int(11) NOT NULL,
  `tb_kabupaten_kode` int(11) DEFAULT NULL,
  `tb_kecamatan_kode` int(11) DEFAULT NULL,
  `tb_deskel_kode` int(11) DEFAULT NULL,
  `tb_deskel_level` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_opd`
--

CREATE TABLE `tb_user_opd` (
  `id_tb_user_opd` int(11) NOT NULL,
  `tb_urusan_kode` int(11) NOT NULL,
  `tb_bidang_kode` int(11) NOT NULL,
  `tb_unit_kode` int(11) NOT NULL,
  `tb_sub_unit_kode` int(11) NOT NULL,
  `id_tb_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_bidang`
--
ALTER TABLE `tb_bidang`
  ADD PRIMARY KEY (`tb_urusan_kode`,`tb_bidang_kode`,`tb_fungsi_kode`),
  ADD KEY `fk_tb_bidang_tb_urusan1_idx` (`tb_urusan_kode`),
  ADD KEY `fk_tb_bidang_tb_fungsi1_idx` (`tb_fungsi_kode`);

--
-- Indexes for table `tb_dapil`
--
ALTER TABLE `tb_dapil`
  ADD PRIMARY KEY (`tb_dapil_kode`);

--
-- Indexes for table `tb_deskel`
--
ALTER TABLE `tb_deskel`
  ADD PRIMARY KEY (`tb_provinsi_kode`,`tb_kabupaten_kode`,`tb_kecamatan_kode`,`tb_deskel_kode`,`tb_deskel_level`),
  ADD KEY `fk_tb_deskel_tb_kecamatan1_idx` (`tb_provinsi_kode`,`tb_kabupaten_kode`,`tb_kecamatan_kode`);

--
-- Indexes for table `tb_dewan`
--
ALTER TABLE `tb_dewan`
  ADD PRIMARY KEY (`tb_dapil_kode`,`tb_dewan_kode`),
  ADD KEY `fk_tb_dewan_tb_dapil1_idx` (`tb_dapil_kode`);

--
-- Indexes for table `tb_fungsi`
--
ALTER TABLE `tb_fungsi`
  ADD PRIMARY KEY (`tb_fungsi_kode`);

--
-- Indexes for table `tb_indikator`
--
ALTER TABLE `tb_indikator`
  ADD PRIMARY KEY (`id_tb_indikator`);

--
-- Indexes for table `tb_kabupaten`
--
ALTER TABLE `tb_kabupaten`
  ADD PRIMARY KEY (`tb_kabupaten_kode`,`tb_provinsi_kode`),
  ADD KEY `fk_tb_kabupaten_tb_provinsi2_idx` (`tb_provinsi_kode`);

--
-- Indexes for table `tb_kategori_laporan`
--
ALTER TABLE `tb_kategori_laporan`
  ADD PRIMARY KEY (`id_tb_kategori_laporan`,`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`),
  ADD KEY `fk_tb_kategori_laporan_tb_sub_unit1_idx` (`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`);

--
-- Indexes for table `tb_kecamatan`
--
ALTER TABLE `tb_kecamatan`
  ADD PRIMARY KEY (`tb_provinsi_kode`,`tb_kabupaten_kode`,`tb_kecamatan_kode`),
  ADD KEY `fk_tb_kecamatan_tb_kabupaten2_idx` (`tb_kabupaten_kode`,`tb_provinsi_kode`);

--
-- Indexes for table `tb_kegiatan`
--
ALTER TABLE `tb_kegiatan`
  ADD PRIMARY KEY (`tb_urusan_kode`,`tb_bidang_kode`,`tb_program_kode`,`tb_kegiatan_kode`),
  ADD KEY `fk_tb_kegiatan_tb_program1_idx` (`tb_urusan_kode`,`tb_bidang_kode`,`tb_program_kode`);

--
-- Indexes for table `tb_kriteria_bobot`
--
ALTER TABLE `tb_kriteria_bobot`
  ADD PRIMARY KEY (`id_tb_kriteria_bobot`,`id_tb_kriteria_pembobotan`,`tb_kriteria_bobot_level`),
  ADD KEY `fk_tb_kriteria_bobot_tb_kriteria_pembobotan1_idx` (`id_tb_kriteria_pembobotan`);

--
-- Indexes for table `tb_kriteria_pembobotan`
--
ALTER TABLE `tb_kriteria_pembobotan`
  ADD PRIMARY KEY (`id_tb_kriteria_pembobotan`);

--
-- Indexes for table `tb_laporan`
--
ALTER TABLE `tb_laporan`
  ADD PRIMARY KEY (`id_tb_laporan`,`id_tb_laporan_user`,`id_tb_kategori_laporan`),
  ADD KEY `fk_tb_laporan_tb_kategori_laporan1_idx` (`id_tb_kategori_laporan`),
  ADD KEY `fk_tb_laporan_tb_laporan_user1_idx` (`id_tb_laporan_user`);

--
-- Indexes for table `tb_laporan_dukung`
--
ALTER TABLE `tb_laporan_dukung`
  ADD PRIMARY KEY (`id_tb_laporan_dukung`,`id_tb_laporan`,`id_tb_laporan_user`),
  ADD KEY `fk_tb_laporan_dukung_tb_laporan1_idx` (`id_tb_laporan`),
  ADD KEY `fk_tb_laporan_dukung_tb_laporan_user1_idx` (`id_tb_laporan_user`);

--
-- Indexes for table `tb_laporan_komentar`
--
ALTER TABLE `tb_laporan_komentar`
  ADD PRIMARY KEY (`id_tb_laporan_komentar`,`id_tb_laporan`,`id_tb_laporan_user`),
  ADD KEY `fk_tb_laporan_komentar_tb_laporan_user1_idx` (`id_tb_laporan_user`),
  ADD KEY `fk_tb_laporan_komentar_tb_laporan1_idx` (`id_tb_laporan`);

--
-- Indexes for table `tb_laporan_user`
--
ALTER TABLE `tb_laporan_user`
  ADD PRIMARY KEY (`id_tb_laporan_user`,`id_tb_user`),
  ADD KEY `fk_tb_laporan_user_tb_user1_idx` (`id_tb_user`);

--
-- Indexes for table `tb_misi_agenda_nawa`
--
ALTER TABLE `tb_misi_agenda_nawa`
  ADD PRIMARY KEY (`id_tb_misi_agenda_nawa`);

--
-- Indexes for table `tb_misi_prov`
--
ALTER TABLE `tb_misi_prov`
  ADD PRIMARY KEY (`id_tb_misi_prov`);

--
-- Indexes for table `tb_misi_rpjmd_lama`
--
ALTER TABLE `tb_misi_rpjmd_lama`
  ADD PRIMARY KEY (`id_tb_misi_rpjmd_lama`);

--
-- Indexes for table `tb_misi_rpjmn`
--
ALTER TABLE `tb_misi_rpjmn`
  ADD PRIMARY KEY (`id_tb_misi_rpjmn`);

--
-- Indexes for table `tb_misi_sdgs`
--
ALTER TABLE `tb_misi_sdgs`
  ADD PRIMARY KEY (`id_tb_misi_sdgs`);

--
-- Indexes for table `tb_monev_lra`
--
ALTER TABLE `tb_monev_lra`
  ADD PRIMARY KEY (`id_tb_monev_lra`,`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`),
  ADD UNIQUE KEY `lra_kode` (`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`,`tb_monev_lra_tahun`,`tb_rekening1_kode`,`tb_rekening2_kode`,`program_kode`,`kegiatan_kode`,`tb_rekening3_kode`,`tb_rekening4_kode`,`tb_rekening5_kode`),
  ADD KEY `fk_tb_monev_lra_tb_sub_unit1_idx` (`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`);

--
-- Indexes for table `tb_monev_triwulan`
--
ALTER TABLE `tb_monev_triwulan`
  ADD PRIMARY KEY (`id_tb_monev_triwulan`,`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`),
  ADD UNIQUE KEY `triwulan_kode` (`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`,`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`,`tb_rpjmd_sasaran_kode`,`tb_rpjmd_program_kode`,`tb_rpjmd_kegiatan_kode`,`tb_monev_triwulan_tahun`),
  ADD KEY `fk_tb_monev_triwulan_tb_sub_unit1_idx` (`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`);

--
-- Indexes for table `tb_musrenbang_grub`
--
ALTER TABLE `tb_musrenbang_grub`
  ADD PRIMARY KEY (`id_tb_musrenbang_grub`);

--
-- Indexes for table `tb_musrenbang_kec`
--
ALTER TABLE `tb_musrenbang_kec`
  ADD PRIMARY KEY (`id_tb_musrenbang_kec`),
  ADD KEY `fk_tb_musrenbang_kec_tb_satuan1_idx` (`id_tb_satuan`),
  ADD KEY `fk_tb_musrenbang_kec_tb_sub_unit1_idx` (`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`),
  ADD KEY `fk_tb_musrenbang_kec_tb_indikator1_idx` (`id_tb_indikator`),
  ADD KEY `fk_tb_musrenbang_kec_tb_musrenbang_grub1_idx` (`id_tb_musrenbang_grub`);

--
-- Indexes for table `tb_musrenbang_kel`
--
ALTER TABLE `tb_musrenbang_kel`
  ADD PRIMARY KEY (`id_tb_musrenbang_kel`),
  ADD KEY `fk_tb_musrenbang_kel_tb_satuan1_idx` (`id_tb_satuan`),
  ADD KEY `fk_tb_musrenbang_kel_tb_indikator1_idx` (`id_tb_indikator`),
  ADD KEY `fk_tb_musrenbang_kel_tb_musrenbang_grub1_idx` (`id_tb_musrenbang_grub`);

--
-- Indexes for table `tb_musrenbang_opd`
--
ALTER TABLE `tb_musrenbang_opd`
  ADD PRIMARY KEY (`id_tb_musrenbang_opd`),
  ADD KEY `fk_tb_musrenbang_opd_tb_satuan1_idx` (`id_tb_satuan`),
  ADD KEY `fk_tb_musrenbang_opd_tb_sub_unit1_idx` (`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`),
  ADD KEY `fk_tb_musrenbang_opd_tb_indikator1_idx` (`id_tb_indikator`),
  ADD KEY `fk_tb_musrenbang_opd_tb_musrenbang_grub1_idx` (`id_tb_musrenbang_grub`);

--
-- Indexes for table `tb_musrenbang_pokir`
--
ALTER TABLE `tb_musrenbang_pokir`
  ADD PRIMARY KEY (`id_tb_musrenbang_pokir`),
  ADD KEY `fk_tb_musrenbang_pokir_tb_satuan1_idx` (`id_tb_satuan`),
  ADD KEY `fk_tb_musrenbang_pokir_tb_sub_unit1_idx` (`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`),
  ADD KEY `fk_tb_musrenbang_pokir_tb_indikator1_idx` (`id_tb_indikator`),
  ADD KEY `fk_tb_musrenbang_pokir_tb_musrenbang_grub1_idx` (`id_tb_musrenbang_grub`);

--
-- Indexes for table `tb_program`
--
ALTER TABLE `tb_program`
  ADD PRIMARY KEY (`tb_urusan_kode`,`tb_bidang_kode`,`tb_program_kode`),
  ADD KEY `fk_tb_program_tb_bidang1_idx` (`tb_urusan_kode`,`tb_bidang_kode`);

--
-- Indexes for table `tb_provinsi`
--
ALTER TABLE `tb_provinsi`
  ADD PRIMARY KEY (`tb_provinsi_kode`);

--
-- Indexes for table `tb_rekening1`
--
ALTER TABLE `tb_rekening1`
  ADD PRIMARY KEY (`tb_rekening1_kode`);

--
-- Indexes for table `tb_rekening2`
--
ALTER TABLE `tb_rekening2`
  ADD PRIMARY KEY (`tb_rekening1_kode`,`tb_rekening2_kode`),
  ADD KEY `fk_tb_rekening2_tb_rekening11_idx` (`tb_rekening1_kode`);

--
-- Indexes for table `tb_rekening3`
--
ALTER TABLE `tb_rekening3`
  ADD PRIMARY KEY (`tb_rekening1_kode`,`tb_rekening2_kode`,`tb_rekening3_kode`),
  ADD KEY `fk_tb_rekening3_tb_rekening21_idx` (`tb_rekening1_kode`,`tb_rekening2_kode`);

--
-- Indexes for table `tb_rekening4`
--
ALTER TABLE `tb_rekening4`
  ADD PRIMARY KEY (`tb_rekening1_kode`,`tb_rekening2_kode`,`tb_rekening3_kode`,`tb_rekening4_kode`),
  ADD KEY `fk_tb_rekening4_tb_rekening31_idx` (`tb_rekening1_kode`,`tb_rekening2_kode`,`tb_rekening3_kode`);

--
-- Indexes for table `tb_rekening5`
--
ALTER TABLE `tb_rekening5`
  ADD PRIMARY KEY (`tb_rekening1_kode`,`tb_rekening2_kode`,`tb_rekening3_kode`,`tb_rekening4_kode`,`tb_rekening5_kode`),
  ADD KEY `fk_tb_rekening5_tb_rekening41_idx` (`tb_rekening1_kode`,`tb_rekening2_kode`,`tb_rekening3_kode`,`tb_rekening4_kode`);

--
-- Indexes for table `tb_renstra_kegiatan`
--
ALTER TABLE `tb_renstra_kegiatan`
  ADD PRIMARY KEY (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`,`tb_rpjmd_sasaran_kode`,`tb_rpjmd_program_kode`,`tb_renstra_kegiatan_kode`,`tb_bidang_kode`,`tb_urusan_kode`,`tb_unit_kode`,`tb_sub_unit_kode`,`id_tb_satuan`),
  ADD KEY `fk_tb_renstra_kegiatan_tb_rpjmd_opd1_idx` (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`,`tb_rpjmd_sasaran_kode`,`tb_rpjmd_program_kode`,`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`),
  ADD KEY `fk_tb_renstra_kegiatan_tb_satuan1_idx` (`id_tb_satuan`);

--
-- Indexes for table `tb_rpjmd`
--
ALTER TABLE `tb_rpjmd`
  ADD PRIMARY KEY (`id_tb_rpjmd`);

--
-- Indexes for table `tb_rpjmd_akar_masalah`
--
ALTER TABLE `tb_rpjmd_akar_masalah`
  ADD PRIMARY KEY (`id_tb_rpjmd_akar_masalah`);

--
-- Indexes for table `tb_rpjmd_indikator`
--
ALTER TABLE `tb_rpjmd_indikator`
  ADD PRIMARY KEY (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`,`tb_rpjmd_sasaran_kode`,`tb_rpjmd_indikator_kode`),
  ADD KEY `fk_tb_rpjmd_indikator_tb_rpjmd_sasaran1_idx` (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`,`tb_rpjmd_sasaran_kode`);

--
-- Indexes for table `tb_rpjmd_kebijakan`
--
ALTER TABLE `tb_rpjmd_kebijakan`
  ADD PRIMARY KEY (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`,`tb_rpjmd_sasaran_kode`,`tb_rpjmd_kebijakan_kode`),
  ADD KEY `fk_tb_rpjmd_kebijakan_tb_rpjmd_sasaran1_idx` (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`,`tb_rpjmd_sasaran_kode`);

--
-- Indexes for table `tb_rpjmd_misi`
--
ALTER TABLE `tb_rpjmd_misi`
  ADD PRIMARY KEY (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`),
  ADD KEY `fk_tb_rpjmd_misi_tb_rpjmd_visi1_idx` (`id_tb_rpjmd`);

--
-- Indexes for table `tb_rpjmd_opd`
--
ALTER TABLE `tb_rpjmd_opd`
  ADD PRIMARY KEY (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`,`tb_rpjmd_sasaran_kode`,`tb_rpjmd_program_kode`,`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`),
  ADD KEY `fk_tb_rpjmd_opd_tb_rpjmd_program1_idx` (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`,`tb_rpjmd_sasaran_kode`,`tb_rpjmd_program_kode`),
  ADD KEY `fk_tb_rpjmd_opd_tb_sub_unit1_idx` (`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`);

--
-- Indexes for table `tb_rpjmd_program`
--
ALTER TABLE `tb_rpjmd_program`
  ADD PRIMARY KEY (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`,`tb_rpjmd_sasaran_kode`,`tb_rpjmd_program_kode`),
  ADD KEY `fk_tb_rpjmd_program_tb_rpjmd_sasaran1_idx` (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`,`tb_rpjmd_sasaran_kode`),
  ADD KEY `fk_tb_rpjmd_program_tb_satuan1_idx` (`id_tb_satuan`);

--
-- Indexes for table `tb_rpjmd_program_indikator`
--
ALTER TABLE `tb_rpjmd_program_indikator`
  ADD PRIMARY KEY (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`,`tb_rpjmd_sasaran_kode`,`tb_rpjmd_program_kode`,`tb_rpjmd_program_indikator_kode`),
  ADD KEY `fk_tb_rpjmd_program_indikator_tb_rpjmd_program1_idx` (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`,`tb_rpjmd_sasaran_kode`,`tb_rpjmd_program_kode`),
  ADD KEY `fk_tb_rpjmd_program_indikator_tb_satuan1_idx` (`id_tb_satuan`);

--
-- Indexes for table `tb_rpjmd_sasaran`
--
ALTER TABLE `tb_rpjmd_sasaran`
  ADD PRIMARY KEY (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`,`tb_rpjmd_sasaran_kode`),
  ADD KEY `fk_tb_rpjmd_sasaran_tb_rpjmd_tujuan1_idx` (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`);

--
-- Indexes for table `tb_rpjmd_strategi`
--
ALTER TABLE `tb_rpjmd_strategi`
  ADD PRIMARY KEY (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`,`tb_rpjmd_sasaran_kode`,`tb_rpjmd_strategi_kode`),
  ADD KEY `fk_tb_rpjmd_strategi_tb_rpjmd_sasaran1_idx` (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`,`tb_rpjmd_sasaran_kode`);

--
-- Indexes for table `tb_rpjmd_tujuan`
--
ALTER TABLE `tb_rpjmd_tujuan`
  ADD PRIMARY KEY (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`),
  ADD KEY `fk_tb_rpjmd_tujuan_tb_rpjmd_misi1_idx` (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`);

--
-- Indexes for table `tb_rpjmd_visi_penjelasan`
--
ALTER TABLE `tb_rpjmd_visi_penjelasan`
  ADD PRIMARY KEY (`id_tb_rpjmd_visi_penjelasan`),
  ADD KEY `fk_tb_rpjmd_visi_penjelasan_tb_rpjmd_visi1_idx` (`id_tb_rpjmd`);

--
-- Indexes for table `tb_satuan`
--
ALTER TABLE `tb_satuan`
  ADD PRIMARY KEY (`id_tb_satuan`);

--
-- Indexes for table `tb_sub_unit`
--
ALTER TABLE `tb_sub_unit`
  ADD PRIMARY KEY (`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`),
  ADD KEY `fk_tb_sub_unit_tb_unit1_idx` (`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`);

--
-- Indexes for table `tb_unit`
--
ALTER TABLE `tb_unit`
  ADD PRIMARY KEY (`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`),
  ADD KEY `fk_tb_unit_tb_bidang1_idx` (`tb_urusan_kode`,`tb_bidang_kode`);

--
-- Indexes for table `tb_urusan`
--
ALTER TABLE `tb_urusan`
  ADD PRIMARY KEY (`tb_urusan_kode`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_tb_user`);

--
-- Indexes for table `tb_user_bappeda`
--
ALTER TABLE `tb_user_bappeda`
  ADD PRIMARY KEY (`id_tb_user_bappeda`),
  ADD KEY `fk_tb_user_bappeda_tb_user1_idx` (`id_tb_user`),
  ADD KEY `fk_tb_user_bappeda_tb_urusan1_idx` (`tb_urusan_kode`);

--
-- Indexes for table `tb_user_dapil`
--
ALTER TABLE `tb_user_dapil`
  ADD PRIMARY KEY (`id_tb_user_dapil`),
  ADD KEY `fk_tb_user_dapil_tb_dewan1_idx` (`tb_dapil_kode`,`tb_dewan_kode`),
  ADD KEY `fk_tb_user_dapil_tb_user1_idx` (`id_tb_user`);

--
-- Indexes for table `tb_user_lokasi`
--
ALTER TABLE `tb_user_lokasi`
  ADD PRIMARY KEY (`id_tb_user_kelompok`),
  ADD KEY `fk_tb_user_lokasi_tb_user1_idx` (`id_tb_user`);

--
-- Indexes for table `tb_user_opd`
--
ALTER TABLE `tb_user_opd`
  ADD PRIMARY KEY (`id_tb_user_opd`),
  ADD KEY `fk_tb_user_opd_tb_sub_unit1_idx` (`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`),
  ADD KEY `fk_tb_user_opd_tb_user1_idx` (`id_tb_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_indikator`
--
ALTER TABLE `tb_indikator`
  MODIFY `id_tb_indikator` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_kategori_laporan`
--
ALTER TABLE `tb_kategori_laporan`
  MODIFY `id_tb_kategori_laporan` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_kriteria_bobot`
--
ALTER TABLE `tb_kriteria_bobot`
  MODIFY `id_tb_kriteria_bobot` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_laporan`
--
ALTER TABLE `tb_laporan`
  MODIFY `id_tb_laporan` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_laporan_dukung`
--
ALTER TABLE `tb_laporan_dukung`
  MODIFY `id_tb_laporan_dukung` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_laporan_komentar`
--
ALTER TABLE `tb_laporan_komentar`
  MODIFY `id_tb_laporan_komentar` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_laporan_user`
--
ALTER TABLE `tb_laporan_user`
  MODIFY `id_tb_laporan_user` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_misi_rpjmd_lama`
--
ALTER TABLE `tb_misi_rpjmd_lama`
  MODIFY `id_tb_misi_rpjmd_lama` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_monev_lra`
--
ALTER TABLE `tb_monev_lra`
  MODIFY `id_tb_monev_lra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=736;
--
-- AUTO_INCREMENT for table `tb_monev_triwulan`
--
ALTER TABLE `tb_monev_triwulan`
  MODIFY `id_tb_monev_triwulan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tb_musrenbang_grub`
--
ALTER TABLE `tb_musrenbang_grub`
  MODIFY `id_tb_musrenbang_grub` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_musrenbang_kec`
--
ALTER TABLE `tb_musrenbang_kec`
  MODIFY `id_tb_musrenbang_kec` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_musrenbang_kel`
--
ALTER TABLE `tb_musrenbang_kel`
  MODIFY `id_tb_musrenbang_kel` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_musrenbang_opd`
--
ALTER TABLE `tb_musrenbang_opd`
  MODIFY `id_tb_musrenbang_opd` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_musrenbang_pokir`
--
ALTER TABLE `tb_musrenbang_pokir`
  MODIFY `id_tb_musrenbang_pokir` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_rpjmd`
--
ALTER TABLE `tb_rpjmd`
  MODIFY `id_tb_rpjmd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_rpjmd_visi_penjelasan`
--
ALTER TABLE `tb_rpjmd_visi_penjelasan`
  MODIFY `id_tb_rpjmd_visi_penjelasan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_satuan`
--
ALTER TABLE `tb_satuan`
  MODIFY `id_tb_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_tb_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tb_user_bappeda`
--
ALTER TABLE `tb_user_bappeda`
  MODIFY `id_tb_user_bappeda` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_user_dapil`
--
ALTER TABLE `tb_user_dapil`
  MODIFY `id_tb_user_dapil` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_user_lokasi`
--
ALTER TABLE `tb_user_lokasi`
  MODIFY `id_tb_user_kelompok` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_user_opd`
--
ALTER TABLE `tb_user_opd`
  MODIFY `id_tb_user_opd` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_bidang`
--
ALTER TABLE `tb_bidang`
  ADD CONSTRAINT `fk_tb_bidang_tb_fungsi1` FOREIGN KEY (`tb_fungsi_kode`) REFERENCES `tb_fungsi` (`tb_fungsi_kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_bidang_tb_urusan1` FOREIGN KEY (`tb_urusan_kode`) REFERENCES `tb_urusan` (`tb_urusan_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_deskel`
--
ALTER TABLE `tb_deskel`
  ADD CONSTRAINT `fk_tb_deskel_tb_kecamatan1` FOREIGN KEY (`tb_provinsi_kode`,`tb_kabupaten_kode`,`tb_kecamatan_kode`) REFERENCES `tb_kecamatan` (`tb_provinsi_kode`, `tb_kabupaten_kode`, `tb_kecamatan_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_dewan`
--
ALTER TABLE `tb_dewan`
  ADD CONSTRAINT `fk_tb_dewan_tb_dapil1` FOREIGN KEY (`tb_dapil_kode`) REFERENCES `tb_dapil` (`tb_dapil_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_kabupaten`
--
ALTER TABLE `tb_kabupaten`
  ADD CONSTRAINT `fk_tb_kabupaten_tb_provinsi2` FOREIGN KEY (`tb_provinsi_kode`) REFERENCES `tb_provinsi` (`tb_provinsi_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_kategori_laporan`
--
ALTER TABLE `tb_kategori_laporan`
  ADD CONSTRAINT `fk_tb_kategori_laporan_tb_sub_unit1` FOREIGN KEY (`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`) REFERENCES `tb_sub_unit` (`tb_urusan_kode`, `tb_bidang_kode`, `tb_unit_kode`, `tb_sub_unit_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_kecamatan`
--
ALTER TABLE `tb_kecamatan`
  ADD CONSTRAINT `fk_tb_kecamatan_tb_kabupaten2` FOREIGN KEY (`tb_kabupaten_kode`,`tb_provinsi_kode`) REFERENCES `tb_kabupaten` (`tb_kabupaten_kode`, `tb_provinsi_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_kegiatan`
--
ALTER TABLE `tb_kegiatan`
  ADD CONSTRAINT `fk_tb_kegiatan_tb_program1` FOREIGN KEY (`tb_urusan_kode`,`tb_bidang_kode`,`tb_program_kode`) REFERENCES `tb_program` (`tb_urusan_kode`, `tb_bidang_kode`, `tb_program_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_kriteria_bobot`
--
ALTER TABLE `tb_kriteria_bobot`
  ADD CONSTRAINT `fk_tb_kriteria_bobot_tb_kriteria_pembobotan1` FOREIGN KEY (`id_tb_kriteria_pembobotan`) REFERENCES `tb_kriteria_pembobotan` (`id_tb_kriteria_pembobotan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_laporan`
--
ALTER TABLE `tb_laporan`
  ADD CONSTRAINT `fk_tb_laporan_tb_kategori_laporan1` FOREIGN KEY (`id_tb_kategori_laporan`) REFERENCES `tb_kategori_laporan` (`id_tb_kategori_laporan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_laporan_tb_laporan_user1` FOREIGN KEY (`id_tb_laporan_user`) REFERENCES `tb_laporan_user` (`id_tb_laporan_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tb_laporan_dukung`
--
ALTER TABLE `tb_laporan_dukung`
  ADD CONSTRAINT `fk_tb_laporan_dukung_tb_laporan1` FOREIGN KEY (`id_tb_laporan`) REFERENCES `tb_laporan` (`id_tb_laporan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_laporan_dukung_tb_laporan_user1` FOREIGN KEY (`id_tb_laporan_user`) REFERENCES `tb_laporan_user` (`id_tb_laporan_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tb_laporan_komentar`
--
ALTER TABLE `tb_laporan_komentar`
  ADD CONSTRAINT `fk_tb_laporan_komentar_tb_laporan1` FOREIGN KEY (`id_tb_laporan`) REFERENCES `tb_laporan` (`id_tb_laporan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_laporan_komentar_tb_laporan_user1` FOREIGN KEY (`id_tb_laporan_user`) REFERENCES `tb_laporan_user` (`id_tb_laporan_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_laporan_user`
--
ALTER TABLE `tb_laporan_user`
  ADD CONSTRAINT `fk_tb_laporan_user_tb_user1` FOREIGN KEY (`id_tb_user`) REFERENCES `tb_user` (`id_tb_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_monev_lra`
--
ALTER TABLE `tb_monev_lra`
  ADD CONSTRAINT `fk_tb_monev_lra_tb_sub_unit1` FOREIGN KEY (`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`) REFERENCES `tb_sub_unit` (`tb_urusan_kode`, `tb_bidang_kode`, `tb_unit_kode`, `tb_sub_unit_kode`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tb_monev_triwulan`
--
ALTER TABLE `tb_monev_triwulan`
  ADD CONSTRAINT `fk_tb_monev_triwulan_tb_sub_unit1` FOREIGN KEY (`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`) REFERENCES `tb_sub_unit` (`tb_urusan_kode`, `tb_bidang_kode`, `tb_unit_kode`, `tb_sub_unit_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_musrenbang_kec`
--
ALTER TABLE `tb_musrenbang_kec`
  ADD CONSTRAINT `fk_tb_musrenbang_kec_tb_indikator1` FOREIGN KEY (`id_tb_indikator`) REFERENCES `tb_indikator` (`id_tb_indikator`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_musrenbang_kec_tb_musrenbang_grub1` FOREIGN KEY (`id_tb_musrenbang_grub`) REFERENCES `tb_musrenbang_grub` (`id_tb_musrenbang_grub`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_musrenbang_kec_tb_satuan1` FOREIGN KEY (`id_tb_satuan`) REFERENCES `tb_satuan` (`id_tb_satuan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_musrenbang_kec_tb_sub_unit1` FOREIGN KEY (`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`) REFERENCES `tb_sub_unit` (`tb_urusan_kode`, `tb_bidang_kode`, `tb_unit_kode`, `tb_sub_unit_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_musrenbang_kel`
--
ALTER TABLE `tb_musrenbang_kel`
  ADD CONSTRAINT `fk_tb_musrenbang_kel_tb_indikator1` FOREIGN KEY (`id_tb_indikator`) REFERENCES `tb_indikator` (`id_tb_indikator`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_musrenbang_kel_tb_musrenbang_grub1` FOREIGN KEY (`id_tb_musrenbang_grub`) REFERENCES `tb_musrenbang_grub` (`id_tb_musrenbang_grub`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_musrenbang_kel_tb_satuan1` FOREIGN KEY (`id_tb_satuan`) REFERENCES `tb_satuan` (`id_tb_satuan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_musrenbang_opd`
--
ALTER TABLE `tb_musrenbang_opd`
  ADD CONSTRAINT `fk_tb_musrenbang_opd_tb_indikator1` FOREIGN KEY (`id_tb_indikator`) REFERENCES `tb_indikator` (`id_tb_indikator`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_musrenbang_opd_tb_musrenbang_grub1` FOREIGN KEY (`id_tb_musrenbang_grub`) REFERENCES `tb_musrenbang_grub` (`id_tb_musrenbang_grub`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_musrenbang_opd_tb_satuan1` FOREIGN KEY (`id_tb_satuan`) REFERENCES `tb_satuan` (`id_tb_satuan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_musrenbang_opd_tb_sub_unit1` FOREIGN KEY (`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`) REFERENCES `tb_sub_unit` (`tb_urusan_kode`, `tb_bidang_kode`, `tb_unit_kode`, `tb_sub_unit_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_musrenbang_pokir`
--
ALTER TABLE `tb_musrenbang_pokir`
  ADD CONSTRAINT `fk_tb_musrenbang_pokir_tb_indikator1` FOREIGN KEY (`id_tb_indikator`) REFERENCES `tb_indikator` (`id_tb_indikator`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_musrenbang_pokir_tb_musrenbang_grub1` FOREIGN KEY (`id_tb_musrenbang_grub`) REFERENCES `tb_musrenbang_grub` (`id_tb_musrenbang_grub`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_musrenbang_pokir_tb_satuan1` FOREIGN KEY (`id_tb_satuan`) REFERENCES `tb_satuan` (`id_tb_satuan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_musrenbang_pokir_tb_sub_unit1` FOREIGN KEY (`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`) REFERENCES `tb_sub_unit` (`tb_urusan_kode`, `tb_bidang_kode`, `tb_unit_kode`, `tb_sub_unit_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_program`
--
ALTER TABLE `tb_program`
  ADD CONSTRAINT `fk_tb_program_tb_bidang1` FOREIGN KEY (`tb_urusan_kode`,`tb_bidang_kode`) REFERENCES `tb_bidang` (`tb_urusan_kode`, `tb_bidang_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_rekening2`
--
ALTER TABLE `tb_rekening2`
  ADD CONSTRAINT `fk_tb_rekening2_tb_rekening11` FOREIGN KEY (`tb_rekening1_kode`) REFERENCES `tb_rekening1` (`tb_rekening1_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_rekening3`
--
ALTER TABLE `tb_rekening3`
  ADD CONSTRAINT `fk_tb_rekening3_tb_rekening21` FOREIGN KEY (`tb_rekening1_kode`,`tb_rekening2_kode`) REFERENCES `tb_rekening2` (`tb_rekening1_kode`, `tb_rekening2_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_rekening4`
--
ALTER TABLE `tb_rekening4`
  ADD CONSTRAINT `fk_tb_rekening4_tb_rekening31` FOREIGN KEY (`tb_rekening1_kode`,`tb_rekening2_kode`,`tb_rekening3_kode`) REFERENCES `tb_rekening3` (`tb_rekening1_kode`, `tb_rekening2_kode`, `tb_rekening3_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_rekening5`
--
ALTER TABLE `tb_rekening5`
  ADD CONSTRAINT `fk_tb_rekening5_tb_rekening41` FOREIGN KEY (`tb_rekening1_kode`,`tb_rekening2_kode`,`tb_rekening3_kode`,`tb_rekening4_kode`) REFERENCES `tb_rekening4` (`tb_rekening1_kode`, `tb_rekening2_kode`, `tb_rekening3_kode`, `tb_rekening4_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_renstra_kegiatan`
--
ALTER TABLE `tb_renstra_kegiatan`
  ADD CONSTRAINT `fk_tb_renstra_kegiatan_tb_rpjmd_opd1` FOREIGN KEY (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`,`tb_rpjmd_sasaran_kode`,`tb_rpjmd_program_kode`,`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`) REFERENCES `tb_rpjmd_opd` (`id_tb_rpjmd`, `tb_rpjmd_misi_kode`, `tb_rpjmd_tujuan_kode`, `tb_rpjmd_sasaran_kode`, `tb_rpjmd_program_kode`, `tb_urusan_kode`, `tb_bidang_kode`, `tb_unit_kode`, `tb_sub_unit_kode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_renstra_kegiatan_tb_satuan1` FOREIGN KEY (`id_tb_satuan`) REFERENCES `tb_satuan` (`id_tb_satuan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tb_rpjmd_indikator`
--
ALTER TABLE `tb_rpjmd_indikator`
  ADD CONSTRAINT `fk_tb_rpjmd_indikator_tb_rpjmd_sasaran1` FOREIGN KEY (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`,`tb_rpjmd_sasaran_kode`) REFERENCES `tb_rpjmd_sasaran` (`id_tb_rpjmd`, `tb_rpjmd_misi_kode`, `tb_rpjmd_tujuan_kode`, `tb_rpjmd_sasaran_kode`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tb_rpjmd_kebijakan`
--
ALTER TABLE `tb_rpjmd_kebijakan`
  ADD CONSTRAINT `fk_tb_rpjmd_kebijakan_tb_rpjmd_sasaran1` FOREIGN KEY (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`,`tb_rpjmd_sasaran_kode`) REFERENCES `tb_rpjmd_sasaran` (`id_tb_rpjmd`, `tb_rpjmd_misi_kode`, `tb_rpjmd_tujuan_kode`, `tb_rpjmd_sasaran_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_rpjmd_misi`
--
ALTER TABLE `tb_rpjmd_misi`
  ADD CONSTRAINT `fk_tb_rpjmd_misi_tb_rpjmd_visi1` FOREIGN KEY (`id_tb_rpjmd`) REFERENCES `tb_rpjmd` (`id_tb_rpjmd`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_rpjmd_opd`
--
ALTER TABLE `tb_rpjmd_opd`
  ADD CONSTRAINT `fk_tb_rpjmd_opd_tb_rpjmd_program1` FOREIGN KEY (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`,`tb_rpjmd_sasaran_kode`,`tb_rpjmd_program_kode`) REFERENCES `tb_rpjmd_program` (`id_tb_rpjmd`, `tb_rpjmd_misi_kode`, `tb_rpjmd_tujuan_kode`, `tb_rpjmd_sasaran_kode`, `tb_rpjmd_program_kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_rpjmd_opd_tb_sub_unit1` FOREIGN KEY (`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`) REFERENCES `tb_sub_unit` (`tb_urusan_kode`, `tb_bidang_kode`, `tb_unit_kode`, `tb_sub_unit_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_rpjmd_program`
--
ALTER TABLE `tb_rpjmd_program`
  ADD CONSTRAINT `fk_tb_rpjmd_program_tb_rpjmd_sasaran1` FOREIGN KEY (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`,`tb_rpjmd_sasaran_kode`) REFERENCES `tb_rpjmd_sasaran` (`id_tb_rpjmd`, `tb_rpjmd_misi_kode`, `tb_rpjmd_tujuan_kode`, `tb_rpjmd_sasaran_kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_rpjmd_program_tb_satuan1` FOREIGN KEY (`id_tb_satuan`) REFERENCES `tb_satuan` (`id_tb_satuan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tb_rpjmd_program_indikator`
--
ALTER TABLE `tb_rpjmd_program_indikator`
  ADD CONSTRAINT `fk_tb_rpjmd_program_indikator_tb_rpjmd_program1` FOREIGN KEY (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`,`tb_rpjmd_sasaran_kode`,`tb_rpjmd_program_kode`) REFERENCES `tb_rpjmd_program` (`id_tb_rpjmd`, `tb_rpjmd_misi_kode`, `tb_rpjmd_tujuan_kode`, `tb_rpjmd_sasaran_kode`, `tb_rpjmd_program_kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_rpjmd_program_indikator_tb_satuan1` FOREIGN KEY (`id_tb_satuan`) REFERENCES `tb_satuan` (`id_tb_satuan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tb_rpjmd_sasaran`
--
ALTER TABLE `tb_rpjmd_sasaran`
  ADD CONSTRAINT `fk_tb_rpjmd_sasaran_tb_rpjmd_tujuan1` FOREIGN KEY (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`) REFERENCES `tb_rpjmd_tujuan` (`id_tb_rpjmd`, `tb_rpjmd_misi_kode`, `tb_rpjmd_tujuan_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_rpjmd_strategi`
--
ALTER TABLE `tb_rpjmd_strategi`
  ADD CONSTRAINT `fk_tb_rpjmd_strategi_tb_rpjmd_sasaran1` FOREIGN KEY (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`,`tb_rpjmd_tujuan_kode`,`tb_rpjmd_sasaran_kode`) REFERENCES `tb_rpjmd_sasaran` (`id_tb_rpjmd`, `tb_rpjmd_misi_kode`, `tb_rpjmd_tujuan_kode`, `tb_rpjmd_sasaran_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_rpjmd_tujuan`
--
ALTER TABLE `tb_rpjmd_tujuan`
  ADD CONSTRAINT `fk_tb_rpjmd_tujuan_tb_rpjmd_misi1` FOREIGN KEY (`id_tb_rpjmd`,`tb_rpjmd_misi_kode`) REFERENCES `tb_rpjmd_misi` (`id_tb_rpjmd`, `tb_rpjmd_misi_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_rpjmd_visi_penjelasan`
--
ALTER TABLE `tb_rpjmd_visi_penjelasan`
  ADD CONSTRAINT `fk_tb_rpjmd_visi_penjelasan_tb_rpjmd_visi1` FOREIGN KEY (`id_tb_rpjmd`) REFERENCES `tb_rpjmd` (`id_tb_rpjmd`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_sub_unit`
--
ALTER TABLE `tb_sub_unit`
  ADD CONSTRAINT `fk_tb_sub_unit_tb_unit1` FOREIGN KEY (`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`) REFERENCES `tb_unit` (`tb_urusan_kode`, `tb_bidang_kode`, `tb_unit_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_unit`
--
ALTER TABLE `tb_unit`
  ADD CONSTRAINT `fk_tb_unit_tb_bidang1` FOREIGN KEY (`tb_urusan_kode`,`tb_bidang_kode`) REFERENCES `tb_bidang` (`tb_urusan_kode`, `tb_bidang_kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_user_bappeda`
--
ALTER TABLE `tb_user_bappeda`
  ADD CONSTRAINT `fk_tb_user_bappeda_tb_urusan1` FOREIGN KEY (`tb_urusan_kode`) REFERENCES `tb_urusan` (`tb_urusan_kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_user_bappeda_tb_user1` FOREIGN KEY (`id_tb_user`) REFERENCES `tb_user` (`id_tb_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_user_dapil`
--
ALTER TABLE `tb_user_dapil`
  ADD CONSTRAINT `fk_tb_user_dapil_tb_dewan1` FOREIGN KEY (`tb_dapil_kode`,`tb_dewan_kode`) REFERENCES `tb_dewan` (`tb_dapil_kode`, `tb_dewan_kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_user_dapil_tb_user1` FOREIGN KEY (`id_tb_user`) REFERENCES `tb_user` (`id_tb_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_user_lokasi`
--
ALTER TABLE `tb_user_lokasi`
  ADD CONSTRAINT `fk_tb_user_lokasi_tb_user1` FOREIGN KEY (`id_tb_user`) REFERENCES `tb_user` (`id_tb_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_user_opd`
--
ALTER TABLE `tb_user_opd`
  ADD CONSTRAINT `fk_tb_user_opd_tb_sub_unit1` FOREIGN KEY (`tb_urusan_kode`,`tb_bidang_kode`,`tb_unit_kode`,`tb_sub_unit_kode`) REFERENCES `tb_sub_unit` (`tb_urusan_kode`, `tb_bidang_kode`, `tb_unit_kode`, `tb_sub_unit_kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_user_opd_tb_user1` FOREIGN KEY (`id_tb_user`) REFERENCES `tb_user` (`id_tb_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
