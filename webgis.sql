-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 06, 2025 at 08:36 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webgis`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_gedung`
--

CREATE TABLE `tb_gedung` (
  `id` int NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `building_function` enum('Gedung Teori','Kantor','Ibadah','Olahraga','Kantin','Gedung Jurusan','Laboratorium','Bengkel','Perpustakaan','Parkiran','Ormawa') DEFAULT NULL,
  `department` enum('Institusi','Akuntansi','Bisnis','Elektro','Sipil','Mesin','Otomotif','Tambang') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `num_of_classes` int DEFAULT NULL,
  `num_of_floors` int DEFAULT NULL,
  `hours` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `photo` varchar(255) DEFAULT NULL,
  `description` text,
  `website` varchar(255) DEFAULT NULL,
  `location_coords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_gedung`
--

INSERT INTO `tb_gedung` (`id`, `code`, `name`, `building_function`, `department`, `num_of_classes`, `num_of_floors`, `hours`, `photo`, `description`, `website`, `location_coords`) VALUES
(1, 'A', 'Kantor Pusat Poliban', 'Kantor', 'Institusi', 17, 2, 'Senin-Jumat        07.00-18.00 Sabtu-Minggu      07.00-18.00', '../images/gedung_a.jpg', 'Merupakan gedung Utama di Politeknik Negeri Banjarmasin yang berisi ruang direktur dan sejenisnya serta juga ruang Multimedia yang digunakan untuk acara/rapat', 'poliban.ac.id', '[\r\n  [\r\n    [-3.2963436, 114.582046], \r\n    [-3.2964427, 114.5821562],\r\n    [-3.2964199, 114.5821761], \r\n    [-3.2965203, 114.5822914],\r\n    [-3.2965449, 114.5822699],\r\n    [-3.2966582, 114.582396],\r\n    [-3.2968051, 114.5822635],\r\n    [-3.2964905, 114.5819135],\r\n    [-3.2963436, 114.582046]\r\n  ]\r\n]'),
(2, 'B', 'Gedung Jurusan Teknik Sipil', 'Gedung Jurusan', 'Sipil', 4, 2, 'Senin-Jum\'at        07.00-17.00', '../images/gedung_b.jpg', 'Merupakan salah satu gedung jurusan untuk Teknik Sipil dan Kebumian yang berisi ruang dosen dan admin. Juga memiliki loket jurusan yang difungsikan untuk mahasiswa melakukan urusan administrasi perkuliahan. ', 'https://poliban.ac.id/sipil/', '[\r\n  [\r\n    [-3.2970066, 114.5814793], \r\n    [-3.2969912, 114.5814524],\r\n    [-3.2969035, 114.5815091], \r\n    [-3.2969259, 114.5815424],\r\n    [-3.296864, 114.5815799],\r\n    [-3.2969201, 114.5816783],\r\n    [-3.2971263, 114.5815454],\r\n    [-3.2970617, 114.5814428],\r\n    [-3.2970066, 114.5814793]\r\n  ]\r\n]'),
(3, 'C', 'Gedung Teori Teknik Mesin', 'Gedung Teori', 'Mesin', 13, 2, 'Senin-Jum\'at        07.00-17.00', '../images/gedung_c.jpg', 'Merupakan salah satu gedung pelaksanaan kegiatan belajar mengajar teori bagi mahasiswa Jurusan Teknik Mesin.', 'https://poliban.ac.id/mesin/', '[\r\n  [\r\n    [-3.2969956, 114.5819615],\r\n    [-3.2970161, 114.581985],\r\n    [-3.2969916, 114.5820071],\r\n    [-3.297091, 114.5821177],\r\n    [-3.2971138, 114.5820972],\r\n    [-3.2971357, 114.5821223],\r\n    [-3.2973208, 114.5819606],\r\n    [-3.2971808, 114.5817998],\r\n    [-3.2969956, 114.5819615]\r\n  ]\r\n]'),
(4, 'D', 'Gedung Jurusan Teknik Elektro', 'Gedung Jurusan', 'Elektro', 16, 2, 'Senin-Jum\'at        07.00-17.00', '../images/gedung_d.jpg', 'Merupakan salah satu gedung jurusan untuk Teknik Elektro yang berisi ruang dosen dan admin serta lab. Juga memiliki loket jurusan yang difungsikan untuk mahasiswa melakukan urusan administrasi perkuliahan.', 'https://poliban.ac.id/elektro/', '[\n  [\n    [-3.2968277, 114.5815203],\n    [-3.2967267, 114.5814792],\n    [-3.2968324, 114.5812339],\n    [-3.2969332, 114.5812722],\n    [-3.2968277, 114.5815203]\n  ]\n]'),
(5, 'E', 'Gedung Teori Administrasi Bisnis', 'Gedung Teori', 'Bisnis', 15, 2, 'Senin-Jum\'at        07.00-17.00', '../images/gedung_e.jpg', 'Merupakan salah satu gedung tempat kegiatan belajar mengajar teori bagi Mahasiswa Jurusan Administrasi Bisnis.', 'https://poliban.ac.id/administrasi-bisnis/', '[\r\n  [\r\n    [-3.2944484, 114.58251],\r\n    [-3.2942852, 114.5826299],\r\n    [-3.2944619, 114.5828713],\r\n    [-3.2946252, 114.5827514],\r\n    [-3.2944484, 114.58251]\r\n  ]\r\n]'),
(6, 'F', 'Gedung Jurusan Administrasi Bisnis', 'Gedung Jurusan', 'Bisnis', 7, 1, 'Senin-Jum\'at        07.00-17.00', '../images/gedung_f.jpg', 'Merupakan salah satu gedung jurusan untuk Administrasi Bisnis yang berisi ruang dosen dan admin. Juga memiliki loket jurusan yang difungsikan untuk mahasiswa melakukan urusan administrasi perkuliahan.', 'https://poliban.ac.id/administrasi-bisnis/', '[\r\n  [\r\n    [-3.294476, 114.582277],\r\n    [-3.294294, 114.582385],\r\n    [-3.294364, 114.582508],\r\n    [-3.294549, 114.5824],\r\n    [-3.294476, 114.582277]\r\n  ]\r\n]'),
(7, 'G', 'Gedung Teori Teknik Sipil', 'Gedung Teori', 'Sipil', 16, 2, 'Senin-Jum\'at        07.00-17.00', '../images/gedung_g.jpg', 'Merupakan salah satu gedung tempat kegiatan belajar mengajar teori bagi Mahasiswa Jurusan Sipil dan Kebumian.', 'https://poliban.ac.id/sipil/', '[\r\n  [\r\n    [-3.295986, 114.581727],\r\n    [-3.295844, 114.581856], \r\n    [-3.296018, 114.582059],\r\n    [-3.296162, 114.581936],\r\n    [-3.295986, 114.581727]\r\n  ]\r\n]'),
(8, 'H', 'Gedung Teori Teknik Elektro', 'Gedung Teori', 'Elektro', 15, 2, 'Senin-Jum\'at        07.00-17.00', '../images/gedung_h.jpg', 'Merupakan salah satu gedung pelaksanaan kegiatan belajar mengajar teori bagi mahasiswa Jurusan Teknik Elektro.', 'https://poliban.ac.id/elektro/', '[\r\n  [\r\n    [-3.2957451, 114.5814478],\r\n    [-3.2955297, 114.5816487],\r\n    [-3.2956743, 114.5818043],\r\n    [-3.2958897, 114.5816034],\r\n    [-3.2957451, 114.5814478]\r\n  ]\r\n]\r\n\r\n'),
(9, 'I', 'Bengkel Teknik Sipil', 'Bengkel', 'Sipil', 5, 1, 'Senin-Jum\'at        07.00-17.00', '../images/gedung_i.jpg', 'Merupakan salah satu gedung tempat kegiatan belajar mengajar bagi Mahasiswa Jurusan Sipil dan Kebumian. Sering disebut juga sebagai bengkel Teknik Sipil dikarenakan menjadi tempat untuk melakukan praktik.', 'https://poliban.ac.id/sipil/', '[\r\n  [\r\n    [-3.296007, 114.582408],\r\n    [-3.295831, 114.58255],\r\n    [-3.296114, 114.58288],\r\n    [-3.296285, 114.582735],\r\n    [-3.296007, 114.582408]\r\n  ]\r\n]'),
(10, 'J', 'Bengkel Teknik Mesin Produksi', 'Bengkel', 'Mesin', 3, 1, 'Senin-Jum\'at        07.00-17.00', '../images/gedung_j.jpg', 'Merupakan gedung workshop Prodi Teknik Mesin yang mendukung pelaksanaan kegiatan belajar mengajar bagi mahasiswa Jurusan Teknik Mesin.', 'https://poliban.ac.id/mesin/', '[\r\n  [\r\n    [-3.295467, 114.582333], \r\n    [-3.295282, 114.582494], \r\n    [-3.29571, 114.582971], \r\n    [-3.295892, 114.582818]\r\n  ]\r\n]'),
(11, 'K', 'Laboratorium Teknik Elektro', 'Laboratorium', 'Elektro', 12, 1, 'Senin-Jum\'at        07.00-17.00', '../images/gedung_k.jpg', 'Merupakan salah satu gedung laboratorium tempat kegiatan belajar mengajar dan praktek bagi Mahasiswa Jurusan Teknik Elektro', 'https://poliban.ac.id/elektro/', '[\r\n  [\r\n   [-3.2955148, 114.5820487],\r\n   [-3.2957224, 114.5822901],\r\n   [-3.2958859, 114.582149],\r\n   [-3.2956784, 114.5819076],\r\n   [-3.2955148, 114.5820487]\r\n  ]\r\n]'),
(12, 'L', 'Bengkel Teknik Elektro', 'Bengkel', 'Elektro', 7, 2, 'Senin-Jum\'at        07.00-17.00', '../images/gedung_l.jpg', 'Merupakan salah satu gedung tempat kegiatan belajar mengajar bagi Mahasiswa Jurusan Teknik Elektro. Sering disebut sebagai bengkel listrik dikarenakan lebih sering digunakan untuk melakukan praktik dan memiliki fasilitas peralatan penunjang kegiatan belajar mengajar.', 'https://poliban.ac.id/elektro/', '[\r\n  [\r\n   [-3.2954479, 114.581708],\r\n   [-3.2952353, 114.5819041],\r\n   [-3.2953906, 114.5820731],\r\n   [-3.2956032, 114.581877],\r\n   [-3.2954479, 114.581708]\r\n  ]\r\n]'),
(13, 'M', 'Bengkel Teknik Hidrolika Sipil', 'Bengkel', 'Sipil', 4, 1, 'Senin-Jum\'at        07.00-17.00', '../images/gedung_m.jpg', 'Merupakan salah satu gedung tempat kegiatan belajar mengajar bagi Mahasiswa Jurusan Sipil dan Kebumian.', 'https://poliban.ac.id/sipil/', '[\r\n  [\r\n   [-3.2951567, 114.5819669],\r\n   [-3.2949978, 114.5821051],\r\n   [-3.2951745, 114.5823089],\r\n   [-3.2953334, 114.5821707],\r\n   [-3.2951567, 114.5819669]\r\n  ]\r\n]'),
(14, 'N', 'Teknik Pertambangan', NULL, 'Tambang', 5, 1, 'Senin-Jum\'at        07.00-17.00', '../images/gedung_n.jpg', 'Merupakan salah satu gedung tempat kegiatan belajar mengajar bagi Mahasiswa Prodi Teknik Pertambangan sekaligus menjadi tempat uji LSP Teknik Pertambangan', NULL, '[\r\n  [\r\n    [-3.2949487, 114.582483],\r\n    [-3.2950028, 114.5825493],\r\n    [-3.2951241, 114.5824501],\r\n    [-3.2950701, 114.5823838],\r\n    [-3.2949487, 114.582483]\r\n  ]\r\n]\r\n'),
(15, 'O', 'Gedung Jurusan Teknik Otomotif', 'Gedung Jurusan', 'Mesin', 5, 2, 'Senin-Jum\'at        07.00-17.00', '../images/gedung_o.jpg', 'Merupakan gedung workshop Prodi Teknologi Rekayasa Otomotif yang mendukung pelaksanaan kegiatan belajar mengajar bagi mahasiswa Jurusan Teknik Mesin.', '', '[\r\n  [\r\n   [-3.295615, 114.5831645],\r\n   [-3.2956855, 114.583249],\r\n   [-3.2956219, 114.5833044],\r\n   [-3.2956524, 114.5833515],\r\n   [-3.2953828, 114.5835841],\r\n   [-3.2952404, 114.5834138],\r\n   [-3.2955058, 114.5831908],\r\n   [-3.2955431, 114.5832282],\r\n   [-3.295615, 114.5831645]\r\n  ]\r\n]'),
(16, 'P', 'Gedung Teori Teknik Alat Berat', 'Gedung Teori', 'Mesin', 4, 2, 'Senin-Jumat        07.00-17.00', '../images/gedung_p.jpg', 'Merupakan gedung workshop Prodi Alat Berat yang mendukung pelaksanaan kegiatan belajar mengajar bagi mahasiswa Jurusan Teknik Mesin.', 'https://poliban.ac.id/mesin/', '[\r\n  [\r\n    [-3.2946861, 114.5823363],\r\n    [-3.2945394, 114.5824538],\r\n    [-3.2947322, 114.5826952],\r\n    [-3.2948789, 114.5825777],\r\n    [-3.2946861, 114.5823363]\r\n  ]\r\n]\r\n'),
(17, 'Q', 'Gedung Serba Guna', NULL, 'Institusi', 4, 1, 'Senin-Jumat        07.00-18.00 Sabtu-Minggu      07.00-18.00', '../images/gedung_q.jpg', 'Merupakan gedung Serbaguna di Politeknik Negeri Banjarmasin yang biasa digunakan untuk mengadakan acara besar kampus maupun himpunan atau komunitas.', NULL, '[\r\n  [\r\n    [-3.2945627, 114.5831617],\r\n    [-3.2948084, 114.5834614],\r\n    [-3.2949804, 114.5833199],\r\n    [-3.2948875, 114.5832065],\r\n    [-3.2949418, 114.5831618],\r\n    [-3.2948767, 114.5830824],\r\n    [-3.2948224, 114.5831271],\r\n    [-3.2947347, 114.5830202],\r\n    [-3.2945627, 114.5831617]\r\n  ]\r\n]\r\n'),
(18, 'R', 'Gedung P3M', 'Kantor', 'Institusi', 2, 1, 'Senin-Jum\'at        07.00-17.00', '../images/gedung_r.jpg', 'Merupakan gedung yang dimanfaatkan untuk melaksanakan Penelitian dan Pengabdian Kepada Masyarakat sebagai bagian dari Tri Dharma Perguruan Tinggi.', 'https://poliban.ac.id/pusat-p3mp/', '[\r\n  [\r\n    [-3.2961361, 114.5817214],\r\n    [-3.2961977, 114.5817898],\r\n    [-3.2963112, 114.5816872],\r\n    [-3.2962496, 114.5816188],\r\n    [-3.2961361, 114.5817214]\r\n  ]\r\n]\r\n'),
(19, 'S', 'UPT PP, KOPERASI, LAB ALKS, GUDANG, KOMPUTER BISNIS', NULL, 'Akuntansi', 5, 1, 'Senin-Jum\'at        07.00-17.00', '../images/gedung_s.jpg', 'Merupakan salah satu gedung jurusan untuk Akuntansi yang berisi ruang dosen serta lab.', 'https://poliban.ac.id/akuntansi/', '[\r\n  [\r\n    [-3.296421, 114.581563],\r\n    [-3.296356, 114.58163],\r\n    [-3.296531, 114.581833],\r\n    [-3.296609, 114.581766],\r\n    [-3.296421, 114.581563]\r\n  ]\r\n]'),
(20, 'T', 'UPT Lab Bahasa', 'Kantor', 'Institusi', 7, 2, 'Senin-Jum\'at        07.00-17.00', '../images/gedung_t.jpg', 'Unit pelayanan terpadu yang menyediakan fasilitas laboratorium bahasa untuk mendukung pembelajaran bahasa bagi mahasiswa', 'https://poliban.ac.id/unit-bahasa/', '[\r\n  [\r\n    [-3.2972146, 114.5810765],\r\n    [-3.2971318, 114.5811473],\r\n    [-3.2972027, 114.5812305],\r\n    [-3.2971179, 114.581303],\r\n    [-3.2971695, 114.5813635],\r\n    [-3.2973371, 114.5812203],\r\n    [-3.2972146, 114.5810765]\r\n  ]\r\n]\r\n'),
(21, 'U', 'Gedung Jurusan Teknik Mesin', 'Gedung Jurusan', 'Mesin', 4, 2, 'Senin-Jum\'at        07.00-17.00', '../images/gedung_u.jpg', 'Merupakan salah satu gedung jurusan untuk Teknik Mesin yang berisi ruang dosen dan admin serta lab. Juga memiliki loket jurusan yang difungsikan untuk mahasiswa melakukan urusan administrasi perkuliahan.', 'https://poliban.ac.id/mesin/', '[\r\n  [\r\n    [-3.297113, 114.5809878],\r\n    [-3.2969762, 114.581189],\r\n    [-3.2970545, 114.581238],\r\n    [-3.2971926, 114.5810368],\r\n    [-3.297113, 114.5809878]\r\n  ]\r\n]\r\n'),
(22, 'V', 'Bengkel Otomotif Modifikasi', 'Bengkel', 'Mesin', 1, 2, 'Senin-Jum\'at        07.00-17.00', '../images/gedung_v.jpg', 'Merupakan gedung praktikum sekaligus teori dari jurusan Teknik Mesin.', 'https://poliban.ac.id/mesin/', '[\r\n  [\r\n    [-3.295009, 114.5835639],\r\n    [-3.2950901, 114.5836593],\r\n    [-3.2950288, 114.5837116],\r\n    [-3.2950834, 114.5837758],\r\n    [-3.2952965, 114.5835938],\r\n    [-3.2951608, 114.5834343],\r\n    [-3.295009, 114.5835639]\r\n  ]\r\n]\r\n'),
(23, 'W', 'Gedung Jurusan Akuntansi', 'Gedung Jurusan', 'Akuntansi', 11, 3, 'Senin-Jum\'at        07.00-17.00', '../images/gedung_w.jpg', 'Merupakan gedung Jurusan Akuntansi yang berisi ruang dosen serta lab.', 'https://poliban.ac.id/akuntansi/', '[\r\n  [\r\n    [-3.2944658, 114.5829197],\r\n    [-3.2945594, 114.5830532],\r\n    [-3.2947348, 114.5829298],\r\n    [-3.2946412, 114.5827963],\r\n    [-3.2944658, 114.5829197]\r\n  ]\r\n]\r\n'),
(24, 'X', 'UPT TIK', NULL, 'Institusi', 14, 3, 'Senin-Jum\'at        07.00-17.00', '../images/gedung_x.jpg', 'Merupakan gedung Unit Penunjang Akademik Teknologi Informasi dan Komunikasi di Politeknik Negeri Banjarmasin yang memiliki lab-lab.', 'https://poliban.ac.id/upt-tik/', '[\r\n  [\r\n    [-3.2953832, 114.5821849],\r\n    [-3.2956121, 114.5824444],\r\n    [-3.2957332, 114.5823351],\r\n    [-3.2955042, 114.5820757],\r\n    [-3.2953832, 114.5821849]\r\n  ]\r\n]\r\n'),
(25, 'Y', 'Perpustakaan', NULL, 'Institusi', NULL, 2, 'Senin-Jum\'at        08.30-15.30', '../images/gedung_y.jpg', 'Merupakan gedung Perpustakaan di Politeknik Negeri Banjarmasin yang biasa digunakan untuk mencari referensi buku ataupun laporan TA.', 'http://perpustakaan.poliban.ac.id/', '[\r\n  [\r\n    [-3.2963061, 114.5817514],\r\n    [-3.296285, 114.5817296],\r\n    [-3.2962087, 114.5818036],\r\n    [-3.296222, 114.5818174],\r\n    [-3.2961891, 114.5818493],\r\n    [-3.2962437, 114.5819058],\r\n    [-3.2962758, 114.5818747],\r\n    [-3.296308, 114.581908],\r\n    [-3.2963844, 114.581834],\r\n    [-3.2963555, 114.581804],\r\n    [-3.2963776, 114.5817826],\r\n    [-3.2963274, 114.5817308],\r\n    [-3.2963061, 114.5817514]\r\n  ]\r\n]\r\n'),
(26, 'Z', 'Gedung UKM', 'Ormawa', NULL, 8, 1, 'Senin-Jum\'at        07.00-18.00\r\nSabtu-Minggu      07.00-18.00', '../images/gedung_z.jpg', 'Merupakan sebuah sekretariat UKM Poliban yang digunakan untuk melakukan kegiatan yang berhubungan seperti rapat dan lainnya.', NULL, '[\r\n  [\r\n    [-3.2950122, 114.583598],\r\n    [-3.294865, 114.5837358],\r\n    [-3.2950355, 114.583941],\r\n    [-3.2950744, 114.583908],\r\n    [-3.2949531, 114.5837613],\r\n    [-3.2950639, 114.5836594],\r\n    [-3.2950122, 114.583598]\r\n  ]\r\n]\r\n'),
(27, '', 'Gedung Baru Administrasi Bisnis', NULL, 'Bisnis', 8, 2, 'Senin-Jum\'at        07.00-17.00', '../images/gedungbaru.jpg', 'Merupakan salah satu gedung tempat kegiatan belajar mengajar teori sekaligus praktik bagi Mahasiswa Jurusan Administrasi Bisnis.', 'https://poliban.ac.id/administrasi-bisnis/', '[\r\n  [\r\n    [-3.2944821, 114.5822199],\r\n    [-3.294583, 114.5823482],\r\n    [-3.2946767, 114.5822784],\r\n    [-3.2945785, 114.5821501],\r\n    [-3.2944821, 114.5822199]\r\n  ]\r\n]\r\n'),
(28, '', 'Parkiran Dosen Mesin', 'Parkiran', 'Mesin', NULL, NULL, 'Senin-Jumat        07.00-18.00 Sabtu-Minggu      07.00-18.00', '../images/parkiran_dosenmesin.jpg', 'Area parkir khusus yang disediakan bagi dosen dan staf kampus Politeknik Negeri Banjarmasin.', 'https://poliban.ac.id/mesin/', '[\r\n  [\r\n    [-3.296973, 114.58119],\r\n    [-3.296932, 114.581273],\r\n    [-3.296994, 114.581321],\r\n    [-3.297056, 114.581235],\r\n    [-3.296973, 114.58119]\r\n  ]\r\n]\r\n'),
(29, '', 'Parkiran Elektro', 'Parkiran', 'Elektro', NULL, NULL, 'Senin-Jumat        07.00-18.00 Sabtu-Minggu      07.00-18.00', '../images/parkiran_elektro.jpg', 'Area parkir yang disediakan bagi mahasiswa jurusan teknik', 'https://poliban.ac.id/elektro/', '[\r\n  [\r\n    [-3.297651, 114.581724],\r\n    [-3.296717, 114.582547],\r\n    [-3.296799, 114.582644],\r\n    [-3.297738, 114.581821],\r\n    [-3.297651, 114.581724]\r\n  ]\r\n]\r\n\r\n'),
(30, '', 'Parkiran Dosen Elektro', 'Parkiran', 'Elektro', NULL, NULL, 'Senin-Jumat        07.00-18.00 Sabtu-Minggu      07.00-18.00', '../images/parkiran_dosenelektro.jpg', 'Area parkir khusus yang disediakan bagi dosen dan staf kampus Politeknik Negeri Banjarmasin.', 'https://poliban.ac.id/elektro/', '[\r\n  [\r\n    [-3.2970211, 114.5813875],\r\n    [-3.2970617, 114.5814428],\r\n    [-3.2971527, 114.5813757],\r\n    [-3.2971121, 114.5813204],\r\n    [-3.2970211, 114.5813875]\r\n  ]\r\n]\r\n\r\n'),
(31, NULL, 'Parkiran GSG depan', 'Parkiran', NULL, NULL, NULL, 'Senin-Jumat        07.00-18.00 Sabtu-Minggu      07.00-18.00', '../images/parkiran_gsgd.jpg', 'Area parkir yang terleletak di depan Gedung Serba Guna, biasa digunakan sebagai tempat parkir saat ada kegiatan berlangsung', NULL, '[\r\n  [\r\n    [-3.295354, 114.582847],\r\n    [-3.294962, 114.583195],\r\n    [-3.295085, 114.583335],\r\n    [-3.295474, 114.582987],\r\n    [-3.295354, 114.582847]\r\n  ]\r\n]\r\n'),
(32, NULL, 'Parkiran GSG belakang', 'Parkiran', NULL, NULL, NULL, 'Senin-Jumat        07.00-18.00 Sabtu-Minggu      07.00-18.00', '../images/parkiran_gsgb.jpg', 'Area parkir yang terleletak di belakang Gedung Serba Guna, biasa digunakan sebagai tempat parkir saat ada kegiatan berlangsung', NULL, '[\r\n  [\r\n    [-3.294533, 114.583226],\r\n    [-3.294488, 114.583263],\r\n    [-3.294734, 114.583561],\r\n    [-3.294785, 114.583515],\r\n    [-3.294533, 114.583226]\r\n  ]\r\n]\r\n'),
(33, NULL, 'Parkiran GSG samping', 'Parkiran', NULL, NULL, NULL, 'Senin-Jumat        07.00-18.00 Sabtu-Minggu      07.00-18.00', '../images/parkiran_gsgs.jpg', 'Area parkir yang terleletak di samping Gedung Serba Guna, biasa digunakan sebagai tempat parkir saat ada kegiatan berlangsung', NULL, '[\r\n  [\r\n    [-3.294997, 114.583389],\r\n    [-3.29479, 114.583563],\r\n    [-3.294833, 114.583617],\r\n    [-3.295039, 114.58344],\r\n    [-3.294997, 114.583389]\r\n  ]\r\n]\r\n'),
(34, NULL, 'Parkiran Bisnis', 'Parkiran', 'Bisnis', NULL, NULL, 'Senin-Jumat        07.00-18.00 Sabtu-Minggu      07.00-18.00', '../images/parkiran_akuntansi.jpg', 'Area parkir yang disediakan bagi mahasiswa jurusan Administrasi Bisnis dan Akuntansi', NULL, '[\r\n  [\r\n    [-3.2962373, 114.5829485],\r\n    [-3.2963272, 114.5830477],\r\n    [-3.2958294, 114.5834725],\r\n    [-3.2957395, 114.583364],\r\n    [-3.2962373, 114.5829485]\r\n  ]\r\n]\r\n'),
(35, NULL, 'Parkiran UKM', 'Ormawa', NULL, NULL, NULL, 'Senin-Jumat        07.00-18.00 Sabtu-Minggu      07.00-18.00', '../images/parkiran_gedungz.jpg', 'Area parkir khusus yang disediakan bagi Mahasiswa/i UKM Politeknik Negeri Banjarmasin.', NULL, '[\r\n  [\r\n    [-3.2949834, 114.5837622],\r\n    [-3.2950945, 114.583892],\r\n    [-3.2953467, 114.5836779],\r\n    [-3.2953202, 114.5836461],\r\n    [-3.2951041, 114.5838299],\r\n    [-3.2950174, 114.5837318],\r\n    [-3.2949834, 114.5837622]\r\n  ]\r\n]\r\n'),
(36, NULL, 'Parkiran 1 Gedung Pusat', 'Parkiran', NULL, NULL, NULL, 'Senin-Jumat        07.00-18.00 Sabtu-Minggu      07.00-18.00', '../images/parkiran_akademik1.jpg', 'Area parkir khusus yang disediakan bagi staf kampus Politeknik Negeri Banjarmasin.', NULL, '[\r\n  [\r\n    [-3.2967836, 114.5820099],\r\n    [-3.2968711, 114.5821134],\r\n    [-3.2969003, 114.5820886],\r\n    [-3.2968127, 114.5819852],\r\n    [-3.2967836, 114.5820099]\r\n  ]\r\n]\r\n'),
(37, NULL, 'Parkiran 2 Gedung Pusat', 'Parkiran', NULL, NULL, NULL, 'Senin-Jumat        07.00-18.00 Sabtu-Minggu      07.00-18.00', '../images/parkiran_akademik1.jpg', 'Area parkir khusus yang disediakan bagi staf kampus Politeknik Negeri Banjarmasin.', NULL, '[\r\n  [\r\n    [-3.296751, 114.582038],\r\n    [-3.296718, 114.582067],\r\n    [-3.296809, 114.582172],\r\n    [-3.296847, 114.582139],\r\n    [-3.296751, 114.582038]\r\n  ]\r\n]\r\n'),
(38, NULL, 'Teaching Factory', NULL, 'Institusi', 3, 1, 'Senin-Jum\'at        Tutup Sabtu-Minggu      Tutup', '../images/teaching_factory.jpg', 'Merupakan pengembangan dari unit produksi di sekolah vokasi, yang dirancang untuk mempersiapkan lulusan agar menjadi pekerja dan wirausaha.', NULL, '[\r\n  [\r\n    [-3.2968062, 114.5817985],\r\n    [-3.2968738, 114.5818709],\r\n    [-3.2969049, 114.5818418],\r\n    [-3.2968373, 114.5817694],\r\n    [-3.2968062, 114.5817985]\r\n  ]\r\n]\r\n'),
(39, NULL, 'ETU', 'Kantin', NULL, NULL, 1, 'Senin-Jum\'at        08.30-15.30', '../images/etu.jpg', 'ETU adalah tempat berkumpulnya mahasiswa untuk menikmati makanan, minuman, dan bersosialisasi selama jam istirahat.', 'https://poliban.ac.id/etu-poliban/', '[\r\n  [\r\n    [-3.2965361, 114.5818341],\r\n    [-3.2965743, 114.5818798],\r\n    [-3.2966522, 114.5818171],\r\n    [-3.2966075, 114.5817687],\r\n    [-3.2965361, 114.5818341]\r\n  ]\r\n]\r\n'),
(40, NULL, 'Kantin', 'Kantin', NULL, NULL, 1, 'Senin-Jum\'at        07.00-16.00', '../images/kantin.jpg', 'Kantin kampus adalah tempat berkumpulnya mahasiswa untuk menikmati makanan, minuman, dan bersosialisasi selama jam istirahat', NULL, '[\r\n  [\r\n    [-3.294917, 114.5823028],\r\n    [-3.2948806, 114.5823326],\r\n    [-3.2949733, 114.5824463],\r\n    [-3.2950097, 114.5824165],\r\n    [-3.294917, 114.5823028]\r\n  ]\r\n]\r\n'),
(41, NULL, 'Musholla', 'Ibadah', NULL, 2, 2, 'Senin-Jumat        07.00-18.00 Sabtu-Minggu      07.00-18.00', '../images/musholla.jpg', 'Tempat ibadah yang disediakan bagi mahasiswa dan staf kampus untuk melaksanakan shalat dan kegiatan keagamaan lainnya.', NULL, '[\r\n  [\r\n    [-3.2962626, 114.5814271],\r\n    [-3.29633, 114.5815861],\r\n    [-3.2964303, 114.5815434],\r\n    [-3.2963628, 114.5813844],\r\n    [-3.2962626, 114.5814271]\r\n  ]\r\n]\r\n'),
(42, NULL, 'LSP', 'Kantor', 'Institusi', 4, 1, 'Senin-Jum\'at        09.00-15.00', '../images/lsp.jpg', 'Lembaga Sertifikasi Profesi (LSP) merupakan gedung tempat dilakukannya uji kompetensi untuk membantu mahasiswa memperoleh sertifikasi keahlian di Politeknik Negeri Banjarmasin.', 'https://lsp.poliban.ac.id/', '[\r\n  [\r\n    [-3.2959031, 114.5822684],\r\n    [-3.2959758, 114.5823522],\r\n    [-3.2958941, 114.5824233],\r\n    [-3.2958214, 114.5823394],\r\n    [-3.2959031, 114.5822684]\r\n  ]\r\n]\r\n'),
(43, NULL, 'Gedung Olahraga', 'Olahraga', NULL, NULL, 1, 'Senin-Jum\'at        Tutup\r\nSabtu-Minggu      Tutup', '../images/gedung_or.jpg', 'Tempat sarana olahraga yang disediakan bagi mahasiswa dan staf kampus untuk melaksanakan kegiatan olahraga.', NULL, '[\r\n  [\r\n    [-3.2973571, 114.581645],\r\n    [-3.297207, 114.5817717],\r\n    [-3.2973503, 114.581942],\r\n    [-3.2975004, 114.5818153],\r\n    [-3.2973571, 114.581645]\r\n  ]\r\n]\r\n'),
(44, NULL, 'Lapangan Basket', 'Olahraga', NULL, NULL, 1, 'Senin-Jumat        07.00-18.00 Sabtu-Minggu      07.00-18.00', '../images/lapangan_basket.jpg', 'Ruang terbuka yang digunakan untuk bermain basket, selain itu bisa digunakan untuk melaksanakan beberapa kegiatan', NULL, '[\r\n  [\r\n    [-3.296314, 114.582252],\r\n    [-3.296198, 114.582351],\r\n    [-3.296365, 114.582549],\r\n    [-3.29648, 114.58245],\r\n    [-3.296314, 114.582252]\r\n  ]\r\n]\r\n'),
(45, NULL, 'Pos Satpam', NULL, 'Institusi', 1, 1, 'Senin-Minggu        24 jam', '../images/pos_satpam.jpg', 'Tempat petugas keamanan kampus yang siap membantu menjaga keamanan dan memberikan informasi bagi pengunjung di Politeknik Negeri Banjarmasin.', 'poliban.ac.id', '[\r\n  [\r\n    [-3.2964457, 114.5826155],\r\n    [-3.2964679, 114.5826409],\r\n    [-3.2964403, 114.582665],\r\n    [-3.2964168, 114.5826402],\r\n    [-3.2964457, 114.5826155]\r\n  ]\r\n]\r\n'),
(46, NULL, 'Gudang 2', NULL, 'Sipil', 3, 1, 'Tutup', '../images/gudang2.jpg', 'Merupakan tempat untuk menyimpan peralatan-peralatan praktikum.', 'https://poliban.ac.id/sipil/', '[\r\n  [\r\n    [-3.2952337, 114.5823477],\r\n    [-3.2952805, 114.5824065],\r\n    [-3.295413, 114.5823005],\r\n    [-3.2953662, 114.5822418],\r\n    [-3.2952337, 114.5823477]\r\n  ]\r\n]\r\n'),
(47, NULL, 'Ruang Genset', NULL, 'Institusi', 2, 1, 'Tutup', '../images/ruang_genset.jpg', 'Merupakan ruangan yang menghasilkan daya listrik alternatif ketika pasokan listrik dari pembangkit listrik umum mati atau saat diperlukan tambahan pasokan listrik di wilayah tertentu.', NULL, '[\r\n  [\r\n    [-3.2958121, 114.5830578],\r\n    [-3.2958844, 114.583141],\r\n    [-3.2959322, 114.5830992],\r\n    [-3.2958599, 114.5830161],\r\n    [-3.2958121, 114.5830578]\r\n  ]\r\n]\r\n'),
(48, NULL, 'Sekretariat Pramuka', 'Ormawa', NULL, 1, 1, 'Senin-Jumat        07.00-18.00 Sabtu-Minggu      07.00-18.00', '../images/sekre_pramuka.jpg', 'Merupakan sebuah sekretariat untuk Racana Pramuka Poliban yang digunakan untuk melakukan kegiatan yang berhubungan dengan Racana Pramuka seperti rapat dan lainnya.', 'https://linktr.ee/racana_poliban', '[\r\n  [\r\n    [-3.2972629, 114.5816542],\r\n    [-3.297216, 114.5816947],\r\n    [-3.297245, 114.5817249],\r\n    [-3.2972994, 114.5816812],\r\n    [-3.2972629, 114.5816542]\r\n  ]\r\n]'),
(49, NULL, 'Sekretariat LPM', 'Ormawa', NULL, 1, 1, 'Senin-Jumat        07.00-18.00 Sabtu-Minggu      07.00-18.00', '../images/sekre_lpm.jpg', 'Merupakan sebuah sekretariat untuk LPM Lensa Poliban yang digunakan untuk melakukan kegiatan yang berhubungan dengan LPM Lensa seperti rapat dan lainnya.', 'https://www.lpmlensa.info/', '[\r\n  [\r\n    [-3.296426, 114.581906],\r\n    [-3.296383, 114.581949],\r\n    [-3.296408, 114.581978],\r\n    [-3.296456, 114.581938],\r\n    [-3.296426, 114.581906]\r\n  ]\r\n]'),
(50, NULL, 'Sekretariat KSR', 'Ormawa', NULL, 2, 1, 'Senin-Jumat        07.00-18.00 Sabtu-Minggu      07.00-18.00', '../images/sekre_ksr.jpg', 'Merupakan sebuah sekretariat untuk KSR PMI Unit Poliban yang digunakan untuk melakukan kegiatan yang berhubungan dengan KSR PMI seperti rapat dan lainnya.', 'https://linktr.ee/ksrpoliban_', '[\r\n  [\r\n    [-3.2969192, 114.5818527],\r\n    [-3.2969947, 114.5819375],\r\n    [-3.2969655, 114.5819656],\r\n    [-3.2968899, 114.581882],\r\n    [-3.2969192, 114.5818527]\r\n  ]\r\n]'),
(51, NULL, 'Sekretariat HME', 'Ormawa', 'Elektro', 1, 1, 'Senin-Jumat        07.00-18.00 Sabtu-Minggu      07.00-18.00', '../images/sekre_hme.jpg', 'Merupakan sebuah sekretariat untuk Himpunan Mahasiswa jurusan Teknik Elektro yang digunakan oleh HMJ-E untuk melakukan kegiatan yang berhubungan dengan jurusan Teknik Elektro seperti rapat, pertemuan antar HMJ/UKM dan lainnya.', 'https://hmepoliban.com/', '[\r\n  [\r\n    [-3.2958467, 114.5824045],\r\n    [-3.2958784, 114.5824393],\r\n    [-3.2958447, 114.5824701],\r\n    [-3.295813, 114.5824353],\r\n    [-3.2958467, 114.5824045]\r\n  ]\r\n]'),
(52, NULL, 'Sekretariat HMM', 'Ormawa', 'Mesin', 1, 1, 'Senin-Jumat        07.00-18.00 Sabtu-Minggu      07.00-18.00', '../images/sekre_hmm.jpg', 'Merupakan sebuah sekretariat untuk Himpunan Mahasiswa jurusan Teknik Mesin yang digunakan oleh HMJ-M untuk melakukan kegiatan yang berhubungan dengan jurusan Teknik Mesin seperti rapat, pertemuan antar HMJ/UKM dan lainnya.', 'https://taplink.cc/hmmpoliban', '[\r\n  [\r\n    [-3.2957639, 114.582959],\r\n    [-3.2957933, 114.5829946],\r\n    [-3.2958429, 114.5829485],\r\n    [-3.295813, 114.5829143],\r\n    [-3.2957639, 114.582959]\r\n  ]\r\n]'),
(53, NULL, 'Sekretariat HMB', 'Ormawa', 'Bisnis', 1, 1, 'Senin-Jumat        07.00-18.00 Sabtu-Minggu      07.00-18.00', '../images/sekre_hmb.jpg', 'Merupakan sebuah sekretariat untuk Himpunan Mahasiswa jurusan Teknik Mesin yang digunakan oleh HMJ-M untuk melakukan kegiatan yang berhubungan dengan jurusan Teknik Mesin seperti rapat, pertemuan antar HMB/UKM dan lainnya.', 'https://linktr.ee/hmb.poliban', '[\r\n  [\r\n    [-3.2941452, 114.5824848],\r\n    [-3.294187, 114.5825499],\r\n    [-3.2942568, 114.5825048],\r\n    [-3.294215, 114.5824398],\r\n    [-3.2941452, 114.5824848]\r\n  ]\r\n]'),
(54, NULL, 'Gudang 1', NULL, 'Elektro', 2, 1, 'Tutup', '../images/gudang1.jpg', 'Merupakan tempat untuk menyimpan peralatan-peralatan praktikum.', 'https://poliban.ac.id/elektro/', '[\r\n  [\r\n    [-3.295613, 114.581762],\r\n    [-3.295575, 114.581799],\r\n    [-3.295618, 114.581853],\r\n    [-3.295662, 114.581821],\r\n    [-3.295613, 114.581762]\r\n  ]\r\n]');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kontak`
--

CREATE TABLE `tb_kontak` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_kontak`
--

INSERT INTO `tb_kontak` (`id`, `name`, `email`, `message`, `created_at`) VALUES
(10, NULL, NULL, 'c', '2025-01-02 15:08:23'),
(11, NULL, NULL, 'a', '2025-01-02 15:09:48'),
(12, NULL, NULL, 'tess', '2025-01-06 07:31:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_gedung`
--
ALTER TABLE `tb_gedung`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_kontak`
--
ALTER TABLE `tb_kontak`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_gedung`
--
ALTER TABLE `tb_gedung`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `tb_kontak`
--
ALTER TABLE `tb_kontak`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
