-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 25 Nis 2020, 03:20:15
-- Sunucu sürümü: 10.4.11-MariaDB
-- PHP Sürümü: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `deneme`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `admin`
--

INSERT INTO `admin` (`id`, `login`, `password`) VALUES
(1, 'w', 'w');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `course_level` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `exam`
--

CREATE TABLE `exam` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `student_id` int(11) NOT NULL,
  `result` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `exam`
--

INSERT INTO `exam` (`id`, `date`, `student_id`, `result`) VALUES
(1, '2020-04-02', 111, 60);

--
-- Tetikleyiciler `exam`
--
DELIMITER $$
CREATE TRIGGER `examtrigger` AFTER INSERT ON `exam` FOR EACH ROW BEGIN
DECLARE temp VARCHAR(2);
DELETE FROM student_level WHERE id = NEW.student_id;
IF NEW.result > 0 AND NEW.result <26 THEN SET temp := 'A1';
ELSEIF NEW.result>25 AND NEW.result <46 THEN SET temp := 'A2';
ELSEIF NEW.result > 45 AND NEW.result <66 THEN SET temp := 'B1';
ELSEIF NEW.result > 65 AND NEW.result <76 THEN SET temp := 'A2';
ELSEIF NEW.result > 75 AND NEW.result <86 THEN SET temp := 'C1';
ELSEIF NEW.result > 85 AND NEW.result <101 THEN SET temp := 'C2';
END IF;
INSERT INTO student_level(id,level,last_result) VALUES (NEW.student_id,temp,NEW.result);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` bigint(11) NOT NULL,
  `tc` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `student`
--

INSERT INTO `student` (`id`, `name`, `surname`, `email`, `phone`, `tc`) VALUES
(111, 'alperen', 'karaman', 'eakaraman1@gmail.ocm', 5330901109, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `student_account`
--

CREATE TABLE `student_account` (
  `id` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `student_account`
--

INSERT INTO `student_account` (`id`, `login`, `password`) VALUES
(111, 'a', 'a');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `student_level`
--

CREATE TABLE `student_level` (
  `id` int(11) NOT NULL,
  `level` varchar(2) NOT NULL,
  `last_result` int(11) NOT NULL DEFAULT -1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `student_level`
--

INSERT INTO `student_level` (`id`, `level`, `last_result`) VALUES
(111, 'B1', 60);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `teacher`
--

CREATE TABLE `teacher` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `tc` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `teacher`
--

INSERT INTO `teacher` (`id`, `name`, `surname`, `email`, `phone`, `tc`) VALUES
(1, 'Enes Alperen', 'Karaman', 'eakaraman1@gmail.com', '5330901109', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `teacher_account`
--

CREATE TABLE `teacher_account` (
  `id` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `teacher_account`
--

INSERT INTO `teacher_account` (`id`, `login`, `password`) VALUES
(1, 'eakaraman', 'doc');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `course_id` (`course_level`);

--
-- Tablo için indeksler `exam`
--
ALTER TABLE `exam`
  ADD KEY `student_id` (`student_id`),
  ADD KEY `id` (`id`) USING BTREE;

--
-- Tablo için indeksler `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `student_account`
--
ALTER TABLE `student_account`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `student_level`
--
ALTER TABLE `student_level`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Tablo için indeksler `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `teacher_account`
--
ALTER TABLE `teacher_account`
  ADD UNIQUE KEY `id` (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- Tablo için AUTO_INCREMENT değeri `student_account`
--
ALTER TABLE `student_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- Tablo için AUTO_INCREMENT değeri `student_level`
--
ALTER TABLE `student_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- Tablo için AUTO_INCREMENT değeri `teacher`
--
ALTER TABLE `teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `teacher_account`
--
ALTER TABLE `teacher_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `student_account`
--
ALTER TABLE `student_account`
  ADD CONSTRAINT `student_account_ibfk_1` FOREIGN KEY (`id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `student_level`
--
ALTER TABLE `student_level`
  ADD CONSTRAINT `student_level_ibfk_1` FOREIGN KEY (`id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `teacher_account`
--
ALTER TABLE `teacher_account`
  ADD CONSTRAINT `teacher_account_ibfk_1` FOREIGN KEY (`id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
