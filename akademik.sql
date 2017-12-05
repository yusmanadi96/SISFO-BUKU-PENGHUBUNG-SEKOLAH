-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2017 at 05:14 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `akademik`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `guru`
-- (See below for the actual view)
--
CREATE TABLE `guru` (
`nim` varchar(11)
,`nama` varchar(40)
,`kelas` int(11)
,`id_guru` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_menu`
--

CREATE TABLE `tabel_menu` (
  `id` int(11) NOT NULL,
  `nama_menu` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `is_main_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_menu`
--

INSERT INTO `tabel_menu` (`id`, `nama_menu`, `link`, `icon`, `is_main_menu`) VALUES
(1, 'Data Siswa', 'siswa', 'fa fa-users', 0),
(2, 'Data Guru', 'guru', 'fa fa-graduation-cap', 0),
(3, 'Data Orang Tua', 'ortu', 'fa fa-bookmark', 0),
(8, 'Petunjuk Pengisian', 'sekolah', 'fa fa-building', 0),
(9, 'Data master', '#', 'fa fa-bars', 0),
(10, 'Mata Pelajaran', 'mapel', 'fa fa-book', 9),
(11, 'Ruangan Kelas', 'ruangan', 'fa fa-building', 9),
(12, 'Jurusan', 'jurusan', 'fa fa-th-large', 9),
(13, 'Tahun Akademik', 'tahunakademik', 'fa fa-calendar-o', 9),
(14, 'Jadwal pelajaran', 'jadwal', 'fa fa-calendar', 5),
(15, 'Rombongan Belajar', 'rombel', 'fa fa-users', 9),
(16, 'laporan nilai', 'nilai', 'fa fa-file-excel-o', 0),
(17, 'Data Admin', 'users', 'fa fa-cubes', 0),
(19, 'Kurikulum', 'kurikulum', 'fa fa-newspaper-o', 9),
(20, 'Wali Kelas', 'walikelas', 'fa fa-users', 0),
(21, 'form pembayaran', 'keuangan/form', 'fa fa-shopping-cart', 0),
(22, 'Peserta Didik', 'siswa/siswa_aktif', 'fa fa-graduation-cap', 0),
(23, 'jenis pembayaran', 'jenis_pembayaran', 'fa fa-credit-card', 0),
(24, 'setup biaya', 'keuangan/setup', 'fa fa-graduation-cap', 0),
(25, 'Raport Online', 'raport', 'fa fa-graduation-cap', 0),
(26, 'SMS GATEWAY', 'sms', 'fa fa-envelope-o', 0),
(27, 'phonebook', 'sms_group', 'fa fa-book', 26),
(28, 'form sms', 'sms', 'fa fa-keyboard-o', 26),
(29, 'Input Nilai Siswa', 'siswa', 'fa fa-users', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_agama`
--

CREATE TABLE `tbl_agama` (
  `kd_agama` varchar(2) NOT NULL,
  `nama_agama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_agama`
--

INSERT INTO `tbl_agama` (`kd_agama`, `nama_agama`) VALUES
('01', 'ISLAM'),
('02', 'KRISTEN/ PROTESTAN'),
('03', 'KATHOLIK'),
('04', 'HINDU'),
('05', 'BUDHA'),
('06', 'KHONG HU CHU'),
('99', 'LAIN LAIN');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_aktifitas`
--

CREATE TABLE `tbl_aktifitas` (
  `id_aktifitas` int(5) NOT NULL,
  `nama_aktifitas` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_aktifitas`
--

INSERT INTO `tbl_aktifitas` (`id_aktifitas`, `nama_aktifitas`) VALUES
(1, 'Aktifitas Sekolah'),
(2, 'Aktifitas Rumah');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_aspek`
--

CREATE TABLE `tbl_aspek` (
  `id_aspek` int(5) NOT NULL,
  `nama_aspek` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_aspek`
--

INSERT INTO `tbl_aspek` (`id_aspek`, `nama_aspek`) VALUES
(1, 'Aspek Ibadah'),
(2, 'Aspek Sosial'),
(3, 'Aspek Kemandirian');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_biaya_sekolah`
--

CREATE TABLE `tbl_biaya_sekolah` (
  `id_biaya` int(11) NOT NULL,
  `id_jenis_pembayaran` int(11) NOT NULL,
  `id_tahun_akademik` int(11) NOT NULL,
  `jumlah_biaya` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_biaya_sekolah`
--

INSERT INTO `tbl_biaya_sekolah` (`id_biaya`, `id_jenis_pembayaran`, `id_tahun_akademik`, `jumlah_biaya`) VALUES
(3, 1, 1, 600000),
(4, 2, 1, 900000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_guru`
--

CREATE TABLE `tbl_guru` (
  `id_guru` int(11) NOT NULL,
  `nuptk` varchar(16) NOT NULL,
  `nama_guru` varchar(30) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `gender` enum('p','w') NOT NULL,
  `id_rombel` int(11) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_guru`
--

INSERT INTO `tbl_guru` (`id_guru`, `nuptk`, `nama_guru`, `alamat`, `gender`, `id_rombel`, `telepon`, `username`, `password`) VALUES
(1, '8728372382738273', 'drs diawan sst', '', 'p', 0, '0', '', ''),
(2, '46676768686', 'Abdul Ghani', '', 'p', 2, '0', 'ghani01', '9b9cb79dd76e96c615fe80a607e65b68'),
(3, '4343434434343434', 'irma muliana sst mpd', '', 'w', 0, '0', '', ''),
(4, '3434343232323', 'syamsuddin', 'Mojoanyar', 'p', 1, '085745456767', 'udin123', '3af4c9341e31bce1f4262a326285170d'),
(5, '5050505050', 'Joko Widodo', 'Mojokerto', 'p', 3, '087523234567', 'Joko', '278ea841c0d133059032b8a75320c3e0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_history_kelas`
--

CREATE TABLE `tbl_history_kelas` (
  `id_history` int(11) NOT NULL,
  `id_rombel` int(11) NOT NULL,
  `nim` varchar(11) NOT NULL,
  `id_tahun_akademik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_history_kelas`
--

INSERT INTO `tbl_history_kelas` (`id_history`, `id_rombel`, `nim`, `id_tahun_akademik`) VALUES
(1, 1, 'TI3003239', 1),
(2, 1, 'RM00502', 1),
(3, 1, 'TI102132', 1),
(4, 1, 'TI102133', 1),
(5, 1, 'TIM102134', 1),
(6, 1, 'TIM102135', 1),
(7, 1, 'TI1021395', 1),
(8, 1, '0001', 1),
(9, 3, '0002', 1),
(10, 2, '0004', 1),
(11, 3, '234567', 1),
(12, 1, '76543', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jadwal`
--

CREATE TABLE `tbl_jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `id_tahun_akademik` int(11) NOT NULL,
  `kd_jurusan` varchar(6) NOT NULL,
  `kelas` int(11) NOT NULL,
  `kd_mapel` varchar(4) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `jam` varchar(14) NOT NULL,
  `kd_ruangan` varchar(4) NOT NULL,
  `semester` int(11) NOT NULL,
  `hari` varchar(10) NOT NULL,
  `id_rombel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_jadwal`
--

INSERT INTO `tbl_jadwal` (`id_jadwal`, `id_tahun_akademik`, `kd_jurusan`, `kelas`, `kd_mapel`, `id_guru`, `jam`, `kd_ruangan`, `semester`, `hari`, `id_rombel`) VALUES
(13, 1, 'RPL', 1, 'MTK', 4, '08.00 - 08.45', '01A', 1, 'SELASA', 1),
(14, 1, 'RPL', 1, 'MTK', 2, '', '01B', 1, '', 2),
(15, 1, 'RPL', 1, 'BID', 2, '09.30 - 10.00', '01A', 1, 'RABU', 1),
(16, 1, 'RPL', 1, 'BID', 2, '', '011', 1, '', 2),
(17, 1, 'RPL', 1, 'IPA', 4, '10.00 - 10.45', '01B', 1, 'JUMAT', 1),
(18, 1, 'RPL', 1, 'IPA', 2, '', '011', 1, '', 2),
(19, 1, 'RPL', 1, 'MTK', 2, '', '011', 1, '', 1),
(20, 1, 'RPL', 1, 'MTK', 2, '', '011', 1, '', 2),
(21, 1, 'RPL', 1, 'BID', 2, '', '011', 1, '', 1),
(22, 1, 'RPL', 1, 'BID', 2, '', '011', 1, '', 2),
(23, 1, 'RPL', 1, 'IPA', 2, '', '011', 1, '', 1),
(24, 1, 'RPL', 1, 'IPA', 2, '', '011', 1, '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jenis_pembayaran`
--

CREATE TABLE `tbl_jenis_pembayaran` (
  `id_jenis_pembayaran` int(11) NOT NULL,
  `nama_jenis_pembayaran` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_jenis_pembayaran`
--

INSERT INTO `tbl_jenis_pembayaran` (`id_jenis_pembayaran`, `nama_jenis_pembayaran`) VALUES
(1, 'spp'),
(2, 'dsp');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jenjang_sekolah`
--

CREATE TABLE `tbl_jenjang_sekolah` (
  `id_jenjang` int(11) NOT NULL,
  `nama_jenjang` varchar(10) NOT NULL,
  `jumlah_kelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_jenjang_sekolah`
--

INSERT INTO `tbl_jenjang_sekolah` (`id_jenjang`, `nama_jenjang`, `jumlah_kelas`) VALUES
(1, 'SD/ MI', 6),
(2, 'SMP/ MTS', 3),
(3, 'SMA/ SMK', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jurusan`
--

CREATE TABLE `tbl_jurusan` (
  `kd_jurusan` varchar(4) NOT NULL,
  `nama_jurusan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_jurusan`
--

INSERT INTO `tbl_jurusan` (`kd_jurusan`, `nama_jurusan`) VALUES
('RPL', 'REKAYASA PERANGKAT LUNAK'),
('TKJ', 'TEKNIK KOMPUTER JARINGAN');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kegiatan`
--

CREATE TABLE `tbl_kegiatan` (
  `id_keg` int(5) NOT NULL,
  `nama_kegiatan` varchar(100) NOT NULL,
  `id_aspek` int(5) NOT NULL,
  `id_aktifitas` int(5) NOT NULL,
  `nilai` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_kegiatan`
--

INSERT INTO `tbl_kegiatan` (`id_keg`, `nama_kegiatan`, `id_aspek`, `id_aktifitas`, `nilai`) VALUES
(1, 'Sholat dengan tertib', 1, 1, 0),
(2, 'Mengaji dengan tertib', 1, 1, 0),
(3, 'Berdo\'a dengan tertib', 1, 1, 0),
(4, 'Berwudlu dengan tertib', 1, 1, 0),
(5, 'Salam dan Saliman dengan guru', 2, 1, 0),
(6, 'Bergaul secara baik dengan teman', 2, 1, 0),
(7, 'Berbicara dan berperilaku sopan terhadap semua orang', 2, 1, 0),
(8, 'Taat dan patuh terhadap guru', 2, 1, 0),
(9, 'Datang ke sekolah tepat waktu', 3, 1, 0),
(10, 'Berpakaian lengkap dan rapi', 3, 1, 0),
(11, 'Peralatan sekolah lengkap dan rapi', 3, 1, 0),
(12, 'Tertib selama dikelas', 3, 1, 0),
(13, 'Aktif mengikuti pelajaran', 3, 1, 0),
(14, 'Menyelesaikan tugas dengan baik', 3, 1, 0),
(15, 'Tepat waktu masuk kelas setelah istirahat', 3, 1, 0),
(16, 'Makan siang dengan baik', 3, 1, 0),
(17, 'Menjaga kebersihan kelas', 3, 1, 0),
(18, 'Melakukan Shalat Maghrib', 1, 2, 0),
(19, 'Melakukan Shalat Isya\'', 1, 2, 0),
(20, 'Melakukan Shalat Subuh', 1, 2, 0),
(21, 'Berdo\'a dan berdzikir sesudah shalat', 1, 2, 0),
(22, 'Berdo\'a akan tidur dan keluar masuk kamar mandi', 1, 2, 0),
(23, 'Membaca Al-Qur\'an', 1, 2, 0),
(24, 'Mengucap salam ketika masuk rumah', 1, 2, 0),
(25, 'Salam dan saliman dengan orang tua', 2, 2, 0),
(26, 'Hormat dan patuh kepada orang tua', 2, 2, 0),
(27, 'Bergaul secara baik dengan teman', 2, 2, 0),
(28, 'Sopan dan santun dengan orang lain', 2, 2, 0),
(29, 'Manyayangi kakak, adik dan saudara yang lain', 2, 2, 0),
(30, 'Bangun tidur sendiri', 3, 2, 0),
(31, 'Merapikan tempat tidur', 3, 2, 0),
(32, 'Mandi dan gosok gigi sendiri', 3, 2, 0),
(33, 'Memakai dan melepas pakaian sendiri', 3, 2, 0),
(34, 'Makan sendiri (tidak disuapi)', 3, 2, 0),
(35, 'Menyiapakn peralatan sekolah sendiri', 3, 2, 0),
(36, 'Belajar dan membaca buku', 3, 2, 0),
(37, 'Merapikan peralatan sekolah sendiri', 3, 2, 0),
(38, 'Tidur sendiri', 3, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kurikulum`
--

CREATE TABLE `tbl_kurikulum` (
  `id_kurikulum` int(11) NOT NULL,
  `nama_kurikulum` varchar(30) NOT NULL,
  `is_aktif` enum('y','n') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_kurikulum`
--

INSERT INTO `tbl_kurikulum` (`id_kurikulum`, `nama_kurikulum`, `is_aktif`) VALUES
(1, 'KURIKULUM 2016', 'y'),
(2, 'KURIKULUM 2013', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kurikulum_detail`
--

CREATE TABLE `tbl_kurikulum_detail` (
  `id_kurikulum_detail` int(11) NOT NULL,
  `id_kurikulum` int(11) NOT NULL,
  `kd_mapel` varchar(11) NOT NULL,
  `kd_jurusan` varchar(4) NOT NULL,
  `kelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_kurikulum_detail`
--

INSERT INTO `tbl_kurikulum_detail` (`id_kurikulum_detail`, `id_kurikulum`, `kd_mapel`, `kd_jurusan`, `kelas`) VALUES
(9, 1, 'MTK', 'RPL', 1),
(10, 1, 'BID', 'RPL', 1),
(12, 1, 'IPA', 'RPL', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_level_user`
--

CREATE TABLE `tbl_level_user` (
  `id_level_user` int(11) NOT NULL,
  `nama_level` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_level_user`
--

INSERT INTO `tbl_level_user` (`id_level_user`, `nama_level`) VALUES
(1, 'Admin'),
(2, 'Wali Murid'),
(3, 'Guru'),
(5, 'Keuangan');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mapel`
--

CREATE TABLE `tbl_mapel` (
  `kd_mapel` varchar(4) NOT NULL,
  `nama_mapel` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_mapel`
--

INSERT INTO `tbl_mapel` (`kd_mapel`, `nama_mapel`) VALUES
('BID', 'BAHASA INDONESIA'),
('IPA', 'ILMU PENGETAHUAN ALAM'),
('IPS', 'ILMU PENGETAHUAN SOSIAL'),
('MTK', 'MATEMATIKA'),
('TIK', 'TEKNOLOGI INFORMASI KOMPUTER');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_nilai`
--

CREATE TABLE `tbl_nilai` (
  `id_nilai` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `nim` varchar(15) NOT NULL,
  `nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_nilai`
--

INSERT INTO `tbl_nilai` (`id_nilai`, `id_jadwal`, `nim`, `nilai`) VALUES
(1, 13, 'TI3003239', 90),
(2, 13, 'RM00502', 89),
(3, 13, 'TI102132', 89),
(4, 13, 'TI102133', 78),
(5, 13, 'TIM102134', 67),
(6, 13, 'TIM102135', 98),
(7, 13, 'TI1021395', 60),
(8, 17, 'TI3003239', 90),
(9, 17, 'RM00502', 87),
(10, 17, 'TI102132', 89),
(11, 17, 'TI102133', 99),
(12, 17, 'TIM102134', 90),
(13, 17, 'TIM102135', 86),
(14, 17, 'TI1021395', 89);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_nilai_aktif`
--

CREATE TABLE `tbl_nilai_aktif` (
  `id_nilai_aktif` int(5) NOT NULL,
  `tanggal` date NOT NULL,
  `id_aktifitas` int(5) NOT NULL,
  `id_aspek` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_nilai_d`
--

CREATE TABLE `tbl_nilai_d` (
  `id` int(11) NOT NULL,
  `id_keg` int(5) NOT NULL,
  `id_aktifitas` int(5) NOT NULL,
  `id_nilai` int(5) NOT NULL,
  `nilai` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_nilai_d`
--

INSERT INTO `tbl_nilai_d` (`id`, `id_keg`, `id_aktifitas`, `id_nilai`, `nilai`) VALUES
(74, 1, 1, 26, 1),
(75, 2, 1, 26, 1),
(76, 3, 1, 26, 1),
(77, 4, 1, 26, 1),
(78, 5, 1, 26, 1),
(79, 6, 1, 26, 1),
(80, 7, 1, 26, 1),
(81, 8, 1, 26, 1),
(82, 9, 1, 26, 1),
(83, 10, 1, 26, 1),
(84, 11, 1, 26, 1),
(85, 12, 1, 26, 1),
(86, 13, 1, 26, 1),
(87, 14, 1, 26, 1),
(88, 15, 1, 26, 1),
(89, 16, 1, 26, 1),
(90, 17, 1, 26, 1),
(91, 1, 1, 27, 1),
(92, 2, 1, 27, 1),
(93, 3, 1, 27, 0),
(94, 4, 1, 27, 0),
(95, 5, 1, 27, 0),
(96, 6, 1, 27, 0),
(97, 7, 1, 27, 0),
(98, 8, 1, 27, 0),
(99, 9, 1, 27, 1),
(100, 10, 1, 27, 1),
(101, 11, 1, 27, 1),
(102, 12, 1, 27, 1),
(103, 13, 1, 27, 1),
(104, 14, 1, 27, 1),
(105, 15, 1, 27, 1),
(106, 16, 1, 27, 1),
(107, 17, 1, 27, 1),
(108, 18, 2, 28, 1),
(109, 19, 2, 28, 1),
(110, 20, 2, 28, 1),
(111, 21, 2, 28, 1),
(112, 22, 2, 28, 1),
(113, 23, 2, 28, 1),
(114, 24, 2, 28, 1),
(115, 25, 2, 28, 1),
(116, 26, 2, 28, 1),
(117, 27, 2, 28, 1),
(118, 28, 2, 28, 1),
(119, 29, 2, 28, 1),
(120, 30, 2, 28, 1),
(121, 31, 2, 28, 1),
(122, 32, 2, 28, 1),
(123, 33, 2, 28, 1),
(124, 34, 2, 28, 1),
(125, 35, 2, 28, 1),
(126, 36, 2, 28, 1),
(127, 37, 2, 28, 1),
(128, 38, 2, 28, 1),
(129, 18, 2, 29, 1),
(130, 19, 2, 29, 1),
(131, 20, 2, 29, 1),
(132, 21, 2, 29, 1),
(133, 22, 2, 29, 1),
(134, 23, 2, 29, 1),
(135, 24, 2, 29, 1),
(136, 25, 2, 29, 1),
(137, 26, 2, 29, 1),
(138, 27, 2, 29, 1),
(139, 28, 2, 29, 1),
(140, 29, 2, 29, 1),
(141, 30, 2, 29, 1),
(142, 31, 2, 29, 1),
(143, 32, 2, 29, 1),
(144, 33, 2, 29, 1),
(145, 34, 2, 29, 1),
(146, 35, 2, 29, 1),
(147, 36, 2, 29, 1),
(148, 37, 2, 29, 1),
(149, 38, 2, 29, 1),
(171, 18, 2, 31, 0),
(172, 19, 2, 31, 0),
(173, 20, 2, 31, 1),
(174, 21, 2, 31, 1),
(175, 22, 2, 31, 1),
(176, 23, 2, 31, 1),
(177, 24, 2, 31, 1),
(178, 25, 2, 31, 1),
(179, 26, 2, 31, 1),
(180, 27, 2, 31, 1),
(181, 28, 2, 31, 1),
(182, 29, 2, 31, 1),
(183, 30, 2, 31, 1),
(184, 31, 2, 31, 1),
(185, 32, 2, 31, 1),
(186, 33, 2, 31, 1),
(187, 34, 2, 31, 1),
(188, 35, 2, 31, 1),
(189, 36, 2, 31, 1),
(190, 37, 2, 31, 1),
(191, 38, 2, 31, 1),
(192, 18, 2, 32, 1),
(193, 19, 2, 32, 1),
(194, 20, 2, 32, 1),
(195, 21, 2, 32, 1),
(196, 22, 2, 32, 1),
(197, 23, 2, 32, 1),
(198, 24, 2, 32, 1),
(199, 25, 2, 32, 1),
(200, 26, 2, 32, 1),
(201, 27, 2, 32, 1),
(202, 28, 2, 32, 1),
(203, 29, 2, 32, 1),
(204, 30, 2, 32, 1),
(205, 31, 2, 32, 1),
(206, 32, 2, 32, 1),
(207, 33, 2, 32, 1),
(208, 34, 2, 32, 1),
(209, 35, 2, 32, 1),
(210, 36, 2, 32, 1),
(211, 37, 2, 32, 1),
(212, 38, 2, 32, 1),
(213, 1, 1, 33, 1),
(214, 2, 1, 33, 1),
(215, 3, 1, 33, 1),
(216, 4, 1, 33, 0),
(217, 5, 1, 33, 1),
(218, 6, 1, 33, 1),
(219, 7, 1, 33, 1),
(220, 8, 1, 33, 1),
(221, 9, 1, 33, 1),
(222, 10, 1, 33, 1),
(223, 11, 1, 33, 1),
(224, 12, 1, 33, 1),
(225, 13, 1, 33, 1),
(226, 14, 1, 33, 1),
(227, 15, 1, 33, 1),
(228, 16, 1, 33, 1),
(229, 17, 1, 33, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_nilai_k`
--

CREATE TABLE `tbl_nilai_k` (
  `id_nilai` int(5) NOT NULL,
  `tanggal` date NOT NULL,
  `id_siswa` varchar(11) NOT NULL,
  `catatan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_nilai_k`
--

INSERT INTO `tbl_nilai_k` (`id_nilai`, `tanggal`, `id_siswa`, `catatan`) VALUES
(26, '2017-10-29', 'RM00502', NULL),
(27, '2017-10-29', 'TI102132', NULL),
(28, '2017-10-29', 'RM00502', NULL),
(29, '2017-11-03', '0001', NULL),
(31, '2017-11-07', 'RM00502', 'Ngantuk dalam Kelas'),
(32, '2017-11-09', 'TI102132', ''),
(33, '2017-11-11', 'RM00502', 'hsdgsigcaskghcia');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ortu`
--

CREATE TABLE `tbl_ortu` (
  `id_ortu` int(10) NOT NULL,
  `nama_wali` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telepon` text NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_ortu`
--

INSERT INTO `tbl_ortu` (`id_ortu`, `nama_wali`, `alamat`, `telepon`, `username`, `password`) VALUES
(1, 'sukadi', 'sembarang', '085746463737', '', 0),
(2, 'bagio', 'gak ero', '098765433456', '', 0),
(4, 'Bayu', 'Dawar', '081873487327', 'Bayu', 92360),
(78, 'ajeng putri', 'jombang', '085745364758', 'ajeng', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_phonebook`
--

CREATE TABLE `tbl_phonebook` (
  `id_phonebook` int(11) NOT NULL,
  `id_group` int(11) NOT NULL,
  `no_hp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_phonebook`
--

INSERT INTO `tbl_phonebook` (`id_phonebook`, `id_group`, `no_hp`) VALUES
(1, 7, '089699935552'),
(2, 7, '085310204081');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rombel`
--

CREATE TABLE `tbl_rombel` (
  `id_rombel` int(11) NOT NULL,
  `nama_rombel` varchar(30) NOT NULL,
  `kelas` int(11) NOT NULL,
  `kd_jurusan` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_rombel`
--

INSERT INTO `tbl_rombel` (`id_rombel`, `nama_rombel`, `kelas`, `kd_jurusan`) VALUES
(1, 'RPL1A', 1, 'RPL'),
(2, 'RPL1B', 2, 'RPL'),
(3, 'RPL2A', 3, 'RPL'),
(4, 'RPL2B', 4, 'RPL'),
(5, 'Lima', 5, 'RPL'),
(6, 'Enam', 6, 'RPL');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ruangan`
--

CREATE TABLE `tbl_ruangan` (
  `kd_ruangan` varchar(4) NOT NULL,
  `nama_ruangan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_ruangan`
--

INSERT INTO `tbl_ruangan` (`kd_ruangan`, `nama_ruangan`) VALUES
('011', 'DEFAULT'),
('01A', 'RUANGAN KELAS 1 A'),
('01B', 'RUANGAN KELAS 1B'),
('01C', 'RUANGAN KELAS 1 C');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sekolah_info`
--

CREATE TABLE `tbl_sekolah_info` (
  `id_sekolah` int(11) NOT NULL,
  `nama_sekolah` varchar(30) NOT NULL,
  `id_jenjang_sekolah` int(11) NOT NULL,
  `alamat_sekolah` text NOT NULL,
  `email` varchar(30) NOT NULL,
  `telpon` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sekolah_info`
--

INSERT INTO `tbl_sekolah_info` (`id_sekolah`, `nama_sekolah`, `id_jenjang_sekolah`, `alamat_sekolah`, `email`, `telpon`) VALUES
(1, 'SMK N 2 LANGSA', 3, 'JL AHMAD YANI NO 2, DESA PAYA BUJOK SELEUMAK, KOTA LANGSA - ACEH', 'smkn2langsa@sch.id', '02134235');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_siswa`
--

CREATE TABLE `tbl_siswa` (
  `nim` varchar(11) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `gender` enum('P','W') NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `kd_agama` varchar(2) NOT NULL,
  `foto` text NOT NULL,
  `id_rombel` int(11) NOT NULL,
  `id_ortu` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_siswa`
--

INSERT INTO `tbl_siswa` (`nim`, `nama`, `gender`, `tanggal_lahir`, `tempat_lahir`, `kd_agama`, `foto`, `id_rombel`, `id_ortu`) VALUES
('0001', 'Gopek', 'P', '2018-02-05', 'kedungmaling', '01', '', 3, 1),
('0002', 'Okta', 'W', '2017-11-06', 'Jombang', '01', '', 3, 0),
('0004', 'ajeng', 'W', '1990-10-03', 'jombang', '01', '', 2, 1),
('234567', 'khbxjkaxvakx', 'P', '1996-10-03', 'zncxbzmcbz', '01', '', 3, 1),
('76543', 'fgjhgfjfg', 'W', '1997-12-12', 'sfdfdf', '02', '', 1, 2),
('RM00502', 'SAFIKAH KAMAL', 'P', '2017-01-23', 'BANDA ACEH', '02', '', 1, 4),
('TI102132', 'NURIS AKBAR', 'P', '2017-01-22', 'LANGSA', '01', '', 1, 4),
('TI102133', 'M HAFIDZ MUZAKI', 'P', '2017-01-16', 'LANGSA', '01', '', 1, 1),
('TI1021395', 'BALQIS HUMAIRA', 'W', '2017-01-11', 'KUALA SIMPANG', '01', '', 2, 2),
('TI3003239', 'JONO', 'P', '2017-02-18', 'BANDUNG', '01', 'Yaya_yah10.png', 2, 1),
('TIM102134', 'DESI HANDAYANI', 'W', '2017-01-22', 'RANGKASBITUNG', '01', '', 2, 1),
('TIM102135', 'IRMA MULIANA', 'W', '2017-01-25', 'LANGSA', '01', '', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sms_group`
--

CREATE TABLE `tbl_sms_group` (
  `id` int(11) NOT NULL,
  `nama_group` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sms_group`
--

INSERT INTO `tbl_sms_group` (`id`, `nama_group`) VALUES
(1, 'group 1'),
(2, 'group 2'),
(4, 'asasas'),
(5, 'testing'),
(7, 'walimurid');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tahun_akademik`
--

CREATE TABLE `tbl_tahun_akademik` (
  `id_tahun_akademik` int(4) NOT NULL,
  `tahun_akademik` varchar(10) NOT NULL,
  `is_aktif` enum('y','n') NOT NULL,
  `semester_aktif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_tahun_akademik`
--

INSERT INTO `tbl_tahun_akademik` (`id_tahun_akademik`, `tahun_akademik`, `is_aktif`, `semester_aktif`) VALUES
(1, '2016/ 2017', 'y', 1),
(2, '2015/2016', 'n', 0),
(6, '2017/2018', 'n', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(32) NOT NULL,
  `id_level_user` int(11) NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `nama_lengkap`, `username`, `password`, `id_level_user`, `foto`) VALUES
(1, 'nuris akbar', 'nuris123', '85a3281bee28b39d2c0cb14ff86a55cd', 1, 'dsdsdsds'),
(2, 'HAFIDZ MUZAKI', 'zaki', 'd41d8cd98f00b204e9800998ecf8427e', 1, 'Angin.jpeg'),
(5, 'fang sui', 'fang', 'd41d8cd98f00b204e9800998ecf8427e', 1, 'Gopal_Render.png'),
(7, 'desi handayani', 'desi123', '14ddc434109d6e8df730d4ea4eefc06c', 5, 'Yaya_yah1.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_rule`
--

CREATE TABLE `tbl_user_rule` (
  `id_rule` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `id_level_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_rule`
--

INSERT INTO `tbl_user_rule` (`id_rule`, `id_menu`, `id_level_user`) VALUES
(1, 29, 2),
(2, 3, 1),
(3, 1, 1),
(4, 2, 1),
(5, 8, 1),
(6, 14, 0),
(7, 16, 2),
(8, 16, 3),
(9, 8, 2),
(10, 21, 5),
(11, 9, 5),
(12, 10, 1),
(13, 11, 1),
(14, 12, 1),
(15, 13, 1),
(16, 14, 1),
(17, 17, 1),
(18, 19, 1),
(19, 20, 5),
(20, 14, 5),
(21, 16, 1),
(25, 22, 5),
(26, 23, 5),
(27, 24, 5),
(28, 25, 5),
(29, 26, 0),
(30, 26, 5),
(31, 8, 3),
(33, 29, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_walikelas`
--

CREATE TABLE `tbl_walikelas` (
  `id_walikelas` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_tahun_akademik` int(11) NOT NULL,
  `id_rombel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_walikelas`
--

INSERT INTO `tbl_walikelas` (`id_walikelas`, `id_guru`, `id_tahun_akademik`, `id_rombel`) VALUES
(7, 4, 1, 1),
(8, 3, 1, 2),
(9, 1, 1, 3),
(10, 2, 1, 4);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_guru_master`
-- (See below for the actual view)
--
CREATE TABLE `v_guru_master` (
`nuptk` varchar(16)
,`nama_guru` varchar(30)
,`gender` enum('p','w')
,`kelas` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_master_rombel`
-- (See below for the actual view)
--
CREATE TABLE `v_master_rombel` (
`id_rombel` int(11)
,`nama_rombel` varchar(30)
,`kelas` int(11)
,`kd_jurusan` varchar(4)
,`nama_jurusan` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_nilai_d`
-- (See below for the actual view)
--
CREATE TABLE `v_nilai_d` (
`id_nilai` int(5)
,`tanggal` date
,`id_siswa` varchar(11)
,`id_keg` int(5)
,`nama_kegiatan` varchar(100)
,`nama_aktifitas` varchar(30)
,`nama_aspek` varchar(30)
,`nilai` int(5)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_nilai_master`
-- (See below for the actual view)
--
CREATE TABLE `v_nilai_master` (
`id_nilai` int(5)
,`tanggal` date
,`id_siswa` varchar(11)
,`aspek_ibadah` int(5)
,`aspek_sosial` int(5)
,`aspek_kemandirian` int(5)
,`id_keg` int(5)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_siswa_master`
-- (See below for the actual view)
--
CREATE TABLE `v_siswa_master` (
`nim` varchar(11)
,`nama` varchar(40)
,`foto` text
,`id_rombel` int(11)
,`wali` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_tbl_user`
-- (See below for the actual view)
--
CREATE TABLE `v_tbl_user` (
`id_user` int(11)
,`nama_lengkap` varchar(50)
,`username` varchar(40)
,`password` varchar(32)
,`id_level_user` int(11)
,`foto` text
,`nama_level` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_total_ibadah`
-- (See below for the actual view)
--
CREATE TABLE `v_total_ibadah` (
`id_nilai` int(5)
,`total_ibadah` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_total_kemandirian`
-- (See below for the actual view)
--
CREATE TABLE `v_total_kemandirian` (
`id_nilai` int(5)
,`total_kemandirian` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_total_nilai`
-- (See below for the actual view)
--
CREATE TABLE `v_total_nilai` (
`id_nilai` int(5)
,`total` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_total_sosial`
-- (See below for the actual view)
--
CREATE TABLE `v_total_sosial` (
`id_nilai` int(5)
,`total_sosial` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_walikelas`
-- (See below for the actual view)
--
CREATE TABLE `v_walikelas` (
`nama_guru` varchar(30)
,`nama_rombel` varchar(30)
,`id_walikelas` int(11)
,`id_tahun_akademik` int(11)
,`nama_jurusan` varchar(30)
,`kelas` int(11)
,`tahun_akademik` varchar(10)
);

-- --------------------------------------------------------

--
-- Structure for view `guru`
--
DROP TABLE IF EXISTS `guru`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `guru`  AS  select `ts`.`nim` AS `nim`,`ts`.`nama` AS `nama`,`tr`.`kelas` AS `kelas`,`tg`.`id_guru` AS `id_guru` from ((`tbl_siswa` `ts` join `tbl_rombel` `tr`) join `tbl_guru` `tg`) where ((`ts`.`id_rombel` = `tr`.`id_rombel`) and (`tg`.`id_rombel` = `tr`.`id_rombel`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_guru_master`
--
DROP TABLE IF EXISTS `v_guru_master`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_guru_master`  AS  select `tg`.`nuptk` AS `nuptk`,`tg`.`nama_guru` AS `nama_guru`,`tg`.`gender` AS `gender`,`tr`.`kelas` AS `kelas` from (`tbl_guru` `tg` join `tbl_rombel` `tr`) where (`tg`.`id_rombel` = `tr`.`id_rombel`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_master_rombel`
--
DROP TABLE IF EXISTS `v_master_rombel`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_master_rombel`  AS  select `tr`.`id_rombel` AS `id_rombel`,`tr`.`nama_rombel` AS `nama_rombel`,`tr`.`kelas` AS `kelas`,`tr`.`kd_jurusan` AS `kd_jurusan`,`tj`.`nama_jurusan` AS `nama_jurusan` from (`tbl_rombel` `tr` join `tbl_jurusan` `tj`) where (`tj`.`kd_jurusan` = `tr`.`kd_jurusan`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_nilai_d`
--
DROP TABLE IF EXISTS `v_nilai_d`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_nilai_d`  AS  select `nk`.`id_nilai` AS `id_nilai`,`nk`.`tanggal` AS `tanggal`,`nk`.`id_siswa` AS `id_siswa`,`ng`.`id_keg` AS `id_keg`,`ng`.`nama_kegiatan` AS `nama_kegiatan`,`na`.`nama_aktifitas` AS `nama_aktifitas`,`ns`.`nama_aspek` AS `nama_aspek`,`nd`.`nilai` AS `nilai` from ((((`tbl_nilai_k` `nk` join `tbl_nilai_d` `nd` on((`nd`.`id_nilai` = `nk`.`id_nilai`))) join `tbl_kegiatan` `ng` on((`nd`.`id_keg` = `ng`.`id_keg`))) join `tbl_aktifitas` `na` on((`nd`.`id_aktifitas` = `na`.`id_aktifitas`))) join `tbl_aspek` `ns` on((`ng`.`id_aspek` = `ns`.`id_aspek`))) order by ((`nk`.`id_nilai` <> 0) and (`nd`.`id_keg` <> 0)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_nilai_master`
--
DROP TABLE IF EXISTS `v_nilai_master`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_nilai_master`  AS  select `nk`.`id_nilai` AS `id_nilai`,`nk`.`tanggal` AS `tanggal`,`nk`.`id_siswa` AS `id_siswa`,`nd`.`nilai` AS `aspek_ibadah`,`nd`.`nilai` AS `aspek_sosial`,`nd`.`nilai` AS `aspek_kemandirian`,`nd`.`id_keg` AS `id_keg` from (`tbl_nilai_k` `nk` join `tbl_nilai_d` `nd`) where (`nd`.`id_nilai` = `nk`.`id_nilai`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_siswa_master`
--
DROP TABLE IF EXISTS `v_siswa_master`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_siswa_master`  AS  select `ts`.`nim` AS `nim`,`ts`.`nama` AS `nama`,`ts`.`foto` AS `foto`,`tr`.`id_rombel` AS `id_rombel`,`tor`.`nama_wali` AS `wali` from ((`tbl_siswa` `ts` join `tbl_ortu` `tor`) join `tbl_rombel` `tr`) where ((`ts`.`id_rombel` = `tr`.`id_rombel`) and (`ts`.`id_ortu` = `tor`.`id_ortu`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_tbl_user`
--
DROP TABLE IF EXISTS `v_tbl_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_tbl_user`  AS  select `tu`.`id_user` AS `id_user`,`tu`.`nama_lengkap` AS `nama_lengkap`,`tu`.`username` AS `username`,`tu`.`password` AS `password`,`tu`.`id_level_user` AS `id_level_user`,`tu`.`foto` AS `foto`,`tlu`.`nama_level` AS `nama_level` from (`tbl_user` `tu` join `tbl_level_user` `tlu`) where (`tu`.`id_level_user` = `tlu`.`id_level_user`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_total_ibadah`
--
DROP TABLE IF EXISTS `v_total_ibadah`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_total_ibadah`  AS  select `v_nilai_d`.`id_nilai` AS `id_nilai`,sum(`v_nilai_d`.`nilai`) AS `total_ibadah` from `v_nilai_d` where (`v_nilai_d`.`nama_aspek` = 'Aspek Ibadah') group by `v_nilai_d`.`id_nilai` ;

-- --------------------------------------------------------

--
-- Structure for view `v_total_kemandirian`
--
DROP TABLE IF EXISTS `v_total_kemandirian`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_total_kemandirian`  AS  select `v_nilai_d`.`id_nilai` AS `id_nilai`,sum(`v_nilai_d`.`nilai`) AS `total_kemandirian` from `v_nilai_d` where (`v_nilai_d`.`nama_aspek` = 'Aspek Kemandirian') group by `v_nilai_d`.`id_nilai` ;

-- --------------------------------------------------------

--
-- Structure for view `v_total_nilai`
--
DROP TABLE IF EXISTS `v_total_nilai`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_total_nilai`  AS  select `v_nilai_d`.`id_nilai` AS `id_nilai`,sum(`v_nilai_d`.`nilai`) AS `total` from `v_nilai_d` group by `v_nilai_d`.`id_nilai` ;

-- --------------------------------------------------------

--
-- Structure for view `v_total_sosial`
--
DROP TABLE IF EXISTS `v_total_sosial`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_total_sosial`  AS  select `v_nilai_d`.`id_nilai` AS `id_nilai`,sum(`v_nilai_d`.`nilai`) AS `total_sosial` from `v_nilai_d` where (`v_nilai_d`.`nama_aspek` = 'Aspek Sosial') group by `v_nilai_d`.`id_nilai` ;

-- --------------------------------------------------------

--
-- Structure for view `v_walikelas`
--
DROP TABLE IF EXISTS `v_walikelas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_walikelas`  AS  select `g`.`nama_guru` AS `nama_guru`,`r`.`nama_rombel` AS `nama_rombel`,`w`.`id_walikelas` AS `id_walikelas`,`w`.`id_tahun_akademik` AS `id_tahun_akademik`,`j`.`nama_jurusan` AS `nama_jurusan`,`r`.`kelas` AS `kelas`,`ta`.`tahun_akademik` AS `tahun_akademik` from ((((`tbl_walikelas` `w` join `tbl_rombel` `r`) join `tbl_guru` `g`) join `tbl_jurusan` `j`) join `tbl_tahun_akademik` `ta`) where ((`w`.`id_guru` = `g`.`id_guru`) and (`w`.`id_rombel` = `r`.`id_rombel`) and (`j`.`kd_jurusan` = `r`.`kd_jurusan`) and (`ta`.`id_tahun_akademik` = `w`.`id_tahun_akademik`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tabel_menu`
--
ALTER TABLE `tabel_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_agama`
--
ALTER TABLE `tbl_agama`
  ADD PRIMARY KEY (`kd_agama`);

--
-- Indexes for table `tbl_aktifitas`
--
ALTER TABLE `tbl_aktifitas`
  ADD PRIMARY KEY (`id_aktifitas`);

--
-- Indexes for table `tbl_aspek`
--
ALTER TABLE `tbl_aspek`
  ADD PRIMARY KEY (`id_aspek`);

--
-- Indexes for table `tbl_biaya_sekolah`
--
ALTER TABLE `tbl_biaya_sekolah`
  ADD PRIMARY KEY (`id_biaya`);

--
-- Indexes for table `tbl_guru`
--
ALTER TABLE `tbl_guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indexes for table `tbl_history_kelas`
--
ALTER TABLE `tbl_history_kelas`
  ADD PRIMARY KEY (`id_history`);

--
-- Indexes for table `tbl_jadwal`
--
ALTER TABLE `tbl_jadwal`
  ADD PRIMARY KEY (`id_jadwal`);

--
-- Indexes for table `tbl_jenis_pembayaran`
--
ALTER TABLE `tbl_jenis_pembayaran`
  ADD PRIMARY KEY (`id_jenis_pembayaran`);

--
-- Indexes for table `tbl_jenjang_sekolah`
--
ALTER TABLE `tbl_jenjang_sekolah`
  ADD PRIMARY KEY (`id_jenjang`);

--
-- Indexes for table `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  ADD PRIMARY KEY (`kd_jurusan`);

--
-- Indexes for table `tbl_kegiatan`
--
ALTER TABLE `tbl_kegiatan`
  ADD PRIMARY KEY (`id_keg`);

--
-- Indexes for table `tbl_kurikulum`
--
ALTER TABLE `tbl_kurikulum`
  ADD PRIMARY KEY (`id_kurikulum`);

--
-- Indexes for table `tbl_kurikulum_detail`
--
ALTER TABLE `tbl_kurikulum_detail`
  ADD PRIMARY KEY (`id_kurikulum_detail`);

--
-- Indexes for table `tbl_level_user`
--
ALTER TABLE `tbl_level_user`
  ADD PRIMARY KEY (`id_level_user`);

--
-- Indexes for table `tbl_mapel`
--
ALTER TABLE `tbl_mapel`
  ADD PRIMARY KEY (`kd_mapel`);

--
-- Indexes for table `tbl_nilai`
--
ALTER TABLE `tbl_nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `tbl_nilai_aktif`
--
ALTER TABLE `tbl_nilai_aktif`
  ADD PRIMARY KEY (`id_nilai_aktif`);

--
-- Indexes for table `tbl_nilai_d`
--
ALTER TABLE `tbl_nilai_d`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_nilai_k`
--
ALTER TABLE `tbl_nilai_k`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `tbl_ortu`
--
ALTER TABLE `tbl_ortu`
  ADD PRIMARY KEY (`id_ortu`);

--
-- Indexes for table `tbl_phonebook`
--
ALTER TABLE `tbl_phonebook`
  ADD PRIMARY KEY (`id_phonebook`);

--
-- Indexes for table `tbl_rombel`
--
ALTER TABLE `tbl_rombel`
  ADD PRIMARY KEY (`id_rombel`);

--
-- Indexes for table `tbl_ruangan`
--
ALTER TABLE `tbl_ruangan`
  ADD PRIMARY KEY (`kd_ruangan`);

--
-- Indexes for table `tbl_sekolah_info`
--
ALTER TABLE `tbl_sekolah_info`
  ADD PRIMARY KEY (`id_sekolah`);

--
-- Indexes for table `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `tbl_sms_group`
--
ALTER TABLE `tbl_sms_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_tahun_akademik`
--
ALTER TABLE `tbl_tahun_akademik`
  ADD PRIMARY KEY (`id_tahun_akademik`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `tbl_user_rule`
--
ALTER TABLE `tbl_user_rule`
  ADD PRIMARY KEY (`id_rule`);

--
-- Indexes for table `tbl_walikelas`
--
ALTER TABLE `tbl_walikelas`
  ADD PRIMARY KEY (`id_walikelas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tabel_menu`
--
ALTER TABLE `tabel_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `tbl_biaya_sekolah`
--
ALTER TABLE `tbl_biaya_sekolah`
  MODIFY `id_biaya` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_guru`
--
ALTER TABLE `tbl_guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_history_kelas`
--
ALTER TABLE `tbl_history_kelas`
  MODIFY `id_history` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tbl_jadwal`
--
ALTER TABLE `tbl_jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `tbl_jenis_pembayaran`
--
ALTER TABLE `tbl_jenis_pembayaran`
  MODIFY `id_jenis_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_jenjang_sekolah`
--
ALTER TABLE `tbl_jenjang_sekolah`
  MODIFY `id_jenjang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_kurikulum`
--
ALTER TABLE `tbl_kurikulum`
  MODIFY `id_kurikulum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_kurikulum_detail`
--
ALTER TABLE `tbl_kurikulum_detail`
  MODIFY `id_kurikulum_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tbl_level_user`
--
ALTER TABLE `tbl_level_user`
  MODIFY `id_level_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_nilai`
--
ALTER TABLE `tbl_nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tbl_nilai_d`
--
ALTER TABLE `tbl_nilai_d`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;
--
-- AUTO_INCREMENT for table `tbl_nilai_k`
--
ALTER TABLE `tbl_nilai_k`
  MODIFY `id_nilai` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `tbl_phonebook`
--
ALTER TABLE `tbl_phonebook`
  MODIFY `id_phonebook` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_rombel`
--
ALTER TABLE `tbl_rombel`
  MODIFY `id_rombel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_sms_group`
--
ALTER TABLE `tbl_sms_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_tahun_akademik`
--
ALTER TABLE `tbl_tahun_akademik`
  MODIFY `id_tahun_akademik` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_user_rule`
--
ALTER TABLE `tbl_user_rule`
  MODIFY `id_rule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `tbl_walikelas`
--
ALTER TABLE `tbl_walikelas`
  MODIFY `id_walikelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
